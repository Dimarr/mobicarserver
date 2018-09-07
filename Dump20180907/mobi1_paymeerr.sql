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
-- Table structure for table `paymeerr`
--

DROP TABLE IF EXISTS `paymeerr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymeerr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `masterpaymesale` varchar(45) DEFAULT NULL,
  `errtext` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymeerr`
--

LOCK TABLES `paymeerr` WRITE;
/*!40000 ALTER TABLE `paymeerr` DISABLE KEYS */;
INSERT INTO `paymeerr` VALUES (2,'SALE1535-021033YG-VUNRXQRQ-STSELEZ6','Invalid price, out of min-max bounds'),(3,'SALE1535-026371ZN-KGAS7WEX-2VKOJWH2','Invalid price, out of min-max bounds'),(4,'SALE1535-471055QV-VURDGBTA-JZGMNTXW','Invalid price, out of min-max bounds'),(5,'SALE1535-4787878X-CGTO19I5-SVC89GQS','Invalid price, out of min-max bounds'),(6,'SALE1535-520331BQ-WDMGAY3F-LXCFEGXA','Invalid price, out of min-max bounds'),(7,'SALE1535-520331BQ-WDMGAY3F-LXCFEGXA','Invalid price, out of min-max bounds'),(8,'SALE1535-520331BQ-WDMGAY3F-LXCFEGXA','Invalid price, out of min-max bounds'),(9,'SALE1535-522015QG-FVZBBBQN-FRQJALJV','Invalid price, out of min-max bounds'),(10,'SALE1535-522015QG-FVZBBBQN-FRQJALJV','Invalid price, out of min-max bounds'),(11,'SALE1535-524374UJ-DGUER9VB-77PZ84C8','Invalid price, out of min-max bounds'),(12,'SALE1535-524374UJ-DGUER9VB-77PZ84C8','Invalid price, out of min-max bounds'),(13,'SALE1535-524374UJ-DGUER9VB-77PZ84C8','Invalid price, out of min-max bounds'),(14,'SALE1535-524374UJ-DGUER9VB-77PZ84C8','Invalid price, out of min-max bounds'),(15,'SALE1535-524374UJ-DGUER9VB-77PZ84C8','Invalid price, out of min-max bounds'),(16,'SALE1535-524374UJ-DGUER9VB-77PZ84C8','Invalid price, out of min-max bounds'),(17,'SALE1535-524374UJ-DGUER9VB-77PZ84C8','Invalid price, out of min-max bounds'),(18,'SALE1535-524374UJ-DGUER9VB-77PZ84C8','Cannot perform action due to an incorrect status'),(19,'SALE1535-612302Z6-6LRY2XP1-9KXYEQXO','Cannot perform action due to an incorrect status'),(20,'SALE1535-524374UJ-DGUER9VB-77PZ84C8','Cannot perform action due to an incorrect status'),(21,'SALE1535-831003PF-QEX40EQ7-QG9KEB9X','Invalid price, out of min-max bounds'),(22,'SALE1535-832003UI-QKJKXJTS-TQ5YPCMY','Invalid price, out of min-max bounds'),(23,'SALE1535-832003UI-QKJKXJTS-TQ5YPCMY','Invalid price, out of min-max bounds'),(24,'SALE1535-951172LA-DT1QCCQK-QF0W9XWF','Invalid price, out of min-max bounds'),(25,'SALE1535-831003PF-QEX40EQ7-QG9KEB9X','Invalid price, out of min-max bounds'),(26,'SALE1535-9835622X-HP6T05S8-P3BNOAGA','Cannot perform action due to an incorrect status'),(27,'SALE1535-9871750I-QWUM0HWJ-7QBBSDDL','Invalid price, out of min-max bounds'),(28,'SALE1535-999549ZH-IQDP5VED-3ARBUHXU','Invalid price, out of min-max bounds'),(29,'SALE1535-999549ZH-IQDP5VED-3ARBUHXU','Invalid price, out of min-max bounds'),(30,'SALE1536-000135PH-KTW5ILGT-VBX8TDWF','Invalid price, out of min-max bounds'),(31,'SALE1536-000135PH-KTW5ILGT-VBX8TDWF','Invalid price, out of min-max bounds'),(32,'SALE1536-037592CA-KO6VOZSN-K6UT6JWV','Invalid price, out of min-max bounds'),(33,'SALE1536-0385602M-AVJLUTKR-5X7OGXOY','Invalid price, out of min-max bounds'),(34,'SALE1536-050220HK-0K4WCVGK-8XGAJ7FB','Invalid price, out of min-max bounds'),(35,'SALE1536-0512908I-R6TCVFHF-W2OXAYLM','Invalid price, out of min-max bounds'),(36,'SALE1536-136662ZN-2TIWRHGM-ITSHMZ1M','Invalid price, out of min-max bounds'),(37,'SALE1536-263123BJ-2BLCWN64-YJ3LU7KT','Invalid price, out of min-max bounds'),(38,'SALE1536-265759G3-EEJUHKJS-BNBUTJ8B','Invalid price, out of min-max bounds'),(39,'SALE1536-3011024K-1FIRDTYD-OFFKC1OH','Invalid price, out of min-max bounds'),(40,'SALE1536-31932233-IOOPOH2S-NPXGCY5E','Invalid price, out of min-max bounds'),(41,'SALE1536-324675SU-NT0PDZXO-Z2SAXNOW','Invalid price, out of min-max bounds'),(42,'SALE1536-324863YM-IUHUVAXP-XQORHYRS','Invalid price, out of min-max bounds'),(43,'SALE1536-325154U2-NXRYIAT3-LIS8GLKI','Invalid price, out of min-max bounds'),(44,'SALE1536-325667G4-LD93IIQU-XNE1HJVI','Invalid price, out of min-max bounds');
/*!40000 ALTER TABLE `paymeerr` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-07 16:33:12
