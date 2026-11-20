-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: quizrank-mysql-mrokon923-87c0.d.aivencloud.com    Database: quizrank
-- ------------------------------------------------------
-- Server version	8.4.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `quizrank`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `quizrank` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `quizrank`;

--
-- Table structure for table `academic_records`
--

DROP TABLE IF EXISTS `academic_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `academic_records` (
  `id` int NOT NULL,
  `student_id` int NOT NULL,
  `semester` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cgpa` decimal(4,2) DEFAULT NULL,
  `department_rank` int DEFAULT NULL,
  `batch_rank` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `academic_records_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_records`
--

LOCK TABLES `academic_records` WRITE;
/*!40000 ALTER TABLE `academic_records` DISABLE KEYS */;
INSERT INTO `academic_records` VALUES (1,7,'Current',3.92,2,1),(2,8,'Current',3.85,4,2),(3,9,'Current',3.78,6,3),(4,10,'Current',3.74,8,4),(5,11,'Current',3.70,10,5),(6,12,'Current',3.66,12,6),(7,13,'Current',3.61,14,7),(8,14,'Current',3.58,16,8),(9,15,'Current',3.55,18,9),(10,16,'Current',3.50,20,10),(11,17,'Current',3.47,22,11),(12,18,'Current',3.43,24,12),(13,19,'Current',3.40,26,13),(14,20,'Current',3.35,28,14),(15,21,'Current',3.30,30,15),(16,22,'Current',3.95,1,1),(17,23,'Current',3.88,3,2),(18,24,'Current',3.82,5,3),(19,25,'Current',3.76,7,4),(20,26,'Current',3.72,9,5),(21,27,'Current',3.68,11,6),(22,28,'Current',3.64,13,7),(23,29,'Current',3.60,15,8),(24,30,'Current',3.56,17,9),(25,31,'Current',3.52,19,10),(26,32,'Current',3.48,21,11),(27,33,'Current',3.44,23,12),(28,34,'Current',3.41,25,13),(29,35,'Current',3.37,27,14),(30,36,'Current',3.32,29,15),(32,7,'Previous',3.84,NULL,NULL),(33,8,'Previous',3.78,NULL,NULL),(34,9,'Previous',3.70,NULL,NULL),(35,10,'Previous',3.68,NULL,NULL),(36,11,'Previous',3.63,NULL,NULL),(37,12,'Previous',3.59,NULL,NULL),(38,13,'Previous',3.55,NULL,NULL),(39,14,'Previous',3.51,NULL,NULL),(40,15,'Previous',3.48,NULL,NULL),(41,16,'Previous',3.44,NULL,NULL),(42,17,'Previous',3.40,NULL,NULL),(43,18,'Previous',3.37,NULL,NULL),(44,19,'Previous',3.34,NULL,NULL),(45,20,'Previous',3.30,NULL,NULL),(46,21,'Previous',3.25,NULL,NULL),(47,22,'Previous',3.87,NULL,NULL),(48,23,'Previous',3.81,NULL,NULL),(49,24,'Previous',3.75,NULL,NULL),(50,25,'Previous',3.69,NULL,NULL),(51,26,'Previous',3.65,NULL,NULL),(52,27,'Previous',3.61,NULL,NULL),(53,28,'Previous',3.57,NULL,NULL),(54,29,'Previous',3.53,NULL,NULL),(55,30,'Previous',3.49,NULL,NULL),(56,31,'Previous',3.45,NULL,NULL),(57,32,'Previous',3.41,NULL,NULL),(58,33,'Previous',3.38,NULL,NULL),(59,34,'Previous',3.34,NULL,NULL),(60,35,'Previous',3.30,NULL,NULL),(61,36,'Previous',3.26,NULL,NULL);
/*!40000 ALTER TABLE `academic_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignment_results`
--

DROP TABLE IF EXISTS `assignment_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignment_results` (
  `id` int NOT NULL,
  `assignment_id` int DEFAULT NULL,
  `submission_id` int NOT NULL,
  `student_id` int NOT NULL,
  `graded_by` int NOT NULL,
  `grade` enum('POOR','AVG','GOOD') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `feedback` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `graded_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_assignment_result_submission` (`submission_id`),
  KEY `fk_result_teacher` (`graded_by`),
  CONSTRAINT `fk_result_submission` FOREIGN KEY (`submission_id`) REFERENCES `assignment_submissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_result_teacher` FOREIGN KEY (`graded_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment_results`
--

LOCK TABLES `assignment_results` WRITE;
/*!40000 ALTER TABLE `assignment_results` DISABLE KEYS */;
INSERT INTO `assignment_results` VALUES (1,1,2,7,3,'AVG','','2026-11-10 17:53:24'),(2,1,1,30,3,'GOOD','','2026-11-08 18:54:00'),(3,1,3,29,3,'AVG','','2026-11-08 18:54:03'),(4,1,4,15,3,'POOR','','2026-11-08 18:54:06'),(5,2,5,7,3,'POOR','','2026-11-10 05:54:30'),(6,2,7,8,3,'POOR','','2026-11-10 11:47:53'),(7,2,8,9,3,'AVG','','2026-11-10 05:54:34'),(8,2,9,10,3,'POOR','','2026-11-10 05:54:42'),(9,2,10,11,3,'AVG','','2026-11-10 11:47:56');
/*!40000 ALTER TABLE `assignment_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignment_submissions`
--

DROP TABLE IF EXISTS `assignment_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignment_submissions` (
  `id` int NOT NULL,
  `assignment_id` int NOT NULL,
  `student_id` int NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `stored_name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_assignment_student` (`assignment_id`,`student_id`),
  KEY `idx_submissions_student` (`student_id`),
  CONSTRAINT `fk_submissions_assignment` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_submissions_student` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment_submissions`
--

LOCK TABLES `assignment_submissions` WRITE;
/*!40000 ALTER TABLE `assignment_submissions` DISABLE KEYS */;
INSERT INTO `assignment_submissions` VALUES (1,1,30,'Rokon_id_36.pdf','5493319d-16a6-461b-b525-827208174819.pdf','2026-11-08 18:28:12'),(2,1,7,'Rokon_id_36.pdf','0e87fe07-165c-4238-8913-9f5acdc4bbf1.pdf','2026-11-08 18:19:30'),(3,1,29,'Rokon_id_36.pdf','ee9eb949-474e-4721-ad32-4e2772cf613b.pdf','2026-11-08 18:38:27'),(4,1,15,'JavaScript Roadmap for web development.pdf','acebc0a9-856d-4451-954c-7c363013d7da.pdf','2026-11-08 18:42:10'),(5,2,7,'Rokon_id_36.pdf','7afa2fa0-17de-4fd1-beb2-e096d1ac0a6b.pdf','2026-11-10 04:20:08'),(6,1,8,'Rokon_id_36.pdf','143b9a79-3fa4-44cc-b7e7-a162254bf886.pdf','2026-11-10 04:20:35'),(7,2,8,'Rokon_id_36.pdf','4196a30d-aeb1-42d2-9eb9-11323a9a653a.pdf','2026-11-10 04:21:31'),(8,2,9,'Rokon_id_36.pdf','75645f9f-8825-4dee-82a3-e20ee7d9183b.pdf','2026-11-10 04:22:24'),(9,2,10,'Rokon_id_36.pdf','eb3bd4a7-37f8-4db7-811d-c39ed92911a9.pdf','2026-11-10 04:22:51'),(10,2,11,'Lab Viva.pdf','bbd71aba-3ecc-4b9e-b920-2d58e362c9f5.pdf','2026-11-10 04:25:01');
/*!40000 ALTER TABLE `assignment_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignments`
--

DROP TABLE IF EXISTS `assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignments` (
  `id` int NOT NULL,
  `teacher_id` int NOT NULL,
  `subject_id` int DEFAULT NULL,
  `title` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `due_date` date DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `stored_name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_assignments_teacher` (`teacher_id`),
  KEY `fk_assignments_subject` (`subject_id`),
  CONSTRAINT `fk_assignments_subject` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_assignments_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignments`
--

LOCK TABLES `assignments` WRITE;
/*!40000 ALTER TABLE `assignments` DISABLE KEYS */;
INSERT INTO `assignments` VALUES (1,3,NULL,'OOP Fundamental',NULL,'2026-11-15','Lab Viva.pdf','874bc88f-cb93-4e1f-8c27-b50113208868.pdf','2026-11-08 18:17:37'),(2,3,NULL,'OPP',NULL,'2026-11-11','Lab Viva.pdf','9c023322-48dd-4d38-bf51-e906ddaed25a.pdf','2026-11-10 04:19:42'),(3,3,NULL,'OOP-I',NULL,'2026-11-11','JavaScript Roadmap for web development.pdf','54826af1-30ac-4d12-b421-6b4985942edb.pdf','2026-11-10 14:48:02');
/*!40000 ALTER TABLE `assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_notes`
--

DROP TABLE IF EXISTS `class_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_notes` (
  `id` bigint NOT NULL,
  `teacher_id` bigint NOT NULL,
  `subject_id` bigint NOT NULL,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `stored_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `file_path` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_class_notes_teacher` (`teacher_id`),
  KEY `idx_class_notes_subject` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_notes`
--

LOCK TABLES `class_notes` WRITE;
/*!40000 ALTER TABLE `class_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `class_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `learning_materials`
--

DROP TABLE IF EXISTS `learning_materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `learning_materials` (
  `id` int NOT NULL,
  `teacher_id` int NOT NULL,
  `subject_id` int DEFAULT NULL,
  `title` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `stored_name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_materials_teacher` (`teacher_id`),
  KEY `fk_materials_subject` (`subject_id`),
  CONSTRAINT `fk_materials_subject` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_materials_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `learning_materials`
--

LOCK TABLES `learning_materials` WRITE;
/*!40000 ALTER TABLE `learning_materials` DISABLE KEYS */;
INSERT INTO `learning_materials` VALUES (1,3,NULL,'Javascript','javascript','JavaScript Roadmap for web development.pdf','e102bd81-d13b-4ed1-93d3-557ed1d294ab.pdf','2026-11-08 15:21:07');
/*!40000 ALTER TABLE `learning_materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notices`
--

DROP TABLE IF EXISTS `notices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notices` (
  `id` int NOT NULL,
  `teacher_id` int NOT NULL,
  `subject_id` int DEFAULT NULL,
  `topic` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `quiz_date` date DEFAULT NULL,
  `quiz_time` time DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `teacher_id` (`teacher_id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `notices_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `notices_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notices`
--

LOCK TABLES `notices` WRITE;
/*!40000 ALTER TABLE `notices` DISABLE KEYS */;
INSERT INTO `notices` VALUES (2,5,NULL,'Important Notice','Tomorrow there will be no regular class.',NULL,NULL,'2026-10-02 18:29:53'),(3,31,NULL,'Important Notice','Tomorrow there will be no regular class.',NULL,NULL,'2026-10-02 18:43:54'),(5,3,NULL,'Quiz On OOP fundamental','be prepare on upcoming Quiz','2026-11-11',NULL,'2026-11-10 07:40:10');
/*!40000 ALTER TABLE `notices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id` int NOT NULL,
  `quiz_id` int NOT NULL,
  `question` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `option_a` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `option_b` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `option_c` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `option_d` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `correct_answer` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_id` (`quiz_id`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,1,'How many select lines does a 16-to-1 multiplexer require','1','2','3','4','D'),(2,1,'How many select lines does a 8-to-1 multiplexer require','1','2','3','4','C'),(3,1,'How many select lines does a 4-to-1 multiplexer require','1','2','3','4','B'),(4,1,'How many select lines does a 32-to-1 multiplexer require','1','2','3','5','D'),(5,1,'How many select lines does a 64-to-1 multiplexer require','4','5','6','7','B'),(6,1,'How many select lines does a 16-to-1 multiplexer require','1','2','3','4','D'),(7,1,'How many select lines does a 8-to-1 multiplexer require','1','2','3','4','C'),(8,1,'How many output lines does a 1-to-16 demultiplexer require','3','4','1','3','C'),(9,1,'How many select lines does a 1-to-8 multiplexer require','1','2','3','4','C'),(10,1,'How many select lines does a 1-to-4 multiplexer require','1','2','3','4','B'),(174,17,'what is value of 2+2','1','3','3','4','D'),(175,17,'what is value of 2+5','1','2','7','4','C'),(176,17,'what is value of 2*4','5','8','8','C & B','D'),(177,17,'what is value of 2+1','2','3','4','5','B'),(178,17,'what is value of 2+6','1','5','3','8','D'),(179,17,'what is value of 2+7','7','4','9','5','B'),(180,17,'what is value of 2+5','1','2','7','5','C'),(181,17,'what is value of 4+5','4','9','6','1','B'),(182,17,'what is the value of 0+0','1','3','2','0','A'),(183,17,'what is value of 2+1','0','2','2','1','A'),(184,18,'what is difference between 5 and 6','1','1','-1','2','C'),(185,18,'what is difference between 6 and 6','0','0','0','ALL','D'),(186,18,'what is difference between 9 and 6','3','4','1','2','A'),(187,18,'what is difference between 5 and 0','6','5','3','2','B'),(188,18,'what is difference between 5 and 5','1','2','none','2','C'),(189,18,'what is difference between 5 and 11','-5','-6','-6','B & C','D'),(190,18,'what is difference between 5 and 6','0','0','0','-1','D'),(191,18,'what is difference between 5 and 6','1','2','3','None','D'),(192,18,'what is difference between 9 and 6','4','3','4','None','B'),(193,18,'what is difference between 4 and 6','-2','1','1','2','A');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_attempt_answers`
--

DROP TABLE IF EXISTS `quiz_attempt_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_attempt_answers` (
  `id` int NOT NULL,
  `attempt_id` int NOT NULL,
  `question_id` int NOT NULL,
  `selected_answer` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_correct` tinyint(1) DEFAULT '0',
  `answered_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attempt_id` (`attempt_id`,`question_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `quiz_attempt_answers_ibfk_1` FOREIGN KEY (`attempt_id`) REFERENCES `quiz_attempts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quiz_attempt_answers_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_attempt_answers`
--

LOCK TABLES `quiz_attempt_answers` WRITE;
/*!40000 ALTER TABLE `quiz_attempt_answers` DISABLE KEYS */;
INSERT INTO `quiz_attempt_answers` VALUES (1,1,1,'D',1,'2026-10-03 11:41:31'),(2,2,1,'D',1,'2026-10-03 12:04:17'),(3,3,1,'D',1,'2026-10-03 12:05:31'),(4,4,1,'D',1,'2026-10-07 23:13:09'),(5,5,1,'D',1,'2026-10-07 23:15:13'),(6,6,1,'D',1,'2026-10-09 22:00:17'),(7,7,1,'D',1,'2026-11-08 21:58:23'),(8,219,1,'D',1,'2026-11-08 21:53:11'),(9,220,1,'D',1,'2026-11-08 21:53:11'),(10,221,1,'D',1,'2026-11-08 21:53:11'),(11,222,1,'D',1,'2026-11-08 21:53:11'),(12,223,1,'D',1,'2026-11-08 21:53:11'),(13,224,1,'D',1,'2026-11-08 21:53:11'),(14,225,1,'D',1,'2026-11-08 21:53:11'),(15,226,1,'D',1,'2026-11-08 21:53:11'),(16,227,1,'D',1,'2026-11-08 21:53:11'),(17,1,2,'C',1,'2026-10-03 11:41:31'),(18,2,2,'C',1,'2026-10-03 12:04:17'),(19,3,2,'C',1,'2026-10-03 12:05:31'),(20,4,2,'C',1,'2026-10-07 23:13:09'),(21,5,2,'C',1,'2026-10-07 23:15:13'),(22,6,2,'C',1,'2026-10-09 22:00:17'),(23,7,2,'C',1,'2026-11-08 21:58:23'),(24,219,2,'C',1,'2026-11-08 21:53:11'),(25,220,2,'C',1,'2026-11-08 21:53:11'),(26,221,2,'C',1,'2026-11-08 21:53:11'),(27,222,2,'C',1,'2026-11-08 21:53:11'),(28,223,2,'C',1,'2026-11-08 21:53:11'),(29,224,2,'C',1,'2026-11-08 21:53:11'),(30,225,2,'C',1,'2026-11-08 21:53:11'),(31,226,2,'C',1,'2026-11-08 21:53:11'),(32,227,2,'C',1,'2026-11-08 21:53:11'),(33,1,3,'B',1,'2026-10-03 11:41:31'),(34,2,3,'B',1,'2026-10-03 12:04:17'),(35,3,3,'B',1,'2026-10-03 12:05:31'),(36,4,3,'B',1,'2026-10-07 23:13:09'),(37,5,3,'B',1,'2026-10-07 23:15:13'),(38,6,3,'B',1,'2026-10-09 22:00:17'),(39,7,3,'B',1,'2026-11-08 21:58:23'),(40,219,3,'B',1,'2026-11-08 21:53:11'),(41,220,3,'B',1,'2026-11-08 21:53:11'),(42,221,3,'B',1,'2026-11-08 21:53:11'),(43,222,3,'B',1,'2026-11-08 21:53:11'),(44,223,3,'B',1,'2026-11-08 21:53:11'),(45,224,3,'B',1,'2026-11-08 21:53:11'),(46,225,3,'B',1,'2026-11-08 21:53:11'),(47,226,3,'B',1,'2026-11-08 21:53:11'),(48,227,3,'B',1,'2026-11-08 21:53:11'),(49,1,4,'D',1,'2026-10-03 11:41:31'),(50,2,4,'D',1,'2026-10-03 12:04:17'),(51,3,4,'D',1,'2026-10-03 12:05:31'),(52,4,4,'D',1,'2026-10-07 23:13:09'),(53,5,4,'D',1,'2026-10-07 23:15:13'),(54,6,4,'D',1,'2026-10-09 22:00:17'),(55,7,4,'D',1,'2026-11-08 21:58:23'),(56,219,4,'D',1,'2026-11-08 21:53:11'),(57,220,4,'D',1,'2026-11-08 21:53:11'),(58,221,4,'D',1,'2026-11-08 21:53:11'),(59,222,4,'D',1,'2026-11-08 21:53:11'),(60,223,4,'D',1,'2026-11-08 21:53:11'),(61,224,4,'D',1,'2026-11-08 21:53:11'),(62,225,4,'D',1,'2026-11-08 21:53:11'),(63,226,4,'D',1,'2026-11-08 21:53:11'),(64,227,4,'D',1,'2026-11-08 21:53:11'),(65,1,5,'B',1,'2026-10-03 11:41:31'),(66,2,5,'B',1,'2026-10-03 12:04:17'),(67,3,5,'B',1,'2026-10-03 12:05:31'),(68,4,5,'B',1,'2026-10-07 23:13:09'),(69,5,5,'B',1,'2026-10-07 23:15:13'),(70,6,5,'B',1,'2026-10-09 22:00:17'),(71,7,5,'B',1,'2026-11-08 21:58:23'),(72,219,5,'B',1,'2026-11-08 21:53:11'),(73,220,5,'B',1,'2026-11-08 21:53:11'),(74,221,5,'B',1,'2026-11-08 21:53:11'),(75,222,5,'B',1,'2026-11-08 21:53:11'),(76,223,5,'B',1,'2026-11-08 21:53:11'),(77,224,5,'B',1,'2026-11-08 21:53:11'),(78,225,5,'B',1,'2026-11-08 21:53:11'),(79,226,5,'B',1,'2026-11-08 21:53:11'),(80,227,5,'B',1,'2026-11-08 21:53:11'),(81,1,6,'D',1,'2026-10-03 11:41:31'),(82,2,6,'D',1,'2026-10-03 12:04:17'),(83,3,6,'D',1,'2026-10-03 12:05:31'),(84,4,6,'D',1,'2026-10-07 23:13:09'),(85,5,6,'D',1,'2026-10-07 23:15:13'),(86,6,6,'D',1,'2026-10-09 22:00:17'),(87,7,6,'D',1,'2026-11-08 21:58:23'),(88,219,6,'D',1,'2026-11-08 21:53:11'),(89,220,6,'A',0,'2026-11-08 21:53:11'),(90,221,6,'D',1,'2026-11-08 21:53:11'),(91,222,6,'D',1,'2026-11-08 21:53:11'),(92,223,6,'D',1,'2026-11-08 21:53:11'),(93,224,6,'D',1,'2026-11-08 21:53:11'),(94,225,6,'D',1,'2026-11-08 21:53:11'),(95,226,6,'A',0,'2026-11-08 21:53:11'),(96,227,6,'D',1,'2026-11-08 21:53:11'),(97,1,7,'A',0,'2026-10-03 11:41:31'),(98,2,7,'C',1,'2026-10-03 12:04:17'),(99,3,7,'C',1,'2026-10-03 12:05:31'),(100,4,7,'C',1,'2026-10-07 23:13:09'),(101,5,7,'C',1,'2026-10-07 23:15:13'),(102,6,7,'C',1,'2026-10-09 22:00:17'),(103,7,7,'C',1,'2026-11-08 21:58:23'),(104,219,7,'C',1,'2026-11-08 21:53:11'),(105,220,7,'A',0,'2026-11-08 21:53:11'),(106,221,7,'A',0,'2026-11-08 21:53:11'),(107,222,7,'C',1,'2026-11-08 21:53:11'),(108,223,7,'C',1,'2026-11-08 21:53:11'),(109,224,7,'C',1,'2026-11-08 21:53:11'),(110,225,7,'C',1,'2026-11-08 21:53:11'),(111,226,7,'A',0,'2026-11-08 21:53:11'),(112,227,7,'A',0,'2026-11-08 21:53:11'),(113,1,8,'A',0,'2026-10-03 11:41:31'),(114,2,8,'C',1,'2026-10-03 12:04:17'),(115,3,8,'C',1,'2026-10-03 12:05:31'),(116,4,8,'A',0,'2026-10-07 23:13:09'),(117,5,8,'C',1,'2026-10-07 23:15:13'),(118,6,8,'A',0,'2026-10-09 22:00:17'),(119,7,8,'A',0,'2026-11-08 21:58:23'),(120,219,8,'C',1,'2026-11-08 21:53:11'),(121,220,8,'A',0,'2026-11-08 21:53:11'),(122,221,8,'A',0,'2026-11-08 21:53:11'),(123,222,8,'A',0,'2026-11-08 21:53:11'),(124,223,8,'C',1,'2026-11-08 21:53:11'),(125,224,8,'C',1,'2026-11-08 21:53:11'),(126,225,8,'C',1,'2026-11-08 21:53:11'),(127,226,8,'A',0,'2026-11-08 21:53:11'),(128,227,8,'A',0,'2026-11-08 21:53:11'),(129,1,9,'A',0,'2026-10-03 11:41:31'),(130,2,9,'A',0,'2026-10-03 12:04:17'),(131,3,9,'A',0,'2026-10-03 12:05:31'),(132,4,9,'A',0,'2026-10-07 23:13:09'),(133,5,9,'A',0,'2026-10-07 23:15:13'),(134,6,9,'A',0,'2026-10-09 22:00:17'),(135,7,9,'A',0,'2026-11-08 21:58:23'),(136,219,9,'C',1,'2026-11-08 21:53:11'),(137,220,9,'A',0,'2026-11-08 21:53:11'),(138,221,9,'A',0,'2026-11-08 21:53:11'),(139,222,9,'A',0,'2026-11-08 21:53:11'),(140,223,9,'A',0,'2026-11-08 21:53:11'),(141,224,9,'C',1,'2026-11-08 21:53:11'),(142,225,9,'C',1,'2026-11-08 21:53:11'),(143,226,9,'A',0,'2026-11-08 21:53:11'),(144,227,9,'A',0,'2026-11-08 21:53:11'),(145,1,10,'A',0,'2026-10-03 11:41:31'),(146,2,10,'A',0,'2026-10-03 12:04:17'),(147,3,10,'A',0,'2026-10-03 12:05:31'),(148,4,10,'A',0,'2026-10-07 23:13:09'),(149,5,10,'A',0,'2026-10-07 23:15:13'),(150,6,10,'A',0,'2026-10-09 22:00:17'),(151,7,10,'A',0,'2026-11-08 21:58:23'),(152,219,10,'B',1,'2026-11-08 21:53:11'),(153,220,10,'A',0,'2026-11-08 21:53:11'),(154,221,10,'A',0,'2026-11-08 21:53:11'),(155,222,10,'A',0,'2026-11-08 21:53:11'),(156,223,10,'A',0,'2026-11-08 21:53:11'),(157,224,10,'A',0,'2026-11-08 21:53:11'),(158,225,10,'B',1,'2026-11-08 21:53:11'),(159,226,10,'A',0,'2026-11-08 21:53:11'),(160,227,10,'A',0,'2026-11-08 21:53:11'),(4115,291,184,'C',1,'2026-11-10 19:39:02'),(4116,291,185,'D',1,'2026-11-10 19:39:06'),(4117,291,186,'A',1,'2026-11-10 19:39:10'),(4118,291,187,'B',1,'2026-11-10 19:39:12'),(4119,291,188,'C',1,'2026-11-10 19:39:16'),(4120,291,189,'B',0,'2026-11-10 19:39:19'),(4121,291,190,'D',1,'2026-11-10 19:39:22'),(4122,291,191,'D',1,'2026-11-10 19:39:29'),(4123,291,192,'B',1,'2026-11-10 19:39:32'),(4124,291,193,'A',1,'2026-11-10 19:39:37'),(4125,289,1,'C',0,'2026-11-10 19:52:57'),(4126,289,2,'C',1,'2026-11-10 19:53:00'),(4127,289,3,'B',1,'2026-11-10 19:53:02'),(4128,289,4,'D',1,'2026-11-10 19:53:05'),(4129,289,5,'C',0,'2026-11-10 19:53:09'),(4130,289,6,'D',1,'2026-11-10 19:53:12'),(4131,289,7,'C',1,'2026-11-10 19:53:15'),(4132,289,8,'B',0,'2026-11-10 19:53:18'),(4133,289,9,'C',1,'2026-11-10 19:53:21'),(4134,289,10,'B',1,'2026-11-10 19:53:27');
/*!40000 ALTER TABLE `quiz_attempt_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_attempts`
--

DROP TABLE IF EXISTS `quiz_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_attempts` (
  `id` int NOT NULL,
  `student_id` int NOT NULL,
  `quiz_id` int NOT NULL,
  `current_question` int DEFAULT '0',
  `score` int DEFAULT '0',
  `question_started_at` datetime NOT NULL,
  `started_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `completed_at` datetime DEFAULT NULL,
  `status` enum('IN_PROGRESS','COMPLETED') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'IN_PROGRESS',
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_id` (`student_id`,`quiz_id`),
  KEY `idx_quiz_attempts_quiz_id` (`quiz_id`),
  CONSTRAINT `quiz_attempts_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quiz_attempts_ibfk_2` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_attempts`
--

LOCK TABLES `quiz_attempts` WRITE;
/*!40000 ALTER TABLE `quiz_attempts` DISABLE KEYS */;
INSERT INTO `quiz_attempts` VALUES (1,30,1,9,6,'2026-10-03 11:41:28','2026-10-03 11:34:44','2026-10-03 11:41:31','COMPLETED'),(2,29,1,9,8,'2026-10-03 12:04:14','2026-10-03 12:03:41','2026-10-03 12:04:17','COMPLETED'),(3,28,1,9,8,'2026-10-03 12:05:29','2026-10-03 12:05:00','2026-10-03 12:05:31','COMPLETED'),(4,27,1,9,7,'2026-10-07 23:13:07','2026-10-07 23:12:26','2026-10-07 23:13:09','COMPLETED'),(5,26,1,9,8,'2026-10-07 23:15:10','2026-10-07 23:14:04','2026-10-07 23:15:13','COMPLETED'),(6,25,1,9,7,'2026-10-09 22:00:14','2026-10-09 21:59:32','2026-10-09 22:00:17','COMPLETED'),(7,7,1,10,7,'2026-11-08 20:38:39','2026-11-08 20:38:39','2026-11-08 21:58:23','COMPLETED'),(219,22,1,10,10,'2026-11-08 21:48:11','2026-11-08 21:43:11','2026-11-08 21:53:11','COMPLETED'),(220,23,1,10,5,'2026-11-08 21:48:11','2026-11-08 21:43:11','2026-11-08 21:53:11','COMPLETED'),(221,24,1,10,6,'2026-11-08 21:48:11','2026-11-08 21:43:11','2026-11-08 21:53:11','COMPLETED'),(222,31,1,10,7,'2026-11-08 21:48:11','2026-11-08 21:43:11','2026-11-08 21:53:11','COMPLETED'),(223,32,1,10,8,'2026-11-08 21:48:11','2026-11-08 21:43:11','2026-11-08 21:53:11','COMPLETED'),(224,33,1,10,9,'2026-11-08 21:48:11','2026-11-08 21:43:11','2026-11-08 21:53:11','COMPLETED'),(225,34,1,10,10,'2026-11-08 21:48:11','2026-11-08 21:43:11','2026-11-08 21:53:11','COMPLETED'),(226,35,1,10,5,'2026-11-08 21:48:11','2026-11-08 21:43:11','2026-11-08 21:53:11','COMPLETED'),(227,36,1,10,6,'2026-11-08 21:48:11','2026-11-08 21:43:11','2026-11-08 21:53:11','COMPLETED'),(289,15,1,10,7,'2026-11-10 19:53:27','2026-11-10 13:35:57','2026-11-10 19:53:27','COMPLETED'),(290,30,17,0,0,'2026-11-10 18:44:58','2026-11-10 18:44:58',NULL,'IN_PROGRESS'),(291,15,18,10,9,'2026-11-10 19:39:37','2026-11-10 19:38:57','2026-11-10 19:39:37','COMPLETED'),(292,15,17,0,0,'2026-11-10 19:43:52','2026-11-10 19:43:52',NULL,'IN_PROGRESS');
/*!40000 ALTER TABLE `quiz_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_results`
--

DROP TABLE IF EXISTS `quiz_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_results` (
  `id` int NOT NULL,
  `student_id` int NOT NULL,
  `quiz_id` int NOT NULL,
  `score` int NOT NULL,
  `total` int NOT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `quiz_id` (`quiz_id`),
  CONSTRAINT `quiz_results_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quiz_results_ibfk_2` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_results`
--

LOCK TABLES `quiz_results` WRITE;
/*!40000 ALTER TABLE `quiz_results` DISABLE KEYS */;
INSERT INTO `quiz_results` VALUES (1,30,1,6,10,'2026-10-03 05:41:31'),(2,29,1,8,10,'2026-10-03 06:04:17'),(3,28,1,8,10,'2026-10-03 06:05:31'),(4,27,1,7,10,'2026-10-07 17:13:09'),(5,26,1,8,10,'2026-10-07 17:15:13'),(6,25,1,7,10,'2026-10-09 16:00:17'),(7,7,1,7,10,'2026-11-08 15:58:23'),(219,22,1,10,10,'2026-11-08 15:53:11'),(220,23,1,5,10,'2026-11-08 15:53:11'),(221,24,1,6,10,'2026-11-08 15:53:11'),(222,31,1,7,10,'2026-11-08 15:53:11'),(223,32,1,8,10,'2026-11-08 15:53:11'),(224,33,1,9,10,'2026-11-08 15:53:11'),(225,34,1,10,10,'2026-11-08 15:53:11'),(226,35,1,5,10,'2026-11-08 15:53:11'),(227,36,1,6,10,'2026-11-08 15:53:11'),(263,15,18,9,10,'2026-11-10 13:39:37'),(264,15,1,7,10,'2026-11-10 13:53:27');
/*!40000 ALTER TABLE `quiz_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizzes`
--

DROP TABLE IF EXISTS `quizzes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quizzes` (
  `id` int NOT NULL,
  `subject_id` int NOT NULL,
  `topic` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `quiz_date` date NOT NULL,
  `quiz_time` time NOT NULL,
  `total_questions` int DEFAULT '10',
  `created_by` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `subject_id` (`subject_id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `quizzes_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `quizzes_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizzes`
--

LOCK TABLES `quizzes` WRITE;
/*!40000 ALTER TABLE `quizzes` DISABLE KEYS */;
INSERT INTO `quizzes` VALUES (1,15,'MUX','2026-10-03','10:19:00',10,3,'2026-10-09 15:56:42'),(17,13,'Basic Math','2026-11-10','14:27:00',10,3,'2026-11-10 07:34:31'),(18,5,'Basic Math','2026-11-10','18:35:00',10,5,'2026-11-10 13:38:13');
/*!40000 ALTER TABLE `quizzes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `similarity_reports`
--

DROP TABLE IF EXISTS `similarity_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `similarity_reports` (
  `id` bigint NOT NULL,
  `assignment_id` int NOT NULL,
  `submission_a_id` int NOT NULL,
  `submission_b_id` int NOT NULL,
  `student_a_id` int NOT NULL,
  `student_b_id` int NOT NULL,
  `similarity_percent` decimal(6,2) NOT NULL DEFAULT '0.00',
  `cosine_percent` decimal(6,2) NOT NULL DEFAULT '0.00',
  `jaccard_percent` decimal(6,2) NOT NULL DEFAULT '0.00',
  `ngram_percent` decimal(6,2) NOT NULL DEFAULT '0.00',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `matched_count` int NOT NULL DEFAULT '0',
  `matched_text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_similarity_pair` (`submission_a_id`,`submission_b_id`),
  KEY `idx_similarity_assignment` (`assignment_id`),
  KEY `idx_similarity_score` (`similarity_percent`),
  KEY `fk_similarity_submission_b` (`submission_b_id`),
  KEY `fk_similarity_student_a` (`student_a_id`),
  KEY `fk_similarity_student_b` (`student_b_id`),
  CONSTRAINT `fk_similarity_assignment` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_similarity_student_a` FOREIGN KEY (`student_a_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_similarity_student_b` FOREIGN KEY (`student_b_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_similarity_submission_a` FOREIGN KEY (`submission_a_id`) REFERENCES `assignment_submissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_similarity_submission_b` FOREIGN KEY (`submission_b_id`) REFERENCES `assignment_submissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `similarity_reports`
--

LOCK TABLES `similarity_reports` WRITE;
/*!40000 ALTER TABLE `similarity_reports` DISABLE KEYS */;
INSERT INTO `similarity_reports` VALUES (1,1,2,4,7,15,0.85,2.44,0.00,0.00,'LOW_SIMILARITY',0,'','2026-11-10 03:38:25'),(2,1,3,4,29,15,0.85,2.44,0.00,0.00,'LOW_SIMILARITY',0,'','2026-11-10 03:38:59'),(3,1,1,2,30,7,100.00,100.00,100.00,100.00,'HIGH_SIMILARITY',40,'Department of computer science and engineering \r\n \r\nObject Oriented Programming II (Java) \r\nTopic: Design and Implementation of a Bank Management System Using Java  \r\nMd.Rokonuzzaman | CSE-19th | ID:06225105101036 \r\n \r\nTable of Contents \r\n1.\\n\\nImplementaƟon of OOP Concepts \r\no 4.1 EncapsulaƟon \r\no 4.2 AbstracƟon \r\no 4.3 Inheritance \r\no 4.4 Polymorphism \r\no 4.5 ExcepƟon Handling \r\n5.\\n\\nIntroducƟon \r\nObject-Oriented Programming (OOP) is a programming approach that organizes software around \r\nobjects and classes.\\n\\nJava is a popular object-oriented programming language that supports \r\nimportant concepts such as encapsulation, abstraction, inheritance, and polymorphism.\\n\\nThese \r\nconcepts help developers create reusable, secure, and maintainable applications.\\n\\nThis assignment presents the design and implementation of a simple Bank Management System \r\nusing Java.\\n\\nThe system manages two types of bank accounts: Savings Account and Current \r\nAccount.\\n\\nBoth accounts share common information, including account number and balance, but \r\nthey follow different withdrawal policies.\\n\\nThe system uses an abstract parent class named Account and two child classes named \r\nSavingsAccount and CurrentAccount.\\n\\nIt also implements method overloading, method overriding, \r\nruntime polymorphism, and custom exception handling.\\n\\nThe main purpose of this assignment is to \r\ndemonstrate how the fundamental concepts of Java OOP can be applied to a practical banking \r\napplication.\\n\\nObjecƟves of the Assignment \r\nThe main objecƟves of this assignment are: \r\n1.\\n\\nTo understand the fundamental concepts of Object-Oriented Programming in Java.\\n\\nTo implement encapsulaƟon using private data members and geƩer methods.\\n\\nTo understand abstracƟon through abstract classes and abstract methods.\\n\\nTo implement inheritance using parent and child classes.\\n\\nTo demonstrate polymorphism using method overloading and overriding.\\n\\nTo implement custom excepƟon handling using try, catch, and finally.\\n\\nTo develop a simple banking applicaƟon using Java.\\n\\nSystem Overview \r\nThe Bank Management System is designed to manage two different types of bank accounts.\\n\\nThe \r\nsystem contains one abstract parent class and two child classes.\\n\\nParent Class: Account \r\nThe Account class stores common account informaƟon, such as account number and balance.\\n\\nIt \r\nalso provides deposit methods and an abstract withdrawal method.\\n\\nChild Class 1: SavingsAccount \r\nThe SavingsAccount class inherits from Account.\\n\\nA customer \r\nmust maintain at least 500 in the account aŌer making a withdrawal.\\n\\nChild Class 2: CurrentAccount \r\nThe CurrentAccount class also inherits from Account.\\n\\nIt allows customers to withdraw more than \r\ntheir available balance within an overdraŌ limit of 1000.\\n\\nCustom ExcepƟon: InsufficientBalanceExcepƟon \r\nThis excepƟon is generated when a customer tries to withdraw an invalid amount or violates the \r\naccount\'s withdrawal rules.\\n\\nImplementaƟon of Object-Oriented Programming Concepts \r\n4.1 EncapsulaƟon \r\nEncapsulaƟon is the process of combining data and methods into a single class while restricƟng \r\ndirect access to the data.\\n\\nIn Java, encapsulaƟon is commonly implemented using private variables \r\nand public geƩer and seƩer methods.\\n\\nIn this program, the Account class contains two private variables: accountNumber and balance.\\n\\nThese variables cannot be accessed directly from outside the class.\\n\\nGeƩer methods are provided \r\nto retrieve their values.\\n\\nThis approach protects account informaƟon and prevents unwanted \r\ndirect access.\\n\\nCode Example: \r\n \r\n \r\n4.2 AbstracƟon \r\nAbstraction means hiding implementation details and showing only the essential features of an \r\nobject.\\n\\nJava provides abstraction through abstract classes and interfaces.\\n\\nIn this program, Account is declared as an abstract class.\\n\\nIt contains an abstract method named \r\nwithdraw(double amount).\\n\\nThe parent class declares the method, but the actual withdrawal \r\nimplementation is provided by its child classes.\\n\\nTherefore, each account type can follow its own \r\nwithdrawal rules.','2026-11-10 03:39:27'),(4,1,1,6,30,8,100.00,100.00,100.00,100.00,'HIGH_SIMILARITY',40,'Department of computer science and engineering \r\n \r\nObject Oriented Programming II (Java) \r\nTopic: Design and Implementation of a Bank Management System Using Java  \r\nMd.Rokonuzzaman | CSE-19th | ID:06225105101036 \r\n \r\nTable of Contents \r\n1.\\n\\nImplementaƟon of OOP Concepts \r\no 4.1 EncapsulaƟon \r\no 4.2 AbstracƟon \r\no 4.3 Inheritance \r\no 4.4 Polymorphism \r\no 4.5 ExcepƟon Handling \r\n5.\\n\\nIntroducƟon \r\nObject-Oriented Programming (OOP) is a programming approach that organizes software around \r\nobjects and classes.\\n\\nJava is a popular object-oriented programming language that supports \r\nimportant concepts such as encapsulation, abstraction, inheritance, and polymorphism.\\n\\nThese \r\nconcepts help developers create reusable, secure, and maintainable applications.\\n\\nThis assignment presents the design and implementation of a simple Bank Management System \r\nusing Java.\\n\\nThe system manages two types of bank accounts: Savings Account and Current \r\nAccount.\\n\\nBoth accounts share common information, including account number and balance, but \r\nthey follow different withdrawal policies.\\n\\nThe system uses an abstract parent class named Account and two child classes named \r\nSavingsAccount and CurrentAccount.\\n\\nIt also implements method overloading, method overriding, \r\nruntime polymorphism, and custom exception handling.\\n\\nThe main purpose of this assignment is to \r\ndemonstrate how the fundamental concepts of Java OOP can be applied to a practical banking \r\napplication.\\n\\nObjecƟves of the Assignment \r\nThe main objecƟves of this assignment are: \r\n1.\\n\\nTo understand the fundamental concepts of Object-Oriented Programming in Java.\\n\\nTo implement encapsulaƟon using private data members and geƩer methods.\\n\\nTo understand abstracƟon through abstract classes and abstract methods.\\n\\nTo implement inheritance using parent and child classes.\\n\\nTo demonstrate polymorphism using method overloading and overriding.\\n\\nTo implement custom excepƟon handling using try, catch, and finally.\\n\\nTo develop a simple banking applicaƟon using Java.\\n\\nSystem Overview \r\nThe Bank Management System is designed to manage two different types of bank accounts.\\n\\nThe \r\nsystem contains one abstract parent class and two child classes.\\n\\nParent Class: Account \r\nThe Account class stores common account informaƟon, such as account number and balance.\\n\\nIt \r\nalso provides deposit methods and an abstract withdrawal method.\\n\\nChild Class 1: SavingsAccount \r\nThe SavingsAccount class inherits from Account.\\n\\nA customer \r\nmust maintain at least 500 in the account aŌer making a withdrawal.\\n\\nChild Class 2: CurrentAccount \r\nThe CurrentAccount class also inherits from Account.\\n\\nIt allows customers to withdraw more than \r\ntheir available balance within an overdraŌ limit of 1000.\\n\\nCustom ExcepƟon: InsufficientBalanceExcepƟon \r\nThis excepƟon is generated when a customer tries to withdraw an invalid amount or violates the \r\naccount\'s withdrawal rules.\\n\\nImplementaƟon of Object-Oriented Programming Concepts \r\n4.1 EncapsulaƟon \r\nEncapsulaƟon is the process of combining data and methods into a single class while restricƟng \r\ndirect access to the data.\\n\\nIn Java, encapsulaƟon is commonly implemented using private variables \r\nand public geƩer and seƩer methods.\\n\\nIn this program, the Account class contains two private variables: accountNumber and balance.\\n\\nThese variables cannot be accessed directly from outside the class.\\n\\nGeƩer methods are provided \r\nto retrieve their values.\\n\\nThis approach protects account informaƟon and prevents unwanted \r\ndirect access.\\n\\nCode Example: \r\n \r\n \r\n4.2 AbstracƟon \r\nAbstraction means hiding implementation details and showing only the essential features of an \r\nobject.\\n\\nJava provides abstraction through abstract classes and interfaces.\\n\\nIn this program, Account is declared as an abstract class.\\n\\nIt contains an abstract method named \r\nwithdraw(double amount).\\n\\nThe parent class declares the method, but the actual withdrawal \r\nimplementation is provided by its child classes.\\n\\nTherefore, each account type can follow its own \r\nwithdrawal rules.','2026-11-10 04:20:37'),(5,1,2,6,7,8,100.00,100.00,100.00,100.00,'HIGH_SIMILARITY',40,'Department of computer science and engineering \r\n \r\nObject Oriented Programming II (Java) \r\nTopic: Design and Implementation of a Bank Management System Using Java  \r\nMd.Rokonuzzaman | CSE-19th | ID:06225105101036 \r\n \r\nTable of Contents \r\n1.\\n\\nImplementaƟon of OOP Concepts \r\no 4.1 EncapsulaƟon \r\no 4.2 AbstracƟon \r\no 4.3 Inheritance \r\no 4.4 Polymorphism \r\no 4.5 ExcepƟon Handling \r\n5.\\n\\nIntroducƟon \r\nObject-Oriented Programming (OOP) is a programming approach that organizes software around \r\nobjects and classes.\\n\\nJava is a popular object-oriented programming language that supports \r\nimportant concepts such as encapsulation, abstraction, inheritance, and polymorphism.\\n\\nThese \r\nconcepts help developers create reusable, secure, and maintainable applications.\\n\\nThis assignment presents the design and implementation of a simple Bank Management System \r\nusing Java.\\n\\nThe system manages two types of bank accounts: Savings Account and Current \r\nAccount.\\n\\nBoth accounts share common information, including account number and balance, but \r\nthey follow different withdrawal policies.\\n\\nThe system uses an abstract parent class named Account and two child classes named \r\nSavingsAccount and CurrentAccount.\\n\\nIt also implements method overloading, method overriding, \r\nruntime polymorphism, and custom exception handling.\\n\\nThe main purpose of this assignment is to \r\ndemonstrate how the fundamental concepts of Java OOP can be applied to a practical banking \r\napplication.\\n\\nObjecƟves of the Assignment \r\nThe main objecƟves of this assignment are: \r\n1.\\n\\nTo understand the fundamental concepts of Object-Oriented Programming in Java.\\n\\nTo implement encapsulaƟon using private data members and geƩer methods.\\n\\nTo understand abstracƟon through abstract classes and abstract methods.\\n\\nTo implement inheritance using parent and child classes.\\n\\nTo demonstrate polymorphism using method overloading and overriding.\\n\\nTo implement custom excepƟon handling using try, catch, and finally.\\n\\nTo develop a simple banking applicaƟon using Java.\\n\\nSystem Overview \r\nThe Bank Management System is designed to manage two different types of bank accounts.\\n\\nThe \r\nsystem contains one abstract parent class and two child classes.\\n\\nParent Class: Account \r\nThe Account class stores common account informaƟon, such as account number and balance.\\n\\nIt \r\nalso provides deposit methods and an abstract withdrawal method.\\n\\nChild Class 1: SavingsAccount \r\nThe SavingsAccount class inherits from Account.\\n\\nA customer \r\nmust maintain at least 500 in the account aŌer making a withdrawal.\\n\\nChild Class 2: CurrentAccount \r\nThe CurrentAccount class also inherits from Account.\\n\\nIt allows customers to withdraw more than \r\ntheir available balance within an overdraŌ limit of 1000.\\n\\nCustom ExcepƟon: InsufficientBalanceExcepƟon \r\nThis excepƟon is generated when a customer tries to withdraw an invalid amount or violates the \r\naccount\'s withdrawal rules.\\n\\nImplementaƟon of Object-Oriented Programming Concepts \r\n4.1 EncapsulaƟon \r\nEncapsulaƟon is the process of combining data and methods into a single class while restricƟng \r\ndirect access to the data.\\n\\nIn Java, encapsulaƟon is commonly implemented using private variables \r\nand public geƩer and seƩer methods.\\n\\nIn this program, the Account class contains two private variables: accountNumber and balance.\\n\\nThese variables cannot be accessed directly from outside the class.\\n\\nGeƩer methods are provided \r\nto retrieve their values.\\n\\nThis approach protects account informaƟon and prevents unwanted \r\ndirect access.\\n\\nCode Example: \r\n \r\n \r\n4.2 AbstracƟon \r\nAbstraction means hiding implementation details and showing only the essential features of an \r\nobject.\\n\\nJava provides abstraction through abstract classes and interfaces.\\n\\nIn this program, Account is declared as an abstract class.\\n\\nIt contains an abstract method named \r\nwithdraw(double amount).\\n\\nThe parent class declares the method, but the actual withdrawal \r\nimplementation is provided by its child classes.\\n\\nTherefore, each account type can follow its own \r\nwithdrawal rules.','2026-11-10 04:20:37'),(6,1,3,6,29,8,100.00,100.00,100.00,100.00,'HIGH_SIMILARITY',40,'Department of computer science and engineering \r\n \r\nObject Oriented Programming II (Java) \r\nTopic: Design and Implementation of a Bank Management System Using Java  \r\nMd.Rokonuzzaman | CSE-19th | ID:06225105101036 \r\n \r\nTable of Contents \r\n1.\\n\\nImplementaƟon of OOP Concepts \r\no 4.1 EncapsulaƟon \r\no 4.2 AbstracƟon \r\no 4.3 Inheritance \r\no 4.4 Polymorphism \r\no 4.5 ExcepƟon Handling \r\n5.\\n\\nIntroducƟon \r\nObject-Oriented Programming (OOP) is a programming approach that organizes software around \r\nobjects and classes.\\n\\nJava is a popular object-oriented programming language that supports \r\nimportant concepts such as encapsulation, abstraction, inheritance, and polymorphism.\\n\\nThese \r\nconcepts help developers create reusable, secure, and maintainable applications.\\n\\nThis assignment presents the design and implementation of a simple Bank Management System \r\nusing Java.\\n\\nThe system manages two types of bank accounts: Savings Account and Current \r\nAccount.\\n\\nBoth accounts share common information, including account number and balance, but \r\nthey follow different withdrawal policies.\\n\\nThe system uses an abstract parent class named Account and two child classes named \r\nSavingsAccount and CurrentAccount.\\n\\nIt also implements method overloading, method overriding, \r\nruntime polymorphism, and custom exception handling.\\n\\nThe main purpose of this assignment is to \r\ndemonstrate how the fundamental concepts of Java OOP can be applied to a practical banking \r\napplication.\\n\\nObjecƟves of the Assignment \r\nThe main objecƟves of this assignment are: \r\n1.\\n\\nTo understand the fundamental concepts of Object-Oriented Programming in Java.\\n\\nTo implement encapsulaƟon using private data members and geƩer methods.\\n\\nTo understand abstracƟon through abstract classes and abstract methods.\\n\\nTo implement inheritance using parent and child classes.\\n\\nTo demonstrate polymorphism using method overloading and overriding.\\n\\nTo implement custom excepƟon handling using try, catch, and finally.\\n\\nTo develop a simple banking applicaƟon using Java.\\n\\nSystem Overview \r\nThe Bank Management System is designed to manage two different types of bank accounts.\\n\\nThe \r\nsystem contains one abstract parent class and two child classes.\\n\\nParent Class: Account \r\nThe Account class stores common account informaƟon, such as account number and balance.\\n\\nIt \r\nalso provides deposit methods and an abstract withdrawal method.\\n\\nChild Class 1: SavingsAccount \r\nThe SavingsAccount class inherits from Account.\\n\\nA customer \r\nmust maintain at least 500 in the account aŌer making a withdrawal.\\n\\nChild Class 2: CurrentAccount \r\nThe CurrentAccount class also inherits from Account.\\n\\nIt allows customers to withdraw more than \r\ntheir available balance within an overdraŌ limit of 1000.\\n\\nCustom ExcepƟon: InsufficientBalanceExcepƟon \r\nThis excepƟon is generated when a customer tries to withdraw an invalid amount or violates the \r\naccount\'s withdrawal rules.\\n\\nImplementaƟon of Object-Oriented Programming Concepts \r\n4.1 EncapsulaƟon \r\nEncapsulaƟon is the process of combining data and methods into a single class while restricƟng \r\ndirect access to the data.\\n\\nIn Java, encapsulaƟon is commonly implemented using private variables \r\nand public geƩer and seƩer methods.\\n\\nIn this program, the Account class contains two private variables: accountNumber and balance.\\n\\nThese variables cannot be accessed directly from outside the class.\\n\\nGeƩer methods are provided \r\nto retrieve their values.\\n\\nThis approach protects account informaƟon and prevents unwanted \r\ndirect access.\\n\\nCode Example: \r\n \r\n \r\n4.2 AbstracƟon \r\nAbstraction means hiding implementation details and showing only the essential features of an \r\nobject.\\n\\nJava provides abstraction through abstract classes and interfaces.\\n\\nIn this program, Account is declared as an abstract class.\\n\\nIt contains an abstract method named \r\nwithdraw(double amount).\\n\\nThe parent class declares the method, but the actual withdrawal \r\nimplementation is provided by its child classes.\\n\\nTherefore, each account type can follow its own \r\nwithdrawal rules.','2026-11-10 04:20:38'),(7,1,4,6,15,8,0.85,2.44,0.00,0.00,'LOW_SIMILARITY',0,'','2026-11-10 04:20:38'),(8,2,5,7,7,8,100.00,100.00,100.00,100.00,'HIGH_SIMILARITY',40,'Department of computer science and engineering \r\n \r\nObject Oriented Programming II (Java) \r\nTopic: Design and Implementation of a Bank Management System Using Java  \r\nMd.Rokonuzzaman | CSE-19th | ID:06225105101036 \r\n \r\nTable of Contents \r\n1.\\n\\nImplementaƟon of OOP Concepts \r\no 4.1 EncapsulaƟon \r\no 4.2 AbstracƟon \r\no 4.3 Inheritance \r\no 4.4 Polymorphism \r\no 4.5 ExcepƟon Handling \r\n5.\\n\\nIntroducƟon \r\nObject-Oriented Programming (OOP) is a programming approach that organizes software around \r\nobjects and classes.\\n\\nJava is a popular object-oriented programming language that supports \r\nimportant concepts such as encapsulation, abstraction, inheritance, and polymorphism.\\n\\nThese \r\nconcepts help developers create reusable, secure, and maintainable applications.\\n\\nThis assignment presents the design and implementation of a simple Bank Management System \r\nusing Java.\\n\\nThe system manages two types of bank accounts: Savings Account and Current \r\nAccount.\\n\\nBoth accounts share common information, including account number and balance, but \r\nthey follow different withdrawal policies.\\n\\nThe system uses an abstract parent class named Account and two child classes named \r\nSavingsAccount and CurrentAccount.\\n\\nIt also implements method overloading, method overriding, \r\nruntime polymorphism, and custom exception handling.\\n\\nThe main purpose of this assignment is to \r\ndemonstrate how the fundamental concepts of Java OOP can be applied to a practical banking \r\napplication.\\n\\nObjecƟves of the Assignment \r\nThe main objecƟves of this assignment are: \r\n1.\\n\\nTo understand the fundamental concepts of Object-Oriented Programming in Java.\\n\\nTo implement encapsulaƟon using private data members and geƩer methods.\\n\\nTo understand abstracƟon through abstract classes and abstract methods.\\n\\nTo implement inheritance using parent and child classes.\\n\\nTo demonstrate polymorphism using method overloading and overriding.\\n\\nTo implement custom excepƟon handling using try, catch, and finally.\\n\\nTo develop a simple banking applicaƟon using Java.\\n\\nSystem Overview \r\nThe Bank Management System is designed to manage two different types of bank accounts.\\n\\nThe \r\nsystem contains one abstract parent class and two child classes.\\n\\nParent Class: Account \r\nThe Account class stores common account informaƟon, such as account number and balance.\\n\\nIt \r\nalso provides deposit methods and an abstract withdrawal method.\\n\\nChild Class 1: SavingsAccount \r\nThe SavingsAccount class inherits from Account.\\n\\nA customer \r\nmust maintain at least 500 in the account aŌer making a withdrawal.\\n\\nChild Class 2: CurrentAccount \r\nThe CurrentAccount class also inherits from Account.\\n\\nIt allows customers to withdraw more than \r\ntheir available balance within an overdraŌ limit of 1000.\\n\\nCustom ExcepƟon: InsufficientBalanceExcepƟon \r\nThis excepƟon is generated when a customer tries to withdraw an invalid amount or violates the \r\naccount\'s withdrawal rules.\\n\\nImplementaƟon of Object-Oriented Programming Concepts \r\n4.1 EncapsulaƟon \r\nEncapsulaƟon is the process of combining data and methods into a single class while restricƟng \r\ndirect access to the data.\\n\\nIn Java, encapsulaƟon is commonly implemented using private variables \r\nand public geƩer and seƩer methods.\\n\\nIn this program, the Account class contains two private variables: accountNumber and balance.\\n\\nThese variables cannot be accessed directly from outside the class.\\n\\nGeƩer methods are provided \r\nto retrieve their values.\\n\\nThis approach protects account informaƟon and prevents unwanted \r\ndirect access.\\n\\nCode Example: \r\n \r\n \r\n4.2 AbstracƟon \r\nAbstraction means hiding implementation details and showing only the essential features of an \r\nobject.\\n\\nJava provides abstraction through abstract classes and interfaces.\\n\\nIn this program, Account is declared as an abstract class.\\n\\nIt contains an abstract method named \r\nwithdraw(double amount).\\n\\nThe parent class declares the method, but the actual withdrawal \r\nimplementation is provided by its child classes.\\n\\nTherefore, each account type can follow its own \r\nwithdrawal rules.','2026-11-10 04:21:33'),(9,2,5,8,7,9,100.00,100.00,100.00,100.00,'HIGH_SIMILARITY',40,'Department of computer science and engineering \r\n \r\nObject Oriented Programming II (Java) \r\nTopic: Design and Implementation of a Bank Management System Using Java  \r\nMd.Rokonuzzaman | CSE-19th | ID:06225105101036 \r\n \r\nTable of Contents \r\n1.\\n\\nImplementaƟon of OOP Concepts \r\no 4.1 EncapsulaƟon \r\no 4.2 AbstracƟon \r\no 4.3 Inheritance \r\no 4.4 Polymorphism \r\no 4.5 ExcepƟon Handling \r\n5.\\n\\nIntroducƟon \r\nObject-Oriented Programming (OOP) is a programming approach that organizes software around \r\nobjects and classes.\\n\\nJava is a popular object-oriented programming language that supports \r\nimportant concepts such as encapsulation, abstraction, inheritance, and polymorphism.\\n\\nThese \r\nconcepts help developers create reusable, secure, and maintainable applications.\\n\\nThis assignment presents the design and implementation of a simple Bank Management System \r\nusing Java.\\n\\nThe system manages two types of bank accounts: Savings Account and Current \r\nAccount.\\n\\nBoth accounts share common information, including account number and balance, but \r\nthey follow different withdrawal policies.\\n\\nThe system uses an abstract parent class named Account and two child classes named \r\nSavingsAccount and CurrentAccount.\\n\\nIt also implements method overloading, method overriding, \r\nruntime polymorphism, and custom exception handling.\\n\\nThe main purpose of this assignment is to \r\ndemonstrate how the fundamental concepts of Java OOP can be applied to a practical banking \r\napplication.\\n\\nObjecƟves of the Assignment \r\nThe main objecƟves of this assignment are: \r\n1.\\n\\nTo understand the fundamental concepts of Object-Oriented Programming in Java.\\n\\nTo implement encapsulaƟon using private data members and geƩer methods.\\n\\nTo understand abstracƟon through abstract classes and abstract methods.\\n\\nTo implement inheritance using parent and child classes.\\n\\nTo demonstrate polymorphism using method overloading and overriding.\\n\\nTo implement custom excepƟon handling using try, catch, and finally.\\n\\nTo develop a simple banking applicaƟon using Java.\\n\\nSystem Overview \r\nThe Bank Management System is designed to manage two different types of bank accounts.\\n\\nThe \r\nsystem contains one abstract parent class and two child classes.\\n\\nParent Class: Account \r\nThe Account class stores common account informaƟon, such as account number and balance.\\n\\nIt \r\nalso provides deposit methods and an abstract withdrawal method.\\n\\nChild Class 1: SavingsAccount \r\nThe SavingsAccount class inherits from Account.\\n\\nA customer \r\nmust maintain at least 500 in the account aŌer making a withdrawal.\\n\\nChild Class 2: CurrentAccount \r\nThe CurrentAccount class also inherits from Account.\\n\\nIt allows customers to withdraw more than \r\ntheir available balance within an overdraŌ limit of 1000.\\n\\nCustom ExcepƟon: InsufficientBalanceExcepƟon \r\nThis excepƟon is generated when a customer tries to withdraw an invalid amount or violates the \r\naccount\'s withdrawal rules.\\n\\nImplementaƟon of Object-Oriented Programming Concepts \r\n4.1 EncapsulaƟon \r\nEncapsulaƟon is the process of combining data and methods into a single class while restricƟng \r\ndirect access to the data.\\n\\nIn Java, encapsulaƟon is commonly implemented using private variables \r\nand public geƩer and seƩer methods.\\n\\nIn this program, the Account class contains two private variables: accountNumber and balance.\\n\\nThese variables cannot be accessed directly from outside the class.\\n\\nGeƩer methods are provided \r\nto retrieve their values.\\n\\nThis approach protects account informaƟon and prevents unwanted \r\ndirect access.\\n\\nCode Example: \r\n \r\n \r\n4.2 AbstracƟon \r\nAbstraction means hiding implementation details and showing only the essential features of an \r\nobject.\\n\\nJava provides abstraction through abstract classes and interfaces.\\n\\nIn this program, Account is declared as an abstract class.\\n\\nIt contains an abstract method named \r\nwithdraw(double amount).\\n\\nThe parent class declares the method, but the actual withdrawal \r\nimplementation is provided by its child classes.\\n\\nTherefore, each account type can follow its own \r\nwithdrawal rules.','2026-11-10 04:22:25'),(10,2,7,8,8,9,100.00,100.00,100.00,100.00,'HIGH_SIMILARITY',40,'Department of computer science and engineering \r\n \r\nObject Oriented Programming II (Java) \r\nTopic: Design and Implementation of a Bank Management System Using Java  \r\nMd.Rokonuzzaman | CSE-19th | ID:06225105101036 \r\n \r\nTable of Contents \r\n1.\\n\\nImplementaƟon of OOP Concepts \r\no 4.1 EncapsulaƟon \r\no 4.2 AbstracƟon \r\no 4.3 Inheritance \r\no 4.4 Polymorphism \r\no 4.5 ExcepƟon Handling \r\n5.\\n\\nIntroducƟon \r\nObject-Oriented Programming (OOP) is a programming approach that organizes software around \r\nobjects and classes.\\n\\nJava is a popular object-oriented programming language that supports \r\nimportant concepts such as encapsulation, abstraction, inheritance, and polymorphism.\\n\\nThese \r\nconcepts help developers create reusable, secure, and maintainable applications.\\n\\nThis assignment presents the design and implementation of a simple Bank Management System \r\nusing Java.\\n\\nThe system manages two types of bank accounts: Savings Account and Current \r\nAccount.\\n\\nBoth accounts share common information, including account number and balance, but \r\nthey follow different withdrawal policies.\\n\\nThe system uses an abstract parent class named Account and two child classes named \r\nSavingsAccount and CurrentAccount.\\n\\nIt also implements method overloading, method overriding, \r\nruntime polymorphism, and custom exception handling.\\n\\nThe main purpose of this assignment is to \r\ndemonstrate how the fundamental concepts of Java OOP can be applied to a practical banking \r\napplication.\\n\\nObjecƟves of the Assignment \r\nThe main objecƟves of this assignment are: \r\n1.\\n\\nTo understand the fundamental concepts of Object-Oriented Programming in Java.\\n\\nTo implement encapsulaƟon using private data members and geƩer methods.\\n\\nTo understand abstracƟon through abstract classes and abstract methods.\\n\\nTo implement inheritance using parent and child classes.\\n\\nTo demonstrate polymorphism using method overloading and overriding.\\n\\nTo implement custom excepƟon handling using try, catch, and finally.\\n\\nTo develop a simple banking applicaƟon using Java.\\n\\nSystem Overview \r\nThe Bank Management System is designed to manage two different types of bank accounts.\\n\\nThe \r\nsystem contains one abstract parent class and two child classes.\\n\\nParent Class: Account \r\nThe Account class stores common account informaƟon, such as account number and balance.\\n\\nIt \r\nalso provides deposit methods and an abstract withdrawal method.\\n\\nChild Class 1: SavingsAccount \r\nThe SavingsAccount class inherits from Account.\\n\\nA customer \r\nmust maintain at least 500 in the account aŌer making a withdrawal.\\n\\nChild Class 2: CurrentAccount \r\nThe CurrentAccount class also inherits from Account.\\n\\nIt allows customers to withdraw more than \r\ntheir available balance within an overdraŌ limit of 1000.\\n\\nCustom ExcepƟon: InsufficientBalanceExcepƟon \r\nThis excepƟon is generated when a customer tries to withdraw an invalid amount or violates the \r\naccount\'s withdrawal rules.\\n\\nImplementaƟon of Object-Oriented Programming Concepts \r\n4.1 EncapsulaƟon \r\nEncapsulaƟon is the process of combining data and methods into a single class while restricƟng \r\ndirect access to the data.\\n\\nIn Java, encapsulaƟon is commonly implemented using private variables \r\nand public geƩer and seƩer methods.\\n\\nIn this program, the Account class contains two private variables: accountNumber and balance.\\n\\nThese variables cannot be accessed directly from outside the class.\\n\\nGeƩer methods are provided \r\nto retrieve their values.\\n\\nThis approach protects account informaƟon and prevents unwanted \r\ndirect access.\\n\\nCode Example: \r\n \r\n \r\n4.2 AbstracƟon \r\nAbstraction means hiding implementation details and showing only the essential features of an \r\nobject.\\n\\nJava provides abstraction through abstract classes and interfaces.\\n\\nIn this program, Account is declared as an abstract class.\\n\\nIt contains an abstract method named \r\nwithdraw(double amount).\\n\\nThe parent class declares the method, but the actual withdrawal \r\nimplementation is provided by its child classes.\\n\\nTherefore, each account type can follow its own \r\nwithdrawal rules.','2026-11-10 04:22:26'),(11,2,5,9,7,10,100.00,100.00,100.00,100.00,'HIGH_SIMILARITY',40,'Department of computer science and engineering \r\n \r\nObject Oriented Programming II (Java) \r\nTopic: Design and Implementation of a Bank Management System Using Java  \r\nMd.Rokonuzzaman | CSE-19th | ID:06225105101036 \r\n \r\nTable of Contents \r\n1.\\n\\nImplementaƟon of OOP Concepts \r\no 4.1 EncapsulaƟon \r\no 4.2 AbstracƟon \r\no 4.3 Inheritance \r\no 4.4 Polymorphism \r\no 4.5 ExcepƟon Handling \r\n5.\\n\\nIntroducƟon \r\nObject-Oriented Programming (OOP) is a programming approach that organizes software around \r\nobjects and classes.\\n\\nJava is a popular object-oriented programming language that supports \r\nimportant concepts such as encapsulation, abstraction, inheritance, and polymorphism.\\n\\nThese \r\nconcepts help developers create reusable, secure, and maintainable applications.\\n\\nThis assignment presents the design and implementation of a simple Bank Management System \r\nusing Java.\\n\\nThe system manages two types of bank accounts: Savings Account and Current \r\nAccount.\\n\\nBoth accounts share common information, including account number and balance, but \r\nthey follow different withdrawal policies.\\n\\nThe system uses an abstract parent class named Account and two child classes named \r\nSavingsAccount and CurrentAccount.\\n\\nIt also implements method overloading, method overriding, \r\nruntime polymorphism, and custom exception handling.\\n\\nThe main purpose of this assignment is to \r\ndemonstrate how the fundamental concepts of Java OOP can be applied to a practical banking \r\napplication.\\n\\nObjecƟves of the Assignment \r\nThe main objecƟves of this assignment are: \r\n1.\\n\\nTo understand the fundamental concepts of Object-Oriented Programming in Java.\\n\\nTo implement encapsulaƟon using private data members and geƩer methods.\\n\\nTo understand abstracƟon through abstract classes and abstract methods.\\n\\nTo implement inheritance using parent and child classes.\\n\\nTo demonstrate polymorphism using method overloading and overriding.\\n\\nTo implement custom excepƟon handling using try, catch, and finally.\\n\\nTo develop a simple banking applicaƟon using Java.\\n\\nSystem Overview \r\nThe Bank Management System is designed to manage two different types of bank accounts.\\n\\nThe \r\nsystem contains one abstract parent class and two child classes.\\n\\nParent Class: Account \r\nThe Account class stores common account informaƟon, such as account number and balance.\\n\\nIt \r\nalso provides deposit methods and an abstract withdrawal method.\\n\\nChild Class 1: SavingsAccount \r\nThe SavingsAccount class inherits from Account.\\n\\nA customer \r\nmust maintain at least 500 in the account aŌer making a withdrawal.\\n\\nChild Class 2: CurrentAccount \r\nThe CurrentAccount class also inherits from Account.\\n\\nIt allows customers to withdraw more than \r\ntheir available balance within an overdraŌ limit of 1000.\\n\\nCustom ExcepƟon: InsufficientBalanceExcepƟon \r\nThis excepƟon is generated when a customer tries to withdraw an invalid amount or violates the \r\naccount\'s withdrawal rules.\\n\\nImplementaƟon of Object-Oriented Programming Concepts \r\n4.1 EncapsulaƟon \r\nEncapsulaƟon is the process of combining data and methods into a single class while restricƟng \r\ndirect access to the data.\\n\\nIn Java, encapsulaƟon is commonly implemented using private variables \r\nand public geƩer and seƩer methods.\\n\\nIn this program, the Account class contains two private variables: accountNumber and balance.\\n\\nThese variables cannot be accessed directly from outside the class.\\n\\nGeƩer methods are provided \r\nto retrieve their values.\\n\\nThis approach protects account informaƟon and prevents unwanted \r\ndirect access.\\n\\nCode Example: \r\n \r\n \r\n4.2 AbstracƟon \r\nAbstraction means hiding implementation details and showing only the essential features of an \r\nobject.\\n\\nJava provides abstraction through abstract classes and interfaces.\\n\\nIn this program, Account is declared as an abstract class.\\n\\nIt contains an abstract method named \r\nwithdraw(double amount).\\n\\nThe parent class declares the method, but the actual withdrawal \r\nimplementation is provided by its child classes.\\n\\nTherefore, each account type can follow its own \r\nwithdrawal rules.','2026-11-10 04:22:53'),(12,2,7,9,8,10,100.00,100.00,100.00,100.00,'HIGH_SIMILARITY',40,'Department of computer science and engineering \r\n \r\nObject Oriented Programming II (Java) \r\nTopic: Design and Implementation of a Bank Management System Using Java  \r\nMd.Rokonuzzaman | CSE-19th | ID:06225105101036 \r\n \r\nTable of Contents \r\n1.\\n\\nImplementaƟon of OOP Concepts \r\no 4.1 EncapsulaƟon \r\no 4.2 AbstracƟon \r\no 4.3 Inheritance \r\no 4.4 Polymorphism \r\no 4.5 ExcepƟon Handling \r\n5.\\n\\nIntroducƟon \r\nObject-Oriented Programming (OOP) is a programming approach that organizes software around \r\nobjects and classes.\\n\\nJava is a popular object-oriented programming language that supports \r\nimportant concepts such as encapsulation, abstraction, inheritance, and polymorphism.\\n\\nThese \r\nconcepts help developers create reusable, secure, and maintainable applications.\\n\\nThis assignment presents the design and implementation of a simple Bank Management System \r\nusing Java.\\n\\nThe system manages two types of bank accounts: Savings Account and Current \r\nAccount.\\n\\nBoth accounts share common information, including account number and balance, but \r\nthey follow different withdrawal policies.\\n\\nThe system uses an abstract parent class named Account and two child classes named \r\nSavingsAccount and CurrentAccount.\\n\\nIt also implements method overloading, method overriding, \r\nruntime polymorphism, and custom exception handling.\\n\\nThe main purpose of this assignment is to \r\ndemonstrate how the fundamental concepts of Java OOP can be applied to a practical banking \r\napplication.\\n\\nObjecƟves of the Assignment \r\nThe main objecƟves of this assignment are: \r\n1.\\n\\nTo understand the fundamental concepts of Object-Oriented Programming in Java.\\n\\nTo implement encapsulaƟon using private data members and geƩer methods.\\n\\nTo understand abstracƟon through abstract classes and abstract methods.\\n\\nTo implement inheritance using parent and child classes.\\n\\nTo demonstrate polymorphism using method overloading and overriding.\\n\\nTo implement custom excepƟon handling using try, catch, and finally.\\n\\nTo develop a simple banking applicaƟon using Java.\\n\\nSystem Overview \r\nThe Bank Management System is designed to manage two different types of bank accounts.\\n\\nThe \r\nsystem contains one abstract parent class and two child classes.\\n\\nParent Class: Account \r\nThe Account class stores common account informaƟon, such as account number and balance.\\n\\nIt \r\nalso provides deposit methods and an abstract withdrawal method.\\n\\nChild Class 1: SavingsAccount \r\nThe SavingsAccount class inherits from Account.\\n\\nA customer \r\nmust maintain at least 500 in the account aŌer making a withdrawal.\\n\\nChild Class 2: CurrentAccount \r\nThe CurrentAccount class also inherits from Account.\\n\\nIt allows customers to withdraw more than \r\ntheir available balance within an overdraŌ limit of 1000.\\n\\nCustom ExcepƟon: InsufficientBalanceExcepƟon \r\nThis excepƟon is generated when a customer tries to withdraw an invalid amount or violates the \r\naccount\'s withdrawal rules.\\n\\nImplementaƟon of Object-Oriented Programming Concepts \r\n4.1 EncapsulaƟon \r\nEncapsulaƟon is the process of combining data and methods into a single class while restricƟng \r\ndirect access to the data.\\n\\nIn Java, encapsulaƟon is commonly implemented using private variables \r\nand public geƩer and seƩer methods.\\n\\nIn this program, the Account class contains two private variables: accountNumber and balance.\\n\\nThese variables cannot be accessed directly from outside the class.\\n\\nGeƩer methods are provided \r\nto retrieve their values.\\n\\nThis approach protects account informaƟon and prevents unwanted \r\ndirect access.\\n\\nCode Example: \r\n \r\n \r\n4.2 AbstracƟon \r\nAbstraction means hiding implementation details and showing only the essential features of an \r\nobject.\\n\\nJava provides abstraction through abstract classes and interfaces.\\n\\nIn this program, Account is declared as an abstract class.\\n\\nIt contains an abstract method named \r\nwithdraw(double amount).\\n\\nThe parent class declares the method, but the actual withdrawal \r\nimplementation is provided by its child classes.\\n\\nTherefore, each account type can follow its own \r\nwithdrawal rules.','2026-11-10 04:22:53'),(13,2,8,9,9,10,100.00,100.00,100.00,100.00,'HIGH_SIMILARITY',40,'Department of computer science and engineering \r\n \r\nObject Oriented Programming II (Java) \r\nTopic: Design and Implementation of a Bank Management System Using Java  \r\nMd.Rokonuzzaman | CSE-19th | ID:06225105101036 \r\n \r\nTable of Contents \r\n1.\\n\\nImplementaƟon of OOP Concepts \r\no 4.1 EncapsulaƟon \r\no 4.2 AbstracƟon \r\no 4.3 Inheritance \r\no 4.4 Polymorphism \r\no 4.5 ExcepƟon Handling \r\n5.\\n\\nIntroducƟon \r\nObject-Oriented Programming (OOP) is a programming approach that organizes software around \r\nobjects and classes.\\n\\nJava is a popular object-oriented programming language that supports \r\nimportant concepts such as encapsulation, abstraction, inheritance, and polymorphism.\\n\\nThese \r\nconcepts help developers create reusable, secure, and maintainable applications.\\n\\nThis assignment presents the design and implementation of a simple Bank Management System \r\nusing Java.\\n\\nThe system manages two types of bank accounts: Savings Account and Current \r\nAccount.\\n\\nBoth accounts share common information, including account number and balance, but \r\nthey follow different withdrawal policies.\\n\\nThe system uses an abstract parent class named Account and two child classes named \r\nSavingsAccount and CurrentAccount.\\n\\nIt also implements method overloading, method overriding, \r\nruntime polymorphism, and custom exception handling.\\n\\nThe main purpose of this assignment is to \r\ndemonstrate how the fundamental concepts of Java OOP can be applied to a practical banking \r\napplication.\\n\\nObjecƟves of the Assignment \r\nThe main objecƟves of this assignment are: \r\n1.\\n\\nTo understand the fundamental concepts of Object-Oriented Programming in Java.\\n\\nTo implement encapsulaƟon using private data members and geƩer methods.\\n\\nTo understand abstracƟon through abstract classes and abstract methods.\\n\\nTo implement inheritance using parent and child classes.\\n\\nTo demonstrate polymorphism using method overloading and overriding.\\n\\nTo implement custom excepƟon handling using try, catch, and finally.\\n\\nTo develop a simple banking applicaƟon using Java.\\n\\nSystem Overview \r\nThe Bank Management System is designed to manage two different types of bank accounts.\\n\\nThe \r\nsystem contains one abstract parent class and two child classes.\\n\\nParent Class: Account \r\nThe Account class stores common account informaƟon, such as account number and balance.\\n\\nIt \r\nalso provides deposit methods and an abstract withdrawal method.\\n\\nChild Class 1: SavingsAccount \r\nThe SavingsAccount class inherits from Account.\\n\\nA customer \r\nmust maintain at least 500 in the account aŌer making a withdrawal.\\n\\nChild Class 2: CurrentAccount \r\nThe CurrentAccount class also inherits from Account.\\n\\nIt allows customers to withdraw more than \r\ntheir available balance within an overdraŌ limit of 1000.\\n\\nCustom ExcepƟon: InsufficientBalanceExcepƟon \r\nThis excepƟon is generated when a customer tries to withdraw an invalid amount or violates the \r\naccount\'s withdrawal rules.\\n\\nImplementaƟon of Object-Oriented Programming Concepts \r\n4.1 EncapsulaƟon \r\nEncapsulaƟon is the process of combining data and methods into a single class while restricƟng \r\ndirect access to the data.\\n\\nIn Java, encapsulaƟon is commonly implemented using private variables \r\nand public geƩer and seƩer methods.\\n\\nIn this program, the Account class contains two private variables: accountNumber and balance.\\n\\nThese variables cannot be accessed directly from outside the class.\\n\\nGeƩer methods are provided \r\nto retrieve their values.\\n\\nThis approach protects account informaƟon and prevents unwanted \r\ndirect access.\\n\\nCode Example: \r\n \r\n \r\n4.2 AbstracƟon \r\nAbstraction means hiding implementation details and showing only the essential features of an \r\nobject.\\n\\nJava provides abstraction through abstract classes and interfaces.\\n\\nIn this program, Account is declared as an abstract class.\\n\\nIt contains an abstract method named \r\nwithdraw(double amount).\\n\\nThe parent class declares the method, but the actual withdrawal \r\nimplementation is provided by its child classes.\\n\\nTherefore, each account type can follow its own \r\nwithdrawal rules.','2026-11-10 04:22:54'),(14,2,5,10,7,11,9.27,26.50,0.00,0.00,'LOW_SIMILARITY',0,'','2026-11-10 04:25:02'),(15,2,7,10,8,11,9.27,26.50,0.00,0.00,'LOW_SIMILARITY',0,'','2026-11-10 04:25:03'),(16,2,8,10,9,11,9.27,26.50,0.00,0.00,'LOW_SIMILARITY',0,'','2026-11-10 04:25:04'),(17,2,9,10,10,11,9.27,26.50,0.00,0.00,'LOW_SIMILARITY',0,'','2026-11-10 04:25:05');
/*!40000 ALTER TABLE `similarity_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_courses`
--

DROP TABLE IF EXISTS `student_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_courses` (
  `id` int NOT NULL,
  `student_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `enrolled_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Regular',
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_id` (`student_id`,`subject_id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `student_courses_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_courses_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_courses`
--

LOCK TABLES `student_courses` WRITE;
/*!40000 ALTER TABLE `student_courses` DISABLE KEYS */;
INSERT INTO `student_courses` VALUES (504,7,1,'Regular'),(505,7,2,'Regular'),(506,7,3,'Regular'),(507,7,4,'Regular'),(508,7,5,'Regular'),(509,7,6,'Regular'),(510,7,7,'Regular'),(511,7,8,'Regular'),(512,8,1,'Regular'),(513,8,2,'Regular'),(514,8,3,'Regular'),(515,8,4,'Regular'),(516,8,5,'Regular'),(517,8,6,'Regular'),(518,8,7,'Regular'),(519,8,8,'Regular'),(520,9,1,'Regular'),(521,9,2,'Regular'),(522,9,3,'Regular'),(523,9,4,'Regular'),(524,9,5,'Regular'),(525,9,6,'Regular'),(526,9,7,'Regular'),(527,9,8,'Regular'),(528,10,1,'Regular'),(529,10,2,'Regular'),(530,10,3,'Regular'),(531,10,4,'Regular'),(532,10,5,'Regular'),(533,10,6,'Regular'),(534,10,7,'Regular'),(535,10,8,'Regular'),(536,11,1,'Regular'),(537,11,2,'Regular'),(538,11,3,'Regular'),(539,11,4,'Regular'),(540,11,5,'Regular'),(541,11,6,'Regular'),(542,11,7,'Regular'),(543,11,8,'Regular'),(544,12,1,'Regular'),(545,12,2,'Regular'),(546,12,3,'Regular'),(547,12,4,'Regular'),(548,12,5,'Regular'),(549,12,6,'Regular'),(550,12,7,'Regular'),(551,12,8,'Regular'),(552,13,1,'Regular'),(553,13,2,'Regular'),(554,13,3,'Regular'),(555,13,4,'Regular'),(556,13,5,'Regular'),(557,13,6,'Regular'),(558,13,7,'Regular'),(559,13,8,'Regular'),(560,14,1,'Regular'),(561,14,2,'Regular'),(562,14,3,'Regular'),(563,14,4,'Regular'),(564,14,5,'Regular'),(565,14,6,'Regular'),(566,14,7,'Regular'),(567,14,8,'Regular'),(568,15,1,'Regular'),(569,15,2,'Regular'),(570,15,3,'Regular'),(571,15,4,'Regular'),(572,15,5,'Regular'),(573,15,6,'Regular'),(574,15,7,'Regular'),(575,15,8,'Regular'),(576,16,1,'Regular'),(577,16,2,'Regular'),(578,16,3,'Regular'),(579,16,4,'Regular'),(580,16,5,'Regular'),(581,16,6,'Regular'),(582,16,7,'Regular'),(583,16,8,'Regular'),(584,17,1,'Regular'),(585,17,2,'Regular'),(586,17,3,'Regular'),(587,17,4,'Regular'),(588,17,5,'Regular'),(589,17,6,'Regular'),(590,17,7,'Regular'),(591,17,8,'Regular'),(592,18,1,'Regular'),(593,18,2,'Regular'),(594,18,3,'Regular'),(595,18,4,'Regular'),(596,18,5,'Regular'),(597,18,6,'Regular'),(598,18,7,'Regular'),(599,18,8,'Regular'),(600,19,1,'Regular'),(601,19,2,'Regular'),(602,19,3,'Regular'),(603,19,4,'Regular'),(604,19,5,'Regular'),(605,19,6,'Regular'),(606,19,7,'Regular'),(607,19,8,'Regular'),(608,20,1,'Regular'),(609,20,2,'Regular'),(610,20,3,'Regular'),(611,20,4,'Regular'),(612,20,5,'Regular'),(613,20,6,'Regular'),(614,20,7,'Regular'),(615,20,8,'Regular'),(616,21,1,'Regular'),(617,21,2,'Regular'),(618,21,3,'Regular'),(619,21,4,'Regular'),(620,21,5,'Regular'),(621,21,6,'Regular'),(622,21,7,'Regular'),(623,21,8,'Regular'),(624,22,9,'Regular'),(625,22,10,'Regular'),(626,22,11,'Regular'),(627,22,12,'Regular'),(628,22,13,'Regular'),(629,22,14,'Regular'),(630,22,15,'Regular'),(631,22,16,'Regular'),(632,23,9,'Regular'),(633,23,10,'Regular'),(634,23,11,'Regular'),(635,23,12,'Regular'),(636,23,13,'Regular'),(637,23,14,'Regular'),(638,23,15,'Regular'),(639,23,16,'Regular'),(640,24,9,'Regular'),(641,24,10,'Regular'),(642,24,11,'Regular'),(643,24,12,'Regular'),(644,24,13,'Regular'),(645,24,14,'Regular'),(646,24,15,'Regular'),(647,24,16,'Regular'),(648,25,9,'Regular'),(649,25,10,'Regular'),(650,25,11,'Regular'),(651,25,12,'Regular'),(652,25,13,'Regular'),(653,25,14,'Regular'),(654,25,15,'Regular'),(655,25,16,'Regular'),(656,26,9,'Regular'),(657,26,10,'Regular'),(658,26,11,'Regular'),(659,26,12,'Regular'),(660,26,13,'Regular'),(661,26,14,'Regular'),(662,26,15,'Regular'),(663,26,16,'Regular'),(664,27,9,'Regular'),(665,27,10,'Regular'),(666,27,11,'Regular'),(667,27,12,'Regular'),(668,27,13,'Regular'),(669,27,14,'Regular'),(670,27,15,'Regular'),(671,27,16,'Regular'),(672,28,9,'Regular'),(673,28,10,'Regular'),(674,28,11,'Regular'),(675,28,12,'Regular'),(676,28,13,'Regular'),(677,28,14,'Regular'),(678,28,15,'Regular'),(679,28,16,'Regular'),(680,29,9,'Regular'),(681,29,10,'Regular'),(682,29,11,'Regular'),(683,29,12,'Regular'),(684,29,13,'Regular'),(685,29,14,'Regular'),(686,29,15,'Regular'),(687,29,16,'Regular'),(688,30,9,'Regular'),(689,30,10,'Regular'),(690,30,11,'Regular'),(691,30,12,'Regular'),(692,30,13,'Regular'),(693,30,14,'Regular'),(694,30,15,'Regular'),(695,30,16,'Regular'),(696,31,9,'Regular'),(697,31,10,'Regular'),(698,31,11,'Regular'),(699,31,12,'Regular'),(700,31,13,'Regular'),(701,31,14,'Regular'),(702,31,15,'Regular'),(703,31,16,'Regular'),(704,32,9,'Regular'),(705,32,10,'Regular'),(706,32,11,'Regular'),(707,32,12,'Regular'),(708,32,13,'Regular'),(709,32,14,'Regular'),(710,32,15,'Regular'),(711,32,16,'Regular'),(712,33,9,'Regular'),(713,33,10,'Regular'),(714,33,11,'Regular'),(715,33,12,'Regular'),(716,33,13,'Regular'),(717,33,14,'Regular'),(718,33,15,'Regular'),(719,33,16,'Regular'),(720,34,9,'Regular'),(721,34,10,'Regular'),(722,34,11,'Regular'),(723,34,12,'Regular'),(724,34,13,'Regular'),(725,34,14,'Regular'),(726,34,15,'Regular'),(727,34,16,'Regular'),(728,35,9,'Regular'),(729,35,10,'Regular'),(730,35,11,'Regular'),(731,35,12,'Regular'),(732,35,13,'Regular'),(733,35,14,'Regular'),(734,35,15,'Regular'),(735,35,16,'Regular'),(736,36,9,'Regular'),(737,36,10,'Regular'),(738,36,11,'Regular'),(739,36,12,'Regular'),(740,36,13,'Regular'),(741,36,14,'Regular'),(742,36,15,'Regular'),(743,36,16,'Regular');
/*!40000 ALTER TABLE `student_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjects` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `course_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `teacher_id` int DEFAULT NULL,
  `batch` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `subjects_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'Object Oriented Programming-II','CSE0613-2201',4,'19th'),(2,'Object Oriented Programming-II Lab','CSE0613-2202',4,'19th'),(3,'Design and Analysis of Algorithm','CSE0613-2203',4,'19th'),(4,'Design and Analysis of Algorithm Lab','CSE0613-2204',4,'19th'),(5,'Numerical Methods','CSE0613-2205',5,'19th'),(6,'Digital System Design','CSE0613-2206',5,'19th'),(7,'Digital System Design Lab','CSE0613-2207',5,'19th'),(8,'Probability and Statistics','CSE0613-2208',5,'19th'),(9,'Data Structure','CSE0613-2209',6,'20th'),(10,'Data Structure Lab','CSE0613-2210',6,'20th'),(11,'Physics','CSE0613-2211',6,'20th'),(12,'Physics Lab','CSE0613-2212',6,'20th'),(13,'Mathematics','CSE0613-2213',3,'20th'),(14,'Mathematics Lab','CSE0613-2214',3,'20th'),(15,'Digital Logic Design','CSE0613-2215',3,'18th'),(16,'Digital Logic Design Lab','CSE0613-2216',3,'18th');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` enum('STUDENT','TEACHER') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `department` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `batch` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'T001','Karim Ahmed','123456','TEACHER','Computer Science and Engineering',NULL,'2026-10-02 14:44:49'),(4,'T002','Sabbir Hossain','123456','TEACHER','Computer Science and Engineering',NULL,'2026-10-02 14:44:49'),(5,'T003','Nusrat Jahan','123456','TEACHER','Computer Science and Engineering',NULL,'2026-10-02 14:44:49'),(6,'T004','Mahmudul Hasan','123456','TEACHER','Computer Science and Engineering',NULL,'2026-10-02 14:44:49'),(7,'CSE001','Rahim Ahmed','123456','STUDENT','Computer Science and Engineering','19th','2026-10-02 14:44:49'),(8,'CSE002','Sakib Hasan','123456','STUDENT','Computer Science and Engineering','19th','2026-10-02 14:44:49'),(9,'CSE003','Tanvir Hossain','123456','STUDENT','Computer Science and Engineering','19th','2026-10-02 14:44:49'),(10,'CSE004','Nayeem Islam','123456','STUDENT','Computer Science and Engineering','19th','2026-10-02 14:44:49'),(11,'CSE005','Fahim Rahman','123456','STUDENT','Computer Science and Engineering','19th','2026-10-02 14:44:49'),(12,'CSE006','Mehedi Hasan','123456','STUDENT','Computer Science and Engineering','19th','2026-10-02 14:44:49'),(13,'CSE007','Arif Hossain','123456','STUDENT','Computer Science and Engineering','19th','2026-10-02 14:44:49'),(14,'CSE008','Shakil Ahmed','123456','STUDENT','Computer Science and Engineering','19th','2026-10-02 14:44:49'),(15,'CSE009','Rifat Karim','123456','STUDENT','Computer Science and Engineering','19th','2026-10-02 14:44:49'),(16,'CSE010','Imran Hossain','123456','STUDENT','Computer Science and Engineering','19th','2026-10-02 14:44:49'),(17,'CSE011','Hasan Mahmud','123456','STUDENT','Computer Science and Engineering','19th','2026-10-02 14:44:49'),(18,'CSE012','Siam Ahmed','123456','STUDENT','Computer Science and Engineering','19th','2026-10-02 14:44:49'),(19,'CSE013','Adnan Kabir','123456','STUDENT','Computer Science and Engineering','19th','2026-10-02 14:44:49'),(20,'CSE014','Shuvo Islam','123456','STUDENT','Computer Science and Engineering','19th','2026-10-02 14:44:49'),(21,'CSE015','Rakib Hasan','123456','STUDENT','Computer Science and Engineering','19th','2026-10-02 14:44:49'),(22,'CSE016','Arafat Hossain','123456','STUDENT','Computer Science and Engineering','20th','2026-10-02 14:44:49'),(23,'CSE017','Sohan Ahmed','123456','STUDENT','Computer Science and Engineering','20th','2026-10-02 14:44:49'),(24,'CSE018','Tamim Iqbal','123456','STUDENT','Computer Science and Engineering','20th','2026-10-02 14:44:49'),(25,'CSE019','Jahid Hasan','123456','STUDENT','Computer Science and Engineering','20th','2026-10-02 14:44:49'),(26,'CSE020','Rony Islam','123456','STUDENT','Computer Science and Engineering','20th','2026-10-02 14:44:49'),(27,'CSE021','Mushfiq Rahman','123456','STUDENT','Computer Science and Engineering','20th','2026-10-02 14:44:49'),(28,'CSE022','Nafis Ahmed','123456','STUDENT','Computer Science and Engineering','20th','2026-10-02 14:44:49'),(29,'CSE023','Shafin Hossain','123456','STUDENT','Computer Science and Engineering','20th','2026-10-02 14:44:49'),(30,'CSE024','Tahmid Hasan','123456','STUDENT','Computer Science and Engineering','20th','2026-10-02 14:44:49'),(31,'CSE025','Rahat Islam','123456','STUDENT','Computer Science and Engineering','20th','2026-10-02 14:44:49'),(32,'CSE026','Fardin Ahmed','123456','STUDENT','Computer Science and Engineering','20th','2026-10-02 14:44:49'),(33,'CSE027','Anik Hasan','123456','STUDENT','Computer Science and Engineering','20th','2026-10-02 14:44:49'),(34,'CSE028','Sajid Hossain','123456','STUDENT','Computer Science and Engineering','20th','2026-10-02 14:44:49'),(35,'CSE029','Mahin Islam','123456','STUDENT','Computer Science and Engineering','20th','2026-10-02 14:44:49'),(36,'CSE030','Foysal Ahmed','123456','STUDENT','Computer Science and Engineering','20th','2026-10-02 14:44:49');
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

-- Dump completed on 2026-11-11 21:34:15
