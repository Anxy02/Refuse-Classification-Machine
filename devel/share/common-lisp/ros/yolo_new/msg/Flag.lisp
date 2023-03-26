; Auto-generated. Do not edit!


(cl:in-package yolo_new-msg)


;//! \htmlinclude Flag.msg.html

(cl:defclass <Flag> (roslisp-msg-protocol:ros-message)
  ((isMoving
    :reader isMoving
    :initarg :isMoving
    :type cl:integer
    :initform 0)
   (isPuting
    :reader isPuting
    :initarg :isPuting
    :type cl:integer
    :initform 0))
)

(cl:defclass Flag (<Flag>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Flag>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Flag)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name yolo_new-msg:<Flag> is deprecated: use yolo_new-msg:Flag instead.")))

(cl:ensure-generic-function 'isMoving-val :lambda-list '(m))
(cl:defmethod isMoving-val ((m <Flag>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolo_new-msg:isMoving-val is deprecated.  Use yolo_new-msg:isMoving instead.")
  (isMoving m))

(cl:ensure-generic-function 'isPuting-val :lambda-list '(m))
(cl:defmethod isPuting-val ((m <Flag>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolo_new-msg:isPuting-val is deprecated.  Use yolo_new-msg:isPuting instead.")
  (isPuting m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Flag>) ostream)
  "Serializes a message object of type '<Flag>"
  (cl:let* ((signed (cl:slot-value msg 'isMoving)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'isPuting)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Flag>) istream)
  "Deserializes a message object of type '<Flag>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'isMoving) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'isPuting) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Flag>)))
  "Returns string type for a message object of type '<Flag>"
  "yolo_new/Flag")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Flag)))
  "Returns string type for a message object of type 'Flag"
  "yolo_new/Flag")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Flag>)))
  "Returns md5sum for a message object of type '<Flag>"
  "3863caec8075fcfd7c44f1691519daf7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Flag)))
  "Returns md5sum for a message object of type 'Flag"
  "3863caec8075fcfd7c44f1691519daf7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Flag>)))
  "Returns full string definition for message of type '<Flag>"
  (cl:format cl:nil "int32 isMoving~%int32 isPuting~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Flag)))
  "Returns full string definition for message of type 'Flag"
  (cl:format cl:nil "int32 isMoving~%int32 isPuting~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Flag>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Flag>))
  "Converts a ROS message object to a list"
  (cl:list 'Flag
    (cl:cons ':isMoving (isMoving msg))
    (cl:cons ':isPuting (isPuting msg))
))
