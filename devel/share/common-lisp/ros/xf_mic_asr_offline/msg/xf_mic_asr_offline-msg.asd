
(cl:in-package :asdf)

(defsystem "xf_mic_asr_offline-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Pcm_Msg" :depends-on ("_package_Pcm_Msg"))
    (:file "_package_Pcm_Msg" :depends-on ("_package"))
    (:file "position" :depends-on ("_package_position"))
    (:file "_package_position" :depends-on ("_package"))
  ))