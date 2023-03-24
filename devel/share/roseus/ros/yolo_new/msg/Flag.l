;; Auto-generated. Do not edit!


(when (boundp 'yolo_new::Flag)
  (if (not (find-package "YOLO_NEW"))
    (make-package "YOLO_NEW"))
  (shadow 'Flag (find-package "YOLO_NEW")))
(unless (find-package "YOLO_NEW::FLAG")
  (make-package "YOLO_NEW::FLAG"))

(in-package "ROS")
;;//! \htmlinclude Flag.msg.html


(defclass yolo_new::Flag
  :super ros::object
  :slots (_isMoving ))

(defmethod yolo_new::Flag
  (:init
   (&key
    ((:isMoving __isMoving) 0)
    )
   (send-super :init)
   (setq _isMoving (round __isMoving))
   self)
  (:isMoving
   (&optional __isMoving)
   (if __isMoving (setq _isMoving __isMoving)) _isMoving)
  (:serialization-length
   ()
   (+
    ;; int32 _isMoving
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _isMoving
       (write-long _isMoving s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _isMoving
     (setq _isMoving (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get yolo_new::Flag :md5sum-) "50d413790f6da206e162d072e2ef3ab7")
(setf (get yolo_new::Flag :datatype-) "yolo_new/Flag")
(setf (get yolo_new::Flag :definition-)
      "int32 isMoving

")



(provide :yolo_new/Flag "50d413790f6da206e162d072e2ef3ab7")


