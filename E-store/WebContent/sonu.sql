-- MySQL dump 10.13  Distrib 5.5.24, for Win64 (x86)
--
-- Host: localhost    Database: sonu
-- ------------------------------------------------------
-- Server version	5.5.24

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
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill` (
  `bill_no` varchar(20) NOT NULL,
  `b_code` varchar(20) NOT NULL,
  `date` datetime DEFAULT NULL,
  `total` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES ('1','1001','2022-03-20 15:01:14',36784),('2','21180508','2022-03-20 15:15:58',150000),('3','212107','2022-05-22 13:21:43',63996),('4','212107','2022-05-22 13:22:37',719955),('5','212107','2022-05-22 13:22:52',159990),('6','212107','2022-05-22 13:23:04',14990),('7','212107','2022-05-22 13:23:35',1250000),('8','212107','2022-05-22 13:23:58',250000),('9','212108','2022-05-22 13:34:15',1599900),('10','212108','2022-05-22 13:35:31',7450),('11','212108','2022-05-22 13:35:54',3725),('12','21180508','2022-05-22 21:09:55',200000),('13','21180508','2022-05-22 21:13:30',300000),('14','21180509','2022-05-23 10:44:33',1000000),('15','21180510','2022-05-23 11:32:57',700000),('16','21180510','2022-05-23 11:33:20',1050000),('17','21180511','2022-05-23 16:06:59',120000);
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_detail`
--

DROP TABLE IF EXISTS `bill_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_detail` (
  `bill_no` varchar(20) NOT NULL,
  `i_code` varchar(20) NOT NULL,
  `i_aquantity` int(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_detail`
--

LOCK TABLES `bill_detail` WRITE;
/*!40000 ALTER TABLE `bill_detail` DISABLE KEYS */;
INSERT INTO `bill_detail` VALUES ('1','101',32),('1','101',11),('2','103',10),('3','100',4),('4','100',45),('5','100',10),('6','101',10),('7','102',100),('8','102',20),('9','100',100),('10','103',50),('11','103',25),('12','104',10),('13','104',15),('14','105',100),('15','106',10),('16','106',15),('17','107',10);
/*!40000 ALTER TABLE `bill_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_detail`
--

DROP TABLE IF EXISTS `branch_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch_detail` (
  `b_code` varchar(20) NOT NULL,
  `b_name` varchar(30) NOT NULL,
  `b_address` varchar(100) NOT NULL,
  PRIMARY KEY (`b_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_detail`
--

LOCK TABLES `branch_detail` WRITE;
/*!40000 ALTER TABLE `branch_detail` DISABLE KEYS */;
INSERT INTO `branch_detail` VALUES ('21180508','EStore','Pandar'),('21180509','UCER','Naini'),('21180510','BARABNKI','FATEHPUR'),('21180511','UGI','Naini'),('212107','Allahabad','chugi'),('212108','CarBooking','Jasra');
/*!40000 ALTER TABLE `branch_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_item`
--

DROP TABLE IF EXISTS `branch_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch_item` (
  `b_code` varchar(20) NOT NULL,
  `i_code` varchar(20) NOT NULL,
  `i_quantity` int(20) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_item`
--

LOCK TABLES `branch_item` WRITE;
/*!40000 ALTER TABLE `branch_item` DISABLE KEYS */;
INSERT INTO `branch_item` VALUES ('212107','100',41),('212107','101',40),('212107','102',92),('212108','100',100),('212108','103',125),('21180508','104',75),('21180509','105',334),('21180510','106',187),('21180511','107',190);
/*!40000 ALTER TABLE `branch_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dis_detail`
--

DROP TABLE IF EXISTS `dis_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dis_detail` (
  `d_code` varchar(20) NOT NULL,
  `d_name` varchar(45) NOT NULL,
  `d_address` varchar(45) NOT NULL,
  PRIMARY KEY (`d_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dis_detail`
--

LOCK TABLES `dis_detail` WRITE;
/*!40000 ALTER TABLE `dis_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `dis_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_detail`
--

DROP TABLE IF EXISTS `item_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_detail` (
  `i_code` varchar(20) NOT NULL,
  `i_name` varchar(45) NOT NULL,
  `i_company` varchar(20) NOT NULL,
  `i_price` varchar(20) NOT NULL,
  PRIMARY KEY (`i_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_detail`
--

LOCK TABLES `item_detail` WRITE;
/*!40000 ALTER TABLE `item_detail` DISABLE KEYS */;
INSERT INTO `item_detail` VALUES ('100','vivo','vivo','15999'),('101','Nokia','NokiaZ','1499'),('102','Tablet','Acer','12500'),('103','remote','Nokia','149'),('104','Tv','LG','20000'),('105','Watch','FireBoltt','10000'),('106','hman','samsung','70000'),('107','Iphone11','Apple','12000');
/*!40000 ALTER TABLE `item_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `u_id` varchar(20) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `u_type` varchar(10) NOT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('21180508','21180508','c'),('21180509','21180509','c'),('21180510','21180510','c'),('21180511','21180511','c'),('212107','212107','c'),('212108','212108','c'),('admin','admin','a'),('dis','dis','d'),('user','user','c');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `u_detail`
--

DROP TABLE IF EXISTS `u_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `u_detail` (
  `u_code` varchar(20) NOT NULL,
  `u_name` varchar(45) NOT NULL,
  `u_address` varchar(45) NOT NULL,
  PRIMARY KEY (`u_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `u_detail`
--

LOCK TABLES `u_detail` WRITE;
/*!40000 ALTER TABLE `u_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `u_detail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-23 21:56:46
