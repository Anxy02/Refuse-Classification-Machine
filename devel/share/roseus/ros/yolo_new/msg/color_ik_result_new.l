;; Auto-generated. Do not edit!


(when (boundp 'yolo_new::color_ik_result_new)
  (if (not (find-package "YOLO_NEW"))
    (make-package "YOLO_NEW"))
  (shadow 'color_ik_result_new (find-package "YOLO_NEW")))
(unless (find-package "YOLO_NEW::COLOR_IK_RESULT_NEW")
  (make-package "YOLO_NEW::COLOR_IK_RESULT_NEW"))

(in-package "ROS")
;;//! \htmlinclude color_ik_result_new.msg.html


(defclass yolo_new::color_ik_result_new
  :super ros::object
  :slots (_pedestal_angle _arm_angle _hand_angle _color _count ))

(defmethod yolo_new::color_ik_result_new
  (:init
   (&key
    ((:pedestal_angle __pedestal_angle) 0.0)
    ((:arm_angle __arm_angle) 0.0)
    ((:hand_angle __hand_angle) 0.0)
    ((:color __color) "")
    ((:count __count) 0)
    )
   (send-super :init)
   (setq _pedestal_angle (float __pedestal_angle))
   (setq _arm_angle (float __arm_angle))
   (setq _hand_angle (float __hand_angle))
   (setq _color (string __color))
   (setq _count (round __count))
   self)
  (:pedestal_angle
   (&optional __pedestal_angle)
   (if __pedestal_angle (setq _pedestal_angle __pedestal_angle)) _pedestal_angle)
  (:arm_angle
   (&optional __arm_angle)
   (if __arm_angle (setq _arm_angle __arm_angle)) _arm_angle)
  (:hand_angle
   (&optional __hand_angle)
   (if __hand_angle (setq _hand_angle __hand_angle)) _hand_angle)
  (:color
   (&optional __color)
   (if __color (setq _color __color)) _color)
  (:count
   (&optional __count)
   (if __count (setq _count __count)) _count)
  (:serialization-length
   ()
   (+
    ;; float32 _pedestal_angle
    4
    ;; float32 _arm_angle
    4
    ;; float32 _hand_angle
    4
    ;; string _color
    4 (length _color)
    ;; int32 _count
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _pedestal_angle
       (sys::poke _pedestal_angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _arm_angle
       (sys::poke _arm_angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _hand_angle
       (sys::poke _hand_angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; string _color
       (write-long (length _color) s) (princ _color s)
     ;; int32 _count
       (write-long _count s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _pedestal_angle
     (setq _pedestal_angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _arm_angle
     (setq _arm_angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _hand_angle
     (setq _hand_angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; string _color
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _color (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _count
     (setq _count (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get yolo_new::color_ik_result_new :md5sum-) "7a157a2786c3a90ccdf183915a4169d1")
(setf (get yolo_new::color_ik_result_new :datatype-) "yolo_new/color_ik_result_new")
(setf (get yolo_new::color_ik_result_new :definition-)
      "float32 pedestal_angle
float32 arm_angle
float32 hand_angle
string  color
int32   count


")



(provide :yolo_new/color_ik_result_new "7a157a2786c3a90ccdf183915a4169d1")


