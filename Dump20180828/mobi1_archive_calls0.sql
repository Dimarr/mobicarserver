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
-- Table structure for table `archive_calls`
--

DROP TABLE IF EXISTS `archive_calls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archive_calls` (
  `callid` int(11) NOT NULL AUTO_INCREMENT,
  `cdate` datetime NOT NULL,
  `userid` int(11) NOT NULL,
  `spid` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `details` varchar(45) DEFAULT NULL,
  `serviceid` int(11) NOT NULL,
  PRIMARY KEY (`callid`)
) ENGINE=InnoDB AUTO_INCREMENT=1101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archive_calls`
--

LOCK TABLES `archive_calls` WRITE;
/*!40000 ALTER TABLE `archive_calls` DISABLE KEYS */;
INSERT INTO `archive_calls` VALUES (78,'2016-08-21 00:00:00',1,26,4,'Testing 1',1),(79,'2016-08-21 00:00:00',2,26,4,'Testing 2',1),(80,'2016-08-21 00:00:00',3,26,4,'Testing 3',2),(81,'2016-08-25 00:00:00',4,27,4,'Something...',2),(82,'2016-08-25 00:00:00',5,27,4,'Something...',3),(83,'2016-08-25 00:00:00',6,28,4,'Something...',3),(84,'2016-08-26 00:00:00',1,29,4,'Something...',3),(85,'2016-08-26 00:00:00',1,29,4,'Something...',3),(86,'2016-08-29 00:00:00',1,26,5,'Something...',2),(87,'2016-09-03 00:00:00',1,26,6,'Something...',2),(88,'2016-09-04 00:00:00',1,27,7,'New detail',2),(89,'2016-09-05 00:00:00',1,27,7,'23ee',2),(90,'2016-09-05 00:00:00',1,29,8,'urgent call',2),(91,'2016-09-05 00:00:00',1,28,4,'call number 10',2),(92,'2016-09-06 00:00:00',1,28,4,'test',2),(93,'2016-09-06 00:00:00',1,29,4,'bbbb',1),(94,'2016-09-11 00:00:00',1,27,4,'test 2345',1),(95,'2016-09-17 00:00:00',1,26,4,'Real 1',1),(96,'2016-09-17 00:00:00',1,26,4,'Real 2',1),(97,'2016-09-17 00:00:00',1,28,3,'Real3',1),(98,'2016-09-17 00:00:00',1,29,3,'y',1),(99,'2016-09-17 00:00:00',1,27,3,'lll',1),(100,'2016-09-17 00:00:00',1,27,4,'kkkk',3),(101,'2018-01-26 11:01:00',1,26,3,'',6),(102,'2018-01-26 17:01:00',1,26,4,'',6),(103,'2018-01-28 13:01:00',1,26,4,'',7),(104,'2018-01-28 10:01:00',1,26,4,'',6),(105,'2018-01-28 11:01:00',1,26,3,'Rejected by SP',6),(106,'2018-01-28 11:01:00',110,59,3,'some detail',6),(107,'2018-01-28 12:01:00',110,59,3,'some detail',6),(108,'2018-01-28 12:01:00',110,59,3,'some detail',6),(109,'2018-01-28 12:01:00',110,59,3,'some detail',6),(110,'2018-01-28 12:01:00',110,59,3,'some detail',6),(111,'2018-01-28 12:01:00',110,59,3,'some detail',6),(112,'2018-01-28 12:01:00',110,59,3,'some detail',6),(113,'2018-01-28 12:01:00',110,59,3,'some detail',6),(114,'2018-01-28 12:01:00',110,59,3,'some detail',6),(115,'2018-01-28 12:01:00',110,59,3,'some detail',6),(116,'2018-01-28 13:01:00',110,59,3,'some detail',6),(117,'2018-01-28 14:01:00',110,59,3,'some detail',6),(118,'2018-01-28 14:01:00',110,59,3,'some detail',6),(119,'2018-01-28 14:01:00',110,59,3,'some detail',6),(120,'2018-01-28 14:01:00',110,59,3,'some detail',6),(121,'2018-01-28 14:01:00',110,59,3,'some detail',6),(122,'2018-01-28 15:01:00',110,59,3,'some detail',6),(123,'2018-01-28 15:01:00',110,59,3,'some detail',6),(124,'2018-01-28 15:01:00',110,59,3,'some detail',6),(125,'2018-01-28 15:01:00',110,59,3,'some detail',6),(126,'2018-01-28 15:01:00',110,59,3,'some detail',6),(127,'2018-01-28 16:01:00',110,59,3,'some detail',6),(128,'2018-01-28 16:01:00',110,59,3,'some detail',6),(129,'2018-01-28 16:01:00',110,59,3,'some detail',6),(130,'2018-01-28 16:01:00',110,59,3,'some detail',6),(131,'2018-01-28 16:01:00',110,59,3,'some detail',6),(132,'2018-01-28 17:01:00',110,59,3,'some detail',6),(133,'2018-01-28 17:01:00',110,59,3,'some detail',6),(134,'2018-01-28 17:01:00',110,59,3,'some detail',6),(135,'2018-01-28 20:01:00',110,59,3,'some detail',6),(136,'2018-01-28 20:01:00',110,59,3,'some detail',6),(137,'2018-01-28 20:01:00',110,59,3,'some detail',6),(138,'2018-01-28 20:01:00',110,59,3,'some detail',6),(139,'2018-01-28 20:01:00',110,59,3,'some detail',6),(140,'2018-01-28 20:01:00',110,59,3,'some detail',6),(141,'2018-01-28 20:01:00',110,59,3,'some detail',6),(142,'2018-01-28 20:01:00',110,59,3,'some detail',6),(143,'2018-01-28 20:01:00',110,59,3,'some detail',6),(144,'2018-01-28 22:01:00',110,59,3,'some detail',6),(145,'2018-01-28 22:01:00',110,59,3,'some detail',6),(146,'2018-01-28 22:01:00',110,59,3,'some detail',6),(147,'2018-01-28 22:01:00',110,59,3,'some detail',6),(148,'2018-01-28 22:01:00',110,59,3,'some detail',6),(149,'2018-01-28 22:01:00',110,59,3,'some detail',6),(150,'2018-01-28 22:01:00',110,59,3,'some detail',6),(151,'2018-01-28 22:01:00',110,59,3,'some detail',6),(152,'2018-01-28 22:01:00',110,59,3,'some detail',6),(153,'2018-01-28 22:01:00',110,59,3,'some detail',6),(154,'2018-01-29 06:01:00',104,60,3,'some detail',1),(155,'2018-01-29 06:01:00',104,59,3,'some detail',1),(156,'2018-01-29 07:01:00',104,59,3,'some detail',1),(157,'2018-01-29 08:01:00',104,59,3,'some detail',1),(158,'2018-01-29 08:01:00',104,59,3,'some detail',1),(159,'2018-01-29 08:01:00',104,59,3,'some detail',1),(160,'2018-01-29 10:01:00',104,59,3,'some detail',1),(161,'2018-01-29 10:01:00',104,61,3,'some detail',1),(162,'2018-01-29 11:01:00',110,59,3,'some detail',6),(163,'2018-01-29 11:01:00',104,61,3,'some detail',1),(164,'2018-01-29 11:01:00',110,59,3,'some detail',6),(165,'2018-01-29 11:01:00',110,59,3,'some detail',6),(166,'2018-01-29 11:01:00',104,59,3,'some detail',1),(167,'2018-01-29 11:01:00',110,59,3,'some detail',6),(168,'2018-01-29 11:01:00',110,59,3,'some detail',6),(169,'2018-01-29 11:01:00',110,59,3,'some detail',6),(170,'2018-01-29 12:01:00',110,59,3,'some detail',6),(171,'2018-01-29 12:01:00',110,59,3,'some detail',6),(172,'2018-01-29 12:01:00',110,59,3,'some detail',6),(173,'2018-01-29 13:01:00',110,59,3,'some detail',6),(174,'2018-01-29 13:01:00',110,59,3,'some detail',6),(175,'2018-01-29 13:01:00',110,59,3,'some detail',6),(176,'2018-01-29 13:01:00',110,59,3,'some detail',6),(177,'2018-01-29 13:01:00',110,60,3,'some detail',6),(178,'2018-01-29 13:01:00',110,60,3,'some detail',6),(179,'2018-01-29 13:01:00',110,59,3,'some detail',6),(180,'2018-01-29 13:01:00',110,59,3,'some detail',6),(181,'2018-01-29 13:01:00',110,60,3,'some detail',6),(182,'2018-01-29 13:01:00',110,60,3,'some detail',6),(183,'2018-01-29 13:01:00',110,60,3,'some detail',6),(184,'2018-01-29 13:01:00',110,60,3,'some detail',6),(185,'2018-01-29 13:01:00',110,60,3,'some detail',6),(186,'2018-01-29 14:01:00',110,59,3,'some detail',6),(187,'2018-01-29 14:01:00',110,59,3,'some detail',6),(188,'2018-01-29 14:01:00',110,59,3,'some detail',6),(189,'2018-01-29 14:01:00',110,59,3,'some detail',6),(190,'2018-01-29 14:01:00',110,59,3,'some detail',6),(191,'2018-01-29 14:01:00',110,59,3,'some detail',6),(192,'2018-01-29 14:01:00',110,59,3,'some detail',6),(193,'2018-01-29 14:01:00',110,59,3,'some detail',6),(194,'2018-01-29 14:01:00',110,59,3,'some detail',6),(195,'2018-01-29 14:01:00',110,59,3,'some detail',6),(196,'2018-01-29 15:01:00',110,59,3,'some detail',6),(197,'2018-01-29 15:01:00',110,59,3,'some detail',6),(198,'2018-01-29 15:01:00',110,59,3,'some detail',6),(199,'2018-01-29 15:01:00',110,59,3,'some detail',6),(200,'2018-01-29 15:01:00',110,59,3,'some detail',6),(201,'2018-01-29 15:01:00',110,59,3,'some detail',6),(202,'2018-01-29 15:01:00',110,59,3,'some detail',6),(203,'2018-01-29 15:01:00',110,59,3,'some detail',6),(204,'2018-01-29 15:01:00',110,59,3,'some detail',6),(205,'2018-01-29 16:01:00',110,59,3,'some detail',6),(206,'2018-01-29 16:01:00',110,59,3,'some detail',6),(207,'2018-01-29 16:01:00',110,59,3,'some detail',6),(208,'2018-01-29 16:01:00',110,59,3,'some detail',6),(209,'2018-01-29 16:01:00',110,59,3,'some detail',6),(210,'2018-01-29 16:01:00',110,59,3,'some detail',6),(211,'2018-01-29 16:01:00',110,59,3,'some detail',6),(212,'2018-01-29 16:01:00',110,59,3,'some detail',6),(213,'2018-01-29 16:01:00',110,59,3,'some detail',6),(214,'2018-01-29 16:01:00',110,59,3,'some detail',6),(215,'2018-01-29 16:01:00',110,59,3,'some detail',6),(216,'2018-01-29 16:01:00',110,59,3,'some detail',6),(217,'2018-01-29 16:01:00',110,59,3,'some detail',6),(218,'2018-01-29 16:01:00',110,59,3,'some detail',6),(219,'2018-01-29 16:01:00',110,59,3,'some detail',6),(220,'2018-01-29 16:01:00',110,59,3,'some detail',6),(221,'2018-01-29 17:01:00',110,59,3,'some detail',6),(222,'2018-01-29 19:01:00',110,59,3,'some detail',6),(223,'2018-01-29 19:01:00',110,59,3,'some detail',6),(224,'2018-01-29 19:01:00',110,59,3,'some detail',6),(225,'2018-01-29 19:01:00',110,59,3,'some detail',6),(226,'2018-01-29 19:01:00',110,59,3,'some detail',6),(227,'2018-01-29 20:01:00',110,59,3,'some detail',6),(228,'2018-01-29 20:01:00',110,59,3,'some detail',6),(229,'2018-01-29 20:01:00',110,59,3,'some detail',6),(230,'2018-01-29 20:01:00',110,59,3,'some detail',6),(231,'2018-01-29 20:01:00',110,59,3,'some detail',6),(232,'2018-01-29 21:01:00',110,59,3,'some detail',6),(233,'2018-01-29 21:01:00',110,59,3,'some detail',6),(234,'2018-01-29 21:01:00',110,59,3,'some detail',6),(235,'2018-01-29 21:01:00',110,59,3,'some detail',6),(236,'2018-01-29 21:01:00',110,59,3,'some detail',6),(237,'2018-01-29 21:01:00',110,59,3,'some detail',6),(238,'2018-01-29 21:01:00',110,59,3,'some detail',6),(239,'2018-01-29 21:01:00',110,59,3,'some detail',6),(240,'2018-01-29 21:01:00',110,59,3,'some detail',6),(241,'2018-01-29 21:01:00',110,59,3,'some detail',6),(242,'2018-01-29 21:01:00',110,59,3,'some detail',6),(243,'2018-01-29 21:01:00',110,59,3,'some detail',6),(244,'2018-01-29 21:01:00',110,59,3,'some detail',6),(245,'2018-01-29 22:01:00',110,59,3,'some detail',6),(246,'2018-01-29 22:01:00',110,59,3,'some detail',6),(247,'2018-01-29 22:01:00',110,59,3,'some detail',6),(248,'2018-01-29 22:01:00',110,59,3,'some detail',6),(249,'2018-01-29 22:01:00',110,59,3,'some detail',6),(250,'2018-01-29 22:01:00',110,59,3,'some detail',6),(251,'2018-01-29 22:01:00',110,59,3,'some detail',6),(252,'2018-01-29 22:01:00',110,59,3,'some detail',6),(253,'2018-01-29 22:01:00',110,59,3,'some detail',6),(254,'2018-01-29 22:01:00',110,59,3,'some detail',6),(255,'2018-01-29 23:01:00',110,59,3,'some detail',6),(256,'2018-01-29 23:01:00',110,59,3,'some detail',6),(257,'2018-01-29 23:01:00',110,59,3,'some detail',6),(258,'2018-01-29 23:01:00',110,59,3,'some detail',6),(259,'2018-01-29 23:01:00',110,59,3,'some detail',6),(260,'2018-01-29 23:01:00',110,59,3,'some detail',6),(261,'2018-01-29 23:01:00',110,59,3,'some detail',6),(262,'2018-01-29 23:01:00',110,59,3,'some detail',6),(263,'2018-01-29 23:01:00',110,59,3,'some detail',6),(264,'2018-01-29 23:01:00',110,59,3,'some detail',6),(265,'2018-01-29 23:01:00',110,59,3,'some detail',6),(266,'2018-01-29 23:01:00',110,59,3,'some detail',6),(267,'2018-01-29 23:01:00',110,59,3,'some detail',6),(268,'2018-01-29 23:01:00',110,59,3,'some detail',6),(269,'2018-01-29 23:01:00',110,59,3,'some detail',6),(270,'2018-01-29 23:01:00',110,59,3,'some detail',6),(271,'2018-01-29 23:01:00',110,59,3,'some detail',6),(272,'2018-01-29 23:01:00',110,59,3,'some detail',6),(273,'2018-01-29 23:01:00',110,59,3,'some detail',6),(274,'2018-01-29 23:01:00',110,59,3,'some detail',6),(275,'2018-01-30 00:01:00',110,59,3,'some detail',6),(276,'2018-01-30 00:01:00',110,59,3,'some detail',6),(277,'2018-01-30 00:01:00',110,59,3,'some detail',6),(278,'2018-01-30 00:01:00',110,59,3,'some detail',6),(279,'2018-01-30 00:01:00',110,59,3,'some detail',6),(280,'2018-01-30 00:01:00',110,59,3,'some detail',6),(281,'2018-01-30 01:01:00',110,59,3,'some detail',6),(282,'2018-01-30 01:01:00',110,59,3,'some detail',6),(283,'2018-01-30 01:01:00',110,59,3,'some detail',6),(284,'2018-01-30 01:01:00',110,59,3,'some detail',1),(285,'2018-01-30 08:01:00',104,59,3,'some detail',1),(286,'2018-01-30 09:01:00',104,59,3,'some detail',1),(287,'2018-01-30 09:01:00',104,59,3,'some detail',1),(288,'2018-01-30 10:01:00',110,60,3,'some detail',6),(289,'2018-01-30 10:01:00',110,60,3,'some detail',6),(290,'2018-01-30 10:01:00',110,60,3,'some detail',6),(291,'2018-01-30 11:01:00',110,59,3,'some detail',6),(292,'2018-01-30 11:01:00',110,59,3,'some detail',6),(293,'2018-01-30 11:01:00',110,59,3,'Rejected by timer',6),(294,'2018-01-30 13:01:00',110,59,3,'Rejected by timer',6),(295,'2018-01-30 13:01:00',110,59,3,'Rejected by timer',6),(296,'2018-01-30 13:01:00',110,59,3,'Rejected by timer',6),(297,'2018-01-30 13:01:00',110,59,3,'Rejected by SP',6),(298,'2018-01-30 13:01:00',110,59,3,'Rejected by SP',6),(299,'2018-01-30 13:01:00',110,59,3,'Rejected by timer',6),(300,'2018-01-30 13:01:00',110,59,3,'Rejected by SP',6),(301,'2018-01-30 13:01:00',110,59,3,'Rejected by timer',6),(302,'2018-01-30 13:01:00',110,59,3,'Rejected by timer',6),(303,'2018-01-30 13:01:00',110,59,3,'Rejected by timer',6),(304,'2018-01-30 13:01:00',110,59,3,'Rejected by timer',6),(305,'2018-01-30 13:01:00',110,59,3,'Rejected by timer',6),(306,'2018-01-30 13:01:00',110,59,3,'Rejected by timer',6),(307,'2018-01-30 13:01:00',110,59,3,'Rejected by timer',6),(308,'2018-01-30 14:01:00',110,59,3,'Rejected by SP',6),(309,'2018-01-30 14:01:00',110,59,3,'Rejected by timer',6),(310,'2018-01-30 14:01:00',110,59,3,'Rejected by timer',6),(311,'2018-01-30 14:01:00',110,59,3,'Rejected by timer',6),(312,'2018-01-30 14:01:00',110,59,3,'Rejected by timer',6),(313,'2018-01-30 17:01:00',1,26,6,'',6),(314,'2018-01-30 17:01:00',1,26,5,'',6),(315,'2018-01-30 14:01:00',1,26,5,'',6),(316,'2018-01-30 14:01:00',110,59,3,'Rejected by timer',6),(317,'2018-01-30 14:01:00',110,59,6,'some detail',6),(318,'2018-01-30 14:01:00',110,59,6,'some detail',6),(319,'2018-01-30 14:01:00',110,59,3,'Rejected by timer',6),(320,'2018-01-30 14:01:00',110,59,3,'Rejected by SP',6),(321,'2018-01-30 14:01:00',110,59,3,'Rejected by timer',6),(322,'2018-01-30 14:01:00',110,59,3,'Rejected by timer',6),(323,'2018-01-30 14:01:00',110,59,3,'Rejected by timer',6),(324,'2018-01-30 15:01:00',110,59,3,'Rejected by timer',6),(325,'2018-01-30 15:01:00',110,59,3,'Rejected by timer',6),(326,'2018-01-30 15:01:00',110,59,3,'Rejected by SP',6),(327,'2018-01-30 15:01:00',110,59,3,'Rejected by SP',6),(328,'2018-01-30 15:01:00',110,59,3,'Rejected by timer',6),(329,'2018-01-30 15:01:00',110,59,3,'Rejected by timer',6),(330,'2018-01-30 15:01:00',110,59,3,'Rejected by timer',6),(331,'2018-01-30 15:01:00',110,59,3,'Rejected by timer',6),(332,'2018-01-30 15:01:00',110,59,3,'Rejected by SP',6),(333,'2018-01-30 15:01:00',110,59,3,'Rejected by SP',6),(334,'2018-01-30 15:01:00',110,59,3,'Rejected by timer',6),(335,'2018-01-30 15:01:00',110,59,6,'some detail',6),(336,'2018-01-30 15:01:00',110,59,3,'Rejected by timer',6),(337,'2018-01-30 15:01:00',110,59,3,'Rejected by SP',6),(338,'2018-01-30 15:01:00',110,59,3,'Rejected by SP',6),(339,'2018-01-30 15:01:00',110,59,3,'Rejected by timer',6),(340,'2018-01-30 16:01:00',110,59,3,'Rejected by timer',6),(341,'2018-01-30 16:01:00',110,59,3,'Rejected by timer',6),(342,'2018-01-30 16:01:00',110,59,3,'Rejected by timer',6),(343,'2018-01-30 16:01:00',110,59,3,'Rejected by timer',6),(344,'2018-01-30 16:01:00',110,59,3,'Rejected by timer',6),(345,'2018-01-30 16:01:00',110,59,5,'some detail',6),(346,'2018-01-30 16:01:00',110,59,3,'Rejected by timer',6),(347,'2018-01-30 16:01:00',110,59,5,'some detail',6),(348,'2018-01-30 16:01:00',110,59,6,'some detail',6),(349,'2018-01-30 16:01:00',110,59,3,'Rejected by SP',6),(350,'2018-01-30 16:01:00',110,59,3,'Rejected by timer',6),(351,'2018-01-30 16:01:00',110,59,3,'Rejected by timer',6),(352,'2018-01-30 16:01:00',110,59,3,'Rejected by timer',6),(353,'2018-01-30 16:01:00',110,59,3,'Rejected by timer',6),(354,'2018-01-30 16:01:00',110,59,3,'Rejected by timer',6),(355,'2018-01-30 16:01:00',110,59,3,'Rejected by SP',6),(356,'2018-01-30 18:01:00',110,59,3,'Rejected by timer',6),(357,'2018-01-30 19:01:00',110,59,5,'some detail',6),(358,'2018-01-30 19:01:00',110,59,5,'some detail',6),(359,'2018-01-30 20:01:00',110,59,5,'some detail',6),(360,'2018-01-30 20:01:00',110,59,6,'some detail',6),(361,'2018-01-30 20:01:00',110,59,5,'some detail',6),(362,'2018-01-30 20:01:00',110,59,5,'some detail',6),(363,'2018-01-30 20:01:00',110,59,5,'some detail',6),(364,'2018-01-30 20:01:00',110,59,5,'some detail',6),(365,'2018-01-30 20:01:00',110,59,5,'some detail',6),(366,'2018-01-30 20:01:00',110,59,5,'some detail',6),(367,'2018-01-30 21:01:00',110,59,5,'some detail',6),(368,'2018-01-30 21:01:00',110,59,5,'some detail',6),(369,'2018-01-30 21:01:00',110,59,3,'Rejected by SP',6),(370,'2018-01-30 21:01:00',110,59,5,'some detail',6),(371,'2018-01-30 21:01:00',110,59,3,'Rejected by SP',6),(372,'2018-01-30 21:01:00',110,59,3,'Rejected by SP',6),(373,'2018-01-30 21:01:00',110,59,3,'Rejected by timer',6),(374,'2018-01-30 21:01:00',110,59,3,'Rejected by SP',6),(375,'2018-01-30 22:01:00',110,59,3,'Rejected by SP',6),(376,'2018-01-30 22:01:00',110,59,3,'Rejected by SP',6),(377,'2018-01-30 22:01:00',110,59,3,'Rejected by SP',6),(378,'2018-01-30 22:01:00',110,59,3,'Rejected by timer',6),(379,'2018-01-30 22:01:00',110,59,6,'some detail',6),(380,'2018-01-30 22:01:00',110,59,3,'Rejected by SP',6),(381,'2018-01-30 22:01:00',110,59,6,'some detail',6),(382,'2018-01-30 22:01:00',110,59,5,'some detail',6),(383,'2018-01-30 22:01:00',110,59,3,'Rejected by timer',6),(384,'2018-01-31 07:01:00',110,59,3,'Rejected by timer',6),(385,'2018-01-31 07:01:00',110,59,6,'some detail',6),(386,'2018-01-31 07:01:00',110,59,5,'some detail',6),(387,'2018-01-31 08:01:00',110,59,3,'Rejected by timer',6),(388,'2018-01-31 08:01:00',110,59,6,'some detail',6),(389,'2018-01-31 08:01:00',104,59,6,'some detail',1),(390,'2018-01-31 08:01:00',104,59,3,'Rejected by timer',1),(391,'2018-01-31 08:01:00',104,59,3,'Rejected by SP',1),(392,'2018-01-31 08:01:00',104,59,5,'some detail',6),(393,'2018-01-31 10:01:00',104,59,3,'Rejected by SP',1),(394,'2018-01-31 11:01:00',104,59,3,'Rejected by timer',1),(395,'2018-01-31 11:01:00',104,59,3,'Rejected by SP',1),(396,'2018-01-31 11:01:00',104,59,3,'Rejected by SP',1),(397,'2018-01-31 11:01:00',110,60,3,'Rejected by timer',6),(398,'2018-01-31 11:01:00',110,60,3,'Rejected by SP',6),(399,'2018-01-31 11:01:00',110,60,6,'some detail',6),(400,'2018-01-31 12:01:00',110,60,3,'Rejected by timer',6),(401,'2018-01-31 12:01:00',110,60,6,'some detail',6),(402,'2018-01-31 12:01:00',110,59,3,'Rejected by SP',6),(403,'2018-01-31 14:01:00',110,59,3,'Rejected by timer',6),(404,'2018-01-31 14:01:00',110,59,3,'Rejected by timer',6),(405,'2018-01-31 14:01:00',110,59,3,'Rejected by SP',6),(406,'2018-01-31 14:01:00',110,59,3,'Rejected by timer',6),(407,'2018-01-31 14:01:00',110,59,3,'Rejected by SP',6),(408,'2018-01-31 14:01:00',110,59,3,'Rejected by timer',6),(409,'2018-01-31 14:01:00',110,59,3,'Rejected by timer',6),(410,'2018-01-31 14:01:00',110,59,3,'Rejected by timer',6),(411,'2018-01-31 15:01:00',110,59,3,'Rejected by timer',6),(412,'2018-01-31 15:01:00',110,59,3,'Rejected by SP',6),(413,'2018-01-31 15:01:00',110,59,3,'Rejected by SP',6),(414,'2018-01-31 15:01:00',110,59,3,'Rejected by SP',6),(415,'2018-01-31 15:01:00',110,59,3,'Rejected by timer',6),(416,'2018-01-31 15:01:00',110,59,3,'Rejected by timer',6),(417,'2018-01-31 15:01:00',104,61,5,'some detail',1),(418,'2018-01-31 15:01:00',110,59,3,'Rejected by timer',6),(419,'2018-01-31 15:01:00',110,59,3,'Rejected by SP',6),(420,'2018-01-31 15:01:00',110,59,3,'Rejected by SP',6),(421,'2018-01-31 16:01:00',110,59,3,'Rejected by timer',6),(422,'2018-01-31 16:01:00',110,59,3,'Rejected by SP',6),(423,'2018-01-31 16:01:00',110,59,3,'Rejected by SP',6),(424,'2018-01-31 16:01:00',110,59,3,'Rejected by SP',6),(425,'2018-01-31 16:01:00',110,59,3,'Rejected by SP',6),(426,'2018-01-31 17:01:00',110,59,5,'some detail',6),(427,'2018-01-31 17:01:00',110,59,3,'Rejected by timer',6),(428,'2018-01-31 20:01:00',104,61,3,'Rejected by timer',1),(429,'2018-01-31 20:01:00',104,61,3,'Rejected by timer',1),(430,'2018-01-31 20:01:00',104,61,3,'Rejected by timer',1),(431,'2018-01-31 20:01:00',104,61,5,'some detail',1),(432,'2018-01-31 20:01:00',104,61,3,'Rejected by SP',1),(433,'2018-01-31 20:01:00',104,61,3,'Rejected by timer',1),(434,'2018-01-31 21:01:00',104,61,3,'Rejected by timer',1),(435,'2018-01-31 21:01:00',110,59,3,'Rejected by timer',6),(436,'2018-01-31 21:01:00',110,59,3,'Rejected by timer',6),(437,'2018-01-31 21:01:00',110,59,5,'some detail',6),(438,'2018-01-31 21:01:00',110,59,3,'Rejected by timer',6),(439,'2018-01-31 21:01:00',110,59,3,'Rejected by timer',6),(440,'2018-01-31 22:01:00',110,59,3,'Rejected by SP',6),(441,'2018-01-31 22:01:00',110,59,3,'Rejected by SP',6),(442,'2018-01-31 22:01:00',110,59,3,'Rejected by SP',6),(443,'2018-01-31 22:01:00',110,59,3,'Rejected by SP',6),(444,'2018-01-31 22:01:00',110,59,3,'Rejected by timer',6),(445,'2018-01-31 22:01:00',110,59,3,'Rejected by timer',6),(446,'2018-01-31 22:01:00',110,60,3,'Rejected by timer',6),(447,'2018-01-31 22:01:00',110,59,5,'some detail',6),(448,'2018-01-31 23:01:00',110,59,3,'Rejected by SP',6),(449,'2018-01-31 23:01:00',110,59,6,'some detail',6),(450,'2018-01-31 23:01:00',110,59,6,'some detail',6),(451,'2018-01-31 23:01:00',110,59,6,'some detail',6),(452,'2018-01-31 23:01:00',110,59,3,'Rejected by timer',6),(453,'2018-01-31 23:01:00',110,59,3,'Rejected by SP',6),(454,'2018-01-31 23:01:00',110,59,5,'some detail',6),(455,'2018-02-01 08:02:00',104,59,3,'Rejected by SP',1),(456,'2018-02-01 08:02:00',104,59,3,'Rejected by timer',1),(457,'2018-02-01 08:02:00',104,59,3,'Rejected by timer',1),(458,'2018-02-01 08:02:00',104,59,6,'some detail',1),(459,'2018-02-01 08:02:00',110,59,3,'Rejected by SP',6),(460,'2018-02-01 08:02:00',110,59,3,'Rejected by timer',6),(461,'2018-02-01 11:02:00',110,59,3,'Rejected by timer',6),(462,'2018-02-01 11:02:00',110,59,3,'Rejected by timer',6),(463,'2018-02-01 11:02:00',110,59,3,'Rejected by SP',6),(464,'2018-02-01 11:02:00',110,59,6,'some detail',6),(465,'2018-02-01 11:02:00',110,59,3,'Rejected by SP',6),(466,'2018-02-01 11:02:00',110,59,5,'some detail',6),(467,'2018-02-01 11:02:00',110,59,3,'Rejected by timer',6),(468,'2018-02-01 11:02:00',110,59,3,'Rejected by timer',6),(469,'2018-02-01 11:02:00',110,59,3,'Rejected by timer',6),(470,'2018-02-01 11:02:00',110,59,3,'Rejected by timer',6),(471,'2018-02-01 11:02:00',110,59,3,'Rejected by SP',6),(472,'2018-02-01 11:02:00',110,59,3,'Rejected by SP',6),(473,'2018-02-01 11:02:00',110,59,3,'Rejected by timer',6),(474,'2018-02-01 11:02:00',110,59,3,'Rejected by timer',6),(475,'2018-02-01 11:02:00',110,59,3,'Rejected by SP',6),(476,'2018-02-01 11:02:00',110,59,6,'some detail',6),(477,'2018-02-01 11:02:00',110,59,5,'some detail',6),(478,'2018-02-01 11:02:00',110,59,3,'Rejected by timer',6),(479,'2018-02-01 12:02:00',110,59,3,'Rejected by SP',6),(480,'2018-02-01 12:02:00',110,59,3,'Rejected by SP',6),(481,'2018-02-01 12:02:00',110,59,3,'Rejected by SP',6),(482,'2018-02-01 12:02:00',110,59,3,'Rejected by SP',6),(483,'2018-02-01 12:02:00',110,59,3,'Rejected by SP',6),(484,'2018-02-01 12:02:00',110,59,5,'some detail',6),(485,'2018-02-01 14:02:00',110,59,3,'Rejected by timer',6),(486,'2018-02-01 14:02:00',110,60,3,'Rejected by SP',6),(487,'2018-02-01 14:02:00',110,59,6,'some detail',6),(488,'2018-02-01 14:02:00',110,59,3,'Rejected by timer',6),(489,'2018-02-01 14:02:00',110,60,3,'Rejected by timer',6),(490,'2018-02-01 14:02:00',110,59,3,'Rejected by SP',6),(491,'2018-02-01 14:02:00',110,59,3,'Rejected by SP',6),(492,'2018-02-01 14:02:00',110,59,3,'Rejected by SP',6),(493,'2018-02-01 14:02:00',110,59,3,'Rejected by SP',6),(494,'2018-02-01 14:02:00',110,59,3,'Rejected by SP',6),(495,'2018-02-01 14:02:00',110,59,3,'Rejected by SP',6),(496,'2018-02-01 14:02:00',110,59,3,'Rejected by SP',6),(497,'2018-02-01 14:02:00',110,59,3,'Rejected by SP',6),(498,'2018-02-01 15:02:00',110,59,3,'Rejected by SP',6),(499,'2018-02-01 15:02:00',110,59,5,'some detail',6),(500,'2018-02-01 15:02:00',110,59,6,'some detail',6),(501,'2018-02-01 15:02:00',110,59,3,'Rejected by timer',6),(502,'2018-02-01 15:02:00',110,60,3,'Rejected by timer',6),(503,'2018-02-01 15:02:00',110,59,3,'Rejected by SP',6),(504,'2018-02-01 15:02:00',110,59,3,'Rejected by SP',6),(505,'2018-02-01 15:02:00',110,59,6,'some detail',6),(506,'2018-02-01 15:02:00',110,59,3,'Rejected by SP',6),(507,'2018-02-01 16:02:00',110,59,3,'Rejected by SP',6),(508,'2018-02-01 16:02:00',110,59,3,'Rejected by SP',6),(509,'2018-02-01 16:02:00',110,60,3,'Rejected by timer',6),(510,'2018-02-01 16:02:00',110,59,5,'some detail',6),(511,'2018-02-01 16:02:00',110,59,5,'some detail',6),(512,'2018-02-01 16:02:00',110,60,5,'some detail',6),(513,'2018-02-01 16:02:00',110,59,3,'Rejected by SP',6),(514,'2018-02-01 16:02:00',110,59,5,'some detail',6),(515,'2018-02-01 16:02:00',110,59,3,'Rejected by SP',6),(516,'2018-02-01 21:02:00',110,59,3,'Rejected by SP',6),(517,'2018-02-01 21:02:00',104,59,6,'some detail',1),(518,'2018-02-01 22:02:00',110,59,3,'Rejected by SP',6),(519,'2018-02-02 08:02:00',110,59,6,'some detail',6),(520,'2018-02-02 09:02:00',110,59,5,'some detail',6),(521,'2018-02-02 09:02:00',110,59,5,'some detail',6),(522,'2018-02-02 09:02:00',110,59,6,'some detail',6),(523,'2018-02-02 09:02:00',110,59,5,'some detail',6),(524,'2018-02-02 09:02:00',110,59,5,'some detail',6),(525,'2018-02-02 09:02:00',110,59,6,'some detail',6),(526,'2018-02-02 09:02:00',110,59,5,'some detail',6),(527,'2018-02-02 10:02:00',110,59,6,'some detail',6),(528,'2018-02-02 10:02:00',110,59,5,'some detail',6),(529,'2018-02-02 10:02:00',110,59,5,'some detail',6),(530,'2018-02-02 11:02:00',110,59,5,'some detail',6),(531,'2018-02-02 12:02:00',110,59,6,'some detail',6),(532,'2018-02-02 12:02:00',110,59,6,'some detail',6),(533,'2018-02-02 12:02:00',110,59,3,'Rejected by timer',6),(534,'2018-02-02 13:02:00',110,59,3,'Rejected by SP',6),(535,'2018-02-02 13:02:00',110,59,3,'Rejected by SP',6),(536,'2018-02-02 13:02:00',110,59,3,'Rejected by SP',6),(537,'2018-02-02 13:02:00',110,59,3,'Rejected by SP',6),(538,'2018-02-02 13:02:00',110,59,3,'Rejected by SP',6),(539,'2018-02-02 14:02:00',110,59,3,'Rejected by SP',6),(540,'2018-02-02 14:02:00',110,59,6,'some detail',6),(541,'2018-02-03 19:02:00',104,61,3,'Rejected by timer',1),(542,'2018-02-03 19:02:00',104,60,6,'some detail',1),(543,'2018-02-04 09:02:00',110,59,3,'Rejected by SP',6),(544,'2018-02-04 09:02:00',110,59,6,'some detail',6),(545,'2018-02-04 09:02:00',110,59,3,'Rejected by SP',6),(546,'2018-02-04 09:02:00',110,59,5,'some detail',6),(547,'2018-02-04 09:02:00',110,59,3,'Rejected by SP',6),(548,'2018-02-04 09:02:00',110,59,3,'Rejected by SP',6),(549,'2018-02-04 10:02:00',110,59,3,'Rejected by SP',6),(550,'2018-02-04 10:02:00',110,59,5,'some detail',6),(551,'2018-02-04 10:02:00',110,59,6,'some detail',6),(552,'2018-02-04 10:02:00',110,59,5,'some detail',6),(553,'2018-02-04 10:02:00',110,59,5,'some detail',6),(554,'2018-02-04 11:02:00',110,59,3,'Rejected by timer',6),(555,'2018-02-04 11:02:00',110,59,3,'Rejected by timer',6),(556,'2018-02-04 11:02:00',110,59,6,'some detail',6),(557,'2018-02-04 11:02:00',110,59,3,'Rejected by timer',6),(558,'2018-02-04 11:02:00',110,59,6,'some detail',6),(559,'2018-02-04 11:02:00',110,59,5,'some detail',6),(560,'2018-02-04 12:02:00',110,59,5,'some detail',6),(561,'2018-02-04 12:02:00',110,59,3,'Rejected by SP',6),(562,'2018-02-04 12:02:00',110,59,5,'some detail',6),(563,'2018-02-04 12:02:00',110,59,5,'some detail',6),(564,'2018-02-04 12:02:00',110,59,3,'Rejected by timer',6),(565,'2018-02-04 12:02:00',110,59,5,'some detail',6),(566,'2018-02-04 13:02:00',110,59,5,'some detail',6),(567,'2018-02-04 13:02:00',110,59,3,'Rejected by SP',6),(568,'2018-02-04 14:02:00',110,59,6,'some detail',6),(569,'2018-02-04 14:02:00',110,59,5,'some detail',6),(570,'2018-02-04 14:02:00',110,59,5,'some detail',6),(571,'2018-02-04 14:02:00',110,59,5,'some detail',6),(572,'2018-02-04 14:02:00',110,59,6,'some detail',6),(573,'2018-02-04 14:02:00',110,59,5,'some detail',6),(574,'2018-02-04 14:02:00',110,59,6,'some detail',6),(575,'2018-02-04 15:02:00',110,59,5,'some detail',2),(576,'2018-02-04 15:02:00',110,59,3,'Rejected by SP',6),(577,'2018-02-04 15:02:00',110,59,5,'some detail',6),(578,'2018-02-04 15:02:00',110,59,5,'some detail',6),(579,'2018-02-04 15:02:00',110,59,3,'Rejected by SP',6),(580,'2018-02-04 15:02:00',110,59,5,'some detail',6),(581,'2018-02-04 15:02:00',110,59,3,'Rejected by SP',6),(582,'2018-02-04 15:02:00',110,59,3,'Rejected by SP',6),(583,'2018-02-04 15:02:00',110,59,5,'some detail',6),(584,'2018-02-04 16:02:00',110,59,3,'Rejected by SP',6),(585,'2018-02-04 16:02:00',110,27,3,'Rejected by timer',4),(586,'2018-02-04 19:02:00',104,59,3,'Rejected by timer',1),(587,'2018-02-04 19:02:00',104,61,3,'Rejected by timer',1),(588,'2018-02-04 19:02:00',104,60,3,'Rejected by timer',1),(589,'2018-02-04 19:02:00',104,60,6,'some detail',1),(590,'2018-02-04 19:02:00',104,60,6,'some detail',5),(591,'2018-02-04 21:02:00',110,59,6,'some detail',6),(592,'2018-02-04 21:02:00',110,59,3,'Rejected by SP',6),(593,'2018-02-04 22:02:00',110,59,5,'some detail',6),(594,'2018-02-04 22:02:00',110,59,5,'some detail',6),(595,'2018-02-04 22:02:00',110,59,3,'Rejected by SP',6),(596,'2018-02-04 22:02:00',110,59,5,'some detail',6),(597,'2018-02-05 08:02:00',110,59,5,'some detail',6),(598,'2018-02-05 08:02:00',110,60,3,'Rejected by timer',6),(599,'2018-02-05 09:02:00',104,59,6,'some detail',1),(600,'2018-02-05 10:02:00',104,60,3,'Rejected by timer',1),(601,'2018-02-05 10:02:00',104,60,6,'some detail',1),(602,'2018-02-05 12:02:00',110,59,3,'Rejected by SP',6),(603,'2018-02-05 13:02:00',110,59,3,'Rejected by SP',6),(604,'2018-02-05 15:02:00',110,59,3,'Rejected by SP',6),(605,'2018-02-05 15:02:00',110,59,3,'Rejected by SP',6),(606,'2018-02-05 15:02:00',110,59,3,'Rejected by SP',6),(607,'2018-02-05 15:02:00',110,59,3,'Rejected by SP',6),(608,'2018-02-05 15:02:00',110,59,5,'some detail',6),(609,'2018-02-05 15:02:00',110,60,3,'Rejected by timer',6),(610,'2018-02-05 16:02:00',110,59,3,'Rejected by SP',6),(611,'2018-02-05 16:02:00',110,59,3,'Rejected by SP',6),(612,'2018-02-05 16:02:00',110,59,3,'Rejected by SP',6),(613,'2018-02-05 16:02:00',110,59,3,'Rejected by SP',6),(614,'2018-02-05 16:02:00',110,59,3,'Rejected by SP',6),(615,'2018-02-05 16:02:00',110,59,3,'Rejected by SP',6),(616,'2018-02-05 16:02:00',110,60,5,'some detail',6),(617,'2018-02-05 16:02:00',110,59,3,'Rejected by SP',6),(618,'2018-02-06 06:02:00',104,61,5,'some detail',1),(619,'2018-02-06 09:02:00',110,59,3,'Rejected by SP',6),(620,'2018-02-06 09:02:00',110,59,3,'Rejected by SP',6),(621,'2018-02-06 11:02:00',110,59,3,'Rejected by SP',6),(622,'2018-02-06 11:02:00',110,59,3,'Rejected by timer',6),(623,'2018-02-06 11:02:00',110,59,3,'Rejected by SP',6),(624,'2018-02-06 11:02:00',110,59,3,'Rejected by SP',6),(625,'2018-02-06 11:02:00',110,59,6,'some detail',6),(626,'2018-02-06 15:02:00',110,59,3,'Rejected by SP',6),(627,'2018-02-06 15:02:00',110,59,3,'Rejected by SP',6),(628,'2018-02-06 15:02:00',110,59,3,'Rejected by SP',6),(629,'2018-02-06 15:02:00',110,59,5,'some detail',6),(630,'2018-02-06 15:02:00',110,59,6,'some detail',6),(631,'2018-02-06 15:02:00',110,59,3,'Rejected by SP',6);
/*!40000 ALTER TABLE `archive_calls` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-28 20:03:23
