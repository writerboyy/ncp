/*
Navicat MySQL Data Transfer

Source Server         : Test
Source Server Version : 50562
Source Host           : localhost:3310
Source Database       : ncp

Target Server Type    : MYSQL
Target Server Version : 50562
File Encoding         : 65001

Date: 2019-07-04 08:46:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_type
-- ----------------------------
DROP TABLE IF EXISTS `t_type`;
CREATE TABLE `t_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_type
-- ----------------------------
INSERT INTO `t_type` VALUES ('1', '其他');
INSERT INTO `t_type` VALUES ('2', '新鲜水果');
INSERT INTO `t_type` VALUES ('3', '海鲜水产');
INSERT INTO `t_type` VALUES ('4', '猪牛羊肉');
INSERT INTO `t_type` VALUES ('5', '禽类蛋品');
INSERT INTO `t_type` VALUES ('6', '新鲜蔬菜');
INSERT INTO `t_type` VALUES ('7', '速冻食品');

