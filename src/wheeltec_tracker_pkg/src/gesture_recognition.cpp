#include <ros/ros.h>
#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <std_msgs/String.h> 
#include <std_msgs/Int32.h> 
#include <moveit/move_group_interface/move_group_interface.h>

std::string arm_state="ready",arm_action="noon";
ros::Publisher joints_state_publisher;  //初始化关节目标角度的发布者
ros::Time init_time,now_time;
int action_count =0;  //动作执行时用到的计数变量
float one_init_value=0,two_init_value=0,ok_init_value=0,Thumb_up_init_value=0;
int gestrue_control_flag=0; //控制逻辑相关标志位

int one_flag=0,two_flag=0,ok_flag=0,Thumb_up_flag=0;  //控制逻辑相关标志位
int repetition_check=0,start_action=0;
float Sampling_Time=0;
using namespace std; 
/***********************************
函数功能：机械臂巡视的执行函数
***********************************/
void init_position(void)
{
   sensor_msgs::JointState arm_joint_msg;  //定义一个机械臂控制信息的消息数据类型
   ros::Time pub_time=ros::Time::now();  //获取当前的ROS时间
      //输入当前的ros时间
      arm_joint_msg.header.stamp=pub_time;
      //输入机械臂臂身的目标关节角度（单位：弧度）
      arm_joint_msg.position.push_back(0);
      arm_joint_msg.position.push_back(0);
      arm_joint_msg.position.push_back(0);
      arm_joint_msg.position.push_back(-1.57);
      arm_joint_msg.position.push_back(0);
      //输入机械臂夹爪的目标关节角度（单位：弧度）
      arm_joint_msg.position.push_back(0);
      arm_joint_msg.position.push_back(0);
      arm_joint_msg.position.push_back(0);
      arm_joint_msg.position.push_back(0);
      arm_joint_msg.position.push_back(0);
      arm_joint_msg.position.push_back(0);
      //输入机械臂关节名称
      arm_joint_msg.name.push_back("joint_1");
      arm_joint_msg.name.push_back("joint_2");
      arm_joint_msg.name.push_back("joint_3");
      arm_joint_msg.name.push_back("joint_4");
      arm_joint_msg.name.push_back("joint_5"); 
      arm_joint_msg.name.push_back("joint_6");
      arm_joint_msg.name.push_back("joint_10");
      arm_joint_msg.name.push_back("joint_7");
      arm_joint_msg.name.push_back("joint_11");
      arm_joint_msg.name.push_back("joint_8");
      arm_joint_msg.name.push_back("joint_9");
      //将关节目标角度发布出去
      joints_state_publisher.publish(arm_joint_msg);

}
void one_action(void)
{  
   static float joint_step=0.03;  //机械臂运动的步进值
   sensor_msgs::JointState arm_joint_msg;  //定义一个机械臂控制信息的消息数据类型
   ros::Time pub_time=ros::Time::now();  //获取当前的ROS时间
   if  (action_count>=0 && action_count<40) one_init_value=one_init_value-joint_step; //执行的第1段动作
   else if(action_count>=40 && action_count<80)  one_init_value=one_init_value+joint_step; //执行的第2段动作
   else if(action_count>=80 && action_count<120)  one_init_value=one_init_value-joint_step; //执行的第2段动作
   else if (action_count>=120) one_init_value=one_init_value+joint_step; //执行的第3段动作
      //输入当前的ros时间
      arm_joint_msg.header.stamp=pub_time;
      //输入机械臂臂身的目标关节角度（单位：弧度）
      arm_joint_msg.position.push_back(0);
      arm_joint_msg.position.push_back(one_init_value);
      arm_joint_msg.position.push_back(-one_init_value);
      arm_joint_msg.position.push_back(-1.57);
      arm_joint_msg.position.push_back(0);
      //输入机械臂夹爪的目标关节角度（单位：弧度）
      arm_joint_msg.position.push_back(0);
      arm_joint_msg.position.push_back(0);
      arm_joint_msg.position.push_back(0);
      arm_joint_msg.position.push_back(0);
      arm_joint_msg.position.push_back(0);
      arm_joint_msg.position.push_back(0);
      //输入机械臂关节名称
      arm_joint_msg.name.push_back("joint_1");
      arm_joint_msg.name.push_back("joint_2");
      arm_joint_msg.name.push_back("joint_3");
      arm_joint_msg.name.push_back("joint_4");
      arm_joint_msg.name.push_back("joint_5"); 
      arm_joint_msg.name.push_back("joint_6");
      arm_joint_msg.name.push_back("joint_10");
      arm_joint_msg.name.push_back("joint_7");
      arm_joint_msg.name.push_back("joint_11");
      arm_joint_msg.name.push_back("joint_8");
      arm_joint_msg.name.push_back("joint_9");
      //将关节目标角度发布出去
      joints_state_publisher.publish(arm_joint_msg);

    if(action_count>160)  //执行完成后将标志位置零
    {
      one_flag=0;
      action_count=0;
      one_init_value=0;
      arm_state="ready";
      //init_position();
    }
}

void two_action(void)
{
   static float joint_step=0.03;  //机械臂运动的步进值
   sensor_msgs::JointState arm_joint_msg;  //定义一个机械臂控制信息的消息数据类型
   ros::Time pub_time=ros::Time::now();  //获取当前的ROS时间
   if  (action_count>=0 && action_count<40) two_init_value=two_init_value+joint_step; //执行的第1段动作
   else if(action_count>=40 && action_count<80)  two_init_value=two_init_value-joint_step; //执行的第2段动作
   if  (action_count>=80 && action_count<120) two_init_value=two_init_value+joint_step; //执行的第1段动作
   else if (action_count>=120) two_init_value=two_init_value-joint_step; //执行的第3段动作
      //输入当前的ros时间
      arm_joint_msg.header.stamp=pub_time;
      //输入机械臂臂身的目标关节角度（单位：弧度）
      arm_joint_msg.position.push_back(0);
      arm_joint_msg.position.push_back(two_init_value);
      arm_joint_msg.position.push_back(-two_init_value);
      arm_joint_msg.position.push_back(-1.57);
      arm_joint_msg.position.push_back(0);
      //输入机械臂夹爪的目标关节角度（单位：弧度）
      arm_joint_msg.position.push_back(0);
      arm_joint_msg.position.push_back(0);
      arm_joint_msg.position.push_back(0);
      arm_joint_msg.position.push_back(0);
      arm_joint_msg.position.push_back(0);
      arm_joint_msg.position.push_back(0);
      //输入机械臂关节名称
      arm_joint_msg.name.push_back("joint_1");
      arm_joint_msg.name.push_back("joint_2");
      arm_joint_msg.name.push_back("joint_3");
      arm_joint_msg.name.push_back("joint_4");
      arm_joint_msg.name.push_back("joint_5"); 
      arm_joint_msg.name.push_back("joint_6");
      arm_joint_msg.name.push_back("joint_10");
      arm_joint_msg.name.push_back("joint_7");
      arm_joint_msg.name.push_back("joint_11");
      arm_joint_msg.name.push_back("joint_8");
      arm_joint_msg.name.push_back("joint_9");
      //将关节目标角度发布出去
      joints_state_publisher.publish(arm_joint_msg);

    if(action_count>160)  //执行完成后将标志位置零
    {
      two_flag=0;
      action_count=0;
      two_init_value=0;
      arm_state="ready";
      //init_position();
    }
}

void ok_action(void)
{
   static float joint_step=0.045;  //机械臂运动的步进值
   sensor_msgs::JointState arm_joint_msg;  //定义一个机械臂控制信息的消息数据类型
   ros::Time pub_time=ros::Time::now();  //获取当前的ROS时间
   if  (action_count>=0 && action_count<20) ok_init_value=ok_init_value-joint_step; //执行的第1段动作
   else if(action_count>=20 && action_count<40)  ok_init_value=ok_init_value+joint_step; //执行的第2段动作
   else if(action_count>=40 && action_count<60)  ok_init_value=ok_init_value-joint_step; //执行的第2段动作
   else if (action_count>=60) ok_init_value=ok_init_value+joint_step; //执行的第3段动作
      //输入当前的ros时间
      arm_joint_msg.header.stamp=pub_time;
      //输入机械臂臂身的目标关节角度（单位：弧度）
      arm_joint_msg.position.push_back(0);
      arm_joint_msg.position.push_back(0);
      arm_joint_msg.position.push_back(0);
      arm_joint_msg.position.push_back(-1.57);
      arm_joint_msg.position.push_back(0);
      //输入机械臂夹爪的目标关节角度（单位：弧度）
      arm_joint_msg.position.push_back(ok_init_value);
      arm_joint_msg.position.push_back(0);
      arm_joint_msg.position.push_back(0);
      arm_joint_msg.position.push_back(0);
      arm_joint_msg.position.push_back(0);
      arm_joint_msg.position.push_back(0);
      //输入机械臂关节名称
      arm_joint_msg.name.push_back("joint_1");
      arm_joint_msg.name.push_back("joint_2");
      arm_joint_msg.name.push_back("joint_3");
      arm_joint_msg.name.push_back("joint_4");
      arm_joint_msg.name.push_back("joint_5"); 
      arm_joint_msg.name.push_back("joint_6");
      arm_joint_msg.name.push_back("joint_10");
      arm_joint_msg.name.push_back("joint_7");
      arm_joint_msg.name.push_back("joint_11");
      arm_joint_msg.name.push_back("joint_8");
      arm_joint_msg.name.push_back("joint_9");
      //将关节目标角度发布出去
      joints_state_publisher.publish(arm_joint_msg);

    if(action_count>80)  //执行完成后将标志位置零
    {
      ok_flag=0;
      action_count=0;
      ok_init_value=0;
      arm_state="ready";
      //init_position();
    }
}

void Thumb_up_action(void)
{
   static float joint_step=0.045;  //机械臂运动的步进值
   sensor_msgs::JointState arm_joint_msg;  //定义一个机械臂控制信息的消息数据类型
   ros::Time pub_time=ros::Time::now();  //获取当前的ROS时间
   if  (action_count>=0 && action_count<30) Thumb_up_init_value=Thumb_up_init_value-joint_step; //执行的第1段动作
   else if(action_count>=30 && action_count<60)  Thumb_up_init_value=Thumb_up_init_value+joint_step; //执行的第2段动作
   else if(action_count>=60 && action_count<90)  Thumb_up_init_value=Thumb_up_init_value-joint_step; //执行的第2段动作
   else if (action_count>=120) Thumb_up_init_value=Thumb_up_init_value+joint_step; //执行的第3段动作
      //输入当前的ros时间
      arm_joint_msg.header.stamp=pub_time;
      //输入机械臂臂身的目标关节角度（单位：弧度）
      arm_joint_msg.position.push_back(0);
      arm_joint_msg.position.push_back(0);
      arm_joint_msg.position.push_back(0);
      arm_joint_msg.position.push_back(-1.57);
      arm_joint_msg.position.push_back(Thumb_up_init_value);
      //输入机械臂夹爪的目标关节角度（单位：弧度）
      arm_joint_msg.position.push_back(0);
      arm_joint_msg.position.push_back(0);
      arm_joint_msg.position.push_back(0);
      arm_joint_msg.position.push_back(0);
      arm_joint_msg.position.push_back(0);
      arm_joint_msg.position.push_back(0);
      //输入机械臂关节名称
      arm_joint_msg.name.push_back("joint_1");
      arm_joint_msg.name.push_back("joint_2");
      arm_joint_msg.name.push_back("joint_3");
      arm_joint_msg.name.push_back("joint_4");
      arm_joint_msg.name.push_back("joint_5"); 
      arm_joint_msg.name.push_back("joint_6");
      arm_joint_msg.name.push_back("joint_10");
      arm_joint_msg.name.push_back("joint_7");
      arm_joint_msg.name.push_back("joint_11");
      arm_joint_msg.name.push_back("joint_8");
      arm_joint_msg.name.push_back("joint_9");
      //将关节目标角度发布出去
      joints_state_publisher.publish(arm_joint_msg);

    if(action_count>120)  //执行完成后将标志位置零
    {
      Thumb_up_flag=0;
      action_count=0;
      Thumb_up_init_value=0;
      arm_state="ready";
      //init_position();
    }
}


/***********************************
函数功能：获取语音唤醒角度
***********************************/
void discern_result_callback(const std_msgs::String &msg)
{
	std::string str1 = "One";
	std::string str2 = "Two"; 
	std::string str3 = "Ok";
	std::string str4 = "Thumb_up"; 
  std::string gestrue_recognition_result=msg.data.c_str();
  static std::string last_action = "noon";
/***********************************
指令：机械臂放置
动作：夹爪张开
***********************************/
if(arm_state!="busy"  && start_action ==1)
{       
	if(gestrue_recognition_result == str1)
	{
         arm_action="one";
         cout<<">>>one"<<endl;
         gestrue_control_flag=1;
         arm_state="ready";
	}
	else if(gestrue_recognition_result == str2)
	{
         arm_action="two";
         cout<<">>>two"<<endl;
         gestrue_control_flag=1;
         arm_state="ready";	
	}
	else if(gestrue_recognition_result == str3)
	{
         arm_action="ok";
         cout<<">>>ok"<<endl;
         gestrue_control_flag=1;
         arm_state="ready";	
	}
	else if(gestrue_recognition_result == str4)
	{
         arm_action="Thumb_up";
         cout<<">>>Thumb_up"<<endl;
         gestrue_control_flag=1;
         arm_state="ready";	
	}

       if(arm_action==last_action) repetition_check=1;
       else repetition_check=0;
       last_action=arm_action;
}
     
       
}


/***********************************
  主函数
***********************************/
int main(int argc, char **argv)
{ 
    ros::init(argc, argv, "gesture_recognition_cpp"); 
    ros::NodeHandle n;
    ros::Subscriber discern_result_sub = n.subscribe("discern_result",10,discern_result_callback); //订阅语音输入信息话题
    joints_state_publisher=n.advertise<sensor_msgs::JointState>("/move_group/fake_controller_joint_states",10);//往控制机械臂运动的话题发布信息
 
    ros::Rate loop_rate(40); //设置程序执行频率（单位：hz）
    init_time=ros::Time::now();
    //init_position();
    //while循环执行 
    while(ros::ok())
   {   
      now_time=ros::Time::now();
      Sampling_Time=  (now_time - init_time).toSec(); 
     
      if(Sampling_Time<10)  init_position(); // 前10秒钟让机械臂固定在初始位置
      else if(Sampling_Time>=10 && Sampling_Time<10.01)   { cout<<">>>请开始输入手势动作吧！"<<endl; start_action=1; }
      if(gestrue_control_flag==1 && arm_state=="ready" && repetition_check==0)//机械臂预设位置控制
      {
          if(arm_action=="one")  
           { 
             one_flag=1;
             arm_state="busy";
             gestrue_control_flag=0;
             cout<<">>>action is one"<<endl;
           }    
          if(arm_action=="two")  
           { 
             two_flag=1;
             arm_state="busy";
             gestrue_control_flag=0;
             cout<<">>>action is two"<<endl;
           }   
          if(arm_action=="ok")  
           { 
             ok_flag=1;
             arm_state="busy";
             gestrue_control_flag=0;
             cout<<">>>action is ok"<<endl;
           }   
          if(arm_action=="Thumb_up")  
           { 
             Thumb_up_flag=1;
             arm_state="busy";
             gestrue_control_flag=0;
             cout<<">>>action is Thumb_up"<<endl;
           }   
      } 

      if(one_flag==1)
     {
       one_action(); //执行机械臂巡视
       action_count++;
     } 

      if(two_flag==1)
     {
       two_action(); //执行机械臂巡视
       action_count++;
     } 

      if(ok_flag==1)
     {
       ok_action(); //执行机械臂巡视
       action_count++;
     } 
      if(Thumb_up_flag==1)
     {
       Thumb_up_action(); //执行机械臂巡视
       action_count++;
     } 

    ros::spinOnce();
    loop_rate.sleep(); //延时等待
    
  }  
  return 0;
}






