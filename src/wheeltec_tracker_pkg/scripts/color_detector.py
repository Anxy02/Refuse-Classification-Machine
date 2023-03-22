#!/usr/bin/env python
# coding=utf-8
#实现机械臂的色块追踪功能，并将机械臂执行角度发布到话题/color_result中
import rospy
from math import *
from sensor_msgs.msg import Image
import cv2, cv_bridge
import numpy as np
from geometry_msgs.msg import Twist
from wheeltec_tracker_pkg.msg import color as PositionMsg
from table_arm.msg import color_ik_result as Color_ik_result
def nothing(s):
    pass

cv2.namedWindow('Adjust_hsv',cv2.WINDOW_NORMAL)

class Follower:
    def __init__(self):
        self.pictureHeight= 480.0
        self.pictureWidth = 640.0
        self.result_x=[0 for x in range(0,3)]
        self.result_y=[0 for x in range(0,20)]
        self.count=0
        self.flag_x=0
        self.tmp_count_x=0
        self.tmp_count_a=0
        self.flag_y=0
        self.tmp_count_y=0
        self.Kp_x= rospy.get_param('~Kp_x')
        self.Kp_y = rospy.get_param('~Kp_y')
        self.scope_min= rospy.get_param('~scope_min') #使机械臂停下来的角度范围
        self.scope_max = rospy.get_param('~scope_max') #使机械臂停下来的角度范围
        self.color_sub = rospy.Subscriber("color_position", PositionMsg, self.color_callback)
        self.arm_ik_angle_Publisher = rospy.Publisher('/color_result', Color_ik_result, queue_size=1)

    def color_callback(self, PositionMsg):
        cx = PositionMsg.angleX
        cy = PositionMsg.angleY
        count_x =0
        count_y =0
        print(cy)
        if self.count<3:#存3组数据做加权平均
            self.result_x[self.count]=cx
            self.result_y[self.count]=cy
        else:
            self.count=0
        for i in range(0,3):
            count_x +=1
            if count_x<3:
                sum_x=np.sum(self.result_x[0:2])
                tmp_aver_x=sum_x/2.0
            elif count_x==3:
                count_x=0
        for i in range(0,3):
            count_y +=1
            if count_y<3:
                sum_y=np.sum(self.result_y[0:2])
                tmp_aver_y=sum_y/2.0
            elif count_y==3:
                count_y=0
        output_x = 0.3*tmp_aver_x+0.7*self.result_x[2]
        output_y = 0.3*tmp_aver_y+0.7*self.result_y[2]
        output_y=output_y*self.Kp_y
        output_x=output_x*self.Kp_x

        output_ix=degrees(output_x)
        output_iy=degrees(output_y)

        if abs(output_ix)<self.scope_min:
            self.tmp_count_x=self.tmp_count_x+1
        elif abs(output_ix)>self.scope_max:
            self.flag_x=0

        if self.tmp_count_x>5:
            self.flag_x=1
            self.tmp_count_x=0

        if self.flag_x==1:
            ikMsg=Color_ik_result(-0,output_y,0,'color')
            print("stop")
        else:
            ikMsg=Color_ik_result(-output_x,output_y,0,'color')
            print("start")

        if abs(output_iy)<self.scope_min:
            self.tmp_count_y=self.tmp_count_y+1
        elif abs(output_iy)>self.scope_max:
            self.flag_y=0

        if self.tmp_count_y>5:
            self.flag_y=1
            self.tmp_count_y=0

        if self.flag_y==1:
            ikMsg=Color_ik_result(-output_x,0,0,'color')
            print("stop")
        else:
            ikMsg=Color_ik_result(-output_x,output_y,0,'color')
            print("start")

        self.arm_ik_angle_Publisher.publish(ikMsg)
        self.count=self.count+1
rospy.init_node("opencv_color")
follower = Follower()
rospy.spin()

