
(cl:in-package :asdf)

(defsystem "wheeltec_tracker_pkg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "centroid" :depends-on ("_package_centroid"))
    (:file "_package_centroid" :depends-on ("_package"))
    (:file "color" :depends-on ("_package_color"))
    (:file "_package_color" :depends-on ("_package"))
    (:file "gesture" :depends-on ("_package_gesture"))
    (:file "_package_gesture" :depends-on ("_package"))
  ))