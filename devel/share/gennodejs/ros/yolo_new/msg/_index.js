
"use strict";

let arm_target = require('./arm_target.js');
let arm_init_position = require('./arm_init_position.js');
let position_color = require('./position_color.js');
let BoundingBoxes = require('./BoundingBoxes.js');
let BoundingBox = require('./BoundingBox.js');
let arm_target_position = require('./arm_target_position.js');
let color_ik_result_new = require('./color_ik_result_new.js');

module.exports = {
  arm_target: arm_target,
  arm_init_position: arm_init_position,
  position_color: position_color,
  BoundingBoxes: BoundingBoxes,
  BoundingBox: BoundingBox,
  arm_target_position: arm_target_position,
  color_ik_result_new: color_ik_result_new,
};
