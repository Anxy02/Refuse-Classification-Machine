// Auto-generated. Do not edit!

// (in-package xf_mic_asr_offline.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class Get_Major_Mic_srvRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.get_major_id = null;
    }
    else {
      if (initObj.hasOwnProperty('get_major_id')) {
        this.get_major_id = initObj.get_major_id
      }
      else {
        this.get_major_id = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Get_Major_Mic_srvRequest
    // Serialize message field [get_major_id]
    bufferOffset = _serializer.int8(obj.get_major_id, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Get_Major_Mic_srvRequest
    let len;
    let data = new Get_Major_Mic_srvRequest(null);
    // Deserialize message field [get_major_id]
    data.get_major_id = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'xf_mic_asr_offline/Get_Major_Mic_srvRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f12cd5c57cf61954d972251c1db5f55e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int8 get_major_id #1,0
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Get_Major_Mic_srvRequest(null);
    if (msg.get_major_id !== undefined) {
      resolved.get_major_id = msg.get_major_id;
    }
    else {
      resolved.get_major_id = 0
    }

    return resolved;
    }
};

class Get_Major_Mic_srvResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.result = null;
      this.mic_id = null;
      this.fail_reason = null;
    }
    else {
      if (initObj.hasOwnProperty('result')) {
        this.result = initObj.result
      }
      else {
        this.result = '';
      }
      if (initObj.hasOwnProperty('mic_id')) {
        this.mic_id = initObj.mic_id
      }
      else {
        this.mic_id = 0;
      }
      if (initObj.hasOwnProperty('fail_reason')) {
        this.fail_reason = initObj.fail_reason
      }
      else {
        this.fail_reason = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Get_Major_Mic_srvResponse
    // Serialize message field [result]
    bufferOffset = _serializer.string(obj.result, buffer, bufferOffset);
    // Serialize message field [mic_id]
    bufferOffset = _serializer.int8(obj.mic_id, buffer, bufferOffset);
    // Serialize message field [fail_reason]
    bufferOffset = _serializer.string(obj.fail_reason, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Get_Major_Mic_srvResponse
    let len;
    let data = new Get_Major_Mic_srvResponse(null);
    // Deserialize message field [result]
    data.result = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [mic_id]
    data.mic_id = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [fail_reason]
    data.fail_reason = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.result);
    length += _getByteLength(object.fail_reason);
    return length + 9;
  }

  static datatype() {
    // Returns string type for a service object
    return 'xf_mic_asr_offline/Get_Major_Mic_srvResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1519895bc6f7d2f7d61e3bfbad56e414';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string result
    int8 mic_id
    string fail_reason 
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Get_Major_Mic_srvResponse(null);
    if (msg.result !== undefined) {
      resolved.result = msg.result;
    }
    else {
      resolved.result = ''
    }

    if (msg.mic_id !== undefined) {
      resolved.mic_id = msg.mic_id;
    }
    else {
      resolved.mic_id = 0
    }

    if (msg.fail_reason !== undefined) {
      resolved.fail_reason = msg.fail_reason;
    }
    else {
      resolved.fail_reason = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: Get_Major_Mic_srvRequest,
  Response: Get_Major_Mic_srvResponse,
  md5sum() { return '3ca06ade224515e6482987c79f7f3cf3'; },
  datatype() { return 'xf_mic_asr_offline/Get_Major_Mic_srv'; }
};
