/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50623
Source Host           : localhost:3306
Source Database       : ncp

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2019-06-30 13:13:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(32) CHARACTER SET utf8 NOT NULL,
  `password` varchar(50) COLLATE utf8_bin NOT NULL,
  `tell` varchar(15) CHARACTER SET utf8 NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `grade` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', 'adminadmin', '18278820440', null, '9');
INSERT INTO `t_user` VALUES ('2', 'weibo', '123456', '18179038028', '湖北', '1');
INSERT INTO `t_user` VALUES ('3', 'jpy', '123456', '18179038018', '江西', '2');
INSERT INTO `t_user` VALUES ('4', 'liugang', '123456', '18397801800', '河北', '3');
INSERT INTO `t_user` VALUES ('5', 'qlt', '123456', '17379009650', '广西', '4');
INSERT INTO `t_user` VALUES ('6', 'fanyu', '123456', '18879082684', '江西', '5');
INSERT INTO `t_user` VALUES ('7', '123', '123', '18179038028', '江西', '5');
