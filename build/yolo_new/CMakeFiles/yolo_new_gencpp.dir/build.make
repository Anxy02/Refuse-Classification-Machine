# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/moyu/wheeltec_arm/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/moyu/wheeltec_arm/build

# Utility rule file for yolo_new_gencpp.

# Include the progress variables for this target.
include yolo_new/CMakeFiles/yolo_new_gencpp.dir/progress.make

yolo_new_gencpp: yolo_new/CMakeFiles/yolo_new_gencpp.dir/build.make

.PHONY : yolo_new_gencpp

# Rule to build all files generated by this target.
yolo_new/CMakeFiles/yolo_new_gencpp.dir/build: yolo_new_gencpp

.PHONY : yolo_new/CMakeFiles/yolo_new_gencpp.dir/build

yolo_new/CMakeFiles/yolo_new_gencpp.dir/clean:
	cd /home/moyu/wheeltec_arm/build/yolo_new && $(CMAKE_COMMAND) -P CMakeFiles/yolo_new_gencpp.dir/cmake_clean.cmake
.PHONY : yolo_new/CMakeFiles/yolo_new_gencpp.dir/clean

yolo_new/CMakeFiles/yolo_new_gencpp.dir/depend:
	cd /home/moyu/wheeltec_arm/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/moyu/wheeltec_arm/src /home/moyu/wheeltec_arm/src/yolo_new /home/moyu/wheeltec_arm/build /home/moyu/wheeltec_arm/build/yolo_new /home/moyu/wheeltec_arm/build/yolo_new/CMakeFiles/yolo_new_gencpp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : yolo_new/CMakeFiles/yolo_new_gencpp.dir/depend

