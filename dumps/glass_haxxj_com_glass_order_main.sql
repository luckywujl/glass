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
-- Table structure for table `glass_order_main`
--

DROP TABLE IF EXISTS `glass_order_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glass_order_main` (
  `order_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `order_code` varchar(45) NOT NULL COMMENT '订单编号',
  `order_datetime` int(11) NOT NULL COMMENT '接单日期',
  `order_delivery_date` date DEFAULT NULL COMMENT '交货日期',
  `order_custom_id` int(10) NOT NULL COMMENT '客户ID',
  `order_custom_name` varchar(45) NOT NULL COMMENT '客户名称',
  `order_custom_contact` varchar(45) DEFAULT NULL COMMENT '联系人',
  `order_custom_tel` varchar(45) DEFAULT NULL COMMENT '联系电话',
  `order_custom_address` varchar(45) DEFAULT NULL COMMENT '客户地址',
  `order_custom_discount` double DEFAULT NULL COMMENT '客户折扣',
  `order_number_total` double DEFAULT NULL COMMENT '合计片数',
  `order_area_total` double DEFAULT NULL COMMENT '合计面积',
  `order_length_total` double DEFAULT NULL COMMENT '合计边长',
  `order_hole_total` int(11) DEFAULT NULL COMMENT '合计孔数',
  `order_amount_total` double DEFAULT NULL COMMENT '合计金额',
  `order_receiver` varchar(10) DEFAULT NULL COMMENT '接单员',
  `order_saleman` varchar(10) DEFAULT NULL COMMENT '业务员',
  `order_operator` varchar(10) DEFAULT NULL COMMENT '制单',
  `order_checker` varchar(10) DEFAULT NULL COMMENT '审核',
  `order_dispatcher` varchar(10) DEFAULT NULL COMMENT '派单',
  `order_freight_type` enum('0','1') DEFAULT NULL COMMENT '运费支付:0=客户支付,1=厂家支付',
  `order_isdelivery` enum('0','1') DEFAULT NULL COMMENT '提货方式:0=客户自提,1=送货到门',
  `order_status` enum('0','1','2','3','4') DEFAULT NULL COMMENT '订单状态:0=接单,1=审核,2=派单,3=生产,4=发货',
  `company_id` varchar(45) DEFAULT NULL COMMENT '数据归属',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glass_order_main`
--

LOCK TABLES `glass_order_main` WRITE;
/*!40000 ALTER TABLE `glass_order_main` DISABLE KEYS */;
/*!40000 ALTER TABLE `glass_order_main` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-06  8:56:24
