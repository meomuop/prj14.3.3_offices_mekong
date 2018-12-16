/*
SQLyog Ultimate v8.6 Beta2
MySQL - 5.6.12-log : Database - db14_0_tha_offices_2013
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db14_0_tha_offices_2013` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db14_0_tha_offices_2013`;

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
) ENGINE=InnoDB AUTO_INCREMENT=426 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `ajax_chat_messages` */

insert  into `ajax_chat_messages`(`id`,`userID`,`userName`,`userRole`,`channel`,`dateTime`,`ip`,`text`) values (1,2147483647,'ChatBot',4,0,'2013-03-19 17:38:22','\0\0','/login user'),(2,3,'user',1,0,'2013-03-19 17:38:40','\0\0','hello'),(3,3,'user',1,0,'2013-03-19 17:38:49','\0\0',';)'),(4,2147483647,'ChatBot',4,1000000003,'2013-03-19 17:39:34','\0\0','/who user'),(5,2147483647,'ChatBot',4,0,'2013-03-19 17:41:01','\0\0','/logout user'),(6,2147483647,'ChatBot',4,0,'2013-03-19 17:41:06','\0\0','/login admin'),(7,2147483647,'ChatBot',4,1000000001,'2013-03-19 17:41:14','\0\0','/list Public Private [admin]'),(8,2147483647,'ChatBot',4,0,'2013-03-19 17:41:22','\0\0','/channelLeave admin'),(9,2147483647,'ChatBot',4,500000001,'2013-03-19 17:41:22','\0\0','/channelEnter admin'),(10,2147483647,'ChatBot',4,1000000001,'2013-03-19 17:41:24','\0\0','/bansEmpty -'),(11,2147483647,'ChatBot',4,500000001,'2013-03-19 21:06:19','\0\0','/channelLeave admin'),(12,2147483647,'ChatBot',4,0,'2013-03-19 21:06:19','\0\0','/channelEnter admin'),(13,2147483647,'ChatBot',4,0,'2013-03-19 22:33:34','\0\0','/logout admin'),(14,2147483647,'ChatBot',4,0,'2013-03-19 22:46:07','\0\0','/login admin'),(15,2147483647,'ChatBot',4,0,'2013-03-19 22:52:47','\0\0','/logout admin'),(16,2147483647,'ChatBot',4,0,'2013-03-19 22:52:57','\0\0','/login admin'),(17,2147483647,'ChatBot',4,1000000001,'2013-03-19 22:54:26','\0\0','/who admin'),(18,2147483647,'ChatBot',4,0,'2013-03-19 23:08:57','\0\0','/logout admin'),(19,2147483647,'ChatBot',4,0,'2013-03-19 23:11:29','\0\0','/login admin'),(20,2147483647,'ChatBot',4,0,'2013-03-19 23:12:59','\0\0','/logout admin'),(21,2147483647,'ChatBot',4,0,'2013-03-19 23:13:06','\0\0','/login admin'),(22,2147483647,'ChatBot',4,0,'2013-03-19 23:13:21','\0\0','/logout admin'),(23,2147483647,'ChatBot',4,0,'2013-03-19 23:13:26','\0\0','/login admin'),(24,2147483647,'ChatBot',4,0,'2013-03-19 23:37:17','\0\0','/logout admin'),(25,2147483647,'ChatBot',4,0,'2013-03-19 23:37:21','\0\0','/login admin'),(26,2147483647,'ChatBot',4,1000000001,'2013-03-19 23:37:34','\0\0','/list Public Private [admin]'),(27,2147483647,'ChatBot',4,0,'2013-03-19 23:37:36','\0\0','/channelLeave admin'),(28,2147483647,'ChatBot',4,500000001,'2013-03-19 23:37:36','\0\0','/channelEnter admin'),(29,2147483647,'ChatBot',4,500000001,'2013-03-19 23:37:46','\0\0','/channelLeave admin'),(30,2147483647,'ChatBot',4,1,'2013-03-19 23:37:46','\0\0','/channelEnter admin'),(31,2147483647,'ChatBot',4,1,'2013-03-19 23:37:48','\0\0','/channelLeave admin'),(32,2147483647,'ChatBot',4,0,'2013-03-19 23:37:48','\0\0','/channelEnter admin'),(34,2147483647,'ChatBot',4,0,'2013-03-19 23:39:39','\0\0','/login admin'),(35,1,'admin',3,0,'2013-03-19 23:42:02','\0\0','sdfasdfsd'),(36,2147483647,'ChatBot',4,0,'2013-03-19 23:43:56','\0\0','/logout admin Timeout'),(37,2147483647,'ChatBot',4,0,'2013-03-19 23:43:57','\0\0','/login admin'),(38,2147483647,'ChatBot',4,1000000001,'2013-03-19 23:44:12','\0\0','/who admin'),(39,2147483647,'ChatBot',4,0,'2013-03-19 23:44:37','\0\0','/nick admin (meomeuop)'),(40,1,'(meomeuop)',3,0,'2013-03-19 23:44:46','\0\0','amdsfhaksjdga'),(41,2147483647,'ChatBot',4,0,'2013-03-19 23:44:51','\0\0','/logout (meomeuop)'),(42,2147483647,'ChatBot',4,0,'2013-03-19 23:44:56','\0\0','/login admin'),(43,2147483647,'ChatBot',4,0,'2013-03-19 23:45:02','\0\0','/delete 33'),(44,2147483647,'ChatBot',4,0,'2013-03-19 23:45:22','\0\0','/channelLeave admin'),(45,2147483647,'ChatBot',4,500000001,'2013-03-19 23:45:22','\0\0','/channelEnter admin'),(46,2147483647,'ChatBot',4,500000001,'2013-03-19 23:45:33','\0\0','/channelLeave admin'),(47,2147483647,'ChatBot',4,1,'2013-03-19 23:45:33','\0\0','/channelEnter admin'),(48,1,'admin',3,1,'2013-03-19 23:45:37','\0\0',':D'),(49,2147483647,'ChatBot',4,1000000001,'2013-03-19 23:46:19','\0\0','/error UnknownCommand /ThoÃ¡t'),(50,2147483647,'ChatBot',4,1000000001,'2013-03-19 23:46:26','\0\0','/error UnknownCommand /ThoÃ¡t'),(52,1,'admin',3,1,'2013-03-19 23:46:47','\0\0',':error:'),(53,1,'admin',3,1,'2013-03-19 23:46:50','\0\0',':favorite:'),(54,1,'admin',3,1,'2013-03-19 23:46:52','\0\0',':warning:'),(55,1,'admin',3,1,'2013-03-19 23:46:55','\0\0','O:-D'),(56,1,'admin',3,1,'2013-03-19 23:46:58','\0\0',':help:'),(57,1,'admin',3,1,'2013-03-19 23:47:00','\0\0',':important:'),(58,1,'admin',3,1,'2013-03-19 23:47:15','\0\0','[quote]hehe[/quote]'),(59,1,'admin',3,1,'2013-03-19 23:47:20','\0\0','[u]Ã¡dasd[/u]'),(60,1,'admin',3,1,'2013-03-19 23:47:24','\0\0','[i]dfsdf[/i]'),(61,1,'admin',3,1,'2013-03-19 23:47:27','\0\0','[b]dsfsdf[/b]'),(62,1,'admin',3,1,'2013-03-19 23:47:37','\0\0','[url=http://dantri.com.vn][/url]'),(63,1,'admin',3,1,'2013-03-19 23:48:08','\0\0','[url=http://dantri.com.vn]dantri[/url]'),(64,2147483647,'ChatBot',4,1000000001,'2013-03-19 23:48:41','\0\0','/delete 51'),(65,2147483647,'ChatBot',4,1,'2013-03-19 23:49:06','\0\0','/logout admin'),(66,2147483647,'ChatBot',4,0,'2013-03-19 23:57:25','\0\0','/login admin'),(67,2147483647,'ChatBot',4,0,'2013-03-19 23:57:34','\0\0','/logout admin'),(68,2147483647,'ChatBot',4,0,'2013-03-19 23:57:42','\0\0','/login ngalt'),(69,10,'ngalt',0,0,'2013-03-19 23:57:49','\0\0','hello'),(70,2147483647,'ChatBot',4,0,'2013-03-19 23:59:28','\0\0','/logout ngalt'),(71,2147483647,'ChatBot',4,0,'2013-03-19 23:59:34','\0\0','/login admin'),(72,2147483647,'ChatBot',4,0,'2013-03-19 23:59:43','\0\0','/logout admin'),(73,2147483647,'ChatBot',4,0,'2013-03-19 23:59:48','\0\0','/login ngalt'),(74,2147483647,'ChatBot',4,0,'2013-03-20 00:00:22','\0\0','/logout ngalt'),(75,2147483647,'ChatBot',4,0,'2013-03-20 00:00:26','\0\0','/login admin'),(76,2147483647,'ChatBot',4,0,'2013-03-20 00:05:00','\0\0','/login ngalt'),(77,10,'ngalt',0,1000000010,'2013-03-20 00:05:19','\0\0','/privmsgto admin hello admin'),(78,10,'ngalt',0,1000000000,'2013-03-20 00:05:19','\0\0','/privmsg hello admin'),(79,0,'admin',3,0,'2013-03-20 00:05:34','\0\0','hello con khá»‰'),(80,2147483647,'ChatBot',4,1000000010,'2013-03-20 00:05:52','\0\0','/queryOpen admin'),(81,10,'ngalt',0,1000000010,'2013-03-20 00:06:03','\0\0','/privmsgto admin tháº±ng Ä‘iÃªn'),(82,10,'ngalt',0,1000000000,'2013-03-20 00:06:03','\0\0','/privmsg tháº±ng Ä‘iÃªn'),(83,0,'admin',3,0,'2013-03-20 00:06:15','\0\0','dá»Ÿ hÆ¡i'),(84,2147483647,'ChatBot',4,0,'2013-03-20 08:08:31','\0\0','/logout admin Timeout'),(85,2147483647,'ChatBot',4,0,'2013-03-20 08:08:31','\0\0','/logout ngalt Timeout'),(86,2147483647,'ChatBot',4,0,'2013-03-20 08:08:32','\0\0','/login admin'),(87,2147483647,'ChatBot',4,0,'2013-03-20 08:11:23','\0\0','/roll admin 1d6 6'),(88,0,'admin',3,0,'2013-03-20 08:11:56','\0\0',':P'),(89,0,'admin',3,0,'2013-03-20 08:12:00','\0\0',':-*'),(90,0,'admin',3,0,'2013-03-20 08:12:27','\0\0',':-('),(91,0,'admin',3,0,'2013-03-20 08:12:29','\0\0',':('),(92,0,'admin',3,0,'2013-03-20 08:26:57','\0\0','O:-D'),(93,2147483647,'ChatBot',4,0,'2013-03-20 08:39:28','\0\0','/logout admin Timeout'),(94,2147483647,'ChatBot',4,0,'2013-03-20 08:39:29','\0\0','/login admin'),(95,2147483647,'ChatBot',4,0,'2013-03-20 08:46:00','\0\0','/logout admin Timeout'),(96,2147483647,'ChatBot',4,0,'2013-03-20 08:46:00','\0\0','/login admin'),(97,0,'admin',3,0,'2013-03-20 08:46:04','\0\0','O:-D'),(98,2147483647,'ChatBot',4,0,'2013-03-20 09:02:46','\0\0','/logout admin Timeout'),(99,2147483647,'ChatBot',4,0,'2013-03-20 09:02:46','\0\0','/login admin'),(100,2147483647,'ChatBot',4,0,'2013-03-20 09:09:02','\0\0','/logout admin Timeout'),(101,2147483647,'ChatBot',4,0,'2013-03-20 09:09:03','\0\0','/login admin'),(102,2147483647,'ChatBot',4,0,'2013-03-20 09:13:07','\0\0','/logout admin Timeout'),(103,2147483647,'ChatBot',4,0,'2013-03-20 09:13:08','\0\0','/login admin'),(104,2147483647,'ChatBot',4,0,'2013-03-20 09:24:31','\0\0','/logout admin Timeout'),(105,2147483647,'ChatBot',4,0,'2013-03-20 09:24:32','\0\0','/login admin'),(106,2147483647,'ChatBot',4,0,'2013-03-20 09:33:31','\0\0','/logout admin Timeout'),(107,2147483647,'ChatBot',4,0,'2013-03-20 09:33:31','\0\0','/login admin'),(108,2147483647,'ChatBot',4,0,'2013-03-20 09:35:24','\0\0','/logout admin Timeout'),(109,2147483647,'ChatBot',4,0,'2013-03-20 09:35:25','\0\0','/login admin'),(110,2147483647,'ChatBot',4,0,'2013-03-20 09:40:34','\0\0','/logout admin'),(111,2147483647,'ChatBot',4,0,'2013-03-20 09:40:41','\0\0','/login admin'),(112,2147483647,'ChatBot',4,0,'2013-03-20 09:40:43','\0\0','/logout admin'),(113,2147483647,'ChatBot',4,0,'2013-03-20 09:42:11','\0\0','/login admin'),(114,2147483647,'ChatBot',4,0,'2013-03-20 09:43:43','\0\0','/logout admin'),(115,2147483647,'ChatBot',4,0,'2013-03-20 09:48:58','\0\0','/login admin'),(116,2147483647,'ChatBot',4,0,'2013-03-20 10:02:16','\0\0','/logout admin Timeout'),(117,2147483647,'ChatBot',4,0,'2013-03-20 10:02:16','\0\0','/login admin'),(118,0,'admin',3,0,'2013-03-20 10:04:06','\0\0','adads]'),(119,2147483647,'ChatBot',4,0,'2013-03-20 10:14:08','\0\0','/logout admin Timeout'),(120,2147483647,'ChatBot',4,0,'2013-03-20 10:14:09','\0\0','/login admin'),(121,2147483647,'ChatBot',4,0,'2013-03-20 10:21:20','\0\0','/logout admin Timeout'),(122,2147483647,'ChatBot',4,0,'2013-03-20 10:21:20','\0\0','/login admin'),(123,2147483647,'ChatBot',4,0,'2013-03-20 10:21:51','\0\0','/logout admin Timeout'),(124,2147483647,'ChatBot',4,0,'2013-03-20 10:21:52','\0\0','/login admin'),(125,2147483647,'ChatBot',4,0,'2013-03-20 10:25:38','\0\0','/logout admin Timeout'),(126,2147483647,'ChatBot',4,0,'2013-03-20 10:25:39','\0\0','/login admin'),(127,2147483647,'ChatBot',4,0,'2013-03-20 10:29:19','\0\0','/logout admin Timeout'),(128,2147483647,'ChatBot',4,0,'2013-03-20 10:29:19','\0\0','/login admin'),(129,0,'admin',3,0,'2013-03-20 10:35:18','\0\0',':-/'),(130,0,'admin',3,0,'2013-03-20 10:40:06','\0\0','[quote]dgdgdf[/quote]'),(131,0,'admin',3,0,'2013-03-20 10:40:20','\0\0','[color=teal]qÆ°eqweq[/color]'),(132,2147483647,'ChatBot',4,0,'2013-03-20 10:42:42','\0\0','/logout admin Timeout'),(133,2147483647,'ChatBot',4,0,'2013-03-20 10:42:42','\0\0','/login admin'),(134,2147483647,'ChatBot',4,0,'2013-03-20 10:55:51','\0\0','/roll admin 1d6 4'),(135,2147483647,'ChatBot',4,0,'2013-03-20 10:55:57','\0\0','/roll admin 1d6 6'),(136,2147483647,'ChatBot',4,0,'2013-03-20 10:56:02','\0\0','/roll admin 1d6 5'),(137,2147483647,'ChatBot',4,0,'2013-03-20 11:00:15','��l','/login hiennn'),(138,2147483647,'ChatBot',4,0,'2013-03-20 11:00:27','��l','/channelLeave hiennn'),(139,2147483647,'ChatBot',4,1,'2013-03-20 11:00:27','��l','/channelEnter hiennn'),(140,2147483647,'ChatBot',4,1,'2013-03-20 11:00:40','��l','/channelLeave hiennn'),(141,2147483647,'ChatBot',4,0,'2013-03-20 11:00:40','��l','/channelEnter hiennn'),(142,2147483647,'ChatBot',4,0,'2013-03-20 11:00:45','��l','/channelLeave hiennn'),(143,2147483647,'ChatBot',4,1,'2013-03-20 11:00:45','��l','/channelEnter hiennn'),(144,2147483647,'ChatBot',4,0,'2013-03-20 11:01:04','\0\0','/channelLeave admin'),(145,2147483647,'ChatBot',4,1,'2013-03-20 11:01:04','\0\0','/channelEnter admin'),(146,0,'admin',3,1000000000,'2013-03-20 11:01:14','\0\0','/privmsgto hiennn Ãª'),(147,0,'admin',3,1000000005,'2013-03-20 11:01:14','\0\0','/privmsg Ãª'),(148,5,'hiennn',0,1,'2013-03-20 11:01:20','��l','85'),(149,2147483647,'ChatBot',4,0,'2013-03-20 11:03:35','��h','/login hainx'),(150,2147483647,'ChatBot',4,0,'2013-03-20 11:03:39','��h','/channelLeave hainx'),(151,2147483647,'ChatBot',4,1,'2013-03-20 11:03:39','��h','/channelEnter hainx'),(152,2147483647,'ChatBot',4,1000000006,'2013-03-20 11:04:01','��h','/queryOpen hiennn'),(153,6,'hainx',0,1000000006,'2013-03-20 11:04:10','��h','/privmsgto hiennn hdhasdaskd'),(154,6,'hainx',0,1000000005,'2013-03-20 11:04:10','��h','/privmsg hdhasdaskd'),(155,2147483647,'ChatBot',4,0,'2013-03-20 11:04:58','��l','/login ngalt'),(156,2147483647,'ChatBot',4,0,'2013-03-20 11:05:02','��l','/channelLeave ngalt'),(157,2147483647,'ChatBot',4,1,'2013-03-20 11:05:02','��l','/channelEnter ngalt'),(158,2147483647,'ChatBot',4,1000000010,'2013-03-20 11:05:13','��l','/queryOpen hiennn'),(159,10,'ngalt',0,1000000010,'2013-03-20 11:05:18','��l','/privmsgto hiennn gklhgjk'),(160,10,'ngalt',0,1000000005,'2013-03-20 11:05:18','��l','/privmsg gklhgjk'),(161,6,'hainx',0,1000000006,'2013-03-20 11:05:21','��h','/privmsgto hiennn >:D<'),(162,6,'hainx',0,1000000005,'2013-03-20 11:05:21','��h','/privmsg >:D<'),(163,2147483647,'ChatBot',4,1000000010,'2013-03-20 11:05:22','��l','/queryClose hiennn'),(164,2147483647,'ChatBot',4,1000000010,'2013-03-20 11:05:22','��l','/queryOpen hiennn'),(165,10,'ngalt',0,1000000010,'2013-03-20 11:05:25','��l','/privmsgto hiennn dfgdsgfd'),(166,10,'ngalt',0,1000000005,'2013-03-20 11:05:25','��l','/privmsg dfgdsgfd'),(167,6,'hainx',0,1000000006,'2013-03-20 11:05:29','��h','/privmsgto hiennn >:D<'),(168,6,'hainx',0,1000000005,'2013-03-20 11:05:29','��h','/privmsg >:D<'),(169,0,'admin',3,1,'2013-03-20 11:05:35','\0\0',':x'),(170,10,'ngalt',0,1000000010,'2013-03-20 11:05:36','��l','/privmsgto hiennn yeu'),(171,10,'ngalt',0,1000000005,'2013-03-20 11:05:36','��l','/privmsg yeu'),(172,0,'admin',3,1,'2013-03-20 11:05:44','\0\0','>:D<'),(173,10,'ngalt',0,1000000010,'2013-03-20 11:05:46','��l','/privmsgto hiennn :)'),(174,10,'ngalt',0,1000000005,'2013-03-20 11:05:46','��l','/privmsg :)'),(175,10,'ngalt',0,1000000010,'2013-03-20 11:05:50','��l','/privmsgto hiennn :('),(176,10,'ngalt',0,1000000005,'2013-03-20 11:05:50','��l','/privmsg :('),(177,6,'hainx',0,1000000006,'2013-03-20 11:05:57','��h','/privmsgto hiennn 8->'),(178,6,'hainx',0,1000000005,'2013-03-20 11:05:57','��h','/privmsg 8->'),(179,6,'hainx',0,1000000006,'2013-03-20 11:06:03','��h','/privmsgto hiennn :O)'),(180,6,'hainx',0,1000000005,'2013-03-20 11:06:03','��h','/privmsg :O)'),(181,6,'hainx',0,1000000006,'2013-03-20 11:06:06','��h','/privmsgto hiennn :))'),(182,6,'hainx',0,1000000005,'2013-03-20 11:06:06','��h','/privmsg :))'),(183,2147483647,'ChatBot',4,1000000006,'2013-03-20 11:06:16','��h','/queryClose hiennn'),(184,2147483647,'ChatBot',4,1000000006,'2013-03-20 11:06:16','��h','/queryOpen ngalt'),(185,6,'hainx',0,1000000006,'2013-03-20 11:06:19','��h','/privmsgto ngalt oke'),(186,6,'hainx',0,1000000010,'2013-03-20 11:06:19','��h','/privmsg oke'),(187,0,'admin',3,1,'2013-03-20 11:06:30','\0\0','>:D<'),(188,0,'admin',3,1,'2013-03-20 11:06:48','\0\0',':-t'),(189,2147483647,'ChatBot',4,1000000000,'2013-03-20 11:07:41','\0\0','/queryOpen hiennn'),(190,0,'admin',3,1000000000,'2013-03-20 11:07:45','\0\0','/privmsgto hiennn heloo'),(191,0,'admin',3,1000000005,'2013-03-20 11:07:45','\0\0','/privmsg heloo'),(192,2147483647,'ChatBot',4,1000000000,'2013-03-20 11:08:03','\0\0','/queryClose hiennn'),(193,2147483647,'ChatBot',4,1000000000,'2013-03-20 11:08:03','\0\0','/queryOpen hainx'),(194,0,'admin',3,1000000000,'2013-03-20 11:08:10','\0\0','/privmsgto hainx hehe'),(195,0,'admin',3,1000000006,'2013-03-20 11:08:10','\0\0','/privmsg hehe'),(196,2147483647,'ChatBot',4,1,'2013-03-20 11:12:57','\0\0','/logout hiennn Timeout'),(197,2147483647,'ChatBot',4,1,'2013-03-20 11:12:57','\0\0','/logout hainx Timeout'),(198,2147483647,'ChatBot',4,1,'2013-03-20 11:12:57','\0\0','/logout ngalt Timeout'),(199,2147483647,'ChatBot',4,1000000000,'2013-03-20 11:15:17','\0\0','/queryClose hainx'),(200,0,'admin',3,1,'2013-03-20 11:15:18','\0\0',':('),(201,0,'admin',3,1,'2013-03-20 11:15:19','\0\0',';)'),(202,0,'admin',3,1,'2013-03-20 11:15:22','\0\0',':)'),(203,0,'admin',3,1,'2013-03-20 11:15:24','\0\0',':D'),(204,0,'admin',3,1,'2013-03-20 11:15:25','\0\0',';;)'),(205,0,'admin',3,1,'2013-03-20 11:15:26','\0\0','>:D<'),(206,0,'admin',3,1,'2013-03-20 11:15:33','\0\0',':-/'),(207,0,'admin',3,1,'2013-03-20 11:15:35','\0\0',':x'),(208,0,'admin',3,1,'2013-03-20 11:15:36','\0\0',':\">'),(209,0,'admin',3,1,'2013-03-20 11:15:36','\0\0',':P'),(210,0,'admin',3,1,'2013-03-20 11:15:37','\0\0',':*'),(211,0,'admin',3,1,'2013-03-20 11:15:38','\0\0','=(('),(212,0,'admin',3,1,'2013-03-20 11:15:39','\0\0',':-O'),(213,0,'admin',3,1,'2013-03-20 11:15:40','\0\0','X('),(214,0,'admin',3,1,'2013-03-20 11:15:41','\0\0',':>'),(215,0,'admin',3,1,'2013-03-20 11:15:42','\0\0','B-)'),(216,0,'admin',3,1,'2013-03-20 11:15:43','\0\0',':-S'),(217,0,'admin',3,1,'2013-03-20 11:15:44','\0\0','#:-S'),(218,0,'admin',3,1,'2013-03-20 11:15:52','\0\0','>:)'),(219,0,'admin',3,1,'2013-03-20 11:15:55','\0\0',':(('),(220,0,'admin',3,1,'2013-03-20 11:15:56','\0\0',':))'),(221,0,'admin',3,1,'2013-03-20 11:15:57','\0\0',':|'),(222,2147483647,'ChatBot',4,1000000000,'2013-03-20 11:16:00','\0\0','/error UnknownCommand /:)'),(223,2147483647,'ChatBot',4,1000000000,'2013-03-20 11:16:04','\0\0','/error UnknownCommand /:)'),(224,0,'admin',3,1,'2013-03-20 11:16:06','\0\0','=))'),(225,0,'admin',3,1,'2013-03-20 11:16:08','\0\0','O:-)'),(226,0,'admin',3,1,'2013-03-20 11:16:09','\0\0','=;'),(227,0,'admin',3,1,'2013-03-20 11:16:11','\0\0',':-B'),(228,0,'admin',3,1,'2013-03-20 11:16:12','\0\0',':-c'),(229,0,'admin',3,1,'2013-03-20 11:16:12','\0\0',':)]'),(230,0,'admin',3,1,'2013-03-20 11:16:14','\0\0','~X('),(231,0,'admin',3,1,'2013-03-20 11:16:15','\0\0',':-h'),(232,0,'admin',3,1,'2013-03-20 11:16:16','\0\0',':-t'),(233,0,'admin',3,1,'2013-03-20 11:17:17','\0\0',';;)'),(234,0,'admin',3,1,'2013-03-20 11:17:49','\0\0','>;D<'),(235,0,'admin',3,1,'2013-03-20 11:17:56','\0\0',';-)'),(236,0,'admin',3,1,'2013-03-20 11:18:09','\0\0','=(('),(237,0,'admin',3,1,'2013-03-20 11:18:11','\0\0',':-O'),(238,0,'admin',3,1,'2013-03-20 11:18:13','\0\0','X('),(239,2147483647,'ChatBot',4,1,'2013-03-20 11:18:45','\0\0','/logout admin'),(240,2147483647,'ChatBot',4,0,'2013-03-20 12:41:55','\0\0','/login admin'),(241,2147483647,'ChatBot',4,0,'2013-03-20 12:41:59','\0\0','/logout admin'),(242,2147483647,'ChatBot',4,0,'2013-03-20 12:49:48','\0\0','/login admin'),(243,0,'admin',3,0,'2013-03-20 12:49:53','\0\0',':-t'),(244,2147483647,'ChatBot',4,0,'2013-03-20 13:25:09','\0\0','/logout admin'),(245,2147483647,'ChatBot',4,0,'2013-03-20 13:49:03','\0\0','/login admin'),(246,2147483647,'ChatBot',4,0,'2013-03-20 13:49:07','\0\0','/logout admin'),(247,2147483647,'ChatBot',4,0,'2013-03-20 13:51:01','\0\0','/login admin'),(248,2147483647,'ChatBot',4,0,'2013-03-20 13:51:03','\0\0','/logout admin'),(249,2147483647,'ChatBot',4,0,'2013-03-20 13:51:30','\0\0','/login admin'),(250,2147483647,'ChatBot',4,0,'2013-03-20 13:51:33','\0\0','/logout admin'),(251,2147483647,'ChatBot',4,0,'2013-03-20 13:53:35','\0\0','/login admin'),(252,2147483647,'ChatBot',4,0,'2013-03-20 13:53:38','\0\0','/logout admin'),(253,2147483647,'ChatBot',4,0,'2013-03-20 13:54:24','\0\0','/login admin'),(254,2147483647,'ChatBot',4,0,'2013-03-20 13:54:27','\0\0','/logout admin'),(255,2147483647,'ChatBot',4,0,'2013-03-20 13:57:06','\0\0','/login admin'),(256,2147483647,'ChatBot',4,0,'2013-03-20 13:57:08','\0\0','/logout admin'),(257,2147483647,'ChatBot',4,0,'2013-03-20 14:00:27','\0\0','/login admin'),(258,2147483647,'ChatBot',4,0,'2013-03-20 14:00:57','\0\0','/logout admin'),(259,2147483647,'ChatBot',4,0,'2013-03-20 14:04:48','\0\0','/login admin'),(260,0,'admin',3,0,'2013-03-20 14:05:57','\0\0','(:|'),(261,0,'admin',3,0,'2013-03-20 14:07:21','\0\0','({|'),(262,0,'admin',3,0,'2013-03-20 14:07:28','\0\0','=P~'),(263,0,'admin',3,0,'2013-03-20 14:07:41','\0\0',':-bd'),(264,0,'admin',3,0,'2013-03-20 14:07:44','\0\0','^#(^'),(265,0,'admin',3,0,'2013-03-20 14:07:59','\0\0',':ar!'),(266,0,'admin',3,0,'2013-03-20 14:08:05','\0\0',':P'),(267,0,'admin',3,0,'2013-03-20 14:08:10','\0\0',':\">'),(268,0,'admin',3,0,'2013-03-20 14:08:14','\0\0','=(('),(269,0,'admin',3,0,'2013-03-20 14:08:17','\0\0',':-O'),(270,0,'admin',3,0,'2013-03-20 14:08:22','\0\0',':>'),(271,0,'admin',3,0,'2013-03-20 14:08:25','\0\0','B-)'),(272,0,'admin',3,0,'2013-03-20 14:08:27','\0\0',':-S'),(273,0,'admin',3,0,'2013-03-20 14:08:29','\0\0','#:-S'),(274,0,'admin',3,0,'2013-03-20 14:08:57','\0\0','#:;S'),(275,0,'admin',3,0,'2013-03-20 14:09:08','\0\0','>:)'),(276,0,'admin',3,0,'2013-03-20 14:09:40','\0\0','>])'),(277,0,'admin',3,0,'2013-03-20 14:09:44','\0\0',':(('),(278,0,'admin',3,0,'2013-03-20 14:12:39','\0\0',':[['),(279,0,'admin',3,0,'2013-03-20 14:12:41','\0\0',':]]'),(280,0,'admin',3,0,'2013-03-20 14:12:45','\0\0',':|'),(281,2147483647,'ChatBot',4,1000000000,'2013-03-20 14:12:49','\0\0','/error UnknownCommand /:)'),(282,0,'admin',3,0,'2013-03-20 14:13:38','\0\0',';>)'),(283,0,'admin',3,0,'2013-03-20 14:14:07','\0\0','=))'),(284,0,'admin',3,0,'2013-03-20 14:14:12','\0\0','O:-)'),(285,0,'admin',3,0,'2013-03-20 14:14:15','\0\0','=;'),(286,0,'admin',3,0,'2013-03-20 14:14:17','\0\0',':-B'),(287,0,'admin',3,0,'2013-03-20 14:14:20','\0\0',':-c'),(288,0,'admin',3,0,'2013-03-20 14:14:22','\0\0',':)]'),(289,0,'admin',3,0,'2013-03-20 14:15:30','\0\0','c)]'),(290,0,'admin',3,0,'2013-03-20 14:15:35','\0\0','~X('),(291,0,'admin',3,0,'2013-03-20 14:15:57','\0\0','~x('),(292,0,'admin',3,0,'2013-03-20 14:16:00','\0\0',':-h'),(293,0,'admin',3,0,'2013-03-20 14:16:04','\0\0',':-t'),(294,0,'admin',3,0,'2013-03-20 14:16:07','\0\0','8->'),(295,0,'admin',3,0,'2013-03-20 14:16:11','\0\0','I-)'),(296,0,'admin',3,0,'2013-03-20 14:16:14','\0\0','8-|'),(297,0,'admin',3,0,'2013-03-20 14:16:17','\0\0','L-)'),(298,0,'admin',3,0,'2013-03-20 14:16:20','\0\0',':-&'),(299,0,'admin',3,0,'2013-03-20 14:16:23','\0\0',':-$'),(300,0,'admin',3,0,'2013-03-20 14:16:26','\0\0','[-('),(301,0,'admin',3,0,'2013-03-20 14:16:29','\0\0',':O)'),(302,0,'admin',3,0,'2013-03-20 14:16:31','\0\0','8-}'),(303,0,'admin',3,0,'2013-03-20 14:16:35','\0\0','<:-P'),(304,0,'admin',3,0,'2013-03-20 14:16:38','\0\0','({|'),(305,0,'admin',3,0,'2013-03-20 14:16:41','\0\0','=P~'),(306,0,'admin',3,0,'2013-03-20 14:16:42','\0\0',':-?'),(307,0,'admin',3,0,'2013-03-20 14:16:44','\0\0','#-o'),(308,0,'admin',3,0,'2013-03-20 14:16:46','\0\0','=D>'),(309,0,'admin',3,0,'2013-03-20 14:16:48','\0\0','@-)'),(310,0,'admin',3,0,'2013-03-20 14:16:51','\0\0',':-SS'),(311,0,'admin',3,0,'2013-03-20 14:17:07','\0\0',':-sS'),(312,0,'admin',3,0,'2013-03-20 14:17:10','\0\0',':^o'),(313,0,'admin',3,0,'2013-03-20 14:17:12','\0\0',':-w'),(314,0,'admin',3,0,'2013-03-20 14:17:13','\0\0',':-<'),(315,0,'admin',3,0,'2013-03-20 14:17:15','\0\0','>:P'),(316,0,'admin',3,0,'2013-03-20 14:17:30','\0\0','>:p'),(317,0,'admin',3,0,'2013-03-20 14:17:33','\0\0','<):)'),(318,0,'admin',3,0,'2013-03-20 14:17:52','\0\0','CB)'),(319,0,'admin',3,0,'2013-03-20 14:17:56','\0\0','X_X'),(320,0,'admin',3,0,'2013-03-20 14:18:02','\0\0',':!!'),(321,0,'admin',3,0,'2013-03-20 14:18:05','\0\0','m/'),(322,0,'admin',3,0,'2013-03-20 14:18:07','\0\0',':-q'),(323,0,'admin',3,0,'2013-03-20 14:18:10','\0\0',':-bd'),(324,0,'admin',3,0,'2013-03-20 14:18:11','\0\0','^#(^'),(325,0,'admin',3,0,'2013-03-20 14:18:13','\0\0',':ar!'),(326,0,'admin',3,0,'2013-03-20 14:18:32','\0\0',';>)'),(327,0,'admin',3,0,'2013-03-20 14:19:01','\0\0',';()'),(328,2147483647,'ChatBot',4,0,'2013-03-20 14:19:22','\0\0','/logout admin'),(329,2147483647,'ChatBot',4,0,'2013-03-20 14:26:54','\0\0','/login admin'),(330,2147483647,'ChatBot',4,0,'2013-03-20 14:26:58','\0\0','/logout admin'),(331,2147483647,'ChatBot',4,0,'2013-03-20 14:27:26','\0\0','/login admin'),(332,2147483647,'ChatBot',4,0,'2013-03-20 14:27:28','\0\0','/logout admin'),(333,2147483647,'ChatBot',4,0,'2013-03-20 14:32:19','\0\0','/login admin'),(334,2147483647,'ChatBot',4,0,'2013-03-20 14:32:21','\0\0','/logout admin'),(335,2147483647,'ChatBot',4,0,'2013-03-20 14:34:25','\0\0','/login admin'),(336,2147483647,'ChatBot',4,0,'2013-03-20 14:34:26','\0\0','/logout admin'),(337,2147483647,'ChatBot',4,0,'2013-03-20 14:43:21','\0\0','/login admin'),(338,2147483647,'ChatBot',4,0,'2013-03-20 14:43:23','\0\0','/logout admin'),(339,2147483647,'ChatBot',4,0,'2013-03-20 14:44:52','\0\0','/login admin'),(340,2147483647,'ChatBot',4,0,'2013-03-20 14:44:53','\0\0','/logout admin'),(341,2147483647,'ChatBot',4,0,'2013-03-20 14:48:14','\0\0','/login admin'),(342,2147483647,'ChatBot',4,0,'2013-03-20 14:48:16','\0\0','/logout admin'),(343,2147483647,'ChatBot',4,0,'2013-03-20 14:48:56','\0\0','/login admin'),(344,2147483647,'ChatBot',4,0,'2013-03-20 14:48:57','\0\0','/logout admin'),(345,2147483647,'ChatBot',4,0,'2013-03-20 14:51:00','\0\0','/login admin'),(346,2147483647,'ChatBot',4,0,'2013-03-20 14:51:02','\0\0','/logout admin'),(347,2147483647,'ChatBot',4,0,'2013-03-20 15:02:25','\0\0','/login admin'),(348,2147483647,'ChatBot',4,0,'2013-03-20 15:02:28','\0\0','/logout admin'),(349,2147483647,'ChatBot',4,0,'2013-03-20 15:02:33','\0\0','/login admin'),(350,2147483647,'ChatBot',4,0,'2013-03-20 15:02:43','\0\0','/logout admin'),(351,2147483647,'ChatBot',4,0,'2013-03-20 15:05:00','\0\0','/login admin'),(352,2147483647,'ChatBot',4,0,'2013-03-20 15:06:20','\0\0','/logout admin'),(353,2147483647,'ChatBot',4,0,'2013-03-20 17:36:31','\0\0','/login ngalt'),(354,2147483647,'ChatBot',4,0,'2013-03-20 17:44:03','\0\0','/logout ngalt'),(355,2147483647,'ChatBot',4,0,'2013-03-20 17:44:08','\0\0','/login ngalt'),(356,2147483647,'ChatBot',4,0,'2013-03-20 22:02:57','\0\0','/login admin'),(357,2147483647,'ChatBot',4,0,'2013-03-20 22:02:59','\0\0','/logout ngalt Timeout'),(358,2147483647,'ChatBot',4,0,'2013-03-20 22:03:06','\0\0','/logout admin'),(359,2147483647,'ChatBot',4,0,'2013-03-20 22:03:11','\0\0','/login ngalt'),(360,10,'ngalt',0,0,'2013-03-20 22:03:50','\0\0','>;D<'),(361,10,'ngalt',0,0,'2013-03-20 22:04:06','\0\0','#:;S'),(362,2147483647,'ChatBot',4,0,'2013-03-20 22:04:24','\0\0','/logout ngalt'),(363,2147483647,'ChatBot',4,0,'2013-03-21 16:02:56','\0\0','/login ngalt'),(364,2147483647,'ChatBot',4,0,'2013-03-21 16:03:19','\0\0','/logout ngalt'),(365,2147483647,'ChatBot',4,0,'2013-03-21 17:12:02','\0\0','/login ngalt'),(366,10,'ngalt',0,0,'2013-03-21 17:12:13','\0\0','[color=lime]rewerwer[/color]'),(367,10,'ngalt',0,0,'2013-03-21 17:12:29','\0\0',':x'),(368,2147483647,'ChatBot',4,0,'2013-03-21 17:12:45','\0\0','/roll ngalt 1d6 3'),(369,2147483647,'ChatBot',4,0,'2013-03-21 17:13:01','\0\0','/logout ngalt'),(370,2147483647,'ChatBot',4,0,'2013-03-23 17:08:02','\0\0','/login admin'),(371,0,'admin',3,0,'2013-03-23 17:08:22','\0\0','>;D<'),(372,2147483647,'ChatBot',4,0,'2013-03-23 17:08:39','\0\0','/logout admin'),(373,2147483647,'ChatBot',4,0,'2013-03-26 08:57:31','\0\0','/login admin'),(374,2147483647,'ChatBot',4,0,'2013-03-26 09:21:52','��n','/logout admin Timeout'),(375,2147483647,'ChatBot',4,0,'2013-03-26 09:21:53','��n','/login admin'),(376,0,'admin',3,0,'2013-03-26 09:22:10','��n','[b][b]qfdfafaf[/b][/b]'),(377,0,'admin',3,0,'2013-03-26 09:22:17','��n','affafa'),(378,0,'admin',3,0,'2013-03-26 09:22:22','��n','[b]fafdfafa[/b]'),(379,0,'admin',3,0,'2013-03-26 09:22:37','��n','[i]gsfgsfg[/i]'),(380,2147483647,'ChatBot',4,0,'2013-03-26 10:12:52','��n','/login vinhdc'),(381,2147483647,'ChatBot',4,0,'2013-03-26 10:12:55','��n','/logout admin Timeout'),(382,12,'vinhdc',0,0,'2013-03-26 10:13:49','��n',':P'),(383,12,'vinhdc',0,0,'2013-03-26 10:13:55','��n',':x'),(384,12,'vinhdc',0,0,'2013-03-26 10:14:10','��n','[color=red]hehehe[/color]'),(385,12,'vinhdc',0,0,'2013-03-26 10:15:14','��n','[url=http://dantri.com.vn][/url]'),(386,12,'vinhdc',0,0,'2013-03-26 10:15:34','��n','[url=http://google.com][/url]'),(387,12,'vinhdc',0,0,'2013-03-26 10:38:30','��n','hihi'),(388,12,'vinhdc',0,0,'2013-03-26 10:38:42','��n','hihi'),(389,12,'vinhdc',0,0,'2013-03-26 10:38:57','��n','hihi'),(390,2147483647,'ChatBot',4,0,'2013-03-26 10:39:05','��n','/channelLeave vinhdc'),(391,2147483647,'ChatBot',4,1,'2013-03-26 10:39:05','��n','/channelEnter vinhdc'),(392,12,'vinhdc',0,1,'2013-03-26 10:39:21','��n','hihi'),(393,2147483647,'ChatBot',4,1,'2013-03-26 10:39:24','��n','/logout vinhdc'),(394,2147483647,'ChatBot',4,0,'2013-03-26 10:39:36','��n','/login admin'),(395,2147483647,'ChatBot',4,1000000000,'2013-03-26 10:39:43','��n','/who admin'),(396,2147483647,'ChatBot',4,1000000000,'2013-03-26 10:39:45','��n','/who admin'),(397,2147483647,'ChatBot',4,1000000000,'2013-03-26 10:39:50','��n','/list CÃ´ng_cá»™ng RiÃªng_tÆ° [admin]'),(398,2147483647,'ChatBot',4,1000000000,'2013-03-26 10:39:54','��n','/error MissingText'),(399,2147483647,'ChatBot',4,1000000000,'2013-03-26 10:40:01','��n','/error MissingUserName'),(400,2147483647,'ChatBot',4,0,'2013-03-26 11:35:56','��n','/channelLeave admin'),(401,2147483647,'ChatBot',4,1,'2013-03-26 11:35:56','��n','/channelEnter admin'),(402,0,'admin',3,1,'2013-03-26 11:36:14','��n','[b]chá»¯ Ä‘áº­m[/b]'),(403,0,'admin',3,1,'2013-03-26 11:36:29','��n','[color=red]mÃ u chá»¯[/color]'),(404,2147483647,'ChatBot',4,1,'2013-04-09 14:12:30','\0\0','/logout admin Timeout'),(405,2147483647,'ChatBot',4,0,'2013-04-09 14:12:31','\0\0','/login admin'),(406,2147483647,'ChatBot',4,0,'2013-04-09 17:23:18','\0\0','/logout admin'),(407,2147483647,'ChatBot',4,0,'2013-04-23 14:10:42','��f','/login datnt'),(408,2147483647,'ChatBot',4,1000000019,'2013-04-23 14:10:52','��f','/who datnt'),(409,2147483647,'ChatBot',4,1000000019,'2013-04-23 14:10:53','��f','/who datnt'),(410,2147483647,'ChatBot',4,1000000019,'2013-04-23 14:10:55','��f','/who datnt'),(411,2147483647,'ChatBot',4,1000000019,'2013-04-23 14:11:49','��f','/list CÃ´ng_cá»™ng RiÃªng_tÆ°'),(412,2147483647,'ChatBot',4,0,'2013-04-23 14:12:03','��f','/logout datnt'),(413,2147483647,'ChatBot',4,0,'2013-04-24 09:14:42','��f','/login huunq'),(414,2147483647,'ChatBot',4,0,'2013-04-24 09:16:29','��f','/login andt'),(415,7,'andt',0,0,'2013-04-24 09:16:39','��f','alo pi caso'),(416,2147483647,'ChatBot',4,1000000004,'2013-04-24 09:16:51','��f','/who andt huunq'),(417,4,'huunq',0,0,'2013-04-24 09:17:05','��f',':x'),(418,4,'huunq',0,0,'2013-04-24 09:17:17','��f',':-&'),(419,4,'huunq',0,0,'2013-04-24 09:17:33','��f',':-sS'),(420,2147483647,'ChatBot',4,0,'2013-04-24 11:55:40','��f','/logout andt Timeout'),(421,2147483647,'ChatBot',4,0,'2013-05-02 22:12:21','\0\0','/login hungdv'),(422,2147483647,'ChatBot',4,0,'2013-05-02 22:12:24','\0\0','/logout huunq Timeout'),(423,2147483647,'ChatBot',4,0,'2013-05-02 22:12:31','\0\0','/logout hungdv'),(424,2147483647,'ChatBot',4,0,'2013-05-20 16:03:42','\0\0','/login ngalt'),(425,2147483647,'ChatBot',4,0,'2013-05-20 16:04:00','\0\0','/logout ngalt');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_addusers` */

insert  into `tbl_addusers`(`addUser_id`,`user_sent`,`user_id`,`doc_id`,`addUser_desc`,`addUser_date`) values (2,18,'12,10',37,'Phối hợp giải quyết văn bản này','2013-05-14 00:00:00');

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

insert  into `tbl_config`(`config_id`,`owner_name`,`owner_add`,`owner_phone`,`owner_fax`,`owner_email`,`owner_reemail`,`owner_url`,`site_logo`,`site_banner`,`site_border`,`sat_ra`,`sun_ra`,`site_port`,`site_active`,`site_inactive_info`) values (1,'HĐND - UBND Huyện Sóc Sơn','Thị trấn Sóc Sơn','04.35950192','04.35950192','vanthu_socson@hanoi.gov.vn',NULL,'UBND SS','2000000','01-01-2013',NULL,2,2,'COM5',NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_cv_cats` */

insert  into `tbl_cv_cats`(`cv_cat_id`,`cv_cat_name`,`cv_cat_desc`,`cv_cat_priority`,`cv_cat_date`,`cv_cat_sort`,`cv_cat_active`,`user_id`) values (1,'Chuẩn bị tập huấn tin học ứng dụng SNV Ninh Bình.','Các phòng Kỹ thuật, Kinh doanh, Triển khai cử người thực hiện các công việc cần thiết.',1,'2013-03-26',NULL,1,7),(3,'Triển khai phần mềm Offices tại 6 huyện tỉnh Ninh Bình','Các phòng Kỹ thuật, kinh doanh, triển khai thực hiện',0,'2013-03-26',0,1,7);

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
  KEY `FK_tbl_cv_indexs` (`cv_sub_id`),
  CONSTRAINT `FK_tbl_cv_indexs` FOREIGN KEY (`cv_sub_id`) REFERENCES `tbl_cv_subs` (`cv_sub_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_cv_indexs` */

insert  into `tbl_cv_indexs`(`cv_index_id`,`cv_sub_id`,`process_user`,`cv_index_name`,`cv_index_desc`,`cv_index_date`,`cv_index_sort`,`cv_index_active`,`user_id`) values (1,1,10,NULL,NULL,'2013-03-27',0,0,18),(2,1,12,NULL,NULL,'2013-03-27',0,0,18),(4,2,15,NULL,NULL,'2013-03-27',0,0,9),(11,3,16,NULL,NULL,'2013-03-27',0,0,17),(12,3,22,NULL,NULL,'2013-03-27',0,0,17),(17,2,13,NULL,NULL,'2013-03-28',0,0,9),(18,5,13,NULL,NULL,'2013-05-20',0,0,9),(19,5,15,NULL,NULL,'2013-05-20',0,0,9);

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
  KEY `FK_tbl_cv_logs` (`cv_index_id`),
  CONSTRAINT `FK_tbl_cv_logs` FOREIGN KEY (`cv_index_id`) REFERENCES `tbl_cv_indexs` (`cv_index_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_cv_logs` */

insert  into `tbl_cv_logs`(`cv_log_id`,`cv_index_id`,`cv_log_num_day`,`cv_log_desc`,`cv_log_note`,`cv_log_date`,`cv_log_sort`,`cv_log_active`,`user_id`) values (3,1,NULL,'Tài liệu hướng dẫn','30 bộ',NULL,NULL,1,18),(4,2,NULL,'Tài liệu hướng dẫn','20 bộ',NULL,0,1,18),(5,2,NULL,'Chuẩn bị laptop','2 cái',NULL,0,0,18),(6,2,NULL,'Chuẩn bị Ipad','01 cái',NULL,0,1,18),(13,1,NULL,'Chuẩn bị máy chiếu màn chiếu','01 cái',NULL,0,1,18),(14,4,NULL,'Đặt xe oto 7 chỗ','Giá cáo nhất là 4tr (khoảng 500km)',NULL,0,0,9),(15,4,NULL,'Chuẩn bị 05 USB 3G','Mỗi cái nạp săn 50k',NULL,0,0,9),(16,17,NULL,'Chuẩn bị 02 loa máy tính','Công suất 2.0 dB',NULL,0,0,9),(17,17,NULL,'Chuẩn bị 02 mic ko dây','Thêm 4 pin dự phòng',NULL,0,0,9),(18,11,NULL,'Đặt phòng nhà nghỉ 5 ngày','2 phòng triple',NULL,0,0,17),(19,11,NULL,'Mua 10 chai lavie dùng trên đường','loại 1.5 lit',NULL,0,0,17),(20,12,NULL,'Đi theo phòng kỹ thuật chi trả kinh phí thiết bị','lấy phiếu thu',NULL,0,0,17),(21,12,NULL,'Đi theo phòng triển khai - bảo hành chi trả kinh phí vật dụng, tài kiệu','lấy phiếu thu',NULL,0,0,17),(22,12,NULL,'Giữ kinh phí dự trù chi trả nếu cần','lấy phiếu thu',NULL,0,0,17),(23,18,NULL,'Chịu trách nhiệm phần cứng','Bảo trì bảo dưỡng các thiết bị phần cứng',NULL,0,0,9),(24,19,NULL,'Chịu trách nhiệm phần mềm','bảo trì bảo dưỡng các gói và thiết bị phần mềm',NULL,0,0,9);

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
  KEY `FK_tbl_cv_subs` (`cv_cat_id`),
  CONSTRAINT `FK_tbl_cv_subs` FOREIGN KEY (`cv_cat_id`) REFERENCES `tbl_cv_cats` (`cv_cat_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_cv_subs` */

insert  into `tbl_cv_subs`(`cv_sub_id`,`cv_cat_id`,`department_id`,`cv_sub_name`,`cv_sub_desc`,`cv_sub_time_limit`,`cv_sub_date`,`cv_sub_sort`,`cv_sub_active`,`user_id`) values (1,1,3,'Chuẩn bị thiết bị, tài liệu kỹ thuật 1','1. Laptop: 05 chiếc\n2. Máy chiếu   màn chiếu: 01 chiếc\n3. Ipad: 01 chiếc\n4. Tài liều hướng dẫn: 50 bộ','2013-04-05','2013-03-27',NULL,NULL,1),(2,1,7,'Chuẩn bị phương tiện, thiết bị','1. Xe oto 7 chỗ: 01 cái\n2. Loa: 02 cái\n3. Mic: 02 cái\n4. USB 3G: 05 cái (Nạp sẵn 100k/01 cái)','2013-03-29','2013-03-27',NULL,NULL,1),(3,1,4,'Chuẩn bị kinh phí','1. Kinh phí đi lại: 2tr\n2. Kinh phí ăn ngủ: 3tr\n3. Kinh phí thiết bị, tài liệu: 3tr\n4. Kinh phí khác: 2tr','2013-03-27','2013-03-27',NULL,NULL,1),(5,3,7,'Quản lý thiết bị','Bảo dưỡng bảo trì thiết bị tin học','2013-05-21','2013-05-20',0,0,7);

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_departments` */

insert  into `tbl_departments`(`department_id`,`department_name`,`department_ununicode`,`department_standfor`,`department_desc`,`department_date`,`department_sort`,`department_type`,`department_active`,`user_id`) values (12,'Văn phòng UBND','Van phong UBND','VP',NULL,'2014-02-22 00:00:00',0,3,1,NULL);

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

insert  into `tbl_docfields`(`docField_id`,`docField_name`,`docField_ununicode`,`docField_desc`,`docField_date`,`docField_sort`,`docField_active`,`user_id`) values (1,'Thiết kế đồ họa','Thietkedohoa',NULL,'2012-10-01 00:00:00',NULL,1,NULL),(2,'Xây dựng phần mềm','Xaydungphanmem',NULL,'2012-10-01 00:00:00',NULL,1,NULL),(3,'Tư vấn, lên dự án','Tuvan,lenduan',NULL,'2012-10-01 00:00:00',NULL,1,NULL),(4,'Bảo trì, bảo dưỡng','Baotri,baoduong',NULL,'2012-10-01 00:00:00',NULL,1,NULL),(5,'Xây lắp mạng, hệ thống phần cứng','Xaylapmang,hethongphancung',NULL,'2012-10-01 00:00:00',NULL,1,NULL),(6,'Quản trị mạng','Quantrimang',NULL,'2012-10-01 00:00:00',NULL,1,NULL),(7,'Quản trị nội dung, SEO','Quantrinoidung,SEO',NULL,'2012-10-01 00:00:00',NULL,1,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_docfiles` */

insert  into `tbl_docfiles`(`docFile_id`,`doc_id`,`docFile_name`,`docFile_path`,`docFile_date`,`docFile_sort`,`docFile_active`,`user_id`) values (1,10,'1345 - 1: Bản scan','../doc_uploads_2012/5e1aa47c6b3f2ae83de55255c5613594.jpg','2012-10-12 00:00:00',NULL,NULL,1),(2,10,'1345 - 2: Tệp tin liên quan','../doc_uploads_2012/90659bdbb5ff70930d5715e39e92d4f8.jpg','2012-10-12 00:00:00',NULL,NULL,1),(5,10,'1345 - 3: Văn bản trả lời','../doc_uploads_2012/e15a20956031b03c2a653e3bd7faf955.jpg','2012-10-12 00:00:00',NULL,NULL,1),(6,10,'1345 - 4: Kết luận','../doc_uploads_2012/3165ece81acee9a73efcf60c7f99a7fb.jpg','2012-10-12 00:00:00',NULL,NULL,1),(7,10,'1345 - 5: Thông báo','../doc_uploads_2012/1be0bbf5216efa8f4aec1726ceb40d67.jpg','2012-10-12 00:00:00',NULL,NULL,1),(8,10,'1345 - 6: Biên bản','../doc_uploads_2012/394c5a5117f6f2100cd8f94bbfd8a119.jpg','2012-11-14 00:00:00',NULL,NULL,1),(9,17,'255/CV-NHN','../doc_uploads_2013/858b72212749a0c5341ed090fbc50045.jpg','2013-03-14 00:00:00',NULL,NULL,14),(10,16,'257/TB-UBND','../doc_uploads_2013/3a7f66fc47bdddc8cf1312c1ab945b8c.jpg','2013-03-14 00:00:00',NULL,NULL,14),(11,5,'489','../doc_uploads_2013/e30dc7a62f16b6198d5ab91ea38160a9.jpg','2013-03-15 00:00:00',NULL,NULL,14),(12,1,'2350','../doc_uploads_2013/22a3b317ee6bf71e9e6bf1f0aab29a9e.jpg','2013-03-19 00:00:00',NULL,NULL,14),(13,2,'1249','../doc_uploads_2013/41db304c0609056da30457eef50deea8.png','2013-03-19 00:00:00',NULL,NULL,14),(14,11,'12/CV-CKXL7','../doc_uploads_2013/36d1db0b345698f640733f97977d2b67.pdf','2013-03-19 00:00:00',NULL,NULL,11),(15,12,'1252/QĐ-UBND','../doc_uploads_2013/029734eec3f6b4a559053b49c7089773.pdf','2013-03-19 00:00:00',NULL,NULL,11),(16,18,'456/TB-SCT','../doc_uploads_2013/407f86ccf890c0ebdd5e25ee249f8aac.jpg','2013-03-19 00:00:00',NULL,NULL,11),(17,27,'668/TT-SGT','../doc_uploads_2013/832b298af3402ee344d9887b17a7ea9f.jpg','2013-03-19 00:00:00',NULL,NULL,11),(18,13,'245/TB-HID','../doc_uploads_2013/0cf530d8041391f68655575ba4610fd4.jpg','2013-03-19 00:00:00',NULL,NULL,11),(19,25,'679/TT-BCT','../doc_uploads_2013/f857e77f656bb4787ed20fd7092b90f0.png','2013-03-19 00:00:00',NULL,NULL,14),(20,28,'347/TT-HND','../doc_uploads_2013/26aa5b4ed5bd50145a1c10b4340b6b75.jpg','2013-03-19 00:00:00',NULL,NULL,14),(21,25,'679/TT-BCT','../doc_uploads_2013/637bf824b853a607483d3e30b53f2699.jpg','2013-03-28 00:00:00',NULL,NULL,14),(22,38,'456/UBND','../doc_uploads_2013/df4afe0104eee138441c73f5fa0f13d1.doc','2013-05-14 00:00:00',NULL,NULL,14),(23,37,'236/UBND','../doc_uploads_2013/df4afe0104eee138441c73f5fa0f13d1.doc','2013-05-14 00:00:00',NULL,NULL,14),(24,36,'254/UBND','../doc_uploads_2013/df4afe0104eee138441c73f5fa0f13d1.doc','2013-05-14 00:00:00',NULL,NULL,14);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_doclevels` */

insert  into `tbl_doclevels`(`docLevel_id`,`docLevel_name`,`docLevel_standfor`,`docLevel_desc`,`docLevel_date`,`docLevel_sort`,`docLevel_active`,`user_id`) values (1,'Trung ương','TW',NULL,'2012-10-01 00:00:00',NULL,1,NULL),(2,'Thành phố','TP',NULL,'2012-10-01 00:00:00',NULL,1,NULL),(3,'Huyện','H',NULL,'2012-10-01 00:00:00',NULL,1,NULL),(4,'Khác','K',NULL,'2012-10-01 00:00:00',NULL,1,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_docoutfiles` */

insert  into `tbl_docoutfiles`(`docOutFile_id`,`docOut_id`,`docOutFile_name`,`docOutFile_path`,`docOutFile_date`,`docOutFile_sort`,`docOutFile_active`,`user_id`) values (1,10,'7/THA-HCTC','../doc_uploads_2012/3860ffb00dde3bc949b442c28560cc99.jpg','2012-10-12 00:00:00',0,0,14),(2,9,'6/KH/THA-KTTV','../doc_uploads_2013/7f91c59527e4ce93401357e90b57d1ff.jpg','2012-10-13 00:00:00',0,0,14),(3,7,'5/KL/THA-DA','../doc_uploads_2013/efbef6e90d007600e5ad8a41fc1e07a3.jpg','2012-10-14 00:00:00',0,0,14),(4,5,'4/TB/THA-HCTC','../doc_uploads_2013/0f5ed2d53a53c1b5d190c8f912b628d4.jpg','2012-11-15 00:00:00',0,0,14),(5,4,'3/CV-THA','../doc_uploads_2013/6be961cdad35507c550aaef46a357ab0.jpg','2012-11-16 00:00:00',0,0,14),(6,11,'01/THA-KD','../doc_uploads_2013/1743796159a81d0b79a4c2be4d1646cf.doc','2012-12-17 00:00:00',0,0,0);

/*Table structure for table `tbl_docouts` */

DROP TABLE IF EXISTS `tbl_docouts`;

CREATE TABLE `tbl_docouts` (
  `docOut_id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_docouts` */

insert  into `tbl_docouts`(`docOut_id`,`docField_id`,`docCat_id`,`department_id`,`unit_name`,`unit_name_02`,`docOut_num`,`docOut_num_typical`,`docOut_code`,`docOut_desc`,`docOut_note`,`docOut_pagenum`,`secret_id`,`important_id`,`docOut_signed`,`interdisci_name`,`interdisci_name_02`,`docOut_obj`,`docOut_date`,`docOut_file`,`input_per`) values (1,'Hành chính',6,1,NULL,'Công ty CP Tech-mart',1,NULL,'1/CTr/THA-HCTC','Chương trình hội thảo giới thiệu về phần mềm Quản lý - điều hành nội bộ.',NULL,1,0,0,11,NULL,NULL,'Trưởng phòng/ban','2012-10-10 00:00:00',0,1),(2,'Xây lắp mạng, hệ thống phần cứng',4,3,NULL,'Công ty Tech-Mart',NULL,1,'1/GM/THA-KT','Mời Cty Tech-Mart tham dự cuộc họp tập huấn về triển khai cài đặt Server phục vụ cấu hình phần mềm QL-ĐH nội bộ',NULL,2,0,0,8,NULL,NULL,'Phó Giám đốc','2012-10-10 00:00:00',0,1),(3,'Hành chính',1,1,NULL,'Các thành viên công ty THA',2,0,'2/CV-THA','V/v yêu cầu các thành viên trong cty thực hiện việc đi làm đúng giờ và có ý thức giữ gìn vệ sinh bàn ghế và dụng cụ làm việc.',NULL,1,0,0,7,'0',NULL,'Giám đốc','2012-10-12 00:00:00',0,1),(4,'Xây dựng phần mềm',1,6,NULL,'Cty Thẩm định giá Hà Nội',3,0,'3/CV-THA','V/v yêu cầu cty Thẩm định giá hà nội sớm hoàn tất thủ tục thanh lý hợp đồng phần mềm TĐG.',NULL,1,0,0,7,'0',NULL,'Giám đốc','2012-10-12 00:00:00',1,1),(5,'Hành chính',3,1,NULL,'Toàn thể nhân viên cty THA',4,0,'4/TB/THA-HCTC','Thông báo tới toàn thể nhân viên cty THA về lịch hoạt động thể thao - du lịch của cty quý IV năm 2012',NULL,2,0,0,11,'0',NULL,'Trưởng phòng/ban','2012-10-12 00:00:00',1,1),(6,'Xây lắp mạng, hệ thống phần cứng',4,4,'77, 134, 157, 161',NULL,NULL,2,'2/GM/THA-KD','Kính mời quý khách cửa đại diện đơn vị đến tham gia cuộc hổi thảo tập huấn nghiệp vụ quản lý và sử dụng phần mềm QL-ĐH nội bộ.',NULL,1,0,0,7,NULL,NULL,'Giám đốc','2012-10-12 00:00:00',2,1),(7,'Xây dựng phần mềm',15,6,'89, 150, 194, 146',NULL,5,0,'5/KL/THA-DA','Kết luận về công tác tập huấn sử dụng hệ thống phần mềm QL-ĐH nội bộ đối với các khách hàng của cty THA.',NULL,5,0,0,7,'0',NULL,'Giám đốc','2012-10-12 00:00:00',1,1),(8,'Khác',4,1,NULL,'Cty Tech-Mart, cty Hảo Vọng, cty BeoBell',0,3,'3/GM/THA-HCTC','Mời các thành viên cty Tech-Mart, Hảo vọng, BeoBell tham gia buổi thi đấu bóng đá giao hữu do cty THA tổ chức vào ngày 15/10/2012.',NULL,1,0,0,11,'0',NULL,'Trưởng phòng/ban','2012-10-12 00:00:00',0,1),(9,'Kế toán tài chính',9,2,NULL,'Các cty thành viên',6,0,'6/KH/THA-KTTV','Kế hoạch tài vụ quý IV năm 2012 và kế hoạch kiểm tra sổ sách chứng từ năm 2009-2012 phục vụ kiểm toán độc lập lần 1.',NULL,2,0,0,7,'0',NULL,'Giám đốc','2012-10-12 00:00:00',1,1),(10,'Hành chính',2,1,NULL,'Các ty thành viên, nhân viên cty THA',7,0,'7/THA-HCTC','Quyết định thành lập đội bóng liên hợp giữa các cty THA, Tech-Mart, Hảo Vong, BeoBell.',NULL,2,0,0,11,'0',NULL,'Trưởng phòng/ban','2012-10-12 00:00:00',1,1),(11,NULL,2,4,'193',NULL,1,0,'01/THA-KD','Quyết định thành lập đội bóng liên hợp giữa các công ty liên nghành',NULL,1,0,0,7,'0',NULL,'Giám đốc','2013-04-24 00:00:00',1,24);

/*Table structure for table `tbl_docreplys` */

DROP TABLE IF EXISTS `tbl_docreplys`;

CREATE TABLE `tbl_docreplys` (
  `docReply_id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_id` int(11) DEFAULT '0' COMMENT 'ma van ban',
  `user_id` int(11) DEFAULT '0' COMMENT 'nguoi ra y kien',
  `coordinate_per` varchar(250) DEFAULT '0' COMMENT 'pho lanh dao phoi hop (chuyen cho ld)',
  `coordinate_depart` varchar(250) DEFAULT '0' COMMENT 'phong ban phoi hop (chuyen cho pb)',
  `recevie_per` int(11) DEFAULT '0' COMMENT 'nguoi nhan (pgd)',
  `docReply_date` date DEFAULT NULL COMMENT 'ngay ra y kien',
  `docReply_desc` text COMMENT 'noi dung y kien',
  `docReply_numday` float DEFAULT NULL COMMENT 'so ngay xu ly',
  `docReply_limit_time` date DEFAULT NULL COMMENT 'han xu ly',
  `department_id` varchar(11) DEFAULT '0' COMMENT 'phong phoi hop (chuyen cho pb)',
  `process_per` int(11) DEFAULT '0' COMMENT 'nguoi giai quyet',
  `process_level` int(11) DEFAULT '0' COMMENT 'cap giai quyet',
  `main_department` int(11) DEFAULT '0' COMMENT 'phong chu tri',
  `docReply_sort` int(11) DEFAULT '0',
  `docReply_active` tinyint(4) DEFAULT '0' COMMENT 'hien thi hay ko',
  `docReply_traned` tinyint(4) DEFAULT '0' COMMENT 'da co y kien khac chua',
  `input_per` int(11) DEFAULT '0' COMMENT 'nguoi nhap',
  PRIMARY KEY (`docReply_id`),
  KEY `FK_tbl_docreplys_docs` (`doc_id`),
  CONSTRAINT `FK_tbl_docreplys_docs` FOREIGN KEY (`doc_id`) REFERENCES `tbl_docs` (`doc_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_docreplys` */

insert  into `tbl_docreplys`(`docReply_id`,`doc_id`,`user_id`,`coordinate_per`,`coordinate_depart`,`recevie_per`,`docReply_date`,`docReply_desc`,`docReply_numday`,`docReply_limit_time`,`department_id`,`process_per`,`process_level`,`main_department`,`docReply_sort`,`docReply_active`,`docReply_traned`,`input_per`) values (1,4,7,'0','4',8,'2013-02-19','Chuyển đồng chí Nguyễn Quý Hữu - Phó Giám đốc',NULL,'2013-01-01','0',0,0,0,0,0,0,0),(2,5,7,'0','0',0,'2013-02-19','Chuyển Phòng Hành chính - Tổ chức',NULL,'2013-01-01','6,1,2,4,3',0,0,1,0,0,0,0),(3,1,7,NULL,NULL,0,'2013-02-25','Chuyển Phòng Kinh doanh',NULL,'2013-03-08','6,3',NULL,NULL,4,NULL,NULL,0,NULL),(4,2,7,NULL,NULL,8,'2013-02-25','Chuyển đồng chí Nguyễn Quý Hữu - Phó Giám đốc',NULL,'2013-03-08',NULL,NULL,NULL,0,NULL,0,0,NULL),(5,3,7,'0','0',0,'2013-02-27','Chuyển Phòng Kế toán - Tài vụ',6,'2013-03-11','0',0,0,2,0,0,0,0),(6,6,7,'0','0',0,'2013-02-28','Chuyển Phòng Kỹ thuật',NULL,'2013-01-01','4',0,0,3,0,0,1,0),(7,2,8,'0','0',0,'2013-03-06','Chuyển Phòng Dự án',NULL,'2013-03-07','4',0,0,6,0,1,0,0),(8,7,7,'0','0',0,'2013-03-06','Chuyển Phòng Dự án',5.5,'2013-03-13','4',0,0,6,0,0,0,0),(9,12,7,'8','0',0,'2013-03-07','Chuyển Phòng Kinh doanh',NULL,'2013-01-01','0',0,0,4,0,0,1,0),(14,12,17,'0','0',0,'2013-03-12','Chuyển đ/c Vĩnh phụ trách giải quyết',NULL,'1970-01-01','0',16,0,0,0,0,0,17),(15,6,18,'0','0',0,'2013-03-13','Chuyển đ/c Hải gầy phụ trách giải quyết',NULL,'1970-01-01','0',10,7,0,0,0,1,18),(16,6,10,'0','0',0,'2013-03-13','Chuyển đ/c Hải béo giải quyết và soản thảo văn bản trả lời.',NULL,'1970-01-01','0',12,8,0,NULL,0,0,10),(17,8,7,'0','0',0,'2013-03-19','Chuyển Phòng Dự án',NULL,'2013-01-01','0',0,0,6,0,0,0,0),(18,9,7,'0','0',0,'2013-03-19','Chuyển Phòng Triến khai-Bảo hành',NULL,'2013-01-01','0',0,0,7,0,0,0,0),(19,10,7,'0','0',0,'2013-03-19','Chuyển Phòng Kỹ thuật',NULL,'2013-03-29','0',0,0,3,0,0,0,0),(20,11,7,'0','0',8,'2013-03-19','Chuyển đồng chí Nguyễn Quý Hữu - Phó Giám đốc',10,'2013-04-03','0',0,0,0,0,0,0,0),(21,28,7,'0','0',0,'2013-03-19','Chuyển Phòng Hành chính - Tổ chức',NULL,'2013-01-01','0',0,0,1,0,1,0,0),(22,33,7,'0','0',0,'2013-04-23','Chuyển Phòng Hành chính - Tổ chức',NULL,'2013-01-01','0',0,0,1,0,0,1,0),(23,33,11,'0','0',0,'2013-04-23','yêu cầu làm ngay trong ngày',NULL,'2013-04-26','0',27,8,0,0,0,0,11),(24,23,7,'0','0',0,'2013-04-23','Chuyển Phòng Kế toán - Tài vụ',NULL,'2013-01-01','0',0,0,2,0,0,0,0),(25,27,7,'0','0',8,'2013-04-23','Chuyển đồng chí Nguyễn Quý Hữu - Phó Giám đốc',NULL,'2013-01-01','0',0,0,0,0,0,0,0),(26,35,7,'0','0',8,'2013-04-23','Chuyển đồng chí Nguyễn Quý Hữu - Phó Giám đốc',NULL,'2013-01-01','0',0,0,0,0,1,0,0),(27,35,8,'0','0',0,'2013-04-23','Chuyển Phòng Kỹ thuật',NULL,'2013-01-01','0',0,0,3,0,0,1,0),(28,35,18,'0','0',0,'2013-04-23','giải quyết trong ngày',NULL,'2013-04-23','0',12,8,0,0,0,0,18),(29,28,7,'0','0',0,'2013-04-24','Chuyển Phòng Kế toán - Tài vụ',NULL,'2013-01-01','0',0,0,2,0,0,0,0),(30,34,7,'0','0',8,'2013-04-24','Chuyển đồng chí Nguyễn Quý Hữu - Phó Giám đốc',NULL,'2013-01-01','0',0,0,0,0,1,0,0),(31,2,8,'0','0',0,'2013-04-24','Chuyển Phòng Hành chính - Tổ chức',NULL,'2013-01-01','0',0,0,1,0,0,0,0),(32,34,8,'0','0',0,'2013-04-24','Chuyển Phòng Kinh doanh',NULL,'2013-01-01','0',0,0,4,0,0,0,0),(33,32,7,'0','0',0,'2013-05-10','Chuyển Phòng Dự án',NULL,'2013-06-07','6',NULL,NULL,6,NULL,0,0,14),(34,38,7,'8','0',0,'2013-05-14','Chuyển Phòng Kinh doanh',NULL,'2013-01-01','3',0,0,4,0,0,0,0),(35,37,7,'8','0',0,'2013-05-14','Chuyển Phòng Kinh doanh',NULL,'2013-01-01','3',0,0,4,0,0,0,0),(36,36,7,'8','0',0,'2013-05-14','Chuyển Phòng Kinh doanh',NULL,'2013-01-01','3',0,0,4,0,0,0,0);

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
  `doc_note_sign_date` date DEFAULT NULL COMMENT 'ngay ky van ban giai quyet',
  `doc_note_sign_per` varchar(250) DEFAULT NULL COMMENT 'nguoi ky van ban giai quyet',
  `doc_note_date` date DEFAULT NULL COMMENT 'ngay giai quyet',
  `doc_recevied` date DEFAULT NULL,
  `doc_limit_time` date DEFAULT NULL COMMENT 'han giai quyet (ko dung)',
  `doc_signed` date DEFAULT NULL COMMENT 'ngay ky',
  `doc_moved` date DEFAULT NULL COMMENT 'ngay phan loai',
  `signPer_id` varchar(250) DEFAULT NULL COMMENT 'nguoi ky',
  `signObj_id` varchar(250) DEFAULT NULL COMMENT 'chuc vu ng ky',
  `secret_id` int(11) DEFAULT '0' COMMENT 'do mat',
  `important_id` int(11) DEFAULT '0' COMMENT 'do khan',
  `doc_date` date DEFAULT NULL COMMENT 'ngay nhap',
  `doc_sort` int(11) DEFAULT NULL,
  `doc_traned` tinyint(4) DEFAULT '2' COMMENT 'tinh trang chuyen',
  `doc_replied` tinyint(4) DEFAULT '2' COMMENT 'tinh trang cho y kien chi dao dau tien',
  `doc_active` tinyint(11) DEFAULT '2' COMMENT 'da giai quyet hay chua',
  `doc_file` tinyint(4) DEFAULT '2' COMMENT 'xac dinh van ban co file dinh kem hay chua',
  `user_id` varchar(250) DEFAULT '0' COMMENT 'nguoi nhan phan loai hoac chuyen thang de chi dao',
  `input_per` int(11) DEFAULT '0' COMMENT 'nguoi nhap van ban',
  `doc_theodoi` tinyint(4) DEFAULT '0' COMMENT 'xac dinh van ban can theo doi',
  PRIMARY KEY (`doc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_docs` */

insert  into `tbl_docs`(`doc_id`,`docCat_id`,`docField_id`,`docLevel_id`,`unit_name`,`doc_code`,`doc_num`,`doc_desc`,`doc_note`,`doc_note_code`,`doc_note_sign_date`,`doc_note_sign_per`,`doc_note_date`,`doc_recevied`,`doc_limit_time`,`doc_signed`,`doc_moved`,`signPer_id`,`signObj_id`,`secret_id`,`important_id`,`doc_date`,`doc_sort`,`doc_traned`,`doc_replied`,`doc_active`,`doc_file`,`user_id`,`input_per`,`doc_theodoi`) values (1,'Công văn','Xây dựng phần mềm',2,'UBND thành phố HN','2350',1,'V/v xây dựng phần mềm quản lý và điều hành công việc văn phòng.','Kính chuyển đ/c giám đốc.\nÝ kiến tham mưu:\n- Chuyển phòng Kinh doanh phụ trách giải quyết\n- Sao chuyển phòng Dự án và phòng Kỹ thuật phối hợp',NULL,NULL,NULL,NULL,'2012-10-03','1970-01-01','2012-10-02','2013-02-22','Nguyễn Thế Thảo','Chủ tịch',1,1,'2012-10-03',NULL,1,1,2,1,'7',1,1),(2,'Quyết định','Tư vấn, lên dự án',2,'Sở Công Thương TPHN','1249',2,'Giao cho cty THA trách nhiệm tư vấn và lên dự án đối với việc xây dựng hệ thông mạng tại sở.','Kính chuyển đ/c giám đốc.\nÝ kiến tham mưu:\n- Chuyển phó giám đốc Nguyễn Quý Hữu phụ trách.',NULL,NULL,NULL,NULL,'2012-10-03','1970-01-01','2012-10-02','2013-02-22','Hoàng Duy Khanh','Giám đốc',1,1,'2012-10-03',NULL,1,1,2,1,'7',1,1),(3,'Quyết định','Tư vấn, lên dự án',2,'Sở tài chính','1250',3,'Quyết định giao kinh phí cho cty THA thực hiện việc Tư vấn, lên dự án tại Sở công thương.','Kính chuyển đ/c giám đốc.\nÝ kiến tham mưu:\n- Chuyển phòng Kế toán - tài vụ phụ trách giải quyết.',NULL,NULL,NULL,NULL,'2012-10-03','1970-01-01','2012-10-02','2013-02-22','Nguyễn Công Soái','Giám đốc',1,1,'2012-10-03',NULL,1,1,2,2,'7',1,1),(4,'Giấy mời','Thiết kế đồ họa',4,'Cty TNHH MTV ĐTPT Nhà&Đô thị','198',4,'V/v mời đại diện cty THA đến tham dự cuộc họp thảo luận phương pháp thiết kế banno áp phích cho cty TNHH MTV ĐTPT Nhà&Đô thị nhận kỉ niểm 15 năm thành lập.',NULL,NULL,NULL,NULL,NULL,'2012-10-03','1970-01-01','2012-10-02','1970-01-01','Nguyễn Danh Cơ','Giám đốc',1,1,'2012-10-03',NULL,1,1,2,2,'11,7',1,0),(5,'Thông báo','Hành chính',4,'Cty Tech-Mart','489',5,'V/v tổ chức cuộc gặp gỡ giao lưu giữa 2 cty tại Church Hotel Hàng Gai vào lúc: 18h00\\&lsquo; ngày 10/10/2012','Kính chuyển đ/c giám đốc.\nÝ kiến tham mưu:\n- Chuyển phòng Hành chính giải quyết.\n- Sao chuyển các phòng ban khác biết và sắp xếp thời gian',NULL,NULL,NULL,NULL,'2012-10-03','1970-01-01','2012-10-02','2013-02-19','Nguyễn Quý Hữu','Giám đốc',1,1,'2012-10-03',NULL,1,1,2,1,'7',1,0),(6,'Công văn','Xây dựng phần mềm',2,'Sở Xây Dựng TPHN','3454',6,'V/v đề nghị cty THA tiến hành cài đặt và tập huấn sử dụng phần mềm một cửa.','Kính chuyển đ/c giám đốc.\nÝ kiến tham mưu:\n- Chuyển phòng Kỹ thuật giải quyết\n- Sao chuyển phòng Kinh doanh phối hợp','','2013-03-13','','2013-03-13','2012-10-03','1970-01-01','2012-10-03','2013-02-19','Cao Khoa Bảng','Giám đốc',1,1,'2012-10-03',NULL,1,1,1,2,'7',1,0),(7,'Thông báo','Xây dựng phần mềm',3,'UBND Quận Tây Hồ','598',7,'V/v thông báo tổ chức đấu thầu gói thầu xây lắp hệ thông mạng cho khu liên cơ.','Kính chuyển đ/c giám đốc.\nÝ kiến tham mưu:\n- Chuyển phòng Dự án giải quyết\n- Chuyển phòng Kinh doanh phối hợp',NULL,NULL,NULL,NULL,'2012-10-03','1970-01-01','2012-10-03','2013-02-19','Nguyễn Phúc Quang','Chủ tịch',1,1,'2012-10-03',NULL,1,1,2,2,'7',1,1),(8,'Đính chính Văn bản','Hành chính',4,'Cty Tech-Mart','499',8,'Đính chính lại văn bản số 489 thời gian tổ chức giao lữu sẽ là 18h30‘. Địa điểm không thay đổi.','Kính chuyển đ/c giám đốc.\nÝ kiến tham mưu:\n- Chuyển phòng Dự án giải quyết\n- Sao chuyển phòng Kinh doanh phối hợp',NULL,NULL,NULL,NULL,'2012-10-04','1970-01-01','2012-10-03','2013-02-19','Nguyễn Quý Hữu','Giám đốc',1,2,'2012-10-03',NULL,1,1,2,2,'7',1,0),(9,'Thông báo',NULL,0,'Cty Tech-Mart','223',9,'Thông báo lịch bảo trì thiệt bị tin học tháng 10-2012 đến cty THA.','Kính chuyển đ/c giám đốc.\nÝ kiến tham mưu:\n- Chuyển phòng Triển khai-Bảo hành giải quyết\n- Sao chuyển phòng Kinh doanh phối hợp',NULL,NULL,NULL,NULL,'2013-02-01','1970-01-01','2012-10-04','2013-02-19','Nguyễn Quý Hữu','Giám đốc',1,1,'2012-10-05',NULL,1,1,2,2,'7',1,0),(10,'Công văn','Xây dựng phần mềm',0,'Sở Tài chính Hà Nội','1345',10,'V/v đề nghị cty THA cử đại diện đến Sở để cùng kết hợp triển khai DVC trực tuyến tích hợp trên cổng thông tin Sở.','Kính chuyển đ/c giám đốc.\nÝ kiến tham mưu:\n- Chuyển phòng Kỹ thuật phụ trách giải quyết;\n- Sao chuyển phòng Kinh doanh phối hợp.','222/TB-THA-KT','2013-05-13','Dương Việt Hùng','2013-05-14','2012-10-05','1970-01-01','2012-10-04','2013-02-19','Nguyễn Thị Hà Ninh','Giám đốc',1,1,'2012-10-05',NULL,1,1,1,1,'7',1,1),(11,'Công văn','Tư vấn, lên dự án',4,'Cty CP Cơ khí & Xây lắp số 7','12/CV-CKXL7',11,'V/v đề nghị công ty THA cử người tới tư vấn lắp đặt hệ thống mạng nội bộ toàn bộ công ty và các phân xưởng sản xuất.','Kính gửi đ/c giám đốc.\nÝ kiến tham mưu:\n- Chuyển đ/c phó giám đốc Nguyễn Quý Hữu phụ trách.',NULL,NULL,NULL,NULL,'2013-02-22','1970-01-01','2013-02-19','2013-02-22','Nguyễn Quang Triệu','Giám đốc',1,1,'2013-02-20',NULL,1,1,2,1,'7',1,1),(12,'Quyết định','Tư vấn, lên dự án',2,'UBND thành phố HN','1252/QĐ-UBND',12,'V/v quyết định chọn công ty THA là đơn vị tư vấn và lập dự án tổng thể đối với gói thầu phần mềm quản lý và điều hành tác nghiệp triển khai tại tất cả các quận, huyện thuộc Hà Nội.','K/c đ/c giám đốc:\nÝ kiến tham mưu:\n- Chuyển phòng kinh doanh thực hiện;\n- Sao chuyển phó giám đốc Nguyễn Quý Hữu giám sát.',NULL,NULL,NULL,NULL,'2013-02-21','1970-01-01','2013-02-21','2013-03-07','Nguyễn Thế Thảo','Chủ tịch',1,1,'2013-02-21',NULL,1,1,2,1,'7',1,0),(13,'Thông báo','Thiết kế đồ họa',4,'Công ty TNHH Đầu tư xây lắp và Phát triển Nhà','245/TB-HID',13,'V/v thông báo mở phiên đấu giá gói thiết kế công trình liên hợp văn hóa-thể thao Đồng Mai tại phòng 302, nhà T17, Lê Văn Lương, Đống Đa, HN.',NULL,NULL,NULL,NULL,NULL,'2013-02-22','1970-01-01','2013-02-20','1970-01-01','Trần Thế Kim','Giám đốc',1,1,'2013-02-22',NULL,2,2,2,1,'0',1,0),(14,'Công văn','Bảo trì, bảo dưỡng',4,'Tổ chức tư vấn rà phá bom mìn và vật liệu nổ MAG Việt Nam','143/CV-MAG',14,'V/v đề nghị cty THA trợ giúp tư vấn và tiến hành ký kết hợp động bảo trì, bảo dưỡng hệ thống mạng, thiết bị tin học tại MAG.',NULL,NULL,NULL,NULL,NULL,'2013-02-22','1970-01-01','2013-02-22','1970-01-01','Lê Anh Thư','Phó giám đốc',1,1,'2013-02-22',NULL,2,2,2,2,'0',1,0),(15,'Công văn','Bảo trì, bảo dưỡng',4,'Công ty CP thiết bị công nghiệp Việt Tiến','187/CV-VT',15,'V/v đề nghị công ty THA tiến hành gia hạn hợp đồng bảo trì, bảo dưỡng hệ thống thiết bị tin học và phần mềm của công ty Việt Tiến năm 2013.',NULL,NULL,NULL,NULL,NULL,'2013-02-22','1970-01-01','2013-02-22','1970-01-01','Bùi Nguyên Soái','Giám đốc',1,1,'2013-02-22',NULL,2,2,2,2,'0',1,0),(16,'Thông báo','Xây dựng phần mềm',3,'UBND Quận Tây Hồ','257/TB-UBND',16,'V/v thông báo gói thầu phần mềm quản lý Thi đua-khen thưởng triển khai cho phòng Nội Vụ.',NULL,NULL,NULL,NULL,NULL,'2013-02-22','1970-01-01','1970-01-01','1970-01-01','Nguyễn Phúc Quang','Chủ tịch',1,1,'2013-02-22',NULL,2,2,2,1,'0',1,0),(17,'Công văn','Thiết kế đồ họa',4,'Công ty QL và PT nhà HN','255/CV-NHN',17,'V/v đề nghị công ty THA soạn thảo hợp đồng thiết kế áp-phích cho giải bòng đá do công ty QL và PT nhà HN đăng cai.',NULL,NULL,NULL,NULL,NULL,'2013-03-07','1970-01-01','2013-03-07','1970-01-01','Nguyễn Lân Hải','Giám đốc',1,1,'2013-03-07',NULL,2,2,2,1,'0',14,0),(18,'Thông báo','Thiết kế đồ họa',2,'Sở Công Thương TPHN','456/TB-SCT',18,'V/v đề nghị công ty THA soạn thảo hợp đồng thiết kế giao diện công thông tin cho sở công thương',NULL,NULL,NULL,NULL,NULL,'2013-03-19','1970-01-01','2013-03-20','1970-01-01','Ngô Quang Trung','Giám đốc',1,1,'2013-03-19',NULL,2,2,2,1,'0',14,0),(19,'Thông tư','Tư vấn, lên dự án',1,'Bộ Tài nguyên và Môi trường','457/TT-BTNMT',19,'Vv Tư vấn thiết kế xây dựng hệ thống quản lý môi trường sông hồ khu vực đồng bằng sông Hồng giai đoạn 2015-2020',NULL,NULL,NULL,NULL,NULL,'2013-03-19','1970-01-01','2013-03-20','1970-01-01','Nguyễn Duy Trung','Giám đốc',1,1,'2013-03-19',NULL,2,2,2,2,'0',14,0),(20,'Thông tư','Lập kế hoạch phân bổ tài chính năm 2015',3,'Phòng TCKH Đông Anh','458/TT-UBND',20,'V/v Lập kế hoạch tài chính cho các phòng ban của Huyện thị trấn và các xã trong năm 2015','Tôi đồng ý',NULL,NULL,NULL,NULL,'2013-03-19','1970-01-01','2013-03-22','2013-04-24','Nguyễn Khắc Thọ','Chủ tịch',1,1,'2013-03-19',NULL,1,2,2,2,'7',14,0),(21,'Thông tư','Quản lí vấn đề dạy thêm học thêm',2,'Sở Giáo Dục và Đào Tạo TPHN','459/TT-UBND',21,'V/v Quản lý vấn đề dạy thêm học thêm trên địa bàn toàn thành phố đồng thời nâng cao chất lượng giáo dục đào tạo','K/c đ/c giám đốc:\nÝ kiến tham mưu:\nSở giáo dục kết hợp với ủy ban nhân dân các quận huyện và các phòng giáo dục tổ chức thanh kiểm tra vấn đề dạy thêm học thêm trên địa bàn thành phố\nCó ý kiến tham mưu cho lãnh đạo',NULL,NULL,NULL,NULL,'2013-03-19','1970-01-01','2013-03-23','2013-03-19','Nguyễn Công Soái','Phó chủ tịch',1,1,'2013-03-19',NULL,1,2,2,2,'7',14,0),(22,'Thông tư','Nâng cao hiệu suất sử dụng năng lượng',2,'Sở Khoa Học và Công Nghệ TPHN','460/TT-SKHCN',22,'V/v cải tiến sửa chữa hệ thống truyền tải điện trên địa bàn toàn thành phố,nhằm đáp ứng nâng cao chất lượng trong giai đoạn phát triển mới','K/c đ/c giám đốc:\nÝ kiến tham mưu:\nTổ chức kiểm tra đánh giá tình hình cơ sở hạ từng của hệ thống truyền tải điện,\nlập kế hoạch nâng cấp cải tạo đề xuất với UBND thành phố',NULL,NULL,NULL,NULL,'2013-03-19','1970-01-01','2013-03-04','2013-03-19','Ngô Thị Thanh Hằng','Phó chủ tịch',1,1,'2013-03-19',NULL,1,2,2,2,'7',14,0),(23,'Thông tri','Nâng cao năng lực cho cán bộ nhân viên văn phòng',3,'Phòng công chứng NN số 1','345/TT-UBND',23,'V/v Tổ chức học hội thảo nâng cao nghiệp vụ cho cán bộ văn phòng nhằm nâng cao năng lực','đồng ý',NULL,NULL,NULL,NULL,'2013-03-19','1970-01-01','2013-03-05','2013-04-23','Nguyễn Hữu Độ','Phó chủ tịch',1,1,'2013-03-19',NULL,1,1,2,2,'7',14,0),(24,'Thông tư','Hội thảo tư vấn pháp luật',2,'Sở Tư Pháp TPHN','560/TT-STP',24,'V/v Lập kế hoạch tổ chức hội thảo tư vấn pháp luận trên địa bàn toàn thành phố trong năm 2013','K/c đ/c giám đốc:\nÝ kiến tham mưu:\nPhối kết hợp với ủy ban nhân dân các Quận Huyện tổ chức hội thảo, tư vấn pháp luận cho cán bộ công nhân viên và nhân dân trên địa bàn',NULL,NULL,NULL,NULL,'2013-03-19','1970-01-01','2013-03-02','2013-03-19','Lê Anh Tuấn','Phó chủ tịch',1,1,'2013-03-19',NULL,1,2,2,2,'7',14,0),(25,'Thông tư','Lập kế hoạch đầu tư cho các tỉnh phía nam',1,'Bộ công thương','679/TT-BCT',25,'V/v Lập kế hoạch đầu tư cho các tỉnh thành phía nam trong năm 2013','Đồng ý',NULL,NULL,NULL,NULL,'2013-03-19','1970-01-01','2013-03-04','2013-04-23','Lâm Quốc Hùng','Phó Chánh Văn Phòng',1,1,'2013-03-19',NULL,1,2,2,1,'7',14,0),(26,'Thông tư','Tư vấn, lên dự án',3,'Phòng công chứng NN số 2','209/TT-UBND',26,'V/v Lập kế hoạch dự án làm việc trong năm 2013 và định hướng phát triển trong những năm tiếp theo','K/c đ/c giám đốc:\nÝ kiến tham mưu:\ngửi đến phòng lao động thương binh và xã hội lên kế hoạch tổ chức ngày hội việc làm trên địa bàn huyện',NULL,NULL,NULL,NULL,'2013-03-19','1970-01-01','2013-03-05','2013-03-19','Lê Văn Thư','Phó chủ tịch',1,1,'2013-03-19',NULL,1,2,2,2,'7',14,0),(27,'Thông tư','Lập kế hoạch tổ chức kiểm tra',2,'Thanh tra Sở_Sở GTHN','668/TT-SGT',27,'V/v Tổ chức lập kế hoạch kiểm tra thanh tra giao thông trên địa bàn thành phố','Đồng ý với văn bản',NULL,NULL,NULL,NULL,'2013-03-19','1970-01-01','2013-03-05','2013-04-23','Nguyễn Hồng Sơn','Phó giám đốc',1,1,'2013-03-19',NULL,1,1,2,1,'7',14,0),(28,'Thông tri','Tổ chức tư vấn cho nhân dân các huyện trên địa bàn Tp',2,'Hội Nông dân HN','347/TT-HND',28,'V/v Lên kế hoạch tổ chức hội thảo hướng nghiệp cho các huyện, thị trấn có dự án thu hồi đất trên địa bàn thành phố','K/c đ/c giám đốc:\nÝ kiến tham mưu:\nChuyển đến phòng thương binh lao động xã hội huyện tổ chức và phối hợp với các phòng ban có liên quan',NULL,NULL,NULL,NULL,'2013-03-19','1970-01-01','2013-03-07','2013-03-19','Nguyễn Khắc Dũng','Phó Ban Thường Trực',1,1,'2013-03-19',NULL,1,1,2,1,'7',14,0),(31,'Công văn',NULL,1,'Trung tâm Khuyến Nông&Tư vấn PTCN','112354',29,'Văn Bản','Xem xét về các chức năng và dịch vụ',NULL,NULL,NULL,NULL,'2013-04-23','1970-01-01','2013-04-12','2013-04-23','Mai Xuân Vinh','Trưởng ban',1,1,'2013-04-23',NULL,1,2,2,2,'8',1,0),(32,'Công văn','Quản trị mạng',0,'Sở Công Thương TPHN','06-UBND-VP',30,'Thiết kế đồ họa','\nĐông ý văn bản đúng',NULL,NULL,NULL,NULL,'2013-04-23','1970-01-01','2013-04-23','2013-04-23','Ngô Quang Tiến','Thứ trưởng',2,2,'2013-04-23',NULL,1,1,2,2,'8',24,1),(33,'Thông báo','Thiết kế đồ họa',3,'UBND huyện Chương Mỹ','25/UBND',31,'V/v Thiết kế biển quảng cáo cho công ty TNHH ABC','đã cho ý kiến và chuyển phòng ban xử lý','số 094','2013-04-23','Nguyễn Quý Hữu','2013-04-23','2013-04-23','1970-01-01','2013-04-23','2013-04-23','Ngô Thị Thanh Hằng','Phó chủ tịch',1,1,'2013-04-23',NULL,1,1,1,2,'7',24,0),(34,'Công Văn',NULL,0,'Uỷ Ban Thường Vụ Quốc Hội','07-UBND-DN',32,'Nghị quyết giải quyết các thắc mắc của người dân','Không đồng ý','263/UBND','2013-05-14','Dương Anh Tuấn','2013-05-14','2013-04-23','1970-01-01','2013-04-23','2013-04-23','Dương Kỳ Lân','Trưởng Cơ Quan Thường trực',1,1,'2013-04-23',NULL,1,1,1,2,'7',24,0),(35,'Thông tư','Tư vấn, lên dự án',2,'UBND Quận Hoàn Kiếm','0214/UBND',33,'V/v tư vấn thiết kế dự án cầu đường bộ','đồng ý với hướng giải quyết của cty','số 85','2013-04-23','Dương Việt Hùng','2013-04-23','2013-04-23','1970-01-01','2013-04-23','2013-04-23','Ngọ Duy Hiểu','Giám đốc',1,1,'2013-04-23',NULL,1,1,1,2,'7',24,0),(36,'Chương trình','Tư vấn, lên dự án',2,'UBND Quận Cầu Giấy','254/UBND',34,'v/v tư vấn dự án thiết kế hạ tầng mạng','k/c đồng chí',NULL,NULL,NULL,NULL,'2013-05-14','1970-01-01','2013-05-14','2013-05-14','Đặng Tuấn Hùng','Giám đốc',1,1,'2013-05-14',NULL,1,1,2,1,'7',14,0),(37,'Tờ trình','Thiết kế đồ họa',2,'UBND Quận Ba Đình','236/UBND',35,'v/v thiết kế đồ học cho phần mềm quản lý văn bản','k/c đồng chí',NULL,NULL,NULL,NULL,'2013-05-14','1970-01-01','2013-05-14','2013-05-14','Ngô Quang Trung','Trưởng phòng',1,1,'2013-05-14',NULL,1,1,2,1,'7',14,0),(38,'Thông báo','Tư vấn, lên dự án',1,'Văn phòng UBND-HN','456/UBND',36,'v/v tư vấn thiết kế hệ thống hạ tầng công nghệ','k/c đồng chí','361/UBND','2013-05-14','Dương Anh Tuấn','2013-05-14','2013-05-14','1970-01-01','2013-05-14','2013-05-14','Nguyễn Công Soái','Trưởng phòng',1,1,'2013-05-14',NULL,1,1,1,1,'7',14,0);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_feedbacks` */

insert  into `tbl_feedbacks`(`feedback_id`,`doc_id`,`feedback_cont`,`feedback_date`,`read_status`,`read_time`,`user_id`) values (1,3,'Tôi đã xem và nhất chí với văn bản','2013-05-01 08:05:05',0,NULL,14);

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

insert  into `tbl_hdsds`(`hdsd_id`,`hdsd_name`,`hdsd_path`,`hdsd_date`,`hdsd_sort`,`hdsd_active`) values (1,'Tạo lịch','../hdsd_uploads/d264e4b7b88b740265b2c36c849a1e45.swf','2014-02-22',NULL,1),(2,'Hướng dẫn số 2','../hdsd_uploads/e679b049cfc782e011867729bd2e28e3.swf','2013-05-03',NULL,2);

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

insert  into `tbl_objects`(`object_id`,`object_name`,`object_standfor`,`object_desc`,`object_date`,`object_sort`,`object_active`,`user_id`) values (1,'Chu tịch UBND','CTUBND','Chủ tịch ủy ban nhân dân','2014-02-22 00:00:00',NULL,1,NULL),(2,'Phó Chủ tịch UBND','PCTUBND','Phó chủ tịch ủy bản nhân dân phụ trách 1 văn xã hoặc kinh tế, hoặc chính trị','2014-02-22 00:00:00',NULL,1,NULL),(3,'Chánh văn phòng','CVP','Chánh văn phòng là người phụ trách văn phòng UBND','2014-02-22 00:00:00',NULL,1,NULL),(4,'Trưởng phòng/ban','TP','Trưởng phòng là người quản lý 1 phòng / ban nào đó.','2012-09-24 00:00:00',NULL,1,NULL),(5,'Phó trường phòng/ban','PTP','Phó trường phòng / ban là người giúp trưởng phòng / ban chia sẻ công việc trong phòng.','2012-09-24 00:00:00',0,1,NULL),(6,'Chuyên viên','CV','Chuyên viên thuộc p/b chuyên môn hoặc văn phòng UBND.','2014-02-22 00:00:00',NULL,1,NULL);

/*Table structure for table `tbl_plan_details` */

DROP TABLE IF EXISTS `tbl_plan_details`;

CREATE TABLE `tbl_plan_details` (
  `plan_id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_subject` varchar(250) DEFAULT NULL COMMENT 'muc tieu cong viec',
  `plan_start` datetime DEFAULT NULL COMMENT 'thoi gian bat dau',
  `plan_end` datetime DEFAULT NULL COMMENT 'thoi gian ket thuc',
  `plan_cont` text COMMENT 'noi nung cong viec',
  `plan_date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_plan_details` */

insert  into `tbl_plan_details`(`plan_id`,`plan_subject`,`plan_start`,`plan_end`,`plan_cont`,`plan_date`,`user_id`) values (2,'Hướng dẫn cấu hình phần mềm','2013-04-09 13:30:00','2013-04-11 11:30:00','1. Phần mềm 1 cửa SNN\n2. Dịch vụ công trực tuyến SNN\n3. Phần mềm 1 của STC\n4. Kiêm tra KIOT màn hình cảm ứng STC','2013-04-09',1),(10,'Họp cty demo phần mềm','2013-04-12 08:30:00','2013-04-12 10:30:00','1. Phần mềm DVC trực tuyến Sở NNPTNN\n2. Phần mềm QLHS Một cửa Sở NNPTNN','2013-04-11',7),(11,'Hẹn','2013-04-30 12:00:00','2013-04-30 03:00:00','Có hẹn','2013-04-25',11),(12,'Họp cty sau nghỉ lễ 30/04 - 01/05','2013-05-06 08:30:00','2013-05-06 11:30:00','Bàn về công tác kỹ thuật và bảo trì\nThống nhất cách thức triển khai PM một cửa STC','2013-05-01',7),(13,'Gặp khách hàng bên Sở NN ','2013-05-06 14:30:00','2013-05-06 16:30:00','Bàn về PM Quản lý báo cáo','2013-05-01',7),(14,'Gặp khách hàng bên Sở TC Hà Nội','2013-05-07 08:30:00','2013-05-07 11:30:00','Bàn về PM quản lý sau thanh tra','2013-05-01',7),(15,'Làm việc tại văn phòng bên HQV','2013-05-07 13:30:00','2013-05-07 17:20:00','Xử lý các công việc chung','2013-05-01',7),(16,'Gặp gỡ và làm việc với cán bộ bên Sở Tư pháp Hà Nội','2013-05-08 08:30:00','2013-05-08 16:30:00','Làm việc về PM quản lý Hộ tịch trong quá trình triển khai.','2013-05-01',7),(17,'Kiểm tra việc triển khai phần mềm tại chi nhán Thanh Hóa','2013-05-09 08:30:00','2013-05-09 16:30:00','Kiểm tra việc triển khai các phần mềm QL văn bản, Truyền nhận Văn bản, Một cửa','2013-05-01',7),(18,'Đối chiểu việc khắc phục các yêu cầu phần mềm tại Thanh Hóa','2013-05-10 08:00:00','2013-05-10 10:00:00','Làm việc với bộ phần kỹ thuật tại công ty','2013-05-01',7),(19,'Gặp khách hàng UBND Quận Cầu Giấy','2013-05-10 10:30:00','2013-05-10 12:00:00','Làm việc về phần mềm QL người có công','2013-05-01',7),(20,'Gặp khách hàng bên UBND Quận Thanh Xuân','2013-05-10 14:00:00','2013-05-10 16:30:00','Làm việc về hệ thống máy chủ và hợp đồng bảo trì phần cứng','2013-05-01',7),(22,'Sở xây dựng','2013-05-17 08:00:00','2013-05-17 09:30:00','Cài đặt bản phần mềm mới, hướng dẫn sử dụng.','2013-05-17',1),(23,'Tổ chức họp đề xuất nấu ăn tại cty','2013-05-17 10:30:00','2013-05-19 11:30:00','Thông báo kế hoạch nấu ăn tại cty và phân bổ lịch trực nấu ăn và dọn rửa chén bát.','2013-05-20',14),(26,'Họp nghị quyết ','2013-05-21 04:20:00','2013-05-21 16:00:00','Họp thảo luận về ý kiến cho nghị quyết mới','2013-05-20',8),(27,'Công việc trong ngày','2014-02-22 08:00:00','2014-02-22 12:00:00','Cần phải hoàn thành gấp nhiệm vụ được giao','2014-02-22',1),(28,'Công việc ngày thứ 2','2014-02-17 08:00:00','2014-02-17 12:00:00','Công việc sáng: Đi họp tại Sở Nông nghiệp PTNT','2014-02-22',31),(29,'Công việc chiều','2014-02-17 13:30:00','2014-02-17 17:00:00','Chủ trì họp chi bộ.','2014-02-22',31),(30,'Công việc ngày','2014-02-18 08:00:00','2014-02-18 17:00:00','Đi công tác kiểm tra tình hình tôn tạo khu di tích đền Sóc.','2014-02-22',31),(31,'Công việc','2014-02-19 08:00:00','2014-02-19 12:00:00','Sáng: tiếp dân, lắng nghe các kiến nghị từ phía người dân trong dự án trông rừng phòng hộ.','2014-02-22',31),(32,'Công việc chiều','2014-02-19 13:30:00','2014-02-19 17:00:00','Chỉ đạo các phòng ban liên quan giải quyết các kiến nghị người dân','2014-02-22',31),(33,'Công việc ngày','2014-02-20 08:00:00','2014-02-20 17:00:00','Kiểm tra tình hình chỉ đạo tại ban chỉ huy quân sự Huyện.','2014-02-22',31),(34,'Công việc ngày:','2014-02-21 08:00:00','2014-02-21 17:00:00','Họp giao ban việc tình hình triên khai công nghệ thông tin và đón đoàn thành tra liên ngành về tình hình phòng trừ dịch cúm gia cầm.','2014-02-22',31),(35,'Công việc ngày','2014-02-22 08:00:00','2014-02-22 12:00:00','Xử lý công việc tại văn phòng.','2014-02-22',31),(36,'Công việc sáng','2014-02-24 08:00:00','2014-02-24 11:30:00','Buổi sáng: Gặp gỡ các đồng chí trong hội cựu chiến binh huyện.','2014-02-22',31);

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
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_receives` */

insert  into `tbl_receives`(`receive_id`,`doc_id`,`department_id`,`receive_per`,`receive_note`,`receive_time`,`receive_sms`,`doc_status`,`read_status`,`read_time`,`read_per`) values (172,1,1,11,'Chuẩn bị diễn văn','2013-03-18 02:03:59',1,0,0,NULL,0),(173,1,2,5,'Dự trù kinh phí','2013-03-18 02:03:59',1,0,0,NULL,0),(174,1,3,18,'Chuẩn bị thiết bị điển từ, trình chiếu','2013-03-18 02:03:59',1,0,0,NULL,0),(175,1,4,8,NULL,'2013-03-18 02:03:59',0,0,0,NULL,0),(176,1,6,7,NULL,'2013-03-18 02:03:59',0,0,0,NULL,0),(177,1,7,9,NULL,'2013-03-18 02:03:59',0,0,0,NULL,0),(178,1,8,0,NULL,'2013-03-18 02:03:59',0,0,0,NULL,0),(179,1,9,0,NULL,'2013-03-18 02:03:59',0,0,0,NULL,0),(180,1,10,0,NULL,'2013-03-18 02:03:59',0,0,0,NULL,0),(181,1,11,0,NULL,'2013-03-18 02:03:59',0,0,0,NULL,0),(192,3,1,0,'Cho ý kiến góp ý','2013-03-19 09:03:18',0,0,0,NULL,0),(193,3,2,0,'Cho ý kiến góp ý','2013-03-19 09:03:18',0,0,0,NULL,0),(194,3,3,0,'Cho ý kiến góp ý','2013-03-19 09:03:18',0,0,0,NULL,0),(195,3,4,0,'Cho ý kiến góp ý','2013-03-19 09:03:18',0,0,0,NULL,0),(196,3,6,0,'Cho ý kiến góp ý','2013-03-19 09:03:18',0,0,0,NULL,0),(197,3,7,0,'Cho ý kiến góp ý','2013-03-19 09:03:18',0,0,0,NULL,0),(198,3,8,0,'Cho ý kiến góp ý','2013-03-19 09:03:18',0,0,0,NULL,0),(199,3,9,0,'Cho ý kiến góp ý','2013-03-19 09:03:18',0,0,0,NULL,0),(200,3,10,0,'Cho ý kiến góp ý','2013-03-19 09:03:18',0,0,0,NULL,0),(201,3,11,0,'Cho ý kiến góp ý','2013-03-19 09:03:18',0,0,0,NULL,0),(202,4,1,0,'Chuẩn bị diễn văn, quà tặng','2013-03-19 10:03:41',0,0,0,NULL,0),(203,4,2,0,'Chuyển kinh phí về chi nhánh Thanh Hóa','2013-03-19 10:03:41',0,0,0,NULL,0),(204,4,4,0,NULL,'2013-03-19 10:03:41',0,0,0,NULL,0),(205,4,8,0,NULL,'2013-03-19 10:03:41',0,0,0,NULL,0),(206,5,1,0,NULL,'2013-03-21 01:03:46',0,0,0,NULL,0),(207,5,2,0,NULL,'2013-03-21 01:03:46',0,0,0,NULL,0),(208,5,7,0,NULL,'2013-03-21 01:03:46',0,0,0,NULL,0),(209,5,3,0,NULL,'2013-03-21 01:03:46',0,0,0,NULL,0),(210,5,4,0,NULL,'2013-03-21 01:03:46',0,0,0,NULL,0),(211,5,6,0,NULL,'2013-03-21 01:03:46',0,0,0,NULL,0),(212,5,8,0,NULL,'2013-03-21 01:03:46',0,0,0,NULL,0),(213,5,9,0,NULL,'2013-03-21 01:03:46',0,0,0,NULL,0),(214,5,10,0,NULL,'2013-03-21 01:03:46',0,0,0,NULL,0),(215,5,11,0,NULL,'2013-03-21 01:03:46',0,0,0,NULL,0),(216,6,1,0,NULL,'2013-03-21 02:03:07',0,0,0,NULL,0),(217,6,2,0,NULL,'2013-03-21 02:03:07',0,0,0,NULL,0),(218,6,7,0,NULL,'2013-03-21 02:03:07',0,0,0,NULL,0),(219,6,3,0,NULL,'2013-03-21 02:03:07',0,0,0,NULL,0),(220,6,4,0,NULL,'2013-03-21 02:03:07',0,0,0,NULL,0),(221,6,6,0,NULL,'2013-03-21 02:03:07',0,0,0,NULL,0),(222,6,8,0,NULL,'2013-03-21 02:03:07',0,0,0,NULL,0),(223,6,9,0,NULL,'2013-03-21 02:03:07',0,0,0,NULL,0),(224,6,10,0,NULL,'2013-03-21 02:03:07',0,0,0,NULL,0),(225,6,11,0,NULL,'2013-03-21 02:03:07',0,0,0,NULL,0),(226,7,4,0,NULL,'2013-04-24 11:04:57',1,0,0,NULL,0),(227,8,7,0,NULL,'2013-04-24 11:04:58',1,0,0,NULL,0),(228,8,3,0,NULL,'2013-04-24 11:04:58',0,0,0,NULL,0),(229,8,4,0,NULL,'2013-04-24 11:04:58',0,0,0,NULL,0),(230,9,4,0,NULL,'2013-04-24 12:04:00',1,0,0,NULL,0),(231,10,11,0,NULL,'2013-04-24 12:04:53',1,0,0,NULL,0),(232,11,1,0,NULL,'2013-06-11 02:06:37',0,0,0,NULL,0),(233,11,1,0,NULL,'2013-06-11 02:06:37',0,0,0,NULL,0),(234,11,2,0,NULL,'2013-06-11 02:06:37',0,0,0,NULL,0),(235,11,7,0,NULL,'2013-06-11 02:06:37',0,0,0,NULL,0),(236,11,3,0,NULL,'2013-06-11 02:06:37',0,0,0,NULL,0),(237,11,4,0,NULL,'2013-06-11 02:06:37',0,0,0,NULL,0),(238,11,6,0,NULL,'2013-06-11 02:06:37',0,0,0,NULL,0);

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
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_recusers` */

insert  into `tbl_recusers`(`recUser_id`,`user_id`,`receive_id`,`read_time`,`read_status`,`recUser_date`) values (53,19,178,NULL,0,'2013-03-18 02:03:59'),(54,20,179,NULL,0,'2013-03-18 02:03:59'),(55,21,180,NULL,0,'2013-03-18 02:03:59'),(65,7,192,NULL,0,'2013-03-19 09:03:18'),(66,11,192,NULL,0,'2013-03-19 09:03:18'),(67,14,192,'2013-05-01 20:00:11',1,'2013-03-19 09:03:18'),(68,5,193,NULL,0,'2013-03-19 09:03:18'),(69,6,193,NULL,0,'2013-03-19 09:03:18'),(70,1,194,NULL,0,'2013-03-19 09:03:18'),(71,10,194,NULL,0,'2013-03-19 09:03:18'),(72,12,194,NULL,0,'2013-03-19 09:03:18'),(73,18,194,NULL,0,'2013-03-19 09:03:18'),(74,16,195,NULL,0,'2013-03-19 09:03:18'),(75,8,195,NULL,0,'2013-03-19 09:03:18'),(76,17,195,NULL,0,'2013-03-19 09:03:18'),(77,9,197,NULL,0,'2013-03-19 09:03:18'),(78,13,197,NULL,0,'2013-03-19 09:03:18'),(79,15,197,NULL,0,'2013-03-19 09:03:18'),(80,19,198,NULL,0,'2013-03-19 09:03:18'),(81,20,199,NULL,0,'2013-03-19 09:03:18'),(82,21,200,NULL,0,'2013-03-19 09:03:18'),(83,7,202,NULL,0,'2013-03-19 10:03:41'),(84,11,202,NULL,0,'2013-03-19 10:03:41'),(85,14,202,'2013-03-21 14:13:59',1,'2013-03-19 10:03:41'),(86,5,203,NULL,0,'2013-03-19 10:03:41'),(87,6,203,NULL,0,'2013-03-19 10:03:41'),(88,16,204,NULL,0,'2013-03-19 10:03:41'),(89,8,204,NULL,0,'2013-03-19 10:03:41'),(90,17,204,NULL,0,'2013-03-19 10:03:41'),(91,19,205,NULL,0,'2013-03-19 10:03:41'),(92,7,206,NULL,0,'2013-03-21 01:03:46'),(93,11,206,NULL,0,'2013-03-21 01:03:46'),(94,14,206,'2013-05-14 11:07:03',1,'2013-03-21 01:03:46'),(95,5,207,NULL,0,'2013-03-21 01:03:46'),(96,6,207,NULL,0,'2013-03-21 01:03:46'),(97,9,208,NULL,0,'2013-03-21 01:03:46'),(98,13,208,NULL,0,'2013-03-21 01:03:46'),(99,15,208,NULL,0,'2013-03-21 01:03:46'),(100,1,209,'2013-06-13 18:28:55',1,'2013-03-21 01:03:46'),(101,10,209,NULL,0,'2013-03-21 01:03:46'),(102,18,209,NULL,0,'2013-03-21 01:03:46'),(103,12,209,NULL,0,'2013-03-21 01:03:46'),(104,16,210,NULL,0,'2013-03-21 01:03:46'),(105,8,210,NULL,0,'2013-03-21 01:03:46'),(106,17,210,NULL,0,'2013-03-21 01:03:46'),(107,19,212,NULL,0,'2013-03-21 01:03:46'),(108,20,213,NULL,0,'2013-03-21 01:03:46'),(109,21,214,NULL,0,'2013-03-21 01:03:46'),(110,7,216,'2013-05-02 23:10:01',1,'2013-03-21 02:03:07'),(111,11,216,'2013-04-24 11:51:27',1,'2013-03-21 02:03:07'),(112,14,216,'2013-03-25 08:38:29',1,'2013-03-21 02:03:07'),(113,5,217,NULL,0,'2013-03-21 02:03:07'),(114,6,217,NULL,0,'2013-03-21 02:03:07'),(115,9,218,NULL,0,'2013-03-21 02:03:07'),(116,13,218,NULL,0,'2013-03-21 02:03:07'),(117,15,218,NULL,0,'2013-03-21 02:03:07'),(118,1,219,'2013-05-14 10:51:02',1,'2013-03-21 02:03:07'),(119,10,219,NULL,0,'2013-03-21 02:03:07'),(120,18,219,NULL,0,'2013-03-21 02:03:07'),(121,12,219,NULL,0,'2013-03-21 02:03:07'),(122,16,220,NULL,0,'2013-03-21 02:03:07'),(123,8,220,NULL,0,'2013-03-21 02:03:07'),(124,17,220,NULL,0,'2013-03-21 02:03:07'),(125,19,222,NULL,0,'2013-03-21 02:03:07'),(126,20,223,NULL,0,'2013-03-21 02:03:07'),(127,21,224,NULL,0,'2013-03-21 02:03:07'),(128,16,226,NULL,0,'2013-04-24 11:04:57'),(129,8,226,NULL,0,'2013-04-24 11:04:57'),(130,17,226,NULL,0,'2013-04-24 11:04:57'),(131,22,226,NULL,0,'2013-04-24 11:04:57'),(132,23,226,NULL,0,'2013-04-24 11:04:57'),(133,9,227,NULL,0,'2013-04-24 11:04:58'),(134,13,227,NULL,0,'2013-04-24 11:04:58'),(135,15,227,NULL,0,'2013-04-24 11:04:58'),(136,1,228,NULL,0,'2013-04-24 11:04:58'),(137,10,228,NULL,0,'2013-04-24 11:04:58'),(138,18,228,NULL,0,'2013-04-24 11:04:58'),(139,12,228,NULL,0,'2013-04-24 11:04:58'),(140,16,229,NULL,0,'2013-04-24 11:04:58'),(141,8,229,'2013-04-24 11:58:28',1,'2013-04-24 11:04:58'),(142,17,229,'2013-05-14 10:50:54',1,'2013-04-24 11:04:58'),(143,22,229,NULL,0,'2013-04-24 11:04:58'),(144,23,229,NULL,0,'2013-04-24 11:04:58'),(145,16,230,NULL,0,'2013-04-24 12:04:00'),(146,8,230,NULL,0,'2013-04-24 12:04:00'),(147,17,230,'2013-05-14 10:50:50',1,'2013-04-24 12:04:00'),(148,22,230,NULL,0,'2013-04-24 12:04:00'),(149,23,230,NULL,0,'2013-04-24 12:04:00'),(150,29,231,NULL,0,'2013-04-24 12:04:53'),(151,7,232,NULL,0,'2013-06-11 02:06:37'),(152,11,232,NULL,0,'2013-06-11 02:06:37'),(153,14,232,NULL,0,'2013-06-11 02:06:37'),(154,7,233,NULL,0,'2013-06-11 02:06:37'),(155,11,233,NULL,0,'2013-06-11 02:06:37'),(156,14,233,NULL,0,'2013-06-11 02:06:37'),(157,5,234,NULL,0,'2013-06-11 02:06:37'),(158,6,234,NULL,0,'2013-06-11 02:06:37'),(159,9,235,NULL,0,'2013-06-11 02:06:37'),(160,13,235,NULL,0,'2013-06-11 02:06:37'),(161,15,235,NULL,0,'2013-06-11 02:06:37'),(162,1,236,NULL,0,'2013-06-11 02:06:37'),(163,10,236,NULL,0,'2013-06-11 02:06:37'),(164,18,236,NULL,0,'2013-06-11 02:06:37'),(165,30,236,NULL,0,'2013-06-11 02:06:37'),(166,12,236,NULL,0,'2013-06-11 02:06:37'),(167,16,237,NULL,0,'2013-06-11 02:06:37'),(168,8,237,NULL,0,'2013-06-11 02:06:37'),(169,17,237,NULL,0,'2013-06-11 02:06:37'),(170,22,237,NULL,0,'2013-06-11 02:06:37');

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
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_signpers` */

insert  into `tbl_signpers`(`signPer_id`,`signPer_name`,`signPer_ununicode`,`signPer_desc`,`signPer_date`,`signPer_sort`,`signPer_active`) values (1,'Trương Mỹ Hoa','Truong My Hoa','<p>Phó chủ tịch nước</p>','2011-04-20 00:00:00',NULL,1),(2,'Nguyễn Thế Thảo','Nguyen The Thao','<p>Chủ tịch UBND&#160;TP</p>','2011-04-20 00:00:00',NULL,1),(3,'Hoàng Mạnh Hiển','Hoang Manh Hien','<p>Phó CT UBND TP</p>','2011-04-20 00:00:00',NULL,1),(4,'Vũ Hồng Khanh','Vu Hong Khanh','<p>Phó CT UBND TP</p>','2011-04-20 00:00:00',NULL,1),(5,'Vũ Văn Ninh','Vu Van Ninh','<p>Bộ trưởng Bộ Tài Chính</p>','2011-04-21 00:00:00',NULL,1),(6,'Lý Văn Giao','Ly Van Giao','<p>&#160;</p>','2011-04-25 00:00:00',0,1),(7,'Nguyễn Văn Thịnh','Nguyen Van Thinh','<p>&#160;</p>','2011-04-25 00:00:00',0,1),(8,'Đỗ Đình Hồng','Do Dinh Hong','<p>&#160;</p>','2011-04-25 00:00:00',0,1),(9,'Trịnh Duy Hùng','Trinh Duy Hung','<p>&#160;</p>','2011-04-25 00:00:00',0,1),(10,'Nguyễn Ngọc Sơn','Nguyen Ngoc Son','<p>&#160;</p>','2011-04-25 00:00:00',0,1),(11,'Phí Thái Bình','Phi Thai Binh','<p>&#160;</p>','2011-04-25 00:00:00',0,1),(12,'Nguyễn Thị Bích Ngọc','Nguyen Thi Bich Ngoc','<p>Phó Chủ Tịch</p>','2011-04-28 00:00:00',0,1),(13,'Nguyễn Huy Tưởng','Nguyen Huy Tuong','<p>Phó Chủ Tịch</p>','2011-04-28 00:00:00',0,1),(14,'Nguyễn Thịnh Thành','Nguyen Thinh Thanh','<p>Phó Văn Phòng</p>','2011-04-28 00:00:00',0,1),(15,'Nguyễn Văn Sửu','Nguyen Van Suu','<p>Giám Đốc</p>','2011-04-28 00:00:00',0,1),(16,'Nguyễn Thị Bài','Nguyen Thi Bai','<p>Phó Giám Đốc</p>','2011-04-28 00:00:00',0,1),(17,'Trần Đức Vũ','Tran Duc Vu','<p>Phó Giám Đốc</p>','2011-04-28 00:00:00',0,1),(18,'Trần Ngọc Nam','Tran Ngoc Nam','<p>Phó Giám Đốc</p>','2011-04-28 00:00:00',0,1),(19,'Phạm Văn Khương','Pham Van Khuong','<p>Phó Giám Đốc</p>','2011-04-28 00:00:00',0,1),(20,'Nguyễn Danh Cơ','Nguyen Danh Co','<p>Chánh Văn Phòng</p>','2011-04-28 00:00:00',0,1),(21,'Hà Văn Quế','Ha Van Que','<p>Giám đốc</p>','2011-04-28 00:00:00',0,1),(22,'Nguyễn Quốc Tuấn','Nguyen Quoc Tuan','<p>&#160;</p>','2011-04-28 00:00:00',0,1),(23,'Nguyễn Hữu Độ','Nguyen Huu Do','<p>&#160;</p>','2011-04-28 00:00:00',0,1),(24,'Lưu Tiến Định','Luu Tien Dinh','<p>&#160;</p>','2011-04-28 00:00:00',0,1),(25,'Hà Minh Hải','Ha Minh Hai','<p>&#160;</p>','2011-05-06 00:00:00',0,1),(26,'Phạm Khắc Tuấn','Pham Khac Tuan','<p>&#160;</p>','2011-05-06 00:00:00',0,1),(27,'Nguyễn Văn Nhang','Nguyen Van Nhang','<p>&#160;</p>','2011-05-06 00:00:00',0,1),(28,'Đỗ Huy Chiến','Do Huy Chien','<p>&#160;</p>','2011-05-06 00:00:00',0,1),(29,'Nguyễn Văn Khôi','Nguyen Van Khoi','<p>&#160;</p>','2011-05-06 00:00:00',0,1),(30,'Nguyễn Quốc Hùng','Nguyen Quoc Hung','<p>&#160;</p>','2011-05-12 00:00:00',0,1),(31,'Lê Văn Dục','Le Van Duc','<p>&#160;</p>','2011-05-13 00:00:00',0,1),(32,'Nguyễn Đình Đức','Nguyen Dinh Duc','<p>&#160;</p>','2011-05-16 00:00:00',0,1),(33,'Lê Tuấn Hữu','Le Tuan Huu','<p>&#160;</p>','2011-05-18 00:00:00',0,1),(34,'Nguyễn Trọng Đông','Nguyen Trong Dong','<p>&#160;</p>','2011-05-18 00:00:00',0,1),(35,'Lưu Tất Thắng','Luu Tat Thang','<p>&#160;</p>','2011-05-18 00:00:00',0,1),(36,'Phạm Chí Công','Pham Chi Cong','<p>&#160;</p>','2011-05-20 00:00:00',0,1),(37,'Đoàn Thanh Long','Doan Thanh Long','<p>&#160;</p>','2011-05-20 00:00:00',0,1),(38,'Trần Thanh Nhã','Tran Thanh Nha','<p>&#160;</p>','2011-05-23 00:00:00',0,1),(39,'Nguyễn Công Soái','Nguyen Cong Soai','<p>&#160;</p>','2011-05-26 00:00:00',0,1),(40,'Phạm Văn Trụ','Pham Van Tru','<p>&#160;</p>','2011-05-27 00:00:00',0,1),(41,'Nguyễn Đức Trí','Nguyen Duc Tri','<p>&#160;</p>','2011-05-27 00:00:00',0,1),(42,'Lê Ngọc Khiêm','Le Ngoc Khiem','<p>&#160;</p>','2011-05-27 00:00:00',0,1),(43,'Lê Anh Tuấn','Le Anh Tuan','<p>&#160;</p>','2011-05-27 00:00:00',0,1),(44,'Lã Thị Kim Ngân','La Thi Kim Ngan','<p>&#160;</p>','2011-05-27 00:00:00',0,1),(45,'Mai Xuân Vinh','Mai Xuan Vinh','<p>&#160;</p>','2011-05-27 00:00:00',0,1),(46,'Nguyễn Khắc Dũng','Nguyen Khac Dung','<p>&#160;</p>','2011-05-27 00:00:00',0,1),(47,'Phạm Quang Long','Pham Quang Long','<p>&#160;</p>','2011-05-30 00:00:00',0,1),(48,'Phạm Xuân Phương','Pham Xuan Phuong','<p>&#160;</p>','2011-05-30 00:00:00',0,1),(49,'Tô Thị Hạnh','To Thi Hanh','<p>&#160;</p>','2011-05-30 00:00:00',0,1),(50,'Lâm Quốc Hùng','Lam Quoc Hung','<p>&#160;</p>','2011-05-30 00:00:00',0,1),(51,'Nguyễn Xuân Tân','Nguyen Xuan Tan','<p>&#160;</p>','2011-05-30 00:00:00',0,1),(52,'Phạm Văn Khánh','Pham Van Khanh','<p>&#160;</p>','2011-05-31 00:00:00',0,1),(53,'Vương Thị Thanh Hương','Vuong Thi Thanh Huong','<p>&#160;</p>','2011-06-01 00:00:00',0,1),(54,'Trần Xuân Việt','Tran Xuan Viet','<p>&#160;</p>','2011-06-01 00:00:00',0,1),(55,'Nguyễn Văn Sơn','Nguyen Van Son','<p>&#160;</p>','2011-06-01 00:00:00',0,1),(56,'Phạm Thị Hồng Nga','Pham Thi Hong Nga','<p>&#160;</p>','2011-06-01 00:00:00',0,1),(57,'Đinh Thảo Oanh','Dinh Thao Oanh','<p>&#160;</p>','2011-06-02 00:00:00',0,1),(58,'Nguyễn Trọng Bình','Nguyen Trong Binh','<p>&#160;</p>','2011-06-02 00:00:00',0,1),(59,'Cao Khoa Bảng','Cao Khoa Bang','<p>&#160;</p>','2011-06-02 00:00:00',0,1),(60,'Nguyễn Tấn Dũng','Nguyen Tan Dung','<p>&#160;</p>','2011-06-03 00:00:00',0,1),(61,'Vũ Văn Hậu','Vu Van Hau','<p>&#160;</p>','2011-06-03 00:00:00',0,1),(62,'Phạm Hồng Sơn','Pham Hong Son','<p>&#160;</p>','2011-06-06 00:00:00',0,1),(63,'Khuất Quang Trung','Khuat Quang Trung','<p>&#160;</p>','2011-06-06 00:00:00',0,1),(64,'Vũ Xuân Hoà','Vu Xuan Hoa','<p>&#160;</p>','2011-06-06 00:00:00',0,1),(65,'Nguyễn Thị Việt Yên','Nguyen Thi Viet Yen','<p>&#160;</p>','2011-06-06 00:00:00',0,1),(66,'Nguyễn Tiến Thoả','Nguyen Tien Thoa','<p>&#160;</p>','2011-06-06 00:00:00',0,1),(67,'Nguyễn Đức Biền','Nguyen Duc Bien','<p>&#160;</p>','2011-06-07 00:00:00',0,1),(68,'Đinh Quý Huấn','Dinh Quy Huan','<p>&#160;</p>','2011-06-07 00:00:00',0,1),(69,'Nguyễn Văn Tuấn','Nguyen Van Tuan','<p>&#160;</p>','2011-06-07 00:00:00',0,1),(70,'Ngô Quang Trung','Ngo Quang Trung','<p>&#160;</p>','2011-06-07 00:00:00',0,1),(71,'Đặng Đình Phúc','Dang Dinh Phuc','<p>&#160;</p>','2011-06-07 00:00:00',0,1),(72,'Đặng Tuấn Hùng','Dang Tuan Hung','<p>&#160;</p>','2011-06-07 00:00:00',0,1),(73,'Đỗ Viết Bình','Do Viet Binh','<p>&#160;</p>','2011-06-07 00:00:00',0,1),(74,'Đinh Quang Vũ','Dinh Quang Vu','<p>&#160;</p>','2011-06-07 00:00:00',0,1),(75,'Nguyễn Văn Yên','Nguyen Van Yen','<p>&#160;</p>','2011-06-07 00:00:00',0,1),(76,'Phạm Hùng Tiến','Pham Hung Tien','<p>&#160;</p>','2011-06-08 00:00:00',0,1),(77,'Trần Thị Minh Hạnh','Tran Thi Minh Hanh','<p>&#160;</p>','2011-06-08 00:00:00',0,1),(78,'Thạch Như Sỹ','Thach Nhu Sy','<p>&#160;</p>','2011-06-09 00:00:00',0,1),(79,'Nguyễn Hữu Chí','Nguyen Huu Chi','<p>&#160;</p>','2011-06-09 00:00:00',0,1),(80,'Lưu Tiến Long','Luu Tien Long','<p>&#160;</p>','2011-06-10 00:00:00',0,1),(81,'Phạm Quốc Bản','Pham Quoc Ban','<p>&#160;</p>','2011-06-10 00:00:00',0,1),(82,'Nguyễn Hoàng Linh','Nguyen Hoang Linh','<p>&#160;</p>','2011-06-10 00:00:00',0,1),(83,'Đào Đức Toàn','Dao Duc Toan','<p>&#160;</p>','2011-06-10 00:00:00',0,1),(84,'Hồ Quang Lợi','Ho Quang Loi','<p>&#160;</p>','2011-06-13 00:00:00',0,1),(85,'Trần Huy Sáng','Tran Huy Sang','<p>&#160;</p>','2011-06-13 00:00:00',0,1),(86,'Đào Thái Phúc','Dao Thai Phuc','<p>&#160;</p>','2011-06-13 00:00:00',0,1),(87,'Hoàng Duy Khanh','Hoang Duy Khanh','<p>&#160;</p>','2011-06-13 00:00:00',0,1),(88,'Đỗ Hoàng Anh Tuấn','Do Hoang Anh Tuan','<p>&#160;</p>','2011-06-13 00:00:00',0,1),(89,'Trần Vũ Lâm','Tran Vu Lam','<p>&#160;</p>','2011-06-13 00:00:00',0,1),(90,'Đỗ Hồng Quang','Do Hong Quang','<p>&#160;</p>','2011-06-13 00:00:00',0,1),(91,'Vũ Mạnh Hoà','Vu Manh Hoa','<p>&#160;</p>','2011-06-13 00:00:00',0,1),(92,'Vũ Văn Tường','Vu Van Tuong','<p>&#160;</p>','2011-06-13 00:00:00',0,1),(93,'Nguyễn Ngọc Giao','Nguyen Ngoc Giao','<p>&#160;</p>','2011-06-13 00:00:00',0,1),(94,'Ngô Thị Thanh Hằng','Ngo Thi Thanh Hang','<p>&#160;</p>','2011-06-13 00:00:00',0,1),(95,'Trịnh Hoà Bình','Trinh Hoa Binh','<p>&#160;</p>','2011-06-13 00:00:00',0,1),(96,'Lê Xuân Rao','Le Xuan Rao','<p>&#160;</p>','2011-06-14 00:00:00',0,1),(97,'Đinh Văn Toản','Dinh Van Toan','<p>&#160;</p>','2011-06-14 00:00:00',0,1),(98,'Nguyễn Thị Vinh','Nguyen Thi Vinh','<p>&#160;</p>','2011-06-14 00:00:00',0,1),(99,'Nguyễn Mạnh Hoàng','Nguyen Manh Hoang','<p>&#160;</p>','2011-06-15 00:00:00',0,1),(100,'Đàm Quốc Khánh','Dam Quoc Khanh','<ul>\r\n    <li>&#160;</li>\r\n</ul>','2011-06-15 00:00:00',0,1),(102,'Trương Thị Nga','Truong Thi Nga','<p>&#160;</p>','2011-06-15 00:00:00',0,1),(103,'Đỗ Trọng Quỳnh','Do Trong Quynh','<p>&#160;</p>','2011-06-15 00:00:00',0,1),(104,'Đào Xuân Tuế','Dao Xuan Tue','<p>&#160;</p>','2011-06-15 00:00:00',0,1),(105,'Nguyễn Văn Đồng','Nguyen Van Dong','<p>&#160;</p>','2011-06-15 00:00:00',0,1),(106,'Bùi Cách Tuyến','Bui Cach Tuyen','<p>&#160;</p>','2011-06-15 00:00:00',0,1),(107,'Ngô Quang Tiến','Ngo Quang Tien','<p>&#160;</p>','2011-06-16 00:00:00',0,1),(108,'Đỗ Văn Thành','Do Van Thanh','<p>&#160;</p>','2011-06-16 00:00:00',0,1),(109,'Nguyễn Văn Tứ','Nguyen Van Tu','<p>&#160;</p>','2011-06-16 00:00:00',0,1),(110,'Nguyễn Như Hải','Nguyen Nhu Hai','<p>&#160;</p>','2011-06-16 00:00:00',0,1),(111,'Nguyễn Thế Hùng','Nguyen The Hung','<p>&#160;</p>','2011-06-16 00:00:00',0,1),(112,'Văn Trọng Lý','Van Trong Ly','<p>&#160;</p>','2011-06-16 00:00:00',0,1),(113,'Phạm Sỹ Danh','Pham Sy Danh','<p>&#160;</p>','2011-06-16 00:00:00',0,1),(114,'Lê Văn Thư','Le Van Thu','<p>&#160;</p>','2011-06-16 00:00:00',0,1),(115,'Nguyễn Thị Thuý Mai','Nguyen Thi Thuy Mai','<p>&#160;</p>','2011-06-16 00:00:00',0,1),(116,'Nguyễn Thế Công','Nguyen The Cong','<p>&#160;</p>','2011-06-16 00:00:00',0,1),(117,'Nguyễn Văn Hải','Nguyen Van Hai','<p>&#160;</p>','2011-06-17 00:00:00',0,1),(118,'Lê Quang Nhuệ','Le Quang Nhue','<p>&#160;</p>','2011-06-17 00:00:00',0,1),(119,'Nguyễn Duy Trung','Nguyen Duy Trung','<p>&#160;</p>','2011-06-17 00:00:00',0,1),(120,'Nguyễn Hồng Sơn','Nguyen Hong Son','<p>&#160;</p>','2011-06-17 00:00:00',0,1),(121,'Nguyễn Thịnh','Nguyen Thinh','<p>&#160;</p>','2011-06-17 00:00:00',0,1),(122,'Nguyễn Tiến Minh','Nguyen Tien Minh','<p>&#160;</p>','2011-06-17 00:00:00',0,1),(123,'Nguyễn Mạnh Cường','Nguyen Manh Cuong','<p>&#160;</p>','2011-06-17 00:00:00',0,1),(124,'Nguyễn Khắc Thọ','Nguyen Khac Tho','<p>&#160;</p>','2011-06-17 00:00:00',0,1),(126,'Nguyễn Thanh Hằng','Nguyen Thanh Hang','<p>&#160;</p>','2011-06-17 00:00:00',0,1),(127,'Nguyễn Đức Sinh','Nguyen Duc Sinh','<p>&#160;</p>','2011-06-20 00:00:00',0,1),(128,'Lê Quốc Cường','Le Quoc Cuong','<p>&#160;</p>','2011-06-20 00:00:00',0,1),(129,'Đậu Thị Thuỳ Hương','Dau Thi Thuy Huong','<p>&#160;</p>','2011-06-20 00:00:00',0,1),(130,'Nguyễn Văn Tuấn Dũng','Nguyen Van Tuan Dung','<p>&#160;</p>','2011-06-20 00:00:00',0,1),(131,'Hoàng Xuân Thuỷ','Hoang Xuan Thuy','<p>&#160;</p>','2011-06-20 00:00:00',0,1),(132,'Võ Quang Vinh','Vo Quang Vinh','<p>&#160;</p>','2011-06-21 00:00:00',0,1),(133,'Nguyễn Trọng Lễ','Nguyen Trong Le','<p>&#160;</p>','2011-06-22 00:00:00',0,1),(134,'Nguyễn Thị Ngọc Thanh','Nguyen Thi Ngoc Thanh','<p>&#160;</p>','2011-06-22 00:00:00',0,1),(135,'Trần Quý Trung','Tran Quy Trung','<p>&#160;</p>','2011-06-22 00:00:00',0,1),(136,'Tạ Việt Anh','Ta Viet Anh','<p>&#160;</p>','2011-06-22 00:00:00',0,1),(137,'Đàm Tiến Thắng','Dam Tien Thang','<p>&#160;</p>','2011-06-22 00:00:00',0,1),(138,'Phạm Ngọc Thạch','Pham Ngoc Thach','<p>&#160;</p>','2011-06-22 00:00:00',0,1),(139,'Nguyễn Thị Hoa','Nguyen Thi Hoa','<p>&#160;</p>','2011-06-22 00:00:00',0,1),(140,'Nguyễn Đắc Lộc','Nguyen Dac Loc','<p>&#160;</p>','2011-06-22 00:00:00',0,1),(141,'Nguyễn Thị Như Mai','Nguyen Thi Nhu Mai','<p>&#160;</p>','2011-06-22 00:00:00',0,1),(142,'Trịnh Bích Hồng','Trinh Bich Hong','<p>&#160;</p>','2011-06-22 00:00:00',0,1),(143,'Đỗ Văn Tuyến','Do Van Tuyen','<p>&#160;</p>','2011-06-23 00:00:00',0,1),(144,'Ngô Thị Doãn Thanh','Ngo Thi Doan Thanh','<p>&#160;</p>','2011-06-24 00:00:00',0,1),(145,'Đào Văn Bình','Dao Van Binh','<p>&#160;</p>','2011-06-24 00:00:00',0,1),(146,'Nguyễn Hữu Lương','Nguyen Huu Luong','<p>&#160;</p>','2011-06-24 00:00:00',0,1),(147,'Nguyễn Thanh Hải','Nguyen Thanh Hai','<p>&#160;</p>','2011-06-24 00:00:00',0,1),(148,'Vũ Ngọc Phụng','Vu Ngoc Phung','<p>&#160;</p>','2011-06-24 00:00:00',0,1),(149,'Trần Quốc Chiêm','Tran Quoc Chiem','<p>&#160;</p>','2011-06-27 00:00:00',0,1),(150,'Trần Hữu Chiều','Tran Huu Chieu','<p>&#160;</p>','2011-06-27 00:00:00',0,1),(151,'Trịnh Thế Khiết','Trinh The Khiet','<p>&#160;</p>','2011-06-27 00:00:00',0,1),(152,'Đàm Văn Bình','Dam Van Binh','<p>&#160;</p>','2011-06-27 00:00:00',0,1),(153,'Hoàng Long Quang','Hoang Long Quang','<p>&#160;</p>','2011-06-27 00:00:00',0,1),(154,'Tạ Quang Huy','Ta Quang Huy','<p>&#160;</p>','2011-06-27 00:00:00',0,1),(155,'Cù Đức Tố','Cu Duc To','<p>&#160;</p>','2011-06-28 00:00:00',0,1),(156,'Dương Kỳ Lân','Duong Ky Lan','<p>&#160;</p>','2011-06-29 00:00:00',0,1),(157,'Nguyễn Văn Vỹ','Nguyen Van Vy','<p>&#160;</p>','2011-06-29 00:00:00',0,1),(158,'Nguyễn Trường Sơn','Nguyen Truong Son','<p>&#160;</p>','2011-06-29 00:00:00',0,1),(159,'Tạ Anh Tuấn','Ta Anh Tuan','<p>&#160;</p>','2011-06-29 00:00:00',0,1),(160,'Kim Văn Quế','Kim Van Que','<p>&#160;</p>','2011-06-29 00:00:00',0,1),(161,'Nguyễn Thái Long','Nguyen Thai Long','<p>&#160;</p>','2011-06-29 00:00:00',0,1),(162,'Vũ Thanh Sơn','Vu Thanh Son','<p>&#160;</p>','2011-06-29 00:00:00',0,1),(163,'Trần Thị Lương Anh','Tran Thi Luong Anh','<p>&#160;</p>','2011-06-29 00:00:00',0,1),(164,'Đỗ Quang Hiển','Do Quang Hien','<p>&#160;</p>','2011-06-29 00:00:00',0,1),(165,'Phan Tiến Bình','Phan Tien Binh','<p>&#160;</p>','2011-06-29 00:00:00',0,1),(166,'Nguyễn Ngọc Dũng','Nguyen Ngoc Dung','<p>&#160;</p>','2011-06-30 00:00:00',0,1),(167,'Ngọ Duy Hiểu','Ngo Duy Hieu','<p>&#160;</p>','2011-07-01 00:00:00',0,1),(168,'Nguyễn Huy Phùng','Nguyen Huy Phung','<p>&#160;</p>','2011-07-01 00:00:00',0,1),(169,'Diệp Kỉnh Tần','Diep Kinh Tan','<p>&#160;</p>','2011-07-01 00:00:00',0,1),(170,'Doãn Văn Kính','Doan Van Kinh','<p>&#160;</p>','2011-07-01 00:00:00',0,1),(171,'Đào Xuân Mùi','Dao Xuan Mui','<p>&#160;</p>','2011-07-01 00:00:00',0,1),(172,'Bùi Văn Định','Bui Van Dinh','<p>&#160;</p>','2011-07-01 00:00:00',0,1),(173,'Phí Quốc Tuấn','Phi Quoc Tuan','<p>&#160;</p>','2011-07-13 00:00:00',0,1),(174,'Bùi Đức Hiếu','Bui Duc Hieu','<p>&#160;</p>','2011-10-28 00:00:00',0,1),(175,'Hoàng Thanh Vân','Hoang Thanh Van','<p>&#160;</p>','2011-10-31 00:00:00',0,1);

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
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_units` */

insert  into `tbl_units`(`unit_id`,`unit_name`,`unit_ununicode`,`unit_desc`,`unit_date`,`unit_sort`,`unit_active`,`user_id`) values (2,'Thành Ủy Hà Nội','Thanh Uy Ha Noi','<p>Thành Ủy Hà Nội</p>','2011-04-20 00:00:00',NULL,1,NULL),(3,'Bộ tài chính','Bo tai chinh','<p>Bộ tài chính</p>','2011-04-20 00:00:00',0,1,NULL),(4,'Bộ nội vụ','Bo noi vu','<p>Bộ nội vụ</p>','2011-04-20 00:00:00',0,1,NULL),(5,'Bộ công thương','Bo cong thuong','<p>Bộ công thương</p>','2011-04-20 00:00:00',NULL,1,NULL),(6,'Đài phát thanh và truyền hình HN.','Dai phat thanh va truyen hinh HN.','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(7,'Ban Quản lý phố cổ HN','Ban Quan ly pho co HN','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(8,'Công an TP HN.','Cong an TP HN.','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(10,'Chi Cục kiểm lâm HN','Chi Cuc kiem lam HN','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(11,'Công ty QL và PT nhà HN','Cong ty QL va PT nha HN','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(13,'Hội Chữ thập đỏ TPHN','Hoi Chu thap do TPHN','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(14,'Hội Cựu chiến binh TPHN','Hoi Cuu chien binh TPHN','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(15,'Hội Liên hiệp phụ nữ TPHN','Hoi Lien hiep phu nu TPHN','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(16,'Hội Liên hiệp văn học nghệ thuật TPHN','Hoi Lien hiep van hoc nghe thuat TPHN','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(17,'Hội Luật gia HN','Hoi Luat gia HN','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(18,'Hội Nông dân HN','Hoi Nong dan HN','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(19,'Hội người mù HN','Hoi nguoi mu HN','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(20,'Hội nhà báo HN','Hoi nha bao HN','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(21,'Liên đoàn lao động TPHN','Lien doan lao dong TPHN','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(22,'Liên hiệp các hội khoa học và kỹ thuật HN','Lien hiep cac hoi khoa hoc va ky thuat HN','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(23,'Liên hiệp các tổ chức hữu nghị TPHN','Lien hiep cac to chuc huu nghi TPHN','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(24,'Liên minh các HTX TPHN','Lien minh cac HTX TPHN','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(25,'Phòng công chứng NN số 1','Phong cong chung NN so 1','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(26,'Phòng công chứng NN số 2','Phong cong chung NN so 2','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(27,'Phòng công chứng NN số 3','Phong cong chung NN so 3','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(28,'Phòng công chứng NN số 4','Phong cong chung NN so 4','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(34,'Phòng TCKH Gia Lâm','Phong TCKH Gia Lam','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(35,'Phòng TCKH Đông Anh','Phong TCKH Dong Anh','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(36,'Phòng TCKH Sóc Sơn','Phong TCKH Soc Son','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(37,'Phòng TCKH Thanh Trì','Phong TCKH Thanh Tri','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(38,'Phòng TCKH Từ Liêm','Phong TCKH Tu Liem','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(39,'Phòng TCKH Đống Đa','Phong TCKH Dong Da','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(40,'Phòng TCKH Ba Đình','Phong TCKH Ba Dinh','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(41,'UBND thành phố HN','UBND thanh pho HN','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(42,'Văn phòng UBND-HN','Van phong UBNDHN','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(43,'Sở Kế hoạch đầu tư TPHN','So Ke hoach dau tu TPHN','<p>&#160;</p>','2011-04-25 00:00:00',0,1,NULL),(44,'Sở Nông Nghiệp & PTNT TPHN','So Nong Nghiep & PTNT TPHN','<p>&#160;</p>','2011-04-28 00:00:00',0,1,NULL),(45,'Sở Nội Vụ TPHN','So Noi Vu TPHN','<p>&#160;</p>','2011-04-28 00:00:00',0,1,NULL),(46,'Sở Ngoại Vụ TPHN','So Ngoai Vu TPHN','<p>&#160;</p>','2011-04-28 00:00:00',0,1,NULL),(47,'Sở Quy Hoạch Kiến Trúc TPHN','So Quy Hoach Kien Truc TPHN','<p>&#160;</p>','2011-04-28 00:00:00',0,1,NULL),(48,'Sở Giao Thông TPHN','So Giao Thong TPHN','<p>&#160;</p>','2011-04-28 00:00:00',0,1,NULL),(49,'Sở Xây Dựng TPHN','So Xay Dung TPHN','<p>&#160;</p>','2011-04-28 00:00:00',0,1,NULL),(50,'Ban Thường Vụ Hội LHPN Hà Nội','Ban Thuong Vu Hoi LHPN Ha Noi','<p>&#160;</p>','2011-04-28 00:00:00',0,1,NULL),(51,'Sở Giáo Dục và Đào Tạo TPHN','So Giao Duc va Dao Tao TPHN','<p>&#160;</p>','2011-04-28 00:00:00',0,1,NULL),(52,'Công ty TNHH Đầu tư xây lắp và Phát triển Nhà','Cong ty TNHH Dau tu xay lap va Phat trien Nha','<p>&#160;</p>','2011-04-28 00:00:00',0,1,NULL),(53,'Sở Thông tin và Truyền Thông TPHN','So Thong tin va Truyen Thong TPHN','<p>&#160;</p>','2011-04-28 00:00:00',0,1,NULL),(54,'Cục Thuế TP Hà Nội','Cuc Thue TP Ha Noi','<p>&#160;</p>','2011-04-28 00:00:00',0,1,NULL),(55,'Sở Tài Nguyên và Môi Trường TPHN','So Tai Nguyen va Moi Truong TPHN','<p>&#160;</p>','2011-04-29 00:00:00',0,1,NULL),(57,'Sở VH-TT và Du Lịch','So VHTT va Du Lich',NULL,'2011-05-05 00:00:00',0,1,NULL),(58,'Sở Giao Dịch 1 - NH Phát Triển VN','So Giao Dich 1  NH Phat Trien VN','<p>&#160;</p>','2011-05-05 00:00:00',0,1,NULL),(59,'Ban QLDA Giao Thông 1','Ban QLDA Giao Thong 1','<p>&#160;</p>','2011-05-06 00:00:00',0,1,NULL),(60,'UBND Quận Hà Đông','UBND Quan Ha Dong','<p>&#160;</p>','2011-05-06 00:00:00',0,1,NULL),(61,'UBND Quận Long Biên','UBND Quan Long Bien','<p>&#160;</p>','2011-05-06 00:00:00',0,1,NULL),(62,'UBND Quận Đống Đa','UBND Quan Dong Da','<p>&#160;</p>','2011-05-06 00:00:00',0,1,NULL),(63,'UBND Quận Ba Đình','UBND Quan Ba Dinh','<p>&#160;</p>','2011-05-06 00:00:00',0,1,NULL),(64,'UBND Quận Cầu Giấy','UBND Quan Cau Giay','<p>&#160;</p>','2011-05-06 00:00:00',0,1,NULL),(65,'UBND Quận Tây Hồ','UBND Quan Tay Ho','<p>&#160;</p>','2011-05-06 00:00:00',0,1,NULL),(66,'UBND Quận Thanh Xuân','UBND Quan Thanh Xuan','<p>&#160;</p>','2011-05-06 00:00:00',0,1,NULL),(67,'UBND Quận Hoàn Kiếm','UBND Quan Hoan Kiem','<p>&#160;</p>','2011-05-06 00:00:00',0,1,NULL),(68,'UBND Quận Hai Bà Trưng','UBND Quan Hai Ba Trung','<p>&#160;</p>','2011-09-26 00:00:00',NULL,1,NULL),(69,'Đảng Uỷ Khối Các CQTP','Dang Uy Khoi Cac CQTP','<p>&#160;</p>','2011-05-09 00:00:00',0,1,NULL),(70,'Sở Công Thương TPHN','So Cong Thuong TPHN','<p>&#160;</p>','2011-05-11 00:00:00',0,1,NULL),(71,'UBND Huyện','UBND Huyen','<p>&#160;</p>','2011-06-08 00:00:00',NULL,1,NULL),(72,'Sở Y Tế TPHN','So Y Te TPHN','<p>&#160;</p>','2011-05-18 00:00:00',0,1,NULL),(73,'HĐND Thành Phố HN','HDND Thanh Pho HN','<p>&#160;</p>','2011-05-19 00:00:00',0,1,NULL),(74,'Sở Lao Động TB&XH TPHN','So Lao Dong TB&XH TPHN','<p>&#160;</p>','2011-05-27 00:00:00',NULL,1,NULL),(75,'LĐLĐ Thành phố Hà nội','LDLD Thanh pho Ha noi','<p>&#160;</p>','2011-05-27 00:00:00',0,1,NULL),(76,'Hội Làm Vườn TPHN','Hoi Lam Vuon TPHN','<p>&#160;</p>','2011-05-27 00:00:00',0,1,NULL),(77,'Cty CP Cơ khí & Xây lắp số 7','Cty CP Co khi & Xay lap so 7','<p>&#160;</p>','2011-05-27 00:00:00',0,1,NULL),(78,'Ban QLDA ĐTXD Bảo tàng Lịch sử QG_Bộ XD','Ban QLDA DTXD Bao tang Lich su QG_Bo XD','<p>&#160;</p>','2011-05-27 00:00:00',0,1,NULL),(79,'Cục Hải Quan TPHN','Cuc Hai Quan TPHN','<p>&#160;</p>','2011-05-27 00:00:00',0,1,NULL),(80,'Cty TNHH Thăng Long GTC','Cty TNHH Thang Long GTC','<p>&#160;</p>','2011-05-27 00:00:00',0,1,NULL),(81,'HĐ Định giá Tài sản LĐHANT','HD Dinh gia Tai san LDHANT','<p>&#160;</p>','2011-05-27 00:00:00',0,1,NULL),(82,'Viện QHXD HN','Vien QHXD HN','<p>&#160;</p>','2011-05-27 00:00:00',0,1,NULL),(83,'Chi cục QLCS_Sở TC','Chi cuc QLCS_So TC','<p>&#160;</p>','2011-05-27 00:00:00',0,1,NULL),(85,'Cty CP ĐTPT Nhà HN số 5','Cty CP DTPT Nha HN so 5','<p>&#160;</p>','2011-05-27 00:00:00',0,1,NULL),(86,'Cty CP Hồn Đất Việt','Cty CP Hon Dat Viet','<p>&#160;</p>','2011-05-27 00:00:00',0,1,NULL),(87,'Cty CP ĐTXD&KD Nhà HN số 35','Cty CP DTXD&KD Nha HN so 35','<p>&#160;</p>','2011-05-27 00:00:00',0,1,NULL),(88,'Sở Tư Pháp TPHN','So Tu Phap TPHN','<p>&#160;</p>','2011-05-30 00:00:00',0,1,NULL),(89,'Cty CP Thẩm Định Giá & DV tài chính HN','Cty CP Tham Dinh Gia & DV tai chinh HN','<p>&#160;</p>','2011-05-30 00:00:00',0,1,NULL),(90,'Văn phòng Thành uỷ HN','Van phong Thanh uy HN','<p>&#160;</p>','2011-06-01 00:00:00',0,1,NULL),(91,'Ban Dân Tộc TPHN','Ban Dan Toc TPHN','<p>&#160;</p>','2011-06-01 00:00:00',0,1,NULL),(92,'Uỷ Ban Thường Vụ Quốc Hội','Uy Ban Thuong Vu Quoc Hoi','<p>&#160;</p>','2011-06-01 00:00:00',0,1,NULL),(93,'Cty TNHH ĐT&PT Nông Lâm nghiệp Sóc Sơn','Cty TNHH DT&PT Nong Lam nghiep Soc Son','<p>&#160;</p>','2011-06-01 00:00:00',0,1,NULL),(94,'Trung tâm BT khu DT Cổ Loa - Thành cổ HN','Trung tam BT khu DT Co Loa  Thanh co HN','<p>&#160;</p>','2011-06-01 00:00:00',0,1,NULL),(95,'Cty TNHH Công Viên Cây Xanh','Cty TNHH Cong Vien Cay Xanh','<p>&#160;</p>','2011-06-01 00:00:00',0,1,NULL),(96,'Hội Đồng Khoa học, Sáng Kiến TPHN','Hoi Dong Khoa hoc, Sang Kien TPHN','<p>&#160;</p>','2011-06-01 00:00:00',0,1,NULL),(97,'Chi cục PT Nông thôn - Sở NN','Chi cuc PT Nong thon  So NN','<p>&#160;</p>','2011-06-01 00:00:00',0,1,NULL),(98,'Trung tâm GDTX','Trung tam GDTX','<p>&#160;</p>','2011-06-01 00:00:00',0,1,NULL),(99,'Ban QLĐT&XD khu đô thị mới HN','Ban QLDT&XD khu do thi moi HN','<p>&#160;</p>','2011-06-02 00:00:00',0,1,NULL),(100,'Cty KDPT Nhà và Đô thị HN','Cty KDPT Nha va Do thi HN','<p>&#160;</p>','2011-06-02 00:00:00',0,1,NULL),(101,'Thanh tra TPHN','Thanh tra TPHN','<p>&#160;</p>','2011-06-02 00:00:00',0,1,NULL),(102,'NHĐT & PT Campuchia Chi nhánh HN','NHDT & PT Campuchia Chi nhanh HN','<p>&#160;</p>','2011-06-02 00:00:00',0,1,NULL),(103,'Hội CCB Khối các CQ TPHN','Hoi CCB Khoi cac CQ TPHN','<p>&#160;</p>','2011-06-02 00:00:00',0,1,NULL),(104,'Sở Khoa Học và Công Nghệ TPHN','So Khoa Hoc va Cong Nghe TPHN','<p>&#160;</p>','2011-06-02 00:00:00',0,1,NULL),(105,'Tổng Cty Hàng Hải VN','Tong Cty Hang Hai VN','<p>&#160;</p>','2011-06-03 00:00:00',0,1,NULL),(106,'Trung tâm Giống Cây trồng','Trung tam Giong Cay trong','<p>&#160;</p>','2011-06-06 00:00:00',0,1,NULL),(107,'Cty Quản lý Bến Xe HN','Cty Quan ly Ben Xe HN','<p>&#160;</p>','2011-06-06 00:00:00',0,1,NULL),(108,'Bộ Tư Lệnh Thủ Đô HN','Bo Tu Lenh Thu Do HN','<p>&#160;</p>','2011-06-07 00:00:00',0,1,NULL),(109,'Công Đoàn Viên Chức TPHN','Cong Doan Vien Chuc TPHN','<p>&#160;</p>','2011-06-07 00:00:00',0,1,NULL),(110,'Trung tâm GD Đất đai & PTQĐ HN','Trung tam GD Dat dai & PTQD HN','<p>&#160;</p>','2011-06-07 00:00:00',0,1,NULL),(111,'Quỹ ĐTPT TP - Hà nội','Quy DTPT TP  Ha noi','<p>&#160;</p>','2011-06-07 00:00:00',0,1,NULL),(112,'Cty TNHH Thuỷ lợi Sông Tích','Cty TNHH Thuy loi Song Tich','<p>&#160;</p>','2011-06-07 00:00:00',0,1,NULL),(113,'Cty CP ĐTXD&KD Nước sạch','Cty CP DTXD&KD Nuoc sach','<p>&#160;</p>','2011-06-07 00:00:00',0,1,NULL),(114,'Ban Tôn Giáo - Sở Nội Vụ HN','Ban Ton Giao  So Noi Vu HN','<p>&#160;</p>','2011-06-08 00:00:00',0,1,NULL),(115,'Ban Thi Đua - Khen Thưởng_Sở Nội Vụ HN','Ban Thi Dua  Khen Thuong_So Noi Vu HN','<p>&#160;</p>','2011-06-08 00:00:00',0,1,NULL),(116,'Ban chỉ đạo GPMB TP','Ban chi dao GPMB TP','<p>&#160;</p>','2011-06-09 00:00:00',0,1,NULL),(117,'Thanh tra Sở_Sở GTHN','Thanh tra So_So GTHN','<p>&#160;</p>','2011-06-09 00:00:00',0,1,NULL),(118,'Cty TNHH Thoát nước Hà nội','Cty TNHH Thoat nuoc Ha noi','<p>&#160;</p>','2011-06-09 00:00:00',0,1,NULL),(119,'Ban Tuyên Giáo Thành uỷ HN','Ban Tuyen Giao Thanh uy HN','<p>&#160;</p>','2011-06-13 00:00:00',0,1,NULL),(120,'Ban chỉ đạo Chương trình CNTT HN','Ban chi dao Chuong trinh CNTT HN','<p>&#160;</p>','2011-06-13 00:00:00',0,1,NULL),(121,'Cty TNHH Giống gia súc HN','Cty TNHH Giong gia suc HN','<p>&#160;</p>','2011-06-13 00:00:00',0,1,NULL),(122,'Ban Tuyên Giáo Đảng uỷ khối các CQTP','Ban Tuyen Giao Dang uy khoi cac CQTP','<p>&#160;</p>','2011-06-13 00:00:00',0,1,NULL),(123,'Bệnh Viện Mắt Hà Đông','Benh Vien Mat Ha Dong','<p>&#160;</p>','2011-06-13 00:00:00',0,1,NULL),(124,'Cty CP In và TM Hà Tây (IHATA)','Cty CP In va TM Ha Tay (IHATA)','<p>&#160;</p>','2011-06-13 00:00:00',0,1,NULL),(125,'Ban QLDA Hạ Tầng ĐT','Ban QLDA Ha Tang DT','<p>&#160;</p>','2011-06-13 00:00:00',0,1,NULL),(127,'Ban chỉ đạo XD Đảng và các Đoàn thể trong các DN ngoài NN thuộc TP','Ban chi dao XD Dang va cac Doan the trong cac DN ngoai NN thuoc TP','<p>&#160;</p>','2011-06-13 00:00:00',0,1,NULL),(128,'Ban QL các DA Trọng Điểm PTĐT HN','Ban QL cac DA Trong Diem PTDT HN','<p>&#160;</p>','2011-06-13 00:00:00',0,1,NULL),(129,'UBND Thị xã','UBND Thi xa','<p>&#160;</p>','2011-06-14 00:00:00',0,1,NULL),(130,'Cty TNHH Điện Cơ Thống Nhất','Cty TNHH Dien Co Thong Nhat','<p>&#160;</p>','2011-06-14 00:00:00',0,1,NULL),(131,'Cục Bảo vệ chính trị VII','Cuc Bao ve chinh tri VII','<p>&#160;</p>','2011-06-14 00:00:00',0,1,NULL),(132,'Ban QLDA QLNN về MT','Ban QLDA QLNN ve MT','<p>&#160;</p>','2011-06-14 00:00:00',0,1,NULL),(133,'Ban QLDA PTCNTT&TT Hà nội','Ban QLDA PTCNTT&TT Ha noi','<p>&#160;</p>','2011-06-15 00:00:00',0,1,NULL),(134,'Cty CP Cơ Điện & XD VN','Cty CP Co Dien & XD VN','<p>&#160;</p>','2011-06-15 00:00:00',0,1,NULL),(135,'Cty Cảng Hà Tây','Cty Cang Ha Tay','<p>&#160;</p>','2011-06-15 00:00:00',0,1,NULL),(136,'Cty CPXD số 2 - Vinaconex','Cty CPXD so 2  Vinaconex','<p>&#160;</p>','2011-06-15 00:00:00',0,1,NULL),(137,'Bộ Tài nguyên và Môi trường','Bo Tai nguyen va Moi truong','<p>&#160;</p>','2011-06-15 00:00:00',0,1,NULL),(138,'Cty ĐTPT Thuỷ Lợi Sông Đáy','Cty DTPT Thuy Loi Song Day','<p>&#160;</p>','2011-06-16 00:00:00',0,1,NULL),(139,'Ban QLDA  QL Nhà nước về MT','Ban QLDA  QL Nha nuoc ve MT','<p>&#160;</p>','2011-06-16 00:00:00',0,1,NULL),(140,'Ban QLDA Duy tu HTGT','Ban QLDA Duy tu HTGT','<p>&#160;</p>','2011-06-16 00:00:00',0,1,NULL),(141,'Tổng cty CP Vinaconex','Tong cty CP Vinaconex','<p>&#160;</p>','2011-06-16 00:00:00',0,1,NULL),(142,'Cty CPTM&DV Lã Vọng','Cty CPTM&DV La Vong','<p>&#160;</p>','2011-06-16 00:00:00',0,1,NULL),(143,'Cục Hậu Cần_Bộ tư lệnh Hải Quân','Cuc Hau Can_Bo tu lenh Hai Quan','<p>&#160;</p>','2011-06-16 00:00:00',0,1,NULL),(144,'Hội  Chữ Thập Đỏ TPHN','Hoi  Chu Thap Do TPHN','<p>&#160;</p>','2011-06-16 00:00:00',0,1,NULL),(145,'Quỹ Bảo vệ Môi trường HN','Quy Bao ve Moi truong HN','<p>&#160;</p>','2011-06-16 00:00:00',0,1,NULL),(146,'Cty CP XNK&XD Tân Trường Sơn','Cty CP XNK&XD Tan Truong Son','<p>&#160;</p>','2011-06-16 00:00:00',0,1,NULL),(147,'Cty TNHH PT khu đô thị Nam Thăng Long','Cty TNHH PT khu do thi Nam Thang Long','<p>&#160;</p>','2011-06-16 00:00:00',0,1,NULL),(148,'Cty Nước sạch HN','Cty Nuoc sach HN','<p>&#160;</p>','2011-06-16 00:00:00',0,1,NULL),(149,'Văn phòng Chính phủ','Van phong Chinh phu','<p>&#160;</p>','2011-06-16 00:00:00',0,1,NULL),(150,'Cty CP Vật tư VT Xi Măng','Cty CP Vat tu VT Xi Mang','<p>&#160;</p>','2011-06-16 00:00:00',0,1,NULL),(151,'Trung tâm Nhân đạo Hoà Bình_Hội Chữ Thập đỏ VN','Trung tam Nhan dao Hoa Binh_Hoi Chu Thap do VN','<p>&#160;</p>','2011-06-17 00:00:00',0,1,NULL),(152,'Cty TNHH Xổ số KTTĐ','Cty TNHH Xo so KTTD','<p>&#160;</p>','2011-06-17 00:00:00',0,1,NULL),(153,'BQL Chỉnh trang Đô thị HN','BQL Chinh trang Do thi HN','<p>&#160;</p>','2011-06-17 00:00:00',0,1,NULL),(154,'Chi cục thuế quận Cầu Giấy','Chi cuc thue quan Cau Giay','<p>&#160;</p>','2011-06-17 00:00:00',0,1,NULL),(155,'Trung tâm Khuyến Nông&Tư vấn PTCN','Trung tam Khuyen Nong&Tu van PTCN','<p>&#160;</p>','2011-06-20 00:00:00',0,1,NULL),(157,'Cty CP Cơ Điện Trần Phú','Cty CP Co Dien Tran Phu','<p>&#160;</p>','2011-06-20 00:00:00',0,1,NULL),(158,'Hội đồng Thi đua - Khen thưởng TPHN','Hoi dong Thi dua  Khen thuong TPHN','<p>&#160;</p>','2011-06-21 00:00:00',0,1,NULL),(159,'Trường CĐ Y tế HN','Truong CD Y te HN','<p>&#160;</p>','2011-06-22 00:00:00',0,1,NULL),(160,'BTV Hội LHPN Hà nội','BTV Hoi LHPN Ha noi','<p>&#160;</p>','2011-06-22 00:00:00',0,1,NULL),(161,'Cty CP Dệt Kim Hà nội','Cty CP Det Kim Ha noi','<p>&#160;</p>','2011-06-22 00:00:00',0,1,NULL),(162,'Ngân Hàng ĐT&PT VN','Ngan Hang DT&PT VN','<p>&#160;</p>','2011-06-22 00:00:00',0,1,NULL),(163,'Báo Kinh tế & Đô Thị HN','Bao Kinh te & Do Thi HN','<p>&#160;</p>','2011-06-22 00:00:00',0,1,NULL),(164,'Ban QLDA Năng Lượng Nông thôn 2','Ban QLDA Nang Luong Nong thon 2','<p>&#160;</p>','2011-06-22 00:00:00',0,1,NULL),(165,'Chi cục Bảo vệ Thực vật HN','Chi cuc Bao ve Thuc vat HN','<p>&#160;</p>','2011-06-22 00:00:00',0,1,NULL),(166,'Chi cục QLTT HN','Chi cuc QLTT HN','<p>&#160;</p>','2011-06-22 00:00:00',0,1,NULL),(167,'Cơ Quan Thường trực Ban chỉ đạo 127/TP','Co Quan Thuong truc Ban chi dao 127/TP','<p>&#160;</p>','2011-06-22 00:00:00',0,1,NULL),(168,'Cty ĐTTM và DV Quốc Tế','Cty DTTM va DV Quoc Te','<p>&#160;</p>','2011-06-22 00:00:00',0,1,NULL),(169,'Trung tâm Trợ giúp Pháp Lý NN','Trung tam Tro giup Phap Ly NN','<p>&#160;</p>','2011-06-23 00:00:00',0,1,NULL),(170,'BCĐ phòng, chống AIDS và PCTN Ma Tuý, Mại Dâm HN','BCD phong, chong AIDS va PCTN Ma Tuy, Mai Dam HN','<p>&#160;</p>','2011-06-23 00:00:00',0,1,NULL),(171,'BCĐ Trợ giúp Người nghèo HN','BCD Tro giup Nguoi ngheo HN','<p>&#160;</p>','2011-06-24 00:00:00',0,1,NULL),(172,'Trung tâm NC Bò và Đồng cỏ Ba Vì','Trung tam NC Bo va Dong co Ba Vi','<p>&#160;</p>','2011-06-24 00:00:00',0,1,NULL),(173,'Cty TNHH XNK và Phát Hành Phim VN','Cty TNHH XNK va Phat Hanh Phim VN','<p>&#160;</p>','2011-06-24 00:00:00',0,1,NULL),(174,'Ban QLDA Đầu tư & XD','Ban QLDA Dau tu & XD','<p>&#160;</p>','2011-06-24 00:00:00',0,1,NULL),(175,'Cty TNHH Gamuda Land VN','Cty TNHH Gamuda Land VN','<p>&#160;</p>','2011-06-24 00:00:00',0,1,NULL),(176,'Ban chỉ đạo Cải Cách TP','Ban chi dao Cai Cach TP','<p>&#160;</p>','2011-06-27 00:00:00',0,1,NULL),(177,'Ban chỉ đạo công tác Tôn Giáo TP','Ban chi dao cong tac Ton Giao TP','<p>&#160;</p>','2011-06-27 00:00:00',0,1,NULL),(178,'BCH Hội Nông Dân TPHN','BCH Hoi Nong Dan TPHN','<p>&#160;</p>','2011-06-27 00:00:00',0,1,NULL),(179,'Hội đồng Định giá TS LĐHANT','Hoi dong Dinh gia TS LDHANT','<p>&#160;</p>','2011-06-27 00:00:00',0,1,NULL),(180,'Ban chỉ huy PCLB TP','Ban chi huy PCLB TP','<p>&#160;</p>','2011-06-27 00:00:00',0,1,NULL),(181,'Hội  Sinh vật Cảnh TPHN','Hoi  Sinh vat Canh TPHN','<p>&#160;</p>','2011-06-27 00:00:00',0,1,NULL),(182,'Bảo Hiểm XHVN','Bao Hiem XHVN','<p>&#160;</p>','2011-06-27 00:00:00',0,1,NULL),(183,'Tổng cty ĐTPT Hạ tầng Đô thị','Tong cty DTPT Ha tang Do thi','<p>&#160;</p>','2011-06-27 00:00:00',0,1,NULL),(184,'Chi cục Dân số - KHHGĐ','Chi cuc Dan so  KHHGD','<p>&#160;</p>','2011-06-27 00:00:00',0,1,NULL),(185,'Cty CP ĐT XL Thương Mại & Dịch vụ','Cty CP DT XL Thuong Mai & Dich vu','<p>&#160;</p>','2011-06-28 00:00:00',0,1,NULL),(186,'Cty CPVT TM&DL Đông Anh','Cty CPVT TM&DL Dong Anh','<p>&#160;</p>','2011-06-29 00:00:00',0,1,NULL),(187,'Ban QL các Khu CN&CX Hà nội','Ban QL cac Khu CN&CX Ha noi','<p>&#160;</p>','2011-06-29 00:00:00',0,1,NULL),(188,'Tổng Cty TM Hà Nội','Tong Cty TM Ha Noi','<p>&#160;</p>','2011-06-29 00:00:00',0,1,NULL),(189,'Ban QLDA Khu đô thị Mỗ Lao','Ban QLDA Khu do thi Mo Lao','<p>&#160;</p>','2011-06-29 00:00:00',0,1,NULL),(190,'Cty CP Tập Đoàn T&T','Cty CP Tap Doan T&T','<p>&#160;</p>','2011-06-29 00:00:00',0,1,NULL),(191,'Cty Cổ phần ĐT&XD số 1 HN','Cty Co phan DT&XD so 1 HN','<p>&#160;</p>','2011-06-29 00:00:00',0,1,NULL),(192,'Cty TNHH MTV ĐTPT Nhà&Đô thị','Cty TNHH MTV DTPT Nha&Do thi','<p>&#160;</p>','2011-06-30 00:00:00',0,1,NULL),(193,'Ban Chấp hành TPHN','Ban Chap hanh TPHN','<p>&#160;</p>','2011-07-01 00:00:00',0,1,NULL),(194,'Cty CP VT&XD Hà Nội','Cty CP VT&XD Ha Noi','<p>&#160;</p>','2011-07-01 00:00:00',0,1,NULL),(195,'Cty TNHH ĐTPT Thuỷ lợi Sông Nhuệ','Cty TNHH DTPT Thuy loi Song Nhue','<p>&#160;</p>','2011-07-01 00:00:00',0,1,NULL),(196,'Bộ Khoa Học và Công Nghệ','Bo Khoa Hoc va Cong Nghe','<p>&#160;</p>','2011-07-01 00:00:00',0,1,NULL),(197,'Bộ NN&PT Nông Thôn','Bo NN&PT Nong Thon','<p>&#160;</p>','2011-07-01 00:00:00',0,1,NULL),(198,'Cty TNHH MTV ĐTPT Thuỷ Lợi sông Đáy','Cty TNHH MTV DTPT Thuy Loi song Day','<p>&#160;</p>','2011-07-01 00:00:00',0,1,NULL),(199,'Ban Kinh tế & Ngân sách HN','Ban Kinh te & Ngan sach HN','<p>&#160;</p>','2011-07-04 00:00:00',0,1,NULL),(200,'Viện NC&QL  Kinh tế Trung Ương','Vien NC&QL  Kinh te Trung Uong','<p>&#160;</p>','2011-07-04 00:00:00',0,1,NULL),(201,'Ban QL Chỉnh trang Đô thị HN','Ban QL Chinh trang Do thi HN','<p>&#160;</p>','2011-07-06 00:00:00',0,1,NULL),(202,'Ban CHQS quận Hoàn Kiếm','Ban CHQS quan Hoan Kiem','<p>&#160;</p>','2011-07-12 00:00:00',0,1,NULL),(203,'UB MTTQ Việt Nam TPHN','UB MTTQ Viet Nam TPHN','<p>&#160;</p>','2011-07-14 00:00:00',0,1,NULL),(204,'Văn phòng Đoàn ĐBQH&HĐND TPHN','Van phong Doan DBQH&HDND TPHN',NULL,'2011-08-26 00:00:00',0,1,NULL),(205,'Ngân Hàng NN Việt Nam','Ngan Hang NN Viet Nam','<p>&#160;</p>','2011-09-09 00:00:00',0,1,NULL),(206,'Kho bạc Nhà nước HN','Kho bac Nha nuoc HN','<p>&#160;</p>','2011-09-22 00:00:00',0,1,NULL),(207,'Theo công văn','Theo cong van','<p>TCV</p>','2011-11-23 00:00:00',0,1,NULL),(208,'UBND huyện Chương Mỹ','UBND huyen Chuong My','<p>&#160;</p>','2011-11-29 00:00:00',0,1,NULL),(209,'UBND huyện Phú Xuyên','UBND huyen Phu Xuyen','<p>&#160;</p>','2011-11-29 00:00:00',0,1,NULL),(210,'Tổng cty ĐT&PT Nhà HN','Tong cty DT&PT Nha HN','<p>&#160;</p>','2011-11-29 00:00:00',0,1,NULL),(211,'Bộ Tư pháp','Bo Tu phap','<p>&#160;</p>','2011-11-29 00:00:00',0,1,NULL),(212,'Cục QL Giá - Bộ TC','Cuc QL Gia  Bo TC','<p>&#160;</p>','2011-11-29 00:00:00',0,1,NULL),(213,'Tổng Cục Thuế','Tong Cuc Thue','<p>&#160;</p>','2011-11-29 00:00:00',0,1,NULL),(214,'Kho bạc NN Thanh Trì','Kho bac NN Thanh Tri','<p>&#160;</p>','2011-11-29 00:00:00',0,1,NULL),(215,'Cục điều tra chống buôn lậu - Tổng cục Hải quan','Cuc dieu tra chong buon lau  Tong cuc Hai quan','<p>&#160;</p>','2011-11-29 00:00:00',0,1,NULL),(216,'Các cty TNHH MTV thuộc UBND TP & các Tổng CTNN thuộc TP','Cac cty TNHH MTV thuoc UBND TP & cac Tong CTNN thuoc TP','<p>&#160;</p>','2011-11-30 00:00:00',0,1,NULL),(217,'Ban chỉ đạo CT số 08-CTr/TU của Thành Uỷ Khoá XV','Ban chi dao CT so 08CTr/TU cua Thanh Uy Khoa XV','<p>&#160;</p>','2012-01-18 00:00:00',0,1,NULL),(218,'Ban Tổ chức Thành uỷ HN','Ban To chuc Thanh uy HN','<p>&#160;</p>','2012-05-23 00:00:00',0,1,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_users` */

insert  into `tbl_users`(`user_id`,`department_id`,`unit_id`,`object_id`,`user_fullname`,`user_name`,`user_pass`,`user_encode_pass`,`user_phone`,`user_email`,`user_domain`,`user_image`,`user_sex`,`user_ngay_sinh`,`user_noi_sinh`,`user_thuong_tru`,`user_tam_tru`,`trinhdo_id`,`user_cmnd`,`user_ngay_cap`,`user_noi_cap`,`user_ngay_bat_dau`,`user_so_tai_khoan`,`user_ngan_hang`,`per_add`,`per_edit`,`per_del`,`per_act`,`per_view`,`per_sms`,`user_module`,`user_sort`,`user_level`,`user_level_tnvb`,`user_level_soft`,`user_active`) values (1,'3,',3,6,'Quản trị','admin','e10adc3949ba59abbe56e057f20f883e','123456','0972559746','anhvan3103@gmail.com',NULL,'images/userimg/large_images/1361246911_P1040778.jpg',1,'1986-03-31','Từ Liêm, Hà Nội','Xuân Đỉnh, Từ Liêm, Hà Nội','Số 23, ktt X-827, thôn Tân Xuân, Xuân Đỉnh, Từ Liêm, HN',5,'012504687','2002-03-30','Công an TP. Hà Nội','2010-01-01','01035890624','0',NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,1,1,3,1),(31,'12',12,1,'Trương Văn Bút','buttv','e10adc3949ba59abbe56e057f20f883e','123456','0989861981','buttv_socson@hanoi.gov.vn',NULL,NULL,1,'--',NULL,NULL,NULL,2,NULL,'--',NULL,'2010-01-01',NULL,NULL,0,0,0,0,0,3,'0',0,4,3,3,1),(37,'12',12,2,'Tạ Văn Đạo','daotv','e10adc3949ba59abbe56e057f20f883e','123456','0903267002','daotv@gmail.com',NULL,NULL,1,'2014-02-22',NULL,NULL,NULL,1,NULL,'2014-02-22',NULL,'2010-01-01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,5,3,3,1),(38,'12',12,2,'Phạm Văn Minh','minhpv','e10adc3949ba59abbe56e057f20f883e','123456','01655092555','minhpv@gmail.com',NULL,NULL,1,'--',NULL,NULL,NULL,2,NULL,'--',NULL,'2010-01-01',NULL,NULL,0,0,0,0,0,3,'0',0,5,3,3,1),(39,'12',12,2,'Lê Hữu Mạnh','manhlh','e10adc3949ba59abbe56e057f20f883e','123456','01662756294','manhlh@gmail.com',NULL,NULL,1,'--',NULL,NULL,NULL,2,NULL,'--',NULL,'2010-01-01',NULL,NULL,0,0,0,0,0,3,'0',0,5,3,3,1),(40,'12',12,6,'Văn thư','vanthu','e10adc3949ba59abbe56e057f20f883e','123456','01697613570','vanthu_socson@hanoi.gov.vn',NULL,NULL,1,'--',NULL,NULL,NULL,2,NULL,'--',NULL,'2010-01-01',NULL,NULL,0,0,0,0,0,3,'0',0,9,2,3,1);

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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_vbfiles` */

insert  into `tbl_vbfiles`(`docFile_id`,`doc_id`,`docFile_name`,`docFile_path`,`docFile_date`,`docFile_sort`,`docFile_active`,`user_id`) values (20,1,'489','../doc_uploads_2013/e30dc7a62f16b6198d5ab91ea38160a9.jpg','2013-03-18',0,0,14),(22,3,'257/TB-UBND','../doc_uploads_2013/3a7f66fc47bdddc8cf1312c1ab945b8c.jpg','2013-03-19',0,0,14),(23,4,'347/TT-HND','../doc_uploads_2013/26aa5b4ed5bd50145a1c10b4340b6b75.jpg','2013-03-19',0,0,14),(24,5,'668/TT-SGT','../doc_uploads_2013/832b298af3402ee344d9887b17a7ea9f.jpg','2013-03-21',0,0,14),(25,6,'679/TT-BCT','../doc_uploads_2013/f857e77f656bb4787ed20fd7092b90f0.png','2013-03-21',0,0,14),(26,7,'2350','../doc_uploads_2013/22a3b317ee6bf71e9e6bf1f0aab29a9e.jpg','2013-04-24',0,0,26),(27,8,'1249','../doc_uploads_2013/41db304c0609056da30457eef50deea8.png','2013-04-24',0,0,26),(28,9,'1345 - 1: Bản scan','../doc_uploads_2012/5e1aa47c6b3f2ae83de55255c5613594.jpg','2013-04-24',0,0,26),(29,9,'1345 - 2: Tệp tin liên quan','../doc_uploads_2012/90659bdbb5ff70930d5715e39e92d4f8.jpg','2013-04-24',0,0,26),(30,9,'1345 - 3: Văn bản trả lời','../doc_uploads_2012/e15a20956031b03c2a653e3bd7faf955.jpg','2013-04-24',0,0,26),(31,9,'1345 - 4: Kết luận','../doc_uploads_2012/3165ece81acee9a73efcf60c7f99a7fb.jpg','2013-04-24',0,0,26),(32,9,'1345 - 5: Thông báo','../doc_uploads_2012/1be0bbf5216efa8f4aec1726ceb40d67.jpg','2013-04-24',0,0,26),(33,9,'1345 - 6: Biên bản','../doc_uploads_2012/394c5a5117f6f2100cd8f94bbfd8a119.jpg','2013-04-24',0,0,26),(34,10,'12/CV-CKXL7','../doc_uploads_2013/36d1db0b345698f640733f97977d2b67.pdf','2013-04-24',0,0,1),(35,11,'7/THA-HCTC','../doc_uploads_2012/3860ffb00dde3bc949b442c28560cc99.jpg','2013-06-11',0,0,14);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_vbreplyfiles` */

insert  into `tbl_vbreplyfiles`(`docreplyfile_id`,`docreply_id`,`docreplyfile_name`,`docreplyfile_path`,`docreplyfile_date`,`docreplyfile_sort`,`docreplyfile_active`,`user_id`) values (1,1,'VB-Nội bộ','../tnvb_uploads_2013/15e70dfc5deb06d2e3d44a349c2af777.jpg','2013-03-28 00:00:00',0,0,0);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_vbreplys` */

insert  into `tbl_vbreplys`(`docreply_id`,`doc_id`,`docCat_id`,`docField_id`,`docreply_unit`,`docreply_code`,`docreply_desc`,`docreply_direct`,`docreply_note`,`signPer_id`,`docreply_signed`,`important_id`,`docreply_limit_time`,`docreply_date`,`user_id`,`docreply_file`) values (1,4,'Công văn','Tư vấn, lên dự án','Phòng Hành chính - Tổ chức','Nội bộ','V/v chọn lựa nhân sự hợp tác giải quyết văn bản số 347/TT-HND',NULL,NULL,'Dương Việt Hùng','2013-03-21',0,NULL,'2013-03-21',14,1),(2,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1970-01-01',0,NULL,'2013-04-24',8,2),(3,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1970-01-01',0,NULL,'2013-04-24',29,2);

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_vbs` */

insert  into `tbl_vbs`(`doc_id`,`docin_id`,`docout_id`,`docCat_id`,`docField_id`,`doc_unit`,`department_id`,`doc_code`,`doc_desc`,`doc_direct`,`doc_note`,`doc_signed`,`signPer_id`,`important_id`,`secret_id`,`doc_date`,`doc_limit_time`,`doc_sort`,`doc_active`,`doc_file`,`user_id`,`doc_intype`) values (1,5,0,'Thông báo','Hành chính','Phòng Hành chính - Tổ chức',1,'489','V/v tổ chức cuộc gặp gỡ giao lưu giữa 2 cty tại Church Hotel Hàng Gai vào lúc: 18h00‘ ngày 10/10/2012','Kính chuyển đ/c giám đốc.\nÝ kiến tham mưu:\n- Chuyển phòng Hành chính giải quyết.\n- Sao chuyển các phòng ban khác biết và sắp xếp thời gian',NULL,'2012-10-02 00:00:00','Nguyễn Quý Hữu',1,1,'2013-03-18 14:59:00',NULL,0,2,2,14,0),(3,16,0,'Thông báo','Xây dựng phần mềm','Phòng Hành chính - Tổ chức',1,'257/TB-UBND','V/v thông báo gói thầu phần mềm quản lý Thi đua-khen thưởng triển khai cho phòng Nội Vụ.',NULL,NULL,'1970-01-01 00:00:00','Nguyễn Phúc Quang',1,1,'2013-03-19 09:18:00',NULL,0,2,2,14,0),(4,28,0,'Thông tri','Tổ chức tư vấn cho nhân dân các huyện trên địa bàn Tp','Phòng Hành chính - Tổ chức',1,'347/TT-HND','V/v Lên kế hoạch tổ chức hội thảo hướng nghiệp cho các huyện, thị trấn có dự án thu hồi đất trên địa bàn thành phố','K/c đ/c giám đốc:\nÝ kiến tham mưu:\nChuyển đến phòng thương binh lao động xã hội huyện tổ chức và phối hợp với các phòng ban có liên quan',NULL,'2013-03-07 00:00:00','Nguyễn Khắc Dũng',1,1,'2013-03-19 10:41:00',NULL,0,2,2,14,0),(5,27,0,'Thông tư','Lập kế hoạch tổ chức kiểm tra','Phòng Hành chính - Tổ chức',1,'668/TT-SGT','V/v Tổ chức lập kế hoạch kiểm tra thanh tra giao thông trên địa bàn thành phố',NULL,NULL,'2013-03-05 00:00:00','Nguyễn Hồng Sơn',1,1,'2013-03-21 13:46:00',NULL,0,2,2,14,0),(6,25,0,'Thông tư','Lập kế hoạch đầu tư cho các tỉnh phía nam','Phòng Hành chính - Tổ chức',1,'679/TT-BCT','V/v Lập kế hoạch đầu tư cho các tỉnh thành phía nam trong năm 2013',NULL,NULL,'2013-03-04 00:00:00','Lâm Quốc Hùng',1,1,'2013-03-21 14:07:00',NULL,0,2,2,14,0),(7,1,0,'Công văn','Xây dựng phần mềm','Chi nhánh 3 - Khánh hòa',4,'2350','V/v xây dựng phần mềm quản lý và điều hành công việc văn phòng.','Kính chuyển đ/c giám đốc.\nÝ kiến tham mưu:\n- Chuyển phòng Kinh doanh phụ trách giải quyết\n- Sao chuyển phòng Dự án và phòng Kỹ thuật phối hợp',NULL,'2012-10-02 00:00:00','Nguyễn Thế Thảo',1,1,'2013-04-24 11:57:00',NULL,0,2,2,26,0),(8,2,0,'Quyết định','Tư vấn, lên dự án','Chi nhánh 3 - Khánh hòa',7,'1249','Giao cho cty THA trách nhiệm tư vấn và lên dự án đối với việc xây dựng hệ thông mạng tại sở.','Kính chuyển đ/c giám đốc.\nÝ kiến tham mưu:\n- Chuyển phó giám đốc Nguyễn Quý Hữu phụ trách.',NULL,'2012-10-02 00:00:00','Hoàng Duy Khanh',1,1,'2013-04-24 11:58:00',NULL,0,2,2,26,0),(9,10,0,'Công văn','Xây dựng phần mềm','Chi nhánh 3 - Khánh hòa',4,'1345','V/v đề nghị cty THA cử đại diện đến Sở để cùng kết hợp triển khai DVC trực tuyến tích hợp trên cổng thông tin Sở.','Kính chuyển đ/c giám đốc.\nÝ kiến tham mưu:\n- Chuyển phòng Kỹ thuật phụ trách giải quyết;\n- Sao chuyển phòng Kinh doanh phối hợp.',NULL,'2012-10-04 00:00:00','Nguyễn Thị Hà Ninh',1,1,'2013-04-24 12:00:00',NULL,0,2,2,26,0),(10,11,0,'Công văn','Tư vấn, lên dự án','Phòng Kỹ thuật',11,'12/CV-CKXL7','V/v đề nghị công ty THA cử người tới tư vấn lắp đặt hệ thống mạng nội bộ toàn bộ công ty và các phân xưởng sản xuất.','Kính gửi đ/c giám đốc.\nÝ kiến tham mưu:\n- Chuyển đ/c phó giám đốc Nguyễn Quý Hữu phụ trách.',NULL,'2013-02-19 00:00:00','Nguyễn Quang Triệu',1,1,'2013-04-24 12:53:00',NULL,0,2,2,1,0),(11,0,10,'Quyết định','Hành chính','Phòng Hành chính - Tổ chức',1,'7/THA-HCTC','Quyết định thành lập đội bóng liên hợp giữa các cty THA, Tech-Mart, Hảo Vong, BeoBell.',NULL,NULL,'1970-01-01 00:00:00','Đàm Thanh An',0,0,'2013-06-11 14:37:00',NULL,0,2,2,14,0);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_vttb_repares` */

insert  into `tbl_vttb_repares`(`vttb_repare_id`,`vttb_id`,`vttb_repare_name`,`vttb_repare_cost`,`vttb_repare_paid_type`,`vttb_repare_date`,`vttb_repare_code`,`vttb_repare_unit`,`user_id`) values (1,1,'Sửa màn hình',550000,2,'2012-02-25','0025/PT-TM','Cty CP Tech-mart',18),(3,1,'Sửa bàn phím',300000,2,'2013-02-24','0072/PT-TM','Cty CP Tech-mart',18);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_vttb_replaces` */

insert  into `tbl_vttb_replaces`(`vttb_replace_id`,`vttb_id`,`vttb_replace_name`,`vttb_replace_cost`,`vttb_replace_paid_type`,`vttb_replace_date`,`vttb_replace_code`,`vttb_replace_unit`,`user_id`) values (1,1,'Thay ổ cứng',800000,2,'2013-01-12','0052/PT-TM','Cty CP Tech-mart',18);

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

insert  into `tbl_vttbs`(`vttb_id`,`vttb_sub_id`,`vttb_name`,`vttb_desc`,`vttb_commission`,`vttb_limit`,`vttb_decommission`,`vttb_cost`,`vttb_useby`,`vttb_date`,`vttb_sort`,`vttb_active`,`user_id`) values (1,5,'Lap-001','Laptop: Emachines (Core-I3, 160GB)','2010-01-01','2015-01-01','0000-00-00',11000000,18,'2013-05-22',NULL,1,1),(2,5,'Lap-002','Laptop Dell (160GB, Ram 2GB)','2011-01-01','2016-01-01','0000-00-00',6500000,10,'2013-04-24',0,1,1),(3,1,'Phòng họp số 1','Phòng họp trên tầng 3, khu văn phòng','2008-01-01','2023-01-01','0000-00-00',683000000,0,'2013-04-24',0,1,1),(4,1,'Phòng họp số 2','Phòng họp trên tầng 2, khu văn phòng','2008-01-01','2023-01-01','0000-00-00',400000000,0,'2013-04-24',0,1,1),(5,2,'Kho 01-GL','Kho thuê hạn 7 năm tại Gia Lâm, Hà Nội','2008-01-01','2015-01-01','0000-00-00',840000000,0,'2013-04-24',0,1,1),(6,3,'Toyota - Zace','7 chỗ','2012-01-01','2022-01-01','0000-00-00',700000,0,'2013-05-09',0,1,1),(7,14,'Thiết bị 1','Mô tả','2013-01-01','2016-01-01','2017-01-01',2300000,10,'2013-06-22',0,1,1);

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
