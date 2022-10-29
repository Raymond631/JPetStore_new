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

 Date: 29/10/2022 00:05:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for pet
-- ----------------------------
DROP TABLE IF EXISTS `pet`;
CREATE TABLE `pet`  (
  `Category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '一级分类',
  `ProductID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '二级分类',
  `ItemID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '宠物id',
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '品种，对应ProductID',
  `Description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '简要描述，对应ItemID',
  `Introduce` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '详细文字介绍，对应ProductID',
  `Stock` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '库存',
  `ListPrice` decimal(10, 2) NOT NULL COMMENT '价格',
  PRIMARY KEY (`ItemID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pet
-- ----------------------------
INSERT INTO `pet` VALUES ('Fish', 'FI-SW-01', 'EST-1', 'Angelfish', 'Large Angelfish', 'Salt Water fish from Australia', '0', 16.50);
INSERT INTO `pet` VALUES ('Dogs', '	K9-DL-01', 'EST-10', 'Dalmation', 'Spotted Adult Female Dalmation	', 'Great dog for a Fire Station', '9971', 18.50);
INSERT INTO `pet` VALUES ('Reptiles', 'RP-SN-01', 'EST-11', 'Rattlesnake', 'Venomless Rattlesnake', '\r\nDoubles as a watch dog', '9670', 18.50);
INSERT INTO `pet` VALUES ('Reptiles', 'RP-SN-01', 'EST-12', 'Rattlesnake', 'Rattleless Rattlesnake', 'Doubles as a watch dog', '9989', 18.50);
INSERT INTO `pet` VALUES ('Reptiles', 'RP-LI-02', 'EST-13', 'Iguana', 'Green Adult Iguana', 'Friendly green friend', '9906', 18.50);
INSERT INTO `pet` VALUES ('Cats', 'FL-DSH-01', 'EST-14', 'Manx', 'Tailless Manx', 'Great for reducing mouse populations', '8926', 58.50);
INSERT INTO `pet` VALUES ('Cats', 'FL-DSH-01', 'EST-15', 'Manx', 'With tail Manx', 'Great for reducing mouse populations', '9972', 23.50);
INSERT INTO `pet` VALUES ('Cats', 'FL-DLH-02', 'EST-16', 'Persian', 'Adult Female Persian', 'Friendly house cat, doubles as a princess', '9893', 93.50);
INSERT INTO `pet` VALUES ('Cats', 'FL-DLH-02', 'EST-17', 'Persian', 'Adult Male Persian', 'Friendly house cat, doubles as a princess', '9918', 93.50);
INSERT INTO `pet` VALUES ('Birds', 'AV-CB-01', 'EST-18', 'Amazon Parrot', 'Adult Male Amazon Parrot', 'Great companion for up to 75 years', '7921', 193.50);
INSERT INTO `pet` VALUES ('Birds', 'AV-SB-02', 'EST-19', 'Finch', 'Adult Male Finch', 'Great stress reliever', '9793', 15.50);
INSERT INTO `pet` VALUES ('Fish', 'FI-SW-01', 'EST-2', 'Angelfish', 'Small Angelfish', 'Salt Water fish from Australia', '9947', 16.50);
INSERT INTO `pet` VALUES ('Fish', 'FI-FW-02', 'EST-20', 'Goldfish', 'Adult Male Goldfish', 'Fresh Water fish from China', '7726', 5.50);
INSERT INTO `pet` VALUES ('Fish', 'FI-FW-02', 'EST-21', 'Goldfish', 'Adult Female Goldfish', 'Fresh Water fish from China', '9848', 5.29);
INSERT INTO `pet` VALUES ('Dogs', 'K9-RT-02', 'EST-22', 'Labrador Retriever', 'Adult Male Labrador Retriever', 'Great hunting dog', '9925', 135.50);
INSERT INTO `pet` VALUES ('Dogs', 'K9-RT-02', 'EST-23', 'Labrador Retriever', 'Adult Female Labrador Retriever', 'Great hunting dog', '9979', 145.49);
INSERT INTO `pet` VALUES ('Dogs', '	K9-RT-02', 'EST-24', 'Labrador Retriever', 'Adult Male Labrador Retriever', 'Great hunting dog', '9975', 255.50);
INSERT INTO `pet` VALUES ('Dogs', 'K9-RT-02', 'EST-25', 'Labrador Retriever', 'Adult Female Labrador Retriever', 'Great hunting dog', '9976', 325.29);
INSERT INTO `pet` VALUES ('Dogs', 'K9-CW-01', 'EST-26', 'Chihuahua', 'Adult Male Chihuahua', 'Great companion dog', '9978', 125.50);
INSERT INTO `pet` VALUES ('Dogs', 'K9-CW-01', 'EST-27', 'Chihuahua', 'Adult Female Chihuahua', 'Great companion dog', '9983', 155.29);
INSERT INTO `pet` VALUES ('Dogs', 'K9-RT-01', 'EST-28', 'Golden Retriever', 'Adult Female Golden Retriever', 'Great family dog', '6290', 155.29);
INSERT INTO `pet` VALUES ('Fish', 'FI-SW-02', 'EST-3', 'Tiger Shark', 'Toothless Tiger Shark', 'Salt Water fish from Australia', '9345', 18.50);
INSERT INTO `pet` VALUES ('Fish', 'FI-FW-01', 'EST-4', 'Koi', 'Spotted Koi', 'Fresh Water fish from Japan', '9720', 18.50);
INSERT INTO `pet` VALUES ('Fish', 'FI-FW-01', 'EST-5', 'Koi', 'Spotless Koi	', 'Fresh Water fish from Japan', '9965', 18.50);
INSERT INTO `pet` VALUES ('Dogs', 'K9-BD-01', 'EST-6', 'Bulldog', 'Male Adult Bulldog', 'Friendly dog from England', '8471', 18.50);
INSERT INTO `pet` VALUES ('Dogs', 'K9-BD-01', 'EST-7', 'Bulldog', 'Female Puppy Bulldog', 'Friendly dog from England', '9920', 18.50);
INSERT INTO `pet` VALUES ('Dogs', 'K9-PO-02', 'EST-8', 'Poodle', 'Male Puppy Poodle', 'Cute dog from France', '9668', 18.50);
INSERT INTO `pet` VALUES ('Dogs', 'K9-DL-01', 'EST-9', 'Dalmation', 'Spotless Male Puppy Dalmation', 'Great dog for a Fire Station', '9772', 18.50);

SET FOREIGN_KEY_CHECKS = 1;
