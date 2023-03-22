;; Auto-generated. Do not edit!


(when (boundp 'table_arm::color_ik_result)
  (if (not (find-package "TABLE_ARM"))
    (make-package "TABLE_ARM"))
  (shadow 'color_ik_result (find-package "TABLE_ARM")))
(unless (find-package "TABLE_ARM::COLOR_IK_RESULT")
  (make-package "TABLE_ARM::COLOR_IK_RESULT"))

(in-package "ROS")
;;//! \htmlinclude color_ik_result.msg.html


(defclass table_arm::color_ik_result
  :super ros::object
  :slots (_pedestal_angle _arm_angle _hand_angle _color ))

(defmethod table_arm::color_ik_result
  (:init
   (&key
    ((:pedestal_angle __pedestal_angle) 0.0)
    ((:arm_angle __arm_angle) 0.0)
    ((:hand_angle __hand_angle) 0.0)
    ((:color __color) "")
    )
   (send-super :init)
   (setq _pedestal_angle (float __pedestal_angle))
   (setq _arm_angle (float __arm_angle))
   (setq _hand_angle (float __hand_angle))
   (setq _color (string __color))
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
   ;;
   self)
  )

(setf (get table_arm::color_ik_result :md5sum-) "26d2c0ae8f268cfc5f83e3b64098d2c7")
(setf (get table_arm::color_ik_result :datatype-) "table_arm/color_ik_result")
(setf (get table_arm::color_ik_result :definition-)
      "float32 pedestal_angle
float32 arm_angle
float32 hand_angle
string  color


")



(provide :table_arm/color_ik_result "26d2c0ae8f268cfc5f83e3b64098d2c7")


