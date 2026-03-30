-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: applied_db
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
-- Table structure for table `applied_companies`
--

DROP TABLE IF EXISTS `applied_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applied_companies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_email` varchar(100) DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  `apply_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applied_companies`
--

LOCK TABLES `applied_companies` WRITE;
/*!40000 ALTER TABLE `applied_companies` DISABLE KEYS */;
INSERT INTO `applied_companies` VALUES (1,'student@gmail.com',NULL,NULL,'2026-02-04'),(2,'student@gmail.com',NULL,NULL,'2026-02-06'),(3,'student@gmail.com',NULL,NULL,'2026-02-08'),(4,'student@gmail.com',NULL,NULL,'2026-02-10'),(5,'student@gmail.com',NULL,NULL,'2026-02-20'),(6,'student@gmail.com',NULL,NULL,'2026-03-01'),(7,'student@gmail.com',NULL,NULL,'2026-03-02'),(8,'student@gmail.com',NULL,NULL,'2026-03-02'),(9,'student@gmail.com',NULL,NULL,'2026-03-05'),(10,'student@gmail.com',NULL,NULL,'2026-03-14'),(11,'student@gmail.com',NULL,NULL,'2026-03-14'),(12,'student@gmail.com',NULL,NULL,'2026-03-14'),(13,'student@gmail.com',NULL,NULL,'2026-03-14'),(14,'student@gmail.com',NULL,NULL,'2026-03-14'),(15,'student@gmail.com',NULL,NULL,'2026-03-14'),(16,'student@gmail.com',NULL,NULL,'2026-03-15'),(17,'student@gmail.com',NULL,NULL,'2026-03-15'),(18,'student@gmail.com',NULL,NULL,'2026-03-15'),(19,'student@gmail.com',NULL,NULL,'2026-03-15'),(20,'student@gmail.com',NULL,NULL,'2026-03-15'),(21,'student@gmail.com',NULL,NULL,'2026-03-15'),(22,'student@gmail.com',NULL,NULL,'2026-03-15'),(23,'student@gmail.com',NULL,NULL,'2026-03-16'),(24,'student@gmail.com',NULL,NULL,'2026-03-16');
/*!40000 ALTER TABLE `applied_companies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-29 13:46:46
