
#ifndef __ARM_CALLBACK_H_
#define __ARM_CALLBACK_H_
// 头文件
#include "wheeltec_table_arm.h"
ros::Subscriber  face_joint_state_Sub,color_joint_state_Sub,gesture_joint_state_Sub;//初始化2个订阅者
void init_joint_states();
void face_joint_states_Callback(const table_arm::color_ik_result angle);
void color_joint_states_Callback(const table_arm::color_ik_result color_angle);
void gesture_joint_states_Callback(const wheeltec_tracker_pkg::gesture gesture_angle);
#endif
