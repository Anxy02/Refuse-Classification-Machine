# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "table_arm: 5 messages, 0 services")

set(MSG_I_FLAGS "-Itable_arm:/home/moyu/wheeltec_arm/src/table_arm/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(table_arm_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/moyu/wheeltec_arm/src/table_arm/msg/position_color.msg" NAME_WE)
add_custom_target(_table_arm_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "table_arm" "/home/moyu/wheeltec_arm/src/table_arm/msg/position_color.msg" ""
)

get_filename_component(_filename "/home/moyu/wheeltec_arm/src/table_arm/msg/arm_target.msg" NAME_WE)
add_custom_target(_table_arm_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "table_arm" "/home/moyu/wheeltec_arm/src/table_arm/msg/arm_target.msg" ""
)

get_filename_component(_filename "/home/moyu/wheeltec_arm/src/table_arm/msg/color_ik_result.msg" NAME_WE)
add_custom_target(_table_arm_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "table_arm" "/home/moyu/wheeltec_arm/src/table_arm/msg/color_ik_result.msg" ""
)

get_filename_component(_filename "/home/moyu/wheeltec_arm/src/table_arm/msg/arm_target_position.msg" NAME_WE)
add_custom_target(_table_arm_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "table_arm" "/home/moyu/wheeltec_arm/src/table_arm/msg/arm_target_position.msg" ""
)

get_filename_component(_filename "/home/moyu/wheeltec_arm/src/table_arm/msg/arm_init_position.msg" NAME_WE)
add_custom_target(_table_arm_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "table_arm" "/home/moyu/wheeltec_arm/src/table_arm/msg/arm_init_position.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(table_arm
  "/home/moyu/wheeltec_arm/src/table_arm/msg/position_color.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/table_arm
)
_generate_msg_cpp(table_arm
  "/home/moyu/wheeltec_arm/src/table_arm/msg/arm_target.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/table_arm
)
_generate_msg_cpp(table_arm
  "/home/moyu/wheeltec_arm/src/table_arm/msg/color_ik_result.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/table_arm
)
_generate_msg_cpp(table_arm
  "/home/moyu/wheeltec_arm/src/table_arm/msg/arm_target_position.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/table_arm
)
_generate_msg_cpp(table_arm
  "/home/moyu/wheeltec_arm/src/table_arm/msg/arm_init_position.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/table_arm
)

### Generating Services

### Generating Module File
_generate_module_cpp(table_arm
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/table_arm
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(table_arm_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(table_arm_generate_messages table_arm_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/moyu/wheeltec_arm/src/table_arm/msg/position_color.msg" NAME_WE)
add_dependencies(table_arm_generate_messages_cpp _table_arm_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/wheeltec_arm/src/table_arm/msg/arm_target.msg" NAME_WE)
add_dependencies(table_arm_generate_messages_cpp _table_arm_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/wheeltec_arm/src/table_arm/msg/color_ik_result.msg" NAME_WE)
add_dependencies(table_arm_generate_messages_cpp _table_arm_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/wheeltec_arm/src/table_arm/msg/arm_target_position.msg" NAME_WE)
add_dependencies(table_arm_generate_messages_cpp _table_arm_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/wheeltec_arm/src/table_arm/msg/arm_init_position.msg" NAME_WE)
add_dependencies(table_arm_generate_messages_cpp _table_arm_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(table_arm_gencpp)
add_dependencies(table_arm_gencpp table_arm_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS table_arm_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(table_arm
  "/home/moyu/wheeltec_arm/src/table_arm/msg/position_color.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/table_arm
)
_generate_msg_eus(table_arm
  "/home/moyu/wheeltec_arm/src/table_arm/msg/arm_target.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/table_arm
)
_generate_msg_eus(table_arm
  "/home/moyu/wheeltec_arm/src/table_arm/msg/color_ik_result.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/table_arm
)
_generate_msg_eus(table_arm
  "/home/moyu/wheeltec_arm/src/table_arm/msg/arm_target_position.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/table_arm
)
_generate_msg_eus(table_arm
  "/home/moyu/wheeltec_arm/src/table_arm/msg/arm_init_position.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/table_arm
)

### Generating Services

### Generating Module File
_generate_module_eus(table_arm
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/table_arm
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(table_arm_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(table_arm_generate_messages table_arm_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/moyu/wheeltec_arm/src/table_arm/msg/position_color.msg" NAME_WE)
add_dependencies(table_arm_generate_messages_eus _table_arm_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/wheeltec_arm/src/table_arm/msg/arm_target.msg" NAME_WE)
add_dependencies(table_arm_generate_messages_eus _table_arm_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/wheeltec_arm/src/table_arm/msg/color_ik_result.msg" NAME_WE)
add_dependencies(table_arm_generate_messages_eus _table_arm_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/wheeltec_arm/src/table_arm/msg/arm_target_position.msg" NAME_WE)
add_dependencies(table_arm_generate_messages_eus _table_arm_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/wheeltec_arm/src/table_arm/msg/arm_init_position.msg" NAME_WE)
add_dependencies(table_arm_generate_messages_eus _table_arm_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(table_arm_geneus)
add_dependencies(table_arm_geneus table_arm_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS table_arm_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(table_arm
  "/home/moyu/wheeltec_arm/src/table_arm/msg/position_color.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/table_arm
)
_generate_msg_lisp(table_arm
  "/home/moyu/wheeltec_arm/src/table_arm/msg/arm_target.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/table_arm
)
_generate_msg_lisp(table_arm
  "/home/moyu/wheeltec_arm/src/table_arm/msg/color_ik_result.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/table_arm
)
_generate_msg_lisp(table_arm
  "/home/moyu/wheeltec_arm/src/table_arm/msg/arm_target_position.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/table_arm
)
_generate_msg_lisp(table_arm
  "/home/moyu/wheeltec_arm/src/table_arm/msg/arm_init_position.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/table_arm
)

### Generating Services

### Generating Module File
_generate_module_lisp(table_arm
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/table_arm
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(table_arm_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(table_arm_generate_messages table_arm_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/moyu/wheeltec_arm/src/table_arm/msg/position_color.msg" NAME_WE)
add_dependencies(table_arm_generate_messages_lisp _table_arm_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/wheeltec_arm/src/table_arm/msg/arm_target.msg" NAME_WE)
add_dependencies(table_arm_generate_messages_lisp _table_arm_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/wheeltec_arm/src/table_arm/msg/color_ik_result.msg" NAME_WE)
add_dependencies(table_arm_generate_messages_lisp _table_arm_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/wheeltec_arm/src/table_arm/msg/arm_target_position.msg" NAME_WE)
add_dependencies(table_arm_generate_messages_lisp _table_arm_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/wheeltec_arm/src/table_arm/msg/arm_init_position.msg" NAME_WE)
add_dependencies(table_arm_generate_messages_lisp _table_arm_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(table_arm_genlisp)
add_dependencies(table_arm_genlisp table_arm_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS table_arm_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(table_arm
  "/home/moyu/wheeltec_arm/src/table_arm/msg/position_color.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/table_arm
)
_generate_msg_nodejs(table_arm
  "/home/moyu/wheeltec_arm/src/table_arm/msg/arm_target.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/table_arm
)
_generate_msg_nodejs(table_arm
  "/home/moyu/wheeltec_arm/src/table_arm/msg/color_ik_result.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/table_arm
)
_generate_msg_nodejs(table_arm
  "/home/moyu/wheeltec_arm/src/table_arm/msg/arm_target_position.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/table_arm
)
_generate_msg_nodejs(table_arm
  "/home/moyu/wheeltec_arm/src/table_arm/msg/arm_init_position.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/table_arm
)

### Generating Services

### Generating Module File
_generate_module_nodejs(table_arm
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/table_arm
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(table_arm_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(table_arm_generate_messages table_arm_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/moyu/wheeltec_arm/src/table_arm/msg/position_color.msg" NAME_WE)
add_dependencies(table_arm_generate_messages_nodejs _table_arm_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/wheeltec_arm/src/table_arm/msg/arm_target.msg" NAME_WE)
add_dependencies(table_arm_generate_messages_nodejs _table_arm_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/wheeltec_arm/src/table_arm/msg/color_ik_result.msg" NAME_WE)
add_dependencies(table_arm_generate_messages_nodejs _table_arm_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/wheeltec_arm/src/table_arm/msg/arm_target_position.msg" NAME_WE)
add_dependencies(table_arm_generate_messages_nodejs _table_arm_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/wheeltec_arm/src/table_arm/msg/arm_init_position.msg" NAME_WE)
add_dependencies(table_arm_generate_messages_nodejs _table_arm_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(table_arm_gennodejs)
add_dependencies(table_arm_gennodejs table_arm_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS table_arm_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(table_arm
  "/home/moyu/wheeltec_arm/src/table_arm/msg/position_color.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/table_arm
)
_generate_msg_py(table_arm
  "/home/moyu/wheeltec_arm/src/table_arm/msg/arm_target.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/table_arm
)
_generate_msg_py(table_arm
  "/home/moyu/wheeltec_arm/src/table_arm/msg/color_ik_result.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/table_arm
)
_generate_msg_py(table_arm
  "/home/moyu/wheeltec_arm/src/table_arm/msg/arm_target_position.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/table_arm
)
_generate_msg_py(table_arm
  "/home/moyu/wheeltec_arm/src/table_arm/msg/arm_init_position.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/table_arm
)

### Generating Services

### Generating Module File
_generate_module_py(table_arm
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/table_arm
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(table_arm_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(table_arm_generate_messages table_arm_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/moyu/wheeltec_arm/src/table_arm/msg/position_color.msg" NAME_WE)
add_dependencies(table_arm_generate_messages_py _table_arm_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/wheeltec_arm/src/table_arm/msg/arm_target.msg" NAME_WE)
add_dependencies(table_arm_generate_messages_py _table_arm_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/wheeltec_arm/src/table_arm/msg/color_ik_result.msg" NAME_WE)
add_dependencies(table_arm_generate_messages_py _table_arm_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/wheeltec_arm/src/table_arm/msg/arm_target_position.msg" NAME_WE)
add_dependencies(table_arm_generate_messages_py _table_arm_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/moyu/wheeltec_arm/src/table_arm/msg/arm_init_position.msg" NAME_WE)
add_dependencies(table_arm_generate_messages_py _table_arm_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(table_arm_genpy)
add_dependencies(table_arm_genpy table_arm_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS table_arm_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/table_arm)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/table_arm
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(table_arm_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(table_arm_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/table_arm)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/table_arm
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(table_arm_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(table_arm_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/table_arm)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/table_arm
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(table_arm_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(table_arm_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/table_arm)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/table_arm
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(table_arm_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(table_arm_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/table_arm)
  install(CODE "execute_process(COMMAND \"/home/moyu/anaconda3/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/table_arm\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/table_arm
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(table_arm_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(table_arm_generate_messages_py geometry_msgs_generate_messages_py)
endif()
