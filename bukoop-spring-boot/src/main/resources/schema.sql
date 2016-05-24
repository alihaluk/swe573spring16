CREATE DATABASE  IF NOT EXISTS `bukoop` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bukoop`;
-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: localhost    Database: bukoop
-- ------------------------------------------------------
-- Server version	5.7.10

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
-- Table structure for table `MEMBER`
--

DROP TABLE IF EXISTS `MEMBER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MEMBER` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Code` varchar(50) NOT NULL,
  `Mail` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MEMBER`
--

LOCK TABLES `MEMBER` WRITE;
/*!40000 ALTER TABLE `MEMBER` DISABLE KEYS */;
INSERT INTO `MEMBER` VALUES (1,'Suzan Üsküdarlı','M001','Suzan@boun.edu.tr');
/*!40000 ALTER TABLE `MEMBER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCER`
--

DROP TABLE IF EXISTS `PRODUCER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCER` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL,
  `Latitude` double DEFAULT NULL,
  `Longitude` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCER`
--

LOCK TABLES `PRODUCER` WRITE;
/*!40000 ALTER TABLE `PRODUCER` DISABLE KEYS */;
INSERT INTO `PRODUCER` VALUES (1,'Ali Usta','Domates salçasında bir dünya markası','Tekirdağ',NULL,NULL);
/*!40000 ALTER TABLE `PRODUCER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT`
--

DROP TABLE IF EXISTS `PRODUCT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCT` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Code` varchar(45) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `ProductGroupID` int(11) DEFAULT NULL,
  `ProducerID` int(11) DEFAULT NULL,
  `Origin` varchar(255) DEFAULT NULL,
  `Stock` int(11) DEFAULT NULL,
  `ProductionType` int(11) DEFAULT NULL,
  `PackagingType` int(11) DEFAULT NULL,
  `Barcode` varchar(255) DEFAULT NULL,
  `UnitID` int(11) DEFAULT NULL,
  `Price` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK_unit_id_idx` (`UnitID`),
  KEY `FK_producer_id_idx` (`ProducerID`),
  KEY `FK_productgroup_id_idx` (`ProductGroupID`),
  CONSTRAINT `FK_producer_id` FOREIGN KEY (`ProducerID`) REFERENCES `PRODUCER` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_productgroup_id` FOREIGN KEY (`ProductGroupID`) REFERENCES `PRODUCT_GROUP` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_unit_id` FOREIGN KEY (`UnitID`) REFERENCES `UNIT` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT`
--

LOCK TABLES `PRODUCT` WRITE;
/*!40000 ALTER TABLE `PRODUCT` DISABLE KEYS */;
INSERT INTO `PRODUCT` VALUES (1,'SALCA001','Kahvaltılık Salça',1,1,'Tekirdağ',1000,1,1,NULL,1,22),(2,'SALCA002','Biber Salçası',1,1,'Tekirdağ',1000,1,1,NULL,1,24),(3,'PEY001','Edirne Peyniri',2,1,'Edirne',1000,1,1,NULL,2,18.5);
/*!40000 ALTER TABLE `PRODUCT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCT_GROUP`
--

DROP TABLE IF EXISTS `PRODUCT_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCT_GROUP` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCT_GROUP`
--

LOCK TABLES `PRODUCT_GROUP` WRITE;
/*!40000 ALTER TABLE `PRODUCT_GROUP` DISABLE KEYS */;
INSERT INTO `PRODUCT_GROUP` VALUES (1,'Salça'),(2,'Peynir');
/*!40000 ALTER TABLE `PRODUCT_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SALE_DETAILS`
--

DROP TABLE IF EXISTS `SALE_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SALE_DETAILS` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SalesListID` int(11) DEFAULT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `UnitID` int(11) DEFAULT NULL,
  `SelectedUnit` varchar(45) NOT NULL,
  `Amount` double NOT NULL,
  `ProductPrice` double NOT NULL,
  `TotalCost` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK_SD_unit_id_idx` (`UnitID`),
  KEY `FK_SD_product_id_idx` (`ProductID`),
  KEY `FK_SD_salelist_id_idx` (`SalesListID`),
  CONSTRAINT `FK_SD_product_id` FOREIGN KEY (`ProductID`) REFERENCES `PRODUCT` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SD_salelist_id` FOREIGN KEY (`SalesListID`) REFERENCES `SALE_LIST` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SD_unit_id` FOREIGN KEY (`UnitID`) REFERENCES `UNIT` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SALE_DETAILS`
--

LOCK TABLES `SALE_DETAILS` WRITE;
/*!40000 ALTER TABLE `SALE_DETAILS` DISABLE KEYS */;
INSERT INTO `SALE_DETAILS` VALUES (1,38,1,1,'Adet',2,22,44),(2,38,2,1,'Adet',3,24,72),(3,39,1,1,'Adet',1,22,22),(4,39,2,1,'Adet',2,24,48),(5,39,3,2,'Kg',3,18.5,55.5),(6,40,1,1,'Adet',77,22,1694),(7,41,2,1,'Adet',88,24,2112),(8,41,3,2,'Kg',99,18.5,1831.5);
/*!40000 ALTER TABLE `SALE_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SALE_LIST`
--

DROP TABLE IF EXISTS `SALE_LIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SALE_LIST` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `MemberID` int(11) DEFAULT NULL,
  `DiscountPer` double DEFAULT NULL,
  `TotalCost` double NOT NULL,
  `TotalDiscount` double DEFAULT NULL,
  `NetCost` double NOT NULL,
  `DetailCount` int(11) NOT NULL,
  `SaleDate` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK_member_id_idx` (`MemberID`),
  CONSTRAINT `FK_member_id` FOREIGN KEY (`MemberID`) REFERENCES `MEMBER` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SALE_LIST`
--

LOCK TABLES `SALE_LIST` WRITE;
/*!40000 ALTER TABLE `SALE_LIST` DISABLE KEYS */;
INSERT INTO `SALE_LIST` VALUES (3,1,0,111,0,111,1,'2016-05-24T03:49:12.492Z'),(4,1,0,92.5,0,92.5,1,'2016-05-24T03:51:47.954Z'),(5,1,0,46.25,0,46.25,1,'2016-05-24T03:54:09.942Z'),(6,1,0,46.25,0,46.25,1,'2016-05-24T03:55:20.087Z'),(7,1,0,96,0,96,1,'2016-05-24T03:56:59.334Z'),(8,1,0,118,0,118,2,'2016-05-24T03:57:30.361Z'),(9,1,0,206,0,206,2,'2016-05-24T04:00:16.560Z'),(10,1,0,114,0,114,2,'2016-05-24T04:04:42.870Z'),(11,1,0,112,0,112,2,'2016-05-24T04:06:53.175Z'),(12,1,0,164,0,164,2,'2016-05-24T04:09:38.292Z'),(13,1,0,114,0,114,2,'2016-05-24T04:14:53.330Z'),(14,1,0,55.5,0,55.5,1,'2016-05-24T04:17:24.284Z'),(15,1,0,55.5,0,55.5,1,'2016-05-24T04:17:32.275Z'),(16,1,0,158,0,158,2,'2016-05-24T04:27:40.933Z'),(17,1,0,158,0,158,2,'2016-05-24T04:30:28.760Z'),(18,1,0,116,0,116,2,'2016-05-24T04:35:23.725Z'),(19,1,0,116,0,116,2,'2016-05-24T04:47:23.372Z'),(20,1,0,116,0,116,2,'2016-05-24T05:13:23.814Z'),(21,1,0,208,0,208,2,'2016-05-24T05:16:57.440Z'),(22,1,0,175.5,0,175.5,2,'2016-05-24T06:34:19.237Z'),(23,1,0,199,0,199,2,'2016-05-24T06:38:00.942Z'),(24,1,0,144,0,144,1,'2016-05-24T06:46:31.454Z'),(25,1,0,37,0,37,1,'2016-05-24T06:47:01.427Z'),(26,1,0,176,0,176,1,'2016-05-24T06:47:19.160Z'),(27,1,0,138.5,0,138.5,2,'2016-05-24T06:48:02.717Z'),(28,1,0,182,0,182,2,'2016-05-24T06:56:44.524Z'),(29,1,0,68,0,68,2,'2016-05-24T07:23:19.864Z'),(30,1,0,116,0,116,2,'2016-05-24T07:27:23.414Z'),(31,1,0,110,0,110,1,'2016-05-24T08:01:53.862Z'),(32,1,0,324,0,324,3,'2016-05-24T08:02:12.936Z'),(33,1,0,190,0,190,3,'2016-05-24T08:11:08.816Z'),(34,1,0,190,0,190,3,'2016-05-24T08:12:16.360Z'),(35,1,0,72,0,72,1,'2016-05-24T08:12:33.006Z'),(36,1,0,190,0,190,3,'2016-05-24T08:14:10.383Z'),(37,1,0,190,0,190,3,'2016-05-24T08:15:54.797Z'),(38,1,0,190,0,190,3,'2016-05-24T08:18:04.781Z'),(39,1,0,125.5,0,125.5,3,'2016-05-24T08:19:52.574Z'),(40,1,0,1694,0,1694,1,'2016-05-24T08:20:15.025Z'),(41,1,0,3943.5,0,3943.5,2,'2016-05-24T08:20:35.802Z');
/*!40000 ALTER TABLE `SALE_LIST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UNIT`
--

DROP TABLE IF EXISTS `UNIT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UNIT` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `IsFloat` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UNIT`
--

LOCK TABLES `UNIT` WRITE;
/*!40000 ALTER TABLE `UNIT` DISABLE KEYS */;
INSERT INTO `UNIT` VALUES (1,'Adet',0),(2,'Kg',1);
/*!40000 ALTER TABLE `UNIT` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-24 11:28:15
