#!/usr/bin/env python
# coding=utf-8
#实现色块识别功能，并将色块位置发布到话题/color_position中
import rospy
from math import *
from sensor_msgs.msg import Image
import cv2, cv_bridge
import numpy as np
from std_msgs.msg import Int8
from geometry_msgs.msg import Twist
from table_arm.msg import color_ik_result as color_ik_result
from wheeltec_tracker_pkg.msg import color as PositionMsg

last_erro=0
choose_flag=0
def nothing(s):
    pass
col_black = (0,0,0,180,255,46)# black
col_red = (0,100,80,10,255,255)# red
col_blue = (100,43,46,124,255,255)# blue
col_green= (35,43,46,77,255,255)# green
col_yellow = (26,43,46,34,255,255)# yellow

cv2.namedWindow('Adjust_hsv',cv2.WINDOW_NORMAL)
Switch = '0:Red\n1:Green\n2:Blue\n3:Yellow\n4:Black'
cv2.createTrackbar(Switch,'Adjust_hsv',0,4,nothing)

class Find_Color:
    def __init__(self):
        self.bridge = cv_bridge.CvBridge()
        self.i=0
        vertAngle =rospy.get_param('~verticalAngle')
        horizontalAngle =  rospy.get_param('~horizontalAngle')
        self.pictureHeight= rospy.get_param('~pictureHeight')
        self.pictureWidth = rospy.get_param('~pictureWidth')
        self.x_bias= rospy.get_param('~x_bias')
        self.y_bias = rospy.get_param('~y_bias')
        self.tanHorizontal = np.tan(horizontalAngle)
	self.tanVertical = np.tan(vertAngle)
        self.image_sub = rospy.Subscriber("/usb_cam/image_raw", Image, self.image_callback)
        self.positionPublisher = rospy.Publisher('/color_position', PositionMsg, queue_size=10)
        self.color_sub = rospy.Subscriber("/color_flag", Int8, self.colorflag_callback)
        self.visualflagPublisher = rospy.Publisher('/visual_follow_flag', Int8, queue_size=1)
        self.twist = Twist()
        self.m=3
        self.count=0
        self.red_count=0
        self.green_count=0
        self.blue_count=0
        self.yellow_count=0
        rospy.loginfo('find_color_node is init successful')

    #色块跟随标志位发布函数
    def publish_flag(self):
        visual_follow_flag=Int8()
        visual_follow_flag.data=1
        rospy.sleep(1.)
        self.visualflagPublisher.publish(visual_follow_flag)
        rospy.loginfo('a=%d',visual_follow_flag.data)
        #print("1111111111111111111111111111111111111111111111111111111111111")

    def colorflag_callback(self, msg):
        global choose_flag
        choose_flag = msg.data 

    def image_callback(self, msg):
        global last_erro
        global choose_flag
        image = self.bridge.imgmsg_to_cv2(msg, desired_encoding='bgr8')
        image = cv2.resize(image, (320,240), interpolation=cv2.INTER_AREA)#提高帧率
        # hsv将RGB图像分解成色调H，饱和度S，明度V
        hsv = cv2.cvtColor(image, cv2.COLOR_BGR2HSV)
        # 颜色的范围        # 第二个参数：lower指的是图像中低于这个lower的值，图像值变为0
        # 第三个参数：upper指的是图像中高于这个upper的值，图像值变为0
        # 而在lower～upper之间的值变成255
        kernel = np.ones((5,5),np.uint8)
        hsv_erode = cv2.erode(hsv,kernel,iterations=1)
        hsv_dilate = cv2.dilate(hsv_erode,kernel,iterations=1)
        if choose_flag == 1:  
            cv2.createTrackbar(Switch,'Adjust_hsv',0,4,nothing)
        elif choose_flag == 2:
            cv2.createTrackbar(Switch,'Adjust_hsv',1,4,nothing)
        elif choose_flag == 3:
            cv2.createTrackbar(Switch,'Adjust_hsv',2,4,nothing)
        elif choose_flag == 4:
            cv2.createTrackbar(Switch,'Adjust_hsv',3,4,nothing)
        elif choose_flag == 5:
            cv2.createTrackbar(Switch,'Adjust_hsv',4,4,nothing) 
        self.m=cv2.getTrackbarPos(Switch,'Adjust_hsv')
        if self.i < 5:
            self.i = self.i +1
        elif self.i == 5:
            self.publish_flag()
            self.i = 6

        # ptx=160
        # pty=480
        # pt1 = ptx-100;
        # pt2 = ptx+100;
        # cv2.line(image,(ptx,0),(ptx,pty),(0, 0, 255),1)
        # cv2.line(image,(0,120),(320,120),(0, 0, 255),1)
        # cv2.line(image,(pt1,0),(pt1,pty),(0, 255, 0),1)
        # cv2.line(image,(pt2,0),(pt2,pty),(0, 255, 0),1)
        # cv2.imshow("mask", image)
        if self.m == 0:
            lowerbH=col_red[0]
            lowerbS=col_red[1]
            lowerbV=col_red[2]
            upperbH=col_red[3]
            upperbS=col_red[4]
            upperbV=col_red[5]
        elif self.m == 1:
            lowerbH=col_green[0]
            lowerbS=col_green[1]
            lowerbV=col_green[2]
            upperbH=col_green[3]
            upperbS=col_green[4]
            upperbV=col_green[5]
        elif self.m == 2:
            lowerbH=col_blue[0]
            lowerbS=col_blue[1]
            lowerbV=col_blue[2]
            upperbH=col_blue[3]
            upperbS=col_blue[4]
            upperbV=col_blue[5]
        elif self.m == 3:
            lowerbH=col_yellow[0]
            lowerbS=col_yellow[1]
            lowerbV=col_yellow[2]
            upperbH=col_yellow[3]
            upperbS=col_yellow[4]
            upperbV=col_yellow[5]
        elif self.m == 4:
            lowerbH=col_black[0]
            lowerbS=col_black[1]
            lowerbV=col_black[2]
            upperbH=col_black[3]
            upperbS=col_black[4]
            upperbV=col_black[5]
        else:
            lowerbH=0
            lowerbS=0
            lowerbV=0
            upperbH=255
            upperbS=255
            upperbV=255

        mask=cv2.inRange(hsv_dilate,(lowerbH,lowerbS,lowerbV),(upperbH,upperbS,upperbV))#做二值化掩膜
        masked = cv2.bitwise_and(image, image, mask=mask)
        cv2.imshow("Adjust_hsv", mask)
        cv2.waitKey(3)
        contours = cv2.findContours(mask.copy(), cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)[-2]#轮廓函数

        for contour in sorted(contours, key=cv2.contourArea, reverse=True):
           area=cv2.contourArea(contour)
           if area < 400:#滤除噪点
              return
           centerRaw, size, rotation = cv2.minAreaRect(contour)
           angleX = self.calculateAngleX(centerRaw)
           angleY = self.calculateAngleY(centerRaw)
           angleX = angleX
           angleY=angleY
           cx=angleX*25-self.x_bias#减小X向和Y向的静态误差-0.8651310701631576
           cy=angleY*4-self.y_bias
           posMsg = PositionMsg(cx,cy)
           self.positionPublisher.publish(posMsg)#发布色块位置
           return
    def calculateAngleX(self, pos):
	'''calculates the X angle of displacement from straight ahead'''
        centerX = pos[0]
        displacement = 2*centerX/self.pictureWidth-1
        angle = -1*np.arctan(displacement*self.tanHorizontal)
        return angle
    def calculateAngleY(self, pos):
        centerY = pos[1]
        displacement = 2*centerY/self.pictureHeight-1
        angle = -1*np.arctan(displacement*self.tanVertical)
        return angle
rospy.init_node("find_color")
find_color = Find_Color()
rospy.spin()

