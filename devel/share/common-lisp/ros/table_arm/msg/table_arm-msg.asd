
(cl:in-package :asdf)

(defsystem "table_arm-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "arm_init_position" :depends-on ("_package_arm_init_position"))
    (:file "_package_arm_init_position" :depends-on ("_package"))
    (:file "arm_target" :depends-on ("_package_arm_target"))
    (:file "_package_arm_target" :depends-on ("_package"))
    (:file "arm_target_position" :depends-on ("_package_arm_target_position"))
    (:file "_package_arm_target_position" :depends-on ("_package"))
    (:file "color_ik_result" :depends-on ("_package_color_ik_result"))
    (:file "_package_color_ik_result" :depends-on ("_package"))
    (:file "position_color" :depends-on ("_package_position_color"))
    (:file "_package_position_color" :depends-on ("_package"))
  ))