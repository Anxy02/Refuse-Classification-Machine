#!/usr/bin/env python
# coding=utf-8
import os
import cv2
from aip import AipBodyAnalysis
import threading 
import base64
import demjson
from sensor_msgs.msg import Image
import cv2, cv_bridge
import rospy
import numpy as np
import time
from wheeltec_tracker_pkg.msg import gesture as Gesture
from std_msgs.msg import String as string_data
""" 你的 APPID AK SK """
APP_ID = '24549545'
API_KEY = 'tBt3I2f4Yui91SjGjfK6vvHU'
SECRET_KEY =  'rB5YAGd30OcYNAbQbN0P2bUuklwOU7yD'
''' 调用API'''
gesture_client = AipBodyAnalysis(APP_ID, API_KEY, SECRET_KEY)

class Follower:
    def __init__(self):

        self.res = 0
        self.msg='noon'
        self.bridge = cv_bridge.CvBridge()
        self.image_sub = rospy.Subscriber("/usb_cam/image_raw", Image, self.gesture_recognition)
        self.discern_result_pub = rospy.Publisher('discern_result', string_data, queue_size=10)

    def gesture_recognition(self, img):
        image = self.bridge.imgmsg_to_cv2(img, desired_encoding='bgr8')
        image = cv2.imencode(".png", image)[1].tobytes()
        result=gesture_client.gesture(image)
        gesture=result['result']
        try:
            gesture=gesture[0]['classname']
            self.res = gesture
        except:
            print('None')
            gesture='None'
            self.flag=0
        else:
            print(self.res)
            self.msg=string_data(self.res)
            self.discern_result_pub.publish(self.msg)
            

rospy.init_node("gesture_recognition")
follower = Follower()
rospy.spin()

