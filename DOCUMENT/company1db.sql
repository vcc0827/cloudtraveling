/*
 Navicat Premium Data Transfer

 Source Server         : CT
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : company1db

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 19/09/2018 14:21:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `commentId` int(100) NOT NULL COMMENT '评论编号',
  `commentName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论者ID',
  `commentContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `commentTime` datetime(0) NULL DEFAULT NULL COMMENT '评论时间',
  `commentLimit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论权限',
  PRIMARY KEY (`commentId`) USING BTREE,
  CONSTRAINT `comName` FOREIGN KEY (`commentId`) REFERENCES `user` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pic
-- ----------------------------
DROP TABLE IF EXISTS `pic`;
CREATE TABLE `pic`  (
  `picId` int(255) NOT NULL COMMENT '图片编号',
  `travelPic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '游记图片',
  `userPic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户图片',
  `placePic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '景点图片',
  PRIMARY KEY (`picId`) USING BTREE,
  INDEX `picId`(`picId`) USING BTREE,
  INDEX `picId_2`(`picId`) USING BTREE,
  INDEX `picId_3`(`picId`) USING BTREE,
  INDEX `picId_4`(`picId`) USING BTREE,
  INDEX `placePic`(`placePic`) USING BTREE,
  INDEX `travelPic`(`travelPic`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pic
-- ----------------------------
INSERT INTO `pic` VALUES (1, '1', NULL, NULL);
INSERT INTO `pic` VALUES (2, '1', NULL, NULL);
INSERT INTO `pic` VALUES (3, '1', NULL, NULL);

-- ----------------------------
-- Table structure for place
-- ----------------------------
DROP TABLE IF EXISTS `place`;
CREATE TABLE `place`  (
  `placeId` int(255) NOT NULL COMMENT '景点编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '景区名称',
  `subTxt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '简要说明',
  `Price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '门票',
  `Address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
  `Mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `ifIndex` bit(1) NULL DEFAULT NULL COMMENT '是否首页推荐',
  `placePic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`placeId`) USING BTREE,
  INDEX `placeId`(`placeId`) USING BTREE,
  INDEX `placeId_2`(`placeId`) USING BTREE,
  INDEX `plapic`(`placePic`) USING BTREE,
  INDEX `placeId_3`(`placeId`) USING BTREE,
  INDEX `placeId_4`(`placeId`) USING BTREE,
  CONSTRAINT `plapic` FOREIGN KEY (`placePic`) REFERENCES `pic` (`placepic`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for travel
-- ----------------------------
DROP TABLE IF EXISTS `travel`;
CREATE TABLE `travel`  (
  `travelId` int(20) NOT NULL AUTO_INCREMENT COMMENT '游记编号',
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '游记状态',
  `travelName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '游记名字',
  `authorId` int(255) NULL DEFAULT NULL COMMENT '作者编号',
  `placeId` int(255) NULL DEFAULT NULL COMMENT '景点编号',
  `travelContent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '游记正文',
  `travelPic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '游记图片',
  `likeAccount` int(255) NULL DEFAULT NULL COMMENT '点赞数量',
  `collectionAccount` int(255) NULL DEFAULT NULL COMMENT '收藏数量',
  `browseAccount` int(255) NULL DEFAULT NULL COMMENT '浏览次数',
  `comment` int(20) NULL DEFAULT NULL COMMENT '游记评论',
  PRIMARY KEY (`travelId`) USING BTREE,
  INDEX `picId`(`travelPic`) USING BTREE,
  INDEX `authId`(`authorId`) USING BTREE,
  INDEX `placeId`(`placeId`) USING BTREE,
  INDEX `commeId`(`comment`) USING BTREE,
  CONSTRAINT `placeId` FOREIGN KEY (`placeId`) REFERENCES `place` (`placeid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `authId` FOREIGN KEY (`authorId`) REFERENCES `user` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `commeId` FOREIGN KEY (`comment`) REFERENCES `comment` (`commentid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `picId` FOREIGN KEY (`travelPic`) REFERENCES `pic` (`travelpic`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userId` int(255) NOT NULL COMMENT '用户编号',
  `userName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户密码',
  `realName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `identityId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '身份证号',
  `birthday` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生日',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱号',
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
  `profile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户头像',
  `permissions` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户权限',
  `focus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关注',
  `collection` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收藏',
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评论',
  `Reply` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '回复',
  PRIMARY KEY (`userId`) USING BTREE,
  INDEX `userId`(`userId`, `userName`) USING BTREE,
  INDEX `userName`(`userName`) USING BTREE,
  INDEX `userId_2`(`userId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
