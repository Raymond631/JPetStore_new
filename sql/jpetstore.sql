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

 Date: 30/12/2022 20:35:20
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
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (30, 'TEST', 'EST-25', 1);
INSERT INTO `cart` VALUES (67, '1', 'EST-1', 2);

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item`  (
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `productID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `itemID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `stock` int(11) NOT NULL,
  `listPrice` decimal(10, 2) NOT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'url',
  PRIMARY KEY (`itemID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES ('Fish', 'FI-SW-01', 'EST-1', 'Large Angelfish', 12, 16.50, 'http://img.ixiupet.com/uploads/allimg/150423/3-1504230946360-L.jpg');
INSERT INTO `item` VALUES ('Dogs', 'K9-DL-01', 'EST-10', 'Spotted Adult Female Dalmation', 20, 18.50, 'http://img.ixiupet.com/uploads/150413/3-150413105534b0.jpg');
INSERT INTO `item` VALUES ('Reptiles', 'RP-SN-01', 'EST-11', 'Venomless Rattlesnake', 6, 18.50, 'http://img.ixiupet.com/uploads/allimg/150519/3-15051Z930560-L.jpg');
INSERT INTO `item` VALUES ('Reptiles', 'RP-SN-01', 'EST-12', 'Rattleless Rattlesnake', 20, 18.50, 'http://img.ixiupet.com/uploads/allimg/150519/3-15051Z930560-L.jpg');
INSERT INTO `item` VALUES ('Reptiles', 'RP-LI-02', 'EST-13', 'Green Adult Iguana', 18, 18.50, 'http://img.ixiupet.com/uploads/allimg/150420/3-1504201405240-L.jpg');
INSERT INTO `item` VALUES ('Cats', 'FL-DSH-01', 'EST-14', 'Tailless Manx', 14, 58.50, 'http://img.ixiupet.com/uploads/150410/3-15041014351HZ.jpg');
INSERT INTO `item` VALUES ('Cats', 'FL-DSH-01', 'EST-15', 'With tail Manx', 20, 23.50, 'http://img.ixiupet.com/uploads/150410/3-15041014351HZ.jpg');
INSERT INTO `item` VALUES ('Cats', 'FL-DLH-02', 'EST-16', 'Adult Female Persian', 16, 93.50, 'http://img.ixiupet.com/uploads/150309/2-15030920514b57.jpg');
INSERT INTO `item` VALUES ('Cats', 'FL-DLH-02', 'EST-17', 'Adult Male Persian', 13, 93.50, 'http://img.ixiupet.com/uploads/150309/2-15030920514b57.jpg');
INSERT INTO `item` VALUES ('Birds', 'AV-CB-01', 'EST-18', 'Adult Male Amazon Parrot', 18, 193.50, 'http://img.ixiupet.com/uploads/allimg/150521/3-1505210941520-L.jpg');
INSERT INTO `item` VALUES ('Birds', 'AV-SB-02', 'EST-19', 'Adult Male Finch', 20, 15.50, 'http://img.ixiupet.com/uploads/150305/2-150305163023627.jpg');
INSERT INTO `item` VALUES ('Fish', 'FI-SW-01', 'EST-2', 'Small Angelfish', 20, 16.50, 'http://img.ixiupet.com/uploads/allimg/150423/3-1504230946360-L.jpg');
INSERT INTO `item` VALUES ('Fish', 'FI-FW-02', 'EST-20', 'Adult Male Goldfish', 15, 5.50, 'http://img.ixiupet.com/uploads/150305/2-1503051622519B.jpg');
INSERT INTO `item` VALUES ('Fish', 'FI-FW-02', 'EST-21', 'Adult Female Goldfish', 16, 5.50, 'http://img.ixiupet.com/uploads/150305/2-1503051622519B.jpg');
INSERT INTO `item` VALUES ('Dogs', 'K9-RT-02', 'EST-22', 'Adult Male Labrador Retriever', 20, 135.50, 'http://img.ixiupet.com/uploads/allimg/150525/3-1505250931020-L.jpg');
INSERT INTO `item` VALUES ('Dogs', 'K9-RT-02', 'EST-23', 'Adult Female Labrador Retriever', 30, 145.50, 'http://img.ixiupet.com/uploads/allimg/150525/3-1505250931020-L.jpg');
INSERT INTO `item` VALUES ('Dogs', 'K9-RT-02', 'EST-24', 'Adult Male Labrador Retriever', 20, 255.50, 'http://img.ixiupet.com/uploads/allimg/150525/3-1505250931020-L.jpg');
INSERT INTO `item` VALUES ('Dogs', 'K9-RT-02', 'EST-25', 'Adult Female Labrador Retriever', 20, 325.29, 'http://img.ixiupet.com/uploads/allimg/150525/3-1505250931020-L.jpg');
INSERT INTO `item` VALUES ('Dogs', 'K9-CW-01', 'EST-26', 'Adult Male Chihuahua', 20, 125.50, 'http://img.ixiupet.com/uploads/allimg/150617/3-15061G055460-L.jpg');
INSERT INTO `item` VALUES ('Dogs', 'K9-CW-01', 'EST-27', 'Adult Female Chihuahua', 7, 155.50, 'http://img.ixiupet.com/uploads/allimg/150617/3-15061G055460-L.jpg');
INSERT INTO `item` VALUES ('Dogs', 'K9-RT-01', 'EST-28', 'Adult Female Golden Retriever', 20, 155.50, 'http://img.ixiupet.com/uploads/allimg/150520/3-1505201145220-L.jpg');
INSERT INTO `item` VALUES ('Fish', 'FI-SW-02', 'EST-3', 'Toothless Tiger Shark', 17, 18.50, 'http://img.ixiupet.com/uploads/allimg/150525/3-1505251130140-L.jpg');
INSERT INTO `item` VALUES ('Fish', 'FI-FW-01', 'EST-4', 'Spotted Koi', 20, 18.50, 'http://img.ixiupet.com/uploads/allimg/150417/3-15041G459570-L.jpg');
INSERT INTO `item` VALUES ('Fish', 'FI-FW-01', 'EST-5', 'Spotless Koi', 20, 18.50, 'http://img.ixiupet.com/uploads/allimg/150417/3-15041G459570-L.jpg');
INSERT INTO `item` VALUES ('Dogs', 'K9-BD-01', 'EST-6', 'Male Adult Bulldog', 15, 18.50, 'http://img.ixiupet.com/uploads/150403/2-150403152450K3.jpg');
INSERT INTO `item` VALUES ('Dogs', 'K9-BD-01', 'EST-7', 'Female Puppy Bulldog', 19, 18.50, 'http://img.ixiupet.com/uploads/150403/2-150403152450K3.jpg');
INSERT INTO `item` VALUES ('Dogs', 'K9-PO-02', 'EST-8', 'Male Puppy Poodle', 20, 18.50, 'http://img.ixiupet.com/uploads/150410/2-150410144413b3.jpg');
INSERT INTO `item` VALUES ('Dogs', 'K9-DL-01', 'EST-9', 'Spotless Male Puppy Dalmation', 20, 18.50, 'http://img.ixiupet.com/uploads/150413/3-150413105534b0.jpg');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `itemID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `stock` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `listPrice` decimal(10, 2) NOT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES (36, '202212292309491001', 'EST-28', '（EST-28）Adult Female Golden Retriever', 6290, 8, 155.50, 'http://img.ixiupet.com/uploads/allimg/150520/3-1505201145220-L.jpg');
INSERT INTO `orderitem` VALUES (37, '202212292309491001', 'EST-19', '（EST-19）Adult Male Finch', 9783, 3, 15.50, 'http://img.ixiupet.com/uploads/150305/2-150305163023627.jpg');
INSERT INTO `orderitem` VALUES (40, '202212301005461000', 'EST-16', '（EST-16）Adult Female Persian', 9891, 1, 93.50, 'http://img.ixiupet.com/uploads/150309/2-15030920514b57.jpg');
INSERT INTO `orderitem` VALUES (41, '202212301005461000', 'EST-6', '（EST-6）Male Adult Bulldog', 8471, 2, 18.50, 'http://img.ixiupet.com/uploads/150403/2-150403152450K3.jpg');
INSERT INTO `orderitem` VALUES (42, '202212301006401001', 'EST-16', '（EST-16）Adult Female Persian', 9891, 1, 93.50, 'http://img.ixiupet.com/uploads/150309/2-15030920514b57.jpg');
INSERT INTO `orderitem` VALUES (43, '202212301006401001', 'EST-6', '（EST-6）Male Adult Bulldog', 8471, 2, 18.50, 'http://img.ixiupet.com/uploads/150403/2-150403152450K3.jpg');
INSERT INTO `orderitem` VALUES (44, '202212301008241002', 'EST-16', '（EST-16）Adult Female Persian', 9891, 1, 93.50, 'http://img.ixiupet.com/uploads/150309/2-15030920514b57.jpg');
INSERT INTO `orderitem` VALUES (45, '202212301008241002', 'EST-6', '（EST-6）Male Adult Bulldog', 8471, 2, 18.50, 'http://img.ixiupet.com/uploads/150403/2-150403152450K3.jpg');
INSERT INTO `orderitem` VALUES (46, '202212301008381003', 'EST-26', '（EST-26）Adult Male Chihuahua', 9978, 3, 125.50, 'http://img.ixiupet.com/uploads/allimg/150617/3-15061G055460-L.jpg');
INSERT INTO `orderitem` VALUES (47, '202212301008541004', 'EST-19', '（EST-19）Adult Male Finch', 9780, 3, 15.50, 'http://img.ixiupet.com/uploads/150305/2-150305163023627.jpg');
INSERT INTO `orderitem` VALUES (48, '202212301313381000', 'EST-6', '（EST-6）Male Adult Bulldog', 20, 3, 18.50, 'http://img.ixiupet.com/uploads/150403/2-150403152450K3.jpg');
INSERT INTO `orderitem` VALUES (49, '202212301318321000', 'EST-14', '（EST-14）Tailless Manx', 20, 2, 58.50, 'http://img.ixiupet.com/uploads/150410/3-15041014351HZ.jpg');
INSERT INTO `orderitem` VALUES (50, '202212301318321000', 'EST-20', '（EST-20）Adult Male Goldfish', 20, 5, 5.50, 'http://img.ixiupet.com/uploads/150305/2-1503051622519B.jpg');
INSERT INTO `orderitem` VALUES (51, '202212301335231000', 'EST-1', '（EST-1）Large Angelfish', 15, 3, 16.50, 'http://img.ixiupet.com/uploads/allimg/150423/3-1504230946360-L.jpg');
INSERT INTO `orderitem` VALUES (52, '202212301335231000', 'EST-11', '（EST-11）Venomless Rattlesnake', 9, 3, 18.50, 'http://img.ixiupet.com/uploads/allimg/150519/3-15051Z930560-L.jpg');
INSERT INTO `orderitem` VALUES (53, '202212301335381001', 'EST-3', '（EST-3）Toothless Tiger Shark', 20, 3, 18.50, 'http://img.ixiupet.com/uploads/allimg/150525/3-1505251130140-L.jpg');
INSERT INTO `orderitem` VALUES (54, '202212301335551002', 'EST-13', '（EST-13）Green Adult Iguana', 20, 2, 18.50, 'http://img.ixiupet.com/uploads/allimg/150420/3-1504201405240-L.jpg');
INSERT INTO `orderitem` VALUES (55, '202212301528281000', 'EST-17', '（EST-17）Adult Male Persian', 20, 2, 93.50, 'http://img.ixiupet.com/uploads/150309/2-15030920514b57.jpg');
INSERT INTO `orderitem` VALUES (56, '202212301529361001', 'EST-14', '（EST-14）Tailless Manx', 18, 4, 58.50, 'http://img.ixiupet.com/uploads/150410/3-15041014351HZ.jpg');
INSERT INTO `orderitem` VALUES (57, '202212301529361001', 'EST-7', '（EST-7）Female Puppy Bulldog', 20, 1, 18.50, 'http://img.ixiupet.com/uploads/150403/2-150403152450K3.jpg');
INSERT INTO `orderitem` VALUES (58, '202212301530491002', 'EST-16', '（EST-16）Adult Female Persian', 20, 1, 93.50, 'http://img.ixiupet.com/uploads/150309/2-15030920514b57.jpg');
INSERT INTO `orderitem` VALUES (59, '202212301537191000', 'EST-6', '（EST-6）Male Adult Bulldog', 17, 1, 18.50, 'http://img.ixiupet.com/uploads/150403/2-150403152450K3.jpg');
INSERT INTO `orderitem` VALUES (60, '202212301646551001', 'EST-16', '（EST-16）Adult Female Persian', 19, 1, 93.50, 'http://img.ixiupet.com/uploads/150309/2-15030920514b57.jpg');
INSERT INTO `orderitem` VALUES (61, '202212301646551001', 'EST-17', '（EST-17）Adult Male Persian', 18, 2, 93.50, 'http://img.ixiupet.com/uploads/150309/2-15030920514b57.jpg');
INSERT INTO `orderitem` VALUES (62, '202212301646551001', 'EST-18', '（EST-18）Adult Male Amazon Parrot', 20, 2, 193.50, 'http://img.ixiupet.com/uploads/allimg/150521/3-1505210941520-L.jpg');
INSERT INTO `orderitem` VALUES (63, '202212301646551001', 'EST-21', '（EST-21）Adult Female Goldfish', 20, 4, 5.50, 'http://img.ixiupet.com/uploads/150305/2-1503051622519B.jpg');
INSERT INTO `orderitem` VALUES (64, '202212301647151002', 'EST-17', '（EST-17）Adult Male Persian', 16, 3, 93.50, 'http://img.ixiupet.com/uploads/150309/2-15030920514b57.jpg');
INSERT INTO `orderitem` VALUES (65, '202212301649381003', 'EST-16', '（EST-16）Adult Female Persian', 18, 1, 93.50, 'http://img.ixiupet.com/uploads/150309/2-15030920514b57.jpg');
INSERT INTO `orderitem` VALUES (66, '202212301652311000', 'EST-16', '（EST-16）Adult Female Persian', 17, 1, 93.50, 'http://img.ixiupet.com/uploads/150309/2-15030920514b57.jpg');
INSERT INTO `orderitem` VALUES (67, '202212301654041000', 'EST-6', '（EST-6）Male Adult Bulldog', 16, 1, 18.50, 'http://img.ixiupet.com/uploads/150403/2-150403152450K3.jpg');

-- ----------------------------
-- Table structure for orderlist
-- ----------------------------
DROP TABLE IF EXISTS `orderlist`;
CREATE TABLE `orderlist`  (
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `orderID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '注意: order是mysql关键字，不可用作表名',
  `orderTime` datetime NOT NULL,
  `receiverName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phoneNumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `totalPrice` decimal(10, 2) NOT NULL,
  `payMethod` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`orderID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderlist
-- ----------------------------
INSERT INTO `orderlist` VALUES ('1', '202212301530491002', '2022-12-30 15:30:49', '李四3', '00000000000', '中南大学铁道学院', 93.50, '微信支付');
INSERT INTO `orderlist` VALUES ('123', '202212301537191000', '2022-12-30 15:37:19', '李四3', '2', '3', 18.50, '微信支付');
INSERT INTO `orderlist` VALUES ('1', '202212301646551001', '2022-12-30 16:46:55', '李四33', '00000000000', '中南大学铁道学院', 2424.50, '支付宝');
INSERT INTO `orderlist` VALUES ('1', '202212301647151002', '2022-12-30 16:47:15', '李四33', '00000000000', '中南大学铁道学院', 280.50, '微信支付');
INSERT INTO `orderlist` VALUES ('1', '202212301649381003', '2022-12-30 16:49:38', '李四33', '00000000000', '中南大学铁道学院', 93.50, '微信支付');
INSERT INTO `orderlist` VALUES ('1', '202212301652311000', '2022-12-30 16:52:31', '李四33', '00000000000', '中南大学铁道学院', 93.50, '微信支付');
INSERT INTO `orderlist` VALUES ('1', '202212301654041000', '2022-12-30 16:54:04', '李四33', '00000000000', '中南大学铁道学院', 18.50, '微信支付');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `productID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `introduce` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`productID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('Birds', 'AV-CB-01', 'AmazonParrot', 'Great companion for up to 75 years', 'http://img.ixiupet.com/uploads/allimg/150521/3-1505210941520-L.jpg', 193.50);
INSERT INTO `product` VALUES ('Birds', 'AV-SB-02', 'Finch', 'Great stress reliever', 'http://img.ixiupet.com/uploads/150305/2-150305163023627.jpg', 15.50);
INSERT INTO `product` VALUES ('Fish', 'FI-FW-01', 'Koi', 'Fresh Water fish from Japan', 'http://img.ixiupet.com/uploads/allimg/150417/3-15041G459570-L.jpg', 18.50);
INSERT INTO `product` VALUES ('Fish', 'FI-FW-02', 'Goldfish', 'Fresh Water fish from China', 'http://img.ixiupet.com/uploads/150305/2-1503051622519B.jpg', 5.50);
INSERT INTO `product` VALUES ('Fish', 'FI-SW-01', 'Angelfish', 'Salt Water fish from Australia', 'http://img.ixiupet.com/uploads/allimg/150423/3-1504230946360-L.jpg', 16.50);
INSERT INTO `product` VALUES ('Fish', 'FI-SW-02', 'TigerShark', 'Salt Water fish from Australia', 'http://img.ixiupet.com/uploads/allimg/150525/3-1505251130140-L.jpg', 18.50);
INSERT INTO `product` VALUES ('Cats', 'FL-DLH-02', 'Persian', 'Friendly house cat, doubles as a princess', 'http://img.ixiupet.com/uploads/150309/2-15030920514b57.jpg', 93.50);
INSERT INTO `product` VALUES ('Cats', 'FL-DSH-01', 'Manx', 'Great for reducing mouse populations', 'http://img.ixiupet.com/uploads/150410/3-15041014351HZ.jpg', 23.50);
INSERT INTO `product` VALUES ('Dogs', 'K9-BD-01', 'Bulldog', 'Friendly dog from England', 'http://img.ixiupet.com/uploads/150403/2-150403152450K3.jpg', 18.50);
INSERT INTO `product` VALUES ('Dogs', 'K9-CW-01', 'Chihuahua', 'Great companion dog', 'http://img.ixiupet.com/uploads/allimg/150617/3-15061G055460-L.jpg', 125.50);
INSERT INTO `product` VALUES ('Dogs', 'K9-DL-01', 'Dalmation', 'Great dog for a Fire Station', 'http://img.ixiupet.com/uploads/150413/3-150413105534b0.jpg', 18.50);
INSERT INTO `product` VALUES ('Dogs', 'K9-PO-02', 'Poodle', 'Cute dog from France', 'http://img.ixiupet.com/uploads/150410/2-150410144413b3.jpg', 18.50);
INSERT INTO `product` VALUES ('Dogs', 'K9-RT-01', 'GoldenRetriever', 'Great family dog', 'http://img.ixiupet.com/uploads/allimg/150520/3-1505201145220-L.jpg', 155.50);
INSERT INTO `product` VALUES ('Dogs', 'K9-RT-02', 'LabradorRetriever', 'Great hunting dog', 'http://img.ixiupet.com/uploads/allimg/150525/3-1505250931020-L.jpg', 135.50);
INSERT INTO `product` VALUES ('Reptiles', 'RP-LI-02', 'Iguana', 'Friendly green friend', 'http://img.ixiupet.com/uploads/allimg/150420/3-1504201405240-L.jpg', 18.50);
INSERT INTO `product` VALUES ('Reptiles', 'RP-SN-01', 'Rattlesnake', 'Doubles as a watch dog', 'http://img.ixiupet.com/uploads/allimg/150519/3-15051Z930560-L.jpg', 18.50);

-- ----------------------------
-- Table structure for profile
-- ----------------------------
DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile`  (
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `languagePreference` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `favouriteCategory` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `enableMyList` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'true or false',
  `enableMyBanner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'true or false',
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of profile
-- ----------------------------
INSERT INTO `profile` VALUES ('1', 'English', 'null', 'null', 'null');
INSERT INTO `profile` VALUES ('123456789', 'English', 'Dogs', 'true', 'true');
INSERT INTO `profile` VALUES ('BF', 'English', 'Dogs', 'true', 'true');
INSERT INTO `profile` VALUES ('ER', 'English', 'Dogs', 'true', 'true');
INSERT INTO `profile` VALUES ('hhh', 'English', 'Dogs', 'true', 'true');
INSERT INTO `profile` VALUES ('hrit', 'English', 'Dogs', 'true', 'true');
INSERT INTO `profile` VALUES ('PR', 'English', 'Dogs', 'true', 'true');
INSERT INTO `profile` VALUES ('TEST', 'English', 'null', 'null', 'null');
INSERT INTO `profile` VALUES ('xyz', 'English', 'Dogs', 'true', 'true');

-- ----------------------------
-- Table structure for receiver
-- ----------------------------
DROP TABLE IF EXISTS `receiver`;
CREATE TABLE `receiver`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `receiverName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phoneNumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of receiver
-- ----------------------------
INSERT INTO `receiver` VALUES (2, '123456789', '', '', '');
INSERT INTO `receiver` VALUES (3, 'BF', 'ASF', 'AFDSA', 'ADF');
INSERT INTO `receiver` VALUES (4, 'ER', '', '', '');
INSERT INTO `receiver` VALUES (5, 'hhh', '李四', '15812341234', '中南大学铁道学院');
INSERT INTO `receiver` VALUES (6, 'PR', '李四', '15812341234', '中南大学铁道学院');
INSERT INTO `receiver` VALUES (7, 'TEST', '李四', '15812341234', '中南大学铁道学院');
INSERT INTO `receiver` VALUES (8, 'xyz', '', '', '');
INSERT INTO `receiver` VALUES (54, '123', '李四3', '2', '3');
INSERT INTO `receiver` VALUES (57, '1', '李四33', '00000000000', '中南大学铁道学院');
INSERT INTO `receiver` VALUES (58, '1', 'zhangsan22', '45678977974', 'asfjklasd3');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1');
INSERT INTO `user` VALUES ('123', '123');
INSERT INTO `user` VALUES ('123456789', '123');
INSERT INTO `user` VALUES ('BF', '456');
INSERT INTO `user` VALUES ('ER', '123');
INSERT INTO `user` VALUES ('hhh', '456');
INSERT INTO `user` VALUES ('hrit', '123');
INSERT INTO `user` VALUES ('PR', '123');
INSERT INTO `user` VALUES ('root', '000');
INSERT INTO `user` VALUES ('TEST', '456');
INSERT INTO `user` VALUES ('xyz', '123');

-- ----------------------------
-- Table structure for userlogs
-- ----------------------------
DROP TABLE IF EXISTS `userlogs`;
CREATE TABLE `userlogs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `time` datetime NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sqlType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Create、Delete、Update、Read、Other',
  `operationContent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'true，false',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1978 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userlogs
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
