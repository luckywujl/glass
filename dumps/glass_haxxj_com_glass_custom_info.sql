-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: glass_haxxj_com
-- ------------------------------------------------------
-- Server version	8.0.16

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
-- Table structure for table `glass_custom_info`
--

DROP TABLE IF EXISTS `glass_custom_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glass_custom_info` (
  `custom_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '客户ID',
  `custom_code` varchar(45) NOT NULL COMMENT '客户编码',
  `custom_name` varchar(45) NOT NULL COMMENT '客户名称',
  `custom_type` varchar(45) NOT NULL COMMENT '客户类型',
  `custom_tel` varchar(45) DEFAULT NULL COMMENT '联系电话',
  `custom_contact` varchar(45) DEFAULT NULL COMMENT '联系人',
  `custom_address` varchar(45) DEFAULT NULL COMMENT '客户地址',
  `custom_discount` double NOT NULL COMMENT '客户折扣',
  `custom_payable_total` double DEFAULT NULL COMMENT '待付金额',
  `custom_sale_total` double DEFAULT NULL COMMENT '销售金额',
  `custom_payment_total` double DEFAULT NULL COMMENT '已付金额',
  `custom_remark` varchar(45) DEFAULT NULL COMMENT '客户备注',
  `custom_status` enum('0','1') DEFAULT NULL COMMENT '状态:0=禁用,1=正常',
  `company_id` varchar(45) DEFAULT NULL COMMENT '数据归属',
  PRIMARY KEY (`custom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='客户资料';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glass_custom_info`
--

LOCK TABLES `glass_custom_info` WRITE;
/*!40000 ALTER TABLE `glass_custom_info` DISABLE KEYS */;
INSERT INTO `glass_custom_info` VALUES (1,'01001','江山钢化','普通客户','15358691188','吴得水','新城星雨华府',100,0,0,0,'','1','0');
/*!40000 ALTER TABLE `glass_custom_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-06  8:56:21
