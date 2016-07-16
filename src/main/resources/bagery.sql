/*
Navicat MySQL Data Transfer

Source Server         : Mysql
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : bagery

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2016-07-16 14:55:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cart_item
-- ----------------------------
DROP TABLE IF EXISTS `cart_item`;
CREATE TABLE `cart_item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `total_priced` decimal(10,0) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `product_id` (`product_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `cart_item_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cart_item_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart_item
-- ----------------------------
INSERT INTO `cart_item` VALUES ('4', '130', '1', '900', '5');
INSERT INTO `cart_item` VALUES ('14', '130', '1', '900', '7');
INSERT INTO `cart_item` VALUES ('16', '140', '1', '9995', '4');
INSERT INTO `cart_item` VALUES ('17', '132', '1', '2550', '4');
INSERT INTO `cart_item` VALUES ('18', '135', '1', '2000', '4');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `content1` text,
  `content2` text,
  `admin_content` text,
  `star` int(11) DEFAULT NULL,
  `priced_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `user_id` (`user_id`),
  KEY `priced_id` (`priced_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`priced_id`) REFERENCES `priced` (`priced_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for favorite_item
-- ----------------------------
DROP TABLE IF EXISTS `favorite_item`;
CREATE TABLE `favorite_item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `priced_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `priced_id` (`priced_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `favorite_item_ibfk_1` FOREIGN KEY (`priced_id`) REFERENCES `priced` (`priced_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `favorite_item_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of favorite_item
-- ----------------------------
INSERT INTO `favorite_item` VALUES ('2', '14', '5');
INSERT INTO `favorite_item` VALUES ('3', '8', '4');
INSERT INTO `favorite_item` VALUES ('4', '6', '4');
INSERT INTO `favorite_item` VALUES ('6', '16', '4');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ship_inf_id` int(11) NOT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `instruction` text,
  `order_status` enum('unpaid','unshipped','shipped','completed','canceled') NOT NULL DEFAULT 'unpaid',
  `courier_number` varchar(50) DEFAULT NULL,
  `courier_company` varchar(20) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('5', '4', '3', '750', '', 'canceled', null, null, null);
INSERT INTO `orders` VALUES ('6', '4', '3', '1000', 'hello', 'completed', '195555555555', 'SF', null);
INSERT INTO `orders` VALUES ('8', '6', '5', '9995', '', 'shipped', '555555', 'sf', null);
INSERT INTO `orders` VALUES ('9', '4', '3', '1000', '', 'unpaid', null, null, null);
INSERT INTO `orders` VALUES ('10', '4', '12', '900', '', 'unshipped', null, null, null);
INSERT INTO `orders` VALUES ('12', '4', '11', '19990', '', 'unpaid', null, null, null);
INSERT INTO `orders` VALUES ('13', '4', '11', '2550', '', 'unshipped', null, null, null);
INSERT INTO `orders` VALUES ('14', '4', '11', '0', '', 'unpaid', '5955555555', null, '2016-07-15 07:14:33');
INSERT INTO `orders` VALUES ('17', '4', '11', '3000', '', 'unshipped', null, null, null);

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `product_title` varchar(50) NOT NULL,
  `num` int(11) NOT NULL,
  `total_priced` decimal(10,0) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_item
-- ----------------------------
INSERT INTO `order_item` VALUES ('3', '134', 'I Feel Love手拿包', '1', '750', '5');
INSERT INTO `order_item` VALUES ('4', '129', '格纹单肩包', '1', '1000', '6');
INSERT INTO `order_item` VALUES ('6', '140', 'Bagery 测试商品', '1', '9995', '8');
INSERT INTO `order_item` VALUES ('7', '129', '格纹单肩包', '1', '1000', '9');
INSERT INTO `order_item` VALUES ('8', '130', '格纹背包', '1', '900', '10');
INSERT INTO `order_item` VALUES ('10', '140', 'Bagery 测试商品', '2', '19990', '12');
INSERT INTO `order_item` VALUES ('11', '132', '\'Bow Cut\'迷你斜挎包', '1', '0', '13');
INSERT INTO `order_item` VALUES ('12', '131', '\'House check\'斜挎包', '1', '0', '14');
INSERT INTO `order_item` VALUES ('15', '129', '格纹单肩包', '3', '0', '17');

-- ----------------------------
-- Table structure for priced
-- ----------------------------
DROP TABLE IF EXISTS `priced`;
CREATE TABLE `priced` (
  `priced_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `img` text,
  `description` text,
  `is_existed` tinyint(4) NOT NULL DEFAULT '1',
  `unit_price` decimal(10,0) NOT NULL,
  `sale_price` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`priced_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of priced
-- ----------------------------
INSERT INTO `priced` VALUES ('6', '格纹单肩包', 'http://cdn-images.farfetch.com/11/27/79/76/11277976_6530203_1000.jpg', 'Burberry 黑色 全棉 格纹单肩包。 顶置拉链, 金色铁链肩带, 内置一个主要分层。', '1', '1100', '1000');
INSERT INTO `priced` VALUES ('7', '格纹背包', 'http://cdn-images.farfetch.com/11/40/64/79/11406479_7120753_480.jpg', 'Burberry 褐色 小牛皮黄麻棉质 格纹背包。', '1', '920', '900');
INSERT INTO `priced` VALUES ('8', '\'House check\'斜挎包', 'http://cdn-images.farfetch.com/11/24/97/30/11249730_6056108_480.jpg', 'Burberry 靛蓝色 牛皮与全棉 \'House check\'斜挎包。 顶置拉链, 可拆卸肩带, 内置多个卡槽, 内置一个主要分层。', '1', '615', '600');
INSERT INTO `priced` VALUES ('9', '\'Bow Cut\'迷你斜挎包', 'http://cdn-images.farfetch.com/11/50/10/07/11501007_7138932_480.jpg', 'Givenchy 黑色 小牛皮 \'Bow Cut\'迷你斜挎包。 搭链肩带, 银色五金配件, 正中有品牌标记, 翻盖饰有摁扣, 内置贴袋, 内置拉链口袋, 内置标牌。', '1', '2554', '2550');
INSERT INTO `priced` VALUES ('10', '\'Shark\'中号手提包', 'http://cdn-images.farfetch.com/11/50/10/09/11501009_7141974_1000.jpg', 'Givenchy 黑色 小牛皮 \'Shark\'中号手提包。 顶部有弧状手柄, 可拆卸可调肩带, 正中有品牌标记, 银色五金配件, 顶部饰有翻盖, 旋扣, 脚钉, 内置拉链口袋, 内置贴袋, 内置标牌。', '1', '2554', '2550');
INSERT INTO `priced` VALUES ('11', 'I Feel Love手拿包', 'http://cdn-images.farfetch.com/11/33/82/06/11338206_6370025_1000.jpg', 'Givenchy 黑色 小牛皮 I Feel Love手拿包。 顶置拉链, 内置标贴。', '1', '765', '750');
INSERT INTO `priced` VALUES ('12', '\'Pandora Box\'迷你单肩包', 'http://cdn-images.farfetch.com/11/23/23/22/11232322_5906078_480.jpg', 'Givenchy 红色 小牛皮 \'Pandora Box\'迷你单肩包。 翻盖饰有插入式的摁扣, 正面标志贴, 正面拉链口袋, 可调肩带, 绒面皮衬里, 内置拉链口袋。', '1', '2136', '2000');
INSERT INTO `priced` VALUES ('13', '\'Bow-Cut\'迷你斜挎包', 'http://cdn-images.farfetch.com/11/50/48/78/11504878_7225214_1000.jpg', 'Givenchy 黑色 小牛皮 \'Bow-Cut\'迷你斜挎包。 搭链肩带, 银色五金配件, 正中有品牌标记, 翻盖饰有摁扣, 内置拉链口袋, 内置标贴。', '1', '2152', '2000');
INSERT INTO `priced` VALUES ('14', '\'Dotcom\'手提包', 'http://cdn-images.farfetch.com/11/52/21/58/11522158_7302326_1000.jpg', 'Fendi 红色 小牛皮 \'Dotcom\'手提包。 正中有品牌标记, 顶部有一个手柄, 可拆卸肩带。', '1', '2743', '2600');
INSERT INTO `priced` VALUES ('15', '\'3Jours\'迷你斜挎包', 'http://cdn-images.farfetch.com/11/48/19/07/11481907_7019209_1000.jpg', 'Fendi 灰色 小羊皮与小牛皮 \'3Jours\'迷你斜挎包。 顶部有弧状手柄, 对比滚边, 可拆卸吊牌, 可拆卸可调肩带, 银色五金配件, 顶置拉链。', '1', '2589', '2500');
INSERT INTO `priced` VALUES ('16', 'Bagery 测试商品', 'http://o9s6sj90d.bkt.clouddn.com/o_1anfg53ngefjusp1vbikjk1d319.jpg?imageMogr2/crop/!480x480a0a71', '一段longlonglonglonglong 描述', '1', '9999', '9995');
INSERT INTO `priced` VALUES ('19', '\'Falabella\'单肩包', 'http://cdn-images.farfetch.com/10/90/73/70/10907370_4369428_255.jpg,', '', '1', '9999', '421');
INSERT INTO `priced` VALUES ('20', '\'Rosalia\'单肩包', 'http://cdn-images.farfetch.com/11/09/68/30/11096830_5258856_1000.jpg,', 'Dolce & Gabbana 黑色与米色 天鹅绒与真皮 \'Rosalia\'单肩包。 翻盖饰有旋扣, 内置拉链口袋, 内置小型镜子, 皮革边饰链式肩带, 豹纹。', '1', '9999', '2508');
INSERT INTO `priced` VALUES ('21', '\'Sicily\'手提包', 'http://cdn-images.farfetch.com/11/29/48/80/11294880_6408386_1000.jpg,', 'Dolce & Gabbana 黑色 牛皮 \'Sicily\'手提包。 顶部有弧状手柄, 可拆卸可调肩带, 翻盖饰有插入式的摁扣, 正面标志贴, 内置拉链口袋, 豹纹印花衬里', '1', '9999', '1491');
INSERT INTO `priced` VALUES ('22', '拉链购物袋', 'http://cdn-images.farfetch.com/11/51/42/83/11514283_7211918_1000.jpg,', 'Jil Sander 褐色 牛皮 拉链购物袋。', '1', '9999', '1604');
INSERT INTO `priced` VALUES ('23', '\'2Jours\'小号手提包', 'http://cdn-images.farfetch.com/11/48/22/77/11482277_7137391_1000.jpg,', 'Fendi 灰色 牛皮 \'2Jours\'小号手提包。 顶部有弧状手柄, 可拆卸吊牌, 可拆卸可调肩带, 顶部有磁性摁扣, 内置拉链夹层, 内置标牌, 脚钉。', '1', '9999', '2281');
INSERT INTO `priced` VALUES ('24', '\'Sac de Jour\'baby手提包', 'http://cdn-images.farfetch.com/11/49/16/89/11491689_7099982_1000.jpg,', 'Saint Laurent 褐色 小牛皮 \'Sac de Jour\'baby手提包。 顶部有弧状手柄, 可拆卸可调肩带, 正中有品牌标记, 皮质吊牌, 银色五金配件, 内置拉链夹层', '1', '9999', '2580');

-- ----------------------------
-- Table structure for priced_pro
-- ----------------------------
DROP TABLE IF EXISTS `priced_pro`;
CREATE TABLE `priced_pro` (
  `pp_id` int(11) NOT NULL AUTO_INCREMENT,
  `priced_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  PRIMARY KEY (`pp_id`),
  KEY `priced_id` (`priced_id`),
  KEY `pro_id` (`pro_id`),
  CONSTRAINT `priced_pro_ibfk_1` FOREIGN KEY (`priced_id`) REFERENCES `priced` (`priced_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `priced_pro_ibfk_2` FOREIGN KEY (`pro_id`) REFERENCES `property` (`pro_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=358 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of priced_pro
-- ----------------------------
INSERT INTO `priced_pro` VALUES ('307', '6', '3');
INSERT INTO `priced_pro` VALUES ('308', '6', '18');
INSERT INTO `priced_pro` VALUES ('309', '6', '24');
INSERT INTO `priced_pro` VALUES ('310', '7', '3');
INSERT INTO `priced_pro` VALUES ('311', '7', '18');
INSERT INTO `priced_pro` VALUES ('312', '7', '25');
INSERT INTO `priced_pro` VALUES ('313', '8', '3');
INSERT INTO `priced_pro` VALUES ('314', '8', '18');
INSERT INTO `priced_pro` VALUES ('315', '8', '28');
INSERT INTO `priced_pro` VALUES ('316', '9', '11');
INSERT INTO `priced_pro` VALUES ('317', '9', '16');
INSERT INTO `priced_pro` VALUES ('318', '9', '28');
INSERT INTO `priced_pro` VALUES ('319', '10', '11');
INSERT INTO `priced_pro` VALUES ('320', '10', '16');
INSERT INTO `priced_pro` VALUES ('321', '10', '27');
INSERT INTO `priced_pro` VALUES ('322', '11', '11');
INSERT INTO `priced_pro` VALUES ('323', '11', '16');
INSERT INTO `priced_pro` VALUES ('324', '11', '26');
INSERT INTO `priced_pro` VALUES ('325', '12', '11');
INSERT INTO `priced_pro` VALUES ('326', '12', '16');
INSERT INTO `priced_pro` VALUES ('327', '12', '24');
INSERT INTO `priced_pro` VALUES ('328', '13', '11');
INSERT INTO `priced_pro` VALUES ('329', '13', '16');
INSERT INTO `priced_pro` VALUES ('330', '13', '28');
INSERT INTO `priced_pro` VALUES ('331', '14', '1');
INSERT INTO `priced_pro` VALUES ('332', '14', '16');
INSERT INTO `priced_pro` VALUES ('333', '14', '27');
INSERT INTO `priced_pro` VALUES ('334', '15', '1');
INSERT INTO `priced_pro` VALUES ('335', '15', '16');
INSERT INTO `priced_pro` VALUES ('336', '15', '28');
INSERT INTO `priced_pro` VALUES ('337', '16', '4');
INSERT INTO `priced_pro` VALUES ('338', '16', '18');
INSERT INTO `priced_pro` VALUES ('339', '16', '26');
INSERT INTO `priced_pro` VALUES ('340', '19', '6');
INSERT INTO `priced_pro` VALUES ('341', '19', '17');
INSERT INTO `priced_pro` VALUES ('342', '19', '24');
INSERT INTO `priced_pro` VALUES ('343', '20', '6');
INSERT INTO `priced_pro` VALUES ('344', '20', '21');
INSERT INTO `priced_pro` VALUES ('345', '20', '27');
INSERT INTO `priced_pro` VALUES ('346', '21', '1');
INSERT INTO `priced_pro` VALUES ('347', '21', '14');
INSERT INTO `priced_pro` VALUES ('348', '21', '24');
INSERT INTO `priced_pro` VALUES ('349', '22', '4');
INSERT INTO `priced_pro` VALUES ('350', '22', '17');
INSERT INTO `priced_pro` VALUES ('351', '22', '28');
INSERT INTO `priced_pro` VALUES ('352', '23', '1');
INSERT INTO `priced_pro` VALUES ('353', '23', '17');
INSERT INTO `priced_pro` VALUES ('354', '23', '26');
INSERT INTO `priced_pro` VALUES ('355', '24', '4');
INSERT INTO `priced_pro` VALUES ('356', '24', '20');
INSERT INTO `priced_pro` VALUES ('357', '24', '29');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `priced_id` int(11) NOT NULL,
  `color` varchar(30) NOT NULL,
  `stock` int(11) NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `color_duplicate` (`priced_id`,`color`),
  KEY `priced_id` (`priced_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`priced_id`) REFERENCES `priced` (`priced_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('129', '6', '黑', '5');
INSERT INTO `product` VALUES ('130', '7', '褐', '48');
INSERT INTO `product` VALUES ('131', '8', '靛蓝', '45');
INSERT INTO `product` VALUES ('132', '9', '黑', '47');
INSERT INTO `product` VALUES ('133', '10', '黑', '48');
INSERT INTO `product` VALUES ('134', '11', '黑', '49');
INSERT INTO `product` VALUES ('135', '12', '红', '48');
INSERT INTO `product` VALUES ('136', '13', '黑', '50');
INSERT INTO `product` VALUES ('137', '14', '红', '50');
INSERT INTO `product` VALUES ('138', '15', '灰', '50');
INSERT INTO `product` VALUES ('140', '16', '蓝', '36');
INSERT INTO `product` VALUES ('141', '19', '蓝', '543');
INSERT INTO `product` VALUES ('142', '19', '黑', '453');
INSERT INTO `product` VALUES ('143', '20', '粉', '40');
INSERT INTO `product` VALUES ('144', '21', '黑', '50');
INSERT INTO `product` VALUES ('145', '21', '蓝', '45');
INSERT INTO `product` VALUES ('146', '22', '黑', '50');
INSERT INTO `product` VALUES ('147', '22', '白', '68');
INSERT INTO `product` VALUES ('148', '23', '黑', '453');
INSERT INTO `product` VALUES ('149', '24', '黑', '40');
INSERT INTO `product` VALUES ('150', '24', '白', '70');

-- ----------------------------
-- Table structure for property
-- ----------------------------
DROP TABLE IF EXISTS `property`;
CREATE TABLE `property` (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT,
  `category` enum('品牌','材质','款式') NOT NULL,
  `description` varchar(30) NOT NULL,
  PRIMARY KEY (`pro_id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of property
-- ----------------------------
INSERT INTO `property` VALUES ('1', '品牌', '芬迪');
INSERT INTO `property` VALUES ('2', '品牌', '古琦');
INSERT INTO `property` VALUES ('3', '品牌', '巴宝莉');
INSERT INTO `property` VALUES ('4', '品牌', '安娜苏');
INSERT INTO `property` VALUES ('5', '品牌', '宝格丽');
INSERT INTO `property` VALUES ('6', '品牌', '香奈儿');
INSERT INTO `property` VALUES ('7', '品牌', '卡尔文•克莱恩');
INSERT INTO `property` VALUES ('8', '品牌', '川久保玲');
INSERT INTO `property` VALUES ('9', '品牌', '迪奥');
INSERT INTO `property` VALUES ('10', '品牌', '登喜路');
INSERT INTO `property` VALUES ('11', '品牌', '纪梵希');
INSERT INTO `property` VALUES ('12', '品牌', '戈雅');
INSERT INTO `property` VALUES ('13', '品牌', '爱马仕');
INSERT INTO `property` VALUES ('14', '材质', '鳄鱼皮');
INSERT INTO `property` VALUES ('15', '材质', '帆布');
INSERT INTO `property` VALUES ('16', '材质', '公牛皮');
INSERT INTO `property` VALUES ('17', '材质', '浣熊皮草');
INSERT INTO `property` VALUES ('18', '材质', '棉');
INSERT INTO `property` VALUES ('19', '材质', '尼龙');
INSERT INTO `property` VALUES ('20', '材质', '蛇皮');
INSERT INTO `property` VALUES ('21', '材质', '羊毛');
INSERT INTO `property` VALUES ('22', '材质', '漆皮');
INSERT INTO `property` VALUES ('23', '材质', '其他纤维');
INSERT INTO `property` VALUES ('24', '款式', '单肩包');
INSERT INTO `property` VALUES ('25', '款式', '双肩包');
INSERT INTO `property` VALUES ('26', '款式', '手拿包');
INSERT INTO `property` VALUES ('27', '款式', '手提包');
INSERT INTO `property` VALUES ('28', '款式', '斜挎包');
INSERT INTO `property` VALUES ('29', '款式', '电脑包');
INSERT INTO `property` VALUES ('30', '款式', '箱包');
INSERT INTO `property` VALUES ('31', '款式', '腰包');

-- ----------------------------
-- Table structure for ship_information
-- ----------------------------
DROP TABLE IF EXISTS `ship_information`;
CREATE TABLE `ship_information` (
  `ship_inf_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `receiver` varchar(30) NOT NULL,
  `mobile` varchar(30) NOT NULL,
  `address_province` varchar(45) DEFAULT NULL,
  `address_city` varchar(45) DEFAULT NULL,
  `address_district` varchar(45) DEFAULT NULL,
  `address_detail` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ship_inf_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `ship_information_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ship_information
-- ----------------------------
INSERT INTO `ship_information` VALUES ('3', '4', '郝俊楠', '18819466128', '广东', '广州', '番禺', '大学城C10');
INSERT INTO `ship_information` VALUES ('4', '4', 'Koche', '18888855565', '广东', '广州', '番禺', '大学城');
INSERT INTO `ship_information` VALUES ('5', '6', '哈哈', '12345678910', '滴滴', '滴滴', '滴滴', '滴滴');
INSERT INTO `ship_information` VALUES ('6', '7', 'fsdf', '17188808800', 'sdfsd', 'sdf', 'sdf', 'sdfsdf');
INSERT INTO `ship_information` VALUES ('10', '4', 'Jonas', '18859888588', 'dd', 'dd', 'dd', 'ddd');
INSERT INTO `ship_information` VALUES ('11', '4', '葛星辰', '17188808800', 'GD', 'GZ', 'PY', 'DXC');
INSERT INTO `ship_information` VALUES ('12', '4', 'Jonas', '17070185559', 'GD', 'GZ', 'PY', 'DXC');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `realname` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `img` text,
  `score` int(11) NOT NULL DEFAULT '0',
  `def_ship_inf_id` int(11) DEFAULT NULL,
  `user_group` enum('product_admin','order_admin','r','cu','ag','au','d') NOT NULL DEFAULT 'r',
  `is_activate` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  KEY `def_ship_inf_id` (`def_ship_inf_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`def_ship_inf_id`) REFERENCES `ship_information` (`ship_inf_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('3', 'ccccc', '67c762276bced09ee4df0ed537d164ea', 'cc', '838950628@qq.com', '/img/avatar/default-avatar-knives-ninja.png', '0', null, 'product_admin', '0');
INSERT INTO `user` VALUES ('4', 'koche', '38a7ef79ac459890158476920be5abca', 'Koche', 'imkoche@gmail.com', '/img/avatar/default-avatar-business-bear.png', '39090', '11', 'ag', '1');
INSERT INTO `user` VALUES ('5', 'Jonas', '38a7ef79ac459890158476920be5abca', '郝俊楠', 'imkoche@outlook.com', '/img/avatar/default-avatar-knives-ninja.png', '0', null, 'r', '0');
INSERT INTO `user` VALUES ('6', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '嘉璇', '411596239@qq.com', '/img/avatar/halloween-black-cat.png', '12995', '5', 'd', '0');
INSERT INTO `user` VALUES ('7', 'Vincent', 'e10adc3949ba59abbe56e057f20f883e', 'gxc', '707119577@qq.com', '/img/avatar/default-avatar-ginger-guy.png', '0', '6', 'r', '0');

-- ----------------------------
-- Table structure for user_priced_record
-- ----------------------------
DROP TABLE IF EXISTS `user_priced_record`;
CREATE TABLE `user_priced_record` (
  `user_priced_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `priced_id` int(11) NOT NULL,
  `record_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_priced_id`),
  KEY `priced_id` (`priced_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_priced_record_ibfk_1` FOREIGN KEY (`priced_id`) REFERENCES `priced` (`priced_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_priced_record_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_priced_record
-- ----------------------------
INSERT INTO `user_priced_record` VALUES ('17', '3', '6', '2016-07-12 16:21:36');
INSERT INTO `user_priced_record` VALUES ('18', '3', '6', '2016-07-12 16:52:22');
INSERT INTO `user_priced_record` VALUES ('19', '5', '14', '2016-07-12 19:55:00');
INSERT INTO `user_priced_record` VALUES ('20', '5', '7', '2016-07-12 19:56:36');
INSERT INTO `user_priced_record` VALUES ('21', '5', '7', '2016-07-12 20:00:14');
INSERT INTO `user_priced_record` VALUES ('22', '5', '7', '2016-07-12 20:00:30');
INSERT INTO `user_priced_record` VALUES ('23', '5', '7', '2016-07-12 20:00:55');
INSERT INTO `user_priced_record` VALUES ('24', '4', '7', '2016-07-12 20:11:43');
INSERT INTO `user_priced_record` VALUES ('25', '4', '6', '2016-07-12 20:46:02');
INSERT INTO `user_priced_record` VALUES ('26', '4', '6', '2016-07-12 20:46:22');
INSERT INTO `user_priced_record` VALUES ('27', '4', '6', '2016-07-12 20:47:17');
INSERT INTO `user_priced_record` VALUES ('28', '4', '6', '2016-07-12 20:51:22');
INSERT INTO `user_priced_record` VALUES ('29', '4', '7', '2016-07-13 07:43:20');
INSERT INTO `user_priced_record` VALUES ('30', '4', '8', '2016-07-13 07:43:33');
INSERT INTO `user_priced_record` VALUES ('31', '4', '9', '2016-07-13 10:36:47');
INSERT INTO `user_priced_record` VALUES ('32', '4', '11', '2016-07-13 11:01:12');
INSERT INTO `user_priced_record` VALUES ('33', '4', '6', '2016-07-13 14:02:36');
INSERT INTO `user_priced_record` VALUES ('34', '4', '7', '2016-07-13 15:29:13');
INSERT INTO `user_priced_record` VALUES ('35', '4', '15', '2016-07-13 15:36:30');
INSERT INTO `user_priced_record` VALUES ('36', '4', '6', '2016-07-13 15:51:59');
INSERT INTO `user_priced_record` VALUES ('37', '4', '6', '2016-07-13 15:52:21');
INSERT INTO `user_priced_record` VALUES ('38', '6', '6', '2016-07-13 20:12:27');
INSERT INTO `user_priced_record` VALUES ('39', '6', '16', '2016-07-13 20:12:44');
INSERT INTO `user_priced_record` VALUES ('40', '7', '7', '2016-07-13 21:10:00');
INSERT INTO `user_priced_record` VALUES ('41', '7', '7', '2016-07-13 21:38:17');
INSERT INTO `user_priced_record` VALUES ('42', '7', '7', '2016-07-13 21:53:41');
INSERT INTO `user_priced_record` VALUES ('43', '4', '7', '2016-07-13 23:06:08');
INSERT INTO `user_priced_record` VALUES ('44', '4', '6', '2016-07-14 00:39:14');
INSERT INTO `user_priced_record` VALUES ('45', '4', '16', '2016-07-14 00:41:10');
INSERT INTO `user_priced_record` VALUES ('46', '4', '8', '2016-07-14 00:41:49');
INSERT INTO `user_priced_record` VALUES ('47', '4', '8', '2016-07-14 00:42:05');
INSERT INTO `user_priced_record` VALUES ('48', '4', '10', '2016-07-14 00:44:28');
INSERT INTO `user_priced_record` VALUES ('49', '4', '16', '2016-07-14 00:44:45');
INSERT INTO `user_priced_record` VALUES ('50', '4', '8', '2016-07-14 00:46:27');
INSERT INTO `user_priced_record` VALUES ('51', '4', '9', '2016-07-14 00:48:26');
INSERT INTO `user_priced_record` VALUES ('52', '4', '9', '2016-07-14 11:27:19');
INSERT INTO `user_priced_record` VALUES ('53', '4', '9', '2016-07-14 11:27:24');
INSERT INTO `user_priced_record` VALUES ('54', '4', '8', '2016-07-14 11:28:08');
INSERT INTO `user_priced_record` VALUES ('55', '4', '8', '2016-07-14 11:28:19');
INSERT INTO `user_priced_record` VALUES ('56', '4', '8', '2016-07-14 11:28:31');
INSERT INTO `user_priced_record` VALUES ('57', '4', '7', '2016-07-14 13:01:28');
INSERT INTO `user_priced_record` VALUES ('58', '4', '16', '2016-07-14 13:03:18');
INSERT INTO `user_priced_record` VALUES ('59', '4', '6', '2016-07-14 13:59:45');
INSERT INTO `user_priced_record` VALUES ('60', '4', '11', '2016-07-14 14:00:04');
INSERT INTO `user_priced_record` VALUES ('61', '4', '11', '2016-07-14 14:00:29');
INSERT INTO `user_priced_record` VALUES ('62', '4', '11', '2016-07-14 14:00:38');
INSERT INTO `user_priced_record` VALUES ('63', '4', '8', '2016-07-14 18:38:22');
INSERT INTO `user_priced_record` VALUES ('64', '4', '6', '2016-07-15 08:29:30');
INSERT INTO `user_priced_record` VALUES ('65', '4', '6', '2016-07-15 08:35:43');
INSERT INTO `user_priced_record` VALUES ('66', '4', '6', '2016-07-15 08:38:03');
INSERT INTO `user_priced_record` VALUES ('67', '4', '16', '2016-07-15 10:58:42');
INSERT INTO `user_priced_record` VALUES ('68', '4', '9', '2016-07-16 09:57:51');
INSERT INTO `user_priced_record` VALUES ('69', '4', '12', '2016-07-16 09:58:16');
SET FOREIGN_KEY_CHECKS=1;
