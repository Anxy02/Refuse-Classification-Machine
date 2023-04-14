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
from yolo_new.msg import Flag,Serial_RT

last_erro=0
IsMoving = 0
# IsPuting = 1    #后续改为0，依靠超声波判断
SingleSortOK = 1
overLoad = 'none'
overLoadStr = ''
Sort_show = []  #图像输出的信息
tmp_ok = "OK!"
show_i = 1
objectNum = 0
judge_class = 0
judge_i = 0
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
        self.color_image = Image()
        self.image_sub = rospy.Subscriber('/yolov5/detection_image', Image, self.image_callback,queue_size=1, buff_size=52428800)
        self.box_sub = rospy.Subscriber("/yolov5/BoundingBoxes", BoundingBoxes, self.box_callback)#订阅识别类别话题
        self.flag_sub = rospy.Subscriber("/Flag_pub", Flag, self.flag_callback)#订阅移动状态话题
        self.com_sub = rospy.Subscriber("/Com_pub", Serial_RT, self.com_callback)#订阅分类通讯话题
 
        self.positionPublisher = rospy.Publisher('/color_position', PositionMsg, queue_size=10) #发布色块的位置（原始数据）
        self.arm_ik_angle_Publisher = rospy.Publisher('/color_ik_result_new', color_ik_result_Msg, queue_size=10)#发布根据色块位置求解的机械臂关节目标弧度话题
        self.visual_flagPublisher = rospy.Publisher('/visual_func_flag', Int8, queue_size =1)
        self.twist = Twist()
        # self.count=0       #每个色块检测次数的计数值
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

    def com_callback(self,msg):
        global show_i
        global Sort_show
        global objectNum

        objectNum = msg.ONum
        out_str = self.switchONum(objectNum)

        # 等待新模型训练好后将下面放出来  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        if out_str != 'none':
            tmp_str = f"{show_i} {out_str} {1} {tmp_ok}"
            show_i += 1
            Sort_show.append(tmp_str)


    def flag_callback(self,msg):
        global IsMoving
        global SingleSortOK
        global overLoad
        global overLoadStr
        IsMoving = msg.isMoving
        SingleSortOK = msg.singleSortOK
        overLoad= msg.OverLoad
        if overLoad != 'none':
            if overLoad == 'A':
                overLoadStr = 'Machine OverLoad'+'-recycle !!!'
            elif overLoad == 'B':
                overLoadStr = 'Machine OverLoad'+'-harm !!!'
            elif overLoad == 'C':
                overLoadStr = 'Machine OverLoad'+'-kitchen !!!'
            elif overLoad == 'D':
                overLoadStr = 'Machine OverLoad'+'-others !!!'
            overLoad = 'none'
            print(overLoadStr)
        # if overLoad != 'none':
        #     rospy.loginfo('overLoad is %s' ,overLoad)
        # IsPuting = msg.isPuting
        # print("flag_msg is",IsMoving)


    def box_callback(self,msg):
        global IsMoving
        global SingleSortOK
        global show_i
        global judge_class
        global judge_i
        count=0
                        
        for i in msg.bounding_boxes:
            count+=1

        if IsMoving == 0 :  #机械臂没有运动
            if count > 1:
                return      #初赛用！！！！！！！！！！！！！！！！！！！！！！！！决赛放出来！

                for tmp_box in msg.bounding_boxes:
                    Xmid=tmp_box.xmid/2
                    Ymid=tmp_box.ymid/2
                    Xmin=tmp_box.xmin
                    Xmax=tmp_box.xmax
                    Ymin=tmp_box.ymin
                    Ymax=tmp_box.ymax

                    tmp_class=tmp_box.Class     #垃圾文字
                    # rospy.loginfo("class is %s ,X is %f, Y is %f", self.Class,Xmid,Ymid)
                    # self.Class = self.switch_class(tmp_box.Class)   #传入垃圾类别并进行判断分类
                    self.Class = tmp_box.CNum   #垃圾类别号码
                    self.ONum = tmp_box.ONum    #垃圾号码


                    angleX = self.calculateAngleX(Xmid) #做数学转换获取色块在画幅中的坐标
                    angleY = self.calculateAngleY(Ymid)
                    rotation=self.calculateRotation(Xmin,Xmax,Ymin,Ymax)#角度位姿
                    self.publishPosition(angleX,angleY,rotation,count) #发布话题：色块的位置（原始数据）
                    self.publishArm_Angle(angleX,angleY,rotation,count)	 #发布话题：根据色块位置求解的机械臂关节目标弧度话题
                    SingleSortOK = 0    #强制清零
                    # IsPuting = 0  后续放出来
            
            elif count == 1 and SingleSortOK == 1:  
                # 进行5次判断防止误进入
                if judge_class != msg.bounding_boxes[0].CNum :
                    judge_class = msg.bounding_boxes[0].CNum #垃圾类别
                    judge_i = 0
                    return
                else:
                    if judge_i < 5:
                        judge_i += 1
                        return
                    else:
                        rospy.loginfo('单目标：：：%s',msg.bounding_boxes[0].Class)
                        
                        self.Class = msg.bounding_boxes[0].CNum #垃圾类别号码
                        self.ONum = msg.bounding_boxes[0].ONum  #垃圾号码

                        self.single_send(self.Class)  #单目标发送
                        SingleSortOK = 0
                        judge_class = 0
                        judge_i = 0
                    

            else:
                #没有检测到目标
                # rospy.loginfo("fuck!!!!!!!!!!")
                angleX = 999
                angleY = 999
                rotation=999
                # self.publishPosition(angleX,angleY,rotation,count)
                # self.publishArm_Angle(angleX,angleY,rotation,count)
        
    def image_callback(self, image):
        # 将垃圾分类信息在此显示
        global Sort_show
        global overLoad
        global overLoadStr
        # self.getImageStatus = True
        self.color_image = np.frombuffer(image.data, dtype=np.uint8).reshape(
            image.height, image.width, -1)
        self.color_image = cv2.cvtColor(self.color_image, cv2.COLOR_BGR2RGB)
        self.color_image = self.white_balance_1(self.color_image)
        
        
        # print(overLoad)
        

        length = len(Sort_show)
        tmp_x = 0
        tmp_y = 20
        for i in range(length):
            cv2.putText(self.color_image, Sort_show[i],
                        (int(tmp_x), int(tmp_y)), cv2.FONT_HERSHEY_SIMPLEX, 0.6, (0, 255, 255), 1,
                        cv2.LINE_AA)
            cv2.putText(self.color_image, overLoadStr,
                        (150, 150), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 255), 1,
                        cv2.LINE_AA)
            tmp_y += 20
            
        
        

        # cv2.rectangle(self.color_image, (int(box[0]), int(box[1])),
        #                   (int(box[2]), int(box[3])), (int(color[0]), int(color[1]), int(color[2])), 2)
        # cv2.putText(self.color_image, box[-1],
        #                 (int(box[0]), int(text_pos_y) - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.6, (255, 255, 255), 2,
        #                 cv2.LINE_AA)

        # 最终放出来
        cv2.namedWindow('YOLOv5_show', cv2.WINDOW_NORMAL) #WINDOW_NORMAL：可以调整窗口大小
        cv2.setWindowProperty('YOLOv5_show', cv2.WND_PROP_FULLSCREEN, cv2.WINDOW_FULLSCREEN) #全屏显示
        
        # cv2.moveWindow("winname",x,y)
            # winname ： 将被设置的窗口的名字。
            # x ：窗口左上角的x坐标。
            # y ：窗口左上角的y坐标。
        cv2.imshow('YOLOv5_show', self.color_image)
        cv2.waitKey(3)

    def white_balance_1(self,img):
        '''
        第一种简单的求均值白平衡法
        :param img: cv2.imread读取的图片数据
        :return: 返回的白平衡结果图片数据
        '''
        # 读取图像
        r, g, b = cv2.split(img)
        r_avg = cv2.mean(r)[0]
        g_avg = cv2.mean(g)[0]
        b_avg = cv2.mean(b)[0]
        # 求各个通道所占增益
        k = (r_avg + g_avg + b_avg) / 3
        kr = k / r_avg + 0.1
        kg = k / g_avg + 0.1
        kb = k / b_avg
        r = cv2.addWeighted(src1=r, alpha=kr, src2=0, beta=0, gamma=0)
        g = cv2.addWeighted(src1=g, alpha=kg, src2=0, beta=0, gamma=0)
        b = cv2.addWeighted(src1=b, alpha=kb, src2=0, beta=0, gamma=0)
        balance_img = cv2.merge([b, g, r])
        return balance_img

    
    def switchONum(self,num):
        if num == 1:
            return 'recycle_can'
        elif num == 2:
            return 'recycle_bottle'
        elif num == 3:
            return 'recycle_paper'
        elif num == 4:
            return 'harm_battery'
        elif num == 5:#白萝卜
            return 'kitchen_ternip'
        elif num == 6:
            return 'kitchen_carrot'
        elif num == 7:
            return 'kitchen_potato'
        elif num == 8:#瓷片
            return 'others_chip'
        elif num == 9:
            return 'others_stone'
        else :
            return 'none'

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
            return 60  #待测 -45~45度保持不变,可写90度

    def single_send(self,Class): #单目标发送
        if Class == 1:
            ikMsg=color_ik_result_Msg(999,999,999,'recycle',1,self.ONum)
            self.arm_ik_angle_Publisher.publish(ikMsg)
            print('single_recycle')

        elif Class == 2:
            ikMsg=color_ik_result_Msg(999,999,999,'harm',1,self.ONum)
            self.arm_ik_angle_Publisher.publish(ikMsg)
            print('single_harm')

        elif Class == 3:
            ikMsg=color_ik_result_Msg(999,999,999,'kitchen',1,self.ONum)
            self.arm_ik_angle_Publisher.publish(ikMsg)
            print('single_kitchen')

        elif Class == 4:
            ikMsg=color_ik_result_Msg(999,999,999,'others',1,self.ONum)
            self.arm_ik_angle_Publisher.publish(ikMsg)
            print('single_others')
            
        else:
            print('none')


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

        caculate_A=self.link_a*sin(self.basic_angle) +sin(self.auxiliary_angle)*self.link_c
        caculate_B=self.link_a*cos(self.basic_angle) +cos(self.auxiliary_angle)*self.link_c
        caculate_C=(sqrt(pow(true_x,2)+ pow(true_y,2))-self.link_b)
        caculate_D= acos( caculate_C/(sqrt(pow(caculate_A,2)+ pow(caculate_B,2) ) ) )
        caculate_E= atan(caculate_B/caculate_A) 
        caculate_G=(caculate_E-caculate_D)


        hand_angle = rotate + 90 #角度正反关系转换
        if  hand_angle >45 :
             hand_angle  = hand_angle -90

        pedestal_angle = radians(pedestal_angle) #云台的目标运动角度,radians函数是弧度转角度
        arm_angle      = (caculate_G)  #控制机械臂臂长的目标角度,radians函数是弧度转角度
        hand_angle     = radians(hand_angle) #控制夹取色块旋转的目标角度,radians函数是弧度转角度
        #通过self.Class判断是什么类别的垃圾
        if self.Class==1:
            ikMsg=color_ik_result_Msg(pedestal_angle,arm_angle,hand_angle,'recycle',count,self.ONum)
            self.arm_ik_angle_Publisher.publish(ikMsg)
        if self.Class==2:
            ikMsg=color_ik_result_Msg(pedestal_angle,arm_angle,hand_angle,'harm',count,self.ONum)
            self.arm_ik_angle_Publisher.publish(ikMsg)
        if self.Class==3:
            ikMsg=color_ik_result_Msg(pedestal_angle,arm_angle,hand_angle,'kitchen',count,self.ONum)
            self.arm_ik_angle_Publisher.publish(ikMsg)
        if self.Class==4:
            ikMsg=color_ik_result_Msg(pedestal_angle,arm_angle,hand_angle,'others',count,self.ONum)
            self.arm_ik_angle_Publisher.publish(ikMsg)
        # rospy.loginfo('py层发送ONum is %d~~~~~~~~~~~~~~~~~~~~~~~~~~~' ,self.ONum)

rospy.init_node("yolo_detect")
yolo_detect = Find_Color()
rospy.spin()

#kinematics_solver: trac_ik_kinematics_plugin/TRAC_IKKinematicsPlugin
