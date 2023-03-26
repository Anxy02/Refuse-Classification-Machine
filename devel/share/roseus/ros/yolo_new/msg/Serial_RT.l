;; Auto-generated. Do not edit!


(when (boundp 'yolo_new::Serial_RT)
  (if (not (find-package "YOLO_NEW"))
    (make-package "YOLO_NEW"))
  (shadow 'Serial_RT (find-package "YOLO_NEW")))
(unless (find-package "YOLO_NEW::SERIAL_RT")
  (make-package "YOLO_NEW::SERIAL_RT"))

(in-package "ROS")
;;//! \htmlinclude Serial_RT.msg.html


(defclass yolo_new::Serial_RT
  :super ros::object
  :slots (_sendClass _count ))

(defmethod yolo_new::Serial_RT
  (:init
   (&key
    ((:sendClass __sendClass) "")
    ((:count __count) 0)
    )
   (send-super :init)
   (setq _sendClass (string __sendClass))
   (setq _count (round __count))
   self)
  (:sendClass
   (&optional __sendClass)
   (if __sendClass (setq _sendClass __sendClass)) _sendClass)
  (:count
   (&optional __count)
   (if __count (setq _count __count)) _count)
  (:serialization-length
   ()
   (+
    ;; string _sendClass
    4 (length _sendClass)
    ;; int32 _count
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _sendClass
       (write-long (length _sendClass) s) (princ _sendClass s)
     ;; int32 _count
       (write-long _count s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _sendClass
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _sendClass (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _count
     (setq _count (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get yolo_new::Serial_RT :md5sum-) "c5e6d5a722f30a4aa4713722813adaed")
(setf (get yolo_new::Serial_RT :datatype-) "yolo_new/Serial_RT")
(setf (get yolo_new::Serial_RT :definition-)
      "string sendClass
int32 count
")



(provide :yolo_new/Serial_RT "c5e6d5a722f30a4aa4713722813adaed")


