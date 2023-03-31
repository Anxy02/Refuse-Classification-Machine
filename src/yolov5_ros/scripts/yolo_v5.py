#!/usr/bin/env python
# -*- coding: utf-8 -*-

import cv2
import torch
import rospy
import numpy as np

from std_msgs.msg import Header
from sensor_msgs.msg import Image
from yolov5_ros_msgs.msg import BoundingBox, BoundingBoxes
from yolo_new.msg import Flag,Serial_RT
IsMoving = 0
SingleSortOK = 1

class Yolo_Dect:
    def __init__(self):

        # load parameters

        yolov5_path = rospy.get_param('/yolov5_path', '')

        weight_path = rospy.get_param('~weight_path', '')
        image_topic = rospy.get_param(
            '~image_topic', '/camera/color/image_raw')
        pub_topic = rospy.get_param('~pub_topic', '/yolov5/BoundingBoxes')
        self.camera_frame = rospy.get_param('~camera_frame', '')
        conf = rospy.get_param('~conf', '0.5')

        # load local repository(YoloV5:v6.0)
        self.model = torch.hub.load(yolov5_path, 'custom',
                                    path=weight_path, source='local')
        self.model.cpu()
        # which device will be used
        #if (rospy.get_param('/use_cpu', 'false')):
        #    self.model.cpu()
        #else:
        #    self.model.cuda()

        self.model.conf = conf
        self.color_image = Image()
        self.depth_image = Image()
        self.getImageStatus = False

        self.classes_colors = {}

        # image subscribe
        self.color_sub = rospy.Subscriber(image_topic, Image, self.image_callback,
                                          queue_size=1, buff_size=52428800)
        self.flag_sub = rospy.Subscriber("/Flag_pub", Flag, self.flag_callback)#订阅移动状态话题
        

        # output publishers
        #queue_size 实时收发信息
        self.position_pub = rospy.Publisher(
            pub_topic, BoundingBoxes, queue_size=1)

        self.image_pub = rospy.Publisher(
            '/yolov5/detection_image', Image, queue_size=1)

        # if no image messages
        while (not self.getImageStatus):
            rospy.loginfo("waiting for image.")
            rospy.sleep(2)

    def flag_callback(self,msg):
        global IsMoving
        global SingleSortOK
        IsMoving = msg.isMoving
        SingleSortOK = msg.singleSortOK

    def image_callback(self, image):
        global IsMoving
        global SingleSortOK
        
        self.boundingBoxes = BoundingBoxes()
        self.boundingBoxes.header = image.header
        self.boundingBoxes.image_header = image.header
        self.getImageStatus = True
        self.color_image = np.frombuffer(image.data, dtype=np.uint8).reshape(
            image.height, image.width, -1)
        self.color_image = cv2.cvtColor(self.color_image, cv2.COLOR_BGR2RGB)

        results = self.model(self.color_image)
        # xmin    ymin    xmax   ymax  confidence  class    name

        boxs = results.pandas().xyxy[0].values
        self.dectshow(self.color_image, boxs, image.height, image.width)

        cv2.waitKey(3)

    def dectshow(self, org_img, boxs, height, width):
        img = org_img.copy()

        count = 0
        for i in boxs:
            count += 1

        for box in boxs:
            boundingBox = BoundingBox()
            boundingBox.probability = np.float64(box[4])
            boundingBox.xmin = np.int64(box[0])
            boundingBox.ymin = np.int64(box[1])
            boundingBox.xmax = np.int64(box[2])
            boundingBox.ymax = np.int64(box[3])
            boundingBox.xmid = (np.int64(box[0])+np.int64(box[2]))/2
            boundingBox.ymid = (np.int64(box[1])+np.int64(box[3]))/2
            boundingBox.num = np.int16(count)
            boundingBox.Class = box[-1]
            boundingBox.CNum = self.switch_class(boundingBox.Class)   #传入垃圾类别并进行判断分类
            # boundingBox.ONum = self.switch_num(boundingBox.Class)


            if box[-1] in self.classes_colors.keys():
                color = self.classes_colors[box[-1]]
            else:
                color = np.random.randint(0, 183, 3)
                self.classes_colors[box[-1]] = color

            cv2.rectangle(img, (int(box[0]), int(box[1])),
                          (int(box[2]), int(box[3])), (int(color[0]), int(color[1]), int(color[2])), 2)

            if box[1] < 20:
                text_pos_y = box[1] + 30
            else:
                text_pos_y = box[1] - 10

            # cv2.putText(img, box[-1] + label,
            #             (int(box[0]), int(text_pos_y) - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.6, (255, 255, 255), 2,
            #             cv2.LINE_AA)
            cv2.putText(img, box[-1],
                        (int(box[0]), int(text_pos_y) - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.6, (255, 255, 255), 2,
                        cv2.LINE_AA)

            self.boundingBoxes.bounding_boxes.append(boundingBox)
            self.position_pub.publish(self.boundingBoxes)
        self.publish_image(img, height, width)
        # cv2.imshow('YOLOv5', img)

    def switch_class(self,bclass):# 根据yolo返回类别进行类别分类 CNum
        if bclass == "recycle_cans1" or bclass == "recycle_cans2" or bclass == "recycle_bottle" or bclass == "recycle_paper":
            return 1
        elif bclass == "harm_battery " :
            return 2
        elif bclass == "kitchen_potato" or bclass == "kitchen_raddish" or bclass == "kitchen_carrot" :
            return 3
        elif bclass == "others_pebble" or bclass == "others":
            return 4
        else :
            return 999
    
    def switch_num(self,bclass):    #定义垃圾类别 ONum
        if bclass == 'recycle_can':
            return 1
        elif bclass == 'recycle_bottle':
            return 2
        elif bclass == 'recycle_paper':
            return 3
        elif bclass == 'harm_battery':
            return 4
        elif bclass == 'kitchen_ternip':#白萝卜
            return 5
        elif bclass == 'kitchen_carrot':
            return 6
        elif bclass == 'kitchen_potato':
            return 7
        elif bclass == 'others_chip':#瓷片
            return 8
        elif bclass == 'others_stone':
            return 9
        else :
            return 999
        

    def publish_image(self, imgdata, height, width):
        image_temp = Image()
        header = Header(stamp=rospy.Time.now())
        header.frame_id = self.camera_frame
        image_temp.height = height
        image_temp.width = width
        image_temp.encoding = 'bgr8'
        image_temp.data = np.array(imgdata).tobytes()
        image_temp.header = header
        image_temp.step = width * 3
        self.image_pub.publish(image_temp)


def main():
    rospy.init_node('yolov5_ros', anonymous=True)
    yolo_dect = Yolo_Dect()
    rospy.spin()


if __name__ == "__main__":
    main()
