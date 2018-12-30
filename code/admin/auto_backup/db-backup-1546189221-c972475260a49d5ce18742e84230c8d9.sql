DROP TABLE ajax_chat_bans;

CREATE TABLE `ajax_chat_bans` (
  `userID` int(11) NOT NULL,
  `userName` varchar(64) COLLATE utf8_bin NOT NULL,
  `dateTime` datetime NOT NULL,
  `ip` varbinary(16) NOT NULL,
  PRIMARY KEY (`userID`),
  KEY `userName` (`userName`),
  KEY `dateTime` (`dateTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;




DROP TABLE ajax_chat_invitations;

CREATE TABLE `ajax_chat_invitations` (
  `userID` int(11) NOT NULL,
  `channel` int(11) NOT NULL,
  `dateTime` datetime NOT NULL,
  PRIMARY KEY (`userID`,`channel`),
  KEY `dateTime` (`dateTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;




DROP TABLE ajax_chat_messages;

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
) ENGINE=InnoDB AUTO_INCREMENT=435 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO ajax_chat_messages VALUES("1","2147483647","ChatBot","4","0","2013-03-19 17:38:22","\0\0","/login user");
INSERT INTO ajax_chat_messages VALUES("2","3","user","1","0","2013-03-19 17:38:40","\0\0","hello");
INSERT INTO ajax_chat_messages VALUES("3","3","user","1","0","2013-03-19 17:38:49","\0\0",";)");
INSERT INTO ajax_chat_messages VALUES("4","2147483647","ChatBot","4","1000000003","2013-03-19 17:39:34","\0\0","/who user");
INSERT INTO ajax_chat_messages VALUES("5","2147483647","ChatBot","4","0","2013-03-19 17:41:01","\0\0","/logout user");
INSERT INTO ajax_chat_messages VALUES("6","2147483647","ChatBot","4","0","2013-03-19 17:41:06","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("7","2147483647","ChatBot","4","1000000001","2013-03-19 17:41:14","\0\0","/list Public Private [admin]");
INSERT INTO ajax_chat_messages VALUES("8","2147483647","ChatBot","4","0","2013-03-19 17:41:22","\0\0","/channelLeave admin");
INSERT INTO ajax_chat_messages VALUES("9","2147483647","ChatBot","4","500000001","2013-03-19 17:41:22","\0\0","/channelEnter admin");
INSERT INTO ajax_chat_messages VALUES("10","2147483647","ChatBot","4","1000000001","2013-03-19 17:41:24","\0\0","/bansEmpty -");
INSERT INTO ajax_chat_messages VALUES("11","2147483647","ChatBot","4","500000001","2013-03-19 21:06:19","\0\0","/channelLeave admin");
INSERT INTO ajax_chat_messages VALUES("12","2147483647","ChatBot","4","0","2013-03-19 21:06:19","\0\0","/channelEnter admin");
INSERT INTO ajax_chat_messages VALUES("13","2147483647","ChatBot","4","0","2013-03-19 22:33:34","\0\0","/logout admin");
INSERT INTO ajax_chat_messages VALUES("14","2147483647","ChatBot","4","0","2013-03-19 22:46:07","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("15","2147483647","ChatBot","4","0","2013-03-19 22:52:47","\0\0","/logout admin");
INSERT INTO ajax_chat_messages VALUES("16","2147483647","ChatBot","4","0","2013-03-19 22:52:57","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("17","2147483647","ChatBot","4","1000000001","2013-03-19 22:54:26","\0\0","/who admin");
INSERT INTO ajax_chat_messages VALUES("18","2147483647","ChatBot","4","0","2013-03-19 23:08:57","\0\0","/logout admin");
INSERT INTO ajax_chat_messages VALUES("19","2147483647","ChatBot","4","0","2013-03-19 23:11:29","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("20","2147483647","ChatBot","4","0","2013-03-19 23:12:59","\0\0","/logout admin");
INSERT INTO ajax_chat_messages VALUES("21","2147483647","ChatBot","4","0","2013-03-19 23:13:06","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("22","2147483647","ChatBot","4","0","2013-03-19 23:13:21","\0\0","/logout admin");
INSERT INTO ajax_chat_messages VALUES("23","2147483647","ChatBot","4","0","2013-03-19 23:13:26","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("24","2147483647","ChatBot","4","0","2013-03-19 23:37:17","\0\0","/logout admin");
INSERT INTO ajax_chat_messages VALUES("25","2147483647","ChatBot","4","0","2013-03-19 23:37:21","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("26","2147483647","ChatBot","4","1000000001","2013-03-19 23:37:34","\0\0","/list Public Private [admin]");
INSERT INTO ajax_chat_messages VALUES("27","2147483647","ChatBot","4","0","2013-03-19 23:37:36","\0\0","/channelLeave admin");
INSERT INTO ajax_chat_messages VALUES("28","2147483647","ChatBot","4","500000001","2013-03-19 23:37:36","\0\0","/channelEnter admin");
INSERT INTO ajax_chat_messages VALUES("29","2147483647","ChatBot","4","500000001","2013-03-19 23:37:46","\0\0","/channelLeave admin");
INSERT INTO ajax_chat_messages VALUES("30","2147483647","ChatBot","4","1","2013-03-19 23:37:46","\0\0","/channelEnter admin");
INSERT INTO ajax_chat_messages VALUES("31","2147483647","ChatBot","4","1","2013-03-19 23:37:48","\0\0","/channelLeave admin");
INSERT INTO ajax_chat_messages VALUES("32","2147483647","ChatBot","4","0","2013-03-19 23:37:48","\0\0","/channelEnter admin");
INSERT INTO ajax_chat_messages VALUES("34","2147483647","ChatBot","4","0","2013-03-19 23:39:39","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("35","1","admin","3","0","2013-03-19 23:42:02","\0\0","sdfasdfsd");
INSERT INTO ajax_chat_messages VALUES("36","2147483647","ChatBot","4","0","2013-03-19 23:43:56","\0\0","/logout admin Timeout");
INSERT INTO ajax_chat_messages VALUES("37","2147483647","ChatBot","4","0","2013-03-19 23:43:57","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("38","2147483647","ChatBot","4","1000000001","2013-03-19 23:44:12","\0\0","/who admin");
INSERT INTO ajax_chat_messages VALUES("39","2147483647","ChatBot","4","0","2013-03-19 23:44:37","\0\0","/nick admin (meomeuop)");
INSERT INTO ajax_chat_messages VALUES("40","1","(meomeuop)","3","0","2013-03-19 23:44:46","\0\0","amdsfhaksjdga");
INSERT INTO ajax_chat_messages VALUES("41","2147483647","ChatBot","4","0","2013-03-19 23:44:51","\0\0","/logout (meomeuop)");
INSERT INTO ajax_chat_messages VALUES("42","2147483647","ChatBot","4","0","2013-03-19 23:44:56","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("43","2147483647","ChatBot","4","0","2013-03-19 23:45:02","\0\0","/delete 33");
INSERT INTO ajax_chat_messages VALUES("44","2147483647","ChatBot","4","0","2013-03-19 23:45:22","\0\0","/channelLeave admin");
INSERT INTO ajax_chat_messages VALUES("45","2147483647","ChatBot","4","500000001","2013-03-19 23:45:22","\0\0","/channelEnter admin");
INSERT INTO ajax_chat_messages VALUES("46","2147483647","ChatBot","4","500000001","2013-03-19 23:45:33","\0\0","/channelLeave admin");
INSERT INTO ajax_chat_messages VALUES("47","2147483647","ChatBot","4","1","2013-03-19 23:45:33","\0\0","/channelEnter admin");
INSERT INTO ajax_chat_messages VALUES("48","1","admin","3","1","2013-03-19 23:45:37","\0\0",":D");
INSERT INTO ajax_chat_messages VALUES("49","2147483647","ChatBot","4","1000000001","2013-03-19 23:46:19","\0\0","/error UnknownCommand /ThoÃ¡t");
INSERT INTO ajax_chat_messages VALUES("50","2147483647","ChatBot","4","1000000001","2013-03-19 23:46:26","\0\0","/error UnknownCommand /ThoÃ¡t");
INSERT INTO ajax_chat_messages VALUES("52","1","admin","3","1","2013-03-19 23:46:47","\0\0",":error:");
INSERT INTO ajax_chat_messages VALUES("53","1","admin","3","1","2013-03-19 23:46:50","\0\0",":favorite:");
INSERT INTO ajax_chat_messages VALUES("54","1","admin","3","1","2013-03-19 23:46:52","\0\0",":warning:");
INSERT INTO ajax_chat_messages VALUES("55","1","admin","3","1","2013-03-19 23:46:55","\0\0","O:-D");
INSERT INTO ajax_chat_messages VALUES("56","1","admin","3","1","2013-03-19 23:46:58","\0\0",":help:");
INSERT INTO ajax_chat_messages VALUES("57","1","admin","3","1","2013-03-19 23:47:00","\0\0",":important:");
INSERT INTO ajax_chat_messages VALUES("58","1","admin","3","1","2013-03-19 23:47:15","\0\0","[quote]hehe[/quote]");
INSERT INTO ajax_chat_messages VALUES("59","1","admin","3","1","2013-03-19 23:47:20","\0\0","[u]Ã¡dasd[/u]");
INSERT INTO ajax_chat_messages VALUES("60","1","admin","3","1","2013-03-19 23:47:24","\0\0","[i]dfsdf[/i]");
INSERT INTO ajax_chat_messages VALUES("61","1","admin","3","1","2013-03-19 23:47:27","\0\0","[b]dsfsdf[/b]");
INSERT INTO ajax_chat_messages VALUES("62","1","admin","3","1","2013-03-19 23:47:37","\0\0","[url=http://dantri.com.vn][/url]");
INSERT INTO ajax_chat_messages VALUES("63","1","admin","3","1","2013-03-19 23:48:08","\0\0","[url=http://dantri.com.vn]dantri[/url]");
INSERT INTO ajax_chat_messages VALUES("64","2147483647","ChatBot","4","1000000001","2013-03-19 23:48:41","\0\0","/delete 51");
INSERT INTO ajax_chat_messages VALUES("65","2147483647","ChatBot","4","1","2013-03-19 23:49:06","\0\0","/logout admin");
INSERT INTO ajax_chat_messages VALUES("66","2147483647","ChatBot","4","0","2013-03-19 23:57:25","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("67","2147483647","ChatBot","4","0","2013-03-19 23:57:34","\0\0","/logout admin");
INSERT INTO ajax_chat_messages VALUES("68","2147483647","ChatBot","4","0","2013-03-19 23:57:42","\0\0","/login ngalt");
INSERT INTO ajax_chat_messages VALUES("69","10","ngalt","0","0","2013-03-19 23:57:49","\0\0","hello");
INSERT INTO ajax_chat_messages VALUES("70","2147483647","ChatBot","4","0","2013-03-19 23:59:28","\0\0","/logout ngalt");
INSERT INTO ajax_chat_messages VALUES("71","2147483647","ChatBot","4","0","2013-03-19 23:59:34","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("72","2147483647","ChatBot","4","0","2013-03-19 23:59:43","\0\0","/logout admin");
INSERT INTO ajax_chat_messages VALUES("73","2147483647","ChatBot","4","0","2013-03-19 23:59:48","\0\0","/login ngalt");
INSERT INTO ajax_chat_messages VALUES("74","2147483647","ChatBot","4","0","2013-03-20 00:00:22","\0\0","/logout ngalt");
INSERT INTO ajax_chat_messages VALUES("75","2147483647","ChatBot","4","0","2013-03-20 00:00:26","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("76","2147483647","ChatBot","4","0","2013-03-20 00:05:00","\0\0","/login ngalt");
INSERT INTO ajax_chat_messages VALUES("77","10","ngalt","0","1000000010","2013-03-20 00:05:19","\0\0","/privmsgto admin hello admin");
INSERT INTO ajax_chat_messages VALUES("78","10","ngalt","0","1000000000","2013-03-20 00:05:19","\0\0","/privmsg hello admin");
INSERT INTO ajax_chat_messages VALUES("79","0","admin","3","0","2013-03-20 00:05:34","\0\0","hello con khá»‰");
INSERT INTO ajax_chat_messages VALUES("80","2147483647","ChatBot","4","1000000010","2013-03-20 00:05:52","\0\0","/queryOpen admin");
INSERT INTO ajax_chat_messages VALUES("81","10","ngalt","0","1000000010","2013-03-20 00:06:03","\0\0","/privmsgto admin tháº±ng Ä‘iÃªn");
INSERT INTO ajax_chat_messages VALUES("82","10","ngalt","0","1000000000","2013-03-20 00:06:03","\0\0","/privmsg tháº±ng Ä‘iÃªn");
INSERT INTO ajax_chat_messages VALUES("83","0","admin","3","0","2013-03-20 00:06:15","\0\0","dá»Ÿ hÆ¡i");
INSERT INTO ajax_chat_messages VALUES("84","2147483647","ChatBot","4","0","2013-03-20 08:08:31","\0\0","/logout admin Timeout");
INSERT INTO ajax_chat_messages VALUES("85","2147483647","ChatBot","4","0","2013-03-20 08:08:31","\0\0","/logout ngalt Timeout");
INSERT INTO ajax_chat_messages VALUES("86","2147483647","ChatBot","4","0","2013-03-20 08:08:32","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("87","2147483647","ChatBot","4","0","2013-03-20 08:11:23","\0\0","/roll admin 1d6 6");
INSERT INTO ajax_chat_messages VALUES("88","0","admin","3","0","2013-03-20 08:11:56","\0\0",":P");
INSERT INTO ajax_chat_messages VALUES("89","0","admin","3","0","2013-03-20 08:12:00","\0\0",":-*");
INSERT INTO ajax_chat_messages VALUES("90","0","admin","3","0","2013-03-20 08:12:27","\0\0",":-(");
INSERT INTO ajax_chat_messages VALUES("91","0","admin","3","0","2013-03-20 08:12:29","\0\0",":(");
INSERT INTO ajax_chat_messages VALUES("92","0","admin","3","0","2013-03-20 08:26:57","\0\0","O:-D");
INSERT INTO ajax_chat_messages VALUES("93","2147483647","ChatBot","4","0","2013-03-20 08:39:28","\0\0","/logout admin Timeout");
INSERT INTO ajax_chat_messages VALUES("94","2147483647","ChatBot","4","0","2013-03-20 08:39:29","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("95","2147483647","ChatBot","4","0","2013-03-20 08:46:00","\0\0","/logout admin Timeout");
INSERT INTO ajax_chat_messages VALUES("96","2147483647","ChatBot","4","0","2013-03-20 08:46:00","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("97","0","admin","3","0","2013-03-20 08:46:04","\0\0","O:-D");
INSERT INTO ajax_chat_messages VALUES("98","2147483647","ChatBot","4","0","2013-03-20 09:02:46","\0\0","/logout admin Timeout");
INSERT INTO ajax_chat_messages VALUES("99","2147483647","ChatBot","4","0","2013-03-20 09:02:46","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("100","2147483647","ChatBot","4","0","2013-03-20 09:09:02","\0\0","/logout admin Timeout");
INSERT INTO ajax_chat_messages VALUES("101","2147483647","ChatBot","4","0","2013-03-20 09:09:03","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("102","2147483647","ChatBot","4","0","2013-03-20 09:13:07","\0\0","/logout admin Timeout");
INSERT INTO ajax_chat_messages VALUES("103","2147483647","ChatBot","4","0","2013-03-20 09:13:08","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("104","2147483647","ChatBot","4","0","2013-03-20 09:24:31","\0\0","/logout admin Timeout");
INSERT INTO ajax_chat_messages VALUES("105","2147483647","ChatBot","4","0","2013-03-20 09:24:32","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("106","2147483647","ChatBot","4","0","2013-03-20 09:33:31","\0\0","/logout admin Timeout");
INSERT INTO ajax_chat_messages VALUES("107","2147483647","ChatBot","4","0","2013-03-20 09:33:31","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("108","2147483647","ChatBot","4","0","2013-03-20 09:35:24","\0\0","/logout admin Timeout");
INSERT INTO ajax_chat_messages VALUES("109","2147483647","ChatBot","4","0","2013-03-20 09:35:25","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("110","2147483647","ChatBot","4","0","2013-03-20 09:40:34","\0\0","/logout admin");
INSERT INTO ajax_chat_messages VALUES("111","2147483647","ChatBot","4","0","2013-03-20 09:40:41","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("112","2147483647","ChatBot","4","0","2013-03-20 09:40:43","\0\0","/logout admin");
INSERT INTO ajax_chat_messages VALUES("113","2147483647","ChatBot","4","0","2013-03-20 09:42:11","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("114","2147483647","ChatBot","4","0","2013-03-20 09:43:43","\0\0","/logout admin");
INSERT INTO ajax_chat_messages VALUES("115","2147483647","ChatBot","4","0","2013-03-20 09:48:58","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("116","2147483647","ChatBot","4","0","2013-03-20 10:02:16","\0\0","/logout admin Timeout");
INSERT INTO ajax_chat_messages VALUES("117","2147483647","ChatBot","4","0","2013-03-20 10:02:16","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("118","0","admin","3","0","2013-03-20 10:04:06","\0\0","adads]");
INSERT INTO ajax_chat_messages VALUES("119","2147483647","ChatBot","4","0","2013-03-20 10:14:08","\0\0","/logout admin Timeout");
INSERT INTO ajax_chat_messages VALUES("120","2147483647","ChatBot","4","0","2013-03-20 10:14:09","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("121","2147483647","ChatBot","4","0","2013-03-20 10:21:20","\0\0","/logout admin Timeout");
INSERT INTO ajax_chat_messages VALUES("122","2147483647","ChatBot","4","0","2013-03-20 10:21:20","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("123","2147483647","ChatBot","4","0","2013-03-20 10:21:51","\0\0","/logout admin Timeout");
INSERT INTO ajax_chat_messages VALUES("124","2147483647","ChatBot","4","0","2013-03-20 10:21:52","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("125","2147483647","ChatBot","4","0","2013-03-20 10:25:38","\0\0","/logout admin Timeout");
INSERT INTO ajax_chat_messages VALUES("126","2147483647","ChatBot","4","0","2013-03-20 10:25:39","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("127","2147483647","ChatBot","4","0","2013-03-20 10:29:19","\0\0","/logout admin Timeout");
INSERT INTO ajax_chat_messages VALUES("128","2147483647","ChatBot","4","0","2013-03-20 10:29:19","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("129","0","admin","3","0","2013-03-20 10:35:18","\0\0",":-/");
INSERT INTO ajax_chat_messages VALUES("130","0","admin","3","0","2013-03-20 10:40:06","\0\0","[quote]dgdgdf[/quote]");
INSERT INTO ajax_chat_messages VALUES("131","0","admin","3","0","2013-03-20 10:40:20","\0\0","[color=teal]qÆ°eqweq[/color]");
INSERT INTO ajax_chat_messages VALUES("132","2147483647","ChatBot","4","0","2013-03-20 10:42:42","\0\0","/logout admin Timeout");
INSERT INTO ajax_chat_messages VALUES("133","2147483647","ChatBot","4","0","2013-03-20 10:42:42","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("134","2147483647","ChatBot","4","0","2013-03-20 10:55:51","\0\0","/roll admin 1d6 4");
INSERT INTO ajax_chat_messages VALUES("135","2147483647","ChatBot","4","0","2013-03-20 10:55:57","\0\0","/roll admin 1d6 6");
INSERT INTO ajax_chat_messages VALUES("136","2147483647","ChatBot","4","0","2013-03-20 10:56:02","\0\0","/roll admin 1d6 5");
INSERT INTO ajax_chat_messages VALUES("137","2147483647","ChatBot","4","0","2013-03-20 11:00:15","ï¿½ï¿½l","/login hiennn");
INSERT INTO ajax_chat_messages VALUES("138","2147483647","ChatBot","4","0","2013-03-20 11:00:27","ï¿½ï¿½l","/channelLeave hiennn");
INSERT INTO ajax_chat_messages VALUES("139","2147483647","ChatBot","4","1","2013-03-20 11:00:27","ï¿½ï¿½l","/channelEnter hiennn");
INSERT INTO ajax_chat_messages VALUES("140","2147483647","ChatBot","4","1","2013-03-20 11:00:40","ï¿½ï¿½l","/channelLeave hiennn");
INSERT INTO ajax_chat_messages VALUES("141","2147483647","ChatBot","4","0","2013-03-20 11:00:40","ï¿½ï¿½l","/channelEnter hiennn");
INSERT INTO ajax_chat_messages VALUES("142","2147483647","ChatBot","4","0","2013-03-20 11:00:45","ï¿½ï¿½l","/channelLeave hiennn");
INSERT INTO ajax_chat_messages VALUES("143","2147483647","ChatBot","4","1","2013-03-20 11:00:45","ï¿½ï¿½l","/channelEnter hiennn");
INSERT INTO ajax_chat_messages VALUES("144","2147483647","ChatBot","4","0","2013-03-20 11:01:04","\0\0","/channelLeave admin");
INSERT INTO ajax_chat_messages VALUES("145","2147483647","ChatBot","4","1","2013-03-20 11:01:04","\0\0","/channelEnter admin");
INSERT INTO ajax_chat_messages VALUES("146","0","admin","3","1000000000","2013-03-20 11:01:14","\0\0","/privmsgto hiennn Ãª");
INSERT INTO ajax_chat_messages VALUES("147","0","admin","3","1000000005","2013-03-20 11:01:14","\0\0","/privmsg Ãª");
INSERT INTO ajax_chat_messages VALUES("148","5","hiennn","0","1","2013-03-20 11:01:20","ï¿½ï¿½l","85");
INSERT INTO ajax_chat_messages VALUES("149","2147483647","ChatBot","4","0","2013-03-20 11:03:35","ï¿½ï¿½h","/login hainx");
INSERT INTO ajax_chat_messages VALUES("150","2147483647","ChatBot","4","0","2013-03-20 11:03:39","ï¿½ï¿½h","/channelLeave hainx");
INSERT INTO ajax_chat_messages VALUES("151","2147483647","ChatBot","4","1","2013-03-20 11:03:39","ï¿½ï¿½h","/channelEnter hainx");
INSERT INTO ajax_chat_messages VALUES("152","2147483647","ChatBot","4","1000000006","2013-03-20 11:04:01","ï¿½ï¿½h","/queryOpen hiennn");
INSERT INTO ajax_chat_messages VALUES("153","6","hainx","0","1000000006","2013-03-20 11:04:10","ï¿½ï¿½h","/privmsgto hiennn hdhasdaskd");
INSERT INTO ajax_chat_messages VALUES("154","6","hainx","0","1000000005","2013-03-20 11:04:10","ï¿½ï¿½h","/privmsg hdhasdaskd");
INSERT INTO ajax_chat_messages VALUES("155","2147483647","ChatBot","4","0","2013-03-20 11:04:58","ï¿½ï¿½l","/login ngalt");
INSERT INTO ajax_chat_messages VALUES("156","2147483647","ChatBot","4","0","2013-03-20 11:05:02","ï¿½ï¿½l","/channelLeave ngalt");
INSERT INTO ajax_chat_messages VALUES("157","2147483647","ChatBot","4","1","2013-03-20 11:05:02","ï¿½ï¿½l","/channelEnter ngalt");
INSERT INTO ajax_chat_messages VALUES("158","2147483647","ChatBot","4","1000000010","2013-03-20 11:05:13","ï¿½ï¿½l","/queryOpen hiennn");
INSERT INTO ajax_chat_messages VALUES("159","10","ngalt","0","1000000010","2013-03-20 11:05:18","ï¿½ï¿½l","/privmsgto hiennn gklhgjk");
INSERT INTO ajax_chat_messages VALUES("160","10","ngalt","0","1000000005","2013-03-20 11:05:18","ï¿½ï¿½l","/privmsg gklhgjk");
INSERT INTO ajax_chat_messages VALUES("161","6","hainx","0","1000000006","2013-03-20 11:05:21","ï¿½ï¿½h","/privmsgto hiennn >:D<");
INSERT INTO ajax_chat_messages VALUES("162","6","hainx","0","1000000005","2013-03-20 11:05:21","ï¿½ï¿½h","/privmsg >:D<");
INSERT INTO ajax_chat_messages VALUES("163","2147483647","ChatBot","4","1000000010","2013-03-20 11:05:22","ï¿½ï¿½l","/queryClose hiennn");
INSERT INTO ajax_chat_messages VALUES("164","2147483647","ChatBot","4","1000000010","2013-03-20 11:05:22","ï¿½ï¿½l","/queryOpen hiennn");
INSERT INTO ajax_chat_messages VALUES("165","10","ngalt","0","1000000010","2013-03-20 11:05:25","ï¿½ï¿½l","/privmsgto hiennn dfgdsgfd");
INSERT INTO ajax_chat_messages VALUES("166","10","ngalt","0","1000000005","2013-03-20 11:05:25","ï¿½ï¿½l","/privmsg dfgdsgfd");
INSERT INTO ajax_chat_messages VALUES("167","6","hainx","0","1000000006","2013-03-20 11:05:29","ï¿½ï¿½h","/privmsgto hiennn >:D<");
INSERT INTO ajax_chat_messages VALUES("168","6","hainx","0","1000000005","2013-03-20 11:05:29","ï¿½ï¿½h","/privmsg >:D<");
INSERT INTO ajax_chat_messages VALUES("169","0","admin","3","1","2013-03-20 11:05:35","\0\0",":x");
INSERT INTO ajax_chat_messages VALUES("170","10","ngalt","0","1000000010","2013-03-20 11:05:36","ï¿½ï¿½l","/privmsgto hiennn yeu");
INSERT INTO ajax_chat_messages VALUES("171","10","ngalt","0","1000000005","2013-03-20 11:05:36","ï¿½ï¿½l","/privmsg yeu");
INSERT INTO ajax_chat_messages VALUES("172","0","admin","3","1","2013-03-20 11:05:44","\0\0",">:D<");
INSERT INTO ajax_chat_messages VALUES("173","10","ngalt","0","1000000010","2013-03-20 11:05:46","ï¿½ï¿½l","/privmsgto hiennn :)");
INSERT INTO ajax_chat_messages VALUES("174","10","ngalt","0","1000000005","2013-03-20 11:05:46","ï¿½ï¿½l","/privmsg :)");
INSERT INTO ajax_chat_messages VALUES("175","10","ngalt","0","1000000010","2013-03-20 11:05:50","ï¿½ï¿½l","/privmsgto hiennn :(");
INSERT INTO ajax_chat_messages VALUES("176","10","ngalt","0","1000000005","2013-03-20 11:05:50","ï¿½ï¿½l","/privmsg :(");
INSERT INTO ajax_chat_messages VALUES("177","6","hainx","0","1000000006","2013-03-20 11:05:57","ï¿½ï¿½h","/privmsgto hiennn 8->");
INSERT INTO ajax_chat_messages VALUES("178","6","hainx","0","1000000005","2013-03-20 11:05:57","ï¿½ï¿½h","/privmsg 8->");
INSERT INTO ajax_chat_messages VALUES("179","6","hainx","0","1000000006","2013-03-20 11:06:03","ï¿½ï¿½h","/privmsgto hiennn :O)");
INSERT INTO ajax_chat_messages VALUES("180","6","hainx","0","1000000005","2013-03-20 11:06:03","ï¿½ï¿½h","/privmsg :O)");
INSERT INTO ajax_chat_messages VALUES("181","6","hainx","0","1000000006","2013-03-20 11:06:06","ï¿½ï¿½h","/privmsgto hiennn :))");
INSERT INTO ajax_chat_messages VALUES("182","6","hainx","0","1000000005","2013-03-20 11:06:06","ï¿½ï¿½h","/privmsg :))");
INSERT INTO ajax_chat_messages VALUES("183","2147483647","ChatBot","4","1000000006","2013-03-20 11:06:16","ï¿½ï¿½h","/queryClose hiennn");
INSERT INTO ajax_chat_messages VALUES("184","2147483647","ChatBot","4","1000000006","2013-03-20 11:06:16","ï¿½ï¿½h","/queryOpen ngalt");
INSERT INTO ajax_chat_messages VALUES("185","6","hainx","0","1000000006","2013-03-20 11:06:19","ï¿½ï¿½h","/privmsgto ngalt oke");
INSERT INTO ajax_chat_messages VALUES("186","6","hainx","0","1000000010","2013-03-20 11:06:19","ï¿½ï¿½h","/privmsg oke");
INSERT INTO ajax_chat_messages VALUES("187","0","admin","3","1","2013-03-20 11:06:30","\0\0",">:D<");
INSERT INTO ajax_chat_messages VALUES("188","0","admin","3","1","2013-03-20 11:06:48","\0\0",":-t");
INSERT INTO ajax_chat_messages VALUES("189","2147483647","ChatBot","4","1000000000","2013-03-20 11:07:41","\0\0","/queryOpen hiennn");
INSERT INTO ajax_chat_messages VALUES("190","0","admin","3","1000000000","2013-03-20 11:07:45","\0\0","/privmsgto hiennn heloo");
INSERT INTO ajax_chat_messages VALUES("191","0","admin","3","1000000005","2013-03-20 11:07:45","\0\0","/privmsg heloo");
INSERT INTO ajax_chat_messages VALUES("192","2147483647","ChatBot","4","1000000000","2013-03-20 11:08:03","\0\0","/queryClose hiennn");
INSERT INTO ajax_chat_messages VALUES("193","2147483647","ChatBot","4","1000000000","2013-03-20 11:08:03","\0\0","/queryOpen hainx");
INSERT INTO ajax_chat_messages VALUES("194","0","admin","3","1000000000","2013-03-20 11:08:10","\0\0","/privmsgto hainx hehe");
INSERT INTO ajax_chat_messages VALUES("195","0","admin","3","1000000006","2013-03-20 11:08:10","\0\0","/privmsg hehe");
INSERT INTO ajax_chat_messages VALUES("196","2147483647","ChatBot","4","1","2013-03-20 11:12:57","\0\0","/logout hiennn Timeout");
INSERT INTO ajax_chat_messages VALUES("197","2147483647","ChatBot","4","1","2013-03-20 11:12:57","\0\0","/logout hainx Timeout");
INSERT INTO ajax_chat_messages VALUES("198","2147483647","ChatBot","4","1","2013-03-20 11:12:57","\0\0","/logout ngalt Timeout");
INSERT INTO ajax_chat_messages VALUES("199","2147483647","ChatBot","4","1000000000","2013-03-20 11:15:17","\0\0","/queryClose hainx");
INSERT INTO ajax_chat_messages VALUES("200","0","admin","3","1","2013-03-20 11:15:18","\0\0",":(");
INSERT INTO ajax_chat_messages VALUES("201","0","admin","3","1","2013-03-20 11:15:19","\0\0",";)");
INSERT INTO ajax_chat_messages VALUES("202","0","admin","3","1","2013-03-20 11:15:22","\0\0",":)");
INSERT INTO ajax_chat_messages VALUES("203","0","admin","3","1","2013-03-20 11:15:24","\0\0",":D");
INSERT INTO ajax_chat_messages VALUES("204","0","admin","3","1","2013-03-20 11:15:25","\0\0",";;)");
INSERT INTO ajax_chat_messages VALUES("205","0","admin","3","1","2013-03-20 11:15:26","\0\0",">:D<");
INSERT INTO ajax_chat_messages VALUES("206","0","admin","3","1","2013-03-20 11:15:33","\0\0",":-/");
INSERT INTO ajax_chat_messages VALUES("207","0","admin","3","1","2013-03-20 11:15:35","\0\0",":x");
INSERT INTO ajax_chat_messages VALUES("208","0","admin","3","1","2013-03-20 11:15:36","\0\0",":\">");
INSERT INTO ajax_chat_messages VALUES("209","0","admin","3","1","2013-03-20 11:15:36","\0\0",":P");
INSERT INTO ajax_chat_messages VALUES("210","0","admin","3","1","2013-03-20 11:15:37","\0\0",":*");
INSERT INTO ajax_chat_messages VALUES("211","0","admin","3","1","2013-03-20 11:15:38","\0\0","=((");
INSERT INTO ajax_chat_messages VALUES("212","0","admin","3","1","2013-03-20 11:15:39","\0\0",":-O");
INSERT INTO ajax_chat_messages VALUES("213","0","admin","3","1","2013-03-20 11:15:40","\0\0","X(");
INSERT INTO ajax_chat_messages VALUES("214","0","admin","3","1","2013-03-20 11:15:41","\0\0",":>");
INSERT INTO ajax_chat_messages VALUES("215","0","admin","3","1","2013-03-20 11:15:42","\0\0","B-)");
INSERT INTO ajax_chat_messages VALUES("216","0","admin","3","1","2013-03-20 11:15:43","\0\0",":-S");
INSERT INTO ajax_chat_messages VALUES("217","0","admin","3","1","2013-03-20 11:15:44","\0\0","#:-S");
INSERT INTO ajax_chat_messages VALUES("218","0","admin","3","1","2013-03-20 11:15:52","\0\0",">:)");
INSERT INTO ajax_chat_messages VALUES("219","0","admin","3","1","2013-03-20 11:15:55","\0\0",":((");
INSERT INTO ajax_chat_messages VALUES("220","0","admin","3","1","2013-03-20 11:15:56","\0\0",":))");
INSERT INTO ajax_chat_messages VALUES("221","0","admin","3","1","2013-03-20 11:15:57","\0\0",":|");
INSERT INTO ajax_chat_messages VALUES("222","2147483647","ChatBot","4","1000000000","2013-03-20 11:16:00","\0\0","/error UnknownCommand /:)");
INSERT INTO ajax_chat_messages VALUES("223","2147483647","ChatBot","4","1000000000","2013-03-20 11:16:04","\0\0","/error UnknownCommand /:)");
INSERT INTO ajax_chat_messages VALUES("224","0","admin","3","1","2013-03-20 11:16:06","\0\0","=))");
INSERT INTO ajax_chat_messages VALUES("225","0","admin","3","1","2013-03-20 11:16:08","\0\0","O:-)");
INSERT INTO ajax_chat_messages VALUES("226","0","admin","3","1","2013-03-20 11:16:09","\0\0","=;");
INSERT INTO ajax_chat_messages VALUES("227","0","admin","3","1","2013-03-20 11:16:11","\0\0",":-B");
INSERT INTO ajax_chat_messages VALUES("228","0","admin","3","1","2013-03-20 11:16:12","\0\0",":-c");
INSERT INTO ajax_chat_messages VALUES("229","0","admin","3","1","2013-03-20 11:16:12","\0\0",":)]");
INSERT INTO ajax_chat_messages VALUES("230","0","admin","3","1","2013-03-20 11:16:14","\0\0","~X(");
INSERT INTO ajax_chat_messages VALUES("231","0","admin","3","1","2013-03-20 11:16:15","\0\0",":-h");
INSERT INTO ajax_chat_messages VALUES("232","0","admin","3","1","2013-03-20 11:16:16","\0\0",":-t");
INSERT INTO ajax_chat_messages VALUES("233","0","admin","3","1","2013-03-20 11:17:17","\0\0",";;)");
INSERT INTO ajax_chat_messages VALUES("234","0","admin","3","1","2013-03-20 11:17:49","\0\0",">;D<");
INSERT INTO ajax_chat_messages VALUES("235","0","admin","3","1","2013-03-20 11:17:56","\0\0",";-)");
INSERT INTO ajax_chat_messages VALUES("236","0","admin","3","1","2013-03-20 11:18:09","\0\0","=((");
INSERT INTO ajax_chat_messages VALUES("237","0","admin","3","1","2013-03-20 11:18:11","\0\0",":-O");
INSERT INTO ajax_chat_messages VALUES("238","0","admin","3","1","2013-03-20 11:18:13","\0\0","X(");
INSERT INTO ajax_chat_messages VALUES("239","2147483647","ChatBot","4","1","2013-03-20 11:18:45","\0\0","/logout admin");
INSERT INTO ajax_chat_messages VALUES("240","2147483647","ChatBot","4","0","2013-03-20 12:41:55","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("241","2147483647","ChatBot","4","0","2013-03-20 12:41:59","\0\0","/logout admin");
INSERT INTO ajax_chat_messages VALUES("242","2147483647","ChatBot","4","0","2013-03-20 12:49:48","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("243","0","admin","3","0","2013-03-20 12:49:53","\0\0",":-t");
INSERT INTO ajax_chat_messages VALUES("244","2147483647","ChatBot","4","0","2013-03-20 13:25:09","\0\0","/logout admin");
INSERT INTO ajax_chat_messages VALUES("245","2147483647","ChatBot","4","0","2013-03-20 13:49:03","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("246","2147483647","ChatBot","4","0","2013-03-20 13:49:07","\0\0","/logout admin");
INSERT INTO ajax_chat_messages VALUES("247","2147483647","ChatBot","4","0","2013-03-20 13:51:01","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("248","2147483647","ChatBot","4","0","2013-03-20 13:51:03","\0\0","/logout admin");
INSERT INTO ajax_chat_messages VALUES("249","2147483647","ChatBot","4","0","2013-03-20 13:51:30","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("250","2147483647","ChatBot","4","0","2013-03-20 13:51:33","\0\0","/logout admin");
INSERT INTO ajax_chat_messages VALUES("251","2147483647","ChatBot","4","0","2013-03-20 13:53:35","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("252","2147483647","ChatBot","4","0","2013-03-20 13:53:38","\0\0","/logout admin");
INSERT INTO ajax_chat_messages VALUES("253","2147483647","ChatBot","4","0","2013-03-20 13:54:24","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("254","2147483647","ChatBot","4","0","2013-03-20 13:54:27","\0\0","/logout admin");
INSERT INTO ajax_chat_messages VALUES("255","2147483647","ChatBot","4","0","2013-03-20 13:57:06","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("256","2147483647","ChatBot","4","0","2013-03-20 13:57:08","\0\0","/logout admin");
INSERT INTO ajax_chat_messages VALUES("257","2147483647","ChatBot","4","0","2013-03-20 14:00:27","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("258","2147483647","ChatBot","4","0","2013-03-20 14:00:57","\0\0","/logout admin");
INSERT INTO ajax_chat_messages VALUES("259","2147483647","ChatBot","4","0","2013-03-20 14:04:48","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("260","0","admin","3","0","2013-03-20 14:05:57","\0\0","(:|");
INSERT INTO ajax_chat_messages VALUES("261","0","admin","3","0","2013-03-20 14:07:21","\0\0","({|");
INSERT INTO ajax_chat_messages VALUES("262","0","admin","3","0","2013-03-20 14:07:28","\0\0","=P~");
INSERT INTO ajax_chat_messages VALUES("263","0","admin","3","0","2013-03-20 14:07:41","\0\0",":-bd");
INSERT INTO ajax_chat_messages VALUES("264","0","admin","3","0","2013-03-20 14:07:44","\0\0","^#(^");
INSERT INTO ajax_chat_messages VALUES("265","0","admin","3","0","2013-03-20 14:07:59","\0\0",":ar!");
INSERT INTO ajax_chat_messages VALUES("266","0","admin","3","0","2013-03-20 14:08:05","\0\0",":P");
INSERT INTO ajax_chat_messages VALUES("267","0","admin","3","0","2013-03-20 14:08:10","\0\0",":\">");
INSERT INTO ajax_chat_messages VALUES("268","0","admin","3","0","2013-03-20 14:08:14","\0\0","=((");
INSERT INTO ajax_chat_messages VALUES("269","0","admin","3","0","2013-03-20 14:08:17","\0\0",":-O");
INSERT INTO ajax_chat_messages VALUES("270","0","admin","3","0","2013-03-20 14:08:22","\0\0",":>");
INSERT INTO ajax_chat_messages VALUES("271","0","admin","3","0","2013-03-20 14:08:25","\0\0","B-)");
INSERT INTO ajax_chat_messages VALUES("272","0","admin","3","0","2013-03-20 14:08:27","\0\0",":-S");
INSERT INTO ajax_chat_messages VALUES("273","0","admin","3","0","2013-03-20 14:08:29","\0\0","#:-S");
INSERT INTO ajax_chat_messages VALUES("274","0","admin","3","0","2013-03-20 14:08:57","\0\0","#:;S");
INSERT INTO ajax_chat_messages VALUES("275","0","admin","3","0","2013-03-20 14:09:08","\0\0",">:)");
INSERT INTO ajax_chat_messages VALUES("276","0","admin","3","0","2013-03-20 14:09:40","\0\0",">])");
INSERT INTO ajax_chat_messages VALUES("277","0","admin","3","0","2013-03-20 14:09:44","\0\0",":((");
INSERT INTO ajax_chat_messages VALUES("278","0","admin","3","0","2013-03-20 14:12:39","\0\0",":[[");
INSERT INTO ajax_chat_messages VALUES("279","0","admin","3","0","2013-03-20 14:12:41","\0\0",":]]");
INSERT INTO ajax_chat_messages VALUES("280","0","admin","3","0","2013-03-20 14:12:45","\0\0",":|");
INSERT INTO ajax_chat_messages VALUES("281","2147483647","ChatBot","4","1000000000","2013-03-20 14:12:49","\0\0","/error UnknownCommand /:)");
INSERT INTO ajax_chat_messages VALUES("282","0","admin","3","0","2013-03-20 14:13:38","\0\0",";>)");
INSERT INTO ajax_chat_messages VALUES("283","0","admin","3","0","2013-03-20 14:14:07","\0\0","=))");
INSERT INTO ajax_chat_messages VALUES("284","0","admin","3","0","2013-03-20 14:14:12","\0\0","O:-)");
INSERT INTO ajax_chat_messages VALUES("285","0","admin","3","0","2013-03-20 14:14:15","\0\0","=;");
INSERT INTO ajax_chat_messages VALUES("286","0","admin","3","0","2013-03-20 14:14:17","\0\0",":-B");
INSERT INTO ajax_chat_messages VALUES("287","0","admin","3","0","2013-03-20 14:14:20","\0\0",":-c");
INSERT INTO ajax_chat_messages VALUES("288","0","admin","3","0","2013-03-20 14:14:22","\0\0",":)]");
INSERT INTO ajax_chat_messages VALUES("289","0","admin","3","0","2013-03-20 14:15:30","\0\0","c)]");
INSERT INTO ajax_chat_messages VALUES("290","0","admin","3","0","2013-03-20 14:15:35","\0\0","~X(");
INSERT INTO ajax_chat_messages VALUES("291","0","admin","3","0","2013-03-20 14:15:57","\0\0","~x(");
INSERT INTO ajax_chat_messages VALUES("292","0","admin","3","0","2013-03-20 14:16:00","\0\0",":-h");
INSERT INTO ajax_chat_messages VALUES("293","0","admin","3","0","2013-03-20 14:16:04","\0\0",":-t");
INSERT INTO ajax_chat_messages VALUES("294","0","admin","3","0","2013-03-20 14:16:07","\0\0","8->");
INSERT INTO ajax_chat_messages VALUES("295","0","admin","3","0","2013-03-20 14:16:11","\0\0","I-)");
INSERT INTO ajax_chat_messages VALUES("296","0","admin","3","0","2013-03-20 14:16:14","\0\0","8-|");
INSERT INTO ajax_chat_messages VALUES("297","0","admin","3","0","2013-03-20 14:16:17","\0\0","L-)");
INSERT INTO ajax_chat_messages VALUES("298","0","admin","3","0","2013-03-20 14:16:20","\0\0",":-&");
INSERT INTO ajax_chat_messages VALUES("299","0","admin","3","0","2013-03-20 14:16:23","\0\0",":-$");
INSERT INTO ajax_chat_messages VALUES("300","0","admin","3","0","2013-03-20 14:16:26","\0\0","[-(");
INSERT INTO ajax_chat_messages VALUES("301","0","admin","3","0","2013-03-20 14:16:29","\0\0",":O)");
INSERT INTO ajax_chat_messages VALUES("302","0","admin","3","0","2013-03-20 14:16:31","\0\0","8-}");
INSERT INTO ajax_chat_messages VALUES("303","0","admin","3","0","2013-03-20 14:16:35","\0\0","<:-P");
INSERT INTO ajax_chat_messages VALUES("304","0","admin","3","0","2013-03-20 14:16:38","\0\0","({|");
INSERT INTO ajax_chat_messages VALUES("305","0","admin","3","0","2013-03-20 14:16:41","\0\0","=P~");
INSERT INTO ajax_chat_messages VALUES("306","0","admin","3","0","2013-03-20 14:16:42","\0\0",":-?");
INSERT INTO ajax_chat_messages VALUES("307","0","admin","3","0","2013-03-20 14:16:44","\0\0","#-o");
INSERT INTO ajax_chat_messages VALUES("308","0","admin","3","0","2013-03-20 14:16:46","\0\0","=D>");
INSERT INTO ajax_chat_messages VALUES("309","0","admin","3","0","2013-03-20 14:16:48","\0\0","@-)");
INSERT INTO ajax_chat_messages VALUES("310","0","admin","3","0","2013-03-20 14:16:51","\0\0",":-SS");
INSERT INTO ajax_chat_messages VALUES("311","0","admin","3","0","2013-03-20 14:17:07","\0\0",":-sS");
INSERT INTO ajax_chat_messages VALUES("312","0","admin","3","0","2013-03-20 14:17:10","\0\0",":^o");
INSERT INTO ajax_chat_messages VALUES("313","0","admin","3","0","2013-03-20 14:17:12","\0\0",":-w");
INSERT INTO ajax_chat_messages VALUES("314","0","admin","3","0","2013-03-20 14:17:13","\0\0",":-<");
INSERT INTO ajax_chat_messages VALUES("315","0","admin","3","0","2013-03-20 14:17:15","\0\0",">:P");
INSERT INTO ajax_chat_messages VALUES("316","0","admin","3","0","2013-03-20 14:17:30","\0\0",">:p");
INSERT INTO ajax_chat_messages VALUES("317","0","admin","3","0","2013-03-20 14:17:33","\0\0","<):)");
INSERT INTO ajax_chat_messages VALUES("318","0","admin","3","0","2013-03-20 14:17:52","\0\0","CB)");
INSERT INTO ajax_chat_messages VALUES("319","0","admin","3","0","2013-03-20 14:17:56","\0\0","X_X");
INSERT INTO ajax_chat_messages VALUES("320","0","admin","3","0","2013-03-20 14:18:02","\0\0",":!!");
INSERT INTO ajax_chat_messages VALUES("321","0","admin","3","0","2013-03-20 14:18:05","\0\0","m/");
INSERT INTO ajax_chat_messages VALUES("322","0","admin","3","0","2013-03-20 14:18:07","\0\0",":-q");
INSERT INTO ajax_chat_messages VALUES("323","0","admin","3","0","2013-03-20 14:18:10","\0\0",":-bd");
INSERT INTO ajax_chat_messages VALUES("324","0","admin","3","0","2013-03-20 14:18:11","\0\0","^#(^");
INSERT INTO ajax_chat_messages VALUES("325","0","admin","3","0","2013-03-20 14:18:13","\0\0",":ar!");
INSERT INTO ajax_chat_messages VALUES("326","0","admin","3","0","2013-03-20 14:18:32","\0\0",";>)");
INSERT INTO ajax_chat_messages VALUES("327","0","admin","3","0","2013-03-20 14:19:01","\0\0",";()");
INSERT INTO ajax_chat_messages VALUES("328","2147483647","ChatBot","4","0","2013-03-20 14:19:22","\0\0","/logout admin");
INSERT INTO ajax_chat_messages VALUES("329","2147483647","ChatBot","4","0","2013-03-20 14:26:54","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("330","2147483647","ChatBot","4","0","2013-03-20 14:26:58","\0\0","/logout admin");
INSERT INTO ajax_chat_messages VALUES("331","2147483647","ChatBot","4","0","2013-03-20 14:27:26","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("332","2147483647","ChatBot","4","0","2013-03-20 14:27:28","\0\0","/logout admin");
INSERT INTO ajax_chat_messages VALUES("333","2147483647","ChatBot","4","0","2013-03-20 14:32:19","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("334","2147483647","ChatBot","4","0","2013-03-20 14:32:21","\0\0","/logout admin");
INSERT INTO ajax_chat_messages VALUES("335","2147483647","ChatBot","4","0","2013-03-20 14:34:25","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("336","2147483647","ChatBot","4","0","2013-03-20 14:34:26","\0\0","/logout admin");
INSERT INTO ajax_chat_messages VALUES("337","2147483647","ChatBot","4","0","2013-03-20 14:43:21","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("338","2147483647","ChatBot","4","0","2013-03-20 14:43:23","\0\0","/logout admin");
INSERT INTO ajax_chat_messages VALUES("339","2147483647","ChatBot","4","0","2013-03-20 14:44:52","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("340","2147483647","ChatBot","4","0","2013-03-20 14:44:53","\0\0","/logout admin");
INSERT INTO ajax_chat_messages VALUES("341","2147483647","ChatBot","4","0","2013-03-20 14:48:14","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("342","2147483647","ChatBot","4","0","2013-03-20 14:48:16","\0\0","/logout admin");
INSERT INTO ajax_chat_messages VALUES("343","2147483647","ChatBot","4","0","2013-03-20 14:48:56","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("344","2147483647","ChatBot","4","0","2013-03-20 14:48:57","\0\0","/logout admin");
INSERT INTO ajax_chat_messages VALUES("345","2147483647","ChatBot","4","0","2013-03-20 14:51:00","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("346","2147483647","ChatBot","4","0","2013-03-20 14:51:02","\0\0","/logout admin");
INSERT INTO ajax_chat_messages VALUES("347","2147483647","ChatBot","4","0","2013-03-20 15:02:25","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("348","2147483647","ChatBot","4","0","2013-03-20 15:02:28","\0\0","/logout admin");
INSERT INTO ajax_chat_messages VALUES("349","2147483647","ChatBot","4","0","2013-03-20 15:02:33","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("350","2147483647","ChatBot","4","0","2013-03-20 15:02:43","\0\0","/logout admin");
INSERT INTO ajax_chat_messages VALUES("351","2147483647","ChatBot","4","0","2013-03-20 15:05:00","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("352","2147483647","ChatBot","4","0","2013-03-20 15:06:20","\0\0","/logout admin");
INSERT INTO ajax_chat_messages VALUES("353","2147483647","ChatBot","4","0","2013-03-20 17:36:31","\0\0","/login ngalt");
INSERT INTO ajax_chat_messages VALUES("354","2147483647","ChatBot","4","0","2013-03-20 17:44:03","\0\0","/logout ngalt");
INSERT INTO ajax_chat_messages VALUES("355","2147483647","ChatBot","4","0","2013-03-20 17:44:08","\0\0","/login ngalt");
INSERT INTO ajax_chat_messages VALUES("356","2147483647","ChatBot","4","0","2013-03-20 22:02:57","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("357","2147483647","ChatBot","4","0","2013-03-20 22:02:59","\0\0","/logout ngalt Timeout");
INSERT INTO ajax_chat_messages VALUES("358","2147483647","ChatBot","4","0","2013-03-20 22:03:06","\0\0","/logout admin");
INSERT INTO ajax_chat_messages VALUES("359","2147483647","ChatBot","4","0","2013-03-20 22:03:11","\0\0","/login ngalt");
INSERT INTO ajax_chat_messages VALUES("360","10","ngalt","0","0","2013-03-20 22:03:50","\0\0",">;D<");
INSERT INTO ajax_chat_messages VALUES("361","10","ngalt","0","0","2013-03-20 22:04:06","\0\0","#:;S");
INSERT INTO ajax_chat_messages VALUES("362","2147483647","ChatBot","4","0","2013-03-20 22:04:24","\0\0","/logout ngalt");
INSERT INTO ajax_chat_messages VALUES("363","2147483647","ChatBot","4","0","2013-03-21 16:02:56","\0\0","/login ngalt");
INSERT INTO ajax_chat_messages VALUES("364","2147483647","ChatBot","4","0","2013-03-21 16:03:19","\0\0","/logout ngalt");
INSERT INTO ajax_chat_messages VALUES("365","2147483647","ChatBot","4","0","2013-03-21 17:12:02","\0\0","/login ngalt");
INSERT INTO ajax_chat_messages VALUES("366","10","ngalt","0","0","2013-03-21 17:12:13","\0\0","[color=lime]rewerwer[/color]");
INSERT INTO ajax_chat_messages VALUES("367","10","ngalt","0","0","2013-03-21 17:12:29","\0\0",":x");
INSERT INTO ajax_chat_messages VALUES("368","2147483647","ChatBot","4","0","2013-03-21 17:12:45","\0\0","/roll ngalt 1d6 3");
INSERT INTO ajax_chat_messages VALUES("369","2147483647","ChatBot","4","0","2013-03-21 17:13:01","\0\0","/logout ngalt");
INSERT INTO ajax_chat_messages VALUES("370","2147483647","ChatBot","4","0","2013-03-23 17:08:02","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("371","0","admin","3","0","2013-03-23 17:08:22","\0\0",">;D<");
INSERT INTO ajax_chat_messages VALUES("372","2147483647","ChatBot","4","0","2013-03-23 17:08:39","\0\0","/logout admin");
INSERT INTO ajax_chat_messages VALUES("373","2147483647","ChatBot","4","0","2013-03-26 08:57:31","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("374","2147483647","ChatBot","4","0","2013-03-26 09:21:52","ï¿½ï¿½n","/logout admin Timeout");
INSERT INTO ajax_chat_messages VALUES("375","2147483647","ChatBot","4","0","2013-03-26 09:21:53","ï¿½ï¿½n","/login admin");
INSERT INTO ajax_chat_messages VALUES("376","0","admin","3","0","2013-03-26 09:22:10","ï¿½ï¿½n","[b][b]qfdfafaf[/b][/b]");
INSERT INTO ajax_chat_messages VALUES("377","0","admin","3","0","2013-03-26 09:22:17","ï¿½ï¿½n","affafa");
INSERT INTO ajax_chat_messages VALUES("378","0","admin","3","0","2013-03-26 09:22:22","ï¿½ï¿½n","[b]fafdfafa[/b]");
INSERT INTO ajax_chat_messages VALUES("379","0","admin","3","0","2013-03-26 09:22:37","ï¿½ï¿½n","[i]gsfgsfg[/i]");
INSERT INTO ajax_chat_messages VALUES("380","2147483647","ChatBot","4","0","2013-03-26 10:12:52","ï¿½ï¿½n","/login vinhdc");
INSERT INTO ajax_chat_messages VALUES("381","2147483647","ChatBot","4","0","2013-03-26 10:12:55","ï¿½ï¿½n","/logout admin Timeout");
INSERT INTO ajax_chat_messages VALUES("382","12","vinhdc","0","0","2013-03-26 10:13:49","ï¿½ï¿½n",":P");
INSERT INTO ajax_chat_messages VALUES("383","12","vinhdc","0","0","2013-03-26 10:13:55","ï¿½ï¿½n",":x");
INSERT INTO ajax_chat_messages VALUES("384","12","vinhdc","0","0","2013-03-26 10:14:10","ï¿½ï¿½n","[color=red]hehehe[/color]");
INSERT INTO ajax_chat_messages VALUES("385","12","vinhdc","0","0","2013-03-26 10:15:14","ï¿½ï¿½n","[url=http://dantri.com.vn][/url]");
INSERT INTO ajax_chat_messages VALUES("386","12","vinhdc","0","0","2013-03-26 10:15:34","ï¿½ï¿½n","[url=http://google.com][/url]");
INSERT INTO ajax_chat_messages VALUES("387","12","vinhdc","0","0","2013-03-26 10:38:30","ï¿½ï¿½n","hihi");
INSERT INTO ajax_chat_messages VALUES("388","12","vinhdc","0","0","2013-03-26 10:38:42","ï¿½ï¿½n","hihi");
INSERT INTO ajax_chat_messages VALUES("389","12","vinhdc","0","0","2013-03-26 10:38:57","ï¿½ï¿½n","hihi");
INSERT INTO ajax_chat_messages VALUES("390","2147483647","ChatBot","4","0","2013-03-26 10:39:05","ï¿½ï¿½n","/channelLeave vinhdc");
INSERT INTO ajax_chat_messages VALUES("391","2147483647","ChatBot","4","1","2013-03-26 10:39:05","ï¿½ï¿½n","/channelEnter vinhdc");
INSERT INTO ajax_chat_messages VALUES("392","12","vinhdc","0","1","2013-03-26 10:39:21","ï¿½ï¿½n","hihi");
INSERT INTO ajax_chat_messages VALUES("393","2147483647","ChatBot","4","1","2013-03-26 10:39:24","ï¿½ï¿½n","/logout vinhdc");
INSERT INTO ajax_chat_messages VALUES("394","2147483647","ChatBot","4","0","2013-03-26 10:39:36","ï¿½ï¿½n","/login admin");
INSERT INTO ajax_chat_messages VALUES("395","2147483647","ChatBot","4","1000000000","2013-03-26 10:39:43","ï¿½ï¿½n","/who admin");
INSERT INTO ajax_chat_messages VALUES("396","2147483647","ChatBot","4","1000000000","2013-03-26 10:39:45","ï¿½ï¿½n","/who admin");
INSERT INTO ajax_chat_messages VALUES("397","2147483647","ChatBot","4","1000000000","2013-03-26 10:39:50","ï¿½ï¿½n","/list CÃ´ng_cá»™ng RiÃªng_tÆ° [admin]");
INSERT INTO ajax_chat_messages VALUES("398","2147483647","ChatBot","4","1000000000","2013-03-26 10:39:54","ï¿½ï¿½n","/error MissingText");
INSERT INTO ajax_chat_messages VALUES("399","2147483647","ChatBot","4","1000000000","2013-03-26 10:40:01","ï¿½ï¿½n","/error MissingUserName");
INSERT INTO ajax_chat_messages VALUES("400","2147483647","ChatBot","4","0","2013-03-26 11:35:56","ï¿½ï¿½n","/channelLeave admin");
INSERT INTO ajax_chat_messages VALUES("401","2147483647","ChatBot","4","1","2013-03-26 11:35:56","ï¿½ï¿½n","/channelEnter admin");
INSERT INTO ajax_chat_messages VALUES("402","0","admin","3","1","2013-03-26 11:36:14","ï¿½ï¿½n","[b]chá»¯ Ä‘áº­m[/b]");
INSERT INTO ajax_chat_messages VALUES("403","0","admin","3","1","2013-03-26 11:36:29","ï¿½ï¿½n","[color=red]mÃ u chá»¯[/color]");
INSERT INTO ajax_chat_messages VALUES("404","2147483647","ChatBot","4","1","2013-04-09 14:12:30","\0\0","/logout admin Timeout");
INSERT INTO ajax_chat_messages VALUES("405","2147483647","ChatBot","4","0","2013-04-09 14:12:31","\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("406","2147483647","ChatBot","4","0","2013-04-09 17:23:18","\0\0","/logout admin");
INSERT INTO ajax_chat_messages VALUES("407","2147483647","ChatBot","4","0","2013-04-23 14:10:42","ï¿½ï¿½f","/login datnt");
INSERT INTO ajax_chat_messages VALUES("408","2147483647","ChatBot","4","1000000019","2013-04-23 14:10:52","ï¿½ï¿½f","/who datnt");
INSERT INTO ajax_chat_messages VALUES("409","2147483647","ChatBot","4","1000000019","2013-04-23 14:10:53","ï¿½ï¿½f","/who datnt");
INSERT INTO ajax_chat_messages VALUES("410","2147483647","ChatBot","4","1000000019","2013-04-23 14:10:55","ï¿½ï¿½f","/who datnt");
INSERT INTO ajax_chat_messages VALUES("411","2147483647","ChatBot","4","1000000019","2013-04-23 14:11:49","ï¿½ï¿½f","/list CÃ´ng_cá»™ng RiÃªng_tÆ°");
INSERT INTO ajax_chat_messages VALUES("412","2147483647","ChatBot","4","0","2013-04-23 14:12:03","ï¿½ï¿½f","/logout datnt");
INSERT INTO ajax_chat_messages VALUES("413","2147483647","ChatBot","4","0","2013-04-24 09:14:42","ï¿½ï¿½f","/login huunq");
INSERT INTO ajax_chat_messages VALUES("414","2147483647","ChatBot","4","0","2013-04-24 09:16:29","ï¿½ï¿½f","/login andt");
INSERT INTO ajax_chat_messages VALUES("415","7","andt","0","0","2013-04-24 09:16:39","ï¿½ï¿½f","alo pi caso");
INSERT INTO ajax_chat_messages VALUES("416","2147483647","ChatBot","4","1000000004","2013-04-24 09:16:51","ï¿½ï¿½f","/who andt huunq");
INSERT INTO ajax_chat_messages VALUES("417","4","huunq","0","0","2013-04-24 09:17:05","ï¿½ï¿½f",":x");
INSERT INTO ajax_chat_messages VALUES("418","4","huunq","0","0","2013-04-24 09:17:17","ï¿½ï¿½f",":-&");
INSERT INTO ajax_chat_messages VALUES("419","4","huunq","0","0","2013-04-24 09:17:33","ï¿½ï¿½f",":-sS");
INSERT INTO ajax_chat_messages VALUES("420","2147483647","ChatBot","4","0","2013-04-24 11:55:40","ï¿½ï¿½f","/logout andt Timeout");
INSERT INTO ajax_chat_messages VALUES("421","2147483647","ChatBot","4","0","2013-05-02 22:12:21","\0\0","/login hungdv");
INSERT INTO ajax_chat_messages VALUES("422","2147483647","ChatBot","4","0","2013-05-02 22:12:24","\0\0","/logout huunq Timeout");
INSERT INTO ajax_chat_messages VALUES("423","2147483647","ChatBot","4","0","2013-05-02 22:12:31","\0\0","/logout hungdv");
INSERT INTO ajax_chat_messages VALUES("424","2147483647","ChatBot","4","0","2013-05-20 16:03:42","\0\0","/login ngalt");
INSERT INTO ajax_chat_messages VALUES("425","2147483647","ChatBot","4","0","2013-05-20 16:04:00","\0\0","/logout ngalt");
INSERT INTO ajax_chat_messages VALUES("426","2147483647","ChatBot","4","0","2016-01-17 15:36:34","\0\0","/login vanthu");
INSERT INTO ajax_chat_messages VALUES("427","2147483647","ChatBot","4","0","2018-12-28 11:01:11","\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("428","2147483647","ChatBot","4","0","2018-12-28 11:01:13","\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0","/logout vanthu Timeout");
INSERT INTO ajax_chat_messages VALUES("429","2147483647","ChatBot","4","0","2018-12-28 11:01:20","\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0","/channelLeave admin");
INSERT INTO ajax_chat_messages VALUES("430","2147483647","ChatBot","4","1","2018-12-28 11:01:20","\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0","/channelEnter admin");
INSERT INTO ajax_chat_messages VALUES("431","2147483647","ChatBot","4","1000000000","2018-12-28 11:01:29","\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0","/who admin");
INSERT INTO ajax_chat_messages VALUES("432","2147483647","ChatBot","4","1","2018-12-28 11:01:48","\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0","/logout admin");
INSERT INTO ajax_chat_messages VALUES("433","2147483647","ChatBot","4","0","2018-12-28 11:01:59","\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0","/login admin");
INSERT INTO ajax_chat_messages VALUES("434","2147483647","ChatBot","4","0","2018-12-28 11:04:56","\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0","/logout admin");



DROP TABLE ajax_chat_online;

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




DROP TABLE doc_docreplys;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `doc_docreplys` AS (select `d`.`doc_id` AS `doc_id`,`d`.`docCat_id` AS `docCat_id`,`d`.`docField_id` AS `docField_id`,`d`.`docLevel_id` AS `docLevel_id`,`d`.`unit_name` AS `unit_name`,`d`.`doc_code` AS `doc_code`,`d`.`doc_num` AS `doc_num`,`d`.`doc_desc` AS `doc_desc`,`d`.`doc_note` AS `doc_note`,`d`.`doc_recevied` AS `doc_recevied`,`d`.`doc_limit_time` AS `doc_limit_time`,`d`.`doc_signed` AS `doc_signed`,`d`.`doc_moved` AS `doc_moved`,`d`.`signPer_id` AS `signPer_id`,`d`.`signObj_id` AS `signObj_id`,`d`.`secret_id` AS `secret_id`,`d`.`important_id` AS `important_id`,`d`.`doc_date` AS `doc_date`,`d`.`doc_sort` AS `doc_sort`,`d`.`doc_traned` AS `doc_traned`,`d`.`doc_replied` AS `doc_replied`,`d`.`doc_active` AS `doc_active`,`d`.`doc_file` AS `doc_file`,`d`.`doc_theodoi` AS `doc_theodoi`,`d`.`user_id` AS `user_id`,`d`.`input_per` AS `input_per`,`dr`.`docReply_id` AS `docReply_id`,`dr`.`doc_id` AS `DR_doc_id`,`dr`.`user_id` AS `DR_user_id`,`dr`.`department_id` AS `DR_department_id`,`dr`.`main_department` AS `DR_main_department`,`dr`.`process_per` AS `process_per`,`dr`.`docReply_active` AS `docReply_active`,`dr`.`docReply_traned` AS `docReply_traned`,`dr`.`process_level` AS `process_level`,`dr`.`coordinate_per` AS `coordinate_per`,`dr`.`recevie_per` AS `recevie_per`,`dr`.`coordinate_depart` AS `coordinate_depart`,`dr`.`docReply_numday` AS `docReply_numday`,`dr`.`docReply_limit_time` AS `docReply_limit_time` from (`tbl_docs` `d` join `tbl_docreplys` `dr` on((`d`.`doc_id` = `dr`.`doc_id`))));

INSERT INTO doc_docreplys VALUES("46","Công v?n","Xây d?ng","2","Phòng công ch?ng NN s? 2","02/CV-CC2","2","V?n b?n th? nghi?m s? 2","Giao ?/c Nguy?n Bá Vân ch? ??o.","2016-02-15","1970-01-01","2016-02-15","2016-02-16","Ng? Duy Hi?u","Giám ??c","1","1","2016-02-15","","1","1","4","1","1","31","40","1","46","31","0","0","0","1","0","0","0","37","0","","2013-01-01");
INSERT INTO doc_docreplys VALUES("47","Công v?n","Xây d?ng","1","Công ty QL và PT nhà HN","03/CV-QLPTNHN","1","V?n b?n th? nghi?m s? 3","Giao Phòng K? ho?ch k? thu?t gi?i quy?t, ban Tr? lý ph?i h?p.","2016-02-15","1970-01-01","2016-02-15","2016-02-16","Nguy?n H?u ??","Giám ??c","1","1","2016-02-15","","1","1","2","2","0","31","40","2","47","31","13","17","0","0","0","0","0","0","0","","2013-01-01");
INSERT INTO doc_docreplys VALUES("48","Công v?n","Xây d?ng","2","Phòng công ch?ng NN s? 3","04/CV-CC3","3","V?n b?n th? nghi?m s? 4","Giao ban tr? lý gi?i quy?t","2016-02-15","1970-01-01","2016-02-15","2016-02-16","Ph?m V?n Kh??ng","Phó giám ??c","1","1","2016-02-15","","1","1","2","2","1","31","40","3","48","31","0","13","0","0","0","0","0","0","0","","2016-02-19");
INSERT INTO doc_docreplys VALUES("46","Công v?n","Xây d?ng","2","Phòng công ch?ng NN s? 2","02/CV-CC2","2","V?n b?n th? nghi?m s? 2","Giao ?/c Nguy?n Bá Vân ch? ??o.","2016-02-15","1970-01-01","2016-02-15","2016-02-16","Ng? Duy Hi?u","Giám ??c","1","1","2016-02-15","","1","1","4","1","1","31","40","4","46","37","13","17","0","0","1","0","0","0","0","5","2016-02-24");
INSERT INTO doc_docreplys VALUES("46","Công v?n","Xây d?ng","2","Phòng công ch?ng NN s? 2","02/CV-CC2","2","V?n b?n th? nghi?m s? 2","Giao ?/c Nguy?n Bá Vân ch? ??o.","2016-02-15","1970-01-01","2016-02-15","2016-02-16","Ng? Duy Hi?u","Giám ??c","1","1","2016-02-15","","1","1","4","1","1","31","40","5","46","43","0","0","50","1","0","8","0","0","0","","2016-02-23");
INSERT INTO doc_docreplys VALUES("46","Công v?n","Xây d?ng","2","Phòng công ch?ng NN s? 2","02/CV-CC2","2","V?n b?n th? nghi?m s? 2","Giao ?/c Nguy?n Bá Vân ch? ??o.","2016-02-15","1970-01-01","2016-02-15","2016-02-16","Ng? Duy Hi?u","Giám ??c","1","1","2016-02-15","","1","1","4","1","1","31","40","7","46","31","0","17","0","0","1","0","0","0","0","","2016-02-29");
INSERT INTO doc_docreplys VALUES("46","Công v?n","Xây d?ng","2","Phòng công ch?ng NN s? 2","02/CV-CC2","2","V?n b?n th? nghi?m s? 2","Giao ?/c Nguy?n Bá Vân ch? ??o.","2016-02-15","1970-01-01","2016-02-15","2016-02-16","Ng? Duy Hi?u","Giám ??c","1","1","2016-02-15","","1","1","4","1","1","31","40","8","46","43","0","0","50","0","0","8","0","0","0","","2016-02-26");



DROP TABLE doc_late_cv;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `doc_late_cv` AS (select `d`.`doc_id` AS `doc_id`,`d`.`docCat_id` AS `docCat_id`,`d`.`docField_id` AS `docField_id`,`d`.`docLevel_id` AS `docLevel_id`,`d`.`unit_name` AS `unit_name`,`d`.`doc_code` AS `doc_code`,`d`.`doc_num` AS `doc_num`,`d`.`doc_desc` AS `doc_desc`,`d`.`doc_note` AS `doc_note`,`d`.`doc_note_date` AS `doc_note_date`,`d`.`doc_recevied` AS `doc_recevied`,`d`.`doc_limit_time` AS `doc_limit_time`,`d`.`doc_signed` AS `doc_signed`,`d`.`doc_moved` AS `doc_moved`,`d`.`signPer_id` AS `signPer_id`,`d`.`signObj_id` AS `signObj_id`,`d`.`secret_id` AS `secret_id`,`d`.`important_id` AS `important_id`,`d`.`doc_date` AS `doc_date`,`d`.`doc_sort` AS `doc_sort`,`d`.`doc_traned` AS `doc_traned`,`d`.`doc_replied` AS `doc_replied`,`d`.`doc_active` AS `doc_active`,`d`.`doc_theodoi` AS `doc_theodoi`,`d`.`doc_file` AS `doc_file`,`d`.`user_id` AS `user_id`,`d`.`input_per` AS `input_per`,`dr`.`docReply_id` AS `docReply_id`,`dr`.`doc_id` AS `DR_doc_id`,`dr`.`user_id` AS `DR_user_id`,`dr`.`department_id` AS `DR_department_id`,`dr`.`main_department` AS `DR_main_department`,`dr`.`process_per` AS `process_per`,`dr`.`docReply_active` AS `docReply_active`,`dr`.`docReply_traned` AS `docReply_traned`,`dr`.`process_level` AS `process_level`,`dr`.`coordinate_per` AS `coordinate_per`,`dr`.`recevie_per` AS `recevie_per`,`dr`.`docReply_date` AS `DR_docReply_date`,`dr`.`docReply_numday` AS `docReply_numday`,`dr`.`docReply_limit_time` AS `docReply_limit_time` from (`tbl_docs` `d` join `tbl_docreplys` `dr` on(((`d`.`doc_id` = `dr`.`doc_id`) and (`dr`.`process_per` <> 0)))) group by `d`.`doc_id`);

INSERT INTO doc_late_cv VALUES("46","Công v?n","Xây d?ng","2","Phòng công ch?ng NN s? 2","02/CV-CC2","2","V?n b?n th? nghi?m s? 2","Giao ?/c Nguy?n Bá Vân ch? ??o.","2016-02-17","2016-02-15","1970-01-01","2016-02-15","2016-02-16","Ng? Duy Hi?u","Giám ??c","1","1","2016-02-15","","1","1","4","1","1","31","40","5","46","43","0","0","50","1","0","8","0","0","2016-02-17","","2016-02-23");



DROP TABLE doc_latereport;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `doc_latereport` AS (select `d`.`doc_id` AS `doc_id`,`d`.`docCat_id` AS `docCat_id`,`d`.`docField_id` AS `docField_id`,`d`.`docLevel_id` AS `docLevel_id`,`d`.`unit_name` AS `unit_name`,`d`.`doc_code` AS `doc_code`,`d`.`doc_num` AS `doc_num`,`d`.`doc_desc` AS `doc_desc`,`d`.`doc_note` AS `doc_note`,`d`.`doc_note_date` AS `doc_note_date`,`d`.`doc_recevied` AS `doc_recevied`,`d`.`doc_limit_time` AS `doc_limit_time`,`d`.`doc_signed` AS `doc_signed`,`d`.`doc_moved` AS `doc_moved`,`d`.`signPer_id` AS `signPer_id`,`d`.`signObj_id` AS `signObj_id`,`d`.`secret_id` AS `secret_id`,`d`.`important_id` AS `important_id`,`d`.`doc_date` AS `doc_date`,`d`.`doc_sort` AS `doc_sort`,`d`.`doc_traned` AS `doc_traned`,`d`.`doc_replied` AS `doc_replied`,`d`.`doc_active` AS `doc_active`,`d`.`doc_theodoi` AS `doc_theodoi`,`d`.`doc_file` AS `doc_file`,`d`.`user_id` AS `user_id`,`d`.`input_per` AS `input_per`,`dr`.`docReply_id` AS `docReply_id`,`dr`.`doc_id` AS `DR_doc_id`,`dr`.`user_id` AS `DR_user_id`,`dr`.`department_id` AS `DR_department_id`,`dr`.`main_department` AS `DR_main_department`,`dr`.`process_per` AS `process_per`,`dr`.`docReply_active` AS `docReply_active`,`dr`.`docReply_traned` AS `docReply_traned`,`dr`.`process_level` AS `process_level`,`dr`.`coordinate_per` AS `coordinate_per`,`dr`.`recevie_per` AS `recevie_per`,`dr`.`docReply_date` AS `DR_docReply_date`,`dr`.`docReply_numday` AS `docReply_numday`,`dr`.`docReply_limit_time` AS `docReply_limit_time` from (`tbl_docs` `d` join `tbl_docreplys` `dr` on(((`d`.`doc_id` = `dr`.`doc_id`) and (`dr`.`main_department` <> 0)))) group by `d`.`doc_id`);

INSERT INTO doc_latereport VALUES("46","Công v?n","Xây d?ng","2","Phòng công ch?ng NN s? 2","02/CV-CC2","2","V?n b?n th? nghi?m s? 2","Giao ?/c Nguy?n Bá Vân ch? ??o.","2016-02-17","2016-02-15","1970-01-01","2016-02-15","2016-02-16","Ng? Duy Hi?u","Giám ??c","1","1","2016-02-15","","1","1","4","1","1","31","40","4","46","37","13","17","0","0","1","0","0","0","2016-02-17","5","2016-02-24");
INSERT INTO doc_latereport VALUES("47","Công v?n","Xây d?ng","1","Công ty QL và PT nhà HN","03/CV-QLPTNHN","1","V?n b?n th? nghi?m s? 3","Giao Phòng K? ho?ch k? thu?t gi?i quy?t, ban Tr? lý ph?i h?p.","","2016-02-15","1970-01-01","2016-02-15","2016-02-16","Nguy?n H?u ??","Giám ??c","1","1","2016-02-15","","1","1","2","0","2","31","40","2","47","31","13","17","0","0","0","0","0","0","2016-02-17","","2013-01-01");
INSERT INTO doc_latereport VALUES("48","Công v?n","Xây d?ng","2","Phòng công ch?ng NN s? 3","04/CV-CC3","3","V?n b?n th? nghi?m s? 4","Giao ban tr? lý gi?i quy?t","","2016-02-15","1970-01-01","2016-02-15","2016-02-16","Ph?m V?n Kh??ng","Phó giám ??c","1","1","2016-02-15","","1","1","2","1","2","31","40","3","48","31","0","13","0","0","0","0","0","0","2016-02-17","","2016-02-19");



DROP TABLE doc_receive;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `doc_receive` AS (select `d`.`doc_id` AS `doc_id`,`d`.`docCat_id` AS `docCat_id`,`d`.`docField_id` AS `docField_id`,`d`.`doc_unit` AS `doc_unit`,`d`.`department_id` AS `department_id`,`d`.`doc_code` AS `doc_code`,`d`.`doc_desc` AS `doc_desc`,`d`.`doc_direct` AS `doc_direct`,`d`.`doc_note` AS `doc_note`,`d`.`doc_signed` AS `doc_signed`,`d`.`signPer_id` AS `signPer_id`,`d`.`important_id` AS `important_id`,`d`.`doc_date` AS `doc_date`,`d`.`doc_limit_time` AS `doc_limit_time`,`d`.`doc_sort` AS `doc_sort`,`d`.`doc_active` AS `doc_active`,`d`.`doc_file` AS `doc_file`,`d`.`user_id` AS `user_id`,`r`.`receive_id` AS `receive_id`,`r`.`doc_id` AS `R_doc_id`,`r`.`department_id` AS `R_department_id`,`r`.`receive_per` AS `receive_per`,`r`.`receive_note` AS `receive_note`,`r`.`receive_time` AS `receive_time`,`r`.`read_status` AS `read_status`,`r`.`read_time` AS `read_time`,`r`.`read_per` AS `read_per` from (`tbl_vbs` `d` join `tbl_receives` `r` on((`d`.`doc_id` = `r`.`doc_id`))));

INSERT INTO doc_receive VALUES("1","Công v?n","Xây d?ng","","17","234/CV-UBND","V? vi?c tri?n khai công trình thu?c d? án Xây d?ng c? b?n...","Chuy?n Ban QLDA1","","2015-11-23 00:00:00","Nguy?n Phúc Quang","1","2016-01-17 10:13:00","","0","2","2","1","1","1","17","0","","2016-01-17 10:01:13","0","","0");
INSERT INTO doc_receive VALUES("1","Công v?n","Xây d?ng","","17","234/CV-UBND","V? vi?c tri?n khai công trình thu?c d? án Xây d?ng c? b?n...","Chuy?n Ban QLDA1","","2015-11-23 00:00:00","Nguy?n Phúc Quang","1","2016-01-17 10:13:00","","0","2","2","1","2","1","23","0","","2016-01-17 10:01:13","0","","0");



DROP TABLE doc_reports;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `doc_reports` AS select `d`.`doc_id` AS `doc_id`,`d`.`docCat_id` AS `docCat_id`,`d`.`docField_id` AS `docField_id`,`d`.`docLevel_id` AS `docLevel_id`,`d`.`unit_name` AS `unit_name`,`d`.`doc_code` AS `doc_code`,`d`.`doc_num` AS `doc_num`,`d`.`doc_desc` AS `doc_desc`,`d`.`doc_note` AS `doc_note`,`d`.`doc_note_date` AS `doc_note_date`,`d`.`doc_recevied` AS `doc_recevied`,`d`.`doc_limit_time` AS `doc_limit_time`,`d`.`doc_signed` AS `doc_signed`,`d`.`doc_moved` AS `doc_moved`,`d`.`signPer_id` AS `signPer_id`,`d`.`signObj_id` AS `signObj_id`,`d`.`secret_id` AS `secret_id`,`d`.`important_id` AS `important_id`,`d`.`doc_date` AS `doc_date`,`d`.`doc_sort` AS `doc_sort`,`d`.`doc_traned` AS `doc_traned`,`d`.`doc_replied` AS `doc_replied`,`d`.`doc_active` AS `doc_active`,`d`.`doc_theodoi` AS `doc_theodoi`,`d`.`doc_file` AS `doc_file`,`d`.`user_id` AS `user_id`,`d`.`input_per` AS `input_per`,`dr`.`docReply_id` AS `docReply_id`,`dr`.`doc_id` AS `DR_doc_id`,`dr`.`user_id` AS `DR_user_id`,`dr`.`department_id` AS `DR_department_id`,`dr`.`main_department` AS `DR_main_department`,`dr`.`process_per` AS `process_per`,`dr`.`docReply_active` AS `docReply_active`,`dr`.`docReply_traned` AS `docReply_traned`,`dr`.`process_level` AS `process_level`,`dr`.`coordinate_per` AS `coordinate_per`,`dr`.`recevie_per` AS `recevie_per`,`dr`.`docReply_date` AS `DR_docReply_date`,`dr`.`docReply_numday` AS `docReply_numday`,`dr`.`docReply_limit_time` AS `docReply_limit_time` from (`tbl_docs` `d` join `tbl_docreplys` `dr` on((`d`.`doc_id` = `dr`.`doc_id`))) group by `d`.`doc_id`;

INSERT INTO doc_reports VALUES("46","Công v?n","Xây d?ng","2","Phòng công ch?ng NN s? 2","02/CV-CC2","2","V?n b?n th? nghi?m s? 2","Giao ?/c Nguy?n Bá Vân ch? ??o.","2016-02-17","2016-02-15","1970-01-01","2016-02-15","2016-02-16","Ng? Duy Hi?u","Giám ??c","1","1","2016-02-15","","1","1","4","1","1","31","40","1","46","31","0","0","0","1","0","0","0","37","2016-02-16","","2013-01-01");
INSERT INTO doc_reports VALUES("47","Công v?n","Xây d?ng","1","Công ty QL và PT nhà HN","03/CV-QLPTNHN","1","V?n b?n th? nghi?m s? 3","Giao Phòng K? ho?ch k? thu?t gi?i quy?t, ban Tr? lý ph?i h?p.","","2016-02-15","1970-01-01","2016-02-15","2016-02-16","Nguy?n H?u ??","Giám ??c","1","1","2016-02-15","","1","1","2","0","2","31","40","2","47","31","13","17","0","0","0","0","0","0","2016-02-17","","2013-01-01");
INSERT INTO doc_reports VALUES("48","Công v?n","Xây d?ng","2","Phòng công ch?ng NN s? 3","04/CV-CC3","3","V?n b?n th? nghi?m s? 4","Giao ban tr? lý gi?i quy?t","","2016-02-15","1970-01-01","2016-02-15","2016-02-16","Ph?m V?n Kh??ng","Phó giám ??c","1","1","2016-02-15","","1","1","2","1","2","31","40","3","48","31","0","13","0","0","0","0","0","0","2016-02-17","","2016-02-19");



DROP TABLE doc_users;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `doc_users` AS select `d`.`doc_id` AS `doc_id`,`d`.`docCat_id` AS `docCat_id`,`d`.`docField_id` AS `docField_id`,`d`.`docLevel_id` AS `docLevel_id`,`d`.`unit_name` AS `unit_name`,`d`.`doc_code` AS `doc_code`,`d`.`doc_num` AS `doc_num`,`d`.`doc_desc` AS `doc_desc`,`d`.`doc_note` AS `doc_note`,`d`.`doc_recevied` AS `doc_recevied`,`d`.`doc_limit_time` AS `doc_limit_time`,`d`.`doc_signed` AS `doc_signed`,`d`.`doc_moved` AS `doc_moved`,`d`.`signPer_id` AS `signPer_id`,`d`.`signObj_id` AS `signObj_id`,`d`.`secret_id` AS `secret_id`,`d`.`important_id` AS `important_id`,`d`.`doc_date` AS `doc_date`,`d`.`doc_sort` AS `doc_sort`,`d`.`doc_traned` AS `doc_traned`,`d`.`doc_replied` AS `doc_replied`,`d`.`doc_active` AS `doc_active`,`d`.`doc_file` AS `doc_file`,`d`.`user_id` AS `user_id`,`d`.`input_per` AS `input_per`,`u`.`user_fullname` AS `user_fullname`,`u`.`object_id` AS `object_id` from (`tbl_docs` `d` join `tbl_users` `u` on((`d`.`user_id` = `u`.`user_id`)));

INSERT INTO doc_users VALUES("46","Công v?n","Xây d?ng","2","Phòng công ch?ng NN s? 2","02/CV-CC2","2","V?n b?n th? nghi?m s? 2","Giao ?/c Nguy?n Bá Vân ch? ??o.","2016-02-15","1970-01-01","2016-02-15","2016-02-16","Ng? Duy Hi?u","Giám ??c","1","1","2016-02-15","","1","1","4","1","31","40","Nguy?n V?n Thanh","1");
INSERT INTO doc_users VALUES("47","Công v?n","Xây d?ng","1","Công ty QL và PT nhà HN","03/CV-QLPTNHN","1","V?n b?n th? nghi?m s? 3","Giao Phòng K? ho?ch k? thu?t gi?i quy?t, ban Tr? lý ph?i h?p.","2016-02-15","1970-01-01","2016-02-15","2016-02-16","Nguy?n H?u ??","Giám ??c","1","1","2016-02-15","","1","1","2","2","31","40","Nguy?n V?n Thanh","1");
INSERT INTO doc_users VALUES("48","Công v?n","Xây d?ng","2","Phòng công ch?ng NN s? 3","04/CV-CC3","3","V?n b?n th? nghi?m s? 4","Giao ban tr? lý gi?i quy?t","2016-02-15","1970-01-01","2016-02-15","2016-02-16","Ph?m V?n Kh??ng","Phó giám ??c","1","1","2016-02-15","","1","1","2","2","31","40","Nguy?n V?n Thanh","1");
INSERT INTO doc_users VALUES("49","Công v?n","Xây d?ng","2","Phòng công ch?ng NN s? 4","05/CV-CC4","4","V?n b?n th? nghi?m s? 5","G?i phòng K? ho?ch k? thu?t lên ph??ng án gi?i quy?t","2016-02-15","1970-01-01","2016-02-15","2016-02-16","V? H?ng Khanh","Giám ??c","1","1","2016-02-15","","1","2","2","2","31","40","Nguy?n V?n Thanh","1");



DROP TABLE tbl_addusers;

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




DROP TABLE tbl_baotris;

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




DROP TABLE tbl_config;

CREATE TABLE `tbl_config` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_name` varchar(255) DEFAULT NULL,
  `owner_add` varchar(255) DEFAULT NULL,
  `owner_phone` varchar(255) DEFAULT NULL,
  `owner_fax` varchar(255) DEFAULT NULL,
  `owner_email` varchar(255) DEFAULT NULL,
  `owner_reemail` varchar(255) DEFAULT NULL,
  `owner_url` varchar(255) DEFAULT NULL,
  `luong_coban` int(11) DEFAULT NULL,
  `luong_apdung` tinyint(4) DEFAULT NULL COMMENT '1. doang nghiep, 2. nha nuoc',
  `ngay_macdinh` date DEFAULT NULL COMMENT 'duoc su dung khi han xu ly bo trong',
  `sat_ra` tinyint(4) DEFAULT NULL,
  `sun_ra` tinyint(4) DEFAULT NULL,
  `site_port` varchar(50) DEFAULT NULL,
  `site_active` tinyint(1) DEFAULT NULL,
  `site_inactive_info` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO tbl_config VALUES("1","T?p ?oàn MEKONG","T?ng 5, tòa nhà 21 T2, d? án Hapulico Complex, s? 1 Nguy?n Huy T??ng , Thanh Xuân Trung, Thanh Xuân, Hà N?i","(84-4)35584167","(84-4)35584201","info@mekong.net","","Mekong Group","2000000","","2018-12-30","2","2","COM5","","");



DROP TABLE tbl_cv_cats;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO tbl_cv_cats VALUES("1","Th? nghi?m 1","Th? nghi?m 1","0","2016-02-19","0","1","31");
INSERT INTO tbl_cv_cats VALUES("2","Tri?n khai ph?n m?m qu?n lý v?n phòng ?i?n t?","Tri?n khai ph?n m?m qu?n lý v?n phòng ?i?n t? trong ??u n?m 2019","0","2018-12-17","0","1","31");



DROP TABLE tbl_cv_files;

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




DROP TABLE tbl_cv_giamsat;

CREATE TABLE `tbl_cv_giamsat` (
  `cv_giamsat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cv_cat_id` int(11) DEFAULT NULL COMMENT 'khoa ngoai',
  `user_id` int(11) DEFAULT NULL COMMENT 'khoa ngoai pgd',
  `cv_giamsat_date` date DEFAULT NULL COMMENT 'ngay tao',
  PRIMARY KEY (`cv_giamsat_id`),
  KEY `FK_tbl_cv_subs` (`cv_cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO tbl_cv_giamsat VALUES("1","1","37","");
INSERT INTO tbl_cv_giamsat VALUES("2","1","38","");



DROP TABLE tbl_cv_indexs;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO tbl_cv_indexs VALUES("1","5","48","","","2018-12-17","0","0","42");
INSERT INTO tbl_cv_indexs VALUES("2","3","55","","","2018-12-17","0","0","41");
INSERT INTO tbl_cv_indexs VALUES("3","5","51","","","2018-12-17","0","0","42");
INSERT INTO tbl_cv_indexs VALUES("4","5","52","","","2018-12-17","0","0","42");



DROP TABLE tbl_cv_logs;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO tbl_cv_logs VALUES("1","1","","Tri?n khai ph?n ch?c n?ng công viêc","X? lý các công vi?c ???c giao","","0","0","42");
INSERT INTO tbl_cv_logs VALUES("2","1","","Tri?n khai ph?n ch?c n?ng L?ch làm vi?c cá nhân","??t l?ch làm vi?c trong 1 tu?n","","0","0","42");



DROP TABLE tbl_cv_phoihop;

CREATE TABLE `tbl_cv_phoihop` (
  `cv_phoihop_id` int(11) NOT NULL AUTO_INCREMENT,
  `cv_cat_id` int(11) DEFAULT NULL COMMENT 'khoa ngoai',
  `department_id` int(11) DEFAULT NULL COMMENT 'khoa ngoai phong',
  `cv_phoihop_date` date DEFAULT NULL COMMENT 'ngay tao',
  PRIMARY KEY (`cv_phoihop_id`),
  KEY `FK_tbl_cv_subs` (`cv_cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO tbl_cv_phoihop VALUES("1","1","13","2016-02-24");
INSERT INTO tbl_cv_phoihop VALUES("2","1","18","2016-02-24");



DROP TABLE tbl_cv_subs;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO tbl_cv_subs VALUES("1","1","16","Nhánh vi?c 1","undefined","2016-02-24","2016-02-24","0","0","31");
INSERT INTO tbl_cv_subs VALUES("2","1","17","Nhánh vi?c 1","undefined","2016-02-24","2016-02-24","0","0","31");
INSERT INTO tbl_cv_subs VALUES("3","2","13","Tri?n khai giai ?o?n 1","Các phòng ban tr?c thu?c","2018-12-28","2018-12-17","0","0","31");
INSERT INTO tbl_cv_subs VALUES("4","2","14","Tri?n khai giai ?o?n 1","Các phòng ban tr?c thu?c","2018-12-28","2018-12-17","0","0","31");
INSERT INTO tbl_cv_subs VALUES("5","2","15","Tri?n khai giai ?o?n 1","Các phòng ban tr?c thu?c","2018-12-28","2018-12-17","0","0","31");
INSERT INTO tbl_cv_subs VALUES("6","2","16","Tri?n khai giai ?o?n 1","Các phòng ban tr?c thu?c","2018-12-28","2018-12-17","0","0","31");
INSERT INTO tbl_cv_subs VALUES("7","2","17","Tri?n khai giai ?o?n 1","Các phòng ban tr?c thu?c","2018-12-28","2018-12-17","0","0","31");
INSERT INTO tbl_cv_subs VALUES("8","2","18","Tri?n khai giai ?o?n 1","Các phòng ban tr?c thu?c","2018-12-28","2018-12-17","0","0","31");



DROP TABLE tbl_departments;

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

INSERT INTO tbl_departments VALUES("12","Ban giám ??c","Ban giam doc","BG?","","2015-11-20 00:00:00","","3","1","");
INSERT INTO tbl_departments VALUES("13","Ban Tr? lý","Ban Tro ly","TLTK","","2015-11-20 00:00:00","0","3","1","");
INSERT INTO tbl_departments VALUES("14","Phòng T? ch?c - Lao ??ng - Ti?n l??ng","Phong To chuc  Lao dong  Tien luong","TCL?TL","","2015-11-20 00:00:00","0","3","1","");
INSERT INTO tbl_departments VALUES("15","Phòng Hành chính qu?n tr?","Phong Hanh chinh quan tri","HCQT","","2015-11-20 00:00:00","0","3","1","");
INSERT INTO tbl_departments VALUES("16","Phòng Tài chính k? toán","Phong Tai chinh ke toan","TCKT","","2015-11-20 00:00:00","0","3","1","");
INSERT INTO tbl_departments VALUES("17","Phòng K? ho?ch k? thu?t","Phong Ke hoach ky thuat","KHKT","","2015-11-20 00:00:00","0","3","1","");
INSERT INTO tbl_departments VALUES("18","Phòng Kinh doanh","Phong Kinh doanh","KD","","2015-11-20 00:00:00","0","3","1","");
INSERT INTO tbl_departments VALUES("19","Xí nghi?p xây l?p s? 1","Xi nghiep xay lap so 1","XNXL1","","2015-11-20 00:00:00","0","3","1","");
INSERT INTO tbl_departments VALUES("20","Xí nghi?p xây l?p s? 2","Xi nghiep xay lap so 2","XNXL2","","2015-11-20 00:00:00","0","3","1","");
INSERT INTO tbl_departments VALUES("21","Xí nghi?p VTXM","Xi nghiep VTXM","VTXM","","2015-11-20 00:00:00","0","3","1","");
INSERT INTO tbl_departments VALUES("22","Xí nghi?p ?N","Xi nghiep DN","?N","","2015-11-20 00:00:00","0","3","1","");
INSERT INTO tbl_departments VALUES("23","Xí nghi?p DV Hacinco","Xi nghiep DV Hacinco","DVHACINCO","","2015-11-20 00:00:00","0","3","1","");
INSERT INTO tbl_departments VALUES("24","Xí nghi?p DV","Xi nghiep DV","DVKDN","","2015-11-20 00:00:00","0","3","1","");
INSERT INTO tbl_departments VALUES("25","KSTT","KSTT","KSTT","","2015-11-20 00:00:00","0","3","1","");
INSERT INTO tbl_departments VALUES("26","Ban Qu?n lý d? án 1","Ban Quan ly du an 1","QLDA1","","2015-11-20 00:00:00","0","3","1","");
INSERT INTO tbl_departments VALUES("27","Ban Qu?n lý d? án 2","Ban Quan ly du an 2","QLDA2","","2015-11-20 00:00:00","0","3","1","");
INSERT INTO tbl_departments VALUES("28","Ban ?i?u hành d? án nhà Thành ?y","Ban Dieu hanh du an nha Thanh uy","?HNTU","","2015-11-20 00:00:00","0","3","1","");



DROP TABLE tbl_dlfiles;

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

INSERT INTO tbl_dlfiles VALUES("1","2","Ch??ng I","../kdl_uploads_2013/6a9c50c768c6aced12e798ec96df824a.png","2013-03-24","","","14");
INSERT INTO tbl_dlfiles VALUES("2","2","Ch??ng II","../kdl_uploads_2013/c6f8592cb23b3356e3af6c6ea28cfdb2.jpg","2013-03-24","","","14");
INSERT INTO tbl_dlfiles VALUES("4","2","Ch??ng III","../kdl_uploads_2013/43e5d0817b23d0bfacd3e1a37dd29e27.jpg","2013-03-24","","1","14");



DROP TABLE tbl_dlkhos;

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

INSERT INTO tbl_dlkhos VALUES("1","0","V?n hóa công s?","Van hoa cong so","1","2013-03-24","","1","14");
INSERT INTO tbl_dlkhos VALUES("2","0","Ti?ng Anh giao ti?p","Tieng Anh giao tiep","1","2013-03-24","","1","14");
INSERT INTO tbl_dlkhos VALUES("3","0","Tin h?c v?n phòng","Tin hoc van phong","1","2013-03-24","","1","14");
INSERT INTO tbl_dlkhos VALUES("4","","Qu?n lý công vi?c cá nhân","Quan ly cong viec ca nhan","1","2018-12-17","","1","1");
INSERT INTO tbl_dlkhos VALUES("5","1","Ki?n th?c qu?n lý hành chính","Kien thuc quan ly hanh chinh","2","2013-03-24","","1","14");
INSERT INTO tbl_dlkhos VALUES("6","1","Ki?n th?c qu?n lý nhân s?","Kien thuc quan ly nhan su","2","2013-03-24","","1","14");
INSERT INTO tbl_dlkhos VALUES("7","1","Ki?n th?c t? ch?c h?i th?o, s? ki?n","Kien thuc to chuc hoi thao, su kien","2","2013-03-24","","1","14");
INSERT INTO tbl_dlkhos VALUES("8","1","K? n?ng ?i?u hành cu?c h?p","Ky nang dieu hanh cuoc hop","2","2013-03-24","","1","14");
INSERT INTO tbl_dlkhos VALUES("9","0","Các m?u báo cáo","Cac mau bao cao","3","2013-03-24","","1","14");



DROP TABLE tbl_dls;

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

INSERT INTO tbl_dls VALUES("1","4","Làm vi?c có k? ho?ch","??nh ngh?a k? ho?ch làm vi?c, h??ng d?n cách l?p k? ho?ch và qu?n lý k? ho?ch","2013-03-26","","1","2","16");
INSERT INTO tbl_dls VALUES("2","4","Cách s?p x?p kho d? li?u cá nhân","H??ng d?n b?n cách s?p x?p d? li?u s? sách, gi?y t?, d? li?u máy tính","2018-12-17","","1","1","1");
INSERT INTO tbl_dls VALUES("3","2","Basic","Ti?ng Anh b?ng A","2013-03-26","","1","2","16");
INSERT INTO tbl_dls VALUES("4","2","Inter-Pre","Ti?ng Anh b?ng B","2013-03-24","","1","2","14");
INSERT INTO tbl_dls VALUES("5","3","Computer Fundamental (CF)","C? b?n v? máy tính","2013-03-24","","1","2","14");
INSERT INTO tbl_dls VALUES("6","3","Offices, Typing (OT)","B? ph?n m?m v?n phòng: Word, Excel, Outlook Express, Power Point, Access","2013-03-24","","1","2","14");
INSERT INTO tbl_dls VALUES("7","3","Internet, Email, Cheating (IEC)","M?ng, ph??ng phát khai thác d? li?u m?ng, Th? ?i?n t?, Chat","2013-03-24","","1","2","14");
INSERT INTO tbl_dls VALUES("8","4","qu?n lý h? s? nhân viên k? thu?t","t? ch?c ki?m tra ?ánh giá l?i toàn b? quá trình làm vi?c","2013-03-26","","1","2","16");
INSERT INTO tbl_dls VALUES("9","5","k? toán t?ng h?p","th?ng kê tính toán thu chi theo tháng, theo quý","2013-03-26","","1","2","16");
INSERT INTO tbl_dls VALUES("10","5","qu?n lý hành chính trong quý 4","th?ng kê tình hình tài chính trong quý 4 n?m 2012","2013-03-26","","1","2","16");
INSERT INTO tbl_dls VALUES("11","5","l?p k? ho?ch tài chính trong n?m 2013","l?p k? ho?ch thu chi trong 4 quý trong n?m 2013","2013-03-26","","1","2","16");
INSERT INTO tbl_dls VALUES("12","5","l?p k? ho?ch tài chính trong n?m 2013","l?p k? ho?ch thu chi trong 4 quý trong n?m 2013","2013-03-26","","1","2","16");
INSERT INTO tbl_dls VALUES("13","6","qu?n lý nhân s? theo nhóm","tình hìn qu?n lý nhân s? trong nh?ng n?m t?i","2013-03-26","","1","2","16");
INSERT INTO tbl_dls VALUES("14","6","qu?n lý nhân s? theo nhóm","tình hìn qu?n lý nhân s? trong nh?ng n?m t?i","2013-03-26","","1","2","16");
INSERT INTO tbl_dls VALUES("15","7","h?i th?o trong tháng 4-2012","t? ch?c hôi th?o trong tháng 4 t?i hà n?i và TP H? Chí Minh","2013-03-26","","1","2","16");
INSERT INTO tbl_dls VALUES("16","9","báo cáo v? tình hình tài chính","t? ch?c báo cáo tình tình tài chính, chuy?n k?t qu? lên lãnh ??o","2013-03-26","","1","2","16");
INSERT INTO tbl_dls VALUES("17","9","báo cáo v? tình hình tài chính","t? ch?c báo cáo tình tình tài chính, chuy?n k?t qu? lên lãnh ??o","2013-03-26","","1","2","16");
INSERT INTO tbl_dls VALUES("18","9","báo cáo m?i","mô t? v? báo cáo m?i","2013-03-26","","1","2","16");
INSERT INTO tbl_dls VALUES("19","1","v?n hóa công s?","t? ch?c các h?i th?o,cu?c thi v? v?n hóa công s?","2013-03-26","","1","2","16");



DROP TABLE tbl_doccats;

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

INSERT INTO tbl_doccats VALUES("1","Công v?n","Congvan","CV","0","0","0","1","1","","2012-10-01 00:00:00","0","1","0");
INSERT INTO tbl_doccats VALUES("2","Quy?t ??nh","Quyetdinh","Q?","0","0","1","2","1","","2012-10-01 00:00:00","0","1","0");
INSERT INTO tbl_doccats VALUES("3","Thông báo","Thongbao","TB","0","0","1","1","1","","2012-10-01 00:00:00","0","1","0");
INSERT INTO tbl_doccats VALUES("4","Gi?y m?i","Giaymoi","GM","1","1","1","1","1","","2012-10-01 00:00:00","0","1","0");
INSERT INTO tbl_doccats VALUES("5","T? trình","Totrinh","TTr","0","0","1","1","1","","2012-10-01 00:00:00","0","1","0");
INSERT INTO tbl_doccats VALUES("6","Ch??ng trình","Chuongtrinh","CTr","0","0","1","1","1","","2012-10-01 00:00:00","","1","0");
INSERT INTO tbl_doccats VALUES("7","Thông t?","Thongtu","TT","0","0","2","2","2","","2012-10-01 00:00:00","0","1","0");
INSERT INTO tbl_doccats VALUES("8","Biên b?n","Bienban","BB","0","0","1","1","1","","2012-10-01 00:00:00","0","1","0");
INSERT INTO tbl_doccats VALUES("9","K? ho?ch","Kehoach","KH","0","0","1","1","1","","2012-10-01 00:00:00","0","1","0");
INSERT INTO tbl_doccats VALUES("10","Ch? th?","Chithi","CT","0","0","2","2","2","","2012-10-01 00:00:00","0","1","0");
INSERT INTO tbl_doccats VALUES("11","Ngh? ??nh","Nghidinh","N?","0","0","2","2","0","","2012-10-01 00:00:00","0","1","0");
INSERT INTO tbl_doccats VALUES("12","Ngh? quy?t","Nghiquyet","NQ","0","0","0","0","0","","2012-10-01 00:00:00","0","1","0");
INSERT INTO tbl_doccats VALUES("13","Thông tri","Thongtri","Ttri","0","0","0","0","0","","2012-10-01 00:00:00","0","1","0");
INSERT INTO tbl_doccats VALUES("14","Quy ??nh","Quydinh","Q?i","0","0","0","2","0","","2012-10-01 00:00:00","0","1","0");
INSERT INTO tbl_doccats VALUES("15","K?t lu?n","Ketluan","KL","0","0","1","1","1","","2012-10-01 00:00:00","0","1","0");
INSERT INTO tbl_doccats VALUES("16","T? trình liên ngành","To trinh lien nganh","TTrLN","0","0","1","1","1","","2012-10-03 00:00:00","0","1","0");
INSERT INTO tbl_doccats VALUES("17","?ính chính V?n b?n","Dinh chinh Van ban","?CVB","0","0","1","1","1","","2012-10-03 00:00:00","0","1","0");



DROP TABLE tbl_docdays;

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

INSERT INTO tbl_docdays VALUES("1","Th?m tra ph??ng án phân b? d? toán chi NSNN c?a các ??n v? HCSN","Tham tra phuong an phan bo du toan chi NSNN cua cac don vi HCSN","A","5.5","2012-02-17","0","1");
INSERT INTO tbl_docdays VALUES("2","Xác ??nh giá (ti?n) s? d?ng ??t cho t?ng d? án ??i v?i các t? ch?c","Xac dinh gia (tien) su dung dat cho tung du an doi voi cac to chuc","B","16.5","2012-02-17","1","1");
INSERT INTO tbl_docdays VALUES("3","Th?m ??nh h? s? ??t hàng các s?n ph?m d?ch v? ?ô th?","Tham dinh ho so dat hang cac san pham dich vu do thi","C","14.5","2012-02-17","2","1");
INSERT INTO tbl_docdays VALUES("4","Thanh tra th?c hi?n chính sách pháp lu?t","Thanh tra thuc hien chinh sach phap luat","D","60","2012-02-17","3","1");
INSERT INTO tbl_docdays VALUES("5","Mua s?m ph??ng ti?n ?i l?i là xe ô tô","Mua sam phuong tien di lai la xe o to","E","10","2012-02-17","4","1");
INSERT INTO tbl_docdays VALUES("6","Tham gia ý ki?n vào n?i dung các v?n b?n do các B?, Ngành Trung ??ng, UBND Thành ph? và các s?, ngành thu?c thành ph? d? th?o","Tham gia y kien vao noi dung cac van ban do cac Bo, Nganh Trung uong, UBND Thanh pho va cac so, nganh thuoc thanh pho du thao","F","26","2012-02-17","5","1");
INSERT INTO tbl_docdays VALUES("7","D? th?o các v?n b?n quy ph?m pháp lu?t, v?n b?n cá bi?t do UBND thành ph? ban hành mà s? Tài chính ???c giao ch? trì so?n th?o","Du thao cac van ban quy pham phap luat, van ban ca biet do UBND thanh pho ban hanh ma so Tai chinh duoc giao chu tri soan thao","G","49","2012-02-17","6","1");
INSERT INTO tbl_docdays VALUES("8","Các v?n b?n h??ng d?n nghi?p v? chuyên môn do S? Tài chính ban hành","Cac van ban huong dan nghiep vu chuyen mon do So Tai chinh ban hanh","H","21","2012-02-17","7","1");
INSERT INTO tbl_docdays VALUES("9","Các v?n b?n v? b? sung d? toán ngân sách: mua s?m tài s?n: thanh lý tài s?n: d? th?o h?p ??ng: thanh lý h?p ??ng kinh t? do các ??n v? bên ngoài S? Tài chính g?i t?i","Cac van ban ve bo sung du toan ngan sach mua sam tai san thanh ly tai san du thao hop dong thanh ly hop dong kinh te do cac don vi ben ngoai So Tai chinh gui toi","I","19","2012-10-02","","1");



DROP TABLE tbl_docdt;

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

INSERT INTO tbl_docdt VALUES("1","1","28","1","V/v tri?n khai t?ng v? sinh, tân trang toàn b? khu ??i s?nh và phòng h?p l?n cùng các khu v? sinh ?? chào m?ng ??i h?i ??ng các c?p.","2015-11-23","1","1","40");



DROP TABLE tbl_docdtfiles;

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

INSERT INTO tbl_docdtfiles VALUES("1","1","DT-1","../doc_uploads_2015/fa87022a38c4a9a66b1d92b963d876e3.jpg","","0000-00-00","0","0","0");



DROP TABLE tbl_docfields;

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

INSERT INTO tbl_docfields VALUES("1","Giám sát","Giam sat","","2015-11-20 00:00:00","","1","");
INSERT INTO tbl_docfields VALUES("2","Xây d?ng","Xay dung","","2015-11-20 00:00:00","","1","");
INSERT INTO tbl_docfields VALUES("3","T? v?n, lên d? án","Tuvan,lenduan","","2012-10-01 00:00:00","","1","");
INSERT INTO tbl_docfields VALUES("4","B?o trì, b?o d??ng","Baotri,baoduong","","2012-10-01 00:00:00","","1","");
INSERT INTO tbl_docfields VALUES("5","V?n t?i","Van tai","","2015-11-20 00:00:00","","1","");
INSERT INTO tbl_docfields VALUES("6","Qu?n lý d? án","Quan ly du an","","2015-11-20 00:00:00","","1","");
INSERT INTO tbl_docfields VALUES("7","Kh?o sát","Khao sat","","2015-11-20 00:00:00","","1","");



DROP TABLE tbl_docfiles;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO tbl_docfiles VALUES("1","46","02/CV-CC2","../doc_uploads_2016/62f948e10ab6dc5f7e1e5de3533d3ce0.jpg","2016-02-17 00:00:00","","","49");
INSERT INTO tbl_docfiles VALUES("2","46","01/CV-KHKT","../doc_uploads_2016/00e7f67e3bcb8751f03147361532da70.jpg","2016-02-17 00:00:00","","","49");
INSERT INTO tbl_docfiles VALUES("3","45","01/CV-THP","../doc_uploads_2018/291164692bc40ccb99eb366e48a54bec.png","2018-12-26 00:00:00","","","1");



DROP TABLE tbl_doclevels;

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

INSERT INTO tbl_doclevels VALUES("1","Bên ngoài","BN","","2015-11-20 00:00:00","","1","");
INSERT INTO tbl_doclevels VALUES("2","N?i b?","NB","","2015-11-20 00:00:00","","1","");



DROP TABLE tbl_docoutfiles;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO tbl_docoutfiles VALUES("1","1","1/CV-Hacinco","../doc_uploads_2018/d9c0132684aa750f8b9d2cb87f9327f2.jpg","2018-12-27 00:00:00","0","0","0");



DROP TABLE tbl_docouts;

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

INSERT INTO tbl_docouts VALUES("1","0","Xây d?ng","1","17","","UBND Qu?n B?c T? Liêm, Công ty QL và PT nhà Hà N?i","1","0","1/CV-Hacinco","V/v ?? ngh? cung c?p m?t b?ng kho bãi ch?a v?t li?u cho giai ?o?n 1 công trình tr??ng cao ??ng ngh? Nh?n - B?c T? Liêm","","1","0","0","31","0","","Giám ??c công ty","2016-01-17 00:00:00","1","40");
INSERT INTO tbl_docouts VALUES("2","0","Xây d?ng","1","16","","Công ty QL va fPT nhà Hà N?i","2","0","2/CV-Hacinco","V/v ?? ngh? ch? ??u t? công trình nhà tái ??nh c? khu ?ô th? ??i Kim thanh toán gói th?u s? 2.","","2","0","0","31","0","","Giám ??c công ty","2016-01-17 00:00:00","2","40");



DROP TABLE tbl_docreplys;

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

INSERT INTO tbl_docreplys VALUES("1","46","31","0","0","37","2016-02-16","Chuy?n ??ng chí Nguy?n Bá Vân - Phó Giám ??c công ty","","2013-01-01","0","0","0","0","0","1","0","0");
INSERT INTO tbl_docreplys VALUES("2","47","31","0","0","0","2016-02-17","Chuy?n Phòng K? ho?ch k? thu?t","","2013-01-01","13","0","0","17","0","0","0","0");
INSERT INTO tbl_docreplys VALUES("3","48","31","0","0","0","2016-02-17","Chuy?n Ban Tr? lý","","2016-02-19","0","0","0","13","0","0","0","0");
INSERT INTO tbl_docreplys VALUES("4","46","37","0","0","0","2016-02-17","Chuy?n Phòng K? ho?ch k? thu?t","5","2016-02-24","13","0","0","17","0","0","1","0");
INSERT INTO tbl_docreplys VALUES("5","46","43","0","0","0","2016-02-17","G?i ?/c Nhân viên gi?i quy?t","","2016-02-23","0","50","8","0","0","1","0","43");
INSERT INTO tbl_docreplys VALUES("7","46","31","0","0","0","2016-02-18","Chuy?n Phòng K? ho?ch k? thu?t ti?p t?c tri?n khai.","","2016-02-29","0","0","0","17","0","0","1","0");
INSERT INTO tbl_docreplys VALUES("8","46","43","0","0","0","2016-02-18","Chuy?n ?/c NV gi?i quy?t","","2016-02-26","0","50","8","0","0","0","0","43");



DROP TABLE tbl_docs;

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
  `doc_active` tinyint(11) DEFAULT '2' COMMENT '2: chua giai quyet, 1: da giai quyet, 3: da bao cao, 4: da xac nhan',
  `doc_file` tinyint(4) DEFAULT '2' COMMENT 'xac dinh van ban co file dinh kem hay chua',
  `user_id` varchar(250) DEFAULT '0' COMMENT 'nguoi nhan phan loai hoac chuyen thang de chi dao',
  `input_per` int(11) DEFAULT '0' COMMENT 'nguoi nhap van ban',
  `doc_theodoi` tinyint(4) DEFAULT '0' COMMENT 'xac dinh van ban can theo doi',
  PRIMARY KEY (`doc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

INSERT INTO tbl_docs VALUES("45","Công v?n","Xây d?ng","2","Công ty C? ph?n Thép Hòa Phát","01/CV-THP","5","V/v thông báo chuy?n lô hàng ??u tiên 500 cây thép D12.","","","","","","2018-12-24","1970-01-01","2018-12-22","1970-01-01","Nguy?n V?n H?i","Giám ??c","1","1","2016-02-15","","2","2","2","1","0","1","0");
INSERT INTO tbl_docs VALUES("46","Công v?n","Xây d?ng","2","Phòng công ch?ng NN s? 2","02/CV-CC2","2","V?n b?n th? nghi?m s? 2","Giao ?/c Nguy?n Bá Vân ch? ??o.","02/CV-KHKT","2016-02-17","Tr??ng phòng KHKT","2016-02-17","2016-02-15","1970-01-01","2016-02-15","2016-02-16","Ng? Duy Hi?u","Giám ??c","1","1","2016-02-15","","1","1","4","1","31","40","1");
INSERT INTO tbl_docs VALUES("47","Công v?n","Xây d?ng","1","Công ty QL và PT nhà HN","03/CV-QLPTNHN","1","V?n b?n th? nghi?m s? 3","Giao Phòng K? ho?ch k? thu?t gi?i quy?t, ban Tr? lý ph?i h?p.","","","","","2016-02-15","1970-01-01","2016-02-15","2016-02-16","Nguy?n H?u ??","Giám ??c","1","1","2016-02-15","","1","1","2","2","31","40","0");
INSERT INTO tbl_docs VALUES("48","Công v?n","Xây d?ng","2","Phòng công ch?ng NN s? 3","04/CV-CC3","3","V?n b?n th? nghi?m s? 4","Giao ban tr? lý gi?i quy?t","","","","","2016-02-15","1970-01-01","2016-02-15","2016-02-16","Ph?m V?n Kh??ng","Phó giám ??c","1","1","2016-02-15","","1","1","2","2","31","40","1");
INSERT INTO tbl_docs VALUES("49","Công v?n","Xây d?ng","2","Phòng công ch?ng NN s? 4","05/CV-CC4","4","V?n b?n th? nghi?m s? 5","G?i phòng K? ho?ch k? thu?t lên ph??ng án gi?i quy?t","","","","","2016-02-15","1970-01-01","2016-02-15","2016-02-16","V? H?ng Khanh","Giám ??c","1","1","2016-02-15","","1","2","2","2","31","40","0");



DROP TABLE tbl_feedbacks;

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




DROP TABLE tbl_hd_doitac;

CREATE TABLE `tbl_hd_doitac` (
  `doitac_id` int(11) NOT NULL AUTO_INCREMENT,
  `doitac_name` varchar(250) DEFAULT NULL,
  `doitac_viettat` varchar(150) DEFAULT NULL,
  `doitac_daidien` varchar(150) DEFAULT NULL,
  `doitac_mst` varchar(100) DEFAULT NULL,
  `doitac_truso` varchar(250) DEFAULT NULL,
  `doitac_vpgd` varchar(250) DEFAULT NULL,
  `doitac_sdt` varchar(100) DEFAULT NULL,
  `doitac_fax` varchar(100) DEFAULT NULL,
  `doitac_email` varchar(250) DEFAULT NULL,
  `doitac_sort` int(11) DEFAULT '0',
  `doitac_active` tinyint(1) DEFAULT NULL,
  `doitac_date` date DEFAULT NULL,
  PRIMARY KEY (`doitac_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO tbl_hd_doitac VALUES("1","Công ty CP Thép Hòa Phát H?i D??ng","Hoa Phat Hai Duong Steel JSC","Nguy?n Vi?t Th?ng","0800384651","KCN Ph? N?i A, xã Giai Ph?m, huy?n Yên M?, t?nh H?ng Yên, Vi?t Nam","66 Nguy?n Du – Qu?n Hai Bà Tr?ng – TP. Hà N?i.","0243.6282011","0243.9747748","infi@thep.hoaphat.com.vn","","1","2018-12-21");
INSERT INTO tbl_hd_doitac VALUES("2","Nhà máy Xi M?ng Xuân Thành","XM Xuan Thanh","Nguy?n Xuân Th?y","0700576529","Thôn B?ng L?ng, xã Thanh Ngh?, huy?n Thanh Liêm, t?nh Hà Nam","Thôn B?ng L?ng, xã Thanh Ngh?, huy?n Thanh Liêm, t?nh Hà Nam","2263 757 666","2263.757.888","info@ximangxuanthanh.vn","0","1","2018-12-21");
INSERT INTO tbl_hd_doitac VALUES("3","Công ty thi?t b? ph? tùng Hòa Phát","HOA PHAT CO., LTD","Nguy?n Ng?c Quang","0100365371","39 Nguy?n ?ình Chi?u - Hai Bà Tr?ng - Hà N?i","39 Nguy?n ?ình Chi?u - Hai Bà Tr?ng - Hà N?i","0243 6452736","0902588609","thietbihp@hoaphat.com.vn","","1","2018-12-21");



DROP TABLE tbl_hd_duan;

CREATE TABLE `tbl_hd_duan` (
  `duan_id` int(11) NOT NULL AUTO_INCREMENT,
  `duan_name` varchar(150) NOT NULL,
  `duan_mota` varchar(250) DEFAULT NULL,
  `duan_sort` int(11) DEFAULT NULL,
  `duan_active` tinyint(4) DEFAULT NULL,
  `duan_date` date DEFAULT NULL,
  PRIMARY KEY (`duan_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;




DROP TABLE tbl_hd_dvtiente;

CREATE TABLE `tbl_hd_dvtiente` (
  `dvtiente_id` int(11) NOT NULL AUTO_INCREMENT,
  `dvtiente_name` varchar(150) DEFAULT NULL,
  `dvtiente_name_e` varchar(150) DEFAULT NULL,
  `dvtiente_unit` varchar(50) DEFAULT NULL,
  `dvtiente_sort` int(11) DEFAULT '0',
  `dvtiente_active` tinyint(1) DEFAULT NULL,
  `dvtiente_date` date DEFAULT NULL,
  PRIMARY KEY (`dvtiente_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO tbl_hd_dvtiente VALUES("1","Vi?t Nam ??ng","Vietnamese Dong","VND","","1","2018-12-19");
INSERT INTO tbl_hd_dvtiente VALUES("2","Dollar M?","US Dollar","USD","","1","2018-12-19");
INSERT INTO tbl_hd_dvtiente VALUES("3","Ti?n chung Châu Âu","Euro","EUR","","1","2018-12-19");
INSERT INTO tbl_hd_dvtiente VALUES("4","B?ng Anh","Great Britain Pound","GBP","","1","2018-12-19");
INSERT INTO tbl_hd_dvtiente VALUES("5","Nhân Dân T?","Chiness Yuan","CNY","","1","2018-12-19");
INSERT INTO tbl_hd_dvtiente VALUES("6","Yên Nh?t","Japanese Yen","JPY","","1","2018-12-19");



DROP TABLE tbl_hd_dvtinh;

CREATE TABLE `tbl_hd_dvtinh` (
  `dvtinh_id` int(11) NOT NULL AUTO_INCREMENT,
  `dvtinh_name` varchar(150) DEFAULT NULL,
  `dvtinh_sort` int(11) DEFAULT '0',
  `dvtinh_active` tinyint(1) DEFAULT NULL,
  `dvtinh_date` date DEFAULT NULL,
  PRIMARY KEY (`dvtinh_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

INSERT INTO tbl_hd_dvtinh VALUES("1","Cái","0","1","2018-12-21");
INSERT INTO tbl_hd_dvtinh VALUES("2","Cây","0","1","2018-12-21");
INSERT INTO tbl_hd_dvtinh VALUES("3","Cu?n","0","1","2018-12-21");
INSERT INTO tbl_hd_dvtinh VALUES("4","T?m","0","1","2018-12-21");
INSERT INTO tbl_hd_dvtinh VALUES("5","Bao","0","1","2018-12-21");
INSERT INTO tbl_hd_dvtinh VALUES("6","Viên","0","1","2018-12-21");
INSERT INTO tbl_hd_dvtinh VALUES("7","T?n","0","1","2018-12-21");
INSERT INTO tbl_hd_dvtinh VALUES("8","T?","0","1","2018-12-21");
INSERT INTO tbl_hd_dvtinh VALUES("9","Chi?c","0","1","2018-12-21");
INSERT INTO tbl_hd_dvtinh VALUES("10","B?","0","1","2018-12-21");
INSERT INTO tbl_hd_dvtinh VALUES("11","Thùng","0","1","2018-12-21");
INSERT INTO tbl_hd_dvtinh VALUES("12","Mét","0","1","2018-12-24");



DROP TABLE tbl_hd_hdban;

CREATE TABLE `tbl_hd_hdban` (
  `hdban_id` int(11) NOT NULL AUTO_INCREMENT,
  `duan_id` int(11) DEFAULT NULL,
  `hdban_sohd` varchar(100) DEFAULT NULL,
  `hdban_ngayky` date DEFAULT NULL,
  `hdban_hieuluc` date DEFAULT NULL,
  `khachhang_id` int(11) DEFAULT NULL,
  `hdban_noidung` text,
  `dvtiente_id` int(11) DEFAULT NULL,
  `hdban_giatri` float DEFAULT NULL,
  `hdban_giatri_quydoi` int(11) DEFAULT NULL,
  `hdban_gttt` float DEFAULT NULL,
  `hdban_gttt_quydoi` int(11) DEFAULT NULL,
  `hdban_thoigianthuchien` int(11) DEFAULT NULL,
  `hdban_pb_thuchien` int(11) DEFAULT NULL,
  `hdban_pb_phoihop` varchar(250) DEFAULT NULL COMMENT 'dang [pb_id][pb_id]',
  `hdban_nguoithuchien` int(11) DEFAULT NULL,
  `hdban_nguoiphoihop` varchar(250) DEFAULT NULL COMMENT 'dang [pb_id,user_id][pb_id,user_id]',
  `hdban_ngaytl_huybo` date DEFAULT NULL,
  `hdban_lydo_huybo` text,
  `hdban_dieukhoankhac` text,
  `hdban_nguoinhap` int(11) DEFAULT NULL,
  `hdban_ngaynhap` date DEFAULT NULL,
  `hdban_tinhtrang` int(11) DEFAULT NULL COMMENT '1. moi, 2. phongduyet, 3. ctyduyet, 4. dangthuchien, 5. daxong, 6.dahuy, 7. dagiahan',
  PRIMARY KEY (`hdban_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;




DROP TABLE tbl_hd_hdban_chiphi;

CREATE TABLE `tbl_hd_hdban_chiphi` (
  `chiphi_id` int(11) NOT NULL AUTO_INCREMENT,
  `hdban_id` int(11) DEFAULT NULL,
  `chiphi_diengiai` varchar(250) DEFAULT NULL,
  `chiphi_giatri` int(11) DEFAULT NULL,
  `chiphi_ngaychi` date DEFAULT NULL,
  `chiphi_khoanmuc` varchar(250) DEFAULT NULL,
  `chiphi_nguoinhan` int(11) DEFAULT NULL,
  `chiphi_ghichu` varchar(250) DEFAULT NULL,
  `chiphi_nguoinhap` int(11) DEFAULT NULL,
  `chiphi_tinhtrang` tinyint(1) DEFAULT NULL,
  `chiphi_date` date DEFAULT NULL,
  PRIMARY KEY (`chiphi_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




DROP TABLE tbl_hd_hdban_hoadon;

CREATE TABLE `tbl_hd_hdban_hoadon` (
  `hoadon_id` int(11) NOT NULL AUTO_INCREMENT,
  `hoadon_sohd` varchar(100) DEFAULT NULL,
  `hoadon_noidung` varchar(250) DEFAULT NULL,
  `hdban_id` int(11) DEFAULT NULL,
  `hoadon_giatri` int(11) DEFAULT NULL,
  `hoadon_ngayhd` date DEFAULT NULL,
  `hoadon_tinhtrang` tinyint(4) DEFAULT NULL COMMENT '1. chua xuat, 2.da xuat, 3. bi huy',
  `hoadon_date` date DEFAULT NULL,
  PRIMARY KEY (`hoadon_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




DROP TABLE tbl_hd_hdban_thuchien;

CREATE TABLE `tbl_hd_hdban_thuchien` (
  `thuchien_id` int(11) NOT NULL AUTO_INCREMENT,
  `hdban_id` int(11) DEFAULT NULL,
  `thuchien_noidung` text,
  `thuchien_batdau` date DEFAULT NULL,
  `thuchien_ketthuc` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `thuchien_tinhtrang` tinyint(1) DEFAULT NULL,
  `thuchien_date` date DEFAULT NULL,
  PRIMARY KEY (`thuchien_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




DROP TABLE tbl_hd_hdban_xuatkho;

CREATE TABLE `tbl_hd_hdban_xuatkho` (
  `xuatkho_id` int(11) NOT NULL AUTO_INCREMENT,
  `hoadon_id` int(11) DEFAULT NULL,
  `mathang_id` int(11) DEFAULT NULL,
  `xuatkho_soluong` int(11) DEFAULT NULL,
  `xuatkho_nguoinhap` int(11) DEFAULT NULL,
  `xuatkho_date` date DEFAULT NULL,
  PRIMARY KEY (`xuatkho_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




DROP TABLE tbl_hd_hdmua;

CREATE TABLE `tbl_hd_hdmua` (
  `hdmua_id` int(11) NOT NULL AUTO_INCREMENT,
  `hdmua_sohd` varchar(100) DEFAULT NULL,
  `hdmua_ngayhd` date DEFAULT NULL,
  `hdmua_hieuluc` date DEFAULT NULL,
  `hdmua_noidung` text,
  `hdmua_tgth` int(11) DEFAULT NULL COMMENT 'thoi gian thuc hien',
  `hdmua_kieu_tgth` int(11) DEFAULT NULL COMMENT '1. ngay, 2. thang, 3. nam',
  `dvtiente_id` int(11) DEFAULT NULL,
  `hdmua_giatri` double DEFAULT NULL,
  `hdmua_giatri_quydoi` bigint(20) DEFAULT NULL,
  `hdmua_gttt` double DEFAULT NULL,
  `hdmua_gttt_quydoi` bigint(20) DEFAULT NULL,
  `doitac_id` int(11) DEFAULT NULL,
  `doitac_viettat` varchar(150) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL COMMENT 'phong theo doi',
  `phongban_name` varchar(150) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT 'nguoi theo doi',
  `nguoi_theodoi` varchar(150) DEFAULT NULL,
  `hdmua_tinhtrang` tinyint(4) DEFAULT NULL COMMENT '1. moi, 2. dang thuc hien, 3. da xong, 4. da huy',
  `hdmua_tl_huybo` bigint(20) DEFAULT NULL,
  `hdmua_lydo_huybo` varchar(250) DEFAULT NULL,
  `hdmua_dieukhoankhac` text,
  `hdmua_file` tinyint(4) DEFAULT '2' COMMENT '1. da dinh tep tin, 2. chua dinh tep tin',
  `hdmua_nguoinhap` int(11) DEFAULT NULL,
  `hdmua_date` date DEFAULT NULL,
  PRIMARY KEY (`hdmua_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO tbl_hd_hdmua VALUES("1","01/H?KT-THP","2018-01-21","2019-01-21","Cung c?p 15 t?n thép phi 12, 15 t?n thép phi 15.","20","","1","3300000000","3300000000","3300000000","3300000000","1","Hoa Phat Hai Duong Steel JSC","16","Phòng Tài chính k? toán","53","Nguy?n Thu Trang","2","","","Ch?m 1 ngày ph?t 1% giá tr? h?p ??ng (VND).","2","1","2018-12-26");
INSERT INTO tbl_hd_hdmua VALUES("2","02/H?KT-THP","2018-12-22","2019-01-22","Cung c?p 1000 mét thép tr?n phi 10, 300 cây thép phi 12","25","","1","2000000000","2000000000","2000000000","2000000000","3","HOA PHAT CO., LTD","16","Phòng Tài chính k? toán","0","Nguy?n Thu Trang","1","","","Ch?m giao hàng tr? 1% gái tr? (VN?) m?i ngày.","2","1","2018-12-24");
INSERT INTO tbl_hd_hdmua VALUES("3","03/H?KT-XT","2018-12-22","2018-12-28","Cung c?p 24 t?n xi m?ng","12","","1","1200000000","1200000000","1200000000","1200000000","2","XM Xuan Thanh","16","Phòng Tài chính k? toán","53","Nguy?n Thu Trang","1","0","","","2","1","2018-12-22");
INSERT INTO tbl_hd_hdmua VALUES("4","03/H?KT-THP","2018-12-22","2018-12-22","Cung c?p 2000 cây thép phi 20","12","","1","1200000000","1200000000","1200000000","1200000000","1","Hoa Phat Hai Duong Steel JSC","16","Phòng Tài chính k? toán","53","Nguy?n Thu Trang","4","120000000","Không còn nhu c?u nh?p hàng","Ph?t 10% giá tr? (VN?) n?u h?y h?p ??ng","2","1","2018-12-22");



DROP TABLE tbl_hd_hdmua_chiphi;

CREATE TABLE `tbl_hd_hdmua_chiphi` (
  `chiphi_id` int(11) NOT NULL AUTO_INCREMENT,
  `hdmua_id` int(11) DEFAULT NULL,
  `chiphi_diengiai` varchar(250) DEFAULT NULL,
  `chiphi_giatri` int(11) DEFAULT NULL,
  `chiphi_ngaychi` date DEFAULT NULL,
  `chiphi_khoanmuc` varchar(250) DEFAULT NULL,
  `chiphi_nguoinhan` int(11) DEFAULT NULL,
  `chiphi_ghichu` varchar(250) DEFAULT NULL,
  `chiphi_nguoinhap` int(11) DEFAULT NULL,
  `chiphi_tinhtrang` tinyint(4) DEFAULT NULL,
  `chiphi_date` date DEFAULT NULL,
  PRIMARY KEY (`chiphi_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




DROP TABLE tbl_hd_hdmua_hoadon;

CREATE TABLE `tbl_hd_hdmua_hoadon` (
  `hoadon_id` int(11) NOT NULL AUTO_INCREMENT,
  `hoadon_sohd` varchar(100) DEFAULT NULL,
  `hdmua_id` int(11) DEFAULT NULL,
  `hdmua_sohd` varchar(150) DEFAULT NULL,
  `hoadon_giatri` bigint(20) DEFAULT NULL,
  `hoadon_pttt` tinyint(4) DEFAULT NULL COMMENT '1. tien mat, 2. chuyen khoan',
  `hoadon_ngayhd` date DEFAULT NULL,
  `hoadon_noidung` varchar(250) DEFAULT NULL,
  `hoadon_nguoinhap` int(11) DEFAULT NULL,
  `hoadon_file` varchar(250) DEFAULT NULL,
  `hoadon_date` date DEFAULT NULL,
  `hoadon_active` tinyint(4) DEFAULT NULL COMMENT '1. co hieu luc, 2. bi huy',
  PRIMARY KEY (`hoadon_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO tbl_hd_hdmua_hoadon VALUES("1","01GTKT3/001","3","03/H?KT-XT","1200000000","2","2018-12-23","Xu?t hóa ??n theo h?p ??ng","1","../hoadonmua_uploads_2018/291164692bc40ccb99eb366e48a54bec.png","2018-12-23","1");
INSERT INTO tbl_hd_hdmua_hoadon VALUES("2","01GTKT3/010","1","01/H?KT-THP","3300000000","2","2018-12-23","Xu?t theo h?p ??ng","1","../hoadonmua_uploads_2018/291164692bc40ccb99eb366e48a54bec.png","2018-12-23","1");
INSERT INTO tbl_hd_hdmua_hoadon VALUES("3","01GTKT3/080","2","02/H?KT-THP","2000000000","2","2018-12-24","Xu?t theo h?p ??ng","1","../hoadonmua_uploads_2018/463bfcd287b2e1585dcefb1cb9c55190.jpg","2018-12-24","1");



DROP TABLE tbl_hd_hdmua_lkvb;

CREATE TABLE `tbl_hd_hdmua_lkvb` (
  `lkvb_id` int(11) NOT NULL AUTO_INCREMENT,
  `hdmua_id` int(11) DEFAULT NULL,
  `hdmua_sohd` varchar(150) DEFAULT NULL,
  `vanban_id` int(11) DEFAULT NULL,
  `vanban_skh` varchar(150) DEFAULT NULL,
  `vanban_trichyeu` varchar(250) DEFAULT NULL,
  `vanban_file` varchar(250) DEFAULT NULL,
  `lkvb_type` int(11) DEFAULT NULL COMMENT '1. vbden, 2. vbdi',
  `user_id` int(11) DEFAULT NULL,
  `lkvb_date` date DEFAULT NULL,
  `lkvb_active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`lkvb_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO tbl_hd_hdmua_lkvb VALUES("1","1","01/H?KT-THP","","01/CV-THP","V/v thông báo chuy?n lô hàng ??u tiên 500 cây thép D12.","../doc_uploads_2018/291164692bc40ccb99eb366e48a54bec.png","1","1","2018-12-27","");
INSERT INTO tbl_hd_hdmua_lkvb VALUES("2","1","01/H?KT-THP","","1/CV-Hacinco","V/v ?? ngh? cung c?p m?t b?ng kho bãi ch?a v?t li?u cho giai ?o?n 1 công trình tr??ng cao ??ng ngh? Nh?n - B?c T? Liêm","../doc_uploads_2018/d9c0132684aa750f8b9d2cb87f9327f2.jpg","2","1","2018-12-27","");



DROP TABLE tbl_hd_hdmua_tientrinh;

CREATE TABLE `tbl_hd_hdmua_tientrinh` (
  `tientrinh_id` int(11) NOT NULL AUTO_INCREMENT,
  `tientrinh_ghichu` varchar(250) DEFAULT NULL,
  `tientrinh_file` varchar(250) DEFAULT NULL,
  `hdmua_id` int(11) DEFAULT NULL,
  `hdmua_sohd` varchar(150) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `tientrinh_date` date DEFAULT NULL,
  `tientrinh_active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`tientrinh_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO tbl_hd_hdmua_tientrinh VALUES("1","?ã chuy?n lô hang ??u tiên g?m 500 cây thép D12","../hdmua_tientrinh_uploads_2018/463bfcd287b2e1585dcefb1cb9c55190.jpg","1","01/H?KT-THP","1","2018-12-26","");



DROP TABLE tbl_hd_hdmua_tonkho;

CREATE TABLE `tbl_hd_hdmua_tonkho` (
  `tonkho_id` int(11) NOT NULL AUTO_INCREMENT,
  `hoadon_id` int(11) DEFAULT NULL,
  `hoadon_sohd` varchar(150) DEFAULT NULL,
  `dvtinh_id` int(11) DEFAULT NULL,
  `dvtinh_name` varchar(100) DEFAULT NULL,
  `hanghoa_id` int(11) DEFAULT NULL,
  `hanghoa_name` varchar(250) DEFAULT NULL,
  `tonkho_soluong` int(11) DEFAULT NULL,
  `tonkho_nguoinhap` int(11) DEFAULT NULL,
  `tonkho_date` date DEFAULT NULL,
  PRIMARY KEY (`tonkho_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO tbl_hd_hdmua_tonkho VALUES("1","2","01GTKT3/010","2","Cây","2","Thép phi 12","500","1","2018-12-23");
INSERT INTO tbl_hd_hdmua_tonkho VALUES("2","2","01GTKT3/010","2","Cây","3","Thép phi 15","500","1","2018-12-23");
INSERT INTO tbl_hd_hdmua_tonkho VALUES("3","3","01GTKT3/080","2","Cây","2","Thép phi 12","300","1","2018-12-24");
INSERT INTO tbl_hd_hdmua_tonkho VALUES("4","3","01GTKT3/080","12","Mét","4","Thép cu?n phi 10","1000","1","2018-12-24");



DROP TABLE tbl_hd_khachhang;

CREATE TABLE `tbl_hd_khachhang` (
  `khachhang_id` int(11) NOT NULL AUTO_INCREMENT,
  `khachhang_name` varchar(250) NOT NULL,
  `khachhang_viettat` varchar(100) DEFAULT NULL,
  `khachhang_daidien` varchar(100) DEFAULT NULL,
  `khachhang_mst` varchar(50) DEFAULT NULL,
  `khachhang_truso` varchar(250) DEFAULT NULL,
  `khachhang_vpgd` varchar(250) DEFAULT NULL,
  `khachhang_sdt` varchar(50) DEFAULT NULL,
  `khachhang_fax` varchar(50) DEFAULT NULL,
  `khachhang_email` varchar(150) DEFAULT NULL,
  `khachhang_sort` int(11) DEFAULT NULL,
  `khachhang_active` tinyint(4) DEFAULT NULL,
  `khachhang_date` date DEFAULT NULL,
  PRIMARY KEY (`khachhang_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;




DROP TABLE tbl_hdmua_danhmuc;

CREATE TABLE `tbl_hdmua_danhmuc` (
  `danhmuc_id` int(11) NOT NULL AUTO_INCREMENT,
  `danhmuc_name` varchar(250) DEFAULT NULL,
  `danhmuc_viettat` varchar(100) DEFAULT NULL,
  `danhmuc_mota` varchar(250) DEFAULT NULL,
  `danhmuc_sort` int(11) DEFAULT '0',
  `danhmuc_active` tinyint(4) DEFAULT NULL,
  `danhmuc_date` date DEFAULT NULL,
  PRIMARY KEY (`danhmuc_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO tbl_hdmua_danhmuc VALUES("1","V?t li?u xây d?ng","VLXD","V?t li?u, hàng hóa ph?c v? thi công công trình xây d?ng","0","1","2018-12-18");
INSERT INTO tbl_hdmua_danhmuc VALUES("2","S?n ph?m n?i, ngo?i th?t","NNT","Các s?n ph?m thi công n?i, ngo?i th?t","0","1","2018-12-18");
INSERT INTO tbl_hdmua_danhmuc VALUES("3","H? th?ng ?i?n","HT?","Các s?n ph?m thi ?i?n l?p ??t trong công trình","0","1","2018-12-18");
INSERT INTO tbl_hdmua_danhmuc VALUES("4","H? th?ng n??c","HTN","Các s?n ph?m thi công, l?p ??t h? th?ng n??c trong công trình","0","1","2018-12-18");
INSERT INTO tbl_hdmua_danhmuc VALUES("5","H? th?ng phòng ch?ng cháy n?","PCCN","Hàng hóa thi công l?p ??t h? th?ng phòng ch?ng cháy n? cho công trình","0","1","2018-12-18");
INSERT INTO tbl_hdmua_danhmuc VALUES("6","H? th?ng giám sát","HTGS","Các s?n ph?m thi công l?p ??t trong h? th?ng giám sát c?a công trình","0","1","2018-12-18");



DROP TABLE tbl_hdmua_hanghoa;

CREATE TABLE `tbl_hdmua_hanghoa` (
  `hanghoa_id` int(11) NOT NULL AUTO_INCREMENT,
  `danhmuc_id` int(11) DEFAULT NULL,
  `hanghoa_name` varchar(250) DEFAULT NULL,
  `hanghoa_mahang` varchar(100) DEFAULT NULL,
  `hanghoa_mota` varchar(250) DEFAULT NULL,
  `hanghoa_sort` int(11) DEFAULT '0',
  `hanghoa_active` tinyint(1) DEFAULT NULL,
  `hanghoa_date` date DEFAULT NULL,
  PRIMARY KEY (`hanghoa_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO tbl_hdmua_hanghoa VALUES("1","1","T?m bê tông ?úc s?n 3x3 m","BT?S 3x3","T?m bê tông ?úc s?n 3x3 m","","1","2018-12-18");
INSERT INTO tbl_hdmua_hanghoa VALUES("2","1","Thép phi 12","T-D12","Thép phi 12","","1","2018-12-18");
INSERT INTO tbl_hdmua_hanghoa VALUES("3","1","Thép phi 15","T-D15","Thép phi 15","0","1","2018-12-19");
INSERT INTO tbl_hdmua_hanghoa VALUES("4","1","Thép cu?n phi 10","TC-D10","Thép cu?n phi 10 ?? ?an bê tông","0","1","2018-12-24");



DROP TABLE tbl_hdsds;

CREATE TABLE `tbl_hdsds` (
  `hdsd_id` int(11) NOT NULL AUTO_INCREMENT,
  `hdsd_name` varchar(250) DEFAULT NULL,
  `hdsd_path` varchar(250) DEFAULT NULL,
  `hdsd_date` date DEFAULT NULL,
  `hdsd_sort` int(11) DEFAULT NULL,
  `hdsd_active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`hdsd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO tbl_hdsds VALUES("1","V?n th? - T?o l?ch lãnh ??o","../hdsd_uploads/d264e4b7b88b740265b2c36c849a1e45.swf","2016-01-15","","1");
INSERT INTO tbl_hdsds VALUES("2","Qu?n tr? - Qu?n lý thi?t b?","../hdsd_uploads/e679b049cfc782e011867729bd2e28e3.swf","2016-01-15","","1");



DROP TABLE tbl_holidays;

CREATE TABLE `tbl_holidays` (
  `holiday_id` int(11) NOT NULL AUTO_INCREMENT,
  `holiday_name` varchar(250) DEFAULT NULL,
  `holiday_date` date DEFAULT NULL,
  `holiday_sort` int(11) DEFAULT NULL,
  `holiday_active` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`holiday_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

INSERT INTO tbl_holidays VALUES("8","Ngh? 30/04","2013-04-29","","1");
INSERT INTO tbl_holidays VALUES("9","Ngh? 30/04 (Gi?i phóng mi?n nam)","2013-04-30","","1");
INSERT INTO tbl_holidays VALUES("10","Ngh? 01/05 (QTL?)","2013-05-01","","1");
INSERT INTO tbl_holidays VALUES("11","Ngh? 02/09 (Qu?c khánh)","2013-09-02","2","1");
INSERT INTO tbl_holidays VALUES("12","Ngh? du l?ch","2013-06-27","0","1");
INSERT INTO tbl_holidays VALUES("13","Ngh? du l?ch","2013-06-28","1","1");



DROP TABLE tbl_importants;

CREATE TABLE `tbl_importants` (
  `important_id` int(11) NOT NULL AUTO_INCREMENT,
  `important_name` varchar(250) DEFAULT NULL,
  `important_desc` text,
  `important_date` datetime DEFAULT NULL,
  `important_sort` int(11) DEFAULT '0',
  `important_active` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`important_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO tbl_importants VALUES("1","Bình th??ng","<p>&#160;</p>","2011-04-12 00:00:00","","1");
INSERT INTO tbl_importants VALUES("2","Kh?n","<p>&#160;</p>","2011-07-25 00:00:00","0","1");
INSERT INTO tbl_importants VALUES("3","T?i kh?n","<p>&#160;</p>","2011-07-25 00:00:00","0","1");



DROP TABLE tbl_interdiscis;

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

INSERT INTO tbl_interdiscis VALUES("4","Nguy?n Tr?ng ?ông","Nguyen Trong Dong","<p>&#160;</p>","2011-11-29 00:00:00","","1");
INSERT INTO tbl_interdiscis VALUES("5","Hà Minh H?i","Ha Minh Hai","<p>&#160;</p>","2011-11-29 00:00:00","","1");
INSERT INTO tbl_interdiscis VALUES("6","?oàn Thanh Long","Doan Thanh Long","<p>&#160;</p>","2011-11-29 00:00:00","","1");



DROP TABLE tbl_levels;

CREATE TABLE `tbl_levels` (
  `level_id` int(11) NOT NULL AUTO_INCREMENT,
  `level_name` varchar(250) DEFAULT NULL,
  `level_desc` text,
  `level_date` datetime DEFAULT NULL,
  `level_sort` int(11) DEFAULT '0',
  `level_active` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO tbl_levels VALUES("1","Qu?c h?i","<p>Qu?c h?i là c?p b?u c? cao nh?t t?i Vi?t Nam</p>","2011-03-15 00:00:00","","1");
INSERT INTO tbl_levels VALUES("2","T?nh - Thành ph?","<p>T?nh - Thành ph? là c?p b?u c? th? 2 d??i Qu?c h?i</p>","2011-03-15 00:00:00","0","1");
INSERT INTO tbl_levels VALUES("3","Qu?n - Huy?n - Th? Xã - TP tr?c thu?c","<p>Qu?n - Huy?n - Th? Xã - TP tr?c thu?c là c?p b?u c? th? 3 d??i T?nh - Thành ph?</p>","2011-03-15 00:00:00","0","1");
INSERT INTO tbl_levels VALUES("4","Ph??ng - Xã - Th? Tr?n","<p>Ph??ng - Xã - Th? Tr?n là c?p b?u c? th? 4 c?ng là th?p nh?t.</p>","2011-03-15 00:00:00","0","1");



DROP TABLE tbl_luong_chamcong;

CREATE TABLE `tbl_luong_chamcong` (
  `cc_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `cc_thang` int(11) DEFAULT NULL,
  `cc_nam` int(11) DEFAULT NULL,
  `cc_luong` int(11) DEFAULT NULL COMMENT 'muc luong / thang',
  `cc_1` tinyint(4) DEFAULT NULL COMMENT '1. lam ca ngay, 2. lam nua ngay, 3. nghi co luong, 4. nghi ko luong',
  `cc_2` tinyint(4) DEFAULT NULL,
  `cc_3` tinyint(4) DEFAULT NULL,
  `cc_4` tinyint(4) DEFAULT NULL,
  `cc_5` tinyint(4) DEFAULT NULL,
  `cc_6` tinyint(4) DEFAULT NULL,
  `cc_7` tinyint(4) DEFAULT NULL,
  `cc_8` tinyint(4) DEFAULT NULL,
  `cc_9` tinyint(4) DEFAULT NULL,
  `cc_10` tinyint(4) DEFAULT NULL,
  `cc_11` tinyint(4) DEFAULT NULL,
  `cc_12` tinyint(4) DEFAULT NULL,
  `cc_13` tinyint(4) DEFAULT NULL,
  `cc_14` tinyint(4) DEFAULT NULL,
  `cc_15` tinyint(4) DEFAULT NULL,
  `cc_16` tinyint(4) DEFAULT NULL,
  `cc_17` tinyint(4) DEFAULT NULL,
  `cc_18` tinyint(4) DEFAULT NULL,
  `cc_19` tinyint(4) DEFAULT NULL,
  `cc_20` tinyint(4) DEFAULT NULL,
  `cc_21` tinyint(4) DEFAULT NULL,
  `cc_22` tinyint(4) DEFAULT NULL,
  `cc_23` tinyint(4) DEFAULT NULL,
  `cc_24` tinyint(4) DEFAULT NULL,
  `cc_25` tinyint(4) DEFAULT NULL,
  `cc_26` tinyint(4) DEFAULT NULL,
  `cc_27` tinyint(4) DEFAULT NULL,
  `cc_28` tinyint(4) DEFAULT NULL,
  `cc_29` tinyint(4) DEFAULT NULL,
  `cc_30` tinyint(4) DEFAULT NULL,
  `cc_31` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`cc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




DROP TABLE tbl_luong_phucap;

CREATE TABLE `tbl_luong_phucap` (
  `phucap_id` int(11) NOT NULL AUTO_INCREMENT,
  `phucap_ten` varchar(250) DEFAULT NULL,
  `phucap_giatri` int(11) DEFAULT NULL,
  `phucap_diengiai` varchar(250) DEFAULT NULL,
  `phucap_date` date DEFAULT NULL,
  `phucap_sort` int(11) DEFAULT '0',
  `phucap_active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`phucap_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO tbl_luong_phucap VALUES("1","H? tr? nhân viên","1000000","600.000 h? tr? ?n tr?a, 200.000 h? tr? ?i l?i, 200.000 h? tr? liên l?c.","2018-12-30","0","1");
INSERT INTO tbl_luong_phucap VALUES("2","H? tr? c?p phó phòng/ban","1400000","600.000 h? tr? ti?n ?n, 400.000 h? tr? ?i l?i, 400.000 h? tr? liên l?c.","2018-12-30","","1");
INSERT INTO tbl_luong_phucap VALUES("3","H? tr? c?p tr??ng phòng/ban","1800000","600.000 h? tr? ti?n ?n, 600.000 h? tr? ?i l?i, 600.000 h? tr? liên l?c.","2018-12-30","","1");
INSERT INTO tbl_luong_phucap VALUES("4","H? tr? lãnh ??o công ty","2200000","600.000 h? tr? ti?n ?n, 800.000 h? tr? ?i l?i, 800.000 h? tr? liên l?c.","2018-12-30","","1");



DROP TABLE tbl_luong_tldn;

CREATE TABLE `tbl_luong_tldn` (
  `tldn_id` int(11) NOT NULL AUTO_INCREMENT,
  `tldn_ten` varchar(250) DEFAULT NULL,
  `tldn_heso` float DEFAULT NULL,
  `tldn_mota` varchar(250) DEFAULT NULL,
  `tldn_date` date DEFAULT NULL,
  `tldn_sort` int(11) DEFAULT '0',
  `tldn_active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`tldn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO tbl_luong_tldn VALUES("1","B?c l??ng nhân viên 1","1.5","Nhân viên th?i v? ho?c d??i 01 n?m làm vi?c.","2018-12-30","","1");
INSERT INTO tbl_luong_tldn VALUES("2","B?c l??ng nhân viên 2","2","T? 01 ??n d??i 02 n?m làm vi?c.","2018-12-30","0","1");



DROP TABLE tbl_luong_tlnn;

CREATE TABLE `tbl_luong_tlnn` (
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

INSERT INTO tbl_luong_tlnn VALUES("1","1","1","3.5","2","3","2012-09-26","","1");
INSERT INTO tbl_luong_tlnn VALUES("2","1","2","4.5","2","3","2012-09-26","","1");
INSERT INTO tbl_luong_tlnn VALUES("3","1","3","5.5","1","","2012-09-26","","1");
INSERT INTO tbl_luong_tlnn VALUES("4","3","1","2.8","2","3","2012-09-26","","1");
INSERT INTO tbl_luong_tlnn VALUES("5","3","2","3.2","2","3","2012-09-26","","1");
INSERT INTO tbl_luong_tlnn VALUES("6","3","3","3.6","2","2","2012-09-26","","1");
INSERT INTO tbl_luong_tlnn VALUES("7","3","4","4","1","","2012-09-26","","1");
INSERT INTO tbl_luong_tlnn VALUES("8","2","1","3","2","3","2012-09-26","","1");
INSERT INTO tbl_luong_tlnn VALUES("9","2","2","3.4","2","3","2012-09-26","","1");
INSERT INTO tbl_luong_tlnn VALUES("10","2","3","3.8","2","2","2012-09-26","","1");
INSERT INTO tbl_luong_tlnn VALUES("11","2","4","4.2","1","","2012-09-26","","1");
INSERT INTO tbl_luong_tlnn VALUES("12","4","1","2.8","2","3","2012-09-26","","1");
INSERT INTO tbl_luong_tlnn VALUES("13","5","1","2.4","2","3","2012-09-26","","1");
INSERT INTO tbl_luong_tlnn VALUES("14","6","1","2","2","2","2012-09-26","","1");



DROP TABLE tbl_modules;

CREATE TABLE `tbl_modules` (
  `mod_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_name` varchar(255) DEFAULT NULL,
  `mod_desc` varchar(255) DEFAULT NULL,
  `mod_date` datetime DEFAULT NULL,
  `mod_sort` int(11) DEFAULT '0',
  `mod_active` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`mod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=utf8;

INSERT INTO tbl_modules VALUES("259","chat","","","0","0");
INSERT INTO tbl_modules VALUES("260","config","","","0","0");
INSERT INTO tbl_modules VALUES("261","congviecs","","","0","0");
INSERT INTO tbl_modules VALUES("262","daydocs","","","0","0");
INSERT INTO tbl_modules VALUES("263","departments","","","0","0");
INSERT INTO tbl_modules VALUES("264","docs","","","0","0");
INSERT INTO tbl_modules VALUES("265","hdsds","","","0","0");
INSERT INTO tbl_modules VALUES("266","holidays","","","0","0");
INSERT INTO tbl_modules VALUES("267","importants","","","0","0");
INSERT INTO tbl_modules VALUES("268","interdiscis","","","0","0");
INSERT INTO tbl_modules VALUES("269","kdls","","","0","0");
INSERT INTO tbl_modules VALUES("270","modules","","","0","0");
INSERT INTO tbl_modules VALUES("271","msgs","","","0","0");
INSERT INTO tbl_modules VALUES("272","objects","","","0","0");
INSERT INTO tbl_modules VALUES("273","plans","","","0","0");
INSERT INTO tbl_modules VALUES("274","ports","","","0","0");
INSERT INTO tbl_modules VALUES("275","secrets","","","0","0");
INSERT INTO tbl_modules VALUES("276","signobjs","","","0","0");
INSERT INTO tbl_modules VALUES("277","signpers","","","0","0");
INSERT INTO tbl_modules VALUES("278","thamgia","","","0","0");
INSERT INTO tbl_modules VALUES("280","trinhdos","","","0","0");
INSERT INTO tbl_modules VALUES("282","units","","","0","0");
INSERT INTO tbl_modules VALUES("283","users","","","0","0");
INSERT INTO tbl_modules VALUES("284","vttbs","","","0","0");
INSERT INTO tbl_modules VALUES("285","truyennhans","","","0","0");
INSERT INTO tbl_modules VALUES("288","tthopdong","","","0","0");
INSERT INTO tbl_modules VALUES("289","hdmua","","","0","0");
INSERT INTO tbl_modules VALUES("290","tinhluong","","","0","0");



DROP TABLE tbl_msgs;

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

INSERT INTO tbl_msgs VALUES("1","1","7,11,14","","Thông báo t? ch?c h?p công ty.","2013-03-25","0","0");
INSERT INTO tbl_msgs VALUES("9","14","1,10,12,18","","Tin nh?n lúc n?a ?êm","2013-03-25","0","0");
INSERT INTO tbl_msgs VALUES("10","1","","","Tin nh?n nháp 02 - 123456","2013-03-26","","");
INSERT INTO tbl_msgs VALUES("15","1","0","","Tin nh?n nháp 03","2013-03-26","0","0");
INSERT INTO tbl_msgs VALUES("16","14","1,10,12,18","","Thông báo ?ã hoàn thành ch?c n?ng tin nh?n\n1. So?n tin\n2. H?p th? ??n\n3. H?p th? ?i\n4. Tin nháp\n5. Tin rác\n6. Tin quan tr?ng","2013-03-26","0","0");
INSERT INTO tbl_msgs VALUES("17","16","15","","g?i tin nh?n ??n nguy?n v?n D?ng","2013-03-26","0","0");
INSERT INTO tbl_msgs VALUES("18","16","9,13,15","","chuy?n ??n nguy?n ng?c hi?n","2013-03-26","0","0");
INSERT INTO tbl_msgs VALUES("19","1","8,16,17","","thông báo tin nh?n ??n t? trung tâm tin nh?n 19001098","2013-03-26","0","0");
INSERT INTO tbl_msgs VALUES("20","16","9,13,15","","tin nh?n ??n t? trung tâm sài gòn","2013-03-26","0","0");
INSERT INTO tbl_msgs VALUES("21","16","8,16,17","","g?i tin nh?n ??n lê v?n d?ng","2013-03-26","0","0");
INSERT INTO tbl_msgs VALUES("22","16","8,16,17","","thông báo kh?n ?? ngh? các ??ng chí kh?n tr??ng th?c hi?n","2013-03-26","0","0");
INSERT INTO tbl_msgs VALUES("23","16","8,16,17","","thông báo kh?n ?? ngh? các ??ng chí kh?n tr??ng th?c hi?n","2013-03-26","0","0");
INSERT INTO tbl_msgs VALUES("24","16","8,16,17","","?? ngh? các ??ng chí kh?n tr??ng th?c hi?n","2013-03-26","0","0");
INSERT INTO tbl_msgs VALUES("25","1","11","","tin nh?n m?i","2013-03-26","0","0");
INSERT INTO tbl_msgs VALUES("26","1","7,11,14","","th? g?i m?i nh?t","2013-03-26","0","0");
INSERT INTO tbl_msgs VALUES("27","23","9,13,15","","lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll","2013-04-23","0","0");
INSERT INTO tbl_msgs VALUES("28","24","8","","?ã làm xon tài li?u ch?a b?n","2013-04-24","0","0");



DROP TABLE tbl_msgusers;

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

INSERT INTO tbl_msgusers VALUES("1","1","7","0","0");
INSERT INTO tbl_msgusers VALUES("2","1","11","0","0");
INSERT INTO tbl_msgusers VALUES("3","1","14","0","0");
INSERT INTO tbl_msgusers VALUES("22","9","1","0","1");
INSERT INTO tbl_msgusers VALUES("23","9","10","0","0");
INSERT INTO tbl_msgusers VALUES("24","9","12","0","0");
INSERT INTO tbl_msgusers VALUES("25","9","18","0","0");
INSERT INTO tbl_msgusers VALUES("26","10","1","1","1");
INSERT INTO tbl_msgusers VALUES("27","10","10","0","0");
INSERT INTO tbl_msgusers VALUES("28","10","12","0","0");
INSERT INTO tbl_msgusers VALUES("29","10","18","0","0");
INSERT INTO tbl_msgusers VALUES("30","16","1","0","1");
INSERT INTO tbl_msgusers VALUES("31","16","10","0","0");
INSERT INTO tbl_msgusers VALUES("32","16","12","0","0");
INSERT INTO tbl_msgusers VALUES("33","16","18","0","0");
INSERT INTO tbl_msgusers VALUES("34","17","15","0","0");
INSERT INTO tbl_msgusers VALUES("35","18","9","0","0");
INSERT INTO tbl_msgusers VALUES("36","18","13","0","0");
INSERT INTO tbl_msgusers VALUES("37","18","15","0","0");
INSERT INTO tbl_msgusers VALUES("38","19","8","0","0");
INSERT INTO tbl_msgusers VALUES("39","19","16","1","0");
INSERT INTO tbl_msgusers VALUES("40","19","17","0","0");
INSERT INTO tbl_msgusers VALUES("41","20","9","0","0");
INSERT INTO tbl_msgusers VALUES("42","20","13","0","0");
INSERT INTO tbl_msgusers VALUES("43","20","15","0","0");
INSERT INTO tbl_msgusers VALUES("44","21","8","0","0");
INSERT INTO tbl_msgusers VALUES("45","21","16","0","0");
INSERT INTO tbl_msgusers VALUES("46","21","17","0","0");
INSERT INTO tbl_msgusers VALUES("47","22","8","0","0");
INSERT INTO tbl_msgusers VALUES("48","22","16","0","0");
INSERT INTO tbl_msgusers VALUES("49","22","17","0","0");
INSERT INTO tbl_msgusers VALUES("50","23","8","0","0");
INSERT INTO tbl_msgusers VALUES("51","23","16","0","0");
INSERT INTO tbl_msgusers VALUES("52","23","17","0","0");
INSERT INTO tbl_msgusers VALUES("53","24","8","0","0");
INSERT INTO tbl_msgusers VALUES("54","24","16","0","0");
INSERT INTO tbl_msgusers VALUES("55","24","17","0","0");
INSERT INTO tbl_msgusers VALUES("56","25","11","0","0");
INSERT INTO tbl_msgusers VALUES("57","26","7","0","0");
INSERT INTO tbl_msgusers VALUES("58","26","11","0","0");
INSERT INTO tbl_msgusers VALUES("59","26","14","0","0");
INSERT INTO tbl_msgusers VALUES("60","27","9","0","0");
INSERT INTO tbl_msgusers VALUES("61","27","13","0","0");
INSERT INTO tbl_msgusers VALUES("62","27","15","0","0");
INSERT INTO tbl_msgusers VALUES("63","28","8","0","1");



DROP TABLE tbl_objects;

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

INSERT INTO tbl_objects VALUES("1","Giám ??c công ty","G?CT","Giám ??c công ty","2015-11-20 00:00:00","","1","");
INSERT INTO tbl_objects VALUES("2","Phó Giám ??c công ty","PG?CT","Phó Giám ??c công ty","2015-11-20 00:00:00","","1","");
INSERT INTO tbl_objects VALUES("3","Giám ??c xí nghi?p","G?XN","Giám ??c xí nghi?p","2015-11-20 00:00:00","","1","");
INSERT INTO tbl_objects VALUES("4","Tr??ng phòng/ban","TP","Tr??ng phòng là ng??i qu?n lý 1 phòng / ban nào ?ó.","2012-09-24 00:00:00","","1","");
INSERT INTO tbl_objects VALUES("5","Phó tr??ng phòng/ban","PTP","Phó tr??ng phòng / ban là ng??i giúp tr??ng phòng / ban chia s? công vi?c trong phòng.","2012-09-24 00:00:00","0","1","");
INSERT INTO tbl_objects VALUES("6","Nhân viên","NV","Nhân viên","2015-11-20 00:00:00","","1","");



DROP TABLE tbl_plan_details;

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

INSERT INTO tbl_plan_details VALUES("1","Bàn giao các c?n h? chung c? cao t?ng OCT5 thu?c D? án Xây d?ng nhà ? CBNV các Ban ??ng Thành ?y và H?ND Tp.Hà N?i (T? ngày 03/11/2015 - ngày 31/11/2015)","2015-11-23 08:00:00","2015-11-23 11:30:00","D? án Thành ?y","","","Theo thông báo s? 79/TB-TLKT ngày 29/10/2015","2015-11-24","31");
INSERT INTO tbl_plan_details VALUES("2","Giao ban công tr??ng d? án HTKT K?TM ??i Kim","2015-11-23 14:00:00","2015-11-23 16:30:00","D? án ??i Kim","Q. Tr??ng ban QLDA HTKT ??i Kim","Ban QLDA HTKT ??i Kim","M?i ?/c Thanh - G? Công ty;\nM?i ?/c Quang - PG? Công ty;\nBan QLDA HTKT ??i Kim;\n??i di?n các nhà th?u t?i d? án","2015-11-24","31");
INSERT INTO tbl_plan_details VALUES("4","Ki?m tra an toàn v? PCCC ??i v?i làng sinh viên Hacinco","2015-11-25 09:00:00","2015-11-25 10:30:00","LSV Hacinco","Phòng c?nh sát PCCC s? 8","P.KHKT, XNDV và KDN, XNDV Hacinco, KSTT","?/c Vân - PG? Công ty;\nP.KHKT, XNDV và KDN, XNDV Hacinco, KSTT","2015-11-24","37");
INSERT INTO tbl_plan_details VALUES("5","Làm vi?c v?i XNDV Hacinco v? công tác b?o v? ANTT nhà OCT5","2015-11-24 09:00:00","2015-11-24 11:30:00","VP d? án Thành ?y","?/c Long - PG? Công ty","XNDV Hacinco","?/c Long - PG? Công ty;\n?/c Long - Phó ban ?i?u hành d? án Thành ?y;\nBQL v?n hành nhà OCT5;\nNhân viên hành chính BQL v?n hành nhà OCT5;\nLãnh ??o XNDV Hacinco;\nT? tr??ng t? b?o v? nhà OCT5","2015-11-24","38");
INSERT INTO tbl_plan_details VALUES("6","Tham d? cu?c h?p t?i công ty QLPT nhà Hà N?i v? d? án khu ?o th? ??i Kim giai ?o?n 3","2015-11-24 08:30:00","2015-11-24 11:30:00","Công ty QLPT nhà Hà N?i","Nguy?n V?n Khang","","","2016-01-17","31");
INSERT INTO tbl_plan_details VALUES("7","V/v t?ng duy?t d? án tr??ng cao ??ng ngh? Nhôn, B?c T? Liêm","2015-11-25 14:00:00","2015-11-25 16:00:00","UBND qu?n B?c T? Liêm, Ph? Ki?u Mai","Nguy?n Xuân S?n","","","2016-01-17","31");
INSERT INTO tbl_plan_details VALUES("8","Tham h?i ngh? công ?oàn công ty Hacinco","2015-11-26 08:30:00","2015-11-26 10:30:00","H?i tr??ng công ty","Nguy?n V?n Thanh","","","2016-01-17","31");
INSERT INTO tbl_plan_details VALUES("9","Ch?nh s?a toàn b? giao di?n c? hi?n có","2018-12-17 08:00:00","2018-12-17 12:00:00","V?n phòng Cty","Nguy?n V?n Thanh","Nguy?n Bá Vân","Lê Anh V?n","2018-12-17","1");



DROP TABLE tbl_plancats;

CREATE TABLE `tbl_plancats` (
  `plancat_id` int(11) NOT NULL AUTO_INCREMENT,
  `plancat_name` varchar(250) DEFAULT NULL,
  `plancat_date` date DEFAULT NULL,
  `plancat_sort` int(11) DEFAULT NULL,
  `plancat_active` tinyint(4) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`plancat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE tbl_plans;

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




DROP TABLE tbl_ports;

CREATE TABLE `tbl_ports` (
  `port_id` int(11) NOT NULL AUTO_INCREMENT,
  `port_name` varchar(50) DEFAULT NULL,
  `port_date` date DEFAULT NULL,
  `port_sort` int(11) DEFAULT NULL,
  `port_active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`port_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

INSERT INTO tbl_ports VALUES("1","COM1","2012-05-16","0","1");
INSERT INTO tbl_ports VALUES("2","COM2","2012-05-16","8","1");
INSERT INTO tbl_ports VALUES("3","COM3","2012-05-16","","1");
INSERT INTO tbl_ports VALUES("4","COM4","2012-05-16","3","1");
INSERT INTO tbl_ports VALUES("5","COM5","2012-05-16","","1");
INSERT INTO tbl_ports VALUES("6","COM6","2012-05-16","","1");
INSERT INTO tbl_ports VALUES("7","COM7","2012-05-16","","1");
INSERT INTO tbl_ports VALUES("8","COM8","2012-05-16","14","1");
INSERT INTO tbl_ports VALUES("9","COM9","2012-05-16","","1");
INSERT INTO tbl_ports VALUES("10","COM10","2012-05-16","0","1");
INSERT INTO tbl_ports VALUES("15","COM11","2012-09-21","","1");
INSERT INTO tbl_ports VALUES("16","COM12","2012-09-21","","1");
INSERT INTO tbl_ports VALUES("17","COM13","2012-09-21","","1");
INSERT INTO tbl_ports VALUES("19","COM14","2012-09-21","9","1");
INSERT INTO tbl_ports VALUES("21","COM13","2013-04-23","4","1");



DROP TABLE tbl_receives;

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

INSERT INTO tbl_receives VALUES("1","1","17","0","","2016-01-17 10:01:13","0","0","0","","0");
INSERT INTO tbl_receives VALUES("2","1","23","0","","2016-01-17 10:01:13","0","0","0","","0");



DROP TABLE tbl_recusers;

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

INSERT INTO tbl_recusers VALUES("1","43","1","","0","2016-01-17 10:01:13");
INSERT INTO tbl_recusers VALUES("2","46","2","","0","2016-01-17 10:01:13");
INSERT INTO tbl_recusers VALUES("3","47","2","","0","2016-01-17 10:01:13");



DROP TABLE tbl_secrets;

CREATE TABLE `tbl_secrets` (
  `secret_id` int(11) NOT NULL AUTO_INCREMENT,
  `secret_name` varchar(250) DEFAULT NULL,
  `secret_desc` text,
  `secret_date` datetime DEFAULT NULL,
  `secret_sort` int(11) DEFAULT '0',
  `secret_active` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`secret_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO tbl_secrets VALUES("1","Bình th??ng","<p>&#160;</p>","2011-04-12 00:00:00","0","1");
INSERT INTO tbl_secrets VALUES("2","M?t","<p>&#160;</p>","2011-07-25 00:00:00","0","1");
INSERT INTO tbl_secrets VALUES("3","T?i m?t","<p>&#160;</p>","2011-07-25 00:00:00","0","1");



DROP TABLE tbl_signobjs;

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

INSERT INTO tbl_signobjs VALUES("1","B? tr??ng","Bo truong","<p>&#160;</p>","2011-04-21 00:00:00","","1");
INSERT INTO tbl_signobjs VALUES("2","Ch? t?ch","Chu tich","<p>&#160;</p>","2011-04-20 00:00:00","","1");
INSERT INTO tbl_signobjs VALUES("3","Phó ch? t?ch","Pho chu tich","<p>&#160;</p>","2011-04-20 00:00:00","","1");
INSERT INTO tbl_signobjs VALUES("4","Th? tr??ng","Thu truong","<p>&#160;</p>","2011-04-20 00:00:00","","1");
INSERT INTO tbl_signobjs VALUES("5","Giám ??c","Giam doc","<p>&#160;</p>","2011-04-20 00:00:00","","1");
INSERT INTO tbl_signobjs VALUES("6","Phó giám ??c","Pho giam doc","<p>&#160;</p>","2011-04-20 00:00:00","","1");
INSERT INTO tbl_signobjs VALUES("7","Tr??ng phòng","Truong phong","<p>&#160;</p>","2011-04-20 00:00:00","","1");
INSERT INTO tbl_signobjs VALUES("8","Phó tr??ng phòng","Pho truong phong","<p>&#160;</p>","2011-04-20 00:00:00","","1");
INSERT INTO tbl_signobjs VALUES("9","Phó V?n Phòng","Pho Van Phong","<p>&#160;</p>","","0","1");
INSERT INTO tbl_signobjs VALUES("10","Chánh V?n Phòng","Chanh Van Phong","<p>&#160;</p>","","0","1");
INSERT INTO tbl_signobjs VALUES("11","V? Tr??ng","Vu Truong","<p>&#160;</p>","","0","1");
INSERT INTO tbl_signobjs VALUES("12","T?ng Giám ??c","Tong Giam Doc","<p>&#160;</p>","","0","1");
INSERT INTO tbl_signobjs VALUES("13","Phó T?ng Giám ??c","Pho Tong Giam Doc","<p>&#160;</p>","","0","1");
INSERT INTO tbl_signobjs VALUES("14","Ch? t?ch kiêm T?ng Giám ??c","Chu tich kiem Tong Giam Doc","<p>&#160;</p>","","0","1");
INSERT INTO tbl_signobjs VALUES("15","C?c tr??ng","Cuc truong","<p>&#160;</p>","","0","1");
INSERT INTO tbl_signobjs VALUES("16","Phó C?c tr??ng","Pho Cuc truong","<p>&#160;</p>","","0","1");
INSERT INTO tbl_signobjs VALUES("17","Tr??ng ban","Truong ban","<p>&#160;</p>","","0","1");
INSERT INTO tbl_signobjs VALUES("18","Phó tr??ng ban","Pho truong ban","<p>&#160;</p>","","0","1");
INSERT INTO tbl_signobjs VALUES("19","Phó Chánh V?n Phòng","Pho Chanh Van Phong","<p>&#160;</p>","","0","1");
INSERT INTO tbl_signobjs VALUES("20","Phó Bí Th? Th??ng Tr?c","Pho Bi Thu Thuong Truc","<p>&#160;</p>","","0","1");
INSERT INTO tbl_signobjs VALUES("21","Vi?n tr??ng","Vien truong","<p>&#160;</p>","","0","1");
INSERT INTO tbl_signobjs VALUES("22","Chi c?c tr??ng","Chi cuc truong","<p>&#160;</p>","","0","1");
INSERT INTO tbl_signobjs VALUES("23","Phó V? Tr??ng","Pho Vu Truong","<p>&#160;</p>","","0","1");
INSERT INTO tbl_signobjs VALUES("24","Phó Chi C?c tr??ng","Pho Chi Cuc truong","<p>&#160;</p>","","0","1");
INSERT INTO tbl_signobjs VALUES("25","Chánh Thanh Tra","Chanh Thanh Tra","<p>&#160;</p>","","0","1");
INSERT INTO tbl_signobjs VALUES("26","Chính Ph?","Chinh Phu","<p>&#160;</p>","","0","1");
INSERT INTO tbl_signobjs VALUES("27","C?c tr??ng C?c QL Giá","Cuc truong Cuc QL Gia","<p>&#160;</p>","","0","1");
INSERT INTO tbl_signobjs VALUES("28","Phó T? L?nh-Tham m?u tr??ng","Pho Tu LenhTham muu truong","<p>&#160;</p>","","0","1");
INSERT INTO tbl_signobjs VALUES("29","Phó Ban Th??ng Tr?c","Pho Ban Thuong Truc","<p>&#160;</p>","","0","1");
INSERT INTO tbl_signobjs VALUES("30","Phó Chánh Thanh tra","Pho Chanh Thanh tra","<p>&#160;</p>","","0","1");
INSERT INTO tbl_signobjs VALUES("31","Tr??ng ?oàn","Truong Doan","<p>&#160;</p>","","0","1");
INSERT INTO tbl_signobjs VALUES("32","Bí th?","Bi thu","<p>&#160;</p>","","0","1");
INSERT INTO tbl_signobjs VALUES("33","Hi?u Tr??ng","Hieu Truong","<p>&#160;</p>","","0","1");
INSERT INTO tbl_signobjs VALUES("34","Phó T?ng C?c Tr??ng","Pho Tong Cuc Truong","<p>&#160;</p>","","0","1");
INSERT INTO tbl_signobjs VALUES("35","Ch? nhi?m","Chu nhiem","<p>&#160;</p>","","0","1");
INSERT INTO tbl_signobjs VALUES("36","Phó Ch? Nhi?m","Pho Chu Nhiem","<p>&#160;</p>","","0","1");
INSERT INTO tbl_signobjs VALUES("37","Ph? Trách chung","Phu Trach chung","<p>&#160;</p>","","0","1");
INSERT INTO tbl_signobjs VALUES("38","Phó ch? t?ch Th??ng Tr?c","Pho chu tich Thuong Truc","<p>&#160;</p>","","0","1");
INSERT INTO tbl_signobjs VALUES("39","T?ng Biên T?p","Tong Bien Tap","<p>&#160;</p>","","0","1");
INSERT INTO tbl_signobjs VALUES("40","Ch? t?ch H?i ??ng ??nh giá","Chu tich Hoi dong Dinh gia","<p>&#160;</p>","","0","1");
INSERT INTO tbl_signobjs VALUES("41","Tr??ng C? Quan Th??ng tr?c","Truong Co Quan Thuong truc","<p>&#160;</p>","","0","1");
INSERT INTO tbl_signobjs VALUES("42","Phó tr??ng ban Th??ng tr?c","Pho truong ban Thuong truc","<p>&#160;</p>","","0","1");
INSERT INTO tbl_signobjs VALUES("43","Chính tr? Viên","Chinh tri Vien","<p>&#160;</p>","","0","1");
INSERT INTO tbl_signobjs VALUES("44","U? viên th??ng tr?c","Uy vien thuong truc","<p>&#160;</p>","","0","1");
INSERT INTO tbl_signobjs VALUES("45","Ch? huy tr??ng","Chi huy truong","<p>&#160;</p>","","0","1");



DROP TABLE tbl_signpers;

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

INSERT INTO tbl_signpers VALUES("1","Tr??ng M? Hoa","Truong My Hoa","<p>Phó ch? t?ch n??c</p>","2011-04-20 00:00:00","","1");
INSERT INTO tbl_signpers VALUES("2","Nguy?n Th? Th?o","Nguyen The Thao","<p>Ch? t?ch UBND&#160;TP</p>","2011-04-20 00:00:00","","1");
INSERT INTO tbl_signpers VALUES("3","Hoàng M?nh Hi?n","Hoang Manh Hien","<p>Phó CT UBND TP</p>","2011-04-20 00:00:00","","1");
INSERT INTO tbl_signpers VALUES("4","V? H?ng Khanh","Vu Hong Khanh","<p>Phó CT UBND TP</p>","2011-04-20 00:00:00","","1");
INSERT INTO tbl_signpers VALUES("5","V? V?n Ninh","Vu Van Ninh","<p>B? tr??ng B? Tài Chính</p>","2011-04-21 00:00:00","","1");
INSERT INTO tbl_signpers VALUES("6","Lý V?n Giao","Ly Van Giao","<p>&#160;</p>","2011-04-25 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("7","Nguy?n V?n Th?nh","Nguyen Van Thinh","<p>&#160;</p>","2011-04-25 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("8","?? ?ình H?ng","Do Dinh Hong","<p>&#160;</p>","2011-04-25 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("9","Tr?nh Duy Hùng","Trinh Duy Hung","<p>&#160;</p>","2011-04-25 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("10","Nguy?n Ng?c S?n","Nguyen Ngoc Son","<p>&#160;</p>","2011-04-25 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("11","Phí Thái Bình","Phi Thai Binh","<p>&#160;</p>","2011-04-25 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("12","Nguy?n Th? Bích Ng?c","Nguyen Thi Bich Ngoc","<p>Phó Ch? T?ch</p>","2011-04-28 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("13","Nguy?n Huy T??ng","Nguyen Huy Tuong","<p>Phó Ch? T?ch</p>","2011-04-28 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("14","Nguy?n Th?nh Thành","Nguyen Thinh Thanh","<p>Phó V?n Phòng</p>","2011-04-28 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("15","Nguy?n V?n S?u","Nguyen Van Suu","<p>Giám ??c</p>","2011-04-28 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("16","Nguy?n Th? Bài","Nguyen Thi Bai","<p>Phó Giám ??c</p>","2011-04-28 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("17","Tr?n ??c V?","Tran Duc Vu","<p>Phó Giám ??c</p>","2011-04-28 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("18","Tr?n Ng?c Nam","Tran Ngoc Nam","<p>Phó Giám ??c</p>","2011-04-28 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("19","Ph?m V?n Kh??ng","Pham Van Khuong","<p>Phó Giám ??c</p>","2011-04-28 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("20","Nguy?n Danh C?","Nguyen Danh Co","<p>Chánh V?n Phòng</p>","2011-04-28 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("21","Hà V?n Qu?","Ha Van Que","<p>Giám ??c</p>","2011-04-28 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("22","Nguy?n Qu?c Tu?n","Nguyen Quoc Tuan","<p>&#160;</p>","2011-04-28 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("23","Nguy?n H?u ??","Nguyen Huu Do","<p>&#160;</p>","2011-04-28 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("24","L?u Ti?n ??nh","Luu Tien Dinh","<p>&#160;</p>","2011-04-28 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("25","Hà Minh H?i","Ha Minh Hai","<p>&#160;</p>","2011-05-06 00:00:00","0","1");



DROP TABLE tbl_suachuas;

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




DROP TABLE tbl_thaythes;

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




DROP TABLE tbl_trinhdos;

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

INSERT INTO tbl_trinhdos VALUES("1","Cao h?c","CH","Trình ?? cao h?c, b?ng th?c s?","2012-09-27","","1");
INSERT INTO tbl_trinhdos VALUES("2","??i h?c","?H","Trình ?? ??i h?c, b?ng c? nhân ho?c b?ng t?t nghi?p.","2012-09-27","","1");
INSERT INTO tbl_trinhdos VALUES("3","Cao ??ng","C?","Trình ?? cao ??ng, b?ng c? nhân ho?c b?ng t?t nghi?p","2012-09-27","","1");
INSERT INTO tbl_trinhdos VALUES("4","K? s? - Ki?n trúc s?","KS-KTS","??i h?c t? 4.5 n?m - 5 n?m, b?ng k? s? / ki?n trúc s?.","2012-09-27","","1");
INSERT INTO tbl_trinhdos VALUES("5","Trung c?p","TC","Trình ?? trung c?p, b?ng t?t nghi?p","2012-09-27","","1");



DROP TABLE tbl_units;

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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

INSERT INTO tbl_units VALUES("2","Thành ?y Hà N?i","Thanh Uy Ha Noi","<p>Thành ?y Hà N?i</p>","2011-04-20 00:00:00","","1","");
INSERT INTO tbl_units VALUES("3","B? tài chính","Bo tai chinh","<p>B? tài chính</p>","2011-04-20 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("4","B? n?i v?","Bo noi vu","<p>B? n?i v?</p>","2011-04-20 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("5","B? công th??ng","Bo cong thuong","<p>B? công th??ng</p>","2011-04-20 00:00:00","","1","");
INSERT INTO tbl_units VALUES("6","?ài phát thanh và truy?n hình HN.","Dai phat thanh va truyen hinh HN.","<p>&#160;</p>","2011-04-25 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("7","Ban Qu?n lý ph? c? HN","Ban Quan ly pho co HN","<p>&#160;</p>","2011-04-25 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("8","Công an TP HN.","Cong an TP HN.","<p>&#160;</p>","2011-04-25 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("10","Chi C?c ki?m lâm HN","Chi Cuc kiem lam HN","<p>&#160;</p>","2011-04-25 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("11","Công ty QL và PT nhà HN","Cong ty QL va PT nha HN","<p>&#160;</p>","2011-04-25 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("13","H?i Ch? th?p ?? TPHN","Hoi Chu thap do TPHN","<p>&#160;</p>","2011-04-25 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("14","H?i C?u chi?n binh TPHN","Hoi Cuu chien binh TPHN","<p>&#160;</p>","2011-04-25 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("15","H?i Liên hi?p ph? n? TPHN","Hoi Lien hiep phu nu TPHN","<p>&#160;</p>","2011-04-25 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("16","H?i Liên hi?p v?n h?c ngh? thu?t TPHN","Hoi Lien hiep van hoc nghe thuat TPHN","<p>&#160;</p>","2011-04-25 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("17","H?i Lu?t gia HN","Hoi Luat gia HN","<p>&#160;</p>","2011-04-25 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("18","H?i Nông dân HN","Hoi Nong dan HN","<p>&#160;</p>","2011-04-25 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("19","H?i ng??i mù HN","Hoi nguoi mu HN","<p>&#160;</p>","2011-04-25 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("20","H?i nhà báo HN","Hoi nha bao HN","<p>&#160;</p>","2011-04-25 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("21","Liên ?oàn lao ??ng TPHN","Lien doan lao dong TPHN","<p>&#160;</p>","2011-04-25 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("22","Liên hi?p các h?i khoa h?c và k? thu?t HN","Lien hiep cac hoi khoa hoc va ky thuat HN","<p>&#160;</p>","2011-04-25 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("23","Liên hi?p các t? ch?c h?u ngh? TPHN","Lien hiep cac to chuc huu nghi TPHN","<p>&#160;</p>","2011-04-25 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("24","Liên minh các HTX TPHN","Lien minh cac HTX TPHN","<p>&#160;</p>","2011-04-25 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("25","Phòng công ch?ng NN s? 1","Phong cong chung NN so 1","<p>&#160;</p>","2011-04-25 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("26","Phòng công ch?ng NN s? 2","Phong cong chung NN so 2","<p>&#160;</p>","2011-04-25 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("27","Phòng công ch?ng NN s? 3","Phong cong chung NN so 3","<p>&#160;</p>","2011-04-25 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("28","Phòng công ch?ng NN s? 4","Phong cong chung NN so 4","<p>&#160;</p>","2011-04-25 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("34","Phòng TCKH Gia Lâm","Phong TCKH Gia Lam","<p>&#160;</p>","2011-04-25 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("35","Phòng TCKH ?ông Anh","Phong TCKH Dong Anh","<p>&#160;</p>","2011-04-25 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("36","Phòng TCKH Sóc S?n","Phong TCKH Soc Son","<p>&#160;</p>","2011-04-25 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("37","Phòng TCKH Thanh Trì","Phong TCKH Thanh Tri","<p>&#160;</p>","2011-04-25 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("38","Phòng TCKH T? Liêm","Phong TCKH Tu Liem","<p>&#160;</p>","2011-04-25 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("39","Phòng TCKH ??ng ?a","Phong TCKH Dong Da","<p>&#160;</p>","2011-04-25 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("40","Phòng TCKH Ba ?ình","Phong TCKH Ba Dinh","<p>&#160;</p>","2011-04-25 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("41","UBND thành ph? HN","UBND thanh pho HN","<p>&#160;</p>","2011-04-25 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("42","V?n phòng UBND-HN","Van phong UBNDHN","<p>&#160;</p>","2011-04-25 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("43","S? K? ho?ch ??u t? TPHN","So Ke hoach dau tu TPHN","<p>&#160;</p>","2011-04-25 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("44","S? Nông Nghi?p & PTNT TPHN","So Nong Nghiep & PTNT TPHN","<p>&#160;</p>","2011-04-28 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("45","S? N?i V? TPHN","So Noi Vu TPHN","<p>&#160;</p>","2011-04-28 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("46","S? Ngo?i V? TPHN","So Ngoai Vu TPHN","<p>&#160;</p>","2011-04-28 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("47","S? Quy Ho?ch Ki?n Trúc TPHN","So Quy Hoach Kien Truc TPHN","<p>&#160;</p>","2011-04-28 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("48","S? Giao Thông TPHN","So Giao Thong TPHN","<p>&#160;</p>","2011-04-28 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("49","S? Xây D?ng TPHN","So Xay Dung TPHN","<p>&#160;</p>","2011-04-28 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("50","Ban Th??ng V? H?i LHPN Hà N?i","Ban Thuong Vu Hoi LHPN Ha Noi","<p>&#160;</p>","2011-04-28 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("51","Công ty C? ph?n Thép Hòa Phát","Cong ty Co phan Thep Hoa Phat","","2018-12-26 00:00:00","0","1","");



DROP TABLE tbl_users;

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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

INSERT INTO tbl_users VALUES("1","3,","3","6","Qu?n tr?","admin","e10adc3949ba59abbe56e057f20f883e","123456","0972559746","anhvan3103@gmail.com","","images/userimg/large_images/1361246911_P1040778.jpg","1","1986-03-31","T? Liêm, Hà N?i","Xuân ??nh, T? Liêm, Hà N?i","S? 23, ktt X-827, thôn Tân Xuân, Xuân ??nh, T? Liêm, HN","5","012504687","2002-03-30","Công an TP. Hà N?i","2010-01-01","01035890624","0","","","","","","3","","","1","1","3","1");
INSERT INTO tbl_users VALUES("31","12,26,27,13,28,25,15,17,18,16,14,24,23,21,19,20,22,","12","1","Nguy?n V?n Thanh","thanhnv","e10adc3949ba59abbe56e057f20f883e","123456","0972559746","anhvan3103@gmail.com","","","1","2015-11-20","","","","2","","2015-11-20","","2015-01-01","","","","","","","","3","","","4","3","3","1");
INSERT INTO tbl_users VALUES("37","12,26,27,13,28,25,15,17,18,16,14,24,23,21,19,20,22,","12","2","Nguy?n Bá Vân","vannb","e10adc3949ba59abbe56e057f20f883e","123456","0972559746","anhvan3103@gmail.com","","","1","2014-02-22","","","","1","","2014-02-22","","2010-01-01","","","","","","","","3","","","5","3","3","1");
INSERT INTO tbl_users VALUES("38","12,26,27,13,28,25,15,17,18,16,14,24,23,21,19,20,22,","12","2","Nguy?n Th?ng Long","longnt","e10adc3949ba59abbe56e057f20f883e","123456","0972559746","anhvan3103@gmail.com","","","1","2015-11-20","","","","2","","2015-11-20","","2010-01-01","","","","","","","","3","","","5","3","3","1");
INSERT INTO tbl_users VALUES("39","12,26,27,13,28,25,15,17,18,16,14,24,23,21,19,20,22,","12","2","V? ??c Tòng","tongvd","e10adc3949ba59abbe56e057f20f883e","123456","0972559746","anhvan3103@gmail.com","","","1","2015-11-20","","","","2","","2015-11-20","","2010-01-01","","","","","","","","3","","","5","3","3","1");
INSERT INTO tbl_users VALUES("40","15,","15","6","V?n th?","vanthu","e10adc3949ba59abbe56e057f20f883e","123456","01697613570","vanthu@hacinco.com.vn","","","1","2015-11-20","","","","2","","2015-11-20","","2010-01-01","","","","","","","","3","","","2","3","3","1");
INSERT INTO tbl_users VALUES("41","13,","13","6","Tr? lý","troly","e10adc3949ba59abbe56e057f20f883e","123456","0972559746","troly@hacinco.com.vn","","","1","--","","","","2","","--","","2010-01-01","","","0","0","0","0","0","3","0","0","3","3","3","1");
INSERT INTO tbl_users VALUES("42","15,","15","4","Tr??ng phòng HC","tphc","e10adc3949ba59abbe56e057f20f883e","123456","0972559746","anhvan3103@gmail.com","","","1","--","","","","2","","--","","2010-01-01","","","0","0","0","0","0","3","0","0","6","3","3","1");
INSERT INTO tbl_users VALUES("43","17,","17","4","Tr??ng phòng KHKT","tpkhkt","e10adc3949ba59abbe56e057f20f883e","123456","0972559746","anhvan3103@gmail.com","","","1","--","","","","2","","--","","2010-01-01","","","0","0","0","0","0","3","0","0","6","3","3","1");
INSERT INTO tbl_users VALUES("44","26,","26","4","Tr??ng ban QLDA1","tbqlda1","e10adc3949ba59abbe56e057f20f883e","123456","0972559746","anhvan3103@gmail.com","","","1","--","","","","2","","--","","2010-01-01","","","0","0","0","0","0","3","0","0","6","3","3","1");
INSERT INTO tbl_users VALUES("45","27,","27","4","Tr??ng ban QLDA2","tbqlda2","e10adc3949ba59abbe56e057f20f883e","123456","0972559746","anhvan3103@gmail.com","","","1","--","","","","2","","--","","2010-01-01","","","0","0","0","0","0","3","0","0","6","3","3","1");
INSERT INTO tbl_users VALUES("46","23,","23","6","Nhân viên Hacinco","hacinco","e10adc3949ba59abbe56e057f20f883e","123456","0972559746","hacinco@hacino.com.vn","","","1","2015-11-24","","","","2","","2015-11-24","","2010-01-01","","","","","","","","3","","","8","3","3","1");
INSERT INTO tbl_users VALUES("47","23,","23","3","G?XNDV Hacinco","gdhacinco","e10adc3949ba59abbe56e057f20f883e","123456","0972559746","gdhacinco@hacinco.com.vn","","","1","2018-12-16","","","","2","","2018-12-16","","2010-01-01","","","","","","","","3","","","6","3","3","1");
INSERT INTO tbl_users VALUES("48","15,","15","6","Nhân viên HCQT","nvhcqt","e10adc3949ba59abbe56e057f20f883e","123456","0972559746","anhvan3103@gmail.com","","","1","--","","","","2","","--","","2010-01-01","","","0","0","0","0","0","3","0","0","8","3","3","1");
INSERT INTO tbl_users VALUES("49","17,","17","6","VT - KHKT","vt_khkt","e10adc3949ba59abbe56e057f20f883e","123456","0972559746","anhvan3103@gmail.com","","","1","2016-02-17","","","","2","","2016-02-17","","2016-02-17","","","","","","","","0","","","10","3","3","1");
INSERT INTO tbl_users VALUES("50","17,","17","6","CV - KHKT","cv_khkt","e10adc3949ba59abbe56e057f20f883e","123456","0972559746","anhvan3103@gmail.com","","","1","2018-12-13","","","","2","","2018-12-13","","2018-12-13","","","","","","","","0","","","8","3","3","1");
INSERT INTO tbl_users VALUES("51","15,","15","6","Lê Thùy Dung","dunglt","e10adc3949ba59abbe56e057f20f883e","123456","0972559746","anhvan3103@gmail.com","","","2","--","","","","2","","--","","2018-12-12","","","0","0","0","0","0","0","0","0","8","3","3","1");
INSERT INTO tbl_users VALUES("52","15,","15","6","?àm Thùy Linh","linhdt","e10adc3949ba59abbe56e057f20f883e","123456","0972119746","anhvan3103@gmail.com","","","2","--","","","","2","","--","","2018-12-12","","","0","0","0","0","0","0","0","0","8","3","3","1");
INSERT INTO tbl_users VALUES("53","16,","16","6","Nguy?n Thu Trang","trangnt","e10adc3949ba59abbe56e057f20f883e","123456","0972559746","anhvan3103@gmail.com","","","2","--","","","","2","","--","","2018-12-12","","","0","0","0","0","0","0","0","0","8","3","3","1");
INSERT INTO tbl_users VALUES("54","16,","16","6","Nguy?n Thu H??ng","huongnt","e10adc3949ba59abbe56e057f20f883e","123456","0972559746","anhvan3103@gmail.com","","","2","--","","","","2","","--","","2018-12-12","","","0","0","0","0","0","0","0","0","8","3","3","1");
INSERT INTO tbl_users VALUES("55","13,","13","6","Thi?u H?ng Liên","lienth","e10adc3949ba59abbe56e057f20f883e","123456","0972559746","anhvan3103@gmail.com","","","2","--","","","","2","","--","","2018-12-12","","","0","0","0","0","0","0","0","0","8","3","3","1");



DROP TABLE tbl_userunits;

CREATE TABLE `tbl_userunits` (
  `userUnit_id` int(11) NOT NULL AUTO_INCREMENT,
  `userUnit_name` varchar(250) DEFAULT NULL,
  `userUnit_desc` text,
  `userUnit_date` datetime DEFAULT NULL,
  `userUnit_sort` int(11) DEFAULT '0',
  `userUnit_active` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`userUnit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE tbl_vbfiles;

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

INSERT INTO tbl_vbfiles VALUES("1","1","234/CV-UBND","../doc_uploads_2015/fa87022a38c4a9a66b1d92b963d876e3.jpg","2016-01-17","0","0","1");



DROP TABLE tbl_vbreplyfiles;

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




DROP TABLE tbl_vbreplys;

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

INSERT INTO tbl_vbreplys VALUES("1","1","Báo cáo","Xây d?ng","Xí nghi?p DV Hacinco","Không có","V/v tr? l?i công v?n s? 234/CV-UBND.","","","Nguy?n V?n H?nh","2016-01-17","0","","2016-01-17","46","2");



DROP TABLE tbl_vbs;

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

INSERT INTO tbl_vbs VALUES("1","42","42","Công v?n","Xây d?ng","","17","234/CV-UBND","V? vi?c tri?n khai công trình thu?c d? án Xây d?ng c? b?n...","Chuy?n Ban QLDA1","","2015-11-23 00:00:00","Nguy?n Phúc Quang","1","1","2016-01-17 10:13:00","","0","2","2","1","0");



DROP TABLE tbl_vttb_cats;

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

INSERT INTO tbl_vttb_cats VALUES("1","V?t t? thi?t b?","Vat tu thiet bi","2013-04-18","0","1","1");
INSERT INTO tbl_vttb_cats VALUES("2","C? s? v?t ch?t","Co so vat chat","2013-04-18","0","1","1");
INSERT INTO tbl_vttb_cats VALUES("3","Ph??ng ti?n","Phuong tien","2013-04-18","0","1","1");
INSERT INTO tbl_vttb_cats VALUES("5","Các lo?i khác","Cac loai khac","2018-12-17","","1","1");
INSERT INTO tbl_vttb_cats VALUES("6","Danh m?c m?i","Danh muc moi","2013-06-22","0","1","1");



DROP TABLE tbl_vttb_datlichs;

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

INSERT INTO tbl_vttb_datlichs VALUES("1","3","T? ch?c h?p t?ng k?t ho?t ??ng cty trong quý I n?m 2013.","2013-04-25 08:30:00","2013-04-25 11:30:00","","0","","14");
INSERT INTO tbl_vttb_datlichs VALUES("3","3","T? ch?c liên hoan cty m?ng ngày 30/04 và 01/05.","2013-04-27 15:30:00","2013-04-27 17:30:00","","0","","14");
INSERT INTO tbl_vttb_datlichs VALUES("4","6","?i h?p","2013-05-09 08:30:00","2013-05-09 11:30:00","","0","","18");
INSERT INTO tbl_vttb_datlichs VALUES("5","4","T? ch?c g?p g? ??i tác các nhà cung c?p d?ch v? cho THA.","2013-05-24 08:30:00","2013-05-24 10:30:00","","0","","14");
INSERT INTO tbl_vttb_datlichs VALUES("6","4","H?p ph? bi?n k? thu?t l?p trình m?i ??i v?i phòng KT và phòng TK-BH","2013-05-24 08:00:00","2013-05-24 11:00:00","","0","","18");



DROP TABLE tbl_vttb_repares;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO tbl_vttb_repares VALUES("1","1","S?a màn hình","550000","2","2012-02-25","0025/PT-TM","Cty CP Tech-mart","18");
INSERT INTO tbl_vttb_repares VALUES("3","1","S?a bàn phím","300000","2","2013-02-24","0072/PT-TM","Cty CP Tech-mart","18");
INSERT INTO tbl_vttb_repares VALUES("4","2","Cài ??t l?i window","200000","1","2016-01-10","28/PC-KT","Công ty Tech-mart","40");
INSERT INTO tbl_vttb_repares VALUES("5","3","S?a l?i tr?n th?ch cao","25000000","1","2018-08-10","152/PC","Cty N?i th?t ??i An","1");



DROP TABLE tbl_vttb_replaces;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO tbl_vttb_replaces VALUES("1","1","Thay ? c?ng","800000","2","2013-01-12","0052/PT-TM","Cty CP Tech-mart","18");
INSERT INTO tbl_vttb_replaces VALUES("2","2","RAM Kingston 2GB","800000","1","2016-01-10","24/PC-KT","Công ty Tech-mart","40");
INSERT INTO tbl_vttb_replaces VALUES("3","3","Thay h? th?ng ?èn tr?n hu?nh quang","12000000","1","2018-08-15","153/PC","Cty N?i th?t ??i An","1");



DROP TABLE tbl_vttb_subs;

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

INSERT INTO tbl_vttb_subs VALUES("1","2","Phòng h?p, h?i tr??ng","Phong hop, hoi truong","2","2013-05-22","","1","1");
INSERT INTO tbl_vttb_subs VALUES("2","2","Nhà kho","Nha kho","2","2013-04-21","0","1","1");
INSERT INTO tbl_vttb_subs VALUES("3","3","Xe oto con","Xe oto con","2","2013-04-21","0","1","1");
INSERT INTO tbl_vttb_subs VALUES("4","3","Xe t?i, bán t?i","Xe tai, ban tai","2","2013-04-21","0","1","1");
INSERT INTO tbl_vttb_subs VALUES("5","1","Máy vi tính","May vi tinh","1","2013-04-21","","1","1");
INSERT INTO tbl_vttb_subs VALUES("6","1","Thi?t b? in ?n, quét, sao chép","Thiet bi in an, quet, sao chep","1","2013-04-21","","1","1");
INSERT INTO tbl_vttb_subs VALUES("8","1","?i?n tho?i, Fax","Dien thoai, Fax","1","2013-04-21","0","1","1");
INSERT INTO tbl_vttb_subs VALUES("9","1","Thi?t b? trình chi?u, quay, ch?p","Thiet bi trinh chieu, quay, chup","1","2013-04-21","0","1","1");
INSERT INTO tbl_vttb_subs VALUES("10","5","Thi?t b? v? sinh","Thiet bi ve sinh","1","2018-12-17","","1","1");
INSERT INTO tbl_vttb_subs VALUES("11","5","?un n?u, l?u tr? th?c ph?m","Dun nau, luu tru thuc pham","1","2013-04-22","","1","1");
INSERT INTO tbl_vttb_subs VALUES("12","5","Thi?t b? chi?u sáng","Thiet bi chieu sang","1","2013-04-21","0","1","1");
INSERT INTO tbl_vttb_subs VALUES("13","1","Máy ch? và thi?t b? liên quan","May chu va thiet bi lien quan","1","2013-04-22","0","1","1");
INSERT INTO tbl_vttb_subs VALUES("14","6","Ph? m?c 1","Phu muc 1","1","2013-06-22","0","1","1");



DROP TABLE tbl_vttbs;

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

INSERT INTO tbl_vttbs VALUES("1","5","Lap-001","Laptop: Emachines (Core-I3, 160GB)","2014-01-01","2018-01-01","0000-00-00","11000000","1","2016-01-15","","1","1");
INSERT INTO tbl_vttbs VALUES("2","5","Lap-002","Laptop Dell (160GB, Ram 2GB)","2014-01-01","2018-01-01","0000-00-00","6500000","40","2016-01-15","","1","1");
INSERT INTO tbl_vttbs VALUES("3","1","Phòng h?p s? 1","Phòng h?p trên t?ng 3, khu v?n phòng","2008-01-01","2023-01-01","0000-00-00","683000000","0","2013-04-24","0","1","1");
INSERT INTO tbl_vttbs VALUES("4","1","Phòng h?p s? 2","Phòng h?p trên t?ng 2, khu v?n phòng","2008-01-01","2023-01-01","0000-00-00","400000000","0","2013-04-24","0","1","1");
INSERT INTO tbl_vttbs VALUES("5","2","Kho 01-GL","Kho thuê h?n 7 n?m t?i Gia Lâm, Hà N?i","2008-01-01","2015-01-01","0000-00-00","840000000","0","2013-04-24","0","1","1");
INSERT INTO tbl_vttbs VALUES("6","3","Toyota - Zace","7 ch?","2012-01-01","2022-01-01","0000-00-00","700000","0","2013-05-09","0","1","1");
INSERT INTO tbl_vttbs VALUES("7","14","Thi?t b? 1","Mô t?","2013-01-01","2016-01-01","2017-01-01","2300000","10","2013-06-22","0","1","1");



DROP TABLE users;

CREATE TABLE `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `domain` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO users VALUES("1","admin","password","you@yourdomain.com","all");



