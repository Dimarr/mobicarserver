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
-- Table structure for table `sellers`
--

DROP TABLE IF EXISTS `sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sellers` (
  `sellerid` int(11) NOT NULL AUTO_INCREMENT,
  `spid` int(11) DEFAULT NULL,
  `seller_person_business_type` int(11) DEFAULT NULL,
  `seller_birthdate` varchar(10) DEFAULT NULL,
  `seller_social_id_issued` varchar(10) DEFAULT NULL,
  `seller_address_street` varchar(50) DEFAULT NULL,
  `seller_address_street_number` int(11) DEFAULT NULL,
  `seller_address_country` varchar(20) DEFAULT NULL,
  `seller_site_url` varchar(100) DEFAULT NULL,
  `sellerscol` varchar(45) DEFAULT NULL,
  `seller_last_name` varchar(20) DEFAULT NULL,
  `seller_merchant_name` varchar(45) DEFAULT NULL,
  `seller_gender` int(11) DEFAULT NULL,
  `seller_inc` int(11) DEFAULT NULL,
  `file_social_id` varchar(200) DEFAULT NULL,
  `file_cheque` varchar(200) DEFAULT NULL,
  `file_corporate` varchar(200) DEFAULT NULL,
  `seller_address_city` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`sellerid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellers`
--

LOCK TABLES `sellers` WRITE;
/*!40000 ALTER TABLE `sellers` DISABLE KEYS */;
INSERT INTO `sellers` VALUES (2,23,2000,'1987-02-24','2012-05-31','Street 1',10,'IL','test.com',NULL,'Isek','Some ',0,2,'http://rrr.com','http://rr./com','http://rrr.com',NULL),(7,67,2000,'1989-05-06','2000-01-01','Rothschild ',1,'IL','www.babyducks.com',NULL,'b','BABy',0,2,' http://www.brainpop.co.il/category_9/subcategory_150/subjects_5148/screenshot2.png','http://cdn2-www.dogtime.com/assets/uploads/gallery/25-dog-memes/04_funny-dog-meme.jpg','http://www.mattsbits.co.uk/user_media/uploaded_media/hsbc_example_output.png','telaviv'),(8,68,2000,'1960-01-01','1980-01-01','Rothschild',2,'IL','www.babyducks.com',NULL,'bm','BABy',0,2,' http://www.brainpop.co.il/category_9/subcategory_150/subjects_5148/screenshot2.png','http://cdn2-www.dogtime.com/assets/uploads/gallery/25-dog-memes/04_funny-dog-meme.jpg','http://www.mattsbits.co.uk/user_media/uploaded_media/hsbc_example_output.png','haifa');
/*!40000 ALTER TABLE `sellers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-03 13:44:46
