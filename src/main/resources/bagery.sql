CREATE DATABASE  IF NOT EXISTS `bagery` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bagery`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: bagery
-- ------------------------------------------------------
-- Server version	5.7.11-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cartitem`
--

DROP TABLE IF EXISTS `cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartitem` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `total_priced` decimal(10,0) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `product_id` (`product_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `cartitem_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cartitem_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartitem`
--

LOCK TABLES `cartitem` WRITE;
/*!40000 ALTER TABLE `cartitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favoriteitem`
--

DROP TABLE IF EXISTS `favoriteitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favoriteitem` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `priced_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `priced_id` (`priced_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `favoriteitem_ibfk_1` FOREIGN KEY (`priced_id`) REFERENCES `priced` (`priced_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `favoriteitem_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favoriteitem`
--

LOCK TABLES `favoriteitem` WRITE;
/*!40000 ALTER TABLE `favoriteitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `favoriteitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderitem` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `product_title` varchar(50) NOT NULL,
  `num` int(11) NOT NULL,
  `total_priced` decimal(10,0) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ship_inf_id` int(11) NOT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `instruction` text,
  `order_status` enum('unpaid','unshipped','shipped','completed','canceled') NOT NULL DEFAULT 'unpaid',
  `courier_number` varchar(50) DEFAULT NULL,
  `courier_company` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priced`
--

DROP TABLE IF EXISTS `priced`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priced` (
  `priced_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `img` text,
  `description` text,
  `is_existed` tinyint(4) NOT NULL DEFAULT '1',
  `unit_price` decimal(10,0) NOT NULL,
  `sale_price` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`priced_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priced`
--

LOCK TABLES `priced` WRITE;
/*!40000 ALTER TABLE `priced` DISABLE KEYS */;
INSERT INTO `priced` VALUES (6,'格纹单肩包','http://cdn-images.farfetch.com/11/27/79/76/11277976_6530203_1000.jpg','Burberry 黑色 全棉 格纹单肩包。 顶置拉链, 金色铁链肩带, 内置一个主要分层。',1,1100,1000),(7,'格纹背包','http://cdn-images.farfetch.com/11/40/64/79/11406479_7120753_480.jpg','Burberry 褐色 小牛皮黄麻棉质 格纹背包。',1,920,900),(8,'\'House check\'斜挎包','http://cdn-images.farfetch.com/11/24/97/30/11249730_6056108_480.jpg','Burberry 靛蓝色 牛皮与全棉 \'House check\'斜挎包。 顶置拉链, 可拆卸肩带, 内置多个卡槽, 内置一个主要分层。',1,615,600),(9,'\'Bow Cut\'迷你斜挎包','http://cdn-images.farfetch.com/11/50/10/07/11501007_7138932_480.jpg','Givenchy 黑色 小牛皮 \'Bow Cut\'迷你斜挎包。 搭链肩带, 银色五金配件, 正中有品牌标记, 翻盖饰有摁扣, 内置贴袋, 内置拉链口袋, 内置标牌。',1,2554,2500),(10,'\'Shark\'中号手提包','http://cdn-images.farfetch.com/11/50/10/09/11501009_7141974_1000.jpg','Givenchy 黑色 小牛皮 \'Shark\'中号手提包。 顶部有弧状手柄, 可拆卸可调肩带, 正中有品牌标记, 银色五金配件, 顶部饰有翻盖, 旋扣, 脚钉, 内置拉链口袋, 内置贴袋, 内置标牌。',1,2554,2554),(11,'I Feel Love手拿包','http://cdn-images.farfetch.com/11/33/82/06/11338206_6370025_1000.jpg','Givenchy 黑色 小牛皮 I Feel Love手拿包。 顶置拉链, 内置标贴。',1,765,765),(12,'\'Pandora Box\'迷你单肩包','http://cdn-images.farfetch.com/11/23/23/22/11232322_5906078_480.jpg','Givenchy 红色 小牛皮 \'Pandora Box\'迷你单肩包。 翻盖饰有插入式的摁扣, 正面标志贴, 正面拉链口袋, 可调肩带, 绒面皮衬里, 内置拉链口袋。',1,2136,2100),(13,'\'Bow-Cut\'迷你斜挎包','http://cdn-images.farfetch.com/11/50/48/78/11504878_7225214_1000.jpg','Givenchy 黑色 小牛皮 \'Bow-Cut\'迷你斜挎包。 搭链肩带, 银色五金配件, 正中有品牌标记, 翻盖饰有摁扣, 内置拉链口袋, 内置标贴。',1,2152,2100),(14,'\'Dotcom\'手提包','http://cdn-images.farfetch.com/11/52/21/58/11522158_7302326_1000.jpg','Fendi 红色 小牛皮 \'Dotcom\'手提包。 正中有品牌标记, 顶部有一个手柄, 可拆卸肩带。',1,2743,2740),(15,'\'3Jours\'迷你斜挎包','http://cdn-images.farfetch.com/11/48/19/07/11481907_7019209_1000.jpg','Fendi 灰色 小羊皮与小牛皮 \'3Jours\'迷你斜挎包。 顶部有弧状手柄, 对比滚边, 可拆卸吊牌, 可拆卸可调肩带, 银色五金配件, 顶置拉链。',1,2589,2506);
/*!40000 ALTER TABLE `priced` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priced_pro`
--

DROP TABLE IF EXISTS `priced_pro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `priced_pro` (
  `pp_id` int(11) NOT NULL AUTO_INCREMENT,
  `priced_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  PRIMARY KEY (`pp_id`),
  KEY `priced_id` (`priced_id`),
  KEY `pro_id` (`pro_id`),
  CONSTRAINT `priced_pro_ibfk_1` FOREIGN KEY (`priced_id`) REFERENCES `priced` (`priced_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `priced_pro_ibfk_2` FOREIGN KEY (`pro_id`) REFERENCES `property` (`pro_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=337 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priced_pro`
--

LOCK TABLES `priced_pro` WRITE;
/*!40000 ALTER TABLE `priced_pro` DISABLE KEYS */;
INSERT INTO `priced_pro` VALUES (307,6,3),(308,6,18),(309,6,24),(310,7,3),(311,7,18),(312,7,25),(313,8,3),(314,8,18),(315,8,28),(316,9,11),(317,9,16),(318,9,28),(319,10,11),(320,10,16),(321,10,27),(322,11,11),(323,11,16),(324,11,26),(325,12,11),(326,12,16),(327,12,24),(328,13,11),(329,13,16),(330,13,28),(331,14,1),(332,14,16),(333,14,27),(334,15,1),(335,15,16),(336,15,28);
/*!40000 ALTER TABLE `priced_pro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `priced_id` int(11) NOT NULL,
  `color` varchar(30) NOT NULL,
  `stock` int(11) NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `color_duplicate` (`priced_id`,`color`),
  KEY `priced_id` (`priced_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`priced_id`) REFERENCES `priced` (`priced_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (129,6,'黑',50),(130,7,'褐',50),(131,8,'靛蓝',50),(132,9,'黑',50),(133,10,'黑',50),(134,11,'黑',50),(135,12,'红',50),(136,13,'黑',50),(137,14,'红',50),(138,15,'灰',50);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property`
--

DROP TABLE IF EXISTS `property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `property` (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT,
  `category` enum('品牌','材质','款式') NOT NULL,
  `description` varchar(30) NOT NULL,
  PRIMARY KEY (`pro_id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property`
--

LOCK TABLES `property` WRITE;
/*!40000 ALTER TABLE `property` DISABLE KEYS */;
INSERT INTO `property` VALUES (1,'品牌','芬迪'),(2,'品牌','古琦'),(3,'品牌','巴宝莉'),(4,'品牌','安娜苏'),(5,'品牌','宝格丽'),(6,'品牌','香奈儿'),(7,'品牌','卡尔文•克莱恩'),(8,'品牌','川久保玲'),(9,'品牌','迪奥'),(10,'品牌','登喜路'),(11,'品牌','纪梵希'),(12,'品牌','戈雅'),(13,'品牌','爱马仕'),(14,'材质','鳄鱼皮'),(15,'材质','帆布'),(16,'材质','公牛皮'),(17,'材质','浣熊皮草'),(18,'材质','棉'),(19,'材质','尼龙'),(20,'材质','蛇皮'),(21,'材质','羊毛'),(22,'材质','漆皮'),(23,'材质','其他纤维'),(24,'款式','单肩包'),(25,'款式','双肩包'),(26,'款式','手拿包'),(27,'款式','手提包'),(28,'款式','斜挎包'),(29,'款式','电脑包'),(30,'款式','箱包'),(31,'款式','腰包');
/*!40000 ALTER TABLE `property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ship_information`
--

DROP TABLE IF EXISTS `ship_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ship_information` (
  `ship_inf_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `receicer` varchar(30) NOT NULL,
  `mobile` varchar(30) NOT NULL,
  `address_province` varchar(45) DEFAULT NULL,
  `address_city` varchar(45) DEFAULT NULL,
  `address_district` varchar(45) DEFAULT NULL,
  `address_detail` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ship_inf_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `ship_information_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ship_information`
--

LOCK TABLES `ship_information` WRITE;
/*!40000 ALTER TABLE `ship_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `ship_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (3,'ccccc','67c762276bced09ee4df0ed537d164ea','cc','838950628@qq.com','/img/avatar/default-avatar-knives-ninja.png',0,NULL,'product_admin',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_priced_record`
--

DROP TABLE IF EXISTS `user_priced_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_priced_record`
--

LOCK TABLES `user_priced_record` WRITE;
/*!40000 ALTER TABLE `user_priced_record` DISABLE KEYS */;
INSERT INTO `user_priced_record` VALUES (17,3,6,'2016-07-12 08:21:36'),(18,3,6,'2016-07-12 08:52:22');
/*!40000 ALTER TABLE `user_priced_record` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-12 19:27:14
