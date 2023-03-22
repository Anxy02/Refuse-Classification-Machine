# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from yolo_new/arm_init_position.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class arm_init_position(genpy.Message):
  _md5sum = "214a3a640e2cbc2daa6f74f00b9c277b"
  _type = "yolo_new/arm_init_position"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """int8 init_joint1
int8 init_joint2
int8 init_joint3
int8 init_joint4
int8 init_joint5
int8 init_joint6
int8 save_init_pose
int8 arm_look
int8 arm_home


"""
  __slots__ = ['init_joint1','init_joint2','init_joint3','init_joint4','init_joint5','init_joint6','save_init_pose','arm_look','arm_home']
  _slot_types = ['int8','int8','int8','int8','int8','int8','int8','int8','int8']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       init_joint1,init_joint2,init_joint3,init_joint4,init_joint5,init_joint6,save_init_pose,arm_look,arm_home

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(arm_init_position, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.init_joint1 is None:
        self.init_joint1 = 0
      if self.init_joint2 is None:
        self.init_joint2 = 0
      if self.init_joint3 is None:
        self.init_joint3 = 0
      if self.init_joint4 is None:
        self.init_joint4 = 0
      if self.init_joint5 is None:
        self.init_joint5 = 0
      if self.init_joint6 is None:
        self.init_joint6 = 0
      if self.save_init_pose is None:
        self.save_init_pose = 0
      if self.arm_look is None:
        self.arm_look = 0
      if self.arm_home is None:
        self.arm_home = 0
    else:
      self.init_joint1 = 0
      self.init_joint2 = 0
      self.init_joint3 = 0
      self.init_joint4 = 0
      self.init_joint5 = 0
      self.init_joint6 = 0
      self.save_init_pose = 0
      self.arm_look = 0
      self.arm_home = 0

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_9b().pack(_x.init_joint1, _x.init_joint2, _x.init_joint3, _x.init_joint4, _x.init_joint5, _x.init_joint6, _x.save_init_pose, _x.arm_look, _x.arm_home))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 9
      (_x.init_joint1, _x.init_joint2, _x.init_joint3, _x.init_joint4, _x.init_joint5, _x.init_joint6, _x.save_init_pose, _x.arm_look, _x.arm_home,) = _get_struct_9b().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_9b().pack(_x.init_joint1, _x.init_joint2, _x.init_joint3, _x.init_joint4, _x.init_joint5, _x.init_joint6, _x.save_init_pose, _x.arm_look, _x.arm_home))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 9
      (_x.init_joint1, _x.init_joint2, _x.init_joint3, _x.init_joint4, _x.init_joint5, _x.init_joint6, _x.save_init_pose, _x.arm_look, _x.arm_home,) = _get_struct_9b().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_9b = None
def _get_struct_9b():
    global _struct_9b
    if _struct_9b is None:
        _struct_9b = struct.Struct("<9b")
    return _struct_9b
