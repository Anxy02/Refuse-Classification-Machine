; Auto-generated. Do not edit!


(cl:in-package table_arm-msg)


;//! \htmlinclude color_ik_result.msg.html

(cl:defclass <color_ik_result> (roslisp-msg-protocol:ros-message)
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
   (color
    :reader color
    :initarg :color
    :type cl:string
    :initform ""))
)

(cl:defclass color_ik_result (<color_ik_result>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <color_ik_result>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'color_ik_result)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name table_arm-msg:<color_ik_result> is deprecated: use table_arm-msg:color_ik_result instead.")))

(cl:ensure-generic-function 'pedestal_angle-val :lambda-list '(m))
(cl:defmethod pedestal_angle-val ((m <color_ik_result>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader table_arm-msg:pedestal_angle-val is deprecated.  Use table_arm-msg:pedestal_angle instead.")
  (pedestal_angle m))

(cl:ensure-generic-function 'arm_angle-val :lambda-list '(m))
(cl:defmethod arm_angle-val ((m <color_ik_result>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader table_arm-msg:arm_angle-val is deprecated.  Use table_arm-msg:arm_angle instead.")
  (arm_angle m))

(cl:ensure-generic-function 'hand_angle-val :lambda-list '(m))
(cl:defmethod hand_angle-val ((m <color_ik_result>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader table_arm-msg:hand_angle-val is deprecated.  Use table_arm-msg:hand_angle instead.")
  (hand_angle m))

(cl:ensure-generic-function 'color-val :lambda-list '(m))
(cl:defmethod color-val ((m <color_ik_result>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader table_arm-msg:color-val is deprecated.  Use table_arm-msg:color instead.")
  (color m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <color_ik_result>) ostream)
  "Serializes a message object of type '<color_ik_result>"
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
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'color))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'color))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <color_ik_result>) istream)
  "Deserializes a message object of type '<color_ik_result>"
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
      (cl:setf (cl:slot-value msg 'color) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'color) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<color_ik_result>)))
  "Returns string type for a message object of type '<color_ik_result>"
  "table_arm/color_ik_result")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'color_ik_result)))
  "Returns string type for a message object of type 'color_ik_result"
  "table_arm/color_ik_result")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<color_ik_result>)))
  "Returns md5sum for a message object of type '<color_ik_result>"
  "26d2c0ae8f268cfc5f83e3b64098d2c7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'color_ik_result)))
  "Returns md5sum for a message object of type 'color_ik_result"
  "26d2c0ae8f268cfc5f83e3b64098d2c7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<color_ik_result>)))
  "Returns full string definition for message of type '<color_ik_result>"
  (cl:format cl:nil "float32 pedestal_angle~%float32 arm_angle~%float32 hand_angle~%string  color~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'color_ik_result)))
  "Returns full string definition for message of type 'color_ik_result"
  (cl:format cl:nil "float32 pedestal_angle~%float32 arm_angle~%float32 hand_angle~%string  color~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <color_ik_result>))
  (cl:+ 0
     4
     4
     4
     4 (cl:length (cl:slot-value msg 'color))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <color_ik_result>))
  "Converts a ROS message object to a list"
  (cl:list 'color_ik_result
    (cl:cons ':pedestal_angle (pedestal_angle msg))
    (cl:cons ':arm_angle (arm_angle msg))
    (cl:cons ':hand_angle (hand_angle msg))
    (cl:cons ':color (color msg))
))
