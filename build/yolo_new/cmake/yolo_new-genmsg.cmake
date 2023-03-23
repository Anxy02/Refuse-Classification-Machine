# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "yolo_new: 7 messages, 0 services")

set(MSG_I_FLAGS "-Iyolo_new:/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(yolo_new_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/position_color.msg" NAME_WE)
add_custom_target(_yolo_new_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "yolo_new" "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/position_color.msg" ""
)

get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/arm_target.msg" NAME_WE)
add_custom_target(_yolo_new_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "yolo_new" "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/arm_target.msg" ""
)

get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/color_ik_result_new.msg" NAME_WE)
add_custom_target(_yolo_new_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "yolo_new" "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/color_ik_result_new.msg" ""
)

get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/arm_target_position.msg" NAME_WE)
add_custom_target(_yolo_new_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "yolo_new" "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/arm_target_position.msg" ""
)

get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/arm_init_position.msg" NAME_WE)
add_custom_target(_yolo_new_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "yolo_new" "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/arm_init_position.msg" ""
)

get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/BoundingBox.msg" NAME_WE)
add_custom_target(_yolo_new_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "yolo_new" "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/BoundingBox.msg" ""
)

get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/BoundingBoxes.msg" NAME_WE)
add_custom_target(_yolo_new_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "yolo_new" "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/BoundingBoxes.msg" "yolo_new/BoundingBox:std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(yolo_new
  "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/position_color.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolo_new
)
_generate_msg_cpp(yolo_new
  "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/arm_target.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolo_new
)
_generate_msg_cpp(yolo_new
  "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/color_ik_result_new.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolo_new
)
_generate_msg_cpp(yolo_new
  "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/arm_target_position.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolo_new
)
_generate_msg_cpp(yolo_new
  "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/arm_init_position.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolo_new
)
_generate_msg_cpp(yolo_new
  "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/BoundingBox.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolo_new
)
_generate_msg_cpp(yolo_new
  "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/BoundingBoxes.msg"
  "${MSG_I_FLAGS}"
  "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/BoundingBox.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolo_new
)

### Generating Services

### Generating Module File
_generate_module_cpp(yolo_new
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolo_new
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(yolo_new_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(yolo_new_generate_messages yolo_new_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/position_color.msg" NAME_WE)
add_dependencies(yolo_new_generate_messages_cpp _yolo_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/arm_target.msg" NAME_WE)
add_dependencies(yolo_new_generate_messages_cpp _yolo_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/color_ik_result_new.msg" NAME_WE)
add_dependencies(yolo_new_generate_messages_cpp _yolo_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/arm_target_position.msg" NAME_WE)
add_dependencies(yolo_new_generate_messages_cpp _yolo_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/arm_init_position.msg" NAME_WE)
add_dependencies(yolo_new_generate_messages_cpp _yolo_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/BoundingBox.msg" NAME_WE)
add_dependencies(yolo_new_generate_messages_cpp _yolo_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/BoundingBoxes.msg" NAME_WE)
add_dependencies(yolo_new_generate_messages_cpp _yolo_new_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(yolo_new_gencpp)
add_dependencies(yolo_new_gencpp yolo_new_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS yolo_new_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(yolo_new
  "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/position_color.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolo_new
)
_generate_msg_eus(yolo_new
  "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/arm_target.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolo_new
)
_generate_msg_eus(yolo_new
  "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/color_ik_result_new.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolo_new
)
_generate_msg_eus(yolo_new
  "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/arm_target_position.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolo_new
)
_generate_msg_eus(yolo_new
  "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/arm_init_position.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolo_new
)
_generate_msg_eus(yolo_new
  "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/BoundingBox.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolo_new
)
_generate_msg_eus(yolo_new
  "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/BoundingBoxes.msg"
  "${MSG_I_FLAGS}"
  "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/BoundingBox.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolo_new
)

### Generating Services

### Generating Module File
_generate_module_eus(yolo_new
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolo_new
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(yolo_new_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(yolo_new_generate_messages yolo_new_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/position_color.msg" NAME_WE)
add_dependencies(yolo_new_generate_messages_eus _yolo_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/arm_target.msg" NAME_WE)
add_dependencies(yolo_new_generate_messages_eus _yolo_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/color_ik_result_new.msg" NAME_WE)
add_dependencies(yolo_new_generate_messages_eus _yolo_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/arm_target_position.msg" NAME_WE)
add_dependencies(yolo_new_generate_messages_eus _yolo_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/arm_init_position.msg" NAME_WE)
add_dependencies(yolo_new_generate_messages_eus _yolo_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/BoundingBox.msg" NAME_WE)
add_dependencies(yolo_new_generate_messages_eus _yolo_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/BoundingBoxes.msg" NAME_WE)
add_dependencies(yolo_new_generate_messages_eus _yolo_new_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(yolo_new_geneus)
add_dependencies(yolo_new_geneus yolo_new_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS yolo_new_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(yolo_new
  "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/position_color.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolo_new
)
_generate_msg_lisp(yolo_new
  "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/arm_target.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolo_new
)
_generate_msg_lisp(yolo_new
  "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/color_ik_result_new.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolo_new
)
_generate_msg_lisp(yolo_new
  "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/arm_target_position.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolo_new
)
_generate_msg_lisp(yolo_new
  "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/arm_init_position.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolo_new
)
_generate_msg_lisp(yolo_new
  "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/BoundingBox.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolo_new
)
_generate_msg_lisp(yolo_new
  "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/BoundingBoxes.msg"
  "${MSG_I_FLAGS}"
  "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/BoundingBox.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolo_new
)

### Generating Services

### Generating Module File
_generate_module_lisp(yolo_new
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolo_new
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(yolo_new_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(yolo_new_generate_messages yolo_new_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/position_color.msg" NAME_WE)
add_dependencies(yolo_new_generate_messages_lisp _yolo_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/arm_target.msg" NAME_WE)
add_dependencies(yolo_new_generate_messages_lisp _yolo_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/color_ik_result_new.msg" NAME_WE)
add_dependencies(yolo_new_generate_messages_lisp _yolo_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/arm_target_position.msg" NAME_WE)
add_dependencies(yolo_new_generate_messages_lisp _yolo_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/arm_init_position.msg" NAME_WE)
add_dependencies(yolo_new_generate_messages_lisp _yolo_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/BoundingBox.msg" NAME_WE)
add_dependencies(yolo_new_generate_messages_lisp _yolo_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/BoundingBoxes.msg" NAME_WE)
add_dependencies(yolo_new_generate_messages_lisp _yolo_new_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(yolo_new_genlisp)
add_dependencies(yolo_new_genlisp yolo_new_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS yolo_new_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(yolo_new
  "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/position_color.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolo_new
)
_generate_msg_nodejs(yolo_new
  "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/arm_target.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolo_new
)
_generate_msg_nodejs(yolo_new
  "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/color_ik_result_new.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolo_new
)
_generate_msg_nodejs(yolo_new
  "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/arm_target_position.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolo_new
)
_generate_msg_nodejs(yolo_new
  "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/arm_init_position.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolo_new
)
_generate_msg_nodejs(yolo_new
  "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/BoundingBox.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolo_new
)
_generate_msg_nodejs(yolo_new
  "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/BoundingBoxes.msg"
  "${MSG_I_FLAGS}"
  "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/BoundingBox.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolo_new
)

### Generating Services

### Generating Module File
_generate_module_nodejs(yolo_new
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolo_new
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(yolo_new_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(yolo_new_generate_messages yolo_new_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/position_color.msg" NAME_WE)
add_dependencies(yolo_new_generate_messages_nodejs _yolo_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/arm_target.msg" NAME_WE)
add_dependencies(yolo_new_generate_messages_nodejs _yolo_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/color_ik_result_new.msg" NAME_WE)
add_dependencies(yolo_new_generate_messages_nodejs _yolo_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/arm_target_position.msg" NAME_WE)
add_dependencies(yolo_new_generate_messages_nodejs _yolo_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/arm_init_position.msg" NAME_WE)
add_dependencies(yolo_new_generate_messages_nodejs _yolo_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/BoundingBox.msg" NAME_WE)
add_dependencies(yolo_new_generate_messages_nodejs _yolo_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/BoundingBoxes.msg" NAME_WE)
add_dependencies(yolo_new_generate_messages_nodejs _yolo_new_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(yolo_new_gennodejs)
add_dependencies(yolo_new_gennodejs yolo_new_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS yolo_new_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(yolo_new
  "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/position_color.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolo_new
)
_generate_msg_py(yolo_new
  "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/arm_target.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolo_new
)
_generate_msg_py(yolo_new
  "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/color_ik_result_new.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolo_new
)
_generate_msg_py(yolo_new
  "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/arm_target_position.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolo_new
)
_generate_msg_py(yolo_new
  "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/arm_init_position.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolo_new
)
_generate_msg_py(yolo_new
  "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/BoundingBox.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolo_new
)
_generate_msg_py(yolo_new
  "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/BoundingBoxes.msg"
  "${MSG_I_FLAGS}"
  "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/BoundingBox.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolo_new
)

### Generating Services

### Generating Module File
_generate_module_py(yolo_new
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolo_new
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(yolo_new_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(yolo_new_generate_messages yolo_new_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/position_color.msg" NAME_WE)
add_dependencies(yolo_new_generate_messages_py _yolo_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/arm_target.msg" NAME_WE)
add_dependencies(yolo_new_generate_messages_py _yolo_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/color_ik_result_new.msg" NAME_WE)
add_dependencies(yolo_new_generate_messages_py _yolo_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/arm_target_position.msg" NAME_WE)
add_dependencies(yolo_new_generate_messages_py _yolo_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/arm_init_position.msg" NAME_WE)
add_dependencies(yolo_new_generate_messages_py _yolo_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/BoundingBox.msg" NAME_WE)
add_dependencies(yolo_new_generate_messages_py _yolo_new_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/BoundingBoxes.msg" NAME_WE)
add_dependencies(yolo_new_generate_messages_py _yolo_new_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(yolo_new_genpy)
add_dependencies(yolo_new_genpy yolo_new_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS yolo_new_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolo_new)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/yolo_new
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(yolo_new_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(yolo_new_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolo_new)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/yolo_new
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(yolo_new_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(yolo_new_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolo_new)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/yolo_new
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(yolo_new_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(yolo_new_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolo_new)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/yolo_new
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(yolo_new_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(yolo_new_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolo_new)
  install(CODE "execute_process(COMMAND \"/home/moyu/anaconda3/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolo_new\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/yolo_new
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(yolo_new_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(yolo_new_generate_messages_py geometry_msgs_generate_messages_py)
endif()
