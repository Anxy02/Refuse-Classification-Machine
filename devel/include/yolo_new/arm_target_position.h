// Generated by gencpp from file yolo_new/arm_target_position.msg
// DO NOT EDIT!


#ifndef YOLO_NEW_MESSAGE_ARM_TARGET_POSITION_H
#define YOLO_NEW_MESSAGE_ARM_TARGET_POSITION_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace yolo_new
{
template <class ContainerAllocator>
struct arm_target_position_
{
  typedef arm_target_position_<ContainerAllocator> Type;

  arm_target_position_()
    : joint1(0.0)
    , joint2(0.0)
    , joint3(0.0)
    , joint4(0.0)
    , joint5(0.0)
    , joint6(0.0)  {
    }
  arm_target_position_(const ContainerAllocator& _alloc)
    : joint1(0.0)
    , joint2(0.0)
    , joint3(0.0)
    , joint4(0.0)
    , joint5(0.0)
    , joint6(0.0)  {
  (void)_alloc;
    }



   typedef float _joint1_type;
  _joint1_type joint1;

   typedef float _joint2_type;
  _joint2_type joint2;

   typedef float _joint3_type;
  _joint3_type joint3;

   typedef float _joint4_type;
  _joint4_type joint4;

   typedef float _joint5_type;
  _joint5_type joint5;

   typedef float _joint6_type;
  _joint6_type joint6;





  typedef boost::shared_ptr< ::yolo_new::arm_target_position_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::yolo_new::arm_target_position_<ContainerAllocator> const> ConstPtr;

}; // struct arm_target_position_

typedef ::yolo_new::arm_target_position_<std::allocator<void> > arm_target_position;

typedef boost::shared_ptr< ::yolo_new::arm_target_position > arm_target_positionPtr;
typedef boost::shared_ptr< ::yolo_new::arm_target_position const> arm_target_positionConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::yolo_new::arm_target_position_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::yolo_new::arm_target_position_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::yolo_new::arm_target_position_<ContainerAllocator1> & lhs, const ::yolo_new::arm_target_position_<ContainerAllocator2> & rhs)
{
  return lhs.joint1 == rhs.joint1 &&
    lhs.joint2 == rhs.joint2 &&
    lhs.joint3 == rhs.joint3 &&
    lhs.joint4 == rhs.joint4 &&
    lhs.joint5 == rhs.joint5 &&
    lhs.joint6 == rhs.joint6;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::yolo_new::arm_target_position_<ContainerAllocator1> & lhs, const ::yolo_new::arm_target_position_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace yolo_new

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::yolo_new::arm_target_position_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::yolo_new::arm_target_position_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::yolo_new::arm_target_position_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::yolo_new::arm_target_position_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::yolo_new::arm_target_position_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::yolo_new::arm_target_position_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::yolo_new::arm_target_position_<ContainerAllocator> >
{
  static const char* value()
  {
    return "b0068422b386ec8608fa05052ffe139f";
  }

  static const char* value(const ::yolo_new::arm_target_position_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xb0068422b386ec86ULL;
  static const uint64_t static_value2 = 0x08fa05052ffe139fULL;
};

template<class ContainerAllocator>
struct DataType< ::yolo_new::arm_target_position_<ContainerAllocator> >
{
  static const char* value()
  {
    return "yolo_new/arm_target_position";
  }

  static const char* value(const ::yolo_new::arm_target_position_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::yolo_new::arm_target_position_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 joint1\n"
"float32 joint2\n"
"float32 joint3\n"
"float32 joint4\n"
"float32 joint5\n"
"float32 joint6\n"
"\n"
"\n"
;
  }

  static const char* value(const ::yolo_new::arm_target_position_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::yolo_new::arm_target_position_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.joint1);
      stream.next(m.joint2);
      stream.next(m.joint3);
      stream.next(m.joint4);
      stream.next(m.joint5);
      stream.next(m.joint6);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct arm_target_position_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::yolo_new::arm_target_position_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::yolo_new::arm_target_position_<ContainerAllocator>& v)
  {
    s << indent << "joint1: ";
    Printer<float>::stream(s, indent + "  ", v.joint1);
    s << indent << "joint2: ";
    Printer<float>::stream(s, indent + "  ", v.joint2);
    s << indent << "joint3: ";
    Printer<float>::stream(s, indent + "  ", v.joint3);
    s << indent << "joint4: ";
    Printer<float>::stream(s, indent + "  ", v.joint4);
    s << indent << "joint5: ";
    Printer<float>::stream(s, indent + "  ", v.joint5);
    s << indent << "joint6: ";
    Printer<float>::stream(s, indent + "  ", v.joint6);
  }
};

} // namespace message_operations
} // namespace ros

#endif // YOLO_NEW_MESSAGE_ARM_TARGET_POSITION_H
