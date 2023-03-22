; Auto-generated. Do not edit!


(cl:in-package wheeltec_tracker_pkg-msg)


;//! \htmlinclude color.msg.html

(cl:defclass <color> (roslisp-msg-protocol:ros-message)
  ((angleX
    :reader angleX
    :initarg :angleX
    :type cl:float
    :initform 0.0)
   (angleY
    :reader angleY
    :initarg :angleY
    :type cl:float
    :initform 0.0))
)

(cl:defclass color (<color>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <color>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'color)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name wheeltec_tracker_pkg-msg:<color> is deprecated: use wheeltec_tracker_pkg-msg:color instead.")))

(cl:ensure-generic-function 'angleX-val :lambda-list '(m))
(cl:defmethod angleX-val ((m <color>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheeltec_tracker_pkg-msg:angleX-val is deprecated.  Use wheeltec_tracker_pkg-msg:angleX instead.")
  (angleX m))

(cl:ensure-generic-function 'angleY-val :lambda-list '(m))
(cl:defmethod angleY-val ((m <color>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader wheeltec_tracker_pkg-msg:angleY-val is deprecated.  Use wheeltec_tracker_pkg-msg:angleY instead.")
  (angleY m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <color>) ostream)
  "Serializes a message object of type '<color>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angleX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angleY))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <color>) istream)
  "Deserializes a message object of type '<color>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angleX) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angleY) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<color>)))
  "Returns string type for a message object of type '<color>"
  "wheeltec_tracker_pkg/color")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'color)))
  "Returns string type for a message object of type 'color"
  "wheeltec_tracker_pkg/color")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<color>)))
  "Returns md5sum for a message object of type '<color>"
  "0889611e38ff06ce7765b61e0b0419be")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'color)))
  "Returns md5sum for a message object of type 'color"
  "0889611e38ff06ce7765b61e0b0419be")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<color>)))
  "Returns full string definition for message of type '<color>"
  (cl:format cl:nil "float32 angleX~%float32 angleY~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'color)))
  "Returns full string definition for message of type 'color"
  (cl:format cl:nil "float32 angleX~%float32 angleY~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <color>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <color>))
  "Converts a ROS message object to a list"
  (cl:list 'color
    (cl:cons ':angleX (angleX msg))
    (cl:cons ':angleY (angleY msg))
))
