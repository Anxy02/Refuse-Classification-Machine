cmake_minimum_required(VERSION 2.8.3)
project(wheeltec_tracker_pkg)

find_package(catkin REQUIRED COMPONENTS
  cv_bridge
  image_transport
  roscpp
  rospy
  sensor_msgs
  std_msgs
  message_generation
  moveit_msgs
  moveit_ros_perception
  moveit_ros_planning_interface
  geometry_msgs 
  roslib
  tf
)

find_package(Boost REQUIRED COMPONENTS system)

find_package(OpenCV REQUIRED COMPONENTS core imgproc highgui objdetect)

add_message_files(DIRECTORY msg
   FILES
   color.msg
   centroid.msg
   gesture.msg
 )

## Generate added messages and services with any dependencies listed here
 generate_messages(
   DEPENDENCIES
   std_msgs
  
 )
catkin_package(
  CATKIN_DEPENDS roscpp rospy std_msgs message_runtime message_generation

)



include_directories(
  ${catkin_INCLUDE_DIRS}
  #/home/ros-projects/face_ws1/devel/include
)

add_executable(face_tracker_node src/face_tracker_node.cpp)
target_link_libraries(face_tracker_node ${catkin_LIBRARIES} ${OpenCV_LIBRARIES})
add_dependencies(face_tracker_node ${${PROJECT_NAME}_EXPORTED_TARGETS})

add_executable(gesture_recognition_execute src/gesture_recognition.cpp )
target_link_libraries(gesture_recognition_execute ${catkin_LIBRARIES})
add_dependencies(gesture_recognition_execute ${PROJECT_NAME}_generate_messages_cpp)

