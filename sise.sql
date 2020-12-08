/*
 Navicat Premium Data Transfer

 Source Server         : weiqisen
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : sise

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 08/05/2020 18:55:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for canteen
-- ----------------------------
DROP TABLE IF EXISTS `canteen`;
CREATE TABLE `canteen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '饭堂名称',
  `imgUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图片路径',
  `detail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '饭堂简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of canteen
-- ----------------------------
BEGIN;
INSERT INTO `canteen` VALUES (1, '男饭', 'images/canteen/1_siseCanteen.jpg', '好吃便宜！！!撑的你不行不行');
INSERT INTO `canteen` VALUES (2, '女饭', 'images/canteen/2_siseCanteen.jpg', '优质美味的点心，吃了不会胖的夜宵～');
INSERT INTO `canteen` VALUES (8, '教师饭堂', 'images/canteen/8_siseCanteen.jpg', '教职员工优先用餐！');
INSERT INTO `canteen` VALUES (10, '未来饭堂', 'images/canteen/10_siseCanteen.jpg', '智能点餐！！');
COMMIT;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT '该用户默认给出了好评！！！' COMMENT '评论内容',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `oid` int(11) DEFAULT NULL COMMENT '订单id',
  `time` varchar(255) DEFAULT NULL COMMENT '创建日期',
  `status` int(11) DEFAULT NULL COMMENT '0：未通过，1：通过',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------
BEGIN;
INSERT INTO `comment` VALUES (10, '非常棒！！！！！', 9, 24, '2020-02-12 20:38:22', 1);
INSERT INTO `comment` VALUES (11, '非常棒！！！！！', 28, 24, '2020-02-12 20:41:15', 1);
INSERT INTO `comment` VALUES (12, '3号窗口阿姨人很好哦！！！！', 9, 24, '2020-02-13 01:19:23', 1);
INSERT INTO `comment` VALUES (13, '相当不错！！！！', 9, 24, '2020-02-13 11:58:24', 1);
INSERT INTO `comment` VALUES (14, '相当不错！！！！', 9, 24, '2020-02-13 12:05:05', 1);
INSERT INTO `comment` VALUES (15, '相当不错！！！！', 9, 24, '2020-02-13 12:07:43', 0);
INSERT INTO `comment` VALUES (16, 'very delicious！', 28, 27, '2020-02-13 13:11:49', 1);
INSERT INTO `comment` VALUES (17, 'kokokokokoko', 9, 24, '2020-02-17 22:11:11', 0);
INSERT INTO `comment` VALUES (18, '很好吃！！！', 9, 37, '2020-02-20 21:07:33', 1);
INSERT INTO `comment` VALUES (19, '@@@@有头发！', 9, 38, '2020-02-23 15:33:01', 1);
INSERT INTO `comment` VALUES (20, '@@@@有头发！', 9, 38, '2020-02-23 15:34:43', 0);
INSERT INTO `comment` VALUES (21, '测试。。。。。。', 9, 24, '2020-02-23 15:35:00', 1);
INSERT INTO `comment` VALUES (22, '测试评价。。。。', 9, 24, '2020-02-23 15:35:35', 0);
INSERT INTO `comment` VALUES (23, 'tttesting', 9, 24, '2020-02-23 15:40:20', 1);
INSERT INTO `comment` VALUES (24, '()()()()(', 9, 37, '2020-02-23 16:23:54', 0);
INSERT INTO `comment` VALUES (25, 'testing', 9, 41, '2020-02-23 16:29:43', 1);
INSERT INTO `comment` VALUES (26, '333333', 9, 41, '2020-02-23 16:31:10', 0);
INSERT INTO `comment` VALUES (27, '55555', 9, 41, '2020-02-23 16:32:26', 1);
INSERT INTO `comment` VALUES (28, '555555', 9, 41, '2020-02-23 16:32:56', 0);
INSERT INTO `comment` VALUES (29, 'aaaaaaa', 9, 41, '2020-02-23 16:33:26', 0);
INSERT INTO `comment` VALUES (30, 'uuuuuuuu', 9, 41, '2020-02-23 16:35:19', 0);
INSERT INTO `comment` VALUES (31, 'cccccccc', 9, 41, '2020-02-23 16:36:52', 0);
INSERT INTO `comment` VALUES (32, 'eeeeeee', 9, 41, '2020-02-23 16:38:01', 0);
INSERT INTO `comment` VALUES (33, 'kokokokok', 9, 49, '2020-02-23 19:00:38', 1);
INSERT INTO `comment` VALUES (34, '222222', 9, 41, '2020-02-23 20:09:40', 0);
INSERT INTO `comment` VALUES (35, '有点咸', 17, 52, '2020-04-04 13:53:43', 1);
INSERT INTO `comment` VALUES (36, '好好啊好', 9, 54, '2020-05-06 19:05:52', 1);
INSERT INTO `comment` VALUES (37, 'haohaohao', 9, 56, '2020-05-06 19:25:30', 1);
INSERT INTO `comment` VALUES (38, 'hao ', 9, 58, '2020-05-07 20:46:27', 1);
COMMIT;

-- ----------------------------
-- Table structure for db
-- ----------------------------
DROP TABLE IF EXISTS `db`;
CREATE TABLE `db` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of db
-- ----------------------------
BEGIN;
INSERT INTO `db` VALUES (36, '/202005072050sise.sql', '2020-05-07 20:50:09');
INSERT INTO `db` VALUES (37, '/202005081743sise.sql', '2020-05-08 17:43:35');
COMMIT;

-- ----------------------------
-- Table structure for hot
-- ----------------------------
DROP TABLE IF EXISTS `hot`;
CREATE TABLE `hot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(10) DEFAULT NULL,
  `view` datetime(6) DEFAULT NULL,
  `like` datetime(6) DEFAULT NULL,
  `pid` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of hot
-- ----------------------------
BEGIN;
INSERT INTO `hot` VALUES (23, 9, '2020-05-04 01:15:55.000000', '2020-05-06 01:16:04.000000', 15);
INSERT INTO `hot` VALUES (24, 9, '2020-05-03 01:36:41.000000', '2020-05-06 01:36:51.000000', 16);
INSERT INTO `hot` VALUES (25, 9, '2020-04-03 13:42:52.000000', '2020-04-04 13:42:56.000000', 18);
INSERT INTO `hot` VALUES (26, 9, '2020-05-08 18:05:59.000000', '2020-05-07 20:51:29.000000', 13);
INSERT INTO `hot` VALUES (27, 9, '2020-05-08 18:09:35.000000', '2020-04-04 13:43:07.000000', 14);
INSERT INTO `hot` VALUES (28, 17, '2020-04-04 13:48:38.000000', NULL, 17);
INSERT INTO `hot` VALUES (29, 17, '2020-04-04 13:48:49.000000', NULL, 14);
INSERT INTO `hot` VALUES (30, 17, '2020-04-04 13:48:55.000000', NULL, 18);
INSERT INTO `hot` VALUES (31, 17, '2020-04-04 13:49:02.000000', NULL, 13);
INSERT INTO `hot` VALUES (32, 9, '2020-05-08 17:20:35.000000', NULL, 19);
COMMIT;

-- ----------------------------
-- Table structure for lost
-- ----------------------------
DROP TABLE IF EXISTS `lost`;
CREATE TABLE `lost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `time` varchar(100) DEFAULT NULL COMMENT '发布时间',
  `imgUrl` varchar(255) DEFAULT NULL COMMENT '图片上传',
  `kind` varchar(50) DEFAULT NULL COMMENT '种类标题',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lost
-- ----------------------------
BEGIN;
INSERT INTO `lost` VALUES (6, '5.8号下午在男饭用餐后忘记拿走！\r\n内含大量课本，因为本人热爱学习\r\n所以很着急！', 17, '2020-05-08 17:24', 'images/lost/2020-05-08 17:24_lost.jpg', '黑色匡威背包');
INSERT INTO `lost` VALUES (7, '校园内丢失1个U盘，小量外币，一部switch游戏机。\r\n联系电话：15219784989\r\n姓名：吕布先生', 46, '2020-05-08 17:28', 'images/lost/2020-05-08 17:28_lost.jpg', 'u盘，switch');
INSERT INTO `lost` VALUES (8, '5.3号中午下雨了，雨伞在女饭门口放着，丢失，因为是男友送的，很珍贵，望寻回。', 49, '2020-05-08 17:32', 'images/lost/2020-05-08 17:32_lost.jpg', '一把可爱的雨伞！');
INSERT INTO `lost` VALUES (9, '没啥好说的，精致的五官。学号1640706105的饭卡就是俺的，若能寻回，请你吃麻辣烫。', 9, '2020-05-08 18:26', 'images/lost/2020-05-08 18:26_lost.jpg', '个人帅气的一张饭卡');
COMMIT;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT NULL COMMENT '订单编号',
  `detail` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `status` int(11) DEFAULT '0' COMMENT '0123 已下单，已备餐，已取餐，已评价',
  `uid` int(11) DEFAULT NULL COMMENT '用餐人员id',
  `time` varchar(255) DEFAULT NULL COMMENT '下单时间',
  `totalPrice` double(10,2) DEFAULT NULL COMMENT '订单总金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of order
-- ----------------------------
BEGIN;
INSERT INTO `order` VALUES (23, '202002121719201850', '取餐时间:17时:19分,留言:', 1, 30, NULL, NULL);
INSERT INTO `order` VALUES (24, '202002122037091223', '取餐时间:20时:36分,留言:加饭！', 3, 9, NULL, NULL);
INSERT INTO `order` VALUES (26, '20200213130901828', '预计取餐时间:13时:7分,留言:不要辣椒', 1, 9, NULL, NULL);
INSERT INTO `order` VALUES (27, '202002131309381885', '打包  预计取餐时间:13时:9分,留言:加饭', 0, 9, NULL, NULL);
INSERT INTO `order` VALUES (28, '20200215185254145', '堂食  预计取餐时间:18时:52分,留言:加辣椒', 2, 9, NULL, NULL);
INSERT INTO `order` VALUES (29, '202002161541341030', '堂食  预计取餐时间:15时:41分,留言:谢谢阿姨！', 0, 9, NULL, NULL);
INSERT INTO `order` VALUES (30, '202002161603561643', '堂食  预计取餐时间:16时:3分,留言:', 3, 9, '2020-02-14 17:40:23', 12.00);
INSERT INTO `order` VALUES (31, '202002161738371051', '堂食  预计取餐时间:17时:38分,留言:', 3, 28, '2020-02-15 17:40:23', NULL);
INSERT INTO `order` VALUES (32, '202002161740231593', '堂食  预计取餐时间:17时:40分,留言:', 3, 9, '2020-02-16 17:40:23', 18.00);
INSERT INTO `order` VALUES (33, '20200216184936471', '堂食  预计取餐时间:18时:49分,留言:', 3, 9, '2020-02-16 18:49:36', 8.00);
INSERT INTO `order` VALUES (34, '202002201657301088', '堂食  预计取餐时间:16时:57分,留言:加饭！', 1, 9, '2020-02-20 16:57:30', 10.00);
INSERT INTO `order` VALUES (35, '20200220201407625', '堂食  预计取餐时间:20时:14分,留言:', 0, 9, '2020-02-20 20:14:07', 12.00);
INSERT INTO `order` VALUES (36, '20200220210359508', '堂食  预计取餐时间:21时:3分,留言:加饭！', 1, 9, '2020-02-20 21:03:59', 36.00);
INSERT INTO `order` VALUES (37, '20200220210556752', '堂食  预计取餐时间:21时:5分,留言:加饭！', 2, 9, '2020-02-20 21:05:56', 12.00);
INSERT INTO `order` VALUES (38, '202002202202281029', '打包  预计取餐时间:22时:2分,留言:加饭！', 2, 9, '2020-02-20 22:02:28', 18.00);
INSERT INTO `order` VALUES (39, '202002211841191830', '堂食  预计取餐时间:18时:41分,留言:', 0, 9, '2020-02-21 18:41:19', 10.00);
INSERT INTO `order` VALUES (40, '20200221224948343', '堂食  预计取餐时间:22时:49分,留言:', 0, 9, '2020-02-21 22:49:48', 10.00);
INSERT INTO `order` VALUES (41, '202002222126521785', '堂食', 4, 9, '2020-02-22 21:26:52', 30.00);
INSERT INTO `order` VALUES (42, '202002231642231167', '打包', 1, 9, '2020-02-23 16:42:23', 20.00);
INSERT INTO `order` VALUES (43, '202002231809211080', '堂食', NULL, 9, '2020-02-23 18:09:21', 90.00);
INSERT INTO `order` VALUES (44, '202002231812501357', '堂食', 0, 9, '2020-02-23 18:12:50', 11.00);
INSERT INTO `order` VALUES (45, '202002231815091896', '堂食', 1, 9, '2020-02-23 18:15:09', 11.00);
INSERT INTO `order` VALUES (46, '202002231824081790', '堂食', 1, 9, '2020-02-23 18:24:08', 4.00);
INSERT INTO `order` VALUES (47, '202002231825551625', '堂食', 1, 9, '2020-02-23 18:25:55', 4.00);
INSERT INTO `order` VALUES (48, '2020022318274987', '堂食', 1, 9, '2020-02-23 18:27:49', 4.00);
INSERT INTO `order` VALUES (49, '20200223184103362', '堂食44444', 4, 9, '2020-02-23 18:41:03', 8.00);
INSERT INTO `order` VALUES (50, '202004041348191686', '堂食好吃', 1, 17, '2020-04-04 13:48:19', 11.00);
INSERT INTO `order` VALUES (51, '20200404135015182', '堂食好吃', 2, 17, '2020-04-04 13:50:15', 19.00);
INSERT INTO `order` VALUES (52, '20200404135235305', '堂食ddd', 4, 17, '2020-04-04 13:52:35', 6.00);
INSERT INTO `order` VALUES (53, '20200423184418361', '堂食加饭', 2, 9, '2020-04-23 18:44:18', 24.00);
INSERT INTO `order` VALUES (54, '20200506190213460', '打包加饭', 4, 9, '2020-05-06 19:02:13', 12.00);
INSERT INTO `order` VALUES (55, '20200506192050602', '堂食加饭', 1, 9, '2020-05-06 19:20:50', 18.00);
INSERT INTO `order` VALUES (56, '202005061924391507', '堂食加饭', 4, 9, '2020-05-06 19:24:39', 6.00);
INSERT INTO `order` VALUES (57, '20200507204231856', '堂食jiafan', 2, 9, '2020-05-07 20:42:31', 6.00);
INSERT INTO `order` VALUES (58, '20200507204526431', '打包777', 4, 9, '2020-05-07 20:45:26', 6.00);
COMMIT;

-- ----------------------------
-- Table structure for order_msg
-- ----------------------------
DROP TABLE IF EXISTS `order_msg`;
CREATE TABLE `order_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL COMMENT '菜品id',
  `oid` int(11) DEFAULT NULL COMMENT '订单id',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `number` int(11) DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  KEY `oid` (`oid`) USING BTREE,
  KEY `cid` (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of order_msg
-- ----------------------------
BEGIN;
INSERT INTO `order_msg` VALUES (56, 15, 23, 30, 1);
INSERT INTO `order_msg` VALUES (57, 13, 24, 9, 1);
INSERT INTO `order_msg` VALUES (58, 14, 24, 9, 1);
INSERT INTO `order_msg` VALUES (59, 16, 27, 9, 1);
INSERT INTO `order_msg` VALUES (60, 15, 26, 9, 1);
INSERT INTO `order_msg` VALUES (61, 14, 0, 29, 1);
INSERT INTO `order_msg` VALUES (62, 15, 0, 29, 1);
INSERT INTO `order_msg` VALUES (64, 17, 28, 9, 1);
INSERT INTO `order_msg` VALUES (65, 17, 29, 9, 1);
INSERT INTO `order_msg` VALUES (66, 17, 30, 9, 1);
INSERT INTO `order_msg` VALUES (67, 14, 31, 28, 1);
INSERT INTO `order_msg` VALUES (68, 15, 32, 9, 1);
INSERT INTO `order_msg` VALUES (69, 14, 33, 9, 1);
INSERT INTO `order_msg` VALUES (70, 13, 34, 9, 1);
INSERT INTO `order_msg` VALUES (97, 18, 37, 9, 3);
INSERT INTO `order_msg` VALUES (98, 17, 35, 9, 1);
INSERT INTO `order_msg` VALUES (99, 15, 36, 9, 2);
INSERT INTO `order_msg` VALUES (100, 14, 53, 9, 2);
INSERT INTO `order_msg` VALUES (101, 15, 38, 9, 1);
INSERT INTO `order_msg` VALUES (102, 13, 39, 9, 1);
INSERT INTO `order_msg` VALUES (103, 13, 40, 9, 1);
INSERT INTO `order_msg` VALUES (104, 13, 41, 9, 3);
INSERT INTO `order_msg` VALUES (105, 15, 43, 9, 5);
INSERT INTO `order_msg` VALUES (106, 13, 44, 9, 1);
INSERT INTO `order_msg` VALUES (107, 18, 42, 9, 5);
INSERT INTO `order_msg` VALUES (108, 13, 45, 9, 1);
INSERT INTO `order_msg` VALUES (109, 18, 46, 9, 1);
INSERT INTO `order_msg` VALUES (110, 18, 47, 9, 1);
INSERT INTO `order_msg` VALUES (111, 18, 48, 9, 1);
INSERT INTO `order_msg` VALUES (112, 18, 49, 9, 2);
INSERT INTO `order_msg` VALUES (115, 13, 50, 17, 1);
INSERT INTO `order_msg` VALUES (116, 13, 51, 17, 1);
INSERT INTO `order_msg` VALUES (117, 14, 51, 17, 1);
INSERT INTO `order_msg` VALUES (118, 16, 52, 17, 1);
INSERT INTO `order_msg` VALUES (119, 16, 53, 9, 1);
INSERT INTO `order_msg` VALUES (120, 14, 55, 9, 2);
INSERT INTO `order_msg` VALUES (121, 16, 54, 9, 2);
INSERT INTO `order_msg` VALUES (124, 16, 56, 9, 1);
INSERT INTO `order_msg` VALUES (126, 16, 57, 9, 1);
INSERT INTO `order_msg` VALUES (127, 16, 58, 9, 1);
INSERT INTO `order_msg` VALUES (132, 14, 0, 9, 1);
INSERT INTO `order_msg` VALUES (133, 19, 0, 9, 1);
COMMIT;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '菜品名称',
  `price` float(10,2) DEFAULT NULL COMMENT '价格',
  `imgUrl` varchar(100) DEFAULT NULL COMMENT '商品图片url',
  `detail` varchar(200) DEFAULT '' COMMENT '商品描述',
  `status` int(10) DEFAULT '1' COMMENT '状态，1：上线，0：下线',
  `wid` int(11) DEFAULT NULL COMMENT '窗口id',
  `hot` int(11) DEFAULT NULL COMMENT '热度值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
BEGIN;
INSERT INTO `product` VALUES (13, '凉拌土豆丝', 11.00, 'images/product/13_sise.jpg', '爽口开胃,清凉一夏', 1, 2, 556);
INSERT INTO `product` VALUES (14, '奶香小油条', 9.00, 'images/product/14_sise.jpg', '没有放泡打粉的健康油条', 1, 1, 97);
INSERT INTO `product` VALUES (15, '佛手观音莲', 18.00, 'images/product/15_sise.jpg', '补肾益气、清热解毒、滋阴清肺', 1, 2, 91);
INSERT INTO `product` VALUES (16, '白菜鸡蛋早餐饼', 6.00, 'images/product/16_sise.jpg', '大白菜遇上火腿肠切薄片', 1, 1, 143);
INSERT INTO `product` VALUES (17, '小白菜', 12.00, 'images/product/17_sise.jpg', '好啦！！！', 1, 3, 52);
INSERT INTO `product` VALUES (18, '大白菜', 4.00, 'images/product/18_sise.jpg', '炒鸡好吃', 1, 4, 178);
INSERT INTO `product` VALUES (19, '火腿肉丝汤饭', 18.00, 'images/product/19_sise.jpg', '浓汤，肉类，精美蔬菜', 1, 5, 12);
INSERT INTO `product` VALUES (20, '皮蛋肉丝肉丸汤饭', 19.00, 'images/product/20_sise.jpg', '加入了新鲜的皮蛋', 1, 5, 5);
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `number` varchar(100) DEFAULT NULL COMMENT '学号',
  `phone` varchar(11) DEFAULT NULL COMMENT '电话',
  `role` int(10) DEFAULT NULL COMMENT '角色类型',
  `wid` int(10) DEFAULT NULL COMMENT '窗口id',
  `imgUrl` varchar(255) DEFAULT NULL COMMENT '头像',
  `sex` varchar(10) DEFAULT NULL COMMENT '性别',
  `nickName` varchar(255) DEFAULT NULL COMMENT '昵称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (9, '魏其森', '101', '101', '15219190193', 1, NULL, 'images/user/101.jpg', '男', '冲动的电饭煲');
INSERT INTO `user` VALUES (17, '陈晓婷', '102', '102', '12375763244', 1, NULL, 'images/user/women.jpg', '女', '小可爱');
INSERT INTO `user` VALUES (28, '张飞', '301', '301', '15219190193', 3, NULL, 'images/user/man.jpg', '男', '勇猛小飞飞');
INSERT INTO `user` VALUES (29, '汤姆', '201', '201', '12541545323', 2, 1, 'images/user/02.jpg', '男', 'Tom小可爱');
INSERT INTO `user` VALUES (46, '吕布', '103', '103', '15246567894', 1, NULL, 'images/user/103.jpg', '男', '小小吕布');
INSERT INTO `user` VALUES (47, '李飞', '104', '104', '15219970754', 1, NULL, 'images/user/women.jpg', '男', '李信');
INSERT INTO `user` VALUES (48, '猛汉', '202', '202', '15219784541', 2, 2, 'images/user/man.jpg', '男', '百里守约');
INSERT INTO `user` VALUES (49, '小白', '105', '105', '15219223659', 1, NULL, 'images/user/105.jpg', '男', '小白一枚');
INSERT INTO `user` VALUES (50, '小刘', '106', '106', '15219015455', 1, NULL, 'images/user/man.jpg', '男', NULL);
INSERT INTO `user` VALUES (51, '大海', '203', '203', '15219785421', 2, 3, 'images/user/women.jpg', '男', NULL);
INSERT INTO `user` VALUES (52, '李念', '204', '204', '13013456541', 2, 4, 'images/user/man.jpg', '男', NULL);
INSERT INTO `user` VALUES (54, '小李', '205', '205', '12345678910', 2, 5, 'images/user/null.jpg', '男', '还没给自己起个昵称哦！');
INSERT INTO `user` VALUES (55, '下下', '206', '206', '15219190000', 2, NULL, 'images/user/women.jpg', '女', '还没给自己起个昵称哦！');
INSERT INTO `user` VALUES (56, '阿飞', '11111', '11111', '12313231230', 1, NULL, 'images/user/women.jpg', '女', '还没给自己起个昵称哦！');
INSERT INTO `user` VALUES (57, '戴维', '210', '210', '15214564564', 2, NULL, 'images/user/man.jpg', '男', '还没给自己起个昵称哦！');
COMMIT;

-- ----------------------------
-- Table structure for window
-- ----------------------------
DROP TABLE IF EXISTS `window`;
CREATE TABLE `window` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '分类名称',
  `tid` int(11) DEFAULT NULL COMMENT '饭堂id',
  `imgUrl` varchar(255) DEFAULT NULL COMMENT '窗口图片',
  `detail` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` int(1) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of window
-- ----------------------------
BEGIN;
INSERT INTO `window` VALUES (1, '早餐窗', 1, 'images/window/1_siseWindow.jpg', '提供早餐，豆浆，新鲜面包', 1);
INSERT INTO `window` VALUES (2, '夜宵窗口', 1, 'images/window/2_siseWindow.jpg', '烤鸡翅，炒面条1', 1);
INSERT INTO `window` VALUES (3, '粥窗口', 1, 'images/window/3_siseWindow.jpg', '提供八宝粥，绿豆粥', 1);
INSERT INTO `window` VALUES (4, '午饭套餐窗口', 2, 'images/window/4_siseWindow.jpg', '提供各种烧腊饭', 1);
INSERT INTO `window` VALUES (5, '汤饭窗口', 2, 'images/window/5_siseWindow.jpg', '提供正宗的潮汕牛肉丸汤饭', 1);
INSERT INTO `window` VALUES (22, 'test', 10, 'images/window/22_window.jpg', '======', 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
