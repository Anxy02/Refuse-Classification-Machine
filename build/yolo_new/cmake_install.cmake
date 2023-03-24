# Install script for directory: /home/moyu/Refuse-Classification-Machine/src/yolo_new

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/moyu/Refuse-Classification-Machine/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolo_new/msg" TYPE FILE FILES
    "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/position_color.msg"
    "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/arm_target.msg"
    "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/color_ik_result_new.msg"
    "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/arm_target_position.msg"
    "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/arm_init_position.msg"
    "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/BoundingBox.msg"
    "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/BoundingBoxes.msg"
    "/home/moyu/Refuse-Classification-Machine/src/yolo_new/msg/Flag.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolo_new/cmake" TYPE FILE FILES "/home/moyu/Refuse-Classification-Machine/build/yolo_new/catkin_generated/installspace/yolo_new-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/moyu/Refuse-Classification-Machine/devel/include/yolo_new")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/moyu/Refuse-Classification-Machine/devel/share/roseus/ros/yolo_new")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/moyu/Refuse-Classification-Machine/devel/share/common-lisp/ros/yolo_new")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/moyu/Refuse-Classification-Machine/devel/share/gennodejs/ros/yolo_new")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/home/moyu/anaconda3/bin/python3" -m compileall "/home/moyu/Refuse-Classification-Machine/devel/lib/python3/dist-packages/yolo_new")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/moyu/Refuse-Classification-Machine/devel/lib/python3/dist-packages/yolo_new")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/moyu/Refuse-Classification-Machine/build/yolo_new/catkin_generated/installspace/yolo_new.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolo_new/cmake" TYPE FILE FILES "/home/moyu/Refuse-Classification-Machine/build/yolo_new/catkin_generated/installspace/yolo_new-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolo_new/cmake" TYPE FILE FILES
    "/home/moyu/Refuse-Classification-Machine/build/yolo_new/catkin_generated/installspace/yolo_newConfig.cmake"
    "/home/moyu/Refuse-Classification-Machine/build/yolo_new/catkin_generated/installspace/yolo_newConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/yolo_new" TYPE FILE FILES "/home/moyu/Refuse-Classification-Machine/src/yolo_new/package.xml")
endif()

