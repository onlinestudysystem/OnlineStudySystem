/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : onlinestudysystem

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 01/07/2019 17:03:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE `tb_comment`  (
  `papperId` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userId` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `commentText` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `commentDate` datetime(0) NULL DEFAULT NULL,
  `authorId` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  INDEX `fk_userId_userId`(`userId`) USING BTREE,
  CONSTRAINT `fk_userId_userId` FOREIGN KEY (`userId`) REFERENCES `tb_user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_comment
-- ----------------------------
INSERT INTO `tb_comment` VALUES ('beb45bfb-a072-40d4-9e14-8192974bee87', '0001', '真的棒老铁！', '2019-06-14 01:05:05', '0002');
INSERT INTO `tb_comment` VALUES ('beb45bfb-a072-40d4-9e14-8192974bee87', '0002', 'well python is good', '2019-06-14 02:00:13', '0002');

-- ----------------------------
-- Table structure for tb_enshrine
-- ----------------------------
DROP TABLE IF EXISTS `tb_enshrine`;
CREATE TABLE `tb_enshrine`  (
  `papperId` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userId` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `papperProfile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `tb_enshrine_ibfk_1`(`papperId`) USING BTREE,
  INDEX `tb_enshrine_ibfk_2`(`userId`) USING BTREE,
  CONSTRAINT `tb_enshrine_ibfk_1` FOREIGN KEY (`papperId`) REFERENCES `tb_papper` (`papperId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_enshrine_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `tb_user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_enshrine
-- ----------------------------
INSERT INTO `tb_enshrine` VALUES ('000010', '0001', '健康如何维持', '健康养生简介');
INSERT INTO `tb_enshrine` VALUES ('03843ef0-f002-418e-b488-089baf9b1866', '0002', 'redis神奇,redis神奇', '神器redis简介,神器redis简介');
INSERT INTO `tb_enshrine` VALUES ('000004', '0001', '横屏查看代码，匿名发布动态！你们想要的功能都来了！', 'CSDN APP迎来更新');
INSERT INTO `tb_enshrine` VALUES ('beb45bfb-a072-40d4-9e14-8192974bee87', '0001', 'python', 'python profile');

-- ----------------------------
-- Table structure for tb_footprint
-- ----------------------------
DROP TABLE IF EXISTS `tb_footprint`;
CREATE TABLE `tb_footprint`  (
  `papperId` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userId` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `papperProfile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `readDate` datetime(0) NULL DEFAULT NULL,
  `title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `tb_footprint_ibfk_1`(`userId`) USING BTREE,
  INDEX `tb_footprint_ibfk_2`(`papperId`) USING BTREE,
  CONSTRAINT `tb_footprint_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `tb_user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_footprint_ibfk_2` FOREIGN KEY (`papperId`) REFERENCES `tb_papper` (`papperId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_footprint
-- ----------------------------
INSERT INTO `tb_footprint` VALUES ('000010', '0001', '健康养生简介', '2019-06-12 12:15:36', '健康如何维持');
INSERT INTO `tb_footprint` VALUES ('000004', '0001', 'CSDN APP迎来更新', '2019-06-12 12:15:40', '横屏查看代码，匿名发布动态！你们想要的功能都来了！');
INSERT INTO `tb_footprint` VALUES ('000010', '0001', '健康养生简介', '2019-06-13 02:19:33', '健康如何维持');
INSERT INTO `tb_footprint` VALUES ('03843ef0-f002-418e-b488-089baf9b1866', '0001', '神器redis简介,神器redis简介', '2019-06-13 13:18:32', 'redis神奇,redis神奇');
INSERT INTO `tb_footprint` VALUES ('6a1bf41d-dd7e-452b-a475-3ff13dfa6eeb', '0001', '简单讲述redis的操作,简单讲述redis的操作', '2019-06-13 13:18:35', 'redis是什么东东,redis是什么东东');
INSERT INTO `tb_footprint` VALUES ('03843ef0-f002-418e-b488-089baf9b1866', '0002', '神器redis简介,神器redis简介', '2019-06-13 13:32:44', 'redis神奇,redis神奇');
INSERT INTO `tb_footprint` VALUES ('6a1bf41d-dd7e-452b-a475-3ff13dfa6eeb', '0002', '简单讲述redis的操作,简单讲述redis的操作', '2019-06-13 15:43:15', 'redis是什么东东,redis是什么东东');
INSERT INTO `tb_footprint` VALUES ('000010', '0002', '健康养生简介', '2019-06-13 15:47:39', '健康如何维持');
INSERT INTO `tb_footprint` VALUES ('000010', '0002', '健康养生简介', '2019-06-13 16:05:33', '健康如何维持');
INSERT INTO `tb_footprint` VALUES ('000010', '0002', '健康养生简介', '2019-06-13 16:05:46', '健康如何维持');
INSERT INTO `tb_footprint` VALUES ('000004', '0001', 'CSDN APP迎来更新', '2019-06-14 01:05:22', '横屏查看代码，匿名发布动态！你们想要的功能都来了！');
INSERT INTO `tb_footprint` VALUES ('beb45bfb-a072-40d4-9e14-8192974bee87', '0002', 'python profile', '2019-06-14 01:22:49', 'python');
INSERT INTO `tb_footprint` VALUES ('6a1bf41d-dd7e-452b-a475-3ff13dfa6eeb', '0002', '简单讲述redis的操作,简单讲述redis的操作', '2019-06-14 01:22:56', 'redis是什么东东,redis是什么东东');
INSERT INTO `tb_footprint` VALUES ('beb45bfb-a072-40d4-9e14-8192974bee87', '0001', 'python profile', '2019-06-14 01:25:46', 'python');
INSERT INTO `tb_footprint` VALUES ('000007', '0002', '\r\n哪款免费手机同屏软件最好用', '2019-06-14 01:26:00', '手机最好用的抉择');
INSERT INTO `tb_footprint` VALUES ('000010', '0002', '健康养生简介', '2019-06-14 01:30:38', '健康如何维持');
INSERT INTO `tb_footprint` VALUES ('03843ef0-f002-418e-b488-089baf9b1866', '0002', '神器redis简介,神器redis简介', '2019-06-14 02:00:22', 'redis神奇,redis神奇');
INSERT INTO `tb_footprint` VALUES ('000001', '0001', '第一行代码简介,第一行代码简介,第一行代码简介,第一行代码简介', '2019-06-14 02:35:01', '第一行代');
INSERT INTO `tb_footprint` VALUES ('000001', '0002', '第一行代码简介,第一行代码简介,第一行代码简介,第一行代码简介', '2019-06-14 02:35:31', '第一行代');

-- ----------------------------
-- Table structure for tb_papper
-- ----------------------------
DROP TABLE IF EXISTS `tb_papper`;
CREATE TABLE `tb_papper`  (
  `papperId` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `authorId` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `papperText` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `submitDate` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `enshrineNumber` int(10) NULL DEFAULT 0,
  `papperProfile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`papperId`) USING BTREE,
  INDEX `tb_papper_ibfk_1`(`authorId`) USING BTREE,
  CONSTRAINT `tb_papper_ibfk_1` FOREIGN KEY (`authorId`) REFERENCES `tb_user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_papper
-- ----------------------------
INSERT INTO `tb_papper` VALUES ('000001', '0001', '第一行代', '这是第一行代码正文。。,这是第一行代码正文。。。', '互联网', '2019-06-14 10:36:15', 11, '第一行代码简介,第一行代码简介,第一行代码简介,第一行代码简介');
INSERT INTO `tb_papper` VALUES ('000004', '0002', '横屏查看代码，匿名发布动态！你们想要的功能都来了！', '大家一直期盼的横屏查看代码功能上线，给开发小哥哥点个赞，你们辛苦了！\n\n你喜欢的功能都来了！CSDN App更新：\n\n代码片支持横屏查看，更优质的浏览体验\n新增Blink评论删除功能\n勋章系统上线，记录你在CSDN的里程碑\nBlink新增树洞功能，满足你匿名发布动态\nBlink新增用户推荐，帮你发现更多有趣的人\n个人资料增加学校和公司，让大家快速了解你\n支持Spotlight，一键触达方便快捷\n优化性能，给你更好的体验\n最后祝2019年步入高考的学弟学妹金榜题名，CSDN APP陪你迎接高考！\r\n--------------------- \r\n作者：CSDN官方博客 \r\n来源：CSDN \r\n原文：https://blog.csdn.net/blogdevteam/article/details/91039549 \r\n版权声明：本文为博主原创文章，转载请附上博文链接！', '热点新闻', '2019-06-11 09:21:53', 0, 'CSDN APP迎来更新');
INSERT INTO `tb_papper` VALUES ('000007', '41334798-0178-4b18-934d-460ace76161b', '手机最好用的抉择', '大家的生活离不开手机，现在很多人都会用手机玩游戏、看电视剧，不过手机屏幕太小是个硬伤。想必很多小伙伴都想问免费的投屏软件吧，接下来奇机就给大家介绍几款免费的手机同屏软件最好用?\n\n快点投屏\n\n快点投屏是一款智能投屏APP，把移动终端(手机、平板电脑等)和智能电视、盒子在同一无线网络时，可以把的把移动终端中的照片、视频等内容无线投射到智能电视等大屏终端上，轻松实现在大屏终端上看视频、看直播、听音乐、玩游戏、分享照片等多种互动场景。\n\nTotalControl（苹果专用）\n\nTotalControl手机投屏软件，可以将手机屏幕投射到电脑端，通过电脑大屏玩游戏等，TotalControl的录屏功能则可以将玩游戏的过程录制下来，上传到游戏攻略的社区/网站进行分享。而且TotalControl还可以回放观看，录得不满意可以重录。安卓手机还能开启反控模式(电脑控制手机)。另外，还有录屏，截图以及白板等功能。\n\n小米投屏神器\n\n小米投屏神器是由小米公司开发的，运行在苹果手机、小米手机和其他绝大部分安卓手机上的电视投屏软件。当手机和电视在同一无线网络时，你可以轻松的把手机中的照片、视频投射到电视上，还可以轻松遥控智能电视。小米投屏神器内置小米电视视频资源，手机可搜索小米电视中的影片并在电视上播放。\n\nAWIND奇机小编温馨提示：使用免费的投屏软件终究不能解决投屏观影的问题，目前乐播都开始收费了，想必大家都清楚，未来投屏软件收费是一个大的趋势。而且IOS12 公布出来以后，表示Airplay-2 对第三方的盒子将会不怎么友好，所以还在使用投屏APP的小伙伴们 还是尽早用第三方设备代替吧。\r\n--------------------- \r\n作者：AWIND奇机 \r\n来源：CSDN \r\n原文：https://blog.csdn.net/Awindinc/article/details/90411343 \r\n版权声明：本文为博主原创文章，转载请附上博文链接！', '其他', '2019-06-13 11:51:31', 0, '\r\n哪款免费手机同屏软件最好用');
INSERT INTO `tb_papper` VALUES ('000010', '0001', '健康如何维持', '多吃水果蔬菜，注意休息，不要熬夜！', '健康养生', '2019-06-11 09:29:01', 1, '健康养生简介');
INSERT INTO `tb_papper` VALUES ('03843ef0-f002-418e-b488-089baf9b1866', '0001', 'redis神奇,redis神奇', 'key-value,key-value', '互联网,互联网', '2019-06-13 13:18:14', 0, '神器redis简介,神器redis简介');
INSERT INTO `tb_papper` VALUES ('34ab898e-f56d-45a1-b93b-368165eed4a9', '0001', 'ajdoiasjoda', 'asdasdasda', '互联网', '2019-06-14 02:36:38', 0, 'qweqweqw');
INSERT INTO `tb_papper` VALUES ('6a1bf41d-dd7e-452b-a475-3ff13dfa6eeb', '0001', 'redis是什么东东,redis是什么东东', 'redis就是一个键值对,redis就是一个键值对', '互联网,互联网', '2019-06-13 08:51:51', 0, '简单讲述redis的操作,简单讲述redis的操作');
INSERT INTO `tb_papper` VALUES ('beb45bfb-a072-40d4-9e14-8192974bee87', '0002', 'python', 'python context', '互联网', '2019-06-14 01:04:33', 0, 'python profile');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `userId` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nikeName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '无名氏',
  `name` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `photo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `sex` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `detail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '此人比较懒，没有任何描述',
  `previledge` int(2) NULL DEFAULT 0,
  PRIMARY KEY (`userId`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `username_password_index`(`username`, `password`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('0001', '13726273575', '123456', 'simpleBrian', '罗海章', '2368521029@qq.com', '/static/images/userLogo/a382cdb4-69ae-4aba-bd08-1eb0c5a95134.png', '男', 'simpleComment', 0);
INSERT INTO `tb_user` VALUES ('0002', '13522326807', '123456', '无名氏', 'haizhang', '12312313@qq.com', '/static/images/userLogo/man.png', '男', '此人比较懒，没有任何描述', 0);
INSERT INTO `tb_user` VALUES ('41334798-0178-4b18-934d-460ace76161b', '2368521029@qq.com', '123456', '无名氏', '海章', '2368421029@qq.com', '/static/images/userLogo/man.png', 'man', '此人比较懒', 0);
INSERT INTO `tb_user` VALUES ('f89b514a-229e-4243-9e52-533f62a615fb', '13272611231235', '1234567', 'qqqqqqqqqqq', 'asdasd', '123123@qq,con', '/static/images/userLogo/woman.png', '女', 'asdasd', 0);

SET FOREIGN_KEY_CHECKS = 1;
