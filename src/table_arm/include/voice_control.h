#ifndef __WHEELTEC_ARM_H_
#define __WHEELTEC_ARM_H_

#include <ros/ros.h>
#include <iostream>
#include <string.h>
#include <stdio.h>
#include <string>
#include <stdlib.h>
#include <unistd.h>
#include <math.h>
#include <sys/types.h>
#include <sys/stat.h> 
#include <fcntl.h>
#include <stdbool.h>
#include <std_msgs/Int32.h>
#include <std_msgs/Float32.h>
#include <std_msgs/String.h>
#include <moveit/move_group_interface/move_group_interface.h>
#include <table_arm/arm_target_position.h>

class arm_init
{
  public:

  private:

    moveit::planning_interface::MoveGroupInterface arm,hand;
  
};


#endif
