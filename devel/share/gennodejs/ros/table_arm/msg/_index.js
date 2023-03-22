
"use strict";

let arm_target = require('./arm_target.js');
let arm_init_position = require('./arm_init_position.js');
let position_color = require('./position_color.js');
let arm_target_position = require('./arm_target_position.js');
let color_ik_result = require('./color_ik_result.js');

module.exports = {
  arm_target: arm_target,
  arm_init_position: arm_init_position,
  position_color: position_color,
  arm_target_position: arm_target_position,
  color_ik_result: color_ik_result,
};
