/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50173
Source Host           : localhost:3306
Source Database       : nfc

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2017-09-22 00:32:35
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
INSERT INTO `sys_menu` VALUES ('29', '优惠管理', '#', '0', '6', null, '2');
INSERT INTO `sys_menu` VALUES ('30', '优惠集合', 'discount/list.do', '29', '1', null, '2');

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
INSERT INTO `sys_role` VALUES ('1', '系统管理员', '2141093862', '0', '1', '1', '1', '1', '1');
INSERT INTO `sys_role` VALUES ('2', '超级管理员', '2141093862', '1', '238943974', '238943974', '238943974', '238943974', '2');

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
INSERT INTO `sys_user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '九鱼', '1133671055321055258374707980945218933803269864762743594642571294', '1', '2017-09-22 00:21:30', '127.0.0.1', '0', '超级管理员', 'default', 'admin@main.com', '123', '15260282340');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_address
-- ----------------------------
INSERT INTO `tb_address` VALUES ('2', '联合中心', '民和路480号', '2017-09-07 18:12:09', '2017-09-07 18:12:09');
INSERT INTO `tb_address` VALUES ('3', '国泰科技大厦', '民和路479号', '2017-09-11 01:20:37', '2017-09-11 01:20:37');
INSERT INTO `tb_address` VALUES ('4', '振亚大厦', '宁围镇钱江世纪城民和路501号联合中心北区', '2017-09-11 01:22:08', '2017-09-11 01:22:08');
INSERT INTO `tb_address` VALUES ('5', '三宏国际大厦', '萧山钱江世纪城(民和路525号)', '2017-09-11 01:23:04', '2017-09-11 01:23:04');
INSERT INTO `tb_address` VALUES ('6', '浙江民营企业发展大厦', '浙江省杭州市萧山区富业巷1号', '2017-09-11 01:25:59', '2017-09-11 01:25:59');
INSERT INTO `tb_address` VALUES ('7', '世纪晶钻1号楼', '杭州市萧山区民和路486号', '2017-09-11 01:28:06', '2017-09-11 01:28:06');
INSERT INTO `tb_address` VALUES ('8', '大象国际中心', '浙江省杭州市萧山区市心北路盈丰民和路600号', '2017-09-11 01:31:51', '2017-09-11 01:31:51');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_carousel_figure
-- ----------------------------
INSERT INTO `tb_carousel_figure` VALUES ('4', ' 第一张', 'http://www.jybd666.cn/FileSave//carousel/6adc8a81b3a34433af117b7e8f92a72f.png', '2017-08-02', '2017-09-30', '0', '1', '001', '2017-08-02 14:14:55', '2017-09-20 13:26:06', null);
INSERT INTO `tb_carousel_figure` VALUES ('5', ' 第二张', 'http://www.jybd666.cn/FileSave//carousel/410cf495abcc4f859bb883d9d997259e.png', '2017-08-02', '2017-09-30', '0', '1', '006', '2017-08-02 14:15:23', '2017-09-20 13:26:26', null);
INSERT INTO `tb_carousel_figure` VALUES ('6', ' 第三张', 'http://www.jybd666.cn/FileSave//carousel/a6d2498dc6f84ddea37874e65b64c8c8.png', '2017-08-02', '2017-09-30', '0', '1', '002', '2017-08-02 14:16:03', '2017-09-20 13:26:41', null);
INSERT INTO `tb_carousel_figure` VALUES ('7', '第四张', 'http://www.jybd666.cn/FileSave//carousel/c160d7cad4cb487c803b1c9ce1cb9762.png', '2017-09-07', '2017-09-30', '0', '1', '003', '2017-09-07 18:16:32', '2017-09-20 13:27:02', null);
INSERT INTO `tb_carousel_figure` VALUES ('8', ' 第五张', 'http://www.jybd666.cn/FileSave//carousel/569bec2c91ac424b907ad78b9bb361f4.png', '2017-09-11', '2017-09-30', '0', '1', '005', '2017-09-11 22:35:06', '2017-09-20 13:27:13', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_category
-- ----------------------------
INSERT INTO `tb_category` VALUES ('1', '金牌便当', 'http://www.jybd666.cn/FileSave//category/65d27df0795a436db5aa185c6e34592e.png', '0', '2017-07-29 11:01:30', '2017-09-11 22:24:56', null);
INSERT INTO `tb_category` VALUES ('2', '商务便当', 'http://www.jybd666.cn/FileSave//category/900fdf8f9baa45f1b85a8e59292eddeb.png', '0', null, '2017-09-11 22:25:25', '0');
INSERT INTO `tb_category` VALUES ('3', '渝派火锅', 'http://www.jybd666.cn/FileSave//category/c88e14254cdd47099c3a589ea7d16c79.png', '0', '2017-09-11 21:14:16', '2017-09-11 22:25:47', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_daily_menu
-- ----------------------------
INSERT INTO `tb_daily_menu` VALUES ('11', '2017-09-11', '004,001,006,002,003,', null, '2017-09-11 02:53:39');
INSERT INTO `tb_daily_menu` VALUES ('12', '2017-09-12', '001,004,006,002,003,', null, '2017-09-11 02:53:58');
INSERT INTO `tb_daily_menu` VALUES ('13', '2017-09-15', '001,006,004,002,003,', null, '2017-09-14 22:48:55');
INSERT INTO `tb_daily_menu` VALUES ('14', '2017-09-14', '001,006,004,002,003,', null, '2017-09-14 22:49:10');
INSERT INTO `tb_daily_menu` VALUES ('15', '2017-09-16', '001,006,004,002,003,', null, '2017-09-15 16:33:02');
INSERT INTO `tb_daily_menu` VALUES ('16', '2017-09-17', '001,006,004,002,003,', null, '2017-09-15 16:33:55');
INSERT INTO `tb_daily_menu` VALUES ('17', '2017-09-18', '001,006,004,002,003,', null, '2017-09-18 15:59:41');
INSERT INTO `tb_daily_menu` VALUES ('18', '2017-09-23', '004,001,006,', null, '2017-09-22 00:12:34');
INSERT INTO `tb_daily_menu` VALUES ('19', '2017-09-22', '002,004,001,006,003,010,007,009,008,005,', null, '2017-09-22 00:12:25');

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
INSERT INTO `tb_delivery_fee` VALUES ('1', '1', '3.5', '2', '2017-07-29 14:09:52', '2017-09-20 12:07:04');
INSERT INTO `tb_delivery_fee` VALUES ('2', '2', '3.5', '2', '2017-07-29 14:09:57', '2017-09-20 21:57:07');
INSERT INTO `tb_delivery_fee` VALUES ('3', '3', '3.5', '2', '2017-07-29 14:09:52', '2017-09-20 21:57:30');
INSERT INTO `tb_delivery_fee` VALUES ('4', '4', '3.5', '2', '2017-07-29 14:09:52', '2017-09-20 21:57:42');
INSERT INTO `tb_delivery_fee` VALUES ('5', '5', '0', '2', '2017-07-29 14:09:52', '2017-09-20 21:58:06');
INSERT INTO `tb_delivery_fee` VALUES ('6', '6', '0', '2', '2017-07-29 14:09:52', '2017-09-20 21:58:10');
INSERT INTO `tb_delivery_fee` VALUES ('7', '7', '0', '2', '2017-07-29 14:09:52', '2017-09-20 21:58:19');
INSERT INTO `tb_delivery_fee` VALUES ('8', '8', '0', '2', '2017-07-29 14:09:52', '2017-09-20 21:58:15');
INSERT INTO `tb_delivery_fee` VALUES ('9', '9', '0', '2', '2017-07-29 14:09:52', '2017-09-20 21:58:25');
INSERT INTO `tb_delivery_fee` VALUES ('10', '10', '0', '2', '2017-07-29 14:09:52', '2017-09-20 21:58:32');
INSERT INTO `tb_delivery_fee` VALUES ('11', '0', '0', '0', '2017-07-31 16:30:23', '2017-08-30 14:27:27');

-- ----------------------------
-- Table structure for `tb_discount_way`
-- ----------------------------
DROP TABLE IF EXISTS `tb_discount_way`;
CREATE TABLE `tb_discount_way` (
  `discount_way_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `min_number` int(11) DEFAULT NULL,
  `max_number` int(11) DEFAULT NULL,
  `reduce_money` int(11) DEFAULT NULL,
  `send_integral` int(11) DEFAULT NULL,
  `ydreduce_money` int(11) DEFAULT NULL,
  PRIMARY KEY (`discount_way_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_discount_way
-- ----------------------------
INSERT INTO `tb_discount_way` VALUES ('1', '2', '0', '15', '6', '3', '2');
INSERT INTO `tb_discount_way` VALUES ('2', '2', '16', '100', '2', '3', '2');
INSERT INTO `tb_discount_way` VALUES ('3', '1', '0', '15', '10', '5', '2');
INSERT INTO `tb_discount_way` VALUES ('4', '1', '16', '100', '5', '3', '2');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_log
-- ----------------------------
INSERT INTO `tb_log` VALUES ('1', '03', '', 'Notify错误java.lang.NullPointerException', '2017-09-19 22:41:51');
INSERT INTO `tb_log` VALUES ('2', '03', '', 'Notify错误java.lang.NullPointerException', '2017-09-19 22:42:04');
INSERT INTO `tb_log` VALUES ('3', '03', '', 'Notify错误java.lang.NullPointerException', '2017-09-19 22:42:21');
INSERT INTO `tb_log` VALUES ('4', '03', '', 'Notify错误java.lang.NullPointerException', '2017-09-19 22:42:53');
INSERT INTO `tb_log` VALUES ('5', '03', '', 'Notify错误java.lang.NullPointerException', '2017-09-19 22:45:56');
INSERT INTO `tb_log` VALUES ('6', '03', '', 'Notify错误java.lang.NullPointerException', '2017-09-19 23:15:57');
INSERT INTO `tb_log` VALUES ('7', '03', '', 'Notify错误java.lang.NullPointerException', '2017-09-19 23:45:59');
INSERT INTO `tb_log` VALUES ('8', '02', '', '回调的订单验签失败<xml><appid><![CDATA[wx53296db0563ea4d6]]></appid><attach><![CDATA[1]]></attach><bank_type><![CDATA[CFT]]></bank_type><cash_fee><![CDATA[200]]></cash_fee><fee_type><![CDATA[CNY]]></fee_type><is_subscribe><![CDATA[Y]]></is_subscribe><mch_id><![CDATA[1488207392]]></mch_id><nonce_str><![CDATA[eeead99df62c4e8d]]></nonce_str><openid><![CDATA[oJ6nY077HOIPv75XMMl25XRVCYtg]]></openid><out_trade_no><![CDATA[20170919104140506426]]></out_trade_no><result_code><![CDATA[SUCCESS]]></result_code><return_code><![CDATA[SUCCESS]]></return_code><sign><![CDATA[73844B48110D2D1CA282E3335C390D07]]></sign><time_end><![CDATA[20170919224150]]></time_end><total_fee>200</total_fee><trade_type><![CDATA[JSAPI]]></trade_type><transaction_id><![CDATA[4200000005201709193087353853]]></transaction_id></xml>', '2017-09-20 00:16:02');
INSERT INTO `tb_log` VALUES ('9', '02', '', '回调的订单验签失败<xml><appid><![CDATA[wx53296db0563ea4d6]]></appid><attach><![CDATA[1]]></attach><bank_type><![CDATA[CFT]]></bank_type><cash_fee><![CDATA[200]]></cash_fee><fee_type><![CDATA[CNY]]></fee_type><is_subscribe><![CDATA[Y]]></is_subscribe><mch_id><![CDATA[1488207392]]></mch_id><nonce_str><![CDATA[eeead99df62c4e8d]]></nonce_str><openid><![CDATA[oJ6nY077HOIPv75XMMl25XRVCYtg]]></openid><out_trade_no><![CDATA[20170919104140506426]]></out_trade_no><result_code><![CDATA[SUCCESS]]></result_code><return_code><![CDATA[SUCCESS]]></return_code><sign><![CDATA[73844B48110D2D1CA282E3335C390D07]]></sign><time_end><![CDATA[20170919224150]]></time_end><total_fee>200</total_fee><trade_type><![CDATA[JSAPI]]></trade_type><transaction_id><![CDATA[4200000005201709193087353853]]></transaction_id></xml>', '2017-09-20 00:46:04');
INSERT INTO `tb_log` VALUES ('10', '02', '', '回调的订单验签失败<xml><appid><![CDATA[wx53296db0563ea4d6]]></appid><attach><![CDATA[1]]></attach><bank_type><![CDATA[CFT]]></bank_type><cash_fee><![CDATA[200]]></cash_fee><fee_type><![CDATA[CNY]]></fee_type><is_subscribe><![CDATA[Y]]></is_subscribe><mch_id><![CDATA[1488207392]]></mch_id><nonce_str><![CDATA[eeead99df62c4e8d]]></nonce_str><openid><![CDATA[oJ6nY077HOIPv75XMMl25XRVCYtg]]></openid><out_trade_no><![CDATA[20170919104140506426]]></out_trade_no><result_code><![CDATA[SUCCESS]]></result_code><return_code><![CDATA[SUCCESS]]></return_code><sign><![CDATA[73844B48110D2D1CA282E3335C390D07]]></sign><time_end><![CDATA[20170919224150]]></time_end><total_fee>200</total_fee><trade_type><![CDATA[JSAPI]]></trade_type><transaction_id><![CDATA[4200000005201709193087353853]]></transaction_id></xml>', '2017-09-20 01:46:06');

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
  `yd_stocknumber` int(11) DEFAULT '0',
  `dc_stocknumber` int(11) DEFAULT '0',
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
INSERT INTO `tb_lunch` VALUES ('001', '古法红烧牛肉饭', '47.8', '35.8', 'http://www.jybd666.cn/FileSave//lunch/a8463549fef040eba31b10d233d4b627.png', 'http://www.jybd666.cn/FileSave//lunch/f91d04aa27134b7eae0e08f281af74f4.png', 'http://www.jybd666.cn/FileSave//lunch/74496d0cd9bb4d80b17a194638bb4531.png', 'http://www.jybd666.cn/FileSave//lunch/c58e7629a19e4026bce2bacfb2c516ba.png', '1', null, '95', '0', '5', '222', '222', '2222', '222', '2017-08-19 14:23:06', '2017-09-22 00:28:41', '1', '20', '0');
INSERT INTO `tb_lunch` VALUES ('002', '台式香菇卤肉饭', '45.8', '33.8', 'http://www.jybd666.cn/FileSave//lunch/b1b72c199b0c4b199fb7aa851404d45b.png', 'http://www.jybd666.cn/FileSave//lunch/7682b299a0a94ef18044ccc7c60deb4a.png', 'http://www.jybd666.cn/FileSave//lunch/4db8baa20e7344ea8067999fcba0576a.png', 'http://www.jybd666.cn/FileSave//lunch/69f5040a60a745409f6e9e7d67853c7f.png', '1', null, '8', '0', '5', '卤肉', '包心菜/萝卜干/花生', '卤肉/包心菜/萝卜干/花生', '鸡精/味精', '2017-08-19 14:57:10', '2017-09-22 00:30:26', '1', '4', '0');
INSERT INTO `tb_lunch` VALUES ('003', '梅菜烧肉饭', '45.8', '33.8', 'http://www.jybd666.cn/FileSave//lunch/053e927d5e0b4002ba6629292d2cc7a5.png', 'http://www.jybd666.cn/FileSave//lunch/32ae834b7cf1445bb73c3cc5ca194156.png', 'http://www.jybd666.cn/FileSave//lunch/20a80a7f911d4e4480169f51371814ef.png', 'http://www.jybd666.cn/FileSave//lunch/5dfb91288c754514b3acfe28193e4a99.png', '1', null, '10', '1', '5', '11', '33', '22', '55', '2017-09-10 15:39:46', '2017-09-20 01:27:54', '1', '0', '0');
INSERT INTO `tb_lunch` VALUES ('004', '虫草花蒸鸡饭', '47.8', '35.8', 'http://www.jybd666.cn/FileSave//lunch/eced6f689c6d4bdeb11f1f8bc5a1b107.png', 'http://www.jybd666.cn/FileSave//lunch/f90383f49e4b4818b4100574b6042cea.png', 'http://www.jybd666.cn/FileSave//lunch/84262b30d8f74ee988278e79058721d9.png', 'http://www.jybd666.cn/FileSave//lunch/3449c9f159c147edb28b08816fd45d75.png', '1', null, '3', '0', '5', '45', '555', '541', '223', '2017-09-10 15:41:07', '2017-09-19 23:42:24', '1', '7', '0');
INSERT INTO `tb_lunch` VALUES ('005', '香汁排骨饭', '33.8', '23.8', 'http://www.jybd666.cn/FileSave//lunch/e30ca01cfe464e659fe95c1e6f0ec456.png', 'http://www.jybd666.cn/FileSave//lunch/cfb17122a000433eb698886d86fd3b7e.png', 'http://www.jybd666.cn/FileSave//lunch/f694a835122e4d7d88e4fe692febef35.png', 'http://www.jybd666.cn/FileSave//lunch/f91eb9aaeefa43ba94a46b09bf194d9e.png', '1', null, '10', '2', '3', '54', '132', '16523', '1652', '2017-09-10 15:42:34', '2017-09-20 01:32:45', '2', '0', '0');
INSERT INTO `tb_lunch` VALUES ('006', '金牌咖喱鸡饭', '45.8', '33.8', 'http://www.jybd666.cn/FileSave//lunch/b2055319781a4d64bd0ff34f64d8684a.png', 'http://www.jybd666.cn/FileSave//lunch/55b15c7773b84f91abd9ec07be4c527a.png', 'http://www.jybd666.cn/FileSave//lunch/f1c5a61c0e3243c0a08f87ffc49f9d10.png', 'http://www.jybd666.cn/FileSave//lunch/a8a695dd6866437d965fcef7a6f1b74c.png', '1', null, '9', '0', '5', '2321', '54', '151', '1210', '2017-09-10 15:43:45', '2017-09-19 22:55:49', '1', '1', '0');
INSERT INTO `tb_lunch` VALUES ('007', '台式香菇卤肉饭', '33.8', '23.8', 'http://www.jybd666.cn/FileSave//lunch/b6221c5a4568463680aa92f7dc0b35a0.png', 'http://www.jybd666.cn/FileSave//lunch/daa4d44975b94107abc7b970ec5b799c.png', 'http://www.jybd666.cn/FileSave//lunch/9726d7a8c76e4d0bb1ba5241b1b11e0c.png', 'http://www.jybd666.cn/FileSave//lunch/ce499148c4c544569ec5f4b3fc1e45a0.png', '1', null, '20', '0', '3', '1', '1', '1511', '1210', '2017-09-20 01:34:20', '2017-09-20 13:29:19', '2', '0', '0');
INSERT INTO `tb_lunch` VALUES ('008', '粤式梅菜烧肉饭', '33.8', '23.8', 'http://www.jybd666.cn/FileSave//lunch/b9721af28da744f289eb8614991bacea.png', 'http://www.jybd666.cn/FileSave//lunch/ce4090ff132a4d35b2ddff311a392674.png', 'http://www.jybd666.cn/FileSave//lunch/c3deabf5e44f4bc9b090747e55e86444.png', 'http://www.jybd666.cn/FileSave//lunch/417aa054334b4600b6314bc7c383ce41.png', '1', null, '20', '0', '3', '1', '1', '151', '1210', '2017-09-20 01:35:50', '2017-09-20 13:29:20', '2', '0', '0');
INSERT INTO `tb_lunch` VALUES ('009', '香汁啤酒鸭饭', '33.8', '23.8', 'http://www.jybd666.cn/FileSave//lunch/4a22a50be1d24294946673f6d823982a.png', 'http://www.jybd666.cn/FileSave//lunch/4e27996bca144549a67e9a50614e4a2f.png', 'http://www.jybd666.cn/FileSave//lunch/666efdb95a8b483aade77a7e49b5c4ba.png', 'http://www.jybd666.cn/FileSave//lunch/d4e263f636b144948b8a8942891d5fb4.png', '1', null, '20', '0', '3', '1', '1', '1', '1', '2017-09-20 01:37:09', '2017-09-20 13:29:20', '2', '0', '0');
INSERT INTO `tb_lunch` VALUES ('010', '川香鱼肉丝饭', '33.8', '23.8', 'http://www.jybd666.cn/FileSave//lunch/69a3510ea27947ffbb641c8747b116a7.png', 'http://www.jybd666.cn/FileSave//lunch/73804263fc6f46f6ac8a1d42cabdfbe8.png', 'http://www.jybd666.cn/FileSave//lunch/fc4a3cdf223847cb9e34e7d4212de756.png', 'http://www.jybd666.cn/FileSave//lunch/d558dd030102467891025efa81bbbb46.png', '1', null, '20', '0', '3', '1', '1', '1', '1', '2017-09-20 01:38:28', '2017-09-20 13:29:19', '2', '0', '0');

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
INSERT INTO `tb_order` VALUES ('20170911015734178596', '12584561', '164', '0', '', '', '164', '164', '0', '1', '2', '10', '', '1', '2017-09-11 02:27:29', '2017-09-11 02:27:29', '0', '0', '0', null, null, null, '2017-09-11 01:57:35', null, null, '20170820124232907421', '980462730908', '', '006@5', '2');

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
  `version` varchar(100) DEFAULT '0',
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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_order_lunch
-- ----------------------------
INSERT INTO `tb_order_lunch` VALUES ('37', '20170911015734178596', '006', '5');

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_scheduled_time
-- ----------------------------
INSERT INTO `tb_scheduled_time` VALUES ('6', '2017-09-13', '午餐', '11:00:00', '14:00:00', '2017-09-12 12:30:30', '2017-09-13 11:00:00', '1,', '2017-09-12 23:22:46');
INSERT INTO `tb_scheduled_time` VALUES ('7', '2017-09-13', '晚餐', '16:00:00', '19:00:00', '2017-09-12 17:30:00', '2017-09-13 16:00:00', '1,', '2017-09-12 23:26:19');
INSERT INTO `tb_scheduled_time` VALUES ('8', '2017-09-14', '午餐', '11:00:00', '14:00:00', '2017-09-13 12:30:00', '2017-09-14 11:00:00', '1,', '2017-09-12 23:31:35');
INSERT INTO `tb_scheduled_time` VALUES ('9', '2017-09-14', '晚餐', '16:00:00', '19:00:00', '2017-09-13 17:30:00', '2017-09-14 16:00:00', '1,', '2017-09-12 23:34:03');
INSERT INTO `tb_scheduled_time` VALUES ('10', '2017-09-15', '午餐', '11:00:00', '14:00:00', '2017-09-14 12:30:00', '2017-09-15 11:00:00', '1,', '2017-09-12 23:37:23');
INSERT INTO `tb_scheduled_time` VALUES ('11', '2017-09-15', '晚餐', '16:00:00', '19:00:00', '2017-09-14 17:30:00', '2017-09-15 16:00:00', '1,', '2017-09-12 23:40:45');
INSERT INTO `tb_scheduled_time` VALUES ('12', '2017-09-16', '午餐', '11:00:00', '14:00:00', '2017-09-15 12:30:00', '2017-09-16 11:00:00', '1,', '2017-09-15 16:46:03');
INSERT INTO `tb_scheduled_time` VALUES ('13', '2017-09-23', '午餐', '16:00:00', '19:00:00', '2017-09-22 00:11:00', '2017-09-22 16:00:00', '1,', '2017-09-22 00:31:17');

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
INSERT INTO `tb_shopcart` VALUES ('1830608294', '001', '1', '20170918075640127538', '2017-09-22 00:28:41', '2017-09-22 00:28:41');
INSERT INTO `tb_shopcart` VALUES ('8323172073', '002', '2', '20170918075640127538', '2017-09-22 00:30:14', '2017-09-22 00:30:26');

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
INSERT INTO `tb_wxmember` VALUES ('20170917114005270090', '22727480', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJBvib2ecBeL5kmMwv7rFuALVibMcPliazvn5OEDEImrlXudUH7tG3VSYqtoM49tfEcRibuxj2ptuwMmg/0', '随缘', '1', 'oJ6nY077HOIPv75XMMl25XRVCYtg', null, '浙江', null, '杭州', null, null, '2017-09-17 23:40:05', '2017-09-17 23:40:05');
INSERT INTO `tb_wxmember` VALUES ('20170917114443614351', '68914547', 'http://wx.qlogo.cn/mmopen/vi_32/qaiagEibYcSWdUy7DhDk9xS8lUZ8FcAIxLHpHhxWXU7NnGLwX7DSNn9kEe2ARGicVTnhwQICqYYAdr41cPqBaOZ3g/0', '刘飞', '2', 'oJ6nY033HkjygQVaiVBomRPn5v7Y', null, '广东', null, '汕头', null, null, '2017-09-17 23:44:43', '2017-09-17 23:44:43');
INSERT INTO `tb_wxmember` VALUES ('20170918041559783566', '58503311', 'http://wx.qlogo.cn/mmopen/vi_32/IKc07NyYft5jTcYfQDJUX6KnZjMnkkyqLmp8LmDIJ7e1hgErOcXPEMYBiaBvPR3TSzMO1h3zgKdppibmpGXTM6jA/0', '缘', '1', 'oJ6nY0zrh7eBV0hpd9hOm80v35-Y', null, '浙江', null, '杭州', null, null, '2017-09-18 16:15:59', '2017-09-18 16:15:59');
INSERT INTO `tb_wxmember` VALUES ('20170918075640127538', '87692995', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLHRPibyPbXCCuc24C05c0MCDP3icMlXia51J6LkuverrAJha5Tq4ibibsU5CERC1r7VGyE6PBZomsVfpg/0', '至始至终', '1', 'oJ6nY02FKz8dt_nRBBIqEpqfexZo', null, '福建', null, '莆田', null, null, '2017-09-18 07:56:40', '2017-09-18 07:56:40');
INSERT INTO `tb_wxmember` VALUES ('20170918083637909495', '93606726', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eotZhUfr0Ess4ThM3Ok9unUUibcsc0lPMustuKE1YLx8PjlvSKg9CY8xCnCwXCvs2lib7UvUT4uCTibw/0', 'jerry fang', '1', 'oJ6nY0-nzo5p-eRZtgmROGgWkJoA', null, '浙江', null, '杭州', null, null, '2017-09-18 08:36:37', '2017-09-18 08:36:37');
INSERT INTO `tb_wxmember` VALUES ('20170919075528183603', '65962693', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLkJWMMMKD9BvdL6p2buaoJQYAwHhZTP0fiapVp13beZuAsibiaiajGJUs6rjBtZgnCfvYuUvIuabCbqg/0', '稀里糊涂。', '2', 'oJ6nY00I8N6rX2zc4sOxIOwc2Abg', null, '重庆', null, '梁平', null, null, '2017-09-19 07:55:28', '2017-09-19 07:55:28');
INSERT INTO `tb_wxmember` VALUES ('20170919113310537341', '62879591', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83equTKdsxEmB88pRzS9sWWUsnF13hXlxFTnABanGfwKc4iaPSRcGb0xicP3nHwLKAGN18MCBhJUia7RzA/0', '九鱼便当＿柳', '1', 'oJ6nY06dTBbtqmskafV3l3nJ7npI', null, '浙江', null, '杭州', null, null, '2017-09-19 11:33:10', '2017-09-19 11:33:10');
INSERT INTO `tb_wxmember` VALUES ('20170919113310765082', '96385120', null, null, null, 'oJ6nY06dTBbtqmskafV3l3nJ7npI', null, null, null, null, null, null, '2017-09-19 11:33:10', '2017-09-19 11:33:10');
INSERT INTO `tb_wxmember` VALUES ('20170919120401745767', '03145189', 'http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaELgllhtGwbic06lp625fjoXNyOrOibACEJ1RtxBQmz7nBr7zNnUb92XsFvmypGCIg2ueMzZL2wVG85Q/0', 'ωins маlе', '1', 'oJ6nY0_-F3H6kPUZP_lHnFgWAELA', null, '浙江', null, '杭州', null, null, '2017-09-19 12:04:01', '2017-09-19 12:04:01');
INSERT INTO `tb_wxmember` VALUES ('20170919124918310763', '01312182', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83er1yGT72cYfzdX7iaexgbVCBC6RWjudjJcIMbOgRvccibibc4awicGghM9r9A0EKU2qgFTX6OIhaEUPBw/0', '周小贤', '1', 'oJ6nY0x9NuVkjW28RZ0CaQSeBTAk', null, '浙江', null, '杭州', null, null, '2017-09-19 12:49:18', '2017-09-19 12:49:18');

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
INSERT INTO `tb_wxmember_address` VALUES ('051883332483', '逛逛街', '1', '15750391950', '杭州玖鱼科技有限公司', '3', '6层602', '20170918111720848741', '2017-09-18 23:18:24', '2017-09-18 23:18:24');
INSERT INTO `tb_wxmember_address` VALUES ('136618419321', '黄正钱', '1', '18601765560', '玖鱼科技有限公司', '3', '6层602', '20170917114005270090', '2017-09-17 23:48:18', '2017-09-17 23:48:18');
INSERT INTO `tb_wxmember_address` VALUES ('960340102286', '嘎嘎', '1', '18058110997', '杭州玖鱼科技有限公司', '3', '6层602', '20170918041559783566', '2017-09-18 16:20:15', '2017-09-18 16:20:15');
INSERT INTO `tb_wxmember_address` VALUES ('980462730908', '11', '1', '18601765560', 'xxx公司', '2', '6层601', '20170820124232907421', '2017-09-11 01:57:14', '2017-09-11 01:57:14');
INSERT INTO `tb_wxmember_address` VALUES ('982986399043', '魏汉文', '1', '15260282340', '杭州玖鱼科技', '3', '6层602', '20170918075640127538', '2017-09-18 23:42:21', '2017-09-18 23:42:21');

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_wxmember_wealth
-- ----------------------------
INSERT INTO `tb_wxmember_wealth` VALUES ('1', '1', '1000', '0', '2017-08-02 11:58:49', '2017-09-03 16:01:45');
INSERT INTO `tb_wxmember_wealth` VALUES ('2', '20170820124232907421', '462.00', '462.00', '2017-08-20 00:42:44', '2017-09-11 02:07:35');
INSERT INTO `tb_wxmember_wealth` VALUES ('3', '20170917114005270090', '0', '0', '2017-09-17 23:40:05', '2017-09-17 23:40:05');
INSERT INTO `tb_wxmember_wealth` VALUES ('4', '20170917114443614351', '0', '0', '2017-09-17 23:44:43', '2017-09-17 23:44:43');
INSERT INTO `tb_wxmember_wealth` VALUES ('5', '20170918075640127538', '0', '0', '2017-09-18 07:56:40', '2017-09-18 07:56:40');
INSERT INTO `tb_wxmember_wealth` VALUES ('6', '20170918083637909495', '0', '0', '2017-09-18 08:36:37', '2017-09-18 08:36:37');
INSERT INTO `tb_wxmember_wealth` VALUES ('7', '20170918041559783566', '0', '0', '2017-09-18 16:15:59', '2017-09-18 16:15:59');
INSERT INTO `tb_wxmember_wealth` VALUES ('8', '20170918111720848741', '0', '0', '2017-09-18 23:17:20', '2017-09-18 23:17:20');
INSERT INTO `tb_wxmember_wealth` VALUES ('9', '20170919075528183603', '0', '0', '2017-09-19 07:55:28', '2017-09-19 07:55:28');
INSERT INTO `tb_wxmember_wealth` VALUES ('10', '20170919113310537341', '0', '0', '2017-09-19 11:33:10', '2017-09-19 11:33:10');
INSERT INTO `tb_wxmember_wealth` VALUES ('11', '20170919113310765082', '0', '0', '2017-09-19 11:33:10', '2017-09-19 11:33:10');
INSERT INTO `tb_wxmember_wealth` VALUES ('12', '20170919120401745767', '0', '0', '2017-09-19 12:04:01', '2017-09-19 12:04:01');
INSERT INTO `tb_wxmember_wealth` VALUES ('13', '20170919124918310763', '0', '0', '2017-09-19 12:49:18', '2017-09-19 12:49:18');

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
INSERT INTO `tb_wxmember_wealthhistory` VALUES ('20170911015735208529', '20170820124232907421', '164.00', '2', '20170911015734178596', '1', '2017-09-11 01:57:35', '2017-09-11 01:57:35');
INSERT INTO `tb_wxmember_wealthhistory` VALUES ('20170911015735248351', '20170820124232907421', '10', '1', '20170911015734178596', '3', '2017-09-11 01:57:35', '2017-09-11 01:57:35');
INSERT INTO `tb_wxmember_wealthhistory` VALUES ('20170911020735710441', '20170820124232907421', '0.00', null, '20170911015734178596', '2', '2017-09-11 02:07:35', '2017-09-11 02:07:35');
