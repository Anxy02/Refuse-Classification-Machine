; Auto-generated. Do not edit!


(cl:in-package yolo_new-msg)


;//! \htmlinclude Serial_RT.msg.html

(cl:defclass <Serial_RT> (roslisp-msg-protocol:ros-message)
  ((sendClass
    :reader sendClass
    :initarg :sendClass
    :type cl:string
    :initform "")
   (count
    :reader count
    :initarg :count
    :type cl:integer
    :initform 0))
)

(cl:defclass Serial_RT (<Serial_RT>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Serial_RT>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Serial_RT)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name yolo_new-msg:<Serial_RT> is deprecated: use yolo_new-msg:Serial_RT instead.")))

(cl:ensure-generic-function 'sendClass-val :lambda-list '(m))
(cl:defmethod sendClass-val ((m <Serial_RT>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolo_new-msg:sendClass-val is deprecated.  Use yolo_new-msg:sendClass instead.")
  (sendClass m))

(cl:ensure-generic-function 'count-val :lambda-list '(m))
(cl:defmethod count-val ((m <Serial_RT>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolo_new-msg:count-val is deprecated.  Use yolo_new-msg:count instead.")
  (count m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Serial_RT>) ostream)
  "Serializes a message object of type '<Serial_RT>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'sendClass))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'sendClass))
  (cl:let* ((signed (cl:slot-value msg 'count)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Serial_RT>) istream)
  "Deserializes a message object of type '<Serial_RT>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sendClass) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'sendClass) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'count) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Serial_RT>)))
  "Returns string type for a message object of type '<Serial_RT>"
  "yolo_new/Serial_RT")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Serial_RT)))
  "Returns string type for a message object of type 'Serial_RT"
  "yolo_new/Serial_RT")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Serial_RT>)))
  "Returns md5sum for a message object of type '<Serial_RT>"
  "c5e6d5a722f30a4aa4713722813adaed")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Serial_RT)))
  "Returns md5sum for a message object of type 'Serial_RT"
  "c5e6d5a722f30a4aa4713722813adaed")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Serial_RT>)))
  "Returns full string definition for message of type '<Serial_RT>"
  (cl:format cl:nil "string sendClass~%int32 count~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Serial_RT)))
  "Returns full string definition for message of type 'Serial_RT"
  (cl:format cl:nil "string sendClass~%int32 count~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Serial_RT>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'sendClass))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Serial_RT>))
  "Converts a ROS message object to a list"
  (cl:list 'Serial_RT
    (cl:cons ':sendClass (sendClass msg))
    (cl:cons ':count (count msg))
))
