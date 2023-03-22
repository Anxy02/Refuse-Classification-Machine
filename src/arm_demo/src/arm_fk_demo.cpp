#include <ros/ros.h>
#include <ros/console.h>
#include <std_msgs/Int8.h>
#include <moveit/move_group_interface/move_group_interface.h>

using namespace std;
bool success;
int fk_demo_flag ;

int main(int argc, char **argv)
{
    ros::init(argc, argv, "arm_fk_demo");
    ros::AsyncSpinner spinner(1);
    ros::NodeHandle nd; //初始化句柄
    spinner.start();

    moveit::planning_interface::MoveGroupInterface arm("arm");
    moveit::planning_interface::MoveGroupInterface::Plan my_plan;
    std::vector<double> joint_group_positions(5);
    // 控制机械臂回到预设置的位置
    arm.setNamedTarget("arm_home");
    arm.move();
    sleep(1); 
    
    //直接输入五个关节的目标旋转角度
    joint_group_positions[0] =  0.5;
    joint_group_positions[1] = -0.5;
    joint_group_positions[2] = -0.5;
    joint_group_positions[3] = -0.5;
    joint_group_positions[4] = -1.57;

    arm.setJointValueTarget(joint_group_positions);

    ros::Publisher fk_demo_flag_pub = nd.advertise<std_msgs::Int8>("fk_demo_flag", 1);

    success = ((arm.plan(my_plan) == moveit::planning_interface::MoveItErrorCode::SUCCESS));
    ROS_INFO_NAMED("fk_demo_plan",success ? "plan_success" : "plan_False");

    if(success)  arm.execute(my_plan),sleep(1); //如果规划成功则执行

    if(success)
    {
        std_msgs::Int8 fk_demo_flag_msg;
        fk_demo_flag_msg.data = 1;
        fk_demo_flag_pub.publish(fk_demo_flag_msg);//正解开启成功标志位
    }
    else
    {
        system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/demo/fk_demo_fail.wav");
    }

    // 控制机械臂先回到初始化位置
    arm.setNamedTarget("arm_home");
    arm.move();
    sleep(1);

    ros::shutdown(); 

    return 0; 
}
