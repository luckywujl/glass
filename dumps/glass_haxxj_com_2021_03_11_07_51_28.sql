-- MySQL dump 10.13  Distrib 8.0.16, for linux-glibc2.12 (x86_64)
--
-- Host: localhost    Database: glass_haxxj_com
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `glass_admin`
--

DROP TABLE IF EXISTS `glass_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `glass_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '昵称',
  `password` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '密码',
  `salt` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '头像',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `logintime` int(10) DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '登录IP',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(59) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal' COMMENT '状态',
  `company_id` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '数据归属',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glass_admin`
--

LOCK TABLES `glass_admin` WRITE;
/*!40000 ALTER TABLE `glass_admin` DISABLE KEYS */;
INSERT INTO `glass_admin` VALUES (1,'admin','Admin','d5c533b4048832543fa05b85b1f50b48','b8ddf6','/uploads/20210304/2e2b656725e591271de4e818a29091c0.jpg','admin@admin.com',0,1615299673,'127.0.0.1',1492186163,1615299673,'77e69d27-9d05-44de-81d8-0369ff100c0a','normal','0');
/*!40000 ALTER TABLE `glass_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glass_admin_log`
--

DROP TABLE IF EXISTS `glass_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `glass_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '管理员名字',
  `url` varchar(1500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '日志标题',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理员日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glass_admin_log`
--

LOCK TABLES `glass_admin_log` WRITE;
/*!40000 ALTER TABLE `glass_admin_log` DISABLE KEYS */;
INSERT INTO `glass_admin_log` VALUES (1,1,'admin','/ieDQIAXwJU.php/index/login?url=%2FieDQIAXwJU.php','登录','{\"url\":\"\\/ieDQIAXwJU.php\",\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"dr4y\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614862281),(2,1,'admin','/ieDQIAXwJU.php/ajax/upload','','[]','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614862344),(3,1,'admin','/ieDQIAXwJU.php/general.profile/update','常规管理 / 个人资料 / 更新个人信息','{\"__token__\":\"***\",\"row\":{\"avatar\":\"\\/uploads\\/20210304\\/2e2b656725e591271de4e818a29091c0.jpg\",\"email\":\"admin@admin.com\",\"nickname\":\"Admin\",\"password\":\"***\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614862346),(4,1,'admin','/ieDQIAXwJU.php/addon/install','插件管理','{\"name\":\"command\",\"force\":\"0\",\"uid\":\"25581\",\"token\":\"***\",\"version\":\"1.0.6\",\"faversion\":\"1.2.0.20210125_beta\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614862574),(5,1,'admin','/ieDQIAXwJU.php/addon/install','插件管理','{\"name\":\"geetest\",\"force\":\"0\",\"uid\":\"25581\",\"token\":\"***\",\"version\":\"1.0.1\",\"faversion\":\"1.2.0.20210125_beta\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614862807),(6,1,'admin','/ieDQIAXwJU.php/addon/install','插件管理','{\"name\":\"ezprint\",\"force\":\"0\",\"uid\":\"25581\",\"token\":\"***\",\"version\":\"1.0.0\",\"faversion\":\"1.2.0.20210125_beta\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614862895),(7,0,'Unknown','/ieDQIAXwJU.php/index/login?url=%2FieDQIAXwJU.php%2Fgeneral%2Fconfig%3Faddtabs%3D1','','{\"url\":\"\\/ieDQIAXwJU.php\\/general\\/config?addtabs=1\",\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"RZBS\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614863502),(8,0,'Unknown','/ieDQIAXwJU.php/index/login?url=%2FieDQIAXwJU.php%2Fuser%2Fuser%3Fref%3Daddtabs','','{\"url\":\"\\/ieDQIAXwJU.php\\/user\\/user?ref=addtabs\",\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"WWRM\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614863543),(9,0,'Unknown','/ieDQIAXwJU.php/index/login?url=%2FieDQIAXwJU.php%2Fuser%2Fuser%3Fref%3Daddtabs','','{\"url\":\"\\/ieDQIAXwJU.php\\/user\\/user?ref=addtabs\",\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"WWRM\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614863545),(10,0,'Unknown','/ieDQIAXwJU.php/index/login?url=%2FieDQIAXwJU.php%2Fuser%2Fuser%3Fref%3Daddtabs','','{\"url\":\"\\/ieDQIAXwJU.php\\/user\\/user?ref=addtabs\",\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"WWRM\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614863545),(11,0,'Unknown','/ieDQIAXwJU.php/index/login?url=%2FieDQIAXwJU.php%2Fuser%2Fuser%3Fref%3Daddtabs','','{\"url\":\"\\/ieDQIAXwJU.php\\/user\\/user?ref=addtabs\",\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"PEHX\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614863627),(12,0,'Unknown','/ieDQIAXwJU.php/index/login','','{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"B5Vr\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614863642),(13,1,'admin','/ieDQIAXwJU.php/index/login','登录','{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"ok\",\"geetest_challenge\":\"73bfcb5714d674adb70bd8a5372ad3ff7b\",\"geetest_validate\":\"a0892a3d81cbc86d0f07ae6344b83661\",\"geetest_seccode\":\"a0892a3d81cbc86d0f07ae6344b83661|jordan\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0',1614870787),(14,1,'admin','/ieDQIAXwJU.php/index/login','登录','{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"ok\",\"geetest_challenge\":\"dd803b37b4934dabab83cbd97bb368aem2\",\"geetest_validate\":\"bdc483d9a8a508e78d95619dd1d05c21\",\"geetest_seccode\":\"bdc483d9a8a508e78d95619dd1d05c21|jordan\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36',1614870811),(15,1,'admin','/ieDQIAXwJU.php/index/login','登录','{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"ok\",\"geetest_challenge\":\"38f1836f3d25da92c3649f84d95eee08b0\",\"geetest_validate\":\"79fa1dde71097d9d61d7e473b67bc407\",\"geetest_seccode\":\"79fa1dde71097d9d61d7e473b67bc407|jordan\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614870890),(16,1,'admin','/ieDQIAXwJU.php/command/get_field_list','在线命令管理','{\"table\":\"glass_admin\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614871741),(17,1,'admin','/ieDQIAXwJU.php/command/get_field_list','在线命令管理','{\"table\":\"glass_base_product\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614871745),(18,1,'admin','/ieDQIAXwJU.php/command/command/action/command','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"glass_base_product\",\"controller\":\"base\\/product\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614871758),(19,1,'admin','/ieDQIAXwJU.php/command/command/action/command','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"glass_base_product\",\"controller\":\"base\\/product\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614871762),(20,1,'admin','/ieDQIAXwJU.php/command/command/action/execute','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"glass_base_product\",\"controller\":\"base\\/product\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614871764),(21,1,'admin','/ieDQIAXwJU.php/command/get_field_list','在线命令管理','{\"table\":\"glass_base_processes\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614871768),(22,1,'admin','/ieDQIAXwJU.php/command/command/action/command','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"glass_base_processes\",\"controller\":\"base\\/processes\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614871776),(23,1,'admin','/ieDQIAXwJU.php/command/command/action/execute','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"glass_base_processes\",\"controller\":\"base\\/processes\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614871778),(24,1,'admin','/ieDQIAXwJU.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614871780),(25,1,'admin','/ieDQIAXwJU.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614871782),(26,1,'admin','/ieDQIAXwJU.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614871782),(27,1,'admin','/ieDQIAXwJU.php/command/command/action/command','在线命令管理','{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"controllerfile_text\":\"\",\"controllerfile\":\"base\\/Processes.php,base\\/Product.php\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614871787),(28,1,'admin','/ieDQIAXwJU.php/command/command/action/execute','在线命令管理','{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"controllerfile_text\":\"\",\"controllerfile\":\"base\\/Processes.php,base\\/Product.php\",\"action\":\"execute\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614871788),(29,1,'admin','/ieDQIAXwJU.php/index/login?url=%2FieDQIAXwJU.php%2Fcommand%3Fref%3Daddtabs','登录','{\"url\":\"\\/ieDQIAXwJU.php\\/command?ref=addtabs\",\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"ok\",\"geetest_challenge\":\"a345eb72dba0eafa673bc9711add45b6gf\",\"geetest_validate\":\"8ea881782129ebb03f694d6876895ed9\",\"geetest_seccode\":\"8ea881782129ebb03f694d6876895ed9|jordan\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614901657),(30,1,'admin','/ieDQIAXwJU.php/auth/rule/edit/ids/95?dialog=1','权限管理 / 菜单规则 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"base\",\"title\":\"基础资料\",\"icon\":\"fa fa-list\",\"weigh\":\"140\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"95\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614901681),(31,1,'admin','/ieDQIAXwJU.php/auth/rule/edit/ids/95?dialog=1','权限管理 / 菜单规则 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"base\",\"title\":\"基础资料\",\"icon\":\"fa fa-list\",\"weigh\":\"142\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"95\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614901690),(32,1,'admin','/ieDQIAXwJU.php/auth/rule/edit/ids/103?dialog=1','权限管理 / 菜单规则 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"95\",\"name\":\"base\\/product\",\"title\":\"产品信息\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"5\",\"condition\":\"\",\"remark\":\"设置产品信息，作为接单，销售的基础资料\",\"status\":\"normal\"},\"ids\":\"103\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614901722),(33,1,'admin','/ieDQIAXwJU.php/auth/rule/edit/ids/96?dialog=1','权限管理 / 菜单规则 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"95\",\"name\":\"base\\/processes\",\"title\":\"工序设置\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"设置生产工艺流程，便于在制作生产工艺流程卡及跟单操作\",\"status\":\"normal\"},\"ids\":\"96\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614901779),(34,1,'admin','/ieDQIAXwJU.php/command/get_field_list','在线命令管理','{\"table\":\"glass_admin\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614901901),(35,1,'admin','/ieDQIAXwJU.php/command/get_field_list','在线命令管理','{\"table\":\"glass_admin\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614902616),(36,1,'admin','/ieDQIAXwJU.php/command/get_field_list','在线命令管理','{\"table\":\"glass_base_personnel\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614902641),(37,1,'admin','/ieDQIAXwJU.php/command/command/action/command','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"glass_base_personnel\",\"controller\":\"base\\/personnel\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614902659),(38,1,'admin','/ieDQIAXwJU.php/command/command/action/execute','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"glass_base_personnel\",\"controller\":\"base\\/personnel\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614902661),(39,1,'admin','/ieDQIAXwJU.php/command/get_field_list','在线命令管理','{\"table\":\"glass_base_specification\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614902671),(40,1,'admin','/ieDQIAXwJU.php/command/command/action/command','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"glass_base_specification\",\"controller\":\"base\\/specification\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614902685),(41,1,'admin','/ieDQIAXwJU.php/command/command/action/execute','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"glass_base_specification\",\"controller\":\"base\\/specification\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614902687),(42,1,'admin','/ieDQIAXwJU.php/command/get_field_list','在线命令管理','{\"table\":\"glass_base_remark\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614902694),(43,1,'admin','/ieDQIAXwJU.php/command/command/action/command','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"glass_base_remark\",\"controller\":\"base\\/remark\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614902701),(44,1,'admin','/ieDQIAXwJU.php/command/command/action/execute','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"glass_base_remark\",\"controller\":\"base\\/remark\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614902703),(45,1,'admin','/ieDQIAXwJU.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614902706),(46,1,'admin','/ieDQIAXwJU.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614902712),(47,1,'admin','/ieDQIAXwJU.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614902713),(48,1,'admin','/ieDQIAXwJU.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614902730),(49,1,'admin','/ieDQIAXwJU.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"3\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614902732),(50,1,'admin','/ieDQIAXwJU.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614902735),(51,1,'admin','/ieDQIAXwJU.php/command/command/action/command','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"glass_base_remark\",\"controller\":\"base\\/remark\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614902748),(52,1,'admin','/ieDQIAXwJU.php/command/command/action/execute','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"glass_base_remark\",\"controller\":\"base\\/remark\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614902749),(53,1,'admin','/ieDQIAXwJU.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614902758),(54,1,'admin','/ieDQIAXwJU.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"3\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614902764),(55,1,'admin','/ieDQIAXwJU.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614902766),(56,1,'admin','/ieDQIAXwJU.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614902768),(57,1,'admin','/ieDQIAXwJU.php/command/command/action/command','在线命令管理','{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"base\\/Personnel.php,base\\/Specification.php\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614902778),(58,1,'admin','/ieDQIAXwJU.php/command/command/action/execute','在线命令管理','{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"controllerfile_text\":\"\",\"controllerfile\":\"base\\/Personnel.php,base\\/Specification.php\",\"action\":\"execute\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614902782),(59,1,'admin','/ieDQIAXwJU.php/command/execute/ids/7','在线命令管理 / 运行','{\"ids\":\"7\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614902821),(60,1,'admin','/ieDQIAXwJU.php/command/execute/ids/9','在线命令管理 / 运行','{\"ids\":\"9\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614902904),(61,1,'admin','/ieDQIAXwJU.php/command/get_field_list','在线命令管理','{\"table\":\"glass_admin\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614902920),(62,1,'admin','/ieDQIAXwJU.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614902922),(63,1,'admin','/ieDQIAXwJU.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614902927),(64,1,'admin','/ieDQIAXwJU.php/command/command/action/command','在线命令管理','{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"base\\/Remark.php\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614902929),(65,1,'admin','/ieDQIAXwJU.php/command/command/action/command','在线命令管理','{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"controllerfile_text\":\"\",\"controllerfile\":\"base\\/Remark.php\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614902932),(66,1,'admin','/ieDQIAXwJU.php/command/command/action/execute','在线命令管理','{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"controllerfile_text\":\"\",\"controllerfile\":\"base\\/Remark.php\",\"action\":\"execute\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614902933),(67,1,'admin','/ieDQIAXwJU.php/base/personnel/add?dialog=1','基础资料 / 员工信息 / 添加','{\"dialog\":\"1\",\"row\":{\"personnel_code\":\"01\",\"personnel_name\":\"吴俊雷\",\"personnel_sex\":\"1\",\"personnel_tel\":\"15358691188\",\"personnel_processes\":\"切片\",\"personnel_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614903369),(68,1,'admin','/ieDQIAXwJU.php/base/personnel/edit/ids/1?dialog=1','基础资料 / 员工信息 / 编辑','{\"dialog\":\"1\",\"row\":{\"personnel_code\":\"01\",\"personnel_name\":\"吴俊雷\",\"personnel_sex\":\"1\",\"personnel_tel\":\"15358691188\",\"personnel_processes\":\"切片\",\"personnel_status\":\"1\"},\"ids\":\"1\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614903556),(69,1,'admin','/ieDQIAXwJU.php/base/personnel/edit/ids/1?dialog=1','基础资料 / 员工信息 / 编辑','{\"dialog\":\"1\",\"row\":{\"personnel_code\":\"01\",\"personnel_name\":\"吴俊雷\",\"personnel_sex\":\"1\",\"personnel_tel\":\"15358691188\",\"personnel_processes\":\"切片\",\"personnel_status\":\"1\"},\"ids\":\"1\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614903619),(70,1,'admin','/ieDQIAXwJU.php/base/personnel/add?dialog=1','基础资料 / 员工信息 / 添加','{\"dialog\":\"1\",\"row\":{\"personnel_code\":\"\",\"personnel_name\":\"\",\"personnel_sex\":\"1\",\"personnel_tel\":\"\",\"personnel_processes\":\"\",\"personnel_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614903625),(71,1,'admin','/ieDQIAXwJU.php/base/personnel/del','基础资料 / 员工信息 / 删除','{\"action\":\"del\",\"ids\":\"2\",\"params\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614903697),(72,1,'admin','/ieDQIAXwJU.php/auth/rule/edit/ids/117?dialog=1','权限管理 / 菜单规则 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"95\",\"name\":\"base\\/specification\",\"title\":\"工艺要求\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"4\",\"condition\":\"\",\"remark\":\"设置生产工艺所涉及的工序信息\",\"status\":\"normal\"},\"ids\":\"117\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614903919),(73,1,'admin','/ieDQIAXwJU.php/auth/rule/edit/ids/117?dialog=1','权限管理 / 菜单规则 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"95\",\"name\":\"base\\/specification\",\"title\":\"工艺要求\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"1\",\"condition\":\"\",\"remark\":\"设置接单、生产过程中常用的工艺要求，质量与技术要求\",\"status\":\"normal\"},\"ids\":\"117\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614903988),(74,1,'admin','/ieDQIAXwJU.php/auth/rule/edit/ids/96?dialog=1','权限管理 / 菜单规则 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"95\",\"name\":\"base\\/processes\",\"title\":\"工序设置\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"4\",\"condition\":\"\",\"remark\":\"设置生产工艺流程，便于在制作生产工艺流程卡及跟单操作\",\"status\":\"normal\"},\"ids\":\"96\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614904000),(75,1,'admin','/ieDQIAXwJU.php/base/processes/add?dialog=1','基础资料 / 工序设置 / 添加','{\"dialog\":\"1\",\"row\":{\"processes_code\":\"01\",\"processes_name\":\"切片\",\"processes_print\":\"1\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614904205),(76,1,'admin','/ieDQIAXwJU.php/base/processes/edit/ids/1?dialog=1','基础资料 / 工序设置 / 编辑','{\"dialog\":\"1\",\"row\":{\"processes_code\":\"01\",\"processes_name\":\"切片\",\"processes_print\":\"0\"},\"ids\":\"1\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614904384),(77,1,'admin','/ieDQIAXwJU.php/base/processes/edit/ids/1?dialog=1','基础资料 / 工序设置 / 编辑','{\"dialog\":\"1\",\"row\":{\"processes_code\":\"01\",\"processes_name\":\"切片\",\"processes_print\":\"1\"},\"ids\":\"1\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614904389),(78,1,'admin','/ieDQIAXwJU.php/index/login','登录','{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614904563),(79,1,'admin','/ieDQIAXwJU.php/base/product/add?dialog=1','基础资料 / 产品信息 / 添加','{\"dialog\":\"1\",\"row\":{\"product_name\":\"不钢化普通玻璃\",\"product_specs\":\"3mm\",\"product_price\":\"35\",\"product_lprice\":\"20\",\"product_radix\":\"1\",\"product_remark\":\"\",\"product_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614904668),(80,1,'admin','/ieDQIAXwJU.php/base/specification/add?dialog=1','基础资料 / 工艺要求 / 添加','{\"dialog\":\"1\",\"row\":{\"specification_name\":\"平四边\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614904855),(81,1,'admin','/ieDQIAXwJU.php/auth/rule/edit/ids/117?dialog=1','权限管理 / 菜单规则 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"95\",\"name\":\"base\\/specification\",\"title\":\"工艺要求\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"3\",\"condition\":\"\",\"remark\":\"设置接单、生产过程中常用的工艺要求，质量与技术要求\",\"status\":\"normal\"},\"ids\":\"117\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614904892),(82,1,'admin','/ieDQIAXwJU.php/auth/rule/edit/ids/124?dialog=1','权限管理 / 菜单规则 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"95\",\"name\":\"base\\/remark\",\"title\":\"常用信息\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"2\",\"condition\":\"\",\"remark\":\"设置接单时常用备注信息\",\"status\":\"normal\"},\"ids\":\"124\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614904921),(83,1,'admin','/ieDQIAXwJU.php/auth/rule/edit/ids/110?dialog=1','权限管理 / 菜单规则 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"95\",\"name\":\"base\\/personnel\",\"title\":\"员工信息\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"1\",\"condition\":\"\",\"remark\":\"设置员工信息\",\"status\":\"normal\"},\"ids\":\"110\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614904940),(84,1,'admin','/ieDQIAXwJU.php/base/remark/add?dialog=1','基础资料 / 常用信息 / 添加','{\"dialog\":\"1\",\"row\":{\"remark_name\":\"打孔见图纸\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614905025),(85,1,'admin','/ieDQIAXwJU.php/index/login','登录','{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614938567),(86,1,'admin','/ieDQIAXwJU.php/base/personnel/edit/ids/1?dialog=1','基础资料 / 员工信息 / 编辑','{\"dialog\":\"1\",\"row\":{\"personnel_code\":\"01\",\"personnel_name\":\"吴俊雷\",\"personnel_sex\":\"1\",\"personnel_tel\":\"15358691188\",\"personnel_processes\":\"切片\",\"personnel_status\":\"1\"},\"ids\":\"1\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614938588),(87,1,'admin','/ieDQIAXwJU.php/command/get_field_list','在线命令管理','{\"table\":\"glass_admin\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614939289),(88,1,'admin','/ieDQIAXwJU.php/command/get_field_list','在线命令管理','{\"table\":\"glass_custom_type\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614939294),(89,1,'admin','/ieDQIAXwJU.php/command/command/action/command','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"glass_custom_type\",\"controller\":\"sale\\/customtype\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614939314),(90,1,'admin','/ieDQIAXwJU.php/command/command/action/execute','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"glass_custom_type\",\"controller\":\"sale\\/customtype\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614939316),(91,1,'admin','/ieDQIAXwJU.php/command/get_field_list','在线命令管理','{\"table\":\"glass_custom_info\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614939319),(92,1,'admin','/ieDQIAXwJU.php/command/command/action/command','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"glass_custom_info\",\"controller\":\"sale\\/custominfo\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614939329),(93,1,'admin','/ieDQIAXwJU.php/command/command/action/command','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"glass_custom_info\",\"controller\":\"sale\\/custominfo\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614939330),(94,1,'admin','/ieDQIAXwJU.php/command/command/action/execute','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"glass_custom_info\",\"controller\":\"sale\\/custominfo\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614939331),(95,1,'admin','/ieDQIAXwJU.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614939334),(96,1,'admin','/ieDQIAXwJU.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614939336),(97,1,'admin','/ieDQIAXwJU.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"3\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614939338),(98,1,'admin','/ieDQIAXwJU.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"3\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614939341),(99,1,'admin','/ieDQIAXwJU.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"3\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614939341),(100,1,'admin','/ieDQIAXwJU.php/command/command/action/command','在线命令管理','{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"controllerfile_text\":\"\",\"controllerfile\":\"sale\\/Customtype.php,sale\\/Custominfo.php\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614939345),(101,1,'admin','/ieDQIAXwJU.php/command/command/action/execute','在线命令管理','{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"controllerfile_text\":\"\",\"controllerfile\":\"sale\\/Customtype.php,sale\\/Custominfo.php\",\"action\":\"execute\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614939346),(102,1,'admin','/ieDQIAXwJU.php/auth/rule/edit/ids/131?dialog=1','权限管理 / 菜单规则 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"sale\",\"title\":\"销售管理\",\"icon\":\"fa fa-list\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"131\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614939378),(103,1,'admin','/ieDQIAXwJU.php/auth/rule/edit/ids/131?dialog=1','权限管理 / 菜单规则 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"sale\",\"title\":\"销售管理\",\"icon\":\"fa fa-list\",\"weigh\":\"141\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"131\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614939404),(104,1,'admin','/ieDQIAXwJU.php/auth/rule/edit/ids/132?dialog=1','权限管理 / 菜单规则 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"131\",\"name\":\"sale\\/customtype\",\"title\":\"客户类型\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"10\",\"condition\":\"\",\"remark\":\"设置客户类型，便于统计管理以及客户分类\",\"status\":\"normal\"},\"ids\":\"132\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614939458),(105,1,'admin','/ieDQIAXwJU.php/auth/rule/edit/ids/139?dialog=1','权限管理 / 菜单规则 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"131\",\"name\":\"sale\\/custominfo\",\"title\":\"客户资料\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"9\",\"condition\":\"\",\"remark\":\"维护客户资料\",\"status\":\"normal\"},\"ids\":\"139\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614939479),(106,1,'admin','/ieDQIAXwJU.php/sale/customtype/add?dialog=1','销售管理 / 客户类型 / 添加','{\"dialog\":\"1\",\"row\":{\"custom_type\":\"普通客户\",\"custom_type_discount\":\"100\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614941313),(107,1,'admin','/ieDQIAXwJU.php/sale/custominfo/add?dialog=1','销售管理 / 客户资料 / 添加','{\"dialog\":\"1\",\"row\":{\"custom_code\":\"01001\",\"custom_name\":\"江山钢化\",\"custom_type\":\"普通客户\",\"custom_tel\":\"15358691188\",\"custom_contact\":\"吴得水\",\"custom_address\":\"新城星雨华府\",\"custom_discount\":\"100\",\"custom_payable_total\":\"0\",\"custom_sale_total\":\"\",\"custom_payment_total\":\"\",\"custom_remark\":\"\",\"custom_status\":\"1\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614941612),(108,1,'admin','/ieDQIAXwJU.php/command/get_field_list','在线命令管理','{\"table\":\"glass_admin\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614957340),(109,1,'admin','/ieDQIAXwJU.php/command/get_field_list','在线命令管理','{\"table\":\"glass_order_main\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614957348),(110,1,'admin','/ieDQIAXwJU.php/command/command/action/command','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"glass_order_main\",\"controller\":\"sale\\/ordermain\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614957364),(111,1,'admin','/ieDQIAXwJU.php/command/command/action/command','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"glass_order_main\",\"controller\":\"sale\\/ordermain\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614957371),(112,1,'admin','/ieDQIAXwJU.php/command/command/action/execute','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"glass_order_main\",\"controller\":\"sale\\/ordermain\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614957372),(113,1,'admin','/ieDQIAXwJU.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614957377),(114,1,'admin','/ieDQIAXwJU.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614957379),(115,1,'admin','/ieDQIAXwJU.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"3\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614957382),(116,1,'admin','/ieDQIAXwJU.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"3\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614957384),(117,1,'admin','/ieDQIAXwJU.php/command/command/action/command','在线命令管理','{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"controllerfile_text\":\"\",\"controllerfile\":\"sale\\/Ordermain.php\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614957388),(118,1,'admin','/ieDQIAXwJU.php/command/command/action/execute','在线命令管理','{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"controllerfile_text\":\"\",\"controllerfile\":\"sale\\/Ordermain.php\",\"action\":\"execute\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1614957389),(119,1,'admin','/ieDQIAXwJU.php/index/login','登录','{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1615031999),(120,1,'admin','/ieDQIAXwJU.php/index/login','登录','{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1615130440),(121,1,'admin','/ieDQIAXwJU.php/command/get_field_list','在线命令管理','{\"table\":\"glass_admin\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1615130458),(122,1,'admin','/ieDQIAXwJU.php/command/get_field_list','在线命令管理','{\"table\":\"glass_order_detail_temp\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1615130469),(123,1,'admin','/ieDQIAXwJU.php/command/command/action/command','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"glass_order_detail_temp\",\"controller\":\"sale\\/detailtemp\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1615130502),(124,1,'admin','/ieDQIAXwJU.php/command/command/action/execute','在线命令管理','{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"glass_order_detail_temp\",\"controller\":\"sale\\/detailtemp\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1615130504),(125,1,'admin','/ieDQIAXwJU.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1615130507),(126,1,'admin','/ieDQIAXwJU.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1615130511),(127,1,'admin','/ieDQIAXwJU.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"3\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1615130513),(128,1,'admin','/ieDQIAXwJU.php/command/get_controller_list','在线命令管理','{\"q_word\":[\"\"],\"pageNumber\":\"3\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1615130517),(129,1,'admin','/ieDQIAXwJU.php/command/command/action/command','在线命令管理','{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"sale\\/Detailtemp.php\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1615130518),(130,1,'admin','/ieDQIAXwJU.php/command/command/action/command','在线命令管理','{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"controllerfile_text\":\"\",\"controllerfile\":\"sale\\/Detailtemp.php\",\"action\":\"command\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1615130522),(131,1,'admin','/ieDQIAXwJU.php/command/command/action/execute','在线命令管理','{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"controllerfile_text\":\"\",\"controllerfile\":\"sale\\/Detailtemp.php\",\"action\":\"execute\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1615130524),(132,1,'admin','/ieDQIAXwJU.php/auth/rule/edit/ids/153?dialog=1','权限管理 / 菜单规则 / 编辑','{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"131\",\"name\":\"sale\\/detailtemp\",\"title\":\"销售接单\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"8\",\"condition\":\"\",\"remark\":\"接收客户的订单信息，并将订单录入系统\",\"status\":\"normal\"},\"ids\":\"153\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1615130616),(133,1,'admin','/ieDQIAXwJU.php/index/login','登录','{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1615215269),(134,1,'admin','/ieDQIAXwJU.php/index/login','登录','{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1615299668),(135,1,'admin','/ieDQIAXwJU.php/index/login?url=%2FieDQIAXwJU.php%2Findex%2Findex','登录','{\"url\":\"\\/ieDQIAXwJU.php\\/index\\/index\",\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1615299673),(136,1,'admin','/ieDQIAXwJU.php/sale/custominfo/getcustominfo','销售管理 / 客户资料','{\"page\":\"1\",\"custom_id\":\"1\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1615301227),(137,1,'admin','/ieDQIAXwJU.php/sale/custominfo/getcustominfo','销售管理 / 客户资料','{\"page\":\"1\",\"custom_id\":\"1\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1615301283),(138,1,'admin','/ieDQIAXwJU.php/sale/custominfo/getcustominfo','销售管理 / 客户资料','{\"page\":\"1\",\"custom_id\":\"1\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1615301481),(139,1,'admin','/ieDQIAXwJU.php/sale/custominfo/getcustominfo','销售管理 / 客户资料','{\"page\":\"1\",\"custom_id\":\"1\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1615302554),(140,1,'admin','/ieDQIAXwJU.php/sale/custominfo/getcustominfo','销售管理 / 客户资料','{\"page\":\"1\",\"custom_id\":\"1\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1615387704),(141,1,'admin','/ieDQIAXwJU.php/sale/custominfo/getcustominfo','销售管理 / 客户资料','{\"page\":\"1\",\"custom_id\":\"1\"}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1615387956),(142,1,'admin','/ieDQIAXwJU.php/sale/detailtemp/add?dialog=1','销售管理 / 销售接单 / 添加','{\"dialog\":\"1\",\"row\":{\"detail_datetime\":\"2021-03-10\",\"detail_delivery_date\":\"2021-03-10\",\"detail_isurgent\":\"0\",\"detail_product_name\":\"123\",\"detail_product_specs\":\"222\",\"detail_price\":\"333\",\"detail_useposition\":\"222\",\"detail_discount\":\"222\",\"detail_hole\":\"2222\",\"detail_long\":\"222\",\"detail_wide\":\"222\",\"detail_number\":\"222\",\"detail_area\":\"222222\",\"detail_length\":\"2222\",\"detail_amount\":\"222\",\"detail_remark\":\"打孔见图纸\",\"detail_specification\":\"平四边\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1615390674),(143,1,'admin','/ieDQIAXwJU.php/sale/detailtemp/add?dialog=1','销售管理 / 销售接单 / 添加','{\"dialog\":\"1\",\"row\":{\"detail_datetime\":\"2021-03-10\",\"detail_delivery_date\":\"2021-03-10\",\"detail_isurgent\":\"0\",\"detail_product_name\":\"12\",\"detail_product_specs\":\"33\",\"detail_price\":\"33\",\"detail_useposition\":\"3\",\"detail_discount\":\"3\",\"detail_hole\":\"33\",\"detail_long\":\"3\",\"detail_wide\":\"3\",\"detail_number\":\"3\",\"detail_area\":\"3\",\"detail_length\":\"3\",\"detail_amount\":\"3\",\"detail_remark\":\"打孔见图纸\",\"detail_specification\":\"平四边\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1615391055),(144,1,'admin','/ieDQIAXwJU.php/sale/detailtemp/add?dialog=1','销售管理 / 销售接单 / 添加','{\"dialog\":\"1\",\"row\":{\"detail_datetime\":\"2021-03-10\",\"detail_delivery_date\":\"2021-03-10\",\"detail_isurgent\":\"0\",\"detail_product_name\":\"1\",\"detail_product_specs\":\"\",\"detail_price\":\"\",\"detail_useposition\":\"\",\"detail_discount\":\"\",\"detail_hole\":\"\",\"detail_long\":\"\",\"detail_wide\":\"\",\"detail_number\":\"\",\"detail_area\":\"\",\"detail_length\":\"\",\"detail_amount\":\"\",\"detail_remark\":\"\",\"detail_specification\":\"\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1615391800),(145,1,'admin','/ieDQIAXwJU.php/sale/detailtemp/add?dialog=1','销售管理 / 销售接单 / 添加','{\"dialog\":\"1\",\"row\":{\"detail_datetime\":\"2021-03-10\",\"detail_delivery_date\":\"2021-03-10\",\"detail_isurgent\":\"0\",\"detail_product_name\":\"22\",\"detail_product_specs\":\"\",\"detail_price\":\"\",\"detail_useposition\":\"\",\"detail_discount\":\"\",\"detail_hole\":\"\",\"detail_long\":\"\",\"detail_wide\":\"\",\"detail_number\":\"\",\"detail_area\":\"\",\"detail_length\":\"\",\"detail_amount\":\"\",\"detail_remark\":\"\",\"detail_specification\":\"\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1615391808),(146,1,'admin','/ieDQIAXwJU.php/sale/detailtemp/add?dialog=1','销售管理 / 销售接单 / 添加','{\"dialog\":\"1\",\"row\":{\"detail_datetime\":\"2021-03-10\",\"detail_delivery_date\":\"2021-03-10\",\"detail_isurgent\":\"0\",\"detail_product_name\":\"33\",\"detail_product_specs\":\"\",\"detail_price\":\"\",\"detail_useposition\":\"\",\"detail_discount\":\"\",\"detail_hole\":\"\",\"detail_long\":\"\",\"detail_wide\":\"\",\"detail_number\":\"\",\"detail_area\":\"\",\"detail_length\":\"\",\"detail_amount\":\"\",\"detail_remark\":\"\",\"detail_specification\":\"\"}}','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.128 Safari/537.36 Qaxbrowser',1615391906);
/*!40000 ALTER TABLE `glass_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glass_area`
--

DROP TABLE IF EXISTS `glass_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `glass_area` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int(10) DEFAULT NULL COMMENT '父id',
  `shortname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '简称',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `mergename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '全称',
  `level` tinyint(4) DEFAULT NULL COMMENT '层级 0 1 2 省市区县',
  `pinyin` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '拼音',
  `code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '长途区号',
  `zip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮编',
  `first` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '首字母',
  `lng` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '经度',
  `lat` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='地区表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glass_area`
--

LOCK TABLES `glass_area` WRITE;
/*!40000 ALTER TABLE `glass_area` DISABLE KEYS */;
/*!40000 ALTER TABLE `glass_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glass_attachment`
--

DROP TABLE IF EXISTS `glass_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `glass_attachment` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `filename` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '文件名称',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `mimetype` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '透传数据',
  `createtime` int(10) DEFAULT NULL COMMENT '创建日期',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `uploadtime` int(10) DEFAULT NULL COMMENT '上传时间',
  `storage` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='附件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glass_attachment`
--

LOCK TABLES `glass_attachment` WRITE;
/*!40000 ALTER TABLE `glass_attachment` DISABLE KEYS */;
INSERT INTO `glass_attachment` VALUES (1,1,0,'/assets/img/qrcode.png','150','150','png',0,'qrcode.png',21859,'image/png','',1499681848,1499681848,1499681848,'local','17163603d0263e4838b9387ff2cd4877e8b018f6'),(2,1,0,'/uploads/20210304/2e2b656725e591271de4e818a29091c0.jpg','3840','2400','jpg',0,'Flying_Whale_by_Shu_Le.jpg',966178,'image/jpeg','',1614862344,1614862344,1614862344,'local','1264c04856d2e30cb1816f5d018cc09c3ab00f6f');
/*!40000 ALTER TABLE `glass_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glass_auth_group`
--

DROP TABLE IF EXISTS `glass_auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `glass_auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父组别',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '组名',
  `rules` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '规则ID',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glass_auth_group`
--

LOCK TABLES `glass_auth_group` WRITE;
/*!40000 ALTER TABLE `glass_auth_group` DISABLE KEYS */;
INSERT INTO `glass_auth_group` VALUES (1,0,'Admin group','*',1490883540,149088354,'normal'),(2,1,'Second group','13,14,16,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,1,9,10,11,7,6,8,2,4,5',1490883540,1505465692,'normal'),(3,2,'Third group','1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5',1490883540,1502205322,'normal'),(4,1,'Second group 2','1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65',1490883540,1502205350,'normal'),(5,2,'Third group 2','1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34',1490883540,1502205344,'normal');
/*!40000 ALTER TABLE `glass_auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glass_auth_group_access`
--

DROP TABLE IF EXISTS `glass_auth_group_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `glass_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '会员ID',
  `group_id` int(10) unsigned NOT NULL COMMENT '级别ID',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='权限分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glass_auth_group_access`
--

LOCK TABLES `glass_auth_group_access` WRITE;
/*!40000 ALTER TABLE `glass_auth_group_access` DISABLE KEYS */;
INSERT INTO `glass_auth_group_access` VALUES (1,1);
/*!40000 ALTER TABLE `glass_auth_group_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glass_auth_rule`
--

DROP TABLE IF EXISTS `glass_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `glass_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '图标',
  `condition` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '条件',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `pid` (`pid`),
  KEY `weigh` (`weigh`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='节点表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glass_auth_rule`
--

LOCK TABLES `glass_auth_rule` WRITE;
/*!40000 ALTER TABLE `glass_auth_rule` DISABLE KEYS */;
INSERT INTO `glass_auth_rule` VALUES (1,'file',0,'dashboard','Dashboard','fa fa-dashboard','','Dashboard tips',1,1497429920,1497429920,143,'normal'),(2,'file',0,'general','General','fa fa-cogs','','',1,1497429920,1497430169,137,'normal'),(3,'file',0,'category','Category','fa fa-leaf','','Category tips',1,1497429920,1497429920,119,'normal'),(4,'file',0,'addon','Addon','fa fa-rocket','','Addon tips',1,1502035509,1502035509,0,'normal'),(5,'file',0,'auth','Auth','fa fa-group','','',1,1497429920,1497430092,99,'normal'),(6,'file',2,'general/config','Config','fa fa-cog','','Config tips',1,1497429920,1497430683,60,'normal'),(7,'file',2,'general/attachment','Attachment','fa fa-file-image-o','','Attachment tips',1,1497429920,1497430699,53,'normal'),(8,'file',2,'general/profile','Profile','fa fa-user','','',1,1497429920,1497429920,34,'normal'),(9,'file',5,'auth/admin','Admin','fa fa-user','','Admin tips',1,1497429920,1497430320,118,'normal'),(10,'file',5,'auth/adminlog','Admin log','fa fa-list-alt','','Admin log tips',1,1497429920,1497430307,113,'normal'),(11,'file',5,'auth/group','Group','fa fa-group','','Group tips',1,1497429920,1497429920,109,'normal'),(12,'file',5,'auth/rule','Rule','fa fa-bars','','Rule tips',1,1497429920,1497430581,104,'normal'),(13,'file',1,'dashboard/index','View','fa fa-circle-o','','',0,1497429920,1497429920,136,'normal'),(14,'file',1,'dashboard/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,135,'normal'),(15,'file',1,'dashboard/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,133,'normal'),(16,'file',1,'dashboard/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,134,'normal'),(17,'file',1,'dashboard/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,132,'normal'),(18,'file',6,'general/config/index','View','fa fa-circle-o','','',0,1497429920,1497429920,52,'normal'),(19,'file',6,'general/config/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,51,'normal'),(20,'file',6,'general/config/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,50,'normal'),(21,'file',6,'general/config/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,49,'normal'),(22,'file',6,'general/config/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,48,'normal'),(23,'file',7,'general/attachment/index','View','fa fa-circle-o','','Attachment tips',0,1497429920,1497429920,59,'normal'),(24,'file',7,'general/attachment/select','Select attachment','fa fa-circle-o','','',0,1497429920,1497429920,58,'normal'),(25,'file',7,'general/attachment/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,57,'normal'),(26,'file',7,'general/attachment/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,56,'normal'),(27,'file',7,'general/attachment/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,55,'normal'),(28,'file',7,'general/attachment/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,54,'normal'),(29,'file',8,'general/profile/index','View','fa fa-circle-o','','',0,1497429920,1497429920,33,'normal'),(30,'file',8,'general/profile/update','Update profile','fa fa-circle-o','','',0,1497429920,1497429920,32,'normal'),(31,'file',8,'general/profile/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,31,'normal'),(32,'file',8,'general/profile/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,30,'normal'),(33,'file',8,'general/profile/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,29,'normal'),(34,'file',8,'general/profile/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,28,'normal'),(35,'file',3,'category/index','View','fa fa-circle-o','','Category tips',0,1497429920,1497429920,142,'normal'),(36,'file',3,'category/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,141,'normal'),(37,'file',3,'category/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,140,'normal'),(38,'file',3,'category/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,139,'normal'),(39,'file',3,'category/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,138,'normal'),(40,'file',9,'auth/admin/index','View','fa fa-circle-o','','Admin tips',0,1497429920,1497429920,117,'normal'),(41,'file',9,'auth/admin/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,116,'normal'),(42,'file',9,'auth/admin/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,115,'normal'),(43,'file',9,'auth/admin/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,114,'normal'),(44,'file',10,'auth/adminlog/index','View','fa fa-circle-o','','Admin log tips',0,1497429920,1497429920,112,'normal'),(45,'file',10,'auth/adminlog/detail','Detail','fa fa-circle-o','','',0,1497429920,1497429920,111,'normal'),(46,'file',10,'auth/adminlog/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,110,'normal'),(47,'file',11,'auth/group/index','View','fa fa-circle-o','','Group tips',0,1497429920,1497429920,108,'normal'),(48,'file',11,'auth/group/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,107,'normal'),(49,'file',11,'auth/group/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,106,'normal'),(50,'file',11,'auth/group/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,105,'normal'),(51,'file',12,'auth/rule/index','View','fa fa-circle-o','','Rule tips',0,1497429920,1497429920,103,'normal'),(52,'file',12,'auth/rule/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,102,'normal'),(53,'file',12,'auth/rule/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,101,'normal'),(54,'file',12,'auth/rule/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,100,'normal'),(55,'file',4,'addon/index','View','fa fa-circle-o','','Addon tips',0,1502035509,1502035509,0,'normal'),(56,'file',4,'addon/add','Add','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(57,'file',4,'addon/edit','Edit','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(58,'file',4,'addon/del','Delete','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(59,'file',4,'addon/downloaded','Local addon','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(60,'file',4,'addon/state','Update state','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(63,'file',4,'addon/config','Setting','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(64,'file',4,'addon/refresh','Refresh','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(65,'file',4,'addon/multi','Multi','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(66,'file',0,'user','User','fa fa-list','','',1,1516374729,1516374729,0,'normal'),(67,'file',66,'user/user','User','fa fa-user','','',1,1516374729,1516374729,0,'normal'),(68,'file',67,'user/user/index','View','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(69,'file',67,'user/user/edit','Edit','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(70,'file',67,'user/user/add','Add','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(71,'file',67,'user/user/del','Del','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(72,'file',67,'user/user/multi','Multi','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(73,'file',66,'user/group','User group','fa fa-users','','',1,1516374729,1516374729,0,'normal'),(74,'file',73,'user/group/add','Add','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(75,'file',73,'user/group/edit','Edit','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(76,'file',73,'user/group/index','View','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(77,'file',73,'user/group/del','Del','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(78,'file',73,'user/group/multi','Multi','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(79,'file',66,'user/rule','User rule','fa fa-circle-o','','',1,1516374729,1516374729,0,'normal'),(80,'file',79,'user/rule/index','View','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(81,'file',79,'user/rule/del','Del','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(82,'file',79,'user/rule/add','Add','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(83,'file',79,'user/rule/edit','Edit','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(84,'file',79,'user/rule/multi','Multi','fa fa-circle-o','','',0,1516374729,1516374729,0,'normal'),(85,'file',0,'command','在线命令管理','fa fa-terminal','','',1,1614862574,1614862574,0,'normal'),(86,'file',85,'command/index','查看','fa fa-circle-o','','',0,1614862574,1614862574,0,'normal'),(87,'file',85,'command/add','添加','fa fa-circle-o','','',0,1614862574,1614862574,0,'normal'),(88,'file',85,'command/detail','详情','fa fa-circle-o','','',0,1614862574,1614862574,0,'normal'),(89,'file',85,'command/execute','运行','fa fa-circle-o','','',0,1614862574,1614862574,0,'normal'),(90,'file',85,'command/del','删除','fa fa-circle-o','','',0,1614862574,1614862574,0,'normal'),(91,'file',85,'command/multi','批量更新','fa fa-circle-o','','',0,1614862574,1614862574,0,'normal'),(92,'file',0,'ezprint','打印管理','fa fa-magic','','',1,1614862894,1614862894,0,'normal'),(93,'file',92,'ezprint/printing','模板管理','fa fa-print','','',1,1614862894,1614862894,100,'normal'),(94,'file',92,'ezprint/example','打印示例','fa fa-print','','',1,1614862894,1614862894,90,'normal'),(95,'file',0,'base','基础资料','fa fa-list','','',1,1614871788,1614901690,142,'normal'),(96,'file',95,'base/processes','工序设置','fa fa-circle-o','','设置生产工艺流程，便于在制作生产工艺流程卡及跟单操作',1,1614871788,1614904000,4,'normal'),(97,'file',96,'base/processes/import','Import','fa fa-circle-o','','',0,1614871788,1614871788,0,'normal'),(98,'file',96,'base/processes/index','查看','fa fa-circle-o','','',0,1614871788,1614871788,0,'normal'),(99,'file',96,'base/processes/add','添加','fa fa-circle-o','','',0,1614871788,1614871788,0,'normal'),(100,'file',96,'base/processes/edit','编辑','fa fa-circle-o','','',0,1614871788,1614871788,0,'normal'),(101,'file',96,'base/processes/del','删除','fa fa-circle-o','','',0,1614871788,1614871788,0,'normal'),(102,'file',96,'base/processes/multi','批量更新','fa fa-circle-o','','',0,1614871788,1614871788,0,'normal'),(103,'file',95,'base/product','产品信息','fa fa-circle-o','','设置产品信息，作为接单，销售的基础资料',1,1614871788,1614901722,5,'normal'),(104,'file',103,'base/product/import','Import','fa fa-circle-o','','',0,1614871788,1614871788,0,'normal'),(105,'file',103,'base/product/index','查看','fa fa-circle-o','','',0,1614871788,1614871788,0,'normal'),(106,'file',103,'base/product/add','添加','fa fa-circle-o','','',0,1614871788,1614871788,0,'normal'),(107,'file',103,'base/product/edit','编辑','fa fa-circle-o','','',0,1614871788,1614871788,0,'normal'),(108,'file',103,'base/product/del','删除','fa fa-circle-o','','',0,1614871788,1614871788,0,'normal'),(109,'file',103,'base/product/multi','批量更新','fa fa-circle-o','','',0,1614871788,1614871788,0,'normal'),(110,'file',95,'base/personnel','员工信息','fa fa-circle-o','','设置员工信息',1,1614902782,1614904940,1,'normal'),(111,'file',110,'base/personnel/import','Import','fa fa-circle-o','','',0,1614902782,1614902782,0,'normal'),(112,'file',110,'base/personnel/index','查看','fa fa-circle-o','','',0,1614902782,1614902782,0,'normal'),(113,'file',110,'base/personnel/add','添加','fa fa-circle-o','','',0,1614902782,1614902782,0,'normal'),(114,'file',110,'base/personnel/edit','编辑','fa fa-circle-o','','',0,1614902782,1614902782,0,'normal'),(115,'file',110,'base/personnel/del','删除','fa fa-circle-o','','',0,1614902782,1614902782,0,'normal'),(116,'file',110,'base/personnel/multi','批量更新','fa fa-circle-o','','',0,1614902782,1614902782,0,'normal'),(117,'file',95,'base/specification','工艺要求','fa fa-circle-o','','设置接单、生产过程中常用的工艺要求，质量与技术要求',1,1614902782,1614904892,3,'normal'),(118,'file',117,'base/specification/import','Import','fa fa-circle-o','','',0,1614902782,1614902782,0,'normal'),(119,'file',117,'base/specification/index','查看','fa fa-circle-o','','',0,1614902782,1614902782,0,'normal'),(120,'file',117,'base/specification/add','添加','fa fa-circle-o','','',0,1614902782,1614902782,0,'normal'),(121,'file',117,'base/specification/edit','编辑','fa fa-circle-o','','',0,1614902782,1614902782,0,'normal'),(122,'file',117,'base/specification/del','删除','fa fa-circle-o','','',0,1614902782,1614902782,0,'normal'),(123,'file',117,'base/specification/multi','批量更新','fa fa-circle-o','','',0,1614902782,1614902782,0,'normal'),(124,'file',95,'base/remark','常用信息','fa fa-circle-o','','设置接单时常用备注信息',1,1614902933,1614904921,2,'normal'),(125,'file',124,'base/remark/import','Import','fa fa-circle-o','','',0,1614902933,1614902933,0,'normal'),(126,'file',124,'base/remark/index','查看','fa fa-circle-o','','',0,1614902933,1614902933,0,'normal'),(127,'file',124,'base/remark/add','添加','fa fa-circle-o','','',0,1614902933,1614902933,0,'normal'),(128,'file',124,'base/remark/edit','编辑','fa fa-circle-o','','',0,1614902933,1614902933,0,'normal'),(129,'file',124,'base/remark/del','删除','fa fa-circle-o','','',0,1614902933,1614902933,0,'normal'),(130,'file',124,'base/remark/multi','批量更新','fa fa-circle-o','','',0,1614902933,1614902933,0,'normal'),(131,'file',0,'sale','销售管理','fa fa-list','','',1,1614939346,1614939404,141,'normal'),(132,'file',131,'sale/customtype','客户类型','fa fa-circle-o','','设置客户类型，便于统计管理以及客户分类',1,1614939346,1614939458,10,'normal'),(133,'file',132,'sale/customtype/import','Import','fa fa-circle-o','','',0,1614939346,1614939346,0,'normal'),(134,'file',132,'sale/customtype/index','查看','fa fa-circle-o','','',0,1614939346,1614939346,0,'normal'),(135,'file',132,'sale/customtype/add','添加','fa fa-circle-o','','',0,1614939346,1614939346,0,'normal'),(136,'file',132,'sale/customtype/edit','编辑','fa fa-circle-o','','',0,1614939346,1614939346,0,'normal'),(137,'file',132,'sale/customtype/del','删除','fa fa-circle-o','','',0,1614939346,1614939346,0,'normal'),(138,'file',132,'sale/customtype/multi','批量更新','fa fa-circle-o','','',0,1614939346,1614939346,0,'normal'),(139,'file',131,'sale/custominfo','客户资料','fa fa-circle-o','','维护客户资料',1,1614939346,1614939479,9,'normal'),(140,'file',139,'sale/custominfo/import','Import','fa fa-circle-o','','',0,1614939346,1614939346,0,'normal'),(141,'file',139,'sale/custominfo/index','查看','fa fa-circle-o','','',0,1614939346,1614939346,0,'normal'),(142,'file',139,'sale/custominfo/add','添加','fa fa-circle-o','','',0,1614939346,1614939346,0,'normal'),(143,'file',139,'sale/custominfo/edit','编辑','fa fa-circle-o','','',0,1614939346,1614939346,0,'normal'),(144,'file',139,'sale/custominfo/del','删除','fa fa-circle-o','','',0,1614939346,1614939346,0,'normal'),(145,'file',139,'sale/custominfo/multi','批量更新','fa fa-circle-o','','',0,1614939346,1614939346,0,'normal'),(146,'file',131,'sale/ordermain','订单信息','fa fa-circle-o','','',1,1614957388,1614957388,0,'normal'),(147,'file',146,'sale/ordermain/import','Import','fa fa-circle-o','','',0,1614957388,1614957388,0,'normal'),(148,'file',146,'sale/ordermain/index','查看','fa fa-circle-o','','',0,1614957388,1614957388,0,'normal'),(149,'file',146,'sale/ordermain/add','添加','fa fa-circle-o','','',0,1614957388,1614957388,0,'normal'),(150,'file',146,'sale/ordermain/edit','编辑','fa fa-circle-o','','',0,1614957388,1614957388,0,'normal'),(151,'file',146,'sale/ordermain/del','删除','fa fa-circle-o','','',0,1614957388,1614957388,0,'normal'),(152,'file',146,'sale/ordermain/multi','批量更新','fa fa-circle-o','','',0,1614957388,1614957388,0,'normal'),(153,'file',131,'sale/detailtemp','销售接单','fa fa-circle-o','','接收客户的订单信息，并将订单录入系统',1,1615130523,1615130616,8,'normal'),(154,'file',153,'sale/detailtemp/import','Import','fa fa-circle-o','','',0,1615130523,1615130523,0,'normal'),(155,'file',153,'sale/detailtemp/index','查看','fa fa-circle-o','','',0,1615130523,1615130523,0,'normal'),(156,'file',153,'sale/detailtemp/add','添加','fa fa-circle-o','','',0,1615130523,1615130523,0,'normal'),(157,'file',153,'sale/detailtemp/edit','编辑','fa fa-circle-o','','',0,1615130523,1615130523,0,'normal'),(158,'file',153,'sale/detailtemp/del','删除','fa fa-circle-o','','',0,1615130523,1615130523,0,'normal'),(159,'file',153,'sale/detailtemp/multi','批量更新','fa fa-circle-o','','',0,1615130523,1615130523,0,'normal');
/*!40000 ALTER TABLE `glass_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glass_base_personnel`
--

DROP TABLE IF EXISTS `glass_base_personnel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `glass_base_personnel` (
  `personnen_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '员工ID',
  `personnel_code` varchar(45) DEFAULT NULL COMMENT '员工编号',
  `personnel_name` varchar(45) DEFAULT NULL COMMENT '员工姓名',
  `personnel_sex` enum('0','1') DEFAULT NULL COMMENT '性别:0=女,1=男',
  `personnel_tel` varchar(45) DEFAULT NULL COMMENT '联系电话',
  `personnel_processes` varchar(45) DEFAULT NULL COMMENT '岗位名称',
  `personnel_status` enum('0','1') DEFAULT NULL COMMENT '状态:0=离职,1=正常',
  `company_id` varchar(45) DEFAULT NULL COMMENT '数据归属',
  PRIMARY KEY (`personnen_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='员工信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glass_base_personnel`
--

LOCK TABLES `glass_base_personnel` WRITE;
/*!40000 ALTER TABLE `glass_base_personnel` DISABLE KEYS */;
INSERT INTO `glass_base_personnel` VALUES (1,'01','吴俊雷','1','15358691188','切片','1','0');
/*!40000 ALTER TABLE `glass_base_personnel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glass_base_processes`
--

DROP TABLE IF EXISTS `glass_base_processes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `glass_base_processes` (
  `processes_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '工序ID',
  `processes_code` varchar(3) NOT NULL COMMENT '工序编号',
  `processes_name` varchar(45) NOT NULL COMMENT '工序名称',
  `processes_print` enum('0','1') DEFAULT NULL COMMENT '是否打印:0=不打印,1=打印',
  `company_id` int(10) DEFAULT NULL COMMENT '数据归属',
  PRIMARY KEY (`processes_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='工序设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glass_base_processes`
--

LOCK TABLES `glass_base_processes` WRITE;
/*!40000 ALTER TABLE `glass_base_processes` DISABLE KEYS */;
INSERT INTO `glass_base_processes` VALUES (1,'01','切片','1',0);
/*!40000 ALTER TABLE `glass_base_processes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glass_base_product`
--

DROP TABLE IF EXISTS `glass_base_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `glass_base_product` (
  `product_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '产品信息ID',
  `product_name` varchar(45) NOT NULL COMMENT '产品名称',
  `product_specs` varchar(45) NOT NULL COMMENT '产品规格',
  `product_price` double NOT NULL COMMENT '产品价格',
  `product_lprice` double DEFAULT '0' COMMENT '最低价格',
  `product_radix` int(2) DEFAULT '1' COMMENT '单片基数',
  `product_remark` varchar(45) DEFAULT NULL COMMENT '备注',
  `product_status` enum('0','1') DEFAULT NULL COMMENT '产品状态:0=禁用,1=启用',
  `company_id` int(10) DEFAULT NULL COMMENT '数据归属',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='产品信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glass_base_product`
--

LOCK TABLES `glass_base_product` WRITE;
/*!40000 ALTER TABLE `glass_base_product` DISABLE KEYS */;
INSERT INTO `glass_base_product` VALUES (1,'不钢化普通玻璃','3mm',35,20,1,'','1',0);
/*!40000 ALTER TABLE `glass_base_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glass_base_remark`
--

DROP TABLE IF EXISTS `glass_base_remark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `glass_base_remark` (
  `remark_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '信息ID',
  `remark_name` varchar(45) NOT NULL COMMENT '信息内容',
  `company_id` int(10) DEFAULT NULL COMMENT '数据归属',
  PRIMARY KEY (`remark_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='常用信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glass_base_remark`
--

LOCK TABLES `glass_base_remark` WRITE;
/*!40000 ALTER TABLE `glass_base_remark` DISABLE KEYS */;
INSERT INTO `glass_base_remark` VALUES (1,'打孔见图纸',0);
/*!40000 ALTER TABLE `glass_base_remark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glass_base_specification`
--

DROP TABLE IF EXISTS `glass_base_specification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `glass_base_specification` (
  `specification_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '工艺要求ID',
  `specification_name` varchar(45) DEFAULT NULL COMMENT '工艺要求',
  `company_id` int(10) DEFAULT NULL COMMENT '数据归属',
  PRIMARY KEY (`specification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='工艺要求';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glass_base_specification`
--

LOCK TABLES `glass_base_specification` WRITE;
/*!40000 ALTER TABLE `glass_base_specification` DISABLE KEYS */;
INSERT INTO `glass_base_specification` VALUES (1,'平四边',0);
/*!40000 ALTER TABLE `glass_base_specification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glass_category`
--

DROP TABLE IF EXISTS `glass_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `glass_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `nickname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `flag` set('hot','index','recommend') COLLATE utf8mb4_unicode_ci DEFAULT '',
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '关键字',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '自定义名称',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `weigh` (`weigh`,`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glass_category`
--

LOCK TABLES `glass_category` WRITE;
/*!40000 ALTER TABLE `glass_category` DISABLE KEYS */;
INSERT INTO `glass_category` VALUES (1,0,'page','官方新闻','news','recommend','/assets/img/qrcode.png','','','news',1495262190,1495262190,1,'normal'),(2,0,'page','移动应用','mobileapp','hot','/assets/img/qrcode.png','','','mobileapp',1495262244,1495262244,2,'normal'),(3,2,'page','微信公众号','wechatpublic','index','/assets/img/qrcode.png','','','wechatpublic',1495262288,1495262288,3,'normal'),(4,2,'page','Android开发','android','recommend','/assets/img/qrcode.png','','','android',1495262317,1495262317,4,'normal'),(5,0,'page','软件产品','software','recommend','/assets/img/qrcode.png','','','software',1495262336,1499681850,5,'normal'),(6,5,'page','网站建站','website','recommend','/assets/img/qrcode.png','','','website',1495262357,1495262357,6,'normal'),(7,5,'page','企业管理软件','company','index','/assets/img/qrcode.png','','','company',1495262391,1495262391,7,'normal'),(8,6,'page','PC端','website-pc','recommend','/assets/img/qrcode.png','','','website-pc',1495262424,1495262424,8,'normal'),(9,6,'page','移动端','website-mobile','recommend','/assets/img/qrcode.png','','','website-mobile',1495262456,1495262456,9,'normal'),(10,7,'page','CRM系统 ','company-crm','recommend','/assets/img/qrcode.png','','','company-crm',1495262487,1495262487,10,'normal'),(11,7,'page','SASS平台软件','company-sass','recommend','/assets/img/qrcode.png','','','company-sass',1495262515,1495262515,11,'normal'),(12,0,'test','测试1','test1','recommend','/assets/img/qrcode.png','','','test1',1497015727,1497015727,12,'normal'),(13,0,'test','测试2','test2','recommend','/assets/img/qrcode.png','','','test2',1497015738,1497015738,13,'normal');
/*!40000 ALTER TABLE `glass_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glass_command`
--

DROP TABLE IF EXISTS `glass_command`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='在线命令表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glass_command`
--

LOCK TABLES `glass_command` WRITE;
/*!40000 ALTER TABLE `glass_command` DISABLE KEYS */;
INSERT INTO `glass_command` VALUES (1,'crud','[\"--force=1\",\"--table=glass_base_product\",\"--controller=base\\/product\"]','php think crud --force=1 --table=glass_base_product --controller=base/product','Build Successed',1614871764,1614871764,1614871764,'successed'),(2,'crud','[\"--force=1\",\"--table=glass_base_processes\",\"--controller=base\\/processes\"]','php think crud --force=1 --table=glass_base_processes --controller=base/processes','Build Successed',1614871777,1614871777,1614871778,'successed'),(3,'menu','[\"--controller=base\\/Processes\",\"--controller=base\\/Product\"]','php think menu --controller=base/Processes --controller=base/Product','Build Successed!',1614871788,1614871788,1614871788,'successed'),(4,'crud','[\"--force=1\",\"--table=glass_base_personnel\",\"--controller=base\\/personnel\"]','php think crud --force=1 --table=glass_base_personnel --controller=base/personnel','Build Successed',1614902660,1614902660,1614902661,'successed'),(5,'crud','[\"--force=1\",\"--table=glass_base_specification\",\"--controller=base\\/specification\"]','php think crud --force=1 --table=glass_base_specification --controller=base/specification','Build Successed',1614902687,1614902687,1614902687,'successed'),(6,'crud','[\"--force=1\",\"--table=glass_base_remark\",\"--controller=base\\/remark\"]','php think crud --force=1 --table=glass_base_remark --controller=base/remark','Primary key not found!',1614902703,1614902703,1614902703,'failured'),(7,'crud','[\"--force=1\",\"--table=glass_base_remark\",\"--controller=base\\/remark\"]','php think crud --force=1 --table=glass_base_remark --controller=base/remark','Primary key not found!',1614902749,1614902749,1614902749,'failured'),(8,'menu','[\"--controller=base\\/Personnel\",\"--controller=base\\/Specification\"]','php think menu --controller=base/Personnel --controller=base/Specification','Build Successed!',1614902781,1614902781,1614902782,'successed'),(9,'crud','[\"--force=1\",\"--table=glass_base_remark\",\"--controller=base\\/remark\"]','php think crud --force=1 --table=glass_base_remark --controller=base/remark','Primary key not found!',1614902820,1614902820,1614902821,'failured'),(10,'crud','[\"--force=1\",\"--table=glass_base_remark\",\"--controller=base\\/remark\"]','php think crud --force=1 --table=glass_base_remark --controller=base/remark','Build Successed',1614902904,1614902904,1614902904,'successed'),(11,'menu','[\"--controller=base\\/Remark\"]','php think menu --controller=base/Remark','Build Successed!',1614902932,1614902932,1614902933,'successed'),(12,'crud','[\"--force=1\",\"--table=glass_custom_type\",\"--controller=sale\\/customtype\"]','php think crud --force=1 --table=glass_custom_type --controller=sale/customtype','Build Successed',1614939315,1614939315,1614939316,'successed'),(13,'crud','[\"--force=1\",\"--table=glass_custom_info\",\"--controller=sale\\/custominfo\"]','php think crud --force=1 --table=glass_custom_info --controller=sale/custominfo','Build Successed',1614939331,1614939331,1614939331,'successed'),(14,'menu','[\"--controller=sale\\/Customtype\",\"--controller=sale\\/Custominfo\"]','php think menu --controller=sale/Customtype --controller=sale/Custominfo','Build Successed!',1614939345,1614939345,1614939346,'successed'),(15,'crud','[\"--force=1\",\"--table=glass_order_main\",\"--controller=sale\\/ordermain\"]','php think crud --force=1 --table=glass_order_main --controller=sale/ordermain','Build Successed',1614957372,1614957372,1614957372,'successed'),(16,'menu','[\"--controller=sale\\/Ordermain\"]','php think menu --controller=sale/Ordermain','Build Successed!',1614957388,1614957388,1614957389,'successed'),(17,'crud','[\"--force=1\",\"--table=glass_order_detail_temp\",\"--controller=sale\\/detailtemp\"]','php think crud --force=1 --table=glass_order_detail_temp --controller=sale/detailtemp','Build Successed',1615130504,1615130504,1615130504,'successed'),(18,'menu','[\"--controller=sale\\/Detailtemp\"]','php think menu --controller=sale/Detailtemp','Build Successed!',1615130523,1615130523,1615130524,'successed');
/*!40000 ALTER TABLE `glass_command` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glass_config`
--

DROP TABLE IF EXISTS `glass_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `glass_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '变量名',
  `group` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '分组',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text COLLATE utf8mb4_unicode_ci COMMENT '变量值',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '变量字典数据',
  `rule` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '扩展属性',
  `setting` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '配置',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='系统配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glass_config`
--

LOCK TABLES `glass_config` WRITE;
/*!40000 ALTER TABLE `glass_config` DISABLE KEYS */;
INSERT INTO `glass_config` VALUES (1,'name','basic','Site name','请填写站点名称','string','善易玻璃','','required','',''),(2,'beian','basic','Beian','粤ICP备15000000号-1','string','','','','',''),(3,'cdnurl','basic','Cdn url','如果全站静态资源使用第三方云储存请配置该值','string','','','','',''),(4,'version','basic','Version','如果静态资源有变动请重新配置该值','string','1.0.1','','required','',''),(5,'timezone','basic','Timezone','','string','Asia/Shanghai','','required','',''),(6,'forbiddenip','basic','Forbidden ip','一行一条记录','text','','','','',''),(7,'languages','basic','Languages','','array','{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}','','required','',''),(8,'fixedpage','basic','Fixed page','请尽量输入左侧菜单栏存在的链接','string','dashboard','','required','',''),(9,'categorytype','dictionary','Category type','','array','{\"default\":\"Default\",\"page\":\"Page\",\"article\":\"Article\",\"test\":\"Test\"}','','','',''),(10,'configgroup','dictionary','Config group','','array','{\"basic\":\"Basic\",\"email\":\"Email\",\"dictionary\":\"Dictionary\",\"user\":\"User\",\"example\":\"Example\"}','','','',''),(11,'mail_type','email','Mail type','选择邮件发送方式','select','1','[\"请选择\",\"SMTP\"]','','',''),(12,'mail_smtp_host','email','Mail smtp host','错误的配置发送邮件会导致服务器超时','string','smtp.qq.com','','','',''),(13,'mail_smtp_port','email','Mail smtp port','(不加密默认25,SSL默认465,TLS默认587)','string','465','','','',''),(14,'mail_smtp_user','email','Mail smtp user','（填写完整用户名）','string','10000','','','',''),(15,'mail_smtp_pass','email','Mail smtp password','（填写您的密码或授权码）','string','password','','','',''),(16,'mail_verify_type','email','Mail vertify type','（SMTP验证方式[推荐SSL]）','select','2','[\"无\",\"TLS\",\"SSL\"]','','',''),(17,'mail_from','email','Mail from','','string','10000@qq.com','','','','');
/*!40000 ALTER TABLE `glass_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glass_custom_info`
--

DROP TABLE IF EXISTS `glass_custom_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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

--
-- Table structure for table `glass_custom_type`
--

DROP TABLE IF EXISTS `glass_custom_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `glass_custom_type` (
  `custom_type_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '客户类型ID',
  `custom_type` varchar(45) NOT NULL COMMENT '客户类型',
  `custom_type_discount` double NOT NULL COMMENT '客户折扣',
  `company_id` int(10) DEFAULT NULL COMMENT '数据归属',
  PRIMARY KEY (`custom_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='客户类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glass_custom_type`
--

LOCK TABLES `glass_custom_type` WRITE;
/*!40000 ALTER TABLE `glass_custom_type` DISABLE KEYS */;
INSERT INTO `glass_custom_type` VALUES (1,'普通客户',100,0);
/*!40000 ALTER TABLE `glass_custom_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glass_ems`
--

DROP TABLE IF EXISTS `glass_ems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `glass_ems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '事件',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'IP',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='邮箱验证码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glass_ems`
--

LOCK TABLES `glass_ems` WRITE;
/*!40000 ALTER TABLE `glass_ems` DISABLE KEYS */;
/*!40000 ALTER TABLE `glass_ems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glass_ezprint`
--

DROP TABLE IF EXISTS `glass_ezprint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `glass_ezprint` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(255) DEFAULT NULL COMMENT '模板代码',
  `name` varchar(255) DEFAULT NULL COMMENT '模板名称',
  `content` longtext COMMENT '模板内容',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glass_ezprint`
--

LOCK TABLES `glass_ezprint` WRITE;
/*!40000 ALTER TABLE `glass_ezprint` DISABLE KEYS */;
INSERT INTO `glass_ezprint` VALUES (1,'list','列表示例','<p></p><p style=\"text-align: center; \">基本信息</p><table data-type=\"table\" class=\"table table-bordered\" style=\"text-align: center;\"><tbody><tr><td>姓名</td><td><p><a class=\"printVar\" data-field=\"nickname\" href=\"nickname\">{nickname}</a><br></p></td></tr><tr><td>邮箱</td><td><p><a class=\"printVar\" data-field=\"email\" href=\"email\">{email}</a><br></p></td></tr></tbody></table>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<p></p><p></p><table data-type=\"dataSource\" id=\"list\" class=\"table table-bordered\"><tbody><tr><td><p><a class=\"printTableVar\" data-field=\"name\" href=\"name\">[姓名]</a><br></p></td><td><p><a class=\"printTableVar\" data-field=\"email\" href=\"email\">[邮箱]</a><br></p></td><td><p><a class=\"printTableVar\" data-field=\"createtime\" href=\"createtime\">[创建时间]</a><br></p></td></tr></tbody></table><p style=\"text-align: center; \"><br></p><p></p>',1591189280,1593147426),(2,'hetong','合同','<p style=\"margin-bottom: 0px; padding: 5px 0px; font-family: tahoma, 微软雅黑; font-size: 16px;\"><a class=\"printVar\" data-field=\"company1\" href=\"company1\"><u><b>{company1}</b></u></a>公司（以下简称甲方）为统一和提高<a class=\"printVar\" data-field=\"company2\" href=\"company2\"><font color=\"#000000\" style=\"background-color: rgb(255, 0, 0);\"><u><b>{company2}</b></u></font></a>(以下简称乙方)的店面和产品形象。为乙方营造更好的销售环境，经双方协商，本着自愿、平等、互惠、互利的原则，达成如下协议：</p><p style=\"margin-bottom: 0px; padding: 5px 0px; font-family: tahoma, 微软雅黑; font-size: 16px; text-indent: 2em;\"><br style=\"text-indent: 0px;\"></p><p style=\"margin-bottom: 0px; padding: 5px 0px; font-family: tahoma, 微软雅黑; font-size: 16px;\">自协议签定之日，甲方负责为乙方提供店面整体设计及装修。装修内容包括：</p><p style=\"margin-bottom: 0px; padding: 5px 0px; font-family: tahoma, 微软雅黑; font-size: 16px; text-indent: 2em;\"><br style=\"text-indent: 0px;\"></p><p style=\"margin-bottom: 0px; padding: 5px 0px; font-family: tahoma, 微软雅黑; font-size: 16px;\">门头广告牌的设计、制作、安装;<br>产品形象墙的设计、制作、安装;<br>产品展示架的设计、制作、安装;<br>店内主体色调的制定、粉刷;<br>店内棚顶吊旗的设计、制作、安装;<br>甲方免费为乙方提供样板一套、安装工作服四套及各种证书和产品说明。</p><p style=\"margin-bottom: 0px; padding: 5px 0px; font-family: tahoma, 微软雅黑; font-size: 16px; text-indent: 2em;\"><br style=\"text-indent: 0px;\"></p><p style=\"margin-bottom: 0px; padding: 5px 0px; font-family: tahoma, 微软雅黑; font-size: 16px;\">自协议签订之日起，乙方需向甲方交纳装修保证金人民币<a class=\"printVar\" data-field=\"price\" href=\"price\">{price}</a>元整。</p><p style=\"margin-bottom: 0px; padding: 5px 0px; font-family: tahoma, 微软雅黑; font-size: 16px; text-indent: 2em;\"><br style=\"text-indent: 0px;\"></p><p style=\"margin-bottom: 0px; padding: 5px 0px; font-family: tahoma, 微软雅黑; font-size: 16px;\">乙方在协议签订之日起一年内不得兼营其它品牌或与甲方有冲突的产品，否则将扣除乙方的装修保证金。</p><p style=\"margin-bottom: 0px; padding: 5px 0px; font-family: tahoma, 微软雅黑; font-size: 16px; text-indent: 2em;\"><br style=\"text-indent: 0px;\"></p><p style=\"margin-bottom: 0px; padding: 5px 0px; font-family: tahoma, 微软雅黑; font-size: 16px;\">甲、乙双方合作满一年后，乙方能很好的维护甲方的产品形象，并无违约情况，甲方将如数返还乙方的装修保证金（返款方式以地板兑现）。</p><p style=\"margin-bottom: 0px; padding: 5px 0px; font-family: tahoma, 微软雅黑; font-size: 16px; text-indent: 2em;\"><br style=\"text-indent: 0px;\"></p><p style=\"margin-bottom: 0px; padding: 5px 0px; font-family: tahoma, 微软雅黑; font-size: 16px;\">本协议一式3份，甲方2份，乙方1份。<br>本协议修改由双方协商解决。<br>本协议自双方盖章之日起生效至年月日终止。</p><p style=\"margin-bottom: 0px; padding: 5px 0px; font-family: tahoma, 微软雅黑; font-size: 16px; text-indent: 2em;\"><br style=\"text-indent: 0px;\"></p><p style=\"margin-bottom: 0px; padding: 5px 0px; font-family: tahoma, 微软雅黑; font-size: 16px;\">甲&nbsp;&nbsp;方：&nbsp;&nbsp;&nbsp;<b><a class=\"printVar\" data-field=\"name1\" href=\"name1\">{name1}</a>&nbsp;</b>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 乙&nbsp;&nbsp;方：<a class=\"printVar\" data-field=\"name2\" href=\"name2\">{name2}</a><br>办公地址：&nbsp;&nbsp;&nbsp;<b><a class=\"printVar\" data-field=\"addr1\" href=\"addr1\">{addr1}</a>&nbsp;</b>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;办公地址：<a class=\"printVar\" data-field=\"addr2\" href=\"addr2\"><b>{addr2}</b></a><br>开户银行：&nbsp;&nbsp;&nbsp;<b>&nbsp;<a class=\"printVar\" data-field=\"bank1\" href=\"bank1\">{bank1}</a>&nbsp;&nbsp;&nbsp;</b>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 开户银行：<a class=\"printVar\" data-field=\"bank2\" href=\"bank2\"><b>{bank2}</b></a><br>代表人（签字）：&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 代表人（签字）：<br><br></p>',1592621691,1592665065);
/*!40000 ALTER TABLE `glass_ezprint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glass_ezprint_example`
--

DROP TABLE IF EXISTS `glass_ezprint_example`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `glass_ezprint_example` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `createtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glass_ezprint_example`
--

LOCK TABLES `glass_ezprint_example` WRITE;
/*!40000 ALTER TABLE `glass_ezprint_example` DISABLE KEYS */;
INSERT INTO `glass_ezprint_example` VALUES (1,'hetong','xuc2hao','test@qq.com',1592140816),(2,'cesi','昵称1','flow@qq.com',1592140816),(3,'bbbbb','人事专员','test@qq.com',1592140816),(4,'89707','89707','hrhr2@qq.com',1592140816),(5,'a','a','a',1592580662),(6,'b','b','b',1592580669),(7,'c','c','c',1592580677),(8,'d','d','d',1592580684),(9,'e','e','e',1592580692),(10,'f','f','f',1592580729),(11,'g','g','g',1592580737);
/*!40000 ALTER TABLE `glass_ezprint_example` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glass_order_detail`
--

DROP TABLE IF EXISTS `glass_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `glass_order_detail` (
  `detail_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '订单明细ID',
  `order_id` int(10) DEFAULT NULL COMMENT '订单ID',
  `detail_order_code` varchar(45) NOT NULL COMMENT '订单编号',
  `detail_datetime` date NOT NULL COMMENT '下单日期',
  `detail_delivery_date` date NOT NULL COMMENT '交货日期',
  `detail_isurgent` enum('0','1') NOT NULL COMMENT '是否加急:0=不加急,1=加急',
  `detail_custom_id` int(10) NOT NULL COMMENT '客户ID',
  `detail_custom_name` varchar(45) NOT NULL COMMENT '客户名称',
  `detail_no` int(3) DEFAULT NULL COMMENT '序号',
  `detail_product_name` varchar(45) NOT NULL COMMENT '产品名称',
  `detail_product_specs` varchar(45) NOT NULL COMMENT '产品规格',
  `detail_price` double NOT NULL COMMENT '单价',
  `detail_discount` double DEFAULT NULL COMMENT '折扣',
  `detail_useposition` varchar(45) DEFAULT NULL COMMENT '使用位置',
  `detail_long` double NOT NULL COMMENT '长(mm)',
  `detail_wide` double NOT NULL COMMENT '宽(mm)',
  `detail_number` int(10) NOT NULL COMMENT '数量',
  `detail_area` double NOT NULL COMMENT '面积',
  `detail_length` double DEFAULT NULL COMMENT '边长',
  `detail_hole` int(10) DEFAULT NULL COMMENT '打孔数量',
  `detail_amount` double DEFAULT NULL COMMENT '金额',
  `detail_remark` varchar(45) DEFAULT NULL,
  `detail_specification` varchar(45) DEFAULT NULL COMMENT '工艺要求',
  `detail_status` enum('0','1','2','3','4') DEFAULT NULL COMMENT '订单状态:0=接单,1=审核,2=派单,3=生产,4=发货',
  `company_id` varchar(45) DEFAULT NULL COMMENT '数据归属',
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glass_order_detail`
--

LOCK TABLES `glass_order_detail` WRITE;
/*!40000 ALTER TABLE `glass_order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `glass_order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glass_order_detail_temp`
--

DROP TABLE IF EXISTS `glass_order_detail_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `glass_order_detail_temp` (
  `detail_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '订单明细ID',
  `order_id` int(10) DEFAULT NULL COMMENT '订单ID',
  `detail_order_code` varchar(45) DEFAULT NULL COMMENT '订单编号',
  `detail_datetime` date NOT NULL COMMENT '下单日期',
  `detail_delivery_date` date NOT NULL COMMENT '交货日期',
  `detail_isurgent` enum('0','1') NOT NULL COMMENT '是否加急:0=不加急,1=加急',
  `detail_no` int(3) DEFAULT NULL COMMENT '序号',
  `detail_product_name` varchar(45) NOT NULL COMMENT '产品名称',
  `detail_product_specs` varchar(45) NOT NULL COMMENT '产品规格',
  `detail_price` double NOT NULL COMMENT '单价',
  `detail_discount` double DEFAULT NULL COMMENT '折扣',
  `detail_useposition` varchar(45) DEFAULT NULL COMMENT '使用位置',
  `detail_long` double NOT NULL COMMENT '长(mm)',
  `detail_wide` double NOT NULL COMMENT '宽(mm)',
  `detail_number` int(10) NOT NULL COMMENT '数量',
  `detail_area` double NOT NULL COMMENT '面积',
  `detail_length` double DEFAULT NULL COMMENT '边长',
  `detail_hole` int(10) DEFAULT NULL COMMENT '打孔数量',
  `detail_amount` double DEFAULT NULL COMMENT '金额',
  `detail_remark` varchar(45) DEFAULT NULL,
  `detail_specification` varchar(45) DEFAULT NULL COMMENT '工艺要求',
  `company_id` varchar(45) DEFAULT NULL COMMENT '数据归属',
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='订单明细表临时表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glass_order_detail_temp`
--

LOCK TABLES `glass_order_detail_temp` WRITE;
/*!40000 ALTER TABLE `glass_order_detail_temp` DISABLE KEYS */;
INSERT INTO `glass_order_detail_temp` VALUES (1,NULL,NULL,'2021-03-10','2021-03-10','0',NULL,'123','222',333,222,'222',222,222,222,222222,2222,2222,222,'打孔见图纸','平四边','0'),(2,NULL,NULL,'2021-03-10','2021-03-10','0',NULL,'12','33',33,3,'3',3,3,3,3,3,33,3,'打孔见图纸','平四边','0'),(3,NULL,NULL,'2021-03-10','2021-03-10','0',NULL,'1','',0,0,'',0,0,0,0,0,0,0,'','','0'),(4,NULL,NULL,'2021-03-10','2021-03-10','0',NULL,'22','',0,0,'',0,0,0,0,0,0,0,'','','0'),(5,NULL,NULL,'2021-03-10','2021-03-10','0',NULL,'33','',0,0,'',0,0,0,0,0,0,0,'','','0');
/*!40000 ALTER TABLE `glass_order_detail_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glass_order_main`
--

DROP TABLE IF EXISTS `glass_order_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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

--
-- Table structure for table `glass_order_main_temp`
--

DROP TABLE IF EXISTS `glass_order_main_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `glass_order_main_temp` (
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
  `company_id` varchar(45) DEFAULT NULL COMMENT '数据归属',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单主表临时表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glass_order_main_temp`
--

LOCK TABLES `glass_order_main_temp` WRITE;
/*!40000 ALTER TABLE `glass_order_main_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `glass_order_main_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glass_sms`
--

DROP TABLE IF EXISTS `glass_sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `glass_sms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '事件',
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '手机号',
  `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'IP',
  `createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='短信验证码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glass_sms`
--

LOCK TABLES `glass_sms` WRITE;
/*!40000 ALTER TABLE `glass_sms` DISABLE KEYS */;
/*!40000 ALTER TABLE `glass_sms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glass_test`
--

DROP TABLE IF EXISTS `glass_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `glass_test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID(单选)',
  `category_ids` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类ID(多选)',
  `week` enum('monday','tuesday','wednesday') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '星期(单选):monday=星期一,tuesday=星期二,wednesday=星期三',
  `flag` set('hot','index','recommend') COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '标志(多选):hot=热门,index=首页,recommend=推荐',
  `genderdata` enum('male','female') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'male' COMMENT '性别(单选):male=男,female=女',
  `hobbydata` set('music','reading','swimming') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '爱好(多选):music=音乐,reading=读书,swimming=游泳',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '标题',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '图片',
  `images` varchar(1500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '图片组',
  `attachfile` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '附件',
  `keywords` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '关键字',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '描述',
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '省市',
  `json` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '配置:key=名称,value=值',
  `price` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击',
  `startdate` date DEFAULT NULL COMMENT '开始日期',
  `activitytime` datetime DEFAULT NULL COMMENT '活动时间(datetime)',
  `year` year(4) DEFAULT NULL COMMENT '年',
  `times` time DEFAULT NULL COMMENT '时间',
  `refreshtime` int(10) DEFAULT NULL COMMENT '刷新时间(int)',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(10) DEFAULT NULL COMMENT '删除时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `switch` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开关',
  `status` enum('normal','hidden') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal' COMMENT '状态',
  `state` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '状态值:0=禁用,1=正常,2=推荐',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='测试表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glass_test`
--

LOCK TABLES `glass_test` WRITE;
/*!40000 ALTER TABLE `glass_test` DISABLE KEYS */;
INSERT INTO `glass_test` VALUES (1,0,12,'12,13','monday','hot,index','male','music,reading','我是一篇测试文章','<p>我是测试内容</p>','/assets/img/avatar.png','/assets/img/avatar.png,/assets/img/qrcode.png','/assets/img/avatar.png','关键字','描述','广西壮族自治区/百色市/平果县','{\"a\":\"1\",\"b\":\"2\"}',0.00,0,'2017-07-10','2017-07-10 18:24:45',2017,'18:24:45',1499682285,1499682526,1499682526,NULL,0,1,'normal','1');
/*!40000 ALTER TABLE `glass_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glass_user`
--

DROP TABLE IF EXISTS `glass_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `glass_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '组别ID',
  `username` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '昵称',
  `password` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '密码',
  `salt` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '密码盐',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '手机号',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '头像',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '等级',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `bio` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '格言',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '积分',
  `successions` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '连续登录天数',
  `maxsuccessions` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '最大连续登录天数',
  `prevtime` int(10) DEFAULT NULL COMMENT '上次登录时间',
  `logintime` int(10) DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '登录IP',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `joinip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '加入IP',
  `jointime` int(10) DEFAULT NULL COMMENT '加入时间',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'Token',
  `status` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '状态',
  `verification` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '验证',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glass_user`
--

LOCK TABLES `glass_user` WRITE;
/*!40000 ALTER TABLE `glass_user` DISABLE KEYS */;
INSERT INTO `glass_user` VALUES (1,1,'admin','admin','8cc93afd58449378018ec662d91aa6c6','c37dd5','admin@163.com','13888888888','',0,0,'2017-04-15','',0.00,0,1,1,1516170492,1516171614,'127.0.0.1',0,'127.0.0.1',1491461418,0,1516171614,'','normal','');
/*!40000 ALTER TABLE `glass_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glass_user_group`
--

DROP TABLE IF EXISTS `glass_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `glass_user_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '组名',
  `rules` text COLLATE utf8mb4_unicode_ci COMMENT '权限节点',
  `createtime` int(10) DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glass_user_group`
--

LOCK TABLES `glass_user_group` WRITE;
/*!40000 ALTER TABLE `glass_user_group` DISABLE KEYS */;
INSERT INTO `glass_user_group` VALUES (1,'默认组','1,2,3,4,5,6,7,8,9,10,11,12',1515386468,1516168298,'normal');
/*!40000 ALTER TABLE `glass_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glass_user_money_log`
--

DROP TABLE IF EXISTS `glass_user_money_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `glass_user_money_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更余额',
  `before` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更前余额',
  `after` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更后余额',
  `memo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员余额变动表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glass_user_money_log`
--

LOCK TABLES `glass_user_money_log` WRITE;
/*!40000 ALTER TABLE `glass_user_money_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `glass_user_money_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glass_user_rule`
--

DROP TABLE IF EXISTS `glass_user_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `glass_user_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT NULL COMMENT '父ID',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '标题',
  `remark` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `ismenu` tinyint(1) DEFAULT NULL COMMENT '是否菜单',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) DEFAULT '0' COMMENT '权重',
  `status` enum('normal','hidden') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员规则表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glass_user_rule`
--

LOCK TABLES `glass_user_rule` WRITE;
/*!40000 ALTER TABLE `glass_user_rule` DISABLE KEYS */;
INSERT INTO `glass_user_rule` VALUES (1,0,'index','Frontend','',1,1516168079,1516168079,1,'normal'),(2,0,'api','API Interface','',1,1516168062,1516168062,2,'normal'),(3,1,'user','User Module','',1,1515386221,1516168103,12,'normal'),(4,2,'user','User Module','',1,1515386221,1516168092,11,'normal'),(5,3,'index/user/login','Login','',0,1515386247,1515386247,5,'normal'),(6,3,'index/user/register','Register','',0,1515386262,1516015236,7,'normal'),(7,3,'index/user/index','User Center','',0,1516015012,1516015012,9,'normal'),(8,3,'index/user/profile','Profile','',0,1516015012,1516015012,4,'normal'),(9,4,'api/user/login','Login','',0,1515386247,1515386247,6,'normal'),(10,4,'api/user/register','Register','',0,1515386262,1516015236,8,'normal'),(11,4,'api/user/index','User Center','',0,1516015012,1516015012,10,'normal'),(12,4,'api/user/profile','Profile','',0,1516015012,1516015012,3,'normal');
/*!40000 ALTER TABLE `glass_user_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glass_user_score_log`
--

DROP TABLE IF EXISTS `glass_user_score_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `glass_user_score_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '变更积分',
  `before` int(10) NOT NULL DEFAULT '0' COMMENT '变更前积分',
  `after` int(10) NOT NULL DEFAULT '0' COMMENT '变更后积分',
  `memo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员积分变动表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glass_user_score_log`
--

LOCK TABLES `glass_user_score_log` WRITE;
/*!40000 ALTER TABLE `glass_user_score_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `glass_user_score_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glass_user_token`
--

DROP TABLE IF EXISTS `glass_user_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `glass_user_token` (
  `token` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Token',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `expiretime` int(10) DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员Token表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glass_user_token`
--

LOCK TABLES `glass_user_token` WRITE;
/*!40000 ALTER TABLE `glass_user_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `glass_user_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glass_version`
--

DROP TABLE IF EXISTS `glass_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `glass_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `oldversion` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '旧版本号',
  `newversion` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '新版本号',
  `packagesize` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '包大小',
  `content` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '升级内容',
  `downloadurl` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '下载地址',
  `enforce` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '强制更新',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='版本表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glass_version`
--

LOCK TABLES `glass_version` WRITE;
/*!40000 ALTER TABLE `glass_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `glass_version` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-11  7:51:29
