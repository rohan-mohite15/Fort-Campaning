CREATE DATABASE  IF NOT EXISTS `fortdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `fortdb`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: fortdb
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adminlogin`
--

DROP TABLE IF EXISTS `adminlogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminlogin` (
  `UserName` varchar(30) NOT NULL,
  `Password` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminlogin`
--

LOCK TABLES `adminlogin` WRITE;
/*!40000 ALTER TABLE `adminlogin` DISABLE KEYS */;
INSERT INTO `adminlogin` VALUES ('admin@gmail.com','admin');
/*!40000 ALTER TABLE `adminlogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaigns`
--

DROP TABLE IF EXISTS `campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campaigns` (
  `Cid` int NOT NULL AUTO_INCREMENT,
  `FortId` int DEFAULT NULL,
  `Day` varchar(45) DEFAULT NULL,
  `CDate` date DEFAULT NULL,
  PRIMARY KEY (`Cid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns`
--

LOCK TABLES `campaigns` WRITE;
/*!40000 ALTER TABLE `campaigns` DISABLE KEYS */;
INSERT INTO `campaigns` VALUES (1,1,'Sunday','2024-02-27'),(2,2,'Tuesday','2024-03-01');
/*!40000 ALTER TABLE `campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campreg`
--

DROP TABLE IF EXISTS `campreg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campreg` (
  `RegId` int NOT NULL AUTO_INCREMENT,
  `Cid` int DEFAULT NULL,
  `NoofMawla` int DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `ContactNo` varchar(45) DEFAULT NULL,
  `EmailID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`RegId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campreg`
--

LOCK TABLES `campreg` WRITE;
/*!40000 ALTER TABLE `campreg` DISABLE KEYS */;
INSERT INTO `campreg` VALUES (1,1,15,'Patan, Karad, Satara','7898745897','rajesh@gmail.com');
/*!40000 ALTER TABLE `campreg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `campregview`
--

DROP TABLE IF EXISTS `campregview`;
/*!50001 DROP VIEW IF EXISTS `campregview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `campregview` AS SELECT 
 1 AS `RegId`,
 1 AS `Cid`,
 1 AS `FortName`,
 1 AS `NoofMawla`,
 1 AS `Address`,
 1 AS `ContactNo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `campview`
--

DROP TABLE IF EXISTS `campview`;
/*!50001 DROP VIEW IF EXISTS `campview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `campview` AS SELECT 
 1 AS `Cid`,
 1 AS `FortId`,
 1 AS `FortName`,
 1 AS `Info`,
 1 AS `FortImage`,
 1 AS `Day`,
 1 AS `CDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `FeedbackDateTime` datetime DEFAULT NULL,
  `EmailID` varchar(45) DEFAULT NULL,
  `FeedbackText` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'2024-01-20 12:27:46','rajesh@gmail.com','Most of Products are available in your showcase and more cheaper. Thanks for good service.'),(2,'2024-01-21 11:01:17','ganesh@gmail.com','Good service and Good brands');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fort`
--

DROP TABLE IF EXISTS `fort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fort` (
  `FortId` int NOT NULL AUTO_INCREMENT,
  `FortName` varchar(45) DEFAULT NULL,
  `Info` varchar(1000) DEFAULT NULL,
  `FortImage` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`FortId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fort`
--

LOCK TABLES `fort` WRITE;
/*!40000 ALTER TABLE `fort` DISABLE KEYS */;
INSERT INTO `fort` VALUES (1,'Raigad Fort','Raigad is one of the historically significant forts in Maharashtra. Nestled amid the picturesque Sahyadri mountain ranges in Maharashtra, the Raigarh Fort stands tall as a symbol of historical grandeur and architectural brilliance. This ancient fort, with its rich heritage and breathtaking views, beckons history enthusiasts and nature lovers alike. In this article, we will take you on a journey to discover the captivating essence of the Raigarh Fort, covering its history, location, timings, and the fascinating stories that lie within its walls.\r\n\r\nLocation: Raigad, Maharashtra\r\n\r\nTimings: 8:00 AM - 6:00 PM\r\n\r\nNearest Railway Station: Dasgaon Railway Station\r\n\r\nNearest Airport: Lohegaon Airport, Pune\r\n\r\nFamous For: Sightseeing, Trekking, Photography','raigad.JPG'),(2,'Shivneri Fort','Shivneri Fort, located in Maharashtra, is a historic gem and the birthplace of Chhatrapati Shivaji Maharaj. Perched atop a hill near Junnar, it boasts stunning medieval architecture with seven gates and a revered temple dedicated to Goddess Shivai Devi. The fort offers captivating trails and breathtaking views, attracting history enthusiasts and nature lovers alike. The Shivneri Fort welcomes visitors to witness the majestic Ambarkhana and immerse themselves in the legacy of one of India\'s greatest warriors.\r\n\r\nLocation: Pune, Maharashtra\r\n\r\nTimings: 6:00 AM - 5:00 PM\r\n\r\nNearest Railway Station: Pune Railway Station\r\n\r\nNearest Airport: Lohegaon Airport, Pune\r\n\r\nFamous For: Trekking, Photography & Sightseeing','shivneri.JPG'),(3,'Sinhgad Fort','Sinhagad Fort, situated in Maharashtra, holds great historical significance as a pivotal site during the Maratha era, particularly during the Battle of Sinhagad. Perched atop the Bhuleshwar range, it served as a crucial defensive outpost for the Maratha forces. The fort\'s impressive architecture and strategic location reflect the ingenuity of the Maratha warriors. Sinhagad Fort stands as a testament to the valor and resilience of the Maratha Empire, attracting history enthusiasts eager to learn about this important chapter in India\'s past.\r\n\r\nLocation: Pune, Maharashtra\r\n\r\nTimings: 6:00 AM - 6:00 PM\r\n\r\nNearest Railway Station: Pune Railway Station\r\n\r\nNearest Airport: Lohegaon Airport, Pune\r\n \r\nFamous For: Trekking, Photography & Sightseeing','singhgad.JPG'),(6,'Torna Fort','Torna Fort, located in Maharashtra, is a historically significant stronghold that holds a prominent place in the Maratha history. It was originally built in the 13th century but gained prominence during the reign of Chhatrapati Shivaji Maharaj. As one of the first forts captured by Shivaji Maharaj, it became a crucial base for his military campaigns. The fort\'s strategic location, sturdy architecture, and historical importance make Torna Fort a fascinating destination for history enthusiasts, offering insights into the valor and achievements of the Maratha Empire.\r\n\r\nLocation: Pune, Maharashtra\r\n\r\nTimings: Open 24 Hours\r\n\r\nNearest Railway Station: Bhugaon Railway Station\r\n\r\nNearest Airport: Lohegaon Airport, Pune\r\n\r\nFamous For: Trekking, Photography & Sightseeing','torna.JPG');
/*!40000 ALTER TABLE `fort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fund`
--

DROP TABLE IF EXISTS `fund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fund` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Particulars` varchar(100) DEFAULT NULL,
  `Donate` decimal(10,2) DEFAULT NULL,
  `EmailID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund`
--

LOCK TABLES `fund` WRITE;
/*!40000 ALTER TABLE `fund` DISABLE KEYS */;
/*!40000 ALTER TABLE `fund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signup`
--

DROP TABLE IF EXISTS `signup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `signup` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `EmailID` varchar(45) DEFAULT NULL,
  `MobileNo` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signup`
--

LOCK TABLES `signup` WRITE;
/*!40000 ALTER TABLE `signup` DISABLE KEYS */;
INSERT INTO `signup` VALUES (1,'rajesh@gmail.com','9858967898','rajesh'),(2,'ganesh@gmail.com','8964567894','ganesh'),(3,'ajay@gmail.com','8957854785','ajay'),(4,'ramesh@gmail.com','5864587858','ramesh');
/*!40000 ALTER TABLE `signup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travelling`
--

DROP TABLE IF EXISTS `travelling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travelling` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `Adhar` varchar(45) DEFAULT NULL,
  `Mobile` varchar(45) DEFAULT NULL,
  `UPI` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travelling`
--

LOCK TABLES `travelling` WRITE;
/*!40000 ALTER TABLE `travelling` DISABLE KEYS */;
/*!40000 ALTER TABLE `travelling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `campregview`
--

/*!50001 DROP VIEW IF EXISTS `campregview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `campregview` AS select `a`.`RegId` AS `RegId`,`a`.`Cid` AS `Cid`,`b`.`FortName` AS `FortName`,`a`.`NoofMawla` AS `NoofMawla`,`a`.`Address` AS `Address`,`a`.`ContactNo` AS `ContactNo` from (`campreg` `a` join `campview` `b` on((`a`.`Cid` = `b`.`Cid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `campview`
--

/*!50001 DROP VIEW IF EXISTS `campview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `campview` AS select `a`.`Cid` AS `Cid`,`a`.`FortId` AS `FortId`,`b`.`FortName` AS `FortName`,`b`.`Info` AS `Info`,`b`.`FortImage` AS `FortImage`,`a`.`Day` AS `Day`,`a`.`CDate` AS `CDate` from (`campaigns` `a` join `fort` `b` on((`a`.`FortId` = `b`.`FortId`))) */;
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

-- Dump completed on 2024-02-25 11:47:57
