CREATE DATABASE  IF NOT EXISTS `sql_lab4` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sql_lab4`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sql_lab4
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `advisor`
--

DROP TABLE IF EXISTS `advisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advisor` (
  `s_ID` varchar(5) NOT NULL,
  `i_ID` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`s_ID`),
  KEY `i_ID` (`i_ID`),
  CONSTRAINT `advisor_ibfk_1` FOREIGN KEY (`i_ID`) REFERENCES `instructor` (`ID`) ON DELETE SET NULL,
  CONSTRAINT `advisor_ibfk_2` FOREIGN KEY (`s_ID`) REFERENCES `student` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advisor`
--

LOCK TABLES `advisor` WRITE;
/*!40000 ALTER TABLE `advisor` DISABLE KEYS */;
INSERT INTO `advisor` (`s_ID`, `i_ID`) VALUES ('12345','10101'),('44553','22222'),('45678','22222'),('00128','45565'),('76543','45565'),('23121','76543'),('98988','76766'),('76653','98345'),('98765','98345');
/*!40000 ALTER TABLE `advisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classroom`
--

DROP TABLE IF EXISTS `classroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classroom` (
  `building` varchar(15) NOT NULL,
  `room_number` varchar(7) NOT NULL,
  `capacity` decimal(4,0) DEFAULT NULL,
  PRIMARY KEY (`building`,`room_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classroom`
--

LOCK TABLES `classroom` WRITE;
/*!40000 ALTER TABLE `classroom` DISABLE KEYS */;
INSERT INTO `classroom` (`building`, `room_number`, `capacity`) VALUES ('Packard','101',500),('Painter','514',10),('Taylor','3128',70),('Watson','100',30),('Watson','120',50);
/*!40000 ALTER TABLE `classroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_id` varchar(8) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `dept_name` varchar(20) DEFAULT NULL,
  `credits` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  KEY `dept_name` (`dept_name`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`) ON DELETE SET NULL,
  CONSTRAINT `course_chk_1` CHECK ((`credits` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` (`course_id`, `title`, `dept_name`, `credits`) VALUES ('BIO-101','Intro. to Biology','Biology',4),('BIO-301','Genetics','Biology',4),('BIO-399','Computational Biology','Biology',3),('CS-101','Intro. to Computer Science','Comp. Sci.',4),('CS-190','Game Design','Comp. Sci.',4),('CS-315','Robotics','Comp. Sci.',3),('CS-319','Image Processing','Comp. Sci.',3),('CS-347','Database System Concepts','Comp. Sci.',3),('EE-181','Intro. to Digital Systems','Elec. Eng.',3),('FIN-201','Investment Banking','Finance',3),('HIS-351','World History','History',3),('MU-199','Music Video Production','Music',3),('PHY-101','Physical Principles','Physics',4);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `dept_name` varchar(20) NOT NULL,
  `building` varchar(15) DEFAULT NULL,
  `budget` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`dept_name`),
  KEY `building_index` (`building`),
  CONSTRAINT `department_chk_1` CHECK ((`budget` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` (`dept_name`, `building`, `budget`) VALUES ('Biology','Watson',90000.00),('Comp. Sci.','Sumanadasa',100000.00),('Elec. Eng.','Taylor',85000.00),('Finance','Painter',120000.00),('History','Painter',50000.00),('Music','Packard',80000.00),('Physics','Watson',70000.00);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `department_loc`
--

DROP TABLE IF EXISTS `department_loc`;
/*!50001 DROP VIEW IF EXISTS `department_loc`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `department_loc` AS SELECT 
 1 AS `dept_name`,
 1 AS `building`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor` (
  `ID` varchar(5) NOT NULL,
  `name` varchar(20) NOT NULL,
  `dept_name` varchar(20) DEFAULT NULL,
  `salary` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `dept_name` (`dept_name`),
  CONSTRAINT `instructor_ibfk_1` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`) ON DELETE SET NULL,
  CONSTRAINT `instructor_chk_1` CHECK ((`salary` > 29000))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` (`ID`, `name`, `dept_name`, `salary`) VALUES ('10101','Srinivasan','Comp. Sci.',65000.00),('12121','Wu','Finance',90000.00),('15151','Mozart','Music',40000.00),('22222','Einstein','Physics',95000.00),('32343','El Said','History',60000.00),('33456','Gold','Physics',87000.00),('45565','Katz','Comp. Sci.',75000.00),('58583','Califieri','History',62000.00),('76543','Singh','Finance',80000.00),('76766','Crick','Biology',72000.00),('83821','Brandt','Comp. Sci.',92000.00),('98345','Kim','Elec. Eng.',80000.00);
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `instructor_info`
--

DROP TABLE IF EXISTS `instructor_info`;
/*!50001 DROP VIEW IF EXISTS `instructor_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `instructor_info` AS SELECT 
 1 AS `name`,
 1 AS `salary`,
 1 AS `building`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `prereq`
--

DROP TABLE IF EXISTS `prereq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prereq` (
  `course_id` varchar(8) NOT NULL,
  `prereq_id` varchar(8) NOT NULL,
  PRIMARY KEY (`course_id`,`prereq_id`),
  KEY `prereq_id` (`prereq_id`),
  CONSTRAINT `prereq_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE,
  CONSTRAINT `prereq_ibfk_2` FOREIGN KEY (`prereq_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prereq`
--

LOCK TABLES `prereq` WRITE;
/*!40000 ALTER TABLE `prereq` DISABLE KEYS */;
INSERT INTO `prereq` (`course_id`, `prereq_id`) VALUES ('BIO-301','BIO-101'),('BIO-399','BIO-101'),('CS-190','CS-101'),('CS-315','CS-101'),('CS-319','CS-101'),('CS-347','CS-101'),('EE-181','PHY-101');
/*!40000 ALTER TABLE `prereq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scholarship`
--

DROP TABLE IF EXISTS `scholarship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scholarship` (
  `school_id` varchar(5) NOT NULL,
  `student_id` varchar(5) DEFAULT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`school_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `scholarship_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scholarship`
--

LOCK TABLES `scholarship` WRITE;
/*!40000 ALTER TABLE `scholarship` DISABLE KEYS */;
INSERT INTO `scholarship` (`school_id`, `student_id`, `amount`) VALUES ('00001','00128',40000.00);
/*!40000 ALTER TABLE `scholarship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section` (
  `course_id` varchar(8) NOT NULL,
  `sec_id` varchar(8) NOT NULL,
  `semester` varchar(6) NOT NULL,
  `year` decimal(4,0) NOT NULL,
  `building` varchar(15) DEFAULT NULL,
  `room_number` varchar(7) DEFAULT NULL,
  `time_slot_id` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`course_id`,`sec_id`,`semester`,`year`),
  KEY `building` (`building`,`room_number`),
  CONSTRAINT `section_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE,
  CONSTRAINT `section_ibfk_2` FOREIGN KEY (`building`, `room_number`) REFERENCES `classroom` (`building`, `room_number`) ON DELETE SET NULL,
  CONSTRAINT `section_chk_1` CHECK ((`semester` in (_utf8mb4'Fall',_utf8mb4'Winter',_utf8mb4'Spring',_utf8mb4'Summer'))),
  CONSTRAINT `section_chk_2` CHECK (((`year` > 1701) and (`year` < 2100)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` (`course_id`, `sec_id`, `semester`, `year`, `building`, `room_number`, `time_slot_id`) VALUES ('BIO-101','1','Summer',2009,'Painter','514','B'),('BIO-301','1','Summer',2010,'Painter','514','A'),('CS-101','1','Fall',2009,'Packard','101','H'),('CS-101','1','Spring',2010,'Packard','101','F'),('CS-190','1','Spring',2009,'Taylor','3128','E'),('CS-190','2','Spring',2009,'Taylor','3128','A'),('CS-315','1','Spring',2010,'Watson','120','D'),('CS-319','1','Spring',2010,'Watson','100','B'),('CS-319','2','Spring',2010,'Taylor','3128','C'),('CS-347','1','Fall',2009,'Taylor','3128','A'),('EE-181','1','Spring',2009,'Taylor','3128','C'),('FIN-201','1','Spring',2010,'Packard','101','B'),('HIS-351','1','Spring',2010,'Painter','514','C'),('MU-199','1','Spring',2010,'Packard','101','D'),('PHY-101','1','Fall',2009,'Watson','100','A');
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `ID` varchar(5) NOT NULL,
  `name` varchar(20) NOT NULL,
  `dept_name` varchar(20) DEFAULT NULL,
  `tot_cred` decimal(3,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `dept_name` (`dept_name`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`dept_name`) REFERENCES `department` (`dept_name`) ON DELETE SET NULL,
  CONSTRAINT `student_chk_1` CHECK ((`tot_cred` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`ID`, `name`, `dept_name`, `tot_cred`) VALUES ('00128','Zhang','Comp. Sci.',102),('12345','Shankar','Comp. Sci.',32),('19991','Brandt','History',80),('23121','Chavez','Finance',110),('44553','Peltier','Physics',56),('45678','Levy','Physics',46),('54321','Williams','Comp. Sci.',54),('55739','Sanchez','Music',38),('70557','Snow','Physics',0),('76543','Brown','Comp. Sci.',58),('76653','Aoi','Elec. Eng.',60),('98765','Bourikas','Elec. Eng.',98),('98988','Tanaka','Biology',120);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `student_grades`
--

DROP TABLE IF EXISTS `student_grades`;
/*!50001 DROP VIEW IF EXISTS `student_grades`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `student_grades` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `course_id`,
 1 AS `grade`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `takes`
--

DROP TABLE IF EXISTS `takes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `takes` (
  `ID` varchar(5) NOT NULL,
  `course_id` varchar(8) NOT NULL,
  `sec_id` varchar(8) NOT NULL,
  `semester` varchar(6) NOT NULL,
  `year` decimal(4,0) NOT NULL,
  `grade` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`ID`,`course_id`,`sec_id`,`semester`,`year`),
  KEY `course_id` (`course_id`,`sec_id`,`semester`,`year`),
  KEY `grade_index` (`grade`),
  CONSTRAINT `takes_ibfk_1` FOREIGN KEY (`course_id`, `sec_id`, `semester`, `year`) REFERENCES `section` (`course_id`, `sec_id`, `semester`, `year`) ON DELETE CASCADE,
  CONSTRAINT `takes_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `student` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `takes`
--

LOCK TABLES `takes` WRITE;
/*!40000 ALTER TABLE `takes` DISABLE KEYS */;
INSERT INTO `takes` (`ID`, `course_id`, `sec_id`, `semester`, `year`, `grade`) VALUES ('98988','BIO-301','1','Summer',2010,NULL),('00128','CS-101','1','Fall',2009,'A'),('12345','CS-190','2','Spring',2009,'A'),('12345','CS-315','1','Spring',2010,'A'),('12345','CS-347','1','Fall',2009,'A'),('76543','CS-101','1','Fall',2009,'A'),('76543','CS-319','2','Spring',2010,'A'),('98988','BIO-101','1','Summer',2009,'A'),('00128','CS-347','1','Fall',2009,'A-'),('54321','CS-101','1','Fall',2009,'A-'),('55739','MU-199','1','Spring',2010,'A-'),('19991','HIS-351','1','Spring',2010,'B'),('45678','CS-319','1','Spring',2010,'B'),('98765','CS-315','1','Spring',2010,'B'),('44553','PHY-101','1','Fall',2009,'B-'),('45678','CS-101','1','Spring',2010,'B+'),('54321','CS-190','2','Spring',2009,'B+'),('12345','CS-101','1','Fall',2009,'C'),('76653','EE-181','1','Spring',2009,'C'),('98765','CS-101','1','Fall',2009,'C-'),('23121','FIN-201','1','Spring',2010,'C+'),('45678','CS-101','1','Fall',2009,'F');
/*!40000 ALTER TABLE `takes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teaches`
--

DROP TABLE IF EXISTS `teaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teaches` (
  `ID` varchar(5) NOT NULL,
  `course_id` varchar(8) NOT NULL,
  `sec_id` varchar(8) NOT NULL,
  `semester` varchar(6) NOT NULL,
  `year` decimal(4,0) NOT NULL,
  PRIMARY KEY (`ID`,`course_id`,`sec_id`,`semester`,`year`),
  KEY `course_id` (`course_id`,`sec_id`,`semester`,`year`),
  CONSTRAINT `teaches_ibfk_1` FOREIGN KEY (`course_id`, `sec_id`, `semester`, `year`) REFERENCES `section` (`course_id`, `sec_id`, `semester`, `year`) ON DELETE CASCADE,
  CONSTRAINT `teaches_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `instructor` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teaches`
--

LOCK TABLES `teaches` WRITE;
/*!40000 ALTER TABLE `teaches` DISABLE KEYS */;
INSERT INTO `teaches` (`ID`, `course_id`, `sec_id`, `semester`, `year`) VALUES ('76766','BIO-101','1','Summer',2009),('76766','BIO-301','1','Summer',2010),('10101','CS-101','1','Fall',2009),('45565','CS-101','1','Spring',2010),('83821','CS-190','1','Spring',2009),('83821','CS-190','2','Spring',2009),('10101','CS-315','1','Spring',2010),('45565','CS-319','1','Spring',2010),('83821','CS-319','2','Spring',2010),('10101','CS-347','1','Fall',2009),('98345','EE-181','1','Spring',2009),('12121','FIN-201','1','Spring',2010),('32343','HIS-351','1','Spring',2010),('15151','MU-199','1','Spring',2010),('22222','PHY-101','1','Fall',2009);
/*!40000 ALTER TABLE `teaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_slot`
--

DROP TABLE IF EXISTS `time_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_slot` (
  `time_slot_id` varchar(4) NOT NULL,
  `day` varchar(1) NOT NULL,
  `start_hr` decimal(2,0) NOT NULL,
  `start_min` decimal(2,0) NOT NULL,
  `end_hr` decimal(2,0) DEFAULT NULL,
  `end_min` decimal(2,0) DEFAULT NULL,
  PRIMARY KEY (`time_slot_id`,`day`,`start_hr`,`start_min`),
  CONSTRAINT `time_slot_chk_1` CHECK (((`start_hr` >= 0) and (`start_hr` < 24))),
  CONSTRAINT `time_slot_chk_2` CHECK (((`start_min` >= 0) and (`start_min` < 60))),
  CONSTRAINT `time_slot_chk_3` CHECK (((`end_hr` >= 0) and (`end_hr` < 24))),
  CONSTRAINT `time_slot_chk_4` CHECK (((`end_min` >= 0) and (`end_min` < 60)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_slot`
--

LOCK TABLES `time_slot` WRITE;
/*!40000 ALTER TABLE `time_slot` DISABLE KEYS */;
INSERT INTO `time_slot` (`time_slot_id`, `day`, `start_hr`, `start_min`, `end_hr`, `end_min`) VALUES ('A','F',8,0,8,50),('A','M',8,0,8,50),('A','W',8,0,8,50),('B','F',9,0,9,50),('B','M',9,0,9,50),('B','W',9,0,9,50),('C','F',11,0,11,50),('C','M',11,0,11,50),('C','W',11,0,11,50),('D','F',13,0,13,50),('D','M',13,0,13,50),('D','W',13,0,13,50),('E','R',10,30,11,45),('E','T',10,30,11,45),('F','R',14,30,15,45),('F','T',14,30,15,45),('G','F',16,0,16,50),('G','M',16,0,16,50),('G','W',16,0,16,50),('H','W',10,0,12,30);
/*!40000 ALTER TABLE `time_slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `department_loc`
--

/*!50001 DROP VIEW IF EXISTS `department_loc`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sqluser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `department_loc` AS select `department`.`dept_name` AS `dept_name`,`department`.`building` AS `building` from `department` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `instructor_info`
--

/*!50001 DROP VIEW IF EXISTS `instructor_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sqluser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `instructor_info` AS select `instructor`.`name` AS `name`,`instructor`.`salary` AS `salary`,`department_loc`.`building` AS `building` from (`instructor` left join `department_loc` on((`instructor`.`dept_name` = `department_loc`.`dept_name`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `student_grades`
--

/*!50001 DROP VIEW IF EXISTS `student_grades`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sqluser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `student_grades` AS select `student`.`ID` AS `id`,`student`.`name` AS `name`,`takes`.`course_id` AS `course_id`,`takes`.`grade` AS `grade` from (`student` left join `takes` on((`student`.`ID` = `takes`.`ID`))) */;
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

-- Dump completed on 2022-03-26 16:42:42
