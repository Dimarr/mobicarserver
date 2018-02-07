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
-- Table structure for table `sproviders`
--

DROP TABLE IF EXISTS `sproviders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sproviders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `address` longtext,
  `phone` varchar(15) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT '0',
  `description` varchar(45) DEFAULT NULL,
  `votes` int(11) DEFAULT '0',
  `x` float DEFAULT NULL,
  `y` float DEFAULT NULL,
  `point` int(11) DEFAULT '0',
  `pic` varchar(255) DEFAULT NULL,
  `BNID` varchar(9) DEFAULT NULL,
  `sellerid` varchar(10) DEFAULT NULL,
  `logined` int(11) DEFAULT '0',
  `token` text,
  `busy` int(11) DEFAULT '0',
  `bankid` int(11) DEFAULT NULL,
  `bankbranch` varchar(30) DEFAULT NULL,
  `bankaccount` varchar(15) DEFAULT NULL,
  `logtime` varchar(30) DEFAULT NULL,
  `attempt` int(11) DEFAULT '0',
  `carbm` int(11) DEFAULT NULL,
  `carid` varchar(10) DEFAULT NULL,
  `BN` varchar(10) DEFAULT NULL,
  `firebasetoken` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sproviders`
--

LOCK TABLES `sproviders` WRITE;
/*!40000 ALTER TABLE `sproviders` DISABLE KEYS */;
INSERT INTO `sproviders` VALUES (23,'rafi','addresss','2125889966','rafi@l.com','698d51a19d8a121ce581499d7b701668',0,'description',0,32.222,35.5,0,NULL,'524523659',NULL,0,'cJ7Y0vlvHpQ:APA91bFZGO381CqmOAW7jhAbNgd-ys_Ekg_YKUZhx4zzHS142GeGg7fJ8Mex1W8JjwIYUTby6TCdelMGS7X_tWN5VEkLWLHqQWQY2Y8rQGBjoEkNqm5VDzq2t-a7OqityzB9BESl5crI',0,12,'6','123',NULL,0,11,'422',NULL,NULL),(26,'Service0',' Jerusalem','+79104404712',' pp@r.com','169be908d18ff83896292dd6de0df58c',0,'all services',0,32.1111,35.2231,0,'d:www	tt','1234567',NULL,1,'eyJjdHkiOiJ0d2lsaW8tZnBhO3Y9MSIsInR5cCI6IkpXVCIsImFsZyI6IkhTMjU2In0.eyJpc3MiOiJTSzY3YjMyNjFjNTQzNDBiZmI2YzJkMDk2ZmRhYWI2Y2FmIiwiZXhwIjoxNTE3MzE5MTQ3LCJncmFudHMiOnsiaWRlbnRpdHkiOiIrNzkxMDQ0MDQ3MTIiLCJjaGF0Ijp7InNlcnZpY2Vfc2lkIjoiTUcyNjVlZDNmNzFkZDZmNGFjZjUxM2FjMDJlZTY2NzIxMSIsImRlcGxveW1lbnRfcm9sZV9zaWQiOm51bGwsImVuZHBvaW50X2lkIjoibW9iaWNhclNlcnZlcjorNzkxMDQ0MDQ3MTI6SFRDMTIzIiwicHVzaF9jcmVkZW50aWFsX3NpZCI6bnVsbH19LCJqdGkiOiJTSzY3YjMyNjFjNTQzNDBiZmI2YzJkMDk2ZmRhYWI2Y2FmLTE1MTczMTU1ODQiLCJzdWIiOiJBQzA0N2U5ZDMwYTlhYjRlZWY1MGViZGM3NGMyYmMxNjJkIn0.Jq-ThR8Qn59tqFOg-L4Zm5N8XLirS3opgAgmeHopmFM',0,10,'777','123456123','Tue Jan 09 12:49:38 UTC 2018',0,11,'111','1000100022','cK47Z-_hQUE:APA91bFfgX2Q0Z0cjZ7ifEUu1oiThHHku_OMsr8VUndmDbcjX6dVw80PBIpy2CIhalXSdgacjXdxPISViNvExdsi3FpowZ66w7AF4kfPX8MwQtWzuVZYV9KcuxeFwpSxDIPAvdKb90i5'),(27,'Lior','TA','+972584196977','r@ll.com','9ec0cfdc84044494e10582436e013e64',25,'description',8,33.3456,37.4111,15,NULL,'040758856',NULL,1,'eyJjdHkiOiJ0d2lsaW8tZnBhO3Y9MSIsInR5cCI6IkpXVCIsImFsZyI6IkhTMjU2In0.eyJpc3MiOiJTSzg3MDVhNmNkMjdmZDc0YTEzZDNlNDVmYWJjNzk1NjFiIiwiZXhwIjoxNTE3NTU5MjgxLCJncmFudHMiOnsiaWRlbnRpdHkiOiIrOTcyNTg0MTk2OTc3IiwiY2hhdCI6eyJzZXJ2aWNlX3NpZCI6Ik1HNTQzYzdkZWE3YmMzMDZhZDRjODFmYzdkYTU3MWNlYTIiLCJkZXBsb3ltZW50X3JvbGVfc2lkIjpudWxsLCJlbmRwb2ludF9pZCI6Im1vYmljYXJTZXJ2ZXI6Kzk3MjU4NDE5Njk3NzpIdWF3ZWkiLCJwdXNoX2NyZWRlbnRpYWxfc2lkIjpudWxsfX0sImp0aSI6IlNLODcwNWE2Y2QyN2ZkNzRhMTNkM2U0NWZhYmM3OTU2MWItMTUxNzU1NTcxMiIsInN1YiI6IkFDYTI3MDk2NzZlOTk4NzY3MDliMTMzNDA5MzMzOGE4M2UifQ.4JoY3297euiKmlOn4QKZ9tVdRfoFbPT7jubzYA8oawk',0,12,'7','111',NULL,0,11,'111','541236549',NULL),(28,'Andrew','Jerusalem','111','r@ll.com','698d51a19d8a121ce581499d7b701668',0,'description',0,32.9876,35.0909,0,NULL,'040758856',NULL,1,'dm1kFwPpQ_k:APA91bEutZXCQ4gZTEnsjr0h1TArap225CJi2jEj9FiM0yXj4bD3NictTGwwhNfmj4lWXJCN49jkKTYzbX3UbggNKijzuzOYa81FHcZLBVuMtfX4vJWNh9xIVdJDk3ImJYxroE70YQ3A',0,12,'7','111','Fri Jul 28 10:14:45 UTC 2017',0,11,'111','543214569',NULL),(29,'dan','Rishon','123','d@ll.com','698d51a19d8a121ce581499d7b701668',0,'description',0,32.0944,35.7711,0,NULL,'040758856',NULL,1,'cPUedCubLug:APA91bE9B8NIyuLtYZ83quAAz-xN_c1OBP6oFb_sp8agYH-moV3fOpZvfj_TE5nVRG_pa1plyvWPgYA3bZSS5ps0BEbTpv52MXPvDFeVdNJEJ_pppS2E00NwN0gICg6fC-bXIE_ntxmn',0,12,'30','111',NULL,0,11,'111','541223896',NULL),(30,'r','Rehovot','12','r@ll.com','698d51a19d8a121ce581499d7b701668',0,'description',0,0,0,0,NULL,'0',NULL,0,'cPUedCubLug:APA91bE9B8NIyuLtYZ83quAAz-xN_c1OBP6oFb_sp8agYH-moV3fOpZvfj_TE5nVRG_pa1plyvWPgYA3bZSS5ps0BEbTpv52MXPvDFeVdNJEJ_pppS2E00NwN0gICg6fC-bXIE_ntxmn',0,12,'7','1',NULL,0,11,'1','0',NULL),(31,'yair','Yavne','1','r@ll.com','698d51a19d8a121ce581499d7b701668',0,'description',0,0,0,0,NULL,'040758856',NULL,0,'cPUedCubLug:APA91bE9B8NIyuLtYZ83quAAz-xN_c1OBP6oFb_sp8agYH-moV3fOpZvfj_TE5nVRG_pa1plyvWPgYA3bZSS5ps0BEbTpv52MXPvDFeVdNJEJ_pppS2E00NwN0gICg6fC-bXIE_ntxmn',0,12,'7','1',NULL,0,11,'1','0',NULL),(32,'yair','Haifa','1','y@ll.com','698d51a19d8a121ce581499d7b701668',0,'description',0,0,0,0,NULL,'040758856',NULL,1,'cPUedCubLug:APA91bE9B8NIyuLtYZ83quAAz-xN_c1OBP6oFb_sp8agYH-moV3fOpZvfj_TE5nVRG_pa1plyvWPgYA3bZSS5ps0BEbTpv52MXPvDFeVdNJEJ_pppS2E00NwN0gICg6fC-bXIE_ntxmn',0,12,'7','1','Fri Jul 28 19:22:23 UTC 2017',0,11,'1','0',NULL),(33,'yafit','Netanya','1','ya@ll.com','698d51a19d8a121ce581499d7b701668',0,'description',0,0,0,0,NULL,'040758856',NULL,0,'cPUedCubLug:APA91bE9B8NIyuLtYZ83quAAz-xN_c1OBP6oFb_sp8agYH-moV3fOpZvfj_TE5nVRG_pa1plyvWPgYA3bZSS5ps0BEbTpv52MXPvDFeVdNJEJ_pppS2E00NwN0gICg6fC-bXIE_ntxmn',0,12,'30','1',NULL,0,11,'1','0',NULL),(34,'ry','Kiryat-Ono','1','r@ll.com','698d51a19d8a121ce581499d7b701668',0,'description',0,0,0,0,NULL,'040758856',NULL,1,'cPUedCubLug:APA91bE9B8NIyuLtYZ83quAAz-xN_c1OBP6oFb_sp8agYH-moV3fOpZvfj_TE5nVRG_pa1plyvWPgYA3bZSS5ps0BEbTpv52MXPvDFeVdNJEJ_pppS2E00NwN0gICg6fC-bXIE_ntxmn',0,12,'4','1','Sun Sep 03 14:11:06 UTC 2017',0,11,'1','0',NULL),(35,'orisp 2907','addresss','0523952857','ori@mobicar.co.il','698d51a19d8a121ce581499d7b701668',0,'description',0,0,0,0,NULL,'034138529',NULL,0,'eLe7gBd6BwU:APA91bHnJ1RrcR2bVV1C_ocwdHb_HoORv5hh8OTf6uy7Ec_j3Jkw4TxOiZl5Nd7zs1yxXzak4FU6ySOMMksxoI2mzbpE8Shhu-WGsBMFJceUNFn4ZNR0XyenGFYK0WivAd7v7QQXYB3-',0,12,'621','102030',NULL,0,11,'2345678','0',NULL),(36,'orisp 0508','addresss','0523952857','ori@mobicar.co.il','698d51a19d8a121ce581499d7b701668',0,'description',0,0,0,0,NULL,'034138529',NULL,1,'eLe7gBd6BwU:APA91bHnJ1RrcR2bVV1C_ocwdHb_HoORv5hh8OTf6uy7Ec_j3Jkw4TxOiZl5Nd7zs1yxXzak4FU6ySOMMksxoI2mzbpE8Shhu-WGsBMFJceUNFn4ZNR0XyenGFYK0WivAd7v7QQXYB3-',0,12,'10','125599','Mon Aug 07 08:16:38 UTC 2017',0,12,'2205836','0',NULL),(37,'r','addresss','2','rafilevip@gmail.com','698d51a19d8a121ce581499d7b701668',0,'description',0,0,0,0,NULL,'040758856',NULL,0,'fmR78oiBKe0:APA91bEgxOPy4DKUu0nBf4kzg6LU-6YBSSsVQQUz1jnLT--O9YzcIAosJNxM3PdpgNy0a1B1RHYg-dHXDUVrJHnpldDxYzc7Ya5MeCOCn7G8kPDtzaDdFufC6vtaPk5EBmqnaihkjn6k',0,12,'7','1',NULL,0,11,'2','541236589',NULL),(38,'tt','addresss','2','t@ll.com','698d51a19d8a121ce581499d7b701668',0,'description',0,0,0,0,NULL,'040758856',NULL,0,'fmR78oiBKe0:APA91bEgxOPy4DKUu0nBf4kzg6LU-6YBSSsVQQUz1jnLT--O9YzcIAosJNxM3PdpgNy0a1B1RHYg-dHXDUVrJHnpldDxYzc7Ya5MeCOCn7G8kPDtzaDdFufC6vtaPk5EBmqnaihkjn6k',0,12,'63','2',NULL,0,12,'2','541236547',NULL),(39,'dd','addresss','2','dd@l.com','698d51a19d8a121ce581499d7b701668',0,'description',0,0,0,0,NULL,'040758856',NULL,0,'fmR78oiBKe0:APA91bEgxOPy4DKUu0nBf4kzg6LU-6YBSSsVQQUz1jnLT--O9YzcIAosJNxM3PdpgNy0a1B1RHYg-dHXDUVrJHnpldDxYzc7Ya5MeCOCn7G8kPDtzaDdFufC6vtaPk5EBmqnaihkjn6k',0,12,'66','1',NULL,0,31,'1','541236579',NULL),(40,'orisp0309','addresss','0523952857','ori@mobicar.co.il','698d51a19d8a121ce581499d7b701668',0,'description',0,0,0,0,NULL,'034138529',NULL,1,'fLpaTt_DQuA:APA91bFDK8_glfrLoVKo4TjjvOe8BNpkhC8LHYMazQYeKU8gy0b3iIHCPn--VXbT-ZCWJq35HyvRbssbJkmPhX3TlFN8lgei2tbcoyAIu5yLcTx6Bum-JYn0fdbZCXHh1AgiDC6JTObV',0,12,'613','1020630','Tue Sep 05 18:53:20 UTC 2017',0,11,'5588877','0',NULL),(41,'×¨×Ÿ ×™×¢×§×‘','addresss','0522757391','ranyakov@outlook.com','698d51a19d8a121ce581499d7b701668',0,'description',0,0,0,0,NULL,'021540620',NULL,0,'dVaRZz8mnxo:APA91bHAl6-QlHHQ5na_SHAYtmmkCuv18oUWB1atKGowCI2kzK3D9jo_BMVWheF9jbrCIekaz5UJxilr_Rw-Arjofx8FwZuxL_LrCynba15GRRe4YMVWSx9xkGTdiOQlI3wxD8b_qXL7',0,12,'61','123456',NULL,0,11,'123456','021540620',NULL),(42,'ag','addresss','0524849916','gershonavi@gmail.com','698d51a19d8a121ce581499d7b701668',0,'description',0,0,0,0,NULL,'141223388',NULL,1,'fJ3YQSwjDE0:APA91bEhvNv7jm9dkBzXCv1IK5NZZrSEolFA_QIrrD4QNgIw4uXh3sMdWHETcPZpNz7Mkz8GbZoTlfYc46X3xXfHCbR1vZxpCafg6QeR8-4Gdmvto_YwYYFxvBEY8PStBNW7aGowy3On',0,12,'107','655','Wed Sep 13 07:43:29 UTC 2017',0,41,'5','52',NULL),(43,'×¨×Ÿ ×™×¢×§×‘','addresss','0522757391','rghh@gmail.com','698d51a19d8a121ce581499d7b701668',0,'description',0,0,0,0,NULL,'021540620',NULL,0,'e8fEOX3ZwVY:APA91bHNdcReaiR0E_sYXTYi66-1NRHWn-Y_vBByHfcPMYZ1oHRKitdpl-_aqBYZbnQKEBI8kj8p_xz41ZzbIY5rGIgdXmEYpKSWafX5yqRE9H-jJEku91ezZVmGilzXnfR5UOt7n7mP',0,12,'56','123456',NULL,0,11,'1234567','123456',NULL),(44,'orisp05092','addresss','0523952857','ori@mobicar.co.il','698d51a19d8a121ce581499d7b701668',0,'description',0,0,0,0,NULL,'034138529',NULL,0,'cUAKlXVmH5E:APA91bGv11pTUx6VqrYm2oZobSuo05bcJjY69LHTMD6LVCp1ZjeHk4p5zD3zMc27V8QfGWjRP3wJogUMf12EdltGpZxjLm2H7Pj4WOZxuJAZK81ue2sPCGe3FJTJb4EnvtrkS8_s8yfJ',0,12,'70','852984',NULL,0,12,'2058369','0',NULL),(45,'×¨×Ÿ ×™×¢×§×”','addresss','0522757391','gh@gmail.com','698d51a19d8a121ce581499d7b701668',0,'description',0,0,0,0,NULL,'021540620',NULL,0,'e8fEOX3ZwVY:APA91bHNdcReaiR0E_sYXTYi66-1NRHWn-Y_vBByHfcPMYZ1oHRKitdpl-_aqBYZbnQKEBI8kj8p_xz41ZzbIY5rGIgdXmEYpKSWafX5yqRE9H-jJEku91ezZVmGilzXnfR5UOt7n7mP',0,12,'64','1234567',NULL,0,11,'1234567','1234567',NULL),(46,'034138529','addresss','0523952857','ori@mobicar.co.il','698d51a19d8a121ce581499d7b701668',0,'description',0,0,0,0,NULL,'034138529',NULL,1,'cUAKlXVmH5E:APA91bGv11pTUx6VqrYm2oZobSuo05bcJjY69LHTMD6LVCp1ZjeHk4p5zD3zMc27V8QfGWjRP3wJogUMf12EdltGpZxjLm2H7Pj4WOZxuJAZK81ue2sPCGe3FJTJb4EnvtrkS8_s8yfJ',0,12,'6','100369','Sun Sep 24 14:19:57 UTC 2017',0,91,'2470767','0',NULL),(47,'ORIT03092017','','052-3952857','ori@mobicar.co.il','d41d8cd98f00b204e9800998ecf8427e',0,'',0,0,0,0,NULL,'34138529',NULL,0,'',0,12,'60','105080',NULL,0,90,'9870758','',NULL),(48,'ORIT2030920172','','054-3952857','orihei@bezeqint.net','d41d8cd98f00b204e9800998ecf8427e',0,'',0,0,0,0,NULL,'34138529',NULL,0,'',0,10,'38','208040',NULL,0,91,'2470767','',NULL),(49,'orinew','addresss','0523952857','ori@mobicar.co.il','698d51a19d8a121ce581499d7b701668',0,'description',0,0,0,0,NULL,'034138529',NULL,0,'cUAKlXVmH5E:APA91bGv11pTUx6VqrYm2oZobSuo05bcJjY69LHTMD6LVCp1ZjeHk4p5zD3zMc27V8QfGWjRP3wJogUMf12EdltGpZxjLm2H7Pj4WOZxuJAZK81ue2sPCGe3FJTJb4EnvtrkS8_s8yfJ',0,12,'5','453996',NULL,0,31,'1266523','0',NULL),(50,'oritestsucot','addresss','0523952857','ori@mobicar.co.il','698d51a19d8a121ce581499d7b701668',0,'description',0,0,0,0,NULL,'034138529',NULL,0,'cUAKlXVmH5E:APA91bGv11pTUx6VqrYm2oZobSuo05bcJjY69LHTMD6LVCp1ZjeHk4p5zD3zMc27V8QfGWjRP3wJogUMf12EdltGpZxjLm2H7Pj4WOZxuJAZK81ue2sPCGe3FJTJb4EnvtrkS8_s8yfJ',0,12,'63','144809',NULL,0,11,'2588836','0',NULL),(51,'sucot2','addresss','0523952857','ori@mobicar.co.il','698d51a19d8a121ce581499d7b701668',0,'description',0,0,0,0,NULL,'034138529',NULL,1,'cUAKlXVmH5E:APA91bGv11pTUx6VqrYm2oZobSuo05bcJjY69LHTMD6LVCp1ZjeHk4p5zD3zMc27V8QfGWjRP3wJogUMf12EdltGpZxjLm2H7Pj4WOZxuJAZK81ue2sPCGe3FJTJb4EnvtrkS8_s8yfJ',0,12,'65','108544','Mon Oct 02 09:45:38 UTC 2017',0,22,'2854436','0',NULL),(52,'ori november','addresss','0523952857','ori@mobicar.co.il','698d51a19d8a121ce581499d7b701668',0,'description',0,0,0,0,NULL,'034138529',NULL,0,'cUAKlXVmH5E:APA91bGv11pTUx6VqrYm2oZobSuo05bcJjY69LHTMD6LVCp1ZjeHk4p5zD3zMc27V8QfGWjRP3wJogUMf12EdltGpZxjLm2H7Pj4WOZxuJAZK81ue2sPCGe3FJTJb4EnvtrkS8_s8yfJ',0,12,'60','203064',NULL,0,32,'25898365','0',NULL),(53,'ori test 1112','addresss','0523952857','ori@mobicar.co.il','698d51a19d8a121ce581499d7b701668',0,'description',0,0,0,0,NULL,'034138529',NULL,1,'cUAKlXVmH5E:APA91bGv11pTUx6VqrYm2oZobSuo05bcJjY69LHTMD6LVCp1ZjeHk4p5zD3zMc27V8QfGWjRP3wJogUMf12EdltGpZxjLm2H7Pj4WOZxuJAZK81ue2sPCGe3FJTJb4EnvtrkS8_s8yfJ',0,12,'14','123888','Fri Jan 19 07:05:48 UTC 2018',0,11,'2588522','0',NULL),(54,'testD',NULL,'+972548568877','q@123.com',NULL,0,NULL,0,35.3366,39.8888,0,NULL,'1234000',NULL,0,NULL,0,NULL,NULL,NULL,NULL,0,NULL,NULL,'0987896',NULL),(55,'testD',NULL,'+972548568877','q@123.com',NULL,0,NULL,0,NULL,NULL,0,NULL,'1234000',NULL,0,NULL,0,NULL,NULL,NULL,NULL,0,NULL,NULL,'0987896',NULL),(59,'Yevgen SP',NULL,'+380638447712','skrypchenko.yevgen@gmail.com','f80bf05527157a8c2a7bb63b22f49aaa',0,NULL,0,49.9844,36.3613,0,'https://firebasestorage.googleapis.com/v0/b/mobicar-db1c6.appspot.com/o/providers_cars%2F59%2FCorola.jpg?alt=media&token=dafe74f9-3ee0-488c-92ef-fd17ce2d8d2b','529884456',NULL,1,'eyJjdHkiOiJ0d2lsaW8tZnBhO3Y9MSIsInR5cCI6IkpXVCIsImFsZyI6IkhTMjU2In0.eyJpc3MiOiJTSzg3MDVhNmNkMjdmZDc0YTEzZDNlNDVmYWJjNzk1NjFiIiwiZXhwIjoxNTE4MDA5MDM3LCJncmFudHMiOnsiaWRlbnRpdHkiOiIrMzgwNjM4NDQ3NzEyIiwiY2hhdCI6eyJzZXJ2aWNlX3NpZCI6Ik1HNTQzYzdkZWE3YmMzMDZhZDRjODFmYzdkYTU3MWNlYTIiLCJkZXBsb3ltZW50X3JvbGVfc2lkIjpudWxsLCJlbmRwb2ludF9pZCI6Im1vYmljYXJTZXJ2ZXI6KzM4MDYzODQ0NzcxMjpkZGE0YzdiMmUwNTY1OTQ2IiwicHVzaF9jcmVkZW50aWFsX3NpZCI6bnVsbH19LCJqdGkiOiJTSzg3MDVhNmNkMjdmZDc0YTEzZDNlNDVmYWJjNzk1NjFiLTE1MTgwMDUzNzYiLCJzdWIiOiJBQ2EyNzA5Njc2ZTk5ODc2NzA5YjEzMzQwOTMzMzhhODNlIn0.ZnrHmIk-wuV3t0V5HM0_usDh6iGqK_Z1IPL4B7uK6eU',0,10,'555','5541','Wed Feb 07 12:10:36 UTC 2018',0,11,'1233','','eII42UfiKFo:APA91bH18cz-QRgb1TVOJ-d3KQKFDWmanCuejbAskHDLcCoYsbJJt6ZNFbS7WDo8sWhI09oQa2mDKEiezybs7_9ZtaAk7sVkQoXwWxdYfk5GLVXp6uGNoOiePegptyfmoV8Zfi25r2th'),(60,'ori',NULL,'+972523952857','ori4@mobicar.co.il','02ed812220b0705fabb868ddbf17ea20',0,NULL,0,32.0603,34.8667,0,'https://firebasestorage.googleapis.com/v0/b/mobicar-db1c6.appspot.com/o/providers%2F60%2F60.jpg?alt=media&token=6cc56073-185a-430c-bb65-a51cf4aa9aa0','034138529',NULL,1,'eyJjdHkiOiJ0d2lsaW8tZnBhO3Y9MSIsInR5cCI6IkpXVCIsImFsZyI6IkhTMjU2In0.eyJpc3MiOiJTSzg3MDVhNmNkMjdmZDc0YTEzZDNlNDVmYWJjNzk1NjFiIiwiZXhwIjoxNTE4MDA4NTUwLCJncmFudHMiOnsiaWRlbnRpdHkiOiIrOTcyNTIzOTUyODU3IiwiY2hhdCI6eyJzZXJ2aWNlX3NpZCI6Ik1HNTQzYzdkZWE3YmMzMDZhZDRjODFmYzdkYTU3MWNlYTIiLCJkZXBsb3ltZW50X3JvbGVfc2lkIjpudWxsLCJlbmRwb2ludF9pZCI6Im1vYmljYXJTZXJ2ZXI6Kzk3MjUyMzk1Mjg1Nzo4YmE0NzIwNjRiZmFkMTEyIiwicHVzaF9jcmVkZW50aWFsX3NpZCI6bnVsbH19LCJqdGkiOiJTSzg3MDVhNmNkMjdmZDc0YTEzZDNlNDVmYWJjNzk1NjFiLTE1MTgwMDQ5OTIiLCJzdWIiOiJBQ2EyNzA5Njc2ZTk5ODc2NzA5YjEzMzQwOTMzMzhhODNlIn0.3YJM4Te0PHxSLjdR0nxswW1BstG0TkGpgwQJxXxa7xU',0,4,'777','88888','Wed Feb 07 12:02:28 UTC 2018',0,35,'22111444','','cUsPt_NdOvk:APA91bHlIhdKXNM3FwMl03HiNFaq8mz3XDsbJfGjwzejaUeKCTxsX_KtZ8QDDnDWG1oBxMy6MgxTcdOuvNViUJPIdPuPXu6PuqhKt-C4l_mWQbZZeBh19Ifm7Uf-ysCHkZA-7at_xrqG'),(61,'×¢×¤×¨ × ×—×ž× ×™',NULL,'+972503368212','nachmany.ofer@gmail.com','41bcfd9ab658ebaac1661f58080aad6b',0,NULL,0,32.7697,34.9722,0,'https://firebasestorage.googleapis.com/v0/b/mobicar-db1c6.appspot.com/o/providers%2F61%2F61.jpg?alt=media&token=30fccb34-6915-4b2b-a9b4-7b076a79ee1b','024649899',NULL,1,'eyJjdHkiOiJ0d2lsaW8tZnBhO3Y9MSIsInR5cCI6IkpXVCIsImFsZyI6IkhTMjU2In0.eyJpc3MiOiJTSzY3YjMyNjFjNTQzNDBiZmI2YzJkMDk2ZmRhYWI2Y2FmIiwiZXhwIjoxNTE3MjI4Njg4LCJncmFudHMiOnsiaWRlbnRpdHkiOiIrOTcyNTAzMzY4MjEyIiwiY2hhdCI6eyJzZXJ2aWNlX3NpZCI6Ik1HMjY1ZWQzZjcxZGQ2ZjRhY2Y1MTNhYzAyZWU2NjcyMTEiLCJkZXBsb3ltZW50X3JvbGVfc2lkIjpudWxsLCJlbmRwb2ludF9pZCI6Im1vYmljYXJTZXJ2ZXI6Kzk3MjUwMzM2ODIxMjoxZThjZTQ3MzNkOGMyMzliIiwicHVzaF9jcmVkZW50aWFsX3NpZCI6bnVsbH19LCJqdGkiOiJTSzY3YjMyNjFjNTQzNDBiZmI2YzJkMDk2ZmRhYWI2Y2FmLTE1MTcyMjUwODgiLCJzdWIiOiJBQzA0N2U5ZDMwYTlhYjRlZWY1MGViZGM3NGMyYmMxNjJkIn0.RuumObbxF4xl6iKXvI2mCIBECOopP8U0qYBshMqjX4A',0,11,'555','222222','Mon Jan 29 11:24:47 UTC 2018',0,11,'1122112','123456','eToqVxnuFXg:APA91bG_fcksuSW1uO_zYFG82-vhHiz-es4HjZsn7MytusKfMaTWQPft1a4H0qk2C0hh5FRaOo1q4VnNqI-gLMFQiw84X_UP351Rdk_FEBlhVmRjnSpDPwQThl3ujM5SSRCp_zrBfaTV'),(62,'roey friedman',NULL,'0547479545','roeyf10@gmail.com','05f17e3cfa5de42020eaa6df34fb4805',0,NULL,0,NULL,NULL,0,NULL,'015269301',NULL,1,'eyJjdHkiOiJ0d2lsaW8tZnBhO3Y9MSIsInR5cCI6IkpXVCIsImFsZyI6IkhTMjU2In0.eyJpc3MiOiJTSzY3YjMyNjFjNTQzNDBiZmI2YzJkMDk2ZmRhYWI2Y2FmIiwiZXhwIjoxNTE2MTkzOTUyLCJncmFudHMiOnsiaWRlbnRpdHkiOiIwNTQ3NDc5NTQ1IiwiY2hhdCI6eyJzZXJ2aWNlX3NpZCI6Ik1HMjY1ZWQzZjcxZGQ2ZjRhY2Y1MTNhYzAyZWU2NjcyMTEiLCJkZXBsb3ltZW50X3JvbGVfc2lkIjpudWxsLCJlbmRwb2ludF9pZCI6Im1vYmljYXJTZXJ2ZXI6MDU0NzQ3OTU0NTo0OWQ3Mjc3ZjVmYTY5YmQ2IiwicHVzaF9jcmVkZW50aWFsX3NpZCI6bnVsbH19LCJqdGkiOiJTSzY3YjMyNjFjNTQzNDBiZmI2YzJkMDk2ZmRhYWI2Y2FmLTE1MTYxOTAzMzYiLCJzdWIiOiJBQzA0N2U5ZDMwYTlhYjRlZWY1MGViZGM3NGMyYmMxNjJkIn0.4PlKSxslqPa9Yt8KkbEPIo9RQPxrapQa5719BuGhVBk',0,NULL,NULL,NULL,'Wed Jan 17 12:00:29 UTC 2018',0,NULL,NULL,'',NULL),(63,'Zuri Dar',NULL,'0638447712','zuri.dar@gmail.com','43baa6762fa81bb43b39c62553b2970d',0,NULL,0,NULL,NULL,0,NULL,'028421675',NULL,1,'eyJjdHkiOiJ0d2lsaW8tZnBhO3Y9MSIsInR5cCI6IkpXVCIsImFsZyI6IkhTMjU2In0.eyJpc3MiOiJTSzY3YjMyNjFjNTQzNDBiZmI2YzJkMDk2ZmRhYWI2Y2FmIiwiZXhwIjoxNTE2NzQ5MTQ0LCJncmFudHMiOnsiaWRlbnRpdHkiOiIwNjM4NDQ3NzEyIiwiY2hhdCI6eyJzZXJ2aWNlX3NpZCI6Ik1HMjY1ZWQzZjcxZGQ2ZjRhY2Y1MTNhYzAyZWU2NjcyMTEiLCJkZXBsb3ltZW50X3JvbGVfc2lkIjpudWxsLCJlbmRwb2ludF9pZCI6Im1vYmljYXJTZXJ2ZXI6MDYzODQ0NzcxMjpiZTQxNGM0NDgzZDQ2YzE4IiwicHVzaF9jcmVkZW50aWFsX3NpZCI6bnVsbH19LCJqdGkiOiJTSzY3YjMyNjFjNTQzNDBiZmI2YzJkMDk2ZmRhYWI2Y2FmLTE1MTY3NDU0NzIiLCJzdWIiOiJBQzA0N2U5ZDMwYTlhYjRlZWY1MGViZGM3NGMyYmMxNjJkIn0.J2M9ZDSrd8rq3w3FPJojkRjQ3w2ovEFGdLbYMr7jcyU',0,NULL,NULL,NULL,'Tue Jan 23 20:24:14 UTC 2018',0,NULL,NULL,'',NULL),(64,'arie',NULL,'0546622223','ariemaor123@gmail.com','e35d7a5768c4b85b4780384d55dc3620',0,NULL,0,32.0991,34.881,0,NULL,'023038698',NULL,1,'eyJjdHkiOiJ0d2lsaW8tZnBhO3Y9MSIsInR5cCI6IkpXVCIsImFsZyI6IkhTMjU2In0.eyJpc3MiOiJTSzY3YjMyNjFjNTQzNDBiZmI2YzJkMDk2ZmRhYWI2Y2FmIiwiZXhwIjoxNTE2ODE2MTkwLCJncmFudHMiOnsiaWRlbnRpdHkiOiIwNTQ2NjIyMjIzIiwiY2hhdCI6eyJzZXJ2aWNlX3NpZCI6Ik1HMjY1ZWQzZjcxZGQ2ZjRhY2Y1MTNhYzAyZWU2NjcyMTEiLCJkZXBsb3ltZW50X3JvbGVfc2lkIjpudWxsLCJlbmRwb2ludF9pZCI6Im1vYmljYXJTZXJ2ZXI6MDU0NjYyMjIyMzo4MDJlODJjNzExMjcxNDdkIiwicHVzaF9jcmVkZW50aWFsX3NpZCI6bnVsbH19LCJqdGkiOiJTSzY3YjMyNjFjNTQzNDBiZmI2YzJkMDk2ZmRhYWI2Y2FmLTE1MTY4MTI2NzIiLCJzdWIiOiJBQzA0N2U5ZDMwYTlhYjRlZWY1MGViZGM3NGMyYmMxNjJkIn0.btTdC-8vdK4PgKxGKQ9Uzf-jVczq3YmxdJvgemCzUHU',0,NULL,NULL,NULL,'Fri Jan 26 09:22:19 UTC 2018',0,NULL,NULL,'023038698',NULL),(65,'arie',NULL,'+972546622223','arie.melul@teva.co.il','49d4b2faeb4b7b9e745775793141e2b2',0,NULL,0,32.0996,34.8809,0,NULL,'022757090',NULL,1,'eyJjdHkiOiJ0d2lsaW8tZnBhO3Y9MSIsInR5cCI6IkpXVCIsImFsZyI6IkhTMjU2In0.eyJpc3MiOiJTSzY3YjMyNjFjNTQzNDBiZmI2YzJkMDk2ZmRhYWI2Y2FmIiwiZXhwIjoxNTE2OTYyNTM3LCJncmFudHMiOnsiaWRlbnRpdHkiOiIrOTcyNTQ2NjIyMjIzIiwiY2hhdCI6eyJzZXJ2aWNlX3NpZCI6Ik1HMjY1ZWQzZjcxZGQ2ZjRhY2Y1MTNhYzAyZWU2NjcyMTEiLCJkZXBsb3ltZW50X3JvbGVfc2lkIjpudWxsLCJlbmRwb2ludF9pZCI6Im1vYmljYXJTZXJ2ZXI6Kzk3MjU0NjYyMjIyMzo4MDJlODJjNzExMjcxNDdkIiwicHVzaF9jcmVkZW50aWFsX3NpZCI6bnVsbH19LCJqdGkiOiJTSzY3YjMyNjFjNTQzNDBiZmI2YzJkMDk2ZmRhYWI2Y2FmLTE1MTY5NTg4NDgiLCJzdWIiOiJBQzA0N2U5ZDMwYTlhYjRlZWY1MGViZGM3NGMyYmMxNjJkIn0.1_-pHSjSh3rutJSF8O6Kicjk36dxnkIi6_cDIk6IGbE',0,NULL,NULL,NULL,'Fri Jan 26 09:28:57 UTC 2018',0,NULL,NULL,'',NULL);
/*!40000 ALTER TABLE `sproviders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-07 17:51:41
