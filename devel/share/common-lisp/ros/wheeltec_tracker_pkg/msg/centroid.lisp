; Auto-generated. Do not edit!


(cl:in-package wheeltec_tracker_pkg-msg)


;//! \htmlinclude centroid.msg.html

(cl:defclass <centroid> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:integer
    :initform 0)
   (y
    :reader y
    :initarg :y
    :type cl:integer
    :initform 0)
   (leftupper_x
    :reader leftupper_x
    :initarg :leftupper_x
    :type cl:integer
    :initform 0)
   (leftupper_y
    :reader leftupper_y
    :initarg :leftupper_y
    :type cl:integer
    :initform 0)
   (rightlower_w
    :reader rightlower_w
    :initarg :rightlower_w
    :type cl:integer
    :initform 0)
   (rightlower_h
    :reader rightlower_h
    :initarg :rightlower_h
    :type cl:integer
    :initform 0))
)

(cl:defclass centroid (<centroid>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <centroid>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'centroid)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wheeltec_tracker_pkg-msg:<centroid> is deprecated: use wheeltec_tracker_pkg-msg:centroid instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <centroid>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheeltec_tracker_pkg-msg:x-val is deprecated.  Use wheeltec_tracker_pkg-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <centroid>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheeltec_tracker_pkg-msg:y-val is deprecated.  Use wheeltec_tracker_pkg-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'leftupper_x-val :lambda-list '(m))
(cl:defmethod leftupper_x-val ((m <centroid>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheeltec_tracker_pkg-msg:leftupper_x-val is deprecated.  Use wheeltec_tracker_pkg-msg:leftupper_x instead.")
  (leftupper_x m))

(cl:ensure-generic-function 'leftupper_y-val :lambda-list '(m))
(cl:defmethod leftupper_y-val ((m <centroid>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheeltec_tracker_pkg-msg:leftupper_y-val is deprecated.  Use wheeltec_tracker_pkg-msg:leftupper_y instead.")
  (leftupper_y m))

(cl:ensure-generic-function 'rightlower_w-val :lambda-list '(m))
(cl:defmethod rightlower_w-val ((m <centroid>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheeltec_tracker_pkg-msg:rightlower_w-val is deprecated.  Use wheeltec_tracker_pkg-msg:rightlower_w instead.")
  (rightlower_w m))

(cl:ensure-generic-function 'rightlower_h-val :lambda-list '(m))
(cl:defmethod rightlower_h-val ((m <centroid>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheeltec_tracker_pkg-msg:rightlower_h-val is deprecated.  Use wheeltec_tracker_pkg-msg:rightlower_h instead.")
  (rightlower_h m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <centroid>) ostream)
  "Serializes a message object of type '<centroid>"
  (cl:let* ((signed (cl:slot-value msg 'x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'leftupper_x)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'leftupper_y)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'rightlower_w)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'rightlower_h)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <centroid>) istream)
  "Deserializes a message object of type '<centroid>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'y) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'leftupper_x) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'leftupper_y) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'rightlower_w) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'rightlower_h) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<centroid>)))
  "Returns string type for a message object of type '<centroid>"
  "wheeltec_tracker_pkg/centroid")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'centroid)))
  "Returns string type for a message object of type 'centroid"
  "wheeltec_tracker_pkg/centroid")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<centroid>)))
  "Returns md5sum for a message object of type '<centroid>"
  "e0648a54cb14a169de06ff0677b4c869")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'centroid)))
  "Returns md5sum for a message object of type 'centroid"
  "e0648a54cb14a169de06ff0677b4c869")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<centroid>)))
  "Returns full string definition for message of type '<centroid>"
  (cl:format cl:nil "int32 x~%int32 y~%int32 leftupper_x~%int32 leftupper_y~%int32 rightlower_w~%int32 rightlower_h~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'centroid)))
  "Returns full string definition for message of type 'centroid"
  (cl:format cl:nil "int32 x~%int32 y~%int32 leftupper_x~%int32 leftupper_y~%int32 rightlower_w~%int32 rightlower_h~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <centroid>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <centroid>))
  "Converts a ROS message object to a list"
  (cl:list 'centroid
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':leftupper_x (leftupper_x msg))
    (cl:cons ':leftupper_y (leftupper_y msg))
    (cl:cons ':rightlower_w (rightlower_w msg))
    (cl:cons ':rightlower_h (rightlower_h msg))
))
