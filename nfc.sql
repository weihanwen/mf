/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50173
Source Host           : localhost:3306
Source Database       : nfc

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2017-09-10 21:01:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sys_app_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_app_user`;
CREATE TABLE `sys_app_user` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `CARTEAM_ID` varchar(100) DEFAULT NULL COMMENT '车队ID',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_app_user
-- ----------------------------
INSERT INTO `sys_app_user` VALUES ('1d17b69909d040e8aae808d1bba52618', '111', '698d51a19d8a121ce581499d7b701668', '111', 'f944a9df72634249bbcb8cb73b0c9b86', 'deb6642bc65145b9a2433b14885c01cd');
INSERT INTO `sys_app_user` VALUES ('6af560dca86c43cbb77132a59df3e9b3', 'ddd', '77963b7a931377ad4ab5ad6a9cd718aa', 'ddd', 'f944a9df72634249bbcb8cb73b0c9b86', 'deb6642bc65145b9a2433b14885c01cd');
INSERT INTO `sys_app_user` VALUES ('905f493010194d7da2cdc250db224a85', 'AAA', 'e1faffb3e614e6c2fba74296962386b7', 'DDD', 'f944a9df72634249bbcb8cb73b0c9b86', 'deb6642bc65145b9a2433b14885c01cd');
INSERT INTO `sys_app_user` VALUES ('f3f8e8c0917a4cf98dd3165800100055', 'AA', '202cb962ac59075b964b07152d234b70', '33', '55896f5ce3c0494fa6850775a4e29ff6', 'deb6642bc65145b9a2433b14885c01cd');

-- ----------------------------
-- Table structure for `sys_gl_qx`
-- ----------------------------
DROP TABLE IF EXISTS `sys_gl_qx`;
CREATE TABLE `sys_gl_qx` (
  `GL_ID` varchar(100) NOT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `FX_QX` int(10) DEFAULT NULL COMMENT '发送邮件权限',
  `FW_QX` int(10) DEFAULT NULL COMMENT '发送短信权限',
  `QX1` int(10) DEFAULT NULL,
  `QX2` int(10) DEFAULT NULL,
  `QX3` int(10) DEFAULT NULL,
  `QX4` int(10) DEFAULT NULL,
  PRIMARY KEY (`GL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_gl_qx
-- ----------------------------
INSERT INTO `sys_gl_qx` VALUES ('040c44bcf58745ce951d9b2b7f56be82', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('1', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `sys_gl_qx` VALUES ('2', '1', '0', '1', '1', '1', '1', '1');
INSERT INTO `sys_gl_qx` VALUES ('767a57ff070a40e3935439d73d6a76cd', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('92bda15b69024fe0a2ed8e1b4785364a', '7', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('b221d366ba5a45feaa82d3dc49c5f2f4', '040c44bcf58745ce951d9b2b7f56be82', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `MENU_ID` int(11) NOT NULL,
  `MENU_NAME` varchar(255) DEFAULT NULL,
  `MENU_URL` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `MENU_ORDER` varchar(100) DEFAULT NULL,
  `MENU_ICON` varchar(30) DEFAULT NULL,
  `MENU_TYPE` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '#', '0', '1', 'icon-calendar', '1');
INSERT INTO `sys_menu` VALUES ('2', '组织管理', 'role.do', '1', '2', null, '1');
INSERT INTO `sys_menu` VALUES ('5', '系统用户', 'user/listUsers.do', '1', '3', null, '1');
INSERT INTO `sys_menu` VALUES ('6', '基础配置', '#', '0', '1', 'icon-desktop', '');
INSERT INTO `sys_menu` VALUES ('7', '轮播图列表', 'carousel_figure/list.do', '6', '1', null, '');
INSERT INTO `sys_menu` VALUES ('8', '类别列表', 'category/list.do', '6', '2', null, '');
INSERT INTO `sys_menu` VALUES ('9', '配送点列表', 'address/list.do', '6', '3', null, '');
INSERT INTO `sys_menu` VALUES ('10', '配送费列表', 'delivery_fee/list.do', '6', '4', null, '');
INSERT INTO `sys_menu` VALUES ('11', '商品管理', '#', '0', '2', 'icon-folder-open', '');
INSERT INTO `sys_menu` VALUES ('12', '订单管理', '#', '0', '3', 'icon-list-alt', '');
INSERT INTO `sys_menu` VALUES ('13', '财务管理', '#', '0', '4', 'icon-edit', '');
INSERT INTO `sys_menu` VALUES ('14', '商品列表', 'lunch/list.do', '11', '1', null, '');
INSERT INTO `sys_menu` VALUES ('15', '劵/红包管理', '#', '0', '5', 'icon-film', '');
INSERT INTO `sys_menu` VALUES ('16', '红包列表', 'redpackage/list.do', '15', '1', null, '');
INSERT INTO `sys_menu` VALUES ('17', '每日菜谱', 'daily_menu/list.do', '11', '2', null, '');
INSERT INTO `sys_menu` VALUES ('18', '会员管理 ', '#', '0', '6', 'icon-comments', '2');
INSERT INTO `sys_menu` VALUES ('19', '会员列表', 'member/list.do', '18', '1', null, '2');
INSERT INTO `sys_menu` VALUES ('20', '预定时间', 'scheduled_time/list.do', '11', '3', null, '');
INSERT INTO `sys_menu` VALUES ('21', '周卡列表', 'weekmeal_card/list.do', '15', '2', null, '');
INSERT INTO `sys_menu` VALUES ('22', '周卡购买记录', 'weekmeal_card_buy_wxmember/list.do', '13', '2', null, '');
INSERT INTO `sys_menu` VALUES ('23', '待配送订单', 'order/list.do?order_status=2', '12', '2', null, '');
INSERT INTO `sys_menu` VALUES ('24', '已完成订单', 'order/list.do?order_status=4', '12', '4', null, '');
INSERT INTO `sys_menu` VALUES ('25', '退款订单', 'order/list.do?order_status=99', '12', '99', null, '');
INSERT INTO `sys_menu` VALUES ('26', '销售明细', 'order/saleHistory.do', '13', '1', null, '');
INSERT INTO `sys_menu` VALUES ('27', '预定订单处理', 'order/list.do?order_status=1', '12', '1', null, '');
INSERT INTO `sys_menu` VALUES ('28', '配送中订单', 'order/list.do?order_status=3', '12', '3', null, '');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `ROLE_ID` varchar(100) NOT NULL,
  `ROLE_NAME` varchar(100) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `ADD_QX` varchar(255) DEFAULT NULL,
  `DEL_QX` varchar(255) DEFAULT NULL,
  `EDIT_QX` varchar(255) DEFAULT NULL,
  `CHA_QX` varchar(255) DEFAULT NULL,
  `QX_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '系统管理员', '530579430', '0', '1', '1', '1', '1', '1');
INSERT INTO `sys_role` VALUES ('2', '超级管理员', '530579430', '1', '238943974', '238943974', '238943974', '238943974', '2');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(100) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `SKIN` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `PHONE` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '九鱼', '1133671055321055258374707980945218933803269864762743594642571294', '1', '2017-09-10 20:21:22', '127.0.0.1', '0', '超级管理员', 'default', 'admin@main.com', '123', '15260282340');

-- ----------------------------
-- Table structure for `sys_user_qx`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_qx`;
CREATE TABLE `sys_user_qx` (
  `U_ID` varchar(100) NOT NULL,
  `C1` int(10) DEFAULT NULL,
  `C2` int(10) DEFAULT NULL,
  `C3` int(10) DEFAULT NULL,
  `C4` int(10) DEFAULT NULL,
  `Q1` int(10) DEFAULT NULL,
  `Q2` int(10) DEFAULT NULL,
  `Q3` int(10) DEFAULT NULL,
  `Q4` int(10) DEFAULT NULL,
  PRIMARY KEY (`U_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_qx
-- ----------------------------
INSERT INTO `sys_user_qx` VALUES ('040c44bcf58745ce951d9b2b7f56be82', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('1', '1', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('2', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `sys_user_qx` VALUES ('767a57ff070a40e3935439d73d6a76cd', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('92bda15b69024fe0a2ed8e1b4785364a', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('b221d366ba5a45feaa82d3dc49c5f2f4', '0', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `sys_zidian`
-- ----------------------------
DROP TABLE IF EXISTS `sys_zidian`;
CREATE TABLE `sys_zidian` (
  `ZD_ID` varchar(100) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `BIANMA` varchar(100) DEFAULT NULL,
  `ORDY_BY` int(10) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `JB` int(10) DEFAULT NULL,
  `P_BM` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ZD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_zidian
-- ----------------------------
INSERT INTO `sys_zidian` VALUES ('1167610461f444b5ad30e4abfab6cf72', '供货商', 'B', '1', 'ebf64019f3844ad98f16f890fb382306', '2', 'A_B');
INSERT INTO `sys_zidian` VALUES ('1ba1abd122814503b424a43855bc3cf2', '注册用户', 'A_A', '2', 'ebf64019f3844ad98f16f890fb382306', '2', 'A_A_A');
INSERT INTO `sys_zidian` VALUES ('8ffec2cd5d1c4dbab4d620f2a32a353a', '送货员', 'A_C', '3', 'ebf64019f3844ad98f16f890fb382306', '2', 'A_A_C');
INSERT INTO `sys_zidian` VALUES ('ebf64019f3844ad98f16f890fb382306', '用户分类', 'A', '1', '0', '1', 'A');
INSERT INTO `sys_zidian` VALUES ('f937550dd3ca4c5bad65a3b3d18d9fed', '管理员', 'A_D', '4', 'ebf64019f3844ad98f16f890fb382306', '2', 'A_A_D');

-- ----------------------------
-- Table structure for `tb_address`
-- ----------------------------
DROP TABLE IF EXISTS `tb_address`;
CREATE TABLE `tb_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `address_name` varchar(100) DEFAULT NULL,
  `detail_address` varchar(100) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `updatetime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_address
-- ----------------------------
INSERT INTO `tb_address` VALUES ('1', '国泰科技大厦', '名河路了撒大大啊', '2017-07-29 11:19:55', '2017-08-01 11:16:32');
INSERT INTO `tb_address` VALUES ('2', '联合中心', '民和路480号', '2017-09-07 18:12:09', '2017-09-07 18:12:09');

-- ----------------------------
-- Table structure for `tb_carousel_figure`
-- ----------------------------
DROP TABLE IF EXISTS `tb_carousel_figure`;
CREATE TABLE `tb_carousel_figure` (
  `carousel_figure_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `image_url` varchar(100) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `click_number` int(11) DEFAULT NULL,
  `link_type` varchar(4) DEFAULT NULL,
  `link_content` varchar(100) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `updatetime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `address_id` varchar(100) DEFAULT '0',
  PRIMARY KEY (`carousel_figure_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_carousel_figure
-- ----------------------------
INSERT INTO `tb_carousel_figure` VALUES ('4', ' 第一张', 'http://www.jybd666.cn/FileSave//carousel/67ab06771da548f899876d0aa06e82a3.jpg', '2017-08-02', '2017-09-30', '0', '1', '', '2017-08-02 14:14:55', '2017-09-10 17:19:08', null);
INSERT INTO `tb_carousel_figure` VALUES ('5', ' 第二张', 'http://www.jybd666.cn/FileSave//carousel/fff081b0307f443889073a5fb1999844.jpg', '2017-08-02', '2017-09-28', '0', '2', 'https://www.jiuyuvip.com', '2017-08-02 14:15:23', '2017-09-10 17:19:16', null);
INSERT INTO `tb_carousel_figure` VALUES ('6', ' 第三张', 'http://www.jybd666.cn/FileSave//carousel/a35280cafc544bedbb6240e620f155a7.jpg', '2017-08-02', '2017-09-29', '0', '3', '001', '2017-08-02 14:16:03', '2017-09-10 17:19:24', null);
INSERT INTO `tb_carousel_figure` VALUES ('7', '第四张', 'http://www.jybd666.cn/FileSave//carousel/c39455749ba54de4a120a50efa218871.jpg', '2017-09-07', '2017-09-30', '0', '1', '', '2017-09-07 18:16:32', '2017-09-10 17:19:29', null);

-- ----------------------------
-- Table structure for `tb_category`
-- ----------------------------
DROP TABLE IF EXISTS `tb_category`;
CREATE TABLE `tb_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `image_url` varchar(100) DEFAULT NULL,
  `sort` varchar(4) DEFAULT '10',
  `createtime` datetime DEFAULT NULL,
  `updatetime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `address_id` varchar(100) DEFAULT '0',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_category
-- ----------------------------
INSERT INTO `tb_category` VALUES ('1', '精品便当', 'http://localhost/FileSave//category/ee14b49321634f20be7995ef4855b518.png', '0', '2017-07-29 11:01:30', '2017-08-19 12:26:04', null);

-- ----------------------------
-- Table structure for `tb_daily_menu`
-- ----------------------------
DROP TABLE IF EXISTS `tb_daily_menu`;
CREATE TABLE `tb_daily_menu` (
  `daily_menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `day` date DEFAULT NULL,
  `lunch_idstr` varchar(100) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `updatetime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`daily_menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_daily_menu
-- ----------------------------
INSERT INTO `tb_daily_menu` VALUES ('10', '2017-09-10', '003,006,004,001,002,', null, '2017-09-10 17:57:23');
INSERT INTO `tb_daily_menu` VALUES ('11', '2017-09-11', '003,001,002,', null, '2017-09-10 17:23:17');

-- ----------------------------
-- Table structure for `tb_delivery_fee`
-- ----------------------------
DROP TABLE IF EXISTS `tb_delivery_fee`;
CREATE TABLE `tb_delivery_fee` (
  `delivery_fee_id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) DEFAULT NULL,
  `ptmoney` varchar(100) DEFAULT NULL,
  `chmoney` varchar(100) DEFAULT '0',
  `createtime` datetime DEFAULT NULL,
  `updatetime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`delivery_fee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_delivery_fee
-- ----------------------------
INSERT INTO `tb_delivery_fee` VALUES ('1', '1', '5', '0', '2017-07-29 14:09:52', '2017-07-29 14:12:53');
INSERT INTO `tb_delivery_fee` VALUES ('2', '2', '6', '0', '2017-07-29 14:09:57', '2017-07-29 14:12:55');
INSERT INTO `tb_delivery_fee` VALUES ('3', '3', '7', '0', '2017-07-29 14:09:52', '2017-07-29 14:12:56');
INSERT INTO `tb_delivery_fee` VALUES ('4', '4', '8', '0', '2017-07-29 14:09:52', '2017-07-29 14:12:56');
INSERT INTO `tb_delivery_fee` VALUES ('5', '5', '0', '0', '2017-07-29 14:09:52', '2017-09-03 13:42:44');
INSERT INTO `tb_delivery_fee` VALUES ('6', '6', '0', '0', '2017-07-29 14:09:52', '2017-09-03 13:44:58');
INSERT INTO `tb_delivery_fee` VALUES ('7', '7', '0', '0', '2017-07-29 14:09:52', '2017-09-03 13:45:04');
INSERT INTO `tb_delivery_fee` VALUES ('8', '8', '0', '0', '2017-07-29 14:09:52', '2017-09-03 13:45:11');
INSERT INTO `tb_delivery_fee` VALUES ('9', '9', '0', '0', '2017-07-29 14:09:52', '2017-09-03 13:45:17');
INSERT INTO `tb_delivery_fee` VALUES ('10', '10', '0', '0', '2017-07-29 14:09:52', '2017-09-03 13:44:51');
INSERT INTO `tb_delivery_fee` VALUES ('11', '0', '0', '0', '2017-07-31 16:30:23', '2017-08-30 14:27:27');

-- ----------------------------
-- Table structure for `tb_log`
-- ----------------------------
DROP TABLE IF EXISTS `tb_log`;
CREATE TABLE `tb_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) DEFAULT NULL COMMENT '01：验签失败\r\n02：订单不存在\r\n03：bug\r\n04：金额匹配不上',
  `order_id` varchar(100) DEFAULT NULL,
  `message` text,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_log
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_lunch`
-- ----------------------------
DROP TABLE IF EXISTS `tb_lunch`;
CREATE TABLE `tb_lunch` (
  `lunch_id` varchar(3) NOT NULL,
  `lunch_name` varchar(100) DEFAULT NULL,
  `show_sale_money` varchar(11) DEFAULT NULL,
  `sale_money` varchar(11) DEFAULT NULL,
  `index_images` text,
  `dc_images_small` text,
  `dc_images` text,
  `yd_images` text,
  `is_shelves` varchar(4) DEFAULT NULL,
  `yd_stocknumber` varchar(11) DEFAULT '0',
  `dc_stocknumber` varchar(11) DEFAULT '0',
  `sort` varchar(4) DEFAULT NULL,
  `send_integral` varchar(11) DEFAULT NULL,
  `zhucai_text` text,
  `peicai_text` text,
  `shicai_text` text,
  `notuse_text` text,
  `createtime` datetime DEFAULT NULL,
  `updatetime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `category_id` int(100) NOT NULL DEFAULT '0',
  `dc_version` int(4) DEFAULT '0',
  `yd_version` int(4) DEFAULT '0',
  PRIMARY KEY (`lunch_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_lunch
-- ----------------------------
INSERT INTO `tb_lunch` VALUES ('001', '咖喱鸡饭', '40', '30', 'http://www.jybd666.cn/FileSave//lunch/8664d15a648048be8b741db8d9b9329f.jpg', 'http://www.jybd666.cn/FileSave//lunch/bfc2bdaa4bb845af9a2e040cf1039ba2.jpg', 'http://www.jybd666.cn/FileSave//lunch/379dc30035ba4ecf961c810fbf99861a.jpg', 'http://www.jybd666.cn/FileSave//lunch/8fdf533fff2b45b587024422d0c7754d.jpg', '1', null, '7', '1', '4', '222', '222', '2222', '222', '2017-08-19 14:23:06', '2017-09-10 17:25:50', '1', '0', '0');
INSERT INTO `tb_lunch` VALUES ('002', '台湾卤肉饭', '45', '35', 'http://www.jybd666.cn/FileSave//lunch/dd8026122b474a6aadfcb08d548c0689.jpg', 'http://www.jybd666.cn/FileSave//lunch/d74f64fed59f4475ae68faada450b8c2.jpg', 'http://www.jybd666.cn/FileSave//lunch/f3c555de9dd14f94bfe87d8ca4e5ac72.jpg', 'http://www.jybd666.cn/FileSave//lunch/97f23cd752264fb895a0f50317953b44.jpg', '1', null, '10', '2', '5', '卤肉', '包心菜/萝卜干/花生', '卤肉/包心菜/萝卜干/花生', '鸡精/味精', '2017-08-19 14:57:10', '2017-09-10 17:56:00', '1', '0', '0');
INSERT INTO `tb_lunch` VALUES ('003', '梅菜烧肉饭', '45', '35', 'http://www.jybd666.cn/FileSave//lunch/cced8c2e04e940a583f7398f03c4fc1a.jpg', 'http://www.jybd666.cn/FileSave//lunch/885225e4b63d4d2cb3e6f6c7b8020c88.jpg', 'http://www.jybd666.cn/FileSave//lunch/9eff1955bc7f4facbcb9edf52ec63321.jpg', 'http://www.jybd666.cn/FileSave//lunch/a300bb94525e43dd8ff8d9bc80856c90.jpg', '1', null, '10', '0', '5', '11', '33', '22', '55', '2017-09-10 15:39:46', '2017-09-10 17:55:51', '1', '0', '0');
INSERT INTO `tb_lunch` VALUES ('004', '虫草花蒸鸡饭', '45', '35', 'http://www.jybd666.cn/FileSave//lunch/a30a158d54b1420e9c272f1ca80579bd.jpg', 'http://www.jybd666.cn/FileSave//lunch/e9ec8b9e5d1c432d8facb735f5832e13.jpg', 'http://www.jybd666.cn/FileSave//lunch/46e88a1b50424a26b30ad6a52122bb5d.jpg', 'http://www.jybd666.cn/FileSave//lunch/91328fa84fca4c0ba1a163c2fa85c5fd.jpg', '1', null, '10', '0', '5', '45', '555', '541', '223', '2017-09-10 15:41:07', '2017-09-10 17:55:58', '1', '0', '0');
INSERT INTO `tb_lunch` VALUES ('005', '香汁排骨饭', '40', '30', 'http://www.jybd666.cn/FileSave//lunch/ab05991f9e774e9d9c0593ea0c311671.jpg', 'http://www.jybd666.cn/FileSave//lunch/d29f0662613f40e08855792c75768350.jpg', 'http://www.jybd666.cn/FileSave//lunch/df089b13585d404f88cf9fd92f935be1.jpg', 'http://www.jybd666.cn/FileSave//lunch/9945e93063044ff08e59dcf222d77e0e.jpg', '1', null, '10', '0', '4', '54', '132', '16523', '1652', '2017-09-10 15:42:34', '2017-09-10 17:55:56', '1', '0', '0');
INSERT INTO `tb_lunch` VALUES ('006', '咖喱鸡饭', '35', '30', 'http://www.jybd666.cn/FileSave//lunch/f307abe1c5f84a41939be5c8742b2200.jpg', 'http://www.jybd666.cn/FileSave//lunch/956afa9d49b04c138beda39fd046046d.jpg', 'http://www.jybd666.cn/FileSave//lunch/907ce19a0fb64e9fabdae3e29967fa20.jpg', 'http://www.jybd666.cn/FileSave//lunch/17ab60011c584e3587f98ccf371f7024.jpg', '1', null, '10', '0', '2', '2321', '54', '151', '1210', '2017-09-10 15:43:45', '2017-09-10 17:55:53', '1', '0', '0');

-- ----------------------------
-- Table structure for `tb_order`
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `order_id` varchar(100) NOT NULL,
  `looknumber` varchar(100) DEFAULT NULL,
  `allmoney` int(11) DEFAULT NULL,
  `discount_money` int(11) DEFAULT NULL,
  `wxmember_redpackage_id` varchar(100) DEFAULT NULL,
  `wxmember_tihuojuan_idstr` varchar(100) DEFAULT NULL,
  `actual_money` int(11) DEFAULT NULL,
  `use_integral` int(11) DEFAULT NULL,
  `use_wx` int(11) DEFAULT NULL,
  `pay_type` varchar(4) DEFAULT '1',
  `order_status` varchar(4) DEFAULT NULL,
  `send_integral` int(11) DEFAULT NULL,
  `serial_number` varchar(100) DEFAULT NULL,
  `order_type` varchar(4) DEFAULT NULL,
  `reserve_arrival_time` datetime DEFAULT NULL,
  `delivery_time` datetime DEFAULT NULL,
  `delivery_fee` varchar(11) DEFAULT '0' COMMENT '配送费+餐盒费',
  `ptmoney` varchar(255) DEFAULT '0' COMMENT '跑腿费用',
  `chmoney` varchar(255) DEFAULT '0' COMMENT '餐盒费',
  `delivery_type` varchar(4) DEFAULT NULL,
  `delivery_status` varchar(4) DEFAULT '0',
  `delivery_operator_name` varchar(100) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `jiedantime` datetime DEFAULT NULL,
  `overtime` datetime DEFAULT NULL,
  `wxmember_id` varchar(100) DEFAULT NULL,
  `wxmember_address_id` varchar(100) DEFAULT NULL,
  `allshopcart_id` varchar(100) DEFAULT NULL COMMENT '购物车购买集合',
  `lunch_idstr` varchar(100) DEFAULT NULL COMMENT '直接购买商品集合',
  `shop_type` varchar(4) DEFAULT NULL COMMENT '1-购物车，2-直接购买',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_order
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_ordertime`
-- ----------------------------
DROP TABLE IF EXISTS `tb_ordertime`;
CREATE TABLE `tb_ordertime` (
  `ordertime_id` varchar(100) NOT NULL,
  `order_idstr` varchar(200) DEFAULT NULL COMMENT '订单得集合',
  `address` varchar(100) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL COMMENT '结束时间',
  `isover` varchar(4) DEFAULT '0' COMMENT '是否已经处理',
  PRIMARY KEY (`ordertime_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_ordertime
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_order_lunch`
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_lunch`;
CREATE TABLE `tb_order_lunch` (
  `order_lunch_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(100) DEFAULT NULL,
  `lunch_id` varchar(100) DEFAULT NULL,
  `shop_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_lunch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_order_lunch
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_receive_condition`
-- ----------------------------
DROP TABLE IF EXISTS `tb_receive_condition`;
CREATE TABLE `tb_receive_condition` (
  `receive_condition_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`receive_condition_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_receive_condition
-- ----------------------------
INSERT INTO `tb_receive_condition` VALUES ('1', '消费一单');
INSERT INTO `tb_receive_condition` VALUES ('2', '消费金额超过100');
INSERT INTO `tb_receive_condition` VALUES ('3', '消费单数超过10单');

-- ----------------------------
-- Table structure for `tb_redpackage`
-- ----------------------------
DROP TABLE IF EXISTS `tb_redpackage`;
CREATE TABLE `tb_redpackage` (
  `redpackage_id` int(11) NOT NULL AUTO_INCREMENT,
  `money` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `receive_condition_idstr` varchar(100) DEFAULT NULL,
  `send_oprator_id` varchar(100) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `updatetime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`redpackage_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_redpackage
-- ----------------------------
INSERT INTO `tb_redpackage` VALUES ('1', '2', '10', '1,2,3,', '1', '2017-07-31 11:05:19', '2017-07-31 11:05:19');

-- ----------------------------
-- Table structure for `tb_scheduled_time`
-- ----------------------------
DROP TABLE IF EXISTS `tb_scheduled_time`;
CREATE TABLE `tb_scheduled_time` (
  `scheduled_time_id` int(11) NOT NULL AUTO_INCREMENT,
  `day` date DEFAULT NULL,
  `time_name` varchar(100) DEFAULT NULL,
  `sale_starttime` time DEFAULT NULL,
  `sale_endtime` time DEFAULT NULL,
  `yd_starttime` datetime DEFAULT NULL,
  `yd_endtime` datetime DEFAULT NULL,
  `category_idstr` varchar(100) DEFAULT NULL,
  `updatetime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`scheduled_time_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_scheduled_time
-- ----------------------------
INSERT INTO `tb_scheduled_time` VALUES ('4', '2017-09-11', '午餐', '11:00:00', '14:00:00', '2017-09-10 11:00:00', '2017-09-11 11:00:00', '1,', '2017-09-10 18:32:50');
INSERT INTO `tb_scheduled_time` VALUES ('5', '2017-09-11', '晚餐', '14:00:00', '19:00:00', '2017-09-10 17:00:00', '2017-09-10 21:00:00', '1,', '2017-09-10 20:20:30');

-- ----------------------------
-- Table structure for `tb_shopcart`
-- ----------------------------
DROP TABLE IF EXISTS `tb_shopcart`;
CREATE TABLE `tb_shopcart` (
  `shopcart_id` varchar(100) NOT NULL,
  `lunch_id` varchar(100) DEFAULT NULL,
  `shop_number` int(11) DEFAULT NULL,
  `wxmember_id` varchar(100) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `updatetime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`shopcart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_shopcart
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_w`
-- ----------------------------
DROP TABLE IF EXISTS `tb_w`;
CREATE TABLE `tb_w` (
  `W_ID` varchar(100) NOT NULL,
  `W` varchar(255) DEFAULT NULL COMMENT 'w',
  PRIMARY KEY (`W_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_w
-- ----------------------------
INSERT INTO `tb_w` VALUES ('', '1');

-- ----------------------------
-- Table structure for `tb_weekmeal_card`
-- ----------------------------
DROP TABLE IF EXISTS `tb_weekmeal_card`;
CREATE TABLE `tb_weekmeal_card` (
  `weekmeal_card_id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_money` int(11) DEFAULT NULL,
  `twenty_five_number` int(11) DEFAULT NULL COMMENT '25元用餐劵个数',
  `twenty_eight_number` int(11) DEFAULT NULL,
  `thirty_five_number` int(11) DEFAULT NULL,
  `thirty_eight_number` int(11) DEFAULT NULL,
  `isservice` varchar(4) DEFAULT '0',
  `createtime` datetime DEFAULT NULL,
  `create_oprator_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`weekmeal_card_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_weekmeal_card
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_weekmeal_card_buy_wxmember`
-- ----------------------------
DROP TABLE IF EXISTS `tb_weekmeal_card_buy_wxmember`;
CREATE TABLE `tb_weekmeal_card_buy_wxmember` (
  `only_id` varchar(100) NOT NULL,
  `wxmember_id` varchar(100) DEFAULT NULL,
  `weekmeal_card_id` int(11) DEFAULT NULL,
  `pay_status` varchar(4) DEFAULT NULL,
  `serial_number` varchar(100) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `overtime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`only_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_weekmeal_card_buy_wxmember
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_wxmember`
-- ----------------------------
DROP TABLE IF EXISTS `tb_wxmember`;
CREATE TABLE `tb_wxmember` (
  `wxmember_id` varchar(100) NOT NULL,
  `showlook_id` varchar(100) DEFAULT NULL,
  `image_url` text,
  `name` varchar(100) DEFAULT NULL,
  `sex` varchar(4) DEFAULT NULL,
  `open_id` varchar(100) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `province_name` varchar(100) DEFAULT NULL,
  `area_name` varchar(100) DEFAULT NULL,
  `city_name` varchar(100) DEFAULT NULL,
  `lng` varchar(100) DEFAULT NULL,
  `lat` varchar(100) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `updatetime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`wxmember_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_wxmember
-- ----------------------------
INSERT INTO `tb_wxmember` VALUES ('1', '2222', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1504084183605&di=5b485d99ee1855e1179c0c89cf8cd42b&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F0df3d7ca7bcb0a46a3a856306163f6246b60af35.jpg', '2222', '1', '2123131', null, null, null, null, null, null, '2017-07-31 12:01:09', '2017-08-30 14:23:23');
INSERT INTO `tb_wxmember` VALUES ('20170820124232907421', '65862500', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1504084183605&di=5b485d99ee1855e1179c0c89cf8cd42b&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F0df3d7ca7bcb0a46a3a856306163f6246b60af35.jpg', null, null, 'owD2DwsxdygwHXxNV75kjGT7Wvlw', null, null, null, null, null, null, '2017-08-20 00:42:44', '2017-08-30 14:23:23');

-- ----------------------------
-- Table structure for `tb_wxmember_address`
-- ----------------------------
DROP TABLE IF EXISTS `tb_wxmember_address`;
CREATE TABLE `tb_wxmember_address` (
  `wxmember_address_id` varchar(100) NOT NULL,
  `contacts` varchar(100) DEFAULT NULL,
  `sex` varchar(4) DEFAULT NULL,
  `contacts_number` varchar(11) DEFAULT NULL,
  `corporate_name` varchar(100) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `floor_number` varchar(100) DEFAULT NULL,
  `wxmember_id` varchar(100) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `updatetime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`wxmember_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_wxmember_address
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_wxmember_redpackage`
-- ----------------------------
DROP TABLE IF EXISTS `tb_wxmember_redpackage`;
CREATE TABLE `tb_wxmember_redpackage` (
  `wxmember_redpackage_id` int(11) NOT NULL,
  `wxmember_id` varchar(100) DEFAULT NULL,
  `money` varchar(11) DEFAULT NULL,
  `isuse` varchar(4) DEFAULT '0',
  `redpackage_id` int(11) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `updatetime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `isfrozen` varchar(4) DEFAULT '0',
  PRIMARY KEY (`wxmember_redpackage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_wxmember_redpackage
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_wxmember_tihuojuan`
-- ----------------------------
DROP TABLE IF EXISTS `tb_wxmember_tihuojuan`;
CREATE TABLE `tb_wxmember_tihuojuan` (
  `wxmember_tihuojuan_id` int(11) NOT NULL,
  `wxmember_id` varchar(100) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `isuse` varchar(4) DEFAULT '0',
  `weekmeal_card_id` int(11) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `updatetime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `isfrozen` varchar(4) DEFAULT '0',
  PRIMARY KEY (`wxmember_tihuojuan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_wxmember_tihuojuan
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_wxmember_wealth`
-- ----------------------------
DROP TABLE IF EXISTS `tb_wxmember_wealth`;
CREATE TABLE `tb_wxmember_wealth` (
  `wxmember_wealth_id` int(11) NOT NULL AUTO_INCREMENT,
  `wxmember_id` varchar(100) DEFAULT NULL,
  `now_integral` varchar(11) DEFAULT NULL,
  `before_integral` varchar(11) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `updatetime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`wxmember_wealth_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_wxmember_wealth
-- ----------------------------
INSERT INTO `tb_wxmember_wealth` VALUES ('1', '1', '1000', '0', '2017-08-02 11:58:49', '2017-09-03 16:01:45');
INSERT INTO `tb_wxmember_wealth` VALUES ('2', '20170820124232907421', '616.00', '641.0', '2017-08-20 00:42:44', '2017-09-10 20:56:24');

-- ----------------------------
-- Table structure for `tb_wxmember_wealthhistory`
-- ----------------------------
DROP TABLE IF EXISTS `tb_wxmember_wealthhistory`;
CREATE TABLE `tb_wxmember_wealthhistory` (
  `wxmember_wealthhistory_id` varchar(100) NOT NULL,
  `wxmember_id` varchar(100) DEFAULT NULL,
  `money` varchar(11) DEFAULT NULL,
  `isincome` varchar(4) DEFAULT NULL,
  `order_id` varchar(100) DEFAULT NULL,
  `wealth_type` varchar(4) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `updatetime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`wxmember_wealthhistory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_wxmember_wealthhistory
-- ----------------------------
