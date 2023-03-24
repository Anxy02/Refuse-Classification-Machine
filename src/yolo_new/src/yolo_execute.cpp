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
//using namespace std; 

#include <std_msgs/Float32.h>
#include <std_msgs/String.h>
#include <moveit/move_group_interface/move_group_interface.h>
#include "yolo_execute.h"
#include "yolo_new/Flag.h"

#include<locale>

int yolo_sequence=1;  //夹取顺序
int yolo_confirmed_flag =0; //启动夹取的标志位
int grasp_mode=0;//抓取模式 0：单目标抓取  1：单目标刷子  2：多目标抓取
int isBusy=0,countFlag=0;//回调函数中忙状态
int i_cb,j_cb=0;//回调函数循环变量

float auxiliary_angle; 
int recycle_count_cb=0,harm_count_cb=0,kitchen_count_cb=0,others_count_cb=0; //接收到该数据帧的回调函数次数callback
int recycle_count=0,harm_count=0,kitchen_count=0,others_count=0; //垃圾计数
int count=0;//识别到的垃圾总数量
int sort_done=0;  //色块是否已经夹取标志位
float cb_target_data[10][3]={0};  //回调函数目标值保存
std::string cb_class[10]={};
float joint_target1=0,joint_target2=0,joint_target3=0; //赋值给moveit做正解的目标关节值
float link_a,link_b,link_c,link_h; //机械参数
float base_angle;
std::string arm_state="none",target_sort="noon";  //机械臂状态，夹取目标色块的颜色

bool arm_success,hand_close_success,hand_open_success; //moveit正解计算（返回值）是否成功的标志位

std::vector<double> joint_group_positions(5); //机械臂正解的目标关节位置的数组



//目标色块对应逆解的目标关节角度回调函数
void color_ik_result_callback(const yolo_new::color_ik_result_new &msg)
{
  ROS_INFO("count is :%d ",msg.count);
  if(isBusy == 0)
  {
      if(countFlag == 0){
        count=msg.count;//总数量
        countFlag = 1;
      }
          
      //ROS_INFO("msg sort is :%s ",msg.sort);

      if(i_cb < count)
      {
        cb_target_data[i_cb][0]=msg.pedestal_angle;  //云台的目标角度
        cb_target_data[i_cb][1]=msg.arm_angle;       //控制机械臂臂长的目标角度
        cb_target_data[i_cb][2]=msg.hand_angle;      //控制夹取色块旋转的目标角度
        ROS_INFO("tmp_i is :%d ",i_cb); 
        ROS_INFO("cb_target_is  :(%4.2f)-(%4.2f)-(%4.2f)",cb_target_data[i_cb][0],cb_target_data[i_cb][1],cb_target_data[i_cb][2]);
        cb_class[i_cb] = msg.sort; //二选一
        ROS_INFO("msg sort is :%s ",msg.sort);        //测试类别传输！！！！
        ROS_INFO("cb sort is :%s ",cb_class[i_cb]);
        i_cb+=1;
        // if(msg.sort=="recycle") 
        // {
        //   cb_class[i_cb] = "recycle";
        // }
        // else if(msg.sort=="harm")
        // {
        //   cb_class[i_cb] = "harm";
        // }
        // else if(msg.sort=="kitchen")
        // {
        //   cb_class[i_cb] = "kitchen";
        // }
        // else if(msg.sort=="others")
        // {
        //   cb_class[i_cb] = "others";
        // }
        
      }
      else
      {
        isBusy = 1;
      }
  }
  
}


int main(int argc, char **argv)
{ 
    ros::init(argc, argv, "yolo_execute");
    ros::NodeHandle n;
    ros::NodeHandle nprivate("~");
    // setlocale(LC_CTYPE, "zh_CN.utf8");//chinese
    setlocale(LC_ALL,"");

    std::locale::global(std::locale(""));
    nprivate.param<float>("/auxiliary_angle", auxiliary_angle, 0.157);
    nprivate.param<float>("/link_a", link_a, 0.105);
    nprivate.param<float>("/link_b", link_b, 0.100);
    nprivate.param<float>("/link_c", link_c, 0.175);
    nprivate.param<float>("/link_h", link_h, 0.100);
    i_cb=0;j_cb=0;  //初始化i,j

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
    ros::Publisher Flag_pub = n.advertise<yolo_new::Flag>("Flag_pub",1000);
    yolo_new::Flag pub_flag;
    pub_flag.isMoving = 0;
    Flag_pub.publish(pub_flag);
    
    

    ROS_INFO("yolo_execute_node init successful");
    ROS_INFO("finding and waitting....");

    while(ros::ok())
   {
      // mode_object();//根据模式执行相应决策
      // single_object()//单目标->刷子
      // single_grasp()//单目标->抓取
      multi_grasp_sequence();//多目标抓取顺序判断函数

      if(isBusy==1){
        pub_flag.isMoving = 1;
        Flag_pub.publish(pub_flag);
      }
      else{
        pub_flag.isMoving = 0;
        Flag_pub.publish(pub_flag);
      }

      if( arm_state=="ready" )
      {
        arm_state="working";
        ROS_INFO("joint_target_is    :(%4.2f)-(%4.2f)-(%4.2f)",joint_target1,joint_target2,joint_target3);

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
        arm_put(target_sort); //根据颜色将色块放置到对应位置 
        // pub_flag.isMoving = 0;
        
      }
    ros::spinOnce();
  }
  ros::shutdown(); 
  return 0;
}

//一个完整的放置动作
void arm_put(std::string sort)
{
    moveit::planning_interface::MoveGroupInterface arm("arm");
    moveit::planning_interface::MoveGroupInterface hand("hand");
    //arm.setGoalJointTolerance(0.01);
    //arm.setMaxAccelerationScalingFactor(0.2);
    //arm.setMaxVelocityScalingFactor(0.6);
   //根据色块的颜色判断放置位置                       根据实际修改
         if (sort == "recycle") {arm.setNamedTarget("yellow_put");  arm.move();  sleep(1);}
    else if (sort == "harm")   {arm.setNamedTarget("blue_put");    arm.move();  sleep(1);}
    else if (sort == "kitchen")  {arm.setNamedTarget("green_put");   arm.move();  sleep(1);}
    else if (sort == "others")  {arm.setNamedTarget("green_put");   arm.move();  sleep(1);ROS_INFO("sorting is done");}
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

    sort_done=0;  //标志位清零
    if(j_cb >= count)//标志位清零
    {
      i_cb = 0;
      j_cb = 0;
      isBusy = 0 ;
      countFlag = 0;
    }
    arm_state="working";
    // yolo_sequence=yolo_sequence+1; //放置完成后，开始夹取下一个色块
}
/*
int mode_object()//根据模式执行相应决策
{
  //抓取模式 0：单目标抓取  1：单目标刷子  2：多目标抓取
  if(grasp_mode == 0) single_grasp();
  else if(grasp_mode == 1)  single_object();
  // else multi_grasp_sequence();
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
*/
int multi_grasp_sequence()//多目标抓取
{
  //ROS_INFO("多目标---->>>抓取");
  if(isBusy == 1 && j_cb < count && sort_done == 0)
  {
    joint_target1=cb_target_data[j_cb][0];//关节目标值赋值
    joint_target2=cb_target_data[j_cb][1];
    joint_target3=cb_target_data[j_cb][2];
    if(cb_class[j_cb] == "recycle")
    {
      target_sort="recycle";
      arm_state="ready";
      recycle_count += 1;
      ROS_INFO("sorting is:   recycle");
    }
    else if(cb_class[j_cb] == "harm")
    {
      target_sort="harm";
      arm_state="ready";
      harm_count += 1;
      ROS_INFO("sorting is:   harm");
    }
    else if(cb_class[j_cb] == "kitchen")
    {
      target_sort="kitchen";
      arm_state="ready";
      kitchen_count += 1;
      ROS_INFO("sorting is:   kitchen");
    }
    else if(cb_class[j_cb] == "others")
    {
      target_sort="others";
      arm_state="ready";
      others_count += 1;
      ROS_INFO("sorting is:   others");
    }
    sort_done=1;
    ++j_cb;


  }

}



