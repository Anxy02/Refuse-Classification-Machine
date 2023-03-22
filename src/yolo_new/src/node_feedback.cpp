
#include <ros/ros.h>
#include <stdlib.h>
#include <stdio.h>
#include <std_msgs/Int8.h>
#include <std_msgs/String.h>

using namespace std;
ros::Publisher color_choose_pub;
ros::Publisher count_flag_pub;

int visual_follow_flag = 0,fk_demo_flag = 0,ik_demo_flag = 0,cartesian_flag = 0;
int face_follow_flag = 0,visual_func_flag = 0,ar_stack_flag = 0, ar_sort_flag = 0;//各功能开启标志位
std::string sw = "off";//标志位区分开关
std::string sw_sleep = "init";//休眠延时开关
/***********************************
函数功能：获取语音控制指令
***********************************/
void voice_word_callback(const std_msgs::String& msg)
{
	/***指令***/
	cout<<"############################################\n"<<endl;     

	std::string str1 = msg.data.c_str();    //取传入数据
	std::string str2 = "机械臂色块跟随";
	std::string str3 = "关闭色块跟随"; 
	std::string str4 = "机械臂人脸跟随";
	std::string str5 = "关闭人脸跟随";
	std::string str6 = "机械臂正解";
  	std::string str7 = "机械臂逆解";
  	std::string str8 = "打开AR标签";
	std::string str9 = "关闭AR标签";
	std::string str10 = "打开色块分拣";
	std::string str11 = "关闭色块分拣";
	std::string str12 = "打开色块码垛";
	std::string str13 = "关闭色块码垛";
	std::string str14 = "打开标签分拣";
	std::string str15 = "关闭标签分拣";
	std::string str16 = "打开标签码垛";
	std::string str17 = "关闭标签码垛";
	std::string str18 = "机械臂笛卡尔路径规划";
	std::string str19 = "机械臂休眠";
	std::string str20 = "跟随红色色块";
	std::string str21 = "跟随绿色色块";
	std::string str22 = "跟随蓝色色块";
	std::string str23 = "跟随黄色色块";
	std::string str24 = "跟随黑色色块";
/***********************************
指令：打开机械臂色块跟随

***********************************/
	if(str1 == str2)
	{ 
	   system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/voice_base/opening.wav");
	   system("rosnode kill /move_group");
	   system("rosnode kill /joint_state_publisher");
	   system("dbus-launch gnome-terminal -- roslaunch table_arm voi_color_tracking.launch");
	   cout<<">>>正在打开色块跟随"<<endl;
	}
/***********************************
指令：关闭机械臂色块跟随

***********************************/
	else if(str1 == str3)
	{  
	   system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/voice_base/OK.wav");
	   system("rosnode kill /color_follower");
	   system("rosnode kill /color_decetor");
	   system("rosnode kill /usb_cam");
	   system("rosnode kill /help_control");
	   system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/visual_follow/visual_close.wav");
	   system("dbus-launch gnome-terminal -- roslaunch table_arm voi_demo.launch");
	   cout<<">>>已经关闭色块跟随"<<endl;	
	}
/***********************************
指令：打开机械臂人脸跟随

***********************************/
	if(str1 == str4)
	{ 
	   system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/voice_base/opening.wav");
	   system("rosnode kill /move_group");
	   system("rosnode kill /joint_state_publisher");
	   system("dbus-launch gnome-terminal -- roslaunch table_arm voi_face_tracking.launch");
	   cout<<">>>正在打开人脸跟随"<<endl;
	}
/***********************************
指令：关闭机械臂人脸跟随

***********************************/
	else if(str1 == str5)
	{  
	   system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/voice_base/OK.wav");
	   system("rosnode kill /face_follower");
	   system("rosnode kill /face_detector");
	   system("rosnode kill /usb_cam");
	   system("rosnode kill /help_control");
	   system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/face_follow/face_close.wav");
	   system("dbus-launch gnome-terminal -- roslaunch table_arm voi_demo.launch");
	   cout<<">>>已经关闭人脸跟随"<<endl;	
	}
/***********************************
指令：打开机械臂正解

***********************************/
	if(str1 == str6)
	{ 
	   system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/voice_base/opening.wav");
	   system("dbus-launch gnome-terminal -- roslaunch table_arm voi_fk_demo.launch");
	   cout<<">>>正在打开机械臂正解"<<endl;
	}
/***********************************
指令：打开机械臂逆解

***********************************/
	if(str1 == str7)
	{ 
	   system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/voice_base/opening.wav");
	   system("dbus-launch gnome-terminal -- roslaunch table_arm voi_ik_demo.launch");
	   cout<<">>>正在打开机械臂逆解"<<endl;
	}
/***********************************
指令：打开色块分拣

***********************************/
	else if(str1 == str10)
	{ 
	   sw = "sort";
	   system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/voice_base/opening.wav");
	   system("dbus-launch gnome-terminal -- roslaunch table_arm voi_sort_color.launch");
	   cout<<">>>正在打开色块分拣"<<endl;	
	}
/***********************************
指令：关闭色块分拣
***********************************/
	else if(str1 == str11)
	{  
	   system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/voice_base/OK.wav");
	   system("rosnode kill /find_color");
	   system("rosnode kill /pick_color");
	   system("rosnode kill /usb_cam");
	   system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/visual_sort/sort_close.wav");
	   cout<<">>>已经关闭色块分拣"<<endl;	
	}
/***********************************
指令：打开色块码垛

***********************************/
	else if(str1 == str12)
	{  
	   sw = "stack";
	   system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/voice_base/opening.wav");
	   system("dbus-launch gnome-terminal -- roslaunch table_arm voi_stack_color.launch");
	   cout<<">>>正在打开色块码垛"<<endl;	
	}
/***********************************
指令：关闭色块码垛
***********************************/
	else if(str1 == str13)
	{  
	   system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/voice_base/OK.wav");
	   system("rosnode kill /find_color");
	   system("rosnode kill /stack_color");
	   system("rosnode kill /usb_cam");
	   system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/visual_stack/stack_close.wav");
	   cout<<">>>已经关闭色块码垛"<<endl;	
	}
/***********************************
指令：打开AR标签分拣
***********************************/
	else if(str1 == str14)
	{  
	   system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/voice_base/opening.wav");
	   system("dbus-launch gnome-terminal -- roslaunch table_arm voi_sort_ar.launch");
	   cout<<">>>正在打开AR标签分拣"<<endl;	
	}
/***********************************
指令：关闭AR标签分拣
***********************************/
	else if(str1 == str15)
	{  
	   system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/voice_base/OK.wav");
	   system("rosnode kill /camera_to_ar");
	   system("rosnode kill /base_to_camera");
	   system("rosnode kill /ar_track_alvar");
	   system("rosnode kill /pick_ar");
	   system("rosnode kill /usb_cam");
	   system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/label_sort/sort_close.wav");
	   cout<<">>>已经关闭AR标签分拣"<<endl;	
	}
/***********************************
指令：打开AR标签码垛

***********************************/
	else if(str1 == str16)
	{  
	   system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/voice_base/opening.wav");
	   system("dbus-launch gnome-terminal -- roslaunch table_arm voi_stack_ar.launch");
	   cout<<">>>正在打开AR标签码垛"<<endl;	
	}
/***********************************
指令：关闭AR标签码垛
***********************************/
	else if(str1 == str17)
	{  
	   system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/voice_base/OK.wav");
	   system("rosnode kill /camera_to_ar");
	   system("rosnode kill /base_to_camera");
	   system("rosnode kill /ar_track_alvar");
	   system("rosnode kill /pick_ar");
	   system("rosnode kill /usb_cam");
	   system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/label_stack/stack_close.wav");
	   cout<<">>>已经关闭AR标签码垛"<<endl;	
	}
/***********************************
指令：进行笛卡尔路径规划

***********************************/
	else if(str1 == str18)
	{ 
	   system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/voice_base/opening.wav");
	   system("dbus-launch gnome-terminal -- roslaunch table_arm voi_cartesian_demo.launch");
	   cout<<">>>正在进行笛卡尔路径规划"<<endl;
	}

/***********************************
指令：机械臂休眠
动作：无动作
***********************************/
    else if(str1 == str19)
  {
  	if (sw_sleep == "off")
  	{
  		sleep(1);
  	}
  	sw_sleep = "on";
    system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/voice_base/sleep.wav");
    sw_sleep = "init";        
    cout<<">>>机械臂已休眠"<<endl;
  }

/***********************************
指令：选择红色色块

***********************************/
	else if(str1 == str20)
	{ 
	   system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/voice_base/OK.wav");
	   std_msgs::Int8 color_flag_msg;
	   color_flag_msg.data = 1;
	   color_choose_pub.publish(color_flag_msg);
	   cout<<">>>选择红色色块"<<endl;
	}
/***********************************
指令：选择绿色色块

***********************************/
	else if(str1 == str21)
	{ 
	   system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/voice_base/OK.wav");
	   std_msgs::Int8 color_flag_msg;
	   color_flag_msg.data = 2;
	   color_choose_pub.publish(color_flag_msg);
	   cout<<">>>选择绿色色块"<<endl;
	}
/***********************************
指令：选择蓝色色块

***********************************/
	else if(str1 == str22)
	{ 
	   system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/voice_base/OK.wav");
	   std_msgs::Int8 color_flag_msg;
	   color_flag_msg.data = 3;
	   color_choose_pub.publish(color_flag_msg);
	   cout<<">>>选择蓝色色块"<<endl;
	}
/***********************************
指令：选择黄色色块

***********************************/
	else if(str1 == str23)
	{ 
	   system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/voice_base/OK.wav");
	   std_msgs::Int8 color_flag_msg;
	   color_flag_msg.data = 4;
	   color_choose_pub.publish(color_flag_msg);
	   cout<<">>>选择黄色色块"<<endl;
	}
/***********************************
指令：选择黑色色块

***********************************/
	else if(str1 == str24)
	{ 
	   system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/voice_base/OK.wav");
	   std_msgs::Int8 color_flag_msg;
	   color_flag_msg.data = 5;
	   color_choose_pub.publish(color_flag_msg);
	   cout<<">>>选择黑色色块"<<endl;
	}
}
/**************************************************************************
函数功能：色块跟随开启成功标志位sub回调函数
入口参数：visual_follow_flag.msg  visualTracker.py
返回  值：无
**************************************************************************/
void visual_follow_flagCallback(std_msgs::Int8 msg)
{
	visual_follow_flag = msg.data;
	if(visual_follow_flag == 1)
	{
		system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/visual_follow/visual_open.wav");
		cout<<">>>色块跟随打开成功"<<endl;	
	}
		printf("%d\n",visual_follow_flag);
}
/**************************************************************************
函数功能：人脸跟随开启成功标志位sub回调函数
入口参数：face_follow_flag.msg  face_detector.py
返回  值：无
**************************************************************************/
void face_follow_flagCallback(std_msgs::Int8 msg)
{
	face_follow_flag = msg.data;
	
	if(face_follow_flag == 1)
	{
		system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/face_follow/face_open.wav");

		cout<<"人脸跟随打开成功"<<endl;
	}
	printf("%d\n",face_follow_flag);
}

/**************************************************************************
函数功能：机械臂正解开启成功标志位sub回调函数
入口参数：fk_demo_flag.msg  arm_demo/arm_fk_demo.cpp
返回  值：无
**************************************************************************/
void fk_flagCallback(std_msgs::Int8 msg)
{
	fk_demo_flag = msg.data;
	if(fk_demo_flag == 1)
	{
		system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/demo/fk_demo_over.wav");
		cout<<"机械臂正解打开成功"<<endl;
	}
		printf("%d\n",fk_demo_flag);
}

/**************************************************************************
函数功能：机械臂逆解开启成功标志位sub回调函数
入口参数：ik_demo_flag.msg  arm_demo/arm_ik_demo.cpp
返回  值：无
**************************************************************************/
void ik_flagCallback(std_msgs::Int8 msg)
{
	ik_demo_flag = msg.data;
	if(ik_demo_flag == 1)
	{
		system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/demo/ik_demo_over.wav");
		cout<<"机械臂逆解打开成功"<<endl;
	}
		printf("%d\n",ik_demo_flag);
}

/**************************************************************************
函数功能：色块功能开启成功标志位sub回调函数
入口参数：visual_func_flag.msg  find_color.py
返回  值：无
**************************************************************************/
void visual_func_flagCallback(std_msgs::Int8 msg)
{
	visual_func_flag = msg.data;
	if(visual_func_flag == 1 && sw == "sort")
	{
		if(sw_sleep == "on") 
		{
			sleep(1);
		}
		sw_sleep = "off";
		system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/visual_sort/sort_open.wav");
		sw_sleep = "init";
		cout<<">>>色块分拣打开成功"<<endl;	
		sw = "on";
		sw_sleep = "init";
	}
	else if (visual_func_flag == 1 && sw == "stack")
	{
		if(sw_sleep == "on") 
		{
			sleep(1);
		}
		sw_sleep = "off";
		system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/visual_stack/stack_open.wav");
		cout<<">>>色块码垛打开成功"<<endl;
		sw = "on";
		sw_sleep = "init";
		
	}
	printf("%d\n",visual_func_flag);		
}

/**************************************************************************
函数功能：AR标签分拣开启成功标志位sub回调函数
入口参数：ar_sort_flag.msg  visualTracker.py
返回  值：无
**************************************************************************/
void ar_sort_flagCallback(std_msgs::Int8 msg)
{
	ar_sort_flag = msg.data;
	if(ar_sort_flag == 1)
	{
		if(sw_sleep == "on") 
		{
			sleep(1);
		}
		sw_sleep = "off";
		system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/label_sort/sort_open.wav");
		cout<<">>>AR标签分拣打开成功"<<endl;
		sw_sleep = "init";	
	}
		printf("%d\n",ar_sort_flag);
}

/**************************************************************************
函数功能：AR标签码垛开启成功标志位sub回调函数
入口参数：ar_stack_flag.msg  visualTracker.py
返回  值：无
**************************************************************************/
void ar_stack_flagCallback(std_msgs::Int8 msg)
{
	ar_stack_flag = msg.data;
	if(ar_stack_flag == 1)
	{
		if(sw_sleep == "on") 
		{
			sleep(1);
		}
		sw_sleep = "off";
		system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/label_stack/stack_open.wav");
		cout<<">>>AR标签码垛打开成功"<<endl;
		sw_sleep = "init";	
	}
		printf("%d\n",ar_stack_flag);
}
/**************************************************************************
函数功能：笛卡尔路径规划开启成功标志位sub回调函数
入口参数：cartesian_flag.msg  arm_demo/cartesian_demo.cpp
返回  值：无
**************************************************************************/
void cartesian_flagCallback(std_msgs::Int8 msg)
{
	cartesian_flag = msg.data;
	if(cartesian_flag == 1)
	{
		system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/demo/cartesian_over.wav");
		cout<<"笛卡尔路径规划开启成功"<<endl;
	}
		printf("%d\n",cartesian_flag);
}

int main(int argc, char** argv)
{

	ros::init(argc, argv, "node_open");  //初始化节点  

	ros::NodeHandle nd; //初始化句柄

	ros::Subscriber voice_word_sub = nd.subscribe("voice_words",10,voice_word_callback); //订阅语音输入信息话题
	ros::Subscriber fk_demo_flag_sub = nd.subscribe("fk_demo_flag", 1, fk_flagCallback);//机械臂正解开启标志位订阅
	ros::Subscriber ik_demo_flag_sub = nd.subscribe("ik_demo_flag", 1, ik_flagCallback);//机械臂逆解开启标志位订阅
	ros::Subscriber ar_sort_flag_sub = nd.subscribe("ar_sort_flag", 1, ar_sort_flagCallback);//AR标签分拣开启标志位订阅
	ros::Subscriber ar_stack_flag_sub = nd.subscribe("ar_stack_flag", 1, ar_stack_flagCallback);//AR标签分拣开启标志位订阅
	ros::Subscriber cartesian_flag_sub = nd.subscribe("cartesian_flag", 1, cartesian_flagCallback);//笛卡尔路径规划开启标志位订阅
	ros::Subscriber visual_sort_flag_sub = nd.subscribe("visual_func_flag", 1, visual_func_flagCallback);//色块功能开启标志位订阅
	ros::Subscriber face_follow_flag_sub = nd.subscribe("face_follow_flag", 1, face_follow_flagCallback);//人脸跟随开启标志位订阅
	ros::Subscriber visual_follow_flag_sub = nd.subscribe("visual_follow_flag", 1, visual_follow_flagCallback);//色块跟随开启标志位订阅
	
	count_flag_pub = nd.advertise<std_msgs::Int8>("count_flag", 1);//命令词刷新标志位
	color_choose_pub = nd.advertise<std_msgs::Int8>("color_flag",1);//色块选择标志位
	
	int count = 0;//计数
	double rate = 2;
	ros::Rate loopRate(rate);

	while(ros::ok())
	{
		if(count == 24)//设定刷新命令词时间
		{
			std_msgs::Int8 count_flag_msg;
			count_flag_msg.data = 1;
			count_flag_pub.publish(count_flag_msg);
			count = 0;
		}
		count++;
		ros::spinOnce(); 
		loopRate.sleep();
	}

	return 0;
}

