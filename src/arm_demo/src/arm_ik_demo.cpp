
#include <string>
#include <ros/ros.h>
#include <std_msgs/Int8.h>
#include <moveit/move_group_interface/move_group_interface.h>

using namespace std;
bool success;
int ik_demo_flag ;

int main(int argc, char **argv)
{
    ros::init(argc, argv, "moveit_ik_demo");
    ros::AsyncSpinner spinner(1);
    ros::NodeHandle nd; //初始化句柄
    spinner.start();

    moveit::planning_interface::MoveGroupInterface arm("arm");
    moveit::planning_interface::MoveGroupInterface::Plan my_plan;
    geometry_msgs::Pose target_pose;
    std::string end_effector_link;  
    
    ros::Publisher ik_demo_flag_pub = nd.advertise<std_msgs::Int8>("ik_demo_flag",1);

    //设置位置和姿态的允许误差
    //arm.setGoalPositionTolerance(0.1); //(单位：米)
    //arm.setGoalOrientationTolerance(0.1); //（单位：弧度）

    end_effector_link = arm.getEndEffectorLink();//获取机械臂终端link的名称

    arm.setPoseReferenceFrame("base_link");//设置目标位置所使用的参考坐标系

    arm.allowReplanning(true);//当运动规划失败后，允许重新规划

    // 控制机械臂回到预设的位置
    arm.setNamedTarget("arm_home");
    arm.move();
    sleep(1);

    target_pose = arm.getCurrentPose(end_effector_link).pose; //获取机械臂终端当前位姿

    //设置机械臂终端的目标位置
    target_pose.position.x = target_pose.position.x-0.08; //往x轴负方向走8cm
    //target_pose.position.y = 0.0;
    target_pose.position.z = target_pose.position.z-0.05; //往z轴负方向走5cm

    arm.setStartStateToCurrentState();//设置机器臂当前的状态作为运动初始状态

    arm.setPoseTarget(target_pose); 
    arm.setPlanningTime(20.0); //设置规划时间（单位：秒）

    success = ((arm.plan(my_plan) == moveit::planning_interface::MoveItErrorCode::SUCCESS)); 
    ROS_INFO_NAMED("ik_demo_plan",success ? "plan_success" : "plan_False");
    
    //让机械臂按照规划的轨迹开始运动。
    if(success)  arm.execute(my_plan),sleep(1);

    if(success)
    {
        std_msgs::Int8 ik_demo_flag_msg;
        ik_demo_flag_msg.data = 1;
        ik_demo_flag_pub.publish(ik_demo_flag_msg);//逆解开启成功标志位
    }
    else
    {
        system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/demo/ik_demo_fail.wav");
    }

    // 控制机械臂先回到初始化位置
    arm.setNamedTarget("arm_home");
    arm.move();
    sleep(1);

    ros::shutdown(); 

    return 0;
}
