;; Auto-generated. Do not edit!


(when (boundp 'wheeltec_tracker_pkg::centroid)
  (if (not (find-package "WHEELTEC_TRACKER_PKG"))
    (make-package "WHEELTEC_TRACKER_PKG"))
  (shadow 'centroid (find-package "WHEELTEC_TRACKER_PKG")))
(unless (find-package "WHEELTEC_TRACKER_PKG::CENTROID")
  (make-package "WHEELTEC_TRACKER_PKG::CENTROID"))

(in-package "ROS")
;;//! \htmlinclude centroid.msg.html


(defclass wheeltec_tracker_pkg::centroid
  :super ros::object
  :slots (_x _y _leftupper_x _leftupper_y _rightlower_w _rightlower_h ))

(defmethod wheeltec_tracker_pkg::centroid
  (:init
   (&key
    ((:x __x) 0)
    ((:y __y) 0)
    ((:leftupper_x __leftupper_x) 0)
    ((:leftupper_y __leftupper_y) 0)
    ((:rightlower_w __rightlower_w) 0)
    ((:rightlower_h __rightlower_h) 0)
    )
   (send-super :init)
   (setq _x (round __x))
   (setq _y (round __y))
   (setq _leftupper_x (round __leftupper_x))
   (setq _leftupper_y (round __leftupper_y))
   (setq _rightlower_w (round __rightlower_w))
   (setq _rightlower_h (round __rightlower_h))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:leftupper_x
   (&optional __leftupper_x)
   (if __leftupper_x (setq _leftupper_x __leftupper_x)) _leftupper_x)
  (:leftupper_y
   (&optional __leftupper_y)
   (if __leftupper_y (setq _leftupper_y __leftupper_y)) _leftupper_y)
  (:rightlower_w
   (&optional __rightlower_w)
   (if __rightlower_w (setq _rightlower_w __rightlower_w)) _rightlower_w)
  (:rightlower_h
   (&optional __rightlower_h)
   (if __rightlower_h (setq _rightlower_h __rightlower_h)) _rightlower_h)
  (:serialization-length
   ()
   (+
    ;; int32 _x
    4
    ;; int32 _y
    4
    ;; int32 _leftupper_x
    4
    ;; int32 _leftupper_y
    4
    ;; int32 _rightlower_w
    4
    ;; int32 _rightlower_h
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _x
       (write-long _x s)
     ;; int32 _y
       (write-long _y s)
     ;; int32 _leftupper_x
       (write-long _leftupper_x s)
     ;; int32 _leftupper_y
       (write-long _leftupper_y s)
     ;; int32 _rightlower_w
       (write-long _rightlower_w s)
     ;; int32 _rightlower_h
       (write-long _rightlower_h s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _x
     (setq _x (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _y
     (setq _y (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _leftupper_x
     (setq _leftupper_x (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _leftupper_y
     (setq _leftupper_y (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _rightlower_w
     (setq _rightlower_w (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _rightlower_h
     (setq _rightlower_h (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get wheeltec_tracker_pkg::centroid :md5sum-) "e0648a54cb14a169de06ff0677b4c869")
(setf (get wheeltec_tracker_pkg::centroid :datatype-) "wheeltec_tracker_pkg/centroid")
(setf (get wheeltec_tracker_pkg::centroid :definition-)
      "int32 x
int32 y
int32 leftupper_x
int32 leftupper_y
int32 rightlower_w
int32 rightlower_h

")



(provide :wheeltec_tracker_pkg/centroid "e0648a54cb14a169de06ff0677b4c869")


