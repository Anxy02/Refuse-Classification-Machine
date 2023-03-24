#!/usr/bin/env python3
# coding=utf-8

import rospy
from math import *
from sensor_msgs.msg import Image
import cv2, cv_bridge
import numpy as np
from geometry_msgs.msg import Twist
from yolo_new.msg import position_color as PositionMsg
from yolo_new.msg import color_ik_result_new as color_ik_result_Msg
from std_msgs.msg import Int8
from std_msgs.msg import String as StringMsg
from yolov5_ros_msgs.msg import BoundingBox,BoundingBoxes

last_erro=0
def nothing(s):
    pass

class Find_Color:
    def __init__(self):
        
        self.bridge = cv_bridge.CvBridge()
        self.i=0
        # cv2.namedWindow("window", 1)
        self.pictureHeight= 480#240#480
        self.pictureWidth = 640#320#640
        horizontalAngle =0.5235987755982988
        vertAngle =0.43196898986859655
        self.tanHorizontal = np.tan(horizontalAngle)
        self.tanVertical = np.tan(vertAngle)
        # self.image_sub = rospy.Subscriber("/usb_cam/image_raw", Image, self.image_callback)#订阅图像话题
        # self.image_sub = rospy.Subscriber("/yolov5/detection_image", Image, self.image_callback)#订阅图像话题
        self.box_sub = rospy.Subscriber("/yolov5/BoundingBoxes", BoundingBoxes, self.box_callback)#订阅识别类别话题
 
        self.positionPublisher = rospy.Publisher('/color_position', PositionMsg, queue_size=10) #发布色块的位置（原始数据）
        self.arm_ik_angle_Publisher = rospy.Publisher('/color_ik_result_new', color_ik_result_Msg, queue_size=10)#发布根据色块位置求解的机械臂关节目标弧度话题
        self.visual_flagPublisher = rospy.Publisher('/visual_func_flag', Int8, queue_size =1)
        self.twist = Twist()
        # self.m=1            #更换检测颜色的标志位  #m=1绿色，m=2蓝色，m=3黄色
        self.count=0       #每个色块检测次数的计数值
        self.link_a=rospy.get_param('link_a')   #机械参数
        self.link_b=rospy.get_param('link_b')    #机械参数
        self.link_c=rospy.get_param('link_c')    #机械参数
        self.link_h=rospy.get_param('link_h')   #机械参数
        self.x_offset=rospy.get_param('color_x_offset')      #x轴和y轴夹取位置微调的偏差参数，单位（米）
        self.y_offset=rospy.get_param('color_y_offset')
        self.auxiliary_angle=rospy.get_param('auxiliary_angle')
        self.recycle_count=0    #四类垃圾的数量
        self.harm_count=0
        self.kitchen_count=0
        self.others_count=0
        # self.red_count=0
        # self.green_count=0
        # self.blue_count=0
        # self.yellow_count=0

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

    def box_callback(self,msg):
        self.boundingBoxes = BoundingBoxes()
        #global tmp_box
        #global box

        count=0
        for i in msg.bounding_boxes:
            count+=1

        if count == 1:
            self.Class = self.switch_class(msg.bounding_boxes[0].Class)   #传入垃圾类别并进行判断分类
            self.single_send(self.Class)  #单目标直接用刷子发送

        elif count > 1:
            for tmp_box in msg.bounding_boxes:
                Xmid=tmp_box.xmid/2
                Ymid=tmp_box.ymid/2
                Xmin=tmp_box.xmin
                Xmax=tmp_box.xmax
                Ymin=tmp_box.ymin
                Ymax=tmp_box.ymax

                # self.Class=box.Class
                # rospy.loginfo("class is %s ,X is %f, Y is %f", self.Class,Xmid,Ymid)
                self.Class = self.switch_class(tmp_box.Class)   #传入垃圾类别并进行判断分类

                angleX = self.calculateAngleX(Xmid) #做数学转换获取色块在画幅中的坐标
                angleY = self.calculateAngleY(Ymid)
                # rospy.loginfo('X=%f , Y=%f',Xmid,Ymid)
                # rospy.loginfo('X=%f , Y=%f',angleX,angleY)
                rotation=self.calculateRotation(Xmin,Xmax,Ymin,Ymax)#角度位姿 待测试

                self.publishPosition(angleX,angleY,rotation,count) #发布话题：色块的位置（原始数据）
                self.publishArm_Angle(angleX,angleY,rotation,count)	 #发布话题：根据色块位置求解的机械臂关节目标弧度话题
        else:
            #没有检测到目标
            angleX = 999
            angleY = 999
            rotation=999
            self.publishPosition(angleX,angleY,rotation,count)
            self.publishArm_Angle(angleX,angleY,rotation,count)
        
    # def image_callback(self, msg):#重写

        # image = self.bridge.imgmsg_to_cv2(msg, desired_encoding='bgr8')
        # image = cv2.resize(image, (320,240), interpolation=cv2.INTER_AREA)#提高帧率
        # cv2.imshow("window", image)
        # cv2.waitKey(3)


    def calculateAngleX(self, pos):
        centerX = pos
        displacement = 2*centerX/self.pictureWidth-1
        angle = -1*np.arctan(displacement*self.tanHorizontal)
        return angle

    def calculateAngleY(self, pos):
        centerY = pos
        displacement = 2*centerY/self.pictureHeight-1
        angle = -1*np.arctan(displacement*self.tanVertical)
        return angle
    
    def calculateRotation(self,Xmin,Xmax,Ymin,Ymax):
        if abs((Xmax-Xmin)/(Ymax-Ymin)) <= 1 :
            return 0
        else :
            return -90  #待测 或90

    def single_send(self,Class): #串口发送 待写（注意数据统计）
        if Class == 1:
            print('recycle')

        elif Class == 2:
            print('harm')

        elif Class == 3:
            print('kitchen')

        elif Class == 4:
            print('others')
            
        else:
            print('none')

    
    def switch_class(self,bclass):# 根据yolo返回类别进行类别分类
        if bclass == 'recycle_cans1' or 'recycle_cans2' or 'recycle_bottle' or 'recycle_paper':
            return 1
        elif bclass == 'harm_battery':
            return 2
        elif bclass == 'kitchen_potato' or 'kitchen_raddish' or 'kitchen_carrot' :
            return 3
        elif bclass == 'others_pebble' or 'others':
            return 4
        else :
            return 999
        

    def publishPosition(self, x,y,rotate,count):
        # publish the position (angleX, angleY, distance)
        if self.Class==1:
            posMsg = PositionMsg(x, y, rotate,count,'recycle')
        elif self.Class==2:
            posMsg = PositionMsg(x, y, rotate,count,'harm')
        elif self.Class==3:
            posMsg = PositionMsg(x, y, rotate,count,'kitchen')
        elif self.Class==4:
            posMsg = PositionMsg(x, y, rotate,count,'others')
        else :
            posMsg = PositionMsg(x, y, rotate,count,'none')

        if x==999 and y == 999:
            posMsg = PositionMsg(x, y, rotate,count,'none_rubbish')

        self.positionPublisher.publish(posMsg)

    def publishArm_Angle(self, x,y,rotate,count):

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
        #通过self.Class判断是什么类别的垃圾
        #m=1绿色，m=2蓝色，m=3黄色
        if self.Class==1:
            self.recycle_count=self.recycle_count +1
            if self.recycle_count >5: #每五次数据再发布一次话题（控制话题发布速率）
               self.recycle_count = 0
               ikMsg=color_ik_result_Msg(pedestal_angle,arm_angle,hand_angle,'recycle',count)
               self.arm_ik_angle_Publisher.publish(ikMsg)
        if self.Class==2:
            self.harm_count=self.harm_count +1
            if self.harm_count >5: #每五次数据再发布一次话题（控制话题发布速率）
               self.harm_count = 0
               ikMsg=color_ik_result_Msg(pedestal_angle,arm_angle,hand_angle,'harm',count)
               self.arm_ik_angle_Publisher.publish(ikMsg)
        if self.Class==3:
            self.kitchen_count=self.kitchen_count +1
            if self.kitchen_count >5: #每五次数据再发布一次话题（控制话题发布速率）
               self.kitchen_count = 0
               ikMsg=color_ik_result_Msg(pedestal_angle,arm_angle,hand_angle,'kitchen',count)
               self.arm_ik_angle_Publisher.publish(ikMsg)
        if self.Class==4:
            self.others_count=self.others_count +1
            if self.others_count >5: #每五次数据再发布一次话题（控制话题发布速率）
               self.others_count = 0
               ikMsg=color_ik_result_Msg(pedestal_angle,arm_angle,hand_angle,'others',count)
               self.arm_ik_angle_Publisher.publish(ikMsg)


rospy.init_node("find_color")
find_color = Find_Color()
rospy.spin()

