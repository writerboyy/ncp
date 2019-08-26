/*
Navicat MySQL Data Transfer

Source Server         : Test
Source Server Version : 50562
Source Host           : localhost:3310
Source Database       : ncp

Target Server Type    : MYSQL
Target Server Version : 50562
File Encoding         : 65001

Date: 2019-07-08 08:58:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `com_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `com_text` varchar(180) COLLATE utf8_bin DEFAULT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `praise` int(1) DEFAULT '5',
  PRIMARY KEY (`com_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES ('1', '1', '1', '第一条评论', '2019-07-08 08:53:40', '5');
INSERT INTO `t_comment` VALUES ('2', '1', '1', '第二条评论', '2019-07-08 08:54:10', '5');
INSERT INTO `t_comment` VALUES ('3', '1', '2', '用户二', '2019-07-08 08:54:20', '5');
INSERT INTO `t_comment` VALUES ('4', '1', '2', '用户二二', '2019-07-08 08:54:27', '5');
INSERT INTO `t_comment` VALUES ('5', '1', '3', '用户三', '2019-07-08 08:54:33', '5');
INSERT INTO `t_comment` VALUES ('6', '1', '4', '用户四', '2019-07-08 08:54:41', '5');
INSERT INTO `t_comment` VALUES ('7', '1', '4', '用户四四', '2019-07-08 08:54:51', '5');
