
(cl:in-package :asdf)

(defsystem "yolo_new-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "BoundingBox" :depends-on ("_package_BoundingBox"))
    (:file "_package_BoundingBox" :depends-on ("_package"))
    (:file "BoundingBoxes" :depends-on ("_package_BoundingBoxes"))
    (:file "_package_BoundingBoxes" :depends-on ("_package"))
    (:file "Flag" :depends-on ("_package_Flag"))
    (:file "_package_Flag" :depends-on ("_package"))
    (:file "arm_init_position" :depends-on ("_package_arm_init_position"))
    (:file "_package_arm_init_position" :depends-on ("_package"))
    (:file "arm_target" :depends-on ("_package_arm_target"))
    (:file "_package_arm_target" :depends-on ("_package"))
    (:file "arm_target_position" :depends-on ("_package_arm_target_position"))
    (:file "_package_arm_target_position" :depends-on ("_package"))
    (:file "color_ik_result_new" :depends-on ("_package_color_ik_result_new"))
    (:file "_package_color_ik_result_new" :depends-on ("_package"))
    (:file "position_color" :depends-on ("_package_position_color"))
    (:file "_package_position_color" :depends-on ("_package"))
  ))