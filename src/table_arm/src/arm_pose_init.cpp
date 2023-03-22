#include <ros/ros.h>
#include <string.h>
#include <string> 
#include <table_arm/arm_init_position.h>
#include <serial/serial.h>
#include <moveit/move_group_interface/move_group_interface.h>
using namespace std;

int serial_baud_rate;//波特率
string usart_port_name;
 serial::Serial Stm32_Serial; //声明串口对象
uint8_t tx[10];
u_int8_t home_flag=0,look_flag=0;
    // 
unsigned char Check_Sum(unsigned char Count_Number,unsigned char mode)
{
  unsigned char check_sum=0,k;
  if(mode==1) //发送数据
  {
   for(k=0;k<Count_Number;k++)//Count_Number是发送数组位数减1
    {
     check_sum=check_sum^tx[k];//按位异或
     }
  }
  return check_sum;//返回结果
}


void color_position_callback(const table_arm::arm_init_position &msg)
{

    tx[0]=0xA1;
    tx[1]=msg.init_joint1;
    tx[2]=msg.init_joint2;
    tx[3]=msg.init_joint3;
    tx[4]=msg.init_joint4;
    tx[5]=msg.init_joint5;
    tx[6]=msg.init_joint6;
    tx[7]=msg.save_init_pose;
    tx[8]=Check_Sum(8,1);
    tx[9]=0xF1;

    try
  {
   Stm32_Serial.write(tx,sizeof (tx)); //向串口发数据
  //ROS_INFO_STREAM("New control command");//显示受到了新的控制指令  
  }
  catch (serial::IOException& e)
  {
    ROS_ERROR_STREAM("Unable to send data through serial port"); //如果try失败,打印错误信息
  }

  if(msg.arm_home)
  {
     home_flag=1;     
  }
  else if(msg.arm_look)
  {
     look_flag=1;    

  }
}



int main(int argc,char **argv)
{
    ros::init(argc,argv,"pick_ar_nav");
    ros::NodeHandle n;
    ros::NodeHandle private_nh("~");
    ros::AsyncSpinner spinner(1);
    spinner.start();
    //把以上的类成员参数注册到参数服务器，这样在launch文件里面即可修改
    //3个入口参数分别对应：参数服务器上的名称  参数变量名  初始值
    private_nh.param<std::string>("usart_port_name", usart_port_name, "/dev/wheeltec_controller"); //固定串口
    private_nh.param<int>("serial_baud_rate", serial_baud_rate, 115200); //和下位机底层波特率115200 不建议更高的波特率了
    moveit::planning_interface::MoveGroupInterface arm("arm");   
    arm.setNamedTarget("arm_look"); arm.move(); sleep(1);
   
    ros::Subscriber pose_sub=n.subscribe("/arm_init_position",10,color_position_callback); //订阅机械臂的运动状态
   
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
   
   while(ros::ok())
   {

      if(look_flag)
      {
        look_flag=0;
        arm.setNamedTarget("arm_look"); arm.move(); sleep(1);
      }
      else if(home_flag)
      {
        home_flag=0;
        arm.setNamedTarget("arm_home"); arm.move(); sleep(1);
      }
      ros::spinOnce();
   }
   
    



}


