// Generated by gencpp from file xf_mic_asr_offline/Pcm_Msg.msg
// DO NOT EDIT!


#ifndef XF_MIC_ASR_OFFLINE_MESSAGE_PCM_MSG_H
#define XF_MIC_ASR_OFFLINE_MESSAGE_PCM_MSG_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace xf_mic_asr_offline
{
template <class ContainerAllocator>
struct Pcm_Msg_
{
  typedef Pcm_Msg_<ContainerAllocator> Type;

  Pcm_Msg_()
    : length(0)
    , pcm_buf()  {
    }
  Pcm_Msg_(const ContainerAllocator& _alloc)
    : length(0)
    , pcm_buf(_alloc)  {
  (void)_alloc;
    }



   typedef int32_t _length_type;
  _length_type length;

   typedef std::vector<uint8_t, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<uint8_t>> _pcm_buf_type;
  _pcm_buf_type pcm_buf;





  typedef boost::shared_ptr< ::xf_mic_asr_offline::Pcm_Msg_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::xf_mic_asr_offline::Pcm_Msg_<ContainerAllocator> const> ConstPtr;

}; // struct Pcm_Msg_

typedef ::xf_mic_asr_offline::Pcm_Msg_<std::allocator<void> > Pcm_Msg;

typedef boost::shared_ptr< ::xf_mic_asr_offline::Pcm_Msg > Pcm_MsgPtr;
typedef boost::shared_ptr< ::xf_mic_asr_offline::Pcm_Msg const> Pcm_MsgConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::xf_mic_asr_offline::Pcm_Msg_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::xf_mic_asr_offline::Pcm_Msg_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::xf_mic_asr_offline::Pcm_Msg_<ContainerAllocator1> & lhs, const ::xf_mic_asr_offline::Pcm_Msg_<ContainerAllocator2> & rhs)
{
  return lhs.length == rhs.length &&
    lhs.pcm_buf == rhs.pcm_buf;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::xf_mic_asr_offline::Pcm_Msg_<ContainerAllocator1> & lhs, const ::xf_mic_asr_offline::Pcm_Msg_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace xf_mic_asr_offline

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::xf_mic_asr_offline::Pcm_Msg_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::xf_mic_asr_offline::Pcm_Msg_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::xf_mic_asr_offline::Pcm_Msg_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::xf_mic_asr_offline::Pcm_Msg_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::xf_mic_asr_offline::Pcm_Msg_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::xf_mic_asr_offline::Pcm_Msg_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::xf_mic_asr_offline::Pcm_Msg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "63f33267f81495e9e97f232ac4904a62";
  }

  static const char* value(const ::xf_mic_asr_offline::Pcm_Msg_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x63f33267f81495e9ULL;
  static const uint64_t static_value2 = 0xe97f232ac4904a62ULL;
};

template<class ContainerAllocator>
struct DataType< ::xf_mic_asr_offline::Pcm_Msg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "xf_mic_asr_offline/Pcm_Msg";
  }

  static const char* value(const ::xf_mic_asr_offline::Pcm_Msg_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::xf_mic_asr_offline::Pcm_Msg_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32 length\n"
"char[] pcm_buf\n"
;
  }

  static const char* value(const ::xf_mic_asr_offline::Pcm_Msg_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::xf_mic_asr_offline::Pcm_Msg_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.length);
      stream.next(m.pcm_buf);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Pcm_Msg_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::xf_mic_asr_offline::Pcm_Msg_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::xf_mic_asr_offline::Pcm_Msg_<ContainerAllocator>& v)
  {
    s << indent << "length: ";
    Printer<int32_t>::stream(s, indent + "  ", v.length);
    s << indent << "pcm_buf[]" << std::endl;
    for (size_t i = 0; i < v.pcm_buf.size(); ++i)
    {
      s << indent << "  pcm_buf[" << i << "]: ";
      Printer<uint8_t>::stream(s, indent + "  ", v.pcm_buf[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // XF_MIC_ASR_OFFLINE_MESSAGE_PCM_MSG_H
