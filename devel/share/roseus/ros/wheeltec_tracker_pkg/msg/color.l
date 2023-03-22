;; Auto-generated. Do not edit!


(when (boundp 'wheeltec_tracker_pkg::color)
  (if (not (find-package "WHEELTEC_TRACKER_PKG"))
    (make-package "WHEELTEC_TRACKER_PKG"))
  (shadow 'color (find-package "WHEELTEC_TRACKER_PKG")))
(unless (find-package "WHEELTEC_TRACKER_PKG::COLOR")
  (make-package "WHEELTEC_TRACKER_PKG::COLOR"))

(in-package "ROS")
;;//! \htmlinclude color.msg.html


(defclass wheeltec_tracker_pkg::color
  :super ros::object
  :slots (_angleX _angleY ))

(defmethod wheeltec_tracker_pkg::color
  (:init
   (&key
    ((:angleX __angleX) 0.0)
    ((:angleY __angleY) 0.0)
    )
   (send-super :init)
   (setq _angleX (float __angleX))
   (setq _angleY (float __angleY))
   self)
  (:angleX
   (&optional __angleX)
   (if __angleX (setq _angleX __angleX)) _angleX)
  (:angleY
   (&optional __angleY)
   (if __angleY (setq _angleY __angleY)) _angleY)
  (:serialization-length
   ()
   (+
    ;; float32 _angleX
    4
    ;; float32 _angleY
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _angleX
       (sys::poke _angleX (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _angleY
       (sys::poke _angleY (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _angleX
     (setq _angleX (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _angleY
     (setq _angleY (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get wheeltec_tracker_pkg::color :md5sum-) "0889611e38ff06ce7765b61e0b0419be")
(setf (get wheeltec_tracker_pkg::color :datatype-) "wheeltec_tracker_pkg/color")
(setf (get wheeltec_tracker_pkg::color :definition-)
      "float32 angleX
float32 angleY

")



(provide :wheeltec_tracker_pkg/color "0889611e38ff06ce7765b61e0b0419be")


