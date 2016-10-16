CREATE DATABASE  IF NOT EXISTS `equipmis` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `equipmis`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: equipmis
-- ------------------------------------------------------
-- Server version	5.7.11-log

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
-- Table structure for table `equip`
--

DROP TABLE IF EXISTS `equip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equip` (
  `EID` varchar(20) NOT NULL,
  `ETID` varchar(45) DEFAULT NULL,
  `EName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`EID`),
  KEY `1_idx` (`ETID`),
  CONSTRAINT `00` FOREIGN KEY (`ETID`) REFERENCES `equip_type` (`ETID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equip`
--

LOCK TABLES `equip` WRITE;
/*!40000 ALTER TABLE `equip` DISABLE KEYS */;
INSERT INTO `equip` VALUES ('001','01','一号机器'),('002','02','二号机器');
/*!40000 ALTER TABLE `equip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equip_type`
--

DROP TABLE IF EXISTS `equip_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equip_type` (
  `ETID` varchar(20) NOT NULL,
  `MTtype` varchar(45) DEFAULT NULL,
  `ETName` varchar(45) DEFAULT NULL,
  `yujing` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ETID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equip_type`
--

LOCK TABLES `equip_type` WRITE;
/*!40000 ALTER TABLE `equip_type` DISABLE KEYS */;
INSERT INTO `equip_type` VALUES ('01','年检','6000V及以上电机',''),('02','年检','6000V以下不带振动电机',NULL),('03','半年检','6000V以下带振动电机',NULL),('04','月检','CST',NULL),('05','月检','PLC',NULL);
/*!40000 ALTER TABLE `equip_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintain_item`
--

DROP TABLE IF EXISTS `maintain_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintain_item` (
  `MTID` varchar(20) NOT NULL,
  `ETID` varchar(45) DEFAULT NULL,
  `MTitem` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MTID`),
  KEY `3_idx` (`ETID`),
  CONSTRAINT `3` FOREIGN KEY (`ETID`) REFERENCES `equip_type` (`ETID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintain_item`
--

LOCK TABLES `maintain_item` WRITE;
/*!40000 ALTER TABLE `maintain_item` DISABLE KEYS */;
INSERT INTO `maintain_item` VALUES ('001','01','检查6000V接线盒内瓷瓶、端子'),('002','01','接线盒内卫生清洁'),('003','01','检查电缆引线、穿线管、接地线');
/*!40000 ALTER TABLE `maintain_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintain_record`
--

DROP TABLE IF EXISTS `maintain_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintain_record` (
  `MTRID` varchar(20) NOT NULL,
  `EID` varchar(45) DEFAULT NULL,
  `MTID` varchar(45) DEFAULT NULL,
  `MTPerson` varchar(45) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `result` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MTRID`),
  KEY `2_idx` (`EID`),
  KEY `222_idx` (`MTID`),
  CONSTRAINT `2` FOREIGN KEY (`EID`) REFERENCES `equip` (`EID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `222` FOREIGN KEY (`MTID`) REFERENCES `maintain_item` (`MTID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintain_record`
--

LOCK TABLES `maintain_record` WRITE;
/*!40000 ALTER TABLE `maintain_record` DISABLE KEYS */;
INSERT INTO `maintain_record` VALUES ('0001','001','001','小王','2016-09-11','完成'),('0002','001','002','小王','2016-09-11','完成');
/*!40000 ALTER TABLE `maintain_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material` (
  `maID` varchar(20) NOT NULL,
  `MTRID` varchar(45) DEFAULT NULL,
  `maName` varchar(45) DEFAULT NULL,
  `quantity` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`maID`),
  KEY `8_idx` (`MTRID`),
  CONSTRAINT `8` FOREIGN KEY (`MTRID`) REFERENCES `maintain_record` (`MTRID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES ('1','0001','瓷瓶','1'),('2','0002','线圈','2');
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-16 21:50:47
