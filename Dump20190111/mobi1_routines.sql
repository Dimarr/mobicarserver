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
  `carbrand` tinyint NOT NULL,
  `carmodel` tinyint NOT NULL,
  `carpic` tinyint NOT NULL,
  `logtime` tinyint NOT NULL,
  `statusonline` tinyint NOT NULL,
  `rating` tinyint NOT NULL,
  `carid` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `brandmodellist`
--

DROP TABLE IF EXISTS `brandmodellist`;
/*!50001 DROP VIEW IF EXISTS `brandmodellist`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `brandmodellist` (
  `brandname` tinyint NOT NULL,
  `modelname` tinyint NOT NULL,
  `brandid` tinyint NOT NULL,
  `modelid` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `paymentsstatus`
--

DROP TABLE IF EXISTS `paymentsstatus`;
/*!50001 DROP VIEW IF EXISTS `paymentsstatus`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `paymentsstatus` (
  `payid` tinyint NOT NULL,
  `userid` tinyint NOT NULL,
  `spid` tinyint NOT NULL,
  `pdate` tinyint NOT NULL,
  `amountstart` tinyint NOT NULL,
  `pstatus` tinyint NOT NULL,
  `paymetrid` tinyint NOT NULL,
  `details` tinyint NOT NULL,
  `saleurl` tinyint NOT NULL,
  `callid` tinyint NOT NULL,
  `finalamount` tinyint NOT NULL,
  `installments` tinyint NOT NULL,
  `pstatusname` tinyint NOT NULL
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
  `points` tinyint NOT NULL,
  `id` tinyint NOT NULL,
  `votes` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `phone` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `logined` tinyint NOT NULL,
  `busy` tinyint NOT NULL,
  `paymeapprove` tinyint NOT NULL,
  `statusonline` tinyint NOT NULL,
  `busystatus` tinyint NOT NULL,
  `paymestatus` tinyint NOT NULL,
  `logtime` tinyint NOT NULL,
  `carid` tinyint NOT NULL,
  `carbrand` tinyint NOT NULL,
  `carmodel` tinyint NOT NULL,
  `pic` tinyint NOT NULL,
  `carpic` tinyint NOT NULL
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
-- Temporary table structure for view `callsstatus`
--

DROP TABLE IF EXISTS `callsstatus`;
/*!50001 DROP VIEW IF EXISTS `callsstatus`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `callsstatus` (
  `callid` tinyint NOT NULL,
  `cdate` tinyint NOT NULL,
  `userid` tinyint NOT NULL,
  `spid` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `details` tinyint NOT NULL,
  `serviceid` tinyint NOT NULL,
  `rating` tinyint NOT NULL,
  `callstatus` tinyint NOT NULL,
  `statusname` tinyint NOT NULL,
  `servicename` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `userstatuscall`
--

DROP TABLE IF EXISTS `userstatuscall`;
/*!50001 DROP VIEW IF EXISTS `userstatuscall`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `userstatuscall` (
  `userid` tinyint NOT NULL,
  `spid` tinyint NOT NULL,
  `callid` tinyint NOT NULL,
  `calldate` tinyint NOT NULL,
  `statusname` tinyint NOT NULL,
  `servicename` tinyint NOT NULL,
  `serviceid` tinyint NOT NULL,
  `callstatus` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `pstatusname` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `requestssp`
--

DROP TABLE IF EXISTS `requestssp`;
/*!50001 DROP VIEW IF EXISTS `requestssp`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `requestssp` (
  `userid` tinyint NOT NULL,
  `callid` tinyint NOT NULL,
  `statusname` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `service` tinyint NOT NULL,
  `spid` tinyint NOT NULL,
  `cdate` tinyint NOT NULL,
  `rating` tinyint NOT NULL,
  `spname` tinyint NOT NULL,
  `spphone` tinyint NOT NULL,
  `details` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `installments` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `payments_temppayment`
--

DROP TABLE IF EXISTS `payments_temppayment`;
/*!50001 DROP VIEW IF EXISTS `payments_temppayment`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `payments_temppayment` (
  `paymentamount` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `callid` tinyint NOT NULL,
  `installments` tinyint NOT NULL
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
-- Temporary table structure for view `listpaymentsadmin`
--

DROP TABLE IF EXISTS `listpaymentsadmin`;
/*!50001 DROP VIEW IF EXISTS `listpaymentsadmin`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `listpaymentsadmin` (
  `userid` tinyint NOT NULL,
  `spid` tinyint NOT NULL,
  `spname` tinyint NOT NULL,
  `pic` tinyint NOT NULL,
  `username` tinyint NOT NULL,
  `pdate` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `details` tinyint NOT NULL,
  `saleid` tinyint NOT NULL,
  `pstatus` tinyint NOT NULL,
  `pstatusid` tinyint NOT NULL,
  `errortext` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `requestsuser`
--

DROP TABLE IF EXISTS `requestsuser`;
/*!50001 DROP VIEW IF EXISTS `requestsuser`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `requestsuser` (
  `callid` tinyint NOT NULL,
  `cdate` tinyint NOT NULL,
  `details` tinyint NOT NULL,
  `statusname` tinyint NOT NULL,
  `status` tinyint NOT NULL,
  `firstname` tinyint NOT NULL,
  `lastname` tinyint NOT NULL,
  `phone` tinyint NOT NULL,
  `spid` tinyint NOT NULL,
  `rating` tinyint NOT NULL,
  `service` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `installments` tinyint NOT NULL
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
/*!50001 VIEW `listusersadmin` AS select `users`.`userid` AS `userid`,`users`.`firstname` AS `firstname`,`users`.`lastname` AS `lastname`,`users`.`phone` AS `phone`,`users`.`email` AS `email`,`users`.`logined` AS `logined`,`carbrand`.`name` AS `carbrand`,`carmodel`.`name` AS `carmodel`,`users`.`carpic` AS `carpic`,`users`.`logtime` AS `logtime`,if((`users`.`logined` = 0),'Offline','Online') AS `statusonline`,round((`users`.`point` / 5),0) AS `rating`,`users`.`carid` AS `carid` from ((`users` left join `carbrand` on(((`users`.`carbm` DIV 1000) = `carbrand`.`id`))) left join `carmodel` on(((`users`.`carbm` % 1000) = `carmodel`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `brandmodellist`
--

/*!50001 DROP TABLE IF EXISTS `brandmodellist`*/;
/*!50001 DROP VIEW IF EXISTS `brandmodellist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `brandmodellist` AS select `carbrand`.`name` AS `brandname`,`carmodel`.`name` AS `modelname`,`carmodel`.`brandid` AS `brandid`,`carmodel`.`id` AS `modelid` from (`carbrand` join `carmodel`) where (`carmodel`.`brandid` = `carbrand`.`id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `paymentsstatus`
--

/*!50001 DROP TABLE IF EXISTS `paymentsstatus`*/;
/*!50001 DROP VIEW IF EXISTS `paymentsstatus`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `paymentsstatus` AS select `payments`.`payid` AS `payid`,`payments`.`userid` AS `userid`,`payments`.`spid` AS `spid`,`payments`.`pdate` AS `pdate`,`payments`.`amount` AS `amountstart`,`payments`.`pstatus` AS `pstatus`,`payments`.`paymetrid` AS `paymetrid`,`payments`.`details` AS `details`,`payments`.`saleurl` AS `saleurl`,`payments`.`callid` AS `callid`,if((`temppayment`.`finalamount` = 0),`payments`.`amount`,`temppayment`.`finalamount`) AS `finalamount`,`payments`.`installments` AS `installments`,`paymentstatus`.`pstatus` AS `pstatusname` from ((`payments` join `temppayment`) join `paymentstatus`) where ((`payments`.`pstatus` = `paymentstatus`.`id`) and (convert(`temppayment`.`paymesaleid` using utf8) = `payments`.`paymetrid`)) */;
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
/*!50001 VIEW `listspadmin` AS select round((`sproviders`.`point` / 5),0) AS `rating`,if((`sproviders`.`votes` = 0),0,round((`sproviders`.`rating` / `sproviders`.`votes`),2)) AS `points`,`sproviders`.`id` AS `id`,`sproviders`.`votes` AS `votes`,`sproviders`.`name` AS `name`,`sproviders`.`phone` AS `phone`,`sproviders`.`email` AS `email`,`sproviders`.`logined` AS `logined`,`sproviders`.`busy` AS `busy`,`sproviders`.`paymeapprove` AS `paymeapprove`,if((`sproviders`.`logined` = 0),'Offline','Online') AS `statusonline`,if((`sproviders`.`busy` = 0),'Available','Busy') AS `busystatus`,`paymeapprovestatus`.`name` AS `paymestatus`,`sproviders`.`logtime` AS `logtime`,`sproviders`.`carid` AS `carid`,`carbrand`.`name` AS `carbrand`,`carmodel`.`name` AS `carmodel`,`sproviders`.`pic` AS `pic`,`sproviders`.`carpic` AS `carpic` from (((`sproviders` join `paymeapprovestatus`) left join `carbrand` on(((`sproviders`.`carbm` DIV 1000) = `carbrand`.`id`))) left join `carmodel` on(((`sproviders`.`carbm` % 1000) = `carmodel`.`id`))) where (`sproviders`.`paymeapprove` = `paymeapprovestatus`.`id`) */;
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
-- Final view structure for view `callsstatus`
--

/*!50001 DROP TABLE IF EXISTS `callsstatus`*/;
/*!50001 DROP VIEW IF EXISTS `callsstatus`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `callsstatus` AS select `calls`.`callid` AS `callid`,`calls`.`cdate` AS `cdate`,`calls`.`userid` AS `userid`,`calls`.`spid` AS `spid`,`calls`.`status` AS `status`,`calls`.`details` AS `details`,`calls`.`serviceid` AS `serviceid`,`calls`.`rating` AS `rating`,`calls`.`status` AS `callstatus`,`callstatus`.`statusname` AS `statusname`,`servicetype`.`name` AS `servicename` from ((`calls` join `callstatus`) join `servicetype`) where ((`calls`.`status` = `callstatus`.`statusid`) and (`calls`.`serviceid` = `servicetype`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `userstatuscall`
--

/*!50001 DROP TABLE IF EXISTS `userstatuscall`*/;
/*!50001 DROP VIEW IF EXISTS `userstatuscall`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `userstatuscall` AS select `callsstatus`.`userid` AS `userid`,`callsstatus`.`spid` AS `spid`,`callsstatus`.`callid` AS `callid`,`callsstatus`.`cdate` AS `calldate`,`callsstatus`.`statusname` AS `statusname`,`callsstatus`.`servicename` AS `servicename`,`callsstatus`.`serviceid` AS `serviceid`,`callsstatus`.`callstatus` AS `callstatus`,if((`paymentsstatus`.`pstatus` = 2),`paymentsstatus`.`amountstart`,`paymentsstatus`.`finalamount`) AS `amount`,`paymentsstatus`.`pstatusname` AS `pstatusname` from (`paymentsstatus` join `callsstatus` on((`callsstatus`.`callid` = `paymentsstatus`.`callid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `requestssp`
--

/*!50001 DROP TABLE IF EXISTS `requestssp`*/;
/*!50001 DROP VIEW IF EXISTS `requestssp`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `requestssp` AS select `calls`.`userid` AS `userid`,`calls`.`callid` AS `callid`,`callstatus`.`statusname` AS `statusname`,`callstatus`.`statusid` AS `status`,`servicetype`.`name` AS `service`,`calls`.`spid` AS `spid`,date_format(convert_tz(`calls`.`cdate`,'+00:00','+03:00'),'%Y-%m-%d %H:%i') AS `cdate`,`calls`.`rating` AS `rating`,`sproviders`.`name` AS `spname`,`sproviders`.`phone` AS `spphone`,`calls`.`details` AS `details`,`payments_temppayment`.`amount` AS `amount`,`payments_temppayment`.`installments` AS `installments` from ((((`calls` join `servicetype`) join `sproviders`) join `callstatus`) join `payments_temppayment`) where ((`calls`.`spid` = `sproviders`.`id`) and (`calls`.`serviceid` = `servicetype`.`id`) and (`calls`.`callid` = `payments_temppayment`.`callid`) and (`calls`.`status` = `callstatus`.`statusid`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `payments_temppayment`
--

/*!50001 DROP TABLE IF EXISTS `payments_temppayment`*/;
/*!50001 DROP VIEW IF EXISTS `payments_temppayment`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `payments_temppayment` AS select `payments`.`amount` AS `paymentamount`,if(isnull(`temppayment`.`finalamount`),`payments`.`amount`,`temppayment`.`finalamount`) AS `amount`,`payments`.`callid` AS `callid`,`payments`.`installments` AS `installments` from (`payments` left join `temppayment` on((`payments`.`paymetrid` = convert(`temppayment`.`paymesaleid` using utf8)))) */;
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
/*!50001 VIEW `CarList` AS select `requestssp`.`cdate` AS `RequestDate`,`carbrand`.`name` AS `brand`,`carmodel`.`name` AS `model`,`users`.`carid` AS `carid`,`users`.`userid` AS `userid`,`requestssp`.`spid` AS `SPID` from (((`requestssp` join `users`) join `carbrand`) join `carmodel`) where ((`requestssp`.`userid` = `users`.`userid`) and ((`users`.`carbm` DIV 1000) = `carbrand`.`id`) and ((`users`.`carbm` % 1000) = `carmodel`.`id`) and (`requestssp`.`status` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `listpaymentsadmin`
--

/*!50001 DROP TABLE IF EXISTS `listpaymentsadmin`*/;
/*!50001 DROP VIEW IF EXISTS `listpaymentsadmin`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `listpaymentsadmin` AS select `users`.`userid` AS `userid`,`sproviders`.`id` AS `spid`,`sproviders`.`name` AS `spname`,`sproviders`.`pic` AS `pic`,concat(`users`.`firstname`,' ',`users`.`lastname`) AS `username`,date_format(convert_tz(`payments`.`pdate`,'+00:00','+03:00'),'%Y-%m-%d %H:%i') AS `pdate`,`payments`.`amount` AS `amount`,`payments`.`details` AS `details`,`payments`.`paymetrid` AS `saleid`,`paymentstatus`.`pstatus` AS `pstatus`,`paymentstatus`.`id` AS `pstatusid`,`paymeerr`.`errtext` AS `errortext` from ((((`payments` join `paymentstatus`) join `sproviders`) join `users`) left join `paymeerr` on((`payments`.`paymetrid` = convert(`paymeerr`.`masterpaymesale` using utf8)))) where ((`users`.`userid` = `payments`.`userid`) and (`payments`.`spid` = `sproviders`.`id`) and (`paymentstatus`.`id` = `payments`.`pstatus`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `requestsuser`
--

/*!50001 DROP TABLE IF EXISTS `requestsuser`*/;
/*!50001 DROP VIEW IF EXISTS `requestsuser`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `requestsuser` AS select `calls`.`callid` AS `callid`,date_format(convert_tz(`calls`.`cdate`,'+00:00','+03:00'),'%Y-%m-%d %H:%i') AS `cdate`,`calls`.`details` AS `details`,`callstatus`.`statusname` AS `statusname`,`calls`.`status` AS `status`,`users`.`firstname` AS `firstname`,`users`.`lastname` AS `lastname`,`users`.`phone` AS `phone`,`calls`.`spid` AS `spid`,`calls`.`rating` AS `rating`,`servicetype`.`name` AS `service`,`payments_temppayment`.`amount` AS `amount`,`payments_temppayment`.`installments` AS `installments` from ((((`calls` join `users`) join `servicetype`) join `callstatus`) join `payments_temppayment`) where ((`callstatus`.`statusid` = `calls`.`status`) and (`calls`.`userid` = `users`.`userid`) and (`calls`.`callid` = `payments_temppayment`.`callid`) and (`servicetype`.`id` = `calls`.`serviceid`)) */;
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
/*!50003 DROP PROCEDURE IF EXISTS `showpairs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `showpairs`()
BEGIN
   DECLARE spd int;
   DECLARE ud int; 
   DECLARE spd1 int;
   DECLARE ud1 int; 
   DECLARE Xsp float;
   DECLARE Ysp float;
   DECLARE Xuser float;
   DECLARE Yuser float;
   DECLARE sname varchar(31);
   DECLARE usname varchar(31);
   DECLARE sphone varchar(10);
   DECLARE usphone varchar(10);
   DECLARE dt int;
   DECLARE mnth int;
   DECLARE yer int;
   
   
   DECLARE v_finished INTEGER DEFAULT 0;
   -- SET dt = dayofmonth(NOW());
   DECLARE cur cursor for select spid, userid FROM calls WHERE status in (2,4,8,9,10,11) 
   AND dayofmonth(cdate)=dayofmonth(NOW()) AND month(cdate)=month(NOW()) AND year(cdate)=year(NOW())   
   ORDER BY spid,userid, callid DESC;
   
   DECLARE CONTINUE HANDLER 
   FOR NOT FOUND SET v_finished = 1;
   
   DELETE FROM showpairs;
   COMMIT;
   
   SET spd1 = -1;
   SET ud1  = -1;
   
   open cur;
   start_loop: loop
        fetch cur into spd,ud;
        -- select spd;
        if v_finished=1 then 
            leave start_loop;
        END if;
        if (spd1 <> spd) AND (ud1 <> ud) then
			SET Xsp=-1;
			SET Ysp=-1;
			SELECT X,Y point into Xsp,Ysp FROM coordinate WHERE spuser=1 and uid=spd order by ltime desc LIMIT 1;
			-- select Xsp,Ysp;
			if Xsp<0 then
					SELECT X,Y,name,phone point into Xsp,Ysp,sname,sphone FROM sproviders WHERE id = spd;    
					SET v_finished = 0;
					 -- select spd, Xsp,Ysp;
			else
					SELECT name,phone into sname,sphone FROM sproviders WHERE id = spd;            
			end if;         
			SET Xuser=-1;
			SET Yuser=-1;
			SELECT X,Y point into Xuser,Yuser FROM coordinate WHERE spuser=2 and uid=ud order by ltime desc LIMIT 1;
			-- select Xsp,Ysp;
			if Xuser<0 then
					SELECT X,Y, lastname, phone into Xuser,Yuser,usname,usphone FROM users WHERE userid = ud;    
					SET v_finished = 0;
					 -- select spd, Xsp,Ysp;
			else
					SELECT lastname, phone into usname,usphone FROM users WHERE userid = ud;    
			end if;         
			INSERT INTO showpairs (spname,username,spx,spy,userx,usery,spphone,userphone) VALUES (sname,usname,Xsp,Ysp,Xuser,Yuser,sphone,usphone);
            SET spd1 = spd;
            SET ud1 = ud;
      end if;
    END loop;
   close cur;
   COMMIT;
   
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

-- Dump completed on 2019-01-11 11:57:35
