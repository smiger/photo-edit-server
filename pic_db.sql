/*
 Navicat Premium Data Transfer

 Source Server         : 114.55.30.60aliyun
 Source Server Type    : MySQL
 Source Server Version : 50740 (5.7.40-log)
 Source Host           : localhost:3306
 Source Schema         : pic_db

 Target Server Type    : MySQL
 Target Server Version : 50740 (5.7.40-log)
 File Encoding         : 65001

 Date: 05/05/2023 22:10:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for qw_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `qw_auth_group`;
CREATE TABLE `qw_auth_group`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `rules` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qw_auth_group
-- ----------------------------
INSERT INTO `qw_auth_group` VALUES (1, '超级管理员', 1, '1,2,3,56,6,5,7,8,9,10,51,52,53,57,13,14,15,16,17,18,108,109,110');

-- ----------------------------
-- Table structure for qw_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `qw_auth_group_access`;
CREATE TABLE `qw_auth_group_access`  (
  `uid` mediumint(8) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL,
  UNIQUE INDEX `uid_group_id`(`uid`, `group_id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of qw_auth_group_access
-- ----------------------------
INSERT INTO `qw_auth_group_access` VALUES (1, 1);

-- ----------------------------
-- Table structure for qw_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `qw_auth_rule`;
CREATE TABLE `qw_auth_rule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `name` char(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `title` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `condition` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `islink` tinyint(1) NOT NULL DEFAULT 1,
  `o` int(11) NOT NULL COMMENT '排序',
  `tips` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 112 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qw_auth_rule
-- ----------------------------
INSERT INTO `qw_auth_rule` VALUES (1, 0, 'Index/index', '返回首页', 'menu-icon fa fa-tachometer', 1, 1, '', 1, 0, '友情提示：经常查看操作日志，发现异常以便及时追查原因。');
INSERT INTO `qw_auth_rule` VALUES (2, 0, '', '系统设置', 'menu-icon fa fa-cog', 1, 1, '', 1, 2, '');
INSERT INTO `qw_auth_rule` VALUES (3, 2, 'Setting/setting', '网站设置', 'menu-icon fa fa-caret-right', 1, 1, '', 1, 3, '这是网站设置的提示。');
INSERT INTO `qw_auth_rule` VALUES (4, 2, 'Menu/index', '后台菜单', 'menu-icon fa fa-caret-right', 1, 1, '', 1, 4, '');
INSERT INTO `qw_auth_rule` VALUES (5, 2, 'Menu/add', '新增菜单', 'menu-icon fa fa-caret-right', 1, 1, '', 0, 5, '');
INSERT INTO `qw_auth_rule` VALUES (6, 4, 'Menu/edit', '编辑菜单', '', 1, 1, '', 0, 6, '');
INSERT INTO `qw_auth_rule` VALUES (7, 2, 'Menu/update', '保存菜单', 'menu-icon fa fa-caret-right', 1, 1, '', 0, 7, '');
INSERT INTO `qw_auth_rule` VALUES (8, 2, 'Menu/del', '删除菜单', 'menu-icon fa fa-caret-right', 1, 1, '', 0, 8, '');
INSERT INTO `qw_auth_rule` VALUES (9, 2, 'Database/backup', '数据库备份', 'menu-icon fa fa-caret-right', 1, 1, '', 1, 9, '');
INSERT INTO `qw_auth_rule` VALUES (10, 9, 'Database/recovery', '数据库还原', '', 1, 1, '', 0, 10, '');
INSERT INTO `qw_auth_rule` VALUES (13, 0, '', '用户及组', 'menu-icon fa fa-users', 1, 1, '', 1, 13, '');
INSERT INTO `qw_auth_rule` VALUES (14, 13, 'Member/index', '用户管理', 'menu-icon fa fa-caret-right', 1, 1, '', 1, 14, '');
INSERT INTO `qw_auth_rule` VALUES (15, 13, 'Member/add', '新增用户', 'menu-icon fa fa-caret-right', 1, 1, '', 1, 15, '');
INSERT INTO `qw_auth_rule` VALUES (16, 13, 'Member/edit', '编辑用户', 'menu-icon fa fa-caret-right', 1, 1, '', 0, 16, '');
INSERT INTO `qw_auth_rule` VALUES (17, 13, 'Member/update', '保存用户', 'menu-icon fa fa-caret-right', 1, 1, '', 0, 17, '');
INSERT INTO `qw_auth_rule` VALUES (18, 13, 'Member/del', '删除用户', '', 1, 1, '', 0, 18, '');
INSERT INTO `qw_auth_rule` VALUES (19, 13, 'Group/index', '用户组管理', 'menu-icon fa fa-caret-right', 1, 1, '', 1, 19, '');
INSERT INTO `qw_auth_rule` VALUES (21, 13, 'Group/edit', '编辑用户组', 'menu-icon fa fa-caret-right', 1, 1, '', 0, 21, '');
INSERT INTO `qw_auth_rule` VALUES (22, 13, 'Group/update', '保存用户组', 'menu-icon fa fa-caret-right', 1, 1, '', 0, 22, '');
INSERT INTO `qw_auth_rule` VALUES (23, 13, 'Group/del', '删除用户组', '', 1, 1, '', 0, 23, '');
INSERT INTO `qw_auth_rule` VALUES (51, 9, 'Database/export', '备份', '', 1, 1, '', 0, 51, '');
INSERT INTO `qw_auth_rule` VALUES (52, 9, 'Database/optimize', '数据优化', '', 1, 1, '', 0, 52, '');
INSERT INTO `qw_auth_rule` VALUES (53, 9, 'Database/repair', '修复表', '', 1, 1, '', 0, 53, '');
INSERT INTO `qw_auth_rule` VALUES (56, 3, 'Setting/update', '设置保存', '', 1, 1, '', 0, 56, '');
INSERT INTO `qw_auth_rule` VALUES (57, 9, 'Database/del', '备份删除', '', 1, 1, '', 0, 57, '');
INSERT INTO `qw_auth_rule` VALUES (108, 0, '', '图片管理', 'menu-icon fa fa-desktop', 1, 1, '', 1, 14, '');
INSERT INTO `qw_auth_rule` VALUES (109, 108, 'Photo/add', '新增图片', 'menu-icon fa fa-caret-right', 1, 1, '', 1, 0, '');
INSERT INTO `qw_auth_rule` VALUES (110, 108, 'Photo/index', '图片列表', 'menu-icon fa fa-caret-right', 1, 1, '', 1, 2, '');

-- ----------------------------
-- Table structure for qw_member
-- ----------------------------
DROP TABLE IF EXISTS `qw_member`;
CREATE TABLE `qw_member`  (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信微ID',
  `headimgurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信微头像',
  `user` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `head` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `sex` tinyint(1) NULL DEFAULT NULL COMMENT '0保密1男，2女',
  `birthday` int(10) NULL DEFAULT NULL COMMENT '生日',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话',
  `qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QQ',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `t` int(10) UNSIGNED NOT NULL COMMENT '注册时间',
  `identifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `token` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `salt` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 91 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qw_member
-- ----------------------------
INSERT INTO `qw_member` VALUES (1, 'www0766citycom', '', 'admin', '/Public/attached/201601/1453389194.png', 1, 1420128000, '13800138000', '331349451', 'admin@0766city.com', '0fa5933c7d220e1334ba99d6f751074c', 1509607283, '036922f49b375eaf7ecb70dbb1b4f93f', '3c8add2130df22357b79870df3c1b16e', 'prDjMa7egM');

-- ----------------------------
-- Table structure for qw_photo
-- ----------------------------
DROP TABLE IF EXISTS `qw_photo`;
CREATE TABLE `qw_photo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `content` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `category` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '分类',
  `addtime` int(11) NOT NULL,
  `image` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3385 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qw_photo
-- ----------------------------
INSERT INTO `qw_photo` VALUES (3382, '<img src=\"/Public/attached/image/20200222/20200222143533_60394.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200222143533_44936.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200222143533_85958.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200222143533_79017.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200222143533_82642.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200222143533_98996.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200222143534_18247.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200222143534_22347.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200222143534_33110.jpg\" alt=\"\" />', '一起变美', '', 1681918347, '/Public/attached/202002/1582378622.jpg');
INSERT INTO `qw_photo` VALUES (3374, '<img src=\"/Public/attached/image/20200222/20200223031217_88821.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200223031218_44071.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200223031218_37212.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200223031218_99019.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200223031218_52117.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200223031218_10407.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200223031218_31652.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200223031219_28936.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200223031220_64731.jpg\" alt=\"\" />', '爱心', '', 1504839235, '/Public/attached/202002/1582423922.jpg');
INSERT INTO `qw_photo` VALUES (3383, '<img src=\"/Public/attached/image/20200222/20200223034927_65989.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200223034927_42450.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200223034927_49037.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200223034927_62959.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200223034928_74801.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200223034928_62449.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200223034928_17864.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200223034928_81592.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200223034928_49006.jpg\" alt=\"\" />', '好运暴富变美', '', 1504839235, '/Public/attached/202002/1582445001.jpg');
INSERT INTO `qw_photo` VALUES (3376, '<img src=\"/Public/attached/image/20200222/20200223032319_74041.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200223032319_19714.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200223032319_45379.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200223032320_12412.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200223032320_74653.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200223032320_84243.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200223032320_79063.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200223032320_30208.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200223032320_69941.jpg\" alt=\"\" />', '爱心', '', 1504839235, '/Public/attached/202002/1582424585.jpg');
INSERT INTO `qw_photo` VALUES (3375, '<img src=\"/Public/attached/image/20200222/20200223031638_63817.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200223031638_67989.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200223031638_76019.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200223031638_10374.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200223031639_68070.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200223031639_13035.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200223031639_35107.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200223031639_91320.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200223031639_32149.jpg\" alt=\"\" />', '爱心', '', 1504839235, '/Public/attached/202002/1582424138.jpg');
INSERT INTO `qw_photo` VALUES (3384, '<img src=\"/Public/attached/image/20200222/20200223033207_39356.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200223033207_43147.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200223033207_80331.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200223033207_36190.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200223033207_93278.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200223033207_41466.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200223033207_97156.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200223033207_73165.jpg\" alt=\"\" /><img src=\"/Public/attached/image/20200222/20200223033207_21538.jpg\" alt=\"\" />', '丘比特', '', 1504839235, '/Public/attached/202002/1582445037.jpg');

-- ----------------------------
-- Table structure for qw_photo_guanzhu
-- ----------------------------
DROP TABLE IF EXISTS `qw_photo_guanzhu`;
CREATE TABLE `qw_photo_guanzhu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vid` int(11) NOT NULL,
  `openid` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `uname` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1999 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qw_photo_guanzhu
-- ----------------------------
INSERT INTO `qw_photo_guanzhu` VALUES (1889, 3380, 'o4nEO0Ub6FWYYw1L-UBRcE_0r69s', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLmpPrUOnDmlVzBnsZBia42ISFeXfE4Z9hfjrmryCPDicpiamwia8EZAXC08icQrAkIUWY0Kux29roPzAA/0', '游客', 1505056446);
INSERT INTO `qw_photo_guanzhu` VALUES (1890, 3375, 'o4nEO0Ub6FWYYw1L-UBRcE_0r69s', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLmpPrUOnDmlVzBnsZBia42ISFeXfE4Z9hfjrmryCPDicpiamwia8EZAXC08icQrAkIUWY0Kux29roPzAA/0', '游客', 1504932403);
INSERT INTO `qw_photo_guanzhu` VALUES (1891, 3378, 'o4nEO0Ub6FWYYw1L-UBRcE_0r69s', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLmpPrUOnDmlVzBnsZBia42ISFeXfE4Z9hfjrmryCPDicpiamwia8EZAXC08icQrAkIUWY0Kux29roPzAA/0', '游客', 1505056449);
INSERT INTO `qw_photo_guanzhu` VALUES (1892, 3381, 'o4nEO0TZ5t3NmTfIajS4f5OdRnFM', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1504847840);
INSERT INTO `qw_photo_guanzhu` VALUES (1893, 3380, 'o4nEO0TZ5t3NmTfIajS4f5OdRnFM', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1504847847);
INSERT INTO `qw_photo_guanzhu` VALUES (1894, 3379, 'o4nEO0TZ5t3NmTfIajS4f5OdRnFM', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1504847849);
INSERT INTO `qw_photo_guanzhu` VALUES (1895, 3378, 'o4nEO0TZ5t3NmTfIajS4f5OdRnFM', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1504847852);
INSERT INTO `qw_photo_guanzhu` VALUES (1896, 3377, 'o4nEO0TZ5t3NmTfIajS4f5OdRnFM', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1504847854);
INSERT INTO `qw_photo_guanzhu` VALUES (1897, 3376, 'o4nEO0TZ5t3NmTfIajS4f5OdRnFM', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1504847856);
INSERT INTO `qw_photo_guanzhu` VALUES (1898, 3375, 'o4nEO0TZ5t3NmTfIajS4f5OdRnFM', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1504847857);
INSERT INTO `qw_photo_guanzhu` VALUES (1899, 3374, 'o4nEO0TZ5t3NmTfIajS4f5OdRnFM', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1504847864);
INSERT INTO `qw_photo_guanzhu` VALUES (1900, 0, 'o4nEO0TZ5t3NmTfIajS4f5OdRnFM', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1504847863);
INSERT INTO `qw_photo_guanzhu` VALUES (1901, 3381, 'o4nEO0b8kL6zmR8FYBOBw3_aB25w', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1504851252);
INSERT INTO `qw_photo_guanzhu` VALUES (1902, 3379, 'o4nEO0b8kL6zmR8FYBOBw3_aB25w', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1504851257);
INSERT INTO `qw_photo_guanzhu` VALUES (1903, 3375, 'o4nEO0XzOC_YJT1rAzAmaO-aVEWc', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIGexj70QXo7wNCrtL0ibOtqDpj27uO8lLTWtYNEuphD4tXh8wEWDaWCoibw5rowSIFiad6cjZNhVz0Q/0', '游客', 1504852376);
INSERT INTO `qw_photo_guanzhu` VALUES (1904, 3374, 'o4nEO0XzOC_YJT1rAzAmaO-aVEWc', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIGexj70QXo7wNCrtL0ibOtqDpj27uO8lLTWtYNEuphD4tXh8wEWDaWCoibw5rowSIFiad6cjZNhVz0Q/0', '游客', 1504852382);
INSERT INTO `qw_photo_guanzhu` VALUES (1905, 0, 'o4nEO0XzOC_YJT1rAzAmaO-aVEWc', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIGexj70QXo7wNCrtL0ibOtqDpj27uO8lLTWtYNEuphD4tXh8wEWDaWCoibw5rowSIFiad6cjZNhVz0Q/0', '游客', 1504852382);
INSERT INTO `qw_photo_guanzhu` VALUES (1906, 3375, 'o4nEO0Y3suLMQ-tDE7Qr-JUc9gp8', 'https://wx.qlogo.cn/mmopen/vi_32/JeSyW6U84trGKGxZdFeN31BmcANo7gOTlHUDIvgejeVrtSicPnlWVHyMOsM8lntjEcFoZ9Dd26LkD0OVQiaQ621g/0', '游客', 1504852572);
INSERT INTO `qw_photo_guanzhu` VALUES (1907, 3374, 'o4nEO0Y3suLMQ-tDE7Qr-JUc9gp8', 'https://wx.qlogo.cn/mmopen/vi_32/JeSyW6U84trGKGxZdFeN31BmcANo7gOTlHUDIvgejeVrtSicPnlWVHyMOsM8lntjEcFoZ9Dd26LkD0OVQiaQ621g/0', '游客', 1504852586);
INSERT INTO `qw_photo_guanzhu` VALUES (1908, 3381, 'o4nEO0UAhgLrd5qjkjHoDfuqruMA', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1504857379);
INSERT INTO `qw_photo_guanzhu` VALUES (1909, 3379, 'o4nEO0UAhgLrd5qjkjHoDfuqruMA', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1504857432);
INSERT INTO `qw_photo_guanzhu` VALUES (1910, 3381, 'o4nEO0dOjbg5Kdp1whTQI1V1pMys', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1504860725);
INSERT INTO `qw_photo_guanzhu` VALUES (1911, 3381, 'o4nEO0eiDkxGkPl2Oqc0WkRgHGcE', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1504860863);
INSERT INTO `qw_photo_guanzhu` VALUES (1912, 3381, 'o4nEO0XIF5bVm9bZxzXCB5AjsrGE', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1504866449);
INSERT INTO `qw_photo_guanzhu` VALUES (1913, 3381, 'o4nEO0Ub6FWYYw1L-UBRcE_0r69s', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLmpPrUOnDmlVzBnsZBia42ISFeXfE4Z9hfjrmryCPDicpiamwia8EZAXC08icQrAkIUWY0Kux29roPzAA/0', '游客', 1505056442);
INSERT INTO `qw_photo_guanzhu` VALUES (1914, 3379, 'o4nEO0Ub6FWYYw1L-UBRcE_0r69s', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLmpPrUOnDmlVzBnsZBia42ISFeXfE4Z9hfjrmryCPDicpiamwia8EZAXC08icQrAkIUWY0Kux29roPzAA/0', '游客', 1505056447);
INSERT INTO `qw_photo_guanzhu` VALUES (1915, 3377, 'o4nEO0Ub6FWYYw1L-UBRcE_0r69s', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLmpPrUOnDmlVzBnsZBia42ISFeXfE4Z9hfjrmryCPDicpiamwia8EZAXC08icQrAkIUWY0Kux29roPzAA/0', '游客', 1504932409);
INSERT INTO `qw_photo_guanzhu` VALUES (1916, 3376, 'o4nEO0Ub6FWYYw1L-UBRcE_0r69s', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLmpPrUOnDmlVzBnsZBia42ISFeXfE4Z9hfjrmryCPDicpiamwia8EZAXC08icQrAkIUWY0Kux29roPzAA/0', '游客', 1504932406);
INSERT INTO `qw_photo_guanzhu` VALUES (1917, 3374, 'o4nEO0Ub6FWYYw1L-UBRcE_0r69s', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLmpPrUOnDmlVzBnsZBia42ISFeXfE4Z9hfjrmryCPDicpiamwia8EZAXC08icQrAkIUWY0Kux29roPzAA/0', '游客', 1504932400);
INSERT INTO `qw_photo_guanzhu` VALUES (1918, 3376, 'o4nEO0VysfT6n9VFPlWZS2_E3tG4', 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEL5BX2zia0wzrV5icHlBkItABgPicGg738e4cYLmpmMMrhonV4O5Zic7ickSQgM4FmDKvbb8b9Dcvf3oiag/0', '游客', 1504875385);
INSERT INTO `qw_photo_guanzhu` VALUES (1919, 3375, 'o4nEO0e3Q-HagFlSdrNYhE1G2CRM', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1504879348);
INSERT INTO `qw_photo_guanzhu` VALUES (1920, 3381, 'o4nEO0WMq_Er5fT8r94cKrGq2qho', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1504880223);
INSERT INTO `qw_photo_guanzhu` VALUES (1921, 3378, 'o4nEO0WMq_Er5fT8r94cKrGq2qho', 'https://wx.qlogo.cn/mmopen/vi_32/aibNlE1yDyWN7nBv4z3SiafczrdReYakkCCLtEImTfMoeDYrk5SnicnZxOXqMREUd2K9ShwVmoIdJs5CG7XvdhZWA/0', '游客', 1504880255);
INSERT INTO `qw_photo_guanzhu` VALUES (1922, 3375, 'o4nEO0fcbfu8ajXQO7mwjBC-93YY', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1504883939);
INSERT INTO `qw_photo_guanzhu` VALUES (1923, 3381, 'o4nEO0el-vARnTjvOfz4gWYrEvVg', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJONlFTBicnwwOqT8LO9UojTKkA4YKRjqibajrjlicA513xcaay1ibneOlwjZapoMv5e2m60kyFuwAGqw/0', '游客', 1504884032);
INSERT INTO `qw_photo_guanzhu` VALUES (1924, 3374, 'o4nEO0TuQm5j3auvnm3S9aen_00E', 'https://wx.qlogo.cn/mmopen/vi_32/IlFkBucqcqHdAOtG8XMpicdnJKicxek1YIXWLWeX1PeS5z40GxfjK6BFHgsmcicJUicGLzVBbXmEE5pRaX3YDpBfyQ/0', '游客', 1504884328);
INSERT INTO `qw_photo_guanzhu` VALUES (1925, 3375, 'o4nEO0TuQm5j3auvnm3S9aen_00E', 'https://wx.qlogo.cn/mmopen/vi_32/IlFkBucqcqHdAOtG8XMpicdnJKicxek1YIXWLWeX1PeS5z40GxfjK6BFHgsmcicJUicGLzVBbXmEE5pRaX3YDpBfyQ/0', '游客', 1504884320);
INSERT INTO `qw_photo_guanzhu` VALUES (1926, 0, 'o4nEO0TuQm5j3auvnm3S9aen_00E', 'https://wx.qlogo.cn/mmopen/vi_32/IlFkBucqcqHdAOtG8XMpicdnJKicxek1YIXWLWeX1PeS5z40GxfjK6BFHgsmcicJUicGLzVBbXmEE5pRaX3YDpBfyQ/0', '游客', 1504884327);
INSERT INTO `qw_photo_guanzhu` VALUES (1927, 3374, 'o4nEO0TktWohD-LasIFKFVopr58Y', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1504885610);
INSERT INTO `qw_photo_guanzhu` VALUES (1928, 3380, 'o4nEO0dX2N6JL54raVQ-SGzBJneE', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1504887252);
INSERT INTO `qw_photo_guanzhu` VALUES (1929, 3381, 'o4nEO0dX2N6JL54raVQ-SGzBJneE', 'https://wx.qlogo.cn/mmopen/vi_32/AcfBSrUibsSCmnYxU23k2ibMSyjibWicwnkMr1BOKY90MzSPpibxWRtImML0wEYcDjDIAySrBTv4s4bIW2T7qPNzhsA/0', '游客', 1504887247);
INSERT INTO `qw_photo_guanzhu` VALUES (1930, 3381, 'o4nEO0VJkthgPqRYRtwf-TyGw-pE', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKTwxppn1SYBYQvCKbEmq02l9pXVia8UjjM4k5BbPcKqmq7EXZicxInDhbuACMMCsWEvlV5r14TNwhA/0', '游客', 1504888037);
INSERT INTO `qw_photo_guanzhu` VALUES (1931, 3379, 'o4nEO0aQNWN8M5DbNjnHhpcbXlDE', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1504889073);
INSERT INTO `qw_photo_guanzhu` VALUES (1932, 3378, 'o4nEO0SB65QeVC9OpRiqzL6PAtE8', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1504891981);
INSERT INTO `qw_photo_guanzhu` VALUES (1933, 3381, 'o4nEO0SWojfAsRqfEW_NdxNv5Ojc', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKc80RTSolDX69GHXOA7MtvsLpicezGmlX0wkYCm92o8iaGMcCJhAlGpVAQZURo79ibl1USJULkHfxLg/0', '游客', 1504915747);
INSERT INTO `qw_photo_guanzhu` VALUES (1934, 3375, 'o4nEO0SWojfAsRqfEW_NdxNv5Ojc', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKc80RTSolDX69GHXOA7MtvsLpicezGmlX0wkYCm92o8iaGMcCJhAlGpVAQZURo79ibl1USJULkHfxLg/0', '游客', 1504915802);
INSERT INTO `qw_photo_guanzhu` VALUES (1935, 3380, 'o4nEO0QQs-eU6KV8xKya52MguGDU', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epSqZvTMn6x6PbVsRnSlqt0hHj6NgiajQ2TPjs8ibtYeqxAp9GdPGVAAty3WKIGGpKdx7Byaz516jqg/0', '游客', 1504919443);
INSERT INTO `qw_photo_guanzhu` VALUES (1936, 3377, 'o4nEO0QQs-eU6KV8xKya52MguGDU', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epSqZvTMn6x6PbVsRnSlqt0hHj6NgiajQ2TPjs8ibtYeqxAp9GdPGVAAty3WKIGGpKdx7Byaz516jqg/0', '游客', 1504919451);
INSERT INTO `qw_photo_guanzhu` VALUES (1937, 3376, 'o4nEO0QQs-eU6KV8xKya52MguGDU', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epSqZvTMn6x6PbVsRnSlqt0hHj6NgiajQ2TPjs8ibtYeqxAp9GdPGVAAty3WKIGGpKdx7Byaz516jqg/0', '游客', 1504919454);
INSERT INTO `qw_photo_guanzhu` VALUES (1938, 3379, 'o4nEO0QQs-eU6KV8xKya52MguGDU', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epSqZvTMn6x6PbVsRnSlqt0hHj6NgiajQ2TPjs8ibtYeqxAp9GdPGVAAty3WKIGGpKdx7Byaz516jqg/0', '游客', 1504919454);
INSERT INTO `qw_photo_guanzhu` VALUES (1939, 3375, 'o4nEO0QQs-eU6KV8xKya52MguGDU', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epSqZvTMn6x6PbVsRnSlqt0hHj6NgiajQ2TPjs8ibtYeqxAp9GdPGVAAty3WKIGGpKdx7Byaz516jqg/0', '游客', 1504919456);
INSERT INTO `qw_photo_guanzhu` VALUES (1940, 3380, 'o4nEO0UOlZbiOZdehOhlCJdF-Bdg', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1504919662);
INSERT INTO `qw_photo_guanzhu` VALUES (1941, 3379, 'o4nEO0UOlZbiOZdehOhlCJdF-Bdg', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1504919674);
INSERT INTO `qw_photo_guanzhu` VALUES (1942, 3374, 'o4nEO0WIZEhb6im3udp-2iZ2u8U0', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLgXj6Axr2aRCWD2BLD7VW0rOHv5tmln1SzOJ8dSIIlxxtNGMkA7xGeQgSU4QFZgNQ6ichdsnxzZTQ/0', '游客', 1504931235);
INSERT INTO `qw_photo_guanzhu` VALUES (1943, 3380, 'o4nEO0WIZEhb6im3udp-2iZ2u8U0', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLgXj6Axr2aRCWD2BLD7VW0rOHv5tmln1SzOJ8dSIIlxxtNGMkA7xGeQgSU4QFZgNQ6ichdsnxzZTQ/0', '游客', 1504931463);
INSERT INTO `qw_photo_guanzhu` VALUES (1944, 3381, 'o4nEO0WIZEhb6im3udp-2iZ2u8U0', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLgXj6Axr2aRCWD2BLD7VW0rOHv5tmln1SzOJ8dSIIlxxtNGMkA7xGeQgSU4QFZgNQ6ichdsnxzZTQ/0', '游客', 1504931455);
INSERT INTO `qw_photo_guanzhu` VALUES (1945, 3379, 'o4nEO0WIZEhb6im3udp-2iZ2u8U0', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLgXj6Axr2aRCWD2BLD7VW0rOHv5tmln1SzOJ8dSIIlxxtNGMkA7xGeQgSU4QFZgNQ6ichdsnxzZTQ/0', '游客', 1504931466);
INSERT INTO `qw_photo_guanzhu` VALUES (1946, 0, 'o4nEO0Ub6FWYYw1L-UBRcE_0r69s', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLmpPrUOnDmlVzBnsZBia42ISFeXfE4Z9hfjrmryCPDicpiamwia8EZAXC08icQrAkIUWY0Kux29roPzAA/0', '游客', 1505110140);
INSERT INTO `qw_photo_guanzhu` VALUES (1947, 3380, 'o4nEO0dvXYXqiB8gBHxTfy3pvwU0', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epy2kVbOmNyUvastlqOfgKtkfJTp4H5uMpniauIHaevVCAyPwvucvaW4LMZiaKJAbxQcOLtgkrmic4nQ/0', '游客', 1504940617);
INSERT INTO `qw_photo_guanzhu` VALUES (1948, 3377, 'o4nEO0Qx4GybQ4uX9EH3Ii3vEGZE', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKzrRJqdQ1edo63foEcprXm5WfqgI4eJQqJEDCy3N63BVzwz8yicacLEMP1ueianoZKYQN5ibO5nZaCQ/0', '游客', 1504953407);
INSERT INTO `qw_photo_guanzhu` VALUES (1949, 3376, 'o4nEO0Qx4GybQ4uX9EH3Ii3vEGZE', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKzrRJqdQ1edo63foEcprXm5WfqgI4eJQqJEDCy3N63BVzwz8yicacLEMP1ueianoZKYQN5ibO5nZaCQ/0', '游客', 1504953411);
INSERT INTO `qw_photo_guanzhu` VALUES (1950, 3375, 'o4nEO0Qx4GybQ4uX9EH3Ii3vEGZE', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKzrRJqdQ1edo63foEcprXm5WfqgI4eJQqJEDCy3N63BVzwz8yicacLEMP1ueianoZKYQN5ibO5nZaCQ/0', '游客', 1504953412);
INSERT INTO `qw_photo_guanzhu` VALUES (1951, 3381, 'o4nEO0dUV8ftHxfm5pheuwo-Fa9I', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1504971173);
INSERT INTO `qw_photo_guanzhu` VALUES (1952, 3375, 'o4nEO0QswE3TLlRN67fzdMhAQ3Rk', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoQKibtAFYKTJTnvqM8zg67tiabWpfk8z4PWFqDIVVXrZY21AvGFwia3ibrmubKK4JB6EhHbBhjCeebtQ/0', '游客', 1504973528);
INSERT INTO `qw_photo_guanzhu` VALUES (1953, 3374, 'o4nEO0QswE3TLlRN67fzdMhAQ3Rk', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoQKibtAFYKTJTnvqM8zg67tiabWpfk8z4PWFqDIVVXrZY21AvGFwia3ibrmubKK4JB6EhHbBhjCeebtQ/0', '游客', 1504973537);
INSERT INTO `qw_photo_guanzhu` VALUES (1954, 3378, 'o4nEO0bhuZqixvOfPvXge5B4cUG0', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1504979871);
INSERT INTO `qw_photo_guanzhu` VALUES (1955, 3377, 'o4nEO0RAIdh9o0bmRxYOwkWd-znE', 'https://wx.qlogo.cn/mmopen/vi_32/ARxg2t3F5NvL8EP2qCMoeSwDWhp1nfqeFicUfyrficjZbFAJoXLeDcMjH5fxI5ibvU9TOSib6ODY9TSgrBKugBuLLw/0', '游客', 1504982816);
INSERT INTO `qw_photo_guanzhu` VALUES (1956, 3375, 'o4nEO0U2iyC5-38LEymJlyiN_WO0', 'https://wx.qlogo.cn/mmopen/vi_32/QFGBcoeRMXOBv6nFCHUSA3ATmHovibzicibzbDnYTklrxicYy4kSjB4m9a0kQY5rBcgf34mAnyoph3ZQ2zbtEYsaQA/0', '游客', 1504995619);
INSERT INTO `qw_photo_guanzhu` VALUES (1957, 3380, 'o4nEO0TPwVGX9C9tLTV-a_sDSYoo', 'https://wx.qlogo.cn/mmopen/vi_32/IwKys5P9NgdNSLf8fTZKZNJlV7yOLlMO1P2Ph4EzbK8A4w2KtwoR7U0N9QYcSx0vZkJETCZicYStUmqTuicya5Sg/0', '游客', 1505010958);
INSERT INTO `qw_photo_guanzhu` VALUES (1958, 3381, 'o4nEO0TPwVGX9C9tLTV-a_sDSYoo', 'https://wx.qlogo.cn/mmopen/vi_32/IwKys5P9NgdNSLf8fTZKZNJlV7yOLlMO1P2Ph4EzbK8A4w2KtwoR7U0N9QYcSx0vZkJETCZicYStUmqTuicya5Sg/0', '游客', 1505010977);
INSERT INTO `qw_photo_guanzhu` VALUES (1959, 3376, 'o4nEO0TPwVGX9C9tLTV-a_sDSYoo', 'https://wx.qlogo.cn/mmopen/vi_32/IwKys5P9NgdNSLf8fTZKZNJlV7yOLlMO1P2Ph4EzbK8A4w2KtwoR7U0N9QYcSx0vZkJETCZicYStUmqTuicya5Sg/0', '游客', 1505011006);
INSERT INTO `qw_photo_guanzhu` VALUES (1960, 3381, 'o4nEO0dJl4m3o3_5eUDMat7BsjXk', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1505023141);
INSERT INTO `qw_photo_guanzhu` VALUES (1961, 3376, 'o4nEO0U4cg3dir2_Os3V8hbuRIi8', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1505028906);
INSERT INTO `qw_photo_guanzhu` VALUES (1962, 3375, 'o4nEO0U4cg3dir2_Os3V8hbuRIi8', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1505028913);
INSERT INTO `qw_photo_guanzhu` VALUES (1963, 3374, 'o4nEO0U4cg3dir2_Os3V8hbuRIi8', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1505028916);
INSERT INTO `qw_photo_guanzhu` VALUES (1964, 3374, 'o4nEO0Q4TVU_Whj6boWVarfUeSmM', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1505038909);
INSERT INTO `qw_photo_guanzhu` VALUES (1965, 3381, 'o4nEO0dgJHy8dobztbaUrjcNlKrs', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1505041366);
INSERT INTO `qw_photo_guanzhu` VALUES (1966, 3381, 'o4nEO0TU_7VcWjLdlDn8h4V8dQgM', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI5snx6fqLSTPo1RT7suqQnaGcNicibddiczRZFYZaCOvrBYsvdEgk4Rs221cr55W3QSY9o9KlgiaqO9w/0', '游客', 1505045970);
INSERT INTO `qw_photo_guanzhu` VALUES (1967, 3379, 'o4nEO0dLZo77iUE82oJg_vSziEno', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1505048121);
INSERT INTO `qw_photo_guanzhu` VALUES (1968, 3378, 'o4nEO0dLZo77iUE82oJg_vSziEno', 'https://wx.qlogo.cn/mmopen/vi_32/nric1j2JK4OXicuRk7YwROZicx9oKg9ng3FkJDYic91PX1ibNibravATNrVICnppgYCCo1yMHcz1ObvL7PIw56bIepzA/0', '游客', 1505048134);
INSERT INTO `qw_photo_guanzhu` VALUES (1969, 3377, 'o4nEO0dLZo77iUE82oJg_vSziEno', 'https://wx.qlogo.cn/mmopen/vi_32/nric1j2JK4OXicuRk7YwROZicx9oKg9ng3FkJDYic91PX1ibNibravATNrVICnppgYCCo1yMHcz1ObvL7PIw56bIepzA/0', '游客', 1505048140);
INSERT INTO `qw_photo_guanzhu` VALUES (1970, 3376, 'o4nEO0dLZo77iUE82oJg_vSziEno', 'https://wx.qlogo.cn/mmopen/vi_32/nric1j2JK4OXicuRk7YwROZicx9oKg9ng3FkJDYic91PX1ibNibravATNrVICnppgYCCo1yMHcz1ObvL7PIw56bIepzA/0', '游客', 1505048142);
INSERT INTO `qw_photo_guanzhu` VALUES (1971, 3375, 'o4nEO0dLZo77iUE82oJg_vSziEno', 'https://wx.qlogo.cn/mmopen/vi_32/nric1j2JK4OXicuRk7YwROZicx9oKg9ng3FkJDYic91PX1ibNibravATNrVICnppgYCCo1yMHcz1ObvL7PIw56bIepzA/0', '游客', 1505048146);
INSERT INTO `qw_photo_guanzhu` VALUES (1972, 3374, 'o4nEO0dLZo77iUE82oJg_vSziEno', 'https://wx.qlogo.cn/mmopen/vi_32/nric1j2JK4OXicuRk7YwROZicx9oKg9ng3FkJDYic91PX1ibNibravATNrVICnppgYCCo1yMHcz1ObvL7PIw56bIepzA/0', '游客', 1505048151);
INSERT INTO `qw_photo_guanzhu` VALUES (1973, 3381, 'o4nEO0WkyGoBC7qshqoClxBv53IM', 'https://wx.qlogo.cn/mmopen/vi_32/mtX8j93DDjqIyZib2uXNevEXfx13iaBNeSuhGUkoA3FEvliaOQxAEpBe2rZlia1qSFpFnRFpichXFjcUwCKcj1QOvKg/0', '游客', 1505053785);
INSERT INTO `qw_photo_guanzhu` VALUES (1974, 3380, 'o4nEO0WkyGoBC7qshqoClxBv53IM', 'https://wx.qlogo.cn/mmopen/vi_32/mtX8j93DDjqIyZib2uXNevEXfx13iaBNeSuhGUkoA3FEvliaOQxAEpBe2rZlia1qSFpFnRFpichXFjcUwCKcj1QOvKg/0', '游客', 1505053803);
INSERT INTO `qw_photo_guanzhu` VALUES (1975, 3378, 'o4nEO0WkyGoBC7qshqoClxBv53IM', 'https://wx.qlogo.cn/mmopen/vi_32/mtX8j93DDjqIyZib2uXNevEXfx13iaBNeSuhGUkoA3FEvliaOQxAEpBe2rZlia1qSFpFnRFpichXFjcUwCKcj1QOvKg/0', '游客', 1505053846);
INSERT INTO `qw_photo_guanzhu` VALUES (1976, 3374, 'o4nEO0YJ-sN3sVoB9JjDD-g6jGMs', 'https://wx.qlogo.cn/mmopen/vi_32/3fh5f8SgAHoPMTM7fnsvc8v8GicNXK9CdnqXDTnrlDLeoibM9l13PsR01mwOCmyws1VrMWWhMLQ7xCE4JrCuiaZFA/0', '游客', 1505054411);
INSERT INTO `qw_photo_guanzhu` VALUES (1977, 3380, 'o4nEO0duZFnfWKHJMrQ1IJ74MWtM', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1505056113);
INSERT INTO `qw_photo_guanzhu` VALUES (1978, 3374, 'o4nEO0duZFnfWKHJMrQ1IJ74MWtM', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1505056127);
INSERT INTO `qw_photo_guanzhu` VALUES (1979, 3377, 'o4nEO0duZFnfWKHJMrQ1IJ74MWtM', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1505056138);
INSERT INTO `qw_photo_guanzhu` VALUES (1980, 3381, 'o4nEO0bqZ61z49DS_-Fr_bHaJbfU', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1505056515);
INSERT INTO `qw_photo_guanzhu` VALUES (1981, 3381, 'o4nEO0TzXCDhgNStOQQJJHhnv_zU', 'https://wx.qlogo.cn/mmopen/vi_32/zib5gQuOIYwIEEyMdyzMFVibeQzasetyHqxPVR0qJ0djVWwccWKxv9FbqjGrR1hUwiadNHv4xy4XAIIxNXsnWOSTQ/0', '游客', 1505060088);
INSERT INTO `qw_photo_guanzhu` VALUES (1982, 3380, 'o4nEO0TzXCDhgNStOQQJJHhnv_zU', 'https://wx.qlogo.cn/mmopen/vi_32/zib5gQuOIYwIEEyMdyzMFVibeQzasetyHqxPVR0qJ0djVWwccWKxv9FbqjGrR1hUwiadNHv4xy4XAIIxNXsnWOSTQ/0', '游客', 1505060096);
INSERT INTO `qw_photo_guanzhu` VALUES (1983, 3379, 'o4nEO0TzXCDhgNStOQQJJHhnv_zU', 'https://wx.qlogo.cn/mmopen/vi_32/zib5gQuOIYwIEEyMdyzMFVibeQzasetyHqxPVR0qJ0djVWwccWKxv9FbqjGrR1hUwiadNHv4xy4XAIIxNXsnWOSTQ/0', '游客', 1505060099);
INSERT INTO `qw_photo_guanzhu` VALUES (1984, 3378, 'o4nEO0TzXCDhgNStOQQJJHhnv_zU', 'https://wx.qlogo.cn/mmopen/vi_32/zib5gQuOIYwIEEyMdyzMFVibeQzasetyHqxPVR0qJ0djVWwccWKxv9FbqjGrR1hUwiadNHv4xy4XAIIxNXsnWOSTQ/0', '游客', 1505060102);
INSERT INTO `qw_photo_guanzhu` VALUES (1985, 3377, 'o4nEO0TzXCDhgNStOQQJJHhnv_zU', 'https://wx.qlogo.cn/mmopen/vi_32/zib5gQuOIYwIEEyMdyzMFVibeQzasetyHqxPVR0qJ0djVWwccWKxv9FbqjGrR1hUwiadNHv4xy4XAIIxNXsnWOSTQ/0', '游客', 1505060104);
INSERT INTO `qw_photo_guanzhu` VALUES (1986, 3376, 'o4nEO0TzXCDhgNStOQQJJHhnv_zU', 'https://wx.qlogo.cn/mmopen/vi_32/zib5gQuOIYwIEEyMdyzMFVibeQzasetyHqxPVR0qJ0djVWwccWKxv9FbqjGrR1hUwiadNHv4xy4XAIIxNXsnWOSTQ/0', '游客', 1505060106);
INSERT INTO `qw_photo_guanzhu` VALUES (1987, 3375, 'o4nEO0TzXCDhgNStOQQJJHhnv_zU', 'https://wx.qlogo.cn/mmopen/vi_32/zib5gQuOIYwIEEyMdyzMFVibeQzasetyHqxPVR0qJ0djVWwccWKxv9FbqjGrR1hUwiadNHv4xy4XAIIxNXsnWOSTQ/0', '游客', 1505060107);
INSERT INTO `qw_photo_guanzhu` VALUES (1988, 3381, 'o4nEO0YQxIuHPzFZKgVM4hgt_gNs', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1505061650);
INSERT INTO `qw_photo_guanzhu` VALUES (1989, 3380, 'o4nEO0YQxIuHPzFZKgVM4hgt_gNs', 'https://wx.qlogo.cn/mmopen/vi_32/zyDVFnicqyg21kF0X35XwfGhKm22yLfUfUvv7fyribU0YWlUpInh6R8fSS16VbRHe9VOPxPS31FqF5Am7UDNWUkw/0', '游客', 1505061632);
INSERT INTO `qw_photo_guanzhu` VALUES (1990, 3379, 'o4nEO0YQxIuHPzFZKgVM4hgt_gNs', 'https://wx.qlogo.cn/mmopen/vi_32/zyDVFnicqyg21kF0X35XwfGhKm22yLfUfUvv7fyribU0YWlUpInh6R8fSS16VbRHe9VOPxPS31FqF5Am7UDNWUkw/0', '游客', 1505061581);
INSERT INTO `qw_photo_guanzhu` VALUES (1991, 3378, 'o4nEO0YQxIuHPzFZKgVM4hgt_gNs', 'https://wx.qlogo.cn/mmopen/vi_32/zyDVFnicqyg21kF0X35XwfGhKm22yLfUfUvv7fyribU0YWlUpInh6R8fSS16VbRHe9VOPxPS31FqF5Am7UDNWUkw/0', '游客', 1505061708);
INSERT INTO `qw_photo_guanzhu` VALUES (1992, 3377, 'o4nEO0YQxIuHPzFZKgVM4hgt_gNs', 'https://wx.qlogo.cn/mmopen/vi_32/zyDVFnicqyg21kF0X35XwfGhKm22yLfUfUvv7fyribU0YWlUpInh6R8fSS16VbRHe9VOPxPS31FqF5Am7UDNWUkw/0', '游客', 1505061714);
INSERT INTO `qw_photo_guanzhu` VALUES (1993, 3380, 'o4nEO0TqfVEBTDe1N7G3DWteqYQY', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1505070375);
INSERT INTO `qw_photo_guanzhu` VALUES (1994, 3379, 'o4nEO0TqfVEBTDe1N7G3DWteqYQY', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1505070382);
INSERT INTO `qw_photo_guanzhu` VALUES (1995, 3377, 'o4nEO0fwmHVqMlW2M7UT3VX2qcXI', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1505081916);
INSERT INTO `qw_photo_guanzhu` VALUES (1996, 3375, 'o4nEO0e3pSYQZVUDce4NvTY_nPKo', 'https://wx.qlogo.cn/mmopen/vi_32/g4FdC1Kq6ZtGreLR0I4Pogg9jHlhYDMOMvSEYKOF8dV7ylR9sGttexbYRRxsicpOJj7PkpXMNjDfubx1grdTwTA/0', '游客', 1505089240);
INSERT INTO `qw_photo_guanzhu` VALUES (1997, 3374, 'o4nEO0e3pSYQZVUDce4NvTY_nPKo', 'https://wx.qlogo.cn/mmopen/vi_32/g4FdC1Kq6ZtGreLR0I4Pogg9jHlhYDMOMvSEYKOF8dV7ylR9sGttexbYRRxsicpOJj7PkpXMNjDfubx1grdTwTA/0', '游客', 1505089246);
INSERT INTO `qw_photo_guanzhu` VALUES (1998, 3374, 'o4nEO0cs63Pcs-DJs-KrVC1JJLcA', 'https://api.55625.com/Public/Home/images/nouser.jpg', 'undefined', 1505099258);

-- ----------------------------
-- Table structure for qw_setting
-- ----------------------------
DROP TABLE IF EXISTS `qw_setting`;
CREATE TABLE `qw_setting`  (
  `k` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '变量',
  `v` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '值',
  `type` tinyint(1) NOT NULL COMMENT '0系统，1自定义',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '说明',
  PRIMARY KEY (`k`) USING BTREE,
  INDEX `k`(`k`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qw_setting
-- ----------------------------
INSERT INTO `qw_setting` VALUES ('sitename', '', 0, '');
INSERT INTO `qw_setting` VALUES ('title', '网站后台管理', 0, '');
INSERT INTO `qw_setting` VALUES ('keywords', '', 0, '');
INSERT INTO `qw_setting` VALUES ('description', '', 0, '');
INSERT INTO `qw_setting` VALUES ('footer', '', 0, '');
INSERT INTO `qw_setting` VALUES ('appID', 'wx8dfbc97733f412a1', 1, 'appID');
INSERT INTO `qw_setting` VALUES ('appSecret', '04bae94************92337a79', 1, 'appSecret');
INSERT INTO `qw_setting` VALUES ('sms_name', 'sms_name', 1, '短信账号');
INSERT INTO `qw_setting` VALUES ('sms_pwd', 'sms_pwd', 1, '短信密码');

SET FOREIGN_KEY_CHECKS = 1;
