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
  :slots (_isMoving _isPuting ))

(defmethod yolo_new::Flag
  (:init
   (&key
    ((:isMoving __isMoving) 0)
    ((:isPuting __isPuting) 0)
    )
   (send-super :init)
   (setq _isMoving (round __isMoving))
   (setq _isPuting (round __isPuting))
   self)
  (:isMoving
   (&optional __isMoving)
   (if __isMoving (setq _isMoving __isMoving)) _isMoving)
  (:isPuting
   (&optional __isPuting)
   (if __isPuting (setq _isPuting __isPuting)) _isPuting)
  (:serialization-length
   ()
   (+
    ;; int32 _isMoving
    4
    ;; int32 _isPuting
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _isMoving
       (write-long _isMoving s)
     ;; int32 _isPuting
       (write-long _isPuting s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _isMoving
     (setq _isMoving (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _isPuting
     (setq _isPuting (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get yolo_new::Flag :md5sum-) "3863caec8075fcfd7c44f1691519daf7")
(setf (get yolo_new::Flag :datatype-) "yolo_new/Flag")
(setf (get yolo_new::Flag :definition-)
      "int32 isMoving
int32 isPuting

")



(provide :yolo_new/Flag "3863caec8075fcfd7c44f1691519daf7")


