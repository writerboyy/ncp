/*
Navicat MySQL Data Transfer

Source Server         : newtest
Source Server Version : 50635
Source Host           : localhost:3306
Source Database       : ncp

Target Server Type    : MYSQL
Target Server Version : 50635
File Encoding         : 65001

Date: 2019-07-08 21:02:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `order_id` varchar(18) CHARACTER SET utf8 NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_total` double(11,2) NOT NULL,
  `order_date` date NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `pay_date` date DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('201907060328111256', '7', '12.33', '2019-07-06', '2', null);
INSERT INTO `t_order` VALUES ('201907060329239571', '7', '12.33', '2019-07-06', '1', null);
INSERT INTO `t_order` VALUES ('201907080820427524', '7', '75.66', '2019-07-08', '0', null);
INSERT INTO `t_order` VALUES ('201907080826445118', '7', '25.00', '2019-07-08', '1', null);
INSERT INTO `t_order` VALUES ('201907080834274272', '7', '230.66', '2019-07-08', '0', null);
INSERT INTO `t_order` VALUES ('201907080901182041', '7', '35.33', '2019-07-08', '0', null);
INSERT INTO `t_order` VALUES ('201907080901405544', '7', '68.33', '2019-07-08', '0', null);
INSERT INTO `t_order` VALUES ('201907080901566213', '7', '68.33', '2019-07-08', '0', null);
