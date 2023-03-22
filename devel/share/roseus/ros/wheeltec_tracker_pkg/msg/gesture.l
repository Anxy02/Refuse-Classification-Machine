;; Auto-generated. Do not edit!


(when (boundp 'wheeltec_tracker_pkg::gesture)
  (if (not (find-package "WHEELTEC_TRACKER_PKG"))
    (make-package "WHEELTEC_TRACKER_PKG"))
  (shadow 'gesture (find-package "WHEELTEC_TRACKER_PKG")))
(unless (find-package "WHEELTEC_TRACKER_PKG::GESTURE")
  (make-package "WHEELTEC_TRACKER_PKG::GESTURE"))

(in-package "ROS")
;;//! \htmlinclude gesture.msg.html


(defclass wheeltec_tracker_pkg::gesture
  :super ros::object
  :slots (_a _b _c _d _e _f ))

(defmethod wheeltec_tracker_pkg::gesture
  (:init
   (&key
    ((:a __a) 0.0)
    ((:b __b) 0.0)
    ((:c __c) 0.0)
    ((:d __d) 0.0)
    ((:e __e) 0.0)
    ((:f __f) 0.0)
    )
   (send-super :init)
   (setq _a (float __a))
   (setq _b (float __b))
   (setq _c (float __c))
   (setq _d (float __d))
   (setq _e (float __e))
   (setq _f (float __f))
   self)
  (:a
   (&optional __a)
   (if __a (setq _a __a)) _a)
  (:b
   (&optional __b)
   (if __b (setq _b __b)) _b)
  (:c
   (&optional __c)
   (if __c (setq _c __c)) _c)
  (:d
   (&optional __d)
   (if __d (setq _d __d)) _d)
  (:e
   (&optional __e)
   (if __e (setq _e __e)) _e)
  (:f
   (&optional __f)
   (if __f (setq _f __f)) _f)
  (:serialization-length
   ()
   (+
    ;; float32 _a
    4
    ;; float32 _b
    4
    ;; float32 _c
    4
    ;; float32 _d
    4
    ;; float32 _e
    4
    ;; float32 _f
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _a
       (sys::poke _a (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _b
       (sys::poke _b (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _c
       (sys::poke _c (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _d
       (sys::poke _d (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _e
       (sys::poke _e (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _f
       (sys::poke _f (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _a
     (setq _a (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _b
     (setq _b (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _c
     (setq _c (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _d
     (setq _d (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _e
     (setq _e (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _f
     (setq _f (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get wheeltec_tracker_pkg::gesture :md5sum-) "0d0917f62e38c9b1c6fae9685fe09aa2")
(setf (get wheeltec_tracker_pkg::gesture :datatype-) "wheeltec_tracker_pkg/gesture")
(setf (get wheeltec_tracker_pkg::gesture :definition-)
      "float32 a
float32 b
float32 c
float32 d
float32 e
float32 f
")



(provide :wheeltec_tracker_pkg/gesture "0d0917f62e38c9b1c6fae9685fe09aa2")


