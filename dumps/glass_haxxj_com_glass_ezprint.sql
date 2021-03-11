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
-- Table structure for table `glass_ezprint`
--

DROP TABLE IF EXISTS `glass_ezprint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-06  8:56:20
