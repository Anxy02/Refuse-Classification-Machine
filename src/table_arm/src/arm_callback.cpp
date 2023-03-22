#include "wheeltec_table_arm.h"
#include "arm_callback.h"
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

  Send_Data.tx[13]=Check_Sum(13,SEND_DATA_CHECK);//帧尾校验位，规则参见Check_Sum函数
  Send_Data.tx[14]=FRAME_TAIL_ARM;  //数据的最后一位是帧尾（固定值）

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

  Send_Data.tx[13]=Check_Sum(13,SEND_DATA_CHECK);//帧尾校验位，规则参见Check_Sum函数
  Send_Data.tx[14]=FRAME_TAIL_ARM;  //数据的最后一位是帧尾（固定值）
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

  Send_Data.tx[13]=Check_Sum(13,SEND_DATA_CHECK);//帧尾校验位，规则参见Check_Sum函数
  Send_Data.tx[14]=FRAME_TAIL_ARM;  //数据的最后一位是帧尾（固定值）
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

  Send_Data.tx[13]=Check_Sum(13,SEND_DATA_CHECK);//帧尾校验位，规则参见Check_Sum函数
  Send_Data.tx[14]=FRAME_TAIL_ARM;  //数据的最后一位是帧尾（固定值）
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

