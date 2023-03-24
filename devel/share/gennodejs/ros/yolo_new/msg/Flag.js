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

class Flag {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.isMoving = null;
    }
    else {
      if (initObj.hasOwnProperty('isMoving')) {
        this.isMoving = initObj.isMoving
      }
      else {
        this.isMoving = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Flag
    // Serialize message field [isMoving]
    bufferOffset = _serializer.int32(obj.isMoving, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Flag
    let len;
    let data = new Flag(null);
    // Deserialize message field [isMoving]
    data.isMoving = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'yolo_new/Flag';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '50d413790f6da206e162d072e2ef3ab7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 isMoving
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Flag(null);
    if (msg.isMoving !== undefined) {
      resolved.isMoving = msg.isMoving;
    }
    else {
      resolved.isMoving = 0
    }

    return resolved;
    }
};

module.exports = Flag;
