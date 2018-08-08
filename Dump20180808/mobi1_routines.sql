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
-- Temporary table structure for view `paymesellers`
--

DROP TABLE IF EXISTS `paymesellers`;
/*!50001 DROP VIEW IF EXISTS `paymesellers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `paymesellers` (
  `seller_first_name` tinyint NOT NULL,
  `seller_last_name` tinyint NOT NULL,
  `seller_merchant_name` tinyint NOT NULL,
  `seller_description` tinyint NOT NULL,
  `seller_inc_code` tinyint NOT NULL,
  `seller_social_id` tinyint NOT NULL,
  `seller_bank_code` tinyint NOT NULL,
  `seller_bank_branch` tinyint NOT NULL,
  `seller_bank_account_number` tinyint NOT NULL,
  `seller_gender` tinyint NOT NULL,
  `seller_inc` tinyint NOT NULL,
  `seller_person_business_type` tinyint NOT NULL,
  `seller_birthdate` tinyint NOT NULL,
  `seller_social_id_issued` tinyint NOT NULL,
  `seller_address_city` tinyint NOT NULL,
  `seller_address_street` tinyint NOT NULL,
  `seller_address_street_number` tinyint NOT NULL,
  `seller_site_url` tinyint NOT NULL,
  `seller_address_country` tinyint NOT NULL,
  `seller_file_social_id` tinyint NOT NULL,
  `seller_file_cheque` tinyint NOT NULL,
  `seller_file_corporate` tinyint NOT NULL,
  `seller_email` tinyint NOT NULL,
  `seller_phone` tinyint NOT NULL,
  `seller_id` tinyint NOT NULL,
  `id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `searchservice`
--

DROP TABLE IF EXISTS `searchservice`;
/*!50001 DROP VIEW IF EXISTS `searchservice`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `searchservice` (
  `spid` tinyint NOT NULL,
  `SPname` tinyint NOT NULL,
  `address` tinyint NOT NULL,
  `phone` tinyint NOT NULL,
  `votes` tinyint NOT NULL,
  `rating` tinyint NOT NULL,
  `pic` tinyint NOT NULL,
  `price` tinyint NOT NULL,
  `serviceid` tinyint NOT NULL,
  `servicename` tinyint NOT NULL,
  `subserviceid` tinyint NOT NULL,
  `subservicename` tinyint NOT NULL,
  `locationid` tinyint NOT NULL,
  `locationname` tinyint NOT NULL,
  `Diploma` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `listusersadmin`
--

DROP TABLE IF EXISTS `listusersadmin`;
/*!50001 DROP VIEW IF EXISTS `listusersadmin`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `listusersadmin` (
  `userid` tinyint NOT NULL,
  `firstname` tinyint NOT NULL,
  `lastname` tinyint NOT NULL,
  `phone` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `logined` tinyint NOT NULL,
  `logtime` tinyint NOT NULL,
  `statusonline` tinyint NOT NULL,
  `rating` tinyint NOT NULL,
  `carid` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `listspadmin`
--

DROP TABLE IF EXISTS `listspadmin`;
/*!50001 DROP VIEW IF EXISTS `listspadmin`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `listspadmin` (
  `rating` tinyint NOT NULL,
  `id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `phone` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `logined` tinyint NOT NULL,
  `paymeapprove` tinyint NOT NULL,
  `statusonline` tinyint NOT NULL,
  `paymestatus` tinyint NOT NULL,
  `logtime` tinyint NOT NULL,
  `carid` tinyint NOT NULL,
  `pic` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `Requests`
--

DROP TABLE IF EXISTS `Requests`;
/*!50001 DROP VIEW IF EXISTS `Requests`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `Requests` (
  `userid` tinyint NOT NULL,
  `callid` tinyint NOT NULL,
  `Status` tinyint NOT NULL,
  `StatusID` tinyint NOT NULL,
  `Service` tinyint NOT NULL,
  `SPID` tinyint NOT NULL,
  `RequestDate` tinyint NOT NULL,
  `SPName` tinyint NOT NULL,
  `RequestDetails` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `CarList`
--

DROP TABLE IF EXISTS `CarList`;
/*!50001 DROP VIEW IF EXISTS `CarList`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `CarList` (
  `RequestDate` tinyint NOT NULL,
  `brand` tinyint NOT NULL,
  `model` tinyint NOT NULL,
  `carid` tinyint NOT NULL,
  `userid` tinyint NOT NULL,
  `SPID` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `availableservice`
--

DROP TABLE IF EXISTS `availableservice`;
/*!50001 DROP VIEW IF EXISTS `availableservice`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `availableservice` (
  `spname` tinyint NOT NULL,
  `spphone` tinyint NOT NULL,
  `spaddress` tinyint NOT NULL,
  `rating` tinyint NOT NULL,
  `price` tinyint NOT NULL,
  `sname` tinyint NOT NULL,
  `sid` tinyint NOT NULL,
  `spid` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `paymesellers`
--

/*!50001 DROP TABLE IF EXISTS `paymesellers`*/;
/*!50001 DROP VIEW IF EXISTS `paymesellers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `paymesellers` AS select `sproviders`.`name` AS `seller_first_name`,`sellers`.`seller_last_name` AS `seller_last_name`,`sellers`.`seller_merchant_name` AS `seller_merchant_name`,`sproviders`.`description` AS `seller_description`,`sproviders`.`BN` AS `seller_inc_code`,`sproviders`.`BNID` AS `seller_social_id`,`sproviders`.`bankid` AS `seller_bank_code`,`sproviders`.`bankbranch` AS `seller_bank_branch`,`sproviders`.`bankaccount` AS `seller_bank_account_number`,`sellers`.`seller_gender` AS `seller_gender`,`sellers`.`seller_inc` AS `seller_inc`,`sellers`.`seller_person_business_type` AS `seller_person_business_type`,date_format(`sellers`.`seller_birthdate`,'%d/%m/%Y') AS `seller_birthdate`,date_format(`sellers`.`seller_social_id_issued`,'%d/%m/%Y') AS `seller_social_id_issued`,`sellers`.`seller_address_city` AS `seller_address_city`,`sellers`.`seller_address_street` AS `seller_address_street`,`sellers`.`seller_address_street_number` AS `seller_address_street_number`,`sellers`.`seller_site_url` AS `seller_site_url`,`sellers`.`seller_address_country` AS `seller_address_country`,`sellers`.`file_social_id` AS `seller_file_social_id`,`sellers`.`file_cheque` AS `seller_file_cheque`,`sellers`.`file_corporate` AS `seller_file_corporate`,`sproviders`.`email` AS `seller_email`,`sproviders`.`phone` AS `seller_phone`,`sproviders`.`sellerid` AS `seller_id`,`sproviders`.`id` AS `id` from (`sproviders` join `sellers`) where (`sproviders`.`id` = `sellers`.`spid`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `searchservice`
--

/*!50001 DROP TABLE IF EXISTS `searchservice`*/;
/*!50001 DROP VIEW IF EXISTS `searchservice`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `searchservice` AS select `sproviders`.`id` AS `spid`,`sproviders`.`name` AS `SPname`,`sproviders`.`address` AS `address`,`sproviders`.`phone` AS `phone`,`sproviders`.`votes` AS `votes`,`sproviders`.`rating` AS `rating`,`sproviders`.`pic` AS `pic`,`spservices`.`price` AS `price`,`spservices`.`serviceid` AS `serviceid`,`servicetype`.`name` AS `servicename`,`cartype`.`id` AS `subserviceid`,`cartype`.`typename` AS `subservicename`,`pointcatalog`.`OptionID` AS `locationid`,`pointcatalog`.`Optionname` AS `locationname`,if((`spservices`.`prof` = 21),'Yes','No') AS `Diploma` from ((((`cartype` join `sproviders`) join `spservices`) join `servicetype`) join `pointcatalog`) where ((`sproviders`.`id` = `spservices`.`spid`) and (`spservices`.`serviceid` = `servicetype`.`id`) and (`cartype`.`id` = `spservices`.`cartype`) and (`servicetype`.`id` = `spservices`.`serviceid`) and (`spservices`.`availl` = `pointcatalog`.`OptionID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `listusersadmin`
--

/*!50001 DROP TABLE IF EXISTS `listusersadmin`*/;
/*!50001 DROP VIEW IF EXISTS `listusersadmin`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `listusersadmin` AS select `users`.`userid` AS `userid`,`users`.`firstname` AS `firstname`,`users`.`lastname` AS `lastname`,`users`.`phone` AS `phone`,`users`.`email` AS `email`,`users`.`logined` AS `logined`,date_format(convert_tz(concat(substr(`users`.`logtime`,25,4),'-',month(str_to_date(substr(`users`.`logtime`,5,3),'%b')),'-',substr(`users`.`logtime`,10,2),' ',substr(`users`.`logtime`,12,8)),'+00:00','+03:00'),'%d %b %Y %H:%i:%s') AS `logtime`,if((`users`.`logined` = 0),'Offline','Online') AS `statusonline`,round((`users`.`point` / 5),0) AS `rating`,`users`.`carid` AS `carid` from `users` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `listspadmin`
--

/*!50001 DROP TABLE IF EXISTS `listspadmin`*/;
/*!50001 DROP VIEW IF EXISTS `listspadmin`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `listspadmin` AS select round((`sproviders`.`point` / 5),0) AS `rating`,`sproviders`.`id` AS `id`,`sproviders`.`name` AS `name`,`sproviders`.`phone` AS `phone`,`sproviders`.`email` AS `email`,`sproviders`.`logined` AS `logined`,`sproviders`.`paymeapprove` AS `paymeapprove`,if((`sproviders`.`logined` = 0),'Offline','Online') AS `statusonline`,`paymeapprovestatus`.`name` AS `paymestatus`,date_format(convert_tz(concat(substr(`sproviders`.`logtime`,25,4),'-',month(str_to_date(substr(`sproviders`.`logtime`,5,3),'%b')),'-',substr(`sproviders`.`logtime`,10,2),' ',substr(`sproviders`.`logtime`,12,8)),'+00:00','+03:00'),'%d %b %Y %H:%i:%s') AS `logtime`,`sproviders`.`carid` AS `carid`,`sproviders`.`pic` AS `pic` from (`sproviders` join `paymeapprovestatus`) where (`sproviders`.`paymeapprove` = `paymeapprovestatus`.`id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Requests`
--

/*!50001 DROP TABLE IF EXISTS `Requests`*/;
/*!50001 DROP VIEW IF EXISTS `Requests`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Requests` AS select `calls`.`userid` AS `userid`,`calls`.`callid` AS `callid`,`callstatus`.`statusname` AS `Status`,`callstatus`.`statusid` AS `StatusID`,`servicetype`.`name` AS `Service`,`calls`.`spid` AS `SPID`,`calls`.`cdate` AS `RequestDate`,`sproviders`.`name` AS `SPName`,`calls`.`details` AS `RequestDetails` from (((`calls` join `servicetype`) join `sproviders`) join `callstatus`) where ((`calls`.`spid` = `sproviders`.`id`) and (`calls`.`serviceid` = `servicetype`.`id`) and (`calls`.`status` = `callstatus`.`statusid`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `CarList`
--

/*!50001 DROP TABLE IF EXISTS `CarList`*/;
/*!50001 DROP VIEW IF EXISTS `CarList`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `CarList` AS select `Requests`.`RequestDate` AS `RequestDate`,`carbrand`.`name` AS `brand`,`carmodel`.`name` AS `model`,`users`.`carid` AS `carid`,`users`.`userid` AS `userid`,`Requests`.`SPID` AS `SPID` from (((`Requests` join `users`) join `carbrand`) join `carmodel`) where ((`Requests`.`userid` = `users`.`userid`) and ((`users`.`carbm` DIV 10) = `carbrand`.`id`) and ((`users`.`carbm` % 10) = `carmodel`.`id`) and (`Requests`.`StatusID` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `availableservice`
--

/*!50001 DROP TABLE IF EXISTS `availableservice`*/;
/*!50001 DROP VIEW IF EXISTS `availableservice`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `availableservice` AS select `sproviders`.`name` AS `spname`,`sproviders`.`phone` AS `spphone`,`sproviders`.`address` AS `spaddress`,`sproviders`.`rating` AS `rating`,`spservices`.`price` AS `price`,`servicetype`.`name` AS `sname`,`spservices`.`serviceid` AS `sid`,`spservices`.`spid` AS `spid` from ((`sproviders` join `spservices`) join `servicetype`) where ((`sproviders`.`id` = `spservices`.`spid`) and (`spservices`.`serviceid` = `servicetype`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping routines for database 'mobi1'
--
/*!50003 DROP PROCEDURE IF EXISTS `archivecalls` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `archivecalls`(in period int)
BEGIN
INSERT INTO archive_calls (userid,spid,cdate,details,serviceid, status) 
SELECT userid,spid,cdate,details,serviceid,status FROM calls
WHERE cdate < now()-period AND status>2;

DELETE FROM calls WHERE cdate < now()-period AND status>2;
COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `setpoint` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `setpoint`(in servid int, in usrid int, in Xuser float, in Yuser float)
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
/*!50003 DROP PROCEDURE IF EXISTS `setpointnew` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `setpointnew`(in servid int, in usrid int, in Xuser float, in Yuser float)
BEGIN
   DECLARE spd int;
   DECLARE countsp int;
   DECLARE srtprice int;
   DECLARE prfid int;
   DECLARE pointtotal float;
   DECLARE Xsp float;
   DECLARE Ysp float;
   DECLARE dst float;
   DECLARE iOrd int default 1;
   

   DECLARE v_finished INTEGER DEFAULT 0;
   
   DECLARE cur cursor for select distinct spid FROM spservices, sproviders 
						where (spservices.serviceid=servid) AND 
                        (sproviders.id=spservices.spid) AND (sproviders.logined=1) AND (sproviders.busy=0) AND (sproviders.paymeapprove>0)
                        order by price;
   
   DECLARE cur1 cursor for select sortprice FROM search
						where (userid=usrid) order by dist DESC;

   DECLARE CONTINUE HANDLER 
   FOR NOT FOUND SET v_finished = 1;
   

   DELETE FROM search WHERE userid=usrid;
   COMMIT;
   
   open cur;

    start_loop: loop
        fetch cur into spd;
        -- select spd;
        if v_finished=1 then 
            leave start_loop;
        END if;
		SET Xsp=-1;
		SET Ysp=-1;
        SELECT X,Y point into Xsp,Ysp FROM coordinate WHERE spuser=1 and uid=spd order by ltime desc LIMIT 1;
        -- select Xsp,Ysp;
        if Xsp<0 then
                SELECT X,Y point into Xsp,Ysp FROM sproviders WHERE id = spd;    
                SET v_finished = 0;
                 -- select spd, Xsp,Ysp;
        end if;         
        SET dst = sqrt((Xuser-Xsp)*(Xuser-Xsp)+(Yuser-Ysp)*(Yuser-Ysp));
		-- select dst, spd, Xsp,Ysp;        
		INSERT INTO search (userid,spid,dist,sortprice,date,X,Y) VALUES (usrid,spd,dst,iOrd,NOW(),Xsp,Ysp);
                
        SET iOrd= iOrd+1;
        -- select iOrd,v_finished,spd;
    END loop;
   close cur;
   COMMIT;

   SET v_finished = 0 ;
   SET countsp = iOrd-1;
	-- select countsp;
   SET iOrd = 1;	
   open cur1;

    start_loop: loop
        fetch cur1 into srtprice;
        if v_finished=1 then 
            leave start_loop;
        END if;

		SET pointtotal = (0.3*srtprice+0.7*iOrd)/countsp;
        -- select srtprice,iOrd,countsp,pointtotal;
		UPDATE search SET point= pointtotal WHERE (userid=usrid) AND (sortprice=srtprice);
        SET iOrd= iOrd+1;
    END loop;
   close cur1;
   COMMIT;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `showmap` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `showmap`(in clid int, out x1 float, out y1 float, out x2 float, out y2 float)
BEGIN
   DECLARE spd int;
   DECLARE usrd int;
   DECLARE XX float;
   DECLARE YY float;
   
		SET spd=-1;
        SET usrd=-1;
        SET x1=0,y1=0,x2=0,y2=0;
        
        SELECT spid, userid INTO spd,usrd FROM calls WHERE callid=clid;
        if (spd>0) then
			SET XX=-1,YY=-1;
			SELECT X,Y into XX,YY FROM coordinate WHERE spuser=1 and uid=spd order by ltime desc LIMIT 1;
			if XX<0 then
                SELECT x,y into XX,YY FROM sproviders WHERE id = spd;    
			end if;         
            SET x2=XX,y2=YY;
            
			SET XX=-1,YY=-1;
			SELECT X,Y into XX,YY FROM coordinate WHERE spuser=2 and uid=usrd order by ltime desc LIMIT 1;

			if XX<0 then
                SELECT X,Y into XX,YY FROM users WHERE userid = usrd;    
			end if;         
            SET x1=XX,y1=YY;
		end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-08 19:04:24
