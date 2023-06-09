#include <ros/ros.h>
#include <iostream>
#include <string.h>
#include <string>
#include <stdlib.h>
#include <unistd.h>
#include <math.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h> 
#include <stdbool.h>
#include <locale>

#include <std_msgs/Float32.h>
#include <std_msgs/String.h>
#include <moveit/move_group_interface/move_group_interface.h>
#include "yolo_execute.h"

#include<locale>

int yolo_sequence=1;  //夹取顺序
int sequence[4]={0};  //夹取顺序排序数组
int yolo_confirmed_flag =0; //启动夹取的标志位
int grasp_mode=0;//抓取模式 0：单目标抓取  1：单目标刷子  2：多目标抓取

float auxiliary_angle; 
int recycle_count_cb=0,harm_count_cb=0,kitchen_count_cb=0,others_count_cb=0; //接收到该数据帧的回调函数次数callback
int recycle_count=0,harm_count=0,kitchen_count=0,others_count=0; //垃圾计数
int count=0;//识别到的垃圾总数量
int recycle_ready=0,harm_ready=0,kitchen_ready=0,others_ready=0; //色块位置确认标志位
int kitchen_done=0,recycle_done=0,harm_done=0,others_done=0;  //色块是否已经夹取标志位
float recycle_target_data[3]={0},harm_target_data[3]={0},kitchen_target_data[3]={0},others_target_data[3]={0};//色块的目标位置对应的关节运动弧度数组
float joint_target1=0,joint_target2=0,joint_target3=0; //赋值给moveit做正解的目标关节值
float link_a,link_b,link_c,link_h; //机械参数
float base_angle;
std::string arm_state="none",target_color="noon";  //机械臂状态，夹取目标色块的颜色

bool arm_success,hand_close_success,hand_open_success; //moveit正解计算（返回值）是否成功的标志位

std::vector<double> joint_group_positions(5); //机械臂正解的目标关节位置的数组


//目标色块对应逆解的目标关节角度回调函数
void color_ik_result_callback(const yolo_new::color_ik_result_new &msg)
{
   //count=msg.count;//总数量
   //if(count == 1) grasp_mode = 0;
   //else grasp_mode = 0;//后续修改!!!!!
  ROS_INFO("msg sort is :%s ",msg.color);
   if(msg.color=="recycle") 
  {
     if(recycle_ready== 0 )  
       {
         recycle_count_cb++;
         recycle_target_data[0]=msg.pedestal_angle;  //云台的目标角度
         recycle_target_data[1]=msg.arm_angle;       //控制机械臂臂长的目标角度
         recycle_target_data[2]=msg.hand_angle;      //控制夹取色块旋转的目标角度
         if(recycle_count_cb>10)
         {
           recycle_ready=2;
           ROS_INFO("recycle_target_is  :(%4.2f)-(%4.2f)-(%4.2f)",recycle_target_data[0],recycle_target_data[1],recycle_target_data[2]);
         }

       }
  } 
    
  else if(msg.color=="harm") 
  {
     if(harm_ready== 0 )  
       {
         harm_count_cb++;
         harm_target_data[0]=msg.pedestal_angle;  //云台的目标角度
         harm_target_data[1]=msg.arm_angle;       //控制机械臂臂长的目标角度
         harm_target_data[2]=msg.hand_angle;      //控制夹取色块旋转的目标角度
         if(recycle_count_cb>10)
         {
           harm_ready=2;
           ROS_INFO("harm_target_is :(%4.2f)-(%4.2f)-(%4.2f)",harm_target_data[0],harm_target_data[1],harm_target_data[2]); 
         }
       }
  } 

  else if(msg.color=="kitchen") 
  {
     if(kitchen_ready== 0 )  
       {
         kitchen_count_cb++;
         kitchen_target_data[0]=msg.pedestal_angle;  //云台的目标角度
         kitchen_target_data[1]=msg.arm_angle;       //控制机械臂臂长的目标角度
         kitchen_target_data[2]=msg.hand_angle;      //控制夹取色块旋转的目标角度
         if(kitchen_count_cb>10)
         {
           kitchen_ready=2;
           ROS_INFO("kitchen_target_is:(%4.2f)-(%4.2f)-(%4.2f)",kitchen_target_data[0],kitchen_target_data[1],kitchen_target_data[2]);
         }
       }
  } 
  else if(msg.color=="others")
  {
    if(others_ready== 0 )  
       {
         others_count_cb++;
         others_target_data[0]=msg.pedestal_angle;  //云台的目标角度
         others_target_data[1]=msg.arm_angle;       //控制机械臂臂长的目标角度
         others_target_data[2]=msg.hand_angle;      //控制夹取色块旋转的目标角度
         if(others_count_cb>10)
         {
           others_ready=2;
           ROS_INFO("others_target_is:(%4.2f)-(%4.2f)-(%4.2f)",kitchen_target_data[0],kitchen_target_data[1],kitchen_target_data[2]);
         }
       }
  }
}


int main(int argc, char **argv)
{ 
    ros::init(argc, argv, "yolo_execute");
    ros::NodeHandle n;
    ros::NodeHandle nprivate("~");
    setlocale(LC_CTYPE, "zh_CN.utf8");//chinese

    std::locale::global(std::locale(""));
    nprivate.param<float>("/auxiliary_angle", auxiliary_angle, 0.157);
    nprivate.param<float>("/link_a", link_a, 0.105);
    nprivate.param<float>("/link_b", link_b, 0.100);
    nprivate.param<float>("/link_c", link_c, 0.175);
    nprivate.param<float>("/link_h", link_h, 0.105);

    base_angle=acos((link_c-link_h)/link_a);  //计算机械臂夹爪可触底的关节基础角度

    ros::AsyncSpinner spinner(1);
    spinner.start();
   
    moveit::planning_interface::MoveGroupInterface arm("arm");  
    moveit::planning_interface::MoveGroupInterface hand("hand"); 
    moveit::planning_interface::MoveGroupInterface::Plan my_plan; 

    //arm.setGoalJointTolerance(0.01);
    //arm.setMaxAccelerationScalingFactor(0.2);
    //arm.setMaxVelocityScalingFactor(0.5);
    arm.setNamedTarget("arm_look"); arm.move(); sleep(1);    //机械臂运动到观测色块的位置
    hand.setNamedTarget("hand_open"); hand.move(); sleep(1);  //机械爪张开
    ros::Subscriber color_ik_result_sub=n.subscribe("color_ik_result_new",10,color_ik_result_callback); //订阅色块目标位置对应的关节角度信息

    ROS_INFO("yolo_execute_node init successful");
    ROS_INFO("finding and waitting....");

    while(ros::ok())
   {
      mode_object();//根据模式执行相应决策
      // single_object()//单目标->刷子
      // single_grasp()//单目标->抓取
      // multi_grasp_sequence()//多目标抓取顺序判断函数
      // color_gripping_sequence(); //色块抓取顺序判断函数
      if( arm_state=="ready" )
      {
        arm_state="working";
        ROS_INFO("joint_target_is    :(%4.2f)-(%4.2f)-(%4.2f)",joint_target1,joint_target2,joint_target3);
        // ROS_INFO("color_sequence_is  :(%d)",yolo_sequence);
        //关节的目标旋转角度赋值
        joint_group_positions[0] =  joint_target1;
        joint_group_positions[1] =  -1.57-joint_target2+base_angle;
        joint_group_positions[2] =  joint_target2-base_angle;
        joint_group_positions[3] =  -1.57+joint_target2+auxiliary_angle;
        joint_group_positions[4] =  joint_target3;
        arm.setJointValueTarget(joint_group_positions); //输入目标关节数组
       // while(!arm_success)
        //{
          arm_success = ((arm.plan(my_plan) == moveit::planning_interface::MoveItErrorCode::SUCCESS)); //规划路径

          //ROS_INFO_NAMED("fk_demo_plan",success ? "plan_success" : "plan_False");
          arm.execute(my_plan),sleep(1); //如果规划成功则执行
        //}
        //arm_success=false;
                
        hand.setNamedTarget("hand_close");  //机械爪夹取
        while( !hand_close_success ) //判断是否规划成功，如果不成功则继续规划
        { 
           hand_close_success = ((hand.move() == moveit::planning_interface::MoveItErrorCode::SUCCESS)); //规划路径
           sleep(1);
        }
        hand_close_success=false;
 
        arm.setNamedTarget("arm_look");   arm.move();  sleep(1);    //机械臂运动到观测色块的位置
        arm.setNamedTarget("color_put_interval");  arm.move();  sleep(1); //机械臂臂身运动到放置色块的预位置后，再放置色块
        arm_put(target_color); //根据颜色将色块放置到对应位置 !!!!!!!!!!!!!!!target_color在原排序函数中
      }
    ros::spinOnce();
  }
  ros::shutdown(); 
  return 0;
}

//一个完整的放置动作
void arm_put(std::string color)
{
    moveit::planning_interface::MoveGroupInterface arm("arm");
    moveit::planning_interface::MoveGroupInterface hand("hand");
    //arm.setGoalJointTolerance(0.01);
    //arm.setMaxAccelerationScalingFactor(0.2);
    //arm.setMaxVelocityScalingFactor(0.6);
   //根据色块的颜色判断放置位置                       根据实际修改
         if (color == "recycle") {arm.setNamedTarget("yellow_put");  arm.move();  sleep(1); recycle_done=0;}
    else if (color == "harm")   {arm.setNamedTarget("blue_put");    arm.move();  sleep(1); harm_done=0;}
    else if (color == "kitchen")  {arm.setNamedTarget("green_put");   arm.move();  sleep(1); kitchen_done=0;}
    else if (color == "others")  {arm.setNamedTarget("green_put");   arm.move();  sleep(1); others_done=0; ROS_INFO("sorting is done");}
    hand.setNamedTarget("hand_open");   //机械爪张开
    while( !hand_open_success )  //判断是否规划成功，如果不成功则继续规划
    { 
       hand_open_success = ((hand.move() == moveit::planning_interface::MoveItErrorCode::SUCCESS)); //规划路径
       sleep(1);
    }
    hand_open_success=false;

    arm.setNamedTarget("color_put_interval");   arm.move();  sleep(1);  //机械臂臂身运动到放置色块的预位置
    arm.setNamedTarget("arm_look");   arm.move();  sleep(1);      //机械臂运动到观测色块的位置
    hand.setNamedTarget("hand_open");  //机械爪张开
    while( !hand_open_success ) //判断是否规划成功，如果不成功则继续规划
    { 
       hand_open_success = ((hand.move() == moveit::planning_interface::MoveItErrorCode::SUCCESS)); //规划路径
       sleep(1);
    }
    hand_open_success=false;

    arm_state="working";
    // yolo_sequence=yolo_sequence+1; //放置完成后，开始夹取下一个色块
}
int mode_object()//根据模式执行相应决策
{
  //抓取模式 0：单目标抓取  1：单目标刷子  2：多目标抓取
  if(grasp_mode == 0) single_grasp();
  else if(grasp_mode == 1)  single_object();
  //else multi_grasp_sequence();
}
int single_object()
{
  //ROS_INFO("单分类模式---->>>刷子");
  if(recycle_ready == 2 && recycle_done == 0){
    //串口发送消息刷子

    recycle_done = 1;
    recycle_count += 1;
    ROS_INFO("sorting is:   recycle");
  }
  else if(harm_ready == 2 && harm_done == 0){
    //串口发送消息刷子

    harm_done = 1;
    harm_count += 1;
    ROS_INFO("sorting is:   harm");
  }
  else if(kitchen_ready == 2 && kitchen_done == 0){
    //串口发送消息刷子

    kitchen_done = 1;
    kitchen_count += 1;
    ROS_INFO("sorting is:   kitchen");
  }
  else if(others_ready == 2 && others_done == 0){
    //串口发送消息刷子

    others_done = 1;
    others_count += 1;
    ROS_INFO("sorting is:   others");
  }

}
int single_grasp()//单目标抓取
{
  //ROS_INFO("单分类模式---->>>抓取");
  if(recycle_ready == 2 && recycle_done == 0){
    joint_target1=recycle_target_data[0],joint_target2=recycle_target_data[1],joint_target3=recycle_target_data[2]  ,target_color="recycle",recycle_done=1;//关节目标值赋值
    arm_state="ready";
    recycle_count += 1;
    ROS_INFO("sorting is:   recycle");
  }
  else if(harm_ready == 2 && harm_done == 0){
    joint_target1=harm_target_data[0],joint_target2=harm_target_data[1],joint_target3=harm_target_data[2]  ,target_color="harm",harm_done=1;//关节目标值赋值
    arm_state="ready";
    harm_count += 1;
    ROS_INFO("sorting is:   harm");
  }
  else if(kitchen_ready == 2 && kitchen_done == 0){
    joint_target1=kitchen_target_data[0],joint_target2=kitchen_target_data[1],joint_target3=kitchen_target_data[2]  ,target_color="kitchen",kitchen_done=1;//关节目标值赋值
    arm_state="ready";
    kitchen_count += 1;
    ROS_INFO("sorting is:   kitchen");
  }
  else if(others_ready == 2 && others_done == 0){
    joint_target1=others_target_data[0],joint_target2=others_target_data[1],joint_target3=others_target_data[2]  ,target_color="others",others_done=1;//关节目标值赋值
    arm_state="ready";
    others_count += 1;
    ROS_INFO("sorting is:   others");
  }

}

// ////抓取排序算法(多目标用)
// int multi_grasp_sequence()
// {
//   float arry[4]={0},between=0;
//   int i=0,j=0;
//   if(((harm_ready==2)&&(yolo_confirmed_flag == 0))||((kitchen_ready==2)&&(yolo_confirmed_flag == 0))||((recycle_ready==2)&&(yolo_confirmed_flag == 0))||((others_ready==2)&&(yolo_confirmed_flag == 0))) 
//   {
//     yolo_confirmed_flag = 1;

//   }

// }

//色块抓取顺序判断函数
int color_gripping_sequence()
{
  float arry[4]={0},between=0;
  int i=0,j=0;
  //这个if条件下的内容是对色块距离机械臂的前后位置做夹取的排序，先夹取最近的色块
  if((harm_ready==2)&&(kitchen_ready==2)&&(recycle_ready==2)&&(yolo_confirmed_flag == 0)) 
  {
    yolo_confirmed_flag = 1;
    //arry[0]= red_target_data[1];
    arry[0]= kitchen_target_data[1];
    arry[1]= recycle_target_data[1];
    arry[2]= harm_target_data[1];
    arry[3]= others_target_data[1];
    //冒泡排序法
    for(i=0;i<4;i++)
    {
     for(j=3;j>i;j--)
      {
        if (arry[j]<arry[j-1]) 
          { between=arry[j]; arry[j]=arry[j-1]; arry[j-1]=between; }
      }
    }
    ROS_INFO("arry_is:(%4.2f)-(%4.2f)-(%4.2f)-(%4.2f)",arry[0],arry[1],arry[2],arry[3]);
   //排序后再对应每个色块的顺序 
   //for(j=0;j<4;j++) {  if(red_target_data[1]    == arry[j]) sequence[0]=j+1; }
   for(j=0;j<4;j++) {  if(kitchen_target_data[1] == arry[j]) sequence[0]=j+1; }
   for(j=0;j<4;j++) {  if(recycle_target_data[1]   == arry[j]) sequence[1]=j+1; }
   for(j=0;j<4;j++) {  if(harm_target_data[1]  == arry[j]) sequence[2]=j+1; }
   for(j=0;j<4;j++) {  if(others_target_data[1]  == arry[j]) sequence[3]=j+1; }
   ROS_INFO("sequence_is:(%d)-(%d)-(%d)-(%d)",sequence[0],sequence[1],sequence[2],sequence[3]);

   if((sequence[0]==sequence[1])||(sequence[1]==sequence[2])||(sequence[1]==sequence[2])) 
   {  harm_ready=0; kitchen_ready=0; recycle_ready=0; yolo_confirmed_flag = 0;   
      ROS_INFO("data is error");
   }

  }

  if( yolo_confirmed_flag == 1) 
  {//根据color_sequence决定夹取顺序
      if (yolo_sequence==sequence[0]&&recycle_done==0)
       {
         joint_target1=kitchen_target_data[0],joint_target2=kitchen_target_data[1],joint_target3=kitchen_target_data[2],target_color="kitchen",kitchen_done=1;//关节目标值赋值
         arm_state="ready";
         ROS_INFO("sorting is: kitchen");
       return 0;
       }
     else if (yolo_sequence==sequence[1]&&harm_done==0)
       {
         joint_target1=recycle_target_data[0],joint_target2=recycle_target_data[1],joint_target3=recycle_target_data[2]  ,target_color="recycle",recycle_done=1;//关节目标值赋值
         arm_state="ready";
         ROS_INFO("sorting is:   recycle");
       return 0;
       }
     else if (yolo_sequence==sequence[2]&&kitchen_done==0)
       {
         joint_target1=harm_target_data[0],joint_target2=harm_target_data[1],joint_target3=harm_target_data[2] ,target_color="harm",harm_done=1;//关节目标值赋值
         arm_state="ready";
         ROS_INFO("sorting is:  harm");
       return 0;
       }
     else if (yolo_sequence==sequence[3]&&others_done==0)
        {
         joint_target1=others_target_data[0],joint_target2=others_target_data[1],joint_target3=others_target_data[2] ,target_color="others",others_done=1;//关节目标值赋值
         arm_state="ready";
         ROS_INFO("sorting is:  others");
        }
     else { arm_state="none"; }
  }
  
}


