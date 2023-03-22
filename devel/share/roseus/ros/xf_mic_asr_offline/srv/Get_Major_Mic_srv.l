;; Auto-generated. Do not edit!


(when (boundp 'xf_mic_asr_offline::Get_Major_Mic_srv)
  (if (not (find-package "XF_MIC_ASR_OFFLINE"))
    (make-package "XF_MIC_ASR_OFFLINE"))
  (shadow 'Get_Major_Mic_srv (find-package "XF_MIC_ASR_OFFLINE")))
(unless (find-package "XF_MIC_ASR_OFFLINE::GET_MAJOR_MIC_SRV")
  (make-package "XF_MIC_ASR_OFFLINE::GET_MAJOR_MIC_SRV"))
(unless (find-package "XF_MIC_ASR_OFFLINE::GET_MAJOR_MIC_SRVREQUEST")
  (make-package "XF_MIC_ASR_OFFLINE::GET_MAJOR_MIC_SRVREQUEST"))
(unless (find-package "XF_MIC_ASR_OFFLINE::GET_MAJOR_MIC_SRVRESPONSE")
  (make-package "XF_MIC_ASR_OFFLINE::GET_MAJOR_MIC_SRVRESPONSE"))

(in-package "ROS")





(defclass xf_mic_asr_offline::Get_Major_Mic_srvRequest
  :super ros::object
  :slots (_get_major_id ))

(defmethod xf_mic_asr_offline::Get_Major_Mic_srvRequest
  (:init
   (&key
    ((:get_major_id __get_major_id) 0)
    )
   (send-super :init)
   (setq _get_major_id (round __get_major_id))
   self)
  (:get_major_id
   (&optional __get_major_id)
   (if __get_major_id (setq _get_major_id __get_major_id)) _get_major_id)
  (:serialization-length
   ()
   (+
    ;; int8 _get_major_id
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _get_major_id
       (write-byte _get_major_id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _get_major_id
     (setq _get_major_id (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _get_major_id 127) (setq _get_major_id (- _get_major_id 256)))
   ;;
   self)
  )

(defclass xf_mic_asr_offline::Get_Major_Mic_srvResponse
  :super ros::object
  :slots (_result _mic_id _fail_reason ))

(defmethod xf_mic_asr_offline::Get_Major_Mic_srvResponse
  (:init
   (&key
    ((:result __result) "")
    ((:mic_id __mic_id) 0)
    ((:fail_reason __fail_reason) "")
    )
   (send-super :init)
   (setq _result (string __result))
   (setq _mic_id (round __mic_id))
   (setq _fail_reason (string __fail_reason))
   self)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:mic_id
   (&optional __mic_id)
   (if __mic_id (setq _mic_id __mic_id)) _mic_id)
  (:fail_reason
   (&optional __fail_reason)
   (if __fail_reason (setq _fail_reason __fail_reason)) _fail_reason)
  (:serialization-length
   ()
   (+
    ;; string _result
    4 (length _result)
    ;; int8 _mic_id
    1
    ;; string _fail_reason
    4 (length _fail_reason)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _result
       (write-long (length _result) s) (princ _result s)
     ;; int8 _mic_id
       (write-byte _mic_id s)
     ;; string _fail_reason
       (write-long (length _fail_reason) s) (princ _fail_reason s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _result
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _result (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int8 _mic_id
     (setq _mic_id (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _mic_id 127) (setq _mic_id (- _mic_id 256)))
   ;; string _fail_reason
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _fail_reason (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass xf_mic_asr_offline::Get_Major_Mic_srv
  :super ros::object
  :slots ())

(setf (get xf_mic_asr_offline::Get_Major_Mic_srv :md5sum-) "3ca06ade224515e6482987c79f7f3cf3")
(setf (get xf_mic_asr_offline::Get_Major_Mic_srv :datatype-) "xf_mic_asr_offline/Get_Major_Mic_srv")
(setf (get xf_mic_asr_offline::Get_Major_Mic_srv :request) xf_mic_asr_offline::Get_Major_Mic_srvRequest)
(setf (get xf_mic_asr_offline::Get_Major_Mic_srv :response) xf_mic_asr_offline::Get_Major_Mic_srvResponse)

(defmethod xf_mic_asr_offline::Get_Major_Mic_srvRequest
  (:response () (instance xf_mic_asr_offline::Get_Major_Mic_srvResponse :init)))

(setf (get xf_mic_asr_offline::Get_Major_Mic_srvRequest :md5sum-) "3ca06ade224515e6482987c79f7f3cf3")
(setf (get xf_mic_asr_offline::Get_Major_Mic_srvRequest :datatype-) "xf_mic_asr_offline/Get_Major_Mic_srvRequest")
(setf (get xf_mic_asr_offline::Get_Major_Mic_srvRequest :definition-)
      "int8 get_major_id #1,0
---
string result
int8 mic_id
string fail_reason 

")

(setf (get xf_mic_asr_offline::Get_Major_Mic_srvResponse :md5sum-) "3ca06ade224515e6482987c79f7f3cf3")
(setf (get xf_mic_asr_offline::Get_Major_Mic_srvResponse :datatype-) "xf_mic_asr_offline/Get_Major_Mic_srvResponse")
(setf (get xf_mic_asr_offline::Get_Major_Mic_srvResponse :definition-)
      "int8 get_major_id #1,0
---
string result
int8 mic_id
string fail_reason 

")



(provide :xf_mic_asr_offline/Get_Major_Mic_srv "3ca06ade224515e6482987c79f7f3cf3")


