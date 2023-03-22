#include <ros/ros.h>
#include <std_msgs/Int8.h>
#include <moveit/move_group_interface/move_group_interface.h>
#include <moveit/robot_trajectory/robot_trajectory.h>

using namespace std;
int cartesian_flag ;

int main(int argc, char **argv)
{
	ros::init(argc, argv, "arm_cartesian_demo");
	ros::AsyncSpinner spinner(1);
	spinner.start();

    double jump_threshold = 0.0; //跳跃值
    double eef_step = 0.01; //步长值
    double fraction = 0.0;   //规划笛卡尔空间路径的成功值，1为成功
    int maxtries = 100;   //最大尝试次数
    int count = 0;        //累计尝试次数

    ros::NodeHandle nd; //初始化句柄
    
    ros::Publisher cartesian_flag_pub = nd.advertise<std_msgs::Int8>("cartesian_flag", 1);

    moveit::planning_interface::MoveGroupInterface arm("arm");
    moveit::planning_interface::MoveGroupInterface::Plan my_plan;
    moveit_msgs::RobotTrajectory trajectory;
    geometry_msgs::Pose start_pose;
    std::vector<geometry_msgs::Pose> waypoints;
    std::string end_effector_link; 

    arm.setPoseReferenceFrame("base_link");//设置目标位置所使用的参考坐标系

    arm.allowReplanning(true);//当运动规划失败后，允许重新规

    //设置位置和姿态的允许误差
    arm.setGoalPositionTolerance(0.1); //(单位：米)
    arm.setGoalOrientationTolerance(0.1); //（单位：弧度）

    // 控制机械臂先回到预设置的位置
    arm.setNamedTarget("arm_home");
    arm.move();
    sleep(1);

    end_effector_link = arm.getEndEffectorLink(); //获取机械臂终端link的名称
    start_pose = arm.getCurrentPose(end_effector_link).pose; // 获取机械臂终端当前位姿作为机械臂笛卡尔运动的起始位姿

    //将初始位姿加入路点列表
	waypoints.push_back(start_pose);
	//将目标位姿加入路点列表，这里一共是走四段路径
    start_pose.position.z -= 0.04;
	waypoints.push_back(start_pose);

    start_pose.position.x -= 0.10;
    waypoints.push_back(start_pose);

    start_pose.position.z -= 0.04;
    waypoints.push_back(start_pose);

    start_pose.position.z += 0.08;
    start_pose.position.x += 0.10;
    waypoints.push_back(start_pose);

	//当规划笛卡尔空间路径函数返回1说明路径规划成功，如果规划次数超过预定义的最大规划次数则规划失败
    while(fraction != 1.0 && count < maxtries)
    {    // 笛卡尔空间的路径规划
        fraction = arm.computeCartesianPath(waypoints, eef_step, jump_threshold, trajectory);
        count++;
    }
    
    if(fraction == 1)
    {   
        ROS_INFO("plan_cartesian_successful" );
        ROS_INFO("Number of path planning attempts is %x", count); //打印一共规划了多少次
	    
        std_msgs::Int8 cartesian_flag_msg;
        cartesian_flag_msg.data = 1;
        cartesian_flag_pub.publish(cartesian_flag_msg);//路径规划成功标志位

	    my_plan.trajectory_ = trajectory;//将轨迹赋值给到my_plan这个结构体
	    arm.execute(my_plan); //execute函数输入参数是my_plan这个结构体
        sleep(1);
    }
    else
    {
        system("aplay -D plughw:CARD=Device,DEV=0 ~/wheeltec_arm/src/feedback_voice/cartesian/cartesian_fail.wav");
        ROS_INFO("Path_cartesian_failed with only %0.2f percentage success", fraction*100);//如果规划失败就打印规划成功率
    }


	ros::shutdown(); 
	return 0;
}
