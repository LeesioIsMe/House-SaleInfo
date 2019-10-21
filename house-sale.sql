/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 80011
Source Host           : localhost:3306
Source Database       : house-sale

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2019-05-12 02:25:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cities
-- ----------------------------
DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of cities
-- ----------------------------
INSERT INTO `cities` VALUES ('1', '金水区');
INSERT INTO `cities` VALUES ('2', '惠济区');
INSERT INTO `cities` VALUES ('3', '二七区');
INSERT INTO `cities` VALUES ('4', '中原区');
INSERT INTO `cities` VALUES ('5', '管城回族区');
INSERT INTO `cities` VALUES ('6', '郑东新区');
INSERT INTO `cities` VALUES ('7', '经开区');
INSERT INTO `cities` VALUES ('8', '高新区');
INSERT INTO `cities` VALUES ('9', '荥阳市');
INSERT INTO `cities` VALUES ('10', '新郑市');
INSERT INTO `cities` VALUES ('11', '上街区');
INSERT INTO `cities` VALUES ('12', '巩义市');
INSERT INTO `cities` VALUES ('13', '新密市');
INSERT INTO `cities` VALUES ('14', '登封市');
INSERT INTO `cities` VALUES ('15', '中牟县');
INSERT INTO `cities` VALUES ('16', '航空港区');

-- ----------------------------
-- Table structure for communities
-- ----------------------------
DROP TABLE IF EXISTS `communities`;
CREATE TABLE `communities` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `img` varchar(500) DEFAULT NULL,
  `viewNum` int(10) NOT NULL DEFAULT '0',
  `buildTime` varchar(20) NOT NULL,
  `cityId` int(10) NOT NULL,
  `perPrice` int(10) NOT NULL COMMENT '房子单价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of communities
-- ----------------------------
INSERT INTO `communities` VALUES ('1', '鑫苑景园', '/upload/xiaoqu1.jpg', '80', '2016', '1', '21394');
INSERT INTO `communities` VALUES ('10', '其中家属院', '/upload/xiaoqu10.jpg', '3', '2016', '2', '15684');
INSERT INTO `communities` VALUES ('11', '测试', '/upload/xiaoqu9.jpg', '1', '2015', '3', '15678');
INSERT INTO `communities` VALUES ('12', '测试1', '/upload/xiaoqu9.jpg', '1', '2010', '4', '12378');
INSERT INTO `communities` VALUES ('13', '测试2', '/upload/xiaoqu9.jpg', '2', '2019', '5', '13478');
INSERT INTO `communities` VALUES ('14', '测试3', '/upload/xiaoqu9.jpg', '3', '2018', '6', '14578');
INSERT INTO `communities` VALUES ('15', '测试4', '/upload/xiaoqu9.jpg', '4', '2017', '7', '15678');
INSERT INTO `communities` VALUES ('16', '测试5', '/upload/xiaoqu9.jpg', '5', '2016', '8', '11778');
INSERT INTO `communities` VALUES ('17', '测试6', '/upload/xiaoqu9.jpg', '6', '2015', '9', '12878');
INSERT INTO `communities` VALUES ('18', '测试7', '/upload/xiaoqu9.jpg', '7', '2014', '10', '13978');
INSERT INTO `communities` VALUES ('19', '测试8', '/upload/xiaoqu9.jpg', '8', '2013', '11', '15078');
INSERT INTO `communities` VALUES ('2', '美景美镜', '/upload/xiaoqu2.jpg', '10', '2017', '12', '15364');
INSERT INTO `communities` VALUES ('20', '测试9', '/upload/xiaoqu9.jpg', '9', '2012', '13', '15178');
INSERT INTO `communities` VALUES ('21', '测试10', '/upload/xiaoqu9.jpg', '10', '2011', '14', '15278');
INSERT INTO `communities` VALUES ('3', '名门紫苑', '/upload/xiaoqu3.jpg', '300', '2018', '15', '12402');
INSERT INTO `communities` VALUES ('4', '城中央', '/upload/xiaoqu4.jpg', '20', '2019', '16', '22768');
INSERT INTO `communities` VALUES ('5', '麻省理工', '/upload/xiaoqu5.jpg', '33', '2011', '1', '12387');
INSERT INTO `communities` VALUES ('6', '金科天籁城', '/upload/xiaoqu6.jpg', '21', '2012', '2', '12193');
INSERT INTO `communities` VALUES ('7', '名门翠园', '/upload/xiaoqu7.jpg', '50', '2013', '3', '15151');
INSERT INTO `communities` VALUES ('8', '天福苑', '/upload/xiaoqu8.jpg', '45', '2014', '4', '22905');
INSERT INTO `communities` VALUES ('9', '康桥像细菌', '/upload/xiaoqu9.jpg', '600', '2015', '5', '11507');

-- ----------------------------
-- Table structure for houses
-- ----------------------------
DROP TABLE IF EXISTS `houses`;
CREATE TABLE `houses` (
  `id` varchar(255) NOT NULL,
  `communityId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cityId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '所在市区',
  `area` int(4) NOT NULL COMMENT '房屋面积',
  `img` varchar(500) DEFAULT NULL,
  `roomType` int(2) DEFAULT NULL,
  `hallType` int(2) NOT NULL,
  `toiletType` int(2) DEFAULT NULL COMMENT 'room室 hall厅 toilet卫',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型Id 是写字楼还是家庭用房什么的',
  `price` decimal(10,2) NOT NULL COMMENT '房子总报价',
  `special` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '房子特点  地铁边 学区房 新装修',
  `personId` varchar(255) NOT NULL,
  `userId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '房子所属人的Id',
  `viewNum` int(10) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `registerTime` datetime NOT NULL COMMENT '房子注册发布时间',
  `rendPrice` decimal(10,2) DEFAULT '0.00' COMMENT '房租价格 ',
  `operateType` int(2) NOT NULL DEFAULT '0' COMMENT '0租房，1新房，2二手房',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of houses
-- ----------------------------
INSERT INTO `houses` VALUES ('1557072982730ACOUNTadmin别墅211', '1', '2', '198', '/upload/1557121250062-17772176187-loupan4.jpg', '3', '2', '2', '住宅', '0.00', '新装修学区房', '03456787', '1557072982731ACOUNTadmin', '0', '2019-05-04 13:41:13', null, '1');
INSERT INTO `houses` VALUES ('1557072982731ACOUNTadmin1100', '10', '1', '50', '/upload/1557142839942-undefined-loupan1.jpg', '1', '1', '1', '住宅', '100.00', '', '123456789', '1557072982731ACOUNTadmin', '0', '2019-05-06 19:41:05', '1000.00', '0');
INSERT INTO `houses` VALUES ('1557072982731ACOUNTadmin111', '1', '1', '72', '/upload/1557204091924-undefined-recommend-bg1.jpg', '1', '1', '1', '住宅', '120.00', '地铁旁', '13456786', '1557072982731ACOUNTadmin', '0', '2019-05-07 12:41:42', null, '1');
INSERT INTO `houses` VALUES ('1557072982731ACOUNTadmin121', '2', '1', '90', '/upload/1557204354227-undefined-loupan2.jpg', '1', '1', '1', '住宅', '141.00', '地铁旁', '253456782', '1557072982731ACOUNTadmin', '0', '2019-05-07 12:46:00', null, '1');
INSERT INTO `houses` VALUES ('1557072982731ACOUNTadmin122', '2', '1', '102', '/upload/1557138999326-undefined-loupan3.jpg', '3', '1', '1', '住宅', '150.00', '地铁旁新装修', '', '1557072982731ACOUNTadmin', '0', '2019-05-06 18:37:26', null, '2');
INSERT INTO `houses` VALUES ('1557072982731ACOUNTadmin141', '4', '1', '90', '/upload/1557204354227-undefined-loupan2.jpg', '1', '1', '1', '住宅', '141.00', '地铁旁', '253456782', '1557072982731ACOUNTadmin', '0', '2019-05-07 12:46:03', null, '1');
INSERT INTO `houses` VALUES ('1557072982731ACOUNTadmin151', '5', '1', '90', '/upload/1557204354227-undefined-loupan2.jpg', '1', '1', '1', '住宅', '141.00', '地铁旁', '253456782', '1557072982731ACOUNTadmin', '0', '2019-05-07 12:46:09', null, '1');
INSERT INTO `houses` VALUES ('1557072982731ACOUNTadmin171', '7', '1', '90', '/upload/1557204354227-undefined-loupan2.jpg', '1', '1', '1', '住宅', '141.00', '地铁旁', '', '1557072982731ACOUNTadmin', '0', '2019-05-07 12:46:06', null, '1');
INSERT INTO `houses` VALUES ('1557072982731ACOUNTadmin181', '8', '1', '90', '/upload/1557204354227-undefined-loupan2.jpg', '1', '1', '1', '住宅', '141.00', '地铁旁', '253456782', '1557072982731ACOUNTadmin', '0', '2019-05-07 12:45:55', null, '1');
INSERT INTO `houses` VALUES ('1557072982731ACOUNTadmin191', '9', '1', '90', '', '1', '1', '1', '住宅', '141.00', '地铁旁', '', '1557072982731ACOUNTadmin', '0', '2019-05-07 12:45:46', null, '1');
INSERT INTO `houses` VALUES ('1557072982731ACOUNTadmin562', '6', '5', '300', '/upload/1557124613593-17772176187-recommend-bg6.jpg', '1', '1', '1', '别墅', '700.00', '新装修', '13456786', '1557072982731ACOUNTadmin', '0', '2019-05-06 14:37:21', null, '2');
INSERT INTO `houses` VALUES ('1557072982731ACOUNTadmin住宅110', '1', '1', '60', '/upload/1557120881240-17772176187-loupan1.jpg', '1', '1', '1', '住宅', '120.00', '地铁旁', '93456788', '1557072982731ACOUNTadmin', '0', '2019-05-06 13:34:57', '2000.00', '0');
INSERT INTO `houses` VALUES ('1557072982731ACOUNTadmin住宅1100', '10', '1', '70', '/upload/1557120999100-17772176187-loupan2.jpg', '1', '1', '1', '住宅', '140.00', '地铁旁学区房', '13456786', '1557072982731ACOUNTadmin', '0', '2019-05-06 13:36:47', '3000.00', '0');
INSERT INTO `houses` VALUES ('1557072982731ACOUNTadmin住宅112', '1', '1', '100', '/upload/1557121413493-17772176187-recommend-bg6.jpg', '2', '2', '1', '住宅', '150.00', '地铁旁新装修', '13456786', '1557072982731ACOUNTadmin', '0', '2019-05-06 13:43:52', null, '2');
INSERT INTO `houses` VALUES ('1557072982731ACOUNTadmin住宅120', '2', '1', '70', '/upload/1557121109087-17772176187-loupan3.jpg', '1', '1', '1', '住宅', '141.00', '新装修学区房', '', '1557072982731ACOUNTadmin', '0', '2019-05-06 13:38:37', '1500.00', '0');
INSERT INTO `houses` VALUES ('1557072982731ACOUNTadmin住宅130', '3', '1', '72', '/upload/1557121134382-17772176187-loupan4.jpg', '1', '1', '1', '住宅', '150.00', '地铁旁学区房', '13456786', '1557072982731ACOUNTadmin', '0', '2019-05-06 13:39:07', '1600.00', '0');
INSERT INTO `houses` VALUES ('1557072982731ACOUNTadmin住宅140', '4', '1', '100', '/upload/1557121175289-17772176187-recommend-bg1.jpg', '1', '1', '1', '住宅', '200.00', '新装修', '93456788', '1557072982731ACOUNTadmin', '0', '2019-05-06 13:39:46', '1500.00', '0');
INSERT INTO `houses` VALUES ('1557072982731ACOUNTadmin住宅150', '5', '1', '120', '/upload/1557121194968-17772176187-recommend-bg2.jpg', '1', '1', '1', '住宅', '300.00', '地铁旁新装修', '', '1557072982731ACOUNTadmin', '0', '2019-05-06 13:40:08', '1400.00', '0');
INSERT INTO `houses` VALUES ('1557072982731ACOUNTadmin住宅160', '6', '1', '90', '/upload/1557121224817-17772176187-recommend-bg4.jpg', '1', '1', '1', '住宅', '200.00', '新装修', '93456788', '1557072982731ACOUNTadmin', '0', '2019-05-06 13:40:33', '2100.00', '0');
INSERT INTO `houses` VALUES ('1557072982731ACOUNTadmin住宅161', '6', '1', '88', '/upload/1557121319512-17772176187-loupan2.jpg', '1', '1', '1', '住宅', '120.00', '地铁旁', '53456789', '1557072982731ACOUNTadmin', '100', '2019-05-06 13:42:10', null, '1');
INSERT INTO `houses` VALUES ('1557072982731ACOUNTadmin住宅3101', '10', '3', '90', '/upload/1557121281891-17772176187-loupan3.jpg', '2', '1', '1', '住宅', '150.00', '地铁旁新装修学区房', '33456789', '1557072982731ACOUNTadmin', '200', '2019-05-06 13:41:49', null, '1');
INSERT INTO `houses` VALUES ('1557072982731ACOUNTadmin住宅432', '3', '4', '130', '/upload/1557121454993-17772176187-recommend-bg5.jpg', '2', '2', '2', '住宅', '200.00', '', '53456789', '1557072982731ACOUNTadmin', '0', '2019-05-06 13:44:32', null, '2');
INSERT INTO `houses` VALUES ('1557072982731ACOUNTadmin住宅442', '4', '4', '50', '/upload/1557121486245-17772176187-recommend-bg4.jpg', '2', '2', '2', '住宅', '70.00', '地铁旁新装修学区房', '63456781', '1557072982731ACOUNTadmin', '0', '2019-05-06 13:44:59', null, '2');
INSERT INTO `houses` VALUES ('1557072982731ACOUNTadmin住宅521', '2', '5', '120', '', '2', '1', '1', '住宅', '160.00', '地铁旁新装修学区房', '63456781', '1557072982731ACOUNTadmin', '0', '2019-05-06 13:43:19', null, '1');
INSERT INTO `houses` VALUES ('155720444720911', '1', '1', '70', '/upload/1557204432255-undefined-loupan2.jpg', '1', '1', '1', '住宅', '120.00', '地铁旁新装修学区房', '53456789', '1557072982731ACOUNTadmin', '0', '2019-05-07 12:47:27', null, '1');
INSERT INTO `houses` VALUES ('155720445712111', '1', '1', '80', '/upload/1557204456532-undefined-loupan3.jpg', '1', '1', '1', '住宅', '120.00', '地铁旁新装修学区房', '63456781', '1557072982731ACOUNTadmin', '0', '2019-05-07 12:47:37', null, '1');
INSERT INTO `houses` VALUES ('155720446617511', '1', '1', '80', '/upload/1557204465133-undefined-twice-home4.jpg', '1', '1', '1', '住宅', '120.00', '地铁旁新装修学区房', '53456789', '1557072982731ACOUNTadmin', '0', '2019-05-07 12:47:46', null, '1');
INSERT INTO `houses` VALUES ('155720448390711', '1', '1', '80', '/upload/1557204465133-undefined-twice-home4.jpg', '2', '1', '1', '住宅', '120.00', '地铁旁新装修学区房', '', '1557072982731ACOUNTadmin', '0', '2019-05-07 12:48:04', null, '1');
INSERT INTO `houses` VALUES ('155720448725741', '4', '1', '80', '/upload/1557204465133-undefined-twice-home4.jpg', '2', '1', '1', '住宅', '120.00', '地铁旁新装修学区房', '53456789', '1557072982731ACOUNTadmin', '0', '2019-05-07 12:48:07', null, '1');
INSERT INTO `houses` VALUES ('155720449052751', '5', '1', '80', '/upload/1557204465133-undefined-twice-home4.jpg', '2', '1', '1', '住宅', '120.00', '地铁旁新装修学区房', '', '1557072982731ACOUNTadmin', '0', '2019-05-07 12:48:11', null, '1');
INSERT INTO `houses` VALUES ('155720449364771', '7', '1', '80', '/upload/1557204465133-undefined-twice-home4.jpg', '2', '1', '1', '住宅', '120.00', '地铁旁新装修学区房', '53456789', '1557072982731ACOUNTadmin', '0', '2019-05-07 12:48:14', null, '1');

-- ----------------------------
-- Table structure for house_operate
-- ----------------------------
DROP TABLE IF EXISTS `house_operate`;
CREATE TABLE `house_operate` (
  `id` varchar(255) NOT NULL,
  `houseId` varchar(255) NOT NULL COMMENT '房子Id',
  `isSale` int(2) NOT NULL DEFAULT '0' COMMENT '0:没有卖出或者租出 1:卖出或者租出',
  `salerId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '卖家Id',
  `buyerId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '购买人Id',
  `personId` varchar(255) NOT NULL,
  `timeEnd` datetime DEFAULT NULL COMMENT '房子结束时间',
  `timeStart` datetime DEFAULT NULL COMMENT '房子开始时间',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '0:租房 1:新房 2:二手房 ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of house_operate
-- ----------------------------
INSERT INTO `house_operate` VALUES ('operate1557072982731ACOUNTadmin1100', '1557072982731ACOUNTadmin1100', '0', '1557072982731ACOUNTadmin', null, '03456787', null, null, '0');
INSERT INTO `house_operate` VALUES ('operate1557072982731ACOUNTadmin111', '1557072982731ACOUNTadmin111', '0', '1557072982731ACOUNTadmin', null, '03456787', null, null, '1');
INSERT INTO `house_operate` VALUES ('operate1557072982731ACOUNTadmin121', '1557072982731ACOUNTadmin121', '0', '1557072982731ACOUNTadmin', null, '03456787', null, null, '1');
INSERT INTO `house_operate` VALUES ('operate1557072982731ACOUNTadmin122', '1557072982731ACOUNTadmin122', '0', '1557072982731ACOUNTadmin', null, '03456787', null, null, '2');
INSERT INTO `house_operate` VALUES ('operate1557072982731ACOUNTadmin141', '1557072982731ACOUNTadmin141', '0', '1557072982731ACOUNTadmin', null, '03456787', null, null, '1');
INSERT INTO `house_operate` VALUES ('operate1557072982731ACOUNTadmin151', '1557072982731ACOUNTadmin151', '0', '1557072982731ACOUNTadmin', null, '123456789', null, null, '1');
INSERT INTO `house_operate` VALUES ('operate1557072982731ACOUNTadmin171', '1557072982731ACOUNTadmin171', '0', '1557072982731ACOUNTadmin', null, '123456789', null, null, '1');
INSERT INTO `house_operate` VALUES ('operate1557072982731ACOUNTadmin181', '1557072982731ACOUNTadmin181', '0', '1557072982731ACOUNTadmin', null, '123456789', null, null, '1');
INSERT INTO `house_operate` VALUES ('operate1557072982731ACOUNTadmin191', '1557072982731ACOUNTadmin191', '0', '1557072982731ACOUNTadmin', null, '123456789', null, null, '1');
INSERT INTO `house_operate` VALUES ('operate1557072982731ACOUNTadmin562', '1557072982731ACOUNTadmin562', '0', '1557072982731ACOUNTadmin', null, '23456780', null, null, '2');
INSERT INTO `house_operate` VALUES ('operate1557072982731ACOUNTadmin住宅110', '1557072982731ACOUNTadmin住宅110', '0', '1557072982731ACOUNTadmin', null, '23456780', null, null, '0');
INSERT INTO `house_operate` VALUES ('operate1557072982731ACOUNTadmin住宅1100', '1557072982731ACOUNTadmin住宅1100', '0', '1557072982731ACOUNTadmin', null, '23456780', null, null, '0');
INSERT INTO `house_operate` VALUES ('operate1557072982731ACOUNTadmin住宅112', '1557072982731ACOUNTadmin住宅112', '0', '1557072982731ACOUNTadmin', null, '33456789', null, null, '2');
INSERT INTO `house_operate` VALUES ('operate1557072982731ACOUNTadmin住宅120', '1557072982731ACOUNTadmin住宅120', '0', '1557072982731ACOUNTadmin', null, '33456789', null, null, '0');
INSERT INTO `house_operate` VALUES ('operate1557072982731ACOUNTadmin住宅130', '1557072982731ACOUNTadmin住宅130', '0', '1557072982731ACOUNTadmin', null, '33456789', null, null, '0');
INSERT INTO `house_operate` VALUES ('operate1557072982731ACOUNTadmin住宅140', '1557072982731ACOUNTadmin住宅140', '0', '1557072982731ACOUNTadmin', null, '33456789', null, null, '0');
INSERT INTO `house_operate` VALUES ('operate1557072982731ACOUNTadmin住宅150', '1557072982731ACOUNTadmin住宅150', '0', '1557072982731ACOUNTadmin', null, '43456789', null, null, '0');
INSERT INTO `house_operate` VALUES ('operate1557072982731ACOUNTadmin住宅160', '1557072982731ACOUNTadmin住宅160', '0', '1557072982731ACOUNTadmin', null, '43456789', null, null, '0');
INSERT INTO `house_operate` VALUES ('operate1557072982731ACOUNTadmin住宅161', '1557072982731ACOUNTadmin住宅161', '0', '1557072982731ACOUNTadmin', null, '43456789', null, null, '1');
INSERT INTO `house_operate` VALUES ('operate1557072982731ACOUNTadmin住宅3101', '1557072982731ACOUNTadmin住宅3101', '0', '1557072982731ACOUNTadmin', null, '43456789', null, null, '1');
INSERT INTO `house_operate` VALUES ('operate1557072982731ACOUNTadmin住宅432', '1557072982731ACOUNTadmin住宅432', '0', '1557072982731ACOUNTadmin', null, '43456789', null, null, '2');
INSERT INTO `house_operate` VALUES ('operate1557072982731ACOUNTadmin住宅442', '1557072982731ACOUNTadmin住宅442', '0', '1557072982731ACOUNTadmin', null, '73456780', null, null, '2');
INSERT INTO `house_operate` VALUES ('operate1557072982731ACOUNTadmin住宅521', '1557072982731ACOUNTadmin住宅521', '0', '1557072982731ACOUNTadmin', null, '73456780', null, null, '1');
INSERT INTO `house_operate` VALUES ('operate1557072982731ACOUNTadmin住宅571', '1557072982731ACOUNTadmin住宅571', '0', '1557072982731ACOUNTadmin', null, '73456780', null, null, '1');
INSERT INTO `house_operate` VALUES ('operate1557072982731ACOUNTadmin别墅211', '1557072982731ACOUNTadmin别墅211', '0', '1557072982731ACOUNTadmin', null, '73456780', null, null, '1');
INSERT INTO `house_operate` VALUES ('operate155720444720911', '155720444720911', '0', '1557072982731ACOUNTadmin', null, '73456780', null, null, '1');
INSERT INTO `house_operate` VALUES ('operate155720445712111', '155720445712111', '0', '1557072982731ACOUNTadmin', null, '73456780', null, null, '1');
INSERT INTO `house_operate` VALUES ('operate155720446617511', '155720446617511', '0', '1557072982731ACOUNTadmin', null, '73456780', null, null, '1');
INSERT INTO `house_operate` VALUES ('operate155720448390711', '155720448390711', '0', '1557072982731ACOUNTadmin', null, '73456780', null, null, '1');
INSERT INTO `house_operate` VALUES ('operate155720448725741', '155720448725741', '0', '1557072982731ACOUNTadmin', null, '73456780', null, null, '1');
INSERT INTO `house_operate` VALUES ('operate155720449052751', '155720449052751', '0', '1557072982731ACOUNTadmin', null, '73456780', null, null, '1');
INSERT INTO `house_operate` VALUES ('operate155720449364771', '155720449364771', '0', '1557072982731ACOUNTadmin', null, '73456780', null, null, '1');

-- ----------------------------
-- Table structure for persons
-- ----------------------------
DROP TABLE IF EXISTS `persons`;
CREATE TABLE `persons` (
  `id` varchar(255) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `manage` varchar(255) NOT NULL,
  `score` decimal(10,2) NOT NULL,
  `header` varchar(50) NOT NULL,
  `viewNum` int(10) NOT NULL,
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of persons
-- ----------------------------
INSERT INTO `persons` VALUES ('03456787', '张8', '123465787', '鑫苑景园', '4.60', '经纪人', '7', '2019-05-08 13:06:59');
INSERT INTO `persons` VALUES ('123456789', '张三', '123465789', '鑫苑景园', '4.80', '资深经纪人', '50', '2019-05-09 13:06:59');
INSERT INTO `persons` VALUES ('13456786', '张7', '123465786', '鑫苑景园', '4.60', '资深经纪人', '8', '2019-05-07 13:06:59');
INSERT INTO `persons` VALUES ('23456780', '张三1', '123465780', '康桥像细菌', '4.30', '经纪人', '0', '2019-05-02 13:06:59');
INSERT INTO `persons` VALUES ('23456785', '张6', '123465785', '其中家属院', '4.80', '资经纪人', '9', '2019-05-06 13:06:59');
INSERT INTO `persons` VALUES ('253456782', '张3', '123465782', '其中家属院', '4.60', '经纪人', '30', '2019-05-03 13:06:59');
INSERT INTO `persons` VALUES ('33456784', '张5', '123465784', '其中家属院', '4.80', '资深经纪人', '10', '2019-05-05 13:06:59');
INSERT INTO `persons` VALUES ('33456789', '张三2', '223465789', '美景美镜', '4.60', '经纪人', '0', '2019-05-03 13:06:59');
INSERT INTO `persons` VALUES ('43456783', '张4', '123465783', '名门紫苑', '4.90', '经纪人', '20', '2019-05-04 13:06:59');
INSERT INTO `persons` VALUES ('43456789', '张三3', '323465789', '城中央', '3.70', '经纪人', '11', '2019-05-04 13:06:59');
INSERT INTO `persons` VALUES ('53456789', '张三4', '423465789', '麻省理工', '4.60', '经纪人', '15', '2019-05-05 13:06:59');
INSERT INTO `persons` VALUES ('63456781', '张2', '123465781', '名门翠园', '4.90', '经纪人', '40', '2019-05-02 13:06:59');
INSERT INTO `persons` VALUES ('63456789', '张三5', '523465789', '金科天籁城', '4.90', '资深经纪人', '37', '2019-05-06 13:06:59');
INSERT INTO `persons` VALUES ('73456780', '张1', '123465780', '天福苑', '4.60', '资深经纪人', '50', '2019-05-01 13:06:59');
INSERT INTO `persons` VALUES ('73456789', '张三6', '623465789', '名门翠园', '4.20', '资深经纪人', '42', '2019-05-07 13:06:59');
INSERT INTO `persons` VALUES ('83456789', '张0', '123465789', '名门翠园', '4.10', '经纪人', '5', '2019-05-01 13:06:59');
INSERT INTO `persons` VALUES ('93456788', '张9', '123465788', '名门翠园', '4.60', '资深经纪人', '6', '2019-05-09 13:06:59');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trueName` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` int(2) NOT NULL DEFAULT '0' COMMENT '0:用户',
  `registerTime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1557072964756ACOUNTadmin1', 'admin1', 'admin1', 'admin@qq.com', 'admin1', '0', '2019-05-06 00:16:05');
INSERT INTO `users` VALUES ('1557072982731ACOUNTadmin', 'admin', 'admin', 'admin@qq.com', 'admin', '0', '2019-05-06 00:16:23');
