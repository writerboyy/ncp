/*
Navicat MySQL Data Transfer

Source Server         : newtest
Source Server Version : 50635
Source Host           : localhost:3306
Source Database       : ncp

Target Server Type    : MYSQL
Target Server Version : 50635
File Encoding         : 65001

Date: 2019-07-08 21:02:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_order_detail`;
CREATE TABLE `t_order_detail` (
  `order_id` varchar(18) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `order_number` int(11) NOT NULL,
  `price` double(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_order_detail
-- ----------------------------
INSERT INTO `t_order_detail` VALUES ('201907060328111256', '7', '47', '1', '2.33');
INSERT INTO `t_order_detail` VALUES ('201907060329239571', '7', '47', '1', '2.33');
INSERT INTO `t_order_detail` VALUES ('201907060328111256', '7', '35', '1', '3.50');
INSERT INTO `t_order_detail` VALUES ('201907080820427524', '7', '25', '1', '65.66');
INSERT INTO `t_order_detail` VALUES ('201907080826445118', '7', '23', '1', '15.00');
INSERT INTO `t_order_detail` VALUES ('201907080834274272', '7', '22', '1', '15.00');
INSERT INTO `t_order_detail` VALUES ('201907080834274272', '7', '23', '1', '15.00');
INSERT INTO `t_order_detail` VALUES ('201907080834274272', '7', '24', '1', '125.00');
INSERT INTO `t_order_detail` VALUES ('201907080834274272', '7', '25', '1', '65.66');
INSERT INTO `t_order_detail` VALUES ('201907080901182041', '7', '27', '1', '25.33');
INSERT INTO `t_order_detail` VALUES ('201907080901405544', '7', '38', '1', '58.33');
INSERT INTO `t_order_detail` VALUES ('201907080901566213', '7', '40', '1', '58.33');
