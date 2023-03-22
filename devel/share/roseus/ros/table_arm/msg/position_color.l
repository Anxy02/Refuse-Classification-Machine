;; Auto-generated. Do not edit!


(when (boundp 'table_arm::position_color)
  (if (not (find-package "TABLE_ARM"))
    (make-package "TABLE_ARM"))
  (shadow 'position_color (find-package "TABLE_ARM")))
(unless (find-package "TABLE_ARM::POSITION_COLOR")
  (make-package "TABLE_ARM::POSITION_COLOR"))

(in-package "ROS")
;;//! \htmlinclude position_color.msg.html


(defclass table_arm::position_color
  :super ros::object
  :slots (_angleX _angleY _rotation _count _color ))

(defmethod table_arm::position_color
  (:init
   (&key
    ((:angleX __angleX) 0.0)
    ((:angleY __angleY) 0.0)
    ((:rotation __rotation) 0.0)
    ((:count __count) 0)
    ((:color __color) "")
    )
   (send-super :init)
   (setq _angleX (float __angleX))
   (setq _angleY (float __angleY))
   (setq _rotation (float __rotation))
   (setq _count (round __count))
   (setq _color (string __color))
   self)
  (:angleX
   (&optional __angleX)
   (if __angleX (setq _angleX __angleX)) _angleX)
  (:angleY
   (&optional __angleY)
   (if __angleY (setq _angleY __angleY)) _angleY)
  (:rotation
   (&optional __rotation)
   (if __rotation (setq _rotation __rotation)) _rotation)
  (:count
   (&optional __count)
   (if __count (setq _count __count)) _count)
  (:color
   (&optional __color)
   (if __color (setq _color __color)) _color)
  (:serialization-length
   ()
   (+
    ;; float32 _angleX
    4
    ;; float32 _angleY
    4
    ;; float32 _rotation
    4
    ;; int32 _count
    4
    ;; string _color
    4 (length _color)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _angleX
       (sys::poke _angleX (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _angleY
       (sys::poke _angleY (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _rotation
       (sys::poke _rotation (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _count
       (write-long _count s)
     ;; string _color
       (write-long (length _color) s) (princ _color s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _angleX
     (setq _angleX (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _angleY
     (setq _angleY (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _rotation
     (setq _rotation (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _count
     (setq _count (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _color
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _color (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get table_arm::position_color :md5sum-) "5fddc2a4e1da7ee01660a69ccfefa88b")
(setf (get table_arm::position_color :datatype-) "table_arm/position_color")
(setf (get table_arm::position_color :definition-)
      "float32 angleX
float32 angleY
float32 rotation
int32   count
string  color



")



(provide :table_arm/position_color "5fddc2a4e1da7ee01660a69ccfefa88b")


