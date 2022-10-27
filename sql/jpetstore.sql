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

 Date: 27/10/2022 10:13:50
*/

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`
(
    `id`          int(11) NOT NULL AUTO_INCREMENT,
    `user`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `ItemID`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `ProductID`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `Description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `InStock`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `Quantity`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `ListPrice`   decimal(10, 2)                                                NOT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart`
VALUES (1, 'j2ee', 'EST-1', 'FI-SW-01', 'Large Angelfish', 'FALSE', '10', 16.50);
INSERT INTO `cart`
VALUES (2, 'j2ee', 'EST-6', 'K9-BD-01', 'Male Adult Bulldog', 'TRUE', '10', 18.50);

-- ----------------------------
-- Table structure for orderlist
-- ----------------------------
DROP TABLE IF EXISTS `orderlist`;
CREATE TABLE `orderlist`
(
    `id`              int(11) NOT NULL AUTO_INCREMENT,
    `username`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `OrderID`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `OrderTime`       datetime                                                      NOT NULL,
    `PayTime`         datetime                                                      NOT NULL,
    `ReceiverName`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `PhoneNumber`     varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL,
    `Country`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `Province`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `City`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `District`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `DetailedAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `ItemID`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `ProductID`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `Description`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `InStock`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `Quantity`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `ListPrice`       decimal(10, 2)                                                NOT NULL,
    `TotalPrice`      decimal(10, 2)                                                NOT NULL,
    `PayMethod`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderlist
-- ----------------------------
INSERT INTO `orderlist`
VALUES (9, 'j2ee', '202210270001281000', '2022-10-27 00:01:26', '2022-10-27 00:01:28', '李四', '15800000000', '中国',
        '湖南省', '长沙市', '天心区', '铁道学院', 'EST-1', 'FI-SW-01', 'Large Angelfish', 'FALSE', '1', 16.50, 35.00,
        'Alipay');
INSERT INTO `orderlist`
VALUES (10, 'j2ee', '202210270001281000', '2022-10-27 00:01:26', '2022-10-27 00:01:28', '李四', '15800000000', '中国',
        '湖南省', '长沙市', '天心区', '铁道学院', 'EST-6', 'K9-BD-01', 'Male Adult Bulldog', 'TRUE', '1', 18.50, 35.00,
        'Alipay');
INSERT INTO `orderlist`
VALUES (11, 'j2ee', '202210270008451000', '2022-10-27 00:08:43', '2022-10-27 00:08:45', '李四', '15800000000', '中国',
        '湖南省', '长沙市', '天心区', '铁道学院', 'EST-1', 'FI-SW-01', 'Large Angelfish', 'FALSE', '1', 16.50, 35.00,
        'Alipay');
INSERT INTO `orderlist`
VALUES (12, 'j2ee', '202210270008451000', '2022-10-27 00:08:43', '2022-10-27 00:08:45', '李四', '15800000000', '中国',
        '湖南省', '长沙市', '天心区', '铁道学院', 'EST-6', 'K9-BD-01', 'Male Adult Bulldog', 'TRUE', '1', 18.50, 35.00,
        'Alipay');
INSERT INTO `orderlist`
VALUES (13, 'j2ee', '202210270010581000', '2022-10-27 00:10:53', '2022-10-27 00:10:58', '李四', '15800000000', '中国',
        '湖南省', '长沙市', '天心区', '铁道学院', 'EST-1', 'FI-SW-01', 'Large Angelfish', 'FALSE', '1', 16.50, 35.00,
        'WeChatPay');
INSERT INTO `orderlist`
VALUES (14, 'j2ee', '202210270010581000', '2022-10-27 00:10:53', '2022-10-27 00:10:58', '李四', '15800000000', '中国',
        '湖南省', '长沙市', '天心区', '铁道学院', 'EST-6', 'K9-BD-01', 'Male Adult Bulldog', 'TRUE', '1', 18.50, 35.00,
        'WeChatPay');
INSERT INTO `orderlist`
VALUES (15, 'j2ee', '202210270012341000', '2022-10-27 00:12:31', '2022-10-27 00:12:34', '李四', '15800000000', '中国',
        '湖南省', '长沙市', '天心区', '铁道学院', 'EST-1', 'FI-SW-01', 'Large Angelfish', 'FALSE', '1', 16.50, 35.00,
        'Alipay');
INSERT INTO `orderlist`
VALUES (16, 'j2ee', '202210270012341000', '2022-10-27 00:12:31', '2022-10-27 00:12:34', '李四', '15800000000', '中国',
        '湖南省', '长沙市', '天心区', '铁道学院', 'EST-6', 'K9-BD-01', 'Male Adult Bulldog', 'TRUE', '1', 18.50, 35.00,
        'Alipay');
INSERT INTO `orderlist`
VALUES (25, 'j2ee', '202210270020471001', '2022-10-27 00:20:42', '2022-10-27 00:20:47', '李四', '15800000000', '中国',
        '湖南省', '长沙市', '天心区', '铁道学院', 'EST-1', 'FI-SW-01', 'Large Angelfish', 'FALSE', '1', 16.50, 35.00,
        'Alipay');
INSERT INTO `orderlist`
VALUES (26, 'j2ee', '202210270020471001', '2022-10-27 00:20:42', '2022-10-27 00:20:47', '李四', '15800000000', '中国',
        '湖南省', '长沙市', '天心区', '铁道学院', 'EST-6', 'K9-BD-01', 'Male Adult Bulldog', 'TRUE', '1', 18.50, 35.00,
        'Alipay');
INSERT INTO `orderlist`
VALUES (29, 'j2ee', '202210270047061000', '2022-10-27 00:47:00', '2022-10-27 00:47:06', '李四', '15800000000', '中国',
        '湖南省', '长沙市', '天心区', '铁道学院', 'EST-1', 'FI-SW-01', 'Large Angelfish', 'FALSE', '10', 16.50, 350.00,
        'WeChatPay');
INSERT INTO `orderlist`
VALUES (30, 'j2ee', '202210270047061000', '2022-10-27 00:47:00', '2022-10-27 00:47:06', '李四', '15800000000', '中国',
        '湖南省', '长沙市', '天心区', '铁道学院', 'EST-6', 'K9-BD-01', 'Male Adult Bulldog', 'TRUE', '10', 18.50,
        350.00, 'WeChatPay');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`
(
    `username`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `password`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `ReceiverName`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `Email`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `PhoneNumber`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `Country`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `Province`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `City`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `District`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    `DetailedAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
    PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user`
VALUES ('j2ee', '111', '李四', 'abc@123.com', '15800000000', '中国', '湖南省', '长沙市', '天心区', '铁道学院');

SET
FOREIGN_KEY_CHECKS = 1;
