; Auto-generated. Do not edit!


(cl:in-package table_arm-msg)


;//! \htmlinclude arm_init_position.msg.html

(cl:defclass <arm_init_position> (roslisp-msg-protocol:ros-message)
  ((init_joint1
    :reader init_joint1
    :initarg :init_joint1
    :type cl:fixnum
    :initform 0)
   (init_joint2
    :reader init_joint2
    :initarg :init_joint2
    :type cl:fixnum
    :initform 0)
   (init_joint3
    :reader init_joint3
    :initarg :init_joint3
    :type cl:fixnum
    :initform 0)
   (init_joint4
    :reader init_joint4
    :initarg :init_joint4
    :type cl:fixnum
    :initform 0)
   (init_joint5
    :reader init_joint5
    :initarg :init_joint5
    :type cl:fixnum
    :initform 0)
   (init_joint6
    :reader init_joint6
    :initarg :init_joint6
    :type cl:fixnum
    :initform 0)
   (save_init_pose
    :reader save_init_pose
    :initarg :save_init_pose
    :type cl:fixnum
    :initform 0)
   (arm_look
    :reader arm_look
    :initarg :arm_look
    :type cl:fixnum
    :initform 0)
   (arm_home
    :reader arm_home
    :initarg :arm_home
    :type cl:fixnum
    :initform 0))
)

(cl:defclass arm_init_position (<arm_init_position>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <arm_init_position>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'arm_init_position)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name table_arm-msg:<arm_init_position> is deprecated: use table_arm-msg:arm_init_position instead.")))

(cl:ensure-generic-function 'init_joint1-val :lambda-list '(m))
(cl:defmethod init_joint1-val ((m <arm_init_position>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader table_arm-msg:init_joint1-val is deprecated.  Use table_arm-msg:init_joint1 instead.")
  (init_joint1 m))

(cl:ensure-generic-function 'init_joint2-val :lambda-list '(m))
(cl:defmethod init_joint2-val ((m <arm_init_position>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader table_arm-msg:init_joint2-val is deprecated.  Use table_arm-msg:init_joint2 instead.")
  (init_joint2 m))

(cl:ensure-generic-function 'init_joint3-val :lambda-list '(m))
(cl:defmethod init_joint3-val ((m <arm_init_position>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader table_arm-msg:init_joint3-val is deprecated.  Use table_arm-msg:init_joint3 instead.")
  (init_joint3 m))

(cl:ensure-generic-function 'init_joint4-val :lambda-list '(m))
(cl:defmethod init_joint4-val ((m <arm_init_position>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader table_arm-msg:init_joint4-val is deprecated.  Use table_arm-msg:init_joint4 instead.")
  (init_joint4 m))

(cl:ensure-generic-function 'init_joint5-val :lambda-list '(m))
(cl:defmethod init_joint5-val ((m <arm_init_position>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader table_arm-msg:init_joint5-val is deprecated.  Use table_arm-msg:init_joint5 instead.")
  (init_joint5 m))

(cl:ensure-generic-function 'init_joint6-val :lambda-list '(m))
(cl:defmethod init_joint6-val ((m <arm_init_position>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader table_arm-msg:init_joint6-val is deprecated.  Use table_arm-msg:init_joint6 instead.")
  (init_joint6 m))

(cl:ensure-generic-function 'save_init_pose-val :lambda-list '(m))
(cl:defmethod save_init_pose-val ((m <arm_init_position>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader table_arm-msg:save_init_pose-val is deprecated.  Use table_arm-msg:save_init_pose instead.")
  (save_init_pose m))

(cl:ensure-generic-function 'arm_look-val :lambda-list '(m))
(cl:defmethod arm_look-val ((m <arm_init_position>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader table_arm-msg:arm_look-val is deprecated.  Use table_arm-msg:arm_look instead.")
  (arm_look m))

(cl:ensure-generic-function 'arm_home-val :lambda-list '(m))
(cl:defmethod arm_home-val ((m <arm_init_position>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader table_arm-msg:arm_home-val is deprecated.  Use table_arm-msg:arm_home instead.")
  (arm_home m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <arm_init_position>) ostream)
  "Serializes a message object of type '<arm_init_position>"
  (cl:let* ((signed (cl:slot-value msg 'init_joint1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'init_joint2)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'init_joint3)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'init_joint4)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'init_joint5)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'init_joint6)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'save_init_pose)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'arm_look)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'arm_home)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <arm_init_position>) istream)
  "Deserializes a message object of type '<arm_init_position>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'init_joint1) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'init_joint2) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'init_joint3) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'init_joint4) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'init_joint5) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'init_joint6) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'save_init_pose) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'arm_look) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'arm_home) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<arm_init_position>)))
  "Returns string type for a message object of type '<arm_init_position>"
  "table_arm/arm_init_position")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'arm_init_position)))
  "Returns string type for a message object of type 'arm_init_position"
  "table_arm/arm_init_position")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<arm_init_position>)))
  "Returns md5sum for a message object of type '<arm_init_position>"
  "214a3a640e2cbc2daa6f74f00b9c277b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'arm_init_position)))
  "Returns md5sum for a message object of type 'arm_init_position"
  "214a3a640e2cbc2daa6f74f00b9c277b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<arm_init_position>)))
  "Returns full string definition for message of type '<arm_init_position>"
  (cl:format cl:nil "int8 init_joint1~%int8 init_joint2~%int8 init_joint3~%int8 init_joint4~%int8 init_joint5~%int8 init_joint6~%int8 save_init_pose~%int8 arm_look~%int8 arm_home~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'arm_init_position)))
  "Returns full string definition for message of type 'arm_init_position"
  (cl:format cl:nil "int8 init_joint1~%int8 init_joint2~%int8 init_joint3~%int8 init_joint4~%int8 init_joint5~%int8 init_joint6~%int8 save_init_pose~%int8 arm_look~%int8 arm_home~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <arm_init_position>))
  (cl:+ 0
     1
     1
     1
     1
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <arm_init_position>))
  "Converts a ROS message object to a list"
  (cl:list 'arm_init_position
    (cl:cons ':init_joint1 (init_joint1 msg))
    (cl:cons ':init_joint2 (init_joint2 msg))
    (cl:cons ':init_joint3 (init_joint3 msg))
    (cl:cons ':init_joint4 (init_joint4 msg))
    (cl:cons ':init_joint5 (init_joint5 msg))
    (cl:cons ':init_joint6 (init_joint6 msg))
    (cl:cons ':save_init_pose (save_init_pose msg))
    (cl:cons ':arm_look (arm_look msg))
    (cl:cons ':arm_home (arm_home msg))
))
