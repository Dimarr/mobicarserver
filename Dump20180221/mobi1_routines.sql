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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-21  9:35:33
