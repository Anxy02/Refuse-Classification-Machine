#!/usr/bin/env python3
# coding=utf-8

import rospy
import cv2, cv_bridge
import numpy as np
from yolo_new.msg import color_ik_result_new as color_ik_result_Msg

class video_show:
    def __init__(self):
        self.bridge = cv_bridge.CvBridge()
        self.moveFlag_sub = rospy.Subscriber("/color_ik_result_new", color_ik_result_Msg, self.flag_callback)#订阅移动状态话题


        video_path = rospy.get_param('~video_path', '')
        self.cap = cv2.VideoCapture(video_path)
        self.frame_counter = 0
        while self.cap.isOpened():
            self.ret, self.frame = self.cap.read()
            if not self.ret:
                self.cap.set(cv2.CAP_PROP_POS_FRAMES, 0)
                continue
            cv2.imshow('video', self.frame)
            if cv2.waitKey(25) & 0xFF == ord('q'):
                break

    def flag_callback(self,msg):
        if msg.ONum > 0:
            self.cap.release()
            cv2.destroyAllWindows()
            rospy.signal_shutdown("关闭视频播放")

rospy.init_node("video_mp4")
videoShow = video_show()
rospy.spin()