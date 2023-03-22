#include "voice_control.h"
#include <iostream>
#include <std_msgs/Int8.h>
#include <cstdlib>
#include <ctime>

#define random(a,b) (rand() % (b-a)+ a + 1)
int game_mode = 0,find_guess = 0;
std::string arm_state="ready",arm_action="noon";
std::vector<double> joint_group_positions(5); //关节正解运动用到的关机目标运动数组
ros::Publisher joints_state_publisher;  //初始化关节目标角度的发布者
ros::Publisher guess_flag_publisher;//猜方位标志位
int action_count =0;  //动作执行时用到的计数变量
float patrol_init_value=0,nod_init_value=0,dance_init_value=0;
int voice_target=0,voice_follower_flag=0,voice_control_flag=0; //控制逻辑相关标志位
int patrol_flag=0,nod_flag=0,dance_flag=0;  //控制逻辑相关标志位
float joint_target1=0,joint_target2=0,joint_target3=0,joint_target4=0,joint_target5=0; //赋值给moveit做正解的目标关节值
bool arm_success,hand_close_success,hand_open_success; //moveit正解计算（返回值）是否成功的标志位
int voice_flag = 0;  //语音开启标志位
int count_flag = 0;  //命令词刷新标志位

void Direction();
void guess_game();
using namespace std;
/***********************************
函数功能：机械臂巡视的执行函数
***********************************/
void arm_patrol(void)
{
   static float joint_step=0.02;  //机械臂运动的步进值
   sensor_msgs::JointState arm_joint_msg;  //定义一个机械臂控制信息的消息数据类型
   ros::Time pub_time=ros::Time::now();  //获取当前的ROS时间
   if  (action_count>=0 && action_count<70) patrol_init_value=patrol_init_value-joint_step; //执行的第1段动作
   else if(action_count>=70 && action_count<210)  patrol_init_value=patrol_init_value+joint_step; //执行的第2段动作
   else if (action_count>=210) patrol_init_value=patrol_init_value-joint_step; //执行的第3段动作
      //输入当前的ros时间
      arm_joint_msg.header.stamp=pub_time;
      //输入机械臂臂身的目标关节角度（单位：弧度）
      arm_joint_msg.position.push_back(patrol_init_value);
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

    if(action_count>280)  //执行完成后将标志位置零
    {
      patrol_flag=0;
      action_count=0;
      patrol_init_value=0;
      arm_state="ready";
      if (game_mode == 1)
      {
        system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/guess_game/guess.wav");
      }
    }
}
/***********************************
函数功能：机械臂点头的执行函数
***********************************/
void arm_nod(void)
{
   static float joint_step=0.04; //机械臂运动的步进值
   sensor_msgs::JointState arm_joint_msg;  //定义一个机械臂控制信息的消息数据类型
   ros::Time pub_time=ros::Time::now();   //获取当前的ROS时间
   if  (action_count>=0 && action_count<20)      nod_init_value=nod_init_value-joint_step; //执行的第1段动作
   else if(action_count>=20 && action_count<40)  nod_init_value=nod_init_value+joint_step; //执行的第2段动作
   else if(action_count>=40 && action_count<60)  nod_init_value=nod_init_value-joint_step; //执行的第3段动作
   else if (action_count>=60)                    nod_init_value=nod_init_value+joint_step; //执行的第4段动作
      //输入当前的ros时间
      arm_joint_msg.header.stamp=pub_time;
      //输入机械臂臂身的目标关节角度（单位：弧度）
      arm_joint_msg.position.push_back(0);
      arm_joint_msg.position.push_back(0);
      arm_joint_msg.position.push_back(nod_init_value);
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
 
    if(action_count>80) //执行完成后将标志位置零
    {
      nod_flag=0;
      action_count=0;
      nod_init_value=0;
      arm_state="ready";
      if (game_mode == 2)
      {
        system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/guess_game/guess.wav");
      }
    } 
}
/***********************************
函数功能：机械臂跳舞的执行函数
***********************************/
void arm_dance(void)
{
   static float joint_step=0.05; //机械臂运动的步进值
   sensor_msgs::JointState arm_joint_msg;  //定义一个机械臂控制信息的消息数据类型
   ros::Time pub_time=ros::Time::now();   //获取当前的ROS时间
   if  (action_count>=0 && action_count<20)       dance_init_value=dance_init_value-joint_step; //执行的第1段动作
   else if(action_count>=20 && action_count<60)   dance_init_value=dance_init_value+joint_step; //执行的第2段动作
   else if(action_count>=60 && action_count<100)  dance_init_value=dance_init_value-joint_step; //执行的第3段动作
   else if(action_count>=100 && action_count<140) dance_init_value=dance_init_value+joint_step; //执行的第4段动作
   else if(action_count>=140 )                    dance_init_value=dance_init_value-joint_step; //执行的第5段动作
      //输入当前的ros时间
      arm_joint_msg.header.stamp=pub_time;
      //输入机械臂臂身的目标关节角度（单位：弧度）
      arm_joint_msg.position.push_back(0);
      arm_joint_msg.position.push_back(-dance_init_value);
      arm_joint_msg.position.push_back(dance_init_value); 
      arm_joint_msg.position.push_back(-1.57);
      arm_joint_msg.position.push_back(dance_init_value);
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
      dance_flag=0;
      action_count=0;
      dance_init_value=0;
      arm_state="ready";
      if (game_mode == 3)
      {
        system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/guess_game/guess.wav");
      }
    }
}
/***********************************
函数功能：猜谜小游戏
***********************************/
void guess_game()
{
  srand((int)time(0));
  game_mode = random(0, 3);
  if (game_mode == 1)
  {
    patrol_flag = 1;
  }
  else if (game_mode == 2)
  {
    nod_flag = 1;
  }
  else if (game_mode == 3)
  {
    dance_flag = 1;
  }
}
/***********************************
函数功能：获取语音唤醒角度
***********************************/
void mic_awak_angle_callback(const std_msgs::Int32 &msg)
{
   voice_target=msg.data;
   ROS_INFO("voice_target_is    :(%d)",voice_target);
   //机械臂正方向180度朝向
   if((voice_target>=60)&&(voice_target<=240))
   {
    joint_target1=0.0174*(voice_target-150);
    joint_target3=-1.57;
   } 
  //机械臂反方向180度朝向
   else   
   {
     if((voice_target>240)&&(voice_target<=360))
      {
         joint_target1=0.0174*(voice_target-150)-3.14;
         joint_target3=1.57; 
      }
      else
      {
         joint_target1=0.0174*(voice_target)+0.785; 
         joint_target3=1.57;
      }
   }
   voice_follower_flag=1;
   joint_target2=0,joint_target4=0,joint_target5=0;
}
/***********************************
函数功能：获取语音控制指令
***********************************/
void voice_words_callback(const std_msgs::String& msg)
{
	/***指令***/
	std::string str1 = msg.data.c_str();    //取传入数据
	std::string str2 = "机械臂放置";
	std::string str3 = "机械臂抓取"; 
	std::string str4 = "机械臂观察";
	std::string str5 = "机械臂复位";
	std::string str6 = "机械臂巡视";
	std::string str7 = "机械臂跳舞";
  std::string str8 = "机械臂点头";
	std::string str12 = "失败5次";
	std::string str13 = "失败10次";
	std::string str14 = "机械臂唤醒"; 
  std::string str15 = "来玩猜谜游戏";
  std::string str16 = "小微在巡视";
  std::string str17 = "小微在点头";
  std::string str18 = "小微在跳舞";
  std::string str19 = "来玩捉迷藏游戏";
  std::string str20 = "结束游戏";


/***********************************
指令：机械臂放置
动作：夹爪张开
***********************************/
	if(str1 == str2)
	{
         voice_control_flag=1;
         arm_action="hand_open";
   system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/voice_base/hand_open.wav");
   cout<<">>>好的：机械臂放置"<<endl;
	}
/***********************************
指令：机械臂抓取
动作：夹爪闭合
***********************************/
	else if(str1 == str3)
	{
         voice_control_flag=1;
         arm_action="hand_close";
   system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/voice_base/hand_close.wav");
   cout<<">>>好的：机械臂抓取"<<endl;	
	}
/***********************************
指令：机械臂观察
动作：运动到预设位置
***********************************/
	else if(str1 == str4)
	{
          voice_control_flag=2;
          arm_action="arm_look";
   system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/voice_base/arm_look.wav");
   cout<<">>>好的：机械臂观察"<<endl;
	}
/***********************************
指令：机械臂复位
动作：运动到预设位置
***********************************/
	else if(str1 == str5)
	{         
         voice_control_flag=2;
         arm_action="arm_home";
   system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/voice_base/arm_home.wav");
   cout<<">>>好的：机械臂复位"<<endl;
	}
/***********************************
指令：机械臂巡视
动作：巡视
***********************************/
	else if(str1 == str6)
	{         
         voice_control_flag=3;
         arm_action="arm_patrol";
   system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/voice_base/arm_patrol.wav");
   cout<<">>>好的：机械臂巡视"<<endl;
	}
/***********************************
指令：机械臂跳舞
动作：跳舞
***********************************/
  else if(str1 == str7)
  {         
         voice_control_flag=5;
         arm_action="arm_dance";
   system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/voice_base/arm_dance.wav");
   cout<<">>>好的：机械臂跳舞"<<endl;
  }
/***********************************
指令：机械臂点头
动作：点头
***********************************/
	else if(str1 == str8)
	{         
         voice_control_flag=4;
         arm_action="arm_nod";
   system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/voice_base/arm_nod.wav");
	 cout<<">>>好的：机械臂点头"<<endl;
	}

/***********************************
指令：无
动作：无动作
***********************************/
  else if(str1 == str12) 
  {         
    cout<<">>>您已经连续【输入空指令or识别失败】5次，累计达15次自动进入休眠，输入有效指令后计数清零"<<endl;
  }
/***********************************
指令：无
动作：无动作
***********************************/
  else if(str1 == str13)
  {         
    cout<<">>>您已经连续【输入空指令or识别失败】10次，累计达15次自动进入休眠，输入有效指令后计数清零"<<endl;
  }
/***********************************
辅助指令：机械臂唤醒
动作：用户界面打印提醒
***********************************/
	else if(str1 == str14)
	{
    system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/voice_base/awake.wav");
	  cout<<">>>已唤醒，请说语音指令"<<endl;
	}
/***********************************
指令：无
动作：无动作
***********************************/
  else if(str1 == str15)
  { 
    system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/guess_game/sure.wav");
    sleep(1.5);
    guess_game(); 
    sleep(2);      
    cout<<">>>请说出猜谜答案: "<<endl;
    cout<<">>>小微在巡视|小微在点头|小微在跳舞 "<<endl;
  }

  else if(str1 == str16)
  { 
    if(game_mode == 1)
    {
      system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/guess_game/patrol.wav");
       game_mode = 0;
    }
    else
    {
      system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/guess_game/guess_wrong.wav");
    }
  }

  else if(str1 == str17)
  { 
    if(game_mode == 2)
    {
      system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/guess_game/nod.wav");
       game_mode = 0;
    }
    else
    {
      system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/guess_game/guess_wrong.wav");
    }
  }

  else if(str1 == str18)
  { 
    if(game_mode == 3)
    {
      system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/guess_game/dance.wav");
      game_mode = 0;
    }
    else
    {
      system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/guess_game/guess_wrong.wav");
    }
  }
  else if(str1 == str19)
  {
         std_msgs::Int8 guess_flag_msg;
         guess_flag_msg.data=1;
         guess_flag_publisher.publish(guess_flag_msg);
         find_guess = 1;         
   system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/guess_game/let_me_guess.wav");
   cout<<">>>命令词：猜猜我在哪"<<endl;
  }

/***********************************
指令：无
动作：无动作
***********************************/
  else if(str1 == str20)
  {         
   system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/voice_base/OK.wav");
   std_msgs::Int8 guess_flag_msg;
   guess_flag_publisher.publish(guess_flag_msg);
   find_guess = 0;
  }

}

/**************************************************************************
函数功能：寻找语音开启成功标志位sub回调函数
入口参数：voice_flag_msg  xf/voice_control.cpp
返回  值：无
**************************************************************************/
void voice_flag_Callback(std_msgs::Int8 msg)
{
  voice_flag = msg.data;
  if(voice_flag == 1)
  {
    system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/voice_base/vioce_control.wav");
    cout<<"语音打开成功"<<endl;
  }

}

/**************************************************************************
函数功能：命令词刷新标志位sub回调函数
入口参数：count_flag_msg  node_feedback.cpp
返回  值：无
**************************************************************************/
void count_flag_Callback(std_msgs::Int8 msg)
{
  count_flag = msg.data;
  if(count_flag == 1 && game_mode == 0 &&find_guess == 0)
  {
    Direction();
  }

}
/**************************************************************************
函数功能：打印可执行的语音指令
返回  值：无
**************************************************************************/
void Direction()
{
  cout<<"\n###########################################"<<endl; 
  cout<<">>>输入以下语音指令控制机械臂吧:"<<endl; 
  cout<<">>>机械臂放置"<<endl;
  cout<<">>>机械臂抓取"<<endl;
  cout<<">>>机械臂观察"<<endl;
  cout<<">>>机械臂复位"<<endl;
  cout<<">>>机械臂巡视"<<endl;
  cout<<">>>机械臂跳舞"<<endl;  
  cout<<">>>机械臂点头"<<endl;
  cout<<">>>机械臂休眠"<<endl;
  cout<<">>>机械臂正解"<<endl;
  cout<<">>>机械臂逆解"<<endl;
  cout<<">>>机械臂笛卡尔路径规划"<<endl;
  cout<<">>>(打开/关闭)标签分拣"<<endl;
  cout<<">>>(打开/关闭)色块分拣"<<endl;
  cout<<">>>(打开/关闭)标签码垛"<<endl;
  cout<<">>>(打开/关闭)色块码垛"<<endl;
  cout<<">>>(机械臂/关闭)人脸跟随"<<endl;
  cout<<">>>(机械臂/关闭)色块跟随"<<endl;
  cout<<"↓色块跟随打开后可以进行色块选择↓"<<endl;
  cout<<">>>跟随(红色/绿色/蓝色/黄色/黑色)色块"<<endl;
  cout<<">>>来玩猜谜游戏"<<endl;
  cout<<">>>来玩捉迷藏游戏"<<endl;
  cout<<"############################################\n"<<endl;     
}
/***********************************
  主函数
***********************************/
int main(int argc, char **argv)
{ 
    ros::init(argc, argv, "voice_follower"); 
    ros::NodeHandle n;
 
    ros::AsyncSpinner spinner(1);
    spinner.start();

    moveit::planning_interface::MoveGroupInterface arm("arm");   //初始化moveit控制规划组
    moveit::planning_interface::MoveGroupInterface hand("hand");  //初始化moveit控制规划组
    moveit::planning_interface::MoveGroupInterface::Plan my_plan;  //机械臂正解时用到的路径
  
    //arm.setGoalJointTolerance(0.01);
    //arm.setMaxAccelerationScalingFactor(0.2);
    //arm.setMaxVelocityScalingFactor(0.5);
    arm.setNamedTarget("voice_control_wait"); arm.move(); sleep(1);    //机械臂运动到预设位置
    ros::Subscriber voice_words_sub = n.subscribe("voice_words",10,voice_words_callback); //订阅语音输入信息话题
    ros::Subscriber mic_awak_angle_sub=n.subscribe("mic/awake/angle",10,mic_awak_angle_callback); //订阅语音唤醒角度话题
    ros::Subscriber voice_flag_sub = n.subscribe("voice_flag", 1, voice_flag_Callback);//订阅语音开启标志位话题
    ros::Subscriber count_flag_sub = n.subscribe("count_flag", 1, count_flag_Callback);//命令词刷新标志位话题
    joints_state_publisher=n.advertise<sensor_msgs::JointState>("/move_group/fake_controller_joint_states",10);//往控制机械臂运动的话题发布信息
    guess_flag_publisher=n.advertise<std_msgs::Int8>("guess_flag",1);
    //初始化过程打印一遍可执行的语音指令
    Direction();

    ros::Rate loop_rate(40); //设置程序执行频率（单位：hz）

    //while循环执行
    while(ros::ok())
   {
      if( voice_follower_flag==1 && arm_state=="ready") //语音唤醒机械臂指向控制
      {
        arm_state="working"; 
        //关节的目标旋转角度赋值  
        joint_group_positions[0] =  joint_target1;
        joint_group_positions[1] =  joint_target2;
        joint_group_positions[2] =  joint_target3;
        joint_group_positions[3] =  joint_target4; 
        joint_group_positions[4] =  joint_target5;
        arm.setJointValueTarget(joint_group_positions);  //输入目标关节数组 
        arm_success = ((arm.plan(my_plan) == moveit::planning_interface::MoveItErrorCode::SUCCESS));  //规划路径

        //ROS_INFO_NAMED("fk_demo_plan",success ? "plan_success" : "plan_False");
        arm.execute(my_plan),sleep(1); //如果规划成功则执行
        if(find_guess == 1)
        {
          system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/guess_game/find_you.wav"); 

        }
        //arm_success=false;      
        voice_follower_flag=0;
        arm_state="ready";        
      } 
    
      else if( (voice_control_flag==1||voice_control_flag==2) && arm_state=="ready")//机械臂预设位置控制
      {
        arm_state="working"; 
        if(voice_control_flag==1)
        { 
          hand.setNamedTarget(arm_action); hand.move(); sleep(1);    
          voice_control_flag=0;
          arm_state="ready";
        }
        else if(voice_control_flag==2)
        {
          arm.setNamedTarget(arm_action); arm.move(); sleep(1);
          voice_control_flag=0;
          arm_state="ready";
        }      
      } 

       else if(voice_control_flag==3 &&  arm_state=="ready") //机械臂巡视
      {
          if(arm_action=="arm_patrol")  
           { 
             patrol_flag=1;
             voice_control_flag=0;
           }
       }

       else if(voice_control_flag==4 &&  arm_state=="ready")  //机械臂点头
      {
          if(arm_action=="arm_nod")  
           { 
             nod_flag=1;
             voice_control_flag=0;
           }
       }

       else if(voice_control_flag==5 &&  arm_state=="ready")  //机械臂跳舞
      {
          if(arm_action=="arm_dance")  
           { 
             dance_flag=1;
             voice_control_flag=0;
           }
       }

      if(patrol_flag==1)
     {
       arm_patrol(); //执行机械臂巡视
       action_count++;
     } 

      if(nod_flag==1)
     {
       arm_nod(); //执行机械臂点头
       action_count++;
     }  

      if(dance_flag==1)
     {
       arm_dance(); //执行机械臂跳舞 
       action_count++;
     } 
    loop_rate.sleep(); //延时等待
    ros::spinOnce();
  }  
  return 0;
}






