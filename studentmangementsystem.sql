-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: studentmanegementsystem
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `course_name` varchar(100) NOT NULL,
  `department` varchar(100) DEFAULT NULL,
  `credits` int NOT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'database management','computer science',4),(2,'mathematics','computer science',3),(3,'accounting','commerce',4);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollments`
--

DROP TABLE IF EXISTS `enrollments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollments` (
  `enrollment_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `course_id` int NOT NULL,
  `enrollment_date` date NOT NULL,
  PRIMARY KEY (`enrollment_id`),
  UNIQUE KEY `student_id` (`student_id`,`course_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollments`
--

LOCK TABLES `enrollments` WRITE;
/*!40000 ALTER TABLE `enrollments` DISABLE KEYS */;
INSERT INTO `enrollments` VALUES (1,1,1,'2025-06-15'),(2,1,2,'2025-06-15'),(3,2,1,'2025-06-16'),(4,3,1,'2025-06-16');
/*!40000 ALTER TABLE `enrollments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `results` (
  `result_id` int NOT NULL AUTO_INCREMENT,
  `enrollment_id` int NOT NULL,
  `marks` decimal(5,2) NOT NULL,
  `grade` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`result_id`),
  UNIQUE KEY `enrollment_id` (`enrollment_id`),
  CONSTRAINT `results_ibfk_1` FOREIGN KEY (`enrollment_id`) REFERENCES `enrollments` (`enrollment_id`),
  CONSTRAINT `results_chk_1` CHECK ((`marks` between 0 and 100))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
INSERT INTO `results` VALUES (1,1,85.00,'A'),(2,2,90.00,'A+'),(3,3,78.00,'B+'),(4,4,92.00,'A+');
/*!40000 ALTER TABLE `results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `student_details`
--

DROP TABLE IF EXISTS `student_details`;
/*!50001 DROP VIEW IF EXISTS `student_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `student_details` AS SELECT 
 1 AS `student_id`,
 1 AS `full_name`,
 1 AS `department`,
 1 AS `course_name`,
 1 AS `enrollment_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `student_results_view`
--

DROP TABLE IF EXISTS `student_results_view`;
/*!50001 DROP VIEW IF EXISTS `student_results_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `student_results_view` AS SELECT 
 1 AS `student_id`,
 1 AS `full_name`,
 1 AS `department`,
 1 AS `course_name`,
 1 AS `marks`,
 1 AS `grade`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `admission_date` date NOT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'surendra','male','2004-10-29','9391776765','surendraprince597@gmail.com','computer science','2025-06-10'),(2,'deepika','female','2005-11-11','9876543211','deepika@gmail.com','commerce','2025-06-10'),(3,'chaitanya','male','2026-01-12','9876543212','chaitanya@gmail.com','computer science','2025-06-12'),(4,'Kiran','Male',NULL,'9876501234','kiran@example.com','Computer Science','2025-07-01');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `student_details`
--

/*!50001 DROP VIEW IF EXISTS `student_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `student_details` AS select `s`.`student_id` AS `student_id`,`s`.`full_name` AS `full_name`,`s`.`department` AS `department`,`c`.`course_name` AS `course_name`,`e`.`enrollment_id` AS `enrollment_id` from ((`students` `s` join `enrollments` `e` on((`s`.`student_id` = `e`.`student_id`))) join `course` `c` on((`e`.`course_id` = `c`.`course_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `student_results_view`
--

/*!50001 DROP VIEW IF EXISTS `student_results_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `student_results_view` AS select `s`.`student_id` AS `student_id`,`s`.`full_name` AS `full_name`,`s`.`department` AS `department`,`c`.`course_name` AS `course_name`,`r`.`marks` AS `marks`,`r`.`grade` AS `grade` from (((`students` `s` join `enrollments` `e` on((`s`.`student_id` = `e`.`student_id`))) join `course` `c` on((`e`.`course_id` = `c`.`course_id`))) join `results` `r` on((`e`.`enrollment_id` = `r`.`enrollment_id`))) */;
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

-- Dump completed on 2026-11-10  8:19:41
