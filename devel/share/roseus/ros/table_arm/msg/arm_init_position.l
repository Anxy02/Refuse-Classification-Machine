;; Auto-generated. Do not edit!


(when (boundp 'table_arm::arm_init_position)
  (if (not (find-package "TABLE_ARM"))
    (make-package "TABLE_ARM"))
  (shadow 'arm_init_position (find-package "TABLE_ARM")))
(unless (find-package "TABLE_ARM::ARM_INIT_POSITION")
  (make-package "TABLE_ARM::ARM_INIT_POSITION"))

(in-package "ROS")
;;//! \htmlinclude arm_init_position.msg.html


(defclass table_arm::arm_init_position
  :super ros::object
  :slots (_init_joint1 _init_joint2 _init_joint3 _init_joint4 _init_joint5 _init_joint6 _save_init_pose _arm_look _arm_home ))

(defmethod table_arm::arm_init_position
  (:init
   (&key
    ((:init_joint1 __init_joint1) 0)
    ((:init_joint2 __init_joint2) 0)
    ((:init_joint3 __init_joint3) 0)
    ((:init_joint4 __init_joint4) 0)
    ((:init_joint5 __init_joint5) 0)
    ((:init_joint6 __init_joint6) 0)
    ((:save_init_pose __save_init_pose) 0)
    ((:arm_look __arm_look) 0)
    ((:arm_home __arm_home) 0)
    )
   (send-super :init)
   (setq _init_joint1 (round __init_joint1))
   (setq _init_joint2 (round __init_joint2))
   (setq _init_joint3 (round __init_joint3))
   (setq _init_joint4 (round __init_joint4))
   (setq _init_joint5 (round __init_joint5))
   (setq _init_joint6 (round __init_joint6))
   (setq _save_init_pose (round __save_init_pose))
   (setq _arm_look (round __arm_look))
   (setq _arm_home (round __arm_home))
   self)
  (:init_joint1
   (&optional __init_joint1)
   (if __init_joint1 (setq _init_joint1 __init_joint1)) _init_joint1)
  (:init_joint2
   (&optional __init_joint2)
   (if __init_joint2 (setq _init_joint2 __init_joint2)) _init_joint2)
  (:init_joint3
   (&optional __init_joint3)
   (if __init_joint3 (setq _init_joint3 __init_joint3)) _init_joint3)
  (:init_joint4
   (&optional __init_joint4)
   (if __init_joint4 (setq _init_joint4 __init_joint4)) _init_joint4)
  (:init_joint5
   (&optional __init_joint5)
   (if __init_joint5 (setq _init_joint5 __init_joint5)) _init_joint5)
  (:init_joint6
   (&optional __init_joint6)
   (if __init_joint6 (setq _init_joint6 __init_joint6)) _init_joint6)
  (:save_init_pose
   (&optional __save_init_pose)
   (if __save_init_pose (setq _save_init_pose __save_init_pose)) _save_init_pose)
  (:arm_look
   (&optional __arm_look)
   (if __arm_look (setq _arm_look __arm_look)) _arm_look)
  (:arm_home
   (&optional __arm_home)
   (if __arm_home (setq _arm_home __arm_home)) _arm_home)
  (:serialization-length
   ()
   (+
    ;; int8 _init_joint1
    1
    ;; int8 _init_joint2
    1
    ;; int8 _init_joint3
    1
    ;; int8 _init_joint4
    1
    ;; int8 _init_joint5
    1
    ;; int8 _init_joint6
    1
    ;; int8 _save_init_pose
    1
    ;; int8 _arm_look
    1
    ;; int8 _arm_home
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _init_joint1
       (write-byte _init_joint1 s)
     ;; int8 _init_joint2
       (write-byte _init_joint2 s)
     ;; int8 _init_joint3
       (write-byte _init_joint3 s)
     ;; int8 _init_joint4
       (write-byte _init_joint4 s)
     ;; int8 _init_joint5
       (write-byte _init_joint5 s)
     ;; int8 _init_joint6
       (write-byte _init_joint6 s)
     ;; int8 _save_init_pose
       (write-byte _save_init_pose s)
     ;; int8 _arm_look
       (write-byte _arm_look s)
     ;; int8 _arm_home
       (write-byte _arm_home s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _init_joint1
     (setq _init_joint1 (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _init_joint1 127) (setq _init_joint1 (- _init_joint1 256)))
   ;; int8 _init_joint2
     (setq _init_joint2 (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _init_joint2 127) (setq _init_joint2 (- _init_joint2 256)))
   ;; int8 _init_joint3
     (setq _init_joint3 (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _init_joint3 127) (setq _init_joint3 (- _init_joint3 256)))
   ;; int8 _init_joint4
     (setq _init_joint4 (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _init_joint4 127) (setq _init_joint4 (- _init_joint4 256)))
   ;; int8 _init_joint5
     (setq _init_joint5 (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _init_joint5 127) (setq _init_joint5 (- _init_joint5 256)))
   ;; int8 _init_joint6
     (setq _init_joint6 (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _init_joint6 127) (setq _init_joint6 (- _init_joint6 256)))
   ;; int8 _save_init_pose
     (setq _save_init_pose (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _save_init_pose 127) (setq _save_init_pose (- _save_init_pose 256)))
   ;; int8 _arm_look
     (setq _arm_look (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _arm_look 127) (setq _arm_look (- _arm_look 256)))
   ;; int8 _arm_home
     (setq _arm_home (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _arm_home 127) (setq _arm_home (- _arm_home 256)))
   ;;
   self)
  )

(setf (get table_arm::arm_init_position :md5sum-) "214a3a640e2cbc2daa6f74f00b9c277b")
(setf (get table_arm::arm_init_position :datatype-) "table_arm/arm_init_position")
(setf (get table_arm::arm_init_position :definition-)
      "int8 init_joint1
int8 init_joint2
int8 init_joint3
int8 init_joint4
int8 init_joint5
int8 init_joint6
int8 save_init_pose
int8 arm_look
int8 arm_home



")



(provide :table_arm/arm_init_position "214a3a640e2cbc2daa6f74f00b9c277b")


