/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50739 (5.7.39-log)
 Source Host           : localhost:3306
 Source Schema         : jpetstore

 Target Server Type    : MySQL
 Target Server Version : 50739 (5.7.39-log)
 File Encoding         : 65001

 Date: 31/10/2022 11:20:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `itemID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (1, 'j2ee', 'EST-1', 1);
INSERT INTO `cart` VALUES (2, 'j2ee', 'EST-2', 1);

-- ----------------------------
-- Table structure for orderlist
-- ----------------------------
DROP TABLE IF EXISTS `orderlist`;
CREATE TABLE `orderlist`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `orderID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `orderTime` datetime NOT NULL,
  `payTime` datetime NOT NULL,
  `receiverName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phoneNumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `detailedAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `itemID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `productID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `stock` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `listPrice` decimal(10, 2) NOT NULL,
  `totalPrice` decimal(10, 2) NOT NULL,
  `payMethod` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderlist
-- ----------------------------

-- ----------------------------
-- Table structure for pet
-- ----------------------------
DROP TABLE IF EXISTS `pet`;
CREATE TABLE `pet`  (
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '一级分类',
  `productID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '品种id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '品种名，对应ProductID',
  `introduce` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '品种介绍，对应ProductID',
  `itemID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '宠物id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '宠物介绍，对应ItemID',
  `stock` int(11) NOT NULL COMMENT '库存',
  `listPrice` decimal(10, 2) NOT NULL COMMENT '价格',
  PRIMARY KEY (`itemID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pet
-- ----------------------------
INSERT INTO `pet` VALUES ('Fish', 'FI-SW-01', 'Angelfish', 'Salt Water fish from Australia', 'EST-1', 'Large Angelfish', 9998, 16.50);
INSERT INTO `pet` VALUES ('Dogs', '	K9-DL-01', 'Dalmation', 'Great dog for a Fire Station', 'EST-10', 'Spotted Adult Female Dalmation	', 9971, 18.50);
INSERT INTO `pet` VALUES ('Reptiles', 'RP-SN-01', 'Rattlesnake', '\r\nDoubles as a watch dog', 'EST-11', 'Venomless Rattlesnake', 9670, 18.50);
INSERT INTO `pet` VALUES ('Reptiles', 'RP-SN-01', 'Rattlesnake', 'Doubles as a watch dog', 'EST-12', 'Rattleless Rattlesnake', 9989, 18.50);
INSERT INTO `pet` VALUES ('Reptiles', 'RP-LI-02', 'Iguana', 'Friendly green friend', 'EST-13', 'Green Adult Iguana', 9906, 18.50);
INSERT INTO `pet` VALUES ('Cats', 'FL-DSH-01', 'Manx', 'Great for reducing mouse populations', 'EST-14', 'Tailless Manx', 8926, 58.50);
INSERT INTO `pet` VALUES ('Cats', 'FL-DSH-01', 'Manx', 'Great for reducing mouse populations', 'EST-15', 'With tail Manx', 9972, 23.50);
INSERT INTO `pet` VALUES ('Cats', 'FL-DLH-02', 'Persian', 'Friendly house cat, doubles as a princess', 'EST-16', 'Adult Female Persian', 9893, 93.50);
INSERT INTO `pet` VALUES ('Cats', 'FL-DLH-02', 'Persian', 'Friendly house cat, doubles as a princess', 'EST-17', 'Adult Male Persian', 9918, 93.50);
INSERT INTO `pet` VALUES ('Birds', 'AV-CB-01', 'Amazon Parrot', 'Great companion for up to 75 years', 'EST-18', 'Adult Male Amazon Parrot', 7921, 193.50);
INSERT INTO `pet` VALUES ('Birds', 'AV-SB-02', 'Finch', 'Great stress reliever', 'EST-19', 'Adult Male Finch', 9793, 15.50);
INSERT INTO `pet` VALUES ('Fish', 'FI-SW-01', 'Angelfish', 'Salt Water fish from Australia', 'EST-2', 'Small Angelfish', 9946, 16.50);
INSERT INTO `pet` VALUES ('Fish', 'FI-FW-02', 'Goldfish', 'Fresh Water fish from China', 'EST-20', 'Adult Male Goldfish', 7726, 5.50);
INSERT INTO `pet` VALUES ('Fish', 'FI-FW-02', 'Goldfish', 'Fresh Water fish from China', 'EST-21', 'Adult Female Goldfish', 9848, 5.29);
INSERT INTO `pet` VALUES ('Dogs', 'K9-RT-02', 'Labrador Retriever', 'Great hunting dog', 'EST-22', 'Adult Male Labrador Retriever', 9925, 135.50);
INSERT INTO `pet` VALUES ('Dogs', 'K9-RT-02', 'Labrador Retriever', 'Great hunting dog', 'EST-23', 'Adult Female Labrador Retriever', 9979, 145.49);
INSERT INTO `pet` VALUES ('Dogs', '	K9-RT-02', 'Labrador Retriever', 'Great hunting dog', 'EST-24', 'Adult Male Labrador Retriever', 9975, 255.50);
INSERT INTO `pet` VALUES ('Dogs', 'K9-RT-02', 'Labrador Retriever', 'Great hunting dog', 'EST-25', 'Adult Female Labrador Retriever', 9976, 325.29);
INSERT INTO `pet` VALUES ('Dogs', 'K9-CW-01', 'Chihuahua', 'Great companion dog', 'EST-26', 'Adult Male Chihuahua', 9978, 125.50);
INSERT INTO `pet` VALUES ('Dogs', 'K9-CW-01', 'Chihuahua', 'Great companion dog', 'EST-27', 'Adult Female Chihuahua', 9983, 155.29);
INSERT INTO `pet` VALUES ('Dogs', 'K9-RT-01', 'Golden Retriever', 'Great family dog', 'EST-28', 'Adult Female Golden Retriever', 6290, 155.29);
INSERT INTO `pet` VALUES ('Fish', 'FI-SW-02', 'Tiger Shark', 'Salt Water fish from Australia', 'EST-3', 'Toothless Tiger Shark', 9345, 18.50);
INSERT INTO `pet` VALUES ('Fish', 'FI-FW-01', 'Koi', 'Fresh Water fish from Japan', 'EST-4', 'Spotted Koi', 9720, 18.50);
INSERT INTO `pet` VALUES ('Fish', 'FI-FW-01', 'Koi', 'Fresh Water fish from Japan', 'EST-5', 'Spotless Koi	', 9965, 18.50);
INSERT INTO `pet` VALUES ('Dogs', 'K9-BD-01', 'Bulldog', 'Friendly dog from England', 'EST-6', 'Male Adult Bulldog', 8471, 18.50);
INSERT INTO `pet` VALUES ('Dogs', 'K9-BD-01', 'Bulldog', 'Friendly dog from England', 'EST-7', 'Female Puppy Bulldog', 9920, 18.50);
INSERT INTO `pet` VALUES ('Dogs', 'K9-PO-02', 'Poodle', 'Cute dog from France', 'EST-8', 'Male Puppy Poodle', 9668, 18.50);
INSERT INTO `pet` VALUES ('Dogs', 'K9-DL-01', 'Dalmation', 'Great dog for a Fire Station', 'EST-9', 'Spotless Male Puppy Dalmation', 9772, 18.50);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `receiverName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phoneNumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `detailedAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('j2ee', '111', '李四', 'abc@123.com', '15800000000', '中国', '湖南省', '长沙市', '天心区', '铁道学院');

SET FOREIGN_KEY_CHECKS = 1;
