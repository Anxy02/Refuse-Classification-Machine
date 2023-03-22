// Auto-generated. Do not edit!

// (in-package wheeltec_tracker_pkg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class centroid {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x = null;
      this.y = null;
      this.leftupper_x = null;
      this.leftupper_y = null;
      this.rightlower_w = null;
      this.rightlower_h = null;
    }
    else {
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = 0;
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = 0;
      }
      if (initObj.hasOwnProperty('leftupper_x')) {
        this.leftupper_x = initObj.leftupper_x
      }
      else {
        this.leftupper_x = 0;
      }
      if (initObj.hasOwnProperty('leftupper_y')) {
        this.leftupper_y = initObj.leftupper_y
      }
      else {
        this.leftupper_y = 0;
      }
      if (initObj.hasOwnProperty('rightlower_w')) {
        this.rightlower_w = initObj.rightlower_w
      }
      else {
        this.rightlower_w = 0;
      }
      if (initObj.hasOwnProperty('rightlower_h')) {
        this.rightlower_h = initObj.rightlower_h
      }
      else {
        this.rightlower_h = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type centroid
    // Serialize message field [x]
    bufferOffset = _serializer.int32(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.int32(obj.y, buffer, bufferOffset);
    // Serialize message field [leftupper_x]
    bufferOffset = _serializer.int32(obj.leftupper_x, buffer, bufferOffset);
    // Serialize message field [leftupper_y]
    bufferOffset = _serializer.int32(obj.leftupper_y, buffer, bufferOffset);
    // Serialize message field [rightlower_w]
    bufferOffset = _serializer.int32(obj.rightlower_w, buffer, bufferOffset);
    // Serialize message field [rightlower_h]
    bufferOffset = _serializer.int32(obj.rightlower_h, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type centroid
    let len;
    let data = new centroid(null);
    // Deserialize message field [x]
    data.x = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [leftupper_x]
    data.leftupper_x = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [leftupper_y]
    data.leftupper_y = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [rightlower_w]
    data.rightlower_w = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [rightlower_h]
    data.rightlower_h = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'wheeltec_tracker_pkg/centroid';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e0648a54cb14a169de06ff0677b4c869';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 x
    int32 y
    int32 leftupper_x
    int32 leftupper_y
    int32 rightlower_w
    int32 rightlower_h
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new centroid(null);
    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = 0
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = 0
    }

    if (msg.leftupper_x !== undefined) {
      resolved.leftupper_x = msg.leftupper_x;
    }
    else {
      resolved.leftupper_x = 0
    }

    if (msg.leftupper_y !== undefined) {
      resolved.leftupper_y = msg.leftupper_y;
    }
    else {
      resolved.leftupper_y = 0
    }

    if (msg.rightlower_w !== undefined) {
      resolved.rightlower_w = msg.rightlower_w;
    }
    else {
      resolved.rightlower_w = 0
    }

    if (msg.rightlower_h !== undefined) {
      resolved.rightlower_h = msg.rightlower_h;
    }
    else {
      resolved.rightlower_h = 0
    }

    return resolved;
    }
};

module.exports = centroid;
