// Auto-generated. Do not edit!

// (in-package yolo_new.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class arm_init_position {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.init_joint1 = null;
      this.init_joint2 = null;
      this.init_joint3 = null;
      this.init_joint4 = null;
      this.init_joint5 = null;
      this.init_joint6 = null;
      this.save_init_pose = null;
      this.arm_look = null;
      this.arm_home = null;
    }
    else {
      if (initObj.hasOwnProperty('init_joint1')) {
        this.init_joint1 = initObj.init_joint1
      }
      else {
        this.init_joint1 = 0;
      }
      if (initObj.hasOwnProperty('init_joint2')) {
        this.init_joint2 = initObj.init_joint2
      }
      else {
        this.init_joint2 = 0;
      }
      if (initObj.hasOwnProperty('init_joint3')) {
        this.init_joint3 = initObj.init_joint3
      }
      else {
        this.init_joint3 = 0;
      }
      if (initObj.hasOwnProperty('init_joint4')) {
        this.init_joint4 = initObj.init_joint4
      }
      else {
        this.init_joint4 = 0;
      }
      if (initObj.hasOwnProperty('init_joint5')) {
        this.init_joint5 = initObj.init_joint5
      }
      else {
        this.init_joint5 = 0;
      }
      if (initObj.hasOwnProperty('init_joint6')) {
        this.init_joint6 = initObj.init_joint6
      }
      else {
        this.init_joint6 = 0;
      }
      if (initObj.hasOwnProperty('save_init_pose')) {
        this.save_init_pose = initObj.save_init_pose
      }
      else {
        this.save_init_pose = 0;
      }
      if (initObj.hasOwnProperty('arm_look')) {
        this.arm_look = initObj.arm_look
      }
      else {
        this.arm_look = 0;
      }
      if (initObj.hasOwnProperty('arm_home')) {
        this.arm_home = initObj.arm_home
      }
      else {
        this.arm_home = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type arm_init_position
    // Serialize message field [init_joint1]
    bufferOffset = _serializer.int8(obj.init_joint1, buffer, bufferOffset);
    // Serialize message field [init_joint2]
    bufferOffset = _serializer.int8(obj.init_joint2, buffer, bufferOffset);
    // Serialize message field [init_joint3]
    bufferOffset = _serializer.int8(obj.init_joint3, buffer, bufferOffset);
    // Serialize message field [init_joint4]
    bufferOffset = _serializer.int8(obj.init_joint4, buffer, bufferOffset);
    // Serialize message field [init_joint5]
    bufferOffset = _serializer.int8(obj.init_joint5, buffer, bufferOffset);
    // Serialize message field [init_joint6]
    bufferOffset = _serializer.int8(obj.init_joint6, buffer, bufferOffset);
    // Serialize message field [save_init_pose]
    bufferOffset = _serializer.int8(obj.save_init_pose, buffer, bufferOffset);
    // Serialize message field [arm_look]
    bufferOffset = _serializer.int8(obj.arm_look, buffer, bufferOffset);
    // Serialize message field [arm_home]
    bufferOffset = _serializer.int8(obj.arm_home, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type arm_init_position
    let len;
    let data = new arm_init_position(null);
    // Deserialize message field [init_joint1]
    data.init_joint1 = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [init_joint2]
    data.init_joint2 = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [init_joint3]
    data.init_joint3 = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [init_joint4]
    data.init_joint4 = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [init_joint5]
    data.init_joint5 = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [init_joint6]
    data.init_joint6 = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [save_init_pose]
    data.save_init_pose = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [arm_look]
    data.arm_look = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [arm_home]
    data.arm_home = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 9;
  }

  static datatype() {
    // Returns string type for a message object
    return 'yolo_new/arm_init_position';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '214a3a640e2cbc2daa6f74f00b9c277b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int8 init_joint1
    int8 init_joint2
    int8 init_joint3
    int8 init_joint4
    int8 init_joint5
    int8 init_joint6
    int8 save_init_pose
    int8 arm_look
    int8 arm_home
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new arm_init_position(null);
    if (msg.init_joint1 !== undefined) {
      resolved.init_joint1 = msg.init_joint1;
    }
    else {
      resolved.init_joint1 = 0
    }

    if (msg.init_joint2 !== undefined) {
      resolved.init_joint2 = msg.init_joint2;
    }
    else {
      resolved.init_joint2 = 0
    }

    if (msg.init_joint3 !== undefined) {
      resolved.init_joint3 = msg.init_joint3;
    }
    else {
      resolved.init_joint3 = 0
    }

    if (msg.init_joint4 !== undefined) {
      resolved.init_joint4 = msg.init_joint4;
    }
    else {
      resolved.init_joint4 = 0
    }

    if (msg.init_joint5 !== undefined) {
      resolved.init_joint5 = msg.init_joint5;
    }
    else {
      resolved.init_joint5 = 0
    }

    if (msg.init_joint6 !== undefined) {
      resolved.init_joint6 = msg.init_joint6;
    }
    else {
      resolved.init_joint6 = 0
    }

    if (msg.save_init_pose !== undefined) {
      resolved.save_init_pose = msg.save_init_pose;
    }
    else {
      resolved.save_init_pose = 0
    }

    if (msg.arm_look !== undefined) {
      resolved.arm_look = msg.arm_look;
    }
    else {
      resolved.arm_look = 0
    }

    if (msg.arm_home !== undefined) {
      resolved.arm_home = msg.arm_home;
    }
    else {
      resolved.arm_home = 0
    }

    return resolved;
    }
};

module.exports = arm_init_position;
