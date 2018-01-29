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
-- Table structure for table `calls`
--

DROP TABLE IF EXISTS `calls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calls` (
  `callid` int(11) NOT NULL AUTO_INCREMENT,
  `cdate` datetime NOT NULL,
  `userid` int(11) NOT NULL,
  `spid` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `details` varchar(45) DEFAULT NULL,
  `serviceid` int(11) NOT NULL,
  PRIMARY KEY (`callid`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls`
--

LOCK TABLES `calls` WRITE;
/*!40000 ALTER TABLE `calls` DISABLE KEYS */;
INSERT INTO `calls` VALUES (1,'2016-08-21 00:00:00',1,26,4,'Testing 1',1),(2,'2016-08-21 00:00:00',2,26,4,'Testing 2',1),(3,'2016-08-21 00:00:00',3,26,4,'Testing 3',2),(4,'2016-08-25 00:00:00',4,27,4,'Something...',2),(5,'2016-08-25 00:00:00',5,27,4,'Something...',3),(6,'2016-08-25 00:00:00',6,28,4,'Something...',3),(7,'2016-08-26 00:00:00',1,29,4,'Something...',3),(8,'2016-08-26 00:00:00',1,29,4,'Something...',3),(9,'2016-08-29 00:00:00',1,26,5,'Something...',2),(10,'2016-09-03 00:00:00',1,26,6,'Something...',2),(11,'2016-09-04 00:00:00',1,27,7,'New detail',2),(12,'2016-09-05 00:00:00',1,27,7,'23ee',2),(13,'2016-09-05 00:00:00',1,29,8,'urgent call',2),(14,'2016-09-05 00:00:00',1,28,4,'call number 10',2),(15,'2016-09-06 00:00:00',1,28,4,'test',2),(16,'2016-09-06 00:00:00',1,29,4,'bbbb',1),(17,'2016-09-11 00:00:00',1,27,4,'test 2345',1),(18,'2016-09-17 00:00:00',1,26,4,'Real 1',1),(19,'2016-09-17 00:00:00',1,26,4,'Real 2',1),(20,'2016-09-17 00:00:00',1,28,3,'Real3',1),(21,'2016-09-17 00:00:00',1,29,3,'y',1),(22,'2016-09-17 00:00:00',1,27,3,'lll',1),(23,'2016-09-17 00:00:00',1,27,4,'kkkk',3),(25,'2018-01-26 11:01:00',1,26,3,'',6),(26,'2018-01-26 17:01:00',1,26,4,'',6),(27,'2018-01-28 13:01:00',1,26,4,'',7),(28,'2018-01-28 10:01:00',1,26,4,'',6),(29,'2018-01-28 11:01:00',1,26,1,'',6),(30,'2018-01-28 11:01:00',110,59,3,'some detail',6),(31,'2018-01-28 12:01:00',110,59,3,'some detail',6),(32,'2018-01-28 12:01:00',110,59,3,'some detail',6),(33,'2018-01-28 12:01:00',110,59,3,'some detail',6),(34,'2018-01-28 12:01:00',110,59,3,'some detail',6),(35,'2018-01-28 12:01:00',110,59,3,'some detail',6),(36,'2018-01-28 12:01:00',110,59,3,'some detail',6),(37,'2018-01-28 12:01:00',110,59,3,'some detail',6),(38,'2018-01-28 12:01:00',110,59,3,'some detail',6),(39,'2018-01-28 12:01:00',110,59,3,'some detail',6),(40,'2018-01-28 13:01:00',110,59,3,'some detail',6),(41,'2018-01-28 14:01:00',110,59,3,'some detail',6),(42,'2018-01-28 14:01:00',110,59,3,'some detail',6),(43,'2018-01-28 14:01:00',110,59,3,'some detail',6),(44,'2018-01-28 14:01:00',110,59,3,'some detail',6),(45,'2018-01-28 14:01:00',110,59,3,'some detail',6),(46,'2018-01-28 15:01:00',110,59,3,'some detail',6),(47,'2018-01-28 15:01:00',110,59,3,'some detail',6),(48,'2018-01-28 15:01:00',110,59,3,'some detail',6),(49,'2018-01-28 15:01:00',110,59,3,'some detail',6),(50,'2018-01-28 15:01:00',110,59,3,'some detail',6),(51,'2018-01-28 16:01:00',110,59,3,'some detail',6),(52,'2018-01-28 16:01:00',110,59,3,'some detail',6),(53,'2018-01-28 16:01:00',110,59,3,'some detail',6),(54,'2018-01-28 16:01:00',110,59,3,'some detail',6),(55,'2018-01-28 16:01:00',110,59,3,'some detail',6),(56,'2018-01-28 17:01:00',110,59,3,'some detail',6),(57,'2018-01-28 17:01:00',110,59,3,'some detail',6),(58,'2018-01-28 17:01:00',110,59,3,'some detail',6),(59,'2018-01-28 20:01:00',110,59,3,'some detail',6),(60,'2018-01-28 20:01:00',110,59,3,'some detail',6),(61,'2018-01-28 20:01:00',110,59,3,'some detail',6),(62,'2018-01-28 20:01:00',110,59,3,'some detail',6),(63,'2018-01-28 20:01:00',110,59,3,'some detail',6),(64,'2018-01-28 20:01:00',110,59,3,'some detail',6),(65,'2018-01-28 20:01:00',110,59,3,'some detail',6),(66,'2018-01-28 20:01:00',110,59,3,'some detail',6),(67,'2018-01-28 20:01:00',110,59,3,'some detail',6),(68,'2018-01-28 22:01:00',110,59,3,'some detail',6),(69,'2018-01-28 22:01:00',110,59,3,'some detail',6),(70,'2018-01-28 22:01:00',110,59,3,'some detail',6),(71,'2018-01-28 22:01:00',110,59,3,'some detail',6),(72,'2018-01-28 22:01:00',110,59,3,'some detail',6),(73,'2018-01-28 22:01:00',110,59,3,'some detail',6),(74,'2018-01-28 22:01:00',110,59,3,'some detail',6),(75,'2018-01-28 22:01:00',110,59,3,'some detail',6),(76,'2018-01-28 22:01:00',110,59,3,'some detail',6),(77,'2018-01-28 22:01:00',110,59,2,'some detail',6);
/*!40000 ALTER TABLE `calls` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-29  8:59:52
