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
import serial   #导入串口通信库
from time import sleep

ser = serial.Serial()

class Serial_COM:
	def __init__(self):
        
		self.com_sub = rospy.Subscriber("/Com_pub", Serial_RT, self.com_callback)#订阅识别类别话题
        # self.flag_sub = rospy.Subscriber("/Flag_pub", Flag, self.flag_callback)#订阅Flag状态话题
 
		self.flagPublisher = rospy.Publisher('/Flag_pub', Flag, queue_size=10) #发布色块的位置（原始数据）
        # self.arm_ik_angle_Publisher = rospy.Publisher('/color_ik_result_new', color_ik_result_Msg, queue_size=10)#发布根据色块位置求解的机械臂关节目标弧度话题
        # self.visual_flagPublisher = rospy.Publisher('/visual_func_flag', Int8, queue_size =1)

	def com_callback(self,msg):
		rospy.loginfo("com_callback: %s,%d",msg.sendClass, msg.count)
		# self.send_message(msg.count,msg.sendClass)

	def pub_flag():	#超声波判断投入发布flag
		ismoving = 0
		isputing = 1
    	# count  预留，为超声波计数
		flagMSG = Flag(ismoving,isputing)
		self.flagPublisher.publish(flagMSG)
		isputing = 0

		

       
	def send_message(self,bcount,bclass):
		if bclass == 'recycle':
			if bcount == 1:
				send('0A')
				rospy.loginfo("0A")
			elif bcount >1:
				send('1A')
				rospy.loginfo("1A")
		elif bclass == 'harm':
			if bcount == 1:
				send('0B')
				rospy.loginfo("0B")
			elif bcount >1:
				send('1B')
				rospy.loginfo("1B")
		elif bclass == 'kitchen':
			if bcount == 1:
				send('0C')
				rospy.loginfo("0C")
			elif bcount >1:
				send('1C')
				rospy.loginfo("1C")
		elif bclass == 'others':
			if bcount == 1:
				send('0D')
				rospy.loginfo("0D")
			elif bcount >1:
				send('1D')
				rospy.loginfo("1D")
		else :
			rospy.loginfo("未发送")



	def port_open_recv():#对串口的参数进行配置
		ser.port='com3'
		ser.baudrate=9600
		ser.bytesize=8
		ser.stopbits=1
		ser.parity="N"#奇偶校验位
		ser.open()
		if(ser.isOpen()):
			rospy.loginfo("串口打开成功！")
		else:
			rospy.loginfo("串口打开失败！")
	#isOpen()函数来查看串口的开闭状态

	def port_close():
		ser.close()
		if(ser.isOpen()):
			rospy.loginfo("串口关闭失败！")
		else:
			rospy.loginfo("串口关闭成功！")

	def send(send_data):
		if(ser.isOpen()):
			ser.write(send_data.encode('utf-8'))#编码
			rospy.loginfo("发送成功",send_data)
		else:
			rospy.loginfo("发送失败！")


rospy.init_node("Serial_COM")
# self.port_open_recv()		后续放出来
rt_serial = Serial_COM()
# while 1:
# 	strRead = ser.read().decode("utf-8")
# 	if strRead:
# 		rospy.loginfo("串口读取到：",strRead)
# 		self.pub_flag()	
	# rospy.spin()
rospy.spin()

#在收到超声波后，发布Flag-isPuting（待完善）
#收到分类信息后，串口发送信息(待测)
#待解决：仅能收到count>1的值
#思路：count=1放在find.py实现