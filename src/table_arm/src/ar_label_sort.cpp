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
#include <std_msgs/Int8.h>
#include <std_msgs/Float32.h>
#include <std_msgs/String.h>
#include <moveit/move_group_interface/move_group_interface.h>
#include "ar_label_sort.h"

int ID=0;
int ar_sort_flag;
std::string arm_state="none";
int target_num=0; //夹取的目标标签号
float joint_target1=0,joint_target2=0,joint_target3=0; //赋值给moveit做正解的目标关节值
float ar_num77_target_data[3]={0},ar_num88_target_data[3]={0},ar_num99_target_data[3]={0}; //标签块的目标位置对应的关节运动弧度数组
float x_offset=0,y_offset=0; //x轴和y轴夹取位置微调的偏差参数，单位（米）
bool arm_success,hand_close_success,hand_open_success; //moveit正解计算（返回值）是否成功的标志位

int ar_sequence=1;    //夹取顺序
int sequence[3]={0};  //夹取顺序排序数组
int ar_confirmed_flag =0;  //启动夹取的标志位
int ar_num77_done=0,ar_num88_done=0,ar_num99_done=0;     //标签块是否已经夹取标志位
int ar_num77_ready=0,ar_num88_ready=0,ar_num99_ready=0;  //标签块位置确认标志位
int ar_num77_count=0,ar_num88_count=0,ar_num99_count=0;  //接收到该数据帧的回调函数次数
float auxiliary_angle;  //辅助角
float x_position=0,y_position=0;
float true_position_x=0,true_position_y=0; //标签块距离机械臂底座的真实坐标
float link_a=0,link_b=0,link_c=0,link_h=0; //机械参数
float base_angle=0;
float caculate_A,caculate_B,caculate_C,caculate_D,caculate_E,caculate_G,caculate_F,caculate_H; //计算逆解的参数
std::vector<double> joint_group_positions(5); //x轴和y轴夹取位置微调的偏差参数，单位（米）

ros::Publisher ar_sort_flag_pub;

//ar标签话题回调函数（获取ar标签的位置）
void visualization_marker_callback(const visualization_msgs::Marker &msg)
{ 
  tf::Quaternion  quat;
  tf::quaternionMsgToTF(msg.pose.orientation,quat);
  double roll,pitch,yaw;

  ID=msg.id;    //ar标签的号码 
  x_position=msg.pose.position.x; //ar标签返回的原始坐标
  y_position=msg.pose.position.y;

  tf::Matrix3x3(quat).getRPY(roll,pitch,yaw);   //四元数转欧拉角函数 
       if( (yaw>=0.785) && (yaw<2.355)  )  yaw=yaw-1.57;  //ar标签具有360°方向性，这里将四边的方向统一化
  else if( (yaw>=2.355) && (yaw<3.14)   )  yaw=yaw-3.14;
  else if( (yaw>=-3.14) && (yaw<-2.355) )  yaw=yaw+3.14;
  else if( (yaw>=-2.355)&& (yaw<-0.785) )  yaw=yaw+1.57;
  caculate_H=yaw; 

  true_position_x = x_position * 0.518+0.005 +x_offset; //ar标签的原始坐标转换成真实距离坐标（距离机械臂的基坐标）
  true_position_y = y_position * (-0.480) + 0.240 +y_offset; 

 //数学逆解，求解夹取到标签块需要运动的关节角度
  base_angle=acos((link_c-link_h)/link_a);  //计算机械臂夹爪可触底的关节基础角度
  caculate_A=link_a * sin(base_angle) +sin(auxiliary_angle)*link_c;      //计算逆解的参数
  caculate_B=link_a * cos(base_angle) +cos(auxiliary_angle)*link_c ; //计算逆解的参数
  caculate_E=atan(caculate_B/caculate_A); //计算逆解的参数
  caculate_C = sqrt(true_position_x*true_position_x+true_position_y*true_position_y) - link_b ; 
  caculate_D = acos ( caculate_C/sqrt(caculate_A*caculate_A + caculate_B*caculate_B ) );
  caculate_G = (caculate_E-caculate_D);
  caculate_F = atan(abs(true_position_x/true_position_y));
  if(true_position_x<0) caculate_F=caculate_F * -1 ;


  if(ID==77)  //根据ID判断不同的标签块 
  {
     if(ar_num77_ready== 0 )  
       {
         ar_num77_count++;
         ar_num77_target_data[0]=caculate_F;  //云台的目标角度
         ar_num77_target_data[1]=caculate_G;  //控制机械臂臂长的目标角度
         ar_num77_target_data[2]=caculate_H;  //控制夹取色块旋转的目标角度
         if(ar_num77_count>100) //前100帧的数据不使用
         {
           ar_num77_ready=2;
           ROS_INFO("ar_num77_target_is:(%4.2f)-(%4.2f)-(%4.2f)",ar_num77_target_data[0],ar_num77_target_data[1],ar_num77_target_data[2]);
         }
       }
  }  

  else if(ID==88)  //根据ID判断不同的标签块
  {
     if(ar_num88_ready== 0 )  
       {
         ar_num88_count++;
         ar_num88_target_data[0]=caculate_F;  //云台的目标角度
         ar_num88_target_data[1]=caculate_G;  //控制机械臂臂长的目标角度
         ar_num88_target_data[2]=caculate_H;  //控制夹取色块旋转的目标角度
         if(ar_num88_count>100) //前100帧的数据不使用
         {
           ar_num88_ready=2;
           ROS_INFO("ar_num88_target_is:(%4.2f)-(%4.2f)-(%4.2f)",ar_num88_target_data[0],ar_num88_target_data[1],ar_num88_target_data[2]);
         }
       }
  }  

  else if(ID==99)  //根据ID判断不同的标签块
  {
     if(ar_num99_ready== 0 )  
       {
         ar_num99_count++;
         ar_num99_target_data[0]=caculate_F;  //云台的目标角度
         ar_num99_target_data[1]=caculate_G;  //控制机械臂臂长的目标角度
         ar_num99_target_data[2]=caculate_H;  //控制夹取色块旋转的目标角度
         if(ar_num99_count>100) //前100帧的数据不使用
         {
           ar_num99_ready=2;
           ROS_INFO("ar_num99_target_is:(%4.2f)-(%4.2f)-(%4.2f)",ar_num99_target_data[0],ar_num99_target_data[1],ar_num99_target_data[2]);
         }
       }
  }  

}


int main(int argc, char **argv)
{ 
    ros::init(argc, argv, "color_sort_execute");
    ros::NodeHandle n;
    ros::NodeHandle nprivate("~");

    nprivate.param<float>("/ar_x_offset", x_offset, 0.0);
    nprivate.param<float>("/ar_y_offset", y_offset, 0.0);
    nprivate.param<float>("/auxiliary_angle", auxiliary_angle, 0.157);
    nprivate.param<float>("/link_a", link_a, 0.105);
    nprivate.param<float>("/link_b", link_b, 0.100);
    nprivate.param<float>("/link_c", link_c, 0.175);
    nprivate.param<float>("/link_h", link_h, 0.105);

    ros::AsyncSpinner spinner(1);
    spinner.start();

    ar_sort_flag_pub=n.advertise<std_msgs::Int8>("ar_sort_flag",1);

    moveit::planning_interface::MoveGroupInterface arm("arm");  
    moveit::planning_interface::MoveGroupInterface hand("hand"); 
    moveit::planning_interface::MoveGroupInterface::Plan my_plan; 

    //arm.setGoalJointTolerance(0.01);
    //arm.setMaxAccelerationScalingFactor(0.2);
    //arm.setMaxVelocityScalingFactor(0.5);
    arm.setNamedTarget("arm_look"); arm.move(); sleep(1);    //机械臂运动到观测ar标签的位置
    hand.setNamedTarget("hand_open"); hand.move(); sleep(1); //机械爪张开
    std_msgs::Int8 ar_sort_flag_msg;
    ar_sort_flag_msg.data = 1;
    ar_sort_flag_pub.publish(ar_sort_flag_msg);
    
    ros::Subscriber visualization_marker_sub=n.subscribe("visualization_marker",10,visualization_marker_callback); //订阅机械臂的运动状态

    ROS_INFO("ar_label_sort_execute_node init successful");
    ROS_INFO("finding ar_label ,waitting....");

    while(ros::ok())
   {
      ar_gripping_sequence(); //ar标签块抓取顺序判断函数
      if( arm_state=="ready" )
      {
        arm_state="working";
        ROS_INFO("joint_target_is    :(%4.2f)-(%4.2f)-(%4.2f)",joint_target1,joint_target2,joint_target3);
        ROS_INFO("ar_label_sequence_is  :(%d)",target_num);
        //关节的目标旋转角度赋值
        joint_group_positions[0] =  joint_target1;
        joint_group_positions[1] =  -1.57-joint_target2+base_angle;
        joint_group_positions[2] =  joint_target2-base_angle;
        joint_group_positions[3] =  -1.57+joint_target2+auxiliary_angle;
        joint_group_positions[4] =  joint_target3;
        arm.setJointValueTarget(joint_group_positions);  //输入目标关节数组
       // while(!arm_success)
        //{
          arm_success = ((arm.plan(my_plan) == moveit::planning_interface::MoveItErrorCode::SUCCESS));  //规划路径

          //ROS_INFO_NAMED("fk_demo_plan",success ? "plan_success" : "plan_False");
          arm.execute(my_plan),sleep(1); //如果规划成功则执行
        //}
        //arm_success=false; 
                
        hand.setNamedTarget("hand_close");    //机械爪夹取
        while( !hand_close_success )  //判断是否规划成功，如果不成功则继续规划
        { 
           hand_close_success = ((hand.move() == moveit::planning_interface::MoveItErrorCode::SUCCESS));  //规划路径
           sleep(1);
        }
        hand_close_success=false;
 
        arm.setNamedTarget("arm_look");   arm.move();  sleep(1);      //机械臂运动到观测色块的位置
        arm.setNamedTarget("ar_put_interval");  arm.move();  sleep(1);   //机械臂臂身运动到放置色块的预位置后，再放置色块
        arm_put(target_num); //根据ar标签的号码将标签块放置到对应位
      } 
    ros::spinOnce();
  }
  ros::shutdown(); 
  return 0;
}

//一个完整的放置动作
void arm_put(int num)
{
    moveit::planning_interface::MoveGroupInterface arm("arm");
    moveit::planning_interface::MoveGroupInterface hand("hand");
    //arm.setGoalJointTolerance(0.01);
    //arm.setMaxAccelerationScalingFactor(0.2);
    //arm.setMaxVelocityScalingFactor(0.6);
    //根据r标签的号码判断放置位置
    if (num == 77)       {arm.setNamedTarget("77_put"); arm.move();  sleep(1); }
    else if (num == 88)  {arm.setNamedTarget("88_put"); arm.move();  sleep(1); }
    else if (num == 99)  {arm.setNamedTarget("99_put"); arm.move();  sleep(1); ROS_INFO("sorting ar_label is done");}
   
    hand.setNamedTarget("hand_half_open");  //机械爪 张开
    while( !hand_open_success ) //判断是否规划成功，如果不成功则继续规划
    { 
       hand_open_success = ((hand.move() == moveit::planning_interface::MoveItErrorCode::SUCCESS)); //规划路径
       sleep(1);
    }
    hand_open_success=false;

    arm.setNamedTarget("ar_put_interval"); arm.move();  sleep(1); //机械臂臂身运动到放置ar标签块的预位置
    arm.setNamedTarget("arm_look");     arm.move();  sleep(1); //机械臂运动到观测ar标签的位置
    hand.setNamedTarget("hand_open");  //机械爪张开
    while( !hand_open_success ) //判断是否规划成功，如果不成功则继续规划
    { 
       hand_open_success = ((hand.move() == moveit::planning_interface::MoveItErrorCode::SUCCESS)); //规划路径
       sleep(1);
    }
    hand_open_success=false;

    arm_state="ready";
    ar_sequence=ar_sequence+1; //放置完成后，开始夹取下一个ar标签
}

//ar标签块抓取顺序判断函数
int ar_gripping_sequence()
{
  float arry[3]={0},between=0;
  int i=0,j=0;
    //这个if条件下的内容是对ar标签距离机械臂的前后位置做夹取的排序，先夹取最近的ar标签块
  if((ar_num77_ready==2)&&(ar_num88_ready==2)&&(ar_num99_ready==2)&&(ar_confirmed_flag == 0)) 
  {
    ar_confirmed_flag = 1;
    arry[0]= ar_num77_target_data[1];
    arry[1]= ar_num88_target_data[1];
    arry[2]= ar_num99_target_data[1];

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
   //排序后再对应每个标签块的顺序 
   for(j=0;j<3;j++) {  if(ar_num77_target_data[1] == arry[j]) sequence[0]=j+1; }
   for(j=0;j<3;j++) {  if(ar_num88_target_data[1] == arry[j]) sequence[1]=j+1; }
   for(j=0;j<3;j++) {  if(ar_num99_target_data[1] == arry[j]) sequence[2]=j+1; }

   ROS_INFO("sequence_is:(%d)-(%d)-(%d)",sequence[0],sequence[1],sequence[2]);
   //预防标签块同距离
   if((sequence[0]==sequence[1])||(sequence[1]==sequence[2])||(sequence[0]==sequence[2])) 
   {  ar_num77_ready=0; ar_num88_ready=0; ar_num99_ready=0; ar_confirmed_flag = 0;   
      ROS_INFO("data is error");
   }
 
  }

  if( ar_confirmed_flag == 1) 
  {//根据ar_sequence决定夹取顺序
     if(ar_sequence==sequence[0]&&ar_num77_done==0) 
       {
        joint_target1=ar_num77_target_data[0],joint_target2=ar_num77_target_data[1],joint_target3=ar_num77_target_data[2],target_num=77,ar_num77_done=1;//关节目标值赋值
         arm_state="ready";
         ROS_INFO("sorting ar label is: 77");
       return 0;
       }
     else if (ar_sequence==sequence[1]&&ar_num88_done==0)
       {
         joint_target1=ar_num88_target_data[0],joint_target2=ar_num88_target_data[1],joint_target3=ar_num88_target_data[2],target_num=88,ar_num88_done=1;//关节目标值赋值
         arm_state="ready";
         ROS_INFO("sorting ar label is: 88");
       return 0;
       }
     else if (ar_sequence==sequence[2]&&ar_num99_done==0)
       {
         joint_target1=ar_num99_target_data[0],joint_target2=ar_num99_target_data[1],joint_target3=ar_num99_target_data[2]  ,target_num=99,ar_num99_done=1;//关节目标值赋值
         arm_state="ready";
         ROS_INFO("sorting ar label is: 99");
       return 0;
       }

     else { arm_state="none"; }
  }
  
}


