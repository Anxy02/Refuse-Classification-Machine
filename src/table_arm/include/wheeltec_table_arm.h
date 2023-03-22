
#ifndef __WHEELTEC_ROBOT_H_
#define __WHEELTEC_ROBOT_H_
// 头文件
#include "ros/ros.h"
#include <iostream>
#include <string.h>
#include <string> 
#include <iostream>
#include <math.h>
#include <stdlib.h>    
#include <unistd.h>      
#include <sys/types.h>
#include <sys/stat.h>
#include <serial/serial.h>
#include <fcntl.h>          
#include <stdbool.h>
#include <tf/transform_broadcaster.h>
#include <std_msgs/String.h>
#include <std_msgs/Float32.h>
#include <nav_msgs/Odometry.h>
#include <geometry_msgs/Pose.h>
#include <geometry_msgs/Vector3.h>
#include <geometry_msgs/PoseWithCovarianceStamped.h>
#include <sensor_msgs/Imu.h>
#include <sensor_msgs/JointState.h>
#include <table_arm/color_ik_result.h>
#include <table_arm/arm_target_position.h>
#include <wheeltec_tracker_pkg/gesture.h>

using namespace std;
#define SEND_DATA_CHECK   1     //标志位，发送端做校验位
#define READ_DATA_CHECK   0     //标志位，接收端做校验位
#define FRAME_HEADER      0X7B  //帧头，和下位机一致
#define FRAME_TAIL  0X7D //帧尾
#define FRAME_HEADER_ARM      0XAA  //帧头，和下位机一致
#define FRAME_TAIL_ARM  0XBB //帧尾
#define RECEIVE_DATA_SIZE		24//下位机发过来的数据的长度
#define SEND_DATA_SIZE			16//ROS发给下位机的数据的长度 考虑到时效应短尽短
#define default_mode  1
#define follower 2
typedef struct _SEND_DATA_  
{
	    uint8_t tx[SEND_DATA_SIZE];
		float X_speed;	       
		float Y_speed;           
		float Z_speed;         
		unsigned char Frame_Tail;    //1个字节  帧尾 校验位 

}SEND_DATA;

//DATE：2020-5-31
//类，巧妙使用构造函数初始化数据和发布话题等
class turn_on_robot
{
	public:
		turn_on_robot(); //构造函数
		~turn_on_robot(); //析构函数
		void Control();//循环控制代码
		serial::Serial Stm32_Serial; //声明串口对象 
	private:
		/* /cmd_val topic call function 回调函数声明*/

		void joint_states_Callback(const sensor_msgs::JointState arm_joint);
		void face_joint_states_Callback(const table_arm::color_ik_result angle);
		void color_joint_states_Callback(const table_arm::color_ik_result color_angle);
		void gesture_joint_states_Callback(const wheeltec_tracker_pkg::gesture gesture_angle);
		void arm_teleop_Callback(const sensor_msgs::JointState arm_joint);
		/* Read/Write data from ttyUSB 串口和控制函数声明 */
        void init_joint_states();
		unsigned char Check_Sum(unsigned char Count_Number,unsigned char mode);//校验函数

		int serial_baud_rate;//波特率
		string usart_port_name, robot_frame_id, smoother_cmd_vel;
		ros::NodeHandle n;//创建句柄
		ros::Time _Now, _Last_Time;//时间相关
		float Sampling_Time; //采样时间
		ros::Subscriber joint_state_Sub,face_joint_state_Sub,color_joint_state_Sub,gesture_joint_state_Sub,arm_teleop_Sub;//初始化订阅者
		//ros::Publisher odom_publisher, imu_publisher, voltage_publisher,pose_publisher;//初始化3个发布者


        SEND_DATA Send_Data;  //发送结构体  Send_Data

};
#endif
