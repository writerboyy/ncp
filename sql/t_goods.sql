/*
Navicat MySQL Data Transfer

Source Server         : Test
Source Server Version : 50562
Source Host           : localhost:3310
Source Database       : ncp

Target Server Type    : MYSQL
Target Server Version : 50562
File Encoding         : 65001

Date: 2019-07-04 09:06:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `price` double(5,2) NOT NULL,
  `text` text COLLATE utf8_bin,
  `pic` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `stock` int(11) DEFAULT '0',
  `sales_number` int(11) DEFAULT '0',
  `type_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_goods
-- ----------------------------
INSERT INTO `t_goods` VALUES ('1', '玫瑰香葡萄', '16.80', 0xE78EABE791B0E9A699E891A1E89084, 'goods002.jpg', '799', '45646', '2');
INSERT INTO `t_goods` VALUES ('2', '香蕉', '6.80', 0xE68891E5B0B1E698AFE88BB9E69E9C, 'goods009.jpg', '4564', '123', '2');
INSERT INTO `t_goods` VALUES ('3', '大兴大鹏草莓', '16.80', 0xE5A4A7E585B4E5A4A7E9B98FE88D89E88E93, 'goods003.jpg', '45613', '1023', '2');
INSERT INTO `t_goods` VALUES ('4', '吐鲁番梨光杏', '5.50', 0xE59090E9B281E795AAE6A2A8E58589E69D8F, 'goods004.jpg', '99', '123', '2');
INSERT INTO `t_goods` VALUES ('5', '黄肉桃', '10.00', 0xE9BB84E88289E6A183, 'goods005.jpg', '989', '456464', '2');
INSERT INTO `t_goods` VALUES ('6', '进口西梅', '28.80', 0xE8BF9BE58FA3E8A5BFE6A285, 'goods006.jpg', '99456', '30123', '2');
INSERT INTO `t_goods` VALUES ('7', '香梨', '6.45', 0xE9A699E6A2A8, 'goods007.jpg', '8979', '10', '2');
INSERT INTO `t_goods` VALUES ('8', '栗子', '3.30', 0xE6A097E5AD90, 'goods008.jpg', '969', '40123', '2');
INSERT INTO `t_goods` VALUES ('9', '海南香蕉', '3.30', 0xE6B5B7E58D97E9A699E89589, 'goods009.jpg', '7897', '50', '2');
INSERT INTO `t_goods` VALUES ('10', '青苹果', '5.80', 0xE99D92E88BB9E69E9C, 'goods010.jpg', '456456', '10123', '2');
INSERT INTO `t_goods` VALUES ('11', '山莓', '28.80', 0xE5B1B1E88E93, 'goods011.jpg', '99989', '123', '2');
INSERT INTO `t_goods` VALUES ('12', '奇异果', '25.80', 0xE5A587E5BC82E69E9C, 'goods012.jpg', '456', '40123', '2');
INSERT INTO `t_goods` VALUES ('13', '蜜桔', '4.80', 0xE89C9CE6A194, 'goods013.jpg', '199', '80123', '2');
INSERT INTO `t_goods` VALUES ('14', '脐橙', '3.50', 0xE88490E6A999, 'goods014.jpg', '9594', '60123', '2');
INSERT INTO `t_goods` VALUES ('15', '进口柠檬', '3.80', 0xE8BF9BE58FA3E69FA0E6AAAC, 'goods015.jpg', '969', '55123', '2');
INSERT INTO `t_goods` VALUES ('17', '紫鳞鱼', '45.80', 0xE7B4ABE9B39EE9B1BC, 'goods031.jpg', '3587897', '271231', '3');
INSERT INTO `t_goods` VALUES ('18', '草鱼', '25.80', 0xE88D89E9B1BC, 'goods032.jpg', '31123', '271', '3');
INSERT INTO `t_goods` VALUES ('19', '龙虾', '45.00', 0xE9BE99E899BE, 'goods033.jpg', '123456', '123123', '3');
INSERT INTO `t_goods` VALUES ('20', '海参', '85.00', 0xE6B5B7E58F82, 'goods034.jpg', '46444', '27', '3');
INSERT INTO `t_goods` VALUES ('21', '帝王蟹', '105.00', 0xE5B89DE78E8BE89FB9, 'goods035.jpg', '4564', '27123', '3');
INSERT INTO `t_goods` VALUES ('22', '虾米', '15.00', 0xE899BEE7B1B3, 'goods036.jpg', '3584564', '2723', '3');
INSERT INTO `t_goods` VALUES ('23', '扇贝', '15.00', 0xE68987E8B49D, 'goods037.jpg', '358', '312', '3');
INSERT INTO `t_goods` VALUES ('24', '甲鱼', '125.00', 0xE794B2E9B1BC, 'goods038.jpg', '45645', '271231', '3');
INSERT INTO `t_goods` VALUES ('25', '螃蟹', '65.66', 0xE89E83E89FB9, 'goods039.jpg', '3321', '27123', '3');
INSERT INTO `t_goods` VALUES ('26', '口味虾', '35.33', 0xE58FA3E591B3E899BE, 'goods040.jpg', '11111', '3', '3');
INSERT INTO `t_goods` VALUES ('27', '猪肉', '25.33', 0xE78CAAE88289, 'goods990.jpg', '123488', '27123', '4');
INSERT INTO `t_goods` VALUES ('28', '优质猪肉', '35.33', 0xE4BC98E8B4A8E78CAAE88289, 'goods991.jpg', '666', '27123123', '4');
INSERT INTO `t_goods` VALUES ('29', '羊肉', '35.33', 0xE7BE8AE88289, 'goods992.jpg', '3480', '30', '4');
INSERT INTO `t_goods` VALUES ('30', '牛肉', '45.33', 0xE7899BE88289, 'goods993.jpg', '89', '3023', '4');
INSERT INTO `t_goods` VALUES ('31', '优质牛肉', '55.33', 0xE4BC98E8B4A8E7899BE88289, 'goods994.jpg', '3480', '30', '4');
INSERT INTO `t_goods` VALUES ('32', '优质羊肉', '55.33', 0xE4BC98E8B4A8E7BE8AE88289, 'goods995.jpg', '789', '30', '4');
INSERT INTO `t_goods` VALUES ('33', '羊肉卷', '55.33', 0xE7BE8AE88289E58DB7, 'goods996.jpg', '3480', '23123', '4');
INSERT INTO `t_goods` VALUES ('34', '莆田猪肉', '25.33', 0xE88E86E794B0E78CAAE88289, 'goods997.jpg', '3480', '30132', '4');
INSERT INTO `t_goods` VALUES ('35', '猪排', '20.33', 0xE78CAAE68E92, 'goods998.jpg', '3480', '23899', '4');
INSERT INTO `t_goods` VALUES ('36', '牛肝', '20.33', 0xE7899BE8829D, 'goods999.jpg', '3480', '978', '4');
INSERT INTO `t_goods` VALUES ('37', '鸡仔', '8.33', 0xE9B8A1E4BB94, '81.jpg', '480', '301237978', '5');
INSERT INTO `t_goods` VALUES ('38', '猪仔', '58.33', 0xE78CAAE4BB94, '82.jpg', '480', '30123123', '5');
INSERT INTO `t_goods` VALUES ('39', '龙虾', '58.33', 0xE9BE99E899BE, '83.jpg', '4180', '56441231', '5');
INSERT INTO `t_goods` VALUES ('40', '牛', '58.33', 0xE7899B, '84.jpg', '180', '30', '5');
INSERT INTO `t_goods` VALUES ('41', '鸭', '48.33', 0xE9B8AD, '85.jpg', '180', '301231', '5');
INSERT INTO `t_goods` VALUES ('42', '羊驼', '158.33', 0xE7BE8AE9A9BC, '86.jpg', '80', '7897', '5');
INSERT INTO `t_goods` VALUES ('43', '深海鱼', '58.33', 0xE6B7B1E6B5B7E9B1BC, '87.jpg', '46', '31231', '5');
INSERT INTO `t_goods` VALUES ('44', '兔子', '38.33', 0xE58594E5AD90, '88.jpg', '789', '45645', '5');
INSERT INTO `t_goods` VALUES ('45', '驴', '48.33', 0xE9A9B4, '89.jpg', '999', '30456456', '5');
INSERT INTO `t_goods` VALUES ('46', '白菜', '8.33', 0xE799BDE88F9C, 'goods90.jpg', '453', '30', '6');
INSERT INTO `t_goods` VALUES ('47', '黄瓜', '2.33', 0xE9BB84E7939C, 'goods91.jpg', '856464', '789423', '6');
INSERT INTO `t_goods` VALUES ('48', '大蒜', '8.33', 0xE5A4A7E8929C, 'goods92.jpg', '84564', '4561', '6');
INSERT INTO `t_goods` VALUES ('49', '土豆', '8.33', 0xE59C9FE8B186, 'goods93.jpg', '789', '79463', '6');
INSERT INTO `t_goods` VALUES ('50', '香菇', '6.33', 0xE9A699E88F87, 'goods94.jpg', '897', '6431', '6');
INSERT INTO `t_goods` VALUES ('51', '茴香', '4.33', 0xE88CB4E9A699, 'goods95.jpg', '81231', '30', '6');
INSERT INTO `t_goods` VALUES ('52', '辣椒', '6.33', 0xE8BEA3E6A492, 'goods96.jpg', '97864', '304564', '6');
INSERT INTO `t_goods` VALUES ('53', '苦瓜', '8.33', 0xE88BA6E7939C, 'goods97.jpg', '6343', '456', '6');
INSERT INTO `t_goods` VALUES ('54', '葱头', '8.33', 0xE891B1E5A4B4, 'goods98.jpg', '967897', '3046', '6');
INSERT INTO `t_goods` VALUES ('55', '大白菜', '2.33', 0xE5A4A7E799BDE88F9C, 'goods99.jpg', '3123456', '64', '6');
INSERT INTO `t_goods` VALUES ('56', '速冻包子', '22.33', 0xE9809FE586BBE58C85E5AD90, 'goods101.jpg', '78978', '45', '7');
INSERT INTO `t_goods` VALUES ('57', '奶黄包', '12.33', 0xE5A5B6E9BB84E58C85, 'goods102.jpg', '564', '644', '7');
INSERT INTO `t_goods` VALUES ('58', '馄饨', '12.00', 0xE9A684E9A5A8, 'goods103.jpg', '79734', '30', '7');
INSERT INTO `t_goods` VALUES ('59', '灌汤水饺', '16.00', 0xE7818CE6B1A4E6B0B4E9A5BA, 'goods104.jpg', '6431', '664', '7');
INSERT INTO `t_goods` VALUES ('60', '粽香排骨', '56.00', 0xE7B2BDE9A699E68E92E9AAA8, 'goods105.jpg', '789741', '645', '7');
INSERT INTO `t_goods` VALUES ('61', '鱿鱼串', '46.60', 0xE9B1BFE9B1BCE4B8B2, 'goods106.jpg', '6654', '56', '7');
INSERT INTO `t_goods` VALUES ('62', '麻辣', '16.60', 0xE9BABBE8BEA3, 'goods107.jpg', '123546', '6', '7');
INSERT INTO `t_goods` VALUES ('63', '速冻面食', '19.90', 0xE9809FE586BBE99DA2E9A39F, 'goods108.jpg', '140434', '654564', '7');
INSERT INTO `t_goods` VALUES ('64', '速冻肉包', '9.90', 0xE9809FE586BBE88289E58C85, 'goods109.jpg', '87901', '65', '7');
INSERT INTO `t_goods` VALUES ('65', '速冻麻辣', '9.90', 0xE9809FE586BBE9BABBE8BEA3, 'goods110.jpg', '8974', '3056', '7');
