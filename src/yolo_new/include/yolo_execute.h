#ifndef __WHEELTEC_ARM_H_
#define __WHEELTEC_ARM_H_

#include <ros/ros.h>
#include <iostream>
#include <string.h>
#include <string>
#include <stdlib.h>
#include <unistd.h>
#include <math.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdbool.h>
#include <locale>

#include <std_msgs/Float32.h>
#include <std_msgs/String.h>
#include <table_arm/color_ik_result.h>
#include <yolo_new/color_ik_result_new.h>
#include <moveit/move_group_interface/move_group_interface.h>
#include "yolo_new/Flag.h"

#define color_number 10 

class arm_init
{
  public:

  private:

    moveit::planning_interface::MoveGroupInterface arm,hand;
  
};


  void arm_pick();
  void arm_put(std::string color);
  int take_average();
  // int mode_object();
  // int single_object();
  // int single_grasp();
  int multi_grasp_sequence();

#endif
