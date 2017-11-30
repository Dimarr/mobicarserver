-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mobi1
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Temporary view structure for view `availableservice`
--

DROP TABLE IF EXISTS `availableservice`;
/*!50001 DROP VIEW IF EXISTS `availableservice`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `availableservice` AS SELECT 
 1 AS `spname`,
 1 AS `spphone`,
 1 AS `spaddress`,
 1 AS `rating`,
 1 AS `price`,
 1 AS `sname`,
 1 AS `sid`,
 1 AS `spid`*/;
SET character_set_client = @saved_cs_client;

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls`
--

LOCK TABLES `calls` WRITE;
/*!40000 ALTER TABLE `calls` DISABLE KEYS */;
INSERT INTO `calls` VALUES (1,'2016-08-21 00:00:00',1,2,1,'Testing 1',1),(2,'2016-08-21 00:00:00',1,1,1,'Testing 2',1),(3,'2016-08-21 00:00:00',1,2,3,'Testing 3',2),(4,'2016-08-25 00:00:00',1,1,2,'Something...',2),(5,'2016-08-25 00:00:00',1,2,1,'Something...',3),(6,'2016-08-25 00:00:00',1,2,1,'Something...',3),(7,'2016-08-26 00:00:00',1,1,2,'Something...',3),(8,'2016-08-26 00:00:00',1,3,1,'Something...',3),(9,'2016-08-29 00:00:00',1,1,1,'Something...',2),(10,'2016-09-03 00:00:00',1,1,1,'Something...',2),(11,'2016-09-04 00:00:00',1,2,1,'New detail',2),(12,'2016-09-05 00:00:00',1,2,1,'23ee',2),(13,'2016-09-05 00:00:00',1,2,1,'urgent call',2),(14,'2016-09-05 00:00:00',1,1,1,'call number 10',2),(15,'2016-09-06 00:00:00',1,2,2,'test',2),(16,'2016-09-06 00:00:00',1,2,1,'bbbb',1),(17,'2016-09-11 00:00:00',1,1,1,'test 2345',1),(18,'2016-09-17 00:00:00',1,2,1,'Real 1',1),(19,'2016-09-17 00:00:00',1,2,2,'Real 2',1),(20,'2016-09-17 00:00:00',1,1,2,'Real3',1),(21,'2016-09-17 00:00:00',1,2,1,'y',1),(22,'2016-09-17 00:00:00',1,1,2,'lll',1),(23,'2016-09-17 00:00:00',1,2,1,'kkkk',3);
/*!40000 ALTER TABLE `calls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `callstatus`
--

DROP TABLE IF EXISTS `callstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `callstatus` (
  `statusid` int(11) NOT NULL,
  `statusname` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`statusid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `callstatus`
--

LOCK TABLES `callstatus` WRITE;
/*!40000 ALTER TABLE `callstatus` DISABLE KEYS */;
INSERT INTO `callstatus` VALUES (1,'New'),(2,'In Process'),(3,'Rejected'),(4,'Closed');
/*!40000 ALTER TABLE `callstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartype`
--

DROP TABLE IF EXISTS `cartype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typename` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartype`
--

LOCK TABLES `cartype` WRITE;
/*!40000 ALTER TABLE `cartype` DISABLE KEYS */;
INSERT INTO `cartype` VALUES (1,'Flat Tire-Heavy Truck'),(2,'Flat Tire-Light Duty'),(3,'Tow track'),(4,'Other');
/*!40000 ALTER TABLE `cartype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `payid` int(11) NOT NULL AUTO_INCREMENT,
  `details` longtext NOT NULL,
  `userid` int(11) NOT NULL,
  `spid` int(11) NOT NULL,
  `pdate` datetime NOT NULL,
  `amount` double NOT NULL,
  `pstatus` int(11) NOT NULL,
  PRIMARY KEY (`payid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,'Real3',1,1,'2016-09-19 00:00:00',59,2),(2,'Payment for order: Something...',1,1,'2016-09-20 00:00:00',150.5,2),(3,'Payment for order: Real3',1,1,'2016-09-20 00:00:00',59,2),(4,'Payment for order: Testing 3',1,2,'2016-10-01 00:00:00',90,2),(5,'Payment for order: Something...',1,2,'2016-11-06 00:00:00',100,1),(6,'Payment for order: Something...',1,2,'2016-11-09 00:00:00',100,1),(7,'Payment for order: Something...',1,2,'2016-12-03 00:00:00',100,1),(8,'Payment for order: Something...',1,2,'2016-12-03 00:00:00',100,1);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentstatus`
--

DROP TABLE IF EXISTS `paymentstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paymentstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pstatus` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentstatus`
--

LOCK TABLES `paymentstatus` WRITE;
/*!40000 ALTER TABLE `paymentstatus` DISABLE KEYS */;
INSERT INTO `paymentstatus` VALUES (1,'New'),(2,'Accepted'),(3,'Declined');
/*!40000 ALTER TABLE `paymentstatus` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COMMENT='Catalog of options for point calculation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pointcatalog`
--

LOCK TABLES `pointcatalog` WRITE;
/*!40000 ALTER TABLE `pointcatalog` DISABLE KEYS */;
INSERT INTO `pointcatalog` VALUES (7,'Availability ',11,'Yes',15,' SP mentioned during registration that he is available between specific hours'),(8,'Availability ',12,'No',0,'No available'),(9,'Diploma',21,'Yes',20,'Certificate'),(10,'Diploma',22,'No',10,'No Certificate');
/*!40000 ALTER TABLE `pointcatalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search`
--

DROP TABLE IF EXISTS `search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search` (
  `userid` int(11) NOT NULL,
  `spid` int(11) NOT NULL,
  `point` float DEFAULT '0',
  `date` datetime NOT NULL,
  KEY `usersp` (`userid`,`spid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search`
--

LOCK TABLES `search` WRITE;
/*!40000 ALTER TABLE `search` DISABLE KEYS */;
INSERT INTO `search` VALUES (1,1,69,'2016-12-21 20:33:56'),(2,1,66,'2016-12-21 20:49:13'),(2,2,64,'2016-12-21 20:49:13'),(5,1,84,'2016-12-28 12:33:15'),(8,8,65,'2016-12-29 12:12:07'),(4,1,63,'2017-01-10 17:08:04'),(4,2,58,'2017-01-10 17:08:04'),(4,3,63,'2017-01-10 17:08:04'),(4,4,43,'2017-01-10 17:08:04'),(4,8,71,'2017-01-10 17:08:04'),(4,6,63,'2017-01-10 17:08:04'),(4,6,53,'2017-01-10 17:08:05'),(4,7,85,'2017-01-10 17:08:05');
/*!40000 ALTER TABLE `search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicetype`
--

DROP TABLE IF EXISTS `servicetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicetype`
--

LOCK TABLES `servicetype` WRITE;
/*!40000 ALTER TABLE `servicetype` DISABLE KEYS */;
INSERT INTO `servicetype` VALUES (1,'Car evacuation'),(2,'Tire service'),(3,'Engine service');
/*!40000 ALTER TABLE `servicetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sproviders`
--

DROP TABLE IF EXISTS `sproviders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sproviders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `address` longtext,
  `phone` varchar(10) NOT NULL,
  `email` varchar(20) DEFAULT NULL,
  `password` varchar(45) NOT NULL,
  `rating` int(11) NOT NULL DEFAULT '0',
  `description` varchar(45) DEFAULT NULL,
  `votes` int(11) DEFAULT '0',
  `x` float DEFAULT NULL,
  `y` float DEFAULT NULL,
  `point` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sproviders`
--

LOCK TABLES `sproviders` WRITE;
/*!40000 ALTER TABLE `sproviders` DISABLE KEYS */;
INSERT INTO `sproviders` VALUES (1,'Avi Cohen','Rehovot','0545454000','t@t.com','12345',3,'Test provider',11,32.0167,34.7667,15),(2,'Moti Drix','Tel-Aviv','0556666661','123@rr.com','54321',4,'Second guy',2,32.0809,34.7806,20),(3,'Shmulik','Holon','0521234561','sp4@t.com','374374037b6bdd2d23c18d942f301ea5',5,'all car engine issues',5,32.5796,34.2309,25),(4,'Roni','Ramla','3333333','sp5@t.com','e10adc3949ba59abbe56e057f20f883e',1,'uuuu',1,32.9898,34.2128,5),(5,'Avivit','TA','1231234566','sp2@gmail.com','1055a6af5021cde88b928143ed6a93bf',1,'all services',5,32.6542,34.0009,5),(6,'Yonathan','Holon rotshild','123123456','11@r.com','c6f057b86584942e415435ffb1fa93d4',3,'null',5,32.5555,34.1,15),(7,'Goldi','TA','0556699669','123@r.com','698d51a19d8a121ce581499d7b701668',4,'test new',5,32.0167,34.7669,20),(8,'Ori',' Haifa','0505050501','1@1.com','698d51a19d8a121ce581499d7b701668',5,'best repair',10,32.8184,34.9885,25);
/*!40000 ALTER TABLE `sproviders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spservices`
--

DROP TABLE IF EXISTS `spservices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spservices` (
  `spid` int(11) NOT NULL,
  `serviceid` int(11) NOT NULL,
  `price` float NOT NULL,
  `availl` int(11) DEFAULT NULL,
  `prof` int(11) DEFAULT NULL,
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `cartype` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spservices`
--

LOCK TABLES `spservices` WRITE;
/*!40000 ALTER TABLE `spservices` DISABLE KEYS */;
INSERT INTO `spservices` VALUES (1,1,170,11,21,2,1),(2,1,250,11,22,3,2),(3,1,100,12,21,6,1),(3,1,300,11,22,7,2),(4,1,170,11,22,8,1),(4,1,70,12,21,9,2),(8,1,125,11,22,10,2),(6,1,400,11,21,11,1),(6,1,500,11,22,12,2),(7,1,75,11,21,13,2);
/*!40000 ALTER TABLE `spservices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(15) NOT NULL,
  `lastname` varchar(15) NOT NULL,
  `creditcard` varchar(16) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `cartype` int(11) DEFAULT '1',
  UNIQUE KEY `userid_UNIQUE` (`userid`),
  UNIQUE KEY `creditcard_UNIQUE` (`creditcard`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='Users table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Jacob','Hefer','1234456778901357','test@gnail.com','12345!','123000000',1),(2,'Joni','Layer','1111222233334444','s@gnail.com','33334444','789654123',2),(3,'Lior','Levin','0000999900009999','rt@rt.com','6539250f2b769ac7d67c1fcfd752afa4','0555556666',2),(4,'Mor','Sher','8888777766661111','mor@r.com','dfb74ac16b8aaeab62aa968e0e8ff14a','0545454542',2),(5,'Amit','Sher','123456789012345','amit@rt.com','202cb962ac59075b964b07152d234b70','0551234560',1),(6,'rafi','levi','1234','rafi@gmail.com','2222','333333',2),(9,'dan','dan','253110920','dan@gmail.com','111111','1234567890',2),(10,'','','16067942','','','',1),(11,'','','16069092','','','',1),(12,'yaor','yaor','18999670','yair@gmail.com','3478','123',2),(13,'danorl','danorl','48195414','ghj','767','080',2),(14,'dan','dan','48221889','','1234','',2),(15,'ori heilman','ori heilman','58175726','ori@mobicar.co.il','orgil127','0523952857',2),(16,'yair','yair','211693214','yair@gmail.com','345','2222',1),(17,'Ab','Ab','220766854','gershonavi@gmail.com','1','0524849916',1),(18,'','','110245807','','','',1),(19,'','','110308482','','','',1),(20,'ran','ran','174310041','ranyakov@gmail.com','123456','0505760426',1),(21,'rany yakov','rany yakov','178060134','ranyakov@gmail.com','123456','0505760426',1),(22,'ran yakov','ran yakov','178453837','ranyakov@gmail.com','123456','0505760426',1),(23,'ayelet','levi','4501','270@gmai.com','a9b7ba70783b617e9998dc4dd82eb3c5','05400003',1),(24,'aa','bb','12','b@ll.com','e4da3b7fbbce2345d7772b0674a318d5','00000',1),(26,'S','R','1','r@ll.com','698d51a19d8a121ce581499d7b701668','01',1),(27,'Shon','Richter','1234123456784567','333@ll.com','202cb962ac59075b964b07152d234b70','0541234563',1),(28,'g','g','267719581','g@gmail.com','49ae49a23f67c759bf4fc791ba842aa2','258',1),(29,'r','r','15361778','f','d1f491a404d6854880943e5c3cd9ca25','5',1),(30,'','','115834807','','','',1),(31,'t','t','120579384','g@m.com','a87ff679a2f3e71d9181a67b7542122c','5',1),(33,'Shon','Richter','100000000000000','333@ll.com','202cb962ac59075b964b07152d234b70','0541234563',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mobi1'
--
/*!50003 DROP PROCEDURE IF EXISTS `setpoint` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `setpoint`(in servid int, in usrid int, in Xuser float, in Yuser float)
BEGIN
   DECLARE spd int;
   DECLARE serviceprice float;
   DECLARE avid int;
   DECLARE prfid int;
   DECLARE av int;
   DECLARE prf int;
   DECLARE pointtotal int;
   DECLARE Xsp float;
   DECLARE Ysp float;

   DECLARE v_finished INTEGER DEFAULT 0;
   DECLARE cur cursor for select prof, price, availl, spid FROM spservices 
						where (serviceid=servid) or (servid=0);
   DECLARE CONTINUE HANDLER 
   FOR NOT FOUND SET v_finished = 1;
   
   DELETE FROM search WHERE userid=usrid;
   COMMIT;
   
   open cur;

    start_loop: loop
        fetch cur into prfid,serviceprice,avid,spd;
        if v_finished=1 then 
            leave start_loop;
        end if;

        SELECT point into prf FROM pointcatalog where optionid=prfid;
        SELECT point into av  FROM pointcatalog where optionid=avid;
        
		IF (av = 0) THEN SET pointtotal = -1; 
        ELSE
			SET pointtotal = 0;
			SELECT X,Y, point into Xsp,Ysp,pointtotal FROM sproviders WHERE id = spd;    
			
            SET pointtotal =  pointtotal + CASE WHEN sqrt((Xuser-Xsp)*(Xuser-Xsp)+(Yuser-Ysp)*(Yuser-Ysp))*111<5 THEN 15 ELSE 0 END +
			CASE WHEN sqrt((Xuser-Xsp)*(Xuser-Xsp)+(Yuser-Ysp)*(Yuser-Ysp))*111>=5 AND sqrt((Xuser-Xsp)*(Xuser-Xsp)+(Yuser-Ysp)*(Yuser-Ysp))*111<10 THEN 10 ELSE 0 END +
			CASE WHEN sqrt((Xuser-Xsp)*(Xuser-Xsp)+(Yuser-Ysp)*(Yuser-Ysp))*111>=10 THEN 5 ELSE 0 END;	
    
			SET pointtotal =  av+prf+pointtotal + CASE WHEN serviceprice >=150 THEN 8 ELSE 0 END + CASE WHEN serviceprice < 100 THEN 25 ELSE 0 END
            + CASE WHEN (serviceprice >=100) and (serviceprice <150) THEN 16 ELSE 0 END;

		END IF;
		
        IF pointtotal > 0 THEN
			INSERT INTO search (userid,spid,point,date) VALUES (usrid,spd,pointtotal,NOW());
            COMMIT;
        END IF;    
    end loop;
   close cur;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `availableservice`
--

/*!50001 DROP VIEW IF EXISTS `availableservice`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `availableservice` AS select `sproviders`.`name` AS `spname`,`sproviders`.`phone` AS `spphone`,`sproviders`.`address` AS `spaddress`,`sproviders`.`rating` AS `rating`,`spservices`.`price` AS `price`,`servicetype`.`name` AS `sname`,`spservices`.`serviceid` AS `sid`,`spservices`.`spid` AS `spid` from ((`sproviders` join `spservices`) join `servicetype`) where ((`sproviders`.`id` = `spservices`.`spid`) and (`spservices`.`serviceid` = `servicetype`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-10 17:13:21
