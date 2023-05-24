/*
 Navicat Premium Data Transfer

 Source Server         : 47.98.50.217
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : 47.98.50.217:3306
 Source Schema         : zdhspecialeducation

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 30/04/2023 20:44:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `adminId` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '管理员Id',
  `account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '账号',
  `userName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户名',
  `passWord` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `head` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'https://ts1.cn.mm.bing.net/th/id/R-C.05dd632cab53cca0fb03bde3d93d03b8?rik=HilbntAmAuEvyA&riu=http%3a%2f%2fatt.0xy.cn%2fattachment%2fMon_1301%2f176_81500_68c374c20171bb0.jpg%3f102&ehk=K6TIrGzJChe7xSErPltk3ISkGvhtuecGqc3E03hlvPs%3d&risl=&pid=ImgRaw&r=0' COMMENT '头像',
  `createTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleteTime` datetime NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`adminId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '管理员表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'yr', '游瑞', '123123', 'https://ts1.cn.mm.bing.net/th/id/R-C.05dd632cab53cca0fb03bde3d93d03b8?rik=HilbntAmAuEvyA&riu=http%3a%2f%2fatt.0xy.cn%2fattachment%2fMon_1301%2f176_81500_68c374c20171bb0.jpg%3f102&ehk=K6TIrGzJChe7xSErPltk3ISkGvhtuecGqc3E03hlvPs%3d&risl=&pid=ImgRaw&r=0', NULL, '2023-04-03 10:55:56', NULL);
INSERT INTO `admin` VALUES (2, 'wk', '王坤', '123123', 'https://ts1.cn.mm.bing.net/th/id/R-C.05dd632cab53cca0fb03bde3d93d03b8?rik=HilbntAmAuEvyA&riu=http%3a%2f%2fatt.0xy.cn%2fattachment%2fMon_1301%2f176_81500_68c374c20171bb0.jpg%3f102&ehk=K6TIrGzJChe7xSErPltk3ISkGvhtuecGqc3E03hlvPs%3d&risl=&pid=ImgRaw&r=0', NULL, '2023-04-03 10:56:46', NULL);
INSERT INTO `admin` VALUES (3, 'ry', '饶永', '123456', 'https://ts1.cn.mm.bing.net/th/id/R-C.05dd632cab53cca0fb03bde3d93d03b8?rik=HilbntAmAuEvyA&riu=http%3a%2f%2fatt.0xy.cn%2fattachment%2fMon_1301%2f176_81500_68c374c20171bb0.jpg%3f102&ehk=K6TIrGzJChe7xSErPltk3ISkGvhtuecGqc3E03hlvPs%3d&risl=&pid=ImgRaw&r=0', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer`  (
  `answerId` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '答题id',
  `scaleId` int NULL DEFAULT NULL COMMENT '题目Id',
  `studentId` int NULL DEFAULT NULL COMMENT '学生id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '标题',
  `context` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '内容',
  `answerTime` datetime NULL DEFAULT NULL COMMENT '答题时间',
  `degree` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '完成度',
  `Evaluation1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '评价1',
  `Evaluation2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '评价2',
  `createTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleteTime` datetime NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`answerId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 95 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '答题表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of answer
-- ----------------------------
INSERT INTO `answer` VALUES (92, 24, 52, '小学二年级下数学随班就读学业评估量表', '{\"__v_isShallow\":false,\"dep\":{\"w\":0,\"n\":0},\"__v_isRef\":true,\"_rawValue\":[{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"一、数与代数\\n1.有余数的除法(除数和商都是-位数) \\n2.认识除法竖式\\n3.认识万以内的数(计数单位“千”“万”，数的组成、读写和大小比较)数\\n4. 用算盘表示万以内的数\\n5.“  ”和简单的近似数\\n6.口算两位数加、减两位数(和在100以内)\\n7.笔算两、三位数的加、减，加、减法的验算\\n8.时、分、秒的认识\\n9.用有余数除法解决的简单实际问题\\n10.两步计算的加减法实际问题\",\"select\":[],\"isTrue\":[],\"isFalse\":\"\",\"remarks\":\"\"},{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"二、图形与几何\\n1.认识东、南、西、北和东北、西北、东南、西南等方向，会用这些词语描绘物体所在的方向\\n2.认识分米和毫米，能够进行简单的长度单位的换算和长度测量\\n3.初步认识直角、锐角与钝角\",\"select\":[],\"isTrue\":[],\"isFalse\":\"\",\"remarks\":\"\"},{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"三、统计与概率\\n1.简单数据的分类整理\\n2.用画“正”字的方法收集、整理数据\\n3.根据统计数据回答并提出问题，对数据进行简单的分析和解释\",\"select\":[],\"isTrue\":[],\"isFalse\":\"\",\"remarks\":\"\"},{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"四、综合与实践\\n1．通过实践活动，感受数学在日常生活中的作用，体验运用所学的知识和方法解决简单问题的过程，获得初步的数学活动经验。\\n2.在实践活动中，了解要解决的问题和解决问题的办法。\\n3.经历实践操作的过程，进一步理解所学的内容。\",\"select\":[],\"isTrue\":[],\"isFalse\":\"\",\"remarks\":\"\"}],\"_value\":[{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"一、数与代数\\n1.有余数的除法(除数和商都是-位数) \\n2.认识除法竖式\\n3.认识万以内的数(计数单位“千”“万”，数的组成、读写和大小比较)数\\n4. 用算盘表示万以内的数\\n5.“  ”和简单的近似数\\n6.口算两位数加、减两位数(和在100以内)\\n7.笔算两、三位数的加、减，加、减法的验算\\n8.时、分、秒的认识\\n9.用有余数除法解决的简单实际问题\\n10.两步计算的加减法实际问题\",\"select\":[],\"isTrue\":[],\"isFalse\":\"\",\"remarks\":\"\"},{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"二、图形与几何\\n1.认识东、南、西、北和东北、西北、东南、西南等方向，会用这些词语描绘物体所在的方向\\n2.认识分米和毫米，能够进行简单的长度单位的换算和长度测量\\n3.初步认识直角、锐角与钝角\",\"select\":[],\"isTrue\":[],\"isFalse\":\"\",\"remarks\":\"\"},{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"三、统计与概率\\n1.简单数据的分类整理\\n2.用画“正”字的方法收集、整理数据\\n3.根据统计数据回答并提出问题，对数据进行简单的分析和解释\",\"select\":[],\"isTrue\":[],\"isFalse\":\"\",\"remarks\":\"\"},{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"四、综合与实践\\n1．通过实践活动，感受数学在日常生活中的作用，体验运用所学的知识和方法解决简单问题的过程，获得初步的数学活动经验。\\n2.在实践活动中，了解要解决的问题和解决问题的办法。\\n3.经历实践操作的过程，进一步理解所学的内容。\",\"select\":[],\"isTrue\":[],\"isFalse\":\"\",\"remarks\":\"\"}]}', NULL, '未完成', '', '', '2023-04-20 20:22:11', NULL, NULL);
INSERT INTO `answer` VALUES (93, 48, 52, '小学四年级上普校语文学业评估量表', '{\"__v_isShallow\":false,\"dep\":{\"w\":0,\"n\":0},\"__v_isRef\":true,\"_rawValue\":[{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"一、认字\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"1、要求达到什么水平；\\n2、要求课表的某一项内容；\\n3、要求古诗达到什么水平；\",\"Single\":[],\"isFalse\":3,\"remarks\":\"\",\"noMake\":0},{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"二、朗读\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"1、要求达到什么水平；\\n2、要求课表的某一项内容；\\n3、要求古诗达到什么水平；\",\"Single\":[],\"isFalse\":2,\"remarks\":\"\",\"noMake\":0}],\"_value\":[{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"一、认字\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"1、要求达到什么水平；\\n2、要求课表的某一项内容；\\n3、要求古诗达到什么水平；\",\"Single\":[],\"isFalse\":3,\"remarks\":\"\",\"noMake\":0},{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"二、朗读\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"1、要求达到什么水平；\\n2、要求课表的某一项内容；\\n3、要求古诗达到什么水平；\",\"Single\":[],\"isFalse\":2,\"remarks\":\"\",\"noMake\":0}]}', NULL, '已完成', '', '', '2023-04-21 14:14:04', NULL, NULL);
INSERT INTO `answer` VALUES (94, 48, 52, '小学四年级上普校语文学业评估量表', '{\"__v_isShallow\":false,\"dep\":{\"w\":0,\"n\":0},\"__v_isRef\":true,\"_rawValue\":[{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"一、认字\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"1、要求达到什么水平；\\n2、要求课表的某一项内容；\\n3、要求古诗达到什么水平；\",\"Single\":[],\"isFalse\":3,\"remarks\":\"\",\"noMake\":0},{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"二、朗读\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"1、要求达到什么水平；\\n2、要求课表的某一项内容；\\n3、要求古诗达到什么水平；\",\"Single\":[],\"isFalse\":2,\"remarks\":\"\",\"noMake\":0}],\"_value\":[{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"一、认字\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"1、要求达到什么水平；\\n2、要求课表的某一项内容；\\n3、要求古诗达到什么水平；\",\"Single\":[],\"isFalse\":3,\"remarks\":\"\",\"noMake\":0},{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"二、朗读\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"1、要求达到什么水平；\\n2、要求课表的某一项内容；\\n3、要求古诗达到什么水平；\",\"Single\":[],\"isFalse\":2,\"remarks\":\"\",\"noMake\":0}]}', NULL, '已完成', '', '小朋友季度不配合', '2023-04-21 14:14:31', NULL, NULL);

-- ----------------------------
-- Table structure for arrange
-- ----------------------------
DROP TABLE IF EXISTS `arrange`;
CREATE TABLE `arrange`  (
  `arrangeId` int NOT NULL,
  `arrangeName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`arrangeId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '安置方式' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of arrange
-- ----------------------------
INSERT INTO `arrange` VALUES (1, '特殊学校');
INSERT INTO `arrange` VALUES (2, '随班就读');
INSERT INTO `arrange` VALUES (3, '普校特教班');
INSERT INTO `arrange` VALUES (4, '送教上门');
INSERT INTO `arrange` VALUES (6, '机构');
INSERT INTO `arrange` VALUES (7, '待安置');
INSERT INTO `arrange` VALUES (8, '无');

-- ----------------------------
-- Table structure for board
-- ----------------------------
DROP TABLE IF EXISTS `board`;
CREATE TABLE `board`  (
  `boardId` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '委员会成员Id',
  `committeeId` int NOT NULL COMMENT '委员会Id',
  `account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '账号',
  `userName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户名',
  `passWord` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `userHead` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像',
  `userGender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '性别',
  `userPhone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '电话',
  `userMail` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '邮箱',
  `createTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleteTime` datetime NULL DEFAULT NULL COMMENT '删除时间',
  `authorization` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否授权',
  PRIMARY KEY (`boardId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '委员会成员表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of board
-- ----------------------------
INSERT INTO `board` VALUES (24, 2, 'rl', '12312', 'emtf', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', '81', '81.com', '2023-04-04 06:35:51', '2023-04-06 06:20:14', '2023-04-06 06:20:14', NULL);
INSERT INTO `board` VALUES (25, 2, 'gy', '观音菩萨', 'nzph', 'qq', '男', '911', '911.com', '2023-04-04 18:03:12', '2023-04-05 19:26:12', '2023-04-04 18:19:58', NULL);
INSERT INTO `board` VALUES (26, 3, '12345', '蛇', '123123', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', '12312312312', '123132123', '2023-04-05 23:37:29', '2023-04-06 06:30:47', '2023-04-06 06:30:47', NULL);
INSERT INTO `board` VALUES (27, 2, '123', '123', '123', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', '123', '123', '2023-04-06 06:20:49', '2023-04-06 06:45:13', '2023-04-06 06:45:13', NULL);
INSERT INTO `board` VALUES (28, 3, '123342123', '123424123', '123', 'https://static.yirenyian.com/opoc/sysImg/avatar-girl.png', '女', '1232', '123324', '2023-04-06 06:20:54', '2023-04-06 09:04:58', NULL, NULL);
INSERT INTO `board` VALUES (29, 3, '123', '123', '123', 'https://static.yirenyian.com/opoc/sysImg/avatar-girl.png', '女', '123', '123', '2023-04-06 06:20:57', '2023-04-06 06:49:24', '2023-04-06 06:49:24', NULL);
INSERT INTO `board` VALUES (30, 3, '123123', '123123', '123123', 'https://static.yirenyian.com/opoc/sysImg/avatar-girl.png', '女', '123123', '123123', '2023-04-06 06:21:02', '2023-04-06 06:47:28', '2023-04-06 06:47:28', NULL);
INSERT INTO `board` VALUES (31, 9, '123', '123', '123', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', '123', '123', '2023-04-06 08:37:45', '2023-04-06 09:05:05', '2023-04-06 09:05:05', NULL);
INSERT INTO `board` VALUES (32, 9, '123', '123', '123', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', '123', '123', '2023-04-06 08:37:49', '2023-04-06 08:37:51', '2023-04-06 08:37:51', NULL);
INSERT INTO `board` VALUES (33, 3, '123', '123', '123', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', '123', '123', '2023-04-06 09:05:12', '2023-04-08 02:21:20', '2023-04-08 02:21:20', NULL);
INSERT INTO `board` VALUES (34, 10, '123', '123', '123', 'https://static.yirenyian.com/opoc/sysImg/avatar-girl.png', '女', '123', '123', '2023-04-06 09:07:35', '2023-04-06 09:07:40', '2023-04-06 09:07:40', NULL);
INSERT INTO `board` VALUES (35, 3, '123', '123', '123', 'https://static.yirenyian.com/opoc/sysImg/avatar-girl.png', '女', '123', '12312312@qq.com', '2023-04-08 02:21:17', '2023-04-10 02:29:41', '2023-04-10 02:29:41', NULL);

-- ----------------------------
-- Table structure for clazz
-- ----------------------------
DROP TABLE IF EXISTS `clazz`;
CREATE TABLE `clazz`  (
  `clazzId` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `schoolId` int NULL DEFAULT NULL,
  `gradeId` int NULL DEFAULT NULL,
  `clazzName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` datetime NULL DEFAULT NULL,
  `updateTime` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleteTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`clazzId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '班级表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of clazz
-- ----------------------------
INSERT INTO `clazz` VALUES (1, 1, 1, '启智测试1', '', '2023-03-23 19:49:21', '2023-03-31 13:55:28', NULL);
INSERT INTO `clazz` VALUES (2, 1, 1, '启智测试2', '测试', NULL, '2023-03-24 03:07:15', '2023-03-24 11:07:09');
INSERT INTO `clazz` VALUES (3, 1, 1, '启智测试5', '11', '2023-03-24 03:07:47', '2023-03-25 05:09:02', NULL);
INSERT INTO `clazz` VALUES (4, 2, 1, '大猹一班', '', '2023-03-24 14:49:35', '2023-04-06 05:44:13', '2023-04-06 05:44:13');
INSERT INTO `clazz` VALUES (5, 1, NULL, '1234', '1234', '2023-03-24 15:06:44', '2023-03-25 05:14:53', NULL);
INSERT INTO `clazz` VALUES (6, 1, 3, 'vj', 'fytft', '2023-03-24 15:07:05', '2023-03-24 23:41:49', '2023-03-24 23:41:49');
INSERT INTO `clazz` VALUES (7, 2, 4, 'ghjb', 'nkjbj', '2023-03-24 15:07:21', '2023-03-24 23:41:53', '2023-03-24 23:41:53');
INSERT INTO `clazz` VALUES (8, 1, 4, 'bjhbjb', '', '2023-03-24 15:08:09', '2023-03-26 13:30:29', '2023-03-26 13:30:29');
INSERT INTO `clazz` VALUES (9, 2, 2, '大猹二班', '2345', '2023-03-25 00:03:42', '2023-03-27 13:01:59', '2023-03-27 13:01:59');
INSERT INTO `clazz` VALUES (10, 2, 3, '大猹三班', '只学python', '2023-03-25 00:04:27', '2023-04-23 14:43:39', '2023-04-23 14:43:39');
INSERT INTO `clazz` VALUES (11, 2, 4, '大猹四班', '学习flask', '2023-03-25 00:05:06', '2023-03-29 04:28:45', '2023-03-29 04:28:45');
INSERT INTO `clazz` VALUES (12, 2, 1, '大猹五班色弱的头发一个', '12345678', '2023-03-25 00:05:39', '2023-03-26 00:16:58', '2023-03-26 00:16:58');
INSERT INTO `clazz` VALUES (13, 2, 1, '大猹六班', '1234', '2023-03-25 00:05:52', '2023-04-23 14:43:43', '2023-04-23 14:43:43');
INSERT INTO `clazz` VALUES (14, 2, 1, '大猹七班', '1234', '2023-03-25 00:06:05', '2023-04-23 14:43:47', '2023-04-23 14:43:47');
INSERT INTO `clazz` VALUES (15, 1, 2, 'sadaasd', 'sadas', '2023-03-25 00:06:23', '2023-03-25 00:07:20', '2023-03-25 00:07:20');
INSERT INTO `clazz` VALUES (16, 2, NULL, '大猹八班', '1235678', '2023-03-25 00:06:36', '2023-03-25 05:15:07', NULL);
INSERT INTO `clazz` VALUES (17, NULL, 7, '1231', '12312', '2023-03-25 05:09:10', NULL, NULL);
INSERT INTO `clazz` VALUES (18, 7, 1, 'A班', '123', '2023-03-31 08:17:39', NULL, NULL);
INSERT INTO `clazz` VALUES (19, 8, 3, '向日葵班', '班级中大部分是脑瘫儿童，需要特殊的体育和康复指导', '2023-04-01 02:32:27', NULL, NULL);
INSERT INTO `clazz` VALUES (20, 10, 14, '蒲公英班', '可爱的小伞兵，各个朝气蓬勃', '2023-04-12 07:37:01', NULL, NULL);
INSERT INTO `clazz` VALUES (21, 11, 14, '聚义班', '男生多的班级', '2023-04-16 11:51:13', NULL, NULL);
INSERT INTO `clazz` VALUES (22, 12, 11, '1班', '主要是和自闭儿童有段的班级', '2023-04-21 14:22:32', NULL, NULL);

-- ----------------------------
-- Table structure for committee
-- ----------------------------
DROP TABLE IF EXISTS `committee`;
CREATE TABLE `committee`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `regionId` int NULL DEFAULT NULL,
  `committeeName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '委员会名称',
  `committeeAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '委员会地址',
  `committeeResponsible` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '委员会负责人',
  `committeePhone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '委员会联系电话',
  `committeeCreateTime` datetime NULL DEFAULT NULL COMMENT '委员会成立时间',
  `introduction` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '简介',
  `subordinateCenter` int NULL DEFAULT NULL COMMENT '下属特教中心',
  `createTime` datetime NULL DEFAULT NULL,
  `updateTime` datetime NULL DEFAULT NULL,
  `deleteTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '委员会机构表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of committee
-- ----------------------------
INSERT INTO `committee` VALUES (1, 321200, '泰州特教委员会', '泰州市大伦镇天元村', '玉皇大帝', '10088', '2023-04-04 13:57:37', '测试数据', 1, NULL, NULL, '2023-04-06 08:23:34');
INSERT INTO `committee` VALUES (2, 320509, '天庭委员会', '南天门1237号', '嫦娥爸爸', '120', '2023-04-05 19:11:11', '简介', 9, NULL, NULL, '2023-04-06 08:24:09');
INSERT INTO `committee` VALUES (3, 232722, '大猹委员会', '大猹村1号', '游瑞', '110123', '2023-04-06 00:00:00', '123123', 1, NULL, NULL, NULL);
INSERT INTO `committee` VALUES (4, 130105, '123', '123', '123', '123', '2023-04-25 00:00:00', '123', 9, NULL, NULL, '2023-04-06 08:26:34');
INSERT INTO `committee` VALUES (5, 130105, '123', '123', '123', '123', '2023-04-25 00:00:00', '123123', 9, NULL, NULL, '2023-04-06 08:26:34');
INSERT INTO `committee` VALUES (6, 130105, '123123', '123', '123', '123', '2023-04-25 00:00:00', '123123', 9, NULL, NULL, '2023-04-06 08:26:34');
INSERT INTO `committee` VALUES (7, 130105, '123', '123', '123', '123', '2023-04-24 00:00:00', '123', 8, NULL, NULL, '2023-04-06 08:27:13');
INSERT INTO `committee` VALUES (8, 310110, '123', '345', 'eda', 'asdf', '2023-04-26 00:00:00', 'fasdf', 8, NULL, NULL, '2023-04-06 08:27:18');
INSERT INTO `committee` VALUES (9, 310110, '杨浦特教委员会', '123', '123', '123', '2023-04-27 00:00:00', '123', 9, NULL, NULL, '2023-04-08 02:20:38');
INSERT INTO `committee` VALUES (10, 130105, '123', '123', '123', '123123', '2023-04-25 00:00:00', '123', 8, NULL, NULL, '2023-04-08 02:20:49');
INSERT INTO `committee` VALUES (11, 232762, '123', '123', '123', '123', '2023-05-03 00:00:00', '123', 8, NULL, NULL, '2023-04-06 08:36:47');
INSERT INTO `committee` VALUES (12, 310110, '123', 'ewqr', 'qwer', 'qwer', '2023-04-24 00:00:00', 'qwer', 7, NULL, NULL, '2023-04-08 02:20:38');

-- ----------------------------
-- Table structure for exercise
-- ----------------------------
DROP TABLE IF EXISTS `exercise`;
CREATE TABLE `exercise`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `studentId` int NULL DEFAULT NULL COMMENT ' 学生Id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '训练名称',
  `subTitle` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '训练内容简介',
  `context` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '详细训练内容',
  `annex` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '附件',
  `startTime` datetime NULL DEFAULT NULL COMMENT '训练开始时间',
  `endTime` datetime NULL DEFAULT NULL COMMENT '训练结束时间',
  `createTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleteTime` datetime NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 88 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exercise
-- ----------------------------
INSERT INTO `exercise` VALUES (1, 1, '1', '1', '1', '1', '2023-04-19 09:43:48', '2023-04-19 09:43:53', '2023-04-01 17:37:45', '2023-04-20 17:37:53', '2023-04-19 09:46:01');
INSERT INTO `exercise` VALUES (87, 52, '测试2', '未完成', '[{\"qyestionType\":\"单选判断\",\"qyestionScore\":4,\"qyestionContent\":\"下面最大的数为？\",\"select\":[{\"value\":\"1\",\"name\":\"A\"},{\"value\":\"2\",\"name\":\"B\"},{\"value\":\"3\",\"name\":\"C\"},{\"value\":\"4\",\"name\":\"D\"}],\"isTrue\":\"D\",\"subjectivity\":\"\",\"Single\":[0,1,2,3]}]', '', '2023-03-27 00:00:00', '2023-04-21 00:00:00', '2023-04-23 18:34:23', NULL, NULL);

-- ----------------------------
-- Table structure for familybasic
-- ----------------------------
DROP TABLE IF EXISTS `familybasic`;
CREATE TABLE `familybasic`  (
  `familyId` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '家庭Id',
  `studentId` int NULL DEFAULT NULL COMMENT '学生Id',
  `numberOfFamily` int NULL DEFAULT NULL COMMENT '家庭人数',
  `homeAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '家庭地址',
  `annualIncome` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '年收入',
  `languageEnvironment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '家庭语言环境',
  `parentingStyle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '教养方式',
  `familyResourceAdvantages` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '家庭资源优势',
  `familyResourceAdvantagesMess` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '家庭资源优势说明',
  `livingResources` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生活资源',
  `otherLivingResources` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其他生活资源',
  `leisureResources` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '休闲资源',
  `otherLeisureResources` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其他休闲资源',
  `employmentResources` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '就业资源',
  `otherEmploymentResources` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其他就业资源',
  PRIMARY KEY (`familyId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '家庭基本信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of familybasic
-- ----------------------------
INSERT INTO `familybasic` VALUES (8, 46, 8, '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `familybasic` VALUES (9, 47, 5, '', '', '', '', '', '', '', '', '', '', '[\"工厂\"]', '');
INSERT INTO `familybasic` VALUES (10, 48, 0, '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `familybasic` VALUES (11, 49, 0, '', '3万以下', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `familybasic` VALUES (12, 50, 0, '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `familybasic` VALUES (13, 51, 100, '123', '200万以上', '', '', '[\"经济水平\",\"就业资源\"]', '123', '[\"餐馆\",\"美发店\",\"邮局\"]', '123', '[\"咖啡馆\",\"唱吧\",\"剧院\"]', '123', '[\"工厂\",\"作坊\",\"工作室\"]', '123');
INSERT INTO `familybasic` VALUES (14, 52, 5, '12312312345', '3万以下', '普通话为主', '权威型：高关爱、高控制', '[\"经济水平\"]', '123', '[\"超市\"]', '123', '[\"公园\"]', '123', '[\"工厂\"]', '123');
INSERT INTO `familybasic` VALUES (15, 53, 0, '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `familybasic` VALUES (16, 54, 4, '吴江经开区长安路123号', '3-5万', '方言为主', '专制型：低关爱、高控制', '[\"人力资源\"]', '', '[\"美发店\"]', '', '[\"公园\"]', '', '[\"作坊\"]', '');
INSERT INTO `familybasic` VALUES (17, 55, 0, '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `familybasic` VALUES (18, 56, 0, '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `familybasic` VALUES (19, 57, 0, '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `familybasic` VALUES (20, 58, 0, '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `familybasic` VALUES (21, 59, 0, '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `familybasic` VALUES (22, 60, 0, '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `familybasic` VALUES (23, 61, 0, '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `familybasic` VALUES (24, 62, 0, '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `familybasic` VALUES (25, 63, 0, '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `familybasic` VALUES (26, 64, 0, '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `familybasic` VALUES (27, 65, 0, '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `familybasic` VALUES (28, 66, 0, '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `familybasic` VALUES (29, 67, 0, '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `familybasic` VALUES (30, 68, 0, '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `familybasic` VALUES (31, 69, 0, '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `familybasic` VALUES (32, 70, 0, '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `familybasic` VALUES (33, 71, 0, '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `familybasic` VALUES (34, 72, 0, '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `familybasic` VALUES (35, 73, 0, '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `familybasic` VALUES (36, 74, 0, '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `familybasic` VALUES (37, 75, 0, '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `familybasic` VALUES (38, 76, 0, '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `familybasic` VALUES (39, 77, 0, '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `familybasic` VALUES (40, 78, 0, '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `familybasic` VALUES (41, 79, 0, '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `familybasic` VALUES (42, 80, 0, '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `familybasic` VALUES (43, 81, 0, '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `familybasic` VALUES (44, 82, 0, '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `familybasic` VALUES (45, 83, 0, '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `familybasic` VALUES (46, 84, 0, '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `familybasic` VALUES (47, 85, 0, '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `familybasic` VALUES (48, 86, 0, '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `familybasic` VALUES (49, 87, 0, '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `familybasic` VALUES (50, 88, 0, '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `familybasic` VALUES (51, 89, 0, '', '', '', '', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for familymember
-- ----------------------------
DROP TABLE IF EXISTS `familymember`;
CREATE TABLE `familymember`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `studentId` int NULL DEFAULT NULL COMMENT '学生Id',
  `familyName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `familyRelation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关系',
  `birthDay` datetime NULL DEFAULT NULL COMMENT '出生日期',
  `educationLevel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '受教育程度',
  `occupation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '职业',
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话',
  `life` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否共同生活',
  `care` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主要照料',
  `careTime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '共同生活时长',
  `createTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `deleteTime` datetime NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '家庭成员表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of familymember
-- ----------------------------

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `fileType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件类型',
  `contextType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件内容标签',
  `fileTitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件名称',
  `fileSubtitle` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '文件副标题',
  `fileOnwerId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件所有者',
  `OnwerType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所有者类型',
  `publiced` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否公开',
  `filePath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件地址',
  `createTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleteTime` datetime NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES (20, 'Excel', '123', '123', '123', 'wk', '绯荤粺绠＄悊鍛�', 'privated', '', '2023-04-16 17:42:36', NULL, NULL);
INSERT INTO `file` VALUES (21, 'Excel', '123', '123', '123', 'wk', '系统管理员', 'privated', '/file/download?filename=application-vnd.ms-excel-1681638395681out (7).xls', '2023-04-16 17:46:44', '2023-04-16 17:47:43', NULL);
INSERT INTO `file` VALUES (22, 'word', '123', '234', '456', 'wk', '系统管理员', 'privated', '/file/download?filename=application-vnd.openxmlformats-officedocument.wordprocessingml.document-1681638623935设计文档.docx', '2023-04-16 17:50:34', '2023-04-16 17:50:48', NULL);
INSERT INTO `file` VALUES (23, 'word', '123', 'qwe', 'asd', 'wk', '系统管理员', 'privated', '/file/download?filename=application-vnd.openxmlformats-officedocument.wordprocessingml.document-16816388543110416.docx', '2023-04-16 17:54:24', '2023-04-16 17:54:40', NULL);
INSERT INTO `file` VALUES (24, 'word', '789', 'aaa', 'vbvv', 'wk', '系统管理员', 'privated', '/file/download?filename=application-vnd.openxmlformats-officedocument.wordprocessingml.document-16816390792840416.docx', '2023-04-16 17:58:12', '2023-04-16 17:58:24', NULL);
INSERT INTO `file` VALUES (25, 'word', '789', '23', 'xdf', 'wk', '系统管理员', 'privated', '/file/download?filename=application-vnd.openxmlformats-officedocument.wordprocessingml.document-16816453077560416.docx', '2023-04-16 19:42:07', '2023-04-16 19:42:37', NULL);
INSERT INTO `file` VALUES (26, 'Excel', '123', '456', 'fdgsdg', 'wk', '系统管理员', 'privated', '/file/download?filename=application-vnd.openxmlformats-officedocument.spreadsheetml.sheet-1681648461236新建 XLSX 工作表.xlsx', '2023-04-16 20:34:32', '2023-04-16 20:34:48', NULL);
INSERT INTO `file` VALUES (27, 'word', '1123', '666', '666', 'wk', '系统管理员', 'publiced', '/file/download?filename=application-vnd.openxmlformats-officedocument.wordprocessingml.document-1681993237550设计文档.docx', '2023-04-20 20:20:45', NULL, NULL);

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade`  (
  `gradeId` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `gradeName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`gradeId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '年级表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES (1, '早教班(1-3岁)');
INSERT INTO `grade` VALUES (2, '小班');
INSERT INTO `grade` VALUES (3, '中班');
INSERT INTO `grade` VALUES (4, '大班');
INSERT INTO `grade` VALUES (5, '学前班');
INSERT INTO `grade` VALUES (6, '学前混龄');
INSERT INTO `grade` VALUES (7, '学前已毕业');
INSERT INTO `grade` VALUES (8, '一年级');
INSERT INTO `grade` VALUES (9, '二年级');
INSERT INTO `grade` VALUES (10, '三年级');
INSERT INTO `grade` VALUES (11, '四年级');
INSERT INTO `grade` VALUES (12, '五年级');
INSERT INTO `grade` VALUES (13, '六年级');
INSERT INTO `grade` VALUES (14, '七年级');
INSERT INTO `grade` VALUES (15, '八年级');
INSERT INTO `grade` VALUES (16, '九年级');
INSERT INTO `grade` VALUES (17, '义务混龄');
INSERT INTO `grade` VALUES (18, '义务已毕业');

-- ----------------------------
-- Table structure for growup
-- ----------------------------
DROP TABLE IF EXISTS `growup`;
CREATE TABLE `growup`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `studentId` int NULL DEFAULT NULL COMMENT '学生ID',
  `trimesterWeight` double NULL DEFAULT 0 COMMENT '妊娠初期体重',
  `isTakeMedicine` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '是否服用药物',
  `isSmokeOrDrink` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '是否抽烟酗酒',
  `emotionalCharacteristics` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '情绪特征',
  `physiologicalReaction` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常生理反应',
  `sleepQuality` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '睡眠质量',
  `isTimeDifference` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '是否倒时差',
  `industrialChemicalFactor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '工业化学因素',
  `physicalFactor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '物理因素',
  `biologicalFactor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '生物因素',
  `nutritionalFactor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '营养因素',
  `badHabit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '不良习惯',
  `predelivery` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '分娩前',
  `atChildbirth` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '分娩后',
  `weight` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '体重',
  `length` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '体长',
  `headCircumference` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头围',
  `suffocation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '窒息',
  `feedingPattern` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主要喂养方式',
  `firstWordAppears` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '首个词汇出现时间',
  `firstSentence` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '首个句子出现时间',
  `headUpTime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '抬头时间',
  `independentSittingTime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '独立坐时间',
  `independentStationTime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '独立站时间',
  `independentTravelTime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '独立走时间',
  `urinationTime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表达小便时间',
  `stoolTime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表达小便时间',
  `independentUrinationTime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '独立小便时间',
  `independentStoolTime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '独立大便时间',
  `geneticHistory` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '遗传病史',
  `majorDiseases` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '重大疾病史',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '成长信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of growup
-- ----------------------------
INSERT INTO `growup` VALUES (2, 46, 1000, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `growup` VALUES (3, 47, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '无1');
INSERT INTO `growup` VALUES (4, 48, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `growup` VALUES (5, 49, 50, 'false', 'false', '', '', '', 'false', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `growup` VALUES (6, 50, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `growup` VALUES (7, 51, 0, 'false', 'false', '不稳定', '', '', 'false', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `growup` VALUES (8, 52, 10, 'true', 'false', '稳定', '123', '优', 'true', '[\"矿工业\"]', '[\"电离辐射\"]', '[\"无\"]', '[\"无\"]', '[\"挑食\"]', '[\"胎盘早剥\"]', '[\"过期产(42周及以后)\"]', '123', '123', '123', '无', '其他', '123', '123', '123', '123', '123', '123', '123', '123', '123', '123', '132', '123');
INSERT INTO `growup` VALUES (9, 53, 40, 'false', 'false', '稳定', '无', '良', 'false', '[\"农业\",\"美容美发业\"]', '[\"电离辐射\"]', '[\"无\"]', '[\"蛋白质（缺乏）\"]', '[\"动作刻板或僵化\"]', '[\"正常\"]', '[\"顺产\"]', '4', '56', '30', '无', '母乳', '1岁', '1岁', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `growup` VALUES (10, 54, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `growup` VALUES (11, 55, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `growup` VALUES (12, 56, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `growup` VALUES (13, 57, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `growup` VALUES (14, 58, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `growup` VALUES (15, 59, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `growup` VALUES (16, 61, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `growup` VALUES (17, 60, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `growup` VALUES (18, 62, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `growup` VALUES (19, 63, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `growup` VALUES (20, 64, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `growup` VALUES (21, 65, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `growup` VALUES (22, 66, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `growup` VALUES (23, 67, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `growup` VALUES (24, 68, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `growup` VALUES (25, 69, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `growup` VALUES (26, 70, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `growup` VALUES (27, 71, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `growup` VALUES (28, 72, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `growup` VALUES (29, 73, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `growup` VALUES (30, 74, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `growup` VALUES (31, 75, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `growup` VALUES (32, 76, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `growup` VALUES (33, 77, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `growup` VALUES (34, 78, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `growup` VALUES (35, 79, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `growup` VALUES (36, 80, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `growup` VALUES (37, 81, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `growup` VALUES (38, 82, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `growup` VALUES (39, 83, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `growup` VALUES (40, 84, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `growup` VALUES (41, 85, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `growup` VALUES (42, 86, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `growup` VALUES (43, 87, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `growup` VALUES (44, 88, 60, 'true', 'true', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `growup` VALUES (45, 89, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for love
-- ----------------------------
DROP TABLE IF EXISTS `love`;
CREATE TABLE `love`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `studentId` int NULL DEFAULT NULL COMMENT '学生Id',
  `loveArticle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '喜欢的物品',
  `loveActivity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '喜欢的活动',
  `loveFigure` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '喜欢的人物',
  `characterAdvantage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性格优势',
  `shtick` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '特长',
  `other` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其他',
  `unLoveArticle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '不喜欢的物品',
  `unLoveActivity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '不喜欢的活动',
  `unLoveFigure` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '不喜欢的人物',
  `otherFactors` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其他因素',
  `explain_` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '兴趣爱好' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of love
-- ----------------------------
INSERT INTO `love` VALUES (14, 46, '王坤 大傻', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `love` VALUES (15, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `love` VALUES (16, 48, '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `love` VALUES (17, 49, '西瓜', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `love` VALUES (18, 50, '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `love` VALUES (19, 51, '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `love` VALUES (20, 52, '123', '123', '123', '123', '123', '123', '123', '13', '13', '[\"光线\"]', '123');
INSERT INTO `love` VALUES (21, 53, '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `love` VALUES (22, 54, '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `love` VALUES (23, 55, '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `love` VALUES (24, 56, '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `love` VALUES (25, 57, '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `love` VALUES (26, 58, '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `love` VALUES (27, 59, '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `love` VALUES (28, 60, '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `love` VALUES (29, 61, '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `love` VALUES (30, 62, '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `love` VALUES (31, 63, '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `love` VALUES (32, 64, '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `love` VALUES (33, 65, '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `love` VALUES (34, 66, '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `love` VALUES (35, 67, '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `love` VALUES (36, 68, '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `love` VALUES (37, 69, '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `love` VALUES (38, 70, '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `love` VALUES (39, 71, '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `love` VALUES (40, 72, '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `love` VALUES (41, 73, '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `love` VALUES (42, 74, '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `love` VALUES (43, 75, '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `love` VALUES (44, 76, '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `love` VALUES (45, 77, '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `love` VALUES (46, 78, '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `love` VALUES (47, 79, '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `love` VALUES (48, 80, '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `love` VALUES (49, 81, '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `love` VALUES (50, 82, '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `love` VALUES (51, 83, '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `love` VALUES (52, 84, '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `love` VALUES (53, 85, '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `love` VALUES (54, 86, '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `love` VALUES (55, 87, '', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `love` VALUES (56, 88, '', '足球', '', '', '', '', '', '', '小丑', '', '');
INSERT INTO `love` VALUES (57, 89, '', '', '', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for obstacle
-- ----------------------------
DROP TABLE IF EXISTS `obstacle`;
CREATE TABLE `obstacle`  (
  `obstacleId` int NOT NULL,
  `obstacleName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`obstacleId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '障碍类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of obstacle
-- ----------------------------
INSERT INTO `obstacle` VALUES (1, '智力障碍');
INSERT INTO `obstacle` VALUES (2, '自闭谱系障碍');
INSERT INTO `obstacle` VALUES (3, '脑瘫');
INSERT INTO `obstacle` VALUES (4, '视力障碍');
INSERT INTO `obstacle` VALUES (5, '听力障碍');
INSERT INTO `obstacle` VALUES (6, '言语与语言障碍');
INSERT INTO `obstacle` VALUES (7, '情绪与行为障碍');
INSERT INTO `obstacle` VALUES (8, '肢体障碍');
INSERT INTO `obstacle` VALUES (9, '精神残疾');
INSERT INTO `obstacle` VALUES (10, '病弱');
INSERT INTO `obstacle` VALUES (11, '多重障碍');
INSERT INTO `obstacle` VALUES (12, '其他');
INSERT INTO `obstacle` VALUES (13, '待确认');
INSERT INTO `obstacle` VALUES (14, '普通儿童');

-- ----------------------------
-- Table structure for physiology
-- ----------------------------
DROP TABLE IF EXISTS `physiology`;
CREATE TABLE `physiology`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `studentId` int NULL DEFAULT NULL COMMENT '学生Id',
  `irritability` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '过敏情况',
  `healthProblem` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '健康问题',
  `otherHealthProblem` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其他健康问题',
  `pharmacy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用药',
  `speakAssist` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '语言沟通辅助',
  `otherAssist` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其他辅助',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '生理信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of physiology
-- ----------------------------
INSERT INTO `physiology` VALUES (10, 46, '', '', '', '', '', '');
INSERT INTO `physiology` VALUES (11, 47, '11', '', '', '', '', '');
INSERT INTO `physiology` VALUES (12, 48, '', '', '', '', '', '');
INSERT INTO `physiology` VALUES (13, 49, '无', '', '', '', '', '');
INSERT INTO `physiology` VALUES (14, 50, '', '', '', '', '', '');
INSERT INTO `physiology` VALUES (15, 51, '', '', '', '', '', '');
INSERT INTO `physiology` VALUES (16, 52, '123', '[\"胃肠道疾病\"]', '123', '123', '[\"实物\"]', '123');
INSERT INTO `physiology` VALUES (17, 53, '', '', '', '', '', '');
INSERT INTO `physiology` VALUES (18, 54, '', '[\"听视觉障碍\"]', '', '', '[\"沟通板\"]', '');
INSERT INTO `physiology` VALUES (19, 55, '', '', '', '', '', '');
INSERT INTO `physiology` VALUES (20, 56, '', '', '', '', '', '');
INSERT INTO `physiology` VALUES (21, 57, '', '', '', '', '', '');
INSERT INTO `physiology` VALUES (22, 58, '', '', '', '', '', '');
INSERT INTO `physiology` VALUES (23, 59, '', '', '', '', '', '');
INSERT INTO `physiology` VALUES (24, 60, '', '', '', '', '', '');
INSERT INTO `physiology` VALUES (25, 61, '', '', '', '', '', '');
INSERT INTO `physiology` VALUES (26, 62, '', '', '', '', '', '');
INSERT INTO `physiology` VALUES (27, 63, '', '', '', '', '', '');
INSERT INTO `physiology` VALUES (28, 64, '', '', '', '', '', '');
INSERT INTO `physiology` VALUES (29, 65, '', '', '', '', '', '');
INSERT INTO `physiology` VALUES (30, 66, '', '', '', '', '', '');
INSERT INTO `physiology` VALUES (31, 67, '', '', '', '', '', '');
INSERT INTO `physiology` VALUES (32, 68, '', '', '', '', '', '');
INSERT INTO `physiology` VALUES (33, 69, '', '', '', '', '', '');
INSERT INTO `physiology` VALUES (34, 70, '', '', '', '', '', '');
INSERT INTO `physiology` VALUES (35, 71, '', '', '', '', '', '');
INSERT INTO `physiology` VALUES (36, 72, '', '', '', '', '', '');
INSERT INTO `physiology` VALUES (37, 73, '', '', '', '', '', '');
INSERT INTO `physiology` VALUES (38, 74, '', '', '', '', '', '');
INSERT INTO `physiology` VALUES (39, 75, '', '', '', '', '', '');
INSERT INTO `physiology` VALUES (40, 76, '', '', '', '', '', '');
INSERT INTO `physiology` VALUES (41, 77, '', '', '', '', '', '');
INSERT INTO `physiology` VALUES (42, 78, '', '', '', '', '', '');
INSERT INTO `physiology` VALUES (43, 79, '', '', '', '', '', '');
INSERT INTO `physiology` VALUES (44, 80, '', '', '', '', '', '');
INSERT INTO `physiology` VALUES (45, 81, '', '', '', '', '', '');
INSERT INTO `physiology` VALUES (46, 82, '', '', '', '', '', '');
INSERT INTO `physiology` VALUES (47, 83, '', '', '', '', '', '');
INSERT INTO `physiology` VALUES (48, 84, '', '', '', '', '', '');
INSERT INTO `physiology` VALUES (49, 85, '', '', '', '', '', '');
INSERT INTO `physiology` VALUES (50, 86, '', '', '', '', '', '');
INSERT INTO `physiology` VALUES (51, 87, '', '', '', '', '', '');
INSERT INTO `physiology` VALUES (52, 88, '无', '[\"癫痫\"]', '口服药控制', '无', '', '');
INSERT INTO `physiology` VALUES (53, 89, '', '', '', '', '', '');

-- ----------------------------
-- Table structure for region
-- ----------------------------
DROP TABLE IF EXISTS `region`;
CREATE TABLE `region`  (
  `provinceName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `provinceCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `cityName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `cityCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `regionName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `regionCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '地区表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of region
-- ----------------------------
INSERT INTO `region` VALUES ('河北省', '130000', '石家庄市', '130100', '新华区', '130105');
INSERT INTO `region` VALUES ('河北省', '130000', '石家庄市', '130100', '桥西区', '130104');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '大兴安岭地区', '232700', '松岭区', '232762');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '大兴安岭地区', '232700', '加格达奇区', '232761');
INSERT INTO `region` VALUES ('辽宁省', '210000', '本溪市', '210500', '本溪满族自治县', '210521');
INSERT INTO `region` VALUES ('辽宁省', '210000', '朝阳市', '211300', '朝阳县', '211321');
INSERT INTO `region` VALUES ('辽宁省', '210000', '朝阳市', '211300', '龙城区', '211303');
INSERT INTO `region` VALUES ('辽宁省', '210000', '朝阳市', '211300', '喀喇沁左翼蒙古族自治县', '211324');
INSERT INTO `region` VALUES ('辽宁省', '210000', '朝阳市', '211300', '凌源市', '211382');
INSERT INTO `region` VALUES ('辽宁省', '210000', '朝阳市', '211300', '北票市', '211381');
INSERT INTO `region` VALUES ('辽宁省', '210000', '丹东市', '210600', '振兴区', '210603');
INSERT INTO `region` VALUES ('辽宁省', '210000', '抚顺市', '210400', '东洲区', '210403');
INSERT INTO `region` VALUES ('辽宁省', '210000', '抚顺市', '210400', '新抚区', '210402');
INSERT INTO `region` VALUES ('辽宁省', '210000', '阜新市', '210900', '新邱区', '210903');
INSERT INTO `region` VALUES ('辽宁省', '210000', '葫芦岛市', '211400', '兴城市', '211481');
INSERT INTO `region` VALUES ('辽宁省', '210000', '葫芦岛市', '211400', '连山区', '211402');
INSERT INTO `region` VALUES ('辽宁省', '210000', '葫芦岛市', '211400', '绥中县', '211421');
INSERT INTO `region` VALUES ('辽宁省', '210000', '锦州市', '210700', '凌海市', '210781');
INSERT INTO `region` VALUES ('辽宁省', '210000', '盘锦市', '211100', '盘山县', '211122');
INSERT INTO `region` VALUES ('辽宁省', '210000', '盘锦市', '211100', '双台子区', '211102');
INSERT INTO `region` VALUES ('辽宁省', '210000', '铁岭市', '211200', '开原市', '211282');
INSERT INTO `region` VALUES ('辽宁省', '210000', '铁岭市', '211200', '昌图县', '211224');
INSERT INTO `region` VALUES ('辽宁省', '210000', '铁岭市', '211200', '调兵山市', '211281');
INSERT INTO `region` VALUES ('辽宁省', '210000', '铁岭市', '211200', '银州区', '211202');
INSERT INTO `region` VALUES ('辽宁省', '210000', '营口市', '210800', '鲅鱼圈区', '210804');
INSERT INTO `region` VALUES ('辽宁省', '210000', '鞍山市', '210300', '岫岩满族自治县', '210323');
INSERT INTO `region` VALUES ('辽宁省', '210000', '大连市', '210200', '普兰店区', '210214');
INSERT INTO `region` VALUES ('辽宁省', '210000', '大连市', '210200', '瓦房店市', '210281');
INSERT INTO `region` VALUES ('辽宁省', '210000', '本溪市', '210500', '桓仁满族自治县', '210522');
INSERT INTO `region` VALUES ('辽宁省', '210000', '本溪市', '210500', '南芬区', '210505');
INSERT INTO `region` VALUES ('辽宁省', '210000', '本溪市', '210500', '平山区', '210502');
INSERT INTO `region` VALUES ('辽宁省', '210000', '本溪市', '210500', '溪湖区', '210503');
INSERT INTO `region` VALUES ('辽宁省', '210000', '本溪市', '210500', '明山区', '210504');
INSERT INTO `region` VALUES ('辽宁省', '210000', '朝阳市', '211300', '建平县', '211322');
INSERT INTO `region` VALUES ('辽宁省', '210000', '朝阳市', '211300', '双塔区', '211302');
INSERT INTO `region` VALUES ('辽宁省', '210000', '丹东市', '210600', '宽甸满族自治县', '210624');
INSERT INTO `region` VALUES ('辽宁省', '210000', '丹东市', '210600', '凤城市', '210682');
INSERT INTO `region` VALUES ('辽宁省', '210000', '丹东市', '210600', '东港市', '210681');
INSERT INTO `region` VALUES ('辽宁省', '210000', '丹东市', '210600', '振安区', '210604');
INSERT INTO `region` VALUES ('辽宁省', '210000', '丹东市', '210600', '元宝区', '210602');
INSERT INTO `region` VALUES ('辽宁省', '210000', '抚顺市', '210400', '清原满族自治县', '210423');
INSERT INTO `region` VALUES ('辽宁省', '210000', '抚顺市', '210400', '新宾满族自治县', '210422');
INSERT INTO `region` VALUES ('辽宁省', '210000', '阜新市', '210900', '细河区', '210911');
INSERT INTO `region` VALUES ('辽宁省', '210000', '阜新市', '210900', '清河门区', '210905');
INSERT INTO `region` VALUES ('辽宁省', '210000', '阜新市', '210900', '太平区', '210904');
INSERT INTO `region` VALUES ('辽宁省', '210000', '葫芦岛市', '211400', '南票区', '211404');
INSERT INTO `region` VALUES ('辽宁省', '210000', '葫芦岛市', '211400', '建昌县', '211422');
INSERT INTO `region` VALUES ('辽宁省', '210000', '葫芦岛市', '211400', '龙港区', '211403');
INSERT INTO `region` VALUES ('辽宁省', '210000', '锦州市', '210700', '北镇市', '210782');
INSERT INTO `region` VALUES ('辽宁省', '210000', '锦州市', '210700', '义县', '210727');
INSERT INTO `region` VALUES ('辽宁省', '210000', '锦州市', '210700', '太和区', '210711');
INSERT INTO `region` VALUES ('辽宁省', '210000', '锦州市', '210700', '古塔区', '210702');
INSERT INTO `region` VALUES ('辽宁省', '210000', '锦州市', '210700', '凌河区', '210703');
INSERT INTO `region` VALUES ('辽宁省', '210000', '辽阳市', '211000', '白塔区', '211002');
INSERT INTO `region` VALUES ('辽宁省', '210000', '盘锦市', '211100', '兴隆台区', '211103');
INSERT INTO `region` VALUES ('辽宁省', '210000', '铁岭市', '211200', '清河区', '211204');
INSERT INTO `region` VALUES ('辽宁省', '210000', '铁岭市', '211200', '西丰县', '211223');
INSERT INTO `region` VALUES ('辽宁省', '210000', '营口市', '210800', '老边区', '210811');
INSERT INTO `region` VALUES ('辽宁省', '210000', '营口市', '210800', '盖州市', '210881');
INSERT INTO `region` VALUES ('辽宁省', '210000', '营口市', '210800', '大石桥市', '210882');
INSERT INTO `region` VALUES ('辽宁省', '210000', '营口市', '210800', '站前区', '210802');
INSERT INTO `region` VALUES ('辽宁省', '210000', '营口市', '210800', '西市区', '210803');
INSERT INTO `region` VALUES ('辽宁省', '210000', '鞍山市', '210300', '千山区', '210311');
INSERT INTO `region` VALUES ('辽宁省', '210000', '鞍山市', '210300', '海城市', '210381');
INSERT INTO `region` VALUES ('辽宁省', '210000', '鞍山市', '210300', '立山区', '210304');
INSERT INTO `region` VALUES ('辽宁省', '210000', '鞍山市', '210300', '铁东区', '210302');
INSERT INTO `region` VALUES ('辽宁省', '210000', '鞍山市', '210300', '铁西区', '210303');
INSERT INTO `region` VALUES ('辽宁省', '210000', '鞍山市', '210300', '台安县', '210321');
INSERT INTO `region` VALUES ('辽宁省', '210000', '大连市', '210200', '甘井子区', '210211');
INSERT INTO `region` VALUES ('辽宁省', '210000', '大连市', '210200', '金州区', '210213');
INSERT INTO `region` VALUES ('辽宁省', '210000', '大连市', '210200', '庄河市', '210283');
INSERT INTO `region` VALUES ('辽宁省', '210000', '大连市', '210200', '西岗区', '210203');
INSERT INTO `region` VALUES ('辽宁省', '210000', '大连市', '210200', '中山区', '210202');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '巴彦淖尔市', '150800', '临河区', '150802');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '包头市', '150200', '东河区', '150202');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '包头市', '150200', '昆都仑区', '150203');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '包头市', '150200', '石拐区', '150205');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '呼伦贝尔市', '150700', '海拉尔区', '150702');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '通辽市', '150500', '扎鲁特旗', '150526');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '锡林郭勒盟', '152500', '正蓝旗', '152530');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '巴彦淖尔市', '150800', '磴口县', '150822');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '锡林郭勒盟', '152500', '东乌珠穆沁旗', '152525');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '呼和浩特市', '150100', '回民区', '150103');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '呼和浩特市', '150100', '新城区', '150102');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '呼和浩特市', '150100', '玉泉区', '150104');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '呼和浩特市', '150100', '武川县', '150125');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '呼和浩特市', '150100', '赛罕区', '150105');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '呼和浩特市', '150100', '土默特左旗', '150121');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '巴彦淖尔市', '150800', '乌拉特中旗', '150824');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '锡林郭勒盟', '152500', '多伦县', '152531');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '锡林郭勒盟', '152500', '正镶白旗', '152529');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '阿拉善盟', '152900', '额济纳旗', '152923');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '阿拉善盟', '152900', '阿拉善左旗', '152921');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '巴彦淖尔市', '150800', '杭锦后旗', '150826');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '锡林郭勒盟', '152500', '阿巴嘎旗', '152522');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '锡林郭勒盟', '152500', '西乌珠穆沁旗', '152526');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '锡林郭勒盟', '152500', '二连浩特市', '152501');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '锡林郭勒盟', '152500', '锡林浩特市', '152502');
INSERT INTO `region` VALUES ('山东省', '370000', '日照市', '371100', '莒县', '371122');
INSERT INTO `region` VALUES ('山东省', '370000', '日照市', '371100', '五莲县', '371121');
INSERT INTO `region` VALUES ('山东省', '370000', '日照市', '371100', '岚山区', '371103');
INSERT INTO `region` VALUES ('山东省', '370000', '日照市', '371100', '东港区', '371102');
INSERT INTO `region` VALUES ('山东省', '370000', '青岛市', '370200', '平度市', '370283');
INSERT INTO `region` VALUES ('山东省', '370000', '青岛市', '370200', '黄岛区', '370211');
INSERT INTO `region` VALUES ('山东省', '370000', '青岛市', '370200', '市北区', '370203');
INSERT INTO `region` VALUES ('山东省', '370000', '青岛市', '370200', '即墨区', '370215');
INSERT INTO `region` VALUES ('山东省', '370000', '青岛市', '370200', '李沧区', '370213');
INSERT INTO `region` VALUES ('山东省', '370000', '青岛市', '370200', '莱西市', '370285');
INSERT INTO `region` VALUES ('山东省', '370000', '济南市', '370100', '商河县', '370126');
INSERT INTO `region` VALUES ('山东省', '370000', '济南市', '370100', '章丘区', '370114');
INSERT INTO `region` VALUES ('山东省', '370000', '济南市', '370100', '长清区', '370113');
INSERT INTO `region` VALUES ('山东省', '370000', '济南市', '370100', '济阳区', '370115');
INSERT INTO `region` VALUES ('山东省', '370000', '济南市', '370100', '历城区', '370112');
INSERT INTO `region` VALUES ('山东省', '370000', '济南市', '370100', '槐荫区', '370104');
INSERT INTO `region` VALUES ('山东省', '370000', '济南市', '370100', '历下区', '370102');
INSERT INTO `region` VALUES ('山东省', '370000', '济南市', '370100', '市中区', '370103');
INSERT INTO `region` VALUES ('山东省', '370000', '济南市', '370100', '天桥区', '370105');
INSERT INTO `region` VALUES ('山东省', '370000', '潍坊市', '370700', '奎文区', '370705');
INSERT INTO `region` VALUES ('山东省', '370000', '济宁市', '370800', '微山县', '370826');
INSERT INTO `region` VALUES ('山东省', '370000', '青岛市', '370200', '胶州市', '370281');
INSERT INTO `region` VALUES ('山西省', '140000', '阳泉市', '140300', '郊区', '140311');
INSERT INTO `region` VALUES ('山西省', '140000', '阳泉市', '140300', '盂县', '140322');
INSERT INTO `region` VALUES ('山西省', '140000', '阳泉市', '140300', '平定县', '140321');
INSERT INTO `region` VALUES ('山西省', '140000', '阳泉市', '140300', '矿区', '140303');
INSERT INTO `region` VALUES ('山西省', '140000', '阳泉市', '140300', '城区', '140302');
INSERT INTO `region` VALUES ('上海市', '310000', '上海市', '310100', '杨浦区', '310110');
INSERT INTO `region` VALUES ('上海市', '310000', '上海市', '310100', '青浦区', '310118');
INSERT INTO `region` VALUES ('天津市', '120000', '天津市', '120100', '蓟州区', '120119');
INSERT INTO `region` VALUES ('天津市', '120000', '天津市', '120100', '河东区', '120102');
INSERT INTO `region` VALUES ('天津市', '120000', '天津市', '120100', '静海区', '120118');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '巴音郭楞蒙古自治州', '652800', '若羌县', '652824');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '巴音郭楞蒙古自治州', '652800', '和硕县', '652828');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '巴音郭楞蒙古自治州', '652800', '库尔勒市', '652801');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '博尔塔拉蒙古自治州', '652700', '温泉县', '652723');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '昌吉回族自治州', '652300', '阜康市', '652302');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '昌吉回族自治州', '652300', '玛纳斯县', '652324');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '昌吉回族自治州', '652300', '吉木萨尔县', '652327');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '昌吉回族自治州', '652300', '奇台县', '652325');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '哈密市', '650500', '巴里坤哈萨克自治县', '650521');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '哈密市', '650500', '伊吾县', '650522');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '哈密市', '650500', '伊州区', '650502');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '和田地区', '653200', '皮山县', '653223');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '和田地区', '653200', '民丰县', '653227');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '和田地区', '653200', '和田县', '653221');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '和田地区', '653200', '策勒县', '653225');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '和田地区', '653200', '于田县', '653226');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '和田地区', '653200', '墨玉县', '653222');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '和田地区', '653200', '和田市', '653201');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '喀什地区', '653100', '莎车县', '653125');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '塔城地区', '654200', '乌苏市', '654202');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '阿勒泰地区', '654300', '哈巴河县', '654324');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '阿勒泰地区', '654300', '布尔津县', '654321');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '阿勒泰地区', '654300', '福海县', '654323');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '阿勒泰地区', '654300', '青河县', '654325');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '塔城地区', '654200', '额敏县', '654221');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '塔城地区', '654200', '和布克赛尔蒙古自治县', '654226');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '胡杨河市', '659000', '胡杨河市', '659010');
INSERT INTO `region` VALUES ('吉林省', '220000', '延边朝鲜族自治州', '222400', '汪清县', '222424');
INSERT INTO `region` VALUES ('吉林省', '220000', '通化市', '220500', '梅河口市', '220581');
INSERT INTO `region` VALUES ('吉林省', '220000', '松原市', '220700', '长岭县', '220722');
INSERT INTO `region` VALUES ('吉林省', '220000', '四平市', '220300', '伊通满族自治县', '220323');
INSERT INTO `region` VALUES ('吉林省', '220000', '长春市', '220100', '公主岭市', '220184');
INSERT INTO `region` VALUES ('吉林省', '220000', '四平市', '220300', '双辽市', '220382');
INSERT INTO `region` VALUES ('吉林省', '220000', '四平市', '220300', '梨树县', '220322');
INSERT INTO `region` VALUES ('吉林省', '220000', '四平市', '220300', '铁东区', '220303');
INSERT INTO `region` VALUES ('吉林省', '220000', '辽源市', '220400', '东辽县', '220422');
INSERT INTO `region` VALUES ('吉林省', '220000', '辽源市', '220400', '龙山区', '220402');
INSERT INTO `region` VALUES ('吉林省', '220000', '白城市', '220800', '洮北区', '220802');
INSERT INTO `region` VALUES ('吉林省', '220000', '白城市', '220800', '大安市', '220882');
INSERT INTO `region` VALUES ('吉林省', '220000', '白城市', '220800', '通榆县', '220822');
INSERT INTO `region` VALUES ('吉林省', '220000', '白城市', '220800', '洮南市', '220881');
INSERT INTO `region` VALUES ('吉林省', '220000', '吉林市', '220200', '船营区', '220204');
INSERT INTO `region` VALUES ('吉林省', '220000', '吉林市', '220200', '桦甸市', '220282');
INSERT INTO `region` VALUES ('吉林省', '220000', '吉林市', '220200', '磐石市', '220284');
INSERT INTO `region` VALUES ('吉林省', '220000', '吉林市', '220200', '龙潭区', '220203');
INSERT INTO `region` VALUES ('吉林省', '220000', '吉林市', '220200', '永吉县', '220221');
INSERT INTO `region` VALUES ('吉林省', '220000', '吉林市', '220200', '丰满区', '220211');
INSERT INTO `region` VALUES ('吉林省', '220000', '吉林市', '220200', '昌邑区', '220202');
INSERT INTO `region` VALUES ('吉林省', '220000', '长春市', '220100', '九台区', '220113');
INSERT INTO `region` VALUES ('吉林省', '220000', '长春市', '220100', '朝阳区', '220104');
INSERT INTO `region` VALUES ('吉林省', '220000', '长春市', '220100', '双阳区', '220112');
INSERT INTO `region` VALUES ('吉林省', '220000', '长春市', '220100', '绿园区', '220106');
INSERT INTO `region` VALUES ('吉林省', '220000', '长春市', '220100', '农安县', '220122');
INSERT INTO `region` VALUES ('吉林省', '220000', '延边朝鲜族自治州', '222400', '敦化市', '222403');
INSERT INTO `region` VALUES ('吉林省', '220000', '延边朝鲜族自治州', '222400', '延吉市', '222401');
INSERT INTO `region` VALUES ('吉林省', '220000', '通化市', '220500', '通化县', '220521');
INSERT INTO `region` VALUES ('吉林省', '220000', '通化市', '220500', '东昌区', '220502');
INSERT INTO `region` VALUES ('吉林省', '220000', '通化市', '220500', '柳河县', '220524');
INSERT INTO `region` VALUES ('吉林省', '220000', '通化市', '220500', '辉南县', '220523');
INSERT INTO `region` VALUES ('吉林省', '220000', '通化市', '220500', '二道江区', '220503');
INSERT INTO `region` VALUES ('吉林省', '220000', '松原市', '220700', '前郭尔罗斯蒙古族自治县', '220721');
INSERT INTO `region` VALUES ('吉林省', '220000', '松原市', '220700', '扶余市', '220781');
INSERT INTO `region` VALUES ('吉林省', '220000', '松原市', '220700', '宁江区', '220702');
INSERT INTO `region` VALUES ('吉林省', '220000', '四平市', '220300', '铁西区', '220302');
INSERT INTO `region` VALUES ('吉林省', '220000', '辽源市', '220400', '东丰县', '220421');
INSERT INTO `region` VALUES ('吉林省', '220000', '辽源市', '220400', '西安区', '220403');
INSERT INTO `region` VALUES ('吉林省', '220000', '吉林市', '220200', '舒兰市', '220283');
INSERT INTO `region` VALUES ('吉林省', '220000', '吉林市', '220200', '蛟河市', '220281');
INSERT INTO `region` VALUES ('吉林省', '220000', '长春市', '220100', '德惠市', '220183');
INSERT INTO `region` VALUES ('吉林省', '220000', '长春市', '220100', '宽城区', '220103');
INSERT INTO `region` VALUES ('吉林省', '220000', '长春市', '220100', '榆树市', '220182');
INSERT INTO `region` VALUES ('吉林省', '220000', '长春市', '220100', '南关区', '220102');
INSERT INTO `region` VALUES ('吉林省', '220000', '长春市', '220100', '二道区', '220105');
INSERT INTO `region` VALUES ('甘肃省', '620000', '天水市', '620500', '张家川回族自治县', '620525');
INSERT INTO `region` VALUES ('甘肃省', '620000', '天水市', '620500', '清水县', '620521');
INSERT INTO `region` VALUES ('甘肃省', '620000', '定西市', '621100', '通渭县', '621121');
INSERT INTO `region` VALUES ('甘肃省', '620000', '庆阳市', '621000', '华池县', '621023');
INSERT INTO `region` VALUES ('甘肃省', '620000', '甘南藏族自治州', '623000', '舟曲县', '623023');
INSERT INTO `region` VALUES ('甘肃省', '620000', '甘南藏族自治州', '623000', '合作市', '623001');
INSERT INTO `region` VALUES ('甘肃省', '620000', '酒泉市', '620900', '瓜州县', '620922');
INSERT INTO `region` VALUES ('甘肃省', '620000', '酒泉市', '620900', '肃州区', '620902');
INSERT INTO `region` VALUES ('甘肃省', '620000', '张掖市', '620700', '甘州区', '620702');
INSERT INTO `region` VALUES ('甘肃省', '620000', '张掖市', '620700', '民乐县', '620722');
INSERT INTO `region` VALUES ('甘肃省', '620000', '张掖市', '620700', '山丹县', '620725');
INSERT INTO `region` VALUES ('甘肃省', '620000', '金昌市', '620300', '永昌县', '620321');
INSERT INTO `region` VALUES ('甘肃省', '620000', '武威市', '620600', '古浪县', '620622');
INSERT INTO `region` VALUES ('甘肃省', '620000', '兰州市', '620100', '永登县', '620121');
INSERT INTO `region` VALUES ('甘肃省', '620000', '兰州市', '620100', '榆中县', '620123');
INSERT INTO `region` VALUES ('甘肃省', '620000', '兰州市', '620100', '皋兰县', '620122');
INSERT INTO `region` VALUES ('甘肃省', '620000', '白银市', '620400', '平川区', '620403');
INSERT INTO `region` VALUES ('甘肃省', '620000', '庆阳市', '621000', '环县', '621022');
INSERT INTO `region` VALUES ('甘肃省', '620000', '庆阳市', '621000', '庆城县', '621021');
INSERT INTO `region` VALUES ('甘肃省', '620000', '庆阳市', '621000', '合水县', '621024');
INSERT INTO `region` VALUES ('甘肃省', '620000', '庆阳市', '621000', '镇原县', '621027');
INSERT INTO `region` VALUES ('甘肃省', '620000', '庆阳市', '621000', '西峰区', '621002');
INSERT INTO `region` VALUES ('甘肃省', '620000', '庆阳市', '621000', '宁县', '621026');
INSERT INTO `region` VALUES ('甘肃省', '620000', '庆阳市', '621000', '正宁县', '621025');
INSERT INTO `region` VALUES ('甘肃省', '620000', '平凉市', '620800', '华亭市', '620881');
INSERT INTO `region` VALUES ('甘肃省', '620000', '甘南藏族自治州', '623000', '夏河县', '623027');
INSERT INTO `region` VALUES ('甘肃省', '620000', '平凉市', '620800', '庄浪县', '620825');
INSERT INTO `region` VALUES ('甘肃省', '620000', '平凉市', '620800', '静宁县', '620826');
INSERT INTO `region` VALUES ('甘肃省', '620000', '天水市', '620500', '秦安县', '620522');
INSERT INTO `region` VALUES ('甘肃省', '620000', '天水市', '620500', '麦积区', '620503');
INSERT INTO `region` VALUES ('甘肃省', '620000', '天水市', '620500', '秦州区', '620502');
INSERT INTO `region` VALUES ('甘肃省', '620000', '陇南市', '621200', '礼县', '621226');
INSERT INTO `region` VALUES ('甘肃省', '620000', '陇南市', '621200', '西和县', '621225');
INSERT INTO `region` VALUES ('甘肃省', '620000', '陇南市', '621200', '宕昌县', '621223');
INSERT INTO `region` VALUES ('甘肃省', '620000', '甘南藏族自治州', '623000', '迭部县', '623024');
INSERT INTO `region` VALUES ('甘肃省', '620000', '天水市', '620500', '甘谷县', '620523');
INSERT INTO `region` VALUES ('甘肃省', '620000', '天水市', '620500', '武山县', '620524');
INSERT INTO `region` VALUES ('甘肃省', '620000', '甘南藏族自治州', '623000', '卓尼县', '623022');
INSERT INTO `region` VALUES ('甘肃省', '620000', '甘南藏族自治州', '623000', '临潭县', '623021');
INSERT INTO `region` VALUES ('甘肃省', '620000', '酒泉市', '620900', '敦煌市', '620982');
INSERT INTO `region` VALUES ('甘肃省', '620000', '酒泉市', '620900', '阿克塞哈萨克族自治县', '620924');
INSERT INTO `region` VALUES ('甘肃省', '620000', '酒泉市', '620900', '玉门市', '620981');
INSERT INTO `region` VALUES ('甘肃省', '620000', '酒泉市', '620900', '金塔县', '620921');
INSERT INTO `region` VALUES ('甘肃省', '620000', '张掖市', '620700', '肃南裕固族自治县', '620721');
INSERT INTO `region` VALUES ('甘肃省', '620000', '张掖市', '620700', '高台县', '620724');
INSERT INTO `region` VALUES ('甘肃省', '620000', '金昌市', '620300', '金川区', '620302');
INSERT INTO `region` VALUES ('甘肃省', '620000', '武威市', '620600', '民勤县', '620621');
INSERT INTO `region` VALUES ('甘肃省', '620000', '武威市', '620600', '凉州区', '620602');
INSERT INTO `region` VALUES ('甘肃省', '620000', '白银市', '620400', '景泰县', '620423');
INSERT INTO `region` VALUES ('甘肃省', '620000', '兰州市', '620100', '红古区', '620111');
INSERT INTO `region` VALUES ('甘肃省', '620000', '兰州市', '620100', '西固区', '620104');
INSERT INTO `region` VALUES ('甘肃省', '620000', '白银市', '620400', '会宁县', '620422');
INSERT INTO `region` VALUES ('甘肃省', '620000', '兰州市', '620100', '安宁区', '620105');
INSERT INTO `region` VALUES ('甘肃省', '620000', '兰州市', '620100', '七里河区', '620103');
INSERT INTO `region` VALUES ('甘肃省', '620000', '兰州市', '620100', '城关区', '620102');
INSERT INTO `region` VALUES ('甘肃省', '620000', '白银市', '620400', '白银区', '620402');
INSERT INTO `region` VALUES ('甘肃省', '620000', '白银市', '620400', '靖远县', '620421');
INSERT INTO `region` VALUES ('甘肃省', '620000', '平凉市', '620800', '崆峒区', '620802');
INSERT INTO `region` VALUES ('甘肃省', '620000', '平凉市', '620800', '崇信县', '620823');
INSERT INTO `region` VALUES ('甘肃省', '620000', '平凉市', '620800', '泾川县', '620821');
INSERT INTO `region` VALUES ('甘肃省', '620000', '平凉市', '620800', '灵台县', '620822');
INSERT INTO `region` VALUES ('甘肃省', '620000', '定西市', '621100', '安定区', '621102');
INSERT INTO `region` VALUES ('甘肃省', '620000', '定西市', '621100', '陇西县', '621122');
INSERT INTO `region` VALUES ('甘肃省', '620000', '定西市', '621100', '渭源县', '621123');
INSERT INTO `region` VALUES ('甘肃省', '620000', '定西市', '621100', '临洮县', '621124');
INSERT INTO `region` VALUES ('甘肃省', '620000', '甘南藏族自治州', '623000', '碌曲县', '623026');
INSERT INTO `region` VALUES ('甘肃省', '620000', '甘南藏族自治州', '623000', '玛曲县', '623025');
INSERT INTO `region` VALUES ('甘肃省', '620000', '定西市', '621100', '漳县', '621125');
INSERT INTO `region` VALUES ('甘肃省', '620000', '定西市', '621100', '岷县', '621126');
INSERT INTO `region` VALUES ('甘肃省', '620000', '嘉峪关市', '620200', '嘉峪关市', '620200');
INSERT INTO `region` VALUES ('甘肃省', '620000', '陇南市', '621200', '成县', '621221');
INSERT INTO `region` VALUES ('甘肃省', '620000', '陇南市', '621200', '徽县', '621227');
INSERT INTO `region` VALUES ('甘肃省', '620000', '陇南市', '621200', '两当县', '621228');
INSERT INTO `region` VALUES ('甘肃省', '620000', '陇南市', '621200', '康县', '621224');
INSERT INTO `region` VALUES ('甘肃省', '620000', '陇南市', '621200', '文县', '621222');
INSERT INTO `region` VALUES ('甘肃省', '620000', '陇南市', '621200', '武都区', '621202');
INSERT INTO `region` VALUES ('湖北省', '420000', '仙桃市', '429004', '仙桃市', '429004');
INSERT INTO `region` VALUES ('江西省', '360000', '景德镇市', '360200', '珠山区', '360203');
INSERT INTO `region` VALUES ('福建省', '350000', '宁德市', '350900', '福安市', '350981');
INSERT INTO `region` VALUES ('青海省', '630000', '海北藏族自治州', '632200', '门源回族自治县', '632221');
INSERT INTO `region` VALUES ('青海省', '630000', '海北藏族自治州', '632200', '祁连县', '632222');
INSERT INTO `region` VALUES ('青海省', '630000', '海北藏族自治州', '632200', '刚察县', '632224');
INSERT INTO `region` VALUES ('青海省', '630000', '海北藏族自治州', '632200', '海晏县', '632223');
INSERT INTO `region` VALUES ('青海省', '630000', '海东市', '630200', '互助土族自治县', '630223');
INSERT INTO `region` VALUES ('青海省', '630000', '海东市', '630200', '乐都区', '630202');
INSERT INTO `region` VALUES ('青海省', '630000', '海东市', '630200', '平安区', '630203');
INSERT INTO `region` VALUES ('青海省', '630000', '海东市', '630200', '民和回族土族自治县', '630222');
INSERT INTO `region` VALUES ('青海省', '630000', '海东市', '630200', '化隆回族自治县', '630224');
INSERT INTO `region` VALUES ('青海省', '630000', '海东市', '630200', '循化撒拉族自治县', '630225');
INSERT INTO `region` VALUES ('青海省', '630000', '海南藏族自治州', '632500', '同德县', '632522');
INSERT INTO `region` VALUES ('青海省', '630000', '海南藏族自治州', '632500', '贵南县', '632525');
INSERT INTO `region` VALUES ('青海省', '630000', '海南藏族自治州', '632500', '贵德县', '632523');
INSERT INTO `region` VALUES ('青海省', '630000', '海南藏族自治州', '632500', '共和县', '632521');
INSERT INTO `region` VALUES ('青海省', '630000', '海南藏族自治州', '632500', '兴海县', '632524');
INSERT INTO `region` VALUES ('青海省', '630000', '海西蒙古族藏族自治州', '632800', '天峻县', '632823');
INSERT INTO `region` VALUES ('青海省', '630000', '海西蒙古族藏族自治州', '632800', '德令哈市', '632802');
INSERT INTO `region` VALUES ('青海省', '630000', '海西蒙古族藏族自治州', '632800', '乌兰县', '632821');
INSERT INTO `region` VALUES ('青海省', '630000', '海西蒙古族藏族自治州', '632800', '都兰县', '632822');
INSERT INTO `region` VALUES ('青海省', '630000', '海西蒙古族藏族自治州', '632800', '格尔木市', '632801');
INSERT INTO `region` VALUES ('青海省', '630000', '黄南藏族自治州', '632300', '同仁市', '632301');
INSERT INTO `region` VALUES ('青海省', '630000', '黄南藏族自治州', '632300', '河南蒙古族自治县', '632324');
INSERT INTO `region` VALUES ('青海省', '630000', '黄南藏族自治州', '632300', '泽库县', '632323');
INSERT INTO `region` VALUES ('青海省', '630000', '黄南藏族自治州', '632300', '尖扎县', '632322');
INSERT INTO `region` VALUES ('青海省', '630000', '西宁市', '630100', '大通回族土族自治县', '630121');
INSERT INTO `region` VALUES ('青海省', '630000', '西宁市', '630100', '湟中区', '630106');
INSERT INTO `region` VALUES ('青海省', '630000', '西宁市', '630100', '湟源县', '630123');
INSERT INTO `region` VALUES ('青海省', '630000', '西宁市', '630100', '城东区', '630102');
INSERT INTO `region` VALUES ('青海省', '630000', '西宁市', '630100', '城北区', '630105');
INSERT INTO `region` VALUES ('青海省', '630000', '西宁市', '630100', '城西区', '630104');
INSERT INTO `region` VALUES ('青海省', '630000', '西宁市', '630100', '城中区', '630103');
INSERT INTO `region` VALUES ('青海省', '630000', '果洛藏族自治州', '632600', '班玛县', '632622');
INSERT INTO `region` VALUES ('青海省', '630000', '果洛藏族自治州', '632600', '达日县', '632624');
INSERT INTO `region` VALUES ('青海省', '630000', '果洛藏族自治州', '632600', '久治县', '632625');
INSERT INTO `region` VALUES ('青海省', '630000', '果洛藏族自治州', '632600', '甘德县', '632623');
INSERT INTO `region` VALUES ('青海省', '630000', '果洛藏族自治州', '632600', '玛沁县', '632621');
INSERT INTO `region` VALUES ('青海省', '630000', '果洛藏族自治州', '632600', '玛多县', '632626');
INSERT INTO `region` VALUES ('青海省', '630000', '玉树藏族自治州', '632700', '玉树市', '632701');
INSERT INTO `region` VALUES ('青海省', '630000', '玉树藏族自治州', '632700', '囊谦县', '632725');
INSERT INTO `region` VALUES ('青海省', '630000', '玉树藏族自治州', '632700', '杂多县', '632722');
INSERT INTO `region` VALUES ('青海省', '630000', '玉树藏族自治州', '632700', '称多县', '632723');
INSERT INTO `region` VALUES ('陕西省', '610000', '延安市', '610600', '黄陵县', '610632');
INSERT INTO `region` VALUES ('陕西省', '610000', '榆林市', '610800', '定边县', '610825');
INSERT INTO `region` VALUES ('陕西省', '610000', '延安市', '610600', '子长市', '610681');
INSERT INTO `region` VALUES ('陕西省', '610000', '延安市', '610600', '延长县', '610621');
INSERT INTO `region` VALUES ('陕西省', '610000', '榆林市', '610800', '榆阳区', '610802');
INSERT INTO `region` VALUES ('陕西省', '610000', '延安市', '610600', '吴起县', '610626');
INSERT INTO `region` VALUES ('陕西省', '610000', '榆林市', '610800', '绥德县', '610826');
INSERT INTO `region` VALUES ('陕西省', '610000', '西安市', '610100', '碑林区', '610103');
INSERT INTO `region` VALUES ('陕西省', '610000', '延安市', '610600', '志丹县', '610625');
INSERT INTO `region` VALUES ('陕西省', '610000', '延安市', '610600', '宝塔区', '610602');
INSERT INTO `region` VALUES ('陕西省', '610000', '延安市', '610600', '富县', '610628');
INSERT INTO `region` VALUES ('陕西省', '610000', '西安市', '610100', '莲湖区', '610104');
INSERT INTO `region` VALUES ('陕西省', '610000', '榆林市', '610800', '横山区', '610803');
INSERT INTO `region` VALUES ('陕西省', '610000', '西安市', '610100', '新城区', '610102');
INSERT INTO `region` VALUES ('陕西省', '610000', '铜川市', '610200', '印台区', '610203');
INSERT INTO `region` VALUES ('陕西省', '610000', '铜川市', '610200', '宜君县', '610222');
INSERT INTO `region` VALUES ('陕西省', '610000', '延安市', '610600', '甘泉县', '610627');
INSERT INTO `region` VALUES ('陕西省', '610000', '榆林市', '610800', '神木市', '610881');
INSERT INTO `region` VALUES ('陕西省', '610000', '西安市', '610100', '未央区', '610112');
INSERT INTO `region` VALUES ('陕西省', '610000', '西安市', '610100', '雁塔区', '610113');
INSERT INTO `region` VALUES ('陕西省', '610000', '延安市', '610600', '宜川县', '610630');
INSERT INTO `region` VALUES ('陕西省', '610000', '榆林市', '610800', '子洲县', '610831');
INSERT INTO `region` VALUES ('陕西省', '610000', '榆林市', '610800', '清涧县', '610830');
INSERT INTO `region` VALUES ('陕西省', '610000', '榆林市', '610800', '佳县', '610828');
INSERT INTO `region` VALUES ('陕西省', '610000', '铜川市', '610200', '耀州区', '610204');
INSERT INTO `region` VALUES ('陕西省', '610000', '榆林市', '610800', '米脂县', '610827');
INSERT INTO `region` VALUES ('陕西省', '610000', '西安市', '610100', '灞桥区', '610111');
INSERT INTO `region` VALUES ('陕西省', '610000', '延安市', '610600', '洛川县', '610629');
INSERT INTO `region` VALUES ('陕西省', '610000', '延安市', '610600', '安塞区', '610603');
INSERT INTO `region` VALUES ('陕西省', '610000', '榆林市', '610800', '府谷县', '610822');
INSERT INTO `region` VALUES ('陕西省', '610000', '延安市', '610600', '延川县', '610622');
INSERT INTO `region` VALUES ('陕西省', '610000', '铜川市', '610200', '王益区', '610202');
INSERT INTO `region` VALUES ('陕西省', '610000', '榆林市', '610800', '靖边县', '610824');
INSERT INTO `region` VALUES ('陕西省', '610000', '延安市', '610600', '黄龙县', '610631');
INSERT INTO `region` VALUES ('陕西省', '610000', '榆林市', '610800', '吴堡县', '610829');
INSERT INTO `region` VALUES ('四川省', '510000', '广元市', '510800', '苍溪县', '510824');
INSERT INTO `region` VALUES ('四川省', '510000', '巴中市', '511900', '平昌县', '511923');
INSERT INTO `region` VALUES ('四川省', '510000', '广元市', '510800', '剑阁县', '510823');
INSERT INTO `region` VALUES ('四川省', '510000', '广元市', '510800', '青川县', '510822');
INSERT INTO `region` VALUES ('四川省', '510000', '达州市', '511700', '万源市', '511781');
INSERT INTO `region` VALUES ('四川省', '510000', '达州市', '511700', '宣汉县', '511722');
INSERT INTO `region` VALUES ('四川省', '510000', '绵阳市', '510700', '游仙区', '510704');
INSERT INTO `region` VALUES ('四川省', '510000', '绵阳市', '510700', '梓潼县', '510725');
INSERT INTO `region` VALUES ('四川省', '510000', '绵阳市', '510700', '盐亭县', '510723');
INSERT INTO `region` VALUES ('四川省', '510000', '绵阳市', '510700', '安州区', '510705');
INSERT INTO `region` VALUES ('四川省', '510000', '宜宾市', '511500', '叙州区', '511504');
INSERT INTO `region` VALUES ('四川省', '510000', '眉山市', '511400', '仁寿县', '511421');
INSERT INTO `region` VALUES ('四川省', '510000', '凉山彝族自治州', '513400', '会理市', '513402');
INSERT INTO `region` VALUES ('四川省', '510000', '乐山市', '511100', '市中区', '511102');
INSERT INTO `region` VALUES ('四川省', '510000', '自贡市', '510300', '荣县', '510321');
INSERT INTO `region` VALUES ('云南省', '530000', '大理白族自治州', '532900', '南涧彝族自治县', '532926');
INSERT INTO `region` VALUES ('云南省', '530000', '大理白族自治州', '532900', '祥云县', '532923');
INSERT INTO `region` VALUES ('云南省', '530000', '文山壮族苗族自治州', '532600', '文山市', '532601');
INSERT INTO `region` VALUES ('云南省', '530000', '大理白族自治州', '532900', '鹤庆县', '532932');
INSERT INTO `region` VALUES ('云南省', '530000', '大理白族自治州', '532900', '剑川县', '532931');
INSERT INTO `region` VALUES ('云南省', '530000', '大理白族自治州', '532900', '洱源县', '532930');
INSERT INTO `region` VALUES ('云南省', '530000', '临沧市', '530900', '云县', '530922');
INSERT INTO `region` VALUES ('云南省', '530000', '西双版纳傣族自治州', '532800', '勐海县', '532822');
INSERT INTO `region` VALUES ('云南省', '530000', '大理白族自治州', '532900', '漾濞彝族自治县', '532922');
INSERT INTO `region` VALUES ('云南省', '530000', '大理白族自治州', '532900', '弥渡县', '532925');
INSERT INTO `region` VALUES ('云南省', '530000', '大理白族自治州', '532900', '大理市', '532901');
INSERT INTO `region` VALUES ('云南省', '530000', '大理白族自治州', '532900', '巍山彝族回族自治县', '532927');
INSERT INTO `region` VALUES ('云南省', '530000', '临沧市', '530900', '凤庆县', '530921');
INSERT INTO `region` VALUES ('云南省', '530000', '临沧市', '530900', '永德县', '530923');
INSERT INTO `region` VALUES ('云南省', '530000', '临沧市', '530900', '镇康县', '530924');
INSERT INTO `region` VALUES ('云南省', '530000', '临沧市', '530900', '临翔区', '530902');
INSERT INTO `region` VALUES ('云南省', '530000', '临沧市', '530900', '耿马傣族佤族自治县', '530926');
INSERT INTO `region` VALUES ('云南省', '530000', '临沧市', '530900', '双江拉祜族佤族布朗族傣族自治县', '530925');
INSERT INTO `region` VALUES ('云南省', '530000', '临沧市', '530900', '沧源佤族自治县', '530927');
INSERT INTO `region` VALUES ('云南省', '530000', '文山壮族苗族自治州', '532600', '马关县', '532625');
INSERT INTO `region` VALUES ('云南省', '530000', '文山壮族苗族自治州', '532600', '西畴县', '532623');
INSERT INTO `region` VALUES ('云南省', '530000', '文山壮族苗族自治州', '532600', '麻栗坡县', '532624');
INSERT INTO `region` VALUES ('云南省', '530000', '文山壮族苗族自治州', '532600', '砚山县', '532622');
INSERT INTO `region` VALUES ('云南省', '530000', '文山壮族苗族自治州', '532600', '丘北县', '532626');
INSERT INTO `region` VALUES ('云南省', '530000', '文山壮族苗族自治州', '532600', '广南县', '532627');
INSERT INTO `region` VALUES ('云南省', '530000', '文山壮族苗族自治州', '532600', '富宁县', '532628');
INSERT INTO `region` VALUES ('云南省', '530000', '怒江傈僳族自治州', '533300', '兰坪白族普米族自治县', '533325');
INSERT INTO `region` VALUES ('云南省', '530000', '大理白族自治州', '532900', '永平县', '532928');
INSERT INTO `region` VALUES ('河南省', '410000', '鹤壁市', '410600', '鹤山区', '410602');
INSERT INTO `region` VALUES ('河南省', '410000', '鹤壁市', '410600', '山城区', '410603');
INSERT INTO `region` VALUES ('河南省', '410000', '鹤壁市', '410600', '淇滨区', '410611');
INSERT INTO `region` VALUES ('河南省', '410000', '焦作市', '410800', '解放区', '410802');
INSERT INTO `region` VALUES ('河南省', '410000', '焦作市', '410800', '山阳区', '410811');
INSERT INTO `region` VALUES ('河南省', '410000', '焦作市', '410800', '马村区', '410804');
INSERT INTO `region` VALUES ('河南省', '410000', '焦作市', '410800', '中站区', '410803');
INSERT INTO `region` VALUES ('河南省', '410000', '开封市', '410200', '龙亭区', '410202');
INSERT INTO `region` VALUES ('河南省', '410000', '开封市', '410200', '鼓楼区', '410204');
INSERT INTO `region` VALUES ('河南省', '410000', '开封市', '410200', '禹王台区', '410205');
INSERT INTO `region` VALUES ('河南省', '410000', '开封市', '410200', '顺河回族区', '410203');
INSERT INTO `region` VALUES ('河南省', '410000', '漯河市', '411100', '召陵区', '411104');
INSERT INTO `region` VALUES ('河南省', '410000', '南阳市', '411300', '卧龙区', '411303');
INSERT INTO `region` VALUES ('河南省', '410000', '南阳市', '411300', '宛城区', '411302');
INSERT INTO `region` VALUES ('河南省', '410000', '平顶山市', '410400', '新华区', '410402');
INSERT INTO `region` VALUES ('河南省', '410000', '平顶山市', '410400', '卫东区', '410403');
INSERT INTO `region` VALUES ('河南省', '410000', '平顶山市', '410400', '湛河区', '410411');
INSERT INTO `region` VALUES ('河南省', '410000', '三门峡市', '411200', '湖滨区', '411202');
INSERT INTO `region` VALUES ('河南省', '410000', '商丘市', '411400', '梁园区', '411402');
INSERT INTO `region` VALUES ('河南省', '410000', '商丘市', '411400', '睢阳区', '411403');
INSERT INTO `region` VALUES ('河南省', '410000', '济源市', '419001', '济源市', '419001');
INSERT INTO `region` VALUES ('河南省', '410000', '新乡市', '410700', '红旗区', '410702');
INSERT INTO `region` VALUES ('河南省', '410000', '新乡市', '410700', '凤泉区', '410704');
INSERT INTO `region` VALUES ('河南省', '410000', '新乡市', '410700', '牧野区', '410711');
INSERT INTO `region` VALUES ('河南省', '410000', '新乡市', '410700', '卫滨区', '410703');
INSERT INTO `region` VALUES ('河南省', '410000', '信阳市', '411500', '浉河区', '411502');
INSERT INTO `region` VALUES ('河南省', '410000', '信阳市', '411500', '平桥区', '411503');
INSERT INTO `region` VALUES ('河南省', '410000', '郑州市', '410100', '中原区', '410102');
INSERT INTO `region` VALUES ('河南省', '410000', '郑州市', '410100', '金水区', '410105');
INSERT INTO `region` VALUES ('河南省', '410000', '郑州市', '410100', '上街区', '410106');
INSERT INTO `region` VALUES ('河南省', '410000', '郑州市', '410100', '管城回族区', '410104');
INSERT INTO `region` VALUES ('河南省', '410000', '郑州市', '410100', '二七区', '410103');
INSERT INTO `region` VALUES ('河南省', '410000', '郑州市', '410100', '惠济区', '410108');
INSERT INTO `region` VALUES ('河南省', '410000', '安阳市', '410500', '殷都区', '410505');
INSERT INTO `region` VALUES ('河南省', '410000', '安阳市', '410500', '龙安区', '410506');
INSERT INTO `region` VALUES ('河南省', '410000', '安阳市', '410500', '北关区', '410503');
INSERT INTO `region` VALUES ('河南省', '410000', '安阳市', '410500', '文峰区', '410502');
INSERT INTO `region` VALUES ('河南省', '410000', '洛阳市', '410300', '西工区', '410303');
INSERT INTO `region` VALUES ('河南省', '410000', '洛阳市', '410300', '老城区', '410302');
INSERT INTO `region` VALUES ('河南省', '410000', '洛阳市', '410300', '涧西区', '410305');
INSERT INTO `region` VALUES ('河南省', '410000', '洛阳市', '410300', '瀍河回族区', '410304');
INSERT INTO `region` VALUES ('河南省', '410000', '洛阳市', '410300', '洛龙区', '410311');
INSERT INTO `region` VALUES ('贵州省', '520000', '毕节市', '520500', '金沙县', '520523');
INSERT INTO `region` VALUES ('贵州省', '520000', '毕节市', '520500', '黔西市', '520581');
INSERT INTO `region` VALUES ('贵州省', '520000', '毕节市', '520500', '大方县', '520521');
INSERT INTO `region` VALUES ('贵州省', '520000', '毕节市', '520500', '七星关区', '520502');
INSERT INTO `region` VALUES ('贵州省', '520000', '毕节市', '520500', '赫章县', '520527');
INSERT INTO `region` VALUES ('贵州省', '520000', '毕节市', '520500', '威宁彝族回族苗族自治县', '520526');
INSERT INTO `region` VALUES ('贵州省', '520000', '毕节市', '520500', '纳雍县', '520525');
INSERT INTO `region` VALUES ('贵州省', '520000', '毕节市', '520500', '织金县', '520524');
INSERT INTO `region` VALUES ('湖南省', '430000', '岳阳市', '430600', '汨罗市', '430681');
INSERT INTO `region` VALUES ('湖南省', '430000', '湘西土家族苗族自治州', '433100', '花垣县', '433124');
INSERT INTO `region` VALUES ('湖南省', '430000', '湘西土家族苗族自治州', '433100', '吉首市', '433101');
INSERT INTO `region` VALUES ('湖南省', '430000', '常德市', '430700', '安乡县', '430721');
INSERT INTO `region` VALUES ('湖南省', '430000', '娄底市', '431300', '娄星区', '431302');
INSERT INTO `region` VALUES ('湖南省', '430000', '怀化市', '431200', '鹤城区', '431202');
INSERT INTO `region` VALUES ('湖南省', '430000', '常德市', '430700', '武陵区', '430702');
INSERT INTO `region` VALUES ('湖南省', '430000', '怀化市', '431200', '辰溪县', '431223');
INSERT INTO `region` VALUES ('湖南省', '430000', '郴州市', '431000', '桂东县', '431027');
INSERT INTO `region` VALUES ('湖南省', '430000', '郴州市', '431000', '永兴县', '431023');
INSERT INTO `region` VALUES ('湖南省', '430000', '怀化市', '431200', '麻阳苗族自治县', '431226');
INSERT INTO `region` VALUES ('湖南省', '430000', '常德市', '430700', '临澧县', '430724');
INSERT INTO `region` VALUES ('湖南省', '430000', '常德市', '430700', '汉寿县', '430722');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '昆玉市', '659009', '昆玉市', '659009');
INSERT INTO `region` VALUES ('山东省', '370000', '青岛市', '370200', '市南区', '370202');
INSERT INTO `region` VALUES ('湖南省', '430000', '常德市', '430700', '澧县', '430723');
INSERT INTO `region` VALUES ('辽宁省', '210000', '盘锦市', '211100', '大洼区', '211104');
INSERT INTO `region` VALUES ('辽宁省', '210000', '大连市', '210200', '旅顺口区', '210212');
INSERT INTO `region` VALUES ('台湾省', '710000', '嘉义市', '719003', '嘉义市', '719003');
INSERT INTO `region` VALUES ('台湾省', '710000', '桃园市', '710600', '八德市', '710603');
INSERT INTO `region` VALUES ('台湾省', '710000', '台北市', '710100', '大同区', '710103');
INSERT INTO `region` VALUES ('台湾省', '710000', '台中市', '710400', '中区', '710403');
INSERT INTO `region` VALUES ('台湾省', '710000', '新北市', '710300', '深坑区', '710307');
INSERT INTO `region` VALUES ('台湾省', '710000', '新北市', '710300', '三重区', '710310');
INSERT INTO `region` VALUES ('台湾省', '710000', '台中市', '710400', '南屯区', '710404');
INSERT INTO `region` VALUES ('台湾省', '710000', '台南市', '710500', '盐水区', '710509');
INSERT INTO `region` VALUES ('台湾省', '710000', '桃园市', '710600', '复兴乡', '710606');
INSERT INTO `region` VALUES ('台湾省', '710000', '新北市', '710300', '永和区', '710313');
INSERT INTO `region` VALUES ('台湾省', '710000', '新北市', '710300', '泰山区', '710314');
INSERT INTO `region` VALUES ('台湾省', '710000', '高雄市', '710200', '湖内区', '710223');
INSERT INTO `region` VALUES ('台湾省', '710000', '桃园市', '710600', '龙潭乡', '710609');
INSERT INTO `region` VALUES ('台湾省', '710000', '高雄市', '710200', '内门区', '710226');
INSERT INTO `region` VALUES ('台湾省', '710000', '台南市', '710500', '东区', '710526');
INSERT INTO `region` VALUES ('台湾省', '710000', '高雄市', '710200', '桃源区', '710233');
INSERT INTO `region` VALUES ('台湾省', '710000', '新北市', '710300', '新店区', '710322');
INSERT INTO `region` VALUES ('台湾省', '710000', '台北市', '710100', '大安区', '710112');
INSERT INTO `region` VALUES ('台湾省', '710000', '新北市', '710300', '坪林区', '710304');
INSERT INTO `region` VALUES ('台湾省', '710000', '新北市', '710300', '双溪区', '710319');
INSERT INTO `region` VALUES ('台湾省', '710000', '新北市', '710300', '平溪区', '710311');
INSERT INTO `region` VALUES ('台湾省', '710000', '台中市', '710400', '外埔区', '710427');
INSERT INTO `region` VALUES ('台湾省', '710000', '台中市', '710400', '石冈区', '710416');
INSERT INTO `region` VALUES ('台湾省', '710000', '台中市', '710400', '和平区', '710421');
INSERT INTO `region` VALUES ('台湾省', '710000', '台中市', '710400', '新社区', '710402');
INSERT INTO `region` VALUES ('台湾省', '710000', '台中市', '710400', '太平区', '710413');
INSERT INTO `region` VALUES ('台湾省', '710000', '台中市', '710400', '潭子区', '710425');
INSERT INTO `region` VALUES ('台湾省', '710000', '台中市', '710400', '北区', '710417');
INSERT INTO `region` VALUES ('台湾省', '710000', '台中市', '710400', '东区', '710401');
INSERT INTO `region` VALUES ('台湾省', '710000', '台中市', '710400', '南区', '710411');
INSERT INTO `region` VALUES ('台湾省', '710000', '台中市', '710400', '大肚区', '710426');
INSERT INTO `region` VALUES ('台湾省', '710000', '台中市', '710400', '沙鹿区', '710406');
INSERT INTO `region` VALUES ('台湾省', '710000', '台中市', '710400', '大雅区', '710415');
INSERT INTO `region` VALUES ('台湾省', '710000', '台中市', '710400', '大里区', '710408');
INSERT INTO `region` VALUES ('台湾省', '710000', '台中市', '710400', '东势区', '710420');
INSERT INTO `region` VALUES ('台湾省', '710000', '台中市', '710400', '后里区', '710424');
INSERT INTO `region` VALUES ('台湾省', '710000', '台中市', '710400', '西区', '710410');
INSERT INTO `region` VALUES ('台湾省', '710000', '台中市', '710400', '丰原区', '710407');
INSERT INTO `region` VALUES ('台湾省', '710000', '台中市', '710400', '雾峰区', '710422');
INSERT INTO `region` VALUES ('台湾省', '710000', '台中市', '710400', '神冈区', '710405');
INSERT INTO `region` VALUES ('台湾省', '710000', '新北市', '710300', '乌来区', '710323');
INSERT INTO `region` VALUES ('台湾省', '710000', '新北市', '710300', '石碇区', '710316');
INSERT INTO `region` VALUES ('台湾省', '710000', '台北市', '710100', '北投区', '710101');
INSERT INTO `region` VALUES ('台湾省', '710000', '新北市', '710300', '汐止区', '710306');
INSERT INTO `region` VALUES ('台湾省', '710000', '新北市', '710300', '莺歌区', '710305');
INSERT INTO `region` VALUES ('台湾省', '710000', '新北市', '710300', '三峡区', '710302');
INSERT INTO `region` VALUES ('台湾省', '710000', '新北市', '710300', '新庄区', '710303');
INSERT INTO `region` VALUES ('台湾省', '710000', '新北市', '710300', '树林区', '710320');
INSERT INTO `region` VALUES ('台湾省', '710000', '台北市', '710100', '中山区', '710109');
INSERT INTO `region` VALUES ('台湾省', '710000', '台北市', '710100', '信义区', '710105');
INSERT INTO `region` VALUES ('台湾省', '710000', '台北市', '710100', '文山区', '710104');
INSERT INTO `region` VALUES ('台湾省', '710000', '台北市', '710100', '南港区', '710111');
INSERT INTO `region` VALUES ('台湾省', '710000', '新北市', '710300', '芦洲区', '710308');
INSERT INTO `region` VALUES ('台湾省', '710000', '桃园市', '710600', '桃园区', '710604');
INSERT INTO `region` VALUES ('台湾省', '710000', '桃园市', '710600', '龟山乡', '710605');
INSERT INTO `region` VALUES ('台湾省', '710000', '新竹市', '719002', '新竹市', '719002');
INSERT INTO `region` VALUES ('台湾省', '710000', '新北市', '710300', '土城区', '710315');
INSERT INTO `region` VALUES ('台湾省', '710000', '台北市', '710100', '中正区', '710107');
INSERT INTO `region` VALUES ('台湾省', '710000', '台北市', '710100', '万华区', '710108');
INSERT INTO `region` VALUES ('台湾省', '710000', '新北市', '710300', '五股区', '710317');
INSERT INTO `region` VALUES ('台湾省', '710000', '高雄市', '710200', '凤山区', '710217');
INSERT INTO `region` VALUES ('台湾省', '710000', '高雄市', '710200', '前金区', '710230');
INSERT INTO `region` VALUES ('台湾省', '710000', '高雄市', '710200', '新兴区', '710238');
INSERT INTO `region` VALUES ('台湾省', '710000', '高雄市', '710200', '三民区', '710229');
INSERT INTO `region` VALUES ('台湾省', '710000', '高雄市', '710200', '鸟松区', '710211');
INSERT INTO `region` VALUES ('台湾省', '710000', '高雄市', '710200', '大寮区', '710203');
INSERT INTO `region` VALUES ('台湾省', '710000', '高雄市', '710200', '仁武区', '710216');
INSERT INTO `region` VALUES ('台湾省', '710000', '高雄市', '710200', '大社区', '710220');
INSERT INTO `region` VALUES ('台湾省', '710000', '高雄市', '710200', '冈山区', '710231');
INSERT INTO `region` VALUES ('台湾省', '710000', '高雄市', '710200', '桥头区', '710213');
INSERT INTO `region` VALUES ('台湾省', '710000', '高雄市', '710200', '燕巢区', '710207');
INSERT INTO `region` VALUES ('台湾省', '710000', '高雄市', '710200', '大树区', '710208');
INSERT INTO `region` VALUES ('台湾省', '710000', '高雄市', '710200', '路竹区', '710237');
INSERT INTO `region` VALUES ('台湾省', '710000', '高雄市', '710200', '阿莲区', '710209');
INSERT INTO `region` VALUES ('台湾省', '710000', '高雄市', '710200', '田寮区', '710232');
INSERT INTO `region` VALUES ('台湾省', '710000', '台南市', '710500', '中西区', '710528');
INSERT INTO `region` VALUES ('台湾省', '710000', '台南市', '710500', '仁德区', '710513');
INSERT INTO `region` VALUES ('台湾省', '710000', '台南市', '710500', '北区', '710529');
INSERT INTO `region` VALUES ('台湾省', '710000', '台南市', '710500', '永康区', '710506');
INSERT INTO `region` VALUES ('台湾省', '710000', '台南市', '710500', '归仁区', '710510');
INSERT INTO `region` VALUES ('台湾省', '710000', '台南市', '710500', '关庙区', '710512');
INSERT INTO `region` VALUES ('台湾省', '710000', '台南市', '710500', '龙崎区', '710511');
INSERT INTO `region` VALUES ('台湾省', '710000', '台南市', '710500', '新化区', '710518');
INSERT INTO `region` VALUES ('台湾省', '710000', '台南市', '710500', '左镇区', '710532');
INSERT INTO `region` VALUES ('台湾省', '710000', '台南市', '710500', '南化区', '710531');
INSERT INTO `region` VALUES ('台湾省', '710000', '台南市', '710500', '玉井区', '710524');
INSERT INTO `region` VALUES ('台湾省', '710000', '台南市', '710500', '山上区', '710505');
INSERT INTO `region` VALUES ('台湾省', '710000', '台南市', '710500', '楠西区', '710530');
INSERT INTO `region` VALUES ('台湾省', '710000', '台南市', '710500', '新市区', '710516');
INSERT INTO `region` VALUES ('台湾省', '710000', '台南市', '710500', '安定区', '710501');
INSERT INTO `region` VALUES ('台湾省', '710000', '台南市', '710500', '西港区', '710519');
INSERT INTO `region` VALUES ('台湾省', '710000', '台南市', '710500', '佳里区', '710517');
INSERT INTO `region` VALUES ('台湾省', '710000', '台南市', '710500', '大内区', '710502');
INSERT INTO `region` VALUES ('台湾省', '710000', '台南市', '710500', '善化区', '710515');
INSERT INTO `region` VALUES ('台湾省', '710000', '台南市', '710500', '官田区', '710525');
INSERT INTO `region` VALUES ('台湾省', '710000', '台南市', '710500', '六甲区', '710527');
INSERT INTO `region` VALUES ('台湾省', '710000', '台南市', '710500', '东山区', '710503');
INSERT INTO `region` VALUES ('台湾省', '710000', '台南市', '710500', '柳营区', '710523');
INSERT INTO `region` VALUES ('台湾省', '710000', '台南市', '710500', '白河区', '710508');
INSERT INTO `region` VALUES ('台湾省', '710000', '台南市', '710500', '后壁区', '710522');
INSERT INTO `region` VALUES ('台湾省', '710000', '台南市', '710500', '新营区', '710507');
INSERT INTO `region` VALUES ('台湾省', '710000', '台南市', '710500', '下营区', '710504');
INSERT INTO `region` VALUES ('台湾省', '710000', '台南市', '710500', '麻豆区', '710520');
INSERT INTO `region` VALUES ('台湾省', '710000', '台南市', '710500', '学甲区', '710514');
INSERT INTO `region` VALUES ('台湾省', '710000', '高雄市', '710200', '旗山区', '710235');
INSERT INTO `region` VALUES ('台湾省', '710000', '高雄市', '710200', '美浓区', '710215');
INSERT INTO `region` VALUES ('台湾省', '710000', '高雄市', '710200', '杉林区', '710228');
INSERT INTO `region` VALUES ('台湾省', '710000', '高雄市', '710200', '茂林区', '710222');
INSERT INTO `region` VALUES ('台湾省', '710000', '高雄市', '710200', '甲仙区', '710218');
INSERT INTO `region` VALUES ('台湾省', '710000', '高雄市', '710200', '六龟区', '710224');
INSERT INTO `region` VALUES ('台湾省', '710000', '高雄市', '710200', '那玛夏区', '710204');
INSERT INTO `region` VALUES ('台湾省', '710000', '台中市', '710400', '北屯区', '710414');
INSERT INTO `region` VALUES ('台湾省', '710000', '台中市', '710400', '西屯区', '710412');
INSERT INTO `region` VALUES ('台湾省', '710000', '台北市', '710100', '士林区', '710110');
INSERT INTO `region` VALUES ('台湾省', '710000', '桃园市', '710600', '中坜市', '710613');
INSERT INTO `region` VALUES ('台湾省', '710000', '桃园市', '710600', '杨梅市', '710602');
INSERT INTO `region` VALUES ('台湾省', '710000', '桃园市', '710600', '平镇市', '710601');
INSERT INTO `region` VALUES ('台湾省', '710000', '桃园市', '710600', '大溪镇', '710610');
INSERT INTO `region` VALUES ('台湾省', '710000', '新北市', '710300', '中和区', '710312');
INSERT INTO `region` VALUES ('台湾省', '710000', '新北市', '710300', '板桥区', '710321');
INSERT INTO `region` VALUES ('台湾省', '710000', '台北市', '710100', '内湖区', '710106');
INSERT INTO `region` VALUES ('台湾省', '710000', '嘉义县', '719010', '嘉义县', '719010');
INSERT INTO `region` VALUES ('台湾省', '710000', '云林县', '719008', '云林县', '719008');
INSERT INTO `region` VALUES ('台湾省', '710000', '屏东县', '719011', '屏东县', '719011');
INSERT INTO `region` VALUES ('台湾省', '710000', '南投县', '719009', '南投县', '719009');
INSERT INTO `region` VALUES ('台湾省', '710000', '花莲县', '719013', '花莲县', '719013');
INSERT INTO `region` VALUES ('台湾省', '710000', '彰化县', '719007', '彰化县', '719007');
INSERT INTO `region` VALUES ('台湾省', '710000', '台东县', '719012', '台东县', '719012');
INSERT INTO `region` VALUES ('台湾省', '710000', '宜兰县', '719005', '宜兰县', '719005');
INSERT INTO `region` VALUES ('台湾省', '710000', '苗栗县', '719006', '苗栗县', '719006');
INSERT INTO `region` VALUES ('台湾省', '710000', '新竹县', '719004', '新竹县', '719004');
INSERT INTO `region` VALUES ('台湾省', '710000', '台中市', '710400', '乌日区', '710423');
INSERT INTO `region` VALUES ('青海省', '630000', '玉树藏族自治州', '632700', '治多县', '632724');
INSERT INTO `region` VALUES ('青海省', '630000', '玉树藏族自治州', '632700', '曲麻莱县', '632726');
INSERT INTO `region` VALUES ('辽宁省', '210000', '沈阳市', '210100', '康平县', '210123');
INSERT INTO `region` VALUES ('湖南省', '430000', '怀化市', '431200', '沅陵县', '431222');
INSERT INTO `region` VALUES ('湖南省', '430000', '常德市', '430700', '鼎城区', '430703');
INSERT INTO `region` VALUES ('湖南省', '430000', '常德市', '430700', '津市市', '430781');
INSERT INTO `region` VALUES ('湖南省', '430000', '郴州市', '431000', '安仁县', '431028');
INSERT INTO `region` VALUES ('湖南省', '430000', '郴州市', '431000', '北湖区', '431002');
INSERT INTO `region` VALUES ('湖南省', '430000', '郴州市', '431000', '汝城县', '431026');
INSERT INTO `region` VALUES ('湖南省', '430000', '常德市', '430700', '石门县', '430726');
INSERT INTO `region` VALUES ('湖南省', '430000', '郴州市', '431000', '苏仙区', '431003');
INSERT INTO `region` VALUES ('湖南省', '430000', '郴州市', '431000', '资兴市', '431081');
INSERT INTO `region` VALUES ('湖南省', '430000', '永州市', '431100', '道县', '431124');
INSERT INTO `region` VALUES ('湖南省', '430000', '永州市', '431100', '宁远县', '431126');
INSERT INTO `region` VALUES ('湖南省', '430000', '永州市', '431100', '双牌县', '431123');
INSERT INTO `region` VALUES ('湖南省', '430000', '永州市', '431100', '江永县', '431125');
INSERT INTO `region` VALUES ('湖南省', '430000', '永州市', '431100', '祁阳市', '431181');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '包头市', '150200', '青山区', '150204');
INSERT INTO `region` VALUES ('甘肃省', '620000', '武威市', '620600', '天祝藏族自治县', '620623');
INSERT INTO `region` VALUES ('河北省', '130000', '邯郸市', '130400', '肥乡区', '130407');
INSERT INTO `region` VALUES ('山东省', '370000', '青岛市', '370200', '城阳区', '370214');
INSERT INTO `region` VALUES ('吉林省', '220000', '松原市', '220700', '乾安县', '220723');
INSERT INTO `region` VALUES ('吉林省', '220000', '白城市', '220800', '镇赉县', '220821');
INSERT INTO `region` VALUES ('青海省', '630000', '海西蒙古族藏族自治州', '632800', '茫崖市', '632803');
INSERT INTO `region` VALUES ('湖南省', '430000', '长沙市', '430100', '开福区', '430105');
INSERT INTO `region` VALUES ('云南省', '530000', '怒江傈僳族自治州', '533300', '泸水市', '533301');
INSERT INTO `region` VALUES ('江苏省', '320000', '苏州市', '320500', '昆山市', '320583');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '呼伦贝尔市', '150700', '鄂伦春自治旗', '150723');
INSERT INTO `region` VALUES ('湖南省', '430000', '张家界市', '430800', '慈利县', '430821');
INSERT INTO `region` VALUES ('湖南省', '430000', '张家界市', '430800', '桑植县', '430822');
INSERT INTO `region` VALUES ('湖南省', '430000', '张家界市', '430800', '武陵源区', '430811');
INSERT INTO `region` VALUES ('湖南省', '430000', '张家界市', '430800', '永定区', '430802');
INSERT INTO `region` VALUES ('河南省', '410000', '驻马店市', '411700', '汝南县', '411727');
INSERT INTO `region` VALUES ('河南省', '410000', '驻马店市', '411700', '驿城区', '411702');
INSERT INTO `region` VALUES ('河南省', '410000', '驻马店市', '411700', '遂平县', '411728');
INSERT INTO `region` VALUES ('河南省', '410000', '驻马店市', '411700', '平舆县', '411723');
INSERT INTO `region` VALUES ('江苏省', '320000', '常州市', '320400', '钟楼区', '320404');
INSERT INTO `region` VALUES ('江苏省', '320000', '常州市', '320400', '溧阳市', '320481');
INSERT INTO `region` VALUES ('江苏省', '320000', '常州市', '320400', '天宁区', '320402');
INSERT INTO `region` VALUES ('江苏省', '320000', '常州市', '320400', '武进区', '320412');
INSERT INTO `region` VALUES ('江苏省', '320000', '常州市', '320400', '新北区', '320411');
INSERT INTO `region` VALUES ('江苏省', '320000', '徐州市', '320300', '丰县', '320321');
INSERT INTO `region` VALUES ('江苏省', '320000', '徐州市', '320300', '云龙区', '320303');
INSERT INTO `region` VALUES ('江苏省', '320000', '徐州市', '320300', '新沂市', '320381');
INSERT INTO `region` VALUES ('江苏省', '320000', '徐州市', '320300', '邳州市', '320382');
INSERT INTO `region` VALUES ('江苏省', '320000', '徐州市', '320300', '泉山区', '320311');
INSERT INTO `region` VALUES ('江苏省', '320000', '徐州市', '320300', '贾汪区', '320305');
INSERT INTO `region` VALUES ('江苏省', '320000', '徐州市', '320300', '沛县', '320322');
INSERT INTO `region` VALUES ('江苏省', '320000', '徐州市', '320300', '睢宁县', '320324');
INSERT INTO `region` VALUES ('江苏省', '320000', '徐州市', '320300', '铜山区', '320312');
INSERT INTO `region` VALUES ('河南省', '410000', '南阳市', '411300', '社旗县', '411327');
INSERT INTO `region` VALUES ('河南省', '410000', '南阳市', '411300', '唐河县', '411328');
INSERT INTO `region` VALUES ('江苏省', '320000', '淮安市', '320800', '清江浦区', '320812');
INSERT INTO `region` VALUES ('江苏省', '320000', '淮安市', '320800', '盱眙县', '320830');
INSERT INTO `region` VALUES ('江苏省', '320000', '淮安市', '320800', '洪泽区', '320813');
INSERT INTO `region` VALUES ('江苏省', '320000', '淮安市', '320800', '淮安区', '320803');
INSERT INTO `region` VALUES ('江苏省', '320000', '淮安市', '320800', '淮阴区', '320804');
INSERT INTO `region` VALUES ('江苏省', '320000', '淮安市', '320800', '金湖县', '320831');
INSERT INTO `region` VALUES ('江苏省', '320000', '淮安市', '320800', '涟水县', '320826');
INSERT INTO `region` VALUES ('江苏省', '320000', '扬州市', '321000', '高邮市', '321084');
INSERT INTO `region` VALUES ('江苏省', '320000', '扬州市', '321000', '宝应县', '321023');
INSERT INTO `region` VALUES ('江苏省', '320000', '盐城市', '320900', '建湖县', '320925');
INSERT INTO `region` VALUES ('江苏省', '320000', '盐城市', '320900', '阜宁县', '320923');
INSERT INTO `region` VALUES ('江苏省', '320000', '盐城市', '320900', '滨海县', '320922');
INSERT INTO `region` VALUES ('江苏省', '320000', '盐城市', '320900', '响水县', '320921');
INSERT INTO `region` VALUES ('江苏省', '320000', '连云港市', '320700', '灌云县', '320723');
INSERT INTO `region` VALUES ('江苏省', '320000', '连云港市', '320700', '灌南县', '320724');
INSERT INTO `region` VALUES ('江苏省', '320000', '连云港市', '320700', '赣榆区', '320707');
INSERT INTO `region` VALUES ('江苏省', '320000', '连云港市', '320700', '东海县', '320722');
INSERT INTO `region` VALUES ('江苏省', '320000', '连云港市', '320700', '连云区', '320703');
INSERT INTO `region` VALUES ('江苏省', '320000', '连云港市', '320700', '海州区', '320706');
INSERT INTO `region` VALUES ('江苏省', '320000', '宿迁市', '321300', '泗洪县', '321324');
INSERT INTO `region` VALUES ('江苏省', '320000', '宿迁市', '321300', '泗阳县', '321323');
INSERT INTO `region` VALUES ('江苏省', '320000', '宿迁市', '321300', '宿城区', '321302');
INSERT INTO `region` VALUES ('江苏省', '320000', '宿迁市', '321300', '宿豫区', '321311');
INSERT INTO `region` VALUES ('江苏省', '320000', '宿迁市', '321300', '沭阳县', '321322');
INSERT INTO `region` VALUES ('江苏省', '320000', '盐城市', '320900', '射阳县', '320924');
INSERT INTO `region` VALUES ('江苏省', '320000', '盐城市', '320900', '亭湖区', '320902');
INSERT INTO `region` VALUES ('江苏省', '320000', '盐城市', '320900', '盐都区', '320903');
INSERT INTO `region` VALUES ('辽宁省', '210000', '阜新市', '210900', '海州区', '210902');
INSERT INTO `region` VALUES ('江苏省', '320000', '南京市', '320100', '江宁区', '320115');
INSERT INTO `region` VALUES ('江苏省', '320000', '南京市', '320100', '鼓楼区', '320106');
INSERT INTO `region` VALUES ('江苏省', '320000', '南京市', '320100', '建邺区', '320105');
INSERT INTO `region` VALUES ('江苏省', '320000', '南京市', '320100', '六合区', '320116');
INSERT INTO `region` VALUES ('江苏省', '320000', '南京市', '320100', '浦口区', '320111');
INSERT INTO `region` VALUES ('江苏省', '320000', '南京市', '320100', '溧水区', '320117');
INSERT INTO `region` VALUES ('江苏省', '320000', '南京市', '320100', '高淳区', '320118');
INSERT INTO `region` VALUES ('江苏省', '320000', '扬州市', '321000', '邗江区', '321003');
INSERT INTO `region` VALUES ('江苏省', '320000', '扬州市', '321000', '江都区', '321012');
INSERT INTO `region` VALUES ('江苏省', '320000', '扬州市', '321000', '仪征市', '321081');
INSERT INTO `region` VALUES ('江苏省', '320000', '镇江市', '321100', '句容市', '321183');
INSERT INTO `region` VALUES ('江苏省', '320000', '镇江市', '321100', '丹徒区', '321112');
INSERT INTO `region` VALUES ('江苏省', '320000', '镇江市', '321100', '丹阳市', '321181');
INSERT INTO `region` VALUES ('江苏省', '320000', '镇江市', '321100', '京口区', '321102');
INSERT INTO `region` VALUES ('江苏省', '320000', '镇江市', '321100', '润州区', '321111');
INSERT INTO `region` VALUES ('江苏省', '320000', '镇江市', '321100', '扬中市', '321182');
INSERT INTO `region` VALUES ('江苏省', '320000', '南京市', '320100', '栖霞区', '320113');
INSERT INTO `region` VALUES ('江苏省', '320000', '南京市', '320100', '玄武区', '320102');
INSERT INTO `region` VALUES ('江苏省', '320000', '南京市', '320100', '秦淮区', '320104');
INSERT INTO `region` VALUES ('江苏省', '320000', '南京市', '320100', '雨花台区', '320114');
INSERT INTO `region` VALUES ('江苏省', '320000', '扬州市', '321000', '广陵区', '321002');
INSERT INTO `region` VALUES ('江苏省', '320000', '泰州市', '321200', '高港区', '321203');
INSERT INTO `region` VALUES ('江苏省', '320000', '泰州市', '321200', '靖江市', '321282');
INSERT INTO `region` VALUES ('江苏省', '320000', '泰州市', '321200', '泰兴市', '321283');
INSERT INTO `region` VALUES ('江苏省', '320000', '泰州市', '321200', '兴化市', '321281');
INSERT INTO `region` VALUES ('江苏省', '320000', '泰州市', '321200', '海陵区', '321202');
INSERT INTO `region` VALUES ('江苏省', '320000', '泰州市', '321200', '姜堰区', '321204');
INSERT INTO `region` VALUES ('江苏省', '320000', '盐城市', '320900', '大丰区', '320904');
INSERT INTO `region` VALUES ('江苏省', '320000', '盐城市', '320900', '东台市', '320981');
INSERT INTO `region` VALUES ('江苏省', '320000', '南通市', '320600', '崇川区', '320613');
INSERT INTO `region` VALUES ('江苏省', '320000', '南通市', '320600', '海安市', '320685');
INSERT INTO `region` VALUES ('江苏省', '320000', '南通市', '320600', '海门区', '320614');
INSERT INTO `region` VALUES ('江苏省', '320000', '南通市', '320600', '启东市', '320681');
INSERT INTO `region` VALUES ('江苏省', '320000', '南通市', '320600', '如东县', '320623');
INSERT INTO `region` VALUES ('江苏省', '320000', '南通市', '320600', '如皋市', '320682');
INSERT INTO `region` VALUES ('江苏省', '320000', '南通市', '320600', '通州区', '320612');
INSERT INTO `region` VALUES ('江苏省', '320000', '苏州市', '320500', '常熟市', '320581');
INSERT INTO `region` VALUES ('江苏省', '320000', '苏州市', '320500', '太仓市', '320585');
INSERT INTO `region` VALUES ('江苏省', '320000', '苏州市', '320500', '吴中区', '320506');
INSERT INTO `region` VALUES ('江苏省', '320000', '苏州市', '320500', '虎丘区', '320505');
INSERT INTO `region` VALUES ('江苏省', '320000', '苏州市', '320500', '姑苏区', '320508');
INSERT INTO `region` VALUES ('江苏省', '320000', '苏州市', '320500', '相城区', '320507');
INSERT INTO `region` VALUES ('江苏省', '320000', '苏州市', '320500', '张家港市', '320582');
INSERT INTO `region` VALUES ('江苏省', '320000', '无锡市', '320200', '滨湖区', '320211');
INSERT INTO `region` VALUES ('江苏省', '320000', '无锡市', '320200', '梁溪区', '320213');
INSERT INTO `region` VALUES ('江苏省', '320000', '无锡市', '320200', '锡山区', '320205');
INSERT INTO `region` VALUES ('江苏省', '320000', '无锡市', '320200', '宜兴市', '320282');
INSERT INTO `region` VALUES ('江苏省', '320000', '无锡市', '320200', '惠山区', '320206');
INSERT INTO `region` VALUES ('江苏省', '320000', '苏州市', '320500', '吴江区', '320509');
INSERT INTO `region` VALUES ('江苏省', '320000', '常州市', '320400', '金坛区', '320413');
INSERT INTO `region` VALUES ('湖南省', '430000', '娄底市', '431300', '涟源市', '431382');
INSERT INTO `region` VALUES ('湖南省', '430000', '娄底市', '431300', '双峰县', '431321');
INSERT INTO `region` VALUES ('湖南省', '430000', '娄底市', '431300', '新化县', '431322');
INSERT INTO `region` VALUES ('河南省', '410000', '郑州市', '410100', '荥阳市', '410182');
INSERT INTO `region` VALUES ('河南省', '410000', '焦作市', '410800', '博爱县', '410822');
INSERT INTO `region` VALUES ('河南省', '410000', '焦作市', '410800', '沁阳市', '410882');
INSERT INTO `region` VALUES ('河南省', '410000', '焦作市', '410800', '温县', '410825');
INSERT INTO `region` VALUES ('河南省', '410000', '焦作市', '410800', '武陟县', '410823');
INSERT INTO `region` VALUES ('河南省', '410000', '焦作市', '410800', '孟州市', '410883');
INSERT INTO `region` VALUES ('河南省', '410000', '新乡市', '410700', '原阳县', '410725');
INSERT INTO `region` VALUES ('河南省', '410000', '漯河市', '411100', '临颍县', '411122');
INSERT INTO `region` VALUES ('河南省', '410000', '漯河市', '411100', '舞阳县', '411121');
INSERT INTO `region` VALUES ('河南省', '410000', '漯河市', '411100', '源汇区', '411102');
INSERT INTO `region` VALUES ('河南省', '410000', '漯河市', '411100', '郾城区', '411103');
INSERT INTO `region` VALUES ('湖南省', '430000', '怀化市', '431200', '洪江市', '431281');
INSERT INTO `region` VALUES ('湖南省', '430000', '怀化市', '431200', '会同县', '431225');
INSERT INTO `region` VALUES ('湖南省', '430000', '怀化市', '431200', '新晃侗族自治县', '431227');
INSERT INTO `region` VALUES ('湖南省', '430000', '怀化市', '431200', '溆浦县', '431224');
INSERT INTO `region` VALUES ('湖南省', '430000', '怀化市', '431200', '中方县', '431221');
INSERT INTO `region` VALUES ('湖南省', '430000', '岳阳市', '430600', '华容县', '430623');
INSERT INTO `region` VALUES ('湖南省', '430000', '岳阳市', '430600', '平江县', '430626');
INSERT INTO `region` VALUES ('湖南省', '430000', '湘西土家族苗族自治州', '433100', '龙山县', '433130');
INSERT INTO `region` VALUES ('湖南省', '430000', '湘西土家族苗族自治州', '433100', '永顺县', '433127');
INSERT INTO `region` VALUES ('河南省', '410000', '郑州市', '410100', '中牟县', '410122');
INSERT INTO `region` VALUES ('河南省', '410000', '开封市', '410200', '祥符区', '410212');
INSERT INTO `region` VALUES ('河南省', '410000', '新乡市', '410700', '封丘县', '410727');
INSERT INTO `region` VALUES ('河南省', '410000', '开封市', '410200', '尉氏县', '410223');
INSERT INTO `region` VALUES ('河南省', '410000', '开封市', '410200', '通许县', '410222');
INSERT INTO `region` VALUES ('河南省', '410000', '周口市', '411600', '扶沟县', '411621');
INSERT INTO `region` VALUES ('河南省', '410000', '许昌市', '411000', '鄢陵县', '411024');
INSERT INTO `region` VALUES ('河南省', '410000', '许昌市', '411000', '长葛市', '411082');
INSERT INTO `region` VALUES ('河南省', '410000', '开封市', '410200', '杞县', '410221');
INSERT INTO `region` VALUES ('河南省', '410000', '开封市', '410200', '兰考县', '410225');
INSERT INTO `region` VALUES ('河南省', '410000', '新乡市', '410700', '长垣市', '410783');
INSERT INTO `region` VALUES ('河南省', '410000', '商丘市', '411400', '民权县', '411421');
INSERT INTO `region` VALUES ('河南省', '410000', '洛阳市', '410300', '伊川县', '410329');
INSERT INTO `region` VALUES ('河南省', '410000', '洛阳市', '410300', '汝阳县', '410326');
INSERT INTO `region` VALUES ('山东省', '370000', '青岛市', '370200', '崂山区', '370212');
INSERT INTO `region` VALUES ('河南省', '410000', '平顶山市', '410400', '汝州市', '410482');
INSERT INTO `region` VALUES ('河南省', '410000', '洛阳市', '410300', '嵩县', '410325');
INSERT INTO `region` VALUES ('河南省', '410000', '洛阳市', '410300', '栾川县', '410324');
INSERT INTO `region` VALUES ('河南省', '410000', '洛阳市', '410300', '洛宁县', '410328');
INSERT INTO `region` VALUES ('河南省', '410000', '洛阳市', '410300', '宜阳县', '410327');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '博尔塔拉蒙古自治州', '652700', '阿拉山口市', '652702');
INSERT INTO `region` VALUES ('河南省', '410000', '焦作市', '410800', '修武县', '410821');
INSERT INTO `region` VALUES ('河南省', '410000', '新乡市', '410700', '获嘉县', '410724');
INSERT INTO `region` VALUES ('河南省', '410000', '新乡市', '410700', '辉县市', '410782');
INSERT INTO `region` VALUES ('河南省', '410000', '新乡市', '410700', '新乡县', '410721');
INSERT INTO `region` VALUES ('河南省', '410000', '新乡市', '410700', '延津县', '410726');
INSERT INTO `region` VALUES ('河南省', '410000', '安阳市', '410500', '滑县', '410526');
INSERT INTO `region` VALUES ('河南省', '410000', '鹤壁市', '410600', '浚县', '410621');
INSERT INTO `region` VALUES ('河南省', '410000', '鹤壁市', '410600', '淇县', '410622');
INSERT INTO `region` VALUES ('河南省', '410000', '安阳市', '410500', '林州市', '410581');
INSERT INTO `region` VALUES ('河南省', '410000', '安阳市', '410500', '安阳县', '410522');
INSERT INTO `region` VALUES ('河南省', '410000', '洛阳市', '410300', '偃师区', '410307');
INSERT INTO `region` VALUES ('河南省', '410000', '洛阳市', '410300', '孟津区', '410308');
INSERT INTO `region` VALUES ('河南省', '410000', '洛阳市', '410300', '新安县', '410323');
INSERT INTO `region` VALUES ('河南省', '410000', '三门峡市', '411200', '渑池县', '411221');
INSERT INTO `region` VALUES ('河南省', '410000', '三门峡市', '411200', '陕州区', '411203');
INSERT INTO `region` VALUES ('河南省', '410000', '三门峡市', '411200', '卢氏县', '411224');
INSERT INTO `region` VALUES ('河南省', '410000', '三门峡市', '411200', '灵宝市', '411282');
INSERT INTO `region` VALUES ('河南省', '410000', '南阳市', '411300', '内乡县', '411325');
INSERT INTO `region` VALUES ('河南省', '410000', '南阳市', '411300', '南召县', '411321');
INSERT INTO `region` VALUES ('河南省', '410000', '南阳市', '411300', '新野县', '411329');
INSERT INTO `region` VALUES ('河南省', '410000', '南阳市', '411300', '方城县', '411322');
INSERT INTO `region` VALUES ('河南省', '410000', '南阳市', '411300', '桐柏县', '411330');
INSERT INTO `region` VALUES ('河南省', '410000', '南阳市', '411300', '淅川县', '411326');
INSERT INTO `region` VALUES ('河南省', '410000', '南阳市', '411300', '西峡县', '411323');
INSERT INTO `region` VALUES ('河南省', '410000', '南阳市', '411300', '邓州市', '411381');
INSERT INTO `region` VALUES ('河南省', '410000', '南阳市', '411300', '镇平县', '411324');
INSERT INTO `region` VALUES ('河南省', '410000', '信阳市', '411500', '光山县', '411522');
INSERT INTO `region` VALUES ('河南省', '410000', '信阳市', '411500', '潢川县', '411526');
INSERT INTO `region` VALUES ('河南省', '410000', '信阳市', '411500', '固始县', '411525');
INSERT INTO `region` VALUES ('河南省', '410000', '信阳市', '411500', '淮滨县', '411527');
INSERT INTO `region` VALUES ('河南省', '410000', '信阳市', '411500', '息县', '411528');
INSERT INTO `region` VALUES ('河南省', '410000', '驻马店市', '411700', '正阳县', '411724');
INSERT INTO `region` VALUES ('河南省', '410000', '信阳市', '411500', '罗山县', '411521');
INSERT INTO `region` VALUES ('河南省', '410000', '信阳市', '411500', '新县', '411523');
INSERT INTO `region` VALUES ('河南省', '410000', '信阳市', '411500', '商城县', '411524');
INSERT INTO `region` VALUES ('湖南省', '430000', '常德市', '430700', '桃源县', '430725');
INSERT INTO `region` VALUES ('河南省', '410000', '三门峡市', '411200', '义马市', '411281');
INSERT INTO `region` VALUES ('河南省', '410000', '安阳市', '410500', '内黄县', '410527');
INSERT INTO `region` VALUES ('河南省', '410000', '平顶山市', '410400', '叶县', '410422');
INSERT INTO `region` VALUES ('河南省', '410000', '平顶山市', '410400', '鲁山县', '410423');
INSERT INTO `region` VALUES ('河南省', '410000', '平顶山市', '410400', '宝丰县', '410421');
INSERT INTO `region` VALUES ('河南省', '410000', '许昌市', '411000', '襄城县', '411025');
INSERT INTO `region` VALUES ('河南省', '410000', '许昌市', '411000', '建安区', '411003');
INSERT INTO `region` VALUES ('河南省', '410000', '许昌市', '411000', '魏都区', '411002');
INSERT INTO `region` VALUES ('河南省', '410000', '许昌市', '411000', '禹州市', '411081');
INSERT INTO `region` VALUES ('河南省', '410000', '平顶山市', '410400', '郏县', '410425');
INSERT INTO `region` VALUES ('河南省', '410000', '平顶山市', '410400', '舞钢市', '410481');
INSERT INTO `region` VALUES ('河南省', '410000', '驻马店市', '411700', '西平县', '411721');
INSERT INTO `region` VALUES ('河南省', '410000', '周口市', '411600', '商水县', '411623');
INSERT INTO `region` VALUES ('河南省', '410000', '周口市', '411600', '淮阳区', '411603');
INSERT INTO `region` VALUES ('河南省', '410000', '周口市', '411600', '西华县', '411622');
INSERT INTO `region` VALUES ('河南省', '410000', '周口市', '411600', '太康县', '411627');
INSERT INTO `region` VALUES ('河南省', '410000', '商丘市', '411400', '柘城县', '411424');
INSERT INTO `region` VALUES ('河南省', '410000', '商丘市', '411400', '宁陵县', '411423');
INSERT INTO `region` VALUES ('河南省', '410000', '周口市', '411600', '鹿邑县', '411628');
INSERT INTO `region` VALUES ('河南省', '410000', '周口市', '411600', '郸城县', '411625');
INSERT INTO `region` VALUES ('河南省', '410000', '商丘市', '411400', '睢县', '411422');
INSERT INTO `region` VALUES ('河南省', '410000', '周口市', '411600', '沈丘县', '411624');
INSERT INTO `region` VALUES ('河南省', '410000', '周口市', '411600', '项城市', '411681');
INSERT INTO `region` VALUES ('河南省', '410000', '濮阳市', '410900', '清丰县', '410922');
INSERT INTO `region` VALUES ('河南省', '410000', '濮阳市', '410900', '华龙区', '410902');
INSERT INTO `region` VALUES ('河南省', '410000', '濮阳市', '410900', '濮阳县', '410928');
INSERT INTO `region` VALUES ('河南省', '410000', '安阳市', '410500', '汤阴县', '410523');
INSERT INTO `region` VALUES ('河南省', '410000', '濮阳市', '410900', '南乐县', '410923');
INSERT INTO `region` VALUES ('河南省', '410000', '平顶山市', '410400', '石龙区', '410404');
INSERT INTO `region` VALUES ('河南省', '410000', '驻马店市', '411700', '上蔡县', '411722');
INSERT INTO `region` VALUES ('河南省', '410000', '新乡市', '410700', '卫辉市', '410781');
INSERT INTO `region` VALUES ('河南省', '410000', '濮阳市', '410900', '台前县', '410927');
INSERT INTO `region` VALUES ('河南省', '410000', '周口市', '411600', '川汇区', '411602');
INSERT INTO `region` VALUES ('河南省', '410000', '商丘市', '411400', '夏邑县', '411426');
INSERT INTO `region` VALUES ('河南省', '410000', '商丘市', '411400', '虞城县', '411425');
INSERT INTO `region` VALUES ('河南省', '410000', '郑州市', '410100', '巩义市', '410181');
INSERT INTO `region` VALUES ('河南省', '410000', '郑州市', '410100', '新密市', '410183');
INSERT INTO `region` VALUES ('河南省', '410000', '驻马店市', '411700', '新蔡县', '411729');
INSERT INTO `region` VALUES ('河南省', '410000', '郑州市', '410100', '新郑市', '410184');
INSERT INTO `region` VALUES ('河南省', '410000', '驻马店市', '411700', '泌阳县', '411726');
INSERT INTO `region` VALUES ('河南省', '410000', '郑州市', '410100', '登封市', '410185');
INSERT INTO `region` VALUES ('河南省', '410000', '驻马店市', '411700', '确山县', '411725');
INSERT INTO `region` VALUES ('天津市', '120000', '天津市', '120100', '北辰区', '120113');
INSERT INTO `region` VALUES ('天津市', '120000', '天津市', '120100', '红桥区', '120106');
INSERT INTO `region` VALUES ('天津市', '120000', '天津市', '120100', '津南区', '120112');
INSERT INTO `region` VALUES ('天津市', '120000', '天津市', '120100', '西青区', '120111');
INSERT INTO `region` VALUES ('天津市', '120000', '天津市', '120100', '滨海新区', '120116');
INSERT INTO `region` VALUES ('天津市', '120000', '天津市', '120100', '河北区', '120105');
INSERT INTO `region` VALUES ('天津市', '120000', '天津市', '120100', '河西区', '120103');
INSERT INTO `region` VALUES ('辽宁省', '210000', '沈阳市', '210100', '和平区', '210102');
INSERT INTO `region` VALUES ('辽宁省', '210000', '沈阳市', '210100', '于洪区', '210114');
INSERT INTO `region` VALUES ('辽宁省', '210000', '沈阳市', '210100', '皇姑区', '210105');
INSERT INTO `region` VALUES ('辽宁省', '210000', '沈阳市', '210100', '浑南区', '210112');
INSERT INTO `region` VALUES ('辽宁省', '210000', '沈阳市', '210100', '沈北新区', '210113');
INSERT INTO `region` VALUES ('辽宁省', '210000', '沈阳市', '210100', '沈河区', '210103');
INSERT INTO `region` VALUES ('辽宁省', '210000', '沈阳市', '210100', '铁西区', '210106');
INSERT INTO `region` VALUES ('辽宁省', '210000', '沈阳市', '210100', '新民市', '210181');
INSERT INTO `region` VALUES ('辽宁省', '210000', '阜新市', '210900', '彰武县', '210922');
INSERT INTO `region` VALUES ('辽宁省', '210000', '沈阳市', '210100', '大东区', '210104');
INSERT INTO `region` VALUES ('辽宁省', '210000', '沈阳市', '210100', '法库县', '210124');
INSERT INTO `region` VALUES ('辽宁省', '210000', '阜新市', '210900', '阜新蒙古族自治县', '210921');
INSERT INTO `region` VALUES ('辽宁省', '210000', '锦州市', '210700', '黑山县', '210726');
INSERT INTO `region` VALUES ('辽宁省', '210000', '沈阳市', '210100', '辽中区', '210115');
INSERT INTO `region` VALUES ('辽宁省', '210000', '抚顺市', '210400', '顺城区', '210411');
INSERT INTO `region` VALUES ('辽宁省', '210000', '沈阳市', '210100', '苏家屯区', '210111');
INSERT INTO `region` VALUES ('辽宁省', '210000', '铁岭市', '211200', '铁岭县', '211221');
INSERT INTO `region` VALUES ('辽宁省', '210000', '抚顺市', '210400', '望花区', '210404');
INSERT INTO `region` VALUES ('江西省', '360000', '南昌市', '360100', '南昌县', '360121');
INSERT INTO `region` VALUES ('江西省', '360000', '南昌市', '360100', '东湖区', '360102');
INSERT INTO `region` VALUES ('江西省', '360000', '南昌市', '360100', '新建区', '360112');
INSERT INTO `region` VALUES ('江西省', '360000', '南昌市', '360100', '青山湖区', '360111');
INSERT INTO `region` VALUES ('江西省', '360000', '南昌市', '360100', '进贤县', '360124');
INSERT INTO `region` VALUES ('江西省', '360000', '南昌市', '360100', '安义县', '360123');
INSERT INTO `region` VALUES ('江西省', '360000', '南昌市', '360100', '西湖区', '360103');
INSERT INTO `region` VALUES ('江西省', '360000', '南昌市', '360100', '青云谱区', '360104');
INSERT INTO `region` VALUES ('江西省', '360000', '抚州市', '361000', '临川区', '361002');
INSERT INTO `region` VALUES ('江西省', '360000', '抚州市', '361000', '崇仁县', '361024');
INSERT INTO `region` VALUES ('江西省', '360000', '抚州市', '361000', '宜黄县', '361026');
INSERT INTO `region` VALUES ('江西省', '360000', '抚州市', '361000', '东乡区', '361003');
INSERT INTO `region` VALUES ('江西省', '360000', '抚州市', '361000', '广昌县', '361030');
INSERT INTO `region` VALUES ('江西省', '360000', '抚州市', '361000', '黎川县', '361022');
INSERT INTO `region` VALUES ('江西省', '360000', '抚州市', '361000', '南丰县', '361023');
INSERT INTO `region` VALUES ('江西省', '360000', '抚州市', '361000', '金溪县', '361027');
INSERT INTO `region` VALUES ('江西省', '360000', '抚州市', '361000', '南城县', '361021');
INSERT INTO `region` VALUES ('江西省', '360000', '抚州市', '361000', '资溪县', '361028');
INSERT INTO `region` VALUES ('江西省', '360000', '抚州市', '361000', '乐安县', '361025');
INSERT INTO `region` VALUES ('江西省', '360000', '新余市', '360500', '渝水区', '360502');
INSERT INTO `region` VALUES ('江西省', '360000', '新余市', '360500', '分宜县', '360521');
INSERT INTO `region` VALUES ('江西省', '360000', '萍乡市', '360300', '安源区', '360302');
INSERT INTO `region` VALUES ('江西省', '360000', '萍乡市', '360300', '上栗县', '360322');
INSERT INTO `region` VALUES ('江西省', '360000', '萍乡市', '360300', '湘东区', '360313');
INSERT INTO `region` VALUES ('江西省', '360000', '萍乡市', '360300', '芦溪县', '360323');
INSERT INTO `region` VALUES ('江西省', '360000', '萍乡市', '360300', '莲花县', '360321');
INSERT INTO `region` VALUES ('山西省', '140000', '晋城市', '140500', '陵川县', '140524');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '阿克苏地区', '652900', '拜城县', '652926');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '阿克苏地区', '652900', '新和县', '652925');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '阿克苏地区', '652900', '柯坪县', '652929');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '阿克苏地区', '652900', '温宿县', '652922');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '阿克苏地区', '652900', '阿瓦提县', '652928');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '阿克苏地区', '652900', '阿克苏市', '652901');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '阿勒泰地区', '654300', '富蕴县', '654322');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '巴音郭楞蒙古自治州', '652800', '轮台县', '652822');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '巴音郭楞蒙古自治州', '652800', '博湖县', '652829');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '巴音郭楞蒙古自治州', '652800', '焉耆回族自治县', '652826');
INSERT INTO `region` VALUES ('湖南省', '430000', '郴州市', '431000', '桂阳县', '431021');
INSERT INTO `region` VALUES ('湖南省', '430000', '永州市', '431100', '江华瑶族自治县', '431129');
INSERT INTO `region` VALUES ('湖南省', '430000', '湘西土家族苗族自治州', '433100', '泸溪县', '433122');
INSERT INTO `region` VALUES ('湖南省', '430000', '怀化市', '431200', '通道侗族自治县', '431230');
INSERT INTO `region` VALUES ('湖南省', '430000', '湘西土家族苗族自治州', '433100', '凤凰县', '433123');
INSERT INTO `region` VALUES ('湖南省', '430000', '湘西土家族苗族自治州', '433100', '古丈县', '433126');
INSERT INTO `region` VALUES ('湖南省', '430000', '永州市', '431100', '蓝山县', '431127');
INSERT INTO `region` VALUES ('湖南省', '430000', '永州市', '431100', '冷水滩区', '431103');
INSERT INTO `region` VALUES ('湖南省', '430000', '郴州市', '431000', '临武县', '431025');
INSERT INTO `region` VALUES ('湖南省', '430000', '怀化市', '431200', '芷江侗族自治县', '431228');
INSERT INTO `region` VALUES ('湖南省', '430000', '郴州市', '431000', '嘉禾县', '431024');
INSERT INTO `region` VALUES ('云南省', '530000', '西双版纳傣族自治州', '532800', '勐腊县', '532823');
INSERT INTO `region` VALUES ('云南省', '530000', '大理白族自治州', '532900', '宾川县', '532924');
INSERT INTO `region` VALUES ('云南省', '530000', '大理白族自治州', '532900', '云龙县', '532929');
INSERT INTO `region` VALUES ('四川省', '510000', '成都市', '510100', '都江堰市', '510181');
INSERT INTO `region` VALUES ('四川省', '510000', '成都市', '510100', '崇州市', '510184');
INSERT INTO `region` VALUES ('四川省', '510000', '成都市', '510100', '大邑县', '510129');
INSERT INTO `region` VALUES ('四川省', '510000', '成都市', '510100', '蒲江县', '510131');
INSERT INTO `region` VALUES ('四川省', '510000', '成都市', '510100', '新都区', '510114');
INSERT INTO `region` VALUES ('四川省', '510000', '雅安市', '511800', '雨城区', '511802');
INSERT INTO `region` VALUES ('四川省', '510000', '眉山市', '511400', '东坡区', '511402');
INSERT INTO `region` VALUES ('四川省', '510000', '德阳市', '510600', '绵竹市', '510683');
INSERT INTO `region` VALUES ('四川省', '510000', '德阳市', '510600', '广汉市', '510681');
INSERT INTO `region` VALUES ('四川省', '510000', '德阳市', '510600', '什邡市', '510682');
INSERT INTO `region` VALUES ('四川省', '510000', '绵阳市', '510700', '三台县', '510722');
INSERT INTO `region` VALUES ('四川省', '510000', '绵阳市', '510700', '北川羌族自治县', '510726');
INSERT INTO `region` VALUES ('四川省', '510000', '绵阳市', '510700', '江油市', '510781');
INSERT INTO `region` VALUES ('四川省', '510000', '绵阳市', '510700', '平武县', '510727');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '阿克苏地区', '652900', '库车市', '652902');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '阿克苏地区', '652900', '沙雅县', '652924');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '阿克苏地区', '652900', '乌什县', '652927');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '阿拉尔市', '659002', '阿拉尔市', '659002');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '阿勒泰地区', '654300', '吉木乃县', '654326');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '阿勒泰地区', '654300', '阿勒泰市', '654301');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '克孜勒苏柯尔克孜自治州', '653000', '阿图什市', '653001');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '克孜勒苏柯尔克孜自治州', '653000', '阿合奇县', '653023');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '塔城地区', '654200', '裕民县', '654225');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '塔城地区', '654200', '塔城市', '654201');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '塔城地区', '654200', '托里县', '654224');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '北屯市', '659005', '北屯市', '659005');
INSERT INTO `region` VALUES ('辽宁省', '210000', '大连市', '210200', '沙河口区', '210204');
INSERT INTO `region` VALUES ('四川省', '510000', '巴中市', '511900', '通江县', '511921');
INSERT INTO `region` VALUES ('四川省', '510000', '巴中市', '511900', '南江县', '511922');
INSERT INTO `region` VALUES ('四川省', '510000', '雅安市', '511800', '名山区', '511803');
INSERT INTO `region` VALUES ('四川省', '510000', '雅安市', '511800', '荥经县', '511822');
INSERT INTO `region` VALUES ('四川省', '510000', '雅安市', '511800', '汉源县', '511823');
INSERT INTO `region` VALUES ('四川省', '510000', '雅安市', '511800', '石棉县', '511824');
INSERT INTO `region` VALUES ('四川省', '510000', '阿坝藏族羌族自治州', '513200', '茂县', '513223');
INSERT INTO `region` VALUES ('四川省', '510000', '阿坝藏族羌族自治州', '513200', '金川县', '513226');
INSERT INTO `region` VALUES ('四川省', '510000', '阿坝藏族羌族自治州', '513200', '小金县', '513227');
INSERT INTO `region` VALUES ('四川省', '510000', '阿坝藏族羌族自治州', '513200', '黑水县', '513228');
INSERT INTO `region` VALUES ('四川省', '510000', '甘孜藏族自治州', '513300', '康定市', '513301');
INSERT INTO `region` VALUES ('四川省', '510000', '甘孜藏族自治州', '513300', '泸定县', '513322');
INSERT INTO `region` VALUES ('四川省', '510000', '甘孜藏族自治州', '513300', '丹巴县', '513323');
INSERT INTO `region` VALUES ('四川省', '510000', '广元市', '510800', '利州区', '510802');
INSERT INTO `region` VALUES ('四川省', '510000', '乐山市', '511100', '金口河区', '511113');
INSERT INTO `region` VALUES ('四川省', '510000', '乐山市', '511100', '犍为县', '511123');
INSERT INTO `region` VALUES ('四川省', '510000', '眉山市', '511400', '洪雅县', '511423');
INSERT INTO `region` VALUES ('四川省', '510000', '眉山市', '511400', '丹棱县', '511424');
INSERT INTO `region` VALUES ('四川省', '510000', '雅安市', '511800', '天全县', '511825');
INSERT INTO `region` VALUES ('四川省', '510000', '雅安市', '511800', '芦山县', '511826');
INSERT INTO `region` VALUES ('四川省', '510000', '雅安市', '511800', '宝兴县', '511827');
INSERT INTO `region` VALUES ('四川省', '510000', '阿坝藏族羌族自治州', '513200', '汶川县', '513221');
INSERT INTO `region` VALUES ('四川省', '510000', '阿坝藏族羌族自治州', '513200', '理县', '513222');
INSERT INTO `region` VALUES ('四川省', '510000', '南充市', '511300', '西充县', '511325');
INSERT INTO `region` VALUES ('湖南省', '430000', '永州市', '431100', '新田县', '431128');
INSERT INTO `region` VALUES ('湖南省', '430000', '怀化市', '431200', '靖州苗族侗族自治县', '431229');
INSERT INTO `region` VALUES ('湖南省', '430000', '岳阳市', '430600', '临湘市', '430682');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '包头市', '150200', '达尔罕茂明安联合旗', '150223');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '赤峰市', '150400', '巴林左旗', '150422');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '包头市', '150200', '土默特右旗', '150221');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '包头市', '150200', '固阳县', '150222');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '鄂尔多斯市', '150600', '鄂托克旗', '150624');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '鄂尔多斯市', '150600', '乌审旗', '150626');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '鄂尔多斯市', '150600', '杭锦旗', '150625');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '呼伦贝尔市', '150700', '新巴尔虎右旗', '150727');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '包头市', '150200', '白云鄂博矿区', '150206');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '呼伦贝尔市', '150700', '新巴尔虎左旗', '150726');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '拉萨市', '540100', '城关区', '540102');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '拉萨市', '540100', '达孜区', '540104');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '拉萨市', '540100', '当雄县', '540122');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '拉萨市', '540100', '堆龙德庆区', '540103');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '拉萨市', '540100', '林周县', '540121');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '拉萨市', '540100', '墨竹工卡县', '540127');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '拉萨市', '540100', '尼木县', '540123');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '拉萨市', '540100', '曲水县', '540124');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '昌都市', '540300', '八宿县', '540326');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '昌都市', '540300', '边坝县', '540330');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '昌都市', '540300', '察雅县', '540325');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '昌都市', '540300', '丁青县', '540324');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '昌都市', '540300', '贡觉县', '540322');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '昌都市', '540300', '江达县', '540321');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '昌都市', '540300', '卡若区', '540302');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '昌都市', '540300', '类乌齐县', '540323');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '昌都市', '540300', '洛隆县', '540329');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '昌都市', '540300', '芒康县', '540328');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '昌都市', '540300', '左贡县', '540327');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '林芝市', '540400', '巴宜区', '540402');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '林芝市', '540400', '波密县', '540424');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '林芝市', '540400', '察隅县', '540425');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '林芝市', '540400', '工布江达县', '540421');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '林芝市', '540400', '朗县', '540426');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '林芝市', '540400', '米林县', '540422');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '林芝市', '540400', '墨脱县', '540423');
INSERT INTO `region` VALUES ('江西省', '360000', '九江市', '360400', '柴桑区', '360404');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '铁门关市', '659006', '铁门关市', '659006');
INSERT INTO `region` VALUES ('湖北省', '420000', '十堰市', '420300', '丹江口市', '420381');
INSERT INTO `region` VALUES ('湖北省', '420000', '十堰市', '420300', '茅箭区', '420302');
INSERT INTO `region` VALUES ('湖北省', '420000', '十堰市', '420300', '郧西县', '420322');
INSERT INTO `region` VALUES ('湖北省', '420000', '十堰市', '420300', '郧阳区', '420304');
INSERT INTO `region` VALUES ('湖北省', '420000', '十堰市', '420300', '张湾区', '420303');
INSERT INTO `region` VALUES ('湖北省', '420000', '十堰市', '420300', '竹山县', '420323');
INSERT INTO `region` VALUES ('湖北省', '420000', '十堰市', '420300', '竹溪县', '420324');
INSERT INTO `region` VALUES ('湖北省', '420000', '十堰市', '420300', '房县', '420325');
INSERT INTO `region` VALUES ('陕西省', '610000', '商洛市', '611000', '丹凤县', '611022');
INSERT INTO `region` VALUES ('陕西省', '610000', '商洛市', '611000', '洛南县', '611021');
INSERT INTO `region` VALUES ('陕西省', '610000', '商洛市', '611000', '山阳县', '611024');
INSERT INTO `region` VALUES ('陕西省', '610000', '商洛市', '611000', '商南县', '611023');
INSERT INTO `region` VALUES ('陕西省', '610000', '商洛市', '611000', '商州区', '611002');
INSERT INTO `region` VALUES ('陕西省', '610000', '商洛市', '611000', '柞水县', '611026');
INSERT INTO `region` VALUES ('陕西省', '610000', '商洛市', '611000', '镇安县', '611025');
INSERT INTO `region` VALUES ('湖北省', '420000', '襄阳市', '420600', '保康县', '420626');
INSERT INTO `region` VALUES ('湖北省', '420000', '襄阳市', '420600', '樊城区', '420606');
INSERT INTO `region` VALUES ('湖北省', '420000', '襄阳市', '420600', '谷城县', '420625');
INSERT INTO `region` VALUES ('湖北省', '420000', '襄阳市', '420600', '老河口市', '420682');
INSERT INTO `region` VALUES ('湖北省', '420000', '襄阳市', '420600', '南漳县', '420624');
INSERT INTO `region` VALUES ('湖北省', '420000', '襄阳市', '420600', '襄城区', '420602');
INSERT INTO `region` VALUES ('湖北省', '420000', '襄阳市', '420600', '襄州区', '420607');
INSERT INTO `region` VALUES ('湖北省', '420000', '襄阳市', '420600', '宜城市', '420684');
INSERT INTO `region` VALUES ('湖北省', '420000', '襄阳市', '420600', '枣阳市', '420683');
INSERT INTO `region` VALUES ('湖北省', '420000', '神农架林区', '429021', '神农架林区', '429021');
INSERT INTO `region` VALUES ('陕西省', '610000', '宝鸡市', '610300', '陈仓区', '610304');
INSERT INTO `region` VALUES ('陕西省', '610000', '宝鸡市', '610300', '凤县', '610330');
INSERT INTO `region` VALUES ('陕西省', '610000', '宝鸡市', '610300', '凤翔区', '610305');
INSERT INTO `region` VALUES ('陕西省', '610000', '宝鸡市', '610300', '扶风县', '610324');
INSERT INTO `region` VALUES ('陕西省', '610000', '宝鸡市', '610300', '金台区', '610303');
INSERT INTO `region` VALUES ('陕西省', '610000', '宝鸡市', '610300', '麟游县', '610329');
INSERT INTO `region` VALUES ('陕西省', '610000', '宝鸡市', '610300', '陇县', '610327');
INSERT INTO `region` VALUES ('陕西省', '610000', '宝鸡市', '610300', '眉县', '610326');
INSERT INTO `region` VALUES ('陕西省', '610000', '宝鸡市', '610300', '岐山县', '610323');
INSERT INTO `region` VALUES ('陕西省', '610000', '宝鸡市', '610300', '千阳县', '610328');
INSERT INTO `region` VALUES ('陕西省', '610000', '宝鸡市', '610300', '太白县', '610331');
INSERT INTO `region` VALUES ('陕西省', '610000', '宝鸡市', '610300', '渭滨区', '610302');
INSERT INTO `region` VALUES ('陕西省', '610000', '汉中市', '610700', '城固县', '610722');
INSERT INTO `region` VALUES ('陕西省', '610000', '汉中市', '610700', '佛坪县', '610730');
INSERT INTO `region` VALUES ('陕西省', '610000', '汉中市', '610700', '汉台区', '610702');
INSERT INTO `region` VALUES ('陕西省', '610000', '汉中市', '610700', '留坝县', '610729');
INSERT INTO `region` VALUES ('陕西省', '610000', '汉中市', '610700', '略阳县', '610727');
INSERT INTO `region` VALUES ('陕西省', '610000', '汉中市', '610700', '勉县', '610725');
INSERT INTO `region` VALUES ('陕西省', '610000', '汉中市', '610700', '南郑区', '610703');
INSERT INTO `region` VALUES ('陕西省', '610000', '汉中市', '610700', '宁强县', '610726');
INSERT INTO `region` VALUES ('陕西省', '610000', '汉中市', '610700', '西乡县', '610724');
INSERT INTO `region` VALUES ('陕西省', '610000', '汉中市', '610700', '洋县', '610723');
INSERT INTO `region` VALUES ('陕西省', '610000', '汉中市', '610700', '镇巴县', '610728');
INSERT INTO `region` VALUES ('陕西省', '610000', '西安市', '610100', '鄠邑区', '610118');
INSERT INTO `region` VALUES ('陕西省', '610000', '西安市', '610100', '蓝田县', '610122');
INSERT INTO `region` VALUES ('陕西省', '610000', '西安市', '610100', '临潼区', '610115');
INSERT INTO `region` VALUES ('陕西省', '610000', '西安市', '610100', '阎良区', '610114');
INSERT INTO `region` VALUES ('陕西省', '610000', '西安市', '610100', '长安区', '610116');
INSERT INTO `region` VALUES ('陕西省', '610000', '西安市', '610100', '周至县', '610124');
INSERT INTO `region` VALUES ('湖北省', '420000', '咸宁市', '421200', '赤壁市', '421281');
INSERT INTO `region` VALUES ('湖北省', '420000', '咸宁市', '421200', '崇阳县', '421223');
INSERT INTO `region` VALUES ('湖北省', '420000', '咸宁市', '421200', '嘉鱼县', '421221');
INSERT INTO `region` VALUES ('湖北省', '420000', '咸宁市', '421200', '通城县', '421222');
INSERT INTO `region` VALUES ('湖北省', '420000', '咸宁市', '421200', '通山县', '421224');
INSERT INTO `region` VALUES ('湖北省', '420000', '咸宁市', '421200', '咸安区', '421202');
INSERT INTO `region` VALUES ('湖北省', '420000', '恩施土家族苗族自治州', '422800', '巴东县', '422823');
INSERT INTO `region` VALUES ('湖北省', '420000', '恩施土家族苗族自治州', '422800', '恩施市', '422801');
INSERT INTO `region` VALUES ('湖北省', '420000', '恩施土家族苗族自治州', '422800', '鹤峰县', '422828');
INSERT INTO `region` VALUES ('湖北省', '420000', '恩施土家族苗族自治州', '422800', '宣恩县', '422825');
INSERT INTO `region` VALUES ('湖北省', '420000', '恩施土家族苗族自治州', '422800', '来凤县', '422827');
INSERT INTO `region` VALUES ('湖北省', '420000', '恩施土家族苗族自治州', '422800', '咸丰县', '422826');
INSERT INTO `region` VALUES ('湖北省', '420000', '恩施土家族苗族自治州', '422800', '利川市', '422802');
INSERT INTO `region` VALUES ('湖北省', '420000', '恩施土家族苗族自治州', '422800', '建始县', '422822');
INSERT INTO `region` VALUES ('山西省', '140000', '临汾市', '141000', '浮山县', '141027');
INSERT INTO `region` VALUES ('山西省', '140000', '临汾市', '141000', '古县', '141025');
INSERT INTO `region` VALUES ('山西省', '140000', '临汾市', '141000', '洪洞县', '141024');
INSERT INTO `region` VALUES ('山西省', '140000', '临汾市', '141000', '隰县', '141031');
INSERT INTO `region` VALUES ('山西省', '140000', '临汾市', '141000', '永和县', '141032');
INSERT INTO `region` VALUES ('山西省', '140000', '临汾市', '141000', '吉县', '141028');
INSERT INTO `region` VALUES ('山西省', '140000', '临汾市', '141000', '蒲县', '141033');
INSERT INTO `region` VALUES ('山西省', '140000', '临汾市', '141000', '乡宁县', '141029');
INSERT INTO `region` VALUES ('山西省', '140000', '临汾市', '141000', '曲沃县', '141021');
INSERT INTO `region` VALUES ('山西省', '140000', '临汾市', '141000', '尧都区', '141002');
INSERT INTO `region` VALUES ('山西省', '140000', '临汾市', '141000', '安泽县', '141026');
INSERT INTO `region` VALUES ('山西省', '140000', '临汾市', '141000', '霍州市', '141082');
INSERT INTO `region` VALUES ('山西省', '140000', '临汾市', '141000', '大宁县', '141030');
INSERT INTO `region` VALUES ('山西省', '140000', '临汾市', '141000', '汾西县', '141034');
INSERT INTO `region` VALUES ('山西省', '140000', '临汾市', '141000', '翼城县', '141022');
INSERT INTO `region` VALUES ('山西省', '140000', '临汾市', '141000', '襄汾县', '141023');
INSERT INTO `region` VALUES ('山西省', '140000', '临汾市', '141000', '侯马市', '141081');
INSERT INTO `region` VALUES ('山西省', '140000', '大同市', '140200', '广灵县', '140223');
INSERT INTO `region` VALUES ('山西省', '140000', '大同市', '140200', '左云县', '140226');
INSERT INTO `region` VALUES ('山西省', '140000', '大同市', '140200', '云州区', '140215');
INSERT INTO `region` VALUES ('山西省', '140000', '大同市', '140200', '云冈区', '140214');
INSERT INTO `region` VALUES ('山西省', '140000', '大同市', '140200', '阳高县', '140221');
INSERT INTO `region` VALUES ('山西省', '140000', '大同市', '140200', '新荣区', '140212');
INSERT INTO `region` VALUES ('山西省', '140000', '大同市', '140200', '天镇县', '140222');
INSERT INTO `region` VALUES ('山西省', '140000', '大同市', '140200', '灵丘县', '140224');
INSERT INTO `region` VALUES ('山西省', '140000', '大同市', '140200', '浑源县', '140225');
INSERT INTO `region` VALUES ('山西省', '140000', '晋城市', '140500', '城区', '140502');
INSERT INTO `region` VALUES ('山西省', '140000', '晋城市', '140500', '沁水县', '140521');
INSERT INTO `region` VALUES ('山西省', '140000', '晋城市', '140500', '阳城县', '140522');
INSERT INTO `region` VALUES ('山西省', '140000', '晋城市', '140500', '高平市', '140581');
INSERT INTO `region` VALUES ('山西省', '140000', '晋城市', '140500', '泽州县', '140525');
INSERT INTO `region` VALUES ('山西省', '140000', '长治市', '140400', '沁源县', '140431');
INSERT INTO `region` VALUES ('山西省', '140000', '长治市', '140400', '长子县', '140428');
INSERT INTO `region` VALUES ('山西省', '140000', '长治市', '140400', '上党区', '140404');
INSERT INTO `region` VALUES ('山西省', '140000', '长治市', '140400', '武乡县', '140429');
INSERT INTO `region` VALUES ('山西省', '140000', '长治市', '140400', '沁县', '140430');
INSERT INTO `region` VALUES ('山西省', '140000', '长治市', '140400', '潞州区', '140403');
INSERT INTO `region` VALUES ('山西省', '140000', '长治市', '140400', '潞城区', '140406');
INSERT INTO `region` VALUES ('山西省', '140000', '长治市', '140400', '平顺县', '140425');
INSERT INTO `region` VALUES ('山西省', '140000', '长治市', '140400', '屯留区', '140405');
INSERT INTO `region` VALUES ('山西省', '140000', '长治市', '140400', '襄垣县', '140423');
INSERT INTO `region` VALUES ('天津市', '120000', '天津市', '120100', '宁河区', '120117');
INSERT INTO `region` VALUES ('湖北省', '420000', '孝感市', '420900', '安陆市', '420982');
INSERT INTO `region` VALUES ('湖北省', '420000', '孝感市', '420900', '大悟县', '420922');
INSERT INTO `region` VALUES ('湖北省', '420000', '孝感市', '420900', '汉川市', '420984');
INSERT INTO `region` VALUES ('湖北省', '420000', '孝感市', '420900', '孝昌县', '420921');
INSERT INTO `region` VALUES ('湖北省', '420000', '孝感市', '420900', '孝南区', '420902');
INSERT INTO `region` VALUES ('湖北省', '420000', '孝感市', '420900', '应城市', '420981');
INSERT INTO `region` VALUES ('湖北省', '420000', '孝感市', '420900', '云梦县', '420923');
INSERT INTO `region` VALUES ('湖北省', '420000', '天门市', '429006', '天门市', '429006');
INSERT INTO `region` VALUES ('湖北省', '420000', '荆门市', '420800', '东宝区', '420802');
INSERT INTO `region` VALUES ('湖北省', '420000', '荆门市', '420800', '掇刀区', '420804');
INSERT INTO `region` VALUES ('湖北省', '420000', '荆门市', '420800', '京山市', '420882');
INSERT INTO `region` VALUES ('湖北省', '420000', '荆门市', '420800', '沙洋县', '420822');
INSERT INTO `region` VALUES ('湖北省', '420000', '荆门市', '420800', '钟祥市', '420881');
INSERT INTO `region` VALUES ('湖北省', '420000', '宜昌市', '420500', '当阳市', '420582');
INSERT INTO `region` VALUES ('湖北省', '420000', '宜昌市', '420500', '点军区', '420504');
INSERT INTO `region` VALUES ('湖北省', '420000', '宜昌市', '420500', '五峰土家族自治县', '420529');
INSERT INTO `region` VALUES ('湖北省', '420000', '宜昌市', '420500', '伍家岗区', '420503');
INSERT INTO `region` VALUES ('湖北省', '420000', '宜昌市', '420500', '西陵区', '420502');
INSERT INTO `region` VALUES ('湖北省', '420000', '宜昌市', '420500', '猇亭区', '420505');
INSERT INTO `region` VALUES ('湖北省', '420000', '宜昌市', '420500', '兴山县', '420526');
INSERT INTO `region` VALUES ('湖北省', '420000', '宜昌市', '420500', '夷陵区', '420506');
INSERT INTO `region` VALUES ('湖北省', '420000', '宜昌市', '420500', '宜都市', '420581');
INSERT INTO `region` VALUES ('湖北省', '420000', '宜昌市', '420500', '远安县', '420525');
INSERT INTO `region` VALUES ('湖北省', '420000', '宜昌市', '420500', '长阳土家族自治县', '420528');
INSERT INTO `region` VALUES ('湖北省', '420000', '宜昌市', '420500', '枝江市', '420583');
INSERT INTO `region` VALUES ('湖北省', '420000', '宜昌市', '420500', '秭归县', '420527');
INSERT INTO `region` VALUES ('湖北省', '420000', '武汉市', '420100', '蔡甸区', '420114');
INSERT INTO `region` VALUES ('湖北省', '420000', '武汉市', '420100', '东西湖区', '420112');
INSERT INTO `region` VALUES ('湖北省', '420000', '武汉市', '420100', '汉南区', '420113');
INSERT INTO `region` VALUES ('湖北省', '420000', '武汉市', '420100', '汉阳区', '420105');
INSERT INTO `region` VALUES ('湖北省', '420000', '武汉市', '420100', '洪山区', '420111');
INSERT INTO `region` VALUES ('湖北省', '420000', '武汉市', '420100', '黄陂区', '420116');
INSERT INTO `region` VALUES ('湖北省', '420000', '武汉市', '420100', '江岸区', '420102');
INSERT INTO `region` VALUES ('湖北省', '420000', '武汉市', '420100', '江汉区', '420103');
INSERT INTO `region` VALUES ('湖北省', '420000', '武汉市', '420100', '江夏区', '420115');
INSERT INTO `region` VALUES ('湖北省', '420000', '武汉市', '420100', '硚口区', '420104');
INSERT INTO `region` VALUES ('湖北省', '420000', '武汉市', '420100', '青山区', '420107');
INSERT INTO `region` VALUES ('湖北省', '420000', '武汉市', '420100', '武昌区', '420106');
INSERT INTO `region` VALUES ('湖北省', '420000', '武汉市', '420100', '新洲区', '420117');
INSERT INTO `region` VALUES ('湖北省', '420000', '潜江市', '429005', '潜江市', '429005');
INSERT INTO `region` VALUES ('湖北省', '420000', '荆州市', '421000', '公安县', '421022');
INSERT INTO `region` VALUES ('湖北省', '420000', '荆州市', '421000', '洪湖市', '421083');
INSERT INTO `region` VALUES ('湖北省', '420000', '荆州市', '421000', '监利市', '421088');
INSERT INTO `region` VALUES ('湖北省', '420000', '荆州市', '421000', '江陵县', '421024');
INSERT INTO `region` VALUES ('湖北省', '420000', '荆州市', '421000', '荆州区', '421003');
INSERT INTO `region` VALUES ('湖北省', '420000', '荆州市', '421000', '沙市区', '421002');
INSERT INTO `region` VALUES ('湖北省', '420000', '荆州市', '421000', '石首市', '421081');
INSERT INTO `region` VALUES ('湖北省', '420000', '荆州市', '421000', '松滋市', '421087');
INSERT INTO `region` VALUES ('四川省', '510000', '成都市', '510100', '武侯区', '510107');
INSERT INTO `region` VALUES ('四川省', '510000', '南充市', '511300', '蓬安县', '511323');
INSERT INTO `region` VALUES ('台湾省', '710000', '新北市', '710300', '三芝区', '710309');
INSERT INTO `region` VALUES ('台湾省', '710000', '桃园市', '710600', '芦竹乡', '710607');
INSERT INTO `region` VALUES ('台湾省', '710000', '桃园市', '710600', '观音乡', '710608');
INSERT INTO `region` VALUES ('台湾省', '710000', '台中市', '710400', '大甲区', '710418');
INSERT INTO `region` VALUES ('台湾省', '710000', '新北市', '710300', '瑞芳区', '710328');
INSERT INTO `region` VALUES ('台湾省', '710000', '新北市', '710300', '淡水区', '710327');
INSERT INTO `region` VALUES ('台湾省', '710000', '新北市', '710300', '万里区', '710326');
INSERT INTO `region` VALUES ('台湾省', '710000', '台中市', '710400', '大安区', '710429');
INSERT INTO `region` VALUES ('台湾省', '710000', '台中市', '710400', '梧栖区', '710419');
INSERT INTO `region` VALUES ('台湾省', '710000', '台中市', '710400', '清水区', '710428');
INSERT INTO `region` VALUES ('台湾省', '710000', '新北市', '710300', '八里区', '710301');
INSERT INTO `region` VALUES ('台湾省', '710000', '新北市', '710300', '林口区', '710318');
INSERT INTO `region` VALUES ('台湾省', '710000', '桃园市', '710600', '大园乡', '710611');
INSERT INTO `region` VALUES ('台湾省', '710000', '桃园市', '710600', '新屋乡', '710612');
INSERT INTO `region` VALUES ('台湾省', '710000', '台中市', '710400', '龙井区', '710409');
INSERT INTO `region` VALUES ('台湾省', '710000', '澎湖县', '719014', '澎湖县', '719014');
INSERT INTO `region` VALUES ('台湾省', '710000', '新北市', '710300', '石门区', '710329');
INSERT INTO `region` VALUES ('台湾省', '710000', '新北市', '710300', '金山区', '710325');
INSERT INTO `region` VALUES ('台湾省', '710000', '新北市', '710300', '贡寮区', '710324');
INSERT INTO `region` VALUES ('上海市', '310000', '上海市', '310100', '崇明区', '310151');
INSERT INTO `region` VALUES ('台湾省', '710000', '高雄市', '710200', '旗津区', '710205');
INSERT INTO `region` VALUES ('台湾省', '710000', '高雄市', '710200', '盐埕区', '710234');
INSERT INTO `region` VALUES ('台湾省', '710000', '台南市', '710500', '北门区', '710535');
INSERT INTO `region` VALUES ('台湾省', '710000', '高雄市', '710200', '林园区', '710225');
INSERT INTO `region` VALUES ('台湾省', '710000', '高雄市', '710200', '小港区', '710201');
INSERT INTO `region` VALUES ('台湾省', '710000', '高雄市', '710200', '前镇区', '710221');
INSERT INTO `region` VALUES ('台湾省', '710000', '高雄市', '710200', '苓雅区', '710212');
INSERT INTO `region` VALUES ('台湾省', '710000', '高雄市', '710200', '鼓山区', '710227');
INSERT INTO `region` VALUES ('台湾省', '710000', '高雄市', '710200', '左营区', '710202');
INSERT INTO `region` VALUES ('台湾省', '710000', '高雄市', '710200', '楠梓区', '710210');
INSERT INTO `region` VALUES ('台湾省', '710000', '高雄市', '710200', '梓官区', '710214');
INSERT INTO `region` VALUES ('台湾省', '710000', '高雄市', '710200', '弥陀区', '710206');
INSERT INTO `region` VALUES ('台湾省', '710000', '高雄市', '710200', '永安区', '710236');
INSERT INTO `region` VALUES ('台湾省', '710000', '高雄市', '710200', '茄萣区', '710219');
INSERT INTO `region` VALUES ('台湾省', '710000', '台南市', '710500', '南区', '710533');
INSERT INTO `region` VALUES ('台湾省', '710000', '台南市', '710500', '安平区', '710534');
INSERT INTO `region` VALUES ('台湾省', '710000', '台南市', '710500', '安南区', '710521');
INSERT INTO `region` VALUES ('台湾省', '710000', '台南市', '710500', '七股区', '710536');
INSERT INTO `region` VALUES ('台湾省', '710000', '台南市', '710500', '将军区', '710537');
INSERT INTO `region` VALUES ('辽宁省', '210000', '辽阳市', '211000', '文圣区', '211003');
INSERT INTO `region` VALUES ('辽宁省', '210000', '辽阳市', '211000', '宏伟区', '211004');
INSERT INTO `region` VALUES ('辽宁省', '210000', '辽阳市', '211000', '太子河区', '211011');
INSERT INTO `region` VALUES ('辽宁省', '210000', '辽阳市', '211000', '辽阳县', '211021');
INSERT INTO `region` VALUES ('辽宁省', '210000', '辽阳市', '211000', '弓长岭区', '211005');
INSERT INTO `region` VALUES ('辽宁省', '210000', '辽阳市', '211000', '灯塔市', '211081');
INSERT INTO `region` VALUES ('山西省', '140000', '吕梁市', '141100', '岚县', '141127');
INSERT INTO `region` VALUES ('山西省', '140000', '吕梁市', '141100', '兴县', '141123');
INSERT INTO `region` VALUES ('山西省', '140000', '吕梁市', '141100', '交口县', '141130');
INSERT INTO `region` VALUES ('山西省', '140000', '吕梁市', '141100', '石楼县', '141126');
INSERT INTO `region` VALUES ('山西省', '140000', '吕梁市', '141100', '临县', '141124');
INSERT INTO `region` VALUES ('山西省', '140000', '吕梁市', '141100', '方山县', '141128');
INSERT INTO `region` VALUES ('山西省', '140000', '吕梁市', '141100', '交城县', '141122');
INSERT INTO `region` VALUES ('山西省', '140000', '吕梁市', '141100', '离石区', '141102');
INSERT INTO `region` VALUES ('山西省', '140000', '吕梁市', '141100', '柳林县', '141125');
INSERT INTO `region` VALUES ('山西省', '140000', '吕梁市', '141100', '文水县', '141121');
INSERT INTO `region` VALUES ('山西省', '140000', '吕梁市', '141100', '汾阳市', '141182');
INSERT INTO `region` VALUES ('山西省', '140000', '吕梁市', '141100', '中阳县', '141129');
INSERT INTO `region` VALUES ('山西省', '140000', '吕梁市', '141100', '孝义市', '141181');
INSERT INTO `region` VALUES ('山西省', '140000', '太原市', '140100', '清徐县', '140121');
INSERT INTO `region` VALUES ('山西省', '140000', '太原市', '140100', '阳曲县', '140122');
INSERT INTO `region` VALUES ('山西省', '140000', '太原市', '140100', '娄烦县', '140123');
INSERT INTO `region` VALUES ('山西省', '140000', '太原市', '140100', '尖草坪区', '140108');
INSERT INTO `region` VALUES ('山西省', '140000', '太原市', '140100', '迎泽区', '140106');
INSERT INTO `region` VALUES ('山西省', '140000', '太原市', '140100', '万柏林区', '140109');
INSERT INTO `region` VALUES ('山西省', '140000', '太原市', '140100', '晋源区', '140110');
INSERT INTO `region` VALUES ('山西省', '140000', '太原市', '140100', '古交市', '140181');
INSERT INTO `region` VALUES ('山西省', '140000', '晋中市', '140700', '和顺县', '140723');
INSERT INTO `region` VALUES ('山西省', '140000', '晋中市', '140700', '介休市', '140781');
INSERT INTO `region` VALUES ('山西省', '140000', '晋中市', '140700', '灵石县', '140729');
INSERT INTO `region` VALUES ('山西省', '140000', '晋中市', '140700', '平遥县', '140728');
INSERT INTO `region` VALUES ('山西省', '140000', '晋中市', '140700', '祁县', '140727');
INSERT INTO `region` VALUES ('山西省', '140000', '晋中市', '140700', '左权县', '140722');
INSERT INTO `region` VALUES ('山西省', '140000', '晋中市', '140700', '榆社县', '140721');
INSERT INTO `region` VALUES ('山西省', '140000', '晋中市', '140700', '太谷区', '140703');
INSERT INTO `region` VALUES ('山西省', '140000', '晋中市', '140700', '榆次区', '140702');
INSERT INTO `region` VALUES ('山西省', '140000', '晋中市', '140700', '寿阳县', '140725');
INSERT INTO `region` VALUES ('山西省', '140000', '晋中市', '140700', '昔阳县', '140724');
INSERT INTO `region` VALUES ('山西省', '140000', '朔州市', '140600', '朔城区', '140602');
INSERT INTO `region` VALUES ('山西省', '140000', '朔州市', '140600', '应县', '140622');
INSERT INTO `region` VALUES ('山西省', '140000', '朔州市', '140600', '怀仁市', '140681');
INSERT INTO `region` VALUES ('山西省', '140000', '朔州市', '140600', '山阴县', '140621');
INSERT INTO `region` VALUES ('山西省', '140000', '朔州市', '140600', '右玉县', '140623');
INSERT INTO `region` VALUES ('山西省', '140000', '朔州市', '140600', '平鲁区', '140603');
INSERT INTO `region` VALUES ('山西省', '140000', '运城市', '140800', '芮城县', '140830');
INSERT INTO `region` VALUES ('山西省', '140000', '运城市', '140800', '绛县', '140826');
INSERT INTO `region` VALUES ('山西省', '140000', '运城市', '140800', '平陆县', '140829');
INSERT INTO `region` VALUES ('山西省', '140000', '运城市', '140800', '稷山县', '140824');
INSERT INTO `region` VALUES ('山西省', '140000', '运城市', '140800', '临猗县', '140821');
INSERT INTO `region` VALUES ('山西省', '140000', '运城市', '140800', '河津市', '140882');
INSERT INTO `region` VALUES ('山西省', '140000', '运城市', '140800', '垣曲县', '140827');
INSERT INTO `region` VALUES ('山西省', '140000', '运城市', '140800', '永济市', '140881');
INSERT INTO `region` VALUES ('山西省', '140000', '运城市', '140800', '盐湖区', '140802');
INSERT INTO `region` VALUES ('山西省', '140000', '运城市', '140800', '新绛县', '140825');
INSERT INTO `region` VALUES ('山西省', '140000', '运城市', '140800', '夏县', '140828');
INSERT INTO `region` VALUES ('山西省', '140000', '运城市', '140800', '闻喜县', '140823');
INSERT INTO `region` VALUES ('山西省', '140000', '运城市', '140800', '万荣县', '140822');
INSERT INTO `region` VALUES ('江西省', '360000', '九江市', '360400', '武宁县', '360423');
INSERT INTO `region` VALUES ('江西省', '360000', '九江市', '360400', '都昌县', '360428');
INSERT INTO `region` VALUES ('江西省', '360000', '九江市', '360400', '彭泽县', '360430');
INSERT INTO `region` VALUES ('江西省', '360000', '九江市', '360400', '湖口县', '360429');
INSERT INTO `region` VALUES ('江西省', '360000', '九江市', '360400', '濂溪区', '360402');
INSERT INTO `region` VALUES ('江西省', '360000', '九江市', '360400', '庐山市', '360483');
INSERT INTO `region` VALUES ('江西省', '360000', '九江市', '360400', '浔阳区', '360403');
INSERT INTO `region` VALUES ('江西省', '360000', '九江市', '360400', '共青城市', '360482');
INSERT INTO `region` VALUES ('江西省', '360000', '九江市', '360400', '永修县', '360425');
INSERT INTO `region` VALUES ('江西省', '360000', '九江市', '360400', '德安县', '360426');
INSERT INTO `region` VALUES ('江西省', '360000', '九江市', '360400', '瑞昌市', '360481');
INSERT INTO `region` VALUES ('江西省', '360000', '九江市', '360400', '修水县', '360424');
INSERT INTO `region` VALUES ('江西省', '360000', '景德镇市', '360200', '昌江区', '360202');
INSERT INTO `region` VALUES ('江西省', '360000', '景德镇市', '360200', '浮梁县', '360222');
INSERT INTO `region` VALUES ('江西省', '360000', '景德镇市', '360200', '乐平市', '360281');
INSERT INTO `region` VALUES ('江西省', '360000', '上饶市', '361100', '鄱阳县', '361128');
INSERT INTO `region` VALUES ('江西省', '360000', '上饶市', '361100', '婺源县', '361130');
INSERT INTO `region` VALUES ('江西省', '360000', '上饶市', '361100', '德兴市', '361181');
INSERT INTO `region` VALUES ('江西省', '360000', '上饶市', '361100', '玉山县', '361123');
INSERT INTO `region` VALUES ('江西省', '360000', '上饶市', '361100', '横峰县', '361125');
INSERT INTO `region` VALUES ('江西省', '360000', '上饶市', '361100', '弋阳县', '361126');
INSERT INTO `region` VALUES ('江西省', '360000', '上饶市', '361100', '信州区', '361102');
INSERT INTO `region` VALUES ('江西省', '360000', '上饶市', '361100', '广信区', '361104');
INSERT INTO `region` VALUES ('江西省', '360000', '上饶市', '361100', '广丰区', '361103');
INSERT INTO `region` VALUES ('江西省', '360000', '上饶市', '361100', '铅山县', '361124');
INSERT INTO `region` VALUES ('江西省', '360000', '上饶市', '361100', '万年县', '361129');
INSERT INTO `region` VALUES ('江西省', '360000', '上饶市', '361100', '余干县', '361127');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '山南市', '540500', '错那县', '540530');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '山南市', '540500', '加查县', '540528');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '山南市', '540500', '桑日县', '540523');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '山南市', '540500', '曲松县', '540525');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '山南市', '540500', '乃东区', '540502');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '山南市', '540500', '琼结县', '540524');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '山南市', '540500', '扎囊县', '540521');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '山南市', '540500', '措美县', '540526');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '山南市', '540500', '贡嘎县', '540522');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '山南市', '540500', '浪卡子县', '540531');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '山南市', '540500', '洛扎县', '540527');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '山南市', '540500', '隆子县', '540529');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '日喀则市', '540200', '南木林县', '540221');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '日喀则市', '540200', '康马县', '540230');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '日喀则市', '540200', '江孜县', '540222');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '日喀则市', '540200', '仁布县', '540229');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '日喀则市', '540200', '桑珠孜区', '540202');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '日喀则市', '540200', '谢通门县', '540227');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '日喀则市', '540200', '白朗县', '540228');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '日喀则市', '540200', '萨迦县', '540224');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '日喀则市', '540200', '岗巴县', '540237');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '日喀则市', '540200', '定结县', '540231');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '日喀则市', '540200', '拉孜县', '540225');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '日喀则市', '540200', '昂仁县', '540226');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '日喀则市', '540200', '定日县', '540223');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '日喀则市', '540200', '聂拉木县', '540235');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '日喀则市', '540200', '萨嘎县', '540236');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '日喀则市', '540200', '吉隆县', '540234');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '日喀则市', '540200', '仲巴县', '540232');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '那曲市', '540600', '聂荣县', '540623');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '那曲市', '540600', '色尼区', '540602');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '那曲市', '540600', '安多县', '540624');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '那曲市', '540600', '尼玛县', '540629');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '那曲市', '540600', '申扎县', '540625');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '那曲市', '540600', '班戈县', '540627');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '那曲市', '540600', '索县', '540626');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '那曲市', '540600', '巴青县', '540628');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '那曲市', '540600', '双湖县', '540630');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '那曲市', '540600', '嘉黎县', '540621');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '那曲市', '540600', '比如县', '540622');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '阿里地区', '542500', '革吉县', '542525');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '阿里地区', '542500', '改则县', '542526');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '阿里地区', '542500', '措勤县', '542527');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '阿里地区', '542500', '札达县', '542522');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '阿里地区', '542500', '日土县', '542524');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '阿里地区', '542500', '噶尔县', '542523');
INSERT INTO `region` VALUES ('湖北省', '420000', '鄂州市', '420700', '华容区', '420703');
INSERT INTO `region` VALUES ('湖北省', '420000', '鄂州市', '420700', '梁子湖区', '420702');
INSERT INTO `region` VALUES ('湖北省', '420000', '鄂州市', '420700', '鄂城区', '420704');
INSERT INTO `region` VALUES ('湖北省', '420000', '随州市', '421300', '曾都区', '421303');
INSERT INTO `region` VALUES ('湖北省', '420000', '随州市', '421300', '随县', '421321');
INSERT INTO `region` VALUES ('湖北省', '420000', '随州市', '421300', '广水市', '421381');
INSERT INTO `region` VALUES ('湖北省', '420000', '黄冈市', '421100', '武穴市', '421182');
INSERT INTO `region` VALUES ('湖北省', '420000', '黄冈市', '421100', '麻城市', '421181');
INSERT INTO `region` VALUES ('湖北省', '420000', '黄冈市', '421100', '团风县', '421121');
INSERT INTO `region` VALUES ('湖北省', '420000', '黄冈市', '421100', '红安县', '421122');
INSERT INTO `region` VALUES ('湖北省', '420000', '黄冈市', '421100', '浠水县', '421125');
INSERT INTO `region` VALUES ('湖北省', '420000', '黄冈市', '421100', '蕲春县', '421126');
INSERT INTO `region` VALUES ('湖北省', '420000', '黄冈市', '421100', '黄梅县', '421127');
INSERT INTO `region` VALUES ('湖北省', '420000', '黄冈市', '421100', '黄州区', '421102');
INSERT INTO `region` VALUES ('湖北省', '420000', '黄冈市', '421100', '罗田县', '421123');
INSERT INTO `region` VALUES ('湖北省', '420000', '黄冈市', '421100', '英山县', '421124');
INSERT INTO `region` VALUES ('湖北省', '420000', '黄石市', '420200', '西塞山区', '420203');
INSERT INTO `region` VALUES ('湖北省', '420000', '黄石市', '420200', '下陆区', '420204');
INSERT INTO `region` VALUES ('湖北省', '420000', '黄石市', '420200', '铁山区', '420205');
INSERT INTO `region` VALUES ('湖北省', '420000', '黄石市', '420200', '阳新县', '420222');
INSERT INTO `region` VALUES ('湖北省', '420000', '黄石市', '420200', '大冶市', '420281');
INSERT INTO `region` VALUES ('重庆市', '500000', '重庆市', '500100', '沙坪坝区', '500106');
INSERT INTO `region` VALUES ('重庆市', '500000', '重庆市', '500200', '酉阳土家族苗族自治县', '500242');
INSERT INTO `region` VALUES ('重庆市', '500000', '重庆市', '500200', '丰都县', '500230');
INSERT INTO `region` VALUES ('重庆市', '500000', '重庆市', '500200', '彭水苗族土家族自治县', '500243');
INSERT INTO `region` VALUES ('重庆市', '500000', '重庆市', '500100', '永川区', '500118');
INSERT INTO `region` VALUES ('重庆市', '500000', '重庆市', '500100', '武隆区', '500156');
INSERT INTO `region` VALUES ('重庆市', '500000', '重庆市', '500100', '江津区', '500116');
INSERT INTO `region` VALUES ('重庆市', '500000', '重庆市', '500100', '璧山区', '500120');
INSERT INTO `region` VALUES ('重庆市', '500000', '重庆市', '500100', '潼南区', '500152');
INSERT INTO `region` VALUES ('重庆市', '500000', '重庆市', '500100', '铜梁区', '500151');
INSERT INTO `region` VALUES ('重庆市', '500000', '重庆市', '500100', '合川区', '500117');
INSERT INTO `region` VALUES ('重庆市', '500000', '重庆市', '500100', '巴南区', '500113');
INSERT INTO `region` VALUES ('重庆市', '500000', '重庆市', '500200', '巫溪县', '500238');
INSERT INTO `region` VALUES ('重庆市', '500000', '重庆市', '500100', '綦江区', '500110');
INSERT INTO `region` VALUES ('重庆市', '500000', '重庆市', '500100', '南川区', '500119');
INSERT INTO `region` VALUES ('重庆市', '500000', '重庆市', '500100', '梁平区', '500155');
INSERT INTO `region` VALUES ('重庆市', '500000', '重庆市', '500100', '涪陵区', '500102');
INSERT INTO `region` VALUES ('重庆市', '500000', '重庆市', '500200', '垫江县', '500231');
INSERT INTO `region` VALUES ('重庆市', '500000', '重庆市', '500100', '大足区', '500111');
INSERT INTO `region` VALUES ('重庆市', '500000', '重庆市', '500100', '开州区', '500154');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '锡林郭勒盟', '152500', '苏尼特右旗', '152524');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '锡林郭勒盟', '152500', '镶黄旗', '152528');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '锡林郭勒盟', '152500', '苏尼特左旗', '152523');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '鄂尔多斯市', '150600', '达拉特旗', '150621');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '鄂尔多斯市', '150600', '准格尔旗', '150622');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '鄂尔多斯市', '150600', '伊金霍洛旗', '150627');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '鄂尔多斯市', '150600', '鄂托克前旗', '150623');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '鄂尔多斯市', '150600', '东胜区', '150602');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '通辽市', '150500', '科尔沁左翼后旗', '150522');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '通辽市', '150500', '开鲁县', '150523');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '通辽市', '150500', '科尔沁左翼中旗', '150521');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '通辽市', '150500', '奈曼旗', '150525');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '通辽市', '150500', '霍林郭勒市', '150581');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '通辽市', '150500', '库伦旗', '150524');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '赤峰市', '150400', '阿鲁科尔沁旗', '150421');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '赤峰市', '150400', '林西县', '150424');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '赤峰市', '150400', '翁牛特旗', '150426');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '赤峰市', '150400', '克什克腾旗', '150425');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '赤峰市', '150400', '巴林右旗', '150423');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '赤峰市', '150400', '喀喇沁旗', '150428');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '赤峰市', '150400', '宁城县', '150429');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '赤峰市', '150400', '敖汉旗', '150430');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '呼伦贝尔市', '150700', '扎兰屯市', '150783');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '呼伦贝尔市', '150700', '鄂温克族自治旗', '150724');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '呼伦贝尔市', '150700', '牙克石市', '150782');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '呼伦贝尔市', '150700', '陈巴尔虎旗', '150725');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '呼伦贝尔市', '150700', '根河市', '150785');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '呼伦贝尔市', '150700', '阿荣旗', '150721');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '呼伦贝尔市', '150700', '莫力达瓦达斡尔族自治旗', '150722');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '包头市', '150200', '九原区', '150207');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '呼伦贝尔市', '150700', '额尔古纳市', '150784');
INSERT INTO `region` VALUES ('山东省', '370000', '菏泽市', '371700', '曹县', '371721');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '呼和浩特市', '150100', '清水河县', '150124');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '兴安盟', '152200', '乌兰浩特市', '152201');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '兴安盟', '152200', '科尔沁右翼前旗', '152221');
INSERT INTO `region` VALUES ('山西省', '140000', '忻州市', '140900', '繁峙县', '140924');
INSERT INTO `region` VALUES ('山西省', '140000', '忻州市', '140900', '五台县', '140922');
INSERT INTO `region` VALUES ('山西省', '140000', '忻州市', '140900', '代县', '140923');
INSERT INTO `region` VALUES ('山西省', '140000', '忻州市', '140900', '原平市', '140981');
INSERT INTO `region` VALUES ('山西省', '140000', '忻州市', '140900', '定襄县', '140921');
INSERT INTO `region` VALUES ('山西省', '140000', '忻州市', '140900', '宁武县', '140925');
INSERT INTO `region` VALUES ('山西省', '140000', '忻州市', '140900', '忻府区', '140902');
INSERT INTO `region` VALUES ('山西省', '140000', '忻州市', '140900', '神池县', '140927');
INSERT INTO `region` VALUES ('山西省', '140000', '忻州市', '140900', '五寨县', '140928');
INSERT INTO `region` VALUES ('山西省', '140000', '忻州市', '140900', '静乐县', '140926');
INSERT INTO `region` VALUES ('山西省', '140000', '忻州市', '140900', '岢岚县', '140929');
INSERT INTO `region` VALUES ('山西省', '140000', '忻州市', '140900', '偏关县', '140932');
INSERT INTO `region` VALUES ('山西省', '140000', '忻州市', '140900', '河曲县', '140930');
INSERT INTO `region` VALUES ('山西省', '140000', '忻州市', '140900', '保德县', '140931');
INSERT INTO `region` VALUES ('福建省', '350000', '莆田市', '350300', '涵江区', '350303');
INSERT INTO `region` VALUES ('福建省', '350000', '莆田市', '350300', '秀屿区', '350305');
INSERT INTO `region` VALUES ('福建省', '350000', '莆田市', '350300', '仙游县', '350322');
INSERT INTO `region` VALUES ('福建省', '350000', '莆田市', '350300', '城厢区', '350302');
INSERT INTO `region` VALUES ('福建省', '350000', '莆田市', '350300', '荔城区', '350304');
INSERT INTO `region` VALUES ('江西省', '360000', '吉安市', '360800', '遂川县', '360827');
INSERT INTO `region` VALUES ('江西省', '360000', '吉安市', '360800', '泰和县', '360826');
INSERT INTO `region` VALUES ('江西省', '360000', '吉安市', '360800', '井冈山市', '360881');
INSERT INTO `region` VALUES ('江西省', '360000', '吉安市', '360800', '吉安县', '360821');
INSERT INTO `region` VALUES ('江西省', '360000', '吉安市', '360800', '安福县', '360829');
INSERT INTO `region` VALUES ('江西省', '360000', '吉安市', '360800', '新干县', '360824');
INSERT INTO `region` VALUES ('江西省', '360000', '吉安市', '360800', '吉州区', '360802');
INSERT INTO `region` VALUES ('江西省', '360000', '吉安市', '360800', '青原区', '360803');
INSERT INTO `region` VALUES ('江西省', '360000', '吉安市', '360800', '万安县', '360828');
INSERT INTO `region` VALUES ('江西省', '360000', '吉安市', '360800', '永丰县', '360825');
INSERT INTO `region` VALUES ('江西省', '360000', '吉安市', '360800', '峡江县', '360823');
INSERT INTO `region` VALUES ('江西省', '360000', '吉安市', '360800', '永新县', '360830');
INSERT INTO `region` VALUES ('江西省', '360000', '吉安市', '360800', '吉水县', '360822');
INSERT INTO `region` VALUES ('江西省', '360000', '宜春市', '360900', '奉新县', '360921');
INSERT INTO `region` VALUES ('江西省', '360000', '宜春市', '360900', '樟树市', '360982');
INSERT INTO `region` VALUES ('江西省', '360000', '宜春市', '360900', '丰城市', '360981');
INSERT INTO `region` VALUES ('江西省', '360000', '宜春市', '360900', '袁州区', '360902');
INSERT INTO `region` VALUES ('江西省', '360000', '宜春市', '360900', '上高县', '360923');
INSERT INTO `region` VALUES ('江西省', '360000', '宜春市', '360900', '宜丰县', '360924');
INSERT INTO `region` VALUES ('江西省', '360000', '宜春市', '360900', '万载县', '360922');
INSERT INTO `region` VALUES ('江西省', '360000', '宜春市', '360900', '铜鼓县', '360926');
INSERT INTO `region` VALUES ('江西省', '360000', '宜春市', '360900', '高安市', '360983');
INSERT INTO `region` VALUES ('江西省', '360000', '宜春市', '360900', '靖安县', '360925');
INSERT INTO `region` VALUES ('江西省', '360000', '赣州市', '360700', '赣县区', '360704');
INSERT INTO `region` VALUES ('江西省', '360000', '赣州市', '360700', '章贡区', '360702');
INSERT INTO `region` VALUES ('江西省', '360000', '赣州市', '360700', '安远县', '360726');
INSERT INTO `region` VALUES ('江西省', '360000', '赣州市', '360700', '瑞金市', '360781');
INSERT INTO `region` VALUES ('江西省', '360000', '赣州市', '360700', '会昌县', '360733');
INSERT INTO `region` VALUES ('江西省', '360000', '赣州市', '360700', '石城县', '360735');
INSERT INTO `region` VALUES ('江西省', '360000', '赣州市', '360700', '宁都县', '360730');
INSERT INTO `region` VALUES ('江西省', '360000', '赣州市', '360700', '兴国县', '360732');
INSERT INTO `region` VALUES ('江西省', '360000', '赣州市', '360700', '大余县', '360723');
INSERT INTO `region` VALUES ('江西省', '360000', '赣州市', '360700', '崇义县', '360725');
INSERT INTO `region` VALUES ('江西省', '360000', '赣州市', '360700', '上犹县', '360724');
INSERT INTO `region` VALUES ('江西省', '360000', '赣州市', '360700', '南康区', '360703');
INSERT INTO `region` VALUES ('江西省', '360000', '赣州市', '360700', '于都县', '360731');
INSERT INTO `region` VALUES ('江西省', '360000', '赣州市', '360700', '定南县', '360728');
INSERT INTO `region` VALUES ('江西省', '360000', '赣州市', '360700', '寻乌县', '360734');
INSERT INTO `region` VALUES ('江西省', '360000', '赣州市', '360700', '龙南市', '360783');
INSERT INTO `region` VALUES ('江西省', '360000', '赣州市', '360700', '全南县', '360729');
INSERT INTO `region` VALUES ('江西省', '360000', '赣州市', '360700', '信丰县', '360722');
INSERT INTO `region` VALUES ('江西省', '360000', '鹰潭市', '360600', '月湖区', '360602');
INSERT INTO `region` VALUES ('江西省', '360000', '鹰潭市', '360600', '贵溪市', '360681');
INSERT INTO `region` VALUES ('江西省', '360000', '鹰潭市', '360600', '余江区', '360603');
INSERT INTO `region` VALUES ('重庆市', '500000', '重庆市', '500200', '云阳县', '500235');
INSERT INTO `region` VALUES ('重庆市', '500000', '重庆市', '500100', '北碚区', '500109');
INSERT INTO `region` VALUES ('重庆市', '500000', '重庆市', '500100', '万州区', '500101');
INSERT INTO `region` VALUES ('重庆市', '500000', '重庆市', '500200', '石柱土家族自治县', '500240');
INSERT INTO `region` VALUES ('重庆市', '500000', '重庆市', '500100', '渝中区', '500103');
INSERT INTO `region` VALUES ('重庆市', '500000', '重庆市', '500100', '江北区', '500105');
INSERT INTO `region` VALUES ('重庆市', '500000', '重庆市', '500200', '城口县', '500229');
INSERT INTO `region` VALUES ('重庆市', '500000', '重庆市', '500100', '长寿区', '500115');
INSERT INTO `region` VALUES ('重庆市', '500000', '重庆市', '500200', '巫山县', '500237');
INSERT INTO `region` VALUES ('重庆市', '500000', '重庆市', '500200', '忠县', '500233');
INSERT INTO `region` VALUES ('重庆市', '500000', '重庆市', '500100', '黔江区', '500114');
INSERT INTO `region` VALUES ('重庆市', '500000', '重庆市', '500200', '秀山土家族苗族自治县', '500241');
INSERT INTO `region` VALUES ('重庆市', '500000', '重庆市', '500100', '荣昌区', '500153');
INSERT INTO `region` VALUES ('重庆市', '500000', '重庆市', '500200', '奉节县', '500236');
INSERT INTO `region` VALUES ('重庆市', '500000', '重庆市', '500100', '大渡口区', '500104');
INSERT INTO `region` VALUES ('重庆市', '500000', '重庆市', '500100', '南岸区', '500108');
INSERT INTO `region` VALUES ('重庆市', '500000', '重庆市', '500100', '九龙坡区', '500107');
INSERT INTO `region` VALUES ('重庆市', '500000', '重庆市', '500100', '渝北区', '500112');
INSERT INTO `region` VALUES ('山东省', '370000', '潍坊市', '370700', '潍城区', '370702');
INSERT INTO `region` VALUES ('甘肃省', '620000', '张掖市', '620700', '临泽县', '620723');
INSERT INTO `region` VALUES ('河南省', '410000', '商丘市', '411400', '永城市', '411481');
INSERT INTO `region` VALUES ('四川省', '510000', '阿坝藏族羌族自治州', '513200', '阿坝县', '513231');
INSERT INTO `region` VALUES ('四川省', '510000', '阿坝藏族羌族自治州', '513200', '松潘县', '513224');
INSERT INTO `region` VALUES ('四川省', '510000', '阿坝藏族羌族自治州', '513200', '红原县', '513233');
INSERT INTO `region` VALUES ('四川省', '510000', '阿坝藏族羌族自治州', '513200', '九寨沟县', '513225');
INSERT INTO `region` VALUES ('四川省', '510000', '阿坝藏族羌族自治州', '513200', '马尔康市', '513201');
INSERT INTO `region` VALUES ('四川省', '510000', '阿坝藏族羌族自治州', '513200', '壤塘县', '513230');
INSERT INTO `region` VALUES ('四川省', '510000', '阿坝藏族羌族自治州', '513200', '若尔盖县', '513232');
INSERT INTO `region` VALUES ('四川省', '510000', '巴中市', '511900', '巴州区', '511902');
INSERT INTO `region` VALUES ('四川省', '510000', '巴中市', '511900', '恩阳区', '511903');
INSERT INTO `region` VALUES ('四川省', '510000', '成都市', '510100', '简阳市', '510185');
INSERT INTO `region` VALUES ('四川省', '510000', '成都市', '510100', '双流区', '510116');
INSERT INTO `region` VALUES ('四川省', '510000', '成都市', '510100', '成华区', '510108');
INSERT INTO `region` VALUES ('四川省', '510000', '成都市', '510100', '青白江区', '510113');
INSERT INTO `region` VALUES ('四川省', '510000', '成都市', '510100', '金堂县', '510121');
INSERT INTO `region` VALUES ('四川省', '510000', '成都市', '510100', '新津区', '510118');
INSERT INTO `region` VALUES ('四川省', '510000', '成都市', '510100', '彭州市', '510182');
INSERT INTO `region` VALUES ('四川省', '510000', '成都市', '510100', '锦江区', '510104');
INSERT INTO `region` VALUES ('四川省', '510000', '成都市', '510100', '金牛区', '510106');
INSERT INTO `region` VALUES ('四川省', '510000', '成都市', '510100', '郫都区', '510117');
INSERT INTO `region` VALUES ('四川省', '510000', '成都市', '510100', '青羊区', '510105');
INSERT INTO `region` VALUES ('四川省', '510000', '成都市', '510100', '邛崃市', '510183');
INSERT INTO `region` VALUES ('四川省', '510000', '成都市', '510100', '温江区', '510115');
INSERT INTO `region` VALUES ('四川省', '510000', '达州市', '511700', '开江县', '511723');
INSERT INTO `region` VALUES ('四川省', '510000', '达州市', '511700', '渠县', '511725');
INSERT INTO `region` VALUES ('四川省', '510000', '达州市', '511700', '达川区', '511703');
INSERT INTO `region` VALUES ('四川省', '510000', '达州市', '511700', '通川区', '511702');
INSERT INTO `region` VALUES ('四川省', '510000', '达州市', '511700', '大竹县', '511724');
INSERT INTO `region` VALUES ('四川省', '510000', '德阳市', '510600', '旌阳区', '510603');
INSERT INTO `region` VALUES ('四川省', '510000', '德阳市', '510600', '中江县', '510623');
INSERT INTO `region` VALUES ('四川省', '510000', '德阳市', '510600', '罗江区', '510604');
INSERT INTO `region` VALUES ('四川省', '510000', '广安市', '511600', '邻水县', '511623');
INSERT INTO `region` VALUES ('四川省', '510000', '广安市', '511600', '广安区', '511602');
INSERT INTO `region` VALUES ('四川省', '510000', '广安市', '511600', '前锋区', '511603');
INSERT INTO `region` VALUES ('四川省', '510000', '广安市', '511600', '武胜县', '511622');
INSERT INTO `region` VALUES ('四川省', '510000', '广安市', '511600', '华蓥市', '511681');
INSERT INTO `region` VALUES ('四川省', '510000', '广安市', '511600', '岳池县', '511621');
INSERT INTO `region` VALUES ('四川省', '510000', '广元市', '510800', '朝天区', '510812');
INSERT INTO `region` VALUES ('四川省', '510000', '广元市', '510800', '昭化区', '510811');
INSERT INTO `region` VALUES ('四川省', '510000', '广元市', '510800', '旺苍县', '510821');
INSERT INTO `region` VALUES ('四川省', '510000', '乐山市', '511100', '马边彝族自治县', '511133');
INSERT INTO `region` VALUES ('四川省', '510000', '乐山市', '511100', '五通桥区', '511112');
INSERT INTO `region` VALUES ('四川省', '510000', '乐山市', '511100', '井研县', '511124');
INSERT INTO `region` VALUES ('四川省', '510000', '乐山市', '511100', '夹江县', '511126');
INSERT INTO `region` VALUES ('四川省', '510000', '乐山市', '511100', '峨眉山市', '511181');
INSERT INTO `region` VALUES ('四川省', '510000', '乐山市', '511100', '峨边彝族自治县', '511132');
INSERT INTO `region` VALUES ('四川省', '510000', '乐山市', '511100', '沐川县', '511129');
INSERT INTO `region` VALUES ('四川省', '510000', '乐山市', '511100', '沙湾区', '511111');
INSERT INTO `region` VALUES ('四川省', '510000', '凉山彝族自治州', '513400', '甘洛县', '513435');
INSERT INTO `region` VALUES ('四川省', '510000', '凉山彝族自治州', '513400', '木里藏族自治县', '513422');
INSERT INTO `region` VALUES ('四川省', '510000', '凉山彝族自治州', '513400', '德昌县', '513424');
INSERT INTO `region` VALUES ('四川省', '510000', '凉山彝族自治州', '513400', '金阳县', '513430');
INSERT INTO `region` VALUES ('四川省', '510000', '凉山彝族自治州', '513400', '雷波县', '513437');
INSERT INTO `region` VALUES ('四川省', '510000', '凉山彝族自治州', '513400', '会东县', '513426');
INSERT INTO `region` VALUES ('四川省', '510000', '凉山彝族自治州', '513400', '宁南县', '513427');
INSERT INTO `region` VALUES ('四川省', '510000', '凉山彝族自治州', '513400', '越西县', '513434');
INSERT INTO `region` VALUES ('四川省', '510000', '凉山彝族自治州', '513400', '美姑县', '513436');
INSERT INTO `region` VALUES ('四川省', '510000', '凉山彝族自治州', '513400', '冕宁县', '513433');
INSERT INTO `region` VALUES ('四川省', '510000', '凉山彝族自治州', '513400', '盐源县', '513423');
INSERT INTO `region` VALUES ('四川省', '510000', '凉山彝族自治州', '513400', '西昌市', '513401');
INSERT INTO `region` VALUES ('四川省', '510000', '凉山彝族自治州', '513400', '喜德县', '513432');
INSERT INTO `region` VALUES ('四川省', '510000', '凉山彝族自治州', '513400', '布拖县', '513429');
INSERT INTO `region` VALUES ('四川省', '510000', '凉山彝族自治州', '513400', '普格县', '513428');
INSERT INTO `region` VALUES ('四川省', '510000', '凉山彝族自治州', '513400', '昭觉县', '513431');
INSERT INTO `region` VALUES ('四川省', '510000', '泸州市', '510500', '江阳区', '510502');
INSERT INTO `region` VALUES ('四川省', '510000', '泸州市', '510500', '龙马潭区', '510504');
INSERT INTO `region` VALUES ('四川省', '510000', '泸州市', '510500', '纳溪区', '510503');
INSERT INTO `region` VALUES ('四川省', '510000', '泸州市', '510500', '叙永县', '510524');
INSERT INTO `region` VALUES ('四川省', '510000', '泸州市', '510500', '古蔺县', '510525');
INSERT INTO `region` VALUES ('四川省', '510000', '泸州市', '510500', '泸县', '510521');
INSERT INTO `region` VALUES ('四川省', '510000', '眉山市', '511400', '彭山区', '511403');
INSERT INTO `region` VALUES ('四川省', '510000', '眉山市', '511400', '青神县', '511425');
INSERT INTO `region` VALUES ('四川省', '510000', '绵阳市', '510700', '涪城区', '510703');
INSERT INTO `region` VALUES ('四川省', '510000', '南充市', '511300', '阆中市', '511381');
INSERT INTO `region` VALUES ('四川省', '510000', '南充市', '511300', '南部县', '511321');
INSERT INTO `region` VALUES ('四川省', '510000', '南充市', '511300', '营山县', '511322');
INSERT INTO `region` VALUES ('四川省', '510000', '南充市', '511300', '仪陇县', '511324');
INSERT INTO `region` VALUES ('四川省', '510000', '南充市', '511300', '嘉陵区', '511304');
INSERT INTO `region` VALUES ('四川省', '510000', '南充市', '511300', '顺庆区', '511302');
INSERT INTO `region` VALUES ('四川省', '510000', '南充市', '511300', '高坪区', '511303');
INSERT INTO `region` VALUES ('四川省', '510000', '内江市', '511000', '威远县', '511024');
INSERT INTO `region` VALUES ('四川省', '510000', '内江市', '511000', '市中区', '511002');
INSERT INTO `region` VALUES ('四川省', '510000', '内江市', '511000', '资中县', '511025');
INSERT INTO `region` VALUES ('四川省', '510000', '内江市', '511000', '隆昌市', '511083');
INSERT INTO `region` VALUES ('四川省', '510000', '内江市', '511000', '东兴区', '511011');
INSERT INTO `region` VALUES ('四川省', '510000', '攀枝花市', '510400', '盐边县', '510422');
INSERT INTO `region` VALUES ('四川省', '510000', '攀枝花市', '510400', '东区', '510402');
INSERT INTO `region` VALUES ('四川省', '510000', '攀枝花市', '510400', '仁和区', '510411');
INSERT INTO `region` VALUES ('四川省', '510000', '攀枝花市', '510400', '西区', '510403');
INSERT INTO `region` VALUES ('四川省', '510000', '攀枝花市', '510400', '米易县', '510421');
INSERT INTO `region` VALUES ('四川省', '510000', '遂宁市', '510900', '蓬溪县', '510921');
INSERT INTO `region` VALUES ('四川省', '510000', '遂宁市', '510900', '射洪市', '510981');
INSERT INTO `region` VALUES ('四川省', '510000', '遂宁市', '510900', '大英县', '510923');
INSERT INTO `region` VALUES ('四川省', '510000', '遂宁市', '510900', '船山区', '510903');
INSERT INTO `region` VALUES ('四川省', '510000', '遂宁市', '510900', '安居区', '510904');
INSERT INTO `region` VALUES ('四川省', '510000', '宜宾市', '511500', '屏山县', '511529');
INSERT INTO `region` VALUES ('四川省', '510000', '宜宾市', '511500', '长宁县', '511524');
INSERT INTO `region` VALUES ('四川省', '510000', '宜宾市', '511500', '江安县', '511523');
INSERT INTO `region` VALUES ('四川省', '510000', '宜宾市', '511500', '翠屏区', '511502');
INSERT INTO `region` VALUES ('四川省', '510000', '宜宾市', '511500', '高县', '511525');
INSERT INTO `region` VALUES ('四川省', '510000', '宜宾市', '511500', '珙县', '511526');
INSERT INTO `region` VALUES ('四川省', '510000', '宜宾市', '511500', '兴文县', '511528');
INSERT INTO `region` VALUES ('四川省', '510000', '宜宾市', '511500', '南溪区', '511503');
INSERT INTO `region` VALUES ('四川省', '510000', '宜宾市', '511500', '筠连县', '511527');
INSERT INTO `region` VALUES ('四川省', '510000', '资阳市', '512000', '安岳县', '512021');
INSERT INTO `region` VALUES ('四川省', '510000', '资阳市', '512000', '乐至县', '512022');
INSERT INTO `region` VALUES ('四川省', '510000', '资阳市', '512000', '雁江区', '512002');
INSERT INTO `region` VALUES ('四川省', '510000', '自贡市', '510300', '贡井区', '510303');
INSERT INTO `region` VALUES ('四川省', '510000', '自贡市', '510300', '沿滩区', '510311');
INSERT INTO `region` VALUES ('四川省', '510000', '自贡市', '510300', '富顺县', '510322');
INSERT INTO `region` VALUES ('四川省', '510000', '自贡市', '510300', '自流井区', '510302');
INSERT INTO `region` VALUES ('四川省', '510000', '自贡市', '510300', '大安区', '510304');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '伊犁哈萨克自治州', '654000', '察布查尔锡伯自治县', '654022');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '伊犁哈萨克自治州', '654000', '霍城县', '654023');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '可克达拉市', '659008', '可克达拉市', '659008');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '伊犁哈萨克自治州', '654000', '霍尔果斯市', '654004');
INSERT INTO `region` VALUES ('四川省', '510000', '成都市', '510100', '龙泉驿区', '510112');
INSERT INTO `region` VALUES ('四川省', '510000', '甘孜藏族自治州', '513300', '石渠县', '513332');
INSERT INTO `region` VALUES ('四川省', '510000', '甘孜藏族自治州', '513300', '稻城县', '513337');
INSERT INTO `region` VALUES ('四川省', '510000', '甘孜藏族自治州', '513300', '雅江县', '513325');
INSERT INTO `region` VALUES ('四川省', '510000', '甘孜藏族自治州', '513300', '道孚县', '513326');
INSERT INTO `region` VALUES ('四川省', '510000', '甘孜藏族自治州', '513300', '色达县', '513333');
INSERT INTO `region` VALUES ('四川省', '510000', '甘孜藏族自治州', '513300', '得荣县', '513338');
INSERT INTO `region` VALUES ('四川省', '510000', '甘孜藏族自治州', '513300', '德格县', '513330');
INSERT INTO `region` VALUES ('四川省', '510000', '甘孜藏族自治州', '513300', '炉霍县', '513327');
INSERT INTO `region` VALUES ('四川省', '510000', '甘孜藏族自治州', '513300', '九龙县', '513324');
INSERT INTO `region` VALUES ('四川省', '510000', '甘孜藏族自治州', '513300', '乡城县', '513336');
INSERT INTO `region` VALUES ('四川省', '510000', '甘孜藏族自治州', '513300', '巴塘县', '513335');
INSERT INTO `region` VALUES ('四川省', '510000', '甘孜藏族自治州', '513300', '新龙县', '513329');
INSERT INTO `region` VALUES ('四川省', '510000', '甘孜藏族自治州', '513300', '理塘县', '513334');
INSERT INTO `region` VALUES ('四川省', '510000', '甘孜藏族自治州', '513300', '白玉县', '513331');
INSERT INTO `region` VALUES ('四川省', '510000', '甘孜藏族自治州', '513300', '甘孜县', '513328');
INSERT INTO `region` VALUES ('山东省', '370000', '烟台市', '370600', '福山区', '370611');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '伊犁哈萨克自治州', '654000', '昭苏县', '654026');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '伊犁哈萨克自治州', '654000', '巩留县', '654024');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '伊犁哈萨克自治州', '654000', '奎屯市', '654003');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '伊犁哈萨克自治州', '654000', '尼勒克县', '654028');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '伊犁哈萨克自治州', '654000', '特克斯县', '654027');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '伊犁哈萨克自治州', '654000', '新源县', '654025');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '伊犁哈萨克自治州', '654000', '伊宁市', '654002');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '伊犁哈萨克自治州', '654000', '伊宁县', '654021');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '乌鲁木齐市', '650100', '达坂城区', '650107');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '乌鲁木齐市', '650100', '米东区', '650109');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '乌鲁木齐市', '650100', '沙依巴克区', '650103');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '乌鲁木齐市', '650100', '水磨沟区', '650105');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '乌鲁木齐市', '650100', '天山区', '650102');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '乌鲁木齐市', '650100', '头屯河区', '650106');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '乌鲁木齐市', '650100', '乌鲁木齐县', '650121');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '乌鲁木齐市', '650100', '新市区', '650104');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '吐鲁番市', '650400', '托克逊县', '650422');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '吐鲁番市', '650400', '高昌区', '650402');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '吐鲁番市', '650400', '鄯善县', '650421');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '克孜勒苏柯尔克孜自治州', '653000', '乌恰县', '653024');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '克孜勒苏柯尔克孜自治州', '653000', '阿克陶县', '653022');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '克拉玛依市', '650200', '克拉玛依区', '650203');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '克拉玛依市', '650200', '乌尔禾区', '650205');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '克拉玛依市', '650200', '白碱滩区', '650204');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '克拉玛依市', '650200', '独山子区', '650202');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '喀什地区', '653100', '疏勒县', '653122');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '喀什地区', '653100', '岳普湖县', '653128');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '喀什地区', '653100', '泽普县', '653124');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '喀什地区', '653100', '巴楚县', '653130');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '喀什地区', '653100', '伽师县', '653129');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '喀什地区', '653100', '喀什市', '653101');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '喀什地区', '653100', '麦盖提县', '653127');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '喀什地区', '653100', '疏附县', '653121');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '喀什地区', '653100', '塔什库尔干塔吉克自治县', '653131');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '喀什地区', '653100', '叶城县', '653126');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '喀什地区', '653100', '英吉沙县', '653123');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '昌吉回族自治州', '652300', '昌吉市', '652301');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '昌吉回族自治州', '652300', '呼图壁县', '652323');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '昌吉回族自治州', '652300', '木垒哈萨克自治县', '652328');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '博尔塔拉蒙古自治州', '652700', '精河县', '652722');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '博尔塔拉蒙古自治州', '652700', '博乐市', '652701');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '巴音郭楞蒙古自治州', '652800', '且末县', '652825');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '巴音郭楞蒙古自治州', '652800', '和静县', '652827');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '五家渠市', '659004', '五家渠市', '659004');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '石河子市', '659001', '石河子市', '659001');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '图木舒克市', '659003', '图木舒克市', '659003');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '塔城地区', '654200', '沙湾市', '654203');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '和田地区', '653200', '洛浦县', '653224');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '巴音郭楞蒙古自治州', '652800', '尉犁县', '652823');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '双河市', '659007', '双河市', '659007');
INSERT INTO `region` VALUES ('福建省', '350000', '三明市', '350400', '尤溪县', '350426');
INSERT INTO `region` VALUES ('福建省', '350000', '三明市', '350400', '永安市', '350481');
INSERT INTO `region` VALUES ('福建省', '350000', '三明市', '350400', '建宁县', '350430');
INSERT INTO `region` VALUES ('福建省', '350000', '三明市', '350400', '泰宁县', '350429');
INSERT INTO `region` VALUES ('福建省', '350000', '三明市', '350400', '将乐县', '350428');
INSERT INTO `region` VALUES ('福建省', '350000', '三明市', '350400', '沙县区', '350405');
INSERT INTO `region` VALUES ('福建省', '350000', '三明市', '350400', '三元区', '350404');
INSERT INTO `region` VALUES ('福建省', '350000', '三明市', '350400', '大田县', '350425');
INSERT INTO `region` VALUES ('福建省', '350000', '三明市', '350400', '清流县', '350423');
INSERT INTO `region` VALUES ('福建省', '350000', '三明市', '350400', '宁化县', '350424');
INSERT INTO `region` VALUES ('福建省', '350000', '三明市', '350400', '明溪县', '350421');
INSERT INTO `region` VALUES ('福建省', '350000', '泉州市', '350500', '安溪县', '350524');
INSERT INTO `region` VALUES ('福建省', '350000', '泉州市', '350500', '德化县', '350526');
INSERT INTO `region` VALUES ('福建省', '350000', '泉州市', '350500', '晋江市', '350582');
INSERT INTO `region` VALUES ('福建省', '350000', '泉州市', '350500', '石狮市', '350581');
INSERT INTO `region` VALUES ('福建省', '350000', '泉州市', '350500', '洛江区', '350504');
INSERT INTO `region` VALUES ('福建省', '350000', '泉州市', '350500', '鲤城区', '350502');
INSERT INTO `region` VALUES ('福建省', '350000', '泉州市', '350500', '丰泽区', '350503');
INSERT INTO `region` VALUES ('福建省', '350000', '泉州市', '350500', '永春县', '350525');
INSERT INTO `region` VALUES ('福建省', '350000', '泉州市', '350500', '惠安县', '350521');
INSERT INTO `region` VALUES ('福建省', '350000', '泉州市', '350500', '泉港区', '350505');
INSERT INTO `region` VALUES ('福建省', '350000', '泉州市', '350500', '南安市', '350583');
INSERT INTO `region` VALUES ('福建省', '350000', '宁德市', '350900', '周宁县', '350925');
INSERT INTO `region` VALUES ('福建省', '350000', '宁德市', '350900', '柘荣县', '350926');
INSERT INTO `region` VALUES ('福建省', '350000', '宁德市', '350900', '霞浦县', '350921');
INSERT INTO `region` VALUES ('福建省', '350000', '宁德市', '350900', '寿宁县', '350924');
INSERT INTO `region` VALUES ('福建省', '350000', '宁德市', '350900', '蕉城区', '350902');
INSERT INTO `region` VALUES ('福建省', '350000', '宁德市', '350900', '屏南县', '350923');
INSERT INTO `region` VALUES ('福建省', '350000', '宁德市', '350900', '古田县', '350922');
INSERT INTO `region` VALUES ('福建省', '350000', '宁德市', '350900', '福鼎市', '350982');
INSERT INTO `region` VALUES ('福建省', '350000', '龙岩市', '350800', '连城县', '350825');
INSERT INTO `region` VALUES ('福建省', '350000', '龙岩市', '350800', '漳平市', '350881');
INSERT INTO `region` VALUES ('福建省', '350000', '龙岩市', '350800', '长汀县', '350821');
INSERT INTO `region` VALUES ('福建省', '350000', '龙岩市', '350800', '新罗区', '350802');
INSERT INTO `region` VALUES ('福建省', '350000', '龙岩市', '350800', '永定区', '350803');
INSERT INTO `region` VALUES ('福建省', '350000', '龙岩市', '350800', '武平县', '350824');
INSERT INTO `region` VALUES ('福建省', '350000', '龙岩市', '350800', '上杭县', '350823');
INSERT INTO `region` VALUES ('福建省', '350000', '福州市', '350100', '仓山区', '350104');
INSERT INTO `region` VALUES ('福建省', '350000', '福州市', '350100', '福清市', '350181');
INSERT INTO `region` VALUES ('福建省', '350000', '福州市', '350100', '鼓楼区', '350102');
INSERT INTO `region` VALUES ('福建省', '350000', '福州市', '350100', '晋安区', '350111');
INSERT INTO `region` VALUES ('福建省', '350000', '福州市', '350100', '连江县', '350122');
INSERT INTO `region` VALUES ('福建省', '350000', '福州市', '350100', '罗源县', '350123');
INSERT INTO `region` VALUES ('福建省', '350000', '福州市', '350100', '马尾区', '350105');
INSERT INTO `region` VALUES ('福建省', '350000', '福州市', '350100', '闽侯县', '350121');
INSERT INTO `region` VALUES ('福建省', '350000', '福州市', '350100', '闽清县', '350124');
INSERT INTO `region` VALUES ('福建省', '350000', '福州市', '350100', '台江区', '350103');
INSERT INTO `region` VALUES ('福建省', '350000', '福州市', '350100', '永泰县', '350125');
INSERT INTO `region` VALUES ('福建省', '350000', '福州市', '350100', '长乐区', '350112');
INSERT INTO `region` VALUES ('福建省', '350000', '南平市', '350700', '顺昌县', '350721');
INSERT INTO `region` VALUES ('福建省', '350000', '南平市', '350700', '政和县', '350725');
INSERT INTO `region` VALUES ('福建省', '350000', '南平市', '350700', '延平区', '350702');
INSERT INTO `region` VALUES ('福建省', '350000', '南平市', '350700', '建瓯市', '350783');
INSERT INTO `region` VALUES ('福建省', '350000', '南平市', '350700', '武夷山市', '350782');
INSERT INTO `region` VALUES ('福建省', '350000', '南平市', '350700', '松溪县', '350724');
INSERT INTO `region` VALUES ('福建省', '350000', '南平市', '350700', '邵武市', '350781');
INSERT INTO `region` VALUES ('福建省', '350000', '南平市', '350700', '浦城县', '350722');
INSERT INTO `region` VALUES ('福建省', '350000', '南平市', '350700', '建阳区', '350703');
INSERT INTO `region` VALUES ('福建省', '350000', '南平市', '350700', '光泽县', '350723');
INSERT INTO `region` VALUES ('福建省', '350000', '厦门市', '350200', '湖里区', '350206');
INSERT INTO `region` VALUES ('福建省', '350000', '厦门市', '350200', '翔安区', '350213');
INSERT INTO `region` VALUES ('福建省', '350000', '厦门市', '350200', '同安区', '350212');
INSERT INTO `region` VALUES ('福建省', '350000', '厦门市', '350200', '思明区', '350203');
INSERT INTO `region` VALUES ('福建省', '350000', '厦门市', '350200', '集美区', '350211');
INSERT INTO `region` VALUES ('福建省', '350000', '厦门市', '350200', '海沧区', '350205');
INSERT INTO `region` VALUES ('福建省', '350000', '漳州市', '350600', '龙海区', '350604');
INSERT INTO `region` VALUES ('福建省', '350000', '漳州市', '350600', '华安县', '350629');
INSERT INTO `region` VALUES ('福建省', '350000', '漳州市', '350600', '东山县', '350626');
INSERT INTO `region` VALUES ('福建省', '350000', '漳州市', '350600', '诏安县', '350624');
INSERT INTO `region` VALUES ('福建省', '350000', '漳州市', '350600', '长泰区', '350605');
INSERT INTO `region` VALUES ('福建省', '350000', '漳州市', '350600', '漳浦县', '350623');
INSERT INTO `region` VALUES ('福建省', '350000', '漳州市', '350600', '云霄县', '350622');
INSERT INTO `region` VALUES ('福建省', '350000', '漳州市', '350600', '芗城区', '350602');
INSERT INTO `region` VALUES ('福建省', '350000', '漳州市', '350600', '平和县', '350628');
INSERT INTO `region` VALUES ('福建省', '350000', '漳州市', '350600', '南靖县', '350627');
INSERT INTO `region` VALUES ('福建省', '350000', '漳州市', '350600', '龙文区', '350603');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '乌兰察布市', '150900', '兴和县', '150924');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '乌兰察布市', '150900', '集宁区', '150902');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '乌兰察布市', '150900', '丰镇市', '150981');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '乌兰察布市', '150900', '商都县', '150923');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '乌兰察布市', '150900', '察哈尔右翼前旗', '150926');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '乌兰察布市', '150900', '凉城县', '150925');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '乌兰察布市', '150900', '四子王旗', '150929');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '乌兰察布市', '150900', '卓资县', '150921');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '乌兰察布市', '150900', '察哈尔右翼中旗', '150927');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '乌兰察布市', '150900', '察哈尔右翼后旗', '150928');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '乌兰察布市', '150900', '化德县', '150922');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '兴安盟', '152200', '阿尔山市', '152202');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '乌海市', '150300', '海勃湾区', '150302');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '乌海市', '150300', '海南区', '150303');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '呼和浩特市', '150100', '和林格尔县', '150123');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '赤峰市', '150400', '红山区', '150402');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '通辽市', '150500', '科尔沁区', '150502');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '兴安盟', '152200', '科尔沁右翼中旗', '152222');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '赤峰市', '150400', '松山区', '150404');
INSERT INTO `region` VALUES ('台湾省', '710000', '台北市', '710100', '松山区', '710102');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '兴安盟', '152200', '突泉县', '152224');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '呼和浩特市', '150100', '托克托县', '150122');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '乌海市', '150300', '乌达区', '150304');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '巴彦淖尔市', '150800', '乌拉特后旗', '150825');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '巴彦淖尔市', '150800', '乌拉特前旗', '150823');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '巴彦淖尔市', '150800', '五原县', '150821');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '赤峰市', '150400', '元宝山区', '150403');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '兴安盟', '152200', '扎赉特旗', '152223');
INSERT INTO `region` VALUES ('吉林省', '220000', '通化市', '220500', '集安市', '220582');
INSERT INTO `region` VALUES ('吉林省', '220000', '延边朝鲜族自治州', '222400', '珲春市', '222404');
INSERT INTO `region` VALUES ('吉林省', '220000', '延边朝鲜族自治州', '222400', '安图县', '222426');
INSERT INTO `region` VALUES ('吉林省', '220000', '延边朝鲜族自治州', '222400', '图们市', '222402');
INSERT INTO `region` VALUES ('吉林省', '220000', '延边朝鲜族自治州', '222400', '龙井市', '222405');
INSERT INTO `region` VALUES ('吉林省', '220000', '延边朝鲜族自治州', '222400', '和龙市', '222406');
INSERT INTO `region` VALUES ('吉林省', '220000', '白山市', '220600', '临江市', '220681');
INSERT INTO `region` VALUES ('吉林省', '220000', '白山市', '220600', '靖宇县', '220622');
INSERT INTO `region` VALUES ('吉林省', '220000', '白山市', '220600', '抚松县', '220621');
INSERT INTO `region` VALUES ('吉林省', '220000', '白山市', '220600', '江源区', '220605');
INSERT INTO `region` VALUES ('吉林省', '220000', '白山市', '220600', '浑江区', '220602');
INSERT INTO `region` VALUES ('吉林省', '220000', '白山市', '220600', '长白朝鲜族自治县', '220623');
INSERT INTO `region` VALUES ('山东省', '370000', '滨州市', '371600', '滨城区', '371602');
INSERT INTO `region` VALUES ('山东省', '370000', '滨州市', '371600', '邹平市', '371681');
INSERT INTO `region` VALUES ('山东省', '370000', '滨州市', '371600', '沾化区', '371603');
INSERT INTO `region` VALUES ('山东省', '370000', '滨州市', '371600', '阳信县', '371622');
INSERT INTO `region` VALUES ('山东省', '370000', '滨州市', '371600', '无棣县', '371623');
INSERT INTO `region` VALUES ('山东省', '370000', '滨州市', '371600', '惠民县', '371621');
INSERT INTO `region` VALUES ('山东省', '370000', '滨州市', '371600', '博兴县', '371625');
INSERT INTO `region` VALUES ('山东省', '370000', '德州市', '371400', '夏津县', '371427');
INSERT INTO `region` VALUES ('山东省', '370000', '德州市', '371400', '宁津县', '371422');
INSERT INTO `region` VALUES ('山东省', '370000', '德州市', '371400', '德城区', '371402');
INSERT INTO `region` VALUES ('山东省', '370000', '德州市', '371400', '禹城市', '371482');
INSERT INTO `region` VALUES ('山东省', '370000', '德州市', '371400', '临邑县', '371424');
INSERT INTO `region` VALUES ('山东省', '370000', '德州市', '371400', '武城县', '371428');
INSERT INTO `region` VALUES ('山东省', '370000', '德州市', '371400', '庆云县', '371423');
INSERT INTO `region` VALUES ('山东省', '370000', '德州市', '371400', '齐河县', '371425');
INSERT INTO `region` VALUES ('山东省', '370000', '德州市', '371400', '平原县', '371426');
INSERT INTO `region` VALUES ('山东省', '370000', '德州市', '371400', '陵城区', '371403');
INSERT INTO `region` VALUES ('山东省', '370000', '德州市', '371400', '乐陵市', '371481');
INSERT INTO `region` VALUES ('湖南省', '430000', '岳阳市', '430600', '湘阴县', '430624');
INSERT INTO `region` VALUES ('湖南省', '430000', '岳阳市', '430600', '岳阳楼区', '430602');
INSERT INTO `region` VALUES ('湖南省', '430000', '岳阳市', '430600', '岳阳县', '430621');
INSERT INTO `region` VALUES ('湖南省', '430000', '永州市', '431100', '零陵区', '431102');
INSERT INTO `region` VALUES ('湖南省', '430000', '郴州市', '431000', '宜章县', '431022');
INSERT INTO `region` VALUES ('湖南省', '430000', '湘西土家族苗族自治州', '433100', '保靖县', '433125');
INSERT INTO `region` VALUES ('天津市', '120000', '天津市', '120100', '东丽区', '120110');
INSERT INTO `region` VALUES ('天津市', '120000', '天津市', '120100', '南开区', '120104');
INSERT INTO `region` VALUES ('天津市', '120000', '天津市', '120100', '武清区', '120114');
INSERT INTO `region` VALUES ('天津市', '120000', '天津市', '120100', '宝坻区', '120115');
INSERT INTO `region` VALUES ('天津市', '120000', '天津市', '120100', '和平区', '120101');
INSERT INTO `region` VALUES ('辽宁省', '210000', '抚顺市', '210400', '抚顺县', '210421');
INSERT INTO `region` VALUES ('山东省', '370000', '潍坊市', '370700', '安丘市', '370784');
INSERT INTO `region` VALUES ('山东省', '370000', '潍坊市', '370700', '寿光市', '370783');
INSERT INTO `region` VALUES ('山东省', '370000', '潍坊市', '370700', '昌乐县', '370725');
INSERT INTO `region` VALUES ('山东省', '370000', '潍坊市', '370700', '青州市', '370781');
INSERT INTO `region` VALUES ('山东省', '370000', '潍坊市', '370700', '寒亭区', '370703');
INSERT INTO `region` VALUES ('山东省', '370000', '潍坊市', '370700', '诸城市', '370782');
INSERT INTO `region` VALUES ('山东省', '370000', '潍坊市', '370700', '临朐县', '370724');
INSERT INTO `region` VALUES ('山东省', '370000', '潍坊市', '370700', '高密市', '370785');
INSERT INTO `region` VALUES ('山东省', '370000', '潍坊市', '370700', '坊子区', '370704');
INSERT INTO `region` VALUES ('山东省', '370000', '潍坊市', '370700', '昌邑市', '370786');
INSERT INTO `region` VALUES ('山东省', '370000', '菏泽市', '371700', '成武县', '371723');
INSERT INTO `region` VALUES ('山东省', '370000', '菏泽市', '371700', '定陶区', '371703');
INSERT INTO `region` VALUES ('山东省', '370000', '菏泽市', '371700', '单县', '371722');
INSERT INTO `region` VALUES ('山东省', '370000', '菏泽市', '371700', '郓城县', '371725');
INSERT INTO `region` VALUES ('山东省', '370000', '菏泽市', '371700', '牡丹区', '371702');
INSERT INTO `region` VALUES ('山东省', '370000', '菏泽市', '371700', '鄄城县', '371726');
INSERT INTO `region` VALUES ('山东省', '370000', '菏泽市', '371700', '巨野县', '371724');
INSERT INTO `region` VALUES ('山东省', '370000', '菏泽市', '371700', '东明县', '371728');
INSERT INTO `region` VALUES ('山东省', '370000', '淄博市', '370300', '张店区', '370303');
INSERT INTO `region` VALUES ('山东省', '370000', '淄博市', '370300', '淄川区', '370302');
INSERT INTO `region` VALUES ('山东省', '370000', '淄博市', '370300', '桓台县', '370321');
INSERT INTO `region` VALUES ('山东省', '370000', '淄博市', '370300', '周村区', '370306');
INSERT INTO `region` VALUES ('山东省', '370000', '淄博市', '370300', '博山区', '370304');
INSERT INTO `region` VALUES ('山东省', '370000', '淄博市', '370300', '沂源县', '370323');
INSERT INTO `region` VALUES ('山东省', '370000', '淄博市', '370300', '临淄区', '370305');
INSERT INTO `region` VALUES ('山东省', '370000', '淄博市', '370300', '高青县', '370322');
INSERT INTO `region` VALUES ('山东省', '370000', '枣庄市', '370400', '山亭区', '370406');
INSERT INTO `region` VALUES ('山东省', '370000', '枣庄市', '370400', '峄城区', '370404');
INSERT INTO `region` VALUES ('山东省', '370000', '枣庄市', '370400', '薛城区', '370403');
INSERT INTO `region` VALUES ('山东省', '370000', '枣庄市', '370400', '滕州市', '370481');
INSERT INTO `region` VALUES ('山东省', '370000', '枣庄市', '370400', '台儿庄区', '370405');
INSERT INTO `region` VALUES ('山东省', '370000', '枣庄市', '370400', '市中区', '370402');
INSERT INTO `region` VALUES ('山东省', '370000', '烟台市', '370600', '莱山区', '370613');
INSERT INTO `region` VALUES ('山东省', '370000', '烟台市', '370600', '莱州市', '370683');
INSERT INTO `region` VALUES ('山东省', '370000', '烟台市', '370600', '莱阳市', '370682');
INSERT INTO `region` VALUES ('山东省', '370000', '烟台市', '370600', '海阳市', '370687');
INSERT INTO `region` VALUES ('山东省', '370000', '烟台市', '370600', '芝罘区', '370602');
INSERT INTO `region` VALUES ('山东省', '370000', '烟台市', '370600', '招远市', '370685');
INSERT INTO `region` VALUES ('山东省', '370000', '烟台市', '370600', '栖霞市', '370686');
INSERT INTO `region` VALUES ('山东省', '370000', '烟台市', '370600', '蓬莱区', '370614');
INSERT INTO `region` VALUES ('山东省', '370000', '烟台市', '370600', '牟平区', '370612');
INSERT INTO `region` VALUES ('山东省', '370000', '烟台市', '370600', '龙口市', '370681');
INSERT INTO `region` VALUES ('山东省', '370000', '泰安市', '370900', '泰山区', '370902');
INSERT INTO `region` VALUES ('山东省', '370000', '泰安市', '370900', '岱岳区', '370911');
INSERT INTO `region` VALUES ('山东省', '370000', '泰安市', '370900', '新泰市', '370982');
INSERT INTO `region` VALUES ('山东省', '370000', '泰安市', '370900', '宁阳县', '370921');
INSERT INTO `region` VALUES ('山东省', '370000', '泰安市', '370900', '肥城市', '370983');
INSERT INTO `region` VALUES ('山东省', '370000', '泰安市', '370900', '东平县', '370923');
INSERT INTO `region` VALUES ('山东省', '370000', '聊城市', '371500', '高唐县', '371526');
INSERT INTO `region` VALUES ('山东省', '370000', '聊城市', '371500', '阳谷县', '371521');
INSERT INTO `region` VALUES ('山东省', '370000', '聊城市', '371500', '东阿县', '371524');
INSERT INTO `region` VALUES ('山东省', '370000', '聊城市', '371500', '莘县', '371522');
INSERT INTO `region` VALUES ('山东省', '370000', '聊城市', '371500', '东昌府区', '371502');
INSERT INTO `region` VALUES ('山东省', '370000', '聊城市', '371500', '冠县', '371525');
INSERT INTO `region` VALUES ('山东省', '370000', '聊城市', '371500', '临清市', '371581');
INSERT INTO `region` VALUES ('山东省', '370000', '聊城市', '371500', '茌平区', '371503');
INSERT INTO `region` VALUES ('山东省', '370000', '济宁市', '370800', '嘉祥县', '370829');
INSERT INTO `region` VALUES ('山东省', '370000', '济宁市', '370800', '汶上县', '370830');
INSERT INTO `region` VALUES ('山东省', '370000', '济宁市', '370800', '任城区', '370811');
INSERT INTO `region` VALUES ('山东省', '370000', '济宁市', '370800', '梁山县', '370832');
INSERT INTO `region` VALUES ('山东省', '370000', '济宁市', '370800', '金乡县', '370828');
INSERT INTO `region` VALUES ('山东省', '370000', '济宁市', '370800', '邹城市', '370883');
INSERT INTO `region` VALUES ('山东省', '370000', '济宁市', '370800', '泗水县', '370831');
INSERT INTO `region` VALUES ('山东省', '370000', '济宁市', '370800', '曲阜市', '370881');
INSERT INTO `region` VALUES ('山东省', '370000', '济宁市', '370800', '鱼台县', '370827');
INSERT INTO `region` VALUES ('山东省', '370000', '济宁市', '370800', '兖州区', '370812');
INSERT INTO `region` VALUES ('山东省', '370000', '威海市', '371000', '环翠区', '371002');
INSERT INTO `region` VALUES ('山东省', '370000', '威海市', '371000', '文登区', '371003');
INSERT INTO `region` VALUES ('山东省', '370000', '威海市', '371000', '乳山市', '371083');
INSERT INTO `region` VALUES ('山东省', '370000', '威海市', '371000', '荣成市', '371082');
INSERT INTO `region` VALUES ('山东省', '370000', '济南市', '370100', '钢城区', '370117');
INSERT INTO `region` VALUES ('山东省', '370000', '济南市', '370100', '莱芜区', '370116');
INSERT INTO `region` VALUES ('山东省', '370000', '济南市', '370100', '平阴县', '370124');
INSERT INTO `region` VALUES ('青海省', '630000', '海西蒙古族藏族自治州', '632800', '海西蒙古族藏族自治州', '632800');
INSERT INTO `region` VALUES ('甘肃省', '620000', '酒泉市', '620900', '肃北蒙古族自治县', '620923');
INSERT INTO `region` VALUES ('湖北省', '420000', '黄石市', '420200', '黄石港区', '420202');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '阿拉善盟', '152900', '阿拉善右旗', '152922');
INSERT INTO `region` VALUES ('甘肃省', '620000', '临夏回族自治州', '622900', '东乡族自治县', '622926');
INSERT INTO `region` VALUES ('甘肃省', '620000', '临夏回族自治州', '622900', '广河县', '622924');
INSERT INTO `region` VALUES ('甘肃省', '620000', '临夏回族自治州', '622900', '和政县', '622925');
INSERT INTO `region` VALUES ('甘肃省', '620000', '临夏回族自治州', '622900', '积石山保安族东乡族撒拉族自治县', '622927');
INSERT INTO `region` VALUES ('甘肃省', '620000', '临夏回族自治州', '622900', '康乐县', '622922');
INSERT INTO `region` VALUES ('甘肃省', '620000', '临夏回族自治州', '622900', '临夏市', '622901');
INSERT INTO `region` VALUES ('甘肃省', '620000', '临夏回族自治州', '622900', '临夏县', '622921');
INSERT INTO `region` VALUES ('甘肃省', '620000', '临夏回族自治州', '622900', '永靖县', '622923');
INSERT INTO `region` VALUES ('上海市', '310000', '上海市', '310100', '普陀区', '310107');
INSERT INTO `region` VALUES ('上海市', '310000', '上海市', '310100', '嘉定区', '310114');
INSERT INTO `region` VALUES ('上海市', '310000', '上海市', '310100', '静安区', '310106');
INSERT INTO `region` VALUES ('上海市', '310000', '上海市', '310100', '闵行区', '310112');
INSERT INTO `region` VALUES ('上海市', '310000', '上海市', '310100', '松江区', '310117');
INSERT INTO `region` VALUES ('上海市', '310000', '上海市', '310100', '徐汇区', '310104');
INSERT INTO `region` VALUES ('上海市', '310000', '上海市', '310100', '长宁区', '310105');
INSERT INTO `region` VALUES ('上海市', '310000', '上海市', '310100', '黄浦区', '310101');
INSERT INTO `region` VALUES ('上海市', '310000', '上海市', '310100', '虹口区', '310109');
INSERT INTO `region` VALUES ('上海市', '310000', '上海市', '310100', '宝山区', '310113');
INSERT INTO `region` VALUES ('上海市', '310000', '上海市', '310100', '浦东新区', '310115');
INSERT INTO `region` VALUES ('上海市', '310000', '上海市', '310100', '奉贤区', '310120');
INSERT INTO `region` VALUES ('上海市', '310000', '上海市', '310100', '金山区', '310116');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '大兴安岭地区', '232700', '呼中区', '232764');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '大兴安岭地区', '232700', '新林区', '232763');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '大兴安岭地区', '232700', '呼玛县', '232721');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '大兴安岭地区', '232700', '漠河市', '232701');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '大兴安岭地区', '232700', '塔河县', '232722');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '伊春市', '230700', '铁力市', '230781');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '伊春市', '230700', '大箐山县', '230725');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '伊春市', '230700', '金林区', '230751');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '伊春市', '230700', '乌翠区', '230718');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '伊春市', '230700', '嘉荫县', '230722');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '伊春市', '230700', '友好区', '230719');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '伊春市', '230700', '伊美区', '230717');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '伊春市', '230700', '丰林县', '230724');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '伊春市', '230700', '汤旺县', '230723');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '伊春市', '230700', '南岔县', '230726');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '大庆市', '230600', '肇州县', '230621');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '大庆市', '230600', '肇源县', '230622');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '大庆市', '230600', '萨尔图区', '230602');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '大庆市', '230600', '大同区', '230606');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '大庆市', '230600', '红岗区', '230605');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '大庆市', '230600', '让胡路区', '230604');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '大庆市', '230600', '林甸县', '230623');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '大庆市', '230600', '杜尔伯特蒙古族自治县', '230624');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '大庆市', '230600', '龙凤区', '230603');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '哈尔滨市', '230100', '巴彦县', '230126');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '哈尔滨市', '230100', '阿城区', '230112');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '哈尔滨市', '230100', '依兰县', '230123');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '哈尔滨市', '230100', '延寿县', '230129');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '哈尔滨市', '230100', '香坊区', '230110');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '哈尔滨市', '230100', '五常市', '230184');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '哈尔滨市', '230100', '通河县', '230128');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '哈尔滨市', '230100', '松北区', '230109');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '哈尔滨市', '230100', '双城区', '230113');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '哈尔滨市', '230100', '尚志市', '230183');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '哈尔滨市', '230100', '平房区', '230108');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '哈尔滨市', '230100', '南岗区', '230103');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '哈尔滨市', '230100', '木兰县', '230127');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '哈尔滨市', '230100', '呼兰区', '230111');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '哈尔滨市', '230100', '方正县', '230124');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '哈尔滨市', '230100', '道外区', '230104');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '哈尔滨市', '230100', '道里区', '230102');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '哈尔滨市', '230100', '宾县', '230125');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '鹤岗市', '230400', '东山区', '230406');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '鹤岗市', '230400', '兴安区', '230405');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '鹤岗市', '230400', '兴山区', '230407');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '鹤岗市', '230400', '绥滨县', '230422');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '鹤岗市', '230400', '萝北县', '230421');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '鹤岗市', '230400', '向阳区', '230402');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '鹤岗市', '230400', '南山区', '230404');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '鹤岗市', '230400', '工农区', '230403');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '黑河市', '231100', '爱辉区', '231102');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '黑河市', '231100', '孙吴县', '231124');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '黑河市', '231100', '逊克县', '231123');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '黑河市', '231100', '北安市', '231181');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '黑河市', '231100', '嫩江市', '231183');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '黑河市', '231100', '五大连池市', '231182');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '鸡西市', '230300', '鸡东县', '230321');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '鸡西市', '230300', '密山市', '230382');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '鸡西市', '230300', '虎林市', '230381');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '鸡西市', '230300', '城子河区', '230306');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '鸡西市', '230300', '梨树区', '230305');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '鸡西市', '230300', '恒山区', '230303');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '鸡西市', '230300', '鸡冠区', '230302');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '鸡西市', '230300', '滴道区', '230304');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '佳木斯市', '230800', '东风区', '230805');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '佳木斯市', '230800', '同江市', '230881');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '佳木斯市', '230800', '桦南县', '230822');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '佳木斯市', '230800', '向阳区', '230803');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '佳木斯市', '230800', '汤原县', '230828');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '佳木斯市', '230800', '前进区', '230804');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '佳木斯市', '230800', '郊区', '230811');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '佳木斯市', '230800', '桦川县', '230826');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '佳木斯市', '230800', '富锦市', '230882');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '佳木斯市', '230800', '抚远市', '230883');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '牡丹江市', '231000', '东安区', '231002');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '牡丹江市', '231000', '阳明区', '231003');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '牡丹江市', '231000', '爱民区', '231004');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '牡丹江市', '231000', '海林市', '231083');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '牡丹江市', '231000', '穆棱市', '231085');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '牡丹江市', '231000', '西安区', '231005');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '牡丹江市', '231000', '宁安市', '231084');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '牡丹江市', '231000', '林口县', '231025');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '牡丹江市', '231000', '东宁市', '231086');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '七台河市', '230900', '新兴区', '230902');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '七台河市', '230900', '桃山区', '230903');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '七台河市', '230900', '茄子河区', '230904');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '七台河市', '230900', '勃利县', '230921');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '齐齐哈尔市', '230200', '甘南县', '230225');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '齐齐哈尔市', '230200', '克东县', '230230');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '齐齐哈尔市', '230200', '铁锋区', '230204');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '齐齐哈尔市', '230200', '富裕县', '230227');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '齐齐哈尔市', '230200', '泰来县', '230224');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '齐齐哈尔市', '230200', '建华区', '230203');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '齐齐哈尔市', '230200', '碾子山区', '230207');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '齐齐哈尔市', '230200', '讷河市', '230281');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '齐齐哈尔市', '230200', '克山县', '230229');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '齐齐哈尔市', '230200', '梅里斯达斡尔族区', '230208');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '齐齐哈尔市', '230200', '龙沙区', '230202');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '齐齐哈尔市', '230200', '昂昂溪区', '230205');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '齐齐哈尔市', '230200', '龙江县', '230221');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '齐齐哈尔市', '230200', '富拉尔基区', '230206');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '齐齐哈尔市', '230200', '拜泉县', '230231');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '齐齐哈尔市', '230200', '依安县', '230223');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '双鸭山市', '230500', '四方台区', '230505');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '双鸭山市', '230500', '宝山区', '230506');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '双鸭山市', '230500', '尖山区', '230502');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '双鸭山市', '230500', '饶河县', '230524');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '双鸭山市', '230500', '岭东区', '230503');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '双鸭山市', '230500', '集贤县', '230521');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '双鸭山市', '230500', '友谊县', '230522');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '双鸭山市', '230500', '宝清县', '230523');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '绥化市', '231200', '兰西县', '231222');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '绥化市', '231200', '望奎县', '231221');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '绥化市', '231200', '北林区', '231202');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '绥化市', '231200', '绥棱县', '231226');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '绥化市', '231200', '庆安县', '231224');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '绥化市', '231200', '青冈县', '231223');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '绥化市', '231200', '安达市', '231281');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '绥化市', '231200', '明水县', '231225');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '绥化市', '231200', '肇东市', '231282');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '绥化市', '231200', '海伦市', '231283');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '鸡西市', '230300', '麻山区', '230307');
INSERT INTO `region` VALUES ('贵州省', '520000', '贵阳市', '520100', '观山湖区', '520115');
INSERT INTO `region` VALUES ('贵州省', '520000', '贵阳市', '520100', '白云区', '520113');
INSERT INTO `region` VALUES ('贵州省', '520000', '贵阳市', '520100', '花溪区', '520111');
INSERT INTO `region` VALUES ('贵州省', '520000', '贵阳市', '520100', '清镇市', '520181');
INSERT INTO `region` VALUES ('贵州省', '520000', '贵阳市', '520100', '息烽县', '520122');
INSERT INTO `region` VALUES ('贵州省', '520000', '贵阳市', '520100', '开阳县', '520121');
INSERT INTO `region` VALUES ('贵州省', '520000', '贵阳市', '520100', '南明区', '520102');
INSERT INTO `region` VALUES ('贵州省', '520000', '贵阳市', '520100', '乌当区', '520112');
INSERT INTO `region` VALUES ('贵州省', '520000', '贵阳市', '520100', '修文县', '520123');
INSERT INTO `region` VALUES ('贵州省', '520000', '贵阳市', '520100', '云岩区', '520103');
INSERT INTO `region` VALUES ('贵州省', '520000', '安顺市', '520400', '紫云苗族布依族自治县', '520425');
INSERT INTO `region` VALUES ('贵州省', '520000', '安顺市', '520400', '镇宁布依族苗族自治县', '520423');
INSERT INTO `region` VALUES ('贵州省', '520000', '安顺市', '520400', '平坝区', '520403');
INSERT INTO `region` VALUES ('贵州省', '520000', '安顺市', '520400', '普定县', '520422');
INSERT INTO `region` VALUES ('贵州省', '520000', '安顺市', '520400', '关岭布依族苗族自治县', '520424');
INSERT INTO `region` VALUES ('贵州省', '520000', '安顺市', '520400', '西秀区', '520402');
INSERT INTO `region` VALUES ('贵州省', '520000', '六盘水市', '520200', '六枝特区', '520203');
INSERT INTO `region` VALUES ('贵州省', '520000', '六盘水市', '520200', '盘州市', '520281');
INSERT INTO `region` VALUES ('贵州省', '520000', '六盘水市', '520200', '水城区', '520204');
INSERT INTO `region` VALUES ('贵州省', '520000', '六盘水市', '520200', '钟山区', '520201');
INSERT INTO `region` VALUES ('贵州省', '520000', '黔东南苗族侗族自治州', '522600', '天柱县', '522627');
INSERT INTO `region` VALUES ('贵州省', '520000', '黔东南苗族侗族自治州', '522600', '台江县', '522630');
INSERT INTO `region` VALUES ('贵州省', '520000', '黔东南苗族侗族自治州', '522600', '施秉县', '522623');
INSERT INTO `region` VALUES ('贵州省', '520000', '黔东南苗族侗族自治州', '522600', '三穗县', '522624');
INSERT INTO `region` VALUES ('贵州省', '520000', '黔东南苗族侗族自治州', '522600', '麻江县', '522635');
INSERT INTO `region` VALUES ('贵州省', '520000', '黔东南苗族侗族自治州', '522600', '黎平县', '522631');
INSERT INTO `region` VALUES ('贵州省', '520000', '黔东南苗族侗族自治州', '522600', '凯里市', '522601');
INSERT INTO `region` VALUES ('贵州省', '520000', '黔东南苗族侗族自治州', '522600', '锦屏县', '522628');
INSERT INTO `region` VALUES ('贵州省', '520000', '黔东南苗族侗族自治州', '522600', '剑河县', '522629');
INSERT INTO `region` VALUES ('贵州省', '520000', '黔东南苗族侗族自治州', '522600', '黄平县', '522622');
INSERT INTO `region` VALUES ('贵州省', '520000', '黔东南苗族侗族自治州', '522600', '丹寨县', '522636');
INSERT INTO `region` VALUES ('贵州省', '520000', '黔东南苗族侗族自治州', '522600', '岑巩县', '522626');
INSERT INTO `region` VALUES ('贵州省', '520000', '黔东南苗族侗族自治州', '522600', '从江县', '522633');
INSERT INTO `region` VALUES ('贵州省', '520000', '黔东南苗族侗族自治州', '522600', '榕江县', '522632');
INSERT INTO `region` VALUES ('贵州省', '520000', '黔东南苗族侗族自治州', '522600', '雷山县', '522634');
INSERT INTO `region` VALUES ('贵州省', '520000', '黔东南苗族侗族自治州', '522600', '镇远县', '522625');
INSERT INTO `region` VALUES ('贵州省', '520000', '黔南布依族苗族自治州', '522700', '都匀市', '522701');
INSERT INTO `region` VALUES ('贵州省', '520000', '黔南布依族苗族自治州', '522700', '独山县', '522726');
INSERT INTO `region` VALUES ('贵州省', '520000', '黔南布依族苗族自治州', '522700', '福泉市', '522702');
INSERT INTO `region` VALUES ('贵州省', '520000', '黔南布依族苗族自治州', '522700', '贵定县', '522723');
INSERT INTO `region` VALUES ('贵州省', '520000', '黔南布依族苗族自治州', '522700', '惠水县', '522731');
INSERT INTO `region` VALUES ('贵州省', '520000', '黔南布依族苗族自治州', '522700', '荔波县', '522722');
INSERT INTO `region` VALUES ('贵州省', '520000', '黔南布依族苗族自治州', '522700', '龙里县', '522730');
INSERT INTO `region` VALUES ('贵州省', '520000', '黔南布依族苗族自治州', '522700', '罗甸县', '522728');
INSERT INTO `region` VALUES ('贵州省', '520000', '黔南布依族苗族自治州', '522700', '平塘县', '522727');
INSERT INTO `region` VALUES ('贵州省', '520000', '黔南布依族苗族自治州', '522700', '三都水族自治县', '522732');
INSERT INTO `region` VALUES ('贵州省', '520000', '黔南布依族苗族自治州', '522700', '瓮安县', '522725');
INSERT INTO `region` VALUES ('贵州省', '520000', '黔南布依族苗族自治州', '522700', '长顺县', '522729');
INSERT INTO `region` VALUES ('贵州省', '520000', '黔西南布依族苗族自治州', '522300', '安龙县', '522328');
INSERT INTO `region` VALUES ('贵州省', '520000', '黔西南布依族苗族自治州', '522300', '望谟县', '522326');
INSERT INTO `region` VALUES ('贵州省', '520000', '黔西南布依族苗族自治州', '522300', '册亨县', '522327');
INSERT INTO `region` VALUES ('贵州省', '520000', '黔西南布依族苗族自治州', '522300', '兴义市', '522301');
INSERT INTO `region` VALUES ('贵州省', '520000', '黔西南布依族苗族自治州', '522300', '兴仁市', '522302');
INSERT INTO `region` VALUES ('贵州省', '520000', '黔西南布依族苗族自治州', '522300', '贞丰县', '522325');
INSERT INTO `region` VALUES ('贵州省', '520000', '黔西南布依族苗族自治州', '522300', '晴隆县', '522324');
INSERT INTO `region` VALUES ('贵州省', '520000', '黔西南布依族苗族自治州', '522300', '普安县', '522323');
INSERT INTO `region` VALUES ('贵州省', '520000', '铜仁市', '520600', '玉屏侗族自治县', '520622');
INSERT INTO `region` VALUES ('贵州省', '520000', '铜仁市', '520600', '印江土家族苗族自治县', '520625');
INSERT INTO `region` VALUES ('贵州省', '520000', '铜仁市', '520600', '沿河土家族自治县', '520627');
INSERT INTO `region` VALUES ('贵州省', '520000', '铜仁市', '520600', '万山区', '520603');
INSERT INTO `region` VALUES ('贵州省', '520000', '铜仁市', '520600', '松桃苗族自治县', '520628');
INSERT INTO `region` VALUES ('贵州省', '520000', '铜仁市', '520600', '思南县', '520624');
INSERT INTO `region` VALUES ('贵州省', '520000', '铜仁市', '520600', '石阡县', '520623');
INSERT INTO `region` VALUES ('贵州省', '520000', '铜仁市', '520600', '江口县', '520621');
INSERT INTO `region` VALUES ('贵州省', '520000', '铜仁市', '520600', '德江县', '520626');
INSERT INTO `region` VALUES ('贵州省', '520000', '铜仁市', '520600', '碧江区', '520602');
INSERT INTO `region` VALUES ('贵州省', '520000', '遵义市', '520300', '播州区', '520304');
INSERT INTO `region` VALUES ('贵州省', '520000', '遵义市', '520300', '赤水市', '520381');
INSERT INTO `region` VALUES ('贵州省', '520000', '遵义市', '520300', '道真仡佬族苗族自治县', '520325');
INSERT INTO `region` VALUES ('贵州省', '520000', '遵义市', '520300', '红花岗区', '520302');
INSERT INTO `region` VALUES ('贵州省', '520000', '遵义市', '520300', '汇川区', '520303');
INSERT INTO `region` VALUES ('贵州省', '520000', '遵义市', '520300', '湄潭县', '520328');
INSERT INTO `region` VALUES ('贵州省', '520000', '遵义市', '520300', '仁怀市', '520382');
INSERT INTO `region` VALUES ('贵州省', '520000', '遵义市', '520300', '绥阳县', '520323');
INSERT INTO `region` VALUES ('贵州省', '520000', '遵义市', '520300', '桐梓县', '520322');
INSERT INTO `region` VALUES ('贵州省', '520000', '遵义市', '520300', '务川仡佬族苗族自治县', '520326');
INSERT INTO `region` VALUES ('贵州省', '520000', '遵义市', '520300', '习水县', '520330');
INSERT INTO `region` VALUES ('贵州省', '520000', '遵义市', '520300', '余庆县', '520329');
INSERT INTO `region` VALUES ('贵州省', '520000', '遵义市', '520300', '正安县', '520324');
INSERT INTO `region` VALUES ('安徽省', '340000', '合肥市', '340100', '肥东县', '340122');
INSERT INTO `region` VALUES ('安徽省', '340000', '合肥市', '340100', '长丰县', '340121');
INSERT INTO `region` VALUES ('安徽省', '340000', '合肥市', '340100', '蜀山区', '340104');
INSERT INTO `region` VALUES ('安徽省', '340000', '合肥市', '340100', '包河区', '340111');
INSERT INTO `region` VALUES ('安徽省', '340000', '合肥市', '340100', '庐阳区', '340103');
INSERT INTO `region` VALUES ('安徽省', '340000', '合肥市', '340100', '庐江县', '340124');
INSERT INTO `region` VALUES ('安徽省', '340000', '合肥市', '340100', '巢湖市', '340181');
INSERT INTO `region` VALUES ('安徽省', '340000', '合肥市', '340100', '肥西县', '340123');
INSERT INTO `region` VALUES ('安徽省', '340000', '滁州市', '341100', '定远县', '341125');
INSERT INTO `region` VALUES ('安徽省', '340000', '滁州市', '341100', '天长市', '341181');
INSERT INTO `region` VALUES ('安徽省', '340000', '滁州市', '341100', '全椒县', '341124');
INSERT INTO `region` VALUES ('安徽省', '340000', '滁州市', '341100', '南谯区', '341103');
INSERT INTO `region` VALUES ('安徽省', '340000', '滁州市', '341100', '明光市', '341182');
INSERT INTO `region` VALUES ('安徽省', '340000', '滁州市', '341100', '琅琊区', '341102');
INSERT INTO `region` VALUES ('安徽省', '340000', '滁州市', '341100', '来安县', '341122');
INSERT INTO `region` VALUES ('安徽省', '340000', '滁州市', '341100', '凤阳县', '341126');
INSERT INTO `region` VALUES ('安徽省', '340000', '安庆市', '340800', '大观区', '340803');
INSERT INTO `region` VALUES ('安徽省', '340000', '安庆市', '340800', '岳西县', '340828');
INSERT INTO `region` VALUES ('安徽省', '340000', '安庆市', '340800', '迎江区', '340802');
INSERT INTO `region` VALUES ('安徽省', '340000', '安庆市', '340800', '宜秀区', '340811');
INSERT INTO `region` VALUES ('安徽省', '340000', '安庆市', '340800', '宿松县', '340826');
INSERT INTO `region` VALUES ('安徽省', '340000', '安庆市', '340800', '望江县', '340827');
INSERT INTO `region` VALUES ('安徽省', '340000', '安庆市', '340800', '桐城市', '340881');
INSERT INTO `region` VALUES ('安徽省', '340000', '安庆市', '340800', '太湖县', '340825');
INSERT INTO `region` VALUES ('安徽省', '340000', '安庆市', '340800', '潜山市', '340882');
INSERT INTO `region` VALUES ('安徽省', '340000', '安庆市', '340800', '怀宁县', '340822');
INSERT INTO `region` VALUES ('安徽省', '340000', '蚌埠市', '340300', '蚌山区', '340303');
INSERT INTO `region` VALUES ('安徽省', '340000', '蚌埠市', '340300', '禹会区', '340304');
INSERT INTO `region` VALUES ('安徽省', '340000', '蚌埠市', '340300', '五河县', '340322');
INSERT INTO `region` VALUES ('安徽省', '340000', '蚌埠市', '340300', '龙子湖区', '340302');
INSERT INTO `region` VALUES ('安徽省', '340000', '蚌埠市', '340300', '淮上区', '340311');
INSERT INTO `region` VALUES ('安徽省', '340000', '蚌埠市', '340300', '怀远县', '340321');
INSERT INTO `region` VALUES ('安徽省', '340000', '亳州市', '341600', '利辛县', '341623');
INSERT INTO `region` VALUES ('安徽省', '340000', '亳州市', '341600', '谯城区', '341602');
INSERT INTO `region` VALUES ('安徽省', '340000', '亳州市', '341600', '涡阳县', '341621');
INSERT INTO `region` VALUES ('安徽省', '340000', '亳州市', '341600', '蒙城县', '341622');
INSERT INTO `region` VALUES ('安徽省', '340000', '池州市', '341700', '贵池区', '341702');
INSERT INTO `region` VALUES ('安徽省', '340000', '池州市', '341700', '东至县', '341721');
INSERT INTO `region` VALUES ('安徽省', '340000', '池州市', '341700', '石台县', '341722');
INSERT INTO `region` VALUES ('安徽省', '340000', '池州市', '341700', '青阳县', '341723');
INSERT INTO `region` VALUES ('安徽省', '340000', '阜阳市', '341200', '临泉县', '341221');
INSERT INTO `region` VALUES ('安徽省', '340000', '阜阳市', '341200', '颍州区', '341202');
INSERT INTO `region` VALUES ('安徽省', '340000', '阜阳市', '341200', '颍泉区', '341204');
INSERT INTO `region` VALUES ('安徽省', '340000', '阜阳市', '341200', '颍上县', '341226');
INSERT INTO `region` VALUES ('安徽省', '340000', '阜阳市', '341200', '阜南县', '341225');
INSERT INTO `region` VALUES ('安徽省', '340000', '阜阳市', '341200', '颍东区', '341203');
INSERT INTO `region` VALUES ('安徽省', '340000', '阜阳市', '341200', '太和县', '341222');
INSERT INTO `region` VALUES ('安徽省', '340000', '阜阳市', '341200', '界首市', '341282');
INSERT INTO `region` VALUES ('安徽省', '340000', '淮北市', '340600', '杜集区', '340602');
INSERT INTO `region` VALUES ('安徽省', '340000', '淮北市', '340600', '濉溪县', '340621');
INSERT INTO `region` VALUES ('安徽省', '340000', '淮北市', '340600', '相山区', '340603');
INSERT INTO `region` VALUES ('安徽省', '340000', '淮北市', '340600', '烈山区', '340604');
INSERT INTO `region` VALUES ('安徽省', '340000', '淮南市', '340400', '田家庵区', '340403');
INSERT INTO `region` VALUES ('安徽省', '340000', '淮南市', '340400', '寿县', '340422');
INSERT INTO `region` VALUES ('安徽省', '340000', '淮南市', '340400', '凤台县', '340421');
INSERT INTO `region` VALUES ('安徽省', '340000', '淮南市', '340400', '大通区', '340402');
INSERT INTO `region` VALUES ('安徽省', '340000', '淮南市', '340400', '潘集区', '340406');
INSERT INTO `region` VALUES ('安徽省', '340000', '淮南市', '340400', '八公山区', '340405');
INSERT INTO `region` VALUES ('安徽省', '340000', '淮南市', '340400', '谢家集区', '340404');
INSERT INTO `region` VALUES ('安徽省', '340000', '黄山市', '341000', '黄山区', '341003');
INSERT INTO `region` VALUES ('安徽省', '340000', '黄山市', '341000', '祁门县', '341024');
INSERT INTO `region` VALUES ('安徽省', '340000', '黄山市', '341000', '黟县', '341023');
INSERT INTO `region` VALUES ('安徽省', '340000', '黄山市', '341000', '休宁县', '341022');
INSERT INTO `region` VALUES ('安徽省', '340000', '黄山市', '341000', '屯溪区', '341002');
INSERT INTO `region` VALUES ('安徽省', '340000', '黄山市', '341000', '歙县', '341021');
INSERT INTO `region` VALUES ('安徽省', '340000', '黄山市', '341000', '徽州区', '341004');
INSERT INTO `region` VALUES ('安徽省', '340000', '六安市', '341500', '金寨县', '341524');
INSERT INTO `region` VALUES ('安徽省', '340000', '六安市', '341500', '舒城县', '341523');
INSERT INTO `region` VALUES ('安徽省', '340000', '六安市', '341500', '霍山县', '341525');
INSERT INTO `region` VALUES ('安徽省', '340000', '六安市', '341500', '金安区', '341502');
INSERT INTO `region` VALUES ('安徽省', '340000', '六安市', '341500', '霍邱县', '341522');
INSERT INTO `region` VALUES ('安徽省', '340000', '六安市', '341500', '裕安区', '341503');
INSERT INTO `region` VALUES ('安徽省', '340000', '马鞍山市', '340500', '含山县', '340522');
INSERT INTO `region` VALUES ('安徽省', '340000', '马鞍山市', '340500', '雨山区', '340504');
INSERT INTO `region` VALUES ('安徽省', '340000', '马鞍山市', '340500', '当涂县', '340521');
INSERT INTO `region` VALUES ('安徽省', '340000', '马鞍山市', '340500', '花山区', '340503');
INSERT INTO `region` VALUES ('安徽省', '340000', '马鞍山市', '340500', '和县', '340523');
INSERT INTO `region` VALUES ('安徽省', '340000', '马鞍山市', '340500', '博望区', '340506');
INSERT INTO `region` VALUES ('安徽省', '340000', '铜陵市', '340700', '铜官区', '340705');
INSERT INTO `region` VALUES ('安徽省', '340000', '铜陵市', '340700', '枞阳县', '340722');
INSERT INTO `region` VALUES ('安徽省', '340000', '铜陵市', '340700', '郊区', '340711');
INSERT INTO `region` VALUES ('安徽省', '340000', '铜陵市', '340700', '义安区', '340706');
INSERT INTO `region` VALUES ('安徽省', '340000', '芜湖市', '340200', '繁昌区', '340212');
INSERT INTO `region` VALUES ('安徽省', '340000', '芜湖市', '340200', '镜湖区', '340202');
INSERT INTO `region` VALUES ('安徽省', '340000', '芜湖市', '340200', '南陵县', '340223');
INSERT INTO `region` VALUES ('安徽省', '340000', '芜湖市', '340200', '鸠江区', '340207');
INSERT INTO `region` VALUES ('安徽省', '340000', '芜湖市', '340200', '弋江区', '340209');
INSERT INTO `region` VALUES ('安徽省', '340000', '芜湖市', '340200', '湾沚区', '340210');
INSERT INTO `region` VALUES ('安徽省', '340000', '芜湖市', '340200', '无为市', '340281');
INSERT INTO `region` VALUES ('安徽省', '340000', '宿州市', '341300', '砀山县', '341321');
INSERT INTO `region` VALUES ('安徽省', '340000', '宿州市', '341300', '萧县', '341322');
INSERT INTO `region` VALUES ('安徽省', '340000', '宿州市', '341300', '埇桥区', '341302');
INSERT INTO `region` VALUES ('安徽省', '340000', '宿州市', '341300', '泗县', '341324');
INSERT INTO `region` VALUES ('安徽省', '340000', '宿州市', '341300', '灵璧县', '341323');
INSERT INTO `region` VALUES ('安徽省', '340000', '宣城市', '341800', '绩溪县', '341824');
INSERT INTO `region` VALUES ('安徽省', '340000', '宣城市', '341800', '宣州区', '341802');
INSERT INTO `region` VALUES ('安徽省', '340000', '宣城市', '341800', '泾县', '341823');
INSERT INTO `region` VALUES ('安徽省', '340000', '宣城市', '341800', '宁国市', '341881');
INSERT INTO `region` VALUES ('安徽省', '340000', '宣城市', '341800', '郎溪县', '341821');
INSERT INTO `region` VALUES ('安徽省', '340000', '宣城市', '341800', '广德市', '341882');
INSERT INTO `region` VALUES ('安徽省', '340000', '宣城市', '341800', '旌德县', '341825');
INSERT INTO `region` VALUES ('河北省', '130000', '保定市', '130600', '涞水县', '130623');
INSERT INTO `region` VALUES ('河北省', '130000', '保定市', '130600', '涿州市', '130681');
INSERT INTO `region` VALUES ('河北省', '130000', '保定市', '130600', '博野县', '130637');
INSERT INTO `region` VALUES ('河北省', '130000', '保定市', '130600', '清苑区', '130608');
INSERT INTO `region` VALUES ('河北省', '130000', '保定市', '130600', '安国市', '130683');
INSERT INTO `region` VALUES ('河北省', '130000', '保定市', '130600', '徐水区', '130609');
INSERT INTO `region` VALUES ('河北省', '130000', '保定市', '130600', '蠡县', '130635');
INSERT INTO `region` VALUES ('河北省', '130000', '保定市', '130600', '望都县', '130631');
INSERT INTO `region` VALUES ('河北省', '130000', '保定市', '130600', '高碑店市', '130684');
INSERT INTO `region` VALUES ('河北省', '130000', '保定市', '130600', '雄县', '130638');
INSERT INTO `region` VALUES ('河北省', '130000', '保定市', '130600', '高阳县', '130628');
INSERT INTO `region` VALUES ('河北省', '130000', '保定市', '130600', '安新县', '130632');
INSERT INTO `region` VALUES ('河北省', '130000', '保定市', '130600', '唐县', '130627');
INSERT INTO `region` VALUES ('河北省', '130000', '保定市', '130600', '定州市', '130682');
INSERT INTO `region` VALUES ('河北省', '130000', '保定市', '130600', '顺平县', '130636');
INSERT INTO `region` VALUES ('河北省', '130000', '保定市', '130600', '容城县', '130629');
INSERT INTO `region` VALUES ('河北省', '130000', '保定市', '130600', '曲阳县', '130634');
INSERT INTO `region` VALUES ('河北省', '130000', '保定市', '130600', '阜平县', '130624');
INSERT INTO `region` VALUES ('河北省', '130000', '保定市', '130600', '莲池区', '130606');
INSERT INTO `region` VALUES ('河北省', '130000', '保定市', '130600', '竞秀区', '130602');
INSERT INTO `region` VALUES ('河北省', '130000', '保定市', '130600', '涞源县', '130630');
INSERT INTO `region` VALUES ('河北省', '130000', '保定市', '130600', '满城区', '130607');
INSERT INTO `region` VALUES ('河北省', '130000', '保定市', '130600', '易县', '130633');
INSERT INTO `region` VALUES ('河北省', '130000', '保定市', '130600', '定兴县', '130626');
INSERT INTO `region` VALUES ('河北省', '130000', '张家口市', '130700', '涿鹿县', '130731');
INSERT INTO `region` VALUES ('河北省', '130000', '张家口市', '130700', '张北县', '130722');
INSERT INTO `region` VALUES ('河北省', '130000', '张家口市', '130700', '阳原县', '130727');
INSERT INTO `region` VALUES ('河北省', '130000', '张家口市', '130700', '宣化区', '130705');
INSERT INTO `region` VALUES ('河北省', '130000', '张家口市', '130700', '下花园区', '130706');
INSERT INTO `region` VALUES ('河北省', '130000', '张家口市', '130700', '蔚县', '130726');
INSERT INTO `region` VALUES ('河北省', '130000', '张家口市', '130700', '万全区', '130708');
INSERT INTO `region` VALUES ('河北省', '130000', '张家口市', '130700', '尚义县', '130725');
INSERT INTO `region` VALUES ('河北省', '130000', '张家口市', '130700', '桥西区', '130703');
INSERT INTO `region` VALUES ('河北省', '130000', '张家口市', '130700', '桥东区', '130702');
INSERT INTO `region` VALUES ('河北省', '130000', '张家口市', '130700', '康保县', '130723');
INSERT INTO `region` VALUES ('河北省', '130000', '张家口市', '130700', '怀来县', '130730');
INSERT INTO `region` VALUES ('河北省', '130000', '张家口市', '130700', '怀安县', '130728');
INSERT INTO `region` VALUES ('河北省', '130000', '张家口市', '130700', '沽源县', '130724');
INSERT INTO `region` VALUES ('河北省', '130000', '张家口市', '130700', '崇礼区', '130709');
INSERT INTO `region` VALUES ('河北省', '130000', '张家口市', '130700', '赤城县', '130732');
INSERT INTO `region` VALUES ('河北省', '130000', '邢台市', '130500', '临西县', '130535');
INSERT INTO `region` VALUES ('河北省', '130000', '邢台市', '130500', '临城县', '130522');
INSERT INTO `region` VALUES ('河北省', '130000', '邢台市', '130500', '巨鹿县', '130529');
INSERT INTO `region` VALUES ('河北省', '130000', '邢台市', '130500', '广宗县', '130531');
INSERT INTO `region` VALUES ('河北省', '130000', '邢台市', '130500', '柏乡县', '130524');
INSERT INTO `region` VALUES ('河北省', '130000', '邢台市', '130500', '信都区', '130503');
INSERT INTO `region` VALUES ('河北省', '130000', '邢台市', '130500', '襄都区', '130502');
INSERT INTO `region` VALUES ('河北省', '130000', '邢台市', '130500', '新河县', '130530');
INSERT INTO `region` VALUES ('河北省', '130000', '邢台市', '130500', '威县', '130533');
INSERT INTO `region` VALUES ('河北省', '130000', '邢台市', '130500', '沙河市', '130582');
INSERT INTO `region` VALUES ('河北省', '130000', '邢台市', '130500', '任泽区', '130505');
INSERT INTO `region` VALUES ('河北省', '130000', '邢台市', '130500', '清河县', '130534');
INSERT INTO `region` VALUES ('河北省', '130000', '邢台市', '130500', '平乡县', '130532');
INSERT INTO `region` VALUES ('河北省', '130000', '邢台市', '130500', '宁晋县', '130528');
INSERT INTO `region` VALUES ('河北省', '130000', '邢台市', '130500', '内丘县', '130523');
INSERT INTO `region` VALUES ('河北省', '130000', '邢台市', '130500', '南和区', '130506');
INSERT INTO `region` VALUES ('河北省', '130000', '邢台市', '130500', '南宫市', '130581');
INSERT INTO `region` VALUES ('河北省', '130000', '邢台市', '130500', '隆尧县', '130525');
INSERT INTO `region` VALUES ('河北省', '130000', '唐山市', '130200', '玉田县', '130229');
INSERT INTO `region` VALUES ('河北省', '130000', '唐山市', '130200', '迁西县', '130227');
INSERT INTO `region` VALUES ('河北省', '130000', '唐山市', '130200', '迁安市', '130283');
INSERT INTO `region` VALUES ('河北省', '130000', '唐山市', '130200', '滦州市', '130284');
INSERT INTO `region` VALUES ('河北省', '130000', '唐山市', '130200', '滦南县', '130224');
INSERT INTO `region` VALUES ('河北省', '130000', '唐山市', '130200', '路南区', '130202');
INSERT INTO `region` VALUES ('河北省', '130000', '唐山市', '130200', '路北区', '130203');
INSERT INTO `region` VALUES ('河北省', '130000', '唐山市', '130200', '乐亭县', '130225');
INSERT INTO `region` VALUES ('河北省', '130000', '唐山市', '130200', '开平区', '130205');
INSERT INTO `region` VALUES ('河北省', '130000', '唐山市', '130200', '古冶区', '130204');
INSERT INTO `region` VALUES ('河北省', '130000', '唐山市', '130200', '丰润区', '130208');
INSERT INTO `region` VALUES ('河北省', '130000', '唐山市', '130200', '丰南区', '130207');
INSERT INTO `region` VALUES ('河北省', '130000', '唐山市', '130200', '曹妃甸区', '130209');
INSERT INTO `region` VALUES ('河北省', '130000', '唐山市', '130200', '遵化市', '130281');
INSERT INTO `region` VALUES ('河北省', '130000', '石家庄市', '130100', '栾城区', '130111');
INSERT INTO `region` VALUES ('河北省', '130000', '石家庄市', '130100', '鹿泉区', '130110');
INSERT INTO `region` VALUES ('河北省', '130000', '石家庄市', '130100', '灵寿县', '130126');
INSERT INTO `region` VALUES ('河北省', '130000', '石家庄市', '130100', '井陉矿区', '130107');
INSERT INTO `region` VALUES ('河北省', '130000', '石家庄市', '130100', '井陉县', '130121');
INSERT INTO `region` VALUES ('河北省', '130000', '石家庄市', '130100', '晋州市', '130183');
INSERT INTO `region` VALUES ('河北省', '130000', '石家庄市', '130100', '行唐县', '130125');
INSERT INTO `region` VALUES ('河北省', '130000', '石家庄市', '130100', '高邑县', '130127');
INSERT INTO `region` VALUES ('河北省', '130000', '石家庄市', '130100', '正定县', '130123');
INSERT INTO `region` VALUES ('河北省', '130000', '石家庄市', '130100', '赵县', '130133');
INSERT INTO `region` VALUES ('河北省', '130000', '石家庄市', '130100', '长安区', '130102');
INSERT INTO `region` VALUES ('河北省', '130000', '石家庄市', '130100', '赞皇县', '130129');
INSERT INTO `region` VALUES ('河北省', '130000', '石家庄市', '130100', '元氏县', '130132');
INSERT INTO `region` VALUES ('河北省', '130000', '石家庄市', '130100', '裕华区', '130108');
INSERT INTO `region` VALUES ('河北省', '130000', '石家庄市', '130100', '新乐市', '130184');
INSERT INTO `region` VALUES ('河北省', '130000', '石家庄市', '130100', '辛集市', '130181');
INSERT INTO `region` VALUES ('河北省', '130000', '石家庄市', '130100', '无极县', '130130');
INSERT INTO `region` VALUES ('河北省', '130000', '石家庄市', '130100', '深泽县', '130128');
INSERT INTO `region` VALUES ('河北省', '130000', '石家庄市', '130100', '平山县', '130131');
INSERT INTO `region` VALUES ('河北省', '130000', '秦皇岛市', '130300', '青龙满族自治县', '130321');
INSERT INTO `region` VALUES ('河北省', '130000', '秦皇岛市', '130300', '卢龙县', '130324');
INSERT INTO `region` VALUES ('河北省', '130000', '秦皇岛市', '130300', '海港区', '130302');
INSERT INTO `region` VALUES ('河北省', '130000', '秦皇岛市', '130300', '北戴河区', '130304');
INSERT INTO `region` VALUES ('河北省', '130000', '秦皇岛市', '130300', '抚宁区', '130306');
INSERT INTO `region` VALUES ('河北省', '130000', '秦皇岛市', '130300', '昌黎县', '130322');
INSERT INTO `region` VALUES ('河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303');
INSERT INTO `region` VALUES ('河北省', '130000', '廊坊市', '131000', '香河县', '131024');
INSERT INTO `region` VALUES ('河北省', '130000', '廊坊市', '131000', '文安县', '131026');
INSERT INTO `region` VALUES ('河北省', '130000', '廊坊市', '131000', '三河市', '131082');
INSERT INTO `region` VALUES ('河北省', '130000', '廊坊市', '131000', '广阳区', '131003');
INSERT INTO `region` VALUES ('河北省', '130000', '廊坊市', '131000', '大厂回族自治县', '131028');
INSERT INTO `region` VALUES ('河北省', '130000', '廊坊市', '131000', '固安县', '131022');
INSERT INTO `region` VALUES ('河北省', '130000', '廊坊市', '131000', '大城县', '131025');
INSERT INTO `region` VALUES ('河北省', '130000', '廊坊市', '131000', '安次区', '131002');
INSERT INTO `region` VALUES ('河北省', '130000', '廊坊市', '131000', '霸州市', '131081');
INSERT INTO `region` VALUES ('河北省', '130000', '廊坊市', '131000', '永清县', '131023');
INSERT INTO `region` VALUES ('河北省', '130000', '衡水市', '131100', '故城县', '131126');
INSERT INTO `region` VALUES ('河北省', '130000', '衡水市', '131100', '枣强县', '131121');
INSERT INTO `region` VALUES ('河北省', '130000', '衡水市', '131100', '武强县', '131123');
INSERT INTO `region` VALUES ('河北省', '130000', '衡水市', '131100', '冀州区', '131103');
INSERT INTO `region` VALUES ('河北省', '130000', '衡水市', '131100', '武邑县', '131122');
INSERT INTO `region` VALUES ('河北省', '130000', '衡水市', '131100', '景县', '131127');
INSERT INTO `region` VALUES ('河北省', '130000', '衡水市', '131100', '桃城区', '131102');
INSERT INTO `region` VALUES ('河北省', '130000', '衡水市', '131100', '深州市', '131182');
INSERT INTO `region` VALUES ('河北省', '130000', '衡水市', '131100', '饶阳县', '131124');
INSERT INTO `region` VALUES ('河北省', '130000', '衡水市', '131100', '安平县', '131125');
INSERT INTO `region` VALUES ('河北省', '130000', '衡水市', '131100', '阜城县', '131128');
INSERT INTO `region` VALUES ('河北省', '130000', '邯郸市', '130400', '永年区', '130408');
INSERT INTO `region` VALUES ('河北省', '130000', '邯郸市', '130400', '丛台区', '130403');
INSERT INTO `region` VALUES ('河北省', '130000', '邯郸市', '130400', '鸡泽县', '130431');
INSERT INTO `region` VALUES ('河北省', '130000', '邯郸市', '130400', '武安市', '130481');
INSERT INTO `region` VALUES ('河北省', '130000', '邯郸市', '130400', '峰峰矿区', '130406');
INSERT INTO `region` VALUES ('河北省', '130000', '邯郸市', '130400', '复兴区', '130404');
INSERT INTO `region` VALUES ('河北省', '130000', '邯郸市', '130400', '磁县', '130427');
INSERT INTO `region` VALUES ('河北省', '130000', '邯郸市', '130400', '魏县', '130434');
INSERT INTO `region` VALUES ('河北省', '130000', '邯郸市', '130400', '成安县', '130424');
INSERT INTO `region` VALUES ('河北省', '130000', '邯郸市', '130400', '大名县', '130425');
INSERT INTO `region` VALUES ('河北省', '130000', '邯郸市', '130400', '广平县', '130432');
INSERT INTO `region` VALUES ('河北省', '130000', '邯郸市', '130400', '涉县', '130426');
INSERT INTO `region` VALUES ('河北省', '130000', '邯郸市', '130400', '曲周县', '130435');
INSERT INTO `region` VALUES ('河北省', '130000', '邯郸市', '130400', '邱县', '130430');
INSERT INTO `region` VALUES ('河北省', '130000', '邯郸市', '130400', '馆陶县', '130433');
INSERT INTO `region` VALUES ('河北省', '130000', '邯郸市', '130400', '临漳县', '130423');
INSERT INTO `region` VALUES ('河北省', '130000', '邯郸市', '130400', '邯山区', '130402');
INSERT INTO `region` VALUES ('河北省', '130000', '承德市', '130800', '隆化县', '130825');
INSERT INTO `region` VALUES ('河北省', '130000', '承德市', '130800', '宽城满族自治县', '130827');
INSERT INTO `region` VALUES ('河北省', '130000', '承德市', '130800', '鹰手营子矿区', '130804');
INSERT INTO `region` VALUES ('河北省', '130000', '承德市', '130800', '兴隆县', '130822');
INSERT INTO `region` VALUES ('河北省', '130000', '承德市', '130800', '承德县', '130821');
INSERT INTO `region` VALUES ('河北省', '130000', '承德市', '130800', '围场满族蒙古族自治县', '130828');
INSERT INTO `region` VALUES ('河北省', '130000', '承德市', '130800', '丰宁满族自治县', '130826');
INSERT INTO `region` VALUES ('河北省', '130000', '承德市', '130800', '双桥区', '130802');
INSERT INTO `region` VALUES ('河北省', '130000', '承德市', '130800', '双滦区', '130803');
INSERT INTO `region` VALUES ('河北省', '130000', '承德市', '130800', '滦平县', '130824');
INSERT INTO `region` VALUES ('河北省', '130000', '承德市', '130800', '平泉市', '130881');
INSERT INTO `region` VALUES ('河北省', '130000', '沧州市', '130900', '海兴县', '130924');
INSERT INTO `region` VALUES ('河北省', '130000', '沧州市', '130900', '河间市', '130984');
INSERT INTO `region` VALUES ('河北省', '130000', '沧州市', '130900', '泊头市', '130981');
INSERT INTO `region` VALUES ('河北省', '130000', '沧州市', '130900', '南皮县', '130927');
INSERT INTO `region` VALUES ('河北省', '130000', '沧州市', '130900', '沧县', '130921');
INSERT INTO `region` VALUES ('河北省', '130000', '沧州市', '130900', '孟村回族自治县', '130930');
INSERT INTO `region` VALUES ('河北省', '130000', '沧州市', '130900', '青县', '130922');
INSERT INTO `region` VALUES ('河北省', '130000', '沧州市', '130900', '任丘市', '130982');
INSERT INTO `region` VALUES ('河北省', '130000', '沧州市', '130900', '献县', '130929');
INSERT INTO `region` VALUES ('河北省', '130000', '沧州市', '130900', '运河区', '130903');
INSERT INTO `region` VALUES ('河北省', '130000', '沧州市', '130900', '黄骅市', '130983');
INSERT INTO `region` VALUES ('河北省', '130000', '沧州市', '130900', '肃宁县', '130926');
INSERT INTO `region` VALUES ('河北省', '130000', '沧州市', '130900', '吴桥县', '130928');
INSERT INTO `region` VALUES ('河北省', '130000', '沧州市', '130900', '东光县', '130923');
INSERT INTO `region` VALUES ('河北省', '130000', '沧州市', '130900', '新华区', '130902');
INSERT INTO `region` VALUES ('河北省', '130000', '沧州市', '130900', '盐山县', '130925');
INSERT INTO `region` VALUES ('山西省', '140000', '长治市', '140400', '黎城县', '140426');
INSERT INTO `region` VALUES ('宁夏回族自治区', '640000', '固原市', '640400', '泾源县', '640424');
INSERT INTO `region` VALUES ('宁夏回族自治区', '640000', '固原市', '640400', '原州区', '640402');
INSERT INTO `region` VALUES ('宁夏回族自治区', '640000', '固原市', '640400', '西吉县', '640422');
INSERT INTO `region` VALUES ('宁夏回族自治区', '640000', '固原市', '640400', '彭阳县', '640425');
INSERT INTO `region` VALUES ('宁夏回族自治区', '640000', '固原市', '640400', '隆德县', '640423');
INSERT INTO `region` VALUES ('宁夏回族自治区', '640000', '石嘴山市', '640200', '大武口区', '640202');
INSERT INTO `region` VALUES ('宁夏回族自治区', '640000', '石嘴山市', '640200', '平罗县', '640221');
INSERT INTO `region` VALUES ('宁夏回族自治区', '640000', '石嘴山市', '640200', '惠农区', '640205');
INSERT INTO `region` VALUES ('宁夏回族自治区', '640000', '吴忠市', '640300', '利通区', '640302');
INSERT INTO `region` VALUES ('宁夏回族自治区', '640000', '吴忠市', '640300', '盐池县', '640323');
INSERT INTO `region` VALUES ('宁夏回族自治区', '640000', '吴忠市', '640300', '同心县', '640324');
INSERT INTO `region` VALUES ('宁夏回族自治区', '640000', '吴忠市', '640300', '红寺堡区', '640303');
INSERT INTO `region` VALUES ('宁夏回族自治区', '640000', '吴忠市', '640300', '青铜峡市', '640381');
INSERT INTO `region` VALUES ('宁夏回族自治区', '640000', '银川市', '640100', '兴庆区', '640104');
INSERT INTO `region` VALUES ('宁夏回族自治区', '640000', '银川市', '640100', '贺兰县', '640122');
INSERT INTO `region` VALUES ('宁夏回族自治区', '640000', '银川市', '640100', '西夏区', '640105');
INSERT INTO `region` VALUES ('宁夏回族自治区', '640000', '银川市', '640100', '金凤区', '640106');
INSERT INTO `region` VALUES ('宁夏回族自治区', '640000', '中卫市', '640500', '沙坡头区', '640502');
INSERT INTO `region` VALUES ('宁夏回族自治区', '640000', '中卫市', '640500', '海原县', '640522');
INSERT INTO `region` VALUES ('宁夏回族自治区', '640000', '中卫市', '640500', '中宁县', '640521');
INSERT INTO `region` VALUES ('宁夏回族自治区', '640000', '银川市', '640100', '永宁县', '640121');
INSERT INTO `region` VALUES ('云南省', '530000', '昆明市', '530100', '呈贡区', '530114');
INSERT INTO `region` VALUES ('云南省', '530000', '昆明市', '530100', '安宁市', '530181');
INSERT INTO `region` VALUES ('云南省', '530000', '昆明市', '530100', '宜良县', '530125');
INSERT INTO `region` VALUES ('云南省', '530000', '昆明市', '530100', '寻甸回族彝族自治县', '530129');
INSERT INTO `region` VALUES ('云南省', '530000', '昆明市', '530100', '西山区', '530112');
INSERT INTO `region` VALUES ('云南省', '530000', '昆明市', '530100', '五华区', '530102');
INSERT INTO `region` VALUES ('云南省', '530000', '昆明市', '530100', '富民县', '530124');
INSERT INTO `region` VALUES ('云南省', '530000', '昆明市', '530100', '盘龙区', '530103');
INSERT INTO `region` VALUES ('云南省', '530000', '昆明市', '530100', '嵩明县', '530127');
INSERT INTO `region` VALUES ('云南省', '530000', '昆明市', '530100', '石林彝族自治县', '530126');
INSERT INTO `region` VALUES ('云南省', '530000', '昆明市', '530100', '官渡区', '530111');
INSERT INTO `region` VALUES ('云南省', '530000', '昆明市', '530100', '禄劝彝族苗族自治县', '530128');
INSERT INTO `region` VALUES ('云南省', '530000', '昆明市', '530100', '东川区', '530113');
INSERT INTO `region` VALUES ('云南省', '530000', '昆明市', '530100', '晋宁区', '530115');
INSERT INTO `region` VALUES ('云南省', '530000', '曲靖市', '530300', '富源县', '530325');
INSERT INTO `region` VALUES ('云南省', '530000', '曲靖市', '530300', '会泽县', '530326');
INSERT INTO `region` VALUES ('云南省', '530000', '曲靖市', '530300', '陆良县', '530322');
INSERT INTO `region` VALUES ('云南省', '530000', '曲靖市', '530300', '罗平县', '530324');
INSERT INTO `region` VALUES ('云南省', '530000', '曲靖市', '530300', '马龙区', '530304');
INSERT INTO `region` VALUES ('云南省', '530000', '曲靖市', '530300', '麒麟区', '530302');
INSERT INTO `region` VALUES ('云南省', '530000', '曲靖市', '530300', '师宗县', '530323');
INSERT INTO `region` VALUES ('云南省', '530000', '曲靖市', '530300', '宣威市', '530381');
INSERT INTO `region` VALUES ('云南省', '530000', '曲靖市', '530300', '沾益区', '530303');
INSERT INTO `region` VALUES ('云南省', '530000', '保山市', '530500', '昌宁县', '530524');
INSERT INTO `region` VALUES ('云南省', '530000', '保山市', '530500', '腾冲市', '530581');
INSERT INTO `region` VALUES ('云南省', '530000', '保山市', '530500', '施甸县', '530521');
INSERT INTO `region` VALUES ('云南省', '530000', '保山市', '530500', '隆阳区', '530502');
INSERT INTO `region` VALUES ('云南省', '530000', '保山市', '530500', '龙陵县', '530523');
INSERT INTO `region` VALUES ('云南省', '530000', '楚雄彝族自治州', '532300', '元谋县', '532328');
INSERT INTO `region` VALUES ('云南省', '530000', '楚雄彝族自治州', '532300', '永仁县', '532327');
INSERT INTO `region` VALUES ('云南省', '530000', '楚雄彝族自治州', '532300', '牟定县', '532323');
INSERT INTO `region` VALUES ('云南省', '530000', '楚雄彝族自治州', '532300', '武定县', '532329');
INSERT INTO `region` VALUES ('云南省', '530000', '楚雄彝族自治州', '532300', '大姚县', '532326');
INSERT INTO `region` VALUES ('云南省', '530000', '楚雄彝族自治州', '532300', '姚安县', '532325');
INSERT INTO `region` VALUES ('云南省', '530000', '楚雄彝族自治州', '532300', '双柏县', '532322');
INSERT INTO `region` VALUES ('云南省', '530000', '楚雄彝族自治州', '532300', '南华县', '532324');
INSERT INTO `region` VALUES ('云南省', '530000', '楚雄彝族自治州', '532300', '禄丰市', '532302');
INSERT INTO `region` VALUES ('云南省', '530000', '楚雄彝族自治州', '532300', '楚雄市', '532301');
INSERT INTO `region` VALUES ('云南省', '530000', '德宏傣族景颇族自治州', '533100', '陇川县', '533124');
INSERT INTO `region` VALUES ('云南省', '530000', '德宏傣族景颇族自治州', '533100', '梁河县', '533122');
INSERT INTO `region` VALUES ('云南省', '530000', '德宏傣族景颇族自治州', '533100', '芒市', '533103');
INSERT INTO `region` VALUES ('云南省', '530000', '德宏傣族景颇族自治州', '533100', '盈江县', '533123');
INSERT INTO `region` VALUES ('云南省', '530000', '德宏傣族景颇族自治州', '533100', '瑞丽市', '533102');
INSERT INTO `region` VALUES ('云南省', '530000', '迪庆藏族自治州', '533400', '维西傈僳族自治县', '533423');
INSERT INTO `region` VALUES ('云南省', '530000', '迪庆藏族自治州', '533400', '香格里拉市', '533401');
INSERT INTO `region` VALUES ('云南省', '530000', '迪庆藏族自治州', '533400', '德钦县', '533422');
INSERT INTO `region` VALUES ('云南省', '530000', '红河哈尼族彝族自治州', '532500', '个旧市', '532501');
INSERT INTO `region` VALUES ('云南省', '530000', '红河哈尼族彝族自治州', '532500', '元阳县', '532528');
INSERT INTO `region` VALUES ('云南省', '530000', '红河哈尼族彝族自治州', '532500', '石屏县', '532525');
INSERT INTO `region` VALUES ('云南省', '530000', '红河哈尼族彝族自治州', '532500', '屏边苗族自治县', '532523');
INSERT INTO `region` VALUES ('云南省', '530000', '红河哈尼族彝族自治州', '532500', '河口瑶族自治县', '532532');
INSERT INTO `region` VALUES ('云南省', '530000', '红河哈尼族彝族自治州', '532500', '弥勒市', '532504');
INSERT INTO `region` VALUES ('云南省', '530000', '红河哈尼族彝族自治州', '532500', '蒙自市', '532503');
INSERT INTO `region` VALUES ('云南省', '530000', '红河哈尼族彝族自治州', '532500', '绿春县', '532531');
INSERT INTO `region` VALUES ('云南省', '530000', '红河哈尼族彝族自治州', '532500', '泸西县', '532527');
INSERT INTO `region` VALUES ('云南省', '530000', '红河哈尼族彝族自治州', '532500', '红河县', '532529');
INSERT INTO `region` VALUES ('云南省', '530000', '红河哈尼族彝族自治州', '532500', '开远市', '532502');
INSERT INTO `region` VALUES ('云南省', '530000', '红河哈尼族彝族自治州', '532500', '金平苗族瑶族傣族自治县', '532530');
INSERT INTO `region` VALUES ('云南省', '530000', '红河哈尼族彝族自治州', '532500', '建水县', '532524');
INSERT INTO `region` VALUES ('云南省', '530000', '丽江市', '530700', '古城区', '530702');
INSERT INTO `region` VALUES ('云南省', '530000', '丽江市', '530700', '玉龙纳西族自治县', '530721');
INSERT INTO `region` VALUES ('云南省', '530000', '丽江市', '530700', '永胜县', '530722');
INSERT INTO `region` VALUES ('云南省', '530000', '丽江市', '530700', '宁蒗彝族自治县', '530724');
INSERT INTO `region` VALUES ('云南省', '530000', '丽江市', '530700', '华坪县', '530723');
INSERT INTO `region` VALUES ('云南省', '530000', '普洱市', '530800', '江城哈尼族彝族自治县', '530826');
INSERT INTO `region` VALUES ('云南省', '530000', '普洱市', '530800', '墨江哈尼族自治县', '530822');
INSERT INTO `region` VALUES ('云南省', '530000', '普洱市', '530800', '镇沅彝族哈尼族拉祜族自治县', '530825');
INSERT INTO `region` VALUES ('云南省', '530000', '普洱市', '530800', '西盟佤族自治县', '530829');
INSERT INTO `region` VALUES ('云南省', '530000', '普洱市', '530800', '思茅区', '530802');
INSERT INTO `region` VALUES ('云南省', '530000', '普洱市', '530800', '宁洱哈尼族彝族自治县', '530821');
INSERT INTO `region` VALUES ('云南省', '530000', '普洱市', '530800', '孟连傣族拉祜族佤族自治县', '530827');
INSERT INTO `region` VALUES ('云南省', '530000', '普洱市', '530800', '澜沧拉祜族自治县', '530828');
INSERT INTO `region` VALUES ('云南省', '530000', '普洱市', '530800', '景谷傣族彝族自治县', '530824');
INSERT INTO `region` VALUES ('云南省', '530000', '普洱市', '530800', '景东彝族自治县', '530823');
INSERT INTO `region` VALUES ('云南省', '530000', '玉溪市', '530400', '澄江市', '530481');
INSERT INTO `region` VALUES ('云南省', '530000', '玉溪市', '530400', '元江哈尼族彝族傣族自治县', '530428');
INSERT INTO `region` VALUES ('云南省', '530000', '玉溪市', '530400', '易门县', '530425');
INSERT INTO `region` VALUES ('云南省', '530000', '玉溪市', '530400', '新平彝族傣族自治县', '530427');
INSERT INTO `region` VALUES ('云南省', '530000', '玉溪市', '530400', '通海县', '530423');
INSERT INTO `region` VALUES ('云南省', '530000', '玉溪市', '530400', '江川区', '530403');
INSERT INTO `region` VALUES ('云南省', '530000', '玉溪市', '530400', '华宁县', '530424');
INSERT INTO `region` VALUES ('云南省', '530000', '玉溪市', '530400', '红塔区', '530402');
INSERT INTO `region` VALUES ('云南省', '530000', '玉溪市', '530400', '峨山彝族自治县', '530426');
INSERT INTO `region` VALUES ('云南省', '530000', '昭通市', '530600', '绥江县', '530626');
INSERT INTO `region` VALUES ('云南省', '530000', '昭通市', '530600', '水富市', '530681');
INSERT INTO `region` VALUES ('云南省', '530000', '昭通市', '530600', '巧家县', '530622');
INSERT INTO `region` VALUES ('云南省', '530000', '昭通市', '530600', '鲁甸县', '530621');
INSERT INTO `region` VALUES ('云南省', '530000', '昭通市', '530600', '大关县', '530624');
INSERT INTO `region` VALUES ('云南省', '530000', '昭通市', '530600', '昭阳区', '530602');
INSERT INTO `region` VALUES ('云南省', '530000', '昭通市', '530600', '镇雄县', '530627');
INSERT INTO `region` VALUES ('云南省', '530000', '昭通市', '530600', '彝良县', '530628');
INSERT INTO `region` VALUES ('云南省', '530000', '昭通市', '530600', '永善县', '530625');
INSERT INTO `region` VALUES ('云南省', '530000', '昭通市', '530600', '盐津县', '530623');
INSERT INTO `region` VALUES ('云南省', '530000', '昭通市', '530600', '威信县', '530629');
INSERT INTO `region` VALUES ('云南省', '530000', '怒江傈僳族自治州', '533300', '贡山独龙族怒族自治县', '533324');
INSERT INTO `region` VALUES ('山东省', '370000', '临沂市', '371300', '沂水县', '371323');
INSERT INTO `region` VALUES ('山东省', '370000', '临沂市', '371300', '沂南县', '371321');
INSERT INTO `region` VALUES ('山东省', '370000', '临沂市', '371300', '郯城县', '371322');
INSERT INTO `region` VALUES ('山东省', '370000', '临沂市', '371300', '平邑县', '371326');
INSERT INTO `region` VALUES ('山东省', '370000', '临沂市', '371300', '蒙阴县', '371328');
INSERT INTO `region` VALUES ('山东省', '370000', '临沂市', '371300', '罗庄区', '371311');
INSERT INTO `region` VALUES ('山东省', '370000', '临沂市', '371300', '临沭县', '371329');
INSERT INTO `region` VALUES ('山东省', '370000', '临沂市', '371300', '兰山区', '371302');
INSERT INTO `region` VALUES ('山东省', '370000', '临沂市', '371300', '兰陵县', '371324');
INSERT INTO `region` VALUES ('山东省', '370000', '临沂市', '371300', '河东区', '371312');
INSERT INTO `region` VALUES ('山东省', '370000', '临沂市', '371300', '莒南县', '371327');
INSERT INTO `region` VALUES ('山东省', '370000', '临沂市', '371300', '费县', '371325');
INSERT INTO `region` VALUES ('山东省', '370000', '东营市', '370500', '垦利区', '370505');
INSERT INTO `region` VALUES ('山东省', '370000', '东营市', '370500', '河口区', '370503');
INSERT INTO `region` VALUES ('山东省', '370000', '东营市', '370500', '广饶县', '370523');
INSERT INTO `region` VALUES ('山东省', '370000', '东营市', '370500', '东营区', '370502');
INSERT INTO `region` VALUES ('山东省', '370000', '东营市', '370500', '利津县', '370522');
INSERT INTO `region` VALUES ('山西省', '140000', '太原市', '140100', '杏花岭区', '140107');
INSERT INTO `region` VALUES ('北京市', '110000', '北京市', '110100', '房山区', '110111');
INSERT INTO `region` VALUES ('北京市', '110000', '北京市', '110100', '门头沟区', '110109');
INSERT INTO `region` VALUES ('北京市', '110000', '北京市', '110100', '顺义区', '110113');
INSERT INTO `region` VALUES ('北京市', '110000', '北京市', '110100', '朝阳区', '110105');
INSERT INTO `region` VALUES ('北京市', '110000', '北京市', '110100', '通州区', '110112');
INSERT INTO `region` VALUES ('北京市', '110000', '北京市', '110100', '西城区', '110102');
INSERT INTO `region` VALUES ('北京市', '110000', '北京市', '110100', '东城区', '110101');
INSERT INTO `region` VALUES ('北京市', '110000', '北京市', '110100', '石景山区', '110107');
INSERT INTO `region` VALUES ('北京市', '110000', '北京市', '110100', '海淀区', '110108');
INSERT INTO `region` VALUES ('北京市', '110000', '北京市', '110100', '延庆区', '110119');
INSERT INTO `region` VALUES ('北京市', '110000', '北京市', '110100', '怀柔区', '110116');
INSERT INTO `region` VALUES ('北京市', '110000', '北京市', '110100', '密云区', '110118');
INSERT INTO `region` VALUES ('北京市', '110000', '北京市', '110100', '平谷区', '110117');
INSERT INTO `region` VALUES ('北京市', '110000', '北京市', '110100', '大兴区', '110115');
INSERT INTO `region` VALUES ('北京市', '110000', '北京市', '110100', '丰台区', '110106');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '鄂尔多斯市', '150600', '康巴什区', '150603');
INSERT INTO `region` VALUES ('陕西省', '610000', '西安市', '610100', '高陵区', '610117');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '锡林郭勒盟', '152500', '太仆寺旗', '152527');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '呼伦贝尔市', '150700', '满洲里市', '150781');
INSERT INTO `region` VALUES ('内蒙古自治区', '150000', '呼伦贝尔市', '150700', '扎赉诺尔区', '150703');
INSERT INTO `region` VALUES ('台湾省', '710000', '基隆市', '719001', '基隆市', '719001');
INSERT INTO `region` VALUES ('辽宁省', '210000', '大连市', '210200', '长海县', '210224');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '贺州市', '451100', '富川瑶族自治县', '451123');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '贺州市', '451100', '平桂区', '451103');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '贺州市', '451100', '钟山县', '451122');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '贺州市', '451100', '八步区', '451102');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '贺州市', '451100', '昭平县', '451121');
INSERT INTO `region` VALUES ('广东省', '440000', '河源市', '441600', '东源县', '441625');
INSERT INTO `region` VALUES ('广东省', '440000', '河源市', '441600', '紫金县', '441621');
INSERT INTO `region` VALUES ('广东省', '440000', '河源市', '441600', '连平县', '441623');
INSERT INTO `region` VALUES ('广东省', '440000', '河源市', '441600', '和平县', '441624');
INSERT INTO `region` VALUES ('广东省', '440000', '河源市', '441600', '龙川县', '441622');
INSERT INTO `region` VALUES ('广东省', '440000', '阳江市', '441700', '阳西县', '441721');
INSERT INTO `region` VALUES ('广东省', '440000', '阳江市', '441700', '江城区', '441702');
INSERT INTO `region` VALUES ('广东省', '440000', '阳江市', '441700', '阳东区', '441704');
INSERT INTO `region` VALUES ('广东省', '440000', '阳江市', '441700', '阳春市', '441781');
INSERT INTO `region` VALUES ('广东省', '440000', '云浮市', '445300', '新兴县', '445321');
INSERT INTO `region` VALUES ('广东省', '440000', '云浮市', '445300', '云城区', '445302');
INSERT INTO `region` VALUES ('广东省', '440000', '云浮市', '445300', '罗定市', '445381');
INSERT INTO `region` VALUES ('广东省', '440000', '云浮市', '445300', '郁南县', '445322');
INSERT INTO `region` VALUES ('广东省', '440000', '云浮市', '445300', '云安区', '445303');
INSERT INTO `region` VALUES ('广东省', '440000', '湛江市', '440800', '雷州市', '440882');
INSERT INTO `region` VALUES ('广东省', '440000', '湛江市', '440800', '吴川市', '440883');
INSERT INTO `region` VALUES ('广东省', '440000', '湛江市', '440800', '遂溪县', '440823');
INSERT INTO `region` VALUES ('广东省', '440000', '湛江市', '440800', '廉江市', '440881');
INSERT INTO `region` VALUES ('广东省', '440000', '湛江市', '440800', '徐闻县', '440825');
INSERT INTO `region` VALUES ('广东省', '440000', '江门市', '440700', '台山市', '440781');
INSERT INTO `region` VALUES ('广东省', '440000', '江门市', '440700', '恩平市', '440785');
INSERT INTO `region` VALUES ('广东省', '440000', '江门市', '440700', '开平市', '440783');
INSERT INTO `region` VALUES ('广东省', '440000', '江门市', '440700', '鹤山市', '440784');
INSERT INTO `region` VALUES ('广东省', '440000', '江门市', '440700', '江海区', '440704');
INSERT INTO `region` VALUES ('广东省', '440000', '江门市', '440700', '蓬江区', '440703');
INSERT INTO `region` VALUES ('广东省', '440000', '中山市', '442000', '中山市', '442000');
INSERT INTO `region` VALUES ('广东省', '440000', '东莞市', '441900', '东莞市', '441900');
INSERT INTO `region` VALUES ('广东省', '440000', '深圳市', '440300', '龙华区', '440309');
INSERT INTO `region` VALUES ('广东省', '440000', '深圳市', '440300', '南山区', '440305');
INSERT INTO `region` VALUES ('广东省', '440000', '深圳市', '440300', '福田区', '440304');
INSERT INTO `region` VALUES ('广东省', '440000', '深圳市', '440300', '罗湖区', '440303');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '南宁市', '450100', '马山县', '450124');
INSERT INTO `region` VALUES ('海南省', '460000', '海口市', '460100', '美兰区', '460108');
INSERT INTO `region` VALUES ('海南省', '460000', '海口市', '460100', '龙华区', '460106');
INSERT INTO `region` VALUES ('海南省', '460000', '海口市', '460100', '琼山区', '460107');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '柳州市', '450200', '三江侗族自治县', '450226');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '柳州市', '450200', '融水苗族自治县', '450225');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '柳州市', '450200', '融安县', '450224');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '柳州市', '450200', '鹿寨县', '450223');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '柳州市', '450200', '柳城县', '450222');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '柳州市', '450200', '柳江区', '450206');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '柳州市', '450200', '城中区', '450202');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '柳州市', '450200', '鱼峰区', '450203');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '柳州市', '450200', '柳南区', '450204');
INSERT INTO `region` VALUES ('海南省', '460000', '海口市', '460100', '秀英区', '460105');
INSERT INTO `region` VALUES ('广东省', '440000', '深圳市', '440300', '坪山区', '440310');
INSERT INTO `region` VALUES ('浙江省', '330000', '金华市', '330700', '磐安县', '330727');
INSERT INTO `region` VALUES ('浙江省', '330000', '台州市', '331000', '天台县', '331023');
INSERT INTO `region` VALUES ('浙江省', '330000', '台州市', '331000', '仙居县', '331024');
INSERT INTO `region` VALUES ('浙江省', '330000', '台州市', '331000', '临海市', '331082');
INSERT INTO `region` VALUES ('浙江省', '330000', '台州市', '331000', '黄岩区', '331003');
INSERT INTO `region` VALUES ('浙江省', '330000', '嘉兴市', '330400', '桐乡市', '330483');
INSERT INTO `region` VALUES ('浙江省', '330000', '嘉兴市', '330400', '海盐县', '330424');
INSERT INTO `region` VALUES ('浙江省', '330000', '嘉兴市', '330400', '海宁市', '330481');
INSERT INTO `region` VALUES ('浙江省', '330000', '丽水市', '331100', '云和县', '331125');
INSERT INTO `region` VALUES ('浙江省', '330000', '丽水市', '331100', '庆元县', '331126');
INSERT INTO `region` VALUES ('浙江省', '330000', '嘉兴市', '330400', '南湖区', '330402');
INSERT INTO `region` VALUES ('浙江省', '330000', '嘉兴市', '330400', '嘉善县', '330421');
INSERT INTO `region` VALUES ('浙江省', '330000', '衢州市', '330800', '衢江区', '330803');
INSERT INTO `region` VALUES ('浙江省', '330000', '衢州市', '330800', '龙游县', '330825');
INSERT INTO `region` VALUES ('浙江省', '330000', '金华市', '330700', '义乌市', '330782');
INSERT INTO `region` VALUES ('浙江省', '330000', '金华市', '330700', '浦江县', '330726');
INSERT INTO `region` VALUES ('浙江省', '330000', '宁波市', '330200', '北仑区', '330206');
INSERT INTO `region` VALUES ('广东省', '440000', '深圳市', '440300', '龙岗区', '440307');
INSERT INTO `region` VALUES ('浙江省', '330000', '台州市', '331000', '椒江区', '331002');
INSERT INTO `region` VALUES ('浙江省', '330000', '台州市', '331000', '路桥区', '331004');
INSERT INTO `region` VALUES ('浙江省', '330000', '台州市', '331000', '温岭市', '331081');
INSERT INTO `region` VALUES ('浙江省', '330000', '台州市', '331000', '玉环市', '331083');
INSERT INTO `region` VALUES ('浙江省', '330000', '台州市', '331000', '三门县', '331022');
INSERT INTO `region` VALUES ('浙江省', '330000', '宁波市', '330200', '宁海县', '330226');
INSERT INTO `region` VALUES ('浙江省', '330000', '宁波市', '330200', '象山县', '330225');
INSERT INTO `region` VALUES ('浙江省', '330000', '宁波市', '330200', '奉化区', '330213');
INSERT INTO `region` VALUES ('浙江省', '330000', '宁波市', '330200', '海曙区', '330203');
INSERT INTO `region` VALUES ('浙江省', '330000', '宁波市', '330200', '江北区', '330205');
INSERT INTO `region` VALUES ('浙江省', '330000', '宁波市', '330200', '余姚市', '330281');
INSERT INTO `region` VALUES ('浙江省', '330000', '宁波市', '330200', '慈溪市', '330282');
INSERT INTO `region` VALUES ('浙江省', '330000', '绍兴市', '330600', '嵊州市', '330683');
INSERT INTO `region` VALUES ('浙江省', '330000', '绍兴市', '330600', '新昌县', '330624');
INSERT INTO `region` VALUES ('浙江省', '330000', '绍兴市', '330600', '越城区', '330602');
INSERT INTO `region` VALUES ('浙江省', '330000', '金华市', '330700', '东阳市', '330783');
INSERT INTO `region` VALUES ('浙江省', '330000', '金华市', '330700', '金东区', '330703');
INSERT INTO `region` VALUES ('浙江省', '330000', '金华市', '330700', '武义县', '330723');
INSERT INTO `region` VALUES ('浙江省', '330000', '金华市', '330700', '婺城区', '330702');
INSERT INTO `region` VALUES ('浙江省', '330000', '金华市', '330700', '永康市', '330784');
INSERT INTO `region` VALUES ('浙江省', '330000', '丽水市', '331100', '松阳县', '331124');
INSERT INTO `region` VALUES ('浙江省', '330000', '丽水市', '331100', '遂昌县', '331123');
INSERT INTO `region` VALUES ('浙江省', '330000', '丽水市', '331100', '龙泉市', '331181');
INSERT INTO `region` VALUES ('浙江省', '330000', '嘉兴市', '330400', '平湖市', '330482');
INSERT INTO `region` VALUES ('浙江省', '330000', '嘉兴市', '330400', '秀洲区', '330411');
INSERT INTO `region` VALUES ('浙江省', '330000', '丽水市', '331100', '缙云县', '331122');
INSERT INTO `region` VALUES ('浙江省', '330000', '杭州市', '330100', '富阳区', '330111');
INSERT INTO `region` VALUES ('浙江省', '330000', '杭州市', '330100', '上城区', '330102');
INSERT INTO `region` VALUES ('浙江省', '330000', '杭州市', '330100', '余杭区', '330110');
INSERT INTO `region` VALUES ('浙江省', '330000', '杭州市', '330100', '临平区', '330113');
INSERT INTO `region` VALUES ('浙江省', '330000', '杭州市', '330100', '拱墅区', '330105');
INSERT INTO `region` VALUES ('浙江省', '330000', '杭州市', '330100', '淳安县', '330127');
INSERT INTO `region` VALUES ('浙江省', '330000', '杭州市', '330100', '滨江区', '330108');
INSERT INTO `region` VALUES ('浙江省', '330000', '丽水市', '331100', '景宁畲族自治县', '331127');
INSERT INTO `region` VALUES ('浙江省', '330000', '丽水市', '331100', '莲都区', '331102');
INSERT INTO `region` VALUES ('浙江省', '330000', '丽水市', '331100', '青田县', '331121');
INSERT INTO `region` VALUES ('浙江省', '330000', '宁波市', '330200', '鄞州区', '330212');
INSERT INTO `region` VALUES ('浙江省', '330000', '宁波市', '330200', '镇海区', '330211');
INSERT INTO `region` VALUES ('浙江省', '330000', '杭州市', '330100', '临安区', '330112');
INSERT INTO `region` VALUES ('浙江省', '330000', '杭州市', '330100', '建德市', '330182');
INSERT INTO `region` VALUES ('浙江省', '330000', '杭州市', '330100', '桐庐县', '330122');
INSERT INTO `region` VALUES ('浙江省', '330000', '金华市', '330700', '兰溪市', '330781');
INSERT INTO `region` VALUES ('浙江省', '330000', '绍兴市', '330600', '诸暨市', '330681');
INSERT INTO `region` VALUES ('浙江省', '330000', '绍兴市', '330600', '柯桥区', '330603');
INSERT INTO `region` VALUES ('浙江省', '330000', '绍兴市', '330600', '上虞区', '330604');
INSERT INTO `region` VALUES ('浙江省', '330000', '湖州市', '330500', '安吉县', '330523');
INSERT INTO `region` VALUES ('浙江省', '330000', '湖州市', '330500', '吴兴区', '330502');
INSERT INTO `region` VALUES ('浙江省', '330000', '湖州市', '330500', '德清县', '330521');
INSERT INTO `region` VALUES ('浙江省', '330000', '湖州市', '330500', '南浔区', '330503');
INSERT INTO `region` VALUES ('浙江省', '330000', '湖州市', '330500', '长兴县', '330522');
INSERT INTO `region` VALUES ('浙江省', '330000', '温州市', '330300', '平阳县', '330326');
INSERT INTO `region` VALUES ('浙江省', '330000', '温州市', '330300', '瓯海区', '330304');
INSERT INTO `region` VALUES ('浙江省', '330000', '衢州市', '330800', '常山县', '330822');
INSERT INTO `region` VALUES ('浙江省', '330000', '衢州市', '330800', '开化县', '330824');
INSERT INTO `region` VALUES ('浙江省', '330000', '衢州市', '330800', '江山市', '330881');
INSERT INTO `region` VALUES ('浙江省', '330000', '衢州市', '330800', '柯城区', '330802');
INSERT INTO `region` VALUES ('浙江省', '330000', '杭州市', '330100', '西湖区', '330106');
INSERT INTO `region` VALUES ('浙江省', '330000', '杭州市', '330100', '萧山区', '330109');
INSERT INTO `region` VALUES ('浙江省', '330000', '杭州市', '330100', '钱塘区', '330114');
INSERT INTO `region` VALUES ('浙江省', '330000', '温州市', '330300', '乐清市', '330382');
INSERT INTO `region` VALUES ('浙江省', '330000', '温州市', '330300', '瑞安市', '330381');
INSERT INTO `region` VALUES ('浙江省', '330000', '温州市', '330300', '泰顺县', '330329');
INSERT INTO `region` VALUES ('浙江省', '330000', '温州市', '330300', '永嘉县', '330324');
INSERT INTO `region` VALUES ('浙江省', '330000', '温州市', '330300', '文成县', '330328');
INSERT INTO `region` VALUES ('广东省', '440000', '深圳市', '440300', '光明区', '440311');
INSERT INTO `region` VALUES ('海南省', '460000', '三亚市', '460200', '天涯区', '460204');
INSERT INTO `region` VALUES ('浙江省', '330000', '温州市', '330300', '苍南县', '330327');
INSERT INTO `region` VALUES ('浙江省', '330000', '温州市', '330300', '鹿城区', '330302');
INSERT INTO `region` VALUES ('浙江省', '330000', '温州市', '330300', '龙湾区', '330303');
INSERT INTO `region` VALUES ('浙江省', '330000', '舟山市', '330900', '定海区', '330902');
INSERT INTO `region` VALUES ('海南省', '460000', '万宁市', '469006', '万宁市', '469006');
INSERT INTO `region` VALUES ('海南省', '460000', '东方市', '469007', '东方市', '469007');
INSERT INTO `region` VALUES ('海南省', '460000', '临高县', '469024', '临高县', '469024');
INSERT INTO `region` VALUES ('海南省', '460000', '乐东黎族自治县', '469027', '乐东黎族自治县', '469027');
INSERT INTO `region` VALUES ('海南省', '460000', '五指山市', '469001', '五指山市', '469001');
INSERT INTO `region` VALUES ('海南省', '460000', '保亭黎族苗族自治县', '469029', '保亭黎族苗族自治县', '469029');
INSERT INTO `region` VALUES ('海南省', '460000', '儋州市', '460400', '儋州市', '460400');
INSERT INTO `region` VALUES ('海南省', '460000', '定安县', '469021', '定安县', '469021');
INSERT INTO `region` VALUES ('海南省', '460000', '屯昌县', '469022', '屯昌县', '469022');
INSERT INTO `region` VALUES ('海南省', '460000', '文昌市', '469005', '文昌市', '469005');
INSERT INTO `region` VALUES ('海南省', '460000', '昌江黎族自治县', '469026', '昌江黎族自治县', '469026');
INSERT INTO `region` VALUES ('海南省', '460000', '澄迈县', '469023', '澄迈县', '469023');
INSERT INTO `region` VALUES ('海南省', '460000', '琼中黎族苗族自治县', '469030', '琼中黎族苗族自治县', '469030');
INSERT INTO `region` VALUES ('海南省', '460000', '琼海市', '469002', '琼海市', '469002');
INSERT INTO `region` VALUES ('海南省', '460000', '白沙黎族自治县', '469025', '白沙黎族自治县', '469025');
INSERT INTO `region` VALUES ('海南省', '460000', '陵水黎族自治县', '469028', '陵水黎族自治县', '469028');
INSERT INTO `region` VALUES ('海南省', '460000', '三亚市', '460200', '海棠区', '460202');
INSERT INTO `region` VALUES ('广东省', '440000', '湛江市', '440800', '麻章区', '440811');
INSERT INTO `region` VALUES ('广东省', '440000', '湛江市', '440800', '坡头区', '440804');
INSERT INTO `region` VALUES ('海南省', '460000', '三亚市', '460200', '吉阳区', '460203');
INSERT INTO `region` VALUES ('广东省', '440000', '深圳市', '440300', '盐田区', '440308');
INSERT INTO `region` VALUES ('澳门', '820000', '澳门', '820000', '望德堂区', '820002');
INSERT INTO `region` VALUES ('香港', '810000', '香港', '810000', '离岛区', '810110');
INSERT INTO `region` VALUES ('澳门', '820000', '澳门', '820000', '圣方济各堂区', '820004');
INSERT INTO `region` VALUES ('澳门', '820000', '澳门', '820000', '大堂区', '820006');
INSERT INTO `region` VALUES ('澳门', '820000', '澳门', '820000', '风顺堂区', '820003');
INSERT INTO `region` VALUES ('澳门', '820000', '澳门', '820000', '花王堂区', '820001');
INSERT INTO `region` VALUES ('澳门', '820000', '澳门', '820000', '花地玛堂区', '820008');
INSERT INTO `region` VALUES ('澳门', '820000', '澳门', '820000', '嘉模堂区', '820005');
INSERT INTO `region` VALUES ('澳门', '820000', '澳门', '820000', '路氹填海区', '820007');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '柳州市', '450200', '柳北区', '450205');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '桂林市', '450300', '平乐县', '450330');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '桂林市', '450300', '资源县', '450329');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '桂林市', '450300', '永福县', '450326');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '桂林市', '450300', '阳朔县', '450321');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '桂林市', '450300', '雁山区', '450311');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '桂林市', '450300', '秀峰区', '450302');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '桂林市', '450300', '象山区', '450304');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '桂林市', '450300', '兴安县', '450325');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '桂林市', '450300', '七星区', '450305');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '桂林市', '450300', '全州县', '450324');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '桂林市', '450300', '灵川县', '450323');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '桂林市', '450300', '龙胜各族自治县', '450328');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '桂林市', '450300', '临桂区', '450312');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '桂林市', '450300', '荔浦市', '450381');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '桂林市', '450300', '灌阳县', '450327');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '桂林市', '450300', '恭城瑶族自治县', '450332');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '桂林市', '450300', '叠彩区', '450303');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '百色市', '451000', '平果市', '451082');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '百色市', '451000', '靖西市', '451081');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '百色市', '451000', '德保县', '451024');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '百色市', '451000', '那坡县', '451026');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '百色市', '451000', '乐业县', '451028');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '百色市', '451000', '田林县', '451029');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '百色市', '451000', '凌云县', '451027');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '百色市', '451000', '隆林各族自治县', '451031');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '百色市', '451000', '田东县', '451022');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '百色市', '451000', '田阳区', '451003');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '百色市', '451000', '西林县', '451030');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '百色市', '451000', '右江区', '451002');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '北海市', '450500', '海城区', '450502');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '北海市', '450500', '合浦县', '450521');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '北海市', '450500', '银海区', '450503');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '北海市', '450500', '铁山港区', '450512');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '防城港市', '450600', '上思县', '450621');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '防城港市', '450600', '防城区', '450603');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '防城港市', '450600', '港口区', '450602');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '防城港市', '450600', '东兴市', '450681');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '贵港市', '450800', '港北区', '450802');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '贵港市', '450800', '桂平市', '450881');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '贵港市', '450800', '覃塘区', '450804');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '贵港市', '450800', '平南县', '450821');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '贵港市', '450800', '港南区', '450803');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '河池市', '451200', '大化瑶族自治县', '451229');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '河池市', '451200', '巴马瑶族自治县', '451227');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '河池市', '451200', '凤山县', '451223');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '河池市', '451200', '宜州区', '451203');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '河池市', '451200', '天峨县', '451222');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '河池市', '451200', '南丹县', '451221');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '河池市', '451200', '罗城仫佬族自治县', '451225');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '河池市', '451200', '金城江区', '451202');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '河池市', '451200', '环江毛南族自治县', '451226');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '河池市', '451200', '东兰县', '451224');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '河池市', '451200', '都安瑶族自治县', '451228');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '钦州市', '450700', '灵山县', '450721');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '钦州市', '450700', '钦北区', '450703');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '钦州市', '450700', '钦南区', '450702');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '钦州市', '450700', '浦北县', '450722');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '梧州市', '450400', '藤县', '450422');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '梧州市', '450400', '蒙山县', '450423');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '梧州市', '450400', '龙圩区', '450406');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '梧州市', '450400', '岑溪市', '450481');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '梧州市', '450400', '苍梧县', '450421');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '梧州市', '450400', '长洲区', '450405');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '梧州市', '450400', '万秀区', '450403');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '玉林市', '450900', '北流市', '450981');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '玉林市', '450900', '玉州区', '450902');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '玉林市', '450900', '兴业县', '450924');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '玉林市', '450900', '容县', '450921');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '玉林市', '450900', '陆川县', '450922');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '玉林市', '450900', '博白县', '450923');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '玉林市', '450900', '福绵区', '450903');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '崇左市', '451400', '龙州县', '451423');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '崇左市', '451400', '天等县', '451425');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '崇左市', '451400', '凭祥市', '451481');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '崇左市', '451400', '宁明县', '451422');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '崇左市', '451400', '江州区', '451402');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '崇左市', '451400', '扶绥县', '451421');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '崇左市', '451400', '大新县', '451424');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '来宾市', '451300', '象州县', '451322');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '来宾市', '451300', '忻城县', '451321');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '来宾市', '451300', '兴宾区', '451302');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '来宾市', '451300', '金秀瑶族自治县', '451324');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '来宾市', '451300', '合山市', '451381');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '来宾市', '451300', '武宣县', '451323');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '南宁市', '450100', '横州市', '450181');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '南宁市', '450100', '上林县', '450125');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '南宁市', '450100', '宾阳县', '450126');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '南宁市', '450100', '西乡塘区', '450107');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '南宁市', '450100', '武鸣区', '450110');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '南宁市', '450100', '青秀区', '450103');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '南宁市', '450100', '隆安县', '450123');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '南宁市', '450100', '良庆区', '450108');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '南宁市', '450100', '江南区', '450105');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '南宁市', '450100', '邕宁区', '450109');
INSERT INTO `region` VALUES ('广西壮族自治区', '450000', '南宁市', '450100', '兴宁区', '450102');
INSERT INTO `region` VALUES ('广东省', '440000', '广州市', '440100', '天河区', '440106');
INSERT INTO `region` VALUES ('广东省', '440000', '广州市', '440100', '黄埔区', '440112');
INSERT INTO `region` VALUES ('广东省', '440000', '广州市', '440100', '荔湾区', '440103');
INSERT INTO `region` VALUES ('广东省', '440000', '肇庆市', '441200', '封开县', '441225');
INSERT INTO `region` VALUES ('广东省', '440000', '肇庆市', '441200', '德庆县', '441226');
INSERT INTO `region` VALUES ('广东省', '440000', '肇庆市', '441200', '高要区', '441204');
INSERT INTO `region` VALUES ('广东省', '440000', '肇庆市', '441200', '怀集县', '441224');
INSERT INTO `region` VALUES ('广东省', '440000', '肇庆市', '441200', '广宁县', '441223');
INSERT INTO `region` VALUES ('广东省', '440000', '肇庆市', '441200', '鼎湖区', '441203');
INSERT INTO `region` VALUES ('广东省', '440000', '肇庆市', '441200', '四会市', '441284');
INSERT INTO `region` VALUES ('广东省', '440000', '肇庆市', '441200', '端州区', '441202');
INSERT INTO `region` VALUES ('广东省', '440000', '惠州市', '441300', '博罗县', '441322');
INSERT INTO `region` VALUES ('广东省', '440000', '惠州市', '441300', '惠城区', '441302');
INSERT INTO `region` VALUES ('广东省', '440000', '惠州市', '441300', '惠东县', '441323');
INSERT INTO `region` VALUES ('广东省', '440000', '惠州市', '441300', '惠阳区', '441303');
INSERT INTO `region` VALUES ('广东省', '440000', '惠州市', '441300', '龙门县', '441324');
INSERT INTO `region` VALUES ('广东省', '440000', '揭阳市', '445200', '惠来县', '445224');
INSERT INTO `region` VALUES ('广东省', '440000', '揭阳市', '445200', '揭东区', '445203');
INSERT INTO `region` VALUES ('广东省', '440000', '揭阳市', '445200', '揭西县', '445222');
INSERT INTO `region` VALUES ('广东省', '440000', '揭阳市', '445200', '普宁市', '445281');
INSERT INTO `region` VALUES ('广东省', '440000', '揭阳市', '445200', '榕城区', '445202');
INSERT INTO `region` VALUES ('广东省', '440000', '清远市', '441800', '佛冈县', '441821');
INSERT INTO `region` VALUES ('广东省', '440000', '清远市', '441800', '连南瑶族自治县', '441826');
INSERT INTO `region` VALUES ('广东省', '440000', '清远市', '441800', '连山壮族瑶族自治县', '441825');
INSERT INTO `region` VALUES ('广东省', '440000', '清远市', '441800', '连州市', '441882');
INSERT INTO `region` VALUES ('广东省', '440000', '清远市', '441800', '清城区', '441802');
INSERT INTO `region` VALUES ('广东省', '440000', '清远市', '441800', '清新区', '441803');
INSERT INTO `region` VALUES ('广东省', '440000', '清远市', '441800', '阳山县', '441823');
INSERT INTO `region` VALUES ('广东省', '440000', '清远市', '441800', '英德市', '441881');
INSERT INTO `region` VALUES ('广东省', '440000', '广州市', '440100', '白云区', '440111');
INSERT INTO `region` VALUES ('广东省', '440000', '广州市', '440100', '从化区', '440117');
INSERT INTO `region` VALUES ('广东省', '440000', '广州市', '440100', '番禺区', '440113');
INSERT INTO `region` VALUES ('广东省', '440000', '广州市', '440100', '海珠区', '440105');
INSERT INTO `region` VALUES ('广东省', '440000', '广州市', '440100', '花都区', '440114');
INSERT INTO `region` VALUES ('广东省', '440000', '广州市', '440100', '南沙区', '440115');
INSERT INTO `region` VALUES ('广东省', '440000', '广州市', '440100', '增城区', '440118');
INSERT INTO `region` VALUES ('广东省', '440000', '佛山市', '440600', '顺德区', '440606');
INSERT INTO `region` VALUES ('广东省', '440000', '佛山市', '440600', '高明区', '440608');
INSERT INTO `region` VALUES ('广东省', '440000', '佛山市', '440600', '三水区', '440607');
INSERT INTO `region` VALUES ('广东省', '440000', '佛山市', '440600', '南海区', '440605');
INSERT INTO `region` VALUES ('广东省', '440000', '佛山市', '440600', '禅城区', '440604');
INSERT INTO `region` VALUES ('香港', '810000', '香港', '810000', '屯门区', '810115');
INSERT INTO `region` VALUES ('香港', '810000', '香港', '810000', '深水埗区', '810106');
INSERT INTO `region` VALUES ('香港', '810000', '香港', '810000', '沙田区', '810114');
INSERT INTO `region` VALUES ('香港', '810000', '香港', '810000', '九龙城区', '810103');
INSERT INTO `region` VALUES ('香港', '810000', '香港', '810000', '荃湾区', '810117');
INSERT INTO `region` VALUES ('香港', '810000', '香港', '810000', '葵青区', '810111');
INSERT INTO `region` VALUES ('香港', '810000', '香港', '810000', '大埔区', '810116');
INSERT INTO `region` VALUES ('香港', '810000', '香港', '810000', '南区', '810105');
INSERT INTO `region` VALUES ('香港', '810000', '香港', '810000', '黄大仙区', '810108');
INSERT INTO `region` VALUES ('香港', '810000', '香港', '810000', '观塘区', '810104');
INSERT INTO `region` VALUES ('香港', '810000', '香港', '810000', '北区', '810112');
INSERT INTO `region` VALUES ('香港', '810000', '香港', '810000', '中西区', '810101');
INSERT INTO `region` VALUES ('香港', '810000', '香港', '810000', '湾仔区', '810107');
INSERT INTO `region` VALUES ('香港', '810000', '香港', '810000', '油尖旺区', '810109');
INSERT INTO `region` VALUES ('香港', '810000', '香港', '810000', '东区', '810102');
INSERT INTO `region` VALUES ('香港', '810000', '香港', '810000', '西贡区', '810113');
INSERT INTO `region` VALUES ('广东省', '440000', '珠海市', '440400', '香洲区', '440402');
INSERT INTO `region` VALUES ('广东省', '440000', '珠海市', '440400', '金湾区', '440404');
INSERT INTO `region` VALUES ('广东省', '440000', '珠海市', '440400', '斗门区', '440403');
INSERT INTO `region` VALUES ('广东省', '440000', '韶关市', '440200', '翁源县', '440229');
INSERT INTO `region` VALUES ('广东省', '440000', '韶关市', '440200', '新丰县', '440233');
INSERT INTO `region` VALUES ('广东省', '440000', '韶关市', '440200', '仁化县', '440224');
INSERT INTO `region` VALUES ('广东省', '440000', '韶关市', '440200', '武江区', '440203');
INSERT INTO `region` VALUES ('广东省', '440000', '韶关市', '440200', '浈江区', '440204');
INSERT INTO `region` VALUES ('广东省', '440000', '韶关市', '440200', '乳源瑶族自治县', '440232');
INSERT INTO `region` VALUES ('广东省', '440000', '韶关市', '440200', '乐昌市', '440281');
INSERT INTO `region` VALUES ('广东省', '440000', '韶关市', '440200', '始兴县', '440222');
INSERT INTO `region` VALUES ('广东省', '440000', '韶关市', '440200', '南雄市', '440282');
INSERT INTO `region` VALUES ('广东省', '440000', '韶关市', '440200', '曲江区', '440205');
INSERT INTO `region` VALUES ('广东省', '440000', '潮州市', '445100', '饶平县', '445122');
INSERT INTO `region` VALUES ('广东省', '440000', '潮州市', '445100', '湘桥区', '445102');
INSERT INTO `region` VALUES ('广东省', '440000', '潮州市', '445100', '潮安区', '445103');
INSERT INTO `region` VALUES ('广东省', '440000', '茂名市', '440900', '茂南区', '440902');
INSERT INTO `region` VALUES ('广东省', '440000', '茂名市', '440900', '化州市', '440982');
INSERT INTO `region` VALUES ('广东省', '440000', '茂名市', '440900', '信宜市', '440983');
INSERT INTO `region` VALUES ('广东省', '440000', '茂名市', '440900', '高州市', '440981');
INSERT INTO `region` VALUES ('广东省', '440000', '茂名市', '440900', '电白区', '440904');
INSERT INTO `region` VALUES ('广东省', '440000', '梅州市', '441400', '大埔县', '441422');
INSERT INTO `region` VALUES ('广东省', '440000', '梅州市', '441400', '蕉岭县', '441427');
INSERT INTO `region` VALUES ('广东省', '440000', '梅州市', '441400', '平远县', '441426');
INSERT INTO `region` VALUES ('广东省', '440000', '梅州市', '441400', '梅江区', '441402');
INSERT INTO `region` VALUES ('广东省', '440000', '梅州市', '441400', '梅县区', '441403');
INSERT INTO `region` VALUES ('广东省', '440000', '梅州市', '441400', '兴宁市', '441481');
INSERT INTO `region` VALUES ('广东省', '440000', '梅州市', '441400', '丰顺县', '441423');
INSERT INTO `region` VALUES ('广东省', '440000', '梅州市', '441400', '五华县', '441424');
INSERT INTO `region` VALUES ('广东省', '440000', '汕头市', '440500', '潮南区', '440514');
INSERT INTO `region` VALUES ('广东省', '440000', '汕头市', '440500', '潮阳区', '440513');
INSERT INTO `region` VALUES ('广东省', '440000', '汕头市', '440500', '澄海区', '440515');
INSERT INTO `region` VALUES ('广东省', '440000', '汕头市', '440500', '濠江区', '440512');
INSERT INTO `region` VALUES ('广东省', '440000', '汕头市', '440500', '金平区', '440511');
INSERT INTO `region` VALUES ('广东省', '440000', '汕尾市', '441500', '城区', '441502');
INSERT INTO `region` VALUES ('广东省', '440000', '汕尾市', '441500', '陆河县', '441523');
INSERT INTO `region` VALUES ('广东省', '440000', '汕尾市', '441500', '海丰县', '441521');
INSERT INTO `region` VALUES ('广东省', '440000', '汕尾市', '441500', '陆丰市', '441581');
INSERT INTO `region` VALUES ('广东省', '440000', '汕头市', '440500', '龙湖区', '440507');
INSERT INTO `region` VALUES ('香港', '810000', '香港', '810000', '元朗区', '810118');
INSERT INTO `region` VALUES ('澳门', '820000', '澳门', '820000', '澳门特别行政区直辖', '820010');
INSERT INTO `region` VALUES ('广东省', '440000', '湛江市', '440800', '赤坎区', '440802');
INSERT INTO `region` VALUES ('广东省', '440000', '湛江市', '440800', '霞山区', '440803');
INSERT INTO `region` VALUES ('海南省', '460000', '三沙市', '460300', '三沙市', '460300');
INSERT INTO `region` VALUES ('广东省', '440000', '河源市', '441600', '源城区', '441602');
INSERT INTO `region` VALUES ('广东省', '440000', '江门市', '440700', '新会区', '440705');
INSERT INTO `region` VALUES ('浙江省', '330000', '温州市', '330300', '龙港市', '330383');
INSERT INTO `region` VALUES ('浙江省', '330000', '舟山市', '330900', '普陀区', '330903');
INSERT INTO `region` VALUES ('浙江省', '330000', '舟山市', '330900', '岱山县', '330921');
INSERT INTO `region` VALUES ('海南省', '460000', '三亚市', '460200', '崖州区', '460205');
INSERT INTO `region` VALUES ('广东省', '440000', '汕头市', '440500', '南澳县', '440523');
INSERT INTO `region` VALUES ('福建省', '350000', '泉州市', '350500', '金门县', '350527');
INSERT INTO `region` VALUES ('福建省', '350000', '福州市', '350100', '平潭县', '350128');
INSERT INTO `region` VALUES ('浙江省', '330000', '温州市', '330300', '洞头区', '330305');
INSERT INTO `region` VALUES ('浙江省', '330000', '舟山市', '330900', '嵊泗县', '330922');
INSERT INTO `region` VALUES ('广东省', '440000', '广州市', '440100', '越秀区', '440104');
INSERT INTO `region` VALUES ('安徽省', '340000', '合肥市', '340100', '瑶海区', '340102');
INSERT INTO `region` VALUES ('湖南省', '430000', '娄底市', '431300', '冷水江市', '431381');
INSERT INTO `region` VALUES ('湖南省', '430000', '岳阳市', '430600', '云溪区', '430603');
INSERT INTO `region` VALUES ('安徽省', '340000', '六安市', '341500', '叶集区', '341504');
INSERT INTO `region` VALUES ('河北省', '130000', '石家庄市', '130100', '藁城区', '130109');
INSERT INTO `region` VALUES ('湖南省', '430000', '长沙市', '430100', '芙蓉区', '430102');
INSERT INTO `region` VALUES ('河南省', '410000', '濮阳市', '410900', '范县', '410926');
INSERT INTO `region` VALUES ('山西省', '140000', '大同市', '140200', '平城区', '140213');
INSERT INTO `region` VALUES ('苏鲁交界', '990000', '海域', '999900', '海域', '999900');
INSERT INTO `region` VALUES ('宁夏回族自治区', '640000', '银川市', '640100', '灵武市', '640181');
INSERT INTO `region` VALUES ('四川省', '510000', '泸州市', '510500', '合江县', '510522');
INSERT INTO `region` VALUES ('北京市', '110000', '北京市', '110100', '昌平区', '110114');
INSERT INTO `region` VALUES ('山西省', '140000', '长治市', '140400', '壶关县', '140427');
INSERT INTO `region` VALUES ('陕西省', '610000', '渭南市', '610500', '白水县', '610527');
INSERT INTO `region` VALUES ('陕西省', '610000', '渭南市', '610500', '潼关县', '610522');
INSERT INTO `region` VALUES ('陕西省', '610000', '渭南市', '610500', '蒲城县', '610526');
INSERT INTO `region` VALUES ('陕西省', '610000', '渭南市', '610500', '临渭区', '610502');
INSERT INTO `region` VALUES ('陕西省', '610000', '渭南市', '610500', '华州区', '610503');
INSERT INTO `region` VALUES ('陕西省', '610000', '渭南市', '610500', '富平县', '610528');
INSERT INTO `region` VALUES ('陕西省', '610000', '渭南市', '610500', '大荔县', '610523');
INSERT INTO `region` VALUES ('陕西省', '610000', '渭南市', '610500', '华阴市', '610582');
INSERT INTO `region` VALUES ('陕西省', '610000', '渭南市', '610500', '合阳县', '610524');
INSERT INTO `region` VALUES ('陕西省', '610000', '渭南市', '610500', '韩城市', '610581');
INSERT INTO `region` VALUES ('陕西省', '610000', '渭南市', '610500', '澄城县', '610525');
INSERT INTO `region` VALUES ('陕西省', '610000', '安康市', '610900', '白河县', '610929');
INSERT INTO `region` VALUES ('陕西省', '610000', '安康市', '610900', '汉滨区', '610902');
INSERT INTO `region` VALUES ('陕西省', '610000', '安康市', '610900', '岚皋县', '610925');
INSERT INTO `region` VALUES ('陕西省', '610000', '安康市', '610900', '平利县', '610926');
INSERT INTO `region` VALUES ('陕西省', '610000', '安康市', '610900', '紫阳县', '610924');
INSERT INTO `region` VALUES ('陕西省', '610000', '安康市', '610900', '旬阳市', '610981');
INSERT INTO `region` VALUES ('陕西省', '610000', '安康市', '610900', '镇坪县', '610927');
INSERT INTO `region` VALUES ('陕西省', '610000', '安康市', '610900', '汉阴县', '610921');
INSERT INTO `region` VALUES ('陕西省', '610000', '安康市', '610900', '石泉县', '610922');
INSERT INTO `region` VALUES ('陕西省', '610000', '安康市', '610900', '宁陕县', '610923');
INSERT INTO `region` VALUES ('陕西省', '610000', '咸阳市', '610400', '泾阳县', '610423');
INSERT INTO `region` VALUES ('陕西省', '610000', '咸阳市', '610400', '礼泉县', '610425');
INSERT INTO `region` VALUES ('陕西省', '610000', '咸阳市', '610400', '乾县', '610424');
INSERT INTO `region` VALUES ('陕西省', '610000', '咸阳市', '610400', '秦都区', '610402');
INSERT INTO `region` VALUES ('陕西省', '610000', '咸阳市', '610400', '三原县', '610422');
INSERT INTO `region` VALUES ('陕西省', '610000', '咸阳市', '610400', '渭城区', '610404');
INSERT INTO `region` VALUES ('陕西省', '610000', '咸阳市', '610400', '武功县', '610431');
INSERT INTO `region` VALUES ('陕西省', '610000', '咸阳市', '610400', '兴平市', '610481');
INSERT INTO `region` VALUES ('陕西省', '610000', '咸阳市', '610400', '旬邑县', '610429');
INSERT INTO `region` VALUES ('陕西省', '610000', '咸阳市', '610400', '杨陵区', '610403');
INSERT INTO `region` VALUES ('陕西省', '610000', '咸阳市', '610400', '永寿县', '610426');
INSERT INTO `region` VALUES ('陕西省', '610000', '咸阳市', '610400', '长武县', '610428');
INSERT INTO `region` VALUES ('陕西省', '610000', '咸阳市', '610400', '彬州市', '610482');
INSERT INTO `region` VALUES ('陕西省', '610000', '咸阳市', '610400', '淳化县', '610430');
INSERT INTO `region` VALUES ('江苏省', '320000', '苏州市', '320500', '苏州工业园区', '320571');
INSERT INTO `region` VALUES ('湖南省', '430000', '永州市', '431100', '东安县', '431122');
INSERT INTO `region` VALUES ('江西省', '360000', '南昌市', '360100', '红谷滩区', '360113');
INSERT INTO `region` VALUES ('广东省', '440000', '深圳市', '440300', '宝安区', '440306');
INSERT INTO `region` VALUES ('湖南省', '430000', '岳阳市', '430600', '君山区', '430611');
INSERT INTO `region` VALUES ('广东省', '440000', '汕尾市', '441500', '汕尾市', '441500');
INSERT INTO `region` VALUES ('安徽省', '340000', '蚌埠市', '340300', '固镇县', '340323');
INSERT INTO `region` VALUES ('山西省', '140000', '太原市', '140100', '小店区', '140105');
INSERT INTO `region` VALUES ('贵州省', '520000', '遵义市', '520300', '凤冈县', '520327');
INSERT INTO `region` VALUES ('新疆维吾尔自治区', '650000', '新星市', '659100', '新星市', '659111');
INSERT INTO `region` VALUES ('湖南省', '430000', '长沙市', '430100', '望城区', '430112');
INSERT INTO `region` VALUES ('江苏省', '320000', '徐州市', '320300', '鼓楼区', '320302');
INSERT INTO `region` VALUES ('江苏省', '320000', '无锡市', '320200', '新吴区', '320214');
INSERT INTO `region` VALUES ('湖南省', '430000', '长沙市', '430100', '宁乡市', '430182');
INSERT INTO `region` VALUES ('湖南省', '430000', '长沙市', '430100', '岳麓区', '430104');
INSERT INTO `region` VALUES ('湖南省', '430000', '长沙市', '430100', '天心区', '430103');
INSERT INTO `region` VALUES ('湖南省', '430000', '长沙市', '430100', '浏阳市', '430181');
INSERT INTO `region` VALUES ('湖南省', '430000', '长沙市', '430100', '长沙县', '430121');
INSERT INTO `region` VALUES ('湖南省', '430000', '长沙市', '430100', '雨花区', '430111');
INSERT INTO `region` VALUES ('江苏省', '320000', '无锡市', '320200', '江阴市', '320281');
INSERT INTO `region` VALUES ('黑龙江省', '230000', '牡丹江市', '231000', '绥芬河市', '231081');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '阿里地区', '542500', '普兰县', '542521');
INSERT INTO `region` VALUES ('西藏自治区', '540000', '日喀则市', '540200', '亚东县', '540233');
INSERT INTO `region` VALUES ('云南省', '530000', '怒江傈僳族自治州', '533300', '福贡县', '533323');
INSERT INTO `region` VALUES ('湖南省', '430000', '邵阳市', '430500', '邵阳县', '430523');
INSERT INTO `region` VALUES ('湖南省', '430000', '邵阳市', '430500', '武冈市', '430581');
INSERT INTO `region` VALUES ('湖南省', '430000', '邵阳市', '430500', '城步苗族自治县', '430529');
INSERT INTO `region` VALUES ('湖南省', '430000', '邵阳市', '430500', '新宁县', '430528');
INSERT INTO `region` VALUES ('湖南省', '430000', '邵阳市', '430500', '绥宁县', '430527');
INSERT INTO `region` VALUES ('湖南省', '430000', '邵阳市', '430500', '新邵县', '430522');
INSERT INTO `region` VALUES ('湖南省', '430000', '邵阳市', '430500', '北塔区', '430511');
INSERT INTO `region` VALUES ('湖南省', '430000', '邵阳市', '430500', '邵东市', '430582');
INSERT INTO `region` VALUES ('湖南省', '430000', '邵阳市', '430500', '双清区', '430502');
INSERT INTO `region` VALUES ('湖南省', '430000', '邵阳市', '430500', '隆回县', '430524');
INSERT INTO `region` VALUES ('湖南省', '430000', '邵阳市', '430500', '洞口县', '430525');
INSERT INTO `region` VALUES ('湖南省', '430000', '邵阳市', '430500', '大祥区', '430503');
INSERT INTO `region` VALUES ('湖南省', '430000', '益阳市', '430900', '安化县', '430923');
INSERT INTO `region` VALUES ('湖南省', '430000', '益阳市', '430900', '桃江县', '430922');
INSERT INTO `region` VALUES ('湖南省', '430000', '益阳市', '430900', '赫山区', '430903');
INSERT INTO `region` VALUES ('湖南省', '430000', '益阳市', '430900', '资阳区', '430902');
INSERT INTO `region` VALUES ('湖南省', '430000', '益阳市', '430900', '沅江市', '430981');
INSERT INTO `region` VALUES ('湖南省', '430000', '益阳市', '430900', '南县', '430921');
INSERT INTO `region` VALUES ('湖南省', '430000', '株洲市', '430200', '茶陵县', '430224');
INSERT INTO `region` VALUES ('湖南省', '430000', '株洲市', '430200', '攸县', '430223');
INSERT INTO `region` VALUES ('湖南省', '430000', '株洲市', '430200', '醴陵市', '430281');
INSERT INTO `region` VALUES ('湖南省', '430000', '株洲市', '430200', '渌口区', '430212');
INSERT INTO `region` VALUES ('湖南省', '430000', '株洲市', '430200', '炎陵县', '430225');
INSERT INTO `region` VALUES ('湖南省', '430000', '株洲市', '430200', '天元区', '430211');
INSERT INTO `region` VALUES ('湖南省', '430000', '株洲市', '430200', '芦淞区', '430203');
INSERT INTO `region` VALUES ('湖南省', '430000', '株洲市', '430200', '荷塘区', '430202');
INSERT INTO `region` VALUES ('湖南省', '430000', '株洲市', '430200', '石峰区', '430204');
INSERT INTO `region` VALUES ('湖南省', '430000', '湘潭市', '430300', '湘潭县', '430321');
INSERT INTO `region` VALUES ('湖南省', '430000', '湘潭市', '430300', '湘乡市', '430381');
INSERT INTO `region` VALUES ('湖南省', '430000', '湘潭市', '430300', '雨湖区', '430302');
INSERT INTO `region` VALUES ('湖南省', '430000', '湘潭市', '430300', '韶山市', '430382');
INSERT INTO `region` VALUES ('湖南省', '430000', '湘潭市', '430300', '岳塘区', '430304');
INSERT INTO `region` VALUES ('湖南省', '430000', '衡阳市', '430400', '常宁市', '430482');
INSERT INTO `region` VALUES ('湖南省', '430000', '衡阳市', '430400', '衡南县', '430422');
INSERT INTO `region` VALUES ('湖南省', '430000', '衡阳市', '430400', '衡东县', '430424');
INSERT INTO `region` VALUES ('湖南省', '430000', '衡阳市', '430400', '珠晖区', '430405');
INSERT INTO `region` VALUES ('湖南省', '430000', '衡阳市', '430400', '雁峰区', '430406');
INSERT INTO `region` VALUES ('湖南省', '430000', '衡阳市', '430400', '蒸湘区', '430408');
INSERT INTO `region` VALUES ('湖南省', '430000', '衡阳市', '430400', '衡阳县', '430421');
INSERT INTO `region` VALUES ('湖南省', '430000', '衡阳市', '430400', '石鼓区', '430407');
INSERT INTO `region` VALUES ('湖南省', '430000', '衡阳市', '430400', '耒阳市', '430481');
INSERT INTO `region` VALUES ('湖南省', '430000', '衡阳市', '430400', '祁东县', '430426');
INSERT INTO `region` VALUES ('湖南省', '430000', '衡阳市', '430400', '衡山县', '430423');
INSERT INTO `region` VALUES ('湖南省', '430000', '衡阳市', '430400', '南岳区', '430412');
INSERT INTO `region` VALUES ('云南省', '530000', '西双版纳傣族自治州', '532800', '景洪市', '532801');

-- ----------------------------
-- Table structure for scale
-- ----------------------------
DROP TABLE IF EXISTS `scale`;
CREATE TABLE `scale`  (
  `scaleId` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `studentBasicId` int NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `context` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `scoring` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `createTime` datetime NULL DEFAULT NULL,
  `updateTime` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleteTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`scaleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '量表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of scale
-- ----------------------------
INSERT INTO `scale` VALUES (1, 1, NULL, '{}', NULL, NULL, '2023-03-30 06:34:12', '2023-03-30 06:34:12');
INSERT INTO `scale` VALUES (2, 1, NULL, '{a}', NULL, '2023-03-29 07:25:32', '2023-03-29 07:28:16', '2023-03-29 07:28:16');
INSERT INTO `scale` VALUES (3, 2, NULL, '[{\"qyestionType\":\"单选\",\"qyestionScore\":5,\"qyestionContent\":\"下面哪个是大猹的食物？\",\"select\":[{\"value\":\"西瓜\",\"name\":\"A\"},{\"value\":\"香蕉\",\"name\":\"B\"},{\"value\":\"花生米\",\"name\":\"C\"},{\"value\":\"依托\",\"name\":\"D\"}],\"isTrue\":\"A\"}]', NULL, '2023-03-29 14:42:42', '2023-03-30 00:05:13', '2023-03-30 00:05:13');
INSERT INTO `scale` VALUES (4, 1, NULL, '[]', NULL, '2023-03-29 23:58:21', '2023-03-30 00:01:42', '2023-03-30 00:01:42');
INSERT INTO `scale` VALUES (5, 4, NULL, '[]', NULL, '2023-03-30 00:00:05', '2023-03-30 00:07:44', '2023-03-30 00:07:44');
INSERT INTO `scale` VALUES (6, 4, NULL, '[]', NULL, '2023-03-30 00:00:05', '2023-03-30 00:05:41', '2023-03-30 00:05:41');
INSERT INTO `scale` VALUES (7, 4, NULL, '[{\"qyestionType\":\"单选\",\"qyestionScore\":5,\"qyestionContent\":\"大猹喜欢吃什么？\",\"select\":[{\"value\":\"西瓜\",\"name\":\"A\"},{\"value\":\"香蕉\",\"name\":\"B\"},{\"value\":\"花生米\",\"name\":\"C\"},{\"value\":\"依托\",\"name\":\"D\"}],\"isTrue\":[]}]', NULL, '2023-03-30 06:35:30', '2023-03-30 06:36:38', '2023-03-30 06:36:38');
INSERT INTO `scale` VALUES (8, 1, '大猹偷瓜', '[{\"qyestionType\":\"单选\",\"qyestionScore\":5,\"qyestionContent\":\"大猹吃什么？\",\"select\":[{\"value\":\"西瓜\",\"name\":\"A\"},{\"value\":\"花生米\",\"name\":\"B\"},{\"value\":\"依托\",\"name\":\"C\"},{\"value\":\"香蕉\",\"name\":\"D\"}],\"isTrue\":\"A\"}]', NULL, '2023-03-30 06:44:32', '2023-03-30 07:50:56', '2023-03-30 07:50:56');
INSERT INTO `scale` VALUES (9, 2, '游瑞心里健康测试', '[{\"qyestionType\":\"单选\",\"qyestionScore\":20,\"qyestionContent\":\"猹会偷瓜吗？\",\"select\":[{\"value\":\"会\",\"name\":\"A\"},{\"value\":\"不会\",\"name\":\"B\"}],\"isTrue\":\"A\"}]', NULL, '2023-03-30 06:51:21', '2023-04-02 02:13:51', '2023-04-02 02:13:51');
INSERT INTO `scale` VALUES (10, 4, '期中测试', '[{\"qyestionType\":\"单选\",\"qyestionScore\":5,\"qyestionContent\":\"1+1=？\",\"select\":[{\"value\":\"1\",\"name\":\"A\"},{\"value\":\"2\",\"name\":\"B\"},{\"value\":\"3\",\"name\":\"C\"},{\"value\":\"4\",\"name\":\"D\"}],\"isTrue\":\"B\"}]', NULL, '2023-03-30 07:03:48', '2023-04-02 02:13:59', '2023-04-02 02:13:59');
INSERT INTO `scale` VALUES (11, 1, '古诗两首', '[{\"qyestionType\":\"单选\",\"qyestionScore\":5,\"qyestionContent\":\"“床前明月光”出自哪位诗人？\",\"select\":[{\"value\":\"杜甫\",\"name\":\"A\"},{\"value\":\"白居易\",\"name\":\"B\"},{\"value\":\"李白\",\"name\":\"C\"},{\"value\":\"王维\",\"name\":\"D\"}],\"isTrue\":[]}]', NULL, '2023-03-30 07:10:41', '2023-04-02 02:14:10', '2023-04-02 02:14:10');
INSERT INTO `scale` VALUES (12, 1, '1111', '[{\"qyestionType\":\"单选\",\"qyestionScore\":5,\"qyestionContent\":\"2222\",\"select\":[{\"value\":\"123\",\"name\":\"A\"},{\"value\":\"12\",\"name\":\"B\"},{\"value\":\"22\",\"name\":\"C\"},{\"value\":\"11\",\"name\":\"D\"}],\"isTrue\":\"D\"},{\"qyestionType\":\"多选\",\"qyestionScore\":\"\",\"qyestionContent\":\"\",\"select\":[{\"value\":\"\",\"name\":\"A\"},{\"value\":\"\",\"name\":\"B\"},{\"value\":\"\",\"name\":\"C\"}],\"isTrue\":[\"A\",\"B\"]},{\"qyestionType\":\"主观\",\"qyestionScore\":\"\",\"qyestionContent\":\"\",\"select\":[],\"isTrue\":[]}]', NULL, '2023-03-30 07:50:42', '2023-04-02 02:14:17', '2023-04-02 02:14:17');
INSERT INTO `scale` VALUES (13, 1, NULL, '[{\"qyestionType\":\"单选\",\"qyestionScore\":5,\"qyestionContent\":\"123\",\"select\":[{\"value\":\"123\",\"name\":\"A\"},{\"value\":\"234\",\"name\":\"B\"}],\"isTrue\":\"A\"}]', NULL, '2023-03-30 10:45:57', '2023-04-02 02:14:20', '2023-04-02 02:14:20');
INSERT INTO `scale` VALUES (14, 6, '游瑞智力水平测试', '[{\"qyestionType\":\"单选\",\"qyestionScore\":5,\"qyestionContent\":\"游瑞最爱吃什么？\",\"select\":[{\"value\":\"西瓜\",\"name\":\"A\"},{\"value\":\"依托\",\"name\":\"B\"},{\"value\":\"花生米\",\"name\":\"C\"},{\"value\":\"香蕉\",\"name\":\"D\"}],\"isTrue\":\"A\"}]', NULL, '2023-03-31 03:51:46', '2023-04-02 02:14:31', '2023-04-02 02:14:31');
INSERT INTO `scale` VALUES (15, 7, 'Rivermind量表', '[{\"qyestionType\":\"单选\",\"qyestionScore\":5,\"qyestionContent\":\"1+1=?\",\"select\":[{\"value\":\"1\",\"name\":\"A\"},{\"value\":\"2\",\"name\":\"B\"},{\"value\":\"3\",\"name\":\"C\"},{\"value\":\"4\",\"name\":\"D\"}],\"isTrue\":\"B\"},{\"qyestionType\":\"多选\",\"qyestionScore\":20,\"qyestionContent\":\"2的倍数\",\"select\":[{\"value\":\"1\",\"name\":\"A\"},{\"value\":\"2\",\"name\":\"B\"},{\"value\":\"4\",\"name\":\"C\"},{\"value\":\"6\",\"name\":\"D\"},{\"value\":\"\",\"name\":\"E\"}],\"isTrue\":[\"B\",\"D\",\"C\"]},{\"qyestionType\":\"主观\",\"qyestionScore\":20,\"qyestionContent\":\"与人交流的能力？\",\"select\":[],\"isTrue\":[]}]', NULL, '2023-03-31 08:25:31', '2023-04-13 10:46:18', '2023-04-13 10:46:18');
INSERT INTO `scale` VALUES (16, 5, '期中测试', '[{\"qyestionType\":\"单选\",\"qyestionScore\":5,\"qyestionContent\":\"1+2=？\",\"select\":[{\"value\":\"1\",\"name\":\"A\"},{\"value\":\"3\",\"name\":\"B\"},{\"value\":\"2\",\"name\":\"C\"},{\"value\":\"5\",\"name\":\"D\"}],\"isTrue\":\"B\"},{\"qyestionType\":\"单选\",\"qyestionScore\":5,\"qyestionContent\":\"10-1=？\",\"select\":[{\"value\":\"9\",\"name\":\"A\"},{\"value\":\"11\",\"name\":\"B\"},{\"value\":\"8\",\"name\":\"C\"},{\"value\":\"7\",\"name\":\"D\"}],\"isTrue\":\"A\"}]', NULL, '2023-04-01 06:48:29', '2023-04-10 02:29:28', '2023-04-10 02:29:28');
INSERT INTO `scale` VALUES (17, 6, '测试1', '[{\"qyestionType\":\"多选\",\"qyestionScore\":5,\"qyestionContent\":\"2的倍数\",\"select\":[{\"value\":\"5\",\"name\":\"A\"},{\"value\":\"6\",\"name\":\"B\"},{\"value\":\"4\",\"name\":\"C\"},{\"value\":\"7\",\"name\":\"D\"}],\"isTrue\":[\"B\",\"C\"]},{\"qyestionType\":\"单选\",\"qyestionScore\":5,\"qyestionContent\":\"1+1=？\",\"select\":[{\"value\":\"2\",\"name\":\"A\"},{\"value\":\"3\",\"name\":\"B\"},{\"value\":\"4\",\"name\":\"C\"},{\"value\":\"5\",\"name\":\"D\"}],\"isTrue\":\"A\"},{\"qyestionType\":\"主观\",\"qyestionScore\":5,\"qyestionContent\":\"说出学校名称\",\"select\":[],\"isTrue\":[]}]', NULL, '2023-04-02 03:13:56', '2023-04-13 10:46:20', '2023-04-13 10:46:20');
INSERT INTO `scale` VALUES (18, 8, '初中段普校语文学业评估量表', '[{\"qyestionType\":\"主观\",\"qyestionScore\":5,\"qyestionContent\":\"(一)识字与写字\",\"select\":[],\"isTrue\":[]}]', NULL, '2023-04-02 03:20:17', '2023-04-16 15:25:41', '2023-04-16 15:25:41');
INSERT INTO `scale` VALUES (19, 6, '111', '[{\"qyestionType\":\"多选\",\"qyestionScore\":5,\"qyestionContent\":\"3的倍数？\",\"select\":[{\"value\":\"3\",\"name\":\"A\"},{\"value\":\"4\",\"name\":\"B\"},{\"value\":\"6\",\"name\":\"C\"},{\"value\":\"7\",\"name\":\"D\"}],\"isTrue\":[\"A\",\"C\"]}]', NULL, '2023-04-02 03:24:12', '2023-04-13 10:46:22', '2023-04-13 10:46:22');
INSERT INTO `scale` VALUES (20, 9, '小学二年级上数学随班就读学业评估量表', '[{\"qyestionType\":\"主观\",\"qyestionScore\":\"\",\"qyestionContent\":\"一、数与代数\",\"select\":[],\"isTrue\":[]},{\"qyestionType\":\"多选\",\"qyestionScore\":\"\",\"qyestionContent\":\"二、图形与几何\",\"select\":[],\"isTrue\":[]}]', NULL, '2023-04-02 04:07:59', '2023-04-16 15:25:45', '2023-04-16 15:25:45');
INSERT INTO `scale` VALUES (21, 1, '测试10', '[{\"qyestionType\":\"主观\",\"qyestionScore\":5,\"qyestionContent\":\"认识学校的其他场所，了解其功能认识学校的其他场所，了解其功能认识学校的其他场所，了解其功能认识学校的其他场所，了解其功能认识学校的其他场所，了解其功能认识学校的其他场所，了解其功能认识学校的其他场所，了解其功能认识学校的其他场所，了解其功能认识学校的其他场所，了解其功能认识学校的其他场所，了解其功能认识学校的其他场所，了解其功能认识学校的其他场所，了解其功能认识学校的其他场所，了解其功能认识学校的其他场所，了解其功能认识学校的其他场所，了解其功能认识学校的其他场所，了解其功能认识学校的其他场所，了解其功能认识学校的其他场所，了解认识学校的其他场所，了解其功能其功能认识学校的其他场所，了解其功能\",\"select\":[{\"value\":\"\",\"name\":\"A\"}],\"isTrue\":[]}]', NULL, '2023-04-02 09:47:44', '2023-04-10 00:17:02', '2023-04-10 00:17:02');
INSERT INTO `scale` VALUES (22, 4, '', '[{\"qyestionType\":\"单选\",\"qyestionScore\":3,\"qyestionContent\":\"2+2=?\",\"select\":[{\"value\":\"3\",\"name\":\"A\"},{\"value\":\"4\",\"name\":\"B\"},{\"value\":\"5\",\"name\":\"C\"},{\"value\":\"6\",\"name\":\"D\"}],\"isTrue\":\"B\"}]', NULL, '2023-04-06 11:32:51', '2023-04-07 11:54:39', '2023-04-07 11:54:39');
INSERT INTO `scale` VALUES (23, 14, '西方失语症评估量表（WAB）', '[{\"qyestionType\":\"主观\",\"qyestionScore\":10,\"qyestionContent\":\"一、自发言语\\n1、你今天好些了吗？\",\"select\":[],\"isTrue\":[]},{\"qyestionType\":\"主观\",\"qyestionScore\":10,\"qyestionContent\":\"一、自发言语\\n2、你以前到过这里吗？\",\"select\":[],\"isTrue\":[]},{\"qyestionType\":\"主观\",\"qyestionScore\":10,\"qyestionContent\":\"一、自发言语\\n3、你叫什么名字？\",\"select\":[],\"isTrue\":[]}]', NULL, '2023-04-12 11:39:41', NULL, NULL);
INSERT INTO `scale` VALUES (24, 15, '小学二年级下数学随班就读学业评估量表', '[{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"一、数与代数\\n1.有余数的除法(除数和商都是-位数) \\n2.认识除法竖式\\n3.认识万以内的数(计数单位“千”“万”，数的组成、读写和大小比较)数\\n4. 用算盘表示万以内的数\\n5.“  ”和简单的近似数\\n6.口算两位数加、减两位数(和在100以内)\\n7.笔算两、三位数的加、减，加、减法的验算\\n8.时、分、秒的认识\\n9.用有余数除法解决的简单实际问题\\n10.两步计算的加减法实际问题\",\"select\":[],\"isTrue\":[]},{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"二、图形与几何\\n1.认识东、南、西、北和东北、西北、东南、西南等方向，会用这些词语描绘物体所在的方向\\n2.认识分米和毫米，能够进行简单的长度单位的换算和长度测量\\n3.初步认识直角、锐角与钝角\",\"select\":[],\"isTrue\":[]},{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"三、统计与概率\\n1.简单数据的分类整理\\n2.用画“正”字的方法收集、整理数据\\n3.根据统计数据回答并提出问题，对数据进行简单的分析和解释\",\"select\":[],\"isTrue\":[]},{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"四、综合与实践\\n1．通过实践活动，感受数学在日常生活中的作用，体验运用所学的知识和方法解决简单问题的过程，获得初步的数学活动经验。\\n2.在实践活动中，了解要解决的问题和解决问题的办法。\\n3.经历实践操作的过程，进一步理解所学的内容。\",\"select\":[],\"isTrue\":[]}]', NULL, '2023-04-12 12:01:56', NULL, NULL);
INSERT INTO `scale` VALUES (25, 14, '数学测试', '[{\"qyestionType\":\"主观\",\"qyestionScore\":10,\"qyestionContent\":\"一、数与代数\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"1.有余数的除法(除数和商都是-位数) \\n2.认识除法竖式\\n3.认识万以内的数(计数单位“千”“万”，数的组成、读写和大小比较)数\\n4. 用算盘表示万以内的数\\n5.“  ”和简单的近似数\\n6.口算两位数加、减两位数(和在100以内)\\n7.笔算两、三位数的加、减，加、减法的验算\\n8.时、分、秒的认识\\n9.用有余数除法解决的简单实际问题\\n10.两步计算的加减法实际问题\"}]', NULL, '2023-04-13 09:09:42', '2023-04-13 10:43:27', '2023-04-13 10:43:27');
INSERT INTO `scale` VALUES (26, 14, '数学测试', '[{\"qyestionType\":\"主观\",\"qyestionScore\":0,\"qyestionContent\":\"一.线性代数\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"1.有余数的除法(除数和商都是-位数) \\n2.认识除法竖式\\n3.认识万以内的数(计数单位“千”“万”，数的组成、读写和大小比较)数\\n4. 用算盘表示万以内的数\\n5.“  ”和简单的近似数\\n6.口算两位数加、减两位数(和在100以内)\\n7.笔算两、三位数的加、减，加、减法的验算\\n8.时、分、秒的认识\\n9.用有余数除法解决的简单实际问题\\n10.两步计算的加减法实际问题\"}]', NULL, '2023-04-13 10:43:59', '2023-04-16 15:26:27', '2023-04-16 15:26:27');
INSERT INTO `scale` VALUES (27, 15, '0413数学测试', '[{\"qyestionType\":\"多选\",\"qyestionScore\":3,\"qyestionContent\":\"下列为动物的是？\",\"select\":[{\"value\":\"小猫\",\"name\":\"A\"},{\"value\":\"小狗\",\"name\":\"B\"},{\"value\":\"西瓜\",\"name\":\"C\"},{\"value\":\"香蕉\",\"name\":\"D\"},{\"value\":\"猹\",\"name\":\"E\"}],\"isTrue\":[\"B\",\"A\",\"E\"],\"subjectivity\":\"\"}]', NULL, '2023-04-13 11:13:21', '2023-04-16 15:26:40', '2023-04-16 15:26:40');
INSERT INTO `scale` VALUES (28, 16, '0414语文测试', '[{\"qyestionType\":\"主观\",\"qyestionScore\":3,\"qyestionContent\":\"我的学校叫什么？\",\"select\":[{\"value\":\"\",\"name\":\"A\"},{\"value\":\"\",\"name\":\"B\"},{\"value\":\"\",\"name\":\"C\"},{\"value\":\"\",\"name\":\"D\"}],\"isTrue\":[],\"subjectivity\":\"0.不能准确表达题目意思\\n1.能够模糊表达意思\\n2.能够准确表达意思\"}]', NULL, '2023-04-14 00:05:09', '2023-04-14 01:02:58', '2023-04-14 01:02:58');
INSERT INTO `scale` VALUES (29, 14, '0414言语测试', '[{\"qyestionType\":\"主观\",\"qyestionScore\":5,\"qyestionContent\":\"复述一至两个句子\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"能够复述故事中的一至两个句子\\n\\n说出一些相关的词语\\n\\n 没有任何反应\\n\\n该项目不适合所测试的儿童\"}]', NULL, '2023-04-14 00:50:32', '2023-04-14 01:02:56', '2023-04-14 01:02:56');
INSERT INTO `scale` VALUES (30, 15, '0414数学测试', '[{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"线性代数\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"1\\n2\\n3\\n4\\n5\\n6\"}]', NULL, '2023-04-14 01:02:01', '2023-04-14 01:02:54', '2023-04-14 01:02:54');
INSERT INTO `scale` VALUES (31, 16, '0414语文测试', '[{\"qyestionType\":\"主观\",\"qyestionScore\":3,\"qyestionContent\":\"12346\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"1\\n2\\n3\\n4\\n5\\n6\"}]', NULL, '2023-04-14 01:04:18', '2023-04-14 01:08:48', '2023-04-14 01:08:48');
INSERT INTO `scale` VALUES (32, 16, '23123123', '[{\"qyestionType\":\"主观\",\"qyestionScore\":2,\"qyestionContent\":\"123\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"1\\n2\\n3\\n4\\n5\\n6\"}]', NULL, '2023-04-14 01:09:08', '2023-04-14 01:27:53', '2023-04-14 01:27:53');
INSERT INTO `scale` VALUES (33, 16, '111', '[{\"qyestionType\":\"主观\",\"qyestionScore\":2,\"qyestionContent\":\"1231\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"111\\n1\\n1\\n1\\n1\"}]', NULL, '2023-04-14 01:24:37', '2023-04-14 01:27:52', '2023-04-14 01:27:52');
INSERT INTO `scale` VALUES (34, 14, '11', '[{\"qyestionType\":\"主观\",\"qyestionScore\":2,\"qyestionContent\":\"123\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"3\\n3\\n3\\n33\\n3\"}]', NULL, '2023-04-14 01:25:48', '2023-04-14 01:27:50', '2023-04-14 01:27:50');
INSERT INTO `scale` VALUES (35, 14, '123', '[{\"qyestionType\":\"主观\",\"qyestionScore\":2,\"qyestionContent\":\"2\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"！@\\n3\\n4\\n5\\n6\\n7\"}]', '666', '2023-04-14 01:28:16', '2023-04-16 15:26:55', '2023-04-16 15:26:55');
INSERT INTO `scale` VALUES (36, 15, '1200数学学业水平', '[{\"qyestionType\":\"主观\",\"qyestionScore\":5,\"qyestionContent\":\"认读\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"1. 能准确认读生字\\n\\n2. 能在提示下准确认读词汇\\n\\n3. 有认读的意愿，但不够准确\\n\\n4. 没有反应\"}]', '结合场景说句子“水果店里有XXX。”或其他拓展内容	否\n跟读词语“米饭”	否\n跟读句子“米饭和面条，蔬菜和水果。样样都爱吃，我们不挑食。”	否\n结合场景说句子“我爱吃XXX。”或其他拓展内容	否\n跟读词语“手指”	否\n跟读句子“十个手指头。小手本领大。”', '2023-04-14 04:02:56', '2023-04-16 15:27:12', '2023-04-16 15:27:12');
INSERT INTO `scale` VALUES (37, 18, '小学一年级上普校语文学业评估量表', '[{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"一、汉语拼音\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"1.学会汉语拼音。能读准声母、韵母、声调和整体认读音节。能准确地拼读音节，正确书写声母、韵母和音节。\\n2.能借助汉语拼音识字、正音、学说普通话。\"},{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"二、识字与写字\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"1.喜欢学习汉字，有主动识字、写字的愿望。\\n2.认识常用汉字300个，会写其中的100个。\\n3.掌握汉字的基本笔画和常用的偏旁部首，能按笔顺规则写字，把字写得正确、端正、整洁。\\n4.初步养成良好的写字习惯，写字姿势正确。\\n5.学习独立识字。能借助汉语拼音认读汉字。\"},{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"三、阅读\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"1.喜欢阅读，感受阅读的乐趣。爱护图书。\\n2.学习用普通话正确、流利朗读课文。\\n3.在阅读中积累词语。借助读物中的图画阅读。\\n4.对读物中感兴趣的内容有自己的感受和想法，乐于与他人交流。\\n5.诵读儿歌和浅近的古诗，展开想象，获得初步的情感体验，感受语言的优美。\\n6.认识逗号、句号等常用标点符号。认识自然段。\\n7.积累古诗和名言警句。主动进行课外阅读。\"},{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"四、口语交际\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"1.学说普通话，逐步养成讲普通话的习惯。\\n2.能认真听别人讲话。\\n3.与别人交谈，态度自然大方，有礼貌。\\n4.有表达的自信心。积极参加讨论，敢于发表自己的意见。\"}]', '评分方法：\n4分表示儿童能够独立完成该项目；（无需制定IEP)\n3分表示儿童在单一辅助下完成该项目；（制定IEP，但能跟上大部分学生）\n2分表示在两个或者两个以上辅助下完成该项目；（制定IEP,障碍程度较轻，但没有办法在规定时间内完成学业评估）\n1分表示调整或降低难度后才能完成该项目；（中轻度认知障碍，接受了适当的教育仍无法达到年级成就标准）\n0分表示使用替代性学业成就标准；（严重认知障碍，无法跟上普通课程标准）', '2023-04-16 15:42:02', NULL, NULL);
INSERT INTO `scale` VALUES (38, 16, '小学二年级上普校语文学业评估量表', '[{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"(一)识字与写字\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"1.喜欢学习汉字，有主动识字、写字的愿望。\\n2.认识常用汉字450个，会写汉字250个。\\n3.注意汉字的间架结构，初步感受汉字的形体美。\\n4.养成良好的写字习惯，写字姿势正确，书写规范、端正、整洁。\\n5.学习独立识字。学习使用部首查字法查字典。\"},{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"(二)阅读\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"1.喜欢阅读，感受阅读的乐趣。养成爱护图书的习惯。\\n2.用普通话正确、流利地朗读课文。学习默读。\\n3.结合上下文和生活经验了解课文中词句的意思，在阅读中积累词语。\\n4.对感兴趣的人物和事件有自己的感受和想法，并乐于与人交流。\\n5.诵读儿歌和浅近的古诗，展开想象，获得初步的情感体验，感受语言的优美。\\n6.在阅读中体会句号、问号、感叹号所表达的不同语气。\\n7.积累自己喜欢的成语和格言警句。背诵优秀诗文，课外阅读总量不少于1万字。\"},{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"(三)口语交际\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"1.能认真听别人讲话，努力了解讲话的主要内容。\\n2.能较完整地讲述小故事，能简要讲述自己感兴趣的见闻。\\n3.与别人交谈，态度自然大方，有礼貌。\\n4.有表达的自信心。积极参加讨论，敢于发表自己的意见。\"},{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"(四)写话\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"1.对写话有兴趣，留心周围事物，写自己想说的话，写想象中的事物。\\n2.在写话中乐于运用阅读和生活中学到的词语。\\n3.根据表达的需要，学习使用逗号、句号、问号、感叹号。\"}]', '评分方法：\n4分表示儿童能够独立完成该项目；（无需制定IEP)\n3分表示儿童在单一辅助下完成该项目；（制定IEP，但能跟上大部分学生）\n2分表示在两个或者两个以上辅助下完成该项目；（制定IEP,障碍程度较轻，但没有办法在规定时间内完成学业评估）\n1分表示调整或降低难度后才能完成该项目；（中轻度认知障碍，接受了适当的教育仍无法达到年级成就标准）\n0分表示使用替代性学业成就标准；（严重认知障碍，无法跟上普通课程标准）', '2023-04-16 15:48:45', NULL, NULL);
INSERT INTO `scale` VALUES (39, 9, '小学二年级上数学随班就读学业评估量表', '[{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"一、数与代数\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"1.能进行100以内连加、连减和加减混合\\n2.能求比一个数多（少）几的数是多少的实际问题\\n3.乘法的含义\\n4.乘法口诀，用乘法计算表内乘法\\n5.了解除法的含义\\n6.能用乘法口诀求商\\n7.求几个相同加数和的简单实际问题，与平均分有关的简单实际问题\"},{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"二、图形与几何\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"1.初步认识四边形、五边形、六边形以及平行四边形\\n2.初步认识线段，认识常用的长短单位厘米、米，用尺量线段或者物体的长短 \\n3.能从前面、后面、右面、左面观察物体\"},{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"三、统计与概率\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"无\"},{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"四、综合与实践\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"1.通过实践活动，感受数学在日常生活中的作用，体验运用所学的知识和方法解决简单问题的过程，获得初步的数学活动经验。\\n2.在实践活动中，了解要解决的问题和解决问题的办法。\\n3.经历实践操作的过程，进一步理解所学的内容。\"}]', '评分方法：\n4分表示儿童能够独立完成该项目；（无需制定IEP)\n3分表示儿童在单一辅助下完成该项目；（制定IEP，但能跟上大部分学生）\n2分表示在两个或者两个以上辅助下完成该项目；（制定IEP,障碍程度较轻，但没有办法在规定时间内完成学业评估）\n1分表示调整或降低难度后才能完成该项目；（中轻度认知障碍，接受了适当的教育仍无法达到年级成就标准）\n0分表示使用替代性学业成就标准；（严重认知障碍，无法跟上普通课程标准）', '2023-04-16 16:00:43', NULL, NULL);
INSERT INTO `scale` VALUES (40, 19, '巴氏指数（Barthel Index）评定表', '[{\"qyestionType\":\"主观\",\"qyestionScore\":10,\"qyestionContent\":\"一、大便\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"0=失禁或昏迷\\n5=偶尔失禁（每周<1次）\\n10=能控制\"},{\"qyestionType\":\"主观\",\"qyestionScore\":10,\"qyestionContent\":\"二、小便\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"0=失禁或昏迷或需由他人导尿\\n5=偶尔失禁（每24小时<1次，每周>1次）\\n10=能控制\"},{\"qyestionType\":\"主观\",\"qyestionScore\":5,\"qyestionContent\":\"三、修饰\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"0=需帮助\\n5=独立洗脸、梳头、刷牙、剃须\"},{\"qyestionType\":\"主观\",\"qyestionScore\":10,\"qyestionContent\":\"四、如厕\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"0=依赖别人\\n5=需部分帮助\\n10=自理\"},{\"qyestionType\":\"主观\",\"qyestionScore\":10,\"qyestionContent\":\"五、吃饭\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"0=依赖别人\\n5=需部分帮助（夹饭、盛饭、切面包）\\n10=全面自理\"},{\"qyestionType\":\"主观\",\"qyestionScore\":15,\"qyestionContent\":\"六、转移（床←→椅）\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"0=完全依赖别人，不能坐\\n5=需大量帮助（2人），能坐\\n10=需少量帮助（1人）或指导\\n15=自理\"},{\"qyestionType\":\"主观\",\"qyestionScore\":15,\"qyestionContent\":\"七、活动（步行）（在病房及其周围，不包括走远路）\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"0=不能动\\n5=在轮椅上独立行动\\n10=需1人帮助步行（体力或语言指导）\\n15=独立步行（可用辅助器）\"},{\"qyestionType\":\"主观\",\"qyestionScore\":10,\"qyestionContent\":\"八、穿衣\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"0=依赖\\n5=需一半帮助\\n10=自理（系开钮扣、关、开拉锁和穿鞋）\"},{\"qyestionType\":\"主观\",\"qyestionScore\":10,\"qyestionContent\":\"九、上楼梯（上下一段楼梯，用手杖也算独立）\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"0=不能\\n5=需帮助（体力或语言指导）\\n10=自理\"},{\"qyestionType\":\"主观\",\"qyestionScore\":5,\"qyestionContent\":\"十、洗澡\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"0=依赖\\n5=自理\"}]', '', '2023-04-16 16:40:55', NULL, NULL);
INSERT INTO `scale` VALUES (41, 20, '义务教育阶段体育课程评估表', '[{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"一、运动参与——参与体育学习与锻炼\\n\",\"select\":[{\"value\":\"\",\"name\":\"A\"}],\"isTrue\":[],\"subjectivity\":\"表现出自觉参加课外体育锻炼得习惯。\"},{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"一、运动参与——体验成功与运动乐趣\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"在体验运动乐趣得过程中形成积极得体育态度。\"},{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"二、学习运动知识——简要分析体育运动中得现象与问题\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"简要分析现代体育与奥运会发展过程中所发生得一些重要事件与问题\"},{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"二、学习运动知识——提高体育学习与锻炼得能力\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"比较全面地掌握科学锻炼身体得基本知识与方法、如比较全面地掌握运动强度与密度、靶心率、运动处方、心率测定与运动量控制等基本知识与方法。\"},{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"二、学习运动知识——掌握并运用运动技术\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"基本掌握并运用田径类运动得技术。\\n基本掌握并运用球类运动得技术与简单战术、如基本掌握并运用篮球、排球、足球、羽毛球、乒乓球、网球、毽球、珍珠球与三门球等球类项目得技术与简单战术。\\n基本掌握并运用体操类运动得技术、如基本掌握并运用器械体操、技巧、健美操、街舞、啦啦操、校园集体舞、民族舞等项目得技术动作与组合动作等。\\n基本掌握并运用游泳运动或冰雪类运动得技术。\\n基本掌握并运用武术类运动得技术。\\n基本掌握并运用较复杂得其他民族民间体育活动项目得技术。\"},{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"二、学习运动知识——提高安全运动的能力\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"提高安全运动的意识\"},{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"二、学习运动知识——将安全运动得意识迁移到日常生活中\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"在日常生活中形成安全行动得意识与能力、如在日常生活中走路、骑车以及特殊气候等条件下注意安全,懂得自然灾害(如地震等)发生时主动规避危险得知识与方法等\"},{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"三、身体健康——掌握基本保健知识与方法\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"了解合理饮食与体育锻炼对控制体重的作用。\\n了解合理安排作息对身体健康得益处。\\n了解生活恶习对身体健康得危害并自觉抵制。\\n了解常见传染性疾病得传播途径与预防方法、如了解急性上呼吸道感染、流行性、感冒、结核病、病毒性肝炎、伤寒与菌痢的传播途径与预防方法等。\\n了解艾滋病与血吸虫病对人体得危害与预防方法。\\n\"},{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"三、身体健康——全面发展体能与健身能力\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"在多种运动项目练习中提高灵敏性。\\n在多种运动项目练习中提高力量水平。\\n在多种运动项目练习中提高速度水平。\\n在多种运动项目练习中提高心肺耐力。\"},{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"四、心理健康与社会适应——培养坚强得意志品质\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"积极应对各种困难,并果断做出决策。\"},{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"四、心理健康与社会适应——学会调控情绪得方法\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"分析体育学习与锻炼中挫折与失败得原因,并保持稳定与积极得情绪。\"},{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"四、心理健康与社会适应——形成合作意识与能力\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"在集体性体育活动中共同努力实现目标。\"},{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"四、心理健康与社会适应——具有良好得体育道德\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"在体育活动与日常生活中表现出良好得道德行为。\"},{\"qyestionType\":\"主观\",\"qyestionScore\":0,\"qyestionContent\":\"\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"\"}]', '评分方法：\n4分表示儿童能够独立完成该项目；\n3分表示儿童在单一辅助下完成该项目；\n2分表示在两个或者两个以上辅助下完成该项目；\n1分表示调整或降低难度后才能完成该项目；\n0分表示使用替代性学业成就标准；\n', '2023-04-16 17:08:02', NULL, NULL);
INSERT INTO `scale` VALUES (42, 15, '2345234', '[{\"qyestionType\":\"单选判断\",\"qyestionScore\":3,\"qyestionContent\":\"123\",\"select\":[{\"value\":\"123\",\"name\":\"A\"},{\"value\":\"123\",\"name\":\"B\"}],\"isTrue\":\"B\",\"subjectivity\":\"\",\"Single\":[1,2]}]', '', '2023-04-17 13:10:27', '2023-04-17 17:14:07', '2023-04-17 17:14:07');
INSERT INTO `scale` VALUES (43, 15, '1', '[{\"qyestionType\":\"单选判断\",\"qyestionScore\":3,\"qyestionContent\":\"3\",\"select\":[{\"value\":\"4\",\"name\":\"A\"},{\"value\":\"5\",\"name\":\"B\"},{\"value\":\"6\",\"name\":\"C\"}],\"isTrue\":\"C\",\"subjectivity\":\"\",\"Single\":[1,2,3]}]', '2', '2023-04-17 17:12:21', '2023-04-17 17:14:03', '2023-04-17 17:14:03');
INSERT INTO `scale` VALUES (44, 9, '1', '[{\"qyestionType\":\"单选判断\",\"qyestionScore\":3,\"qyestionContent\":\"3\",\"select\":[{\"value\":\"4\",\"name\":\"A\"},{\"value\":\"5\",\"name\":\"B\"},{\"value\":\"6\",\"name\":\"C\"}],\"isTrue\":\"C\",\"subjectivity\":\"\",\"Single\":[1,2,2]}]', '2', '2023-04-17 17:19:16', NULL, NULL);
INSERT INTO `scale` VALUES (45, 23, '测试', '[{\"qyestionType\":\"单选\",\"qyestionScore\":2,\"qyestionContent\":\"1+1 = ？\",\"select\":[{\"value\":\"1\",\"name\":\"A\"},{\"value\":\"2\",\"name\":\"B\"},{\"value\":\"3\",\"name\":\"C\"},{\"value\":\"4\",\"name\":\"D\"}],\"isTrue\":\"B\",\"subjectivity\":\"\",\"Single\":[0,0,0,0]}]', '', '2023-04-20 13:33:58', NULL, NULL);
INSERT INTO `scale` VALUES (46, 24, '测试2', '[{\"qyestionType\":\"单选判断\",\"qyestionScore\":4,\"qyestionContent\":\"下面最大的数为？\",\"select\":[{\"value\":\"1\",\"name\":\"A\"},{\"value\":\"2\",\"name\":\"B\"},{\"value\":\"3\",\"name\":\"C\"},{\"value\":\"4\",\"name\":\"D\"}],\"isTrue\":\"D\",\"subjectivity\":\"\",\"Single\":[0,1,2,3]}]', '', '2023-04-20 14:00:44', NULL, NULL);
INSERT INTO `scale` VALUES (47, 25, '测试3', '[{\"qyestionType\":\"多选\",\"qyestionScore\":0,\"qyestionContent\":\"以下是偶数的是？\",\"select\":[{\"value\":\"2\",\"name\":\"A\"},{\"value\":\"1\",\"name\":\"B\"},{\"value\":\"4\",\"name\":\"C\"},{\"value\":\"3\",\"name\":\"D\"}],\"isTrue\":[\"C\",\"A\"],\"subjectivity\":\"\",\"Single\":[]}]', '', '2023-04-20 14:05:56', NULL, NULL);
INSERT INTO `scale` VALUES (48, 26, '小学四年级上普校语文学业评估量表', '[{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"一、认字\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"1、要求达到什么水平；\\n2、要求课表的某一项内容；\\n3、要求古诗达到什么水平；\",\"Single\":[]},{\"qyestionType\":\"主观\",\"qyestionScore\":4,\"qyestionContent\":\"二、朗读\",\"select\":[],\"isTrue\":[],\"subjectivity\":\"1、要求达到什么水平；\\n2、要求课表的某一项内容；\\n3、要求古诗达到什么水平；\",\"Single\":[]}]', '0~4分制的，具体的问题请见后页', '2023-04-21 14:12:23', NULL, NULL);

-- ----------------------------
-- Table structure for scaleclassify
-- ----------------------------
DROP TABLE IF EXISTS `scaleclassify`;
CREATE TABLE `scaleclassify`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `classify1` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '一级分类',
  `classify2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '二级分类',
  `classify3` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '三级分类',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '量表分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of scaleclassify
-- ----------------------------
INSERT INTO `scaleclassify` VALUES (9, '学业水平', '数学', '小学二年级上数学随班就读学业评估量表');
INSERT INTO `scaleclassify` VALUES (14, '基础疾病', '言语认知', '西方失语症评估量表（WAB）');
INSERT INTO `scaleclassify` VALUES (15, '学业水平', '数学', '小学二年级下数学随班就读学业评估量表');
INSERT INTO `scaleclassify` VALUES (16, '学业水平', '语文', '小学二年级上普校语文学业评估量表');
INSERT INTO `scaleclassify` VALUES (18, '学业水平', '语文', '小学一年级上普校语文学业评估量表');
INSERT INTO `scaleclassify` VALUES (19, '基础疾病', '基础ADL评价', '巴氏指数（Barthel Index）评定表');
INSERT INTO `scaleclassify` VALUES (20, '学业水平', '体育', '义务教育阶段体育课程评估表');
INSERT INTO `scaleclassify` VALUES (21, '基础疾病', '和ICF评价有关', '基于ICF-CY编码的功能性评估');
INSERT INTO `scaleclassify` VALUES (23, '学业水平', '英语', '测试');
INSERT INTO `scaleclassify` VALUES (24, '学业水平', '英语', '测试2');
INSERT INTO `scaleclassify` VALUES (25, '学业水平', '英语', '测试3');
INSERT INTO `scaleclassify` VALUES (26, '学业水平', '语文', '小学四年级上普校语文学业评估量表');

-- ----------------------------
-- Table structure for school
-- ----------------------------
DROP TABLE IF EXISTS `school`;
CREATE TABLE `school`  (
  `schoolId` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `schoolName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `provinceCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `cityCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `regionCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` datetime NULL DEFAULT NULL,
  `updateTime` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleteTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`schoolId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '学校' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of school
-- ----------------------------
INSERT INTO `school` VALUES (1, '苏州市相城区特殊教育学校', '320000', '320500', '320507', '2023-03-22 19:04:19', NULL, NULL);
INSERT INTO `school` VALUES (2, '苏州信息职业技术学院', NULL, NULL, NULL, '2023-03-22 12:08:16', '2023-03-31 09:38:22', '2023-03-31 09:38:22');
INSERT INTO `school` VALUES (3, '2', '320000', '320500', '320509', '2023-03-25 09:53:12', '2023-03-27 12:32:20', '2023-03-27 12:32:20');
INSERT INTO `school` VALUES (4, '2', '150000', '150200', '150205', '2023-03-25 10:03:42', '2023-03-28 15:07:51', '2023-03-28 15:07:51');
INSERT INTO `school` VALUES (5, '常州信息特殊教育学院', '320000', '320400', '320412', '2023-03-25 10:33:46', '2023-03-28 15:13:51', '2023-03-28 15:13:51');
INSERT INTO `school` VALUES (6, '常州机电特俗学院', '320000', '320400', '320412', '2023-03-25 10:37:07', '2023-03-28 15:13:46', '2023-03-28 15:13:46');
INSERT INTO `school` VALUES (7, '相城元和学校', '320000', '320500', '320507', '2023-03-31 08:16:05', NULL, NULL);
INSERT INTO `school` VALUES (8, '吴江特教学校', '320000', '320500', '320509', '2023-04-01 02:09:12', NULL, NULL);
INSERT INTO `school` VALUES (9, '吴江高级中学', '320000', '320500', '320509', '2023-04-01 02:11:34', NULL, NULL);
INSERT INTO `school` VALUES (10, '常熟中学', '320000', '320500', '320581', '2023-04-12 07:35:44', NULL, NULL);
INSERT INTO `school` VALUES (11, '太仓特教学校', '320000', '320500', '320585', '2023-04-16 11:50:07', NULL, NULL);
INSERT INTO `school` VALUES (12, '南师大小学', '320000', '320500', '320507', '2023-04-21 14:20:49', NULL, NULL);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `studentId` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `schoolId` int NULL DEFAULT NULL,
  `clazzId` int NOT NULL,
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `passWord` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `studentName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `studentHead` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `studentGender` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `obstacleId` int NULL DEFAULT NULL,
  `arrangeId` int NULL DEFAULT NULL,
  `authorization` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createTime` datetime NULL DEFAULT NULL,
  `updateTime` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleteTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`studentId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 90 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '学生表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (52, 7, 18, 'cb', '123456', '茶杯', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', 4, 1, '审批完成', '2023-03-31 08:18:56', '2023-04-05 19:04:39', NULL);
INSERT INTO `student` VALUES (53, 9, 10, 'wy', '123456', '吴用', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', 2, 1, '需委员会审批', '2023-04-01 05:12:34', '2023-04-05 19:36:20', NULL);
INSERT INTO `student` VALUES (54, 9, 13, 'lt', '123456', '刘唐', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', 8, 4, '需学校审批', '2023-04-02 07:06:31', '2023-04-05 19:05:12', NULL);
INSERT INTO `student` VALUES (55, 9, 18, NULL, NULL, '鲁智深', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', 7, 6, NULL, '2023-04-08 07:40:21', '2023-04-10 02:30:31', NULL);
INSERT INTO `student` VALUES (56, 9, 18, NULL, NULL, '松江', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', 1, 6, NULL, '2023-04-08 07:48:35', '2023-04-08 07:49:58', '2023-04-08 07:49:58');
INSERT INTO `student` VALUES (57, 9, 18, NULL, NULL, '卢俊义', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', 8, 6, NULL, '2023-04-08 08:34:26', '2023-04-08 08:39:29', '2023-04-08 08:39:29');
INSERT INTO `student` VALUES (58, 7, 19, NULL, NULL, '武松', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', 8, 7, NULL, '2023-04-08 08:43:07', '2023-04-08 08:43:17', '2023-04-08 08:43:17');
INSERT INTO `student` VALUES (59, 9, 18, NULL, NULL, '卢俊义', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', 8, 6, NULL, '2023-04-08 08:43:07', '2023-04-08 08:43:20', '2023-04-08 08:43:20');
INSERT INTO `student` VALUES (60, 9, 18, NULL, NULL, '卢俊义', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', 8, 6, NULL, '2023-04-08 08:43:39', '2023-04-08 08:51:50', '2023-04-08 08:51:50');
INSERT INTO `student` VALUES (61, 7, 19, NULL, NULL, '武松', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', 8, 7, NULL, '2023-04-08 08:43:39', '2023-04-08 08:51:54', '2023-04-08 08:51:54');
INSERT INTO `student` VALUES (62, 9, 18, NULL, NULL, '卢俊义', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', 8, 6, NULL, '2023-04-08 08:52:09', '2023-04-08 08:52:19', '2023-04-08 08:52:19');
INSERT INTO `student` VALUES (63, 7, 19, NULL, NULL, '武松', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', 8, 7, NULL, '2023-04-08 08:52:09', '2023-04-08 08:52:21', '2023-04-08 08:52:21');
INSERT INTO `student` VALUES (64, 9, 18, NULL, NULL, '宋江', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', 8, 6, NULL, '2023-04-08 08:58:55', '2023-04-08 08:59:41', '2023-04-08 08:59:41');
INSERT INTO `student` VALUES (65, 7, 19, NULL, NULL, '时迁', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', 8, 7, NULL, '2023-04-08 08:58:55', '2023-04-08 08:59:48', '2023-04-08 08:59:48');
INSERT INTO `student` VALUES (66, 9, 18, NULL, NULL, '卢俊义', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', 8, 6, NULL, '2023-04-08 08:59:31', '2023-04-08 08:59:50', '2023-04-08 08:59:50');
INSERT INTO `student` VALUES (67, 7, 19, NULL, NULL, '武松', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', 8, 7, NULL, '2023-04-08 08:59:31', '2023-04-08 08:59:52', '2023-04-08 08:59:52');
INSERT INTO `student` VALUES (68, 9, 18, NULL, NULL, '卢俊义', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', 8, 6, NULL, '2023-04-08 09:01:18', '2023-04-08 09:04:05', '2023-04-08 09:04:05');
INSERT INTO `student` VALUES (69, 7, 19, NULL, NULL, '武松', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', 8, 7, NULL, '2023-04-08 09:01:18', '2023-04-08 09:04:02', '2023-04-08 09:04:02');
INSERT INTO `student` VALUES (70, 9, 18, NULL, NULL, '宋江', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', 8, 6, NULL, '2023-04-08 09:03:11', '2023-04-08 09:03:59', '2023-04-08 09:03:59');
INSERT INTO `student` VALUES (71, 7, 19, NULL, NULL, '时迁', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', 8, 7, NULL, '2023-04-08 09:03:11', '2023-04-08 09:03:57', '2023-04-08 09:03:57');
INSERT INTO `student` VALUES (72, 9, 18, NULL, NULL, '宋江', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', 8, 6, NULL, '2023-04-08 09:09:13', '2023-04-08 10:13:14', '2023-04-08 10:13:14');
INSERT INTO `student` VALUES (73, 7, 19, NULL, NULL, '时迁', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', 8, 7, NULL, '2023-04-08 09:09:13', '2023-04-08 10:13:17', '2023-04-08 10:13:17');
INSERT INTO `student` VALUES (74, 9, 18, NULL, NULL, '卢俊义', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', 8, 6, NULL, '2023-04-08 10:13:59', '2023-04-08 11:02:04', '2023-04-08 11:02:04');
INSERT INTO `student` VALUES (75, 7, 19, NULL, NULL, '武松', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', 8, 7, NULL, '2023-04-08 10:13:59', '2023-04-08 11:02:06', '2023-04-08 11:02:06');
INSERT INTO `student` VALUES (76, 7, 19, NULL, NULL, '武松', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', 8, 7, NULL, '2023-04-08 11:37:51', '2023-04-08 11:38:10', '2023-04-08 11:38:10');
INSERT INTO `student` VALUES (77, 9, 18, NULL, NULL, '卢俊义', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', 8, 6, NULL, '2023-04-08 11:37:51', '2023-04-08 11:38:12', '2023-04-08 11:38:12');
INSERT INTO `student` VALUES (78, 7, 19, NULL, NULL, '时迁', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', 8, 7, NULL, '2023-04-08 11:47:17', '2023-04-08 11:47:58', '2023-04-08 11:47:58');
INSERT INTO `student` VALUES (79, 9, 18, NULL, NULL, '宋江', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', 8, 6, NULL, '2023-04-08 11:47:17', '2023-04-08 11:47:53', '2023-04-08 11:47:53');
INSERT INTO `student` VALUES (80, 7, 19, NULL, NULL, '武松', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', 8, 7, NULL, '2023-04-08 11:47:34', '2023-04-08 11:47:50', '2023-04-08 11:47:50');
INSERT INTO `student` VALUES (81, 9, 18, NULL, NULL, '卢俊义', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', 8, 6, NULL, '2023-04-08 11:47:34', '2023-04-08 11:48:02', '2023-04-08 11:48:02');
INSERT INTO `student` VALUES (82, 7, 19, NULL, NULL, '时迁', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', 8, 7, NULL, '2023-04-08 11:49:15', '2023-04-08 11:49:24', '2023-04-08 11:49:24');
INSERT INTO `student` VALUES (83, 9, 18, NULL, NULL, '宋江', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', 8, 6, NULL, '2023-04-08 11:49:15', '2023-04-08 11:49:26', '2023-04-08 11:49:26');
INSERT INTO `student` VALUES (84, 7, 19, NULL, NULL, '时迁', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', 8, 7, NULL, '2023-04-08 11:50:01', NULL, NULL);
INSERT INTO `student` VALUES (85, 9, 18, NULL, NULL, '宋江', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', 5, 6, NULL, '2023-04-08 11:50:01', '2023-04-10 02:30:13', NULL);
INSERT INTO `student` VALUES (86, 7, 19, NULL, NULL, '武松', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', 8, 7, NULL, '2023-04-08 14:41:05', NULL, NULL);
INSERT INTO `student` VALUES (87, 9, 18, NULL, NULL, '卢俊义', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', 11, 1, NULL, '2023-04-08 14:41:05', '2023-04-16 14:00:53', NULL);
INSERT INTO `student` VALUES (88, 11, 21, NULL, NULL, '王英', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', 7, 1, NULL, '2023-04-16 14:05:02', '2023-04-16 14:07:46', NULL);
INSERT INTO `student` VALUES (89, 12, 22, NULL, NULL, '扈三娘', 'https://static.yirenyian.com/opoc/sysImg/avatar-girl.png', '女', 2, 1, NULL, '2023-04-21 14:25:45', '2023-04-21 14:28:31', NULL);

-- ----------------------------
-- Table structure for studentbasic
-- ----------------------------
DROP TABLE IF EXISTS `studentbasic`;
CREATE TABLE `studentbasic`  (
  `basicId` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '基本信息ID',
  `studentId` int NULL DEFAULT NULL COMMENT '学生ID',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `birthday` datetime NULL DEFAULT NULL COMMENT '生日',
  `obstacleDegree` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '障碍程度',
  `otherObstacleId` int NULL DEFAULT NULL COMMENT '伴随障碍类型',
  `cardId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '身份证号',
  `obstacleCardId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '残疾证号',
  `nation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '民族',
  `bloodGroup` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '血型',
  `nationality` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '国籍',
  `studentStatus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学籍状态',
  `studentNo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学籍号',
  `religiousBelief` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '宗教信仰',
  `registeredResidence` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '户籍地',
  `birthplace` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '出生地',
  PRIMARY KEY (`basicId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '学生基本信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of studentbasic
-- ----------------------------
INSERT INTO `studentbasic` VALUES (3, 45, '', NULL, '', 1, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `studentbasic` VALUES (4, 46, '鸡', NULL, '', NULL, '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `studentbasic` VALUES (5, 47, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `studentbasic` VALUES (6, 48, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `studentbasic` VALUES (7, 49, '123', NULL, '', NULL, '', '', '汉族', '', '', '', '', '', '210782', '');
INSERT INTO `studentbasic` VALUES (8, 50, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `studentbasic` VALUES (9, 51, '阿伟', '2023-03-21 00:00:00', '重度', 1, '110', '123', '汉', 'O型', '中国', '在校生', '1234567', '无神论者', '340523', '340303');
INSERT INTO `studentbasic` VALUES (10, 52, '123', '2023-03-13 00:00:00', '轻度', 5, '123', '123', '汉族', 'A型', '中国', '在校生', '123', '123', '220723', '220621');
INSERT INTO `studentbasic` VALUES (11, 53, '', '2006-04-06 00:00:00', '轻中度', 3, '', '', '汉', '', '', '', '', '', '', '');
INSERT INTO `studentbasic` VALUES (12, 54, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `studentbasic` VALUES (13, 55, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `studentbasic` VALUES (14, 56, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `studentbasic` VALUES (15, 57, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `studentbasic` VALUES (16, 58, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `studentbasic` VALUES (17, 59, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `studentbasic` VALUES (18, 60, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `studentbasic` VALUES (19, 61, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `studentbasic` VALUES (20, 62, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `studentbasic` VALUES (21, 63, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `studentbasic` VALUES (22, 64, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `studentbasic` VALUES (23, 65, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `studentbasic` VALUES (24, 66, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `studentbasic` VALUES (25, 67, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `studentbasic` VALUES (26, 68, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `studentbasic` VALUES (27, 69, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `studentbasic` VALUES (28, 70, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `studentbasic` VALUES (29, 71, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `studentbasic` VALUES (30, 72, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `studentbasic` VALUES (31, 73, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `studentbasic` VALUES (32, 74, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `studentbasic` VALUES (33, 75, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `studentbasic` VALUES (34, 76, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `studentbasic` VALUES (35, 77, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `studentbasic` VALUES (36, 78, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `studentbasic` VALUES (37, 79, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `studentbasic` VALUES (38, 80, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `studentbasic` VALUES (39, 81, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `studentbasic` VALUES (40, 82, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `studentbasic` VALUES (41, 83, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `studentbasic` VALUES (42, 84, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `studentbasic` VALUES (43, 85, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `studentbasic` VALUES (44, 86, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `studentbasic` VALUES (45, 87, '123', '2023-04-10 00:00:00', '疑似', 1, '123123', '12312312', '汉', 'B型', '中国', '休学', '34234234', '无', '', '');
INSERT INTO `studentbasic` VALUES (46, 88, '', '2015-04-08 00:00:00', '', NULL, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `studentbasic` VALUES (47, 89, '', NULL, '轻中度', 6, '', '', '', 'B型', '中国', '', '', '', '', '');

-- ----------------------------
-- Table structure for studentdevelopment
-- ----------------------------
DROP TABLE IF EXISTS `studentdevelopment`;
CREATE TABLE `studentdevelopment`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `studentId` int NULL DEFAULT NULL COMMENT '学生Id',
  `richText` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '富文本',
  `createTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleteTime` datetime NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '学生基本信息扩展表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of studentdevelopment
-- ----------------------------
INSERT INTO `studentdevelopment` VALUES (1, NULL, '<p>ello</p>', '2023-04-11 02:15:46', NULL, NULL);
INSERT INTO `studentdevelopment` VALUES (2, NULL, '<p>ello</p>', '2023-04-11 02:17:33', NULL, NULL);
INSERT INTO `studentdevelopment` VALUES (3, 25, '<p>ello</p>', '2023-04-11 02:27:28', NULL, NULL);
INSERT INTO `studentdevelopment` VALUES (4, 52, '<p><br></p>', '2023-04-11 09:08:09', NULL, NULL);
INSERT INTO `studentdevelopment` VALUES (5, 52, '<p>123123</p>', '2023-04-11 09:13:26', NULL, NULL);
INSERT INTO `studentdevelopment` VALUES (6, 52, '<p><span style=\"color: rgb(48, 49, 51); background-color: rgb(255, 255, 255);\">创建时间创建时间创建时间创建时间创建时间创建时间创建时间创建时间创建时间</span></p>', '2023-04-11 09:18:56', NULL, NULL);
INSERT INTO `studentdevelopment` VALUES (7, 52, '<p><img src=\"/file/download?filename=image-jpeg-1681204802580logo2.jpg\" alt=\"image-jpeg-1681204802580logo2.jpg\" data-href=\"http://localhost:8080/file/download?filename=image-jpeg-1681204802580logo2.jpg\" style=\"\"/></p>', '2023-04-11 09:20:05', NULL, NULL);
INSERT INTO `studentdevelopment` VALUES (8, 52, '<p><img src=\"/file/download?filename=image-jpeg-1681208472761xm.jpg\" alt=\"image-jpeg-1681208472761xm.jpg\" data-href=\"http://localhost:8080/file/download?filename=image-jpeg-1681208472761xm.jpg\" style=\"\"/></p>', '2023-04-11 10:21:16', NULL, NULL);
INSERT INTO `studentdevelopment` VALUES (9, 52, '<p><img src=\"/file/download?filename=image-webp-1681208494890luge.webp\" alt=\"image-webp-1681208494890luge.webp\" data-href=\"http://localhost:8080/file/download?filename=image-webp-1681208494890luge.webp\" style=\"\"/></p>', '2023-04-11 10:21:37', NULL, NULL);
INSERT INTO `studentdevelopment` VALUES (10, 52, '<p><img src=\"/file/download?filename=image-jpeg-1681208524195lugeer.jpeg\" alt=\"image-jpeg-1681208524195lugeer.jpeg\" data-href=\"http://localhost:8080/file/download?filename=image-jpeg-1681208524195lugeer.jpeg\" style=\"\"/></p>', '2023-04-11 10:22:08', NULL, NULL);
INSERT INTO `studentdevelopment` VALUES (11, 52, '<p>456465465</p>', '2023-04-11 11:09:05', NULL, NULL);
INSERT INTO `studentdevelopment` VALUES (12, 52, '<p><span style=\"font-family: 宋体;\">我要介绍一副中国古代经典书法作品——《兰亭序》。<br><br>《兰亭序》是东晋书法家王羲之的代表作之一，也是中国书法艺术中的经典之作。这篇书法作品是为了纪念当时的友人王右丞，在兰亭观赏翰墨，借以寄托诗文情怀而写的序文。<br><br>整篇《兰亭序》书法气势恢宏，笔力苍劲有力，横平竖直，从而展现出王羲之独特的风范。整篇文章由42个行草字组成，每个字的结构坚实，线条粗细相间，错落有致，富有节奏感。王羲之巧妙地运用“悬钩结体”的手法，将一些字的上下结构、左右结构等相互牵连，呈现出独具匠心的构图。</span></p><p><span style=\"font-family: 宋体;\"><br>《兰亭序》的字迹虽然偏于行草，但是王羲之在运笔时却兼顾了书法的规矩和技巧，表现出一种自然、流畅的书写方式。在写作中，王羲之将自己对书法的独特理解和对艺术的深刻领悟，融入到了文字中，形成了一种深邃的艺术韵味。在王羲之笔下，每一个字都有其独特的特点，同时也和其他字相互呼应，形成了一种和谐而又统一的整体效果。<br></span></p><p><span style=\"font-family: 宋体;\">首先，我们可以看到王羲之在《兰亭序》中对字的书写非常注重结构的稳定性和线条的流畅性。每个字的笔画间隔、笔画粗细、升降转折的位置都非常得当，使得整篇文章看起来非常舒适而不显得拥挤。同时，王羲之也善于在一些字的结构中添加一些独特的笔法，比如在“蟹”字的左上角，他添加了一个小小的点，使得字的结构更为立体、生动。<br><br>其次，我们可以注意到，王羲之在书写《兰亭序》时特别注重章法的运用，将文字自然而然地组成了一幅意境深远的山水画。在上半部分，他运用了倒金字塔形的排列方式，让整个序文的重心往下，符合文辞内容。而在下半部分，他通过巧妙的空白和字体大小的变化，营造出山水画中的远近、起伏和层次感，呈现出一种优美的视觉效果。<br><br><br><br>最后，我们还可以注意到，《兰亭序》的字迹虽然偏于行草，但是王羲之在书写时并不局限于传统的字形，而是运用了很多自己独特的书法技巧。比如在“咏”字中，他将上下结构、左右结构自然地融合在一起，形成了一个独特的“结体”，同时将“咏”字和后面的“景”字紧密地联系在一起，呈现出一种自然而不造作的艺术效果。<br><br><br>总的来说，作为中国书法艺术的经典之作，《兰亭序》的字迹秀丽，气势磅礴，具有独特的文学价值。</span></p><p><span style=\"font-family: 宋体;\"> </span></p>', '2023-04-12 00:28:31', NULL, NULL);
INSERT INTO `studentdevelopment` VALUES (13, 53, '<p>各种证件<img src=\"/file/download?filename=image-jpeg-1681286280720010的车牌.jpg\" alt=\"image-jpeg-1681286280720010的车牌.jpg\" data-href=\"http://localhost:8080/file/download?filename=image-jpeg-1681286280720010的车牌.jpg\" style=\"\"/></p>', '2023-04-12 07:58:12', NULL, NULL);
INSERT INTO `studentdevelopment` VALUES (14, 53, '<p>诊断证明<img src=\"/file/download?filename=image-jpeg-168128638856148种颜色不同的月饼.jpg\" alt=\"image-jpeg-168128638856148种颜色不同的月饼.jpg\" data-href=\"http://localhost:8080/file/download?filename=image-jpeg-168128638856148种颜色不同的月饼.jpg\" style=\"\"/></p>', '2023-04-12 07:59:55', NULL, NULL);
INSERT INTO `studentdevelopment` VALUES (15, 88, '<p><br></p>', '2023-04-16 14:06:38', NULL, NULL);
INSERT INTO `studentdevelopment` VALUES (16, 52, '<p><img src=\"/file/download?filename=image-jpeg-1681821676162logo2.jpg\" alt=\"image-jpeg-1681821676162logo2.jpg\" data-href=\"http://localhost:8080/file/download?filename=image-jpeg-1681821676162logo2.jpg\" style=\"\"/></p>', '2023-04-18 20:41:21', NULL, NULL);
INSERT INTO `studentdevelopment` VALUES (17, 52, '<p>我们都是战士</p>', '2023-04-21 13:58:42', NULL, NULL);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `teacherId` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '教师Id',
  `schoolId` int NOT NULL COMMENT '学校Id',
  `account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '账号',
  `userName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户名',
  `passWord` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `userHead` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像',
  `userGender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '性别',
  `userPhone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '电话',
  `userMail` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '邮箱',
  `createTime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleteTime` datetime NULL DEFAULT NULL COMMENT '删除时间',
  `schoolAdmin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否学校管理员',
  `authorization` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否授权',
  PRIMARY KEY (`teacherId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '教师表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (24, 1, 'hz', '猴子', 'monkey', '头像', '男', '13016703849', '2970435887@qq.com', '2023-04-04 05:44:12', '2023-04-07 03:13:56', '2023-04-07 03:13:56', '否', NULL);
INSERT INTO `teacher` VALUES (25, 1, '123123', '12', '123123', 'https://static.yirenyian.com/opoc/sysImg/avatar-girl.png', '女', '19851806282', '12312312', '2023-04-04 06:13:47', '2023-04-10 00:06:50', '2023-04-10 00:06:50', '否', '');
INSERT INTO `teacher` VALUES (26, 9, '1234', 'xl', '123123', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', '19851806282', '2312367123', '2023-04-05 01:55:45', '2023-04-10 09:01:45', '2023-04-10 09:01:45', '是', '1');
INSERT INTO `teacher` VALUES (27, 8, '1231212', '游瑞', '123123', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', '12345667231', '231233412312qq.com', '2023-04-07 02:29:48', '2023-04-10 09:01:43', '2023-04-10 09:01:43', '否', NULL);
INSERT INTO `teacher` VALUES (28, 1, '马超', '马超', '123123', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', '12312312312', '123123@qq.com', '2023-04-08 02:15:15', NULL, NULL, '否', NULL);
INSERT INTO `teacher` VALUES (29, 8, '123', '刘备', '123', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', '12312312123', '123123123@qq.com', '2023-04-10 00:05:18', '2023-04-10 00:06:39', NULL, '否', NULL);
INSERT INTO `teacher` VALUES (30, 7, 'zgl', '诸葛亮', '123123', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', '12312312312', '123123123@qq.com', '2023-04-10 09:02:27', '2023-04-10 09:02:35', NULL, '否', NULL);
INSERT INTO `teacher` VALUES (31, 9, 'cc', '曹操', '123123', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', '19823123234', '123123454@qq.com', '2023-04-10 09:03:24', NULL, NULL, '否', NULL);
INSERT INTO `teacher` VALUES (32, 10, '曹仁', '曹仁', '123456', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', '13712345577', '13712345577@qq.com', '2023-04-12 07:40:18', NULL, NULL, '是', NULL);
INSERT INTO `teacher` VALUES (33, 10, '糜芳', '糜芳', '123456', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', '', '13712344455', '2023-04-12 07:44:02', NULL, NULL, '否', NULL);
INSERT INTO `teacher` VALUES (34, 11, '典韦', '典韦', '123456', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', '13212341122', '13212341122@qq.com', '2023-04-16 14:04:01', NULL, NULL, '是', NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userId` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `schoolId` int NULL DEFAULT NULL,
  `userAccount` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `passWord` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userRole` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userHead` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userGender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `userPhone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `userMail` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `loginTime` datetime NULL DEFAULT NULL,
  `userExperience` int(10) UNSIGNED ZEROFILL NULL DEFAULT 0000000000,
  `createTime` datetime NULL DEFAULT NULL,
  `updateTime` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleteTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表(已经废弃)' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 1, 'root', 'root', 'root', '系统管理员', 'https://static.yirenyian.com/opoc/sysImg/avatar-girl.png', '女', '13016703849', '2970435886@qq.com', '2023-03-22 13:11:45', 0000000000, '2023-03-22 13:11:53', '2023-03-24 01:21:28', NULL);
INSERT INTO `user` VALUES (3, 2, '王坤', 'aaa', '123123', '系统管理员', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', '13401223695', '2970435886@qq.com', NULL, 0000000000, '2023-03-22 07:19:31', '2023-03-24 01:26:32', NULL);
INSERT INTO `user` VALUES (21, 2, 'xiaolu', '小鹿', '123123', '教师', 'https://static.yirenyian.com/opoc/sysImg/avatar-boy.png', '男', '17823612313', '3723423423@qq.com', NULL, 0000000000, '2023-03-24 05:03:51', '2023-04-07 00:43:12', '2023-04-07 00:43:12');

SET FOREIGN_KEY_CHECKS = 1;
