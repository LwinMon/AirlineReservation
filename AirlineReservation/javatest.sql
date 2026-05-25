-- MySQL dump 10.13  Distrib 8.3.0, for Win64 (x86_64)
--
-- Host: localhost    Database: javatest
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `bookingid` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(20) DEFAULT NULL,
  `lastname` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `idtype` varchar(30) DEFAULT NULL,
  `idnumber` int DEFAULT NULL,
  `ticket` int DEFAULT NULL,
  `class` varchar(20) DEFAULT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bookingid`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (51,'Mon','Thant','lwinmonthant208@gmail.com','female','Myanmar','nationalId',280776,5,'Business Class','2024-03-04 03:33:16'),(63,'Ko','Ko','koko@gmail.com','male','Myanmar','nationalId',220002,3,'First Class','2024-03-05 06:05:49'),(64,'Mg','Mg','mgmg@gmail.com','male','Myanmar','nationalId',343646,3,'First Class','2024-03-05 07:43:10');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flightest`
--

DROP TABLE IF EXISTS `flightest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flightest` (
  `flightID` int NOT NULL AUTO_INCREMENT,
  `fromcity` varchar(20) DEFAULT NULL,
  `tocity` varchar(20) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `dtime` time DEFAULT NULL,
  `atime` time DEFAULT NULL,
  `economy` varchar(30) DEFAULT NULL,
  `business` varchar(30) DEFAULT NULL,
  `first` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`flightID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flightest`
--

LOCK TABLES `flightest` WRITE;
/*!40000 ALTER TABLE `flightest` DISABLE KEYS */;
INSERT INTO `flightest` VALUES (1,'Yangon','Seoul','2024-04-01','05:00:00','08:30:00','Sold Out','Available','Available'),(2,'Yangon','Seoul','2024-04-01','13:00:00','15:30:00','Available','Available','Available'),(3,'Seoul','Yangon','2024-03-09','10:30:00','13:30:00','Available','Sold Out','Available'),(4,'Seoul','Yangon','2024-03-09','16:00:00','19:00:00','Available','Available','Available'),(5,'Bangkok','Yangon','2024-03-11','09:30:00','10:30:00','Available','Available','Available'),(6,'Yangon','Singapore','2024-03-08','16:30:00','20:00:00','Available','Available','Sold Out'),(7,'Yangon','Singapore','2024-03-08','08:00:00','12:30:00','Available','Available','Sold Out'),(8,'Singapore','Yangon','2024-03-07','18:00:00','22:30:00','Sold Out','Sold Out','Available'),(9,'Singapore','Yangon','2024-03-07','06:00:00','10:30:00','Available','Available','Available'),(10,'Yangon','Bangkok','2024-03-09','19:00:00','20:30:00','Available','Available','Available'),(11,'Yangon','Bangkok','2024-03-09','13:00:00','14:30:00','Available','Available','Available'),(12,'Yangon','Bangkok','2024-03-09','09:30:00','11:30:00','Available','Sold Out','Available');
/*!40000 ALTER TABLE `flightest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `stuname` char(25) DEFAULT NULL,
  `stupassword` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('Ma Ma',1234),('Mg Mg',4321);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userdetail`
--

DROP TABLE IF EXISTS `userdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userdetail` (
  `name` char(25) DEFAULT NULL,
  `password` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userdetail`
--

LOCK TABLES `userdetail` WRITE;
/*!40000 ALTER TABLE `userdetail` DISABLE KEYS */;
INSERT INTO `userdetail` VALUES ('Mg Mg','1234'),('Ma Ma','4321');
/*!40000 ALTER TABLE `userdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(20) DEFAULT NULL,
  `lastname` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'Admin','admin','admin@gmail.com','Admin','admin123','2024-03-03 12:04:27'),(7,'Lwin Mon','Thant','lwinmonthant208@gmail.com','Mon Thant','1592004','2024-03-03 12:09:46'),(8,'Su','Su','susu@gmail.com','Su Su','susu','2024-03-03 12:11:03'),(9,'Thaw ','Thaw','thaw@gmail.com','Thaw Thaw','thaw123','2024-03-03 14:59:23'),(10,'Ma','Ma','mama@gmail.com','Ma Ma','mama123','2024-03-04 06:28:09'),(12,'Ko','Ko','koko@gmail.com','Ko Ko','koko123','2024-03-04 13:25:04'),(13,'Mg','Mg','mgmg@gmail.com','Mg Mg','mgmg123','2024-03-05 07:41:30');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-08 14:41:25
