#!/usr/bin/env python
# coding=utf-8

import rospy
from math import *
from sensor_msgs.msg import Image
import cv2, cv_bridge
import numpy as np
from geometry_msgs.msg import Twist
from table_arm.msg import position_color as PositionMsg
from table_arm.msg import color_ik_result as color_ik_result_Msg
from std_msgs.msg import Int8
from std_msgs.msg import String as StringMsg

last_erro=0
def nothing(s):
    pass
#HSV颜色阈值

#col_black = (0,0,0,180,255,46)# black
#col_red = (0,100,64,10,255,255)# red
col_blue = (80,33,12,127,255,255)# blue
col_green= (50,46,24,80,255,255)# green
col_yellow = (20,90,110,39,255,255)# yellow

class Find_Color:
    def __init__(self):
        self.bridge = cv_bridge.CvBridge()
        self.i=0
        self.pictureHeight= 480
        self.pictureWidth = 640
        horizontalAngle =0.5235987755982988
        vertAngle =0.43196898986859655
        self.tanHorizontal = np.tan(horizontalAngle)
        self.tanVertical = np.tan(vertAngle)
        self.image_sub = rospy.Subscriber("/usb_cam/image_raw", Image, self.image_callback)#订阅图像话题
        # self.image_sub = rospy.Subscriber("cv_bridge_image", Image, self.image_callback)
 
        self.positionPublisher = rospy.Publisher('/color_position', PositionMsg, queue_size=10) #发布色块的位置（原始数据）
        self.arm_ik_angle_Publisher = rospy.Publisher('/color_ik_result', color_ik_result_Msg, queue_size=10)#发布根据色块位置求解的机械臂关节目标弧度话题
        self.visual_flagPublisher = rospy.Publisher('/visual_func_flag', Int8, queue_size =1)
        self.twist = Twist()
        self.m=1            #更换检测颜色的标志位
        self.count=0       #每个色块检测次数的计数值
        self.link_a=rospy.get_param('link_a')   #机械参数
        self.link_b=rospy.get_param('link_b')    #机械参数
        self.link_c=rospy.get_param('link_c')    #机械参数
        self.link_h=rospy.get_param('link_h')   #机械参数
        self.x_offset=rospy.get_param('color_x_offset')      #x轴和y轴夹取位置微调的偏差参数，单位（米）
        self.y_offset=rospy.get_param('color_y_offset')
        self.auxiliary_angle=rospy.get_param('auxiliary_angle')
        self.red_count=0
        self.green_count=0
        self.blue_count=0
        self.yellow_count=0

        self.basic_angle= acos( (self.link_c -self.link_h)/self.link_a ) #计算机械臂夹爪可触底的关节基础角度
        #self.basic_angle= 0.5732
        rospy.loginfo('basic_angle is %s' ,self.basic_angle)
        rospy.loginfo('find_color_node is init successful')

     #色块分拣标志位发布函数
    def publish_flag(self):
        visual_func_flag=Int8()
        visual_func_flag.data=1
        rospy.sleep(1.)
        self.visual_flagPublisher.publish(visual_func_flag)
        rospy.loginfo('a=%d',visual_func_flag.data)
        print("1111111111111111111111111111111111111111111111111111111111111")

    def image_callback(self, msg):
        global last_erro
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
        if self.i < 5:
            self.i = self.i +1
        elif self.i == 5:
            self.publish_flag()
            self.i = 6
        #self.m=0
        if self.m == 1:
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
        else:
            lowerbH=0
            lowerbS=0
            lowerbV=0
            upperbH=0
            upperbS=0
            upperbV=0

        #每种颜色检测十遍
        if self.count<9:
            self.count=self.count+1

        elif self.count>=9:
            self.count=0
            if self.m<=3: #四种颜色轮询检测
                 self.m=self.m+1      
            else :
                 self.m=1

        #self.m=0
        mask=cv2.inRange(hsv_dilate,(lowerbH,lowerbS,lowerbV),(upperbH,upperbS,upperbV))
        mask = cv2.erode(mask,None,iterations=4)
        contours = cv2.findContours(mask.copy(), cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)[-2]  #获取色块的轮廓

        for contour in sorted(contours, key=cv2.contourArea, reverse=True):
           area=cv2.contourArea(contour)  #通过轮廓获取色块面积
           if area < 800:  #色块面积判断，如果过小则视为误判，数据丢弃
              return 
           #rospy.loginfo('area is %s' ,area)

	       # get position of object for this contour
           centerRaw, size, rotation = cv2.minAreaRect(contour)  #输入色块的轮廓，获得:centerraw是色块的坐标，size是色块的面积，rotation是色块的旋转角
           #rospy.loginfo('center zuobiao is %s' ,centerRaw)
           ##################rospy.loginfo('rotation is %s' ,rotation)
           angleX = self.calculateAngleX(centerRaw) #做数学转换获取色块在画幅中的坐标
           angleY = self.calculateAngleY(centerRaw)
           rospy.loginfo('center is %s,,,,%s' ,centerRaw[0],centerRaw[1])
           rospy.loginfo('center angle is %s,,,,%s' ,angleX,angleY)
           self.publishPosition(angleX,angleY,rotation,self.count) #发布话题：色块的位置（原始数据）
           self.publishArm_Angle(angleX,angleY,rotation)	 #发布话题：根据色块位置求解的机械臂关节目标弧度话题
           return
        #如果画幅中没有出现色块，则发布话题，色块的位置信息为999
        angleX = 999
        angleY = 999
        rotation=999
        self.publishPosition(angleX,angleY,rotation,self.count)
        self.publishArm_Angle(angleX,angleY,rotation)	

        #cv2.imshow("window", image)
        #cv2.waitKey(3)

    def calculateAngleX(self, pos):
        centerX = pos[0]
        displacement = 2*centerX/self.pictureWidth-1
        angle = -1*np.arctan(displacement*self.tanHorizontal)
        return angle

    def calculateAngleY(self, pos):
        centerY = pos[1]
        displacement = 2*centerY/self.pictureHeight-1
        angle = -1*np.arctan(displacement*self.tanVertical)
        return angle

    def publishPosition(self, x,y,rotate,count):
        # publish the position (angleX, angleY, distance)
        if self.m==1:
            posMsg = PositionMsg(x, y, rotate,count,'green')
        elif self.m==2:
            posMsg = PositionMsg(x, y, rotate,count,'blue')
        elif self.m==3:
            posMsg = PositionMsg(x, y, rotate,count,'yellow')
        else :
            posMsg = PositionMsg(x, y, rotate,count,'none')

        if x==999 and y == 999:
            posMsg = PositionMsg(x, y, rotate,count,'none_color')

        self.positionPublisher.publish(posMsg)

    def publishArm_Angle(self, x,y,rotate):

        if x > 0.5 or y >0.4: # 如果色块的位置太偏，则认为数据有误
             return 
        #print(x)
        true_x= x*(-0.354)+0.105+self.x_offset  #色块的原始坐标在（左右方向）从左开始是0到0.56，因此减0.28是将0点坐标移到整个画幅的中间

        #色块的原始坐标（前后方向）转换成实际距离

        true_y= y * 0.307 +0.17+self.y_offset
      
        #rospy.loginfo('x is %s' ,x)
        #计算云台的目标运动角度
        #print(x)
        pedestal_angle=degrees(atan(abs(true_x / true_y)))
        if  true_x >0 :#角度正反（左右）关系转换
             pedestal_angle  = pedestal_angle
        else :
             pedestal_angle  = -pedestal_angle
        #arm_angle=degrees( atan( (self.link_a*sin(self.basic_angle) +  self.link_c )/self.link_a*cos(self.basic_angle) ) )
        caculate_A=self.link_a*sin(self.basic_angle) +sin(self.auxiliary_angle)*self.link_c
        caculate_B=self.link_a*cos(self.basic_angle) +cos(self.auxiliary_angle)*self.link_c
        caculate_C=(sqrt(pow(true_x,2)+ pow(true_y,2))-self.link_b)
        caculate_D= acos( caculate_C/(sqrt(pow(caculate_A,2)+ pow(caculate_B,2) ) ) )
        #kk=sqrt(pow(x,2)+ pow(y,2))
        #rospy.loginfo('DD is %s' ,DD)
        caculate_E= atan(caculate_B/caculate_A) 
        caculate_G=(caculate_E-caculate_D)
        #print(GG)
        #rospy.loginfo('DD is %s,EE is %s,GG is %s' ,DD,EE,GG)
        #rospy.loginfo('GG is %s' ,GG)

        hand_angle = rotate + 90 #角度正反关系转换
        if  hand_angle >45 :
             hand_angle  = hand_angle -90

        pedestal_angle = radians(pedestal_angle) #云台的目标运动角度,radians函数是弧度转角度
        #pedestal_angle=pedestal_angle
        #rospy.loginfo('pedestal_angle is %s' ,pedestal_angle)
        arm_angle      = (caculate_G)  #控制机械臂臂长的目标角度,radians函数是弧度转角度
        #rospy.loginfo('arm_angle is %s' ,arm_angle)
        hand_angle     = radians(hand_angle) #控制夹取色块旋转的目标角度,radians函数是弧度转角度
        #rospy.loginfo('hand_angle is %s' ,hand_angle)
        #通过self.m判断是什么颜色的数据
        if self.m==1:
            self.green_count=self.green_count +1
            if self.green_count >5: #每五次数据再发布一次话题（控制话题发布速率）
               self.green_count = 0
               ikMsg=color_ik_result_Msg(pedestal_angle,arm_angle,hand_angle,'green')
               self.arm_ik_angle_Publisher.publish(ikMsg)
        if self.m==2:
            self.blue_count=self.blue_count +1
            if self.blue_count >5: #每五次数据再发布一次话题（控制话题发布速率）
               self.blue_count = 0
               ikMsg=color_ik_result_Msg(pedestal_angle,arm_angle,hand_angle,'blue')
               self.arm_ik_angle_Publisher.publish(ikMsg)
        if self.m==3:
            self.yellow_count=self.yellow_count +1
            if self.yellow_count >5: #每五次数据再发布一次话题（控制话题发布速率）
               self.yellow_count = 0
               ikMsg=color_ik_result_Msg(pedestal_angle,arm_angle,hand_angle,'yellow')
               self.arm_ik_angle_Publisher.publish(ikMsg)


rospy.init_node("find_color")
find_color = Find_Color()
rospy.spin()

