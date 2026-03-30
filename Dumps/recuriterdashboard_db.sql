-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: recuriterdashboard_db
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `description` text,
  `posted_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,'Software Engineer','TCS','Development role','2026-03-23 05:30:26'),(2,'Web Developer','Infosys','Frontend + Backend','2026-03-23 05:30:26'),(3,'Java Developer','Wipro','Java projects','2026-03-23 05:30:26');
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `branch` varchar(50) DEFAULT NULL,
  `tenth` double DEFAULT NULL,
  `twelfth` double DEFAULT NULL,
  `graduation` double DEFAULT NULL,
  `status` varchar(20) DEFAULT 'applied',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Rahul Sharma','rahul@gmail.com','CSE',85,88,8.2,'rejected'),(2,'Priya Singh','priya@gmail.com','IT',90,91,8.8,'applied'),(3,'Amit Verma','amit@gmail.com','ECE',78,80,7.5,'rejected'),(4,'Sneha Gupta','sneha@gmail.com','CSE',92,89,9.1,'shortlisted'),(5,'Rohit Kumar','rohit@gmail.com','ME',70,75,7,'applied'),(6,'Raj Manohtra','son348@gmail.com','Science',65,89,90,'applied'),(7,'Rambha Manohtra','Rambha456@gmail.com','Science',65,89,90,'applied'),(8,'Raghav Sharma','Raghav987@gmail.com','Arts',89,65,67,'applied'),(9,'Arvind Jaisawal','Arvind456@gmail.com','Science',56,89,78,'applied'),(10,'Suman Singh','suman123@gmail.com','Science',56,89,78,'applied'),(11,'Vinod Kapur','Vinod341@gmail.com','Management',68,79,45,'applied'),(12,'Manorma Goshai','Manorama512@gmail.com','Management',68,79,45,'applied'),(13,'Vikhas Manhotra','Vikash453@gmail.com','Management',68,79,45,'applied'),(14,'Ranju Kapur','Ranju128@gmail.com','Management',68,79,45,'applied'),(15,'Sonali Kapur','Sonali765@gmail.com','Management',68,79,45,'applied');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-29 13:52:55
