#include "wheeltec_table_arm.h"
sensor_msgs::Imu Mpu6050;//实例化IMU对象
/**************************************
Date: May 31, 2020
Function: 主函数，ROS初始化，通过turn_on_robot类创建Robot_control对象并自动调用构造函数初始化
***************************************/
int main(int argc, char** argv)
{
  ros::init(argc, argv, "wheeltec_table_arm");//ROS初始化 并设置节点名称，可修改
  ROS_INFO("wheeltec_table_arm node has turned on ");//显示状态
  turn_on_robot Robot_Control; //实例化一个对象
  Robot_Control.Control();  //循环执行数据采集和发布topic等操作
  return 0;
} 


void turn_on_robot::joint_states_Callback(const sensor_msgs::JointState arm_joint)
{
  //ROS_INFO_STREAM("ok");//ready显示状态
  short  transition;  //中间变量
  Send_Data.tx[0]=FRAME_HEADER_ARM;//帧头 固定值

  transition=0;
  transition = arm_joint.position[0]*1000; //将浮点数放大一千倍，简化传输
  //ROS_INFO("%x",arm_joint.position[0]); 
  Send_Data.tx[2] = transition;     //取数据的低8位
  Send_Data.tx[1] = transition>>8;  //取数据的高8位
 
  transition=0;
  transition = arm_joint.position[1]*1000; //将浮点数放大一千倍，简化传输
  Send_Data.tx[4] = transition;     //取数据的低8位
  Send_Data.tx[3] = transition>>8;  //取数据的高8位

  transition=0;
  transition = arm_joint.position[2]*1000; //将浮点数放大一千倍，简化传输
  Send_Data.tx[6] = transition;     //取数据的低8位
  Send_Data.tx[5] = transition>>8;  //取数据的高8位
 
  transition=0;
  transition = arm_joint.position[3]*1000; //将浮点数放大一千倍，简化传输
  Send_Data.tx[8] = transition;     //取数据的低8位
  Send_Data.tx[7] = transition>>8;  //取数据的高8位

  transition=0;
  transition = arm_joint.position[4]*1000; //将浮点数放大一千倍，简化传输
  Send_Data.tx[10] = transition;     //取数据的低8位
  Send_Data.tx[9] = transition>>8;  //取数据的高8位
 
  transition=0;
  transition = arm_joint.position[5]*1000; //将浮点数放大一千倍，简化传输
  Send_Data.tx[12] = transition;     //取数据的低8位
  Send_Data.tx[11] = transition>>8;  //取数据的高8位

  Send_Data.tx[13] = default_mode;

  Send_Data.tx[14]=Check_Sum(14,SEND_DATA_CHECK);//帧尾校验位，规则参见Check_Sum函数
  Send_Data.tx[15]=FRAME_TAIL_ARM;  //数据的最后一位是帧尾（固定值）

  try
  {
  Stm32_Serial.write(Send_Data.tx,sizeof (Send_Data.tx)); //向串口发数据
  //ROS_INFO_STREAM("New control command");//显示受到了新的控制指令  
  }
  catch (serial::IOException& e)
  {
    ROS_ERROR_STREAM("Unable to send data through serial port"); //如果try失败,打印错误信息
  }
}

void turn_on_robot::init_joint_states()
{
  ROS_INFO_STREAM("arm is ready");//ready显示状态
  short  transition;  //中间变量
  Send_Data.tx[0]=FRAME_HEADER_ARM;//帧头 固定值

  transition=0;
  transition = 0*1000; //将浮点数放大一千倍，简化传输
  //ROS_INFO("%x",arm_joint.position[0]); 
  Send_Data.tx[2] = transition;     //取数据的低8位
  Send_Data.tx[1] = transition>>8;  //取数据的高8位
 
  transition=0;
  transition = 0*1000; //将浮点数放大一千倍，简化传输
  Send_Data.tx[4] = transition;     //取数据的低8位
  Send_Data.tx[3] = transition>>8;  //取数据的高8位

  transition=0;
  transition = 0*1000; //将浮点数放大一千倍，简化传输
  Send_Data.tx[6] = transition;     //取数据的低8位
  Send_Data.tx[5] = transition>>8;  //取数据的高8位
 
  transition=0;
  transition = 0*1000; //将浮点数放大一千倍，简化传输
  Send_Data.tx[8] = transition;     //取数据的低8位
  Send_Data.tx[7] = transition>>8;  //取数据的高8位

  transition=0;
  transition = 0*1000; //将浮点数放大一千倍，简化传输
  Send_Data.tx[10] = transition;     //取数据的低8位
  Send_Data.tx[9] = transition>>8;  //取数据的高8位
 
  transition=0;
  transition = 0*1000; //将浮点数放大一千倍，简化传输
  Send_Data.tx[12] = transition;     //取数据的低8位
  Send_Data.tx[11] = transition>>8;  //取数据的高8位

  Send_Data.tx[13] = follower ;

  Send_Data.tx[14]=Check_Sum(14,SEND_DATA_CHECK);//帧尾校验位，规则参见Check_Sum函数
  Send_Data.tx[15]=FRAME_TAIL_ARM;  //数据的最后一位是帧尾（固定值）

  try
  {
  Stm32_Serial.write(Send_Data.tx,sizeof (Send_Data.tx)); //向串口发数据
  //ROS_INFO_STREAM("New control command");//显示受到了新的控制指令  
  }
  catch (serial::IOException& e)
  {
    ROS_ERROR_STREAM("Unable to send data through serial port"); //如果try失败,打印错误信息
  }
}
void turn_on_robot::face_joint_states_Callback(const table_arm::color_ik_result angle)
{
  short  transition;  //中间变量
  ROS_INFO_STREAM("face is ready");//ready显示状态
  Send_Data.tx[0]=FRAME_HEADER_ARM;//帧头 固定值

  transition=0;
  transition = angle.pedestal_angle*1000; //将浮点数放大一千倍，简化传输
  //ROS_INFO("%x",arm_joint.position[0]); 
  Send_Data.tx[2] = transition;     //取数据的低8位
  Send_Data.tx[1] = transition>>8;  //取数据的高8位
 
  transition=0;
  transition = angle.arm_angle*1000; //将浮点数放大一千倍，简化传输
  Send_Data.tx[4] = transition;     //取数据的低8位
  Send_Data.tx[3] = transition>>8;  //取数据的高8位

  transition=0;
  transition = -(angle.arm_angle-0.06981317008)*1000; //将浮点数放大一千倍，简化传输
  Send_Data.tx[6] = transition;     //取数据的低8位
  Send_Data.tx[5] = transition>>8;  //取数据的高8位
 
  transition=0;
  transition = -1.57*1000; //将浮点数放大一千倍，简化传输
  Send_Data.tx[8] = transition;     //取数据的低8位
  Send_Data.tx[7] = transition>>8;  //取数据的高8位

  transition=0;
  transition = 0*1000; //将浮点数放大一千倍，简化传输
  Send_Data.tx[10] = transition;     //取数据的低8位
  Send_Data.tx[9] = transition>>8;  //取数据的高8位
 
  transition=0;
  transition = 0*1000; //将浮点数放大一千倍，简化传输
  Send_Data.tx[12] = transition;     //取数据的低8位
  Send_Data.tx[11] = transition>>8;  //取数据的高8位

  Send_Data.tx[13] = follower ;

  Send_Data.tx[14]=Check_Sum(14,SEND_DATA_CHECK);//帧尾校验位，规则参见Check_Sum函数
  Send_Data.tx[15]=FRAME_TAIL_ARM;  //数据的最后一位是帧尾（固定值）
  try
  {
  Stm32_Serial.write(Send_Data.tx,sizeof (Send_Data.tx)); //向串口发数据
  //ROS_INFO_STREAM("New control command");//显示受到了新的控制指令  
  }
  catch (serial::IOException& e)
  {
    ROS_ERROR_STREAM("Unable to send data through serial port"); //如果try失败,打印错误信息
  }
}

void turn_on_robot:: color_joint_states_Callback(const table_arm::color_ik_result color_angle)
{
  ROS_INFO_STREAM("color is ready");//ready显示状态
  short  transition;  //中间变量
  Send_Data.tx[0]=FRAME_HEADER_ARM;//帧头 固定值

  transition=0;
  transition = color_angle.pedestal_angle*1000; //将浮点数放大一千倍，简化传输
  //ROS_INFO("%x",arm_joint.position[0]); 
  Send_Data.tx[2] = transition;     //取数据的低8位
  Send_Data.tx[1] = transition>>8;  //取数据的高8位
 
  transition=0;
  transition = color_angle.arm_angle*1000; //将浮点数放大一千倍，简化传输
  Send_Data.tx[4] = transition;     //取数据的低8位
  Send_Data.tx[3] = transition>>8;  //取数据的高8位

  transition=0;
  transition = -color_angle.arm_angle*1000; //将浮点数放大一千倍，简化传输
  Send_Data.tx[6] = transition;     //取数据的低8位
  Send_Data.tx[5] = transition>>8;  //取数据的高8位
 
  transition=0;
  transition = -1.57*1000; //将浮点数放大一千倍，简化传输
  Send_Data.tx[8] = transition;     //取数据的低8位
  Send_Data.tx[7] = transition>>8;  //取数据的高8位

  transition=0;
  transition = 0*1000; //将浮点数放大一千倍，简化传输
  Send_Data.tx[10] = transition;     //取数据的低8位
  Send_Data.tx[9] = transition>>8;  //取数据的高8位
 
  transition=0;
  transition = 0*1000; //将浮点数放大一千倍，简化传输
  Send_Data.tx[12] = transition;     //取数据的低8位
  Send_Data.tx[11] = transition>>8;  //取数据的高8位

  Send_Data.tx[13] = follower ;

  Send_Data.tx[14]=Check_Sum(14,SEND_DATA_CHECK);//帧尾校验位，规则参见Check_Sum函数
  Send_Data.tx[15]=FRAME_TAIL_ARM;  //数据的最后一位是帧尾（固定值）
  try
  {
  Stm32_Serial.write(Send_Data.tx,sizeof (Send_Data.tx)); //向串口发数据
  //ROS_INFO_STREAM("New control command");//显示受到了新的控制指令  
  }
  catch (serial::IOException& e)
  {
    ROS_ERROR_STREAM("Unable to send data through serial port"); //如果try失败,打印错误信息
  }
}
void turn_on_robot:: gesture_joint_states_Callback(const wheeltec_tracker_pkg::gesture gesture_angle)
{
  ROS_INFO_STREAM("gesture is ready");//ready显示状态
  short  transition;  //中间变量
  Send_Data.tx[0]=FRAME_HEADER_ARM;//帧头 固定值

  transition=0;
  transition = gesture_angle.a*1000; //将浮点数放大一千倍，简化传输
  //ROS_INFO("%x",arm_joint.position[0]); 
  Send_Data.tx[2] = transition;     //取数据的低8位
  Send_Data.tx[1] = transition>>8;  //取数据的高8位
 
  transition=0;
  transition = gesture_angle.b*1000; //将浮点数放大一千倍，简化传输
  Send_Data.tx[4] = transition;     //取数据的低8位
  Send_Data.tx[3] = transition>>8;  //取数据的高8位

  transition=0;
  transition = gesture_angle.c*1000; //将浮点数放大一千倍，简化传输
  Send_Data.tx[6] = transition;     //取数据的低8位
  Send_Data.tx[5] = transition>>8;  //取数据的高8位
 
  transition=0;
  transition = gesture_angle.d*1000; //将浮点数放大一千倍，简化传输
  Send_Data.tx[8] = transition;     //取数据的低8位
  Send_Data.tx[7] = transition>>8;  //取数据的高8位

  transition=0;
  transition = gesture_angle.e*1000; //将浮点数放大一千倍，简化传输
  Send_Data.tx[10] = transition;     //取数据的低8位
  Send_Data.tx[9] = transition>>8;  //取数据的高8位
 
  transition=0;
  transition = gesture_angle.f*1000; //将浮点数放大一千倍，简化传输
  Send_Data.tx[12] = transition;     //取数据的低8位
  Send_Data.tx[11] = transition>>8;  //取数据的高8位

  Send_Data.tx[13] = follower ;

  Send_Data.tx[14]=Check_Sum(14,SEND_DATA_CHECK);//帧尾校验位，规则参见Check_Sum函数
  Send_Data.tx[15]=FRAME_TAIL_ARM;  //数据的最后一位是帧尾（固定值）
  try
  {
  Stm32_Serial.write(Send_Data.tx,sizeof (Send_Data.tx)); //向串口发数据
  //ROS_INFO_STREAM("New control command");//显示受到了新的控制指令  
  }
  catch (serial::IOException& e)
  {
    ROS_ERROR_STREAM("Unable to send data through serial port"); //如果try失败,打印错误信息
  }
}
void turn_on_robot::arm_teleop_Callback(const sensor_msgs::JointState arm_joint)
{
  //ROS_INFO_STREAM("ok");//ready显示状态
  short  transition;  //中间变量
  Send_Data.tx[0]=FRAME_HEADER_ARM;//帧头 固定值

  transition=0;
  transition = arm_joint.position[0]*1000; //将浮点数放大一千倍，简化传输
  //ROS_INFO("%x",arm_joint.position[0]); 
  Send_Data.tx[2] = transition;     //取数据的低8位
  Send_Data.tx[1] = transition>>8;  //取数据的高8位
 
  transition=0;
  transition = arm_joint.position[1]*1000; //将浮点数放大一千倍，简化传输
  Send_Data.tx[4] = transition;     //取数据的低8位
  Send_Data.tx[3] = transition>>8;  //取数据的高8位

  transition=0;
  transition = arm_joint.position[2]*1000; //将浮点数放大一千倍，简化传输
  Send_Data.tx[6] = transition;     //取数据的低8位
  Send_Data.tx[5] = transition>>8;  //取数据的高8位
 
  transition=0;
  transition = arm_joint.position[3]*1000; //将浮点数放大一千倍，简化传输
  Send_Data.tx[8] = transition;     //取数据的低8位
  Send_Data.tx[7] = transition>>8;  //取数据的高8位

  transition=0;
  transition = arm_joint.position[4]*1000; //将浮点数放大一千倍，简化传输
  Send_Data.tx[10] = transition;     //取数据的低8位
  Send_Data.tx[9] = transition>>8;  //取数据的高8位
 
  transition=0;
  transition = arm_joint.position[5]*1000; //将浮点数放大一千倍，简化传输
  Send_Data.tx[12] = transition;     //取数据的低8位
  Send_Data.tx[11] = transition>>8;  //取数据的高8位

  Send_Data.tx[13] = default_mode;

  Send_Data.tx[14]=Check_Sum(14,SEND_DATA_CHECK);//帧尾校验位，规则参见Check_Sum函数
  Send_Data.tx[15]=FRAME_TAIL_ARM;  //数据的最后一位是帧尾（固定值）

  try
  {
  Stm32_Serial.write(Send_Data.tx,sizeof (Send_Data.tx)); //向串口发数据
  //ROS_INFO_STREAM("New control command");//显示受到了新的控制指令  
  }
  catch (serial::IOException& e)
  {
    ROS_ERROR_STREAM("Unable to send data through serial port"); //如果try失败,打印错误信息
  }
}

/**************************************
Date: June 29, 2020
Function: 串口通讯校验函数，数据包除最后一个字节，其他的全部数据按位异或的结果作为帧尾
***************************************/
unsigned char turn_on_robot::Check_Sum(unsigned char Count_Number,unsigned char mode)
{
  unsigned char check_sum=0,k;
  /*
 if(mode==0) //接收数据
  {
   for(k=0;k<Count_Number;k++)//Count_Number是接收数组位数减1
    {
     check_sum=check_sum^Receive_Data.rx[k];//按位异或
     }
  }
*/
  if(mode==1) //发送数据
  {
   for(k=0;k<Count_Number;k++)//Count_Number是发送数组位数减1
    {
     check_sum=check_sum^Send_Data.tx[k];//按位异或
     }
  }
  return check_sum;//返回结果
}

/**************************************
Date: May 31, 2020
Function: 这是相关控制代码，代码循环执行
***************************************/
void turn_on_robot::Control()
{
  _Last_Time = ros::Time::now();
  while(ros::ok())
  {
    ros::spinOnce();//循环等待回调函数
  }
}
/**************************************
Date: May 31, 2020
Function: 构造函数, 只执行一次，用于初始化
***************************************/
turn_on_robot::turn_on_robot():Sampling_Time(0)
{

  memset(&Send_Data, 0, sizeof(Send_Data));

  ros::NodeHandle private_nh("~");
  //把以上的类成员参数注册到参数服务器，这样在launch文件里面即可修改
  //3个入口参数分别对应：参数服务器上的名称  参数变量名  初始值
  private_nh.param<std::string>("usart_port_name", usart_port_name, "/dev/wheeltec_controller"); //固定串口
  private_nh.param<int>("serial_baud_rate", serial_baud_rate, 115200); //和下位机底层波特率115200 不建议更高的波特率了

  //订阅1个话题
  joint_state_Sub = n.subscribe("joint_states", 100, &turn_on_robot::joint_states_Callback, this);
  face_joint_state_Sub = n.subscribe("face_ik_result", 100,&turn_on_robot::face_joint_states_Callback, this);
  color_joint_state_Sub = n.subscribe("color_result", 100,&turn_on_robot::color_joint_states_Callback, this);
  gesture_joint_state_Sub = n.subscribe("gesture_arm", 100,&turn_on_robot::gesture_joint_states_Callback, this);
  arm_teleop_Sub = n.subscribe("arm_teleop", 100, &turn_on_robot::arm_teleop_Callback, this); 
  //voice_joint_state_Sub = n.subscribe("voice_joint_states", 100,&turn_on_robot::voice_joint_states_Callback, this); 
  ROS_INFO_STREAM("Data ready");//ready显示状态
  //初始化串口 
  try{ 
         Stm32_Serial.setPort(usart_port_name);//选择哪个口，如果选择的口没有接串口外设初始化会失败
         Stm32_Serial.setBaudrate(serial_baud_rate);//设置波特率
         serial::Timeout _time = serial::Timeout::simpleTimeout(2000);//超时等待
         Stm32_Serial.setTimeout(_time);
         Stm32_Serial.open();//串口开启
    }
  catch (serial::IOException& e){
     ROS_ERROR_STREAM("wheeltec_robot can not open serial port,Please check the serial port cable! ");//如果try失败，打印错误信息
  }
  if(Stm32_Serial.isOpen()){
    ROS_INFO_STREAM("wheeltec_robot serial port opened");//开启成功
  }
  else
  {

  }

   init_joint_states(); //开机过程机械臂运动到预设位置
}
/**************************************
Date: May 31, 2020
Function: 析构函数，只执行一次，当对象结束其生命周期时系统会调用这个函数
***************************************/
turn_on_robot::~turn_on_robot()
{
  Stm32_Serial.close();//关闭串口
  ROS_INFO_STREAM("Shutting down");//close
}
