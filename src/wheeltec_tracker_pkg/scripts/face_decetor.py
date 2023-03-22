#!/usr/bin/env python
# coding=utf-8
#实现机械臂的人脸追踪功能，并将机械臂执行角度发布到话题/face_ik_result中
import rospy
from math import *
from sensor_msgs.msg import Image
import cv2, cv_bridge
import numpy as np
from geometry_msgs.msg import Twist
from wheeltec_tracker_pkg.msg import centroid as Centroid
from table_arm.msg import color_ik_result as Face_ik_result
def nothing(s):
    pass

cv2.namedWindow('Adjust_hsv',cv2.WINDOW_NORMAL)

class Follower:
    def __init__(self):

        self.pictureHeight= rospy.get_param('~pictureHeight')
        self.pictureWidth = rospy.get_param('~pictureWidth')
        #vertAngle =rospy.get_param('~verticalAngle')
        #horizontalAngle =  rospy.get_param('~horizontalAngle')
        vertAngle=0.610865238198
        horizontalAngle =0.9
        self.result_x=[0 for x in range(0,3)]
        self.result_y=[0 for x in range(0,20)]
        self.count=0
        self.flag_x=0
        self.tmp_count_x=0 
        self.tmp_count_a=0
        self.flag_y=0
        self.tmp_count_y=0
        self.tanVertical = np.tan(vertAngle)
        self.tanHorizontal = np.tan(horizontalAngle)
        self.face_sub = rospy.Subscriber("face_centroid", Centroid, self.face_callback)
        self.arm_ik_angle_Publisher = rospy.Publisher('/face_ik_result', Face_ik_result, queue_size=10)
    #接收到人脸质心位置后的回调函数
    def face_callback(self, Centroid):
        displacement_x = 2*Centroid.x/self.pictureWidth-1
        cx = -1*np.arctan(displacement_x*self.tanVertical)
        displacement_y = 2*Centroid.y/self.pictureHeight-1
        cy = -1*np.arctan(displacement_y*self.tanHorizontal)
        count_x =0
        count_y =0
        #将数据保存到数组
        if self.count<3:
            self.result_x[self.count]=cx
            self.result_y[self.count]=cy
        else:
            self.count=0
        for i in range(0,3):
            count_x +=1
            #print(result_x)
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
        output_x = 0.3*tmp_aver_x+0.7*self.result_x[2]#加权平均值滤波
        output_y = 0.3*tmp_aver_y+0.7*self.result_y[2]
        output_y=output_y*1.4#扩大范围
        output_x=output_x*1.98#扩大范围1.7
        output_ix=degrees(output_x)#转化为角度值
        output_iy=degrees(output_y)#转化为角度值

        if abs(output_ix)<12:
            self.tmp_count_x=self.tmp_count_x+1
        elif abs(output_ix)>15:
            self.flag_x=0

        if self.tmp_count_x>5:
            self.flag_x=1
            self.tmp_count_x=0

        if self.flag_x==1: #待人脸到图像中间时，机械臂稳定下来置零
            ikMsg=Face_ik_result(-0,output_y,0,'face')
            #print("stop")
        else:
            ikMsg=Face_ik_result(-output_x,output_y,0,'face')
            #print("start")

        if abs(output_iy)<12:
            self.tmp_count_y=self.tmp_count_y+1
        elif abs(output_iy)>13:
            self.flag_y=0
        if self.tmp_count_y>5:
            self.flag_y=1
            self.tmp_count_y=0

        if self.flag_y==1:
            ikMsg=Face_ik_result(-output_x,0,0,'face')
            #print("stop")
        else:
            ikMsg=Face_ik_result(-output_x,output_y,0,'face')
            #print("start")
        #print(output_iy)
        print(ikMsg)
        self.arm_ik_angle_Publisher.publish(ikMsg)
        self.count=self.count+1
rospy.init_node("opencv")
follower = Follower()
rospy.spin()

