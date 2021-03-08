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
-- Table structure for table `glass_command`
--

DROP TABLE IF EXISTS `glass_command`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glass_command` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '类型',
  `params` varchar(1500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '参数',
  `command` varchar(1500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '命令',
  `content` text COMMENT '返回结果',
  `executetime` int(10) unsigned DEFAULT NULL COMMENT '执行时间',
  `createtime` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  `status` enum('successed','failured') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'failured' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='在线命令表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glass_command`
--

LOCK TABLES `glass_command` WRITE;
/*!40000 ALTER TABLE `glass_command` DISABLE KEYS */;
INSERT INTO `glass_command` VALUES (1,'crud','[\"--force=1\",\"--table=glass_base_product\",\"--controller=base\\/product\"]','php think crud --force=1 --table=glass_base_product --controller=base/product','Build Successed',1614871764,1614871764,1614871764,'successed'),(2,'crud','[\"--force=1\",\"--table=glass_base_processes\",\"--controller=base\\/processes\"]','php think crud --force=1 --table=glass_base_processes --controller=base/processes','Build Successed',1614871777,1614871777,1614871778,'successed'),(3,'menu','[\"--controller=base\\/Processes\",\"--controller=base\\/Product\"]','php think menu --controller=base/Processes --controller=base/Product','Build Successed!',1614871788,1614871788,1614871788,'successed'),(4,'crud','[\"--force=1\",\"--table=glass_base_personnel\",\"--controller=base\\/personnel\"]','php think crud --force=1 --table=glass_base_personnel --controller=base/personnel','Build Successed',1614902660,1614902660,1614902661,'successed'),(5,'crud','[\"--force=1\",\"--table=glass_base_specification\",\"--controller=base\\/specification\"]','php think crud --force=1 --table=glass_base_specification --controller=base/specification','Build Successed',1614902687,1614902687,1614902687,'successed'),(6,'crud','[\"--force=1\",\"--table=glass_base_remark\",\"--controller=base\\/remark\"]','php think crud --force=1 --table=glass_base_remark --controller=base/remark','Primary key not found!',1614902703,1614902703,1614902703,'failured'),(7,'crud','[\"--force=1\",\"--table=glass_base_remark\",\"--controller=base\\/remark\"]','php think crud --force=1 --table=glass_base_remark --controller=base/remark','Primary key not found!',1614902749,1614902749,1614902749,'failured'),(8,'menu','[\"--controller=base\\/Personnel\",\"--controller=base\\/Specification\"]','php think menu --controller=base/Personnel --controller=base/Specification','Build Successed!',1614902781,1614902781,1614902782,'successed'),(9,'crud','[\"--force=1\",\"--table=glass_base_remark\",\"--controller=base\\/remark\"]','php think crud --force=1 --table=glass_base_remark --controller=base/remark','Primary key not found!',1614902820,1614902820,1614902821,'failured'),(10,'crud','[\"--force=1\",\"--table=glass_base_remark\",\"--controller=base\\/remark\"]','php think crud --force=1 --table=glass_base_remark --controller=base/remark','Build Successed',1614902904,1614902904,1614902904,'successed'),(11,'menu','[\"--controller=base\\/Remark\"]','php think menu --controller=base/Remark','Build Successed!',1614902932,1614902932,1614902933,'successed'),(12,'crud','[\"--force=1\",\"--table=glass_custom_type\",\"--controller=sale\\/customtype\"]','php think crud --force=1 --table=glass_custom_type --controller=sale/customtype','Build Successed',1614939315,1614939315,1614939316,'successed'),(13,'crud','[\"--force=1\",\"--table=glass_custom_info\",\"--controller=sale\\/custominfo\"]','php think crud --force=1 --table=glass_custom_info --controller=sale/custominfo','Build Successed',1614939331,1614939331,1614939331,'successed'),(14,'menu','[\"--controller=sale\\/Customtype\",\"--controller=sale\\/Custominfo\"]','php think menu --controller=sale/Customtype --controller=sale/Custominfo','Build Successed!',1614939345,1614939345,1614939346,'successed'),(15,'crud','[\"--force=1\",\"--table=glass_order_main\",\"--controller=sale\\/ordermain\"]','php think crud --force=1 --table=glass_order_main --controller=sale/ordermain','Build Successed',1614957372,1614957372,1614957372,'successed'),(16,'menu','[\"--controller=sale\\/Ordermain\"]','php think menu --controller=sale/Ordermain','Build Successed!',1614957388,1614957388,1614957389,'successed');
/*!40000 ALTER TABLE `glass_command` ENABLE KEYS */;
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
