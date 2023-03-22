#include "voice_control.h"
#include "wheeltec_table_arm.h"
#include <iostream>
#include <std_msgs/Int8.h>

std::string arm_state="ready",arm_action="noon";
std::vector<double> joint_group_positions(5); //关节正解运动用到的关机目标运动数组
ros::Publisher joints_state_publisher;  //初始化关节目标角度的发布者

using namespace std;
int time_count=0;
/***********************************
函数功能：机械臂跳舞的执行函数
***********************************/
void arm_wait(void)
{
   static float joint_step=0.05; //机械臂运动的步进值
   sensor_msgs::JointState arm_joint_msg;  //定义一个机械臂控制信息的消息数据类型
   ros::Time pub_time=ros::Time::now();   //获取当前的ROS时间
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

/***********************************
  主函数
***********************************/
int main(int argc, char **argv)
{ 
    ros::init(argc, argv, "follower_help_node"); 
    ros::NodeHandle n;
 
    ros::AsyncSpinner spinner(1);
    spinner.start();

    //moveit::planning_interface::MoveGroupInterface arm("arm");   //初始化moveit控制规划组
    //moveit::planning_interface::MoveGroupInterface hand("hand");  //初始化moveit控制规划组
   // moveit::planning_interface::MoveGroupInterface::Plan my_plan;  //机械臂正解时用到的路径
  
    //arm.setNamedTarget("voice_control_wait"); arm.move(); sleep(1);    //机械臂运动到预设位置
    joints_state_publisher=n.advertise<sensor_msgs::JointState>("joint_states",10);//往控制机械臂运动的话题发布信息

    ros::Rate loop_rate(10); //设置程序执行频率（单位：hz）

    //while循环执行
    while(ros::ok())
   {
    
    if(time_count<100) {time_count++;arm_wait();}
    loop_rate.sleep(); //延时等待
    //ros::spinOnce();
  }  
  return 0;
}






