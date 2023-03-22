# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from yolo_new/position_color.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class position_color(genpy.Message):
  _md5sum = "5fddc2a4e1da7ee01660a69ccfefa88b"
  _type = "yolo_new/position_color"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """float32 angleX
float32 angleY
float32 rotation
int32   count
string  color


"""
  __slots__ = ['angleX','angleY','rotation','count','color']
  _slot_types = ['float32','float32','float32','int32','string']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       angleX,angleY,rotation,count,color

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(position_color, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.angleX is None:
        self.angleX = 0.
      if self.angleY is None:
        self.angleY = 0.
      if self.rotation is None:
        self.rotation = 0.
      if self.count is None:
        self.count = 0
      if self.color is None:
        self.color = ''
    else:
      self.angleX = 0.
      self.angleY = 0.
      self.rotation = 0.
      self.count = 0
      self.color = ''

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
      buff.write(_get_struct_3fi().pack(_x.angleX, _x.angleY, _x.rotation, _x.count))
      _x = self.color
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
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
      end += 16
      (_x.angleX, _x.angleY, _x.rotation, _x.count,) = _get_struct_3fi().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.color = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.color = str[start:end]
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
      buff.write(_get_struct_3fi().pack(_x.angleX, _x.angleY, _x.rotation, _x.count))
      _x = self.color
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
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
      end += 16
      (_x.angleX, _x.angleY, _x.rotation, _x.count,) = _get_struct_3fi().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.color = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.color = str[start:end]
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_3fi = None
def _get_struct_3fi():
    global _struct_3fi
    if _struct_3fi is None:
        _struct_3fi = struct.Struct("<3fi")
    return _struct_3fi
