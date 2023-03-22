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

#include <std_msgs/Float32.h>
#include <std_msgs/String.h>
#include <moveit/move_group_interface/move_group_interface.h>
#include "color_stack_execute.h"

std::string arm_state="none",target_color="noon"; //机械臂状态，夹取目标色块的颜色

bool arm_success,hand_close_success,hand_open_success; //moveit正解计算（返回值）是否成功的标志位

int sequence[4]={0};  //夹取顺序排序数组
int color_sequence=1; //夹取顺序
float auxiliary_angle; 
int color_confirmed_flag =0;  //启动夹取的标志位
int red_done=0,yellow_done=0,blue_done=0,green_done=0;   //色块是否已经夹取标志位
int red_ready=0,blue_ready=0,green_ready=0,yellow_ready=0;  //色块位置确认标志位
int red_count=0,blue_count=0,green_count=0,yellow_count=0;
float joint_target1=0,joint_target2=0,joint_target3=0;  //赋值给moveit做正解的目标关节值
float red_target_data[3]={0},blue_target_data[3]={0},green_target_data[3]={0},yellow_target_data[3]={0}; //色块的目标位置对应的关节运动弧度数组
float link_a,link_b,link_c,link_h; //机械参数
float base_angle;  //计算机械臂夹爪可触底的关节基础角度
std::vector<double> joint_group_positions(5); //机械臂正解的目标关节位置的数组

//目标色块对应逆解的目标关节角度回调函数
void color_ik_result_callback(const table_arm::color_ik_result &msg)
{
   if(msg.color=="blue") 
  {
     if(blue_ready== 0 )  
       {
         blue_count++;
         blue_target_data[0]=msg.pedestal_angle;  //云台的目标角度
         blue_target_data[1]=msg.arm_angle;       //控制机械臂臂长的目标角度
         blue_target_data[2]=msg.hand_angle;      //控制夹取色块旋转的目标角度
         if(blue_count>10)
         {
           blue_ready=2;
           ROS_INFO("blue_target_is  :(%4.2f)-(%4.2f)-(%4.2f)",blue_target_data[0],blue_target_data[1],blue_target_data[2]);
         }

       }
  } 
    
  else if(msg.color=="green") 
  {
     if(green_ready== 0 )  
       {
         green_count++;
         green_target_data[0]=msg.pedestal_angle;  //云台的目标角度
         green_target_data[1]=msg.arm_angle;       //控制机械臂臂长的目标角度
         green_target_data[2]=msg.hand_angle;      //控制夹取色块旋转的目标角度
         if(blue_count>10)
         {
           green_ready=2;
           ROS_INFO("green_target_is :(%4.2f)-(%4.2f)-(%4.2f)",green_target_data[0],green_target_data[1],green_target_data[2]); 
         }
       }
  } 

  else if(msg.color=="yellow") 
  {
     if(yellow_ready== 0 )  
       {
         yellow_count++;
         yellow_target_data[0]=msg.pedestal_angle;  //云台的目标角度
         yellow_target_data[1]=msg.arm_angle;       //控制机械臂臂长的目标角度
         yellow_target_data[2]=msg.hand_angle;      //控制夹取色块旋转的目标角度
         if(yellow_count>10)
         {
           yellow_ready=2;
           ROS_INFO("yellow_target_is:(%4.2f)-(%4.2f)-(%4.2f)",yellow_target_data[0],yellow_target_data[1],yellow_target_data[2]);
         }
       }
  } 

}


int main(int argc, char **argv)
{ 
    ros::init(argc, argv, "color_stack_execute");
    ros::NodeHandle n;
    ros::NodeHandle nprivate("~");

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
    arm.setNamedTarget("arm_look"); arm.move(); sleep(1); //机械臂运动到观测色块的位置
    hand.setNamedTarget("hand_open"); hand.move(); sleep(1); //机械爪张开
    ros::Subscriber color_ik_result_sub=n.subscribe("color_ik_result",10,color_ik_result_callback); //订阅色块目标位置对应的关节角度信息
    ROS_INFO("color_stack_execute_node init successful");
    ROS_INFO("finding color ,waitting....");

    while(ros::ok())
   {
      color_gripping_sequence();//色块抓取顺序判断函数
      if( arm_state=="ready" )
      {
        arm_state="working";
        ROS_INFO("joint_target_is    :(%4.2f)-(%4.2f)-(%4.2f)",joint_target1,joint_target2,joint_target3);
        ROS_INFO("color_sequence_is  :(%d)",color_sequence);
        //关节的目标旋转角度赋值
        joint_group_positions[0] =  joint_target1;
        joint_group_positions[1] =  -1.57-joint_target2+base_angle;
        joint_group_positions[2] =  joint_target2-base_angle;
        joint_group_positions[3] =  -1.57+joint_target2+auxiliary_angle;
        joint_group_positions[4] =  joint_target3;
        arm.setJointValueTarget(joint_group_positions);  //输入目标关节数组
       // while(!arm_success)
        //{
          arm_success = ((arm.plan(my_plan) == moveit::planning_interface::MoveItErrorCode::SUCCESS)); //规划路径
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
 
        arm.setNamedTarget("arm_look");   arm.move();  sleep(1);          //机械臂运动到观测色块的位置
        arm.setNamedTarget("color_stack_put_interval");  arm.move();  sleep(1); //机械臂臂身运动到放置色块的预位置后，再放置色块
        arm_put(color_sequence);  //根据颜色将色块放置到对应位置
      }
    ros::spinOnce();
  }
  ros::shutdown(); 
  return 0;
}

//一个完整的放置动作
void arm_put(int put_sequence)
{
    moveit::planning_interface::MoveGroupInterface arm("arm");
    moveit::planning_interface::MoveGroupInterface hand("hand");
    //arm.setGoalJointTolerance(0.01);
    //arm.setMaxAccelerationScalingFactor(0.2);
    //arm.setMaxVelocityScalingFactor(0.6);
    //根据色块的堆叠顺序判断放置位置
    if (put_sequence == 1)        {arm.setNamedTarget("color_stack_put_position1");  arm.move();  sleep(1); }
    else if (put_sequence == 2)   {arm.setNamedTarget("color_stack_put_position2");    arm.move();  sleep(1); }
    else if (put_sequence == 3)   {arm.setNamedTarget("color_stack_put_position3");  arm.move();  sleep(1); ROS_INFO("stack color is done");}
    //else if (put_sequence == 4)   {arm.setNamedTarget("stack_put_position4");  arm.move();  sleep(1);ROS_INFO("stack color is done");}
   
    hand.setNamedTarget("hand_open");  //机械爪张开
    while( !hand_open_success ) //判断是否规划成功，如果不成功则继续规划
    { 
       hand_open_success = ((hand.move() == moveit::planning_interface::MoveItErrorCode::SUCCESS)); //规划路径
       sleep(1);
    }
    hand_open_success=false;

    arm.setNamedTarget("color_stack_put_interval");   arm.move();  sleep(1);  //机械臂臂身运动到放置色块的预位置
    arm.setNamedTarget("arm_look");   arm.move();  sleep(1);            //机械臂运动到观测色块的位置

    arm_state="ready";
    color_sequence=color_sequence+1; //放置完成后，开始夹取下一个色块
}

//色块抓取顺序判断函数
int color_gripping_sequence()
{
  float arry[3]={0},between=0;
  int i=0,j=0;
  //这个if条件下的内容是对色块距离机械臂的前后位置做夹取的排序，先夹取最近的色块
  if((green_ready==2)&&(yellow_ready==2)&&(blue_ready==2)&&(color_confirmed_flag == 0)) 
  {
    color_confirmed_flag = 1;
    //arry[0]= red_target_data[1];
    arry[0]= yellow_target_data[1];
    arry[1]= blue_target_data[1];
    arry[2]= green_target_data[1];
    //冒泡排序法
    for(i=0;i<3;i++)
    {
     for(j=2;j>i;j--)
      {
        if (arry[j]<arry[j-1]) 
          { between=arry[j]; arry[j]=arry[j-1]; arry[j-1]=between; }
      }
    }
    ROS_INFO("arry_is:(%4.2f)-(%4.2f)-(%4.2f)",arry[0],arry[1],arry[2]);

   //排序后再对应每个色块的顺序 
   for(j=0;j<3;j++) {  if(yellow_target_data[1] == arry[j]) sequence[0]=j+1; }
   for(j=0;j<3;j++) {  if(blue_target_data[1]   == arry[j]) sequence[1]=j+1; }
   for(j=0;j<3;j++) {  if(green_target_data[1]  == arry[j]) sequence[2]=j+1; }
   //ROS_INFO("sequence_is:(%d)-(%d)-(%d)-(%d)",sequence[0],sequence[1],sequence[2],sequence[3]);

  }

  if( color_confirmed_flag == 1) 
  {  //根据color_sequence决定夹取顺序
      if (color_sequence==sequence[0]&&yellow_done==0)
       {
         joint_target1=yellow_target_data[0],joint_target2=yellow_target_data[1],joint_target3=yellow_target_data[2],target_color="yellow",yellow_done=1;//关节目标值赋值
         arm_state="ready";
         ROS_INFO("stacking color is: yellow");
       return 0;
       }
     else if (color_sequence==sequence[1]&&blue_done==0)
       {
         joint_target1=blue_target_data[0],joint_target2=blue_target_data[1],joint_target3=blue_target_data[2]  ,target_color="blue",blue_done=1;//关节目标值赋值
         arm_state="ready";
         ROS_INFO("stacking color is:   blue");
       return 0;
       }
     else if (color_sequence==sequence[2]&&green_done==0)
       {
         joint_target1=green_target_data[0],joint_target2=green_target_data[1],joint_target3=green_target_data[2] ,target_color="green",green_done=1;//关节目标值赋值
         arm_state="ready";
         ROS_INFO("stacking color is:  green");
       return 0;
       }
     else { arm_state="none"; }
  }
  
}


