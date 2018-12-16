/*
SQLyog Ultimate v8.6 Beta2
MySQL - 5.6.12-log : Database - db14_0_tha_offices_2016
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db14_0_tha_offices_2016` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db14_0_tha_offices_2016`;

/*Table structure for table `ajax_chat_bans` */

DROP TABLE IF EXISTS `ajax_chat_bans`;

CREATE TABLE `ajax_chat_bans` (
  `userID` int(11) NOT NULL,
  `userName` varchar(64) COLLATE utf8_bin NOT NULL,
  `dateTime` datetime NOT NULL,
  `ip` varbinary(16) NOT NULL,
  PRIMARY KEY (`userID`),
  KEY `userName` (`userName`),
  KEY `dateTime` (`dateTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ajax_chat_bans` */

/*Table structure for table `ajax_chat_invitations` */

DROP TABLE IF EXISTS `ajax_chat_invitations`;

CREATE TABLE `ajax_chat_invitations` (
  `userID` int(11) NOT NULL,
  `channel` int(11) NOT NULL,
  `dateTime` datetime NOT NULL,
  PRIMARY KEY (`userID`,`channel`),
  KEY `dateTime` (`dateTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ajax_chat_invitations` */

/*Table structure for table `ajax_chat_messages` */

DROP TABLE IF EXISTS `ajax_chat_messages`;

CREATE TABLE `ajax_chat_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `userName` varchar(64) COLLATE utf8_bin NOT NULL,
  `userRole` int(1) NOT NULL,
  `channel` int(11) NOT NULL,
  `dateTime` datetime NOT NULL,
  `ip` varbinary(16) NOT NULL,
  `text` text COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  KEY `message_condition` (`id`,`channel`,`dateTime`),
  KEY `dateTime` (`dateTime`)
) ENGINE=InnoDB AUTO_INCREMENT=427 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ajax_chat_messages` */

insert  into `ajax_chat_messages`(`id`,`userID`,`userName`,`userRole`,`channel`,`dateTime`,`ip`,`text`) values (1,2147483647,'ChatBot',4,0,'2013-03-19 17:38:22','\0\0','/login user'),(2,3,'user',1,0,'2013-03-19 17:38:40','\0\0','hello'),(3,3,'user',1,0,'2013-03-19 17:38:49','\0\0',';)'),(4,2147483647,'ChatBot',4,1000000003,'2013-03-19 17:39:34','\0\0','/who user'),(5,2147483647,'ChatBot',4,0,'2013-03-19 17:41:01','\0\0','/logout user'),(6,2147483647,'ChatBot',4,0,'2013-03-19 17:41:06','\0\0','/login admin'),(7,2147483647,'ChatBot',4,1000000001,'2013-03-19 17:41:14','\0\0','/list Public Private [admin]'),(8,2147483647,'ChatBot',4,0,'2013-03-19 17:41:22','\0\0','/channelLeave admin'),(9,2147483647,'ChatBot',4,500000001,'2013-03-19 17:41:22','\0\0','/channelEnter admin'),(10,2147483647,'ChatBot',4,1000000001,'2013-03-19 17:41:24','\0\0','/bansEmpty -'),(11,2147483647,'ChatBot',4,500000001,'2013-03-19 21:06:19','\0\0','/channelLeave admin'),(12,2147483647,'ChatBot',4,0,'2013-03-19 21:06:19','\0\0','/channelEnter admin'),(13,2147483647,'ChatBot',4,0,'2013-03-19 22:33:34','\0\0','/logout admin'),(14,2147483647,'ChatBot',4,0,'2013-03-19 22:46:07','\0\0','/login admin'),(15,2147483647,'ChatBot',4,0,'2013-03-19 22:52:47','\0\0','/logout admin'),(16,2147483647,'ChatBot',4,0,'2013-03-19 22:52:57','\0\0','/login admin'),(17,2147483647,'ChatBot',4,1000000001,'2013-03-19 22:54:26','\0\0','/who admin'),(18,2147483647,'ChatBot',4,0,'2013-03-19 23:08:57','\0\0','/logout admin'),(19,2147483647,'ChatBot',4,0,'2013-03-19 23:11:29','\0\0','/login admin'),(20,2147483647,'ChatBot',4,0,'2013-03-19 23:12:59','\0\0','/logout admin'),(21,2147483647,'ChatBot',4,0,'2013-03-19 23:13:06','\0\0','/login admin'),(22,2147483647,'ChatBot',4,0,'2013-03-19 23:13:21','\0\0','/logout admin'),(23,2147483647,'ChatBot',4,0,'2013-03-19 23:13:26','\0\0','/login admin'),(24,2147483647,'ChatBot',4,0,'2013-03-19 23:37:17','\0\0','/logout admin'),(25,2147483647,'ChatBot',4,0,'2013-03-19 23:37:21','\0\0','/login admin'),(26,2147483647,'ChatBot',4,1000000001,'2013-03-19 23:37:34','\0\0','/list Public Private [admin]'),(27,2147483647,'ChatBot',4,0,'2013-03-19 23:37:36','\0\0','/channelLeave admin'),(28,2147483647,'ChatBot',4,500000001,'2013-03-19 23:37:36','\0\0','/channelEnter admin'),(29,2147483647,'ChatBot',4,500000001,'2013-03-19 23:37:46','\0\0','/channelLeave admin'),(30,2147483647,'ChatBot',4,1,'2013-03-19 23:37:46','\0\0','/channelEnter admin'),(31,2147483647,'ChatBot',4,1,'2013-03-19 23:37:48','\0\0','/channelLeave admin'),(32,2147483647,'ChatBot',4,0,'2013-03-19 23:37:48','\0\0','/channelEnter admin'),(34,2147483647,'ChatBot',4,0,'2013-03-19 23:39:39','\0\0','/login admin'),(35,1,'admin',3,0,'2013-03-19 23:42:02','\0\0','sdfasdfsd'),(36,2147483647,'ChatBot',4,0,'2013-03-19 23:43:56','\0\0','/logout admin Timeout'),(37,2147483647,'ChatBot',4,0,'2013-03-19 23:43:57','\0\0','/login admin'),(38,2147483647,'ChatBot',4,1000000001,'2013-03-19 23:44:12','\0\0','/who admin'),(39,2147483647,'ChatBot',4,0,'2013-03-19 23:44:37','\0\0','/nick admin (meomeuop)'),(40,1,'(meomeuop)',3,0,'2013-03-19 23:44:46','\0\0','amdsfhaksjdga'),(41,2147483647,'ChatBot',4,0,'2013-03-19 23:44:51','\0\0','/logout (meomeuop)'),(42,2147483647,'ChatBot',4,0,'2013-03-19 23:44:56','\0\0','/login admin'),(43,2147483647,'ChatBot',4,0,'2013-03-19 23:45:02','\0\0','/delete 33'),(44,2147483647,'ChatBot',4,0,'2013-03-19 23:45:22','\0\0','/channelLeave admin'),(45,2147483647,'ChatBot',4,500000001,'2013-03-19 23:45:22','\0\0','/channelEnter admin'),(46,2147483647,'ChatBot',4,500000001,'2013-03-19 23:45:33','\0\0','/channelLeave admin'),(47,2147483647,'ChatBot',4,1,'2013-03-19 23:45:33','\0\0','/channelEnter admin'),(48,1,'admin',3,1,'2013-03-19 23:45:37','\0\0',':D'),(49,2147483647,'ChatBot',4,1000000001,'2013-03-19 23:46:19','\0\0','/error UnknownCommand /ThoÃ¡t'),(50,2147483647,'ChatBot',4,1000000001,'2013-03-19 23:46:26','\0\0','/error UnknownCommand /ThoÃ¡t'),(52,1,'admin',3,1,'2013-03-19 23:46:47','\0\0',':error:'),(53,1,'admin',3,1,'2013-03-19 23:46:50','\0\0',':favorite:'),(54,1,'admin',3,1,'2013-03-19 23:46:52','\0\0',':warning:'),(55,1,'admin',3,1,'2013-03-19 23:46:55','\0\0','O:-D'),(56,1,'admin',3,1,'2013-03-19 23:46:58','\0\0',':help:'),(57,1,'admin',3,1,'2013-03-19 23:47:00','\0\0',':important:'),(58,1,'admin',3,1,'2013-03-19 23:47:15','\0\0','[quote]hehe[/quote]'),(59,1,'admin',3,1,'2013-03-19 23:47:20','\0\0','[u]Ã¡dasd[/u]'),(60,1,'admin',3,1,'2013-03-19 23:47:24','\0\0','[i]dfsdf[/i]'),(61,1,'admin',3,1,'2013-03-19 23:47:27','\0\0','[b]dsfsdf[/b]'),(62,1,'admin',3,1,'2013-03-19 23:47:37','\0\0','[url=http://dantri.com.vn][/url]'),(63,1,'admin',3,1,'2013-03-19 23:48:08','\0\0','[url=http://dantri.com.vn]dantri[/url]'),(64,2147483647,'ChatBot',4,1000000001,'2013-03-19 23:48:41','\0\0','/delete 51'),(65,2147483647,'ChatBot',4,1,'2013-03-19 23:49:06','\0\0','/logout admin'),(66,2147483647,'ChatBot',4,0,'2013-03-19 23:57:25','\0\0','/login admin'),(67,2147483647,'ChatBot',4,0,'2013-03-19 23:57:34','\0\0','/logout admin'),(68,2147483647,'ChatBot',4,0,'2013-03-19 23:57:42','\0\0','/login ngalt'),(69,10,'ngalt',0,0,'2013-03-19 23:57:49','\0\0','hello'),(70,2147483647,'ChatBot',4,0,'2013-03-19 23:59:28','\0\0','/logout ngalt'),(71,2147483647,'ChatBot',4,0,'2013-03-19 23:59:34','\0\0','/login admin'),(72,2147483647,'ChatBot',4,0,'2013-03-19 23:59:43','\0\0','/logout admin'),(73,2147483647,'ChatBot',4,0,'2013-03-19 23:59:48','\0\0','/login ngalt'),(74,2147483647,'ChatBot',4,0,'2013-03-20 00:00:22','\0\0','/logout ngalt'),(75,2147483647,'ChatBot',4,0,'2013-03-20 00:00:26','\0\0','/login admin'),(76,2147483647,'ChatBot',4,0,'2013-03-20 00:05:00','\0\0','/login ngalt'),(77,10,'ngalt',0,1000000010,'2013-03-20 00:05:19','\0\0','/privmsgto admin hello admin'),(78,10,'ngalt',0,1000000000,'2013-03-20 00:05:19','\0\0','/privmsg hello admin'),(79,0,'admin',3,0,'2013-03-20 00:05:34','\0\0','hello con khá»‰'),(80,2147483647,'ChatBot',4,1000000010,'2013-03-20 00:05:52','\0\0','/queryOpen admin'),(81,10,'ngalt',0,1000000010,'2013-03-20 00:06:03','\0\0','/privmsgto admin tháº±ng Ä‘iÃªn'),(82,10,'ngalt',0,1000000000,'2013-03-20 00:06:03','\0\0','/privmsg tháº±ng Ä‘iÃªn'),(83,0,'admin',3,0,'2013-03-20 00:06:15','\0\0','dá»Ÿ hÆ¡i'),(84,2147483647,'ChatBot',4,0,'2013-03-20 08:08:31','\0\0','/logout admin Timeout'),(85,2147483647,'ChatBot',4,0,'2013-03-20 08:08:31','\0\0','/logout ngalt Timeout'),(86,2147483647,'ChatBot',4,0,'2013-03-20 08:08:32','\0\0','/login admin'),(87,2147483647,'ChatBot',4,0,'2013-03-20 08:11:23','\0\0','/roll admin 1d6 6'),(88,0,'admin',3,0,'2013-03-20 08:11:56','\0\0',':P'),(89,0,'admin',3,0,'2013-03-20 08:12:00','\0\0',':-*'),(90,0,'admin',3,0,'2013-03-20 08:12:27','\0\0',':-('),(91,0,'admin',3,0,'2013-03-20 08:12:29','\0\0',':('),(92,0,'admin',3,0,'2013-03-20 08:26:57','\0\0','O:-D'),(93,2147483647,'ChatBot',4,0,'2013-03-20 08:39:28','\0\0','/logout admin Timeout'),(94,2147483647,'ChatBot',4,0,'2013-03-20 08:39:29','\0\0','/login admin'),(95,2147483647,'ChatBot',4,0,'2013-03-20 08:46:00','\0\0','/logout admin Timeout'),(96,2147483647,'ChatBot',4,0,'2013-03-20 08:46:00','\0\0','/login admin'),(97,0,'admin',3,0,'2013-03-20 08:46:04','\0\0','O:-D'),(98,2147483647,'ChatBot',4,0,'2013-03-20 09:02:46','\0\0','/logout admin Timeout'),(99,2147483647,'ChatBot',4,0,'2013-03-20 09:02:46','\0\0','/login admin'),(100,2147483647,'ChatBot',4,0,'2013-03-20 09:09:02','\0\0','/logout admin Timeout'),(101,2147483647,'ChatBot',4,0,'2013-03-20 09:09:03','\0\0','/login admin'),(102,2147483647,'ChatBot',4,0,'2013-03-20 09:13:07','\0\0','/logout admin Timeout'),(103,2147483647,'ChatBot',4,0,'2013-03-20 09:13:08','\0\0','/login admin'),(104,2147483647,'ChatBot',4,0,'2013-03-20 09:24:31','\0\0','/logout admin Timeout'),(105,2147483647,'ChatBot',4,0,'2013-03-20 09:24:32','\0\0','/login admin'),(106,2147483647,'ChatBot',4,0,'2013-03-20 09:33:31','\0\0','/logout admin Timeout'),(107,2147483647,'ChatBot',4,0,'2013-03-20 09:33:31','\0\0','/login admin'),(108,2147483647,'ChatBot',4,0,'2013-03-20 09:35:24','\0\0','/logout admin Timeout'),(109,2147483647,'ChatBot',4,0,'2013-03-20 09:35:25','\0\0','/login admin'),(110,2147483647,'ChatBot',4,0,'2013-03-20 09:40:34','\0\0','/logout admin'),(111,2147483647,'ChatBot',4,0,'2013-03-20 09:40:41','\0\0','/login admin'),(112,2147483647,'ChatBot',4,0,'2013-03-20 09:40:43','\0\0','/logout admin'),(113,2147483647,'ChatBot',4,0,'2013-03-20 09:42:11','\0\0','/login admin'),(114,2147483647,'ChatBot',4,0,'2013-03-20 09:43:43','\0\0','/logout admin'),(115,2147483647,'ChatBot',4,0,'2013-03-20 09:48:58','\0\0','/login admin'),(116,2147483647,'ChatBot',4,0,'2013-03-20 10:02:16','\0\0','/logout admin Timeout'),(117,2147483647,'ChatBot',4,0,'2013-03-20 10:02:16','\0\0','/login admin'),(118,0,'admin',3,0,'2013-03-20 10:04:06','\0\0','adads]'),(119,2147483647,'ChatBot',4,0,'2013-03-20 10:14:08','\0\0','/logout admin Timeout'),(120,2147483647,'ChatBot',4,0,'2013-03-20 10:14:09','\0\0','/login admin'),(121,2147483647,'ChatBot',4,0,'2013-03-20 10:21:20','\0\0','/logout admin Timeout'),(122,2147483647,'ChatBot',4,0,'2013-03-20 10:21:20','\0\0','/login admin'),(123,2147483647,'ChatBot',4,0,'2013-03-20 10:21:51','\0\0','/logout admin Timeout'),(124,2147483647,'ChatBot',4,0,'2013-03-20 10:21:52','\0\0','/login admin'),(125,2147483647,'ChatBot',4,0,'2013-03-20 10:25:38','\0\0','/logout admin Timeout'),(126,2147483647,'ChatBot',4,0,'2013-03-20 10:25:39','\0\0','/login admin'),(127,2147483647,'ChatBot',4,0,'2013-03-20 10:29:19','\0\0','/logout admin Timeout'),(128,2147483647,'ChatBot',4,0,'2013-03-20 10:29:19','\0\0','/login admin'),(129,0,'admin',3,0,'2013-03-20 10:35:18','\0\0',':-/'),(130,0,'admin',3,0,'2013-03-20 10:40:06','\0\0','[quote]dgdgdf[/quote]'),(131,0,'admin',3,0,'2013-03-20 10:40:20','\0\0','[color=teal]qÆ°eqweq[/color]'),(132,2147483647,'ChatBot',4,0,'2013-03-20 10:42:42','\0\0','/logout admin Timeout'),(133,2147483647,'ChatBot',4,0,'2013-03-20 10:42:42','\0\0','/login admin'),(134,2147483647,'ChatBot',4,0,'2013-03-20 10:55:51','\0\0','/roll admin 1d6 4'),(135,2147483647,'ChatBot',4,0,'2013-03-20 10:55:57','\0\0','/roll admin 1d6 6'),(136,2147483647,'ChatBot',4,0,'2013-03-20 10:56:02','\0\0','/roll admin 1d6 5'),(137,2147483647,'ChatBot',4,0,'2013-03-20 11:00:15','��l','/login hiennn'),(138,2147483647,'ChatBot',4,0,'2013-03-20 11:00:27','��l','/channelLeave hiennn'),(139,2147483647,'ChatBot',4,1,'2013-03-20 11:00:27','��l','/channelEnter hiennn'),(140,2147483647,'ChatBot',4,1,'2013-03-20 11:00:40','��l','/channelLeave hiennn'),(141,2147483647,'ChatBot',4,0,'2013-03-20 11:00:40','��l','/channelEnter hiennn'),(142,2147483647,'ChatBot',4,0,'2013-03-20 11:00:45','��l','/channelLeave hiennn'),(143,2147483647,'ChatBot',4,1,'2013-03-20 11:00:45','��l','/channelEnter hiennn'),(144,2147483647,'ChatBot',4,0,'2013-03-20 11:01:04','\0\0','/channelLeave admin'),(145,2147483647,'ChatBot',4,1,'2013-03-20 11:01:04','\0\0','/channelEnter admin'),(146,0,'admin',3,1000000000,'2013-03-20 11:01:14','\0\0','/privmsgto hiennn Ãª'),(147,0,'admin',3,1000000005,'2013-03-20 11:01:14','\0\0','/privmsg Ãª'),(148,5,'hiennn',0,1,'2013-03-20 11:01:20','��l','85'),(149,2147483647,'ChatBot',4,0,'2013-03-20 11:03:35','��h','/login hainx'),(150,2147483647,'ChatBot',4,0,'2013-03-20 11:03:39','��h','/channelLeave hainx'),(151,2147483647,'ChatBot',4,1,'2013-03-20 11:03:39','��h','/channelEnter hainx'),(152,2147483647,'ChatBot',4,1000000006,'2013-03-20 11:04:01','��h','/queryOpen hiennn'),(153,6,'hainx',0,1000000006,'2013-03-20 11:04:10','��h','/privmsgto hiennn hdhasdaskd'),(154,6,'hainx',0,1000000005,'2013-03-20 11:04:10','��h','/privmsg hdhasdaskd'),(155,2147483647,'ChatBot',4,0,'2013-03-20 11:04:58','��l','/login ngalt'),(156,2147483647,'ChatBot',4,0,'2013-03-20 11:05:02','��l','/channelLeave ngalt'),(157,2147483647,'ChatBot',4,1,'2013-03-20 11:05:02','��l','/channelEnter ngalt'),(158,2147483647,'ChatBot',4,1000000010,'2013-03-20 11:05:13','��l','/queryOpen hiennn'),(159,10,'ngalt',0,1000000010,'2013-03-20 11:05:18','��l','/privmsgto hiennn gklhgjk'),(160,10,'ngalt',0,1000000005,'2013-03-20 11:05:18','��l','/privmsg gklhgjk'),(161,6,'hainx',0,1000000006,'2013-03-20 11:05:21','��h','/privmsgto hiennn >:D<'),(162,6,'hainx',0,1000000005,'2013-03-20 11:05:21','��h','/privmsg >:D<'),(163,2147483647,'ChatBot',4,1000000010,'2013-03-20 11:05:22','��l','/queryClose hiennn'),(164,2147483647,'ChatBot',4,1000000010,'2013-03-20 11:05:22','��l','/queryOpen hiennn'),(165,10,'ngalt',0,1000000010,'2013-03-20 11:05:25','��l','/privmsgto hiennn dfgdsgfd'),(166,10,'ngalt',0,1000000005,'2013-03-20 11:05:25','��l','/privmsg dfgdsgfd'),(167,6,'hainx',0,1000000006,'2013-03-20 11:05:29','��h','/privmsgto hiennn >:D<'),(168,6,'hainx',0,1000000005,'2013-03-20 11:05:29','��h','/privmsg >:D<'),(169,0,'admin',3,1,'2013-03-20 11:05:35','\0\0',':x'),(170,10,'ngalt',0,1000000010,'2013-03-20 11:05:36','��l','/privmsgto hiennn yeu'),(171,10,'ngalt',0,1000000005,'2013-03-20 11:05:36','��l','/privmsg yeu'),(172,0,'admin',3,1,'2013-03-20 11:05:44','\0\0','>:D<'),(173,10,'ngalt',0,1000000010,'2013-03-20 11:05:46','��l','/privmsgto hiennn :)'),(174,10,'ngalt',0,1000000005,'2013-03-20 11:05:46','��l','/privmsg :)'),(175,10,'ngalt',0,1000000010,'2013-03-20 11:05:50','��l','/privmsgto hiennn :('),(176,10,'ngalt',0,1000000005,'2013-03-20 11:05:50','��l','/privmsg :('),(177,6,'hainx',0,1000000006,'2013-03-20 11:05:57','��h','/privmsgto hiennn 8->'),(178,6,'hainx',0,1000000005,'2013-03-20 11:05:57','��h','/privmsg 8->'),(179,6,'hainx',0,1000000006,'2013-03-20 11:06:03','��h','/privmsgto hiennn :O)'),(180,6,'hainx',0,1000000005,'2013-03-20 11:06:03','��h','/privmsg :O)'),(181,6,'hainx',0,1000000006,'2013-03-20 11:06:06','��h','/privmsgto hiennn :))'),(182,6,'hainx',0,1000000005,'2013-03-20 11:06:06','��h','/privmsg :))'),(183,2147483647,'ChatBot',4,1000000006,'2013-03-20 11:06:16','��h','/queryClose hiennn'),(184,2147483647,'ChatBot',4,1000000006,'2013-03-20 11:06:16','��h','/queryOpen ngalt'),(185,6,'hainx',0,1000000006,'2013-03-20 11:06:19','��h','/privmsgto ngalt oke'),(186,6,'hainx',0,1000000010,'2013-03-20 11:06:19','��h','/privmsg oke'),(187,0,'admin',3,1,'2013-03-20 11:06:30','\0\0','>:D<'),(188,0,'admin',3,1,'2013-03-20 11:06:48','\0\0',':-t'),(189,2147483647,'ChatBot',4,1000000000,'2013-03-20 11:07:41','\0\0','/queryOpen hiennn'),(190,0,'admin',3,1000000000,'2013-03-20 11:07:45','\0\0','/privmsgto hiennn heloo'),(191,0,'admin',3,1000000005,'2013-03-20 11:07:45','\0\0','/privmsg heloo'),(192,2147483647,'ChatBot',4,1000000000,'2013-03-20 11:08:03','\0\0','/queryClose hiennn'),(193,2147483647,'ChatBot',4,1000000000,'2013-03-20 11:08:03','\0\0','/queryOpen hainx'),(194,0,'admin',3,1000000000,'2013-03-20 11:08:10','\0\0','/privmsgto hainx hehe'),(195,0,'admin',3,1000000006,'2013-03-20 11:08:10','\0\0','/privmsg hehe'),(196,2147483647,'ChatBot',4,1,'2013-03-20 11:12:57','\0\0','/logout hiennn Timeout'),(197,2147483647,'ChatBot',4,1,'2013-03-20 11:12:57','\0\0','/logout hainx Timeout'),(198,2147483647,'ChatBot',4,1,'2013-03-20 11:12:57','\0\0','/logout ngalt Timeout'),(199,2147483647,'ChatBot',4,1000000000,'2013-03-20 11:15:17','\0\0','/queryClose hainx'),(200,0,'admin',3,1,'2013-03-20 11:15:18','\0\0',':('),(201,0,'admin',3,1,'2013-03-20 11:15:19','\0\0',';)'),(202,0,'admin',3,1,'2013-03-20 11:15:22','\0\0',':)'),(203,0,'admin',3,1,'2013-03-20 11:15:24','\0\0',':D'),(204,0,'admin',3,1,'2013-03-20 11:15:25','\0\0',';;)'),(205,0,'admin',3,1,'2013-03-20 11:15:26','\0\0','>:D<'),(206,0,'admin',3,1,'2013-03-20 11:15:33','\0\0',':-/'),(207,0,'admin',3,1,'2013-03-20 11:15:35','\0\0',':x'),(208,0,'admin',3,1,'2013-03-20 11:15:36','\0\0',':\">'),(209,0,'admin',3,1,'2013-03-20 11:15:36','\0\0',':P'),(210,0,'admin',3,1,'2013-03-20 11:15:37','\0\0',':*'),(211,0,'admin',3,1,'2013-03-20 11:15:38','\0\0','=(('),(212,0,'admin',3,1,'2013-03-20 11:15:39','\0\0',':-O'),(213,0,'admin',3,1,'2013-03-20 11:15:40','\0\0','X('),(214,0,'admin',3,1,'2013-03-20 11:15:41','\0\0',':>'),(215,0,'admin',3,1,'2013-03-20 11:15:42','\0\0','B-)'),(216,0,'admin',3,1,'2013-03-20 11:15:43','\0\0',':-S'),(217,0,'admin',3,1,'2013-03-20 11:15:44','\0\0','#:-S'),(218,0,'admin',3,1,'2013-03-20 11:15:52','\0\0','>:)'),(219,0,'admin',3,1,'2013-03-20 11:15:55','\0\0',':(('),(220,0,'admin',3,1,'2013-03-20 11:15:56','\0\0',':))'),(221,0,'admin',3,1,'2013-03-20 11:15:57','\0\0',':|'),(222,2147483647,'ChatBot',4,1000000000,'2013-03-20 11:16:00','\0\0','/error UnknownCommand /:)'),(223,2147483647,'ChatBot',4,1000000000,'2013-03-20 11:16:04','\0\0','/error UnknownCommand /:)'),(224,0,'admin',3,1,'2013-03-20 11:16:06','\0\0','=))'),(225,0,'admin',3,1,'2013-03-20 11:16:08','\0\0','O:-)'),(226,0,'admin',3,1,'2013-03-20 11:16:09','\0\0','=;'),(227,0,'admin',3,1,'2013-03-20 11:16:11','\0\0',':-B'),(228,0,'admin',3,1,'2013-03-20 11:16:12','\0\0',':-c'),(229,0,'admin',3,1,'2013-03-20 11:16:12','\0\0',':)]'),(230,0,'admin',3,1,'2013-03-20 11:16:14','\0\0','~X('),(231,0,'admin',3,1,'2013-03-20 11:16:15','\0\0',':-h'),(232,0,'admin',3,1,'2013-03-20 11:16:16','\0\0',':-t'),(233,0,'admin',3,1,'2013-03-20 11:17:17','\0\0',';;)'),(234,0,'admin',3,1,'2013-03-20 11:17:49','\0\0','>;D<'),(235,0,'admin',3,1,'2013-03-20 11:17:56','\0\0',';-)'),(236,0,'admin',3,1,'2013-03-20 11:18:09','\0\0','=(('),(237,0,'admin',3,1,'2013-03-20 11:18:11','\0\0',':-O'),(238,0,'admin',3,1,'2013-03-20 11:18:13','\0\0','X('),(239,2147483647,'ChatBot',4,1,'2013-03-20 11:18:45','\0\0','/logout admin'),(240,2147483647,'ChatBot',4,0,'2013-03-20 12:41:55','\0\0','/login admin'),(241,2147483647,'ChatBot',4,0,'2013-03-20 12:41:59','\0\0','/logout admin'),(242,2147483647,'ChatBot',4,0,'2013-03-20 12:49:48','\0\0','/login admin'),(243,0,'admin',3,0,'2013-03-20 12:49:53','\0\0',':-t'),(244,2147483647,'ChatBot',4,0,'2013-03-20 13:25:09','\0\0','/logout admin'),(245,2147483647,'ChatBot',4,0,'2013-03-20 13:49:03','\0\0','/login admin'),(246,2147483647,'ChatBot',4,0,'2013-03-20 13:49:07','\0\0','/logout admin'),(247,2147483647,'ChatBot',4,0,'2013-03-20 13:51:01','\0\0','/login admin'),(248,2147483647,'ChatBot',4,0,'2013-03-20 13:51:03','\0\0','/logout admin'),(249,2147483647,'ChatBot',4,0,'2013-03-20 13:51:30','\0\0','/login admin'),(250,2147483647,'ChatBot',4,0,'2013-03-20 13:51:33','\0\0','/logout admin'),(251,2147483647,'ChatBot',4,0,'2013-03-20 13:53:35','\0\0','/login admin'),(252,2147483647,'ChatBot',4,0,'2013-03-20 13:53:38','\0\0','/logout admin'),(253,2147483647,'ChatBot',4,0,'2013-03-20 13:54:24','\0\0','/login admin'),(254,2147483647,'ChatBot',4,0,'2013-03-20 13:54:27','\0\0','/logout admin'),(255,2147483647,'ChatBot',4,0,'2013-03-20 13:57:06','\0\0','/login admin'),(256,2147483647,'ChatBot',4,0,'2013-03-20 13:57:08','\0\0','/logout admin'),(257,2147483647,'ChatBot',4,0,'2013-03-20 14:00:27','\0\0','/login admin'),(258,2147483647,'ChatBot',4,0,'2013-03-20 14:00:57','\0\0','/logout admin'),(259,2147483647,'ChatBot',4,0,'2013-03-20 14:04:48','\0\0','/login admin'),(260,0,'admin',3,0,'2013-03-20 14:05:57','\0\0','(:|'),(261,0,'admin',3,0,'2013-03-20 14:07:21','\0\0','({|'),(262,0,'admin',3,0,'2013-03-20 14:07:28','\0\0','=P~'),(263,0,'admin',3,0,'2013-03-20 14:07:41','\0\0',':-bd'),(264,0,'admin',3,0,'2013-03-20 14:07:44','\0\0','^#(^'),(265,0,'admin',3,0,'2013-03-20 14:07:59','\0\0',':ar!'),(266,0,'admin',3,0,'2013-03-20 14:08:05','\0\0',':P'),(267,0,'admin',3,0,'2013-03-20 14:08:10','\0\0',':\">'),(268,0,'admin',3,0,'2013-03-20 14:08:14','\0\0','=(('),(269,0,'admin',3,0,'2013-03-20 14:08:17','\0\0',':-O'),(270,0,'admin',3,0,'2013-03-20 14:08:22','\0\0',':>'),(271,0,'admin',3,0,'2013-03-20 14:08:25','\0\0','B-)'),(272,0,'admin',3,0,'2013-03-20 14:08:27','\0\0',':-S'),(273,0,'admin',3,0,'2013-03-20 14:08:29','\0\0','#:-S'),(274,0,'admin',3,0,'2013-03-20 14:08:57','\0\0','#:;S'),(275,0,'admin',3,0,'2013-03-20 14:09:08','\0\0','>:)'),(276,0,'admin',3,0,'2013-03-20 14:09:40','\0\0','>])'),(277,0,'admin',3,0,'2013-03-20 14:09:44','\0\0',':(('),(278,0,'admin',3,0,'2013-03-20 14:12:39','\0\0',':[['),(279,0,'admin',3,0,'2013-03-20 14:12:41','\0\0',':]]'),(280,0,'admin',3,0,'2013-03-20 14:12:45','\0\0',':|'),(281,2147483647,'ChatBot',4,1000000000,'2013-03-20 14:12:49','\0\0','/error UnknownCommand /:)'),(282,0,'admin',3,0,'2013-03-20 14:13:38','\0\0',';>)'),(283,0,'admin',3,0,'2013-03-20 14:14:07','\0\0','=))'),(284,0,'admin',3,0,'2013-03-20 14:14:12','\0\0','O:-)'),(285,0,'admin',3,0,'2013-03-20 14:14:15','\0\0','=;'),(286,0,'admin',3,0,'2013-03-20 14:14:17','\0\0',':-B'),(287,0,'admin',3,0,'2013-03-20 14:14:20','\0\0',':-c'),(288,0,'admin',3,0,'2013-03-20 14:14:22','\0\0',':)]'),(289,0,'admin',3,0,'2013-03-20 14:15:30','\0\0','c)]'),(290,0,'admin',3,0,'2013-03-20 14:15:35','\0\0','~X('),(291,0,'admin',3,0,'2013-03-20 14:15:57','\0\0','~x('),(292,0,'admin',3,0,'2013-03-20 14:16:00','\0\0',':-h'),(293,0,'admin',3,0,'2013-03-20 14:16:04','\0\0',':-t'),(294,0,'admin',3,0,'2013-03-20 14:16:07','\0\0','8->'),(295,0,'admin',3,0,'2013-03-20 14:16:11','\0\0','I-)'),(296,0,'admin',3,0,'2013-03-20 14:16:14','\0\0','8-|'),(297,0,'admin',3,0,'2013-03-20 14:16:17','\0\0','L-)'),(298,0,'admin',3,0,'2013-03-20 14:16:20','\0\0',':-&'),(299,0,'admin',3,0,'2013-03-20 14:16:23','\0\0',':-$'),(300,0,'admin',3,0,'2013-03-20 14:16:26','\0\0','[-('),(301,0,'admin',3,0,'2013-03-20 14:16:29','\0\0',':O)'),(302,0,'admin',3,0,'2013-03-20 14:16:31','\0\0','8-}'),(303,0,'admin',3,0,'2013-03-20 14:16:35','\0\0','<:-P'),(304,0,'admin',3,0,'2013-03-20 14:16:38','\0\0','({|'),(305,0,'admin',3,0,'2013-03-20 14:16:41','\0\0','=P~'),(306,0,'admin',3,0,'2013-03-20 14:16:42','\0\0',':-?'),(307,0,'admin',3,0,'2013-03-20 14:16:44','\0\0','#-o'),(308,0,'admin',3,0,'2013-03-20 14:16:46','\0\0','=D>'),(309,0,'admin',3,0,'2013-03-20 14:16:48','\0\0','@-)'),(310,0,'admin',3,0,'2013-03-20 14:16:51','\0\0',':-SS'),(311,0,'admin',3,0,'2013-03-20 14:17:07','\0\0',':-sS'),(312,0,'admin',3,0,'2013-03-20 14:17:10','\0\0',':^o'),(313,0,'admin',3,0,'2013-03-20 14:17:12','\0\0',':-w'),(314,0,'admin',3,0,'2013-03-20 14:17:13','\0\0',':-<'),(315,0,'admin',3,0,'2013-03-20 14:17:15','\0\0','>:P'),(316,0,'admin',3,0,'2013-03-20 14:17:30','\0\0','>:p'),(317,0,'admin',3,0,'2013-03-20 14:17:33','\0\0','<):)'),(318,0,'admin',3,0,'2013-03-20 14:17:52','\0\0','CB)'),(319,0,'admin',3,0,'2013-03-20 14:17:56','\0\0','X_X'),(320,0,'admin',3,0,'2013-03-20 14:18:02','\0\0',':!!'),(321,0,'admin',3,0,'2013-03-20 14:18:05','\0\0','m/'),(322,0,'admin',3,0,'2013-03-20 14:18:07','\0\0',':-q'),(323,0,'admin',3,0,'2013-03-20 14:18:10','\0\0',':-bd'),(324,0,'admin',3,0,'2013-03-20 14:18:11','\0\0','^#(^'),(325,0,'admin',3,0,'2013-03-20 14:18:13','\0\0',':ar!'),(326,0,'admin',3,0,'2013-03-20 14:18:32','\0\0',';>)'),(327,0,'admin',3,0,'2013-03-20 14:19:01','\0\0',';()'),(328,2147483647,'ChatBot',4,0,'2013-03-20 14:19:22','\0\0','/logout admin'),(329,2147483647,'ChatBot',4,0,'2013-03-20 14:26:54','\0\0','/login admin'),(330,2147483647,'ChatBot',4,0,'2013-03-20 14:26:58','\0\0','/logout admin'),(331,2147483647,'ChatBot',4,0,'2013-03-20 14:27:26','\0\0','/login admin'),(332,2147483647,'ChatBot',4,0,'2013-03-20 14:27:28','\0\0','/logout admin'),(333,2147483647,'ChatBot',4,0,'2013-03-20 14:32:19','\0\0','/login admin'),(334,2147483647,'ChatBot',4,0,'2013-03-20 14:32:21','\0\0','/logout admin'),(335,2147483647,'ChatBot',4,0,'2013-03-20 14:34:25','\0\0','/login admin'),(336,2147483647,'ChatBot',4,0,'2013-03-20 14:34:26','\0\0','/logout admin'),(337,2147483647,'ChatBot',4,0,'2013-03-20 14:43:21','\0\0','/login admin'),(338,2147483647,'ChatBot',4,0,'2013-03-20 14:43:23','\0\0','/logout admin'),(339,2147483647,'ChatBot',4,0,'2013-03-20 14:44:52','\0\0','/login admin'),(340,2147483647,'ChatBot',4,0,'2013-03-20 14:44:53','\0\0','/logout admin'),(341,2147483647,'ChatBot',4,0,'2013-03-20 14:48:14','\0\0','/login admin'),(342,2147483647,'ChatBot',4,0,'2013-03-20 14:48:16','\0\0','/logout admin'),(343,2147483647,'ChatBot',4,0,'2013-03-20 14:48:56','\0\0','/login admin'),(344,2147483647,'ChatBot',4,0,'2013-03-20 14:48:57','\0\0','/logout admin'),(345,2147483647,'ChatBot',4,0,'2013-03-20 14:51:00','\0\0','/login admin'),(346,2147483647,'ChatBot',4,0,'2013-03-20 14:51:02','\0\0','/logout admin'),(347,2147483647,'ChatBot',4,0,'2013-03-20 15:02:25','\0\0','/login admin'),(348,2147483647,'ChatBot',4,0,'2013-03-20 15:02:28','\0\0','/logout admin'),(349,2147483647,'ChatBot',4,0,'2013-03-20 15:02:33','\0\0','/login admin'),(350,2147483647,'ChatBot',4,0,'2013-03-20 15:02:43','\0\0','/logout admin'),(351,2147483647,'ChatBot',4,0,'2013-03-20 15:05:00','\0\0','/login admin'),(352,2147483647,'ChatBot',4,0,'2013-03-20 15:06:20','\0\0','/logout admin'),(353,2147483647,'ChatBot',4,0,'2013-03-20 17:36:31','\0\0','/login ngalt'),(354,2147483647,'ChatBot',4,0,'2013-03-20 17:44:03','\0\0','/logout ngalt'),(355,2147483647,'ChatBot',4,0,'2013-03-20 17:44:08','\0\0','/login ngalt'),(356,2147483647,'ChatBot',4,0,'2013-03-20 22:02:57','\0\0','/login admin'),(357,2147483647,'ChatBot',4,0,'2013-03-20 22:02:59','\0\0','/logout ngalt Timeout'),(358,2147483647,'ChatBot',4,0,'2013-03-20 22:03:06','\0\0','/logout admin'),(359,2147483647,'ChatBot',4,0,'2013-03-20 22:03:11','\0\0','/login ngalt'),(360,10,'ngalt',0,0,'2013-03-20 22:03:50','\0\0','>;D<'),(361,10,'ngalt',0,0,'2013-03-20 22:04:06','\0\0','#:;S'),(362,2147483647,'ChatBot',4,0,'2013-03-20 22:04:24','\0\0','/logout ngalt'),(363,2147483647,'ChatBot',4,0,'2013-03-21 16:02:56','\0\0','/login ngalt'),(364,2147483647,'ChatBot',4,0,'2013-03-21 16:03:19','\0\0','/logout ngalt'),(365,2147483647,'ChatBot',4,0,'2013-03-21 17:12:02','\0\0','/login ngalt'),(366,10,'ngalt',0,0,'2013-03-21 17:12:13','\0\0','[color=lime]rewerwer[/color]'),(367,10,'ngalt',0,0,'2013-03-21 17:12:29','\0\0',':x'),(368,2147483647,'ChatBot',4,0,'2013-03-21 17:12:45','\0\0','/roll ngalt 1d6 3'),(369,2147483647,'ChatBot',4,0,'2013-03-21 17:13:01','\0\0','/logout ngalt'),(370,2147483647,'ChatBot',4,0,'2013-03-23 17:08:02','\0\0','/login admin'),(371,0,'admin',3,0,'2013-03-23 17:08:22','\0\0','>;D<'),(372,2147483647,'ChatBot',4,0,'2013-03-23 17:08:39','\0\0','/logout admin'),(373,2147483647,'ChatBot',4,0,'2013-03-26 08:57:31','\0\0','/login admin'),(374,2147483647,'ChatBot',4,0,'2013-03-26 09:21:52','��n','/logout admin Timeout'),(375,2147483647,'ChatBot',4,0,'2013-03-26 09:21:53','��n','/login admin'),(376,0,'admin',3,0,'2013-03-26 09:22:10','��n','[b][b]qfdfafaf[/b][/b]'),(377,0,'admin',3,0,'2013-03-26 09:22:17','��n','affafa'),(378,0,'admin',3,0,'2013-03-26 09:22:22','��n','[b]fafdfafa[/b]'),(379,0,'admin',3,0,'2013-03-26 09:22:37','��n','[i]gsfgsfg[/i]'),(380,2147483647,'ChatBot',4,0,'2013-03-26 10:12:52','��n','/login vinhdc'),(381,2147483647,'ChatBot',4,0,'2013-03-26 10:12:55','��n','/logout admin Timeout'),(382,12,'vinhdc',0,0,'2013-03-26 10:13:49','��n',':P'),(383,12,'vinhdc',0,0,'2013-03-26 10:13:55','��n',':x'),(384,12,'vinhdc',0,0,'2013-03-26 10:14:10','��n','[color=red]hehehe[/color]'),(385,12,'vinhdc',0,0,'2013-03-26 10:15:14','��n','[url=http://dantri.com.vn][/url]'),(386,12,'vinhdc',0,0,'2013-03-26 10:15:34','��n','[url=http://google.com][/url]'),(387,12,'vinhdc',0,0,'2013-03-26 10:38:30','��n','hihi'),(388,12,'vinhdc',0,0,'2013-03-26 10:38:42','��n','hihi'),(389,12,'vinhdc',0,0,'2013-03-26 10:38:57','��n','hihi'),(390,2147483647,'ChatBot',4,0,'2013-03-26 10:39:05','��n','/channelLeave vinhdc'),(391,2147483647,'ChatBot',4,1,'2013-03-26 10:39:05','��n','/channelEnter vinhdc'),(392,12,'vinhdc',0,1,'2013-03-26 10:39:21','��n','hihi'),(393,2147483647,'ChatBot',4,1,'2013-03-26 10:39:24','��n','/logout vinhdc'),(394,2147483647,'ChatBot',4,0,'2013-03-26 10:39:36','��n','/login admin'),(395,2147483647,'ChatBot',4,1000000000,'2013-03-26 10:39:43','��n','/who admin'),(396,2147483647,'ChatBot',4,1000000000,'2013-03-26 10:39:45','��n','/who admin'),(397,2147483647,'ChatBot',4,1000000000,'2013-03-26 10:39:50','��n','/list CÃ´ng_cá»™ng RiÃªng_tÆ° [admin]'),(398,2147483647,'ChatBot',4,1000000000,'2013-03-26 10:39:54','��n','/error MissingText'),(399,2147483647,'ChatBot',4,1000000000,'2013-03-26 10:40:01','��n','/error MissingUserName'),(400,2147483647,'ChatBot',4,0,'2013-03-26 11:35:56','��n','/channelLeave admin'),(401,2147483647,'ChatBot',4,1,'2013-03-26 11:35:56','��n','/channelEnter admin'),(402,0,'admin',3,1,'2013-03-26 11:36:14','��n','[b]chá»¯ Ä‘áº­m[/b]'),(403,0,'admin',3,1,'2013-03-26 11:36:29','��n','[color=red]mÃ u chá»¯[/color]'),(404,2147483647,'ChatBot',4,1,'2013-04-09 14:12:30','\0\0','/logout admin Timeout'),(405,2147483647,'ChatBot',4,0,'2013-04-09 14:12:31','\0\0','/login admin'),(406,2147483647,'ChatBot',4,0,'2013-04-09 17:23:18','\0\0','/logout admin'),(407,2147483647,'ChatBot',4,0,'2013-04-23 14:10:42','��f','/login datnt'),(408,2147483647,'ChatBot',4,1000000019,'2013-04-23 14:10:52','��f','/who datnt'),(409,2147483647,'ChatBot',4,1000000019,'2013-04-23 14:10:53','��f','/who datnt'),(410,2147483647,'ChatBot',4,1000000019,'2013-04-23 14:10:55','��f','/who datnt'),(411,2147483647,'ChatBot',4,1000000019,'2013-04-23 14:11:49','��f','/list CÃ´ng_cá»™ng RiÃªng_tÆ°'),(412,2147483647,'ChatBot',4,0,'2013-04-23 14:12:03','��f','/logout datnt'),(413,2147483647,'ChatBot',4,0,'2013-04-24 09:14:42','��f','/login huunq'),(414,2147483647,'ChatBot',4,0,'2013-04-24 09:16:29','��f','/login andt'),(415,7,'andt',0,0,'2013-04-24 09:16:39','��f','alo pi caso'),(416,2147483647,'ChatBot',4,1000000004,'2013-04-24 09:16:51','��f','/who andt huunq'),(417,4,'huunq',0,0,'2013-04-24 09:17:05','��f',':x'),(418,4,'huunq',0,0,'2013-04-24 09:17:17','��f',':-&'),(419,4,'huunq',0,0,'2013-04-24 09:17:33','��f',':-sS'),(420,2147483647,'ChatBot',4,0,'2013-04-24 11:55:40','��f','/logout andt Timeout'),(421,2147483647,'ChatBot',4,0,'2013-05-02 22:12:21','\0\0','/login hungdv'),(422,2147483647,'ChatBot',4,0,'2013-05-02 22:12:24','\0\0','/logout huunq Timeout'),(423,2147483647,'ChatBot',4,0,'2013-05-02 22:12:31','\0\0','/logout hungdv'),(424,2147483647,'ChatBot',4,0,'2013-05-20 16:03:42','\0\0','/login ngalt'),(425,2147483647,'ChatBot',4,0,'2013-05-20 16:04:00','\0\0','/logout ngalt'),(426,2147483647,'ChatBot',4,0,'2016-01-17 15:36:34','\0\0','/login vanthu');

/*Table structure for table `ajax_chat_online` */

DROP TABLE IF EXISTS `ajax_chat_online`;

CREATE TABLE `ajax_chat_online` (
  `userID` int(11) NOT NULL,
  `userName` varchar(64) COLLATE utf8_bin NOT NULL,
  `userRole` int(1) NOT NULL,
  `channel` int(11) NOT NULL,
  `dateTime` datetime NOT NULL,
  `ip` varbinary(16) NOT NULL,
  PRIMARY KEY (`userID`),
  KEY `userName` (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ajax_chat_online` */

insert  into `ajax_chat_online`(`userID`,`userName`,`userRole`,`channel`,`dateTime`,`ip`) values (5,'vanthu',0,0,'2016-01-18 08:47:46','\0\0');

/*Table structure for table `tbl_addusers` */

DROP TABLE IF EXISTS `tbl_addusers`;

CREATE TABLE `tbl_addusers` (
  `addUser_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_sent` int(11) DEFAULT '0',
  `user_id` varchar(250) DEFAULT '0',
  `doc_id` int(11) DEFAULT '0',
  `addUser_desc` varchar(250) DEFAULT NULL,
  `addUser_date` datetime DEFAULT NULL,
  PRIMARY KEY (`addUser_id`),
  KEY `FK_tbl_addusers` (`doc_id`),
  CONSTRAINT `FK_tbl_addusers` FOREIGN KEY (`doc_id`) REFERENCES `tbl_docs` (`doc_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_addusers` */

/*Table structure for table `tbl_baotris` */

DROP TABLE IF EXISTS `tbl_baotris`;

CREATE TABLE `tbl_baotris` (
  `baotri_id` int(11) NOT NULL AUTO_INCREMENT,
  `baotri_lan` int(11) DEFAULT NULL,
  `vttb_cat_id` varchar(250) DEFAULT NULL,
  `vttb_sub_id` varchar(250) DEFAULT NULL,
  `vttb_id` varchar(250) DEFAULT NULL,
  `baotri_cost` int(11) DEFAULT '0',
  `baotri_date` date DEFAULT NULL,
  `baotri_sort` int(11) DEFAULT '0',
  `baotri_active` tinyint(4) DEFAULT '1',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`baotri_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_baotris` */

/*Table structure for table `tbl_config` */

DROP TABLE IF EXISTS `tbl_config`;

CREATE TABLE `tbl_config` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_name` varchar(255) DEFAULT NULL,
  `owner_add` varchar(255) DEFAULT NULL,
  `owner_phone` varchar(255) DEFAULT NULL,
  `owner_fax` varchar(255) DEFAULT NULL,
  `owner_email` varchar(255) DEFAULT NULL,
  `owner_reemail` varchar(255) DEFAULT NULL,
  `owner_url` varchar(255) DEFAULT NULL,
  `site_logo` varchar(255) DEFAULT NULL,
  `site_banner` varchar(255) DEFAULT NULL,
  `site_border` varchar(255) DEFAULT NULL,
  `sat_ra` tinyint(4) DEFAULT NULL,
  `sun_ra` tinyint(4) DEFAULT NULL,
  `site_port` varchar(50) DEFAULT NULL,
  `site_active` tinyint(1) DEFAULT NULL,
  `site_inactive_info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_config` */

insert  into `tbl_config`(`config_id`,`owner_name`,`owner_add`,`owner_phone`,`owner_fax`,`owner_email`,`owner_reemail`,`owner_url`,`site_logo`,`site_banner`,`site_border`,`sat_ra`,`sun_ra`,`site_port`,`site_active`,`site_inactive_info`) values (1,'Công ty đầu tư xây dựng số 2 Hà Nội','Số 324 Tây Sơn, Đống Đa, Hà Nội','(84-4)35584167','(84-4)35584201','Hacinco@fpt.vn',NULL,'Hacinco','2000000','01-01-2013',NULL,2,2,'COM5',NULL,NULL);

/*Table structure for table `tbl_cv_cats` */

DROP TABLE IF EXISTS `tbl_cv_cats`;

CREATE TABLE `tbl_cv_cats` (
  `cv_cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cv_cat_name` varchar(250) DEFAULT NULL COMMENT 'ten',
  `cv_cat_desc` text COMMENT 'mo ta',
  `cv_cat_priority` tinyint(4) DEFAULT '0' COMMENT 'uu tien',
  `cv_cat_date` date DEFAULT NULL COMMENT 'ngay tao',
  `cv_cat_sort` int(11) DEFAULT '0' COMMENT 'sap xep',
  `cv_cat_active` tinyint(4) DEFAULT '0' COMMENT 'tinh trang: huy / thuc hien',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cv_cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_cv_cats` */

insert  into `tbl_cv_cats`(`cv_cat_id`,`cv_cat_name`,`cv_cat_desc`,`cv_cat_priority`,`cv_cat_date`,`cv_cat_sort`,`cv_cat_active`,`user_id`) values (1,'Thử nghiệm 1','Thử nghiệm 1',0,'2016-02-19',0,1,31);

/*Table structure for table `tbl_cv_files` */

DROP TABLE IF EXISTS `tbl_cv_files`;

CREATE TABLE `tbl_cv_files` (
  `cv_file_id` int(11) NOT NULL AUTO_INCREMENT,
  `cv_cat_id` int(11) NOT NULL DEFAULT '0' COMMENT 'khoa ngoai',
  `cv_file_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1: chung; 2: rieng',
  `department_id` varchar(100) NOT NULL DEFAULT '[0]' COMMENT 'phong dc xem',
  `department_ph_id` varchar(100) NOT NULL DEFAULT '[0]' COMMENT 'phong phoi hop dc xem',
  `user_id` varchar(100) NOT NULL DEFAULT '[0]' COMMENT 'lanh dao dc xem',
  `cv_file_date` date NOT NULL DEFAULT '0000-00-00' COMMENT 'ngay tao',
  PRIMARY KEY (`cv_file_id`),
  KEY `FK_tbl_cv_subs` (`cv_cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_cv_files` */

/*Table structure for table `tbl_cv_giamsat` */

DROP TABLE IF EXISTS `tbl_cv_giamsat`;

CREATE TABLE `tbl_cv_giamsat` (
  `cv_giamsat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cv_cat_id` int(11) DEFAULT NULL COMMENT 'khoa ngoai',
  `user_id` int(11) DEFAULT NULL COMMENT 'khoa ngoai pgd',
  `cv_giamsat_date` date DEFAULT NULL COMMENT 'ngay tao',
  PRIMARY KEY (`cv_giamsat_id`),
  KEY `FK_tbl_cv_subs` (`cv_cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_cv_giamsat` */

insert  into `tbl_cv_giamsat`(`cv_giamsat_id`,`cv_cat_id`,`user_id`,`cv_giamsat_date`) values (1,1,37,NULL),(2,1,38,NULL);

/*Table structure for table `tbl_cv_indexs` */

DROP TABLE IF EXISTS `tbl_cv_indexs`;

CREATE TABLE `tbl_cv_indexs` (
  `cv_index_id` int(11) NOT NULL AUTO_INCREMENT,
  `cv_sub_id` int(11) DEFAULT NULL COMMENT 'khoa ngoai',
  `process_user` int(11) DEFAULT NULL COMMENT 'nguoi nhan viec',
  `cv_index_name` varchar(250) DEFAULT NULL COMMENT 'ten',
  `cv_index_desc` text COMMENT 'mo ta',
  `cv_index_date` date DEFAULT NULL,
  `cv_index_sort` int(11) DEFAULT '0',
  `cv_index_active` tinyint(4) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cv_index_id`),
  KEY `FK_tbl_cv_indexs` (`cv_sub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_cv_indexs` */

/*Table structure for table `tbl_cv_logs` */

DROP TABLE IF EXISTS `tbl_cv_logs`;

CREATE TABLE `tbl_cv_logs` (
  `cv_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `cv_index_id` int(11) DEFAULT NULL COMMENT 'khoa ngoai',
  `cv_log_num_day` date DEFAULT NULL COMMENT 'so ngay cho viec',
  `cv_log_desc` varchar(250) DEFAULT NULL COMMENT 'ten',
  `cv_log_note` varchar(250) DEFAULT NULL COMMENT 'ghi chu',
  `cv_log_date` date DEFAULT NULL COMMENT 'ngay tao',
  `cv_log_sort` int(11) DEFAULT '0',
  `cv_log_active` tinyint(4) DEFAULT '0' COMMENT 'tinh trang: hoan thanh/chua',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cv_log_id`),
  KEY `FK_tbl_cv_logs` (`cv_index_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_cv_logs` */

/*Table structure for table `tbl_cv_phoihop` */

DROP TABLE IF EXISTS `tbl_cv_phoihop`;

CREATE TABLE `tbl_cv_phoihop` (
  `cv_phoihop_id` int(11) NOT NULL AUTO_INCREMENT,
  `cv_cat_id` int(11) DEFAULT NULL COMMENT 'khoa ngoai',
  `department_id` int(11) DEFAULT NULL COMMENT 'khoa ngoai phong',
  `cv_phoihop_date` date DEFAULT NULL COMMENT 'ngay tao',
  PRIMARY KEY (`cv_phoihop_id`),
  KEY `FK_tbl_cv_subs` (`cv_cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_cv_phoihop` */

insert  into `tbl_cv_phoihop`(`cv_phoihop_id`,`cv_cat_id`,`department_id`,`cv_phoihop_date`) values (1,1,13,'2016-02-24'),(2,1,18,'2016-02-24');

/*Table structure for table `tbl_cv_subs` */

DROP TABLE IF EXISTS `tbl_cv_subs`;

CREATE TABLE `tbl_cv_subs` (
  `cv_sub_id` int(11) NOT NULL AUTO_INCREMENT,
  `cv_cat_id` int(11) DEFAULT NULL COMMENT 'khoa ngoai',
  `department_id` int(11) DEFAULT NULL COMMENT 'khoa ngoai phong',
  `cv_sub_name` varchar(250) DEFAULT NULL COMMENT 'ten',
  `cv_sub_desc` text COMMENT 'mo ta',
  `cv_sub_time_limit` date DEFAULT NULL COMMENT 'thoi han',
  `cv_sub_date` date DEFAULT NULL COMMENT 'ngay tao',
  `cv_sub_sort` int(11) DEFAULT '0',
  `cv_sub_active` tinyint(4) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cv_sub_id`),
  KEY `FK_tbl_cv_subs` (`cv_cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_cv_subs` */

insert  into `tbl_cv_subs`(`cv_sub_id`,`cv_cat_id`,`department_id`,`cv_sub_name`,`cv_sub_desc`,`cv_sub_time_limit`,`cv_sub_date`,`cv_sub_sort`,`cv_sub_active`,`user_id`) values (1,1,16,'Nhánh việc 1','undefined','2016-02-24','2016-02-24',0,0,31),(2,1,17,'Nhánh việc 1','undefined','2016-02-24','2016-02-24',0,0,31);

/*Table structure for table `tbl_departments` */

DROP TABLE IF EXISTS `tbl_departments`;

CREATE TABLE `tbl_departments` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(250) DEFAULT NULL,
  `department_ununicode` varchar(250) DEFAULT NULL COMMENT 'ten khong dau',
  `department_standfor` varchar(250) DEFAULT NULL COMMENT 'viet tat',
  `department_desc` text,
  `department_date` datetime DEFAULT NULL,
  `department_sort` int(11) DEFAULT '0',
  `department_type` tinyint(4) DEFAULT '1' COMMENT 'dhnb - tnvb',
  `department_active` tinyint(4) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_departments` */

insert  into `tbl_departments`(`department_id`,`department_name`,`department_ununicode`,`department_standfor`,`department_desc`,`department_date`,`department_sort`,`department_type`,`department_active`,`user_id`) values (12,'Ban giám đốc','Ban giam doc','BGĐ',NULL,'2015-11-20 00:00:00',NULL,3,1,NULL),(13,'Ban Trợ lý','Ban Tro ly','TLTK',NULL,'2015-11-20 00:00:00',0,3,1,NULL),(14,'Phòng Tổ chức - Lao động - Tiền lương','Phong To chuc  Lao dong  Tien luong','TCLĐTL',NULL,'2015-11-20 00:00:00',0,3,1,NULL),(15,'Phòng Hành chính quản trị','Phong Hanh chinh quan tri','HCQT',NULL,'2015-11-20 00:00:00',0,3,1,NULL),(16,'Phòng Tài chính kế toán','Phong Tai chinh ke toan','TCKT',NULL,'2015-11-20 00:00:00',0,3,1,NULL),(17,'Phòng Kế hoạch kỹ thuật','Phong Ke hoach ky thuat','KHKT',NULL,'2015-11-20 00:00:00',0,3,1,NULL),(18,'Phòng Kinh doanh','Phong Kinh doanh','KD',NULL,'2015-11-20 00:00:00',0,3,1,NULL),(19,'Xí nghiệp xây lắp số 1','Xi nghiep xay lap so 1','XNXL1',NULL,'2015-11-20 00:00:00',0,3,1,NULL),(20,'Xí nghiệp xây lắp số 2','Xi nghiep xay lap so 2','XNXL2',NULL,'2015-11-20 00:00:00',0,3,1,NULL),(21,'Xí nghiệp VTXM','Xi nghiep VTXM','VTXM',NULL,'2015-11-20 00:00:00',0,3,1,NULL),(22,'Xí nghiệp ĐN','Xi nghiep DN','ĐN',NULL,'2015-11-20 00:00:00',0,3,1,NULL),(23,'Xí nghiệp DV Hacinco','Xi nghiep DV Hacinco','DVHACINCO',NULL,'2015-11-20 00:00:00',0,3,1,NULL),(24,'Xí nghiệp DV','Xi nghiep DV','DVKDN',NULL,'2015-11-20 00:00:00',0,3,1,NULL),(25,'KSTT','KSTT','KSTT',NULL,'2015-11-20 00:00:00',0,3,1,NULL),(26,'Ban Quản lý dự án 1','Ban Quan ly du an 1','QLDA1',NULL,'2015-11-20 00:00:00',0,3,1,NULL),(27,'Ban Quản lý dự án 2','Ban Quan ly du an 2','QLDA2',NULL,'2015-11-20 00:00:00',0,3,1,NULL),(28,'Ban Điều hành dự án nhà Thành ủy','Ban Dieu hanh du an nha Thanh uy','ĐHNTU',NULL,'2015-11-20 00:00:00',0,3,1,NULL);

/*Table structure for table `tbl_dlfiles` */

DROP TABLE IF EXISTS `tbl_dlfiles`;

CREATE TABLE `tbl_dlfiles` (
  `dlfile_id` int(11) NOT NULL AUTO_INCREMENT,
  `dl_id` int(11) DEFAULT '0',
  `dlfile_name` varchar(100) DEFAULT NULL,
  `dlfile_path` varchar(250) DEFAULT NULL,
  `dlfile_date` date DEFAULT NULL,
  `dlfile_sort` int(11) DEFAULT NULL,
  `dlfile_active` tinyint(4) DEFAULT '1',
  `user_id` int(11) DEFAULT '0',
  PRIMARY KEY (`dlfile_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_dlfiles` */

insert  into `tbl_dlfiles`(`dlfile_id`,`dl_id`,`dlfile_name`,`dlfile_path`,`dlfile_date`,`dlfile_sort`,`dlfile_active`,`user_id`) values (1,2,'Chương I','../kdl_uploads_2013/6a9c50c768c6aced12e798ec96df824a.png','2013-03-24',NULL,NULL,14),(2,2,'Chương II','../kdl_uploads_2013/c6f8592cb23b3356e3af6c6ea28cfdb2.jpg','2013-03-24',NULL,NULL,14),(4,2,'Chương III','../kdl_uploads_2013/43e5d0817b23d0bfacd3e1a37dd29e27.jpg','2013-03-24',NULL,1,14);

/*Table structure for table `tbl_dlkhos` */

DROP TABLE IF EXISTS `tbl_dlkhos`;

CREATE TABLE `tbl_dlkhos` (
  `kdl_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) DEFAULT '0',
  `kdl_name` varchar(100) DEFAULT NULL,
  `kdl_ununicode` varchar(100) DEFAULT NULL,
  `kdl_type` tinyint(4) DEFAULT '1' COMMENT '1: chung, 2: p/b, 3:ca nhan',
  `kdl_date` date DEFAULT NULL,
  `kdl_sort` int(11) DEFAULT NULL,
  `kdl_active` tinyint(4) DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  PRIMARY KEY (`kdl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_dlkhos` */

insert  into `tbl_dlkhos`(`kdl_id`,`department_id`,`kdl_name`,`kdl_ununicode`,`kdl_type`,`kdl_date`,`kdl_sort`,`kdl_active`,`user_id`) values (1,0,'Văn hóa công sở','Van hoa cong so',1,'2013-03-24',NULL,1,14),(2,0,'Tiếng Anh giao tiếp','Tieng Anh giao tiep',1,'2013-03-24',NULL,1,14),(3,0,'Tin học văn phòng','Tin hoc van phong',1,'2013-03-24',NULL,1,14),(4,NULL,'Quản lý công việc cá nhân','Quan ly cong viec ca nhan',1,'2013-03-25',NULL,1,1),(5,1,'Kiến thức quản lý hành chính','Kien thuc quan ly hanh chinh',2,'2013-03-24',NULL,1,14),(6,1,'Kiến thức quản lý nhân sự','Kien thuc quan ly nhan su',2,'2013-03-24',NULL,1,14),(7,1,'Kiến thức tổ chức hội thảo, sự kiện','Kien thuc to chuc hoi thao, su kien',2,'2013-03-24',NULL,1,14),(8,1,'Kỹ năng điều hành cuộc họp','Ky nang dieu hanh cuoc hop',2,'2013-03-24',NULL,1,14),(9,0,'Các mẫu báo cáo','Cac mau bao cao',3,'2013-03-24',NULL,1,14);

/*Table structure for table `tbl_dls` */

DROP TABLE IF EXISTS `tbl_dls`;

CREATE TABLE `tbl_dls` (
  `dl_id` int(11) NOT NULL AUTO_INCREMENT,
  `kdl_id` int(11) DEFAULT '0',
  `dl_name` varchar(250) DEFAULT NULL,
  `dl_note` varchar(250) DEFAULT NULL,
  `dl_date` date DEFAULT NULL,
  `dl_sort` int(11) DEFAULT NULL,
  `dl_active` tinyint(4) DEFAULT '1',
  `dl_file` tinyint(4) DEFAULT '2',
  `user_id` int(11) DEFAULT '0',
  PRIMARY KEY (`dl_id`),
  KEY `FK_tbl_dls` (`kdl_id`),
  CONSTRAINT `FK_tbl_dls` FOREIGN KEY (`kdl_id`) REFERENCES `tbl_dlkhos` (`kdl_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_dls` */

insert  into `tbl_dls`(`dl_id`,`kdl_id`,`dl_name`,`dl_note`,`dl_date`,`dl_sort`,`dl_active`,`dl_file`,`user_id`) values (1,4,'Làm việc có kế hoạch','Định nghĩa kế hoạch làm việc, hướng dẫn cách lập kế hoạch và quản lý kế hoạch','2013-03-26',NULL,1,2,16),(2,4,'Cách sắp xếp kho dữ liệu cá nhân','Hướng dẫn bạn cách sắp xếp dữ liệu số sách, giấy tờ, dữ liệu máy tính','2013-03-24',NULL,1,1,14),(3,2,'Basic','Tiếng Anh bằng A','2013-03-26',NULL,1,2,16),(4,2,'Inter-Pre','Tiếng Anh bằng B','2013-03-24',NULL,1,2,14),(5,3,'Computer Fundamental (CF)','Cơ bản về máy tính','2013-03-24',NULL,1,2,14),(6,3,'Offices, Typing (OT)','Bộ phần mềm văn phòng: Word, Excel, Outlook Express, Power Point, Access','2013-03-24',NULL,1,2,14),(7,3,'Internet, Email, Cheating (IEC)','Mạng, phương phát khai thác dự liệu mạng, Thử điện tử, Chat','2013-03-24',NULL,1,2,14),(8,4,'quản lý hồ sơ nhân viên kỹ thuật','tổ chức kiểm tra đánh giá lại toàn bộ quá trình làm việc','2013-03-26',NULL,1,2,16),(9,5,'kế toán tổng hợp','thống kê tính toán thu chi theo tháng, theo quý','2013-03-26',NULL,1,2,16),(10,5,'quản lý hành chính trong quý 4','thống kê tình hình tài chính trong quý 4 năm 2012','2013-03-26',NULL,1,2,16),(11,5,'lập kế hoạch tài chính trong năm 2013','lập kế hoạch thu chi trong 4 quý trong năm 2013','2013-03-26',NULL,1,2,16),(12,5,'lập kế hoạch tài chính trong năm 2013','lập kế hoạch thu chi trong 4 quý trong năm 2013','2013-03-26',NULL,1,2,16),(13,6,'quản lý nhân sự theo nhóm','tình hìn quản lý nhân sự trong những năm tới','2013-03-26',NULL,1,2,16),(14,6,'quản lý nhân sự theo nhóm','tình hìn quản lý nhân sự trong những năm tới','2013-03-26',NULL,1,2,16),(15,7,'hội thảo trong tháng 4-2012','tổ chức hôi thảo trong tháng 4 tại hà nội và TP Hồ Chí Minh','2013-03-26',NULL,1,2,16),(16,9,'báo cáo về tình hình tài chính','tổ chức báo cáo tình tình tài chính, chuyển kết quả lên lãnh đạo','2013-03-26',NULL,1,2,16),(17,9,'báo cáo về tình hình tài chính','tổ chức báo cáo tình tình tài chính, chuyển kết quả lên lãnh đạo','2013-03-26',NULL,1,2,16),(18,9,'báo cáo mới','mô tả về báo cáo mới','2013-03-26',NULL,1,2,16),(19,1,'văn hóa công sở','tổ chức các hội thảo,cuộc thi về văn hóa công sở','2013-03-26',NULL,1,2,16);

/*Table structure for table `tbl_doccats` */

DROP TABLE IF EXISTS `tbl_doccats`;

CREATE TABLE `tbl_doccats` (
  `docCat_id` int(11) NOT NULL AUTO_INCREMENT,
  `docCat_name` varchar(250) DEFAULT NULL,
  `docCat_ununicode` varchar(250) DEFAULT NULL,
  `docCat_standfor` varchar(250) DEFAULT NULL,
  `docCat_type` tinyint(4) DEFAULT '0',
  `docCat_typical` tinyint(4) DEFAULT '0',
  `docCat_viewdepart` tinyint(4) DEFAULT '1',
  `docCat_view` tinyint(4) DEFAULT '1',
  `docCat_out` tinyint(4) DEFAULT '0',
  `docCat_desc` text,
  `docCat_date` datetime DEFAULT NULL,
  `docCat_sort` int(11) DEFAULT '0',
  `docCat_active` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  PRIMARY KEY (`docCat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_doccats` */

insert  into `tbl_doccats`(`docCat_id`,`docCat_name`,`docCat_ununicode`,`docCat_standfor`,`docCat_type`,`docCat_typical`,`docCat_viewdepart`,`docCat_view`,`docCat_out`,`docCat_desc`,`docCat_date`,`docCat_sort`,`docCat_active`,`user_id`) values (1,'Công văn','Congvan','CV',0,0,0,1,1,NULL,'2012-10-01 00:00:00',0,1,0),(2,'Quyết định','Quyetdinh','QĐ',0,0,1,2,1,NULL,'2012-10-01 00:00:00',0,1,0),(3,'Thông báo','Thongbao','TB',0,0,1,1,1,NULL,'2012-10-01 00:00:00',0,1,0),(4,'Giấy mời','Giaymoi','GM',1,1,1,1,1,NULL,'2012-10-01 00:00:00',0,1,0),(5,'Tờ trình','Totrinh','TTr',0,0,1,1,1,NULL,'2012-10-01 00:00:00',0,1,0),(6,'Chương trình','Chuongtrinh','CTr',0,0,1,1,1,NULL,'2012-10-01 00:00:00',NULL,1,0),(7,'Thông tư','Thongtu','TT',0,0,2,2,2,NULL,'2012-10-01 00:00:00',0,1,0),(8,'Biên bản','Bienban','BB',0,0,1,1,1,NULL,'2012-10-01 00:00:00',0,1,0),(9,'Kế hoạch','Kehoach','KH',0,0,1,1,1,NULL,'2012-10-01 00:00:00',0,1,0),(10,'Chỉ thị','Chithi','CT',0,0,2,2,2,NULL,'2012-10-01 00:00:00',0,1,0),(11,'Nghị định','Nghidinh','NĐ',0,0,2,2,0,NULL,'2012-10-01 00:00:00',0,1,0),(12,'Nghị quyết','Nghiquyet','NQ',0,0,0,0,0,NULL,'2012-10-01 00:00:00',0,1,0),(13,'Thông tri','Thongtri','Ttri',0,0,0,0,0,NULL,'2012-10-01 00:00:00',0,1,0),(14,'Quy định','Quydinh','QĐi',0,0,0,2,0,NULL,'2012-10-01 00:00:00',0,1,0),(15,'Kết luận','Ketluan','KL',0,0,1,1,1,NULL,'2012-10-01 00:00:00',0,1,0),(16,'Tờ trình liên ngành','To trinh lien nganh','TTrLN',0,0,1,1,1,NULL,'2012-10-03 00:00:00',0,1,0),(17,'Đính chính Văn bản','Dinh chinh Van ban','ĐCVB',0,0,1,1,1,NULL,'2012-10-03 00:00:00',0,1,0);

/*Table structure for table `tbl_docdays` */

DROP TABLE IF EXISTS `tbl_docdays`;

CREATE TABLE `tbl_docdays` (
  `docday_id` int(11) NOT NULL AUTO_INCREMENT,
  `docday_name` varchar(250) DEFAULT NULL,
  `docday_ununicode` varchar(250) DEFAULT NULL,
  `docday_standfor` varchar(250) DEFAULT NULL,
  `docday_num` float DEFAULT '0',
  `docday_date` date DEFAULT NULL,
  `docday_sort` int(11) DEFAULT '0',
  `docday_active` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`docday_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_docdays` */

insert  into `tbl_docdays`(`docday_id`,`docday_name`,`docday_ununicode`,`docday_standfor`,`docday_num`,`docday_date`,`docday_sort`,`docday_active`) values (1,'Thẩm tra phương án phân bổ dự toán chi NSNN của các đơn vị HCSN','Tham tra phuong an phan bo du toan chi NSNN cua cac don vi HCSN','A',5.5,'2012-02-17',0,1),(2,'Xác định giá (tiền) sử dụng đất cho từng dự án đối với các tổ chức','Xac dinh gia (tien) su dung dat cho tung du an doi voi cac to chuc','B',16.5,'2012-02-17',1,1),(3,'Thẩm định hồ sơ đặt hàng các sản phẩm dịch vụ đô thị','Tham dinh ho so dat hang cac san pham dich vu do thi','C',14.5,'2012-02-17',2,1),(4,'Thanh tra thực hiện chính sách pháp luật','Thanh tra thuc hien chinh sach phap luat','D',60,'2012-02-17',3,1),(5,'Mua sắm phương tiện đi lại là xe ô tô','Mua sam phuong tien di lai la xe o to','E',10,'2012-02-17',4,1),(6,'Tham gia ý kiến vào nội dung các văn bản do các Bộ, Ngành Trung ương, UBND Thành phố và các sở, ngành thuộc thành phố dự thảo','Tham gia y kien vao noi dung cac van ban do cac Bo, Nganh Trung uong, UBND Thanh pho va cac so, nganh thuoc thanh pho du thao','F',26,'2012-02-17',5,1),(7,'Dự thảo các văn bản quy phạm pháp luật, văn bản cá biệt do UBND thành phố ban hành mà sở Tài chính được giao chủ trì soạn thảo','Du thao cac van ban quy pham phap luat, van ban ca biet do UBND thanh pho ban hanh ma so Tai chinh duoc giao chu tri soan thao','G',49,'2012-02-17',6,1),(8,'Các văn bản hưỡng dấn nghiệp vụ chuyên môn do Sở Tài chính ban hành','Cac van ban huong dan nghiep vu chuyen mon do So Tai chinh ban hanh','H',21,'2012-02-17',7,1),(9,'Các văn bản về bổ sung dự toán ngân sách: mua sắm tài sản: thanh lý tài sản: dự thảo hợp đồng: thanh lý hợp đồng kinh tế do các đơn vị bên ngoài Sở Tài chính gửi tới','Cac van ban ve bo sung du toan ngan sach mua sam tai san thanh ly tai san du thao hop dong thanh ly hop dong kinh te do cac don vi ben ngoai So Tai chinh gui toi','I',19,'2012-10-02',NULL,1);

/*Table structure for table `tbl_docdt` */

DROP TABLE IF EXISTS `tbl_docdt`;

CREATE TABLE `tbl_docdt` (
  `docDT_id` int(11) NOT NULL AUTO_INCREMENT,
  `docCat_id` int(11) DEFAULT '0' COMMENT 'loai van ban',
  `department_id` int(11) DEFAULT '0' COMMENT 'noi du thao',
  `docDT_num` int(11) DEFAULT '0' COMMENT 'so du thao',
  `docDT_desc` text COMMENT 'trich yeu',
  `docDT_date` date NOT NULL DEFAULT '0000-00-00' COMMENT 'ngay du thao',
  `docDT_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'tinh trang: 0: moi nhap, 1: tra lai, 2: trinh ky, 3: da ky, 4: da gui',
  `docDT_file` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'file dinh kem: 0: chua co, 1: da co',
  `input_per` int(11) DEFAULT '0' COMMENT 'nguoi nhap',
  PRIMARY KEY (`docDT_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_docdt` */

insert  into `tbl_docdt`(`docDT_id`,`docCat_id`,`department_id`,`docDT_num`,`docDT_desc`,`docDT_date`,`docDT_status`,`docDT_file`,`input_per`) values (1,1,28,1,'V/v triển khai tổng vệ sinh, tân trang toàn bộ khu đại sảnh và phòng họp lớn cùng các khu vệ sinh để chào mừng Đại hội Đảng các cấp.','2015-11-23',1,1,40);

/*Table structure for table `tbl_docdtfiles` */

DROP TABLE IF EXISTS `tbl_docdtfiles`;

CREATE TABLE `tbl_docdtfiles` (
  `docDTFile_id` int(11) NOT NULL AUTO_INCREMENT,
  `docDT_id` int(11) DEFAULT '0',
  `docDTFile_name` varchar(250) DEFAULT NULL,
  `docDTFile_path` varchar(250) DEFAULT NULL,
  `docDTFile_ghichu` varchar(250) DEFAULT NULL,
  `docDTFile_date` date NOT NULL DEFAULT '0000-00-00',
  `docDTFile_sort` int(11) DEFAULT '0',
  `docDTFile_active` tinyint(4) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  PRIMARY KEY (`docDTFile_id`),
  KEY `FK_tbl_docoutfiles` (`docDT_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_docdtfiles` */

insert  into `tbl_docdtfiles`(`docDTFile_id`,`docDT_id`,`docDTFile_name`,`docDTFile_path`,`docDTFile_ghichu`,`docDTFile_date`,`docDTFile_sort`,`docDTFile_active`,`user_id`) values (1,1,'DT-1','../doc_uploads_2015/fa87022a38c4a9a66b1d92b963d876e3.jpg',NULL,'0000-00-00',0,0,0);

/*Table structure for table `tbl_docfields` */

DROP TABLE IF EXISTS `tbl_docfields`;

CREATE TABLE `tbl_docfields` (
  `docField_id` int(11) NOT NULL AUTO_INCREMENT,
  `docField_name` varchar(250) DEFAULT NULL,
  `docField_ununicode` varchar(250) DEFAULT NULL,
  `docField_desc` text,
  `docField_date` datetime DEFAULT NULL,
  `docField_sort` int(11) DEFAULT NULL,
  `docField_active` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`docField_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_docfields` */

insert  into `tbl_docfields`(`docField_id`,`docField_name`,`docField_ununicode`,`docField_desc`,`docField_date`,`docField_sort`,`docField_active`,`user_id`) values (1,'Giám sát','Giam sat',NULL,'2015-11-20 00:00:00',NULL,1,NULL),(2,'Xây dựng','Xay dung',NULL,'2015-11-20 00:00:00',NULL,1,NULL),(3,'Tư vấn, lên dự án','Tuvan,lenduan',NULL,'2012-10-01 00:00:00',NULL,1,NULL),(4,'Bảo trì, bảo dưỡng','Baotri,baoduong',NULL,'2012-10-01 00:00:00',NULL,1,NULL),(5,'Vận tải','Van tai',NULL,'2015-11-20 00:00:00',NULL,1,NULL),(6,'Quản lý dự án','Quan ly du an',NULL,'2015-11-20 00:00:00',NULL,1,NULL),(7,'Khảo sát','Khao sat',NULL,'2015-11-20 00:00:00',NULL,1,NULL);

/*Table structure for table `tbl_docfiles` */

DROP TABLE IF EXISTS `tbl_docfiles`;

CREATE TABLE `tbl_docfiles` (
  `docFile_id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_id` int(11) DEFAULT NULL,
  `docFile_name` varchar(250) DEFAULT NULL,
  `docFile_path` varchar(250) DEFAULT NULL,
  `docFile_date` datetime DEFAULT NULL,
  `docFile_sort` int(11) DEFAULT NULL,
  `docFile_active` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`docFile_id`),
  KEY `FK_tbl_docfiles` (`doc_id`),
  CONSTRAINT `FK_tbl_docfiles` FOREIGN KEY (`doc_id`) REFERENCES `tbl_docs` (`doc_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_docfiles` */

insert  into `tbl_docfiles`(`docFile_id`,`doc_id`,`docFile_name`,`docFile_path`,`docFile_date`,`docFile_sort`,`docFile_active`,`user_id`) values (1,46,'02/CV-CC2','../doc_uploads_2016/62f948e10ab6dc5f7e1e5de3533d3ce0.jpg','2016-02-17 00:00:00',NULL,NULL,49),(2,46,'01/CV-KHKT','../doc_uploads_2016/00e7f67e3bcb8751f03147361532da70.jpg','2016-02-17 00:00:00',NULL,NULL,49);

/*Table structure for table `tbl_doclevels` */

DROP TABLE IF EXISTS `tbl_doclevels`;

CREATE TABLE `tbl_doclevels` (
  `docLevel_id` int(11) NOT NULL AUTO_INCREMENT,
  `docLevel_name` varchar(250) DEFAULT NULL,
  `docLevel_standfor` varchar(250) DEFAULT NULL,
  `docLevel_desc` text,
  `docLevel_date` datetime DEFAULT NULL,
  `docLevel_sort` int(11) DEFAULT NULL,
  `docLevel_active` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`docLevel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_doclevels` */

insert  into `tbl_doclevels`(`docLevel_id`,`docLevel_name`,`docLevel_standfor`,`docLevel_desc`,`docLevel_date`,`docLevel_sort`,`docLevel_active`,`user_id`) values (1,'Bên ngoài','BN',NULL,'2015-11-20 00:00:00',NULL,1,NULL),(2,'Nội bộ','NB',NULL,'2015-11-20 00:00:00',NULL,1,NULL);

/*Table structure for table `tbl_docoutfiles` */

DROP TABLE IF EXISTS `tbl_docoutfiles`;

CREATE TABLE `tbl_docoutfiles` (
  `docOutFile_id` int(11) NOT NULL AUTO_INCREMENT,
  `docOut_id` int(11) DEFAULT '0',
  `docOutFile_name` varchar(250) DEFAULT NULL,
  `docOutFile_path` varchar(250) DEFAULT NULL,
  `docOutFile_date` datetime DEFAULT NULL,
  `docOutFile_sort` int(11) DEFAULT '0',
  `docOutFile_active` tinyint(4) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  PRIMARY KEY (`docOutFile_id`),
  KEY `FK_tbl_docoutfiles` (`docOut_id`),
  CONSTRAINT `FK_tbl_docoutfiles` FOREIGN KEY (`docOut_id`) REFERENCES `tbl_docouts` (`docOut_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_docoutfiles` */

/*Table structure for table `tbl_docouts` */

DROP TABLE IF EXISTS `tbl_docouts`;

CREATE TABLE `tbl_docouts` (
  `docOut_id` int(11) NOT NULL AUTO_INCREMENT,
  `docDT_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ma van ban du thao',
  `docField_id` varchar(250) DEFAULT NULL,
  `docCat_id` int(11) DEFAULT '0',
  `department_id` int(11) DEFAULT '0',
  `unit_name` varchar(250) DEFAULT NULL COMMENT 'noi nhan',
  `unit_name_02` varchar(250) DEFAULT NULL COMMENT 'noi nhan tu danh',
  `docOut_num` int(11) DEFAULT '0' COMMENT 'he so chung',
  `docOut_num_typical` int(11) DEFAULT '0' COMMENT 'he so rieng',
  `docOut_code` varchar(250) DEFAULT NULL,
  `docOut_desc` text,
  `docOut_note` varchar(250) DEFAULT NULL,
  `docOut_pagenum` int(11) DEFAULT '0' COMMENT 'so trang',
  `secret_id` int(11) NOT NULL DEFAULT '0' COMMENT 'do mat',
  `important_id` int(11) NOT NULL DEFAULT '0' COMMENT 'do khan',
  `docOut_signed` int(11) DEFAULT '0' COMMENT 'ng ky',
  `interdisci_name` varchar(250) DEFAULT '0' COMMENT 'ng ky lien nganh',
  `interdisci_name_02` varchar(250) DEFAULT NULL COMMENT 'ng ky lien nganh tu danh',
  `docOut_obj` varchar(250) DEFAULT NULL COMMENT 'chuc vu ',
  `docOut_date` datetime DEFAULT NULL,
  `docOut_file` tinyint(4) DEFAULT '0' COMMENT 'tinh trang file',
  `input_per` int(11) DEFAULT '0',
  PRIMARY KEY (`docOut_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_docouts` */

insert  into `tbl_docouts`(`docOut_id`,`docDT_id`,`docField_id`,`docCat_id`,`department_id`,`unit_name`,`unit_name_02`,`docOut_num`,`docOut_num_typical`,`docOut_code`,`docOut_desc`,`docOut_note`,`docOut_pagenum`,`secret_id`,`important_id`,`docOut_signed`,`interdisci_name`,`interdisci_name_02`,`docOut_obj`,`docOut_date`,`docOut_file`,`input_per`) values (1,0,'Xây dựng',1,17,NULL,'UBND Quận Bắc Từ Liêm, Công ty QL và PT nhà Hà Nội',1,0,'1/CV-Hacinco','V/v đề nghị cung cấp mặt bằng kho bãi chứa vật liệu cho giai đoạn 1 công trình trường cao đẳng nghề Nhổn - Bắc Từ Liêm',NULL,1,0,0,31,'0',NULL,'Giám đốc công ty','2016-01-17 00:00:00',0,40),(2,0,'Xây dựng',1,16,NULL,'Công ty QL va fPT nhà Hà Nội',2,0,'2/CV-Hacinco','V/v đề nghị chủ đầu tư công trình nhà tái định cư khu đô thị Đại Kim thanh toán gói thầu số 2.',NULL,2,0,0,31,'0',NULL,'Giám đốc công ty','2016-01-17 00:00:00',2,40);

/*Table structure for table `tbl_docreplys` */

DROP TABLE IF EXISTS `tbl_docreplys`;

CREATE TABLE `tbl_docreplys` (
  `docReply_id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_id` int(11) DEFAULT '0' COMMENT 'ma van ban',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT 'nguoi ra y kien',
  `coordinate_per` varchar(250) NOT NULL DEFAULT '0' COMMENT 'pho lanh dao phoi hop (chuyen cho ld)',
  `coordinate_depart` varchar(250) NOT NULL DEFAULT '0' COMMENT 'phong ban phoi hop (chuyen cho pb)',
  `recevie_per` int(11) NOT NULL DEFAULT '0' COMMENT 'nguoi nhan (pgd)',
  `docReply_date` date DEFAULT NULL COMMENT 'ngay ra y kien',
  `docReply_desc` text COMMENT 'noi dung y kien',
  `docReply_numday` float DEFAULT NULL COMMENT 'so ngay xu ly',
  `docReply_limit_time` date DEFAULT NULL COMMENT 'han xu ly',
  `department_id` varchar(11) NOT NULL DEFAULT '0' COMMENT 'phong phoi hop (chuyen cho pb)',
  `process_per` int(11) NOT NULL DEFAULT '0' COMMENT 'nguoi giai quyet',
  `process_level` int(11) NOT NULL DEFAULT '0' COMMENT 'cap giai quyet',
  `main_department` int(11) NOT NULL DEFAULT '0' COMMENT 'phong chu tri',
  `docReply_sort` int(11) NOT NULL DEFAULT '0',
  `docReply_active` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'hien thi hay ko',
  `docReply_traned` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'da co y kien khac chua',
  `input_per` int(11) NOT NULL DEFAULT '0' COMMENT 'nguoi nhap',
  PRIMARY KEY (`docReply_id`),
  KEY `FK_tbl_docreplys_docs` (`doc_id`),
  CONSTRAINT `FK_tbl_docreplys_docs` FOREIGN KEY (`doc_id`) REFERENCES `tbl_docs` (`doc_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_docreplys` */

insert  into `tbl_docreplys`(`docReply_id`,`doc_id`,`user_id`,`coordinate_per`,`coordinate_depart`,`recevie_per`,`docReply_date`,`docReply_desc`,`docReply_numday`,`docReply_limit_time`,`department_id`,`process_per`,`process_level`,`main_department`,`docReply_sort`,`docReply_active`,`docReply_traned`,`input_per`) values (1,46,31,'0','0',37,'2016-02-16','Chuyển đồng chí Nguyễn Bá Vân - Phó Giám đốc công ty',NULL,'2013-01-01','0',0,0,0,0,1,0,0),(2,47,31,'0','0',0,'2016-02-17','Chuyển Phòng Kế hoạch kỹ thuật',NULL,'2013-01-01','13',0,0,17,0,0,0,0),(3,48,31,'0','0',0,'2016-02-17','Chuyển Ban Trợ lý',NULL,'2016-02-19','0',0,0,13,0,0,0,0),(4,46,37,'0','0',0,'2016-02-17','Chuyển Phòng Kế hoạch kỹ thuật',5,'2016-02-24','13',0,0,17,0,0,1,0),(5,46,43,'0','0',0,'2016-02-17','Gửi đ/c Nhân viên giải quyết',NULL,'2016-02-23','0',50,8,0,0,1,0,43),(7,46,31,'0','0',0,'2016-02-18','Chuyển Phòng Kế hoạch kỹ thuật tiếp tục triển khai.',NULL,'2016-02-29','0',0,0,17,0,0,1,0),(8,46,43,'0','0',0,'2016-02-18','Chuyển đ/c NV giải quyết',NULL,'2016-02-26','0',50,8,0,0,0,0,43);

/*Table structure for table `tbl_docs` */

DROP TABLE IF EXISTS `tbl_docs`;

CREATE TABLE `tbl_docs` (
  `doc_id` int(11) NOT NULL AUTO_INCREMENT,
  `docCat_id` varchar(250) DEFAULT NULL,
  `docField_id` varchar(250) DEFAULT NULL,
  `docLevel_id` int(11) DEFAULT '0',
  `unit_name` varchar(250) DEFAULT NULL COMMENT 'noi gui den',
  `doc_code` varchar(250) DEFAULT NULL COMMENT 'so ky hieu',
  `doc_num` int(11) DEFAULT '0' COMMENT 'so den',
  `doc_desc` text COMMENT 'trich yeu',
  `doc_note` text COMMENT 'dung lam noi dung tham muu',
  `doc_note_code` varchar(250) DEFAULT NULL COMMENT 'so hieu van ban giai quyet',
  `doc_note_sign_date` date NOT NULL DEFAULT '0000-00-00' COMMENT 'ngay ky van ban giai quyet',
  `doc_note_sign_per` varchar(250) DEFAULT NULL COMMENT 'nguoi ky van ban giai quyet',
  `doc_note_date` date NOT NULL DEFAULT '0000-00-00' COMMENT 'ngay giai quyet',
  `doc_recevied` date NOT NULL DEFAULT '0000-00-00',
  `doc_limit_time` date NOT NULL DEFAULT '0000-00-00' COMMENT 'han giai quyet (ko dung)',
  `doc_signed` date NOT NULL DEFAULT '0000-00-00' COMMENT 'ngay ky',
  `doc_moved` date NOT NULL DEFAULT '0000-00-00' COMMENT 'ngay phan loai',
  `signPer_id` varchar(250) DEFAULT NULL COMMENT 'nguoi ky',
  `signObj_id` varchar(250) DEFAULT NULL COMMENT 'chuc vu ng ky',
  `secret_id` int(11) DEFAULT '0' COMMENT 'do mat',
  `important_id` int(11) DEFAULT '0' COMMENT 'do khan',
  `doc_date` date NOT NULL DEFAULT '0000-00-00' COMMENT 'ngay nhap',
  `doc_sort` int(11) DEFAULT NULL,
  `doc_traned` tinyint(4) DEFAULT '2' COMMENT 'tinh trang chuyen',
  `doc_replied` tinyint(4) DEFAULT '2' COMMENT 'tinh trang cho y kien chi dao dau tien',
  `doc_active` tinyint(11) DEFAULT '2' COMMENT '2: chua giai quyet, 1: da giai quyet, 3: da bao cao, 4: da xac nhan',
  `doc_file` tinyint(4) DEFAULT '2' COMMENT 'xac dinh van ban co file dinh kem hay chua',
  `user_id` varchar(250) DEFAULT '0' COMMENT 'nguoi nhan phan loai hoac chuyen thang de chi dao',
  `input_per` int(11) DEFAULT '0' COMMENT 'nguoi nhap van ban',
  `doc_theodoi` tinyint(4) DEFAULT '0' COMMENT 'xac dinh van ban can theo doi',
  PRIMARY KEY (`doc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_docs` */

insert  into `tbl_docs`(`doc_id`,`docCat_id`,`docField_id`,`docLevel_id`,`unit_name`,`doc_code`,`doc_num`,`doc_desc`,`doc_note`,`doc_note_code`,`doc_note_sign_date`,`doc_note_sign_per`,`doc_note_date`,`doc_recevied`,`doc_limit_time`,`doc_signed`,`doc_moved`,`signPer_id`,`signObj_id`,`secret_id`,`important_id`,`doc_date`,`doc_sort`,`doc_traned`,`doc_replied`,`doc_active`,`doc_file`,`user_id`,`input_per`,`doc_theodoi`) values (45,'Công văn','Xây dựng',2,'Phòng công chứng NN số 1','01/CV-CC1',1,'Văn bản thử nghiệm số 1',NULL,NULL,'0000-00-00',NULL,'0000-00-00','2016-02-15','1970-01-01','2016-02-15','1970-01-01','Nguyễn Văn Hải','Giám đốc',1,1,'2016-02-15',NULL,2,2,2,2,'0',40,0),(46,'Công văn','Xây dựng',2,'Phòng công chứng NN số 2','02/CV-CC2',2,'Văn bản thử nghiệm số 2','Giao Đ/c Nguyễn Bá Vân chỉ đạo.','02/CV-KHKT','2016-02-17','Trưởng phòng KHKT','2016-02-17','2016-02-15','1970-01-01','2016-02-15','2016-02-16','Ngọ Duy Hiểu','Giám đốc',1,1,'2016-02-15',NULL,1,1,4,1,'31',40,1),(47,'Công văn','Xây dựng',1,'Công ty QL và PT nhà HN','03/CV-QLPTNHN',1,'Văn bản thử nghiệm số 3','Giao Phòng Kế hoạch kỹ thuật giải quyết, ban Trợ lý phối hợp.',NULL,'0000-00-00',NULL,'0000-00-00','2016-02-15','1970-01-01','2016-02-15','2016-02-16','Nguyễn Hữu Độ','Giám đốc',1,1,'2016-02-15',NULL,1,1,2,2,'31',40,0),(48,'Công văn','Xây dựng',2,'Phòng công chứng NN số 3','04/CV-CC3',3,'Văn bản thử nghiệm số 4','Giao ban trợ lý giải quyết',NULL,'0000-00-00',NULL,'0000-00-00','2016-02-15','1970-01-01','2016-02-15','2016-02-16','Phạm Văn Khương','Phó giám đốc',1,1,'2016-02-15',NULL,1,1,2,2,'31',40,1),(49,'Công văn','Xây dựng',2,'Phòng công chứng NN số 4','05/CV-CC4',4,'Văn bản thử nghiệm số 5','Gửi phòng Kế hoạch kỹ thuật lên phương án giải quyết',NULL,'0000-00-00',NULL,'0000-00-00','2016-02-15','1970-01-01','2016-02-15','2016-02-16','Vũ Hồng Khanh','Giám đốc',1,1,'2016-02-15',NULL,1,2,2,2,'31',40,0);

/*Table structure for table `tbl_feedbacks` */

DROP TABLE IF EXISTS `tbl_feedbacks`;

CREATE TABLE `tbl_feedbacks` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_id` int(11) DEFAULT '0',
  `feedback_cont` text,
  `feedback_date` datetime DEFAULT NULL,
  `read_status` tinyint(4) DEFAULT '0',
  `read_time` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  PRIMARY KEY (`feedback_id`),
  KEY `FK_tbl_feedbacks` (`doc_id`),
  CONSTRAINT `FK_tbl_feedbacks` FOREIGN KEY (`doc_id`) REFERENCES `tbl_vbs` (`doc_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_feedbacks` */

/*Table structure for table `tbl_hdsds` */

DROP TABLE IF EXISTS `tbl_hdsds`;

CREATE TABLE `tbl_hdsds` (
  `hdsd_id` int(11) NOT NULL AUTO_INCREMENT,
  `hdsd_name` varchar(250) DEFAULT NULL,
  `hdsd_path` varchar(250) DEFAULT NULL,
  `hdsd_date` date DEFAULT NULL,
  `hdsd_sort` int(11) DEFAULT NULL,
  `hdsd_active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`hdsd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_hdsds` */

insert  into `tbl_hdsds`(`hdsd_id`,`hdsd_name`,`hdsd_path`,`hdsd_date`,`hdsd_sort`,`hdsd_active`) values (1,'Văn thư - Tạo lịch lãnh đạo','../hdsd_uploads/d264e4b7b88b740265b2c36c849a1e45.swf','2016-01-15',NULL,1),(2,'Quản trị - Quản lý thiết bị','../hdsd_uploads/e679b049cfc782e011867729bd2e28e3.swf','2016-01-15',NULL,1);

/*Table structure for table `tbl_holidays` */

DROP TABLE IF EXISTS `tbl_holidays`;

CREATE TABLE `tbl_holidays` (
  `holiday_id` int(11) NOT NULL AUTO_INCREMENT,
  `holiday_name` varchar(250) DEFAULT NULL,
  `holiday_date` date DEFAULT NULL,
  `holiday_sort` int(11) DEFAULT NULL,
  `holiday_active` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`holiday_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_holidays` */

insert  into `tbl_holidays`(`holiday_id`,`holiday_name`,`holiday_date`,`holiday_sort`,`holiday_active`) values (8,'Nghỉ 30/04','2013-04-29',NULL,1),(9,'Nghỉ 30/04 (Giải phóng miền nam)','2013-04-30',NULL,1),(10,'Nghỉ 01/05 (QTLĐ)','2013-05-01',NULL,1),(11,'Nghỉ 02/09 (Quốc khánh)','2013-09-02',2,1),(12,'Nghỉ du lịch','2013-06-27',0,1),(13,'Nghỉ du lịch','2013-06-28',1,1);

/*Table structure for table `tbl_importants` */

DROP TABLE IF EXISTS `tbl_importants`;

CREATE TABLE `tbl_importants` (
  `important_id` int(11) NOT NULL AUTO_INCREMENT,
  `important_name` varchar(250) DEFAULT NULL,
  `important_desc` text,
  `important_date` datetime DEFAULT NULL,
  `important_sort` int(11) DEFAULT '0',
  `important_active` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`important_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_importants` */

insert  into `tbl_importants`(`important_id`,`important_name`,`important_desc`,`important_date`,`important_sort`,`important_active`) values (1,'Bình thường','<p>&#160;</p>','2011-04-12 00:00:00',NULL,1),(2,'Khẩn','<p>&#160;</p>','2011-07-25 00:00:00',0,1),(3,'Tối khẩn','<p>&#160;</p>','2011-07-25 00:00:00',0,1);

/*Table structure for table `tbl_interdiscis` */

DROP TABLE IF EXISTS `tbl_interdiscis`;

CREATE TABLE `tbl_interdiscis` (
  `interdisci_id` int(11) NOT NULL AUTO_INCREMENT,
  `interdisci_name` varchar(250) DEFAULT NULL,
  `interdisci_ununicode` varchar(250) DEFAULT NULL,
  `interdisci_desc` text,
  `interdisci_date` datetime DEFAULT NULL,
  `interdisci_sort` int(11) DEFAULT NULL,
  `interdisci_active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`interdisci_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_interdiscis` */

insert  into `tbl_interdiscis`(`interdisci_id`,`interdisci_name`,`interdisci_ununicode`,`interdisci_desc`,`interdisci_date`,`interdisci_sort`,`interdisci_active`) values (4,'Nguyễn Trọng Đông','Nguyen Trong Dong','<p>&#160;</p>','2011-11-29 00:00:00',NULL,1),(5,'Hà Minh Hải','Ha Minh Hai','<p>&#160;</p>','2011-11-29 00:00:00',NULL,1),(6,'Đoàn Thanh Long','Doan Thanh Long','<p>&#160;</p>','2011-11-29 00:00:00',NULL,1);

/*Table structure for table `tbl_levels` */

DROP TABLE IF EXISTS `tbl_levels`;

CREATE TABLE `tbl_levels` (
  `level_id` int(11) NOT NULL AUTO_INCREMENT,
  `level_name` varchar(250) DEFAULT NULL,
  `level_desc` text,
  `level_date` datetime DEFAULT NULL,
  `level_sort` int(11) DEFAULT '0',
  `level_active` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_levels` */

insert  into `tbl_levels`(`level_id`,`level_name`,`level_desc`,`level_date`,`level_sort`,`level_active`) values (1,'Quốc hội','<p>Quốc hội là cấp bầu cử cao nhất tại Việt Nam</p>','2011-03-15 00:00:00',NULL,1),(2,'Tỉnh - Thành phố','<p>Tỉnh - Thành phố là cấp bầu cử thứ 2 dưới Quốc hội</p>','2011-03-15 00:00:00',0,1),(3,'Quận - Huyện - Thị Xã - TP trực thuộc','<p>Quận - Huyện - Thị Xã - TP trực thuộc là cấp bầu cử thứ 3 dưới Tỉnh - Thành phố</p>','2011-03-15 00:00:00',0,1),(4,'Phường - Xã - Thị Trấn','<p>Phường - Xã - Thị Trấn là cấp bầu cử thứ 4 cũng là thấp nhất.</p>','2011-03-15 00:00:00',0,1);

/*Table structure for table `tbl_modules` */

DROP TABLE IF EXISTS `tbl_modules`;

CREATE TABLE `tbl_modules` (
  `mod_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_name` varchar(255) DEFAULT NULL,
  `mod_desc` varchar(255) DEFAULT NULL,
  `mod_date` datetime DEFAULT NULL,
  `mod_sort` int(11) DEFAULT '0',
  `mod_active` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`mod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=286 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_modules` */

insert  into `tbl_modules`(`mod_id`,`mod_name`,`mod_desc`,`mod_date`,`mod_sort`,`mod_active`) values (259,'chat',NULL,NULL,0,0),(260,'config',NULL,NULL,0,0),(261,'congviecs',NULL,NULL,0,0),(262,'daydocs',NULL,NULL,0,0),(263,'departments',NULL,NULL,0,0),(264,'docs',NULL,NULL,0,0),(265,'hdsds',NULL,NULL,0,0),(266,'holidays',NULL,NULL,0,0),(267,'importants',NULL,NULL,0,0),(268,'interdiscis',NULL,NULL,0,0),(269,'kdls',NULL,NULL,0,0),(270,'modules',NULL,NULL,0,0),(271,'msgs',NULL,NULL,0,0),(272,'objects',NULL,NULL,0,0),(273,'plans',NULL,NULL,0,0),(274,'ports',NULL,NULL,0,0),(275,'secrets',NULL,NULL,0,0),(276,'signobjs',NULL,NULL,0,0),(277,'signpers',NULL,NULL,0,0),(278,'thamgia',NULL,NULL,0,0),(279,'thangluongs',NULL,NULL,0,0),(280,'trinhdos',NULL,NULL,0,0),(282,'units',NULL,NULL,0,0),(283,'users',NULL,NULL,0,0),(284,'vttbs',NULL,NULL,0,0),(285,'truyennhans',NULL,NULL,0,0);

/*Table structure for table `tbl_msgs` */

DROP TABLE IF EXISTS `tbl_msgs`;

CREATE TABLE `tbl_msgs` (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_sent` int(11) DEFAULT '0',
  `user_recevie` varchar(250) DEFAULT '0',
  `msg_name` varchar(250) DEFAULT NULL,
  `msg_cont` text,
  `msg_date` date DEFAULT NULL,
  `msg_sort` int(11) DEFAULT '0',
  `msg_active` int(11) DEFAULT '0',
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_msgs` */

insert  into `tbl_msgs`(`msg_id`,`user_sent`,`user_recevie`,`msg_name`,`msg_cont`,`msg_date`,`msg_sort`,`msg_active`) values (1,1,'7,11,14',NULL,'Thông báo tổ chức họp công ty.','2013-03-25',0,0),(9,14,'1,10,12,18',NULL,'Tin nhắn lúc nửa đêm','2013-03-25',0,0),(10,1,NULL,NULL,'Tin nhắn nháp 02 - 123456','2013-03-26',NULL,NULL),(15,1,'0',NULL,'Tin nhắn nháp 03','2013-03-26',0,0),(16,14,'1,10,12,18',NULL,'Thông báo đã hoàn thành chức năng tin nhắn\n1. Soạn tin\n2. Hộp thư đến\n3. Hộp thư đi\n4. Tin nháp\n5. Tin rác\n6. Tin quan trọng','2013-03-26',0,0),(17,16,'15',NULL,'gửi tin nhắn đến nguyễn văn Dũng','2013-03-26',0,0),(18,16,'9,13,15',NULL,'chuyển đến nguyễn ngọc hiển','2013-03-26',0,0),(19,1,'8,16,17',NULL,'thông báo tin nhắn đến từ trung tâm tin nhắn 19001098','2013-03-26',0,0),(20,16,'9,13,15',NULL,'tin nhắn đến từ trung tâm sài gòn','2013-03-26',0,0),(21,16,'8,16,17',NULL,'gửi tin nhắn đến lê văn dũng','2013-03-26',0,0),(22,16,'8,16,17',NULL,'thông báo khẩn đề nghị các đồng chí khẩn trương thực hiện','2013-03-26',0,0),(23,16,'8,16,17',NULL,'thông báo khẩn đề nghị các đồng chí khẩn trương thực hiện','2013-03-26',0,0),(24,16,'8,16,17',NULL,'đề nghị các đồng chí khẩn trương thực hiện','2013-03-26',0,0),(25,1,'11',NULL,'tin nhắn mới','2013-03-26',0,0),(26,1,'7,11,14',NULL,'thư gửi mới nhất','2013-03-26',0,0),(27,23,'9,13,15',NULL,'lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll','2013-04-23',0,0),(28,24,'8',NULL,'Đã làm xon tài liệu chưa bạn','2013-04-24',0,0);

/*Table structure for table `tbl_msgusers` */

DROP TABLE IF EXISTS `tbl_msgusers`;

CREATE TABLE `tbl_msgusers` (
  `msgUser_id` int(11) NOT NULL AUTO_INCREMENT,
  `msg_id` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  `msgUser_type` tinyint(4) DEFAULT '0' COMMENT '0: binh thuong, 1: quan trong, 2: rac',
  `msgUser_active` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`msgUser_id`),
  KEY `FK_tbl_msgusers` (`msg_id`),
  CONSTRAINT `FK_tbl_msgusers` FOREIGN KEY (`msg_id`) REFERENCES `tbl_msgs` (`msg_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_msgusers` */

insert  into `tbl_msgusers`(`msgUser_id`,`msg_id`,`user_id`,`msgUser_type`,`msgUser_active`) values (1,1,7,0,0),(2,1,11,0,0),(3,1,14,0,0),(22,9,1,0,1),(23,9,10,0,0),(24,9,12,0,0),(25,9,18,0,0),(26,10,1,1,1),(27,10,10,0,0),(28,10,12,0,0),(29,10,18,0,0),(30,16,1,0,1),(31,16,10,0,0),(32,16,12,0,0),(33,16,18,0,0),(34,17,15,0,0),(35,18,9,0,0),(36,18,13,0,0),(37,18,15,0,0),(38,19,8,0,0),(39,19,16,1,0),(40,19,17,0,0),(41,20,9,0,0),(42,20,13,0,0),(43,20,15,0,0),(44,21,8,0,0),(45,21,16,0,0),(46,21,17,0,0),(47,22,8,0,0),(48,22,16,0,0),(49,22,17,0,0),(50,23,8,0,0),(51,23,16,0,0),(52,23,17,0,0),(53,24,8,0,0),(54,24,16,0,0),(55,24,17,0,0),(56,25,11,0,0),(57,26,7,0,0),(58,26,11,0,0),(59,26,14,0,0),(60,27,9,0,0),(61,27,13,0,0),(62,27,15,0,0),(63,28,8,0,1);

/*Table structure for table `tbl_objects` */

DROP TABLE IF EXISTS `tbl_objects`;

CREATE TABLE `tbl_objects` (
  `object_id` int(11) NOT NULL AUTO_INCREMENT,
  `object_name` varchar(250) DEFAULT NULL,
  `object_standfor` varchar(250) DEFAULT NULL,
  `object_desc` text,
  `object_date` datetime DEFAULT NULL,
  `object_sort` int(11) DEFAULT '0',
  `object_active` tinyint(4) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_objects` */

insert  into `tbl_objects`(`object_id`,`object_name`,`object_standfor`,`object_desc`,`object_date`,`object_sort`,`object_active`,`user_id`) values (1,'Giám đốc công ty','GĐCT','Giám đốc công ty','2015-11-20 00:00:00',NULL,1,NULL),(2,'Phó Giám đốc công ty','PGĐCT','Phó Giám đốc công ty','2015-11-20 00:00:00',NULL,1,NULL),(3,'Giám đốc xí nghiệp','GĐXN','Giám đốc xí nghiệp','2015-11-20 00:00:00',NULL,1,NULL),(4,'Trưởng phòng/ban','TP','Trưởng phòng là người quản lý 1 phòng / ban nào đó.','2012-09-24 00:00:00',NULL,1,NULL),(5,'Phó trường phòng/ban','PTP','Phó trường phòng / ban là người giúp trưởng phòng / ban chia sẻ công việc trong phòng.','2012-09-24 00:00:00',0,1,NULL),(6,'Nhân viên','NV','Nhân viên','2015-11-20 00:00:00',NULL,1,NULL);

/*Table structure for table `tbl_plan_details` */

DROP TABLE IF EXISTS `tbl_plan_details`;

CREATE TABLE `tbl_plan_details` (
  `plan_id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_subject` text COMMENT 'muc tieu cong viec',
  `plan_start` datetime DEFAULT NULL COMMENT 'thoi gian bat dau',
  `plan_end` datetime DEFAULT NULL COMMENT 'thoi gian ket thuc',
  `plan_address` varchar(250) DEFAULT NULL COMMENT 'dia diem',
  `plan_chairman` varchar(250) DEFAULT NULL COMMENT 'chu tri',
  `plan_prepare` varchar(250) DEFAULT NULL COMMENT 'chuan bi',
  `plan_cont` text COMMENT 'thanh phan',
  `plan_date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_plan_details` */

insert  into `tbl_plan_details`(`plan_id`,`plan_subject`,`plan_start`,`plan_end`,`plan_address`,`plan_chairman`,`plan_prepare`,`plan_cont`,`plan_date`,`user_id`) values (1,'Bàn giao các căn hộ chung cư cao tầng OCT5 thuộc Dự án Xây dựng nhà ở CBNV các Ban Đảng Thành ủy và HĐND Tp.Hà Nội (Từ ngày 03/11/2015 - ngày 31/11/2015)','2015-11-23 08:00:00','2015-11-23 11:30:00','Dự án Thành ủy','','','Theo thông báo số 79/TB-TLKT ngày 29/10/2015','2015-11-24',31),(2,'Giao ban công trường dự án HTKT KĐTM Đại Kim','2015-11-23 14:00:00','2015-11-23 16:30:00','Dự án Đại Kim','Q. Trưởng ban QLDA HTKT Đại Kim','Ban QLDA HTKT Đại Kim','Mời đ/c Thanh - GĐ Công ty;\nMời đ/c Quang - PGĐ Công ty;\nBan QLDA HTKT Đại Kim;\nĐại diện các nhà thầu tại dự án','2015-11-24',31),(4,'Kiểm tra an toàn về PCCC đối với làng sinh viên Hacinco','2015-11-25 09:00:00','2015-11-25 10:30:00','LSV Hacinco','Phòng cảnh sát PCCC số 8','P.KHKT, XNDV và KDN, XNDV Hacinco, KSTT','Đ/c Vân - PGĐ Công ty;\nP.KHKT, XNDV và KDN, XNDV Hacinco, KSTT','2015-11-24',37),(5,'Làm việc với XNDV Hacinco về công tác bảo vệ ANTT nhà OCT5','2015-11-24 09:00:00','2015-11-24 11:30:00','VP dự án Thành ủy','Đ/c Long - PGĐ Công ty','XNDV Hacinco','Đ/c Long - PGĐ Công ty;\nĐ/c Long - Phó ban điều hành dự án Thành ủy;\nBQL vận hành nhà OCT5;\nNhân viên hành chính BQL vận hành nhà OCT5;\nLãnh đạo XNDV Hacinco;\nTổ trưởng tổ bảo vệ nhà OCT5','2015-11-24',38),(6,'Tham dự cuộc họp tại công ty QLPT nhà Hà Nội về dự án khu đo thị Đại Kim giai đoạn 3','2015-11-24 08:30:00','2015-11-24 11:30:00','Công ty QLPT nhà Hà Nội','Nguyễn Văn Khang','','','2016-01-17',31),(7,'V/v tổng duyệt dự án trường cao đẳng nghề Nhôn, Bắc Từ Liêm','2015-11-25 14:00:00','2015-11-25 16:00:00','UBND quận Bắc Từ Liêm, Phố Kiều Mai','Nguyễn Xuân Sơn','','','2016-01-17',31),(8,'Tham hội nghị công đoàn công ty Hacinco','2015-11-26 08:30:00','2015-11-26 10:30:00','Hội trường công ty','Nguyễn Văn Thanh','','','2016-01-17',31);

/*Table structure for table `tbl_plancats` */

DROP TABLE IF EXISTS `tbl_plancats`;

CREATE TABLE `tbl_plancats` (
  `plancat_id` int(11) NOT NULL AUTO_INCREMENT,
  `plancat_name` varchar(250) DEFAULT NULL,
  `plancat_date` date DEFAULT NULL,
  `plancat_sort` int(11) DEFAULT NULL,
  `plancat_active` tinyint(4) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`plancat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_plancats` */

/*Table structure for table `tbl_plans` */

DROP TABLE IF EXISTS `tbl_plans`;

CREATE TABLE `tbl_plans` (
  `plan_id` int(11) NOT NULL AUTO_INCREMENT,
  `plancat_id` int(11) DEFAULT NULL COMMENT 'khoa ngoai category',
  `plan_subject` varchar(250) DEFAULT NULL COMMENT 'muc tieu cong viec',
  `plan_start` datetime DEFAULT NULL COMMENT 'thoi gian bat dau',
  `plan_end` datetime DEFAULT NULL COMMENT 'thoi gian ket thuc',
  `plan_zone` varchar(250) DEFAULT NULL COMMENT 'dia diem thuc hien',
  `plan_cont` text COMMENT 'noi nung cong viec',
  `plan_warning` tinyint(4) DEFAULT NULL COMMENT 'trang thai canh bao',
  `plan_date` date DEFAULT NULL,
  `plan_sort` int(11) DEFAULT NULL,
  `plan_show` tinyint(4) DEFAULT NULL COMMENT 'co hien tren lich hay ko',
  `plan_status` tinyint(4) DEFAULT NULL COMMENT 'trang thai hoan thanh',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_plans` */

/*Table structure for table `tbl_ports` */

DROP TABLE IF EXISTS `tbl_ports`;

CREATE TABLE `tbl_ports` (
  `port_id` int(11) NOT NULL AUTO_INCREMENT,
  `port_name` varchar(50) DEFAULT NULL,
  `port_date` date DEFAULT NULL,
  `port_sort` int(11) DEFAULT NULL,
  `port_active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`port_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_ports` */

insert  into `tbl_ports`(`port_id`,`port_name`,`port_date`,`port_sort`,`port_active`) values (1,'COM1','2012-05-16',0,1),(2,'COM2','2012-05-16',8,1),(3,'COM3','2012-05-16',NULL,1),(4,'COM4','2012-05-16',3,1),(5,'COM5','2012-05-16',NULL,1),(6,'COM6','2012-05-16',NULL,1),(7,'COM7','2012-05-16',NULL,1),(8,'COM8','2012-05-16',14,1),(9,'COM9','2012-05-16',NULL,1),(10,'COM10','2012-05-16',0,1),(15,'COM11','2012-09-21',NULL,1),(16,'COM12','2012-09-21',NULL,1),(17,'COM13','2012-09-21',NULL,1),(19,'COM14','2012-09-21',9,1),(21,'COM13','2013-04-23',4,1);

/*Table structure for table `tbl_receives` */

DROP TABLE IF EXISTS `tbl_receives`;

CREATE TABLE `tbl_receives` (
  `receive_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ma van ban den',
  `doc_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ma van ban goc',
  `department_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ma don vi',
  `receive_per` int(11) DEFAULT '0',
  `receive_note` text,
  `receive_time` datetime NOT NULL COMMENT 'thoi gian nhan',
  `receive_sms` tinyint(4) DEFAULT '0' COMMENT 'nhan sms',
  `doc_status` tinyint(4) DEFAULT '0' COMMENT 'tinh trang van ban',
  `read_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'tinh trang xem',
  `read_time` datetime DEFAULT NULL COMMENT 'thoi gian xem',
  `read_per` int(11) DEFAULT '0',
  PRIMARY KEY (`receive_id`),
  KEY `FK_tbl_receives` (`doc_id`),
  KEY `FK1_tbl_receives` (`department_id`),
  CONSTRAINT `FK_tbl_receives` FOREIGN KEY (`doc_id`) REFERENCES `tbl_vbs` (`doc_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_receives` */

insert  into `tbl_receives`(`receive_id`,`doc_id`,`department_id`,`receive_per`,`receive_note`,`receive_time`,`receive_sms`,`doc_status`,`read_status`,`read_time`,`read_per`) values (1,1,17,0,NULL,'2016-01-17 10:01:13',0,0,0,NULL,0),(2,1,23,0,NULL,'2016-01-17 10:01:13',0,0,0,NULL,0);

/*Table structure for table `tbl_recusers` */

DROP TABLE IF EXISTS `tbl_recusers`;

CREATE TABLE `tbl_recusers` (
  `recUser_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0',
  `receive_id` int(11) DEFAULT '0',
  `read_time` datetime DEFAULT NULL,
  `read_status` tinyint(4) DEFAULT '0',
  `recUser_date` datetime DEFAULT NULL,
  PRIMARY KEY (`recUser_id`),
  KEY `FK1_tbl_recusers` (`user_id`),
  KEY `FK_tbl_recusers` (`receive_id`),
  CONSTRAINT `FK_tbl_recusers` FOREIGN KEY (`receive_id`) REFERENCES `tbl_receives` (`receive_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_recusers` */

insert  into `tbl_recusers`(`recUser_id`,`user_id`,`receive_id`,`read_time`,`read_status`,`recUser_date`) values (1,43,1,NULL,0,'2016-01-17 10:01:13'),(2,46,2,NULL,0,'2016-01-17 10:01:13'),(3,47,2,NULL,0,'2016-01-17 10:01:13');

/*Table structure for table `tbl_secrets` */

DROP TABLE IF EXISTS `tbl_secrets`;

CREATE TABLE `tbl_secrets` (
  `secret_id` int(11) NOT NULL AUTO_INCREMENT,
  `secret_name` varchar(250) DEFAULT NULL,
  `secret_desc` text,
  `secret_date` datetime DEFAULT NULL,
  `secret_sort` int(11) DEFAULT '0',
  `secret_active` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`secret_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_secrets` */

insert  into `tbl_secrets`(`secret_id`,`secret_name`,`secret_desc`,`secret_date`,`secret_sort`,`secret_active`) values (1,'Bình thường','<p>&#160;</p>','2011-04-12 00:00:00',0,1),(2,'Mật','<p>&#160;</p>','2011-07-25 00:00:00',0,1),(3,'Tối mật','<p>&#160;</p>','2011-07-25 00:00:00',0,1);

/*Table structure for table `tbl_signobjs` */

DROP TABLE IF EXISTS `tbl_signobjs`;

CREATE TABLE `tbl_signobjs` (
  `signObj_id` int(11) NOT NULL AUTO_INCREMENT,
  `signObj_name` varchar(250) DEFAULT NULL,
  `signObj_ununicode` varchar(250) DEFAULT NULL,
  `signObj_desc` text,
  `signObj_date` datetime DEFAULT NULL,
  `signObj_sort` int(11) DEFAULT '0',
  `signObj_active` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`signObj_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_signobjs` */

insert  into `tbl_signobjs`(`signObj_id`,`signObj_name`,`signObj_ununicode`,`signObj_desc`,`signObj_date`,`signObj_sort`,`signObj_active`) values (1,'Bộ trưởng','Bo truong','<p>&#160;</p>','2011-04-21 00:00:00',NULL,1),(2,'Chủ tịch','Chu tich','<p>&#160;</p>','2011-04-20 00:00:00',NULL,1),(3,'Phó chủ tịch','Pho chu tich','<p>&#160;</p>','2011-04-20 00:00:00',NULL,1),(4,'Thứ trưởng','Thu truong','<p>&#160;</p>','2011-04-20 00:00:00',NULL,1),(5,'Giám đốc','Giam doc','<p>&#160;</p>','2011-04-20 00:00:00',NULL,1),(6,'Phó giám đốc','Pho giam doc','<p>&#160;</p>','2011-04-20 00:00:00',NULL,1),(7,'Trưởng phòng','Truong phong','<p>&#160;</p>','2011-04-20 00:00:00',NULL,1),(8,'Phó trưởng phòng','Pho truong phong','<p>&#160;</p>','2011-04-20 00:00:00',NULL,1),(9,'Phó Văn Phòng','Pho Van Phong','<p>&#160;</p>',NULL,0,1),(10,'Chánh Văn Phòng','Chanh Van Phong','<p>&#160;</p>',NULL,0,1),(11,'Vụ Trưởng','Vu Truong','<p>&#160;</p>',NULL,0,1),(12,'Tổng Giám Đốc','Tong Giam Doc','<p>&#160;</p>',NULL,0,1),(13,'Phó Tổng Giám Đốc','Pho Tong Giam Doc','<p>&#160;</p>',NULL,0,1),(14,'Chủ tịch kiêm Tổng Giám Đốc','Chu tich kiem Tong Giam Doc','<p>&#160;</p>',NULL,0,1),(15,'Cục trưởng','Cuc truong','<p>&#160;</p>',NULL,0,1),(16,'Phó Cục trưởng','Pho Cuc truong','<p>&#160;</p>',NULL,0,1),(17,'Trưởng ban','Truong ban','<p>&#160;</p>',NULL,0,1),(18,'Phó trưởng ban','Pho truong ban','<p>&#160;</p>',NULL,0,1),(19,'Phó Chánh Văn Phòng','Pho Chanh Van Phong','<p>&#160;</p>',NULL,0,1),(20,'Phó Bí Thư Thường Trực','Pho Bi Thu Thuong Truc','<p>&#160;</p>',NULL,0,1),(21,'Viện trưởng','Vien truong','<p>&#160;</p>',NULL,0,1),(22,'Chi cục trưởng','Chi cuc truong','<p>&#160;</p>',NULL,0,1),(23,'Phó Vụ Trưởng','Pho Vu Truong','<p>&#160;</p>',NULL,0,1),(24,'Phó Chi Cục trưởng','Pho Chi Cuc truong','<p>&#160;</p>',NULL,0,1),(25,'Chánh Thanh Tra','Chanh Thanh Tra','<p>&#160;</p>',NULL,0,1),(26,'Chính Phủ','Chinh Phu','<p>&#160;</p>',NULL,0,1),(27,'Cục trưởng Cục QL Giá','Cuc truong Cuc QL Gia','<p>&#160;</p>',NULL,0,1),(28,'Phó Tư Lệnh-Tham mưu trưởng','Pho Tu LenhTham muu truong','<p>&#160;</p>',NULL,0,1),(29,'Phó Ban Thường Trực','Pho Ban Thuong Truc','<p>&#160;</p>',NULL,0,1),(30,'Phó Chánh Thanh tra','Pho Chanh Thanh tra','<p>&#160;</p>',NULL,0,1),(31,'Trưởng Đoàn','Truong Doan','<p>&#160;</p>',NULL,0,1),(32,'Bí thư','Bi thu','<p>&#160;</p>',NULL,0,1),(33,'Hiệu Trưởng','Hieu Truong','<p>&#160;</p>',NULL,0,1),(34,'Phó Tổng Cục Trưởng','Pho Tong Cuc Truong','<p>&#160;</p>',NULL,0,1),(35,'Chủ nhiệm','Chu nhiem','<p>&#160;</p>',NULL,0,1),(36,'Phó Chủ Nhiệm','Pho Chu Nhiem','<p>&#160;</p>',NULL,0,1),(37,'Phụ Trách chung','Phu Trach chung','<p>&#160;</p>',NULL,0,1),(38,'Phó chủ tịch Thường Trực','Pho chu tich Thuong Truc','<p>&#160;</p>',NULL,0,1),(39,'Tổng Biên Tập','Tong Bien Tap','<p>&#160;</p>',NULL,0,1),(40,'Chủ tịch Hội đồng Định giá','Chu tich Hoi dong Dinh gia','<p>&#160;</p>',NULL,0,1),(41,'Trưởng Cơ Quan Thường trực','Truong Co Quan Thuong truc','<p>&#160;</p>',NULL,0,1),(42,'Phó trưởng ban Thường trực','Pho truong ban Thuong truc','<p>&#160;</p>',NULL,0,1),(43,'Chính trị Viên','Chinh tri Vien','<p>&#160;</p>',NULL,0,1),(44,'Uỷ viên thường trực','Uy vien thuong truc','<p>&#160;</p>',NULL,0,1),(45,'Chỉ huy trưởng','Chi huy truong','<p>&#160;</p>',NULL,0,1);

/*Table structure for table `tbl_signpers` */

DROP TABLE IF EXISTS `tbl_signpers`;

CREATE TABLE `tbl_signpers` (
  `signPer_id` int(11) NOT NULL AUTO_INCREMENT,
  `signPer_name` varchar(250) DEFAULT NULL,
  `signPer_ununicode` varchar(250) DEFAULT NULL,
  `signPer_desc` text,
  `signPer_date` datetime DEFAULT NULL,
  `signPer_sort` int(11) DEFAULT '0',
  `signPer_active` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`signPer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_signpers` */

insert  into `tbl_signpers`(`signPer_id`,`signPer_name`,`signPer_ununicode`,`signPer_desc`,`signPer_date`,`signPer_sort`,`signPer_active`) values (1,'Trương Mỹ Hoa','Truong My Hoa','<p>Phó chủ tịch nước</p>','2011-04-20 00:00:00',NULL,1),(2,'Nguyễn Thế Thảo','Nguyen The Thao','<p>Chủ tịch UBND&#160;TP</p>','2011-04-20 00:00:00',NULL,1),(3,'Hoàng Mạnh Hiển','Hoang Manh Hien','<p>Phó CT UBND TP</p>','2011-04-20 00:00:00',NULL,1),(4,'Vũ Hồng Khanh','Vu Hong Khanh','<p>Phó CT UBND TP</p>','2011-04-20 00:00:00',NULL,1),(5,'Vũ Văn Ninh','Vu Van Ninh','<p>Bộ trưởng Bộ Tài Chính</p>','2011-04-21 00:00:00',NULL,1),(6,'Lý Văn Giao','Ly Van Giao','<p>&#160;</p>','2011-04-25 00:00:00',0,1),(7,'Nguyễn Văn Thịnh','Nguyen Van Thinh','<p>&#160;</p>','2011-04-25 00:00:00',0,1),(8,'Đỗ Đình Hồng','Do Dinh Hong','<p>&#160;</p>','2011-04-25 00:00:00',0,1),(9,'Trịnh Duy Hùng','Trinh Duy Hung','<p>&#160;</p>','2011-04-25 00:00:00',0,1),(10,'Nguyễn Ngọc Sơn','Nguyen Ngoc Son','<p>&#160;</p>','2011-04-25 00:00:00',0,1),(11,'Phí Thái Bình','Phi Thai Binh','<p>&#160;</p>','2011-04-25 00:00:00',0,1),(12,'Nguyễn Thị Bích Ngọc','Nguyen Thi Bich Ngoc','<p>Phó Chủ Tịch</p>','2011-04-28 00:00:00',0,1),(13,'Nguyễn Huy Tưởng','Nguyen Huy Tuong','<p>Phó Chủ Tịch</p>','2011-04-28 00:00:00',0,1),(14,'Nguyễn Thịnh Thành','Nguyen Thinh Thanh','<p>Phó Văn Phòng</p>','2011-04-28 00:00:00',0,1),(15,'Nguyễn Văn Sửu','Nguyen Van Suu','<p>Giám Đốc</p>','2011-04-28 00:00:00',0,1),(16,'Nguyễn Thị Bài','Nguyen Thi Bai','<p>Phó Giám Đốc</p>','2011-04-28 00:00:00',0,1),(17,'Trần Đức Vũ','Tran Duc Vu','<p>Phó Giám Đốc</p>','2011-04-28 00:00:00',0,1),(18,'Trần Ngọc Nam','Tran Ngoc Nam','<p>Phó Giám Đốc</p>','2011-04-28 00:00:00',0,1),(19,'Phạm Văn Khương','Pham Van Khuong','<p>Phó Giám Đốc</p>','2011-04-28 00:00:00',0,1),(20,'Nguyễn Danh Cơ','Nguyen Danh Co','<p>Chánh Văn Phòng</p>','2011-04-28 00:00:00',0,1),(21,'Hà Văn Quế','Ha Van Que','<p>Giám đốc</p>','2011-04-28 00:00:00',0,1),(22,'Nguyễn Quốc Tuấn','Nguyen Quoc Tuan','<p>&#160;</p>','2011-04-28 00:00:00',0,1),(23,'Nguyễn Hữu Độ','Nguyen Huu Do','<p>&#160;</p>','2011-04-28 00:00:00',0,1),(24,'Lưu Tiến Định','Luu Tien Dinh','<p>&#160;</p>','2011-04-28 00:00:00',0,1),(25,'Hà Minh Hải','Ha Minh Hai','<p>&#160;</p>','2011-05-06 00:00:00',0,1);

/*Table structure for table `tbl_suachuas` */

DROP TABLE IF EXISTS `tbl_suachuas`;

CREATE TABLE `tbl_suachuas` (
  `suachua_id` int(11) NOT NULL AUTO_INCREMENT,
  `vttb_id` int(11) DEFAULT NULL,
  `suachua_cont` varchar(250) DEFAULT NULL,
  `suachua_cost` int(11) DEFAULT '0',
  `suachua_pttt` tinyint(4) DEFAULT '1',
  `suachua_date` date DEFAULT NULL,
  `suachua_sort` int(11) DEFAULT '0',
  `suachua_active` tinyint(4) DEFAULT '1',
  `user_id` int(11) DEFAULT '0',
  PRIMARY KEY (`suachua_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_suachuas` */

/*Table structure for table `tbl_thangluongs` */

DROP TABLE IF EXISTS `tbl_thangluongs`;

CREATE TABLE `tbl_thangluongs` (
  `thangluong_id` int(11) NOT NULL AUTO_INCREMENT,
  `chucvu_id` int(11) DEFAULT NULL,
  `thangluong_bac` int(11) DEFAULT NULL,
  `thangluong_heso` float DEFAULT NULL,
  `thangluong_hetbac` tinyint(4) DEFAULT NULL,
  `thangluong_sonam` int(11) DEFAULT NULL,
  `thangluong_date` date DEFAULT NULL,
  `thangluong_sort` int(11) DEFAULT NULL,
  `thangluong_active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`thangluong_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_thangluongs` */

insert  into `tbl_thangluongs`(`thangluong_id`,`chucvu_id`,`thangluong_bac`,`thangluong_heso`,`thangluong_hetbac`,`thangluong_sonam`,`thangluong_date`,`thangluong_sort`,`thangluong_active`) values (1,1,1,3.5,2,3,'2012-09-26',NULL,1),(2,1,2,4.5,2,3,'2012-09-26',NULL,1),(3,1,3,5.5,1,NULL,'2012-09-26',NULL,1),(4,3,1,2.8,2,3,'2012-09-26',NULL,1),(5,3,2,3.2,2,3,'2012-09-26',NULL,1),(6,3,3,3.6,2,2,'2012-09-26',NULL,1),(7,3,4,4,1,NULL,'2012-09-26',NULL,1),(8,2,1,3,2,3,'2012-09-26',NULL,1),(9,2,2,3.4,2,3,'2012-09-26',NULL,1),(10,2,3,3.8,2,2,'2012-09-26',NULL,1),(11,2,4,4.2,1,NULL,'2012-09-26',NULL,1),(12,4,1,2.8,2,3,'2012-09-26',NULL,1),(13,5,1,2.4,2,3,'2012-09-26',NULL,1),(14,6,1,2,2,2,'2012-09-26',NULL,1);

/*Table structure for table `tbl_thaythes` */

DROP TABLE IF EXISTS `tbl_thaythes`;

CREATE TABLE `tbl_thaythes` (
  `thaythe_id` int(11) NOT NULL AUTO_INCREMENT,
  `vttb_id` int(11) DEFAULT NULL,
  `thaythe_cont` varchar(250) DEFAULT NULL,
  `thaythe_cost` int(11) DEFAULT '0',
  `thaythe_pttt` tinyint(4) DEFAULT '1',
  `thaythe_date` date DEFAULT NULL,
  `thaythe_sort` int(11) DEFAULT '0',
  `thaythe_active` tinyint(4) DEFAULT '1',
  `user_id` int(11) DEFAULT '0',
  PRIMARY KEY (`thaythe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_thaythes` */

/*Table structure for table `tbl_trinhdos` */

DROP TABLE IF EXISTS `tbl_trinhdos`;

CREATE TABLE `tbl_trinhdos` (
  `trinhdo_id` int(11) NOT NULL AUTO_INCREMENT,
  `trinhdo_name` varchar(250) DEFAULT NULL,
  `trinhdo_standfor` varchar(250) DEFAULT NULL,
  `trinhdo_desc` text,
  `trinhdo_date` date DEFAULT NULL,
  `trinhdo_sort` int(11) DEFAULT NULL,
  `trinhdo_active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`trinhdo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_trinhdos` */

insert  into `tbl_trinhdos`(`trinhdo_id`,`trinhdo_name`,`trinhdo_standfor`,`trinhdo_desc`,`trinhdo_date`,`trinhdo_sort`,`trinhdo_active`) values (1,'Cao học','CH','Trình độ cao học, bằng thạc sĩ','2012-09-27',NULL,1),(2,'Đại học','ĐH','Trình độ đại học, bằng cử nhân hoặc bằng tốt nghiệp.','2012-09-27',NULL,1),(3,'Cao đẳng','CĐ','Trình độ cao đẳng, bằng cử nhân hoặc bằng tốt nghiệp','2012-09-27',NULL,1),(4,'Kỹ sư - Kiến trúc sư','KS-KTS','Đại học từ 4.5 năm - 5 năm, bằng kỹ sư / kiến trúc sư.','2012-09-27',NULL,1),(5,'Trung cấp','TC','Trình độ trung cấp, bằng tốt nghiệp','2012-09-27',NULL,1);

/*Table structure for table `tbl_units` */

DROP TABLE IF EXISTS `tbl_units`;

CREATE TABLE `tbl_units` (
  `unit_id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(250) DEFAULT NULL,
  `unit_ununicode` varchar(250) DEFAULT NULL,
  `unit_desc` text,
  `unit_date` datetime DEFAULT NULL,
  `unit_sort` int(11) DEFAULT '0',
  `unit_active` tinyint(4) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_units` */

insert  into `tbl_units`(`unit_id`,`unit_name`,`unit_ununicode`,`unit_desc`,`unit_date`,`unit_sort`,`unit_active`,`user_id`) values (2,'Thành Ủy Hà Nội','Thanh Uy Ha Noi','<p>Thành Ủy Hà Nội</p>','2011-04-20 00:00:00',NULL,1,NULL),(3,'Bộ tài chính','Bo tai chinh','<p>Bộ tài chính</p>','2011-04-20 00:00:00',0,1,NULL),(4,'Bộ nội vụ','Bo noi vu','<p>Bộ nội vụ</p>','2011-04-20 00:00:00',0,1,NULL),(5,'Bộ công thương','Bo cong thuong','<p>Bộ công thương</p>','2011-04-20 00:00:00',NULL,1,NULL),(6,'Đài phát thanh và truyền hình HN.','Dai phat thanh va truyen hinh HN.','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(7,'Ban Quản lý phố cổ HN','Ban Quan ly pho co HN','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(8,'Công an TP HN.','Cong an TP HN.','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(10,'Chi Cục kiểm lâm HN','Chi Cuc kiem lam HN','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(11,'Công ty QL và PT nhà HN','Cong ty QL va PT nha HN','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(13,'Hội Chữ thập đỏ TPHN','Hoi Chu thap do TPHN','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(14,'Hội Cựu chiến binh TPHN','Hoi Cuu chien binh TPHN','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(15,'Hội Liên hiệp phụ nữ TPHN','Hoi Lien hiep phu nu TPHN','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(16,'Hội Liên hiệp văn học nghệ thuật TPHN','Hoi Lien hiep van hoc nghe thuat TPHN','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(17,'Hội Luật gia HN','Hoi Luat gia HN','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(18,'Hội Nông dân HN','Hoi Nong dan HN','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(19,'Hội người mù HN','Hoi nguoi mu HN','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(20,'Hội nhà báo HN','Hoi nha bao HN','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(21,'Liên đoàn lao động TPHN','Lien doan lao dong TPHN','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(22,'Liên hiệp các hội khoa học và kỹ thuật HN','Lien hiep cac hoi khoa hoc va ky thuat HN','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(23,'Liên hiệp các tổ chức hữu nghị TPHN','Lien hiep cac to chuc huu nghi TPHN','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(24,'Liên minh các HTX TPHN','Lien minh cac HTX TPHN','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(25,'Phòng công chứng NN số 1','Phong cong chung NN so 1','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(26,'Phòng công chứng NN số 2','Phong cong chung NN so 2','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(27,'Phòng công chứng NN số 3','Phong cong chung NN so 3','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(28,'Phòng công chứng NN số 4','Phong cong chung NN so 4','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(34,'Phòng TCKH Gia Lâm','Phong TCKH Gia Lam','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(35,'Phòng TCKH Đông Anh','Phong TCKH Dong Anh','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(36,'Phòng TCKH Sóc Sơn','Phong TCKH Soc Son','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(37,'Phòng TCKH Thanh Trì','Phong TCKH Thanh Tri','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(38,'Phòng TCKH Từ Liêm','Phong TCKH Tu Liem','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(39,'Phòng TCKH Đống Đa','Phong TCKH Dong Da','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(40,'Phòng TCKH Ba Đình','Phong TCKH Ba Dinh','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(41,'UBND thành phố HN','UBND thanh pho HN','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(42,'Văn phòng UBND-HN','Van phong UBNDHN','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(43,'Sở Kế hoạch đầu tư TPHN','So Ke hoach dau tu TPHN','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(44,'Sở Nông Nghiệp & PTNT TPHN','So Nong Nghiep & PTNT TPHN','<p>&#160;</p>','2011-04-28 00:00:00',0,1,NULL),(45,'Sở Nội Vụ TPHN','So Noi Vu TPHN','<p>&#160;</p>','2011-04-28 00:00:00',0,1,NULL),(46,'Sở Ngoại Vụ TPHN','So Ngoai Vu TPHN','<p>&#160;</p>','2011-04-28 00:00:00',0,1,NULL),(47,'Sở Quy Hoạch Kiến Trúc TPHN','So Quy Hoach Kien Truc TPHN','<p>&#160;</p>','2011-04-28 00:00:00',0,1,NULL),(48,'Sở Giao Thông TPHN','So Giao Thong TPHN','<p>&#160;</p>','2011-04-28 00:00:00',0,1,NULL),(49,'Sở Xây Dựng TPHN','So Xay Dung TPHN','<p>&#160;</p>','2011-04-28 00:00:00',0,1,NULL),(50,'Ban Thường Vụ Hội LHPN Hà Nội','Ban Thuong Vu Hoi LHPN Ha Noi','<p>&#160;</p>','2011-04-28 00:00:00',0,1,NULL);

/*Table structure for table `tbl_users` */

DROP TABLE IF EXISTS `tbl_users`;

CREATE TABLE `tbl_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` varchar(250) DEFAULT '0',
  `unit_id` int(11) DEFAULT '0',
  `object_id` int(11) DEFAULT '0',
  `user_fullname` varchar(250) DEFAULT NULL,
  `user_name` varchar(250) DEFAULT NULL,
  `user_pass` varchar(250) DEFAULT NULL,
  `user_encode_pass` varchar(250) DEFAULT NULL,
  `user_phone` varchar(250) DEFAULT NULL,
  `user_email` varchar(250) DEFAULT NULL,
  `user_domain` varchar(250) DEFAULT NULL,
  `user_image` varchar(250) DEFAULT NULL,
  `user_sex` tinyint(4) DEFAULT NULL,
  `user_ngay_sinh` varchar(30) DEFAULT NULL,
  `user_noi_sinh` varchar(100) DEFAULT NULL,
  `user_thuong_tru` varchar(250) DEFAULT NULL,
  `user_tam_tru` varchar(250) DEFAULT NULL,
  `trinhdo_id` int(11) DEFAULT NULL,
  `user_cmnd` varchar(30) DEFAULT NULL,
  `user_ngay_cap` varchar(30) DEFAULT NULL,
  `user_noi_cap` varchar(100) DEFAULT NULL,
  `user_ngay_bat_dau` varchar(30) DEFAULT NULL,
  `user_so_tai_khoan` varchar(20) DEFAULT NULL,
  `user_ngan_hang` varchar(100) DEFAULT NULL,
  `per_add` tinyint(1) DEFAULT '0',
  `per_edit` tinyint(1) DEFAULT '0',
  `per_del` tinyint(1) DEFAULT '0',
  `per_act` tinyint(1) DEFAULT '0',
  `per_view` tinyint(1) DEFAULT '0',
  `per_sms` tinyint(1) DEFAULT '0',
  `user_module` varchar(250) DEFAULT '0',
  `user_sort` int(11) DEFAULT '0',
  `user_level` tinyint(1) DEFAULT '0',
  `user_level_tnvb` tinyint(4) DEFAULT '0',
  `user_level_soft` int(11) DEFAULT '3',
  `user_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_users` */

insert  into `tbl_users`(`user_id`,`department_id`,`unit_id`,`object_id`,`user_fullname`,`user_name`,`user_pass`,`user_encode_pass`,`user_phone`,`user_email`,`user_domain`,`user_image`,`user_sex`,`user_ngay_sinh`,`user_noi_sinh`,`user_thuong_tru`,`user_tam_tru`,`trinhdo_id`,`user_cmnd`,`user_ngay_cap`,`user_noi_cap`,`user_ngay_bat_dau`,`user_so_tai_khoan`,`user_ngan_hang`,`per_add`,`per_edit`,`per_del`,`per_act`,`per_view`,`per_sms`,`user_module`,`user_sort`,`user_level`,`user_level_tnvb`,`user_level_soft`,`user_active`) values (1,'3,',3,6,'Quản trị','admin','e10adc3949ba59abbe56e057f20f883e','123456','0972559746','anhvan3103@gmail.com',NULL,'images/userimg/large_images/1361246911_P1040778.jpg',1,'1986-03-31','Từ Liêm, Hà Nội','Xuân Đỉnh, Từ Liêm, Hà Nội','Số 23, ktt X-827, thôn Tân Xuân, Xuân Đỉnh, Từ Liêm, HN',5,'012504687','2002-03-30','Công an TP. Hà Nội','2010-01-01','01035890624','0',NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,1,1,3,1),(31,'12,26,27,13,28,25,15,17,18,16,14,24,23,21,19,20,22,',12,1,'Nguyễn Văn Thanh','thanhnv','e10adc3949ba59abbe56e057f20f883e','123456','0972559746','anhvan3103@gmail.com',NULL,NULL,1,'2015-11-20',NULL,NULL,NULL,2,NULL,'2015-11-20',NULL,'2015-01-01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,4,3,3,1),(37,'12,26,27,13,28,25,15,17,18,16,14,24,23,21,19,20,22,',12,2,'Nguyễn Bá Vân','vannb','e10adc3949ba59abbe56e057f20f883e','123456','0972559746','anhvan3103@gmail.com',NULL,NULL,1,'2014-02-22',NULL,NULL,NULL,1,NULL,'2014-02-22',NULL,'2010-01-01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,5,3,3,1),(38,'12,26,27,13,28,25,15,17,18,16,14,24,23,21,19,20,22,',12,2,'Nguyễn Thăng Long','longnt','e10adc3949ba59abbe56e057f20f883e','123456','0972559746','anhvan3103@gmail.com',NULL,NULL,1,'2015-11-20',NULL,NULL,NULL,2,NULL,'2015-11-20',NULL,'2010-01-01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,5,3,3,1),(39,'12,26,27,13,28,25,15,17,18,16,14,24,23,21,19,20,22,',12,2,'Vũ Đức Tòng','tongvd','e10adc3949ba59abbe56e057f20f883e','123456','0972559746','anhvan3103@gmail.com',NULL,NULL,1,'2015-11-20',NULL,NULL,NULL,2,NULL,'2015-11-20',NULL,'2010-01-01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,5,3,3,1),(40,'15,',15,6,'Văn thư','vanthu','e10adc3949ba59abbe56e057f20f883e','123456','01697613570','vanthu@hacinco.com.vn',NULL,NULL,1,'2015-11-20',NULL,NULL,NULL,2,NULL,'2015-11-20',NULL,'2010-01-01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,2,3,3,1),(41,'13,',13,6,'Trợ lý','troly','e10adc3949ba59abbe56e057f20f883e','123456','0972559746','troly@hacinco.com.vn',NULL,NULL,1,'--',NULL,NULL,NULL,2,NULL,'--',NULL,'2010-01-01',NULL,NULL,0,0,0,0,0,3,'0',0,3,3,3,1),(42,'15,',15,4,'Trưởng phòng HC','tphc','e10adc3949ba59abbe56e057f20f883e','123456','0972559746','anhvan3103@gmail.com',NULL,NULL,1,'--',NULL,NULL,NULL,2,NULL,'--',NULL,'2010-01-01',NULL,NULL,0,0,0,0,0,3,'0',0,6,3,3,1),(43,'17,',17,4,'Trưởng phòng KHKT','tpkhkt','e10adc3949ba59abbe56e057f20f883e','123456','0972559746','anhvan3103@gmail.com',NULL,NULL,1,'--',NULL,NULL,NULL,2,NULL,'--',NULL,'2010-01-01',NULL,NULL,0,0,0,0,0,3,'0',0,6,3,3,1),(44,'26,',26,4,'Trưởng ban QLDA1','tbqlda1','e10adc3949ba59abbe56e057f20f883e','123456','0972559746','anhvan3103@gmail.com',NULL,NULL,1,'--',NULL,NULL,NULL,2,NULL,'--',NULL,'2010-01-01',NULL,NULL,0,0,0,0,0,3,'0',0,6,3,3,1),(45,'27,',27,4,'Trưởng ban QLDA2','tbqlda2','e10adc3949ba59abbe56e057f20f883e','123456','0972559746','anhvan3103@gmail.com',NULL,NULL,1,'--',NULL,NULL,NULL,2,NULL,'--',NULL,'2010-01-01',NULL,NULL,0,0,0,0,0,3,'0',0,6,3,3,1),(46,'23,',23,6,'Nhân viên Hacinco','hacinco','e10adc3949ba59abbe56e057f20f883e','123456','0972559746','hacinco@hacino.com.vn',NULL,NULL,1,'2015-11-24',NULL,NULL,NULL,2,NULL,'2015-11-24',NULL,'2010-01-01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,8,3,3,1),(47,'23,',23,3,'GĐXNDV Hacinco','gdhacinco','e10adc3949ba59abbe56e057f20f883e','123456','0972559746','gdhacinco@hacinco.com.vn',NULL,NULL,1,'--',NULL,NULL,NULL,2,NULL,'--',NULL,'2010-01-01',NULL,NULL,0,0,0,0,0,3,'0',0,6,3,3,1),(48,'15,',15,6,'Nhân viên HCQT','nvhcqt','e10adc3949ba59abbe56e057f20f883e','123456','0972559746','anhvan3103@gmail.com',NULL,NULL,1,'--',NULL,NULL,NULL,2,NULL,'--',NULL,'2010-01-01',NULL,NULL,0,0,0,0,0,3,'0',0,8,3,3,1),(49,'17,',17,6,'VT - KHKT','vt_khkt','e10adc3949ba59abbe56e057f20f883e','123456','0972559746','anhvan3103@gmail.com',NULL,NULL,1,'2016-02-17',NULL,NULL,NULL,2,NULL,'2016-02-17',NULL,'2016-02-17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,10,3,3,1),(50,'17,',17,6,'CV - KHKT','cv_khkt','e10adc3949ba59abbe56e057f20f883e','123456','0972559746','anhvan3103@gmail.com',NULL,NULL,1,'--',NULL,NULL,NULL,2,NULL,'--',NULL,'--',NULL,NULL,0,0,0,0,0,0,'0',0,8,3,3,1);

/*Table structure for table `tbl_userunits` */

DROP TABLE IF EXISTS `tbl_userunits`;

CREATE TABLE `tbl_userunits` (
  `userUnit_id` int(11) NOT NULL AUTO_INCREMENT,
  `userUnit_name` varchar(250) DEFAULT NULL,
  `userUnit_desc` text,
  `userUnit_date` datetime DEFAULT NULL,
  `userUnit_sort` int(11) DEFAULT '0',
  `userUnit_active` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`userUnit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_userunits` */

/*Table structure for table `tbl_vbfiles` */

DROP TABLE IF EXISTS `tbl_vbfiles`;

CREATE TABLE `tbl_vbfiles` (
  `docFile_id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_id` int(11) DEFAULT '0',
  `docFile_name` varchar(250) DEFAULT NULL,
  `docFile_path` varchar(250) DEFAULT NULL,
  `docFile_date` date DEFAULT NULL,
  `docFile_sort` int(11) DEFAULT '0',
  `docFile_active` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  PRIMARY KEY (`docFile_id`),
  KEY `FK_tbl_vbfiles` (`doc_id`),
  CONSTRAINT `FK_tbl_vbfiles` FOREIGN KEY (`doc_id`) REFERENCES `tbl_vbs` (`doc_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_vbfiles` */

insert  into `tbl_vbfiles`(`docFile_id`,`doc_id`,`docFile_name`,`docFile_path`,`docFile_date`,`docFile_sort`,`docFile_active`,`user_id`) values (1,1,'234/CV-UBND','../doc_uploads_2015/fa87022a38c4a9a66b1d92b963d876e3.jpg','2016-01-17',0,0,1);

/*Table structure for table `tbl_vbreplyfiles` */

DROP TABLE IF EXISTS `tbl_vbreplyfiles`;

CREATE TABLE `tbl_vbreplyfiles` (
  `docreplyfile_id` int(11) NOT NULL AUTO_INCREMENT,
  `docreply_id` int(11) DEFAULT '0',
  `docreplyfile_name` varchar(250) DEFAULT NULL,
  `docreplyfile_path` varchar(250) DEFAULT NULL,
  `docreplyfile_date` datetime DEFAULT NULL,
  `docreplyfile_sort` int(11) DEFAULT '0',
  `docreplyfile_active` tinyint(4) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  PRIMARY KEY (`docreplyfile_id`),
  KEY `FK_tbl_vbreplyfiles` (`docreply_id`),
  CONSTRAINT `FK_tbl_vbreplyfiles` FOREIGN KEY (`docreply_id`) REFERENCES `tbl_vbreplys` (`docreply_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_vbreplyfiles` */

/*Table structure for table `tbl_vbreplys` */

DROP TABLE IF EXISTS `tbl_vbreplys`;

CREATE TABLE `tbl_vbreplys` (
  `docreply_id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_id` int(11) DEFAULT '0',
  `docCat_id` varchar(250) DEFAULT NULL,
  `docField_id` varchar(250) DEFAULT NULL,
  `docreply_unit` varchar(250) DEFAULT NULL,
  `docreply_code` varchar(250) DEFAULT NULL,
  `docreply_desc` text,
  `docreply_direct` text COMMENT 'khong dung',
  `docreply_note` text COMMENT 'khong dung',
  `signPer_id` varchar(250) DEFAULT NULL,
  `docreply_signed` date DEFAULT NULL,
  `important_id` int(11) DEFAULT '0' COMMENT 'khong dung',
  `docreply_limit_time` date DEFAULT NULL COMMENT 'khong dung',
  `docreply_date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT '0',
  `docreply_file` tinyint(4) DEFAULT '2',
  PRIMARY KEY (`docreply_id`),
  KEY `FK_tbl_docreplys` (`doc_id`),
  CONSTRAINT `FK_tbl_docreplys` FOREIGN KEY (`doc_id`) REFERENCES `tbl_vbs` (`doc_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_vbreplys` */

insert  into `tbl_vbreplys`(`docreply_id`,`doc_id`,`docCat_id`,`docField_id`,`docreply_unit`,`docreply_code`,`docreply_desc`,`docreply_direct`,`docreply_note`,`signPer_id`,`docreply_signed`,`important_id`,`docreply_limit_time`,`docreply_date`,`user_id`,`docreply_file`) values (1,1,'Báo cáo','Xây dựng','Xí nghiệp DV Hacinco','Không có','V/v trả lời công văn số 234/CV-UBND.',NULL,NULL,'Nguyễn Văn Hạnh','2016-01-17',0,NULL,'2016-01-17',46,2);

/*Table structure for table `tbl_vbs` */

DROP TABLE IF EXISTS `tbl_vbs`;

CREATE TABLE `tbl_vbs` (
  `doc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'khoa chinh',
  `docin_id` int(11) DEFAULT '0',
  `docout_id` int(11) DEFAULT '0',
  `docCat_id` varchar(250) DEFAULT NULL COMMENT 'loai van ban',
  `docField_id` varchar(250) DEFAULT NULL COMMENT 'linh vuc',
  `doc_unit` varchar(250) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL COMMENT 'don vi phat hanh',
  `doc_code` varchar(250) DEFAULT NULL COMMENT 'ky hieu',
  `doc_desc` text COMMENT 'trich yeu',
  `doc_direct` text COMMENT 'y kien chi dao',
  `doc_note` text COMMENT 'ghi chu',
  `doc_signed` datetime DEFAULT NULL COMMENT 'ngay ky',
  `signPer_id` varchar(250) DEFAULT NULL COMMENT 'nguoi ky',
  `important_id` int(11) DEFAULT '0' COMMENT 'do khan',
  `secret_id` int(11) DEFAULT '0' COMMENT 'do mat',
  `doc_date` datetime DEFAULT NULL COMMENT 'ngay nhap',
  `doc_limit_time` date DEFAULT NULL COMMENT 'han giai quyet',
  `doc_sort` int(11) DEFAULT '0' COMMENT 'sap xep',
  `doc_active` tinyint(11) DEFAULT '2' COMMENT 'tinh trang',
  `doc_file` tinyint(4) DEFAULT '2' COMMENT 'tinh trang file',
  `user_id` int(11) DEFAULT '0' COMMENT 'nguoi nhap',
  `doc_intype` tinyint(4) DEFAULT '0' COMMENT 'kieu nhap: 0 - tay, 1 - vb den/di : hien tai ko dung',
  PRIMARY KEY (`doc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_vbs` */

insert  into `tbl_vbs`(`doc_id`,`docin_id`,`docout_id`,`docCat_id`,`docField_id`,`doc_unit`,`department_id`,`doc_code`,`doc_desc`,`doc_direct`,`doc_note`,`doc_signed`,`signPer_id`,`important_id`,`secret_id`,`doc_date`,`doc_limit_time`,`doc_sort`,`doc_active`,`doc_file`,`user_id`,`doc_intype`) values (1,42,42,'Công văn','Xây dựng',NULL,17,'234/CV-UBND','Về việc triển khai công trình thuộc dự án Xây dựng cơ bản...','Chuyển Ban QLDA1',NULL,'2015-11-23 00:00:00','Nguyễn Phúc Quang',1,1,'2016-01-17 10:13:00',NULL,0,2,2,1,0);

/*Table structure for table `tbl_vttb_cats` */

DROP TABLE IF EXISTS `tbl_vttb_cats`;

CREATE TABLE `tbl_vttb_cats` (
  `vttb_cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `vttb_cat_name` varchar(250) DEFAULT NULL,
  `vttb_cat_ununicode` varchar(250) DEFAULT NULL,
  `vttb_cat_date` date DEFAULT NULL,
  `vttb_cat_sort` int(11) DEFAULT '0',
  `vttb_cat_active` tinyint(1) DEFAULT '1',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`vttb_cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_vttb_cats` */

insert  into `tbl_vttb_cats`(`vttb_cat_id`,`vttb_cat_name`,`vttb_cat_ununicode`,`vttb_cat_date`,`vttb_cat_sort`,`vttb_cat_active`,`user_id`) values (1,'Vật tư thiết bị','Vat tu thiet bi','2013-04-18',0,1,1),(2,'Cơ sở vật chất','Co so vat chat','2013-04-18',0,1,1),(3,'Phương tiện','Phuong tien','2013-04-18',0,1,1),(5,'Các loại khác','Cac loai khac','2013-04-21',NULL,1,1),(6,'Danh mục mới','Danh muc moi','2013-06-22',0,1,1);

/*Table structure for table `tbl_vttb_datlichs` */

DROP TABLE IF EXISTS `tbl_vttb_datlichs`;

CREATE TABLE `tbl_vttb_datlichs` (
  `vttb_datlich_id` int(11) NOT NULL AUTO_INCREMENT,
  `vttb_id` int(11) DEFAULT NULL COMMENT 'khoa ngoai',
  `vttb_datlich_name` varchar(250) DEFAULT NULL COMMENT 'muc dich su dung',
  `vttb_datlich_start` datetime DEFAULT NULL COMMENT 'thoi gian bat dau',
  `vttb_datlich_end` datetime DEFAULT NULL COMMENT 'thoi gian ket thuc',
  `vttb_datlich_date` date DEFAULT NULL COMMENT 'ngay dat lich',
  `vttb_datlich_cost` int(11) DEFAULT '0' COMMENT 'chi phi',
  `vttb_datlich_allow` tinyint(4) DEFAULT NULL COMMENT 'chap thuan',
  `user_id` int(11) DEFAULT '0',
  PRIMARY KEY (`vttb_datlich_id`),
  KEY `FK_tbl_vttb_datlichs` (`vttb_id`),
  CONSTRAINT `FK_tbl_vttb_datlichs` FOREIGN KEY (`vttb_id`) REFERENCES `tbl_vttbs` (`vttb_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_vttb_datlichs` */

insert  into `tbl_vttb_datlichs`(`vttb_datlich_id`,`vttb_id`,`vttb_datlich_name`,`vttb_datlich_start`,`vttb_datlich_end`,`vttb_datlich_date`,`vttb_datlich_cost`,`vttb_datlich_allow`,`user_id`) values (1,3,'Tổ chức họp tổng kết hoạt động cty trong quý I năm 2013.','2013-04-25 08:30:00','2013-04-25 11:30:00',NULL,0,NULL,14),(3,3,'Tổ chức liên hoan cty mừng ngày 30/04 và 01/05.','2013-04-27 15:30:00','2013-04-27 17:30:00',NULL,0,NULL,14),(4,6,'Đi họp','2013-05-09 08:30:00','2013-05-09 11:30:00',NULL,0,NULL,18),(5,4,'Tổ chức gặp gỡ đối tác các nhà cung cấp dịch vụ cho THA.','2013-05-24 08:30:00','2013-05-24 10:30:00',NULL,0,NULL,14),(6,4,'Họp phổ biến kỹ thuật lập trình mới đối với phòng KT và phòng TK-BH','2013-05-24 08:00:00','2013-05-24 11:00:00',NULL,0,NULL,18);

/*Table structure for table `tbl_vttb_repares` */

DROP TABLE IF EXISTS `tbl_vttb_repares`;

CREATE TABLE `tbl_vttb_repares` (
  `vttb_repare_id` int(11) NOT NULL AUTO_INCREMENT,
  `vttb_id` int(11) DEFAULT NULL COMMENT 'khoa ngoai',
  `vttb_repare_name` varchar(250) DEFAULT NULL COMMENT 'noi dung',
  `vttb_repare_cost` int(11) DEFAULT NULL COMMENT 'chi phi',
  `vttb_repare_paid_type` tinyint(1) DEFAULT '1' COMMENT 'hinh thuc thanh toan: 1-tien mat; 2-cong no',
  `vttb_repare_date` date DEFAULT NULL COMMENT 'ngay sua chua',
  `vttb_repare_code` varchar(50) DEFAULT NULL COMMENT 'ma phieu',
  `vttb_repare_unit` varchar(250) DEFAULT NULL COMMENT 'don vi sua chua',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`vttb_repare_id`),
  KEY `FK_tbl_vttb_repares` (`vttb_id`),
  CONSTRAINT `FK_tbl_vttb_repares` FOREIGN KEY (`vttb_id`) REFERENCES `tbl_vttbs` (`vttb_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_vttb_repares` */

insert  into `tbl_vttb_repares`(`vttb_repare_id`,`vttb_id`,`vttb_repare_name`,`vttb_repare_cost`,`vttb_repare_paid_type`,`vttb_repare_date`,`vttb_repare_code`,`vttb_repare_unit`,`user_id`) values (1,1,'Sửa màn hình',550000,2,'2012-02-25','0025/PT-TM','Cty CP Tech-mart',18),(3,1,'Sửa bàn phím',300000,2,'2013-02-24','0072/PT-TM','Cty CP Tech-mart',18),(4,2,'Cài đặt lại window',200000,1,'2016-01-10','28/PC-KT','Công ty Tech-mart',40);

/*Table structure for table `tbl_vttb_replaces` */

DROP TABLE IF EXISTS `tbl_vttb_replaces`;

CREATE TABLE `tbl_vttb_replaces` (
  `vttb_replace_id` int(11) NOT NULL AUTO_INCREMENT,
  `vttb_id` int(11) DEFAULT NULL COMMENT 'khoa ngoai',
  `vttb_replace_name` varchar(250) DEFAULT NULL COMMENT 'noi dung',
  `vttb_replace_cost` int(11) DEFAULT NULL COMMENT 'chi phi',
  `vttb_replace_paid_type` tinyint(1) DEFAULT '1' COMMENT 'hinh thuc thanh toan: 1-tien mat; 2-cong no',
  `vttb_replace_date` date DEFAULT NULL COMMENT 'ngay thay the',
  `vttb_replace_code` varchar(50) DEFAULT NULL COMMENT 'ma phieu',
  `vttb_replace_unit` varchar(250) DEFAULT NULL COMMENT 'don vi thuc hien',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`vttb_replace_id`),
  KEY `FK_tbl_vttb_replaces` (`vttb_id`),
  CONSTRAINT `FK_tbl_vttb_replaces` FOREIGN KEY (`vttb_id`) REFERENCES `tbl_vttbs` (`vttb_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_vttb_replaces` */

insert  into `tbl_vttb_replaces`(`vttb_replace_id`,`vttb_id`,`vttb_replace_name`,`vttb_replace_cost`,`vttb_replace_paid_type`,`vttb_replace_date`,`vttb_replace_code`,`vttb_replace_unit`,`user_id`) values (1,1,'Thay ổ cứng',800000,2,'2013-01-12','0052/PT-TM','Cty CP Tech-mart',18),(2,2,'RAM Kingston 2GB',800000,1,'2016-01-10','24/PC-KT','Công ty Tech-mart',40);

/*Table structure for table `tbl_vttb_subs` */

DROP TABLE IF EXISTS `tbl_vttb_subs`;

CREATE TABLE `tbl_vttb_subs` (
  `vttb_sub_id` int(11) NOT NULL AUTO_INCREMENT,
  `vttb_cat_id` int(11) DEFAULT NULL,
  `vttb_sub_name` varchar(250) DEFAULT NULL,
  `vttb_sub_ununicode` varchar(250) DEFAULT NULL,
  `vttb_sub_type` tinyint(1) DEFAULT '1' COMMENT '1: chi dinh su dung, 2: dat lich su dung',
  `vttb_sub_date` date DEFAULT NULL,
  `vttb_sub_sort` int(11) DEFAULT '0',
  `vttb_sub_active` tinyint(1) DEFAULT '1',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`vttb_sub_id`),
  KEY `FK_tbl_vttb_subs` (`vttb_cat_id`),
  CONSTRAINT `FK_tbl_vttb_subs` FOREIGN KEY (`vttb_cat_id`) REFERENCES `tbl_vttb_cats` (`vttb_cat_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_vttb_subs` */

insert  into `tbl_vttb_subs`(`vttb_sub_id`,`vttb_cat_id`,`vttb_sub_name`,`vttb_sub_ununicode`,`vttb_sub_type`,`vttb_sub_date`,`vttb_sub_sort`,`vttb_sub_active`,`user_id`) values (1,2,'Phòng họp, hội trường','Phong hop, hoi truong',2,'2013-05-22',NULL,1,1),(2,2,'Nhà kho','Nha kho',2,'2013-04-21',0,1,1),(3,3,'Xe oto con','Xe oto con',2,'2013-04-21',0,1,1),(4,3,'Xe tải, bán tải','Xe tai, ban tai',2,'2013-04-21',0,1,1),(5,1,'Máy vi tính','May vi tinh',1,'2013-04-21',NULL,1,1),(6,1,'Thiết bị in ấn, quét, sao chép','Thiet bi in an, quet, sao chep',1,'2013-04-21',NULL,1,1),(8,1,'Điện thoại, Fax','Dien thoai, Fax',1,'2013-04-21',0,1,1),(9,1,'Thiết bị trình chiếu, quay, chụp','Thiet bi trinh chieu, quay, chup',1,'2013-04-21',0,1,1),(10,5,'Thiết bị vệ sinh','Thiet bi ve sinh',1,'2013-04-22',NULL,1,1),(11,5,'Đun nấu, lưu trữ thực phẩm','Dun nau, luu tru thuc pham',1,'2013-04-22',NULL,1,1),(12,5,'Thiết bị chiếu sáng','Thiet bi chieu sang',1,'2013-04-21',0,1,1),(13,1,'Máy chủ và thiết bị liên quan','May chu va thiet bi lien quan',1,'2013-04-22',0,1,1),(14,6,'Phụ mục 1','Phu muc 1',1,'2013-06-22',0,1,1);

/*Table structure for table `tbl_vttbs` */

DROP TABLE IF EXISTS `tbl_vttbs`;

CREATE TABLE `tbl_vttbs` (
  `vttb_id` int(11) NOT NULL AUTO_INCREMENT,
  `vttb_sub_id` int(11) DEFAULT NULL COMMENT 'khoa ngoai',
  `vttb_name` varchar(250) DEFAULT NULL COMMENT 'ten vttb',
  `vttb_desc` varchar(250) DEFAULT NULL COMMENT 'mo ta',
  `vttb_commission` date DEFAULT NULL COMMENT 'hoat dong tu ngay',
  `vttb_limit` date DEFAULT NULL COMMENT 'han phuc vu',
  `vttb_decommission` date DEFAULT NULL COMMENT 'dung hoat dong ngay',
  `vttb_cost` int(11) DEFAULT '0' COMMENT 'chi phi',
  `vttb_useby` int(11) DEFAULT '0' COMMENT 'duoc dung boi',
  `vttb_date` date DEFAULT NULL,
  `vttb_sort` int(11) DEFAULT '0',
  `vttb_active` tinyint(1) DEFAULT '1' COMMENT 'tinh trang',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`vttb_id`),
  KEY `FK_tbl_vttbs` (`vttb_sub_id`),
  CONSTRAINT `FK_tbl_vttbs` FOREIGN KEY (`vttb_sub_id`) REFERENCES `tbl_vttb_subs` (`vttb_sub_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_vttbs` */

insert  into `tbl_vttbs`(`vttb_id`,`vttb_sub_id`,`vttb_name`,`vttb_desc`,`vttb_commission`,`vttb_limit`,`vttb_decommission`,`vttb_cost`,`vttb_useby`,`vttb_date`,`vttb_sort`,`vttb_active`,`user_id`) values (1,5,'Lap-001','Laptop: Emachines (Core-I3, 160GB)','2014-01-01','2018-01-01','0000-00-00',11000000,1,'2016-01-15',NULL,1,1),(2,5,'Lap-002','Laptop Dell (160GB, Ram 2GB)','2014-01-01','2018-01-01','0000-00-00',6500000,40,'2016-01-15',NULL,1,1),(3,1,'Phòng họp số 1','Phòng họp trên tầng 3, khu văn phòng','2008-01-01','2023-01-01','0000-00-00',683000000,0,'2013-04-24',0,1,1),(4,1,'Phòng họp số 2','Phòng họp trên tầng 2, khu văn phòng','2008-01-01','2023-01-01','0000-00-00',400000000,0,'2013-04-24',0,1,1),(5,2,'Kho 01-GL','Kho thuê hạn 7 năm tại Gia Lâm, Hà Nội','2008-01-01','2015-01-01','0000-00-00',840000000,0,'2013-04-24',0,1,1),(6,3,'Toyota - Zace','7 chỗ','2012-01-01','2022-01-01','0000-00-00',700000,0,'2013-05-09',0,1,1),(7,14,'Thiết bị 1','Mô tả','2013-01-01','2016-01-01','2017-01-01',2300000,10,'2013-06-22',0,1,1);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `domain` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`email`,`domain`) values (1,'admin','password','you@yourdomain.com','all');

/*Table structure for table `doc_docreplys` */

DROP TABLE IF EXISTS `doc_docreplys`;

/*!50001 DROP VIEW IF EXISTS `doc_docreplys` */;
/*!50001 DROP TABLE IF EXISTS `doc_docreplys` */;

/*!50001 CREATE TABLE  `doc_docreplys`(
 `doc_id` int(11) ,
 `docCat_id` varchar(250) ,
 `docField_id` varchar(250) ,
 `docLevel_id` int(11) ,
 `unit_name` varchar(250) ,
 `doc_code` varchar(250) ,
 `doc_num` int(11) ,
 `doc_desc` text ,
 `doc_note` text ,
 `doc_recevied` date ,
 `doc_limit_time` date ,
 `doc_signed` date ,
 `doc_moved` date ,
 `signPer_id` varchar(250) ,
 `signObj_id` varchar(250) ,
 `secret_id` int(11) ,
 `important_id` int(11) ,
 `doc_date` date ,
 `doc_sort` int(11) ,
 `doc_traned` tinyint(4) ,
 `doc_replied` tinyint(4) ,
 `doc_active` tinyint(11) ,
 `doc_file` tinyint(4) ,
 `doc_theodoi` tinyint(4) ,
 `user_id` varchar(250) ,
 `input_per` int(11) ,
 `docReply_id` int(11) ,
 `DR_doc_id` int(11) ,
 `DR_user_id` int(11) ,
 `DR_department_id` varchar(11) ,
 `DR_main_department` int(11) ,
 `process_per` int(11) ,
 `docReply_active` tinyint(4) ,
 `docReply_traned` tinyint(4) ,
 `process_level` int(11) ,
 `coordinate_per` varchar(250) ,
 `recevie_per` int(11) ,
 `coordinate_depart` varchar(250) ,
 `docReply_numday` float ,
 `docReply_limit_time` date 
)*/;

/*Table structure for table `doc_late_cv` */

DROP TABLE IF EXISTS `doc_late_cv`;

/*!50001 DROP VIEW IF EXISTS `doc_late_cv` */;
/*!50001 DROP TABLE IF EXISTS `doc_late_cv` */;

/*!50001 CREATE TABLE  `doc_late_cv`(
 `doc_id` int(11) ,
 `docCat_id` varchar(250) ,
 `docField_id` varchar(250) ,
 `docLevel_id` int(11) ,
 `unit_name` varchar(250) ,
 `doc_code` varchar(250) ,
 `doc_num` int(11) ,
 `doc_desc` text ,
 `doc_note` text ,
 `doc_note_date` date ,
 `doc_recevied` date ,
 `doc_limit_time` date ,
 `doc_signed` date ,
 `doc_moved` date ,
 `signPer_id` varchar(250) ,
 `signObj_id` varchar(250) ,
 `secret_id` int(11) ,
 `important_id` int(11) ,
 `doc_date` date ,
 `doc_sort` int(11) ,
 `doc_traned` tinyint(4) ,
 `doc_replied` tinyint(4) ,
 `doc_active` tinyint(11) ,
 `doc_theodoi` tinyint(4) ,
 `doc_file` tinyint(4) ,
 `user_id` varchar(250) ,
 `input_per` int(11) ,
 `docReply_id` int(11) ,
 `DR_doc_id` int(11) ,
 `DR_user_id` int(11) ,
 `DR_department_id` varchar(11) ,
 `DR_main_department` int(11) ,
 `process_per` int(11) ,
 `docReply_active` tinyint(4) ,
 `docReply_traned` tinyint(4) ,
 `process_level` int(11) ,
 `coordinate_per` varchar(250) ,
 `recevie_per` int(11) ,
 `DR_docReply_date` date ,
 `docReply_numday` float ,
 `docReply_limit_time` date 
)*/;

/*Table structure for table `doc_latereport` */

DROP TABLE IF EXISTS `doc_latereport`;

/*!50001 DROP VIEW IF EXISTS `doc_latereport` */;
/*!50001 DROP TABLE IF EXISTS `doc_latereport` */;

/*!50001 CREATE TABLE  `doc_latereport`(
 `doc_id` int(11) ,
 `docCat_id` varchar(250) ,
 `docField_id` varchar(250) ,
 `docLevel_id` int(11) ,
 `unit_name` varchar(250) ,
 `doc_code` varchar(250) ,
 `doc_num` int(11) ,
 `doc_desc` text ,
 `doc_note` text ,
 `doc_note_date` date ,
 `doc_recevied` date ,
 `doc_limit_time` date ,
 `doc_signed` date ,
 `doc_moved` date ,
 `signPer_id` varchar(250) ,
 `signObj_id` varchar(250) ,
 `secret_id` int(11) ,
 `important_id` int(11) ,
 `doc_date` date ,
 `doc_sort` int(11) ,
 `doc_traned` tinyint(4) ,
 `doc_replied` tinyint(4) ,
 `doc_active` tinyint(11) ,
 `doc_theodoi` tinyint(4) ,
 `doc_file` tinyint(4) ,
 `user_id` varchar(250) ,
 `input_per` int(11) ,
 `docReply_id` int(11) ,
 `DR_doc_id` int(11) ,
 `DR_user_id` int(11) ,
 `DR_department_id` varchar(11) ,
 `DR_main_department` int(11) ,
 `process_per` int(11) ,
 `docReply_active` tinyint(4) ,
 `docReply_traned` tinyint(4) ,
 `process_level` int(11) ,
 `coordinate_per` varchar(250) ,
 `recevie_per` int(11) ,
 `DR_docReply_date` date ,
 `docReply_numday` float ,
 `docReply_limit_time` date 
)*/;

/*Table structure for table `doc_receive` */

DROP TABLE IF EXISTS `doc_receive`;

/*!50001 DROP VIEW IF EXISTS `doc_receive` */;
/*!50001 DROP TABLE IF EXISTS `doc_receive` */;

/*!50001 CREATE TABLE  `doc_receive`(
 `doc_id` int(11) ,
 `docCat_id` varchar(250) ,
 `docField_id` varchar(250) ,
 `doc_unit` varchar(250) ,
 `department_id` int(11) ,
 `doc_code` varchar(250) ,
 `doc_desc` text ,
 `doc_direct` text ,
 `doc_note` text ,
 `doc_signed` datetime ,
 `signPer_id` varchar(250) ,
 `important_id` int(11) ,
 `doc_date` datetime ,
 `doc_limit_time` date ,
 `doc_sort` int(11) ,
 `doc_active` tinyint(11) ,
 `doc_file` tinyint(4) ,
 `user_id` int(11) ,
 `receive_id` int(11) ,
 `R_doc_id` int(11) ,
 `R_department_id` int(11) ,
 `receive_per` int(11) ,
 `receive_note` text ,
 `receive_time` datetime ,
 `read_status` tinyint(4) ,
 `read_time` datetime ,
 `read_per` int(11) 
)*/;

/*Table structure for table `doc_reports` */

DROP TABLE IF EXISTS `doc_reports`;

/*!50001 DROP VIEW IF EXISTS `doc_reports` */;
/*!50001 DROP TABLE IF EXISTS `doc_reports` */;

/*!50001 CREATE TABLE  `doc_reports`(
 `doc_id` int(11) ,
 `docCat_id` varchar(250) ,
 `docField_id` varchar(250) ,
 `docLevel_id` int(11) ,
 `unit_name` varchar(250) ,
 `doc_code` varchar(250) ,
 `doc_num` int(11) ,
 `doc_desc` text ,
 `doc_note` text ,
 `doc_note_date` date ,
 `doc_recevied` date ,
 `doc_limit_time` date ,
 `doc_signed` date ,
 `doc_moved` date ,
 `signPer_id` varchar(250) ,
 `signObj_id` varchar(250) ,
 `secret_id` int(11) ,
 `important_id` int(11) ,
 `doc_date` date ,
 `doc_sort` int(11) ,
 `doc_traned` tinyint(4) ,
 `doc_replied` tinyint(4) ,
 `doc_active` tinyint(11) ,
 `doc_theodoi` tinyint(4) ,
 `doc_file` tinyint(4) ,
 `user_id` varchar(250) ,
 `input_per` int(11) ,
 `docReply_id` int(11) ,
 `DR_doc_id` int(11) ,
 `DR_user_id` int(11) ,
 `DR_department_id` varchar(11) ,
 `DR_main_department` int(11) ,
 `process_per` int(11) ,
 `docReply_active` tinyint(4) ,
 `docReply_traned` tinyint(4) ,
 `process_level` int(11) ,
 `coordinate_per` varchar(250) ,
 `recevie_per` int(11) ,
 `DR_docReply_date` date ,
 `docReply_numday` float ,
 `docReply_limit_time` date 
)*/;

/*Table structure for table `doc_users` */

DROP TABLE IF EXISTS `doc_users`;

/*!50001 DROP VIEW IF EXISTS `doc_users` */;
/*!50001 DROP TABLE IF EXISTS `doc_users` */;

/*!50001 CREATE TABLE  `doc_users`(
 `doc_id` int(11) ,
 `docCat_id` varchar(250) ,
 `docField_id` varchar(250) ,
 `docLevel_id` int(11) ,
 `unit_name` varchar(250) ,
 `doc_code` varchar(250) ,
 `doc_num` int(11) ,
 `doc_desc` text ,
 `doc_note` text ,
 `doc_recevied` date ,
 `doc_limit_time` date ,
 `doc_signed` date ,
 `doc_moved` date ,
 `signPer_id` varchar(250) ,
 `signObj_id` varchar(250) ,
 `secret_id` int(11) ,
 `important_id` int(11) ,
 `doc_date` date ,
 `doc_sort` int(11) ,
 `doc_traned` tinyint(4) ,
 `doc_replied` tinyint(4) ,
 `doc_active` tinyint(11) ,
 `doc_file` tinyint(4) ,
 `user_id` varchar(250) ,
 `input_per` int(11) ,
 `user_fullname` varchar(250) ,
 `object_id` int(11) 
)*/;

/*View structure for view doc_docreplys */

/*!50001 DROP TABLE IF EXISTS `doc_docreplys` */;
/*!50001 DROP VIEW IF EXISTS `doc_docreplys` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `doc_docreplys` AS (select `d`.`doc_id` AS `doc_id`,`d`.`docCat_id` AS `docCat_id`,`d`.`docField_id` AS `docField_id`,`d`.`docLevel_id` AS `docLevel_id`,`d`.`unit_name` AS `unit_name`,`d`.`doc_code` AS `doc_code`,`d`.`doc_num` AS `doc_num`,`d`.`doc_desc` AS `doc_desc`,`d`.`doc_note` AS `doc_note`,`d`.`doc_recevied` AS `doc_recevied`,`d`.`doc_limit_time` AS `doc_limit_time`,`d`.`doc_signed` AS `doc_signed`,`d`.`doc_moved` AS `doc_moved`,`d`.`signPer_id` AS `signPer_id`,`d`.`signObj_id` AS `signObj_id`,`d`.`secret_id` AS `secret_id`,`d`.`important_id` AS `important_id`,`d`.`doc_date` AS `doc_date`,`d`.`doc_sort` AS `doc_sort`,`d`.`doc_traned` AS `doc_traned`,`d`.`doc_replied` AS `doc_replied`,`d`.`doc_active` AS `doc_active`,`d`.`doc_file` AS `doc_file`,`d`.`doc_theodoi` AS `doc_theodoi`,`d`.`user_id` AS `user_id`,`d`.`input_per` AS `input_per`,`dr`.`docReply_id` AS `docReply_id`,`dr`.`doc_id` AS `DR_doc_id`,`dr`.`user_id` AS `DR_user_id`,`dr`.`department_id` AS `DR_department_id`,`dr`.`main_department` AS `DR_main_department`,`dr`.`process_per` AS `process_per`,`dr`.`docReply_active` AS `docReply_active`,`dr`.`docReply_traned` AS `docReply_traned`,`dr`.`process_level` AS `process_level`,`dr`.`coordinate_per` AS `coordinate_per`,`dr`.`recevie_per` AS `recevie_per`,`dr`.`coordinate_depart` AS `coordinate_depart`,`dr`.`docReply_numday` AS `docReply_numday`,`dr`.`docReply_limit_time` AS `docReply_limit_time` from (`tbl_docs` `d` join `tbl_docreplys` `dr` on((`d`.`doc_id` = `dr`.`doc_id`)))) */;

/*View structure for view doc_late_cv */

/*!50001 DROP TABLE IF EXISTS `doc_late_cv` */;
/*!50001 DROP VIEW IF EXISTS `doc_late_cv` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `doc_late_cv` AS (select `d`.`doc_id` AS `doc_id`,`d`.`docCat_id` AS `docCat_id`,`d`.`docField_id` AS `docField_id`,`d`.`docLevel_id` AS `docLevel_id`,`d`.`unit_name` AS `unit_name`,`d`.`doc_code` AS `doc_code`,`d`.`doc_num` AS `doc_num`,`d`.`doc_desc` AS `doc_desc`,`d`.`doc_note` AS `doc_note`,`d`.`doc_note_date` AS `doc_note_date`,`d`.`doc_recevied` AS `doc_recevied`,`d`.`doc_limit_time` AS `doc_limit_time`,`d`.`doc_signed` AS `doc_signed`,`d`.`doc_moved` AS `doc_moved`,`d`.`signPer_id` AS `signPer_id`,`d`.`signObj_id` AS `signObj_id`,`d`.`secret_id` AS `secret_id`,`d`.`important_id` AS `important_id`,`d`.`doc_date` AS `doc_date`,`d`.`doc_sort` AS `doc_sort`,`d`.`doc_traned` AS `doc_traned`,`d`.`doc_replied` AS `doc_replied`,`d`.`doc_active` AS `doc_active`,`d`.`doc_theodoi` AS `doc_theodoi`,`d`.`doc_file` AS `doc_file`,`d`.`user_id` AS `user_id`,`d`.`input_per` AS `input_per`,`dr`.`docReply_id` AS `docReply_id`,`dr`.`doc_id` AS `DR_doc_id`,`dr`.`user_id` AS `DR_user_id`,`dr`.`department_id` AS `DR_department_id`,`dr`.`main_department` AS `DR_main_department`,`dr`.`process_per` AS `process_per`,`dr`.`docReply_active` AS `docReply_active`,`dr`.`docReply_traned` AS `docReply_traned`,`dr`.`process_level` AS `process_level`,`dr`.`coordinate_per` AS `coordinate_per`,`dr`.`recevie_per` AS `recevie_per`,`dr`.`docReply_date` AS `DR_docReply_date`,`dr`.`docReply_numday` AS `docReply_numday`,`dr`.`docReply_limit_time` AS `docReply_limit_time` from (`tbl_docs` `d` join `tbl_docreplys` `dr` on(((`d`.`doc_id` = `dr`.`doc_id`) and (`dr`.`process_per` <> 0)))) group by `d`.`doc_id`) */;

/*View structure for view doc_latereport */

/*!50001 DROP TABLE IF EXISTS `doc_latereport` */;
/*!50001 DROP VIEW IF EXISTS `doc_latereport` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `doc_latereport` AS (select `d`.`doc_id` AS `doc_id`,`d`.`docCat_id` AS `docCat_id`,`d`.`docField_id` AS `docField_id`,`d`.`docLevel_id` AS `docLevel_id`,`d`.`unit_name` AS `unit_name`,`d`.`doc_code` AS `doc_code`,`d`.`doc_num` AS `doc_num`,`d`.`doc_desc` AS `doc_desc`,`d`.`doc_note` AS `doc_note`,`d`.`doc_note_date` AS `doc_note_date`,`d`.`doc_recevied` AS `doc_recevied`,`d`.`doc_limit_time` AS `doc_limit_time`,`d`.`doc_signed` AS `doc_signed`,`d`.`doc_moved` AS `doc_moved`,`d`.`signPer_id` AS `signPer_id`,`d`.`signObj_id` AS `signObj_id`,`d`.`secret_id` AS `secret_id`,`d`.`important_id` AS `important_id`,`d`.`doc_date` AS `doc_date`,`d`.`doc_sort` AS `doc_sort`,`d`.`doc_traned` AS `doc_traned`,`d`.`doc_replied` AS `doc_replied`,`d`.`doc_active` AS `doc_active`,`d`.`doc_theodoi` AS `doc_theodoi`,`d`.`doc_file` AS `doc_file`,`d`.`user_id` AS `user_id`,`d`.`input_per` AS `input_per`,`dr`.`docReply_id` AS `docReply_id`,`dr`.`doc_id` AS `DR_doc_id`,`dr`.`user_id` AS `DR_user_id`,`dr`.`department_id` AS `DR_department_id`,`dr`.`main_department` AS `DR_main_department`,`dr`.`process_per` AS `process_per`,`dr`.`docReply_active` AS `docReply_active`,`dr`.`docReply_traned` AS `docReply_traned`,`dr`.`process_level` AS `process_level`,`dr`.`coordinate_per` AS `coordinate_per`,`dr`.`recevie_per` AS `recevie_per`,`dr`.`docReply_date` AS `DR_docReply_date`,`dr`.`docReply_numday` AS `docReply_numday`,`dr`.`docReply_limit_time` AS `docReply_limit_time` from (`tbl_docs` `d` join `tbl_docreplys` `dr` on(((`d`.`doc_id` = `dr`.`doc_id`) and (`dr`.`main_department` <> 0)))) group by `d`.`doc_id`) */;

/*View structure for view doc_receive */

/*!50001 DROP TABLE IF EXISTS `doc_receive` */;
/*!50001 DROP VIEW IF EXISTS `doc_receive` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `doc_receive` AS (select `d`.`doc_id` AS `doc_id`,`d`.`docCat_id` AS `docCat_id`,`d`.`docField_id` AS `docField_id`,`d`.`doc_unit` AS `doc_unit`,`d`.`department_id` AS `department_id`,`d`.`doc_code` AS `doc_code`,`d`.`doc_desc` AS `doc_desc`,`d`.`doc_direct` AS `doc_direct`,`d`.`doc_note` AS `doc_note`,`d`.`doc_signed` AS `doc_signed`,`d`.`signPer_id` AS `signPer_id`,`d`.`important_id` AS `important_id`,`d`.`doc_date` AS `doc_date`,`d`.`doc_limit_time` AS `doc_limit_time`,`d`.`doc_sort` AS `doc_sort`,`d`.`doc_active` AS `doc_active`,`d`.`doc_file` AS `doc_file`,`d`.`user_id` AS `user_id`,`r`.`receive_id` AS `receive_id`,`r`.`doc_id` AS `R_doc_id`,`r`.`department_id` AS `R_department_id`,`r`.`receive_per` AS `receive_per`,`r`.`receive_note` AS `receive_note`,`r`.`receive_time` AS `receive_time`,`r`.`read_status` AS `read_status`,`r`.`read_time` AS `read_time`,`r`.`read_per` AS `read_per` from (`tbl_vbs` `d` join `tbl_receives` `r` on((`d`.`doc_id` = `r`.`doc_id`)))) */;

/*View structure for view doc_reports */

/*!50001 DROP TABLE IF EXISTS `doc_reports` */;
/*!50001 DROP VIEW IF EXISTS `doc_reports` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `doc_reports` AS select `d`.`doc_id` AS `doc_id`,`d`.`docCat_id` AS `docCat_id`,`d`.`docField_id` AS `docField_id`,`d`.`docLevel_id` AS `docLevel_id`,`d`.`unit_name` AS `unit_name`,`d`.`doc_code` AS `doc_code`,`d`.`doc_num` AS `doc_num`,`d`.`doc_desc` AS `doc_desc`,`d`.`doc_note` AS `doc_note`,`d`.`doc_note_date` AS `doc_note_date`,`d`.`doc_recevied` AS `doc_recevied`,`d`.`doc_limit_time` AS `doc_limit_time`,`d`.`doc_signed` AS `doc_signed`,`d`.`doc_moved` AS `doc_moved`,`d`.`signPer_id` AS `signPer_id`,`d`.`signObj_id` AS `signObj_id`,`d`.`secret_id` AS `secret_id`,`d`.`important_id` AS `important_id`,`d`.`doc_date` AS `doc_date`,`d`.`doc_sort` AS `doc_sort`,`d`.`doc_traned` AS `doc_traned`,`d`.`doc_replied` AS `doc_replied`,`d`.`doc_active` AS `doc_active`,`d`.`doc_theodoi` AS `doc_theodoi`,`d`.`doc_file` AS `doc_file`,`d`.`user_id` AS `user_id`,`d`.`input_per` AS `input_per`,`dr`.`docReply_id` AS `docReply_id`,`dr`.`doc_id` AS `DR_doc_id`,`dr`.`user_id` AS `DR_user_id`,`dr`.`department_id` AS `DR_department_id`,`dr`.`main_department` AS `DR_main_department`,`dr`.`process_per` AS `process_per`,`dr`.`docReply_active` AS `docReply_active`,`dr`.`docReply_traned` AS `docReply_traned`,`dr`.`process_level` AS `process_level`,`dr`.`coordinate_per` AS `coordinate_per`,`dr`.`recevie_per` AS `recevie_per`,`dr`.`docReply_date` AS `DR_docReply_date`,`dr`.`docReply_numday` AS `docReply_numday`,`dr`.`docReply_limit_time` AS `docReply_limit_time` from (`tbl_docs` `d` join `tbl_docreplys` `dr` on((`d`.`doc_id` = `dr`.`doc_id`))) group by `d`.`doc_id` */;

/*View structure for view doc_users */

/*!50001 DROP TABLE IF EXISTS `doc_users` */;
/*!50001 DROP VIEW IF EXISTS `doc_users` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `doc_users` AS select `d`.`doc_id` AS `doc_id`,`d`.`docCat_id` AS `docCat_id`,`d`.`docField_id` AS `docField_id`,`d`.`docLevel_id` AS `docLevel_id`,`d`.`unit_name` AS `unit_name`,`d`.`doc_code` AS `doc_code`,`d`.`doc_num` AS `doc_num`,`d`.`doc_desc` AS `doc_desc`,`d`.`doc_note` AS `doc_note`,`d`.`doc_recevied` AS `doc_recevied`,`d`.`doc_limit_time` AS `doc_limit_time`,`d`.`doc_signed` AS `doc_signed`,`d`.`doc_moved` AS `doc_moved`,`d`.`signPer_id` AS `signPer_id`,`d`.`signObj_id` AS `signObj_id`,`d`.`secret_id` AS `secret_id`,`d`.`important_id` AS `important_id`,`d`.`doc_date` AS `doc_date`,`d`.`doc_sort` AS `doc_sort`,`d`.`doc_traned` AS `doc_traned`,`d`.`doc_replied` AS `doc_replied`,`d`.`doc_active` AS `doc_active`,`d`.`doc_file` AS `doc_file`,`d`.`user_id` AS `user_id`,`d`.`input_per` AS `input_per`,`u`.`user_fullname` AS `user_fullname`,`u`.`object_id` AS `object_id` from (`tbl_docs` `d` join `tbl_users` `u` on((`d`.`user_id` = `u`.`user_id`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
