; Auto-generated. Do not edit!


(cl:in-package yolo_new-msg)


;//! \htmlinclude color_ik_result_new.msg.html

(cl:defclass <color_ik_result_new> (roslisp-msg-protocol:ros-message)
  ((pedestal_angle
    :reader pedestal_angle
    :initarg :pedestal_angle
    :type cl:float
    :initform 0.0)
   (arm_angle
    :reader arm_angle
    :initarg :arm_angle
    :type cl:float
    :initform 0.0)
   (hand_angle
    :reader hand_angle
    :initarg :hand_angle
    :type cl:float
    :initform 0.0)
   (sort
    :reader sort
    :initarg :sort
    :type cl:string
    :initform "")
   (count
    :reader count
    :initarg :count
    :type cl:integer
    :initform 0))
)

(cl:defclass color_ik_result_new (<color_ik_result_new>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <color_ik_result_new>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'color_ik_result_new)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name yolo_new-msg:<color_ik_result_new> is deprecated: use yolo_new-msg:color_ik_result_new instead.")))

(cl:ensure-generic-function 'pedestal_angle-val :lambda-list '(m))
(cl:defmethod pedestal_angle-val ((m <color_ik_result_new>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolo_new-msg:pedestal_angle-val is deprecated.  Use yolo_new-msg:pedestal_angle instead.")
  (pedestal_angle m))

(cl:ensure-generic-function 'arm_angle-val :lambda-list '(m))
(cl:defmethod arm_angle-val ((m <color_ik_result_new>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolo_new-msg:arm_angle-val is deprecated.  Use yolo_new-msg:arm_angle instead.")
  (arm_angle m))

(cl:ensure-generic-function 'hand_angle-val :lambda-list '(m))
(cl:defmethod hand_angle-val ((m <color_ik_result_new>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolo_new-msg:hand_angle-val is deprecated.  Use yolo_new-msg:hand_angle instead.")
  (hand_angle m))

(cl:ensure-generic-function 'sort-val :lambda-list '(m))
(cl:defmethod sort-val ((m <color_ik_result_new>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolo_new-msg:sort-val is deprecated.  Use yolo_new-msg:sort instead.")
  (sort m))

(cl:ensure-generic-function 'count-val :lambda-list '(m))
(cl:defmethod count-val ((m <color_ik_result_new>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader yolo_new-msg:count-val is deprecated.  Use yolo_new-msg:count instead.")
  (count m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <color_ik_result_new>) ostream)
  "Serializes a message object of type '<color_ik_result_new>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pedestal_angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'arm_angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'hand_angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'sort))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'sort))
  (cl:let* ((signed (cl:slot-value msg 'count)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <color_ik_result_new>) istream)
  "Deserializes a message object of type '<color_ik_result_new>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pedestal_angle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'arm_angle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'hand_angle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'sort) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'sort) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'count) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<color_ik_result_new>)))
  "Returns string type for a message object of type '<color_ik_result_new>"
  "yolo_new/color_ik_result_new")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'color_ik_result_new)))
  "Returns string type for a message object of type 'color_ik_result_new"
  "yolo_new/color_ik_result_new")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<color_ik_result_new>)))
  "Returns md5sum for a message object of type '<color_ik_result_new>"
  "72875b09b8c68c6e926739b0b0152e3a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'color_ik_result_new)))
  "Returns md5sum for a message object of type 'color_ik_result_new"
  "72875b09b8c68c6e926739b0b0152e3a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<color_ik_result_new>)))
  "Returns full string definition for message of type '<color_ik_result_new>"
  (cl:format cl:nil "float32 pedestal_angle~%float32 arm_angle~%float32 hand_angle~%string  sort~%int32   count~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'color_ik_result_new)))
  "Returns full string definition for message of type 'color_ik_result_new"
  (cl:format cl:nil "float32 pedestal_angle~%float32 arm_angle~%float32 hand_angle~%string  sort~%int32   count~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <color_ik_result_new>))
  (cl:+ 0
     4
     4
     4
     4 (cl:length (cl:slot-value msg 'sort))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <color_ik_result_new>))
  "Converts a ROS message object to a list"
  (cl:list 'color_ik_result_new
    (cl:cons ':pedestal_angle (pedestal_angle msg))
    (cl:cons ':arm_angle (arm_angle msg))
    (cl:cons ':hand_angle (hand_angle msg))
    (cl:cons ':sort (sort msg))
    (cl:cons ':count (count msg))
))
