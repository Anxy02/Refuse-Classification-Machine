#!/usr/bin/env python3
# coding=utf-8

import rospy
import cv2

cap = cv2.VideoCapture('sort.mp4')
while cap.isOpened():
    ret, frame = cap.read()
    if not ret:
        cap.set(cv2.CAP_PROP_POS_FRAMES, 0)
        continue
    cv2.imshow('video', frame)
    # if cv2.waitKey(25) & 0xFF == ord('q'):
    #     break
cap.release()
cv2.destroyAllWindows()