// Auto-generated. Do not edit!

// (in-package table_arm.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class color_ik_result {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pedestal_angle = null;
      this.arm_angle = null;
      this.hand_angle = null;
      this.color = null;
    }
    else {
      if (initObj.hasOwnProperty('pedestal_angle')) {
        this.pedestal_angle = initObj.pedestal_angle
      }
      else {
        this.pedestal_angle = 0.0;
      }
      if (initObj.hasOwnProperty('arm_angle')) {
        this.arm_angle = initObj.arm_angle
      }
      else {
        this.arm_angle = 0.0;
      }
      if (initObj.hasOwnProperty('hand_angle')) {
        this.hand_angle = initObj.hand_angle
      }
      else {
        this.hand_angle = 0.0;
      }
      if (initObj.hasOwnProperty('color')) {
        this.color = initObj.color
      }
      else {
        this.color = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type color_ik_result
    // Serialize message field [pedestal_angle]
    bufferOffset = _serializer.float32(obj.pedestal_angle, buffer, bufferOffset);
    // Serialize message field [arm_angle]
    bufferOffset = _serializer.float32(obj.arm_angle, buffer, bufferOffset);
    // Serialize message field [hand_angle]
    bufferOffset = _serializer.float32(obj.hand_angle, buffer, bufferOffset);
    // Serialize message field [color]
    bufferOffset = _serializer.string(obj.color, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type color_ik_result
    let len;
    let data = new color_ik_result(null);
    // Deserialize message field [pedestal_angle]
    data.pedestal_angle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [arm_angle]
    data.arm_angle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [hand_angle]
    data.hand_angle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [color]
    data.color = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.color);
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'table_arm/color_ik_result';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '26d2c0ae8f268cfc5f83e3b64098d2c7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 pedestal_angle
    float32 arm_angle
    float32 hand_angle
    string  color
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new color_ik_result(null);
    if (msg.pedestal_angle !== undefined) {
      resolved.pedestal_angle = msg.pedestal_angle;
    }
    else {
      resolved.pedestal_angle = 0.0
    }

    if (msg.arm_angle !== undefined) {
      resolved.arm_angle = msg.arm_angle;
    }
    else {
      resolved.arm_angle = 0.0
    }

    if (msg.hand_angle !== undefined) {
      resolved.hand_angle = msg.hand_angle;
    }
    else {
      resolved.hand_angle = 0.0
    }

    if (msg.color !== undefined) {
      resolved.color = msg.color;
    }
    else {
      resolved.color = ''
    }

    return resolved;
    }
};

module.exports = color_ik_result;
