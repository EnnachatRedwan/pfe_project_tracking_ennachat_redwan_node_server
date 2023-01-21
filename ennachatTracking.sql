-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: projectstracking
-- ------------------------------------------------------
-- Server version	8.0.30

use sql12592225;



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
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `username` varchar(30) NOT NULL,
  `fullname` varchar(30) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `empKey` varchar(5) DEFAULT NULL,
  `isActivated` tinyint(1) DEFAULT '0',
  `leader` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('admin','ennachat redwan','admin','hd4sw',1,''),('ayoubNCH','Ennachat Ayoub','ayoub123','04763',1,'radwanNCH'),('MohammedNCH','Ennachat Mohammed','123123','69e3d',1,'radwanNCH'),('radwanNCH','ennachat redwan','radwan456','hd4sw',1,''),('someOne','someone tese','123123','deffb',1,'admin'),('test1','Test User','123123','f9c23',0,'radwanNCH');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emptask`
--

DROP TABLE IF EXISTS `emptask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emptask` (
  `username` varchar(30) NOT NULL,
  `id_task` int NOT NULL,
  PRIMARY KEY (`username`,`id_task`),
  KEY `id_task` (`id_task`),
  CONSTRAINT `emptask_ibfk_1` FOREIGN KEY (`username`) REFERENCES `employee` (`username`) ON DELETE CASCADE,
  CONSTRAINT `emptask_ibfk_2` FOREIGN KEY (`id_task`) REFERENCES `task` (`id_task`) ON DELETE CASCADE
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emptask`
--

LOCK TABLES `emptask` WRITE;
/*!40000 ALTER TABLE `emptask` DISABLE KEYS */;
INSERT INTO `emptask` VALUES ('test1',32),('ayoubNCH',33),('ayoubNCH',40),('ayoubNCH',42);
/*!40000 ALTER TABLE `emptask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `id_prj` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  `addingDate` date DEFAULT NULL,
  `startingDate` date DEFAULT NULL,
  `endingDate` date DEFAULT NULL,
  `isStarted` tinyint(1) DEFAULT '0',
  `leader` varchar(30) NOT NULL,
  `state` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_prj`),
  KEY `leader` (`leader`),
  KEY `state` (`state`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`leader`) REFERENCES `employee` (`username`) ON DELETE CASCADE,
  CONSTRAINT `project_ibfk_2` FOREIGN KEY (`state`) REFERENCES `state` (`id_state`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (3,'test2','test1','2021-02-01',NULL,NULL,0,'admin',1),(21,'Tracking app','Web','2022-09-03','2022-09-03',NULL,1,'radwanNCH',1),(26,'ToDo List','Mobile','2022-09-20','2022-10-04',NULL,1,'radwanNCH',2),(39,'Employees manager app','Desktop','2022-10-10','2022-10-10',NULL,1,'radwanNCH',1),(40,'Special chatting','Mobile','2022-10-10',NULL,NULL,0,'radwanNCH',1),(54,'test','web','2022-10-11','2022-10-11',NULL,1,'radwanNCH',1),(55,'dgajkfhksadfj','WEB','2022-10-19',NULL,NULL,0,'radwanNCH',1);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectarchive`
--

DROP TABLE IF EXISTS `projectarchive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectarchive` (
  `username` varchar(30) NOT NULL,
  `id_prj` int NOT NULL,
  PRIMARY KEY (`username`,`id_prj`),
  KEY `id_prj` (`id_prj`),
  CONSTRAINT `projectarchive_ibfk_1` FOREIGN KEY (`username`) REFERENCES `employee` (`username`) ON DELETE CASCADE,
  CONSTRAINT `projectarchive_ibfk_2` FOREIGN KEY (`id_prj`) REFERENCES `project` (`id_prj`) ON DELETE CASCADE
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectarchive`
--

LOCK TABLES `projectarchive` WRITE;
/*!40000 ALTER TABLE `projectarchive` DISABLE KEYS */;
INSERT INTO `projectarchive` VALUES ('ayoubNCH',21);
/*!40000 ALTER TABLE `projectarchive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
  `id_state` int NOT NULL,
  `label` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_state`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,'قيد الإنجاز'),(2,'منجز');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `step`
--

DROP TABLE IF EXISTS `step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `step` (
  `id_step` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `isDone` tinyint(1) DEFAULT '0',
  `id_task` int NOT NULL,
  PRIMARY KEY (`id_step`),
  KEY `id_task` (`id_task`),
  CONSTRAINT `step_ibfk_1` FOREIGN KEY (`id_task`) REFERENCES `task` (`id_task`) ON DELETE CASCADE
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `step`
--

LOCK TABLES `step` WRITE;
/*!40000 ALTER TABLE `step` DISABLE KEYS */;
INSERT INTO `step` VALUES (1,'creating home page','creating modern home page from the website',1,32),(2,'creating login screen','should contain username and password fields',0,32),(8,'test','test',1,33),(25,'creating tables','decs',0,40),(26,'test','g',1,42),(27,'ksadjfs','s;adfjsldf',0,32),(28,'fsalkfsdafl;sdf','sfans;ldkfjlksjdf',0,32),(29,'fhl','vljhdsfkx',0,32);
/*!40000 ALTER TABLE `step` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `id_task` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `addingDate` date DEFAULT NULL,
  `startingDate` date DEFAULT NULL,
  `endingDate` date DEFAULT NULL,
  `isStarted` tinyint(1) DEFAULT '0',
  `project_id` int NOT NULL,
  `state` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_task`),
  KEY `project_id` (`project_id`),
  KEY `state` (`state`),
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id_prj`) ON DELETE CASCADE,
  CONSTRAINT `task_ibfk_2` FOREIGN KEY (`state`) REFERENCES `state` (`id_state`)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (32,'Front-end','2022-09-03','2022-09-03',NULL,1,21,1),(33,'back-end','2022-09-03','2022-09-03',NULL,1,21,2),(40,'database','2022-09-14','2022-09-14',NULL,1,21,1),(42,'test','2022-09-20','2022-10-10',NULL,1,26,2),(48,'Dev Ops','2022-10-10',NULL,NULL,0,21,1),(49,'Cloud','2022-10-10','2022-10-10',NULL,1,21,1);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taskarchive`
--

DROP TABLE IF EXISTS `taskarchive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taskarchive` (
  `username` varchar(30) NOT NULL,
  `id_task` int NOT NULL,
  PRIMARY KEY (`username`,`id_task`),
  KEY `id_task` (`id_task`),
  CONSTRAINT `taskarchive_ibfk_1` FOREIGN KEY (`username`) REFERENCES `employee` (`username`) ON DELETE CASCADE,
  CONSTRAINT `taskarchive_ibfk_2` FOREIGN KEY (`id_task`) REFERENCES `task` (`id_task`) ON DELETE CASCADE
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taskarchive`
--

LOCK TABLES `taskarchive` WRITE;
/*!40000 ALTER TABLE `taskarchive` DISABLE KEYS */;
INSERT INTO `taskarchive` VALUES ('ayoubNCH',33),('ayoubNCH',40),('radwanNCH',49);
/*!40000 ALTER TABLE `taskarchive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'projectstracking'
--

--
-- Dumping routines for database 'projectstracking'
--
/*!50003 DROP FUNCTION IF EXISTS `getProjectPercentage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  FUNCTION `getProjectPercentage`(id_prj int) RETURNS double
    DETERMINISTIC
begin
	declare completedTasks int default 0;
    declare totalTasks int default 0;
    select count(*) into completedTasks from task where project_id=id_prj and state=2;
    select count(*) into totalTasks from task where project_id=id_prj;
    if (totalTasks = 0)
    then 
		return 0;
    else
		return completedTasks/totalTasks;
    end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getTaskPercentage` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  FUNCTION `getTaskPercentage`(taskId int) RETURNS double
    DETERMINISTIC
begin
	declare checkedSteps int default 0;
    declare totalSteps int default 0;
    select count(*) into checkedSteps from step where id_task=taskId and isDone=true;
    select count(*) into totalSteps from step where id_task=taskId;
    if (totalSteps = 0)
    then 
		return 0;
    else
		return checkedSteps/totalSteps;
    end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `activateUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `activateUser`(usname varchar(50),pass varchar(20),eKey varchar(5))
begin
		call checkActivation(usname,@isActivated);
        if @isActivated = 0 and length(eKey) = 5 and (select empKey from Employee where username=usname) = eKey then
			update Employee set password=pass,isActivated=true where username=usname;
            select 1 as 'activated';
		else
            select 0 as 'activated';
		end if;
    end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addStep` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `addStep`(usname varchar(30),taskId int,title varchar(50),descr varchar(1000))
begin
	if exists (select * from project where leader=usname and id_prj in (select project_id from task where id_task=taskId))
    then
		insert into step (id_task,title,description) values(taskId,title,descr);
        call refreshTaskState(taskId);
        select max(id_step) as 'id' from step where id_task = taskId;
    end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `affectTaskToEmployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `affectTaskToEmployee`(usname varchar(30),taskId int,empusname varchar(30))
begin
	if exists (select * from Employee where username=empusname and leader = usname)
    and exists (select * from task where project_id in (select id_prj from project where leader=usname))
    then
		insert into empTask values(empusname,taskId);
    end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `archiveProject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `archiveProject`(usname varchar(30),project_id int)
begin
	if exists (select * from project where id_prj=project_id and leader=usname) or exists (select * from project where id_prj in (select project_id from task where id_task in (select id_task from empTask where username=usname)))
    then
		insert into projectArchive values(usname,project_id);
    end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `archiveTask` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `archiveTask`(usname varchar(30),taskId int)
begin

	if exists (select * from task where id_task = taskId and project_id in (select id_prj from project where leader=usname))
    or exists (select * from empTask where username=usname and id_task=taskId)
    then insert into taskArchive values (usname,taskId);
    end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `checkActivation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `checkActivation`(usname varchar(50),out state int)
begin
	select isActivated into state from Employee where username = usname;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `checkStep` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `checkStep`(usname varchar(30),stepId int)
begin
	declare taskId int default 0;
	if exists (select * from step where id_step=stepId and id_task in (select id_task from empTask where username=usname))
    or exists (select * from step where id_step=stepId and id_task in(select id_task from task where project_id in (select id_prj from project where leader=usname)))
    then
		update step set isDone = true where id_step=stepId;
        select id_task into taskId from step where id_step=stepId;
        call refreshTaskState(taskId);
    end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteStep` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `deleteStep`(usname varchar(30),stepId int)
begin
	declare taskId int default 0;
	if exists (select * from step where id_step=stepId and id_task in (select id_task from task where project_id in (select id_prj from project where leader=usname)))
    then
		select id_task into taskId from step where id_step=stepId;
		delete from step where id_step =stepId;
        call refreshTaskState(taskId);
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteTask` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `deleteTask`(usnmae varchar(30),taskId int)
begin
	declare projectId int default 0;
	if exists (select * from task where id_task = taskId and project_id in (select id_prj from project where leader = usnmae))
    then
		select project_id into projectId from task where id_task=taskId;
		delete from task where id_task=taskId;
        call refreshProjectState(projectId);
    end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `editProject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `editProject`(projectId int,Ptitle varchar(50),PaddingDate date,Ptype varchar(50),Pleader varchar(30))
begin
	if exists (select * from project where id_prj = projectId and leader = Pleader)
    then
		update project set title = Ptitle , addingDate=PaddingDate,type=Ptype where id_prj=projectId;
    end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `editTask` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `editTask`(taskId int,Ttitle varchar(50),TaddingDate date,Tleader varchar(30))
begin
	if exists (select * from task where id_task = taskId and project_id in (select id_prj from project where leader = Tleader))
    then
		update task set title=Ttitle,addingDate=TaddingDate where id_task=taskId;
    end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getProjects` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `getProjects`(usname varchar(30))
begin
    if (select leader from employee where username = usname) =''
    then
		select *,getProjectPercentage(id_prj) as 'percentage',0 as 'archived' from project where leader=usname and id_prj not in(select id_prj from projectArchive where username=leader)
        union select *,getProjectPercentage(id_prj) as 'percentage',1 as 'archived' from project where leader=usname and id_prj in (select id_prj from projectArchive where username=leader);
	else
		select *,getProjectPercentage(id_prj) as 'percentage',0 as 'archived' from project where id_prj in(select project_id from task where id_task in (select id_task from empTask where username = usname))
        and id_prj not in(select id_prj from projectArchive where username=leader)
        union
        select *,getProjectPercentage(id_prj) as 'percentage',1 as 'archived' from project where id_prj in(select project_id from task where id_task in (select id_task from empTask where username = usname))
        and id_prj in(select id_prj from projectArchive where username=leader);
    end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getProjectTasks` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `getProjectTasks`(usname varchar(30),id int)
begin
	if (select leader from employee where username = usname) =''
    then
		select *,getTaskPercentage(id_task) as 'percentage',0 as 'archived' from task where  project_id in (select id_prj from project where id_prj=id and leader= usname)
        and id_task not in (select id_task from taskArchive where username = usname)
        union
        select *,getTaskPercentage(id_task) as 'percentage',1 as 'archived' from task where  project_id in (select id_prj from project where id_prj=id and leader= usname)
        and id_task in (select id_task from taskArchive where username = usname);
	else
		select *,getTaskPercentage(id_task) as 'percentage',0 as 'archived' from task where project_id = id and id_task in (select id_task from empTask where username = usname)
        and id_task not in (select id_task from taskArchive where username = usname)
        union
        select *,getTaskPercentage(id_task) as 'percentage',1 as 'archived' from task where project_id = id and id_task in (select id_task from empTask where username = usname)
        and id_task in (select id_task from taskArchive where username = usname);
    end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getSteps` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `getSteps`(usname varchar(30),taskId int)
begin
	if exists (select * from empTask where username=usname and id_task=taskId)
    or exists (select * from project where leader=usname and id_prj in (select project_id from task where id_task=taskId))
    then
		select * from step where id_task=taskId;
    end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertProject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `insertProject`(Ptitle varchar(50),Ptype varchar(50),PaddingDate date,Pleader varchar(30))
begin
	declare id int default 0;
	insert into project (title,type,addingDate,leader) values (Ptitle,Ptype,PaddingDate,Pleader);
    select max(id_prj) as 'id' from project where leader = Pleader;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertTask` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `insertTask`(Ttitle varchar(50),TaddingDate date,TidProject varchar(30),Tleader varchar(30))
begin
	if exists (select * from project where id_prj=TidProject and leader = Tleader)
    then
		insert into task (title,addingDate,project_id) values (Ttitle,TaddingDate,TidProject);
        call refreshProjectState(TidProject);
		select max(id_task) as 'id' from task where project_id = TidProject;
    end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `login`(usname varchar(50),pass varchar(20))
begin
	call checkActivation(usname,@isActivated);
	if @isActivated=0 then
		select 0 as 'state' from dual;
	else
		select * from Employee where username=usname and password=pass;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `refreshProjectState` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `refreshProjectState`(projectId int)
begin
	if(getProjectPercentage(projectId)=1)
    then
		update project set state=2 where id_prj=projectId;
	else
		update project set state=1 where id_prj=projectId;
    end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `refreshTaskState` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `refreshTaskState`(taskId int)
begin
	declare projectId int default 0;
	if(getTaskPercentage(taskId)=1)
    then
		update task set state=2 where id_task=taskId;
	else
		update task set state=1 where id_task=taskId;
    end if;
    select project_id into projectId from task where id_task= taskId;
    call refreshProjectState(projectId);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `unaffectTaskToEmployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `unaffectTaskToEmployee`(usname varchar(30),taskId int,empusname varchar(30))
begin
	if exists (select * from Employee where username=empusname and leader = usname)
    then
		delete from empTask where username= empusname and id_task = taskId;
    end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uncheckStep` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `uncheckStep`(usname varchar(30),stepId int)
begin
	declare taskId int default 0;
	if exists (select * from step where id_step=stepId and id_task in (select id_task from empTask where username=usname))
    or exists (select * from step where id_step=stepId and id_task in(select id_task from task where project_id in (select id_prj from project where leader=usname)))
    then
		update step set isDone = false where id_step=stepId;
        select id_task into taskId from step where id_step=stepId;
        call refreshTaskState(taskId);
    end if;
end ;;
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

-- Dump completed on 2023-01-21 13:02:21
