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

class Serial_RT {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.sendClass = null;
      this.count = null;
    }
    else {
      if (initObj.hasOwnProperty('sendClass')) {
        this.sendClass = initObj.sendClass
      }
      else {
        this.sendClass = '';
      }
      if (initObj.hasOwnProperty('count')) {
        this.count = initObj.count
      }
      else {
        this.count = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Serial_RT
    // Serialize message field [sendClass]
    bufferOffset = _serializer.string(obj.sendClass, buffer, bufferOffset);
    // Serialize message field [count]
    bufferOffset = _serializer.int32(obj.count, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Serial_RT
    let len;
    let data = new Serial_RT(null);
    // Deserialize message field [sendClass]
    data.sendClass = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [count]
    data.count = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.sendClass);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'yolo_new/Serial_RT';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c5e6d5a722f30a4aa4713722813adaed';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string sendClass
    int32 count
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Serial_RT(null);
    if (msg.sendClass !== undefined) {
      resolved.sendClass = msg.sendClass;
    }
    else {
      resolved.sendClass = ''
    }

    if (msg.count !== undefined) {
      resolved.count = msg.count;
    }
    else {
      resolved.count = 0
    }

    return resolved;
    }
};

module.exports = Serial_RT;
