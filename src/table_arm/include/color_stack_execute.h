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

#include <std_msgs/Float32.h>
#include <std_msgs/String.h>
#include <table_arm/color_ik_result.h>
#include <moveit/move_group_interface/move_group_interface.h>

#define color_number 10 

class arm_init
{
  public:

  private:

    moveit::planning_interface::MoveGroupInterface arm,hand;
  
};


  void arm_pick();
  void arm_put(int put_sequence);
  int take_average();
  int color_gripping_sequence();

#endif
