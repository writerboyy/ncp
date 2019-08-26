/*
Navicat MySQL Data Transfer

Source Server         : newtest
Source Server Version : 50635
Source Host           : localhost:3306
Source Database       : ncp

Target Server Type    : MYSQL
Target Server Version : 50635
File Encoding         : 65001

Date: 2019-07-05 22:10:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_cart
-- ----------------------------
DROP TABLE IF EXISTS `t_cart`;
CREATE TABLE `t_cart` (
  `user_id` int(11) NOT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `cart_number` int(11) DEFAULT NULL,
  `price` double(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_cart
-- ----------------------------

