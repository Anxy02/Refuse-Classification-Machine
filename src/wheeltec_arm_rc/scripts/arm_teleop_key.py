#!/usr/bin/env python
# coding=utf-8
import rospy

from sensor_msgs.msg import JointState

import sys, select, termios, tty

msg = """
Control Your Turtlebot!
---------------------------
Moving around:
   q    w    e   r   t   y
   a    s    d   f   g   h

j/l : increase/decrease precision by 0.05
space key, k : reset
anything else : stop smoothly
b : switch to arm_four/arm_six
precision is not less than or equal to zero
CTRL-C to quit
"""
mode = 0 #六自由度模式

precision = 0.05 #默认精度(rad)

#键值对应转动方向
rotateBindings = {
        'q':(1,1),
        'a':(1,-1),
        'w':(2,1),
        's':(2,-1),
        'e':(3,1),
        'd':(3,-1),
        'r':(4,1),
        'f':(4,-1),
        't':(5,1),
        'g':(5,-1),
        'y':(6,1),
        'h':(6,-1)
           }

#键值对应精度增量
precisionBindings={
        'j':0.01,
        'l':-0.01
          }

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

#以字符串格式返回当前控制精度
def prec(precision):
    return "currently:\tprecision %s " %precision

#主函数
if __name__=="__main__":
    settings = termios.tcgetattr(sys.stdin) #获取键值初始化，读取终端相关属性
    
    rospy.init_node('arm_teleop') #创建ROS节点
    pub = rospy.Publisher('/joint_states', JointState, queue_size=5) #创建机械臂状态话题发布者

    #关节1-6对应弧度状态
    joints = [0,0,0,0,0,0]

    """机械臂关节初始化"""
    jointState = JointState() #创建ROS机械臂装态话题消息变量
    jointState.header.stamp = rospy.Time.now()
    jointState.name=["joint1","joint2","joint3","joint4","joint5","joint6"]
    jointState.position=joints
    pub.publish(jointState) #ROS发布机械臂状态话题
    
    try:
        print(msg) #打印控制说明
        print(prec(precision)) #打印当前精度
        while(1):
            key = getKey() #获取键值

            #切换机械别的自由度
            if key=='b':               
                mode=~mode
                if mode: 
                    print("Switch to arm_four")
                else:
                    print("Switch to arm_six")

            
            #判断键值是在控制机械臂运动的键值内
            if key in rotateBindings.keys():
                joints[rotateBindings[key][0]-1] = joints[rotateBindings[key][0]-1] + precision*rotateBindings[key][1]
                if joints[rotateBindings[key][0]-1]>1.57:
                    joints[rotateBindings[key][0]-1]=1.57
                elif joints[rotateBindings[key][0]-1]<-1.57:
                    joints[rotateBindings[key][0]-1]=-1.57
              
            #判断键值是否在精度增量键值内
            elif key in precisionBindings.keys():
                if (precision+precisionBindings[key])<0.01 or (precision+precisionBindings[key])>0.1:
                    pass
                else:
                    precision+=precisionBindings[key]
                print(prec(precision)) #精度发生变化，打印出来

            #空格键机械臂复位
            elif key == ' ':
                joints = [0,0,0,0,0,0]

            #ctrl+c退出循环
            elif (key == '\x03'):
                break

            #其他按键不做处理
            else:
                pass
                

            #根据机械臂自由度给joint_states话题赋予消息
            if mode:
                jointState.header.stamp = rospy.Time.now()
                jointState.name=["joint1","joint2","joint3","joint4"]
                jointState.position=joints[0:4]
            else:
            	jointState.header.stamp = rospy.Time.now()
                jointState.name=["joint1","joint2","joint3","joint4","joint5","joint6"]
                jointState.position=joints

            pub.publish(jointState) #ROS发布关节状态话题

    #运行出现问题则程序终止并打印相关错误信息
    except Exception as e:
        print(e)

    #程序结束前发布速度为0的速度话题
    finally:
        print("Keyboard control off")

    #程序结束前打印消息提示
    termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)

