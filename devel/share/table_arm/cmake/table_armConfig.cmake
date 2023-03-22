# generated from catkin/cmake/template/pkgConfig.cmake.in

# append elements to a list and remove existing duplicates from the list
# copied from catkin/cmake/list_append_deduplicate.cmake to keep pkgConfig
# self contained
macro(_list_append_deduplicate listname)
  if(NOT "${ARGN}" STREQUAL "")
    if(${listname})
      list(REMOVE_ITEM ${listname} ${ARGN})
    endif()
    list(APPEND ${listname} ${ARGN})
  endif()
endmacro()

# append elements to a list if they are not already in the list
# copied from catkin/cmake/list_append_unique.cmake to keep pkgConfig
# self contained
macro(_list_append_unique listname)
  foreach(_item ${ARGN})
    list(FIND ${listname} ${_item} _index)
    if(_index EQUAL -1)
      list(APPEND ${listname} ${_item})
    endif()
  endforeach()
endmacro()

# pack a list of libraries with optional build configuration keywords
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_pack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  set(_argn ${ARGN})
  list(LENGTH _argn _count)
  set(_index 0)
  while(${_index} LESS ${_count})
    list(GET _argn ${_index} lib)
    if("${lib}" MATCHES "^(debug|optimized|general)$")
      math(EXPR _index "${_index} + 1")
      if(${_index} EQUAL ${_count})
        message(FATAL_ERROR "_pack_libraries_with_build_configuration() the list of libraries '${ARGN}' ends with '${lib}' which is a build configuration keyword and must be followed by a library")
      endif()
      list(GET _argn ${_index} library)
      list(APPEND ${VAR} "${lib}${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}${library}")
    else()
      list(APPEND ${VAR} "${lib}")
    endif()
    math(EXPR _index "${_index} + 1")
  endwhile()
endmacro()

# unpack a list of libraries with optional build configuration keyword prefixes
# copied from catkin/cmake/catkin_libraries.cmake to keep pkgConfig
# self contained
macro(_unpack_libraries_with_build_configuration VAR)
  set(${VAR} "")
  foreach(lib ${ARGN})
    string(REGEX REPLACE "^(debug|optimized|general)${CATKIN_BUILD_CONFIGURATION_KEYWORD_SEPARATOR}(.+)$" "\\1;\\2" lib "${lib}")
    list(APPEND ${VAR} "${lib}")
  endforeach()
endmacro()


if(table_arm_CONFIG_INCLUDED)
  return()
endif()
set(table_arm_CONFIG_INCLUDED TRUE)

# set variables for source/devel/install prefixes
if("TRUE" STREQUAL "TRUE")
  set(table_arm_SOURCE_PREFIX /home/moyu/wheeltec_arm/src/table_arm)
  set(table_arm_DEVEL_PREFIX /home/moyu/wheeltec_arm/devel)
  set(table_arm_INSTALL_PREFIX "")
  set(table_arm_PREFIX ${table_arm_DEVEL_PREFIX})
else()
  set(table_arm_SOURCE_PREFIX "")
  set(table_arm_DEVEL_PREFIX "")
  set(table_arm_INSTALL_PREFIX /home/moyu/wheeltec_arm/install)
  set(table_arm_PREFIX ${table_arm_INSTALL_PREFIX})
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "WARNING: package 'table_arm' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  message("${_msg}")
endif()

# flag project as catkin-based to distinguish if a find_package()-ed project is a catkin project
set(table_arm_FOUND_CATKIN_PROJECT TRUE)

if(NOT "/home/moyu/wheeltec_arm/devel/include " STREQUAL " ")
  set(table_arm_INCLUDE_DIRS "")
  set(_include_dirs "/home/moyu/wheeltec_arm/devel/include")
  if(NOT " " STREQUAL " ")
    set(_report "Check the issue tracker '' and consider creating a ticket if the problem has not been reported yet.")
  elseif(NOT " " STREQUAL " ")
    set(_report "Check the website '' for information and consider reporting the problem.")
  else()
    set(_report "Report the problem to the maintainer 'passoni <passoni@todo.todo>' and request to fix the problem.")
  endif()
  foreach(idir ${_include_dirs})
    if(IS_ABSOLUTE ${idir} AND IS_DIRECTORY ${idir})
      set(include ${idir})
    elseif("${idir} " STREQUAL "include ")
      get_filename_component(include "${table_arm_DIR}/../../../include" ABSOLUTE)
      if(NOT IS_DIRECTORY ${include})
        message(FATAL_ERROR "Project 'table_arm' specifies '${idir}' as an include dir, which is not found.  It does not exist in '${include}'.  ${_report}")
      endif()
    else()
      message(FATAL_ERROR "Project 'table_arm' specifies '${idir}' as an include dir, which is not found.  It does neither exist as an absolute directory nor in '/home/moyu/wheeltec_arm/src/table_arm/${idir}'.  ${_report}")
    endif()
    _list_append_unique(table_arm_INCLUDE_DIRS ${include})
  endforeach()
endif()

set(libraries "")
foreach(library ${libraries})
  # keep build configuration keywords, target names and absolute libraries as-is
  if("${library}" MATCHES "^(debug|optimized|general)$")
    list(APPEND table_arm_LIBRARIES ${library})
  elseif(${library} MATCHES "^-l")
    list(APPEND table_arm_LIBRARIES ${library})
  elseif(${library} MATCHES "^-")
    # This is a linker flag/option (like -pthread)
    # There's no standard variable for these, so create an interface library to hold it
    if(NOT table_arm_NUM_DUMMY_TARGETS)
      set(table_arm_NUM_DUMMY_TARGETS 0)
    endif()
    # Make sure the target name is unique
    set(interface_target_name "catkin::table_arm::wrapped-linker-option${table_arm_NUM_DUMMY_TARGETS}")
    while(TARGET "${interface_target_name}")
      math(EXPR table_arm_NUM_DUMMY_TARGETS "${table_arm_NUM_DUMMY_TARGETS}+1")
      set(interface_target_name "catkin::table_arm::wrapped-linker-option${table_arm_NUM_DUMMY_TARGETS}")
    endwhile()
    add_library("${interface_target_name}" INTERFACE IMPORTED)
    if("${CMAKE_VERSION}" VERSION_LESS "3.13.0")
      set_property(
        TARGET
        "${interface_target_name}"
        APPEND PROPERTY
        INTERFACE_LINK_LIBRARIES "${library}")
    else()
      target_link_options("${interface_target_name}" INTERFACE "${library}")
    endif()
    list(APPEND table_arm_LIBRARIES "${interface_target_name}")
  elseif(TARGET ${library})
    list(APPEND table_arm_LIBRARIES ${library})
  elseif(IS_ABSOLUTE ${library})
    list(APPEND table_arm_LIBRARIES ${library})
  else()
    set(lib_path "")
    set(lib "${library}-NOTFOUND")
    # since the path where the library is found is returned we have to iterate over the paths manually
    foreach(path /home/moyu/wheeltec_arm/devel/lib;/home/moyu/wheeltec_arm/devel/lib;/home/moyu/ros_yolov5/devel/lib;/opt/ros/noetic/lib)
      find_library(lib ${library}
        PATHS ${path}
        NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
      if(lib)
        set(lib_path ${path})
        break()
      endif()
    endforeach()
    if(lib)
      _list_append_unique(table_arm_LIBRARY_DIRS ${lib_path})
      list(APPEND table_arm_LIBRARIES ${lib})
    else()
      # as a fall back for non-catkin libraries try to search globally
      find_library(lib ${library})
      if(NOT lib)
        message(FATAL_ERROR "Project '${PROJECT_NAME}' tried to find library '${library}'.  The library is neither a target nor built/installed properly.  Did you compile project 'table_arm'?  Did you find_package() it before the subdirectory containing its code is included?")
      endif()
      list(APPEND table_arm_LIBRARIES ${lib})
    endif()
  endif()
endforeach()

set(table_arm_EXPORTED_TARGETS "table_arm_generate_messages_cpp;table_arm_generate_messages_eus;table_arm_generate_messages_lisp;table_arm_generate_messages_nodejs;table_arm_generate_messages_py")
# create dummy targets for exported code generation targets to make life of users easier
foreach(t ${table_arm_EXPORTED_TARGETS})
  if(NOT TARGET ${t})
    add_custom_target(${t})
  endif()
endforeach()

set(depends "")
foreach(depend ${depends})
  string(REPLACE " " ";" depend_list ${depend})
  # the package name of the dependency must be kept in a unique variable so that it is not overwritten in recursive calls
  list(GET depend_list 0 table_arm_dep)
  list(LENGTH depend_list count)
  if(${count} EQUAL 1)
    # simple dependencies must only be find_package()-ed once
    if(NOT ${table_arm_dep}_FOUND)
      find_package(${table_arm_dep} REQUIRED NO_MODULE)
    endif()
  else()
    # dependencies with components must be find_package()-ed again
    list(REMOVE_AT depend_list 0)
    find_package(${table_arm_dep} REQUIRED NO_MODULE ${depend_list})
  endif()
  _list_append_unique(table_arm_INCLUDE_DIRS ${${table_arm_dep}_INCLUDE_DIRS})

  # merge build configuration keywords with library names to correctly deduplicate
  _pack_libraries_with_build_configuration(table_arm_LIBRARIES ${table_arm_LIBRARIES})
  _pack_libraries_with_build_configuration(_libraries ${${table_arm_dep}_LIBRARIES})
  _list_append_deduplicate(table_arm_LIBRARIES ${_libraries})
  # undo build configuration keyword merging after deduplication
  _unpack_libraries_with_build_configuration(table_arm_LIBRARIES ${table_arm_LIBRARIES})

  _list_append_unique(table_arm_LIBRARY_DIRS ${${table_arm_dep}_LIBRARY_DIRS})
  _list_append_deduplicate(table_arm_EXPORTED_TARGETS ${${table_arm_dep}_EXPORTED_TARGETS})
endforeach()

set(pkg_cfg_extras "table_arm-msg-extras.cmake")
foreach(extra ${pkg_cfg_extras})
  if(NOT IS_ABSOLUTE ${extra})
    set(extra ${table_arm_DIR}/${extra})
  endif()
  include(${extra})
endforeach()
