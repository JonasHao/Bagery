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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartitem`
--

LOCK TABLES `cartitem` WRITE;
/*!40000 ALTER TABLE `cartitem` DISABLE KEYS */;
INSERT INTO `cartitem` VALUES (1,1,5,NULL,1);
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
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `user_id` (`user_id`),
  KEY `priced_id` (`priced_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`priced_id`) REFERENCES `priced` (`priced_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
INSERT INTO `favoriteitem` VALUES (1,1,1);
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
  `product_id` int(11) NOT NULL,
  `product_title` varchar(50) NOT NULL,
  `num` int(11) NOT NULL,
  `total_priced` decimal(10,0) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `user_id` int(11) NOT NULL,
  `ship_inf_id` int(11) NOT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `instruction` text,
  `order_status` enum('unpaid','unshipped','shipped','completed','canceled') NOT NULL DEFAULT 'unpaid',
  `courier_number` varchar(50) DEFAULT NULL,
  `courier_company` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `unit_price` decimal(10,0) NOT NULL,
  `sale_price` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`priced_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priced`
--

LOCK TABLES `priced` WRITE;
/*!40000 ALTER TABLE `priced` DISABLE KEYS */;
INSERT INTO `priced` VALUES (1,'帆布包',NULL,'这是一个帆布包的详细信息',10,NULL);
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
  CONSTRAINT `priced_pro_ibfk_2` FOREIGN KEY (`pro_id`) REFERENCES `propertity` (`pro_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priced_pro`
--

LOCK TABLES `priced_pro` WRITE;
/*!40000 ALTER TABLE `priced_pro` DISABLE KEYS */;
INSERT INTO `priced_pro` VALUES (1,1,1);
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
  UNIQUE KEY `color` (`color`),
  KEY `priced_id` (`priced_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`priced_id`) REFERENCES `priced` (`priced_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,'红',100),(2,1,'蓝',50);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propertity`
--

DROP TABLE IF EXISTS `propertity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propertity` (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT,
  `category` enum('品牌','材质','款式') NOT NULL,
  `description` varchar(30) NOT NULL,
  PRIMARY KEY (`pro_id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propertity`
--

LOCK TABLES `propertity` WRITE;
/*!40000 ALTER TABLE `propertity` DISABLE KEYS */;
INSERT INTO `propertity` VALUES (1,'品牌','A品牌'),(2,'品牌','B品牌'),(3,'材质','A材质');
/*!40000 ALTER TABLE `propertity` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ship_information`
--

LOCK TABLES `ship_information` WRITE;
/*!40000 ALTER TABLE `ship_information` DISABLE KEYS */;
INSERT INTO `ship_information` VALUES (1,1,'cc','110','广东','广州','天河','华南理工大学');
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
  `is_activate` tinyint(1) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'cc','cc','ccc','cc@qq.com',NULL,100,1,'r',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_priced_record`
--

LOCK TABLES `user_priced_record` WRITE;
/*!40000 ALTER TABLE `user_priced_record` DISABLE KEYS */;
INSERT INTO `user_priced_record` VALUES (1,1,1,'2016-06-28 08:28:44');
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

-- Dump completed on 2016-06-28 18:30:39
