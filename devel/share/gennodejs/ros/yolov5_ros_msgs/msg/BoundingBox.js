// Auto-generated. Do not edit!

// (in-package yolov5_ros_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class BoundingBox {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.probability = null;
      this.xmin = null;
      this.ymin = null;
      this.xmax = null;
      this.ymax = null;
      this.num = null;
      this.Class = null;
      this.CNum = null;
      this.xmid = null;
      this.ymid = null;
    }
    else {
      if (initObj.hasOwnProperty('probability')) {
        this.probability = initObj.probability
      }
      else {
        this.probability = 0.0;
      }
      if (initObj.hasOwnProperty('xmin')) {
        this.xmin = initObj.xmin
      }
      else {
        this.xmin = 0;
      }
      if (initObj.hasOwnProperty('ymin')) {
        this.ymin = initObj.ymin
      }
      else {
        this.ymin = 0;
      }
      if (initObj.hasOwnProperty('xmax')) {
        this.xmax = initObj.xmax
      }
      else {
        this.xmax = 0;
      }
      if (initObj.hasOwnProperty('ymax')) {
        this.ymax = initObj.ymax
      }
      else {
        this.ymax = 0;
      }
      if (initObj.hasOwnProperty('num')) {
        this.num = initObj.num
      }
      else {
        this.num = 0;
      }
      if (initObj.hasOwnProperty('Class')) {
        this.Class = initObj.Class
      }
      else {
        this.Class = '';
      }
      if (initObj.hasOwnProperty('CNum')) {
        this.CNum = initObj.CNum
      }
      else {
        this.CNum = 0;
      }
      if (initObj.hasOwnProperty('xmid')) {
        this.xmid = initObj.xmid
      }
      else {
        this.xmid = 0.0;
      }
      if (initObj.hasOwnProperty('ymid')) {
        this.ymid = initObj.ymid
      }
      else {
        this.ymid = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type BoundingBox
    // Serialize message field [probability]
    bufferOffset = _serializer.float64(obj.probability, buffer, bufferOffset);
    // Serialize message field [xmin]
    bufferOffset = _serializer.int64(obj.xmin, buffer, bufferOffset);
    // Serialize message field [ymin]
    bufferOffset = _serializer.int64(obj.ymin, buffer, bufferOffset);
    // Serialize message field [xmax]
    bufferOffset = _serializer.int64(obj.xmax, buffer, bufferOffset);
    // Serialize message field [ymax]
    bufferOffset = _serializer.int64(obj.ymax, buffer, bufferOffset);
    // Serialize message field [num]
    bufferOffset = _serializer.int16(obj.num, buffer, bufferOffset);
    // Serialize message field [Class]
    bufferOffset = _serializer.string(obj.Class, buffer, bufferOffset);
    // Serialize message field [CNum]
    bufferOffset = _serializer.int16(obj.CNum, buffer, bufferOffset);
    // Serialize message field [xmid]
    bufferOffset = _serializer.float64(obj.xmid, buffer, bufferOffset);
    // Serialize message field [ymid]
    bufferOffset = _serializer.float64(obj.ymid, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BoundingBox
    let len;
    let data = new BoundingBox(null);
    // Deserialize message field [probability]
    data.probability = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [xmin]
    data.xmin = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [ymin]
    data.ymin = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [xmax]
    data.xmax = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [ymax]
    data.ymax = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [num]
    data.num = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [Class]
    data.Class = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [CNum]
    data.CNum = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [xmid]
    data.xmid = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [ymid]
    data.ymid = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.Class);
    return length + 64;
  }

  static datatype() {
    // Returns string type for a message object
    return 'yolov5_ros_msgs/BoundingBox';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd92c29ac46962e0d8547dd80ed9d31bc';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 probability
    int64 xmin
    int64 ymin
    int64 xmax
    int64 ymax
    int16 num
    string Class
    int16 CNum
    float64 xmid
    float64 ymid
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new BoundingBox(null);
    if (msg.probability !== undefined) {
      resolved.probability = msg.probability;
    }
    else {
      resolved.probability = 0.0
    }

    if (msg.xmin !== undefined) {
      resolved.xmin = msg.xmin;
    }
    else {
      resolved.xmin = 0
    }

    if (msg.ymin !== undefined) {
      resolved.ymin = msg.ymin;
    }
    else {
      resolved.ymin = 0
    }

    if (msg.xmax !== undefined) {
      resolved.xmax = msg.xmax;
    }
    else {
      resolved.xmax = 0
    }

    if (msg.ymax !== undefined) {
      resolved.ymax = msg.ymax;
    }
    else {
      resolved.ymax = 0
    }

    if (msg.num !== undefined) {
      resolved.num = msg.num;
    }
    else {
      resolved.num = 0
    }

    if (msg.Class !== undefined) {
      resolved.Class = msg.Class;
    }
    else {
      resolved.Class = ''
    }

    if (msg.CNum !== undefined) {
      resolved.CNum = msg.CNum;
    }
    else {
      resolved.CNum = 0
    }

    if (msg.xmid !== undefined) {
      resolved.xmid = msg.xmid;
    }
    else {
      resolved.xmid = 0.0
    }

    if (msg.ymid !== undefined) {
      resolved.ymid = msg.ymid;
    }
    else {
      resolved.ymid = 0.0
    }

    return resolved;
    }
};

module.exports = BoundingBox;
