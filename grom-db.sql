/*
 Navicat Premium Data Transfer

 Source Server         : mysql-localhost
 Source Server Type    : MySQL
 Source Server Version : 100410
 Source Host           : localhost:3306
 Source Schema         : grom-db

 Target Server Type    : MySQL
 Target Server Version : 100410
 File Encoding         : 65001

 Date: 27/02/2020 17:55:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `cust_id` int(11) NOT NULL AUTO_INCREMENT,
  `email_txt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `alias_nm` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cust_nm` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `sts_cd` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note_txt` varchar(850) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state_cd` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cntry_nm` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `addr_txt` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city_nm` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `street_nm` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `street_nm_2` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zip_txt` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone_txt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subscr_ind` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N' COMMENT 'G- grom, I- indashpc',
  `last_upd_dt` date NOT NULL DEFAULT '0000-00-00',
  `last_upd_uid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cust_id`) USING BTREE,
  UNIQUE INDEX `email_txt`(`email_txt`) USING BTREE,
  INDEX `cust_nm`(`cust_nm`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, 'aaa@aaa.aa', NULL, 'Dumitrescu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', '0000-00-00', NULL);
INSERT INTO `customer` VALUES (2, 'bbb@bbb.bb', NULL, 'XXX', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', '0000-00-00', NULL);
INSERT INTO `customer` VALUES (3, 'ccc@ccc.cc', NULL, 'CCC', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', '0000-00-00', NULL);
INSERT INTO `customer` VALUES (4, 'ddd@ddd.dd', NULL, 'DDD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'N', '0000-00-00', NULL);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `prd_id` int(11) NOT NULL AUTO_INCREMENT,
  `prd_cat_id` int(11) NOT NULL DEFAULT 0 COMMENT '0- Accessories, 1- USB2P, 2- IPD3, 3- AUX, 4- MST3P, 5- AND2, 6- BT3, 7- GROM vehicle cables, 8- AUX1 adapters, 9- Main module only, 10- IPD4, 11- VL1/VLL, 12- VLine parts, 13- VL2',
  `prd_sku_cd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `prd_desc_txt` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `msrp_amt` float NOT NULL DEFAULT 0,
  `msrp_sale_amt` float NOT NULL DEFAULT 0,
  `actv_ind` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N' COMMENT 'Whether product is active',
  `bck_ordr_dt` date NULL DEFAULT NULL,
  `last_upd_dt` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  `last_upd_uid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`prd_id`) USING BTREE,
  UNIQUE INDEX `prd_sku_cd`(`prd_sku_cd`) USING BTREE,
  INDEX `prd_cat_id`(`prd_cat_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 738 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 1, '201', 'USB 2.0 3p', 0, 0, 'N', NULL, '2020-02-27 10:38:43', '');
INSERT INTO `product` VALUES (2, 2, '202', 'Dell E6090', 0, 0, 'N', NULL, '2020-02-26 10:39:08', '');
INSERT INTO `product` VALUES (3, 3, '203', 'VL2', 0, 0, 'N', NULL, '2020-02-20 10:39:38', '');

-- ----------------------------
-- Table structure for purchase
-- ----------------------------
DROP TABLE IF EXISTS `purchase`;
CREATE TABLE `purchase`  (
  `prch_id` int(11) NOT NULL AUTO_INCREMENT,
  `prch_ordr_cd` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `list_item_id` int(11) NULL DEFAULT 0,
  `invc_id` int(11) NOT NULL DEFAULT 0,
  `rcvd_amt` float NULL DEFAULT NULL,
  `shpmn_amt` float NOT NULL DEFAULT 0,
  `dscnt_amt` float NOT NULL DEFAULT 0 COMMENT 'Discount applied to the purchase',
  `tax_amt` float NOT NULL DEFAULT 0 COMMENT 'The whole purchase tax',
  `handling_amt` float NOT NULL DEFAULT 0,
  `cust_id` int(11) NOT NULL DEFAULT 0,
  `prch_dt` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pmt_dt` datetime(0) NULL DEFAULT NULL,
  `shpmn_type_cd` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'R' COMMENT 'Shipment type: R- domestic regular, E- express',
  `cmnt_txt` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `sts_cd` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'R' COMMENT 'R- regular, D- dealer',
  `trns_txt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '&lt;undefined&gt;',
  `trns_cd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT 'Internal transaction ID for payment system',
  `prch_sts_cd` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'P' COMMENT 'P- purchased, R- refunded, O- ordered',
  `refr_cd` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Purcjase referrer (a- adwords, g- shopping, c- criteo)',
  `last_upd_dt` datetime(0) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_upd_uid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`prch_id`) USING BTREE,
  UNIQUE INDEX `cust_purchase`(`cust_id`, `prch_dt`) USING BTREE,
  INDEX `cust_id`(`cust_id`) USING BTREE,
  INDEX `invc_id`(`invc_id`) USING BTREE,
  INDEX `trns_cd`(`trns_cd`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of purchase
-- ----------------------------
INSERT INTO `purchase` VALUES (1, NULL, 0, 11, NULL, 0, 0, 0, 0, 1, '2020-02-01 10:41:01', NULL, 'R', 'Well good 1', 'R', '&lt;undefined&gt;', '0', 'P', NULL, '0000-00-00 00:00:00', '');
INSERT INTO `purchase` VALUES (2, NULL, 0, 12, NULL, 0, 0, 0, 0, 2, '2020-02-02 10:41:27', NULL, 'R', 'Well good 2', 'R', '&lt;undefined&gt;', '0', 'P', NULL, '0000-00-00 00:00:00', '');
INSERT INTO `purchase` VALUES (3, NULL, 0, 13, NULL, 0, 0, 0, 0, 3, '2020-02-03 10:42:14', NULL, 'R', 'Well good 3', 'R', '&lt;undefined&gt;', '0', 'P', NULL, '0000-00-00 00:00:00', '');
INSERT INTO `purchase` VALUES (4, NULL, 0, 14, NULL, 0, 0, 0, 0, 4, '2020-02-04 12:09:09', NULL, 'R', 'I\'m DDD...', 'R', '&lt;undefined&gt;', '0', 'P', NULL, '0000-00-00 00:00:00', '');

-- ----------------------------
-- Table structure for purchase_detail
-- ----------------------------
DROP TABLE IF EXISTS `purchase_detail`;
CREATE TABLE `purchase_detail`  (
  `prch_id` int(11) NOT NULL,
  `prd_id` int(11) NOT NULL,
  `prch_amt` float NOT NULL,
  `curr_cd` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'USD',
  `qty_nbr` int(11) NOT NULL,
  `last_upd_dt` date NOT NULL,
  `last_upd_uid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`prch_id`, `prd_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of purchase_detail
-- ----------------------------
INSERT INTO `purchase_detail` VALUES (11, 1, 500, 'USD', 0, '0000-00-00', '');
INSERT INTO `purchase_detail` VALUES (12, 2, 1000, 'USD', 0, '0000-00-00', '');
INSERT INTO `purchase_detail` VALUES (13, 3, 1500, 'USD', 0, '0000-00-00', '');
INSERT INTO `purchase_detail` VALUES (14, 4, 2000, 'USD', 0, '0000-00-00', '');

-- ----------------------------
-- Table structure for rating
-- ----------------------------
DROP TABLE IF EXISTS `rating`;
CREATE TABLE `rating`  (
  `rtng_id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_id` int(11) NOT NULL,
  `prch_id` int(11) NOT NULL,
  `prd_id` int(11) NOT NULL,
  `rtng_val1_ind` int(11) NULL DEFAULT NULL,
  `rtng_val2_ind` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rtng_val3_ind` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `msg_txt` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ip_addr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `post_dt` datetime(0) NULL DEFAULT NULL,
  `show_ind` enum('Y','N') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `top_list_ind` enum('Y','N') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`rtng_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 72 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rating
-- ----------------------------
INSERT INTO `rating` VALUES (1, 1, 1, 1, 5, '0', '0', 'Review message. 1', NULL, '2020-02-27 10:32:19', 'Y', 'Y');
INSERT INTO `rating` VALUES (2, 2, 2, 2, 4, '0', '0', 'Review message. 2\r\n', NULL, '2020-02-26 10:33:17', 'Y', 'N');
INSERT INTO `rating` VALUES (3, 3, 3, 3, 5, '0', '0', 'Review message. 3', NULL, '2020-02-25 10:34:13', 'Y', 'N');
INSERT INTO `rating` VALUES (71, 4, 4, 0, 2, NULL, NULL, 'Review message. 4', NULL, '2020-02-27 13:29:27', 'N', 'N');

SET FOREIGN_KEY_CHECKS = 1;
