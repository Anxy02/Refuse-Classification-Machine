#!/usr/bin/env python
# coding=utf-8
from ntpath import join
from stringprep import in_table_c8
import rospy

from sensor_msgs.msg import JointState
from std_msgs.msg import Int8
from table_arm.msg import arm_init_position
import sys, select, termios, tty

msg = """
Control Your Turtlebot!
---------------------------
Moving around:
   q    w    e   r   t   y
   a    s    d   f   g   h

b : Change the status of the arm to vertical(垂直)
l : Change the status of the arm to bend(弯曲) 
m : Save initial pose(保存初始位姿)
CTRL-C to quit
"""


#获取键值函数
def getKey():
    tty.setraw(sys.stdin.fileno())
    rlist, _, _ = select.select([sys.stdin], [], [], 0.1)
    if rlist:
        key = sys.stdin.read(1)
    else:
        key = ''

    termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)
    return key



#主函数
if __name__=="__main__":
    settings = termios.tcgetattr(sys.stdin) #获取键值初始化，读取终端相关属性
    
    rospy.init_node('arm_teleop') #创建ROS节点
    arm_init=rospy.Publisher("/arm_init_position",arm_init_position,queue_size=6) 
    arm_init_pose=arm_init_position()
    try:
        print(msg) #打印控制说明
        while(1):
            key = getKey() #获取键值
            arm_init_pose.init_joint1=0
            arm_init_pose.init_joint2=0
            arm_init_pose.init_joint3=0
            arm_init_pose.init_joint4=0
            arm_init_pose.init_joint5=0
            arm_init_pose.init_joint6=0
            arm_init_pose.save_init_pose=0
            arm_init_pose.arm_look=0
            arm_init_pose.arm_home=0
            
            if key=='q':
                arm_init_pose.init_joint1=1
                arm_init.publish(arm_init_pose)

            if key=='a':
                arm_init_pose.init_joint1=2
                arm_init.publish(arm_init_pose)



            if key=='w':
                arm_init_pose.init_joint2=1
                arm_init.publish(arm_init_pose)

            if key=='s':
                arm_init_pose.init_joint2=2
                arm_init.publish(arm_init_pose)



            if key=='e':
                arm_init_pose.init_joint3=1
                arm_init.publish(arm_init_pose)

            if key=='d':
                arm_init_pose.init_joint3=2
                arm_init.publish(arm_init_pose)



            if key=='r':
                arm_init_pose.init_joint4=1
                arm_init.publish(arm_init_pose)

            if key=='f':
                arm_init_pose.init_joint4=2
                arm_init.publish(arm_init_pose)



            if key=='t':
                arm_init_pose.init_joint5=1
                arm_init.publish(arm_init_pose)

            if key=='g':
                arm_init_pose.init_joint5=2
                arm_init.publish(arm_init_pose)



            if key=='y':
                arm_init_pose.init_joint6=1
                arm_init.publish(arm_init_pose)

            if key=='h':
                arm_init_pose.init_joint6=2
                arm_init.publish(arm_init_pose)


            if key=='m':
                arm_init_pose.save_init_pose=1
                arm_init.publish(arm_init_pose)

            if key=='b':
                arm_init_pose.arm_home=1
                arm_init.publish(arm_init_pose)

            if key=='l':
                arm_init_pose.arm_look=1
                arm_init.publish(arm_init_pose)

            #ctrl+c退出循环
            elif (key == '\x03'):
                break

            #其他按键不做处理
            else:
                pass

       
    #运行出现问题则程序终止并打印相关错误信息
    except Exception as e:
        print(e)

    #程序结束前打印消息提示
    finally:
        print("Keyboard control off")

    #程序结束前设置终端相关属性
    termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)

