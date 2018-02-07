CREATE DATABASE  IF NOT EXISTS `mobi1` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `mobi1`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: mobi1.caqm9reiespt.us-east-1.rds.amazonaws.com    Database: mobi1
-- ------------------------------------------------------
-- Server version	5.6.27-log

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
-- Table structure for table `pointcatalog`
--

DROP TABLE IF EXISTS `pointcatalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pointcatalog` (
  `RowID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupName` varchar(25) NOT NULL,
  `OptionID` int(11) NOT NULL,
  `Optionname` varchar(25) NOT NULL,
  `Point` int(11) NOT NULL,
  `Comment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`RowID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COMMENT='Catalog of options for point calculation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pointcatalog`
--

LOCK TABLES `pointcatalog` WRITE;
/*!40000 ALTER TABLE `pointcatalog` DISABLE KEYS */;
INSERT INTO `pointcatalog` VALUES (7,'Location',11,'Simple location',15,' SP mentioned during registration that he is available between specific hours'),(8,'Location',12,'Underground',0,'No available'),(9,'Location',13,'Off the road',0,NULL),(10,'Diploma',21,'Yes',20,'Certificate'),(11,'Diploma',22,'No',10,'No Certificate');
/*!40000 ALTER TABLE `pointcatalog` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-07 17:51:15
