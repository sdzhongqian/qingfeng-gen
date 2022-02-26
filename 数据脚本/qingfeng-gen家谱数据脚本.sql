/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50723
Source Host           : localhost:3306
Source Database       : waxt

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2021-01-27 23:07:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for gen_family
-- ----------------------------
DROP TABLE IF EXISTS `gen_family`;
CREATE TABLE `gen_family` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `biography` varchar(50) DEFAULT NULL,
  `training` varchar(50) DEFAULT NULL,
  `senior` varchar(50) DEFAULT NULL,
  `his_intro` text,
  `source` text,
  `content` text,
  `address` varchar(1200) DEFAULT NULL,
  `order_by` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `maintainer` varchar(120) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `create_user` varchar(50) DEFAULT NULL,
  `create_time` varchar(50) DEFAULT NULL,
  `update_time` varchar(50) DEFAULT NULL,
  `create_organize` varchar(50) DEFAULT NULL,
  `create_org_cascade` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gen_family
-- ----------------------------
INSERT INTO `gen_family` VALUES ('1', '安氏族谱', '安', ' ', ' ', '景秀恩现广，兴甲兆子常，忠传浩英才，宏志振国强。', '       据家谱记载，始祖  自明朝洪武年间， 从山西省洪洞县大槐树老鸹窝迁至山东省xx市xxx县\n      安氏家族历经数世，枝繁叶茂，分枝散叶。现分布于周边两省（山东，河北）三县一十八村。\n       由于历史原因家谱失传，于1992年春，安xx，安xx两位老人（当时都已年过70），品靠老辈传下来的（景秀恩现广，兴甲兆子长）十字传家字辈，脚踏自行车，访遍附近方圆百里，由于当时能力有限，只找到了十八村的同宗族人，然后定于清明节在xxx重修家谱。\n       1992年清明节，十八村安氏宗亲代表在山东省xxxxx聚集，大家为了一个共同的话题《续家谱》，当时的xxxx安氏家人为了庆祝这一历史性时刻，共同集资唱大戏三天。\n       在大伙共同努力下又重续家谱（忠传浩英才，宏志振国强）十字辈。又订了每年的清明节是十八村安氏宗亲代表的清明会，每个村轮流值会。', ' ', '一九九二年安氏家族续家谱，提议人：xxxx。', '山东省xx市xxx县', '1', 'Y', ' ', '', '2', '2019-01-01 17:44:32', '2021-01-27 21:53:02', '25', 'org25_');

-- ----------------------------
-- Table structure for gen_generation
-- ----------------------------
DROP TABLE IF EXISTS `gen_generation`;
CREATE TABLE `gen_generation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `family_id` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `gorder` varchar(50) DEFAULT NULL,
  `seniority` varchar(50) DEFAULT NULL,
  `order_by` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `create_user` varchar(50) DEFAULT NULL,
  `create_time` varchar(50) DEFAULT NULL,
  `update_time` varchar(50) DEFAULT NULL,
  `create_organize` varchar(50) DEFAULT NULL,
  `create_org_cascade` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gen_generation
-- ----------------------------
INSERT INTO `gen_generation` VALUES ('1', '1', '第十七世', '17', '', '17', 'Y', '', '2', '2019-01-01 18:44:03', '2019-12-08 23:18:32', '25', 'org25_');
INSERT INTO `gen_generation` VALUES ('2', '1', '第十八世', '18', '', '18', 'Y', '', '2', '2019-01-01 18:44:26', '2019-12-08 23:18:39', '25', 'org25_');
INSERT INTO `gen_generation` VALUES ('3', '1', '第十九世', '19', '', '19', 'Y', '', '2', '2019-01-01 18:44:42', '2019-12-08 23:18:46', '25', 'org25_');
INSERT INTO `gen_generation` VALUES ('4', '1', '第二十世', '20', '', '20', 'Y', '', '2', '2019-01-01 18:44:54', '2019-12-08 23:18:52', '25', 'org25_');
INSERT INTO `gen_generation` VALUES ('5', '1', '第二十一世', '21', '景', '21', 'Y', '', '2', '2019-01-01 18:45:02', '2019-12-08 23:19:00', '25', 'org25_');
INSERT INTO `gen_generation` VALUES ('6', '1', '第二十二世', '22', '秀', '22', 'Y', '', '2', '2019-01-01 18:45:18', '2019-12-08 23:19:10', '25', 'org25_');
INSERT INTO `gen_generation` VALUES ('7', '1', '第二十三世', '23', '恩', '23', 'Y', '', '2', '2019-01-01 18:45:35', '2019-12-08 23:19:16', '25', 'org25_');
INSERT INTO `gen_generation` VALUES ('8', '1', '第二十四世', '24', '现', '24', 'Y', '', '2', '2019-01-01 18:45:48', '2019-12-08 23:19:24', '25', 'org25_');
INSERT INTO `gen_generation` VALUES ('9', '1', '第二十五世', '25', '广', '25', 'Y', '', '2', '2019-01-01 18:46:02', '2019-12-08 23:19:30', '25', 'org25_');
INSERT INTO `gen_generation` VALUES ('10', '1', '第二十六世', '26', '兴', '26', 'Y', '', '2', '2019-01-01 18:46:17', '2019-12-08 23:19:39', '25', 'org25_');
INSERT INTO `gen_generation` VALUES ('11', '1', '第二十七世', '27', '甲', '27', 'Y', '', '2', '2019-01-01 18:46:32', '2019-12-08 23:20:02', '25', 'org25_');
INSERT INTO `gen_generation` VALUES ('12', '1', '第二十八世', '28', '兆', '28', 'Y', '', '2', '2019-01-01 18:46:44', '2019-12-08 23:20:09', '25', 'org25_');
INSERT INTO `gen_generation` VALUES ('13', '1', '第二十九世', '29', '子', '29', 'Y', '', '2', '2019-01-01 18:50:29', '2019-01-01 18:50:29', '25', 'org25_');
INSERT INTO `gen_generation` VALUES ('14', '1', '第三十世', '30', '常', '30', 'Y', '', '2', '2019-01-01 18:50:47', '2019-01-01 18:50:47', '25', 'org25_');
INSERT INTO `gen_generation` VALUES ('16', '1', '第十六世', '16', '', '16', 'Y', '', '30', '2019-01-27 20:48:06', '2019-12-08 23:18:25', '25', 'org25_');

-- ----------------------------
-- Table structure for gen_member
-- ----------------------------
DROP TABLE IF EXISTS `gen_member`;
CREATE TABLE `gen_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `family_id` varchar(50) NOT NULL,
  `generation_id` varchar(50) DEFAULT NULL,
  `father_id` varchar(50) DEFAULT NULL,
  `mother_id` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `content` text,
  `tpdz` varchar(1200) DEFAULT NULL,
  `level` varchar(50) DEFAULT NULL,
  `open_wife` varchar(50) DEFAULT NULL,
  `order_by` varchar(50) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `create_user` varchar(50) DEFAULT NULL,
  `create_time` varchar(50) DEFAULT NULL,
  `update_time` varchar(50) DEFAULT NULL,
  `create_organize` varchar(50) DEFAULT NULL,
  `create_org_cascade` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=623 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gen_member
-- ----------------------------
INSERT INTO `gen_member` VALUES ('1', '1', '16', '', null, '安XX', '', null, '8', null, '1', '', '30', '2019-01-27 20:48:51', '2019-01-27 20:48:51', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('14', '1', '9', '183', null, '安XX', '', null, '8', 'on', '2', '', '2', '2019-01-02 10:44:17', '2019-01-23 17:24:25', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('15', '1', '9', '183', null, '安XX', '', null, '9', 'on', '3', '', '2', '2019-01-02 10:44:52', '2019-01-23 17:40:45', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('16', '1', '9', '183', null, '安XX', '', null, '10', 'on', '4', '', '2', '2019-01-02 10:45:23', '2019-01-23 17:23:43', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('17', '1', '10', '14', null, '安XX', '', null, '8', 'on', '5', '', '2', '2019-01-02 10:46:27', '2019-01-09 09:56:44', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('18', '1', '10', '15', null, '安XX', '', null, '8', null, '6', '', '2', '2019-01-02 10:46:48', '2019-02-18 14:22:45', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('19', '1', '10', '16', null, '安XX', '', null, '8', null, '7', '', '2', '2019-01-02 10:47:16', '2019-01-02 10:47:16', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('20', '1', '10', '16', null, '安XX', '', null, '9', null, '8', '', '2', '2019-01-02 10:47:40', '2019-01-02 10:47:40', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('23', '1', '1', '1', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-11 19:29:43', '2019-01-29 09:15:34', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('24', '1', '2', '23', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-11 19:31:04', '2019-01-11 19:31:04', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('25', '1', '3', '24', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-11 19:31:51', '2019-01-11 19:31:51', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('26', '1', '3', '24', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-11 19:32:47', '2019-01-11 19:32:47', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('27', '1', '4', '25', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-11 19:34:40', '2019-01-11 19:34:40', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('28', '1', '4', '26', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-11 19:36:01', '2019-01-11 19:36:01', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('29', '1', '5', '27', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-11 19:37:25', '2019-01-11 19:37:25', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('30', '1', '5', '27', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-11 19:38:33', '2019-01-11 19:38:33', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('31', '1', '5', '27', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-11 19:39:43', '2019-01-11 19:39:43', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('32', '1', '5', '28', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-11 19:40:37', '2019-01-11 19:40:37', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('33', '1', '5', '28', null, '安XX', '', null, '9', null, '', '', '30', '2019-01-11 19:41:12', '2019-01-11 19:41:12', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('34', '1', '6', '29', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-11 19:42:34', '2019-01-11 19:42:34', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('35', '1', '6', '29', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-11 19:44:03', '2019-01-11 19:44:03', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('36', '1', '6', '29', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-11 19:48:48', '2019-01-11 19:48:48', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('37', '1', '6', '30', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-11 20:01:21', '2019-01-11 20:01:21', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('38', '1', '6', '31', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-11 20:02:40', '2019-01-11 20:02:40', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('39', '1', '7', '34', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-11 20:03:39', '2019-01-11 20:03:39', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('40', '1', '7', '35', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-11 20:04:48', '2019-01-11 20:04:48', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('41', '1', '7', '35', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-11 20:06:22', '2019-01-11 20:06:22', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('42', '1', '7', '36', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-11 20:09:32', '2019-01-11 20:09:32', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('43', '1', '7', '37', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-11 20:10:43', '2019-01-11 20:10:43', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('44', '1', '7', '37', null, '安XX', '', null, '9', 'on', '', '迁居东北子一', '30', '2019-01-11 20:11:58', '2019-01-11 20:13:16', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('45', '1', '7', '38', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-11 20:13:53', '2019-01-11 20:13:53', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('46', '1', '7', '38', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-11 20:14:47', '2019-01-11 20:14:47', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('47', '1', '7', '38', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-11 20:15:59', '2019-01-11 20:15:59', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('48', '1', '8', '39', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-11 20:17:37', '2019-01-11 20:17:37', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('49', '1', '8', '40', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-11 20:18:57', '2019-01-11 20:18:57', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('50', '1', '8', '41', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-11 20:19:28', '2019-01-11 20:19:28', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('51', '1', '8', '41', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-11 20:22:58', '2019-01-11 20:22:58', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('52', '1', '8', '42', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-11 20:24:04', '2019-01-11 20:24:04', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('53', '1', '8', '43', null, '安XX', '', null, '8', 'on', '', '迁居东北子三，德，林，彩', '30', '2019-01-11 20:24:56', '2019-01-11 20:27:23', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('54', '1', '8', '43', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-11 20:26:30', '2019-01-11 20:26:30', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('55', '1', '8', '45', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-11 20:28:19', '2019-01-11 20:28:19', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('56', '1', '8', '45', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-11 20:29:20', '2019-02-18 14:42:06', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('57', '1', '8', '45', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-11 20:29:50', '2019-01-11 20:29:50', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('58', '1', '8', '46', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-11 20:30:46', '2019-01-11 20:30:46', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('59', '1', '8', '47', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-11 20:31:23', '2019-01-11 20:31:23', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('60', '1', '8', '47', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-11 20:32:45', '2019-01-11 20:32:45', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('61', '1', '9', '48', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-11 20:33:58', '2019-01-11 20:33:58', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('62', '1', '9', '48', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-11 20:34:58', '2019-01-19 11:00:42', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('63', '1', '9', '48', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-11 20:35:34', '2019-01-11 20:35:34', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('64', '1', '9', '48', null, '安XX', '', null, '11', 'on', '', '', '30', '2019-01-11 20:36:17', '2019-01-11 20:36:17', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('65', '1', '9', '49', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-11 20:38:07', '2019-01-11 20:38:07', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('66', '1', '9', '51', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-11 20:38:57', '2019-01-11 20:38:57', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('67', '1', '9', '52', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-11 20:40:00', '2019-01-11 20:40:00', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('68', '1', '9', '52', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-11 20:40:43', '2019-01-11 20:40:43', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('69', '1', '9', '53', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-11 20:41:39', '2019-01-11 20:41:39', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('70', '1', '9', '53', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-11 20:42:15', '2019-01-11 20:42:15', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('71', '1', '9', '53', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-11 20:43:14', '2019-01-11 20:43:14', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('72', '1', '9', '54', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-11 20:43:48', '2019-01-11 20:43:48', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('73', '1', '9', '55', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-11 20:44:35', '2019-01-11 20:44:35', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('74', '1', '9', '56', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-11 20:45:20', '2019-01-11 20:45:20', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('75', '1', '9', '56', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-11 20:45:57', '2019-01-11 20:45:57', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('76', '1', '9', '56', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-11 20:46:49', '2019-01-11 20:46:49', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('77', '1', '9', '56', null, '安XX', '', null, '11', 'on', '', '', '30', '2019-01-11 20:47:35', '2019-01-11 20:47:35', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('78', '1', '9', '58', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-11 20:48:30', '2019-01-11 20:48:30', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('79', '1', '9', '58', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-11 20:49:18', '2019-01-11 20:49:18', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('80', '1', '9', '58', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-11 20:49:55', '2019-01-11 20:49:55', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('81', '1', '9', '57', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-11 20:50:35', '2019-02-18 18:09:00', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('82', '1', '9', '58', null, '安XX', '', null, '11', 'on', '', '', '30', '2019-01-11 20:51:43', '2019-01-11 20:51:43', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('83', '1', '9', '59', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-11 20:52:12', '2019-01-11 20:52:12', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('84', '1', '9', '59', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-11 20:52:54', '2019-01-11 20:52:54', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('85', '1', '9', '60', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-11 20:53:59', '2019-01-11 20:53:59', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('86', '1', '10', '84', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-11 20:57:11', '2019-01-11 20:57:11', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('87', '1', '10', '82', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-18 19:14:42', '2019-01-18 19:14:42', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('88', '1', '10', '61', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-18 19:16:24', '2019-01-18 19:16:24', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('89', '1', '10', '61', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-18 19:17:25', '2019-01-18 19:17:25', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('90', '1', '10', '62', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-20 09:43:01', '2019-01-20 09:43:01', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('91', '1', '10', '62', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-20 09:45:30', '2019-01-20 09:45:30', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('92', '1', '10', '62', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-20 09:47:25', '2019-01-20 09:50:02', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('93', '1', '10', '62', null, '安XX', '', null, '11', 'on', '', '', '30', '2019-01-20 09:49:41', '2019-01-20 09:49:41', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('94', '1', '10', '62', null, '安XX', '', null, '12', 'on', '', '', '30', '2019-01-20 09:51:22', '2019-01-20 09:51:22', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('95', '1', '10', '63', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-20 09:53:31', '2019-01-20 09:53:31', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('96', '1', '10', '63', null, '安XX', '', null, '10', null, '', '', '30', '2019-01-20 09:54:15', '2019-01-20 09:54:15', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('97', '1', '10', '64', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-20 09:54:50', '2019-01-20 09:54:50', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('98', '1', '10', '65', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-20 09:57:04', '2019-01-20 09:57:04', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('99', '1', '10', '65', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-20 09:58:08', '2019-01-20 09:58:08', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('100', '1', '10', '65', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-20 10:00:19', '2019-01-20 10:00:19', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('101', '1', '10', '67', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-20 10:02:14', '2019-01-20 10:02:14', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('102', '1', '10', '67', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-20 10:03:52', '2019-01-20 10:03:52', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('103', '1', '10', '67', null, '安XX', '', null, '10', null, '', '', '30', '2019-01-20 10:04:39', '2019-02-18 14:39:51', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('104', '1', '10', '68', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-20 10:05:51', '2019-01-20 10:05:51', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('105', '1', '10', '72', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-20 10:09:02', '2019-02-20 15:32:35', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('106', '1', '10', '72', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-20 10:10:36', '2019-02-20 15:33:46', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('107', '1', '10', '73', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-20 10:14:29', '2019-01-20 10:14:29', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('108', '1', '10', '73', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-20 10:15:55', '2019-02-18 14:45:51', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('109', '1', '10', '74', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-20 10:17:09', '2019-01-20 10:17:09', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('110', '1', '10', '74', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-20 10:18:23', '2019-01-20 10:18:23', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('111', '1', '10', '75', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-20 10:19:42', '2019-01-20 10:19:42', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('112', '1', '10', '75', null, '安XX', '', null, '9', null, '', '', '30', '2019-01-20 10:20:40', '2019-01-20 10:20:40', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('113', '1', '10', '76', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-20 10:21:33', '2019-01-20 10:21:33', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('114', '1', '10', '77', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-20 10:22:51', '2019-01-20 10:22:51', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('115', '1', '11', '88', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-20 10:27:02', '2019-01-20 10:27:02', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('116', '1', '11', '88', null, '安XX', '', null, '9', null, '', '', '30', '2019-01-20 10:29:52', '2019-01-20 10:31:26', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('117', '1', '11', '90', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-20 10:31:08', '2019-01-20 10:31:08', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('118', '1', '11', '90', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-20 10:32:56', '2019-02-23 17:06:31', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('119', '1', '11', '91', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-20 10:34:00', '2019-01-20 10:34:00', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('120', '1', '11', '92', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-20 10:34:51', '2019-01-20 10:34:51', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('121', '1', '11', '93', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-20 10:35:29', '2019-01-20 10:35:29', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('122', '1', '11', '95', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-20 10:36:39', '2019-01-20 10:36:39', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('123', '1', '11', '99', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-20 10:38:05', '2019-01-20 10:38:05', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('124', '1', '11', '100', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-20 10:39:11', '2019-01-20 10:39:11', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('125', '1', '11', '100', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-20 10:41:21', '2019-01-20 10:41:21', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('126', '1', '11', '107', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-20 10:42:19', '2019-01-20 10:42:19', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('127', '1', '11', '107', null, '安XX', '', null, '9', null, '', '', '30', '2019-01-20 10:45:05', '2019-01-20 10:45:05', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('128', '1', '11', '108', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-20 10:47:45', '2019-01-20 10:47:45', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('129', '1', '4', '26', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-20 10:49:53', '2019-01-20 10:49:53', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('130', '1', '5', '129', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-20 10:54:00', '2019-02-17 20:02:53', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('131', '1', '5', '129', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-20 10:55:02', '2019-01-20 10:55:02', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('132', '1', '5', '129', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-20 10:56:07', '2019-01-20 10:56:07', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('133', '1', '6', '130', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-20 10:58:11', '2019-01-20 10:58:57', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('134', '1', '6', '130', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-20 10:58:11', '2019-02-17 20:02:08', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('135', '1', '6', '131', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-20 11:00:15', '2019-01-24 22:19:18', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('136', '1', '6', '131', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-20 11:01:09', '2019-01-20 11:01:09', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('137', '1', '6', '132', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-20 11:04:58', '2019-01-20 11:04:58', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('138', '1', '7', '134', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-20 11:10:56', '2019-01-20 11:10:56', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('139', '1', '7', '134', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-20 11:12:13', '2019-02-17 20:05:06', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('140', '1', '7', '134', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-20 11:14:18', '2019-02-17 20:04:04', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('141', '1', '7', '133', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-20 11:17:02', '2019-01-20 11:17:02', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('142', '1', '7', '133', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-20 11:18:19', '2019-01-20 11:18:19', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('143', '1', '7', '133', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-20 11:19:51', '2019-01-20 11:19:51', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('145', '1', '6', '131', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-20 11:29:13', '2019-01-20 11:29:13', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('146', '1', '7', '145', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-20 11:31:01', '2019-01-20 11:31:01', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('147', '1', '7', '145', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-20 11:32:46', '2019-01-20 11:32:46', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('148', '1', '7', '136', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-20 11:34:48', '2019-01-20 11:34:48', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('149', '1', '7', '136', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-20 11:36:13', '2019-01-20 11:36:13', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('151', '1', '7', '137', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-23 15:43:56', '2019-01-23 15:43:56', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('152', '1', '7', '137', null, '安XX', '', null, '11', 'on', '', '', '30', '2019-01-23 15:45:03', '2019-01-23 15:45:03', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('153', '1', '7', '137', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-23 15:52:05', '2019-01-24 17:41:33', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('154', '1', '8', '138', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-23 15:54:31', '2019-01-23 15:54:31', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('155', '1', '8', '138', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-23 15:56:01', '2019-01-25 20:14:31', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('156', '1', '8', '139', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-23 15:57:05', '2019-01-23 15:57:05', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('157', '1', '8', '139', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-23 15:58:25', '2019-01-23 15:58:25', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('158', '1', '8', '139', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-23 16:00:31', '2019-02-18 19:50:25', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('159', '1', '8', '139', null, '安XX', '', null, '11', 'on', '', '', '30', '2019-01-23 16:01:15', '2019-01-23 16:01:15', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('160', '1', '8', '139', null, '安XX', '', null, '12', 'on', '', '', '30', '2019-01-23 16:03:04', '2019-01-23 16:03:04', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('161', '1', '8', '139', null, '安XX', '', null, '13', 'on', '', '', '30', '2019-01-23 16:04:21', '2019-01-23 16:04:21', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('162', '1', '8', '140', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-23 16:05:18', '2019-02-18 19:47:12', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('163', '1', '8', '140', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-23 16:06:25', '2019-01-23 16:06:25', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('164', '1', '8', '140', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-23 16:07:18', '2019-01-23 17:06:40', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('165', '1', '8', '140', null, '安XX', '', null, '11', 'on', '', '', '30', '2019-01-23 16:08:45', '2019-01-23 16:08:45', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('166', '1', '8', '141', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-23 16:14:13', '2019-02-18 19:58:09', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('167', '1', '8', '142', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-23 16:15:20', '2019-01-24 19:54:44', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('168', '1', '8', '143', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-23 16:17:32', '2019-01-24 19:53:56', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('169', '1', '8', '146', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-23 16:18:20', '2019-01-23 16:18:20', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('170', '1', '8', '147', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-23 16:21:36', '2019-01-23 16:21:36', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('171', '1', '8', '147', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-23 16:22:38', '2019-01-23 16:22:38', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('172', '1', '8', '147', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-23 16:23:25', '2019-01-23 16:23:25', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('173', '1', '8', '147', null, '安XX', '', null, '11', 'on', '', '', '30', '2019-01-23 16:25:11', '2019-01-24 19:56:59', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('174', '1', '8', '148', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-23 16:26:01', '2019-02-18 17:46:01', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('175', '1', '8', '148', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-23 16:28:04', '2019-01-23 17:20:34', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('176', '1', '8', '149', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-23 16:42:05', '2019-01-23 16:42:05', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('177', '1', '8', '149', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-23 16:43:16', '2019-01-23 16:43:16', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('178', '1', '8', '149', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-23 16:43:55', '2019-01-23 16:43:55', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('179', '1', '8', '149', null, '安XX', '', null, '11', 'on', '', '', '30', '2019-01-23 16:45:11', '2019-01-23 16:45:11', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('180', '1', '8', '151', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-23 16:45:58', '2019-01-24 19:56:28', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('181', '1', '8', '151', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-23 16:46:41', '2019-01-23 16:46:41', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('182', '1', '8', '151', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-23 16:47:29', '2019-01-23 16:47:29', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('183', '1', '8', '153', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-23 16:48:22', '2019-01-23 16:48:22', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('184', '1', '8', '152', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-23 16:50:06', '2019-01-23 16:50:06', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('185', '1', '8', '152', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-23 16:51:00', '2019-01-23 16:51:00', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('186', '1', '9', '154', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-23 16:52:38', '2019-01-23 16:52:38', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('187', '1', '9', '154', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-23 16:53:28', '2019-01-23 16:53:28', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('188', '1', '9', '155', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-23 16:54:17', '2019-01-23 17:51:36', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('189', '1', '9', '155', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-23 16:55:05', '2019-01-23 16:55:05', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('190', '1', '9', '156', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-23 16:56:33', '2019-01-23 17:31:45', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('191', '1', '9', '156', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-23 16:57:57', '2019-01-23 17:30:25', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('192', '1', '9', '157', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-23 16:58:42', '2019-01-23 16:58:42', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('193', '1', '9', '157', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-23 16:59:11', '2019-01-23 16:59:11', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('194', '1', '9', '157', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-23 17:00:04', '2019-01-23 17:00:04', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('195', '1', '9', '158', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-23 17:00:45', '2019-02-18 19:51:52', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('196', '1', '9', '158', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-23 17:01:12', '2019-02-18 19:51:26', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('197', '1', '9', '159', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-23 17:02:27', '2019-02-18 18:13:54', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('198', '1', '9', '160', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-23 17:03:16', '2019-01-23 17:03:16', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('199', '1', '9', '161', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-23 17:04:17', '2019-01-23 17:04:17', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('200', '1', '9', '162', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-23 17:05:13', '2019-01-23 17:05:13', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('201', '1', '9', '162', null, '安XX', '', null, '9', null, '', '', '30', '2019-01-23 17:05:41', '2019-01-23 17:05:41', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('202', '1', '9', '163', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-23 17:07:18', '2019-02-17 20:42:00', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('203', '1', '9', '163', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-23 17:08:20', '2019-02-17 20:43:12', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('204', '1', '9', '164', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-23 17:09:08', '2019-01-23 17:09:08', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('205', '1', '9', '164', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-23 17:09:46', '2019-01-23 17:09:46', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('206', '1', '9', '165', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-23 17:10:40', '2019-01-23 17:10:40', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('207', '1', '9', '166', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-23 17:11:51', '2019-01-23 17:11:51', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('208', '1', '9', '166', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-23 17:12:32', '2019-01-23 17:12:32', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('209', '1', '9', '167', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-23 17:13:13', '2019-02-18 22:03:10', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('210', '1', '9', '167', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-23 17:13:36', '2019-02-18 22:01:36', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('211', '1', '9', '168', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-23 17:14:00', '2019-01-23 17:14:00', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('212', '1', '9', '169', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-23 17:15:02', '2019-01-23 17:15:02', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('213', '1', '9', '169', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-23 17:15:39', '2019-01-23 17:32:43', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('214', '1', '9', '171', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-23 17:16:11', '2019-01-23 17:46:11', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('215', '1', '9', '172', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-23 17:17:13', '2019-01-23 17:17:13', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('216', '1', '9', '172', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-23 17:18:04', '2019-01-23 17:18:04', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('217', '1', '9', '174', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-23 17:19:13', '2019-02-18 17:53:04', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('218', '1', '9', '175', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-23 17:21:00', '2019-02-20 08:10:57', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('219', '1', '9', '175', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-23 17:21:26', '2019-02-18 18:17:45', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('220', '1', '9', '160', null, '安XX', '', null, '9', null, '', '', '30', '2019-01-23 17:28:03', '2019-01-23 17:28:03', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('221', '1', '9', '176', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-23 17:33:44', '2019-01-23 17:33:44', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('222', '1', '9', '176', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-23 17:34:23', '2019-02-18 19:35:53', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('223', '1', '9', '176', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-23 17:34:59', '2019-01-23 17:34:59', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('224', '1', '9', '177', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-23 17:35:44', '2019-01-23 17:35:44', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('225', '1', '9', '178', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-23 17:36:20', '2019-01-23 17:36:20', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('226', '1', '9', '180', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-23 17:36:54', '2019-01-23 17:36:54', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('227', '1', '9', '180', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-23 17:37:31', '2019-01-24 20:55:00', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('228', '1', '9', '181', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-23 17:38:02', '2019-01-23 17:38:02', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('229', '1', '9', '181', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-23 17:38:39', '2019-02-23 15:28:46', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('230', '1', '9', '182', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-23 17:39:22', '2019-02-18 19:39:27', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('231', '1', '9', '182', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-23 17:40:02', '2019-02-18 19:40:48', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('232', '1', '9', '184', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-23 17:42:37', '2019-02-17 20:10:30', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('234', '1', '10', '228', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-23 17:43:50', '2019-01-23 17:43:50', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('235', '1', '10', '186', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-23 17:44:37', '2019-01-23 17:44:37', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('236', '1', '10', '186', null, '安XX', '', null, '9', null, '', '', '30', '2019-01-23 17:45:12', '2019-01-23 17:45:12', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('237', '1', '10', '186', null, '安XX', '', null, '10', null, '', '', '30', '2019-01-23 17:45:38', '2019-01-23 17:45:38', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('238', '1', '10', '187', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-23 17:47:22', '2019-01-23 17:47:22', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('239', '1', '10', '187', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-23 17:48:14', '2019-01-23 17:48:14', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('240', '1', '10', '188', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-23 17:53:08', '2019-01-23 17:53:08', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('241', '1', '9', '184', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-23 17:55:02', '2019-02-17 20:12:35', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('242', '1', '10', '189', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-23 17:55:59', '2019-01-23 17:55:59', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('243', '1', '10', '189', null, '安XX', '', null, '9', null, '', '', '30', '2019-01-23 17:56:49', '2019-01-23 17:56:49', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('244', '1', '10', '219', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-23 17:57:14', '2019-02-18 18:18:48', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('245', '1', '10', '222', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-23 17:57:51', '2019-02-18 19:36:18', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('246', '1', '10', '192', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-23 18:00:55', '2019-01-23 18:00:55', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('247', '1', '10', '200', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-23 18:02:07', '2019-01-23 18:02:07', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('248', '1', '10', '212', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-23 18:03:38', '2019-01-23 18:09:09', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('249', '1', '10', '213', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-23 18:04:01', '2019-01-23 18:04:01', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('250', '1', '10', '232', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-23 18:04:50', '2019-01-23 18:10:21', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('251', '1', '10', '232', null, '安XX', '', null, '9', null, '', '', '30', '2019-01-23 18:05:12', '2019-01-23 18:05:12', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('252', '1', '10', '232', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-23 18:05:41', '2019-02-17 20:41:11', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('253', '1', '10', '226', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-23 18:06:27', '2019-01-23 18:06:27', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('254', '1', '10', '241', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-23 18:08:04', '2019-01-23 18:08:04', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('255', '1', '11', '248', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-23 18:09:30', '2019-01-23 18:09:30', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('256', '1', '11', '238', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-23 18:09:53', '2019-01-23 18:09:53', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('257', '1', '11', '250', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-23 18:10:39', '2019-01-23 18:10:39', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('258', '1', '11', '252', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-23 18:10:58', '2019-01-23 18:10:58', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('259', '1', '9', '185', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-23 18:14:58', '2019-01-24 20:00:56', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('260', '1', '4', '26', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-24 20:09:24', '2019-01-24 20:09:24', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('261', '1', '5', '260', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-24 20:10:28', '2019-01-24 20:10:28', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('262', '1', '5', '260', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-24 20:11:08', '2019-01-24 20:11:08', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('263', '1', '6', '261', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-24 20:12:24', '2019-01-24 20:12:24', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('264', '1', '6', '261', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-24 20:13:17', '2019-01-24 20:13:17', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('265', '1', '6', '261', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-24 20:14:25', '2019-01-24 20:14:25', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('266', '1', '6', '261', null, '安XX', '', null, '11', 'on', '', '', '30', '2019-01-24 20:15:13', '2019-01-24 20:15:13', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('267', '1', '6', '261', null, '安XX', '', null, '12', 'on', '', '', '30', '2019-01-24 20:15:52', '2019-01-24 20:15:52', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('268', '1', '6', '262', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-24 20:16:23', '2019-01-24 20:16:23', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('269', '1', '7', '263', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-24 20:17:27', '2019-01-24 20:17:27', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('270', '1', '7', '264', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-24 20:18:15', '2019-01-24 20:18:15', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('271', '1', '7', '264', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-24 20:18:49', '2019-01-24 20:18:49', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('272', '1', '7', '264', null, '安XX', '', null, '10', null, '', '', '30', '2019-01-24 20:19:32', '2019-01-24 20:19:32', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('273', '1', '7', '266', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-24 20:20:24', '2019-01-24 20:20:24', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('274', '1', '7', '267', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-24 20:20:56', '2019-01-24 20:20:56', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('275', '1', '7', '268', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-24 20:21:43', '2019-01-24 20:21:43', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('276', '1', '8', '269', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-24 20:22:55', '2019-01-24 20:23:28', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('277', '1', '8', '269', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-24 20:24:13', '2019-01-24 20:24:13', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('278', '1', '8', '269', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-24 20:24:49', '2019-01-24 20:24:49', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('279', '1', '8', '269', null, '安XX', '', null, '11', null, '', '', '30', '2019-01-24 20:25:13', '2019-01-24 20:25:13', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('280', '1', '8', '271', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-24 20:26:29', '2019-01-24 20:26:29', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('281', '1', '8', '271', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-24 20:27:06', '2019-01-24 20:27:06', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('282', '1', '8', '273', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-24 20:28:00', '2019-01-24 20:28:00', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('283', '1', '8', '275', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-24 20:28:38', '2019-01-24 20:28:38', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('284', '1', '8', '275', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-24 20:29:30', '2019-01-24 20:29:30', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('285', '1', '8', '275', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-24 20:29:58', '2019-01-24 20:29:58', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('286', '1', '9', '276', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-24 20:30:50', '2019-01-24 20:30:50', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('287', '1', '9', '277', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-24 20:31:15', '2019-01-24 20:31:15', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('288', '1', '9', '278', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-24 20:31:41', '2019-01-24 20:31:41', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('289', '1', '9', '282', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-24 20:32:42', '2019-01-24 20:32:42', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('290', '1', '9', '283', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-24 20:33:23', '2019-01-24 20:33:23', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('291', '1', '9', '284', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-24 20:34:11', '2019-01-24 20:34:11', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('292', '1', '9', '284', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-24 20:34:56', '2019-01-24 20:34:56', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('293', '1', '9', '284', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-24 20:35:19', '2019-01-24 20:35:19', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('294', '1', '9', '285', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-24 20:36:08', '2019-01-24 20:36:08', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('295', '1', '9', '280', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-24 20:36:36', '2019-02-18 14:31:32', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('296', '1', '9', '281', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-24 20:37:04', '2019-01-24 20:37:04', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('297', '1', '9', '281', null, '安XX', '', null, '9', null, '', '', '30', '2019-01-24 20:37:47', '2019-01-24 20:37:47', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('298', '1', '3', '24', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-24 20:41:15', '2019-01-24 20:41:15', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('299', '1', '4', '298', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-24 20:42:16', '2019-01-24 20:42:16', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('300', '1', '4', '298', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-24 20:43:05', '2019-01-24 20:43:05', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('301', '1', '5', '299', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-24 20:44:29', '2019-01-24 20:44:29', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('302', '1', '5', '300', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-24 20:45:01', '2019-01-24 20:45:01', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('303', '1', '6', '301', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-24 20:45:45', '2019-01-24 20:45:45', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('304', '1', '6', '302', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-24 20:46:16', '2019-01-24 20:46:16', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('305', '1', '7', '303', null, '安XX', '安遂增的姨父是安保兴', null, '8', 'on', '', '', '30', '2019-01-24 20:49:04', '2019-01-24 20:49:04', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('306', '1', '8', '305', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-24 20:50:02', '2019-01-24 20:50:02', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('307', '1', '8', '305', null, '安XX', '', null, '9', null, '', '', '30', '2019-01-24 20:50:23', '2019-01-24 20:50:23', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('308', '1', '8', '305', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-24 20:50:58', '2019-01-24 20:50:58', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('309', '1', '9', '306', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-24 20:51:38', '2019-02-18 14:26:46', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('310', '1', '10', '70', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-24 20:53:29', '2019-01-24 20:53:29', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('311', '1', '10', '70', null, '安XX', '', null, '9', null, '', '', '30', '2019-01-24 20:54:08', '2019-01-24 20:54:08', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('312', '1', '10', '227', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-24 20:54:36', '2019-01-24 20:54:36', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('313', '1', '5', '300', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-24 21:00:58', '2019-01-24 21:00:58', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('314', '1', '6', '313', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-24 21:03:28', '2019-01-24 21:03:28', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('315', '1', '6', '313', null, '安XX', '', null, '9', null, '', '', '30', '2019-01-24 21:03:51', '2019-01-24 21:03:51', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('316', '1', '6', '313', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-24 21:04:50', '2019-01-24 21:04:50', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('317', '1', '7', '314', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-24 21:08:41', '2019-01-24 21:08:41', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('318', '1', '7', '314', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-24 21:09:09', '2019-01-24 21:09:09', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('319', '1', '7', '314', null, '安XX', '', null, '11', 'on', '', '', '30', '2019-01-24 21:09:52', '2019-02-19 09:46:17', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('320', '1', '7', '316', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-24 21:10:16', '2019-01-24 21:10:16', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('321', '1', '7', '316', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-24 21:11:41', '2019-01-24 21:11:41', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('322', '1', '7', '316', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-24 21:12:56', '2019-01-24 21:12:56', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('323', '1', '8', '317', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-24 21:14:56', '2019-01-24 21:14:56', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('324', '1', '8', '317', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-24 21:16:19', '2019-01-24 21:16:19', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('325', '1', '8', '318', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-24 21:17:12', '2019-01-24 21:17:12', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('326', '1', '8', '319', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-24 21:18:29', '2019-02-19 09:36:01', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('327', '1', '8', '319', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-24 21:18:56', '2019-02-19 09:47:46', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('328', '1', '8', '321', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-24 21:19:14', '2019-01-24 21:19:14', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('329', '1', '8', '321', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-24 21:21:12', '2019-01-24 21:21:12', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('330', '1', '8', '321', null, '安XX', '', null, '10', null, '', '', '30', '2019-01-24 21:21:40', '2019-01-24 21:21:40', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('331', '1', '8', '321', null, '安XX', '', null, '11', 'on', '', '', '30', '2019-01-24 21:22:54', '2019-01-24 21:22:54', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('332', '1', '8', '321', null, '安XX', '', null, '12', 'on', '', '', '30', '2019-01-24 21:23:31', '2019-01-24 21:23:31', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('333', '1', '8', '321', null, '安XX', '', null, '13', 'on', '', '', '30', '2019-01-24 21:24:01', '2019-01-24 21:24:01', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('334', '1', '8', '321', null, '安XX', '', null, '14', 'on', '', '', '30', '2019-01-24 21:24:41', '2019-01-24 21:24:41', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('335', '1', '8', '322', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-24 21:25:30', '2019-01-24 21:25:30', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('336', '1', '8', '322', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-24 21:25:51', '2019-02-18 19:24:56', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('337', '1', '8', '322', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-24 21:26:30', '2019-02-23 15:25:17', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('338', '1', '8', '320', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-24 21:27:14', '2019-01-24 21:27:14', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('339', '1', '9', '324', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-24 21:28:27', '2019-01-24 21:28:27', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('340', '1', '9', '324', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-24 21:29:20', '2019-01-24 21:29:20', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('341', '1', '9', '324', null, '安XX', '', null, '10', null, '', '', '30', '2019-01-24 21:30:00', '2019-01-24 21:30:00', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('342', '1', '9', '324', null, '安XX', '', null, '11', 'on', '', '', '30', '2019-01-24 21:30:33', '2019-01-24 21:30:33', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('343', '1', '9', '325', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-24 21:31:33', '2019-01-24 21:31:33', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('344', '1', '9', '326', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-24 21:32:15', '2019-02-19 09:37:03', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('345', '1', '9', '326', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-24 21:32:51', '2019-02-19 09:36:31', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('346', '1', '9', '327', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-24 21:33:22', '2019-02-19 09:34:28', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('347', '1', '9', '338', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-24 21:33:41', '2019-01-24 21:33:41', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('348', '1', '9', '331', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-24 21:34:09', '2019-01-24 21:34:09', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('349', '1', '9', '331', null, '安XX', '', null, '9', null, '', '', '30', '2019-01-24 21:34:25', '2019-01-24 21:34:25', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('350', '1', '9', '332', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-24 21:35:06', '2019-01-24 21:35:06', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('351', '1', '9', '333', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-24 21:35:38', '2019-01-24 21:35:38', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('352', '1', '9', '335', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-24 21:36:19', '2019-01-24 21:36:19', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('353', '1', '9', '335', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-24 21:37:49', '2019-01-24 22:10:19', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('354', '1', '10', '339', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 20:16:44', '2019-01-25 20:16:44', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('355', '1', '10', '339', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 20:16:54', '2019-01-25 20:16:54', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('356', '1', '10', '339', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 20:16:54', '2019-01-25 20:16:54', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('357', '1', '10', '340', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-25 20:17:23', '2019-01-25 20:17:23', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('358', '1', '10', '349', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-25 20:29:25', '2019-01-25 20:29:25', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('359', '1', '11', '355', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-25 20:30:02', '2019-01-25 20:30:02', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('360', '1', '3', '', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 21:31:29', '2019-01-25 21:31:29', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('361', '1', '4', '360', null, '安XX', '继子 双堂 ', null, '9', 'on', '', '', '30', '2019-01-25 21:33:24', '2019-01-25 21:38:08', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('362', '1', '4', '360', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 21:34:22', '2019-01-25 21:34:22', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('363', '1', '5', '362', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 21:39:40', '2019-01-25 21:39:40', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('364', '1', '5', '362', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-25 21:40:17', '2019-01-25 21:40:17', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('365', '1', '5', '362', null, '安XX', '过继到 安汝亍', null, '10', 'on', '', '', '30', '2019-01-25 21:40:52', '2019-01-25 21:41:59', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('366', '1', '6', '363', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 21:43:11', '2019-01-25 21:43:11', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('367', '1', '6', '363', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-25 21:43:55', '2019-01-25 21:43:55', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('368', '1', '6', '365', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 21:45:17', '2019-01-25 21:45:17', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('369', '1', '7', '366', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 21:46:52', '2019-01-25 21:50:42', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('370', '1', '7', '367', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 21:47:24', '2019-01-25 21:47:24', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('371', '1', '7', '368', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 21:48:13', '2019-01-25 21:48:13', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('372', '1', '8', '369', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-25 21:51:36', '2019-01-25 21:51:36', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('373', '1', '8', '370', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-25 21:51:57', '2019-01-25 21:51:57', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('374', '1', '8', '371', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 21:52:36', '2019-01-25 21:52:36', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('375', '1', '9', '374', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 21:54:03', '2019-01-25 21:54:03', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('376', '1', '10', '375', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-25 21:54:25', '2019-02-23 15:30:27', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('377', '1', '4', '', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 21:55:21', '2019-01-25 21:55:21', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('378', '1', '5', '377', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 21:57:18', '2019-01-25 21:57:18', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('379', '1', '5', '377', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-25 21:58:16', '2019-01-25 21:58:16', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('380', '1', '5', '377', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-25 21:59:02', '2019-01-25 21:59:02', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('381', '1', '5', '377', null, '安XX', '', null, '11', 'on', '', '', '30', '2019-01-25 21:59:37', '2019-01-25 21:59:37', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('382', '1', '6', '378', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 22:01:24', '2019-01-25 22:01:24', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('383', '1', '6', '379', null, '安XX', '继孙  安宪印', null, '8', 'on', '', '', '30', '2019-01-25 22:02:25', '2019-01-25 22:03:14', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('384', '1', '6', '379', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-25 22:04:33', '2019-01-25 22:04:33', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('385', '1', '6', '379', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-25 22:05:06', '2019-01-25 22:05:06', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('386', '1', '6', '380', null, '安XX', '叔父安景昭', null, '8', 'on', '', '', '30', '2019-01-25 22:06:06', '2019-01-25 22:06:36', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('387', '1', '6', '381', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 22:07:08', '2019-01-25 22:07:08', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('388', '1', '7', '382', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 22:08:20', '2019-01-25 22:08:20', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('389', '1', '7', '382', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-25 22:08:54', '2019-01-25 22:08:54', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('390', '1', '7', '382', null, '安XX', '', null, '10', null, '', '', '30', '2019-01-25 22:09:20', '2019-01-25 22:09:20', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('391', '1', '7', '386', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 22:10:42', '2019-01-25 22:10:42', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('392', '1', '7', '387', null, '安XX', '安宪印出枝', null, '8', 'on', '', '', '30', '2019-01-25 22:11:36', '2019-02-18 19:27:53', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('393', '1', '8', '391', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 22:13:50', '2019-01-25 22:13:50', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('394', '1', '8', '391', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-25 22:15:37', '2019-01-25 22:20:32', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('395', '1', '8', '391', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 22:16:04', '2019-01-25 22:16:04', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('396', '1', '8', '392', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 22:17:01', '2019-02-18 19:46:27', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('397', '1', '8', '392', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-25 22:17:40', '2019-01-25 22:17:40', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('398', '1', '8', '392', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-25 22:19:43', '2019-01-25 22:19:43', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('399', '1', '9', '394', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-25 22:20:46', '2019-01-25 22:20:46', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('400', '1', '9', '396', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 22:22:27', '2019-02-17 20:42:50', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('401', '1', '9', '397', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-25 22:22:55', '2019-01-25 22:22:55', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('402', '1', '9', '397', null, '安XX', '', null, '9', null, '', '', '30', '2019-01-25 22:23:17', '2019-01-25 22:23:17', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('403', '1', '9', '398', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 22:23:42', '2019-01-25 22:23:42', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('404', '1', '1', '1', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 22:24:29', '2019-01-29 09:15:25', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('405', '1', '2', '404', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 22:25:24', '2019-01-25 22:25:24', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('406', '1', '3', '405', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 22:26:08', '2019-01-25 22:26:08', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('407', '1', '3', '405', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-25 22:26:38', '2019-01-25 22:26:38', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('408', '1', '4', '406', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 22:27:17', '2019-01-25 22:27:17', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('409', '1', '5', '408', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 22:27:48', '2019-01-25 22:27:48', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('410', '1', '6', '409', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 22:28:37', '2019-01-25 22:28:37', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('411', '1', '6', '409', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-25 22:29:29', '2019-01-25 22:29:29', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('412', '1', '6', '409', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-25 22:30:00', '2019-01-25 22:30:00', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('413', '1', '6', '409', null, '安XX', '', null, '11', 'on', '', '', '30', '2019-01-25 22:30:26', '2019-01-25 22:30:26', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('414', '1', '7', '410', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 22:31:35', '2019-01-25 22:31:35', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('415', '1', '7', '410', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-25 22:32:29', '2019-01-25 22:32:29', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('416', '1', '7', '411', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 22:33:32', '2019-01-25 22:33:32', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('417', '1', '7', '411', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-25 22:34:24', '2019-01-25 22:34:24', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('418', '1', '7', '412', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 22:34:58', '2019-01-25 22:34:58', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('419', '1', '7', '413', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 22:35:31', '2019-01-25 22:35:31', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('420', '1', '8', '414', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 22:36:09', '2019-01-25 22:36:09', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('421', '1', '8', '414', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-25 22:36:38', '2019-01-25 22:36:38', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('422', '1', '8', '414', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-25 22:37:23', '2019-01-25 22:37:23', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('423', '1', '8', '416', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 22:37:53', '2019-01-25 22:45:18', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('424', '1', '8', '416', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-25 22:38:35', '2019-01-25 22:38:35', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('425', '1', '8', '417', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 22:39:21', '2019-01-25 22:39:21', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('426', '1', '8', '417', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 22:39:52', '2019-01-25 22:39:52', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('427', '1', '8', '417', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-25 22:40:29', '2019-01-25 22:40:29', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('428', '1', '8', '418', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 22:41:35', '2019-01-25 22:41:35', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('429', '1', '9', '422', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-25 22:42:03', '2019-01-25 22:42:03', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('430', '1', '9', '420', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 22:42:37', '2019-01-25 22:42:37', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('431', '1', '9', '421', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-25 22:42:58', '2019-01-25 22:42:58', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('432', '1', '9', '423', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 22:45:48', '2019-01-25 22:45:48', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('433', '1', '9', '423', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-25 22:46:08', '2019-02-18 19:54:44', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('434', '1', '9', '424', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 22:47:06', '2019-01-25 22:47:06', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('435', '1', '9', '428', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 22:47:41', '2019-01-25 22:47:41', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('436', '1', '9', '428', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-25 22:48:13', '2019-01-25 22:48:13', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('437', '1', '9', '425', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-25 22:48:31', '2019-01-25 22:48:31', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('438', '1', '10', '432', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 22:49:26', '2019-01-25 22:49:26', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('439', '1', '10', '432', null, '安XX', '', null, '9', null, '', '', '30', '2019-01-25 22:49:45', '2019-01-25 22:49:45', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('440', '1', '10', '435', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 22:50:05', '2019-01-25 22:50:05', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('441', '1', '10', '435', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-25 22:50:26', '2019-01-25 22:50:26', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('442', '1', '10', '436', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-25 22:50:42', '2019-01-25 22:50:42', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('443', '1', '10', '436', null, '安XX', '', null, '9', null, '', '', '30', '2019-01-25 22:51:07', '2019-01-25 22:51:07', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('444', '1', '5', '', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 22:51:58', '2019-01-25 22:51:58', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('445', '1', '6', '444', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 22:52:29', '2019-01-25 22:52:29', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('446', '1', '7', '445', null, '安XX', '继子 安宪朱', null, '8', null, '', '', '30', '2019-01-25 22:53:31', '2019-01-25 22:53:31', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('447', '1', '7', '445', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-25 22:54:09', '2019-01-25 22:54:09', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('448', '1', '8', '446', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 22:55:05', '2019-01-25 22:55:05', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('449', '1', '8', '447', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 22:55:43', '2019-01-25 22:55:43', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('450', '1', '9', '448', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 22:56:38', '2019-01-25 22:56:38', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('451', '1', '9', '448', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-25 22:59:01', '2019-01-25 22:59:01', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('452', '1', '9', '448', null, '安XX', '', null, '10', null, '', '', '30', '2019-01-25 22:59:23', '2019-01-25 22:59:23', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('453', '1', '9', '448', null, '安XX', '', null, '11', null, '', '', '30', '2019-01-25 22:59:57', '2019-01-25 22:59:57', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('454', '1', '9', '449', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-25 23:01:01', '2019-01-25 23:01:01', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('455', '1', '9', '449', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-25 23:01:31', '2019-01-25 23:01:31', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('456', '1', '9', '449', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-25 23:02:07', '2019-01-25 23:02:07', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('457', '1', '9', '427', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-25 23:03:04', '2019-01-25 23:03:04', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('458', '1', '10', '451', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-25 23:04:47', '2019-01-25 23:04:47', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('459', '1', '10', '454', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-25 23:05:04', '2019-01-25 23:05:04', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('460', '1', '10', '455', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-25 23:05:21', '2019-01-25 23:05:21', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('462', '1', '5', '', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-29 15:18:43', '2019-01-29 15:18:43', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('463', '1', '6', '462', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-29 15:20:00', '2019-01-29 15:20:00', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('464', '1', '6', '462', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-29 15:21:28', '2019-01-29 15:21:28', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('465', '1', '7', '463', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-29 16:21:23', '2019-01-29 16:26:44', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('466', '1', '7', '463', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-29 16:22:10', '2019-01-29 16:26:22', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('467', '1', '7', '464', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-29 16:27:33', '2019-01-29 16:27:33', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('468', '1', '8', '466', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-29 16:28:11', '2019-01-29 16:28:11', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('469', '1', '8', '465', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-29 16:28:35', '2019-01-29 16:28:35', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('470', '1', '8', '467', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-29 16:32:03', '2019-01-29 16:32:03', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('471', '1', '9', '468', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-29 16:32:25', '2019-01-29 16:32:25', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('472', '1', '9', '469', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-29 16:32:43', '2019-01-29 16:32:43', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('473', '1', '9', '470', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-29 16:33:10', '2019-01-29 16:33:10', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('474', '1', '4', '', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-29 16:33:58', '2019-01-29 16:33:58', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('475', '1', '5', '474', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-29 16:34:21', '2019-01-29 16:34:21', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('476', '1', '5', '474', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-29 16:35:24', '2019-01-29 16:35:24', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('477', '1', '5', '474', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-29 16:36:23', '2019-01-29 16:36:23', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('478', '1', '6', '476', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-29 16:37:09', '2019-01-29 16:37:09', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('479', '1', '6', '476', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-29 16:38:04', '2019-01-29 16:38:04', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('480', '1', '6', '477', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-29 16:38:48', '2019-01-29 16:38:48', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('481', '1', '6', '477', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-29 16:39:26', '2019-01-29 16:39:26', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('482', '1', '7', '478', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-29 16:41:39', '2019-01-29 16:41:39', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('483', '1', '7', '478', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-29 16:42:07', '2019-01-29 16:42:07', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('484', '1', '7', '479', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-29 16:42:43', '2019-01-29 16:42:43', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('485', '1', '7', '479', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-29 16:43:37', '2019-01-29 16:43:37', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('486', '1', '7', '479', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-29 16:44:12', '2019-01-29 16:44:12', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('487', '1', '7', '479', null, '安XX', '', null, '11', 'on', '', '', '30', '2019-01-29 16:44:49', '2019-01-29 16:44:49', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('488', '1', '7', '479', null, '安XX', '', null, '12', 'on', '', '', '30', '2019-01-29 16:45:41', '2019-01-29 16:45:41', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('489', '1', '7', '480', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-29 16:46:12', '2019-01-29 16:46:12', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('490', '1', '7', '481', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-29 16:47:36', '2019-01-29 16:47:36', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('491', '1', '7', '481', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-29 16:48:22', '2019-01-29 16:48:22', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('492', '1', '7', '481', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-29 16:48:43', '2019-01-29 16:48:43', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('493', '1', '7', '481', null, '安XX', '', null, '11', null, '', '', '30', '2019-01-29 16:49:01', '2019-01-29 16:49:01', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('494', '1', '8', '482', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-29 16:50:04', '2019-01-29 16:50:04', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('495', '1', '8', '482', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-29 16:50:41', '2019-01-29 16:50:41', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('496', '1', '8', '483', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-29 16:51:13', '2019-01-29 16:51:13', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('497', '1', '8', '489', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-29 16:51:50', '2019-02-23 16:52:41', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('498', '1', '8', '490', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-29 16:52:25', '2019-01-29 16:52:25', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('499', '1', '8', '491', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-29 16:53:52', '2019-01-29 16:53:52', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('500', '1', '8', '484', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-29 16:54:15', '2019-01-29 16:54:15', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('501', '1', '8', '489', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-29 16:54:50', '2019-01-29 16:54:50', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('502', '1', '8', '487', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-29 16:55:17', '2019-01-29 16:55:17', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('503', '1', '9', '495', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-29 16:55:41', '2019-01-29 16:55:41', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('504', '1', '4', '', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-29 16:56:25', '2019-01-29 16:56:25', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('505', '1', '5', '504', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-29 16:57:47', '2019-01-29 16:57:47', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('506', '1', '5', '504', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-29 16:58:33', '2019-01-29 16:58:33', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('507', '1', '6', '506', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-29 17:00:35', '2019-01-29 17:00:35', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('508', '1', '6', '506', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-29 17:01:17', '2019-01-29 17:01:17', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('509', '1', '7', '507', null, '安XX', '迁北京', null, '8', null, '', '', '30', '2019-01-29 17:02:39', '2019-01-29 17:02:39', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('510', '1', '7', '507', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-29 17:03:07', '2019-01-29 17:03:07', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('511', '1', '7', '507', null, '安XX', '迁 孙庄', null, '10', 'on', '', '', '30', '2019-01-29 17:03:42', '2019-01-29 17:03:42', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('512', '1', '7', '507', null, '安XX', '', null, '11', 'on', '', '', '30', '2019-01-29 17:04:12', '2019-01-29 17:04:12', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('513', '1', '7', '508', null, '安XX', '迁沈庄', null, '8', 'on', '', '', '30', '2019-01-29 17:28:10', '2019-01-29 17:28:26', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('514', '1', '7', '508', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-29 17:29:01', '2019-01-29 17:29:01', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('515', '1', '7', '508', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-29 17:29:32', '2019-01-29 17:29:32', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('516', '1', '7', '508', null, '安XX', '', null, '11', 'on', '', '', '30', '2019-01-29 17:30:25', '2019-01-29 17:30:25', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('517', '1', '8', '515', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-29 17:31:04', '2019-01-29 17:31:04', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('518', '1', '8', '512', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-29 17:31:32', '2019-01-29 17:31:32', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('519', '1', '8', '514', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-29 17:32:10', '2019-01-29 17:32:10', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('520', '1', '8', '514', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-29 17:32:40', '2019-02-23 15:32:44', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('521', '1', '8', '516', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-29 17:33:19', '2019-01-29 17:33:19', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('522', '1', '8', '516', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-29 17:34:03', '2019-01-29 17:34:03', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('523', '1', '9', '517', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-29 17:40:16', '2019-01-29 17:40:16', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('524', '1', '9', '521', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-29 17:40:46', '2019-01-29 17:40:46', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('525', '1', '9', '497', null, '安XX', '', null, '9', null, '', '', '30', '2019-01-29 17:41:17', '2019-02-23 16:54:57', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('526', '1', '8', '485', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-29 17:41:51', '2019-01-29 17:41:51', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('527', '1', '8', '485', null, '安XX', '', null, '9', null, '', '', '30', '2019-01-29 17:45:26', '2019-01-29 17:45:26', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('528', '1', '5', '', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-29 17:46:14', '2019-01-29 17:46:14', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('529', '1', '6', '528', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-29 17:46:40', '2019-01-29 17:46:40', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('530', '1', '6', '528', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-29 17:47:04', '2019-01-29 17:47:04', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('531', '1', '7', '529', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-29 17:47:51', '2019-01-29 17:47:51', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('532', '1', '7', '529', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-29 17:48:21', '2019-01-29 17:48:21', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('533', '1', '8', '531', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-29 17:53:22', '2019-01-29 17:53:22', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('534', '1', '8', '531', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-29 17:53:55', '2019-01-29 17:53:55', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('535', '1', '8', '531', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-29 17:57:48', '2019-01-29 17:57:48', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('536', '1', '8', '532', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-29 17:58:37', '2019-01-29 17:59:20', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('537', '1', '8', '532', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-29 17:59:59', '2019-01-29 17:59:59', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('538', '1', '8', '532', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-29 18:00:31', '2019-01-29 18:00:31', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('539', '1', '9', '533', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-29 18:01:26', '2019-01-29 18:01:26', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('540', '1', '9', '533', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-29 18:02:29', '2019-01-29 18:02:29', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('541', '1', '9', '533', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-29 18:03:33', '2019-01-29 18:03:33', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('542', '1', '9', '534', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-29 18:04:30', '2019-02-18 14:24:03', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('543', '1', '9', '534', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-29 18:05:23', '2019-02-18 14:25:05', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('544', '1', '9', '535', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-29 18:06:06', '2019-02-18 20:23:40', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('545', '1', '9', '535', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-29 18:06:56', '2019-02-18 20:24:00', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('546', '1', '9', '536', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-29 18:07:19', '2019-02-25 17:38:08', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('547', '1', '9', '537', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-29 18:07:45', '2019-01-29 18:07:45', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('548', '1', '9', '538', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-29 18:10:34', '2019-02-25 17:34:36', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('549', '1', '10', '542', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-29 18:11:01', '2019-01-29 18:11:01', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('550', '1', '10', '539', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-29 18:11:31', '2019-01-29 18:11:31', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('551', '1', '10', '543', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-29 18:12:02', '2019-01-29 18:12:02', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('552', '1', '10', '541', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-29 18:12:29', '2019-01-29 18:12:29', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('553', '1', '5', '', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-29 18:13:28', '2019-01-29 18:13:28', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('554', '1', '6', '553', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-29 18:14:25', '2019-01-29 18:14:25', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('555', '1', '7', '554', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-29 18:15:38', '2019-01-29 18:15:38', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('556', '1', '7', '554', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-29 18:16:21', '2019-01-29 18:16:21', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('557', '1', '8', '555', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-29 18:17:45', '2019-01-29 18:17:45', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('558', '1', '8', '555', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-29 18:18:15', '2019-01-29 18:18:15', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('559', '1', '9', '557', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-29 18:18:44', '2019-02-18 14:32:53', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('560', '1', '9', '557', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-29 18:19:15', '2019-01-29 18:19:15', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('561', '1', '9', '557', null, '安XX', '', null, '10', 'on', '', '', '30', '2019-01-29 18:19:55', '2019-01-29 18:19:55', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('562', '1', '9', '557', null, '安XX', '', null, '11', 'on', '', '', '30', '2019-01-29 18:20:27', '2019-01-29 18:20:27', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('563', '1', '10', '559', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-29 18:22:28', '2019-01-29 18:22:28', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('564', '1', '10', '560', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-29 18:22:59', '2019-01-29 18:22:59', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('565', '1', '10', '560', null, '安XX', '', null, '9', 'on', '', '', '30', '2019-01-29 18:23:21', '2019-01-29 18:23:21', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('566', '1', '10', '561', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-29 18:24:00', '2019-01-29 18:24:00', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('567', '1', '10', '562', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-29 18:26:39', '2019-01-29 18:26:39', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('568', '1', '11', '563', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-29 18:27:10', '2019-02-18 14:33:51', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('569', '1', '11', '564', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-29 18:27:30', '2019-01-29 18:27:30', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('571', '1', '9', '537', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-01-29 18:28:33', '2019-01-29 18:28:33', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('572', '1', '11', '106', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-29 18:29:24', '2019-01-29 18:29:24', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('573', '1', '10', '79', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-29 18:30:25', '2019-01-29 18:30:25', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('574', '1', '10', '80', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-29 18:31:17', '2019-01-29 18:31:17', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('575', '1', '9', '393', null, '安XX', '', null, '8', null, '', '', '30', '2019-01-29 18:32:14', '2019-01-29 18:32:14', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('576', '1', '10', '202', null, '安XX', '', null, '8', null, '', '', '30', '2019-02-17 20:09:17', '2019-02-17 20:09:17', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('578', '1', '10', '203', null, '安XX', '', null, '8', null, '', '', '30', '2019-02-17 20:17:15', '2019-02-17 20:17:15', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('579', '1', '11', '567', null, '安XX', '', null, '8', null, '', '', '30', '2019-02-17 20:40:40', '2019-02-17 20:40:40', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('580', '1', '10', '542', null, '安XX', '', null, '9', null, '', '', '30', '2019-02-18 14:24:41', '2019-02-18 14:24:41', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('581', '1', '11', '566', null, '安XX', '', null, '8', null, '', '', '30', '2019-02-18 14:27:29', '2019-02-18 14:27:29', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('582', '1', '11', '563', null, '安XX', '', null, '9', null, '', '', '30', '2019-02-18 14:34:32', '2019-02-18 14:34:32', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('583', '1', '10', '309', null, '安XX', '', null, '8', null, '', '', '30', '2019-02-18 14:44:41', '2019-02-18 14:44:41', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('584', '1', '10', '559', null, '安XX', '', null, '9', null, '', '', '30', '2019-02-18 15:19:08', '2019-02-18 15:19:08', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('585', '1', '10', '217', null, '安XX', '', null, '8', null, '', '', '30', '2019-02-18 17:50:42', '2019-02-18 17:55:26', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('586', '1', '10', '217', null, '安XX', '', null, '9', null, '', '', '30', '2019-02-18 17:51:25', '2019-02-18 17:54:38', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('587', '1', '10', '81', null, '安XX', '', null, '8', null, '', '', '30', '2019-02-18 17:59:14', '2019-02-18 17:59:14', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('588', '1', '10', '400', null, '安XX', '', null, '8', null, '', '', '30', '2019-02-18 18:20:47', '2019-02-18 18:21:33', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('589', '1', '11', '438', null, '安XX', '', null, '8', null, '', '', '30', '2019-02-18 19:21:30', '2019-02-18 19:21:30', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('590', '1', '9', '336', null, '安XX', '', null, '8', null, '', '', '30', '2019-02-18 19:25:43', '2019-02-18 19:25:43', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('591', '1', '10', '352', null, '安XX', '', null, '8', null, '', '', '30', '2019-02-18 19:26:43', '2019-02-18 19:26:43', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('592', '1', '11', '248', null, '安XX', '', null, '9', null, '', '', '30', '2019-02-18 19:29:24', '2019-02-18 19:29:24', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('593', '1', '10', '221', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-02-18 19:32:42', '2019-02-18 19:32:42', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('594', '1', '10', '223', null, '安XX', '', null, '8', null, '', '', '30', '2019-02-18 19:38:23', '2019-02-18 19:38:23', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('595', '1', '10', '230', null, '安XX', '', null, '8', null, '', '', '30', '2019-02-18 19:40:12', '2019-02-18 19:40:12', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('596', '1', '10', '231', null, '安XX', '', null, '8', null, '', '', '30', '2019-02-18 19:41:16', '2019-02-18 19:41:16', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('597', '1', '10', '195', null, '安XX', '', null, '8', null, '', '', '30', '2019-02-18 19:52:52', '2019-02-18 19:52:52', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('598', '1', '9', '156', null, '安XX', '', null, '8', null, '', '', '30', '2019-02-18 20:01:30', '2019-02-18 20:01:30', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('599', '1', '9', '177', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-02-18 20:21:41', '2019-02-18 20:21:41', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('600', '1', '10', '599', null, '安XX', '', null, '8', null, '', '', '30', '2019-02-18 20:22:16', '2019-02-18 20:22:16', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('601', '1', '10', '544', null, '安XX', '', null, '8', null, '', '', '30', '2019-02-18 20:26:02', '2019-02-18 20:26:02', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('602', '1', '7', '137', null, '安XX', '', null, '8', 'on', '', '', '30', '2019-02-18 21:54:47', '2019-02-18 21:54:47', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('603', '1', '10', '209', null, '安XX', '', null, '8', null, '', '', '30', '2019-02-18 21:57:14', '2019-02-18 21:57:14', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('604', '1', '10', '210', null, '安XX', '', null, '8', null, '', '', '30', '2019-02-18 21:58:17', '2019-02-18 21:58:17', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('605', '1', '10', '346', null, '安XX', '', null, '8', null, '', '', '30', '2019-02-19 09:35:14', '2019-02-19 09:35:14', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('606', '1', '10', '345', null, '安XX', '', null, '8', null, '', '', '30', '2019-02-19 09:37:48', '2019-02-19 09:37:48', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('607', '1', '10', '344', null, '安XX', '', null, '8', null, '', '', '30', '2019-02-19 09:38:23', '2019-02-19 09:38:23', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('608', '1', '11', '105', null, '安XX', '', null, '8', null, '', '', '30', '2019-02-20 08:08:51', '2019-02-20 08:08:51', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('609', '1', '11', '106', null, '安XX', '', null, '9', null, '', '', '30', '2019-02-20 08:09:23', '2019-02-20 08:09:23', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('610', '1', '9', '337', null, '安XX', '', null, '8', null, '', '', '2', '2019-02-23 15:26:08', '2019-02-23 15:26:08', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('611', '1', '10', '229', null, '安XX', '', null, '8', null, '', '', '2', '2019-02-23 15:29:06', '2019-02-23 15:29:06', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('612', '1', '9', '520', null, '安XX', '', null, '8', null, '', '', '2', '2019-02-23 15:33:21', '2019-02-23 15:33:21', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('613', '1', '11', '565', null, '安XX', '', null, '8', null, '', '', '2', '2019-02-23 15:45:54', '2019-02-23 16:51:28', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('614', '1', '9', '497', null, '安XX', '', null, '8', null, '', '', '2', '2019-02-23 16:55:25', '2019-02-23 16:55:25', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('615', '1', '12', '118', null, '安XX', '', null, '8', null, '', '', '2', '2019-02-23 17:13:15', '2019-02-23 17:13:15', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('616', '1', '10', '205', null, '安XX', '', null, '8', null, '', '', '30', '2019-02-25 17:28:30', '2019-02-25 17:28:30', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('617', '1', '10', '204', null, '安XX', '', null, '8', null, '', '', '30', '2019-02-25 17:28:57', '2019-02-25 17:28:57', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('618', '1', '10', '204', null, '安XX', '', null, '9', null, '', '', '30', '2019-02-25 17:29:22', '2019-02-25 17:29:22', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('619', '1', '10', '548', null, '安XX', '', null, '8', null, '', '', '30', '2019-02-25 17:36:39', '2019-02-25 17:36:39', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('620', '1', '10', '548', null, '安XX', '', null, '9', null, '', '', '30', '2019-02-25 17:37:11', '2019-02-25 17:37:11', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('621', '1', '11', '17', null, '安XX', '', null, '8', null, '1', '', '2', '2019-03-05 10:35:07', '2019-03-05 10:35:07', '25', 'org25_');
INSERT INTO `gen_member` VALUES ('622', '1', '10', '206', null, '安XX', '', null, '8', null, '1', '', '2', '2020-01-01 22:06:23', '2020-01-01 22:06:23', '25', 'org25_');

-- ----------------------------
-- Table structure for gen_member_wife
-- ----------------------------
DROP TABLE IF EXISTS `gen_member_wife`;
CREATE TABLE `gen_member_wife` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `content` text,
  `tpdz` varchar(1200) DEFAULT NULL,
  `level` varchar(50) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `create_user` varchar(50) DEFAULT NULL,
  `create_time` varchar(50) DEFAULT NULL,
  `update_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=448 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gen_member_wife
-- ----------------------------
INSERT INTO `gen_member_wife` VALUES ('13', '14', '刘氏', '无', null, '1', '', '2', '2019-01-02 10:44:17', '2019-01-23 17:24:25');
INSERT INTO `gen_member_wife` VALUES ('14', '15', '敖氏', '无', null, '1', '', '2', '2019-01-02 10:44:52', '2019-01-23 17:40:45');
INSERT INTO `gen_member_wife` VALUES ('15', '16', '黄氏', '无', null, '1', '', '2', '2019-01-02 10:45:23', '2019-01-23 17:23:43');
INSERT INTO `gen_member_wife` VALUES ('16', '17', '李氏', '无', null, '1', '', '2', '2019-01-02 10:46:27', '2019-01-09 09:56:44');
INSERT INTO `gen_member_wife` VALUES ('17', '23', '黄氏', '', null, '', '', '30', '2019-01-11 19:29:43', '2019-01-29 09:15:34');
INSERT INTO `gen_member_wife` VALUES ('18', '24', '刘氏，于氏', '', null, '', '', '30', '2019-01-11 19:31:04', '2019-01-11 19:31:04');
INSERT INTO `gen_member_wife` VALUES ('19', '25', '崔氏', '', null, '', '', '30', '2019-01-11 19:31:51', '2019-01-11 19:31:51');
INSERT INTO `gen_member_wife` VALUES ('20', '26', '', '', null, '', '', '30', '2019-01-11 19:32:47', '2019-01-11 19:32:47');
INSERT INTO `gen_member_wife` VALUES ('21', '27', '王氏，尹氏', '', null, '', '', '30', '2019-01-11 19:34:40', '2019-01-11 19:34:40');
INSERT INTO `gen_member_wife` VALUES ('22', '28', '耿氏', '', null, '', '', '30', '2019-01-11 19:36:01', '2019-01-11 19:36:01');
INSERT INTO `gen_member_wife` VALUES ('23', '29', '魏氏，耿氏', '', null, '', '', '30', '2019-01-11 19:37:25', '2019-01-11 19:37:25');
INSERT INTO `gen_member_wife` VALUES ('24', '30', '姚氏，刘氏', '', null, '', '', '30', '2019-01-11 19:38:33', '2019-01-11 19:38:33');
INSERT INTO `gen_member_wife` VALUES ('25', '31', '刘氏', '', null, '', '', '30', '2019-01-11 19:39:43', '2019-01-11 19:39:43');
INSERT INTO `gen_member_wife` VALUES ('26', '32', '夏氏', '', null, '', '', '30', '2019-01-11 19:40:37', '2019-01-11 19:40:37');
INSERT INTO `gen_member_wife` VALUES ('27', '34', '赵氏，田氏', '', null, '', '', '30', '2019-01-11 19:42:34', '2019-01-11 19:42:34');
INSERT INTO `gen_member_wife` VALUES ('28', '35', '占氏', '', null, '', '占海', '30', '2019-01-11 19:44:03', '2019-01-11 19:44:03');
INSERT INTO `gen_member_wife` VALUES ('29', '36', '王氏，刘氏', '', null, '', '', '30', '2019-01-11 19:48:48', '2019-01-11 19:48:48');
INSERT INTO `gen_member_wife` VALUES ('30', '37', '王氏', '', null, '', '', '30', '2019-01-11 20:01:21', '2019-01-11 20:01:21');
INSERT INTO `gen_member_wife` VALUES ('31', '38', '刘氏', '', null, '', '姜庄', '30', '2019-01-11 20:02:40', '2019-01-11 20:02:40');
INSERT INTO `gen_member_wife` VALUES ('32', '39', '刘氏', '', null, '', '姜庄', '30', '2019-01-11 20:03:39', '2019-01-11 20:03:39');
INSERT INTO `gen_member_wife` VALUES ('33', '40', '赵氏', '', null, '', '南无村', '30', '2019-01-11 20:04:48', '2019-01-11 20:04:48');
INSERT INTO `gen_member_wife` VALUES ('34', '41', '朱氏，郭氏，杨氏', '', null, '', '', '30', '2019-01-11 20:06:22', '2019-01-11 20:06:22');
INSERT INTO `gen_member_wife` VALUES ('35', '42', '刘氏', '', null, '', '姜庄', '30', '2019-01-11 20:09:32', '2019-01-11 20:09:32');
INSERT INTO `gen_member_wife` VALUES ('36', '43', '王氏', '', null, '', '王楼', '30', '2019-01-11 20:10:43', '2019-01-11 20:10:43');
INSERT INTO `gen_member_wife` VALUES ('37', '44', '郝氏', '', null, '', '马寨', '30', '2019-01-11 20:11:58', '2019-01-11 20:13:16');
INSERT INTO `gen_member_wife` VALUES ('38', '45', '郭氏', '', null, '', '后街', '30', '2019-01-11 20:13:53', '2019-01-11 20:13:53');
INSERT INTO `gen_member_wife` VALUES ('39', '46', '耿氏', '', null, '', '耿楼', '30', '2019-01-11 20:14:47', '2019-01-11 20:14:47');
INSERT INTO `gen_member_wife` VALUES ('40', '47', '刘氏', '', null, '', '李院', '30', '2019-01-11 20:15:59', '2019-01-11 20:15:59');
INSERT INTO `gen_member_wife` VALUES ('41', '48', '杨氏', '', null, '', '董王庄', '30', '2019-01-11 20:17:37', '2019-01-11 20:17:37');
INSERT INTO `gen_member_wife` VALUES ('42', '49', '赵氏', '', null, '', '赵官目', '30', '2019-01-11 20:18:57', '2019-01-11 20:18:57');
INSERT INTO `gen_member_wife` VALUES ('43', '51', '周氏', '', null, '', '中墰', '30', '2019-01-11 20:22:58', '2019-01-11 20:22:58');
INSERT INTO `gen_member_wife` VALUES ('44', '52', '赵氏', '', null, '', '赵官目', '30', '2019-01-11 20:24:04', '2019-01-11 20:24:04');
INSERT INTO `gen_member_wife` VALUES ('45', '53', '王氏', '', null, '', '王化', '30', '2019-01-11 20:24:56', '2019-01-11 20:27:23');
INSERT INTO `gen_member_wife` VALUES ('46', '54', '李氏', '', null, '', '徐村', '30', '2019-01-11 20:26:30', '2019-01-11 20:26:30');
INSERT INTO `gen_member_wife` VALUES ('47', '55', '张氏', '', null, '', '石元坦', '30', '2019-01-11 20:28:19', '2019-01-11 20:28:19');
INSERT INTO `gen_member_wife` VALUES ('48', '56', '黄氏', '', null, '', '后街', '30', '2019-01-11 20:29:20', '2019-02-18 14:42:06');
INSERT INTO `gen_member_wife` VALUES ('49', '57', '刘氏', '', null, '', '刘庄', '30', '2019-01-11 20:29:50', '2019-01-11 20:29:50');
INSERT INTO `gen_member_wife` VALUES ('50', '58', '刘氏', '', null, '', '肖屯', '30', '2019-01-11 20:30:46', '2019-01-11 20:30:46');
INSERT INTO `gen_member_wife` VALUES ('51', '59', '赵氏', '', null, '', '宫庄', '30', '2019-01-11 20:31:23', '2019-01-11 20:31:23');
INSERT INTO `gen_member_wife` VALUES ('52', '60', '赵氏，沈氏', '', null, '', '', '30', '2019-01-11 20:32:45', '2019-01-11 20:32:45');
INSERT INTO `gen_member_wife` VALUES ('53', '61', '刘氏', '', null, '', '董王庄', '30', '2019-01-11 20:33:58', '2019-01-11 20:33:58');
INSERT INTO `gen_member_wife` VALUES ('54', '62', '郭氏', '', null, '', '马村', '30', '2019-01-11 20:34:58', '2019-01-19 11:00:42');
INSERT INTO `gen_member_wife` VALUES ('55', '63', '赵氏', '', null, '', '赵官目', '30', '2019-01-11 20:35:34', '2019-01-11 20:35:34');
INSERT INTO `gen_member_wife` VALUES ('56', '64', '李氏', '', null, '', '大连', '30', '2019-01-11 20:36:17', '2019-01-11 20:36:17');
INSERT INTO `gen_member_wife` VALUES ('57', '65', '吴氏', '', null, '', '吴堤口', '30', '2019-01-11 20:38:07', '2019-01-11 20:38:07');
INSERT INTO `gen_member_wife` VALUES ('58', '66', '郭氏', '', null, '', '马村', '30', '2019-01-11 20:38:57', '2019-01-11 20:38:57');
INSERT INTO `gen_member_wife` VALUES ('59', '67', '申氏', '', null, '', '申管目', '30', '2019-01-11 20:40:00', '2019-01-11 20:40:00');
INSERT INTO `gen_member_wife` VALUES ('60', '68', '王氏', '', null, '', '王楼', '30', '2019-01-11 20:40:43', '2019-01-11 20:40:43');
INSERT INTO `gen_member_wife` VALUES ('61', '69', '董氏', '', null, '', '阳谷', '30', '2019-01-11 20:41:39', '2019-01-11 20:41:39');
INSERT INTO `gen_member_wife` VALUES ('62', '70', '王氏', '', null, '', '王楼', '30', '2019-01-11 20:42:15', '2019-01-11 20:42:15');
INSERT INTO `gen_member_wife` VALUES ('63', '71', '德州', '', null, '', '德州', '30', '2019-01-11 20:43:14', '2019-01-11 20:43:14');
INSERT INTO `gen_member_wife` VALUES ('64', '72', '申氏', '', null, '', '申管目', '30', '2019-01-11 20:43:48', '2019-01-11 20:43:48');
INSERT INTO `gen_member_wife` VALUES ('65', '73', '刘氏', '', null, '', '董王庄', '30', '2019-01-11 20:44:35', '2019-01-11 20:44:35');
INSERT INTO `gen_member_wife` VALUES ('66', '74', '王氏', '', null, '', '马村', '30', '2019-01-11 20:45:20', '2019-01-11 20:45:20');
INSERT INTO `gen_member_wife` VALUES ('67', '75', '黄氏', '', null, '', '后街', '30', '2019-01-11 20:45:57', '2019-01-11 20:45:57');
INSERT INTO `gen_member_wife` VALUES ('68', '76', '杨氏', '', null, '', '河涯', '30', '2019-01-11 20:46:49', '2019-01-11 20:46:49');
INSERT INTO `gen_member_wife` VALUES ('69', '77', '郭氏', '', null, '', '西街', '30', '2019-01-11 20:47:35', '2019-01-11 20:47:35');
INSERT INTO `gen_member_wife` VALUES ('70', '78', '白氏', '', null, '', '西街', '30', '2019-01-11 20:48:30', '2019-01-11 20:48:30');
INSERT INTO `gen_member_wife` VALUES ('71', '79', '张氏', '', null, '', '', '30', '2019-01-11 20:49:18', '2019-01-11 20:49:18');
INSERT INTO `gen_member_wife` VALUES ('72', '80', '周氏', '', null, '', '', '30', '2019-01-11 20:49:55', '2019-01-11 20:49:55');
INSERT INTO `gen_member_wife` VALUES ('73', '82', '葛氏', '', null, '', '葛楼', '30', '2019-01-11 20:51:43', '2019-01-11 20:51:43');
INSERT INTO `gen_member_wife` VALUES ('74', '83', '郭氏', '', null, '', '马村', '30', '2019-01-11 20:52:12', '2019-01-11 20:52:12');
INSERT INTO `gen_member_wife` VALUES ('75', '84', '王氏', '', null, '', '王海', '30', '2019-01-11 20:52:54', '2019-01-11 20:52:54');
INSERT INTO `gen_member_wife` VALUES ('76', '85', '于氏', '', null, '', '南无村', '30', '2019-01-11 20:53:59', '2019-01-11 20:53:59');
INSERT INTO `gen_member_wife` VALUES ('77', '88', '刘氏', '', null, '', '宫庄', '30', '2019-01-18 19:16:24', '2019-01-18 19:16:24');
INSERT INTO `gen_member_wife` VALUES ('78', '89', '刘氏', '', null, '', '申官目', '30', '2019-01-18 19:17:25', '2019-01-18 19:17:25');
INSERT INTO `gen_member_wife` VALUES ('79', '90', '杨氏', '', null, '', '河涯', '30', '2019-01-20 09:43:01', '2019-01-20 09:43:01');
INSERT INTO `gen_member_wife` VALUES ('80', '91', '耿氏', '', null, '', '耿楼', '30', '2019-01-20 09:45:30', '2019-01-20 09:45:30');
INSERT INTO `gen_member_wife` VALUES ('81', '92', '？？', '', null, '', '？？', '30', '2019-01-20 09:47:25', '2019-01-20 09:50:02');
INSERT INTO `gen_member_wife` VALUES ('82', '93', '孙氏', '', null, '', '？？', '30', '2019-01-20 09:49:41', '2019-01-20 09:49:41');
INSERT INTO `gen_member_wife` VALUES ('83', '94', '', '', null, '', '', '30', '2019-01-20 09:51:22', '2019-01-20 09:51:22');
INSERT INTO `gen_member_wife` VALUES ('84', '95', '？氏', '', null, '', '', '30', '2019-01-20 09:53:31', '2019-01-20 09:53:31');
INSERT INTO `gen_member_wife` VALUES ('85', '99', '刘氏', '', null, '', '东头', '30', '2019-01-20 09:58:08', '2019-01-20 09:58:08');
INSERT INTO `gen_member_wife` VALUES ('86', '100', '？氏', '', null, '', '北安头', '30', '2019-01-20 10:00:19', '2019-01-20 10:00:19');
INSERT INTO `gen_member_wife` VALUES ('87', '101', '？氏', '', null, '', '房庄', '30', '2019-01-20 10:02:14', '2019-01-20 10:02:14');
INSERT INTO `gen_member_wife` VALUES ('88', '102', '刘氏', '', null, '', '东头', '30', '2019-01-20 10:03:52', '2019-01-20 10:03:52');
INSERT INTO `gen_member_wife` VALUES ('89', '104', '张氏', '', null, '', '张屯', '30', '2019-01-20 10:05:51', '2019-01-20 10:05:51');
INSERT INTO `gen_member_wife` VALUES ('90', '105', '苏焕英', '', null, '', '西？', '30', '2019-01-20 10:09:02', '2019-02-20 15:32:35');
INSERT INTO `gen_member_wife` VALUES ('91', '106', '吴东芳，师敏娟', '', null, '', '吴堤口', '30', '2019-01-20 10:10:36', '2019-02-20 15:33:46');
INSERT INTO `gen_member_wife` VALUES ('92', '107', '刘氏', '', null, '', '宫庄', '30', '2019-01-20 10:14:29', '2019-01-20 10:14:29');
INSERT INTO `gen_member_wife` VALUES ('93', '108', '段氏', '', null, '', '东头', '30', '2019-01-20 10:15:55', '2019-02-18 14:45:51');
INSERT INTO `gen_member_wife` VALUES ('94', '109', '耿氏', '', null, '', '', '30', '2019-01-20 10:17:09', '2019-01-20 10:17:09');
INSERT INTO `gen_member_wife` VALUES ('95', '110', '赵氏', '', null, '', '', '30', '2019-01-20 10:18:23', '2019-01-20 10:18:23');
INSERT INTO `gen_member_wife` VALUES ('96', '111', '刘氏', '', null, '', '', '30', '2019-01-20 10:19:42', '2019-01-20 10:19:42');
INSERT INTO `gen_member_wife` VALUES ('97', '115', '刘氏', '', null, '', '前街', '30', '2019-01-20 10:27:02', '2019-01-20 10:27:02');
INSERT INTO `gen_member_wife` VALUES ('98', '117', '曹氏', '', null, '', '马村', '30', '2019-01-20 10:31:08', '2019-01-20 10:31:08');
INSERT INTO `gen_member_wife` VALUES ('99', '119', '曹氏', '', null, '', '马村', '30', '2019-01-20 10:34:00', '2019-01-20 10:34:00');
INSERT INTO `gen_member_wife` VALUES ('100', '120', '夏氏', '', null, '', '', '30', '2019-01-20 10:34:51', '2019-01-20 10:34:51');
INSERT INTO `gen_member_wife` VALUES ('101', '122', '耿氏', '', null, '', '耿楼', '30', '2019-01-20 10:36:39', '2019-01-20 10:36:39');
INSERT INTO `gen_member_wife` VALUES ('102', '123', '？氏', '', null, '', '', '30', '2019-01-20 10:38:05', '2019-01-20 10:38:05');
INSERT INTO `gen_member_wife` VALUES ('103', '124', '马氏', '', null, '', '', '30', '2019-01-20 10:39:11', '2019-01-20 10:39:11');
INSERT INTO `gen_member_wife` VALUES ('104', '125', '刘氏', '', null, '', '济宁', '30', '2019-01-20 10:41:21', '2019-01-20 10:41:21');
INSERT INTO `gen_member_wife` VALUES ('105', '129', '窦氏', '', null, '', '', '30', '2019-01-20 10:49:53', '2019-01-20 10:49:53');
INSERT INTO `gen_member_wife` VALUES ('106', '130', '王氏', '', null, '', '王海', '30', '2019-01-20 10:54:00', '2019-02-17 20:02:53');
INSERT INTO `gen_member_wife` VALUES ('107', '131', '？氏', '', null, '', '', '30', '2019-01-20 10:55:02', '2019-01-20 10:55:02');
INSERT INTO `gen_member_wife` VALUES ('108', '132', '？氏', '', null, '', '厚街', '30', '2019-01-20 10:56:07', '2019-01-20 10:56:07');
INSERT INTO `gen_member_wife` VALUES ('109', '133', '王氏', '', null, '', '霍庄', '30', '2019-01-20 10:58:11', '2019-01-20 10:58:57');
INSERT INTO `gen_member_wife` VALUES ('110', '134', '张氏', '', null, '', '霍庄', '30', '2019-01-20 10:58:11', '2019-02-17 20:02:08');
INSERT INTO `gen_member_wife` VALUES ('111', '135', '杜氏', '', null, '', '', '30', '2019-01-20 11:00:15', '2019-01-24 22:19:18');
INSERT INTO `gen_member_wife` VALUES ('112', '136', '王氏', '', null, '', '', '30', '2019-01-20 11:01:09', '2019-01-20 11:01:09');
INSERT INTO `gen_member_wife` VALUES ('113', '137', '秦氏，刘氏', '', null, '', '东沈庄，盛屯', '30', '2019-01-20 11:04:58', '2019-01-20 11:04:58');
INSERT INTO `gen_member_wife` VALUES ('114', '138', '赵氏', '', null, '', '宫庄', '30', '2019-01-20 11:10:56', '2019-01-20 11:10:56');
INSERT INTO `gen_member_wife` VALUES ('115', '139', '逯氏', '', null, '', '杨村', '30', '2019-01-20 11:12:13', '2019-02-17 20:05:06');
INSERT INTO `gen_member_wife` VALUES ('116', '141', '申氏', '', null, '', '申官目', '30', '2019-01-20 11:17:02', '2019-01-20 11:17:02');
INSERT INTO `gen_member_wife` VALUES ('117', '142', '王氏', '', null, '', '王华', '30', '2019-01-20 11:18:19', '2019-01-20 11:18:19');
INSERT INTO `gen_member_wife` VALUES ('118', '143', '于氏', '', null, '', '于楼', '30', '2019-01-20 11:19:51', '2019-01-20 11:19:51');
INSERT INTO `gen_member_wife` VALUES ('120', '145', '杜氏', '', null, '', '', '30', '2019-01-20 11:29:13', '2019-01-20 11:29:13');
INSERT INTO `gen_member_wife` VALUES ('121', '146', '王氏', '', null, '', '王华', '30', '2019-01-20 11:31:01', '2019-01-20 11:31:01');
INSERT INTO `gen_member_wife` VALUES ('122', '147', '王氏', '', null, '', '王华', '30', '2019-01-20 11:32:46', '2019-01-20 11:32:46');
INSERT INTO `gen_member_wife` VALUES ('123', '148', '曹氏', '', null, '', '曹楼', '30', '2019-01-20 11:34:48', '2019-01-20 11:34:48');
INSERT INTO `gen_member_wife` VALUES ('124', '149', '？氏', '', null, '', '马村', '30', '2019-01-20 11:36:13', '2019-01-20 11:36:13');
INSERT INTO `gen_member_wife` VALUES ('126', '151', '录氏', '', null, '', '杨村', '30', '2019-01-23 15:43:56', '2019-01-23 15:43:56');
INSERT INTO `gen_member_wife` VALUES ('127', '152', '刘氏', '', null, '', '刘庄', '30', '2019-01-23 15:45:03', '2019-01-23 15:45:03');
INSERT INTO `gen_member_wife` VALUES ('128', '153', '王氏', '', null, '', '王华', '30', '2019-01-23 15:52:05', '2019-01-24 17:41:33');
INSERT INTO `gen_member_wife` VALUES ('129', '154', '曹氏', '', null, '', '曹楼', '30', '2019-01-23 15:54:31', '2019-01-23 15:54:31');
INSERT INTO `gen_member_wife` VALUES ('130', '155', '？氏', '', null, '', '？屯', '30', '2019-01-23 15:56:01', '2019-01-25 20:14:31');
INSERT INTO `gen_member_wife` VALUES ('131', '156', '吕氏', '', null, '', '马村', '30', '2019-01-23 15:57:05', '2019-01-23 15:57:05');
INSERT INTO `gen_member_wife` VALUES ('132', '157', '刘氏', '', null, '', '前街', '30', '2019-01-23 15:58:25', '2019-01-23 15:58:25');
INSERT INTO `gen_member_wife` VALUES ('133', '158', '寇氏', '', null, '', '？庄', '30', '2019-01-23 16:00:31', '2019-02-18 19:50:25');
INSERT INTO `gen_member_wife` VALUES ('134', '159', '王氏', '', null, '', '王海', '30', '2019-01-23 16:01:15', '2019-01-23 16:01:15');
INSERT INTO `gen_member_wife` VALUES ('135', '160', '吕氏', '', null, '', '马村', '30', '2019-01-23 16:03:04', '2019-01-23 16:03:04');
INSERT INTO `gen_member_wife` VALUES ('136', '161', '李氏', '', null, '', '东头', '30', '2019-01-23 16:04:21', '2019-01-23 16:04:21');
INSERT INTO `gen_member_wife` VALUES ('137', '162', '岳氏', '', null, '', '王海', '30', '2019-01-23 16:05:18', '2019-02-18 19:47:12');
INSERT INTO `gen_member_wife` VALUES ('138', '163', '耿氏', '', null, '', '后耿家', '30', '2019-01-23 16:06:25', '2019-01-23 16:06:25');
INSERT INTO `gen_member_wife` VALUES ('139', '164', '刘氏', '', null, '', '前街', '30', '2019-01-23 16:07:18', '2019-01-23 17:06:40');
INSERT INTO `gen_member_wife` VALUES ('140', '165', '马氏', '', null, '', '董王庄', '30', '2019-01-23 16:08:45', '2019-01-23 16:08:45');
INSERT INTO `gen_member_wife` VALUES ('141', '166', '夏氏', '', null, '', '后街', '30', '2019-01-23 16:14:13', '2019-02-18 19:58:09');
INSERT INTO `gen_member_wife` VALUES ('142', '167', '李氏', '', null, '', '四川', '30', '2019-01-23 16:15:20', '2019-01-24 19:54:44');
INSERT INTO `gen_member_wife` VALUES ('143', '168', '白氏', '', null, '', '窦村', '30', '2019-01-23 16:17:32', '2019-01-24 19:53:56');
INSERT INTO `gen_member_wife` VALUES ('144', '169', '王氏', '', null, '', '王华', '30', '2019-01-23 16:18:20', '2019-01-23 16:18:20');
INSERT INTO `gen_member_wife` VALUES ('145', '171', '葛氏', '', null, '', '葛楼', '30', '2019-01-23 16:22:38', '2019-01-23 16:22:38');
INSERT INTO `gen_member_wife` VALUES ('146', '172', '白氏', '', null, '', '西头', '30', '2019-01-23 16:23:25', '2019-01-23 16:23:25');
INSERT INTO `gen_member_wife` VALUES ('147', '173', '张氏', '', null, '', '', '30', '2019-01-23 16:25:11', '2019-01-24 19:56:59');
INSERT INTO `gen_member_wife` VALUES ('148', '174', '王氏', '', null, '', '王海', '30', '2019-01-23 16:26:01', '2019-02-18 17:46:01');
INSERT INTO `gen_member_wife` VALUES ('149', '175', '黄氏', '', null, '', '', '30', '2019-01-23 16:28:04', '2019-01-23 17:20:34');
INSERT INTO `gen_member_wife` VALUES ('150', '176', '董氏', '', null, '', '中町', '30', '2019-01-23 16:42:05', '2019-01-23 16:42:05');
INSERT INTO `gen_member_wife` VALUES ('151', '177', '？氏', '', null, '', '东头', '30', '2019-01-23 16:43:16', '2019-01-23 16:43:16');
INSERT INTO `gen_member_wife` VALUES ('152', '178', '刘氏', '', null, '', '', '30', '2019-01-23 16:43:55', '2019-01-23 16:43:55');
INSERT INTO `gen_member_wife` VALUES ('153', '179', '嵇氏', '', null, '', '', '30', '2019-01-23 16:45:11', '2019-01-23 16:45:11');
INSERT INTO `gen_member_wife` VALUES ('154', '180', '张氏', '', null, '', '马寨', '30', '2019-01-23 16:45:58', '2019-01-24 19:56:28');
INSERT INTO `gen_member_wife` VALUES ('155', '181', '郭氏', '', null, '', '马村', '30', '2019-01-23 16:46:41', '2019-01-23 16:46:41');
INSERT INTO `gen_member_wife` VALUES ('156', '182', '吕氏', '', null, '', '马村', '30', '2019-01-23 16:47:29', '2019-01-23 16:47:29');
INSERT INTO `gen_member_wife` VALUES ('157', '183', '马氏', '', null, '', '宫庄', '30', '2019-01-23 16:48:22', '2019-01-23 16:48:22');
INSERT INTO `gen_member_wife` VALUES ('158', '184', '刘氏', '', null, '', '宫庄', '30', '2019-01-23 16:50:06', '2019-01-23 16:50:06');
INSERT INTO `gen_member_wife` VALUES ('159', '185', '牛氏', '', null, '', '杨村', '30', '2019-01-23 16:51:00', '2019-01-23 16:51:00');
INSERT INTO `gen_member_wife` VALUES ('160', '186', '杨氏', '', null, '', '', '30', '2019-01-23 16:52:38', '2019-01-23 16:52:38');
INSERT INTO `gen_member_wife` VALUES ('161', '187', '吕氏', '', null, '', '吕村', '30', '2019-01-23 16:53:28', '2019-01-23 16:53:28');
INSERT INTO `gen_member_wife` VALUES ('162', '188', '沈氏', '', null, '', '沈庄', '30', '2019-01-23 16:54:17', '2019-01-23 17:51:36');
INSERT INTO `gen_member_wife` VALUES ('163', '189', '夏氏', '', null, '', '后街', '30', '2019-01-23 16:55:05', '2019-01-23 16:55:05');
INSERT INTO `gen_member_wife` VALUES ('164', '190', '曲氏', '', null, '', '四川', '30', '2019-01-23 16:56:33', '2019-01-23 17:31:45');
INSERT INTO `gen_member_wife` VALUES ('165', '191', '贾氏', '', null, '', '付村', '30', '2019-01-23 16:57:57', '2019-01-23 17:30:25');
INSERT INTO `gen_member_wife` VALUES ('166', '192', '？？', '', null, '', '？？', '30', '2019-01-23 16:58:42', '2019-01-23 16:58:42');
INSERT INTO `gen_member_wife` VALUES ('167', '193', '', '', null, '', '', '30', '2019-01-23 16:59:11', '2019-01-23 16:59:11');
INSERT INTO `gen_member_wife` VALUES ('168', '194', '孙氏', '', null, '', '', '30', '2019-01-23 17:00:04', '2019-01-23 17:00:04');
INSERT INTO `gen_member_wife` VALUES ('169', '197', '赵氏', '', null, '', '南无村', '30', '2019-01-23 17:02:27', '2019-02-18 18:13:54');
INSERT INTO `gen_member_wife` VALUES ('170', '198', '', '', null, '', '', '30', '2019-01-23 17:03:16', '2019-01-23 17:03:16');
INSERT INTO `gen_member_wife` VALUES ('171', '199', '王氏', '', null, '', '董王庄', '30', '2019-01-23 17:04:17', '2019-01-23 17:04:17');
INSERT INTO `gen_member_wife` VALUES ('172', '200', '沈氏', '', null, '', '沈庄', '30', '2019-01-23 17:05:13', '2019-01-23 17:05:13');
INSERT INTO `gen_member_wife` VALUES ('173', '202', '白红杰', '', null, '', '大索庄西头', '30', '2019-01-23 17:07:18', '2019-02-17 20:42:00');
INSERT INTO `gen_member_wife` VALUES ('174', '203', '尹明燕', '', null, '', '北街', '30', '2019-01-23 17:08:20', '2019-02-17 20:43:12');
INSERT INTO `gen_member_wife` VALUES ('175', '204', '白氏', '', null, '', '河西', '30', '2019-01-23 17:09:08', '2019-01-23 17:09:08');
INSERT INTO `gen_member_wife` VALUES ('176', '205', '张氏', '', null, '', '', '30', '2019-01-23 17:09:46', '2019-01-23 17:09:46');
INSERT INTO `gen_member_wife` VALUES ('177', '206', '耿氏', '', null, '', '耿楼', '30', '2019-01-23 17:10:40', '2019-01-23 17:10:40');
INSERT INTO `gen_member_wife` VALUES ('178', '207', '王氏', '', null, '', '中街', '30', '2019-01-23 17:11:51', '2019-01-23 17:11:51');
INSERT INTO `gen_member_wife` VALUES ('179', '208', '', '', null, '', '', '30', '2019-01-23 17:12:32', '2019-01-23 17:12:32');
INSERT INTO `gen_member_wife` VALUES ('180', '211', '', '', null, '', '', '30', '2019-01-23 17:14:00', '2019-01-23 17:14:00');
INSERT INTO `gen_member_wife` VALUES ('181', '212', '赵氏', '', null, '', '宫庄', '30', '2019-01-23 17:15:02', '2019-01-23 17:15:02');
INSERT INTO `gen_member_wife` VALUES ('182', '213', '康氏', '', null, '', '', '30', '2019-01-23 17:15:39', '2019-01-23 17:32:43');
INSERT INTO `gen_member_wife` VALUES ('183', '215', '沈氏', '', null, '', '南沈庄', '30', '2019-01-23 17:17:13', '2019-01-23 17:17:13');
INSERT INTO `gen_member_wife` VALUES ('184', '216', '王氏', '', null, '', '', '30', '2019-01-23 17:18:04', '2019-01-23 17:18:04');
INSERT INTO `gen_member_wife` VALUES ('185', '217', '刘银敏', '', null, '', '南街', '30', '2019-01-23 17:19:13', '2019-02-18 17:53:04');
INSERT INTO `gen_member_wife` VALUES ('186', '221', '夏氏', '', null, '', '后街', '30', '2019-01-23 17:33:44', '2019-01-23 17:33:44');
INSERT INTO `gen_member_wife` VALUES ('187', '223', '夏氏', '', null, '', '后街', '30', '2019-01-23 17:34:59', '2019-01-23 17:34:59');
INSERT INTO `gen_member_wife` VALUES ('188', '224', '', '', null, '', '', '30', '2019-01-23 17:35:44', '2019-01-23 17:35:44');
INSERT INTO `gen_member_wife` VALUES ('189', '226', '赵氏', '', null, '', '宫庄', '30', '2019-01-23 17:36:54', '2019-01-23 17:36:54');
INSERT INTO `gen_member_wife` VALUES ('190', '227', '', '', null, '', '', '30', '2019-01-23 17:37:31', '2019-01-24 20:55:00');
INSERT INTO `gen_member_wife` VALUES ('191', '228', '郭氏', '', null, '', '', '30', '2019-01-23 17:38:02', '2019-01-23 17:38:02');
INSERT INTO `gen_member_wife` VALUES ('192', '229', '王氏', '', null, '', '', '30', '2019-01-23 17:38:39', '2019-02-23 15:28:46');
INSERT INTO `gen_member_wife` VALUES ('193', '230', '刘书霞', '', null, '', '索庄', '30', '2019-01-23 17:39:22', '2019-02-18 19:39:27');
INSERT INTO `gen_member_wife` VALUES ('194', '231', '蔡艳丽', '', null, '', '', '30', '2019-01-23 17:40:02', '2019-02-18 19:40:48');
INSERT INTO `gen_member_wife` VALUES ('195', '232', '段氏', '', null, '', '东头', '30', '2019-01-23 17:42:37', '2019-02-17 20:10:30');
INSERT INTO `gen_member_wife` VALUES ('196', '234', '', '', null, '', '', '30', '2019-01-23 17:43:50', '2019-01-23 17:43:50');
INSERT INTO `gen_member_wife` VALUES ('197', '238', '王氏', '', null, '', '', '30', '2019-01-23 17:47:22', '2019-01-23 17:47:22');
INSERT INTO `gen_member_wife` VALUES ('198', '239', '吴氏', '', null, '', '', '30', '2019-01-23 17:48:14', '2019-01-23 17:48:14');
INSERT INTO `gen_member_wife` VALUES ('199', '248', '蒋氏', '', null, '', '', '30', '2019-01-23 18:03:38', '2019-01-23 18:09:09');
INSERT INTO `gen_member_wife` VALUES ('200', '250', '张氏', '', null, '', '', '30', '2019-01-23 18:04:50', '2019-01-23 18:10:21');
INSERT INTO `gen_member_wife` VALUES ('201', '252', '刘素芬', '', null, '', '北刘庄', '30', '2019-01-23 18:05:41', '2019-02-17 20:41:11');
INSERT INTO `gen_member_wife` VALUES ('202', '260', '朱氏', '', null, '', '', '30', '2019-01-24 20:09:24', '2019-01-24 20:09:24');
INSERT INTO `gen_member_wife` VALUES ('203', '261', '潘氏', '', null, '', '', '30', '2019-01-24 20:10:28', '2019-01-24 20:10:28');
INSERT INTO `gen_member_wife` VALUES ('204', '262', '李氏', '', null, '', '', '30', '2019-01-24 20:11:08', '2019-01-24 20:11:08');
INSERT INTO `gen_member_wife` VALUES ('205', '263', '王氏', '', null, '', '', '30', '2019-01-24 20:12:24', '2019-01-24 20:12:24');
INSERT INTO `gen_member_wife` VALUES ('206', '264', '赵氏', '', null, '', '', '30', '2019-01-24 20:13:17', '2019-01-24 20:13:17');
INSERT INTO `gen_member_wife` VALUES ('207', '265', '王氏', '', null, '', '', '30', '2019-01-24 20:14:25', '2019-01-24 20:14:25');
INSERT INTO `gen_member_wife` VALUES ('208', '266', '王氏，沈氏', '', null, '', '', '30', '2019-01-24 20:15:13', '2019-01-24 20:15:13');
INSERT INTO `gen_member_wife` VALUES ('209', '267', '王氏', '', null, '', '', '30', '2019-01-24 20:15:52', '2019-01-24 20:15:52');
INSERT INTO `gen_member_wife` VALUES ('210', '268', '沈氏', '', null, '', '', '30', '2019-01-24 20:16:23', '2019-01-24 20:16:23');
INSERT INTO `gen_member_wife` VALUES ('211', '269', '赵氏', '', null, '', '', '30', '2019-01-24 20:17:27', '2019-01-24 20:17:27');
INSERT INTO `gen_member_wife` VALUES ('212', '271', '赵氏', '', null, '', '', '30', '2019-01-24 20:18:49', '2019-01-24 20:18:49');
INSERT INTO `gen_member_wife` VALUES ('213', '273', '马氏', '', null, '', '宫庄', '30', '2019-01-24 20:20:24', '2019-01-24 20:20:24');
INSERT INTO `gen_member_wife` VALUES ('214', '275', '郝氏', '', null, '', '东王庄', '30', '2019-01-24 20:21:43', '2019-01-24 20:21:43');
INSERT INTO `gen_member_wife` VALUES ('215', '276', '刘氏', '', null, '', '', '30', '2019-01-24 20:22:55', '2019-01-24 20:23:28');
INSERT INTO `gen_member_wife` VALUES ('216', '277', '乔氏', '', null, '', '后街', '30', '2019-01-24 20:24:13', '2019-01-24 20:24:13');
INSERT INTO `gen_member_wife` VALUES ('217', '278', '王氏', '', null, '', '王华', '30', '2019-01-24 20:24:49', '2019-01-24 20:24:49');
INSERT INTO `gen_member_wife` VALUES ('218', '280', '任海红', '', null, '', '', '30', '2019-01-24 20:26:29', '2019-01-24 20:26:29');
INSERT INTO `gen_member_wife` VALUES ('219', '281', '白大华', '', null, '', '西头', '30', '2019-01-24 20:27:06', '2019-01-24 20:27:06');
INSERT INTO `gen_member_wife` VALUES ('220', '282', '蒋氏', '', null, '', '', '30', '2019-01-24 20:28:00', '2019-01-24 20:28:00');
INSERT INTO `gen_member_wife` VALUES ('221', '283', '刘氏', '', null, '', '', '30', '2019-01-24 20:28:38', '2019-01-24 20:28:38');
INSERT INTO `gen_member_wife` VALUES ('222', '284', '耿氏', '', null, '', '耿楼', '30', '2019-01-24 20:29:30', '2019-01-24 20:29:30');
INSERT INTO `gen_member_wife` VALUES ('223', '285', '周氏', '', null, '', '', '30', '2019-01-24 20:29:58', '2019-01-24 20:29:58');
INSERT INTO `gen_member_wife` VALUES ('224', '286', '刘瑞民', '', null, '', '东头', '30', '2019-01-24 20:30:50', '2019-01-24 20:30:50');
INSERT INTO `gen_member_wife` VALUES ('225', '288', '朱氏', '', null, '', '', '30', '2019-01-24 20:31:41', '2019-01-24 20:31:41');
INSERT INTO `gen_member_wife` VALUES ('226', '290', '吴氏', '', null, '', '', '30', '2019-01-24 20:33:23', '2019-01-24 20:33:23');
INSERT INTO `gen_member_wife` VALUES ('227', '291', '刘氏', '', null, '', '前街', '30', '2019-01-24 20:34:11', '2019-01-24 20:34:11');
INSERT INTO `gen_member_wife` VALUES ('228', '292', '罗氏', '', null, '', '罗庄', '30', '2019-01-24 20:34:56', '2019-01-24 20:34:56');
INSERT INTO `gen_member_wife` VALUES ('229', '293', '', '', null, '', '', '30', '2019-01-24 20:35:19', '2019-01-24 20:35:19');
INSERT INTO `gen_member_wife` VALUES ('230', '294', '王氏', '', null, '', '吴堤口', '30', '2019-01-24 20:36:08', '2019-01-24 20:36:08');
INSERT INTO `gen_member_wife` VALUES ('231', '298', '耿氏', '', null, '', '', '30', '2019-01-24 20:41:15', '2019-01-24 20:41:15');
INSERT INTO `gen_member_wife` VALUES ('232', '299', '杨氏', '', null, '', '', '30', '2019-01-24 20:42:16', '2019-01-24 20:42:16');
INSERT INTO `gen_member_wife` VALUES ('233', '300', '谷氏', '', null, '', '', '30', '2019-01-24 20:43:05', '2019-01-24 20:43:05');
INSERT INTO `gen_member_wife` VALUES ('234', '301', '贾氏', '', null, '', '张鲁西街', '30', '2019-01-24 20:44:29', '2019-01-24 20:44:29');
INSERT INTO `gen_member_wife` VALUES ('235', '303', '张氏', '', null, '', '马寨', '30', '2019-01-24 20:45:45', '2019-01-24 20:45:45');
INSERT INTO `gen_member_wife` VALUES ('236', '305', '会女', '', null, '', '安', '30', '2019-01-24 20:49:04', '2019-01-24 20:49:04');
INSERT INTO `gen_member_wife` VALUES ('237', '306', '陈氏', '', null, '', '', '30', '2019-01-24 20:50:02', '2019-01-24 20:50:02');
INSERT INTO `gen_member_wife` VALUES ('238', '308', '沈氏', '', null, '', '东沈庄', '30', '2019-01-24 20:50:58', '2019-01-24 20:50:58');
INSERT INTO `gen_member_wife` VALUES ('239', '309', '张凤娟', '', null, '', '', '30', '2019-01-24 20:51:38', '2019-02-18 14:26:46');
INSERT INTO `gen_member_wife` VALUES ('240', '313', '石氏，赵氏', '', null, '', '占海，南无村', '30', '2019-01-24 21:00:58', '2019-01-24 21:00:58');
INSERT INTO `gen_member_wife` VALUES ('241', '314', '吕氏，刘氏，赵氏', '', null, '', '吕村，李院，尧舜', '30', '2019-01-24 21:03:28', '2019-01-24 21:03:28');
INSERT INTO `gen_member_wife` VALUES ('242', '316', '魏氏', '', null, '', '孙二庄', '30', '2019-01-24 21:04:50', '2019-01-24 21:04:50');
INSERT INTO `gen_member_wife` VALUES ('243', '317', '崔氏', '', null, '', '燕店', '30', '2019-01-24 21:08:41', '2019-01-24 21:08:41');
INSERT INTO `gen_member_wife` VALUES ('244', '318', '郝氏', '', null, '', '马寨', '30', '2019-01-24 21:09:09', '2019-01-24 21:09:09');
INSERT INTO `gen_member_wife` VALUES ('245', '319', '赵氏', '', null, '', '赵官目', '30', '2019-01-24 21:09:52', '2019-02-19 09:46:17');
INSERT INTO `gen_member_wife` VALUES ('246', '321', '黄氏', '', null, '', '后街', '30', '2019-01-24 21:11:41', '2019-01-24 21:11:41');
INSERT INTO `gen_member_wife` VALUES ('247', '322', '王氏', '', null, '', '南安头', '30', '2019-01-24 21:12:56', '2019-01-24 21:12:56');
INSERT INTO `gen_member_wife` VALUES ('248', '324', '秦氏', '', null, '', '东沈庄', '30', '2019-01-24 21:16:19', '2019-01-24 21:16:19');
INSERT INTO `gen_member_wife` VALUES ('249', '325', '李氏', '', null, '', '四川', '30', '2019-01-24 21:17:12', '2019-01-24 21:17:12');
INSERT INTO `gen_member_wife` VALUES ('250', '326', '王随英', '', null, '', '', '30', '2019-01-24 21:18:29', '2019-02-19 09:36:01');
INSERT INTO `gen_member_wife` VALUES ('251', '329', '熊氏', '', null, '', '四川', '30', '2019-01-24 21:21:12', '2019-01-24 21:21:12');
INSERT INTO `gen_member_wife` VALUES ('252', '331', '王氏', '', null, '', '东北', '30', '2019-01-24 21:22:54', '2019-01-24 21:22:54');
INSERT INTO `gen_member_wife` VALUES ('253', '332', '陈氏', '', null, '', '广西', '30', '2019-01-24 21:23:31', '2019-01-24 21:23:31');
INSERT INTO `gen_member_wife` VALUES ('254', '333', '', '', null, '', '', '30', '2019-01-24 21:24:01', '2019-01-24 21:24:01');
INSERT INTO `gen_member_wife` VALUES ('255', '334', '李氏', '', null, '', '云南', '30', '2019-01-24 21:24:41', '2019-01-24 21:24:41');
INSERT INTO `gen_member_wife` VALUES ('256', '335', '刘氏', '', null, '', '东头', '30', '2019-01-24 21:25:30', '2019-01-24 21:25:30');
INSERT INTO `gen_member_wife` VALUES ('257', '337', '耿凤霞', '', null, '', '耿楼', '30', '2019-01-24 21:26:30', '2019-02-23 15:25:17');
INSERT INTO `gen_member_wife` VALUES ('258', '339', '刘氏', '', null, '', '宫庄', '30', '2019-01-24 21:28:27', '2019-01-24 21:28:27');
INSERT INTO `gen_member_wife` VALUES ('259', '340', '山氏', '', null, '', '山堂', '30', '2019-01-24 21:29:20', '2019-01-24 21:29:20');
INSERT INTO `gen_member_wife` VALUES ('260', '342', '耿氏', '', null, '', '耿楼', '30', '2019-01-24 21:30:33', '2019-01-24 21:30:33');
INSERT INTO `gen_member_wife` VALUES ('261', '343', '康氏', '', null, '', '康庄', '30', '2019-01-24 21:31:33', '2019-01-24 21:31:33');
INSERT INTO `gen_member_wife` VALUES ('262', '345', '耿利霞', '', null, '', '耿楼', '30', '2019-01-24 21:32:51', '2019-02-19 09:36:31');
INSERT INTO `gen_member_wife` VALUES ('263', '352', '孙氏', '', null, '', '于楼', '30', '2019-01-24 21:36:19', '2019-01-24 21:36:19');
INSERT INTO `gen_member_wife` VALUES ('264', '353', '孙氏', '', null, '', '临沂沂水', '30', '2019-01-24 21:37:49', '2019-01-24 22:10:19');
INSERT INTO `gen_member_wife` VALUES ('265', '354', '王氏', '', null, '', '王海', '30', '2019-01-25 20:16:44', '2019-01-25 20:16:44');
INSERT INTO `gen_member_wife` VALUES ('266', '355', '王氏', '', null, '', '王海', '30', '2019-01-25 20:16:54', '2019-01-25 20:16:54');
INSERT INTO `gen_member_wife` VALUES ('267', '356', '王氏', '', null, '', '王海', '30', '2019-01-25 20:16:54', '2019-01-25 20:16:54');
INSERT INTO `gen_member_wife` VALUES ('268', '360', '沈氏', '', null, '', '', '30', '2019-01-25 21:31:29', '2019-01-25 21:31:29');
INSERT INTO `gen_member_wife` VALUES ('269', '361', '蒋氏', '', null, '', '', '30', '2019-01-25 21:33:24', '2019-01-25 21:38:08');
INSERT INTO `gen_member_wife` VALUES ('270', '362', '耿氏', '', null, '', '耿楼', '30', '2019-01-25 21:34:22', '2019-01-25 21:34:22');
INSERT INTO `gen_member_wife` VALUES ('271', '363', '蔡氏', '', null, '', '中牟坛', '30', '2019-01-25 21:39:40', '2019-01-25 21:39:40');
INSERT INTO `gen_member_wife` VALUES ('272', '364', '贾氏', '', null, '', '', '30', '2019-01-25 21:40:17', '2019-01-25 21:40:17');
INSERT INTO `gen_member_wife` VALUES ('273', '365', '吴氏', '', null, '', '吴堤口', '30', '2019-01-25 21:40:52', '2019-01-25 21:41:59');
INSERT INTO `gen_member_wife` VALUES ('274', '366', '田氏', '', null, '', '田马古', '30', '2019-01-25 21:43:11', '2019-01-25 21:43:11');
INSERT INTO `gen_member_wife` VALUES ('275', '367', '李氏', '', null, '', '西头', '30', '2019-01-25 21:43:55', '2019-01-25 21:43:55');
INSERT INTO `gen_member_wife` VALUES ('276', '368', '赵氏', '', null, '', '赵官目', '30', '2019-01-25 21:45:17', '2019-01-25 21:45:17');
INSERT INTO `gen_member_wife` VALUES ('277', '369', '尤氏', '', null, '', '许村', '30', '2019-01-25 21:46:52', '2019-01-25 21:50:42');
INSERT INTO `gen_member_wife` VALUES ('278', '370', '吴氏', '', null, '', '吴堤口', '30', '2019-01-25 21:47:24', '2019-01-25 21:47:24');
INSERT INTO `gen_member_wife` VALUES ('279', '371', '赵氏', '', null, '', '宫庄', '30', '2019-01-25 21:48:13', '2019-01-25 21:48:13');
INSERT INTO `gen_member_wife` VALUES ('280', '374', '马氏', '', null, '', '董王庄', '30', '2019-01-25 21:52:36', '2019-01-25 21:52:36');
INSERT INTO `gen_member_wife` VALUES ('281', '375', '申氏', '', null, '', '申官目', '30', '2019-01-25 21:54:03', '2019-01-25 21:54:03');
INSERT INTO `gen_member_wife` VALUES ('282', '377', '沈氏', '', null, '', '东头', '30', '2019-01-25 21:55:21', '2019-01-25 21:55:21');
INSERT INTO `gen_member_wife` VALUES ('283', '378', '耿氏', '', null, '', '耿楼', '30', '2019-01-25 21:57:18', '2019-01-25 21:57:18');
INSERT INTO `gen_member_wife` VALUES ('284', '379', '刘氏，王氏', '', null, '', '宫庄，柿子园', '30', '2019-01-25 21:58:16', '2019-01-25 21:58:16');
INSERT INTO `gen_member_wife` VALUES ('285', '380', '张氏', '', null, '', '马寨', '30', '2019-01-25 21:59:02', '2019-01-25 21:59:02');
INSERT INTO `gen_member_wife` VALUES ('286', '381', '贾氏', '', null, '', '付庄', '30', '2019-01-25 21:59:37', '2019-01-25 21:59:37');
INSERT INTO `gen_member_wife` VALUES ('287', '382', '黄氏', '', null, '', '化庄', '30', '2019-01-25 22:01:24', '2019-01-25 22:01:24');
INSERT INTO `gen_member_wife` VALUES ('288', '383', '录氏', '', null, '', '杨村', '30', '2019-01-25 22:02:25', '2019-01-25 22:03:14');
INSERT INTO `gen_member_wife` VALUES ('289', '385', '蔡氏', '', null, '', '中牟坛', '30', '2019-01-25 22:05:06', '2019-01-25 22:05:06');
INSERT INTO `gen_member_wife` VALUES ('290', '386', '王氏', '', null, '', '柿子园', '30', '2019-01-25 22:06:06', '2019-01-25 22:06:36');
INSERT INTO `gen_member_wife` VALUES ('291', '387', '孙氏', '', null, '', '前街', '30', '2019-01-25 22:07:08', '2019-01-25 22:07:08');
INSERT INTO `gen_member_wife` VALUES ('292', '388', '王氏', '', null, '', '河崖', '30', '2019-01-25 22:08:20', '2019-01-25 22:08:20');
INSERT INTO `gen_member_wife` VALUES ('293', '389', '霍氏', '', null, '', '', '30', '2019-01-25 22:08:54', '2019-01-25 22:08:54');
INSERT INTO `gen_member_wife` VALUES ('294', '391', '张氏', '', null, '', '房庄', '30', '2019-01-25 22:10:42', '2019-01-25 22:10:42');
INSERT INTO `gen_member_wife` VALUES ('295', '392', '任氏', '', null, '', '南无村', '30', '2019-01-25 22:11:36', '2019-02-18 19:27:53');
INSERT INTO `gen_member_wife` VALUES ('296', '393', '沈氏', '', null, '', '南沈庄', '30', '2019-01-25 22:13:50', '2019-01-25 22:13:50');
INSERT INTO `gen_member_wife` VALUES ('297', '394', '赵氏', '', null, '', '宫庄', '30', '2019-01-25 22:15:37', '2019-01-25 22:20:32');
INSERT INTO `gen_member_wife` VALUES ('298', '395', '耿氏', '', null, '', '', '30', '2019-01-25 22:16:04', '2019-01-25 22:16:04');
INSERT INTO `gen_member_wife` VALUES ('299', '396', '刘氏', '', null, '', '刘庄', '30', '2019-01-25 22:17:01', '2019-02-18 19:46:27');
INSERT INTO `gen_member_wife` VALUES ('300', '397', '夏氏', '', null, '', '后街', '30', '2019-01-25 22:17:40', '2019-01-25 22:17:40');
INSERT INTO `gen_member_wife` VALUES ('301', '398', '陈氏', '', null, '', '河南', '30', '2019-01-25 22:19:43', '2019-01-25 22:19:43');
INSERT INTO `gen_member_wife` VALUES ('302', '403', '王氏', '', null, '', '', '30', '2019-01-25 22:23:42', '2019-01-25 22:23:42');
INSERT INTO `gen_member_wife` VALUES ('303', '404', '石氏，王氏', '', null, '', '', '30', '2019-01-25 22:24:29', '2019-01-29 09:15:25');
INSERT INTO `gen_member_wife` VALUES ('304', '405', '吴氏，宫氏', '', null, '', '', '30', '2019-01-25 22:25:24', '2019-01-25 22:25:24');
INSERT INTO `gen_member_wife` VALUES ('305', '406', '刘氏', '', null, '', '', '30', '2019-01-25 22:26:08', '2019-01-25 22:26:08');
INSERT INTO `gen_member_wife` VALUES ('306', '407', '孙氏', '', null, '', '', '30', '2019-01-25 22:26:38', '2019-01-25 22:26:38');
INSERT INTO `gen_member_wife` VALUES ('307', '408', '刘氏', '', null, '', '', '30', '2019-01-25 22:27:17', '2019-01-25 22:27:17');
INSERT INTO `gen_member_wife` VALUES ('308', '409', '王氏', '', null, '', '', '30', '2019-01-25 22:27:48', '2019-01-25 22:27:48');
INSERT INTO `gen_member_wife` VALUES ('309', '410', '吴氏', '', null, '', '吴堤口', '30', '2019-01-25 22:28:37', '2019-01-25 22:28:37');
INSERT INTO `gen_member_wife` VALUES ('310', '411', '申氏，郝氏', '', null, '', '申官目，马寨', '30', '2019-01-25 22:29:29', '2019-01-25 22:29:29');
INSERT INTO `gen_member_wife` VALUES ('311', '412', '马氏', '', null, '', '宫庄', '30', '2019-01-25 22:30:00', '2019-01-25 22:30:00');
INSERT INTO `gen_member_wife` VALUES ('312', '413', '耿氏', '', null, '', '耿楼', '30', '2019-01-25 22:30:26', '2019-01-25 22:30:26');
INSERT INTO `gen_member_wife` VALUES ('313', '414', '赵氏，郭氏', '', null, '', '赵官目，董王庄', '30', '2019-01-25 22:31:35', '2019-01-25 22:31:35');
INSERT INTO `gen_member_wife` VALUES ('314', '415', '申氏', '', null, '', '申官目', '30', '2019-01-25 22:32:29', '2019-01-25 22:32:29');
INSERT INTO `gen_member_wife` VALUES ('315', '416', '于氏', '', null, '', '于楼', '30', '2019-01-25 22:33:32', '2019-01-25 22:33:32');
INSERT INTO `gen_member_wife` VALUES ('316', '417', '王氏，张氏', '', null, '', '王华，张屯', '30', '2019-01-25 22:34:24', '2019-01-25 22:34:24');
INSERT INTO `gen_member_wife` VALUES ('317', '418', '田氏', '', null, '', '田马古', '30', '2019-01-25 22:34:58', '2019-01-25 22:34:58');
INSERT INTO `gen_member_wife` VALUES ('318', '419', '赵氏', '', null, '', '中牟坛', '30', '2019-01-25 22:35:31', '2019-01-25 22:35:31');
INSERT INTO `gen_member_wife` VALUES ('319', '420', '吕氏', '', null, '', '马村', '30', '2019-01-25 22:36:09', '2019-01-25 22:36:09');
INSERT INTO `gen_member_wife` VALUES ('320', '421', '耿氏', '', null, '', '耿楼', '30', '2019-01-25 22:36:38', '2019-01-25 22:36:38');
INSERT INTO `gen_member_wife` VALUES ('321', '422', '李氏，张氏', '', null, '', '', '30', '2019-01-25 22:37:23', '2019-01-25 22:37:23');
INSERT INTO `gen_member_wife` VALUES ('322', '423', '刘氏', '', null, '', '', '30', '2019-01-25 22:37:53', '2019-01-25 22:45:18');
INSERT INTO `gen_member_wife` VALUES ('323', '424', '朱氏', '', null, '', '朱庄', '30', '2019-01-25 22:38:35', '2019-01-25 22:38:35');
INSERT INTO `gen_member_wife` VALUES ('324', '425', '马氏', '', null, '', '董王庄', '30', '2019-01-25 22:39:21', '2019-01-25 22:39:21');
INSERT INTO `gen_member_wife` VALUES ('325', '426', '田敏', '', null, '', '', '30', '2019-01-25 22:39:52', '2019-01-25 22:39:52');
INSERT INTO `gen_member_wife` VALUES ('326', '427', '杨氏', '', null, '', '', '30', '2019-01-25 22:40:29', '2019-01-25 22:40:29');
INSERT INTO `gen_member_wife` VALUES ('327', '428', '张氏', '', null, '', '霍庄', '30', '2019-01-25 22:41:35', '2019-01-25 22:41:35');
INSERT INTO `gen_member_wife` VALUES ('328', '430', '赵氏', '', null, '', '毛发', '30', '2019-01-25 22:42:37', '2019-01-25 22:42:37');
INSERT INTO `gen_member_wife` VALUES ('329', '432', '沈氏', '', null, '', '北安头', '30', '2019-01-25 22:45:48', '2019-01-25 22:45:48');
INSERT INTO `gen_member_wife` VALUES ('330', '434', '夏氏', '', null, '', '后街', '30', '2019-01-25 22:47:06', '2019-01-25 22:47:06');
INSERT INTO `gen_member_wife` VALUES ('331', '435', '蒋氏', '', null, '', '王楼', '30', '2019-01-25 22:47:41', '2019-01-25 22:47:41');
INSERT INTO `gen_member_wife` VALUES ('332', '436', '黄氏', '', null, '', '后街', '30', '2019-01-25 22:48:13', '2019-01-25 22:48:13');
INSERT INTO `gen_member_wife` VALUES ('333', '438', '王氏', '', null, '', '', '30', '2019-01-25 22:49:26', '2019-01-25 22:49:26');
INSERT INTO `gen_member_wife` VALUES ('334', '440', '李氏', '', null, '', '', '30', '2019-01-25 22:50:05', '2019-01-25 22:50:05');
INSERT INTO `gen_member_wife` VALUES ('335', '441', '', '', null, '', '', '30', '2019-01-25 22:50:26', '2019-01-25 22:50:26');
INSERT INTO `gen_member_wife` VALUES ('336', '444', '王氏', '', null, '', '', '30', '2019-01-25 22:51:58', '2019-01-25 22:51:58');
INSERT INTO `gen_member_wife` VALUES ('337', '445', '王氏', '', null, '', '', '30', '2019-01-25 22:52:29', '2019-01-25 22:52:29');
INSERT INTO `gen_member_wife` VALUES ('338', '447', '王氏', '', null, '', '马村', '30', '2019-01-25 22:54:09', '2019-01-25 22:54:09');
INSERT INTO `gen_member_wife` VALUES ('339', '448', '张氏', '', null, '', '宫庄', '30', '2019-01-25 22:55:05', '2019-01-25 22:55:05');
INSERT INTO `gen_member_wife` VALUES ('340', '449', '于氏', '', null, '', '于楼', '30', '2019-01-25 22:55:43', '2019-01-25 22:55:43');
INSERT INTO `gen_member_wife` VALUES ('341', '450', '邓氏', '', null, '', '', '30', '2019-01-25 22:56:38', '2019-01-25 22:56:38');
INSERT INTO `gen_member_wife` VALUES ('342', '451', '刘氏', '', null, '', '', '30', '2019-01-25 22:59:01', '2019-01-25 22:59:01');
INSERT INTO `gen_member_wife` VALUES ('343', '454', '王氏', '', null, '', '吴堤口', '30', '2019-01-25 23:01:01', '2019-01-25 23:01:01');
INSERT INTO `gen_member_wife` VALUES ('344', '455', '沈氏', '', null, '', '东沈庄', '30', '2019-01-25 23:01:31', '2019-01-25 23:01:31');
INSERT INTO `gen_member_wife` VALUES ('345', '456', '段氏', '', null, '', '东头', '30', '2019-01-25 23:02:07', '2019-01-25 23:02:07');
INSERT INTO `gen_member_wife` VALUES ('346', '462', '郝氏', '', null, '', '', '30', '2019-01-29 15:18:43', '2019-01-29 15:18:43');
INSERT INTO `gen_member_wife` VALUES ('347', '463', '王氏', '', null, '', '王海', '30', '2019-01-29 15:20:00', '2019-01-29 15:20:00');
INSERT INTO `gen_member_wife` VALUES ('348', '464', '耿氏', '', null, '', '后耿家', '30', '2019-01-29 15:21:28', '2019-01-29 15:21:28');
INSERT INTO `gen_member_wife` VALUES ('349', '466', '安氏', '', null, '', '营头', '30', '2019-01-29 16:22:10', '2019-01-29 16:26:22');
INSERT INTO `gen_member_wife` VALUES ('350', '465', '赵氏', '', null, '', '赵官目', null, '2019-01-29 16:26:44', '2019-01-29 16:26:44');
INSERT INTO `gen_member_wife` VALUES ('351', '467', '王氏', '', null, '', '柿子园', '30', '2019-01-29 16:27:33', '2019-01-29 16:27:33');
INSERT INTO `gen_member_wife` VALUES ('352', '469', '张氏', '', null, '', '', '30', '2019-01-29 16:28:35', '2019-01-29 16:28:35');
INSERT INTO `gen_member_wife` VALUES ('353', '470', '黄氏', '', null, '', '', '30', '2019-01-29 16:32:03', '2019-01-29 16:32:03');
INSERT INTO `gen_member_wife` VALUES ('354', '474', '李氏', '', null, '', '后街', '30', '2019-01-29 16:33:58', '2019-01-29 16:33:58');
INSERT INTO `gen_member_wife` VALUES ('355', '476', '王氏，范氏', '', null, '', '前庄，南无村', '30', '2019-01-29 16:35:24', '2019-01-29 16:35:24');
INSERT INTO `gen_member_wife` VALUES ('356', '477', '刘氏，周氏', '', null, '', '刘庄，安庄', '30', '2019-01-29 16:36:23', '2019-01-29 16:36:23');
INSERT INTO `gen_member_wife` VALUES ('357', '478', '秦氏', '', null, '', '沈庄', '30', '2019-01-29 16:37:09', '2019-01-29 16:37:09');
INSERT INTO `gen_member_wife` VALUES ('358', '479', '孙氏', '', null, '', '葛楼', '30', '2019-01-29 16:38:04', '2019-01-29 16:38:04');
INSERT INTO `gen_member_wife` VALUES ('359', '480', '蔡氏', '', null, '', '中牟坛', '30', '2019-01-29 16:38:48', '2019-01-29 16:38:48');
INSERT INTO `gen_member_wife` VALUES ('360', '481', '', '', null, '', '', '30', '2019-01-29 16:39:26', '2019-01-29 16:39:26');
INSERT INTO `gen_member_wife` VALUES ('361', '482', '夏氏', '', null, '', '后街', '30', '2019-01-29 16:41:39', '2019-01-29 16:41:39');
INSERT INTO `gen_member_wife` VALUES ('362', '483', '李氏', '', null, '', '', '30', '2019-01-29 16:42:07', '2019-01-29 16:42:07');
INSERT INTO `gen_member_wife` VALUES ('363', '484', '王氏', '', null, '', '吴堤口', '30', '2019-01-29 16:42:43', '2019-01-29 16:42:43');
INSERT INTO `gen_member_wife` VALUES ('364', '485', '王氏', '', null, '', '王海', '30', '2019-01-29 16:43:37', '2019-01-29 16:43:37');
INSERT INTO `gen_member_wife` VALUES ('365', '486', '王玉华', '', null, '', '前街', '30', '2019-01-29 16:44:12', '2019-01-29 16:44:12');
INSERT INTO `gen_member_wife` VALUES ('366', '487', '王艳菊', '', null, '', '王海', '30', '2019-01-29 16:44:49', '2019-01-29 16:44:49');
INSERT INTO `gen_member_wife` VALUES ('367', '488', '葛氏', '', null, '', '葛楼', '30', '2019-01-29 16:45:41', '2019-01-29 16:45:41');
INSERT INTO `gen_member_wife` VALUES ('368', '490', '李氏', '', null, '', '', '30', '2019-01-29 16:47:36', '2019-01-29 16:47:36');
INSERT INTO `gen_member_wife` VALUES ('369', '491', '聂永梅', '', null, '', '', '30', '2019-01-29 16:48:22', '2019-01-29 16:48:22');
INSERT INTO `gen_member_wife` VALUES ('370', '492', '', '', null, '', '', '30', '2019-01-29 16:48:43', '2019-01-29 16:48:43');
INSERT INTO `gen_member_wife` VALUES ('371', '494', '刘瑞华', '', null, '', '东头', '30', '2019-01-29 16:50:04', '2019-01-29 16:50:04');
INSERT INTO `gen_member_wife` VALUES ('372', '495', '', '', null, '', '', '30', '2019-01-29 16:50:41', '2019-01-29 16:50:41');
INSERT INTO `gen_member_wife` VALUES ('373', '497', '耿氏', '', null, '', '耿楼', '30', '2019-01-29 16:51:50', '2019-02-23 16:52:41');
INSERT INTO `gen_member_wife` VALUES ('374', '501', '古玉凤', '', null, '', '', '30', '2019-01-29 16:54:50', '2019-01-29 16:54:50');
INSERT INTO `gen_member_wife` VALUES ('375', '504', '潘氏', '', null, '', '潘庄', '30', '2019-01-29 16:56:25', '2019-01-29 16:56:25');
INSERT INTO `gen_member_wife` VALUES ('376', '505', '白氏', '', null, '', '窦村', '30', '2019-01-29 16:57:47', '2019-01-29 16:57:47');
INSERT INTO `gen_member_wife` VALUES ('377', '506', '王氏，王氏', '', null, '', '王楼，前街', '30', '2019-01-29 16:58:33', '2019-01-29 16:58:33');
INSERT INTO `gen_member_wife` VALUES ('378', '507', '盛氏', '', null, '', '盛屯', '30', '2019-01-29 17:00:35', '2019-01-29 17:00:35');
INSERT INTO `gen_member_wife` VALUES ('379', '508', '秦氏，白氏', '', null, '', '沈庄，窦村', '30', '2019-01-29 17:01:17', '2019-01-29 17:01:17');
INSERT INTO `gen_member_wife` VALUES ('380', '510', '吴氏', '', null, '', '吴堤口', '30', '2019-01-29 17:03:07', '2019-01-29 17:03:07');
INSERT INTO `gen_member_wife` VALUES ('381', '511', '王氏', '', null, '', '', '30', '2019-01-29 17:03:42', '2019-01-29 17:03:42');
INSERT INTO `gen_member_wife` VALUES ('382', '512', '', '', null, '', '四川', '30', '2019-01-29 17:04:12', '2019-01-29 17:04:12');
INSERT INTO `gen_member_wife` VALUES ('383', '513', '秦氏', '', null, '', '沈庄', '30', '2019-01-29 17:28:10', '2019-01-29 17:28:26');
INSERT INTO `gen_member_wife` VALUES ('384', '514', '李氏', '', null, '', '李二庄', '30', '2019-01-29 17:29:01', '2019-01-29 17:29:01');
INSERT INTO `gen_member_wife` VALUES ('385', '515', '王氏', '', null, '', '王华', '30', '2019-01-29 17:29:32', '2019-01-29 17:29:32');
INSERT INTO `gen_member_wife` VALUES ('386', '516', '王氏', '', null, '', '王海', '30', '2019-01-29 17:30:25', '2019-01-29 17:30:25');
INSERT INTO `gen_member_wife` VALUES ('387', '517', '安二霞', '', null, '', '', '30', '2019-01-29 17:31:04', '2019-01-29 17:31:04');
INSERT INTO `gen_member_wife` VALUES ('388', '519', '张氏', '', null, '', '吴堤口', '30', '2019-01-29 17:32:10', '2019-01-29 17:32:10');
INSERT INTO `gen_member_wife` VALUES ('389', '520', '吴巧玉', '', null, '', '', '30', '2019-01-29 17:32:40', '2019-02-23 15:32:44');
INSERT INTO `gen_member_wife` VALUES ('390', '521', '古氏', '', null, '', '', '30', '2019-01-29 17:33:19', '2019-01-29 17:33:19');
INSERT INTO `gen_member_wife` VALUES ('391', '522', '沈银凤', '', null, '', '沈庄', '30', '2019-01-29 17:34:03', '2019-01-29 17:34:03');
INSERT INTO `gen_member_wife` VALUES ('392', '528', '李氏', '', null, '', '', '30', '2019-01-29 17:46:14', '2019-01-29 17:46:14');
INSERT INTO `gen_member_wife` VALUES ('393', '529', '魏氏', '', null, '', '马村', '30', '2019-01-29 17:46:40', '2019-01-29 17:46:40');
INSERT INTO `gen_member_wife` VALUES ('394', '530', '张氏', '', null, '', '', '30', '2019-01-29 17:47:04', '2019-01-29 17:47:04');
INSERT INTO `gen_member_wife` VALUES ('395', '531', '康氏', '', null, '', '', '30', '2019-01-29 17:47:51', '2019-01-29 17:47:51');
INSERT INTO `gen_member_wife` VALUES ('396', '532', '秦氏', '', null, '', '纸坊', '30', '2019-01-29 17:48:21', '2019-01-29 17:48:21');
INSERT INTO `gen_member_wife` VALUES ('397', '533', '周氏', '', null, '', '李院子', '30', '2019-01-29 17:53:22', '2019-01-29 17:53:22');
INSERT INTO `gen_member_wife` VALUES ('398', '534', '蒋氏', '', null, '', '王楼', '30', '2019-01-29 17:53:55', '2019-01-29 17:53:55');
INSERT INTO `gen_member_wife` VALUES ('399', '535', '耿氏', '', null, '', '耿楼', '30', '2019-01-29 17:57:48', '2019-01-29 17:57:48');
INSERT INTO `gen_member_wife` VALUES ('400', '536', '王氏', '', null, '', '南无村', '30', '2019-01-29 17:58:37', '2019-01-29 17:59:20');
INSERT INTO `gen_member_wife` VALUES ('401', '537', '刘氏', '', null, '', '刘庄', '30', '2019-01-29 17:59:59', '2019-01-29 17:59:59');
INSERT INTO `gen_member_wife` VALUES ('402', '538', '郭氏', '', null, '', '马村', '30', '2019-01-29 18:00:31', '2019-01-29 18:00:31');
INSERT INTO `gen_member_wife` VALUES ('403', '539', '苏氏', '', null, '', '西头', '30', '2019-01-29 18:01:26', '2019-01-29 18:01:26');
INSERT INTO `gen_member_wife` VALUES ('404', '540', '刘氏', '', null, '', '河西', '30', '2019-01-29 18:02:29', '2019-01-29 18:02:29');
INSERT INTO `gen_member_wife` VALUES ('405', '541', '刘三花', '', null, '', '刘庄', '30', '2019-01-29 18:03:33', '2019-01-29 18:03:33');
INSERT INTO `gen_member_wife` VALUES ('406', '542', '段月红', '', null, '', '东头', '30', '2019-01-29 18:04:30', '2019-02-18 14:24:03');
INSERT INTO `gen_member_wife` VALUES ('407', '543', '', '', null, '', '', '30', '2019-01-29 18:05:23', '2019-02-18 14:25:05');
INSERT INTO `gen_member_wife` VALUES ('408', '544', '尤章英', '', null, '', '', '30', '2019-01-29 18:06:06', '2019-02-18 20:23:40');
INSERT INTO `gen_member_wife` VALUES ('409', '545', '刘艳婷', '', null, '', '', '30', '2019-01-29 18:06:56', '2019-02-18 20:24:00');
INSERT INTO `gen_member_wife` VALUES ('410', '548', '孙贵芹', '', null, '', '孙庄', '30', '2019-01-29 18:10:34', '2019-02-25 17:34:36');
INSERT INTO `gen_member_wife` VALUES ('411', '553', '郭氏', '', null, '', '郭庄', '30', '2019-01-29 18:13:28', '2019-01-29 18:13:28');
INSERT INTO `gen_member_wife` VALUES ('412', '554', '白氏，刘氏', '', null, '', '西头，刘庄', '30', '2019-01-29 18:14:25', '2019-01-29 18:14:25');
INSERT INTO `gen_member_wife` VALUES ('413', '555', '王氏，张氏', '', null, '', '元潭，房庄', '30', '2019-01-29 18:15:38', '2019-01-29 18:15:38');
INSERT INTO `gen_member_wife` VALUES ('414', '556', '申氏，杨氏', '', null, '', '申官目，河崖', '30', '2019-01-29 18:16:21', '2019-01-29 18:16:21');
INSERT INTO `gen_member_wife` VALUES ('415', '557', '王氏，秦氏', '', null, '', '董王庄，纸坊', '30', '2019-01-29 18:17:45', '2019-01-29 18:17:45');
INSERT INTO `gen_member_wife` VALUES ('416', '558', '赵氏', '', null, '', '宫庄', '30', '2019-01-29 18:18:15', '2019-01-29 18:18:15');
INSERT INTO `gen_member_wife` VALUES ('417', '559', '刘氏', '', null, '', '刘庄', '30', '2019-01-29 18:18:44', '2019-02-18 14:32:53');
INSERT INTO `gen_member_wife` VALUES ('418', '560', '王氏', '', null, '', '王华', '30', '2019-01-29 18:19:15', '2019-01-29 18:19:15');
INSERT INTO `gen_member_wife` VALUES ('419', '561', '郭氏', '', null, '', '马村', '30', '2019-01-29 18:19:55', '2019-01-29 18:19:55');
INSERT INTO `gen_member_wife` VALUES ('420', '562', '白氏', '', null, '', '西头', '30', '2019-01-29 18:20:27', '2019-01-29 18:20:27');
INSERT INTO `gen_member_wife` VALUES ('421', '563', '申氏', '', null, '', '申官目', '30', '2019-01-29 18:22:28', '2019-01-29 18:22:28');
INSERT INTO `gen_member_wife` VALUES ('422', '564', '刘氏', '', null, '', '宫庄', '30', '2019-01-29 18:22:59', '2019-01-29 18:22:59');
INSERT INTO `gen_member_wife` VALUES ('423', '565', '刘氏', '', null, '', '', '30', '2019-01-29 18:23:21', '2019-01-29 18:23:21');
INSERT INTO `gen_member_wife` VALUES ('424', '566', '王氏', '', null, '', '东头', '30', '2019-01-29 18:24:00', '2019-01-29 18:24:00');
INSERT INTO `gen_member_wife` VALUES ('425', '571', '王小春', '', null, '', '大连', '30', '2019-01-29 18:28:33', '2019-01-29 18:28:33');
INSERT INTO `gen_member_wife` VALUES ('426', '140', '吕氏，韩氏', '', null, '', '马村，大王寨', null, '2019-02-17 20:04:04', '2019-02-17 20:04:04');
INSERT INTO `gen_member_wife` VALUES ('427', '241', '', '', null, '', '', null, '2019-02-17 20:12:35', '2019-02-17 20:12:35');
INSERT INTO `gen_member_wife` VALUES ('428', '400', '郝氏', '', null, '', '马寨', null, '2019-02-17 20:42:50', '2019-02-17 20:42:50');
INSERT INTO `gen_member_wife` VALUES ('429', '295', '徐博', '', null, '', '', null, '2019-02-18 14:31:32', '2019-02-18 14:31:32');
INSERT INTO `gen_member_wife` VALUES ('430', '295', '徐博', '', null, '', '', null, '2019-02-18 14:31:32', '2019-02-18 14:31:32');
INSERT INTO `gen_member_wife` VALUES ('431', '81', '赵霞', '', null, '', '', null, '2019-02-18 18:09:00', '2019-02-18 18:09:00');
INSERT INTO `gen_member_wife` VALUES ('432', '219', '窦景娟', '', null, '', '', null, '2019-02-18 18:16:58', '2019-02-18 18:17:45');
INSERT INTO `gen_member_wife` VALUES ('433', '336', '吕敬芬', '', null, '', '', null, '2019-02-18 19:24:56', '2019-02-18 19:24:56');
INSERT INTO `gen_member_wife` VALUES ('434', '593', '', '', null, '', '', '30', '2019-02-18 19:32:42', '2019-02-18 19:32:42');
INSERT INTO `gen_member_wife` VALUES ('435', '222', '张氏', '', null, '', '', null, '2019-02-18 19:35:53', '2019-02-18 19:35:53');
INSERT INTO `gen_member_wife` VALUES ('436', '196', '张氏', '', null, '', '', null, '2019-02-18 19:51:26', '2019-02-18 19:51:26');
INSERT INTO `gen_member_wife` VALUES ('437', '195', '王氏', '', null, '', '', null, '2019-02-18 19:51:52', '2019-02-18 19:51:52');
INSERT INTO `gen_member_wife` VALUES ('438', '433', '赵氏', '', null, '', '', null, '2019-02-18 19:54:44', '2019-02-18 19:54:44');
INSERT INTO `gen_member_wife` VALUES ('439', '599', '耿兰芳', '', null, '', '耿楼', '30', '2019-02-18 20:21:41', '2019-02-18 20:21:41');
INSERT INTO `gen_member_wife` VALUES ('440', '602', '王氏', '', null, '', '', '30', '2019-02-18 21:54:47', '2019-02-18 21:54:47');
INSERT INTO `gen_member_wife` VALUES ('441', '209', '郭焕芹', '', null, '', '', null, '2019-02-18 22:01:15', '2019-02-18 22:03:10');
INSERT INTO `gen_member_wife` VALUES ('442', '210', '罗春菊', '', null, '', '', null, '2019-02-18 22:01:36', '2019-02-18 22:01:36');
INSERT INTO `gen_member_wife` VALUES ('443', '346', '张丽潘', '', null, '', '', null, '2019-02-19 09:34:28', '2019-02-19 09:34:28');
INSERT INTO `gen_member_wife` VALUES ('444', '327', '李华', '', null, '', '', null, '2019-02-19 09:35:34', '2019-02-19 09:47:46');
INSERT INTO `gen_member_wife` VALUES ('445', '344', '吕焕芹', '', null, '', '', null, '2019-02-19 09:37:03', '2019-02-19 09:37:03');
INSERT INTO `gen_member_wife` VALUES ('446', '218', '高晓南', '', null, '', '', null, '2019-02-20 08:10:57', '2019-02-20 08:10:57');
INSERT INTO `gen_member_wife` VALUES ('447', '118', '冯慧林', '', null, '', '', null, '2019-02-23 16:57:41', '2019-02-23 17:06:31');

-- ----------------------------
-- Table structure for gen_message
-- ----------------------------
DROP TABLE IF EXISTS `gen_message`;
CREATE TABLE `gen_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(120) DEFAULT NULL,
  `content` text,
  `type` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `order_by` varchar(50) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `create_user` varchar(50) DEFAULT NULL,
  `create_organize` varchar(50) DEFAULT NULL,
  `create_org_cascade` varchar(50) DEFAULT NULL,
  `create_time` varchar(50) DEFAULT NULL,
  `update_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gen_message
-- ----------------------------
INSERT INTO `gen_message` VALUES ('1', 'orgTree', '{\"children\":[{\"children\":[{\"children\":[{\"name\":\"第十九世：安XX(老二)\",\"id\":\"407\",\"title\":\"家属：孙氏\",\"relationship\":\"110\"},{\"children\":[{\"children\":[{\"children\":[{\"children\":[{\"name\":\"第二十三世：安XX(老大)\",\"id\":\"419\",\"title\":\"家属：赵氏\",\"relationship\":\"110\"}],\"name\":\"第二十二世：安XX(老四)\",\"id\":\"413\",\"title\":\"家属：耿氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"children\":[{\"children\":[{\"name\":\"第二十六世：安XX(老二)\",\"id\":\"443\",\"title\":\"家属：无\",\"relationship\":\"110\"},{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"442\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老二)\",\"id\":\"436\",\"title\":\"家属：黄氏\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十六世：安XX(老二)\",\"id\":\"441\",\"title\":\"家属：\",\"relationship\":\"110\"},{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"440\",\"title\":\"家属：李氏\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老大)\",\"id\":\"435\",\"title\":\"家属：蒋氏\",\"relationship\":\"111\"}],\"name\":\"第二十四世：安XX(老大)\",\"id\":\"428\",\"title\":\"家属：张氏\",\"relationship\":\"111\"}],\"name\":\"第二十三世：安XX(老大)\",\"id\":\"418\",\"title\":\"家属：田氏\",\"relationship\":\"111\"}],\"name\":\"第二十二世：安XX(老三)\",\"id\":\"412\",\"title\":\"家属：马氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"children\":[{\"name\":\"第二十五世：安XX(老大)\",\"id\":\"457\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十四世：安XX(老三)\",\"id\":\"427\",\"title\":\"家属：杨氏\",\"relationship\":\"111\"},{\"name\":\"第二十四世：安XX(老大)\",\"id\":\"426\",\"title\":\"家属：田敏\",\"relationship\":\"110\"},{\"children\":[{\"name\":\"第二十五世：安XX(老大)\",\"id\":\"437\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十四世：安XX(老大)\",\"id\":\"425\",\"title\":\"家属：马氏\",\"relationship\":\"111\"}],\"name\":\"第二十三世：安XX(老二)\",\"id\":\"417\",\"title\":\"家属：王氏，张氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"name\":\"第二十五世：安XX(老大)\",\"id\":\"434\",\"title\":\"家属：夏氏\",\"relationship\":\"110\"}],\"name\":\"第二十四世：安XX(老二)\",\"id\":\"424\",\"title\":\"家属：朱氏\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十五世：安XX(老二)\",\"id\":\"433\",\"title\":\"家属：赵氏\",\"relationship\":\"110\"},{\"children\":[{\"name\":\"第二十六世：安XX(老二)\",\"id\":\"439\",\"title\":\"家属：无\",\"relationship\":\"110\"},{\"children\":[{\"name\":\"第二十七世：安XX(老大)\",\"id\":\"589\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十六世：安XX(老大)\",\"id\":\"438\",\"title\":\"家属：王氏\",\"relationship\":\"111\"}],\"name\":\"第二十五世：安XX(老大)\",\"id\":\"432\",\"title\":\"家属：沈氏\",\"relationship\":\"111\"}],\"name\":\"第二十四世：安XX(老大)\",\"id\":\"423\",\"title\":\"家属：刘氏\",\"relationship\":\"111\"}],\"name\":\"第二十三世：安XX(老大)\",\"id\":\"416\",\"title\":\"家属：于氏\",\"relationship\":\"111\"}],\"name\":\"第二十二世：安XX(老二)\",\"id\":\"411\",\"title\":\"家属：申氏，郝氏\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十三世：安XX(老二)\",\"id\":\"415\",\"title\":\"家属：申氏\",\"relationship\":\"110\"},{\"children\":[{\"children\":[{\"name\":\"第二十五世：安XX(老大)\",\"id\":\"429\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十四世：安XX(老三)\",\"id\":\"422\",\"title\":\"家属：李氏，张氏\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十五世：安XX(老大)\",\"id\":\"431\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十四世：安XX(老二)\",\"id\":\"421\",\"title\":\"家属：耿氏\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十五世：安XX(老大)\",\"id\":\"430\",\"title\":\"家属：赵氏\",\"relationship\":\"110\"}],\"name\":\"第二十四世：安XX(老大)\",\"id\":\"420\",\"title\":\"家属：吕氏\",\"relationship\":\"111\"}],\"name\":\"第二十三世：安XX(老大)\",\"id\":\"414\",\"title\":\"家属：赵氏，郭氏\",\"relationship\":\"111\"}],\"name\":\"第二十二世：安XX(老大)\",\"id\":\"410\",\"title\":\"家属：吴氏\",\"relationship\":\"111\"}],\"name\":\"第二十一世：安XX(老大)\",\"id\":\"409\",\"title\":\"家属：王氏\",\"relationship\":\"111\"}],\"name\":\"第二十世：安XX(老大)\",\"id\":\"408\",\"title\":\"家属：刘氏\",\"relationship\":\"111\"}],\"name\":\"第十九世：安XX(老大)\",\"id\":\"406\",\"title\":\"家属：刘氏\",\"relationship\":\"111\"}],\"name\":\"第十八世：安XX(老大)\",\"id\":\"405\",\"title\":\"家属：吴氏，宫氏\",\"relationship\":\"111\"}],\"name\":\"第十七世：安XX(老大)\",\"id\":\"404\",\"title\":\"家属：石氏，王氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"children\":[{\"children\":[{\"children\":[{\"children\":[{\"children\":[{\"children\":[{\"name\":\"第二十五世：安XX(老大)\",\"id\":\"610\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十四世：安XX(老三)\",\"id\":\"337\",\"title\":\"家属：耿凤霞\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十五世：安XX(老大)\",\"id\":\"590\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十四世：安XX(老二)\",\"id\":\"336\",\"title\":\"家属：吕敬芬\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十五世：安XX(老二)\",\"id\":\"353\",\"title\":\"家属：孙氏\",\"relationship\":\"110\"},{\"children\":[{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"591\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老大)\",\"id\":\"352\",\"title\":\"家属：孙氏\",\"relationship\":\"111\"}],\"name\":\"第二十四世：安XX(老大)\",\"id\":\"335\",\"title\":\"家属：刘氏\",\"relationship\":\"111\"}],\"name\":\"第二十三世：安XX(老三)\",\"id\":\"322\",\"title\":\"家属：王氏\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十四世：安XX(老七)\",\"id\":\"334\",\"title\":\"家属：李氏\",\"relationship\":\"110\"},{\"children\":[{\"name\":\"第二十五世：安XX(老大)\",\"id\":\"351\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十四世：安XX(老六)\",\"id\":\"333\",\"title\":\"家属：\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十五世：安XX(老大)\",\"id\":\"350\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十四世：安XX(老五)\",\"id\":\"332\",\"title\":\"家属：陈氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"358\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老二)\",\"id\":\"349\",\"title\":\"家属：无\",\"relationship\":\"111\"},{\"name\":\"第二十五世：安XX(老大)\",\"id\":\"348\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十四世：安XX(老四)\",\"id\":\"331\",\"title\":\"家属：王氏\",\"relationship\":\"111\"},{\"name\":\"第二十四世：安XX(老三)\",\"id\":\"330\",\"title\":\"家属：无\",\"relationship\":\"110\"},{\"name\":\"第二十四世：安XX(老二)\",\"id\":\"329\",\"title\":\"家属：熊氏\",\"relationship\":\"110\"},{\"name\":\"第二十四世：安XX(老大)\",\"id\":\"328\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十三世：安XX(老二)\",\"id\":\"321\",\"title\":\"家属：黄氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"name\":\"第二十五世：安XX(老大)\",\"id\":\"347\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十四世：安XX(老大)\",\"id\":\"338\",\"title\":\"家属：无\",\"relationship\":\"111\"}],\"name\":\"第二十三世：安XX(老大)\",\"id\":\"320\",\"title\":\"家属：无\",\"relationship\":\"111\"}],\"name\":\"第二十二世：安XX(老三)\",\"id\":\"316\",\"title\":\"家属：魏氏\",\"relationship\":\"111\"},{\"name\":\"第二十二世：安XX(老二)\",\"id\":\"315\",\"title\":\"家属：无\",\"relationship\":\"110\"},{\"children\":[{\"children\":[{\"children\":[{\"children\":[{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"605\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老大)\",\"id\":\"346\",\"title\":\"家属：张丽潘\",\"relationship\":\"111\"}],\"name\":\"第二十四世：安XX(老三)\",\"id\":\"327\",\"title\":\"家属：李华\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"606\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老二)\",\"id\":\"345\",\"title\":\"家属：耿利霞\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"607\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老大)\",\"id\":\"344\",\"title\":\"家属：吕焕芹\",\"relationship\":\"111\"}],\"name\":\"第二十四世：安XX(老大)\",\"id\":\"326\",\"title\":\"家属：王随英\",\"relationship\":\"111\"}],\"name\":\"第二十三世：安XX(老四)\",\"id\":\"319\",\"title\":\"家属：赵氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"name\":\"第二十五世：安XX(老大)\",\"id\":\"343\",\"title\":\"家属：康氏\",\"relationship\":\"110\"}],\"name\":\"第二十四世：安XX(老大)\",\"id\":\"325\",\"title\":\"家属：李氏\",\"relationship\":\"111\"}],\"name\":\"第二十三世：安XX(老二)\",\"id\":\"318\",\"title\":\"家属：郝氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"name\":\"第二十五世：安XX(老四)\",\"id\":\"342\",\"title\":\"家属：耿氏\",\"relationship\":\"110\"},{\"name\":\"第二十五世：安XX(老三)\",\"id\":\"341\",\"title\":\"家属：无\",\"relationship\":\"110\"},{\"children\":[{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"357\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老二)\",\"id\":\"340\",\"title\":\"家属：山氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"name\":\"第二十七世：安XX(老大)\",\"id\":\"359\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十六世：安XX(老大)\",\"id\":\"355\",\"title\":\"家属：王氏\",\"relationship\":\"111\"},{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"356\",\"title\":\"家属：王氏\",\"relationship\":\"110\"},{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"354\",\"title\":\"家属：王氏\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老大)\",\"id\":\"339\",\"title\":\"家属：刘氏\",\"relationship\":\"111\"}],\"name\":\"第二十四世：安XX(老二)\",\"id\":\"324\",\"title\":\"家属：秦氏\",\"relationship\":\"111\"},{\"name\":\"第二十四世：安XX(老大)\",\"id\":\"323\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十三世：安XX(老大)\",\"id\":\"317\",\"title\":\"家属：崔氏\",\"relationship\":\"111\"}],\"name\":\"第二十二世：安XX(老大)\",\"id\":\"314\",\"title\":\"家属：吕氏，刘氏，赵氏\",\"relationship\":\"111\"}],\"name\":\"第二十一世：安XX(老大)\",\"id\":\"313\",\"title\":\"家属：石氏，赵氏\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十二世：安XX(老大)\",\"id\":\"304\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十一世：安XX(老大)\",\"id\":\"302\",\"title\":\"家属：无\",\"relationship\":\"111\"}],\"name\":\"第二十世：安XX(老二)\",\"id\":\"300\",\"title\":\"家属：谷氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"children\":[{\"children\":[{\"name\":\"第二十四世：安XX(老三)\",\"id\":\"308\",\"title\":\"家属：沈氏\",\"relationship\":\"110\"},{\"name\":\"第二十四世：安XX(老二)\",\"id\":\"307\",\"title\":\"家属：无\",\"relationship\":\"110\"},{\"children\":[{\"children\":[{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"583\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老大)\",\"id\":\"309\",\"title\":\"家属：张凤娟\",\"relationship\":\"111\"}],\"name\":\"第二十四世：安XX(老大)\",\"id\":\"306\",\"title\":\"家属：陈氏\",\"relationship\":\"111\"}],\"name\":\"第二十三世：安XX(老大)\",\"id\":\"305\",\"title\":\"家属：会女\",\"relationship\":\"111\"}],\"name\":\"第二十二世：安XX(老大)\",\"id\":\"303\",\"title\":\"家属：张氏\",\"relationship\":\"111\"}],\"name\":\"第二十一世：安XX(老大)\",\"id\":\"301\",\"title\":\"家属：贾氏\",\"relationship\":\"111\"}],\"name\":\"第二十世：安XX(老大)\",\"id\":\"299\",\"title\":\"家属：杨氏\",\"relationship\":\"111\"}],\"name\":\"第十九世：安XX(老大)\",\"id\":\"298\",\"title\":\"家属：耿氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"children\":[{\"children\":[{\"children\":[{\"children\":[{\"name\":\"第二十五世：安XX(老大)\",\"id\":\"294\",\"title\":\"家属：王氏\",\"relationship\":\"110\"}],\"name\":\"第二十四世：安XX(老三)\",\"id\":\"285\",\"title\":\"家属：周氏\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十五世：安XX(老三)\",\"id\":\"293\",\"title\":\"家属：\",\"relationship\":\"110\"},{\"name\":\"第二十五世：安XX(老二)\",\"id\":\"292\",\"title\":\"家属：罗氏\",\"relationship\":\"110\"},{\"name\":\"第二十五世：安XX(老大)\",\"id\":\"291\",\"title\":\"家属：刘氏\",\"relationship\":\"110\"}],\"name\":\"第二十四世：安XX(老二)\",\"id\":\"284\",\"title\":\"家属：耿氏\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十五世：安XX(老大)\",\"id\":\"290\",\"title\":\"家属：吴氏\",\"relationship\":\"110\"}],\"name\":\"第二十四世：安XX(老大)\",\"id\":\"283\",\"title\":\"家属：刘氏\",\"relationship\":\"111\"}],\"name\":\"第二十三世：安XX(老大)\",\"id\":\"275\",\"title\":\"家属：郝氏\",\"relationship\":\"111\"}],\"name\":\"第二十二世：安XX(老大)\",\"id\":\"268\",\"title\":\"家属：沈氏\",\"relationship\":\"111\"}],\"name\":\"第二十一世：安XX(老二)\",\"id\":\"262\",\"title\":\"家属：李氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"name\":\"第二十三世：安XX(老大)\",\"id\":\"274\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十二世：安XX(老五)\",\"id\":\"267\",\"title\":\"家属：王氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"children\":[{\"name\":\"第二十五世：安XX(老大)\",\"id\":\"289\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十四世：安XX(老大)\",\"id\":\"282\",\"title\":\"家属：蒋氏\",\"relationship\":\"111\"}],\"name\":\"第二十三世：安XX(老大)\",\"id\":\"273\",\"title\":\"家属：马氏\",\"relationship\":\"111\"}],\"name\":\"第二十二世：安XX(老四)\",\"id\":\"266\",\"title\":\"家属：王氏，沈氏\",\"relationship\":\"111\"},{\"name\":\"第二十二世：安XX(老三)\",\"id\":\"265\",\"title\":\"家属：王氏\",\"relationship\":\"110\"},{\"children\":[{\"name\":\"第二十三世：安XX(老三)\",\"id\":\"272\",\"title\":\"家属：无\",\"relationship\":\"110\"},{\"children\":[{\"children\":[{\"name\":\"第二十五世：安XX(老二)\",\"id\":\"297\",\"title\":\"家属：无\",\"relationship\":\"110\"},{\"name\":\"第二十五世：安XX(老大)\",\"id\":\"296\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十四世：安XX(老二)\",\"id\":\"281\",\"title\":\"家属：白大华\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十五世：安XX(老大)\",\"id\":\"295\",\"title\":\"家属：徐博,徐博\",\"relationship\":\"110\"}],\"name\":\"第二十四世：安XX(老大)\",\"id\":\"280\",\"title\":\"家属：任海红\",\"relationship\":\"111\"}],\"name\":\"第二十三世：安XX(老二)\",\"id\":\"271\",\"title\":\"家属：赵氏\",\"relationship\":\"111\"},{\"name\":\"第二十三世：安XX(老大)\",\"id\":\"270\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十二世：安XX(老二)\",\"id\":\"264\",\"title\":\"家属：赵氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"name\":\"第二十四世：安XX(老四)\",\"id\":\"279\",\"title\":\"家属：无\",\"relationship\":\"110\"},{\"children\":[{\"name\":\"第二十五世：安XX(老大)\",\"id\":\"288\",\"title\":\"家属：朱氏\",\"relationship\":\"110\"}],\"name\":\"第二十四世：安XX(老三)\",\"id\":\"278\",\"title\":\"家属：王氏\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十五世：安XX(老大)\",\"id\":\"287\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十四世：安XX(老二)\",\"id\":\"277\",\"title\":\"家属：乔氏\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十五世：安XX(老大)\",\"id\":\"286\",\"title\":\"家属：刘瑞民\",\"relationship\":\"110\"}],\"name\":\"第二十四世：安XX(老大)\",\"id\":\"276\",\"title\":\"家属：刘氏\",\"relationship\":\"111\"}],\"name\":\"第二十三世：安XX(老大)\",\"id\":\"269\",\"title\":\"家属：赵氏\",\"relationship\":\"111\"}],\"name\":\"第二十二世：安XX(老大)\",\"id\":\"263\",\"title\":\"家属：王氏\",\"relationship\":\"111\"}],\"name\":\"第二十一世：安XX(老大)\",\"id\":\"261\",\"title\":\"家属：潘氏\",\"relationship\":\"111\"}],\"name\":\"第二十世：安XX(老大)\",\"id\":\"260\",\"title\":\"家属：朱氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"children\":[{\"name\":\"第二十三世：安XX(老大)\",\"id\":\"602\",\"title\":\"家属：王氏\",\"relationship\":\"110\"},{\"children\":[{\"children\":[{\"children\":[{\"children\":[{\"name\":\"第二十七世：安XX(老大)\",\"id\":\"621\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十六世：安XX(老大)\",\"id\":\"17\",\"title\":\"家属：李氏\",\"relationship\":\"111\"}],\"name\":\"第二十五世：安XX(老大)\",\"id\":\"14\",\"title\":\"家属：刘氏\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"18\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老二)\",\"id\":\"15\",\"title\":\"家属：敖氏\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"19\",\"title\":\"家属：无\",\"relationship\":\"110\"},{\"name\":\"第二十六世：安XX(老二)\",\"id\":\"20\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老三)\",\"id\":\"16\",\"title\":\"家属：黄氏\",\"relationship\":\"111\"}],\"name\":\"第二十四世：安XX(老大)\",\"id\":\"183\",\"title\":\"家属：马氏\",\"relationship\":\"111\"}],\"name\":\"第二十三世：安XX(老三)\",\"id\":\"153\",\"title\":\"家属：王氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"name\":\"第二十五世：安XX(老大)\",\"id\":\"259\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十四世：安XX(老二)\",\"id\":\"185\",\"title\":\"家属：牛氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"254\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老二)\",\"id\":\"241\",\"title\":\"家属：\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"name\":\"第二十七世：安XX(老大)\",\"id\":\"258\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十六世：安XX(老三)\",\"id\":\"252\",\"title\":\"家属：刘素芬\",\"relationship\":\"111\"},{\"name\":\"第二十六世：安XX(老二)\",\"id\":\"251\",\"title\":\"家属：无\",\"relationship\":\"110\"},{\"children\":[{\"name\":\"第二十七世：安XX(老大)\",\"id\":\"257\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十六世：安XX(老大)\",\"id\":\"250\",\"title\":\"家属：张氏\",\"relationship\":\"111\"}],\"name\":\"第二十五世：安XX(老大)\",\"id\":\"232\",\"title\":\"家属：段氏\",\"relationship\":\"111\"}],\"name\":\"第二十四世：安XX(老大)\",\"id\":\"184\",\"title\":\"家属：刘氏\",\"relationship\":\"111\"}],\"name\":\"第二十三世：安XX(老四)\",\"id\":\"152\",\"title\":\"家属：刘氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"children\":[{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"596\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老二)\",\"id\":\"231\",\"title\":\"家属：蔡艳丽\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"595\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老大)\",\"id\":\"230\",\"title\":\"家属：刘书霞\",\"relationship\":\"111\"}],\"name\":\"第二十四世：安XX(老三)\",\"id\":\"182\",\"title\":\"家属：吕氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"611\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老二)\",\"id\":\"229\",\"title\":\"家属：王氏\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"234\",\"title\":\"家属：\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老大)\",\"id\":\"228\",\"title\":\"家属：郭氏\",\"relationship\":\"111\"}],\"name\":\"第二十四世：安XX(老二)\",\"id\":\"181\",\"title\":\"家属：郭氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"312\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老二)\",\"id\":\"227\",\"title\":\"家属：\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"253\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老大)\",\"id\":\"226\",\"title\":\"家属：赵氏\",\"relationship\":\"111\"}],\"name\":\"第二十四世：安XX(老大)\",\"id\":\"180\",\"title\":\"家属：张氏\",\"relationship\":\"111\"}],\"name\":\"第二十三世：安XX(老二)\",\"id\":\"151\",\"title\":\"家属：录氏\",\"relationship\":\"111\"}],\"name\":\"第二十二世：安XX(老大)\",\"id\":\"137\",\"title\":\"家属：秦氏，刘氏\",\"relationship\":\"111\"}],\"name\":\"第二十一世：安XX(老三)\",\"id\":\"132\",\"title\":\"家属：？氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"children\":[{\"name\":\"第二十四世：安XX(老四)\",\"id\":\"173\",\"title\":\"家属：张氏\",\"relationship\":\"110\"},{\"children\":[{\"name\":\"第二十五世：安XX(老二)\",\"id\":\"216\",\"title\":\"家属：王氏\",\"relationship\":\"110\"},{\"name\":\"第二十五世：安XX(老大)\",\"id\":\"215\",\"title\":\"家属：沈氏\",\"relationship\":\"110\"}],\"name\":\"第二十四世：安XX(老三)\",\"id\":\"172\",\"title\":\"家属：白氏\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十五世：安XX(老大)\",\"id\":\"214\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十四世：安XX(老二)\",\"id\":\"171\",\"title\":\"家属：葛氏\",\"relationship\":\"111\"},{\"name\":\"第二十四世：安XX(老大)\",\"id\":\"170\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十三世：安XX(老二)\",\"id\":\"147\",\"title\":\"家属：王氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"children\":[{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"249\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老二)\",\"id\":\"213\",\"title\":\"家属：康氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"name\":\"第二十七世：安XX(老二)\",\"id\":\"592\",\"title\":\"家属：无\",\"relationship\":\"110\"},{\"name\":\"第二十七世：安XX(老大)\",\"id\":\"255\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十六世：安XX(老大)\",\"id\":\"248\",\"title\":\"家属：蒋氏\",\"relationship\":\"111\"}],\"name\":\"第二十五世：安XX(老大)\",\"id\":\"212\",\"title\":\"家属：赵氏\",\"relationship\":\"111\"}],\"name\":\"第二十四世：安XX(老大)\",\"id\":\"169\",\"title\":\"家属：王氏\",\"relationship\":\"111\"}],\"name\":\"第二十三世：安XX(老大)\",\"id\":\"146\",\"title\":\"家属：王氏\",\"relationship\":\"111\"}],\"name\":\"第二十二世：安XX(老大)\",\"id\":\"145\",\"title\":\"家属：杜氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"name\":\"第二十四世：安XX(老四)\",\"id\":\"179\",\"title\":\"家属：嵇氏\",\"relationship\":\"110\"},{\"children\":[{\"name\":\"第二十五世：安XX(老大)\",\"id\":\"225\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十四世：安XX(老三)\",\"id\":\"178\",\"title\":\"家属：刘氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"600\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老大)\",\"id\":\"599\",\"title\":\"家属：耿兰芳\",\"relationship\":\"111\"},{\"name\":\"第二十五世：安XX(老二)\",\"id\":\"224\",\"title\":\"家属：\",\"relationship\":\"110\"}],\"name\":\"第二十四世：安XX(老二)\",\"id\":\"177\",\"title\":\"家属：？氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"594\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老三)\",\"id\":\"223\",\"title\":\"家属：夏氏\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"245\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老二)\",\"id\":\"222\",\"title\":\"家属：张氏\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"593\",\"title\":\"家属：\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老大)\",\"id\":\"221\",\"title\":\"家属：夏氏\",\"relationship\":\"111\"}],\"name\":\"第二十四世：安XX(老大)\",\"id\":\"176\",\"title\":\"家属：董氏\",\"relationship\":\"111\"}],\"name\":\"第二十三世：安XX(老二)\",\"id\":\"149\",\"title\":\"家属：？氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"children\":[{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"244\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老二)\",\"id\":\"219\",\"title\":\"家属：窦景娟\",\"relationship\":\"111\"},{\"name\":\"第二十五世：安XX(老大)\",\"id\":\"218\",\"title\":\"家属：高晓南\",\"relationship\":\"110\"}],\"name\":\"第二十四世：安XX(老二)\",\"id\":\"175\",\"title\":\"家属：黄氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"name\":\"第二十六世：安XX(老二)\",\"id\":\"586\",\"title\":\"家属：无\",\"relationship\":\"110\"},{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"585\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老大)\",\"id\":\"217\",\"title\":\"家属：刘银敏\",\"relationship\":\"111\"}],\"name\":\"第二十四世：安XX(老大)\",\"id\":\"174\",\"title\":\"家属：王氏\",\"relationship\":\"111\"}],\"name\":\"第二十三世：安XX(老大)\",\"id\":\"148\",\"title\":\"家属：曹氏\",\"relationship\":\"111\"}],\"name\":\"第二十二世：安XX(老二)\",\"id\":\"136\",\"title\":\"家属：王氏\",\"relationship\":\"111\"},{\"name\":\"第二十二世：安XX(老大)\",\"id\":\"135\",\"title\":\"家属：杜氏\",\"relationship\":\"110\"}],\"name\":\"第二十一世：安XX(老二)\",\"id\":\"131\",\"title\":\"家属：？氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"children\":[{\"children\":[{\"name\":\"第二十五世：安XX(老大)\",\"id\":\"211\",\"title\":\"家属：\",\"relationship\":\"110\"}],\"name\":\"第二十四世：安XX(老大)\",\"id\":\"168\",\"title\":\"家属：白氏\",\"relationship\":\"111\"}],\"name\":\"第二十三世：安XX(老三)\",\"id\":\"143\",\"title\":\"家属：于氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"children\":[{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"604\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老二)\",\"id\":\"210\",\"title\":\"家属：罗春菊\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"603\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老大)\",\"id\":\"209\",\"title\":\"家属：郭焕芹\",\"relationship\":\"111\"}],\"name\":\"第二十四世：安XX(老大)\",\"id\":\"167\",\"title\":\"家属：李氏\",\"relationship\":\"111\"}],\"name\":\"第二十三世：安XX(老二)\",\"id\":\"142\",\"title\":\"家属：王氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"name\":\"第二十五世：安XX(老二)\",\"id\":\"208\",\"title\":\"家属：\",\"relationship\":\"110\"},{\"name\":\"第二十五世：安XX(老大)\",\"id\":\"207\",\"title\":\"家属：王氏\",\"relationship\":\"110\"}],\"name\":\"第二十四世：安XX(老大)\",\"id\":\"166\",\"title\":\"家属：夏氏\",\"relationship\":\"111\"}],\"name\":\"第二十三世：安XX(老大)\",\"id\":\"141\",\"title\":\"家属：申氏\",\"relationship\":\"111\"}],\"name\":\"第二十二世：安XX(老二)\",\"id\":\"133\",\"title\":\"家属：王氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"children\":[{\"children\":[{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"622\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老大)\",\"id\":\"206\",\"title\":\"家属：耿氏\",\"relationship\":\"111\"}],\"name\":\"第二十四世：安XX(老四)\",\"id\":\"165\",\"title\":\"家属：马氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"616\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老二)\",\"id\":\"205\",\"title\":\"家属：张氏\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十六世：安XX(老二)\",\"id\":\"618\",\"title\":\"家属：无\",\"relationship\":\"110\"},{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"617\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老大)\",\"id\":\"204\",\"title\":\"家属：白氏\",\"relationship\":\"111\"}],\"name\":\"第二十四世：安XX(老三)\",\"id\":\"164\",\"title\":\"家属：刘氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"578\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老二)\",\"id\":\"203\",\"title\":\"家属：尹明燕\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"576\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老大)\",\"id\":\"202\",\"title\":\"家属：白红杰\",\"relationship\":\"111\"}],\"name\":\"第二十四世：安XX(老二)\",\"id\":\"163\",\"title\":\"家属：耿氏\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十五世：安XX(老二)\",\"id\":\"201\",\"title\":\"家属：无\",\"relationship\":\"110\"},{\"children\":[{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"247\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老大)\",\"id\":\"200\",\"title\":\"家属：沈氏\",\"relationship\":\"111\"}],\"name\":\"第二十四世：安XX(老大)\",\"id\":\"162\",\"title\":\"家属：岳氏\",\"relationship\":\"111\"}],\"name\":\"第二十三世：安XX(老三)\",\"id\":\"140\",\"title\":\"家属：吕氏，韩氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"name\":\"第二十五世：安XX(老大)\",\"id\":\"199\",\"title\":\"家属：王氏\",\"relationship\":\"110\"}],\"name\":\"第二十四世：安XX(老六)\",\"id\":\"161\",\"title\":\"家属：李氏\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十五世：安XX(老二)\",\"id\":\"220\",\"title\":\"家属：无\",\"relationship\":\"110\"},{\"name\":\"第二十五世：安XX(老大)\",\"id\":\"198\",\"title\":\"家属：\",\"relationship\":\"110\"}],\"name\":\"第二十四世：安XX(老五)\",\"id\":\"160\",\"title\":\"家属：吕氏\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十五世：安XX(老大)\",\"id\":\"197\",\"title\":\"家属：赵氏\",\"relationship\":\"110\"}],\"name\":\"第二十四世：安XX(老四)\",\"id\":\"159\",\"title\":\"家属：王氏\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十五世：安XX(老二)\",\"id\":\"196\",\"title\":\"家属：张氏\",\"relationship\":\"110\"},{\"children\":[{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"597\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老大)\",\"id\":\"195\",\"title\":\"家属：王氏\",\"relationship\":\"111\"}],\"name\":\"第二十四世：安XX(老三)\",\"id\":\"158\",\"title\":\"家属：寇氏\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十五世：安XX(老三)\",\"id\":\"194\",\"title\":\"家属：孙氏\",\"relationship\":\"110\"},{\"name\":\"第二十五世：安XX(老二)\",\"id\":\"193\",\"title\":\"家属：\",\"relationship\":\"110\"},{\"children\":[{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"246\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老大)\",\"id\":\"192\",\"title\":\"家属：？？\",\"relationship\":\"111\"}],\"name\":\"第二十四世：安XX(老二)\",\"id\":\"157\",\"title\":\"家属：刘氏\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十五世：安XX(老大)\",\"id\":\"598\",\"title\":\"家属：无\",\"relationship\":\"110\"},{\"name\":\"第二十五世：安XX(老三)\",\"id\":\"191\",\"title\":\"家属：贾氏\",\"relationship\":\"110\"},{\"name\":\"第二十五世：安XX(老二)\",\"id\":\"190\",\"title\":\"家属：曲氏\",\"relationship\":\"110\"}],\"name\":\"第二十四世：安XX(老大)\",\"id\":\"156\",\"title\":\"家属：吕氏\",\"relationship\":\"111\"}],\"name\":\"第二十三世：安XX(老二)\",\"id\":\"139\",\"title\":\"家属：逯氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"children\":[{\"name\":\"第二十六世：安XX(老二)\",\"id\":\"243\",\"title\":\"家属：无\",\"relationship\":\"110\"},{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"242\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老二)\",\"id\":\"189\",\"title\":\"家属：夏氏\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"240\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老大)\",\"id\":\"188\",\"title\":\"家属：沈氏\",\"relationship\":\"111\"}],\"name\":\"第二十四世：安XX(老二)\",\"id\":\"155\",\"title\":\"家属：？氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"name\":\"第二十六世：安XX(老二)\",\"id\":\"239\",\"title\":\"家属：吴氏\",\"relationship\":\"110\"},{\"children\":[{\"name\":\"第二十七世：安XX(老大)\",\"id\":\"256\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十六世：安XX(老大)\",\"id\":\"238\",\"title\":\"家属：王氏\",\"relationship\":\"111\"}],\"name\":\"第二十五世：安XX(老二)\",\"id\":\"187\",\"title\":\"家属：吕氏\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十六世：安XX(老三)\",\"id\":\"237\",\"title\":\"家属：无\",\"relationship\":\"110\"},{\"name\":\"第二十六世：安XX(老二)\",\"id\":\"236\",\"title\":\"家属：无\",\"relationship\":\"110\"},{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"235\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老大)\",\"id\":\"186\",\"title\":\"家属：杨氏\",\"relationship\":\"111\"}],\"name\":\"第二十四世：安XX(老大)\",\"id\":\"154\",\"title\":\"家属：曹氏\",\"relationship\":\"111\"}],\"name\":\"第二十三世：安XX(老大)\",\"id\":\"138\",\"title\":\"家属：赵氏\",\"relationship\":\"111\"}],\"name\":\"第二十二世：安XX(老大)\",\"id\":\"134\",\"title\":\"家属：张氏\",\"relationship\":\"111\"}],\"name\":\"第二十一世：安XX(老大)\",\"id\":\"130\",\"title\":\"家属：王氏\",\"relationship\":\"111\"}],\"name\":\"第二十世：安XX(老大)\",\"id\":\"129\",\"title\":\"家属：窦氏\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十一世：安XX(老二)\",\"id\":\"33\",\"title\":\"家属：无\",\"relationship\":\"110\"},{\"name\":\"第二十一世：安XX(老大)\",\"id\":\"32\",\"title\":\"家属：夏氏\",\"relationship\":\"110\"}],\"name\":\"第二十世：安XX(老二)\",\"id\":\"28\",\"title\":\"家属：耿氏\",\"relationship\":\"111\"}],\"name\":\"第十九世：安XX(老二)\",\"id\":\"26\",\"title\":\"家属：\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"children\":[{\"children\":[{\"children\":[{\"children\":[{\"name\":\"第二十五世：安XX(老大)\",\"id\":\"85\",\"title\":\"家属：于氏\",\"relationship\":\"110\"}],\"name\":\"第二十四世：安XX(老二)\",\"id\":\"60\",\"title\":\"家属：赵氏，沈氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"86\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老二)\",\"id\":\"84\",\"title\":\"家属：王氏\",\"relationship\":\"111\"},{\"name\":\"第二十五世：安XX(老大)\",\"id\":\"83\",\"title\":\"家属：郭氏\",\"relationship\":\"110\"}],\"name\":\"第二十四世：安XX(老大)\",\"id\":\"59\",\"title\":\"家属：赵氏\",\"relationship\":\"111\"}],\"name\":\"第二十三世：安XX(老三)\",\"id\":\"47\",\"title\":\"家属：刘氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"children\":[{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"87\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老四)\",\"id\":\"82\",\"title\":\"家属：葛氏\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"574\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老三)\",\"id\":\"80\",\"title\":\"家属：周氏\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"573\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老二)\",\"id\":\"79\",\"title\":\"家属：张氏\",\"relationship\":\"111\"},{\"name\":\"第二十五世：安XX(老大)\",\"id\":\"78\",\"title\":\"家属：白氏\",\"relationship\":\"110\"}],\"name\":\"第二十四世：安XX(老大)\",\"id\":\"58\",\"title\":\"家属：刘氏\",\"relationship\":\"111\"}],\"name\":\"第二十三世：安XX(老二)\",\"id\":\"46\",\"title\":\"家属：耿氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"children\":[{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"587\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老大)\",\"id\":\"81\",\"title\":\"家属：赵霞\",\"relationship\":\"111\"}],\"name\":\"第二十四世：安XX(老三)\",\"id\":\"57\",\"title\":\"家属：刘氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"114\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老四)\",\"id\":\"77\",\"title\":\"家属：郭氏\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"113\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老三)\",\"id\":\"76\",\"title\":\"家属：杨氏\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十六世：安XX(老二)\",\"id\":\"112\",\"title\":\"家属：无\",\"relationship\":\"110\"},{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"111\",\"title\":\"家属：刘氏\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老二)\",\"id\":\"75\",\"title\":\"家属：黄氏\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十六世：安XX(老二)\",\"id\":\"110\",\"title\":\"家属：赵氏\",\"relationship\":\"110\"},{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"109\",\"title\":\"家属：耿氏\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老大)\",\"id\":\"74\",\"title\":\"家属：王氏\",\"relationship\":\"111\"}],\"name\":\"第二十四世：安XX(老二)\",\"id\":\"56\",\"title\":\"家属：黄氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"children\":[{\"name\":\"第二十七世：安XX(老大)\",\"id\":\"128\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十六世：安XX(老二)\",\"id\":\"108\",\"title\":\"家属：段氏\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十七世：安XX(老二)\",\"id\":\"127\",\"title\":\"家属：无\",\"relationship\":\"110\"},{\"name\":\"第二十七世：安XX(老大)\",\"id\":\"126\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十六世：安XX(老大)\",\"id\":\"107\",\"title\":\"家属：刘氏\",\"relationship\":\"111\"}],\"name\":\"第二十五世：安XX(老大)\",\"id\":\"73\",\"title\":\"家属：刘氏\",\"relationship\":\"111\"}],\"name\":\"第二十四世：安XX(老大)\",\"id\":\"55\",\"title\":\"家属：张氏\",\"relationship\":\"111\"}],\"name\":\"第二十三世：安XX(老大)\",\"id\":\"45\",\"title\":\"家属：郭氏\",\"relationship\":\"111\"}],\"name\":\"第二十二世：安XX(老大)\",\"id\":\"38\",\"title\":\"家属：刘氏\",\"relationship\":\"111\"}],\"name\":\"第二十一世：安XX(老三)\",\"id\":\"31\",\"title\":\"家属：刘氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"name\":\"第二十三世：安XX(老二)\",\"id\":\"44\",\"title\":\"家属：郝氏\",\"relationship\":\"110\"},{\"children\":[{\"children\":[{\"children\":[{\"children\":[{\"name\":\"第二十七世：安XX(老二)\",\"id\":\"609\",\"title\":\"家属：无\",\"relationship\":\"110\"},{\"name\":\"第二十七世：安XX(老大)\",\"id\":\"572\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十六世：安XX(老二)\",\"id\":\"106\",\"title\":\"家属：吴东芳，师敏娟\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十七世：安XX(老大)\",\"id\":\"608\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十六世：安XX(老大)\",\"id\":\"105\",\"title\":\"家属：苏焕英\",\"relationship\":\"111\"}],\"name\":\"第二十五世：安XX(老大)\",\"id\":\"72\",\"title\":\"家属：申氏\",\"relationship\":\"111\"}],\"name\":\"第二十四世：安XX(老二)\",\"id\":\"54\",\"title\":\"家属：李氏\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十五世：安XX(老三)\",\"id\":\"71\",\"title\":\"家属：德州\",\"relationship\":\"110\"},{\"children\":[{\"name\":\"第二十六世：安XX(老二)\",\"id\":\"311\",\"title\":\"家属：无\",\"relationship\":\"110\"},{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"310\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老二)\",\"id\":\"70\",\"title\":\"家属：王氏\",\"relationship\":\"111\"},{\"name\":\"第二十五世：安XX(老大)\",\"id\":\"69\",\"title\":\"家属：董氏\",\"relationship\":\"110\"}],\"name\":\"第二十四世：安XX(老大)\",\"id\":\"53\",\"title\":\"家属：王氏\",\"relationship\":\"111\"}],\"name\":\"第二十三世：安XX(老大)\",\"id\":\"43\",\"title\":\"家属：王氏\",\"relationship\":\"111\"}],\"name\":\"第二十二世：安XX(老大)\",\"id\":\"37\",\"title\":\"家属：王氏\",\"relationship\":\"111\"}],\"name\":\"第二十一世：安XX(老二)\",\"id\":\"30\",\"title\":\"家属：姚氏，刘氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"children\":[{\"children\":[{\"children\":[{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"104\",\"title\":\"家属：张氏\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老二)\",\"id\":\"68\",\"title\":\"家属：王氏\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十六世：安XX(老三)\",\"id\":\"103\",\"title\":\"家属：无\",\"relationship\":\"110\"},{\"name\":\"第二十六世：安XX(老二)\",\"id\":\"102\",\"title\":\"家属：刘氏\",\"relationship\":\"110\"},{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"101\",\"title\":\"家属：？氏\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老大)\",\"id\":\"67\",\"title\":\"家属：申氏\",\"relationship\":\"111\"}],\"name\":\"第二十四世：安XX(老大)\",\"id\":\"52\",\"title\":\"家属：赵氏\",\"relationship\":\"111\"}],\"name\":\"第二十三世：安XX(老大)\",\"id\":\"42\",\"title\":\"家属：刘氏\",\"relationship\":\"111\"}],\"name\":\"第二十二世：安XX(老三)\",\"id\":\"36\",\"title\":\"家属：王氏，刘氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"children\":[{\"name\":\"第二十五世：安XX(老大)\",\"id\":\"66\",\"title\":\"家属：郭氏\",\"relationship\":\"110\"}],\"name\":\"第二十四世：安XX(老三)\",\"id\":\"51\",\"title\":\"家属：周氏\",\"relationship\":\"111\"},{\"name\":\"第二十四世：安XX(老大)\",\"id\":\"50\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十三世：安XX(老二)\",\"id\":\"41\",\"title\":\"家属：朱氏，郭氏，杨氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"children\":[{\"children\":[{\"name\":\"第二十七世：安XX(老二)\",\"id\":\"125\",\"title\":\"家属：刘氏\",\"relationship\":\"110\"},{\"name\":\"第二十七世：安XX(老大)\",\"id\":\"124\",\"title\":\"家属：马氏\",\"relationship\":\"110\"}],\"name\":\"第二十六世：安XX(老三)\",\"id\":\"100\",\"title\":\"家属：？氏\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十七世：安XX(老大)\",\"id\":\"123\",\"title\":\"家属：？氏\",\"relationship\":\"110\"}],\"name\":\"第二十六世：安XX(老二)\",\"id\":\"99\",\"title\":\"家属：刘氏\",\"relationship\":\"111\"},{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"98\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老大)\",\"id\":\"65\",\"title\":\"家属：吴氏\",\"relationship\":\"111\"}],\"name\":\"第二十四世：安XX(老大)\",\"id\":\"49\",\"title\":\"家属：赵氏\",\"relationship\":\"111\"}],\"name\":\"第二十三世：安XX(老大)\",\"id\":\"40\",\"title\":\"家属：赵氏\",\"relationship\":\"111\"}],\"name\":\"第二十二世：安XX(老二)\",\"id\":\"35\",\"title\":\"家属：占氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"children\":[{\"children\":[{\"name\":\"第二十六世：安XX(老大)\",\"id\":\"97\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十五世：安XX(老四)\",\"id\":\"64\",\"title\":\"家属：李氏\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十六世：安XX(老三)\",\"id\":\"96\",\"title\":\"家属：无\",\"relationship\":\"110\"},{\"children\":[{\"name\":\"第二十七世：安XX(老大)\",\"id\":\"122\",\"title\":\"家属：耿氏\",\"relationship\":\"110\"}],\"name\":\"第二十六世：安XX(老二)\",\"id\":\"95\",\"title\":\"家属：？氏\",\"relationship\":\"111\"}],\"name\":\"第二十五世：安XX(老三)\",\"id\":\"63\",\"title\":\"家属：赵氏\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十六世：安XX(老五)\",\"id\":\"94\",\"title\":\"家属：\",\"relationship\":\"110\"},{\"children\":[{\"name\":\"第二十七世：安XX(老大)\",\"id\":\"121\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十六世：安XX(老四)\",\"id\":\"93\",\"title\":\"家属：孙氏\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十七世：安XX(老大)\",\"id\":\"120\",\"title\":\"家属：夏氏\",\"relationship\":\"110\"}],\"name\":\"第二十六世：安XX(老三)\",\"id\":\"92\",\"title\":\"家属：？？\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十七世：安XX(老大)\",\"id\":\"119\",\"title\":\"家属：曹氏\",\"relationship\":\"110\"}],\"name\":\"第二十六世：安XX(老二)\",\"id\":\"91\",\"title\":\"家属：耿氏\",\"relationship\":\"111\"},{\"children\":[{\"children\":[{\"name\":\"第二十八世：安XX(老大)\",\"id\":\"615\",\"title\":\"家属：无\",\"relationship\":\"110\"}],\"name\":\"第二十七世：安XX(老二)\",\"id\":\"118\",\"title\":\"家属：冯慧林\",\"relationship\":\"111\"},{\"name\":\"第二十七世：安XX(老大)\",\"id\":\"117\",\"title\":\"家属：曹氏\",\"relationship\":\"110\"}],\"name\":\"第二十六世：安XX(老大)\",\"id\":\"90\",\"title\":\"家属：杨氏\",\"relationship\":\"111\"}],\"name\":\"第二十五世：安XX(老二)\",\"id\":\"62\",\"title\":\"家属：郭氏\",\"relationship\":\"111\"},{\"children\":[{\"name\":\"第二十六世：安XX(老二)\",\"id\":\"89\",\"title\":\"家属：刘氏\",\"relationship\":\"110\"},{\"children\":[{\"name\":\"第二十七世：安XX(老二)\",\"id\":\"116\",\"title\":\"家属：无\",\"relationship\":\"110\"},{\"name\":\"第二十七世：安XX(老大)\",\"id\":\"115\",\"title\":\"家属：刘氏\",\"relationship\":\"110\"}],\"name\":\"第二十六世：安XX(老大)\",\"id\":\"88\",\"title\":\"家属：刘氏\",\"relationship\":\"111\"}],\"name\":\"第二十五世：安XX(老大)\",\"id\":\"61\",\"title\":\"家属：刘氏\",\"relationship\":\"111\"}],\"name\":\"第二十四世：安XX(老大)\",\"id\":\"48\",\"title\":\"家属：杨氏\",\"relationship\":\"111\"}],\"name\":\"第二十三世：安XX(老大)\",\"id\":\"39\",\"title\":\"家属：刘氏\",\"relationship\":\"111\"}],\"name\":\"第二十二世：安XX(老大)\",\"id\":\"34\",\"title\":\"家属：赵氏，田氏\",\"relationship\":\"111\"}],\"name\":\"第二十一世：安XX(老大)\",\"id\":\"29\",\"title\":\"家属：魏氏，耿氏\",\"relationship\":\"111\"}],\"name\":\"第二十世：安XX(老大)\",\"id\":\"27\",\"title\":\"家属：王氏，尹氏\",\"relationship\":\"111\"}],\"name\":\"第十九世：安XX(老大)\",\"id\":\"25\",\"title\":\"家属：崔氏\",\"relationship\":\"111\"}],\"name\":\"第十八世：安XX(老大)\",\"id\":\"24\",\"title\":\"家属：刘氏，于氏\",\"relationship\":\"111\"}],\"name\":\"第十七世：安XX(老大)\",\"id\":\"23\",\"title\":\"家属：黄氏\",\"relationship\":\"111\"}],\"name\":\"第十六世：安XX(老大)\",\"id\":\"1\",\"title\":\"家属：无\",\"relationship\":\"001\"}', 'orgTree', null, null, null, null, null, null, null, '2021-01-27');
INSERT INTO `gen_message` VALUES ('2', '登录说明', '<p style=\"white-space: normal;\">一：登录者必须是安氏家谱中的人员。</p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\">二：登录过程中如果存在重名情况，会打开重名人员名单，选择一名人员进行登录即可。</p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\">三：登录后组织树是可以点击节点查看下级或上级人员信息，树形结构支持放大缩小操作。</p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\">四：如果登录失败，可能是家谱中记录的名字和真实名字存在不一致情况，您可以输入其他亲友的名字进行登录查询出自己的名字。</p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\">五：登录名称可输入“全名”直接进行登录成功（存在情况）。也可以输入简单名字如：安X、X乐等，会将相关的用户都查询出来，选择登录即可。</p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\">六：如果多次尝试无法登录可联系：青锋（微信号：QF_qingfeng1024）进行咨询。</p><p style=\"white-space: normal;\"><br/></p><p style=\"white-space: normal;\">七：如果对家谱在线展示有更好的方式体现，更好的想法，可以反馈给我们进行修改，争取继续完善，更方法大家的使用。反馈信息（微信号：QF_qingfeng1024）</p><p><br/></p>', 'dlsm', 'Y', '1', '1', '2', '25', 'org25_', '2019-01-13 13:44:15', '2021-01-27 21:57:28');

-- ----------------------------
-- Table structure for gen_record
-- ----------------------------
DROP TABLE IF EXISTS `gen_record`;
CREATE TABLE `gen_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `content` varchar(5000) DEFAULT NULL,
  `create_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2364 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gen_record
-- ----------------------------

-- ----------------------------
-- Table structure for system_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `system_dictionary`;
CREATE TABLE `system_dictionary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dic_cascade` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_user` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_organize` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_org_cascade` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_time` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of system_dictionary
-- ----------------------------
INSERT INTO `system_dictionary` VALUES ('1', 'dic1_', '接口管理', '接口管理', '0', '0', '1', '', '2', '25', 'org25_', '2018-12-20 15:46:09', '2018-12-20 15:46:09');
INSERT INTO `system_dictionary` VALUES ('2', 'dic1_2_', '接口分类', '接口分类', '1', '0', '1', '', '2', '25', 'org25_', '2018-12-20 15:46:20', '2018-12-20 15:46:20');
INSERT INTO `system_dictionary` VALUES ('3', 'dic1_2_3_', '企业管理部', '企业管理部', '2', '0', '1', '', '2', '25', 'org25_', '2018-12-20 15:47:14', '2018-12-20 15:47:14');
INSERT INTO `system_dictionary` VALUES ('4', 'dic1_2_4_', '工程和设备材料部', '工程和设备材料部', '2', '0', '2', '', '2', '25', 'org25_', '2018-12-20 15:47:14', '2018-12-20 15:47:14');
INSERT INTO `system_dictionary` VALUES ('5', 'dic1_2_5_', '安全运营部', '安全运营部', '2', '0', '3', '', '2', '25', 'org25_', '2018-12-20 15:47:14', '2018-12-20 15:47:14');
INSERT INTO `system_dictionary` VALUES ('6', 'dic6_', '家谱管理', '家谱管理', '0', '0', '2', '', '2', '25', 'org25_', '2019-01-01 19:38:09', '2019-01-01 19:38:09');
INSERT INTO `system_dictionary` VALUES ('7', 'dic6_7_', '家谱人员排行', '家谱人员排行', '6', '0', '1', '', '2', '25', 'org25_', '2019-01-01 19:38:29', '2019-01-01 19:38:29');
INSERT INTO `system_dictionary` VALUES ('8', 'dic6_7_8_', '老大', '老大', '7', '0', '1', '', '2', '25', 'org25_', '2019-01-01 19:39:41', '2019-01-01 19:39:41');
INSERT INTO `system_dictionary` VALUES ('9', 'dic6_7_9_', '老二', '老二', '7', '0', '2', '', '2', '25', 'org25_', '2019-01-01 19:39:41', '2019-01-01 19:39:41');
INSERT INTO `system_dictionary` VALUES ('10', 'dic6_7_10_', '老三', '老三', '7', '0', '3', '', '2', '25', 'org25_', '2019-01-01 19:39:41', '2019-01-01 19:39:41');
INSERT INTO `system_dictionary` VALUES ('11', 'dic6_7_11_', '老四', '老四', '7', '0', '4', '', '2', '25', 'org25_', '2019-01-01 19:39:41', '2019-01-01 19:39:41');
INSERT INTO `system_dictionary` VALUES ('12', 'dic6_7_12_', '老五', '老五', '7', '0', '5', '', '2', '25', 'org25_', '2019-01-01 19:39:41', '2019-01-01 19:39:41');
INSERT INTO `system_dictionary` VALUES ('13', 'dic6_7_13_', '老六', '老六', '7', '0', '6', '', '2', '25', 'org25_', '2019-01-01 19:39:41', '2019-01-01 19:39:41');
INSERT INTO `system_dictionary` VALUES ('14', 'dic6_7_14_', '老七', '老七', '7', '0', '7', '', '2', '25', 'org25_', '2019-01-01 19:39:41', '2019-01-01 19:39:41');
INSERT INTO `system_dictionary` VALUES ('15', 'dic6_7_15_', '老八', '老八', '7', '0', '8', '', '2', '25', 'org25_', '2019-01-01 19:39:41', '2019-01-01 19:39:41');
INSERT INTO `system_dictionary` VALUES ('16', 'dic6_7_16_', '老九', '老九', '7', '0', '9', '', '2', '25', 'org25_', '2019-01-01 19:39:41', '2019-01-01 19:39:41');
INSERT INTO `system_dictionary` VALUES ('17', 'dic6_7_17_', '老十', '老十', '7', '0', '10', '', '2', '25', 'org25_', '2019-01-01 19:39:41', '2019-01-01 19:39:41');

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classify` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_cascade` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_user` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_organize` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_org_cascade` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_time` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1488 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of system_menu
-- ----------------------------
INSERT INTO `system_menu` VALUES ('1', '0', 'menu', '系统管理', 'xtgl', '0', null, 'fa-cubes', 'menu', '0', '4', null, '2', null, null, '2018-09-01 23:24:10', '2018-12-05 09:59:48');
INSERT INTO `system_menu` VALUES ('43', null, 'menu43_', '系统管理', 'system', '1', '', 'fa-cubes', 'menu', '1', '1', '', '2', null, null, '2018-09-01 23:24:10', '2018-09-01 23:24:10');
INSERT INTO `system_menu` VALUES ('44', '0', 'menu43_44_', '用户信息', 'yhxx', '43', '/system/user/index.do', '', 'menu', '2', '1', '', '2', null, null, '2018-09-01 23:26:38', '2018-09-17 16:52:11');
INSERT INTO `system_menu` VALUES ('45', '', 'menu43_45_', '角色信息', 'jsxx', '43', '/system/role/index.do', '', 'menu', '2', '2', '', '2', null, null, '2018-09-01 23:26:39', '2018-09-02 00:19:21');
INSERT INTO `system_menu` VALUES ('46', '', 'menu43_46_', '组织管理', 'zzxx', '43', '/system/organize/index.do', '', 'menu', '2', '3', '', '2', null, null, '2018-09-01 23:26:39', '2018-09-02 00:43:35');
INSERT INTO `system_menu` VALUES ('48', '', 'menu43_48_', '菜单信息', 'cdxx', '43', '/system/menu/index.do', '', 'menu', '2', '5', '', '2', null, null, '2018-09-01 23:26:40', '2018-09-02 00:46:13');
INSERT INTO `system_menu` VALUES ('56', null, 'menu43_45__2018090200192157344616', '添加', 'add', '45', null, null, 'button', '3', '1', null, '2', null, null, '2018-09-02 00:19:21', '2018-09-02 00:19:21');
INSERT INTO `system_menu` VALUES ('57', null, 'menu43_45__2018090200192174380067', '编辑', 'edit', '45', null, null, 'button', '3', '2', null, '2', null, null, '2018-09-02 00:19:21', '2018-09-02 00:19:21');
INSERT INTO `system_menu` VALUES ('58', null, 'menu43_45__2018090200192191159072', '删除', 'del', '45', null, null, 'button', '3', '3', null, '2', null, null, '2018-09-02 00:19:21', '2018-09-02 00:19:21');
INSERT INTO `system_menu` VALUES ('59', null, 'menu43_45__2018090200192206713982', '查看', 'info', '45', null, null, 'button', '3', '4', null, '2', null, null, '2018-09-02 00:19:21', '2018-09-02 00:19:21');
INSERT INTO `system_menu` VALUES ('60', null, 'menu43_45__2018090200192222680132', '权限', 'auth', '45', null, null, 'button', '3', '5', null, '2', null, null, '2018-09-02 00:19:21', '2018-09-02 00:19:21');
INSERT INTO `system_menu` VALUES ('62', null, 'menu43_46__2018090200433604047364', '添加', 'add', '46', null, null, 'button', '3', '1', null, '2', null, null, '2018-09-02 00:43:35', '2018-09-02 00:43:35');
INSERT INTO `system_menu` VALUES ('63', null, 'menu43_46__2018090200433618639273', '批量添加', 'addMore', '46', null, null, 'button', '3', '2', null, '2', null, null, '2018-09-02 00:43:35', '2018-09-02 00:43:35');
INSERT INTO `system_menu` VALUES ('64', null, 'menu43_46__2018090200433635340003', '编辑', 'edit', '46', null, null, 'button', '3', '3', null, '2', null, null, '2018-09-02 00:43:35', '2018-09-02 00:43:35');
INSERT INTO `system_menu` VALUES ('65', null, 'menu43_46__2018090200433649785866', '删除', 'del', '46', null, null, 'button', '3', '4', null, '2', null, null, '2018-09-02 00:43:35', '2018-09-02 00:43:35');
INSERT INTO `system_menu` VALUES ('66', null, 'menu43_46__2018090200433664380757', '查看', 'info', '46', null, null, 'button', '3', '5', null, '2', null, null, '2018-09-02 00:43:35', '2018-09-02 00:43:35');
INSERT INTO `system_menu` VALUES ('77', null, 'menu43_48__2018090200461360755961', '添加', 'add', '48', null, null, 'button', '3', '1', null, '2', null, null, '2018-09-02 00:46:13', '2018-09-02 00:46:13');
INSERT INTO `system_menu` VALUES ('78', null, 'menu43_48__2018090200461374883211', '批量添加', 'addMore', '48', null, null, 'button', '3', '2', null, '2', null, null, '2018-09-02 00:46:13', '2018-09-02 00:46:13');
INSERT INTO `system_menu` VALUES ('79', null, 'menu43_48__2018090200461389042692', '编辑', 'edit', '48', null, null, 'button', '3', '3', null, '2', null, null, '2018-09-02 00:46:13', '2018-09-02 00:46:13');
INSERT INTO `system_menu` VALUES ('80', null, 'menu43_48__2018090200461403086930', '删除', 'del', '48', null, null, 'button', '3', '4', null, '2', null, null, '2018-09-02 00:46:13', '2018-09-02 00:46:13');
INSERT INTO `system_menu` VALUES ('81', null, 'menu43_48__2018090200461417430245', '查看', 'info', '48', null, null, 'button', '3', '5', null, '2', null, null, '2018-09-02 00:46:13', '2018-09-02 00:46:13');
INSERT INTO `system_menu` VALUES ('311', '0', 'menu43_44__2018091716521153045642', '添加', 'add', '44', null, null, 'button', '3', '1', null, '1', null, null, '2018-09-17 16:52:11', '2018-09-17 16:52:11');
INSERT INTO `system_menu` VALUES ('312', '0', 'menu43_44__2018091716521169766632', '批量添加', 'addMore', '44', null, null, 'button', '3', '2', null, '1', null, null, '2018-09-17 16:52:11', '2018-09-17 16:52:11');
INSERT INTO `system_menu` VALUES ('313', '0', 'menu43_44__2018091716521185142105', '编辑', 'edit', '44', null, null, 'button', '3', '3', null, '1', null, null, '2018-09-17 16:52:11', '2018-09-17 16:52:11');
INSERT INTO `system_menu` VALUES ('314', '0', 'menu43_44__2018091716521200819370', '删除', 'del', '44', null, null, 'button', '3', '4', null, '1', null, null, '2018-09-17 16:52:11', '2018-09-17 16:52:11');
INSERT INTO `system_menu` VALUES ('315', '0', 'menu43_44__2018091716521216155283', '详情', 'info', '44', null, null, 'button', '3', '5', null, '1', null, null, '2018-09-17 16:52:11', '2018-09-17 16:52:11');
INSERT INTO `system_menu` VALUES ('316', '0', 'menu43_44__2018091716521232824573', '权限', 'auth', '44', null, null, 'button', '3', '6', null, '1', null, null, '2018-09-17 16:52:11', '2018-09-17 16:52:11');
INSERT INTO `system_menu` VALUES ('317', '0', 'menu43_44__2018091716521249127054', '模板下载', 'mould', '44', null, null, 'button', '3', '7', null, '1', null, null, '2018-09-17 16:52:11', '2018-09-17 16:52:11');
INSERT INTO `system_menu` VALUES ('318', '0', 'menu43_44__2018091716521265024033', '批量导入', 'import', '44', null, null, 'button', '3', '8', null, '1', null, null, '2018-09-17 16:52:11', '2018-09-17 16:52:11');
INSERT INTO `system_menu` VALUES ('1451', '0', 'menu1451_', '族谱管理', 'gen', '0', '', '&#xe656;', 'menu', '0', '3', '', '2', '25', 'org25_', '2018-12-31 18:17:31', '2018-12-31 18:17:31');
INSERT INTO `system_menu` VALUES ('1452', '0', 'menu1451_1452_', '族谱设置', 'gen_set', '1451', '', '&#xe614;', 'menu', '1', '1', '', '2', '25', 'org25_', '2018-12-31 18:19:18', '2018-12-31 18:19:18');
INSERT INTO `system_menu` VALUES ('1453', '0', 'menu1451_1452_1453_', '家族信息', 'family', '1452', '/gen/family/index.do', '', 'menu', '2', '1', '', '2', '25', 'org25_', '2018-12-31 18:22:03', '2018-12-31 18:22:49');
INSERT INTO `system_menu` VALUES ('1454', '0', 'menu1451_1452_1454_', '世代信息', 'generation', '1452', '/gen/generation/index.do', '', 'menu', '2', '2', '', '2', '25', 'org25_', '2018-12-31 18:22:03', '2018-12-31 18:23:21');
INSERT INTO `system_menu` VALUES ('1455', '0', 'menu1451_1452_1455_', '人员信息', 'member', '1452', '/gen/member/index.do', '', 'menu', '2', '3', '', '2', '25', 'org25_', '2018-12-31 18:22:03', '2018-12-31 18:23:47');
INSERT INTO `system_menu` VALUES ('1456', '0', 'menu1451_1452_1453__2018123118224934092767', '添加', 'add', '1453', null, null, 'button', '3', '1', null, '2', null, null, '2018-12-31 18:22:49', '2018-12-31 18:22:49');
INSERT INTO `system_menu` VALUES ('1457', '0', 'menu1451_1452_1453__2018123118224934760907', '编辑', 'edit', '1453', null, null, 'button', '3', '2', null, '2', null, null, '2018-12-31 18:22:49', '2018-12-31 18:22:49');
INSERT INTO `system_menu` VALUES ('1458', '0', 'menu1451_1452_1453__2018123118224935045938', '删除', 'del', '1453', null, null, 'button', '3', '3', null, '2', null, null, '2018-12-31 18:22:49', '2018-12-31 18:22:49');
INSERT INTO `system_menu` VALUES ('1459', '0', 'menu1451_1452_1453__2018123118224935475435', '详情', 'info', '1453', null, null, 'button', '3', '4', null, '2', null, null, '2018-12-31 18:22:49', '2018-12-31 18:22:49');
INSERT INTO `system_menu` VALUES ('1460', '0', 'menu1451_1452_1454__2018123118232132273247', '添加', 'add', '1454', null, null, 'button', '3', '1', null, '2', null, null, '2018-12-31 18:23:21', '2018-12-31 18:23:21');
INSERT INTO `system_menu` VALUES ('1461', '0', 'menu1451_1452_1454__2018123118232132652422', '编辑', 'edit', '1454', null, null, 'button', '3', '2', null, '2', null, null, '2018-12-31 18:23:21', '2018-12-31 18:23:21');
INSERT INTO `system_menu` VALUES ('1462', '0', 'menu1451_1452_1454__2018123118232133098106', '删除', 'del', '1454', null, null, 'button', '3', '3', null, '2', null, null, '2018-12-31 18:23:21', '2018-12-31 18:23:21');
INSERT INTO `system_menu` VALUES ('1463', '0', 'menu1451_1452_1454__2018123118232133715144', '详情', 'info', '1454', null, null, 'button', '3', '4', null, '2', null, null, '2018-12-31 18:23:21', '2018-12-31 18:23:21');
INSERT INTO `system_menu` VALUES ('1464', '0', 'menu1451_1452_1455__2018123118234738756259', '添加', 'add', '1455', null, null, 'button', '3', '1', null, '2', null, null, '2018-12-31 18:23:47', '2018-12-31 18:23:47');
INSERT INTO `system_menu` VALUES ('1465', '0', 'menu1451_1452_1455__2018123118234739165064', '编辑', 'edit', '1455', null, null, 'button', '3', '2', null, '2', null, null, '2018-12-31 18:23:47', '2018-12-31 18:23:47');
INSERT INTO `system_menu` VALUES ('1466', '0', 'menu1451_1452_1455__2018123118234739856122', '删除', 'del', '1455', null, null, 'button', '3', '3', null, '2', null, null, '2018-12-31 18:23:47', '2018-12-31 18:23:47');
INSERT INTO `system_menu` VALUES ('1467', '0', 'menu1451_1452_1455__2018123118234740256661', '详情', 'info', '1455', null, null, 'button', '3', '4', null, '2', null, null, '2018-12-31 18:23:47', '2018-12-31 18:23:47');
INSERT INTO `system_menu` VALUES ('1468', '0', 'menu1451_1468_', '族谱展示', 'zps', '1451', '', '', 'menu', '1', '2', '', '2', '25', 'org25_', '2019-01-02 09:42:39', '2019-01-02 09:42:54');
INSERT INTO `system_menu` VALUES ('1469', '0', 'menu1451_1468_1469_', '族谱树展示', 'zpszz', '1468', '/gen/show/tree.do', '', 'menu', '2', '1', '', '2', '25', 'org25_', '2019-01-02 09:44:09', '2019-01-02 10:21:48');
INSERT INTO `system_menu` VALUES ('1471', '0', 'menu1451_1468_1471_', '族谱树展示（全）', 'zpsq', '1468', '/gen/show/treeAll.do', '&#xe857;', 'menu', '2', '2', '', '2', '25', 'org25_', '2019-01-02 10:51:03', '2019-01-02 10:51:03');
INSERT INTO `system_menu` VALUES ('1472', '0', 'menu1451_1452_1472_', '人员树形信息', 'tree', '1452', '/gen/member/treeIndex.do', '&#xe66f;', 'menu', '2', '4', '', '2', '25', 'org25_', '2019-01-06 16:43:34', '2019-01-06 16:43:34');
INSERT INTO `system_menu` VALUES ('1473', '0', 'menu1451_1452_1472_2019010616433456622788', '添加', 'add', '1472', null, null, 'button', '3', '1', null, '2', null, null, '2019-01-06 16:43:34', '2019-01-06 16:43:34');
INSERT INTO `system_menu` VALUES ('1474', '0', 'menu1451_1452_1472_2019010616433457183847', '删除', 'del', '1472', null, null, 'button', '3', '2', null, '2', null, null, '2019-01-06 16:43:34', '2019-01-06 16:43:34');
INSERT INTO `system_menu` VALUES ('1475', '0', 'menu1451_1452_1472_2019010616433457572057', '编辑', 'edit', '1472', null, null, 'button', '3', '3', null, '2', null, null, '2019-01-06 16:43:34', '2019-01-06 16:43:34');
INSERT INTO `system_menu` VALUES ('1476', '0', 'menu1451_1452_1472_2019010616433458445421', '详情', 'info', '1472', null, null, 'button', '3', '4', null, '2', null, null, '2019-01-06 16:43:34', '2019-01-06 16:43:34');
INSERT INTO `system_menu` VALUES ('1477', '0', 'menu1451_1468_1477_', '扫码访问日志', 'smfwjl', '1468', '/gen/record/index.do', '&#xe60e;', 'menu', '2', '3', '', '2', '25', 'org25_', '2019-01-11 16:28:35', '2019-01-11 16:28:35');
INSERT INTO `system_menu` VALUES ('1478', '0', 'menu1451_1452_1478_', '登录说明设置', 'dlsm', '1452', '/gen/message/index.do?type=dlsm', '', 'menu', '2', '5', '', '2', '25', 'org25_', '2019-01-13 11:26:50', '2019-01-13 12:07:42');
INSERT INTO `system_menu` VALUES ('1483', '0', 'menu1451_1452_1478__2019011312074333744676', '添加', 'add', '1478', null, null, 'button', '3', '1', null, '2', null, null, '2019-01-13 12:07:42', '2019-01-13 12:07:42');
INSERT INTO `system_menu` VALUES ('1484', '0', 'menu1451_1452_1478__2019011312074348548348', '编辑', 'edit', '1478', null, null, 'button', '3', '2', null, '2', null, null, '2019-01-13 12:07:42', '2019-01-13 12:07:42');
INSERT INTO `system_menu` VALUES ('1485', '0', 'menu1451_1452_1478__2019011312074363848780', '删除', 'del', '1478', null, null, 'button', '3', '3', null, '2', null, null, '2019-01-13 12:07:42', '2019-01-13 12:07:42');
INSERT INTO `system_menu` VALUES ('1486', '0', 'menu1451_1452_1478__2019011312074379129812', '详情', 'info', '1478', null, null, 'button', '3', '4', null, '2', null, null, '2019-01-13 12:07:42', '2019-01-13 12:07:42');
INSERT INTO `system_menu` VALUES ('1487', '0', 'menu1451_1452_1478__2019011312074395942125', '状态管理', 'status', '1478', null, null, 'button', '3', '5', null, '2', null, null, '2019-01-13 12:07:42', '2019-01-13 12:07:42');

-- ----------------------------
-- Table structure for system_organize
-- ----------------------------
DROP TABLE IF EXISTS `system_organize`;
CREATE TABLE `system_organize` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_cascade` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fg_leader` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bm_leader` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sj_leader` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_user` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_organize` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_org_cascade` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_time` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of system_organize
-- ----------------------------
INSERT INTO `system_organize` VALUES ('25', 'org25_', '安氏组织结构', '安氏组织结构', '0', '0', '1', '1', '安氏组织结构', '2018082720114697322625', '0', null, null, null, '1', null, null, '2018-08-27 20:11:46', '2019-01-10 15:43:58');
INSERT INTO `system_organize` VALUES ('26', 'org25_26_', '安氏（家谱）', '安氏（家谱）', '0', '25', '1', '1', '', '2019011015485311116492', null, null, null, null, '2', '25', 'org25_', '2019-01-10 15:48:53', '2021-01-27 21:45:06');
INSERT INTO `system_organize` VALUES ('27', 'org25_27_', '其他地方安氏', '其他地方安氏', '0', '25', '2', '1', '其他地方安氏', '2019011015490325654946', null, null, null, null, '2', '25', 'org25_', '2019-01-10 15:49:03', '2019-01-10 15:49:03');

-- ----------------------------
-- Table structure for system_role
-- ----------------------------
DROP TABLE IF EXISTS `system_role`;
CREATE TABLE `system_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_by` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_user` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_organize` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_org_cascade` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_time` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of system_role
-- ----------------------------
INSERT INTO `system_role` VALUES ('11', '超级管理员', '超级管理员', null, '1', null, '1', '1', null, null, '2018-09-02 13:23:44', '2019-01-10 15:49:14');
INSERT INTO `system_role` VALUES ('13', '业务管理员', '业务管理员', null, '3', null, '', '2', '25', 'org25_', '2018-09-25 13:53:46', '2019-01-10 15:45:46');

-- ----------------------------
-- Table structure for system_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_role_menu`;
CREATE TABLE `system_role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_user` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33762 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of system_role_menu
-- ----------------------------
INSERT INTO `system_role_menu` VALUES ('33556', '11', '0', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33557', '11', '1451', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33558', '11', '1452', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33559', '11', '1453', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33560', '11', '1456', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33561', '11', '1457', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33562', '11', '1458', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33563', '11', '1459', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33564', '11', '1454', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33565', '11', '1460', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33566', '11', '1461', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33567', '11', '1462', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33568', '11', '1463', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33569', '11', '1455', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33570', '11', '1464', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33571', '11', '1465', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33572', '11', '1466', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33573', '11', '1467', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33574', '11', '1472', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33575', '11', '1473', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33576', '11', '1474', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33577', '11', '1475', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33578', '11', '1476', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33579', '11', '1478', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33580', '11', '1483', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33581', '11', '1484', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33582', '11', '1485', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33583', '11', '1486', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33584', '11', '1487', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33585', '11', '1468', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33586', '11', '1469', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33587', '11', '1471', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33588', '11', '1477', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33589', '11', '1', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33590', '11', '43', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33592', '11', '1448', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33593', '11', '1449', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33594', '11', '1450', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33595', '11', '44', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33596', '11', '311', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33597', '11', '312', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33598', '11', '313', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33599', '11', '314', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33600', '11', '315', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33601', '11', '316', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33602', '11', '317', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33603', '11', '318', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33604', '11', '45', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33605', '11', '56', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33606', '11', '57', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33607', '11', '58', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33608', '11', '59', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33609', '11', '60', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33610', '11', '46', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33611', '11', '62', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33612', '11', '63', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33613', '11', '64', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33614', '11', '65', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33615', '11', '66', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33617', '11', '72', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33618', '11', '73', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33619', '11', '74', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33620', '11', '75', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33621', '11', '76', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33622', '11', '48', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33623', '11', '77', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33624', '11', '78', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33625', '11', '79', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33626', '11', '80', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33627', '11', '81', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33629', '11', '381', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33630', '11', '382', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33631', '11', '383', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33632', '11', '384', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33633', '11', '385', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33635', '11', '1322', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33636', '11', '1323', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33637', '11', '1324', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33638', '11', '1325', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33640', '11', '343', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33641', '11', '344', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33642', '11', '345', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33643', '11', '346', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33645', '11', '1406', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33646', '11', '1407', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33648', '11', '89', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33649', '11', '93', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33650', '11', '94', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33651', '11', '95', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33652', '11', '96', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33653', '11', '90', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33654', '11', '101', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33655', '11', '102', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33656', '11', '103', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33657', '11', '104', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33658', '11', '105', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33659', '11', '91', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33660', '11', '106', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33661', '11', '107', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33662', '11', '108', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33663', '11', '109', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33664', '11', '92', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33665', '11', '110', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33666', '11', '111', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33667', '11', '112', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33668', '11', '113', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33670', '11', '186', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33671', '11', '205', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33672', '11', '206', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33673', '11', '207', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33674', '11', '208', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33676', '11', '1424', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33677', '11', '1425', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33678', '11', '1426', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33679', '11', '1427', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33680', '11', '1442', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33681', '11', '1443', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33682', '11', '1444', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33683', '11', '1445', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33684', '11', '1446', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33685', '11', '1428', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33686', '11', '1429', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33687', '11', '1430', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33688', '11', '1431', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33689', '11', '1432', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33691', '11', '1414', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33692', '11', '1326', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33693', '11', '1327', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33694', '11', '1328', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33695', '11', '1329', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33696', '11', '1330', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33697', '11', '1331', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33698', '11', '214', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33699', '11', '220', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33700', '11', '221', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33701', '11', '222', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33702', '11', '223', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33703', '11', '215', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33704', '11', '228', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33705', '11', '224', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33706', '11', '225', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33707', '11', '226', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33708', '11', '227', null, '2', '2019-01-13 12:07:52');
INSERT INTO `system_role_menu` VALUES ('33709', '13', '0', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33710', '13', '1451', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33711', '13', '1452', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33712', '13', '1453', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33713', '13', '1456', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33714', '13', '1457', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33715', '13', '1458', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33716', '13', '1459', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33717', '13', '1454', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33718', '13', '1460', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33719', '13', '1461', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33720', '13', '1462', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33721', '13', '1463', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33722', '13', '1455', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33723', '13', '1464', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33724', '13', '1465', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33725', '13', '1466', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33726', '13', '1467', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33727', '13', '1472', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33728', '13', '1473', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33729', '13', '1474', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33730', '13', '1475', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33731', '13', '1476', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33732', '13', '1478', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33733', '13', '1483', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33734', '13', '1484', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33735', '13', '1485', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33736', '13', '1486', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33737', '13', '1487', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33738', '13', '1468', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33739', '13', '1469', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33740', '13', '1471', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33741', '13', '1477', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33742', '13', '1', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33743', '13', '43', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33744', '13', '44', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33745', '13', '311', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33746', '13', '312', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33747', '13', '313', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33748', '13', '314', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33749', '13', '315', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33750', '13', '317', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33751', '13', '318', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33752', '13', '45', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33753', '13', '57', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33754', '13', '59', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33755', '13', '60', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33757', '13', '72', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33758', '13', '73', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33759', '13', '74', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33760', '13', '75', null, '2', '2019-01-13 12:09:20');
INSERT INTO `system_role_menu` VALUES ('33761', '13', '76', null, '2', '2019-01-13 12:09:20');

-- ----------------------------
-- Table structure for system_user
-- ----------------------------
DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login_password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sex` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_date` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `live_address` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_address` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `head_address` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_by` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organize_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `open_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qywx_account` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_user` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_organize` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_org_cascade` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_time` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fg_leader` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bm_leader` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sj_leader` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of system_user
-- ----------------------------
INSERT INTO `system_user` VALUES ('1', 'admin123', 'ec4a44c90fc6f37195e62d9b3f17cec5', '超级管理员', '男', 'qq@qq.ww', '', '2018-09-02', null, null, null, '0', '1', 'Y', '25', null, '', null, '1', null, null, '2018-08-30 21:26:43', '2019-02-19 13:37:42', '#', '#', '#');
INSERT INTO `system_user` VALUES ('2', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '管理员', '男', 'qq@qq.qq', '18353192647', '2018-08-30', '', '', '', null, '1', 'Y', '25', null, '901', '', '1', null, null, '2018-08-30 21:08:04', '2021-01-27 22:21:16', '#', '#', '#');
INSERT INTO `system_user` VALUES ('29', 'admin1', 'ec4a44c90fc6f37195e62d9b3f17cec5', '管理员1', '女', 'test@163.com', '15275665555', '2018-09-03', '', '', '', null, '', 'Y', '25', null, null, '', '2', '25', 'org25_', '2018-09-03 16:37:33', '2019-02-19 13:37:51', '#', '#', '#');
INSERT INTO `system_user` VALUES ('30', 'qingfeng', 'c97a3c5d07fdae4d8fc85b17a0034113', '青锋', '男', '', '', '', '', '', null, null, '', 'Y', '25', null, null, '', '2', '25', 'org25_', '2019-01-10 15:43:36', '2021-01-27 21:47:55', '#', '#', '#');

-- ----------------------------
-- Table structure for system_user_auth
-- ----------------------------
DROP TABLE IF EXISTS `system_user_auth`;
CREATE TABLE `system_user_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organize_ids` text COLLATE utf8mb4_unicode_ci,
  `organize_names` text COLLATE utf8mb4_unicode_ci,
  `create_user` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_time` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of system_user_auth
-- ----------------------------
INSERT INTO `system_user_auth` VALUES ('13', '22', '43', '1', '', '', '1', '2018-09-02 22:07:01', '2018-09-02 22:07:01');
INSERT INTO `system_user_auth` VALUES ('14', '22', '44', '3', '', '', '1', '2018-09-02 22:07:01', '2018-09-02 22:07:01');
INSERT INTO `system_user_auth` VALUES ('15', '22', '45', '5', ',@25@', ',济南云融信息技术有限公司', '1', '2018-09-02 22:07:01', '2018-09-02 22:07:01');
INSERT INTO `system_user_auth` VALUES ('16', '22', '46', '5', ',@31@', ',软件一部', '1', '2018-09-02 22:07:01', '2018-09-02 22:07:01');
INSERT INTO `system_user_auth` VALUES ('17', '22', '47', '1', '', '', '1', '2018-09-02 22:07:01', '2018-09-02 22:07:01');
INSERT INTO `system_user_auth` VALUES ('18', '22', '48', '1', '', '', '1', '2018-09-02 22:07:01', '2018-09-02 22:07:01');
INSERT INTO `system_user_auth` VALUES ('77', '29', '43', '4', '', '', '29', '2018-09-12 17:41:36', '2018-09-12 17:41:36');
INSERT INTO `system_user_auth` VALUES ('78', '29', '44', '4', '', '', '29', '2018-09-12 17:41:36', '2018-09-12 17:41:36');
INSERT INTO `system_user_auth` VALUES ('79', '29', '45', '4', '', '', '29', '2018-09-12 17:41:36', '2018-09-12 17:41:36');
INSERT INTO `system_user_auth` VALUES ('80', '29', '46', '4', '', '', '29', '2018-09-12 17:41:36', '2018-09-12 17:41:36');
INSERT INTO `system_user_auth` VALUES ('81', '29', '47', '4', '', '', '29', '2018-09-12 17:41:36', '2018-09-12 17:41:36');
INSERT INTO `system_user_auth` VALUES ('82', '29', '48', '4', '', '', '29', '2018-09-12 17:41:36', '2018-09-12 17:41:36');
INSERT INTO `system_user_auth` VALUES ('83', '29', '88', '4', '', '', '29', '2018-09-12 17:41:36', '2018-09-12 17:41:36');
INSERT INTO `system_user_auth` VALUES ('84', '29', '89', '4', '', '', '29', '2018-09-12 17:41:36', '2018-09-12 17:41:36');
INSERT INTO `system_user_auth` VALUES ('85', '29', '90', '4', '', '', '29', '2018-09-12 17:41:36', '2018-09-12 17:41:36');
INSERT INTO `system_user_auth` VALUES ('86', '29', '91', '4', '', '', '29', '2018-09-12 17:41:36', '2018-09-12 17:41:36');
INSERT INTO `system_user_auth` VALUES ('87', '29', '92', '4', '', '', '29', '2018-09-12 17:41:36', '2018-09-12 17:41:36');
INSERT INTO `system_user_auth` VALUES ('88', '29', '185', '4', '', '', '29', '2018-09-12 17:41:36', '2018-09-12 17:41:36');
INSERT INTO `system_user_auth` VALUES ('89', '29', '186', '4', '', '', '29', '2018-09-12 17:41:36', '2018-09-12 17:41:36');
INSERT INTO `system_user_auth` VALUES ('90', '29', '191', '4', '', '', '29', '2018-09-12 17:41:36', '2018-09-12 17:41:36');
INSERT INTO `system_user_auth` VALUES ('91', '29', '196', '4', '', '', '29', '2018-09-12 17:41:36', '2018-09-12 17:41:36');
INSERT INTO `system_user_auth` VALUES ('92', '29', '114', '4', '', '', '29', '2018-09-12 17:41:36', '2018-09-12 17:41:36');
INSERT INTO `system_user_auth` VALUES ('93', '29', '127', '4', '', '', '29', '2018-09-12 17:41:36', '2018-09-12 17:41:36');
INSERT INTO `system_user_auth` VALUES ('94', '29', '153', '4', '', '', '29', '2018-09-12 17:41:36', '2018-09-12 17:41:36');
INSERT INTO `system_user_auth` VALUES ('95', '29', '213', '4', '', '', '29', '2018-09-12 17:41:36', '2018-09-12 17:41:36');
INSERT INTO `system_user_auth` VALUES ('96', '29', '214', '4', '', '', '29', '2018-09-12 17:41:36', '2018-09-12 17:41:36');
INSERT INTO `system_user_auth` VALUES ('97', '29', '215', '4', '', '', '29', '2018-09-12 17:41:36', '2018-09-12 17:41:36');
INSERT INTO `system_user_auth` VALUES ('98', '1', '43', '4', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('99', '1', '44', '4', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('100', '1', '45', '4', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('101', '1', '46', '4', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('102', '1', '47', '4', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('103', '1', '48', '4', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('104', '1', '280', '1', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('105', '1', '338', '1', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('106', '1', '88', '4', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('107', '1', '89', '4', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('108', '1', '90', '4', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('109', '1', '91', '4', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('110', '1', '92', '4', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('111', '1', '185', '1', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('112', '1', '186', '1', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('113', '1', '191', '1', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('114', '1', '324', '1', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('115', '1', '319', '1', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('116', '1', '306', '1', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('117', '1', '295', '1', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('118', '1', '275', '1', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('119', '1', '213', '1', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('120', '1', '214', '1', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('121', '1', '215', '1', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('122', '1', '224', '1', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('123', '1', '347', '1', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('124', '1', '372', '1', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('125', '1', '362', '1', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('126', '1', '367', '1', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('127', '1', '357', '1', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('128', '1', '348', '4', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('129', '1', '386', '1', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('130', '1', '393', '1', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('131', '1', '387', '1', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('132', '1', '402', '1', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('133', '1', '404', '1', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('134', '1', '405', '1', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('135', '1', '406', '1', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('136', '1', '407', '1', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('137', '1', '408', '1', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('138', '1', '403', '1', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('139', '1', '409', '1', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('140', '1', '410', '1', '', '', '1', '2018-09-21 14:11:01', '2018-09-21 14:11:01');
INSERT INTO `system_user_auth` VALUES ('185', '30', '1451', '4', '', '', '2', '2019-01-10 15:49:49', '2019-01-10 15:49:49');
INSERT INTO `system_user_auth` VALUES ('186', '30', '1452', '4', '', '', '2', '2019-01-10 15:49:49', '2019-01-10 15:49:49');
INSERT INTO `system_user_auth` VALUES ('187', '30', '1453', '4', '', '', '2', '2019-01-10 15:49:49', '2019-01-10 15:49:49');
INSERT INTO `system_user_auth` VALUES ('188', '30', '1454', '4', '', '', '2', '2019-01-10 15:49:49', '2019-01-10 15:49:49');
INSERT INTO `system_user_auth` VALUES ('189', '30', '1455', '4', '', '', '2', '2019-01-10 15:49:49', '2019-01-10 15:49:49');
INSERT INTO `system_user_auth` VALUES ('190', '30', '1472', '4', '', '', '2', '2019-01-10 15:49:49', '2019-01-10 15:49:49');
INSERT INTO `system_user_auth` VALUES ('191', '30', '1468', '4', '', '', '2', '2019-01-10 15:49:49', '2019-01-10 15:49:49');
INSERT INTO `system_user_auth` VALUES ('192', '30', '1469', '4', '', '', '2', '2019-01-10 15:49:49', '2019-01-10 15:49:49');
INSERT INTO `system_user_auth` VALUES ('193', '30', '1471', '4', '', '', '2', '2019-01-10 15:49:49', '2019-01-10 15:49:49');
INSERT INTO `system_user_auth` VALUES ('194', '30', '1', '4', '', '', '2', '2019-01-10 15:49:49', '2019-01-10 15:49:49');
INSERT INTO `system_user_auth` VALUES ('195', '30', '43', '4', '', '', '2', '2019-01-10 15:49:49', '2019-01-10 15:49:49');
INSERT INTO `system_user_auth` VALUES ('196', '30', '44', '4', '', '', '2', '2019-01-10 15:49:49', '2019-01-10 15:49:49');
INSERT INTO `system_user_auth` VALUES ('197', '30', '45', '4', '', '', '2', '2019-01-10 15:49:49', '2019-01-10 15:49:49');
INSERT INTO `system_user_auth` VALUES ('198', '30', '47', '4', '', '', '2', '2019-01-10 15:49:49', '2019-01-10 15:49:49');
INSERT INTO `system_user_auth` VALUES ('199', '2', '1451', '4', '', '', '2', '2019-01-12 17:18:30', '2019-01-12 17:18:30');
INSERT INTO `system_user_auth` VALUES ('200', '2', '1452', '4', '', '', '2', '2019-01-12 17:18:30', '2019-01-12 17:18:30');
INSERT INTO `system_user_auth` VALUES ('201', '2', '1453', '4', '', '', '2', '2019-01-12 17:18:30', '2019-01-12 17:18:30');
INSERT INTO `system_user_auth` VALUES ('202', '2', '1454', '4', '', '', '2', '2019-01-12 17:18:30', '2019-01-12 17:18:30');
INSERT INTO `system_user_auth` VALUES ('203', '2', '1455', '4', '', '', '2', '2019-01-12 17:18:30', '2019-01-12 17:18:30');
INSERT INTO `system_user_auth` VALUES ('204', '2', '1472', '4', '', '', '2', '2019-01-12 17:18:30', '2019-01-12 17:18:30');
INSERT INTO `system_user_auth` VALUES ('205', '2', '1468', '4', '', '', '2', '2019-01-12 17:18:30', '2019-01-12 17:18:30');
INSERT INTO `system_user_auth` VALUES ('206', '2', '1469', '4', '', '', '2', '2019-01-12 17:18:30', '2019-01-12 17:18:30');
INSERT INTO `system_user_auth` VALUES ('207', '2', '1471', '4', '', '', '2', '2019-01-12 17:18:30', '2019-01-12 17:18:30');
INSERT INTO `system_user_auth` VALUES ('208', '2', '1477', '4', '', '', '2', '2019-01-12 17:18:30', '2019-01-12 17:18:30');
INSERT INTO `system_user_auth` VALUES ('209', '2', '1', '4', '', '', '2', '2019-01-12 17:18:30', '2019-01-12 17:18:30');
INSERT INTO `system_user_auth` VALUES ('210', '2', '43', '4', '', '', '2', '2019-01-12 17:18:30', '2019-01-12 17:18:30');
INSERT INTO `system_user_auth` VALUES ('211', '2', '1447', '4', '', '', '2', '2019-01-12 17:18:30', '2019-01-12 17:18:30');
INSERT INTO `system_user_auth` VALUES ('212', '2', '44', '4', '', '', '2', '2019-01-12 17:18:30', '2019-01-12 17:18:30');
INSERT INTO `system_user_auth` VALUES ('213', '2', '45', '4', '', '', '2', '2019-01-12 17:18:30', '2019-01-12 17:18:30');
INSERT INTO `system_user_auth` VALUES ('214', '2', '46', '4', '', '', '2', '2019-01-12 17:18:30', '2019-01-12 17:18:30');
INSERT INTO `system_user_auth` VALUES ('215', '2', '47', '4', '', '', '2', '2019-01-12 17:18:30', '2019-01-12 17:18:30');
INSERT INTO `system_user_auth` VALUES ('216', '2', '48', '4', '', '', '2', '2019-01-12 17:18:30', '2019-01-12 17:18:30');
INSERT INTO `system_user_auth` VALUES ('217', '2', '88', '4', '', '', '2', '2019-01-12 17:18:30', '2019-01-12 17:18:30');
INSERT INTO `system_user_auth` VALUES ('218', '2', '89', '4', '', '', '2', '2019-01-12 17:18:30', '2019-01-12 17:18:30');
INSERT INTO `system_user_auth` VALUES ('219', '2', '90', '4', '', '', '2', '2019-01-12 17:18:30', '2019-01-12 17:18:30');
INSERT INTO `system_user_auth` VALUES ('220', '2', '91', '4', '', '', '2', '2019-01-12 17:18:30', '2019-01-12 17:18:30');
INSERT INTO `system_user_auth` VALUES ('221', '2', '92', '4', '', '', '2', '2019-01-12 17:18:30', '2019-01-12 17:18:30');
INSERT INTO `system_user_auth` VALUES ('222', '2', '1423', '4', '', '', '2', '2019-01-12 17:18:30', '2019-01-12 17:18:30');
INSERT INTO `system_user_auth` VALUES ('223', '2', '1424', '4', '', '', '2', '2019-01-12 17:18:30', '2019-01-12 17:18:30');
INSERT INTO `system_user_auth` VALUES ('224', '2', '1425', '4', '', '', '2', '2019-01-12 17:18:30', '2019-01-12 17:18:30');
INSERT INTO `system_user_auth` VALUES ('225', '2', '1426', '4', '', '', '2', '2019-01-12 17:18:30', '2019-01-12 17:18:30');
INSERT INTO `system_user_auth` VALUES ('226', '2', '1427', '4', '', '', '2', '2019-01-12 17:18:30', '2019-01-12 17:18:30');
INSERT INTO `system_user_auth` VALUES ('227', '2', '1442', '4', '', '', '2', '2019-01-12 17:18:30', '2019-01-12 17:18:30');
INSERT INTO `system_user_auth` VALUES ('228', '2', '1428', '4', '', '', '2', '2019-01-12 17:18:30', '2019-01-12 17:18:30');

-- ----------------------------
-- Table structure for system_user_organize
-- ----------------------------
DROP TABLE IF EXISTS `system_user_organize`;
CREATE TABLE `system_user_organize` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `organize_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jz_organize_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_user` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of system_user_organize
-- ----------------------------
INSERT INTO `system_user_organize` VALUES ('1', '9', '25', '2', '0', '1', '2018-08-28 09:55:59', null);
INSERT INTO `system_user_organize` VALUES ('2', '10', '25', null, '0', '1', '2018-08-28 10:20:14', null);
INSERT INTO `system_user_organize` VALUES ('3', '11', '25', null, '0', '1', '2018-08-28 10:20:14', null);
INSERT INTO `system_user_organize` VALUES ('4', '12', '25', null, '0', '1', '2018-08-28 10:20:15', null);
INSERT INTO `system_user_organize` VALUES ('5', '13', '0', '济南云融信息技术有限公司', '0', '1', '2018-08-28 21:21:57', null);
INSERT INTO `system_user_organize` VALUES ('6', '14', '0', '', '0', '1', '2018-08-28 21:25:37', null);
INSERT INTO `system_user_organize` VALUES ('7', '15', '25', '0', '0', '1', '2018-08-28 21:40:05', '2018-08-28 21:47:23');
INSERT INTO `system_user_organize` VALUES ('8', '16', '25', null, '0', '1', '2018-08-29 14:02:53', '2018-08-29 14:02:53');
INSERT INTO `system_user_organize` VALUES ('9', '17', '25', null, '0', '1', '2018-08-29 14:02:54', '2018-08-29 14:02:54');
INSERT INTO `system_user_organize` VALUES ('10', '18', '25', null, '0', '1', '2018-08-29 14:02:54', '2018-08-29 14:02:54');
INSERT INTO `system_user_organize` VALUES ('11', '19', '25', null, '0', '1', '2018-08-29 14:02:55', '2018-08-29 14:02:55');
INSERT INTO `system_user_organize` VALUES ('12', '20', '25', null, '0', '1', '2018-08-29 14:02:55', '2018-08-29 14:02:55');
INSERT INTO `system_user_organize` VALUES ('13', '1', '25', null, '0', '1', '2018-08-29 14:02:56', '2019-02-19 13:37:42');
INSERT INTO `system_user_organize` VALUES ('14', '2', '25', '', '0', '1', '2018-08-30 21:08:04', '2021-01-27 22:21:16');
INSERT INTO `system_user_organize` VALUES ('18', '26', '25', null, '0', '1', '2018-08-30 21:26:43', '2018-09-02 13:28:18');
INSERT INTO `system_user_organize` VALUES ('21', '29', '25', '', '0', '2', '2018-09-03 16:37:33', '2019-02-19 13:37:51');
INSERT INTO `system_user_organize` VALUES ('22', '30', '25', '', '0', '2', '2019-01-10 15:43:36', '2021-01-27 21:47:55');

-- ----------------------------
-- Table structure for system_user_role
-- ----------------------------
DROP TABLE IF EXISTS `system_user_role`;
CREATE TABLE `system_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_ids` text COLLATE utf8mb4_unicode_ci,
  `organize_ids` text COLLATE utf8mb4_unicode_ci,
  `user_names` text COLLATE utf8mb4_unicode_ci,
  `organize_names` text COLLATE utf8mb4_unicode_ci,
  `role_auth` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_user` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_time` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of system_user_role
-- ----------------------------
INSERT INTO `system_user_role` VALUES ('4', '11', ',1,2', ',27', ',超级管理员,管理员', ',其他地方安氏', '0', '1', '2018-09-02 13:23:44', '2019-01-10 15:49:14');
INSERT INTO `system_user_role` VALUES ('6', '13', ',30', '', ',安兴文', '', '0', '2', '2018-09-25 13:53:46', '2019-01-10 15:45:46');

-- ----------------------------
-- Procedure structure for copy_table_to_hitable
-- ----------------------------
DROP PROCEDURE IF EXISTS `copy_table_to_hitable`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `copy_table_to_hitable`()
begin 
#声明一个标志done， 用来判断游标是否遍历完成 
DECLARE done INT DEFAULT FALSE; 
#声明一个变量，用来存放从游标中提取的数据 
#特别注意这里的名字不能与由游标中使用的列明相同，否则得到的数据都是NULL 
DECLARE hi_id varchar(255) DEFAULT NULL; 
DECLARE hi_name varchar(255) DEFAULT NULL; 
DECLARE hi_age varchar(255) DEFAULT NULL; 
DECLARE hi_time varchar(255) DEFAULT NULL; 
#声明游标对应的 SQL 语句 
DECLARE cur CURSOR FOR select id,name, age,time from test; 
#在游标循环到最后会将 done 设置为 TRUE 
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE; 
#执行查询 
open cur; 
#遍历游标每一行 
read_loop: LOOP 
#提取游标里的数据 
FETCH cur INTO hi_id,hi_name,hi_age,hi_time; 
#声明结束的时候 
IF done THEN 
LEAVE read_loop; 
END IF; 
INSERT INTO hi_test(id,name,age,time) VALUES(hi_id,hi_name,hi_age,hi_time); 
delete from test; 
END LOOP; 
#关闭游标 
CLOSE cur;

end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for record_timestamp_deal
-- ----------------------------
DROP PROCEDURE IF EXISTS `record_timestamp_deal`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `record_timestamp_deal`()
begin 
#声明一个标志done， 用来判断游标是否遍历完成 
DECLARE done INT DEFAULT FALSE; 
#声明一个变量，用来存放从游标中提取的数据 
#特别注意这里的名字不能与由游标中使用的列明相同，否则得到的数据都是NULL 
DECLARE hi_id varchar(255) DEFAULT NULL; 
DECLARE hi_name varchar(255) DEFAULT NULL; 
DECLARE hi_age varchar(255) DEFAULT NULL; 
DECLARE hi_time varchar(255) DEFAULT NULL; 
#声明游标对应的 SQL 语句 
DECLARE cur CURSOR FOR select id,name, age,time from test; 
#在游标循环到最后会将 done 设置为 TRUE 
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE; 
#执行查询 
open cur; 
#遍历游标每一行 
read_loop: LOOP 
#提取游标里的数据 
FETCH cur INTO hi_id,hi_name,hi_age,hi_time; 
#声明结束的时候 
IF done THEN 
LEAVE read_loop; 
END IF; 
INSERT INTO hi_test(id,name, age,time) VALUES(hi_id,hi_name,hi_age,hi_time); 
delete from test; 
END LOOP; 
#关闭游标 
CLOSE cur;

end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for test_mysql_while_loop
-- ----------------------------
DROP PROCEDURE IF EXISTS `test_mysql_while_loop`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `test_mysql_while_loop`( )
BEGIN
/**定义变量*/
DECLARE
	done INT DEFAULT FALSE;
DECLARE
	tablename VARCHAR ( 255 );-- 定义游标
DECLARE
	My_Cursor CURSOR FOR SELECT
	a.NAME AS 'table_name' 
FROM
	( SELECT table_name AS 'name' FROM information_schema.TABLES WHERE table_schema = 'crwdata' ) a 
WHERE
	a.NAME LIKE 'cdatat%';-- 声明句柄，当游标变量中保存的结果都查询一遍(遍历)，到达结尾，就把变量stopflag设置为1 用于循环中判断是否遍历结束
DECLARE
	CONTINUE HANDLER FOR NOT FOUND 
	SET done = TRUE;-- 打开游标
OPEN My_Cursor;
read_loop :
LOOP
	FETCH NEXT 
FROM
	My_Cursor INTO tablename;
IF
	done THEN
	LEAVE read_loop;

END IF;

SET @sqlStr = CONCAT( 'truncate table ', tablename );
PREPARE stmt 
FROM
	@sqlStr;
EXECUTE stmt;

END LOOP;
CLOSE My_Cursor;

END
;;
DELIMITER ;

-- ----------------------------
-- Event structure for copy_table_to_hitable_event
-- ----------------------------
DROP EVENT IF EXISTS `copy_table_to_hitable_event`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `copy_table_to_hitable_event` ON SCHEDULE EVERY 30 SECOND STARTS '2018-12-20 23:27:41' ON COMPLETION PRESERVE ENABLE DO call copy_table_to_hitable()
;;
DELIMITER ;
