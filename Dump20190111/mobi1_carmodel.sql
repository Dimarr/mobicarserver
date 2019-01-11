CREATE DATABASE  IF NOT EXISTS `mobi1` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `mobi1`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: mobi1.caqm9reiespt.us-east-1.rds.amazonaws.com    Database: mobi1
-- ------------------------------------------------------
-- Server version	5.6.40-log

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
-- Table structure for table `carmodel`
--

DROP TABLE IF EXISTS `carmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brandid` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=399 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carmodel`
--

LOCK TABLES `carmodel` WRITE;
/*!40000 ALTER TABLE `carmodel` DISABLE KEYS */;
INSERT INTO `carmodel` VALUES (1,25,'Granta '),(2,25,'Kalina '),(3,25,'Kalina '),(4,25,'PRIORA '),(5,25,'LARGUS '),(6,47,'Siber '),(7,1,'RDX '),(8,2,'A3 (8P)'),(9,2,'A3 (8V)'),(10,2,'A4 B5'),(11,2,'A4 B6'),(12,2,'A4 B8'),(13,2,'A4 B8'),(14,2,'A6 C6'),(15,2,'A6 C7'),(16,2,'A8 D2'),(17,2,'A8 D3'),(18,2,'A8 D4'),(19,2,'Q3 '),(20,2,'Q5 '),(21,2,'Q7 '),(22,2,'80 B3-B4'),(23,2,'100 '),(24,3,'Continental '),(25,4,'F01'),(26,4,'GT'),(27,4,'F10'),(28,4,'F20'),(29,4,'F30'),(30,4,'e36'),(31,4,'e38'),(32,4,'e39'),(33,4,'e46'),(34,4,'e60'),(35,4,'M6 e64'),(36,4,'e65'),(37,4,'e87'),(38,4,'e90'),(39,4,'X1 e84'),(40,5,'83 '),(41,5,'F25 '),(42,6,'e53 '),(43,6,'e70 '),(44,7,'?71 '),(45,8,'Escalade 2'),(46,8,'CTS 1'),(47,8,'CTS 2'),(48,8,'SRX 2'),(49,10,'Aveo T300'),(50,10,'Captiva '),(51,10,'Cruze ??/?????/??'),(52,10,'Cruze ?????'),(53,10,'Cruze ???'),(54,10,'Epica '),(55,10,'Lacetti ??/??'),(56,10,'Lacetti ???'),(57,10,'Lanos '),(58,10,'NIVA '),(59,10,'ORLANDO '),(60,10,'Tahoe 2'),(61,10,'Tahoe 3'),(62,10,'TrailBlazer -2'),(63,9,'CrossEastar (B14)'),(64,12,'Berlingo /'),(65,12,'C4 -1'),(66,12,'C4 -1'),(67,12,'C4 -2'),(68,12,'C4 -2'),(69,12,'C5 '),(70,12,'C-Crosser /'),(71,12,'C-Elysee /'),(72,12,'Xsara Picasso'),(73,11,'300C '),(74,11,'300M '),(75,11,'Neon 2'),(76,11,'Grand Voyager'),(77,13,'Matiz '),(78,13,'Nexia 1'),(79,13,'Nexia 2'),(80,14,'Caravan/Grand Carava'),(81,14,'Grand Caravan'),(82,14,'Neon 2/'),(83,14,'Stratus 2'),(84,14,'RAM 4'),(85,15,'Albea '),(86,15,'GRANDE PUNTO'),(87,16,'S-MAX '),(88,16,'Explorer 3'),(89,16,'Explorer 5'),(90,16,'Fiesta -5'),(92,16,'Focus 1'),(96,16,'Focus 2'),(98,16,'Focus 3'),(99,16,'Fusion '),(100,16,'Kuga 1'),(101,16,'Kuga 2'),(103,16,'Mondeo 3'),(104,16,'Mondeo 4'),(105,16,'RANGER 3'),(106,16,'Transit '),(107,17,'Hall Hover'),(108,18,'Accord 7'),(109,18,'Accord 8'),(110,18,'Civic 4D'),(111,18,'Civic 4D'),(112,18,'Civic 5D'),(113,18,'CR-V 1'),(114,18,'CR-V 3'),(115,18,'CR-V 4'),(116,18,'JAZZ '),(117,18,'Pilot 2'),(118,18,'Stream 1'),(119,20,'Accent 2'),(120,20,'Elantra 2'),(121,20,'Elantra 3'),(122,20,'Elantra 4'),(123,20,'Elantra 5'),(124,20,'Gets '),(125,20,'GRANDEUR '),(126,20,'i30 1'),(127,20,'i30 2'),(128,20,'i40 '),(129,20,'ix35 '),(130,20,'Matrix '),(131,20,'Porter 2'),(132,20,'Solaris ?????/?'),(133,20,'Solaris ???'),(134,20,'Sonata 5'),(135,20,'Sonata 6'),(136,20,'Starex '),(137,20,'Starex H-1'),(138,20,'Santa Fe'),(139,20,'Santa Fe'),(140,20,'Tucson '),(141,19,'H2 '),(142,19,'H3 '),(143,21,'M 4'),(144,21,'FX 1'),(145,21,'FX 2'),(146,21,'G 4'),(147,21,'Q50 '),(148,21,'QX 2'),(149,21,'QX 2'),(150,21,'QX 3'),(151,22,'X-Type '),(152,22,'XJ 351'),(153,22,'XF '),(155,23,'Grand Cherokee'),(156,24,'Carens -3'),(157,24,'CEED 1'),(158,24,'CEED 2'),(159,24,'CEED 2'),(160,24,'PRO CEED'),(161,24,'Cerato 2'),(162,24,'Cerato 3'),(163,24,'Magentis 2'),(164,24,'Mohave '),(165,24,'Optima -3'),(166,24,'Quoris '),(167,24,'RIO 1'),(168,24,'RIO 2'),(169,24,'RIO 2'),(170,24,'RIO 3'),(171,24,'RIO 3'),(172,24,'Spectra '),(173,24,'Sportage 2'),(174,24,'Sportage 3'),(175,24,'Sorento 2'),(176,24,'Sorento 3'),(177,24,'SOUL '),(178,24,'Venga '),(179,27,'ES -6'),(180,27,'GS -3'),(181,27,'GS -4'),(182,27,'GX -2'),(183,27,'IS -2'),(184,27,'LX -2'),(185,27,'LX -3'),(186,27,'RX 1'),(187,27,'RX 2'),(188,27,'RX 3'),(189,28,'Solano /'),(190,28,'X60 '),(191,29,'3 -1'),(192,29,'3 -2'),(193,29,'3 -3'),(194,29,'6 -1'),(195,29,'6 -2'),(196,29,'6 -3'),(197,29,'CX-5 '),(198,29,'CX-7 '),(199,29,'CX-9 '),(200,30,'A W176'),(201,30,'B W245'),(202,30,'E W210'),(203,30,'E W211'),(204,30,'E W124'),(205,30,'S W140'),(206,30,'S W220'),(207,30,'S W221'),(208,30,'GLK X204'),(209,30,'ML W163'),(210,30,'ML W164'),(211,30,'ML W166'),(212,30,'C W203'),(213,30,'C W203'),(214,30,'C W204'),(215,30,'E W212'),(216,30,'VITO W638'),(217,30,'VIANO W639'),(218,30,'VIANO W639'),(219,30,'GELENVAGEN W463'),(220,30,'GL X164'),(221,30,'GL X166/W166'),(222,30,'R-klasse W251'),(223,30,'SPRINTER '),(224,31,'AS? '),(225,31,'Carisma ?'),(226,31,'Colt 5D'),(227,31,'Galant 8'),(228,31,'L200 '),(229,31,'Lancer 10'),(230,31,'Lancer 9'),(231,31,'Mirage '),(232,31,'Outlander 1'),(233,31,'Outlander 2'),(234,31,'Outlander 3'),(235,31,'Pajero 3'),(236,31,'Pajero Sport'),(237,31,'Pajero Sport'),(238,32,'Juke '),(239,32,'Teana 32/31'),(240,32,'Tiida 5D'),(241,32,'Tiida sedan'),(242,32,'Maxima 32-33'),(243,32,'Murano Z51'),(244,32,'Navara 3'),(245,32,'Navara 3'),(246,32,'Pathfinder 3'),(247,32,'Pathfinder 3'),(248,32,'Patrol 4'),(249,32,'Primera (P11)'),(250,32,'Primera (P12)'),(251,32,'Qashqai 1'),(252,32,'Serena 2'),(253,32,'Terrano 3'),(254,32,'X-TRAIL T30'),(255,32,'X-TRAIL T31'),(256,32,'Almera Classic'),(257,32,'Almera G11'),(258,33,'Antara /'),(259,33,'Astra G'),(260,33,'Astra H'),(261,33,'Astra H'),(262,33,'Astra H'),(263,33,'Astra H'),(264,33,'Astra J'),(265,33,'Astra J'),(266,33,'Astra J'),(267,33,'Astra J'),(268,33,'Insignia ?????/?????'),(269,33,'Insignia ???????'),(270,33,'Vectra C'),(271,33,'Zafira A'),(272,33,'Zafira B'),(273,34,'107 5D'),(274,34,'207 5D'),(275,34,'301 '),(276,34,'308 /'),(277,34,'308 SW'),(278,34,'3008 '),(279,34,'4007 /'),(280,34,'4008 /'),(281,34,'407 ?????/???????'),(282,34,'408 '),(283,34,'508 '),(284,34,'607 '),(285,34,'Partner Tepee'),(286,35,'Vibe '),(287,36,'Cayenne 1'),(288,36,'Cayenne 2'),(289,38,'Clio 2'),(290,38,'Duster '),(291,38,'Fluence/ Megane3'),(292,38,'Fluence '),(293,38,'Koleos '),(294,38,'Logan '),(295,38,'Megane 2'),(296,38,'Megane 3'),(297,38,'Sandero /'),(298,38,'Scenic 3'),(299,38,'Grand Scenic'),(300,38,'Symbol -1'),(301,38,'Trafic (??????'),(302,26,'Rover Discovery'),(303,26,'Rover Discovery'),(304,26,'Rover Freelander'),(305,37,'Rover Sport'),(306,37,'Rover Sport'),(307,37,'Rover 3'),(308,37,'Rover 4'),(309,39,'43168 ???'),(310,39,'43168 ???????'),(311,40,'LEON 2'),(312,41,'Fabia 2'),(313,41,'Octavia Tour'),(314,41,'Octavia A5'),(315,41,'Octavia A5'),(316,41,'Octavia A7'),(317,41,'Rapid (??????'),(318,41,'Roomster '),(319,41,'Superb 1'),(320,41,'Superb 2'),(321,41,'Yeti '),(322,42,'Rexton 2'),(323,42,'Actyon Sports'),(324,42,'Actyon 2'),(325,42,'KYRON 1'),(326,43,'Forester 3'),(327,43,'Forester 4'),(328,43,'Impreza 2'),(329,43,'Impreza 3'),(330,43,'Legacy '),(331,43,'Outback 4'),(332,43,'XV '),(333,44,'Grand Vitara'),(334,44,'Jimny '),(335,44,'Liana '),(336,44,'SX4 1'),(337,45,'Alpard '),(338,45,'Auris hatchback'),(339,45,'Avensis 2'),(340,45,'Caldina (japan)'),(341,45,'Camry V20'),(342,45,'Camry V30'),(343,45,'Camry V40'),(344,45,'Camry V50'),(345,45,'Corolla e10'),(346,45,'Corolla E120'),(347,45,'Corolla E150'),(348,45,'Corolla E160'),(349,45,'CRESTA X100'),(350,45,'HIGHLANDER 2'),(351,45,'HIGHLANDER 3'),(352,45,'LC 100'),(353,45,'Prado LC120'),(354,45,'Prado LC150'),(355,45,'LC 200'),(356,45,'Prius '),(357,45,'RAV 4'),(358,45,'RAV4 3'),(359,45,'RAV4 4'),(360,45,'TUNDRA '),(361,45,'Verso '),(362,46,'Patriot '),(363,47,'SIBER '),(364,48,'XC 90'),(365,48,'S40 -2'),(366,48,'V40 -2'),(367,48,'V50 '),(368,48,'S60 -1'),(369,48,'S60 -2'),(370,48,'S80 '),(371,48,'S90 '),(372,48,'XC 60'),(373,48,'XC 70'),(374,48,'XC70 -2'),(375,49,'AMAROK '),(376,49,'Bora /'),(377,49,'Caddy 3'),(378,49,'Golf 3'),(379,49,'Golf 4'),(380,49,'Golf 4'),(381,49,'Golf 6'),(382,49,'Golf 7'),(383,49,'Golf 7'),(384,49,'Golf PLUS'),(385,49,'Jetta 5'),(386,49,'Jetta 6'),(387,49,'Polo hatchback'),(388,49,'Polo sedan'),(389,49,'Passat ?3/B4'),(390,49,'Passat B5'),(391,49,'Passat B5/B5+'),(392,49,'Passat B6/B7'),(393,49,'Passat B6/B7'),(394,49,'Tiguan '),(395,49,'Touareg '),(396,49,'Touareg 2'),(397,49,'T4 '),(398,49,'T5 ');
/*!40000 ALTER TABLE `carmodel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-11 11:56:06
