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
CMAKE_SOURCE_DIR = /home/moyu/Refuse-Classification-Machine/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/moyu/Refuse-Classification-Machine/build

# Include any dependencies generated for this target.
include arm_demo/CMakeFiles/arm_cartesian_demo.dir/depend.make

# Include the progress variables for this target.
include arm_demo/CMakeFiles/arm_cartesian_demo.dir/progress.make

# Include the compile flags for this target's objects.
include arm_demo/CMakeFiles/arm_cartesian_demo.dir/flags.make

arm_demo/CMakeFiles/arm_cartesian_demo.dir/src/arm_cartesian_demo.cpp.o: arm_demo/CMakeFiles/arm_cartesian_demo.dir/flags.make
arm_demo/CMakeFiles/arm_cartesian_demo.dir/src/arm_cartesian_demo.cpp.o: /home/moyu/Refuse-Classification-Machine/src/arm_demo/src/arm_cartesian_demo.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/moyu/Refuse-Classification-Machine/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object arm_demo/CMakeFiles/arm_cartesian_demo.dir/src/arm_cartesian_demo.cpp.o"
	cd /home/moyu/Refuse-Classification-Machine/build/arm_demo && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/arm_cartesian_demo.dir/src/arm_cartesian_demo.cpp.o -c /home/moyu/Refuse-Classification-Machine/src/arm_demo/src/arm_cartesian_demo.cpp

arm_demo/CMakeFiles/arm_cartesian_demo.dir/src/arm_cartesian_demo.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/arm_cartesian_demo.dir/src/arm_cartesian_demo.cpp.i"
	cd /home/moyu/Refuse-Classification-Machine/build/arm_demo && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/moyu/Refuse-Classification-Machine/src/arm_demo/src/arm_cartesian_demo.cpp > CMakeFiles/arm_cartesian_demo.dir/src/arm_cartesian_demo.cpp.i

arm_demo/CMakeFiles/arm_cartesian_demo.dir/src/arm_cartesian_demo.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/arm_cartesian_demo.dir/src/arm_cartesian_demo.cpp.s"
	cd /home/moyu/Refuse-Classification-Machine/build/arm_demo && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/moyu/Refuse-Classification-Machine/src/arm_demo/src/arm_cartesian_demo.cpp -o CMakeFiles/arm_cartesian_demo.dir/src/arm_cartesian_demo.cpp.s

# Object files for target arm_cartesian_demo
arm_cartesian_demo_OBJECTS = \
"CMakeFiles/arm_cartesian_demo.dir/src/arm_cartesian_demo.cpp.o"

# External object files for target arm_cartesian_demo
arm_cartesian_demo_EXTERNAL_OBJECTS =

/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: arm_demo/CMakeFiles/arm_cartesian_demo.dir/src/arm_cartesian_demo.cpp.o
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: arm_demo/CMakeFiles/arm_cartesian_demo.dir/build.make
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_lazy_free_space_updater.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_point_containment_filter.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_pointcloud_octomap_updater_core.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_semantic_world.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_mesh_filter.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_depth_self_filter.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_depth_image_octomap_updater.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libimage_transport.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libnodeletlib.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libbondcpp.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /usr/lib/x86_64-linux-gnu/libuuid.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_common_planning_interface_objects.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_planning_scene_interface.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_move_group_interface.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_py_bindings_tools.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_warehouse.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libwarehouse_ros.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libtf.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_pick_place_planner.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_move_group_capabilities_base.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_rdf_loader.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_kinematics_plugin_loader.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_robot_model_loader.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_constraint_sampler_manager_loader.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_planning_pipeline.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_trajectory_execution_manager.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_plan_execution.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_planning_scene_monitor.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_collision_plugin_loader.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_cpp.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libdynamic_reconfigure_config_init_mutex.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_ros_occupancy_map_monitor.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_exceptions.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_background_processing.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_kinematics_base.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_robot_model.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_transforms.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_robot_state.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_robot_trajectory.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_planning_interface.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_collision_detection.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_collision_detection_fcl.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_collision_detection_bullet.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_kinematic_constraints.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_planning_scene.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_constraint_samplers.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_planning_request_adapter.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_profiler.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_python_tools.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_trajectory_processing.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_distance_field.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_collision_distance_field.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_kinematics_metrics.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_dynamics_solver.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_utils.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmoveit_test_utils.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /usr/lib/x86_64-linux-gnu/libboost_iostreams.so.1.71.0
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/x86_64-linux-gnu/libfcl.so.0.6.1
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /usr/lib/x86_64-linux-gnu/libccd.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /usr/lib/x86_64-linux-gnu/libm.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/liboctomap.so.1.9.8
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/x86_64-linux-gnu/libruckig.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /usr/lib/x86_64-linux-gnu/libBulletSoftBody.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /usr/lib/x86_64-linux-gnu/libBulletDynamics.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /usr/lib/x86_64-linux-gnu/libBulletCollision.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /usr/lib/x86_64-linux-gnu/libLinearMath.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libkdl_parser.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/liburdf.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /usr/lib/x86_64-linux-gnu/liburdfdom_sensor.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /usr/lib/x86_64-linux-gnu/liburdfdom_model_state.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /usr/lib/x86_64-linux-gnu/liburdfdom_model.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /usr/lib/x86_64-linux-gnu/liburdfdom_world.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /usr/lib/x86_64-linux-gnu/libtinyxml.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/librosconsole_bridge.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libsrdfdom.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libgeometric_shapes.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/liboctomap.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/liboctomath.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/librandom_numbers.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libclass_loader.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /usr/lib/x86_64-linux-gnu/libPocoFoundation.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /usr/lib/x86_64-linux-gnu/libdl.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libroslib.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/librospack.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /usr/lib/x86_64-linux-gnu/libpython3.8.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /usr/lib/x86_64-linux-gnu/libboost_program_options.so.1.71.0
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /usr/lib/x86_64-linux-gnu/libtinyxml2.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /usr/lib/liborocos-kdl.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /usr/lib/liborocos-kdl.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libtf2_ros.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libactionlib.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libmessage_filters.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libroscpp.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /usr/lib/x86_64-linux-gnu/libboost_chrono.so.1.71.0
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so.1.71.0
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/librosconsole.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/librosconsole_log4cxx.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/librosconsole_backend_interface.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /usr/lib/x86_64-linux-gnu/libboost_regex.so.1.71.0
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libxmlrpcpp.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libtf2.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libroscpp_serialization.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/librostime.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /usr/lib/x86_64-linux-gnu/libboost_date_time.so.1.71.0
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /opt/ros/noetic/lib/libcpp_common.so
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /usr/lib/x86_64-linux-gnu/libboost_system.so.1.71.0
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /usr/lib/x86_64-linux-gnu/libboost_thread.so.1.71.0
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so.0.4
/home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo: arm_demo/CMakeFiles/arm_cartesian_demo.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/moyu/Refuse-Classification-Machine/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo"
	cd /home/moyu/Refuse-Classification-Machine/build/arm_demo && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/arm_cartesian_demo.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
arm_demo/CMakeFiles/arm_cartesian_demo.dir/build: /home/moyu/Refuse-Classification-Machine/devel/lib/arm_demo/arm_cartesian_demo

.PHONY : arm_demo/CMakeFiles/arm_cartesian_demo.dir/build

arm_demo/CMakeFiles/arm_cartesian_demo.dir/clean:
	cd /home/moyu/Refuse-Classification-Machine/build/arm_demo && $(CMAKE_COMMAND) -P CMakeFiles/arm_cartesian_demo.dir/cmake_clean.cmake
.PHONY : arm_demo/CMakeFiles/arm_cartesian_demo.dir/clean

arm_demo/CMakeFiles/arm_cartesian_demo.dir/depend:
	cd /home/moyu/Refuse-Classification-Machine/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/moyu/Refuse-Classification-Machine/src /home/moyu/Refuse-Classification-Machine/src/arm_demo /home/moyu/Refuse-Classification-Machine/build /home/moyu/Refuse-Classification-Machine/build/arm_demo /home/moyu/Refuse-Classification-Machine/build/arm_demo/CMakeFiles/arm_cartesian_demo.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : arm_demo/CMakeFiles/arm_cartesian_demo.dir/depend

