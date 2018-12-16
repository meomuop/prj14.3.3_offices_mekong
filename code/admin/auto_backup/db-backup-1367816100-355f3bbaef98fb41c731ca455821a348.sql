DROP TABLE ajax_chat_bans;

CREATE TABLE `ajax_chat_bans` (
  `userID` int(11) NOT NULL,
  `userName` varchar(64) collate utf8_bin NOT NULL,
  `dateTime` datetime NOT NULL,
  `ip` varbinary(16) NOT NULL,
  PRIMARY KEY  (`userID`),
  KEY `userName` (`userName`),
  KEY `dateTime` (`dateTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;




DROP TABLE ajax_chat_invitations;

CREATE TABLE `ajax_chat_invitations` (
  `userID` int(11) NOT NULL,
  `channel` int(11) NOT NULL,
  `dateTime` datetime NOT NULL,
  PRIMARY KEY  (`userID`,`channel`),
  KEY `dateTime` (`dateTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;




DROP TABLE ajax_chat_messages;

CREATE TABLE `ajax_chat_messages` (
  `id` int(11) NOT NULL auto_increment,
  `userID` int(11) NOT NULL,
  `userName` varchar(64) collate utf8_bin NOT NULL,
  `userRole` int(1) NOT NULL,
  `channel` int(11) NOT NULL,
  `dateTime` datetime NOT NULL,
  `ip` varbinary(16) NOT NULL,
  `text` text collate utf8_bin,
  PRIMARY KEY  (`id`),
  KEY `message_condition` (`id`,`channel`,`dateTime`),
  KEY `dateTime` (`dateTime`)
) ENGINE=InnoDB AUTO_INCREMENT=424 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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



DROP TABLE ajax_chat_online;

CREATE TABLE `ajax_chat_online` (
  `userID` int(11) NOT NULL,
  `userName` varchar(64) collate utf8_bin NOT NULL,
  `userRole` int(1) NOT NULL,
  `channel` int(11) NOT NULL,
  `dateTime` datetime NOT NULL,
  `ip` varbinary(16) NOT NULL,
  PRIMARY KEY  (`userID`),
  KEY `userName` (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;




DROP TABLE doc_docreplys;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `doc_docreplys` AS (select `d`.`doc_id` AS `doc_id`,`d`.`docCat_id` AS `docCat_id`,`d`.`docField_id` AS `docField_id`,`d`.`docLevel_id` AS `docLevel_id`,`d`.`unit_name` AS `unit_name`,`d`.`doc_code` AS `doc_code`,`d`.`doc_num` AS `doc_num`,`d`.`doc_desc` AS `doc_desc`,`d`.`doc_note` AS `doc_note`,`d`.`doc_recevied` AS `doc_recevied`,`d`.`doc_limit_time` AS `doc_limit_time`,`d`.`doc_signed` AS `doc_signed`,`d`.`doc_moved` AS `doc_moved`,`d`.`signPer_id` AS `signPer_id`,`d`.`signObj_id` AS `signObj_id`,`d`.`secret_id` AS `secret_id`,`d`.`important_id` AS `important_id`,`d`.`doc_date` AS `doc_date`,`d`.`doc_sort` AS `doc_sort`,`d`.`doc_traned` AS `doc_traned`,`d`.`doc_replied` AS `doc_replied`,`d`.`doc_active` AS `doc_active`,`d`.`doc_file` AS `doc_file`,`d`.`doc_theodoi` AS `doc_theodoi`,`d`.`user_id` AS `user_id`,`d`.`input_per` AS `input_per`,`dr`.`docReply_id` AS `docReply_id`,`dr`.`doc_id` AS `DR_doc_id`,`dr`.`user_id` AS `DR_user_id`,`dr`.`department_id` AS `DR_department_id`,`dr`.`main_department` AS `DR_main_department`,`dr`.`process_per` AS `process_per`,`dr`.`docReply_active` AS `docReply_active`,`dr`.`docReply_traned` AS `docReply_traned`,`dr`.`process_level` AS `process_level`,`dr`.`coordinate_per` AS `coordinate_per`,`dr`.`recevie_per` AS `recevie_per`,`dr`.`coordinate_depart` AS `coordinate_depart`,`dr`.`docReply_numday` AS `docReply_numday`,`dr`.`docReply_limit_time` AS `docReply_limit_time` from (`tbl_docs` `D` join `tbl_docreplys` `DR` on((`d`.`doc_id` = `dr`.`doc_id`))));

INSERT INTO doc_docreplys VALUES("4","Gi?y m?i","Thi?t k? ?? h?a","4","Cty TNHH MTV ?TPT Nhà&?ô th?","198","4","V/v m?i ??i di?n cty THA ??n tham d? cu?c h?p th?o lu?n ph??ng pháp thi?t k? banno áp phích cho cty TNHH MTV ?TPT Nhà&?ô th? nh?n k? ni?m 15 n?m thành l?p.","","2012-10-03","1970-01-01","2012-10-02","1970-01-01","Nguy?n Danh C?","Giám ??c","1","1","2012-10-03","","1","1","2","2","0","11,7","1","1","4","7","0","0","0","0","0","0","0","8","4","","2013-01-01");
INSERT INTO doc_docreplys VALUES("5","Thông báo","Hành chính","4","Cty Tech-Mart","489","5","V/v t? ch?c cu?c g?p g? giao l?u gi?a 2 cty t?i Church Hotel Hàng Gai vào lúc: 18h00\\&lsquo; ngày 10/10/2012","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng Hành chính gi?i quy?t.\n- Sao chuy?n các phòng ban khác bi?t và s?p x?p th?i gian","2012-10-03","1970-01-01","2012-10-02","2013-02-19","Nguy?n Quý H?u","Giám ??c","1","1","2012-10-03","","1","1","2","1","0","7","1","2","5","7","6,1,2,4,3","1","0","0","0","0","0","0","0","","2013-01-01");
INSERT INTO doc_docreplys VALUES("1","Công v?n","Xây d?ng ph?n m?m","2","UBND thành ph? HN","2350","1","V/v xây d?ng ph?n m?m qu?n lý và ?i?u hành công vi?c v?n phòng.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng Kinh doanh ph? trách gi?i quy?t\n- Sao chuy?n phòng D? án và phòng K? thu?t ph?i h?p","2012-10-03","1970-01-01","2012-10-02","2013-02-22","Nguy?n Th? Th?o","Ch? t?ch","1","1","2012-10-03","","1","1","2","1","1","7","1","3","1","7","6,3","4","","","0","","","0","","","2013-03-08");
INSERT INTO doc_docreplys VALUES("2","Quy?t ??nh","T? v?n, lên d? án","2","S? Công Th??ng TPHN","1249","2","Giao cho cty THA trách nhi?m t? v?n và lên d? án ??i v?i vi?c xây d?ng h? thông m?ng t?i s?.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phó giám ??c Nguy?n Quý H?u ph? trách.","2012-10-03","1970-01-01","2012-10-02","2013-02-22","Hoàng Duy Khanh","Giám ??c","1","1","2012-10-03","","1","1","2","1","1","7","1","4","2","7","","0","","0","0","","","8","","","2013-03-08");
INSERT INTO doc_docreplys VALUES("3","Quy?t ??nh","T? v?n, lên d? án","2","S? tài chính","1250","3","Quy?t ??nh giao kinh phí cho cty THA th?c hi?n vi?c T? v?n, lên d? án t?i S? công th??ng.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng K? toán - tài v? ph? trách gi?i quy?t.","2012-10-03","1970-01-01","2012-10-02","2013-02-22","Nguy?n Công Soái","Giám ??c","1","1","2012-10-03","","1","1","2","2","1","7","1","5","3","7","0","2","0","0","0","0","0","0","0","6","2013-03-11");
INSERT INTO doc_docreplys VALUES("6","Công v?n","Xây d?ng ph?n m?m","2","S? Xây D?ng TPHN","3454","6","V/v ?? ngh? cty THA ti?n hành cài ??t và t?p hu?n s? d?ng ph?n m?m m?t c?a.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng K? thu?t gi?i quy?t\n- Sao chuy?n phòng Kinh doanh ph?i h?p","2012-10-03","1970-01-01","2012-10-03","2013-02-19","Cao Khoa B?ng","Giám ??c","1","1","2012-10-03","","1","1","1","2","0","7","1","6","6","7","4","3","0","0","1","0","0","0","0","","2013-01-01");
INSERT INTO doc_docreplys VALUES("2","Quy?t ??nh","T? v?n, lên d? án","2","S? Công Th??ng TPHN","1249","2","Giao cho cty THA trách nhi?m t? v?n và lên d? án ??i v?i vi?c xây d?ng h? thông m?ng t?i s?.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phó giám ??c Nguy?n Quý H?u ph? trách.","2012-10-03","1970-01-01","2012-10-02","2013-02-22","Hoàng Duy Khanh","Giám ??c","1","1","2012-10-03","","1","1","2","1","1","7","1","7","2","8","4","6","0","1","0","0","0","0","0","","2013-03-07");
INSERT INTO doc_docreplys VALUES("7","Thông báo","Xây d?ng ph?n m?m","3","UBND Qu?n Tây H?","598","7","V/v thông báo t? ch?c ??u th?u gói th?u xây l?p h? thông m?ng cho khu liên c?.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng D? án gi?i quy?t\n- Chuy?n phòng Kinh doanh ph?i h?p","2012-10-03","1970-01-01","2012-10-03","2013-02-19","Nguy?n Phúc Quang","Ch? t?ch","1","1","2012-10-03","","1","1","2","2","1","7","1","8","7","7","4","6","0","0","0","0","0","0","0","5.5","2013-03-13");
INSERT INTO doc_docreplys VALUES("12","Quy?t ??nh","T? v?n, lên d? án","2","UBND thành ph? HN","1252/Q?-UBND","12","V/v quy?t ??nh ch?n công ty THA là ??n v? t? v?n và l?p d? án t?ng th? ??i v?i gói th?u ph?n m?m qu?n lý và ?i?u hành tác nghi?p tri?n khai t?i t?t c? các qu?n, huy?n thu?c Hà N?i.","K/c ?/c giám ??c:\nÝ ki?n tham m?u:\n- Chuy?n phòng kinh doanh th?c hi?n;\n- Sao chuy?n phó giám ??c Nguy?n Quý H?u giám sát.","2013-02-21","1970-01-01","2013-02-21","2013-03-07","Nguy?n Th? Th?o","Ch? t?ch","1","1","2013-02-21","","1","1","2","1","0","7","1","9","12","7","0","4","0","0","1","0","8","0","0","","2013-01-01");
INSERT INTO doc_docreplys VALUES("12","Quy?t ??nh","T? v?n, lên d? án","2","UBND thành ph? HN","1252/Q?-UBND","12","V/v quy?t ??nh ch?n công ty THA là ??n v? t? v?n và l?p d? án t?ng th? ??i v?i gói th?u ph?n m?m qu?n lý và ?i?u hành tác nghi?p tri?n khai t?i t?t c? các qu?n, huy?n thu?c Hà N?i.","K/c ?/c giám ??c:\nÝ ki?n tham m?u:\n- Chuy?n phòng kinh doanh th?c hi?n;\n- Sao chuy?n phó giám ??c Nguy?n Quý H?u giám sát.","2013-02-21","1970-01-01","2013-02-21","2013-03-07","Nguy?n Th? Th?o","Ch? t?ch","1","1","2013-02-21","","1","1","2","1","0","7","1","14","12","17","0","0","16","0","0","0","0","0","0","","1970-01-01");
INSERT INTO doc_docreplys VALUES("6","Công v?n","Xây d?ng ph?n m?m","2","S? Xây D?ng TPHN","3454","6","V/v ?? ngh? cty THA ti?n hành cài ??t và t?p hu?n s? d?ng ph?n m?m m?t c?a.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng K? thu?t gi?i quy?t\n- Sao chuy?n phòng Kinh doanh ph?i h?p","2012-10-03","1970-01-01","2012-10-03","2013-02-19","Cao Khoa B?ng","Giám ??c","1","1","2012-10-03","","1","1","1","2","0","7","1","15","6","18","0","0","10","0","1","7","0","0","0","","1970-01-01");
INSERT INTO doc_docreplys VALUES("6","Công v?n","Xây d?ng ph?n m?m","2","S? Xây D?ng TPHN","3454","6","V/v ?? ngh? cty THA ti?n hành cài ??t và t?p hu?n s? d?ng ph?n m?m m?t c?a.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng K? thu?t gi?i quy?t\n- Sao chuy?n phòng Kinh doanh ph?i h?p","2012-10-03","1970-01-01","2012-10-03","2013-02-19","Cao Khoa B?ng","Giám ??c","1","1","2012-10-03","","1","1","1","2","0","7","1","16","6","10","0","0","12","0","0","8","0","0","0","","1970-01-01");
INSERT INTO doc_docreplys VALUES("8","?ính chính V?n b?n","Hành chính","4","Cty Tech-Mart","499","8","?ính chính l?i v?n b?n s? 489 th?i gian t? ch?c giao l?u s? là 18h30‘. ??a ?i?m không thay ??i.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng D? án gi?i quy?t\n- Sao chuy?n phòng Kinh doanh ph?i h?p","2012-10-04","1970-01-01","2012-10-03","2013-02-19","Nguy?n Quý H?u","Giám ??c","1","2","2012-10-03","","1","1","2","2","0","7","1","17","8","7","0","6","0","0","0","0","0","0","0","","2013-01-01");
INSERT INTO doc_docreplys VALUES("9","Thông báo","","0","Cty Tech-Mart","223","9","Thông báo l?ch b?o trì thi?t b? tin h?c tháng 10-2012 ??n cty THA.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng Tri?n khai-B?o hành gi?i quy?t\n- Sao chuy?n phòng Kinh doanh ph?i h?p","2013-02-01","1970-01-01","2012-10-04","2013-02-19","Nguy?n Quý H?u","Giám ??c","1","1","2012-10-05","","1","1","2","2","0","7","1","18","9","7","0","7","0","0","0","0","0","0","0","","2013-01-01");
INSERT INTO doc_docreplys VALUES("10","Công v?n","Xây d?ng ph?n m?m","0","S? Tài chính Hà N?i","1345","10","V/v ?? ngh? cty THA c? ??i di?n ??n S? ?? cùng k?t h?p tri?n khai DVC tr?c tuy?n tích h?p trên c?ng thông tin S?.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng K? thu?t ph? trách gi?i quy?t;\n- Sao chuy?n phòng Kinh doanh ph?i h?p.","2012-10-05","1970-01-01","2012-10-04","2013-02-19","Nguy?n Th? Hà Ninh","Giám ??c","1","1","2012-10-05","","1","1","2","1","1","7","1","19","10","7","0","3","0","0","0","0","0","0","0","","2013-03-29");
INSERT INTO doc_docreplys VALUES("11","Công v?n","T? v?n, lên d? án","4","Cty CP C? khí & Xây l?p s? 7","12/CV-CKXL7","11","V/v ?? ngh? công ty THA c? ng??i t?i t? v?n l?p ??t h? th?ng m?ng n?i b? toàn b? công ty và các phân x??ng s?n xu?t.","Kính g?i ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n ?/c phó giám ??c Nguy?n Quý H?u ph? trách.","2013-02-22","1970-01-01","2013-02-19","2013-02-22","Nguy?n Quang Tri?u","Giám ??c","1","1","2013-02-20","","1","1","2","1","1","7","1","20","11","7","0","0","0","0","0","0","0","8","0","10","2013-04-03");
INSERT INTO doc_docreplys VALUES("28","Thông tri","T? ch?c t? v?n cho nhân dân các huy?n trên ??a bàn Tp","2","H?i Nông dân HN","347/TT-HND","28","V/v Lên k? ho?ch t? ch?c h?i th?o h??ng nghi?p cho các huy?n, th? tr?n có d? án thu h?i ??t trên ??a bàn thành ph?","K/c ?/c giám ??c:\nÝ ki?n tham m?u:\nChuy?n ??n phòng th??ng binh lao ??ng xã h?i huy?n t? ch?c và ph?i h?p v?i các phòng ban có liên quan","2013-03-19","1970-01-01","2013-03-07","2013-03-19","Nguy?n Kh?c D?ng","Phó Ban Th??ng Tr?c","1","1","2013-03-19","","1","1","2","1","0","7","14","21","28","7","0","1","0","1","0","0","0","0","0","","2013-01-01");
INSERT INTO doc_docreplys VALUES("33","Thông báo","Thi?t k? ?? h?a","3","UBND huy?n Ch??ng M?","25/UBND","31","V/v Thi?t k? bi?n qu?ng cáo cho công ty TNHH ABC","?ã cho ý ki?n và chuy?n phòng ban x? lý","2013-04-23","1970-01-01","2013-04-23","2013-04-23","Ngô Th? Thanh H?ng","Phó ch? t?ch","1","1","2013-04-23","","1","1","1","2","0","7","24","22","33","7","0","1","0","0","1","0","0","0","0","","2013-01-01");
INSERT INTO doc_docreplys VALUES("33","Thông báo","Thi?t k? ?? h?a","3","UBND huy?n Ch??ng M?","25/UBND","31","V/v Thi?t k? bi?n qu?ng cáo cho công ty TNHH ABC","?ã cho ý ki?n và chuy?n phòng ban x? lý","2013-04-23","1970-01-01","2013-04-23","2013-04-23","Ngô Th? Thanh H?ng","Phó ch? t?ch","1","1","2013-04-23","","1","1","1","2","0","7","24","23","33","11","0","0","27","0","0","8","0","0","0","","2013-04-26");
INSERT INTO doc_docreplys VALUES("23","Thông tri","Nâng cao n?ng l?c cho cán b? nhân viên v?n phòng","3","Phòng công ch?ng NN s? 1","345/TT-UBND","23","V/v T? ch?c h?c h?i th?o nâng cao nghi?p v? cho cán b? v?n phòng nh?m nâng cao n?ng l?c","??ng ý","2013-03-19","1970-01-01","2013-03-05","2013-04-23","Nguy?n H?u ??","Phó ch? t?ch","1","1","2013-03-19","","1","1","2","2","0","7","14","24","23","7","0","2","0","0","0","0","0","0","0","","2013-01-01");
INSERT INTO doc_docreplys VALUES("27","Thông t?","L?p k? ho?ch t? ch?c ki?m tra","2","Thanh tra S?_S? GTHN","668/TT-SGT","27","V/v T? ch?c l?p k? ho?ch ki?m tra thanh tra giao thông trên ??a bàn thành ph?","??ng ý v?i v?n b?n","2013-03-19","1970-01-01","2013-03-05","2013-04-23","Nguy?n H?ng S?n","Phó giám ??c","1","1","2013-03-19","","1","1","2","1","0","7","14","25","27","7","0","0","0","0","0","0","0","8","0","","2013-01-01");
INSERT INTO doc_docreplys VALUES("35","Thông t?","T? v?n, lên d? án","2","UBND Qu?n Hoàn Ki?m","0214/UBND","33","V/v t? v?n thi?t k? d? án c?u ???ng b?","??ng ý v?i h??ng gi?i quy?t c?a cty","2013-04-23","1970-01-01","2013-04-23","2013-04-23","Ng? Duy Hi?u","Giám ??c","1","1","2013-04-23","","1","1","1","2","0","7","24","26","35","7","0","0","0","1","0","0","0","8","0","","2013-01-01");
INSERT INTO doc_docreplys VALUES("35","Thông t?","T? v?n, lên d? án","2","UBND Qu?n Hoàn Ki?m","0214/UBND","33","V/v t? v?n thi?t k? d? án c?u ???ng b?","??ng ý v?i h??ng gi?i quy?t c?a cty","2013-04-23","1970-01-01","2013-04-23","2013-04-23","Ng? Duy Hi?u","Giám ??c","1","1","2013-04-23","","1","1","1","2","0","7","24","27","35","8","0","3","0","0","1","0","0","0","0","","2013-01-01");
INSERT INTO doc_docreplys VALUES("35","Thông t?","T? v?n, lên d? án","2","UBND Qu?n Hoàn Ki?m","0214/UBND","33","V/v t? v?n thi?t k? d? án c?u ???ng b?","??ng ý v?i h??ng gi?i quy?t c?a cty","2013-04-23","1970-01-01","2013-04-23","2013-04-23","Ng? Duy Hi?u","Giám ??c","1","1","2013-04-23","","1","1","1","2","0","7","24","28","35","18","0","0","12","0","0","8","0","0","0","","2013-04-23");
INSERT INTO doc_docreplys VALUES("28","Thông tri","T? ch?c t? v?n cho nhân dân các huy?n trên ??a bàn Tp","2","H?i Nông dân HN","347/TT-HND","28","V/v Lên k? ho?ch t? ch?c h?i th?o h??ng nghi?p cho các huy?n, th? tr?n có d? án thu h?i ??t trên ??a bàn thành ph?","K/c ?/c giám ??c:\nÝ ki?n tham m?u:\nChuy?n ??n phòng th??ng binh lao ??ng xã h?i huy?n t? ch?c và ph?i h?p v?i các phòng ban có liên quan","2013-03-19","1970-01-01","2013-03-07","2013-03-19","Nguy?n Kh?c D?ng","Phó Ban Th??ng Tr?c","1","1","2013-03-19","","1","1","2","1","0","7","14","29","28","7","0","2","0","0","0","0","0","0","0","","2013-01-01");
INSERT INTO doc_docreplys VALUES("34","Công V?n","","0","U? Ban Th??ng V? Qu?c H?i","07-UBND-DN","32","Ngh? quy?t gi?i quy?t các th?c m?c c?a ng??i dân","Không ??ng ý","2013-04-23","1970-01-01","2013-04-23","2013-04-23","D??ng K? Lân","Tr??ng C? Quan Th??ng tr?c","1","1","2013-04-23","","1","1","2","2","0","7","24","30","34","7","0","0","0","1","0","0","0","8","0","","2013-01-01");
INSERT INTO doc_docreplys VALUES("2","Quy?t ??nh","T? v?n, lên d? án","2","S? Công Th??ng TPHN","1249","2","Giao cho cty THA trách nhi?m t? v?n và lên d? án ??i v?i vi?c xây d?ng h? thông m?ng t?i s?.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phó giám ??c Nguy?n Quý H?u ph? trách.","2012-10-03","1970-01-01","2012-10-02","2013-02-22","Hoàng Duy Khanh","Giám ??c","1","1","2012-10-03","","1","1","2","1","1","7","1","31","2","8","0","1","0","0","0","0","0","0","0","","2013-01-01");
INSERT INTO doc_docreplys VALUES("34","Công V?n","","0","U? Ban Th??ng V? Qu?c H?i","07-UBND-DN","32","Ngh? quy?t gi?i quy?t các th?c m?c c?a ng??i dân","Không ??ng ý","2013-04-23","1970-01-01","2013-04-23","2013-04-23","D??ng K? Lân","Tr??ng C? Quan Th??ng tr?c","1","1","2013-04-23","","1","1","2","2","0","7","24","32","34","8","0","4","0","0","0","0","0","0","0","","2013-01-01");



DROP TABLE doc_late_cv;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `doc_late_cv` AS (select `d`.`doc_id` AS `doc_id`,`d`.`docCat_id` AS `docCat_id`,`d`.`docField_id` AS `docField_id`,`d`.`docLevel_id` AS `docLevel_id`,`d`.`unit_name` AS `unit_name`,`d`.`doc_code` AS `doc_code`,`d`.`doc_num` AS `doc_num`,`d`.`doc_desc` AS `doc_desc`,`d`.`doc_note` AS `doc_note`,`d`.`doc_note_date` AS `doc_note_date`,`d`.`doc_recevied` AS `doc_recevied`,`d`.`doc_limit_time` AS `doc_limit_time`,`d`.`doc_signed` AS `doc_signed`,`d`.`doc_moved` AS `doc_moved`,`d`.`signPer_id` AS `signPer_id`,`d`.`signObj_id` AS `signObj_id`,`d`.`secret_id` AS `secret_id`,`d`.`important_id` AS `important_id`,`d`.`doc_date` AS `doc_date`,`d`.`doc_sort` AS `doc_sort`,`d`.`doc_traned` AS `doc_traned`,`d`.`doc_replied` AS `doc_replied`,`d`.`doc_active` AS `doc_active`,`d`.`doc_theodoi` AS `doc_theodoi`,`d`.`doc_file` AS `doc_file`,`d`.`user_id` AS `user_id`,`d`.`input_per` AS `input_per`,`dr`.`docReply_id` AS `docReply_id`,`dr`.`doc_id` AS `DR_doc_id`,`dr`.`user_id` AS `DR_user_id`,`dr`.`department_id` AS `DR_department_id`,`dr`.`main_department` AS `DR_main_department`,`dr`.`process_per` AS `process_per`,`dr`.`docReply_active` AS `docReply_active`,`dr`.`docReply_traned` AS `docReply_traned`,`dr`.`process_level` AS `process_level`,`dr`.`coordinate_per` AS `coordinate_per`,`dr`.`recevie_per` AS `recevie_per`,`dr`.`docReply_date` AS `DR_docReply_date`,`dr`.`docReply_numday` AS `docReply_numday`,`dr`.`docReply_limit_time` AS `docReply_limit_time` from (`tbl_docs` `D` join `tbl_docreplys` `DR` on(((`d`.`doc_id` = `dr`.`doc_id`) and (`dr`.`process_per` <> 0)))) group by `d`.`doc_id`);

INSERT INTO doc_late_cv VALUES("6","Công v?n","Xây d?ng ph?n m?m","2","S? Xây D?ng TPHN","3454","6","V/v ?? ngh? cty THA ti?n hành cài ??t và t?p hu?n s? d?ng ph?n m?m m?t c?a.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng K? thu?t gi?i quy?t\n- Sao chuy?n phòng Kinh doanh ph?i h?p","2013-03-13","2012-10-03","1970-01-01","2012-10-03","2013-02-19","Cao Khoa B?ng","Giám ??c","1","1","2012-10-03","","1","1","1","0","2","7","1","15","6","18","0","0","10","0","1","7","0","0","2013-03-13","","1970-01-01");
INSERT INTO doc_late_cv VALUES("12","Quy?t ??nh","T? v?n, lên d? án","2","UBND thành ph? HN","1252/Q?-UBND","12","V/v quy?t ??nh ch?n công ty THA là ??n v? t? v?n và l?p d? án t?ng th? ??i v?i gói th?u ph?n m?m qu?n lý và ?i?u hành tác nghi?p tri?n khai t?i t?t c? các qu?n, huy?n thu?c Hà N?i.","K/c ?/c giám ??c:\nÝ ki?n tham m?u:\n- Chuy?n phòng kinh doanh th?c hi?n;\n- Sao chuy?n phó giám ??c Nguy?n Quý H?u giám sát.","","2013-02-21","1970-01-01","2013-02-21","2013-03-07","Nguy?n Th? Th?o","Ch? t?ch","1","1","2013-02-21","","1","1","2","0","1","7","1","14","12","17","0","0","16","0","0","0","0","0","2013-03-12","","1970-01-01");
INSERT INTO doc_late_cv VALUES("33","Thông báo","Thi?t k? ?? h?a","3","UBND huy?n Ch??ng M?","25/UBND","31","V/v Thi?t k? bi?n qu?ng cáo cho công ty TNHH ABC","?ã cho ý ki?n và chuy?n phòng ban x? lý","2013-04-23","2013-04-23","1970-01-01","2013-04-23","2013-04-23","Ngô Th? Thanh H?ng","Phó ch? t?ch","1","1","2013-04-23","","1","1","1","0","2","7","24","23","33","11","0","0","27","0","0","8","0","0","2013-04-23","","2013-04-26");
INSERT INTO doc_late_cv VALUES("35","Thông t?","T? v?n, lên d? án","2","UBND Qu?n Hoàn Ki?m","0214/UBND","33","V/v t? v?n thi?t k? d? án c?u ???ng b?","??ng ý v?i h??ng gi?i quy?t c?a cty","2013-04-23","2013-04-23","1970-01-01","2013-04-23","2013-04-23","Ng? Duy Hi?u","Giám ??c","1","1","2013-04-23","","1","1","1","0","2","7","24","28","35","18","0","0","12","0","0","8","0","0","2013-04-23","","2013-04-23");



DROP TABLE doc_latereport;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `doc_latereport` AS (select `d`.`doc_id` AS `doc_id`,`d`.`docCat_id` AS `docCat_id`,`d`.`docField_id` AS `docField_id`,`d`.`docLevel_id` AS `docLevel_id`,`d`.`unit_name` AS `unit_name`,`d`.`doc_code` AS `doc_code`,`d`.`doc_num` AS `doc_num`,`d`.`doc_desc` AS `doc_desc`,`d`.`doc_note` AS `doc_note`,`d`.`doc_note_date` AS `doc_note_date`,`d`.`doc_recevied` AS `doc_recevied`,`d`.`doc_limit_time` AS `doc_limit_time`,`d`.`doc_signed` AS `doc_signed`,`d`.`doc_moved` AS `doc_moved`,`d`.`signPer_id` AS `signPer_id`,`d`.`signObj_id` AS `signObj_id`,`d`.`secret_id` AS `secret_id`,`d`.`important_id` AS `important_id`,`d`.`doc_date` AS `doc_date`,`d`.`doc_sort` AS `doc_sort`,`d`.`doc_traned` AS `doc_traned`,`d`.`doc_replied` AS `doc_replied`,`d`.`doc_active` AS `doc_active`,`d`.`doc_theodoi` AS `doc_theodoi`,`d`.`doc_file` AS `doc_file`,`d`.`user_id` AS `user_id`,`d`.`input_per` AS `input_per`,`dr`.`docReply_id` AS `docReply_id`,`dr`.`doc_id` AS `DR_doc_id`,`dr`.`user_id` AS `DR_user_id`,`dr`.`department_id` AS `DR_department_id`,`dr`.`main_department` AS `DR_main_department`,`dr`.`process_per` AS `process_per`,`dr`.`docReply_active` AS `docReply_active`,`dr`.`docReply_traned` AS `docReply_traned`,`dr`.`process_level` AS `process_level`,`dr`.`coordinate_per` AS `coordinate_per`,`dr`.`recevie_per` AS `recevie_per`,`dr`.`docReply_date` AS `DR_docReply_date`,`dr`.`docReply_numday` AS `docReply_numday`,`dr`.`docReply_limit_time` AS `docReply_limit_time` from (`tbl_docs` `D` join `tbl_docreplys` `DR` on(((`d`.`doc_id` = `dr`.`doc_id`) and (`dr`.`main_department` <> 0)))) group by `d`.`doc_id`);

INSERT INTO doc_latereport VALUES("1","Công v?n","Xây d?ng ph?n m?m","2","UBND thành ph? HN","2350","1","V/v xây d?ng ph?n m?m qu?n lý và ?i?u hành công vi?c v?n phòng.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng Kinh doanh ph? trách gi?i quy?t\n- Sao chuy?n phòng D? án và phòng K? thu?t ph?i h?p","","2012-10-03","1970-01-01","2012-10-02","2013-02-22","Nguy?n Th? Th?o","Ch? t?ch","1","1","2012-10-03","","1","1","2","1","1","7","1","3","1","7","6,3","4","","","0","","","0","2013-02-25","","2013-03-08");
INSERT INTO doc_latereport VALUES("2","Quy?t ??nh","T? v?n, lên d? án","2","S? Công Th??ng TPHN","1249","2","Giao cho cty THA trách nhi?m t? v?n và lên d? án ??i v?i vi?c xây d?ng h? thông m?ng t?i s?.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phó giám ??c Nguy?n Quý H?u ph? trách.","","2012-10-03","1970-01-01","2012-10-02","2013-02-22","Hoàng Duy Khanh","Giám ??c","1","1","2012-10-03","","1","1","2","1","1","7","1","7","2","8","4","6","0","1","0","0","0","0","2013-03-06","","2013-03-07");
INSERT INTO doc_latereport VALUES("3","Quy?t ??nh","T? v?n, lên d? án","2","S? tài chính","1250","3","Quy?t ??nh giao kinh phí cho cty THA th?c hi?n vi?c T? v?n, lên d? án t?i S? công th??ng.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng K? toán - tài v? ph? trách gi?i quy?t.","","2012-10-03","1970-01-01","2012-10-02","2013-02-22","Nguy?n Công Soái","Giám ??c","1","1","2012-10-03","","1","1","2","1","2","7","1","5","3","7","0","2","0","0","0","0","0","0","2013-02-27","6","2013-03-11");
INSERT INTO doc_latereport VALUES("5","Thông báo","Hành chính","4","Cty Tech-Mart","489","5","V/v t? ch?c cu?c g?p g? giao l?u gi?a 2 cty t?i Church Hotel Hàng Gai vào lúc: 18h00\\&lsquo; ngày 10/10/2012","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng Hành chính gi?i quy?t.\n- Sao chuy?n các phòng ban khác bi?t và s?p x?p th?i gian","","2012-10-03","1970-01-01","2012-10-02","2013-02-19","Nguy?n Quý H?u","Giám ??c","1","1","2012-10-03","","1","1","2","0","1","7","1","2","5","7","6,1,2,4,3","1","0","0","0","0","0","0","2013-02-19","","2013-01-01");
INSERT INTO doc_latereport VALUES("6","Công v?n","Xây d?ng ph?n m?m","2","S? Xây D?ng TPHN","3454","6","V/v ?? ngh? cty THA ti?n hành cài ??t và t?p hu?n s? d?ng ph?n m?m m?t c?a.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng K? thu?t gi?i quy?t\n- Sao chuy?n phòng Kinh doanh ph?i h?p","2013-03-13","2012-10-03","1970-01-01","2012-10-03","2013-02-19","Cao Khoa B?ng","Giám ??c","1","1","2012-10-03","","1","1","1","0","2","7","1","6","6","7","4","3","0","0","1","0","0","0","2013-02-28","","2013-01-01");
INSERT INTO doc_latereport VALUES("7","Thông báo","Xây d?ng ph?n m?m","3","UBND Qu?n Tây H?","598","7","V/v thông báo t? ch?c ??u th?u gói th?u xây l?p h? thông m?ng cho khu liên c?.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng D? án gi?i quy?t\n- Chuy?n phòng Kinh doanh ph?i h?p","","2012-10-03","1970-01-01","2012-10-03","2013-02-19","Nguy?n Phúc Quang","Ch? t?ch","1","1","2012-10-03","","1","1","2","1","2","7","1","8","7","7","4","6","0","0","0","0","0","0","2013-03-06","5.5","2013-03-13");
INSERT INTO doc_latereport VALUES("8","?ính chính V?n b?n","Hành chính","4","Cty Tech-Mart","499","8","?ính chính l?i v?n b?n s? 489 th?i gian t? ch?c giao l?u s? là 18h30‘. ??a ?i?m không thay ??i.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng D? án gi?i quy?t\n- Sao chuy?n phòng Kinh doanh ph?i h?p","","2012-10-04","1970-01-01","2012-10-03","2013-02-19","Nguy?n Quý H?u","Giám ??c","1","2","2012-10-03","","1","1","2","0","2","7","1","17","8","7","0","6","0","0","0","0","0","0","2013-03-19","","2013-01-01");
INSERT INTO doc_latereport VALUES("9","Thông báo","","0","Cty Tech-Mart","223","9","Thông báo l?ch b?o trì thi?t b? tin h?c tháng 10-2012 ??n cty THA.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng Tri?n khai-B?o hành gi?i quy?t\n- Sao chuy?n phòng Kinh doanh ph?i h?p","","2013-02-01","1970-01-01","2012-10-04","2013-02-19","Nguy?n Quý H?u","Giám ??c","1","1","2012-10-05","","1","1","2","0","2","7","1","18","9","7","0","7","0","0","0","0","0","0","2013-03-19","","2013-01-01");
INSERT INTO doc_latereport VALUES("10","Công v?n","Xây d?ng ph?n m?m","0","S? Tài chính Hà N?i","1345","10","V/v ?? ngh? cty THA c? ??i di?n ??n S? ?? cùng k?t h?p tri?n khai DVC tr?c tuy?n tích h?p trên c?ng thông tin S?.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng K? thu?t ph? trách gi?i quy?t;\n- Sao chuy?n phòng Kinh doanh ph?i h?p.","","2012-10-05","1970-01-01","2012-10-04","2013-02-19","Nguy?n Th? Hà Ninh","Giám ??c","1","1","2012-10-05","","1","1","2","1","1","7","1","19","10","7","0","3","0","0","0","0","0","0","2013-03-19","","2013-03-29");
INSERT INTO doc_latereport VALUES("12","Quy?t ??nh","T? v?n, lên d? án","2","UBND thành ph? HN","1252/Q?-UBND","12","V/v quy?t ??nh ch?n công ty THA là ??n v? t? v?n và l?p d? án t?ng th? ??i v?i gói th?u ph?n m?m qu?n lý và ?i?u hành tác nghi?p tri?n khai t?i t?t c? các qu?n, huy?n thu?c Hà N?i.","K/c ?/c giám ??c:\nÝ ki?n tham m?u:\n- Chuy?n phòng kinh doanh th?c hi?n;\n- Sao chuy?n phó giám ??c Nguy?n Quý H?u giám sát.","","2013-02-21","1970-01-01","2013-02-21","2013-03-07","Nguy?n Th? Th?o","Ch? t?ch","1","1","2013-02-21","","1","1","2","0","1","7","1","9","12","7","0","4","0","0","1","0","8","0","2013-03-07","","2013-01-01");
INSERT INTO doc_latereport VALUES("23","Thông tri","Nâng cao n?ng l?c cho cán b? nhân viên v?n phòng","3","Phòng công ch?ng NN s? 1","345/TT-UBND","23","V/v T? ch?c h?c h?i th?o nâng cao nghi?p v? cho cán b? v?n phòng nh?m nâng cao n?ng l?c","??ng ý","","2013-03-19","1970-01-01","2013-03-05","2013-04-23","Nguy?n H?u ??","Phó ch? t?ch","1","1","2013-03-19","","1","1","2","0","2","7","14","24","23","7","0","2","0","0","0","0","0","0","2013-04-23","","2013-01-01");
INSERT INTO doc_latereport VALUES("28","Thông tri","T? ch?c t? v?n cho nhân dân các huy?n trên ??a bàn Tp","2","H?i Nông dân HN","347/TT-HND","28","V/v Lên k? ho?ch t? ch?c h?i th?o h??ng nghi?p cho các huy?n, th? tr?n có d? án thu h?i ??t trên ??a bàn thành ph?","K/c ?/c giám ??c:\nÝ ki?n tham m?u:\nChuy?n ??n phòng th??ng binh lao ??ng xã h?i huy?n t? ch?c và ph?i h?p v?i các phòng ban có liên quan","","2013-03-19","1970-01-01","2013-03-07","2013-03-19","Nguy?n Kh?c D?ng","Phó Ban Th??ng Tr?c","1","1","2013-03-19","","1","1","2","0","1","7","14","21","28","7","0","1","0","1","0","0","0","0","2013-03-19","","2013-01-01");
INSERT INTO doc_latereport VALUES("33","Thông báo","Thi?t k? ?? h?a","3","UBND huy?n Ch??ng M?","25/UBND","31","V/v Thi?t k? bi?n qu?ng cáo cho công ty TNHH ABC","?ã cho ý ki?n và chuy?n phòng ban x? lý","2013-04-23","2013-04-23","1970-01-01","2013-04-23","2013-04-23","Ngô Th? Thanh H?ng","Phó ch? t?ch","1","1","2013-04-23","","1","1","1","0","2","7","24","22","33","7","0","1","0","0","1","0","0","0","2013-04-23","","2013-01-01");
INSERT INTO doc_latereport VALUES("34","Công V?n","","0","U? Ban Th??ng V? Qu?c H?i","07-UBND-DN","32","Ngh? quy?t gi?i quy?t các th?c m?c c?a ng??i dân","Không ??ng ý","","2013-04-23","1970-01-01","2013-04-23","2013-04-23","D??ng K? Lân","Tr??ng C? Quan Th??ng tr?c","1","1","2013-04-23","","1","1","2","0","2","7","24","32","34","8","0","4","0","0","0","0","0","0","2013-04-24","","2013-01-01");
INSERT INTO doc_latereport VALUES("35","Thông t?","T? v?n, lên d? án","2","UBND Qu?n Hoàn Ki?m","0214/UBND","33","V/v t? v?n thi?t k? d? án c?u ???ng b?","??ng ý v?i h??ng gi?i quy?t c?a cty","2013-04-23","2013-04-23","1970-01-01","2013-04-23","2013-04-23","Ng? Duy Hi?u","Giám ??c","1","1","2013-04-23","","1","1","1","0","2","7","24","27","35","8","0","3","0","0","1","0","0","0","2013-04-23","","2013-01-01");



DROP TABLE doc_receive;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `doc_receive` AS (select `d`.`doc_id` AS `doc_id`,`d`.`docCat_id` AS `docCat_id`,`d`.`docField_id` AS `docField_id`,`d`.`doc_unit` AS `doc_unit`,`d`.`department_id` AS `department_id`,`d`.`doc_code` AS `doc_code`,`d`.`doc_desc` AS `doc_desc`,`d`.`doc_direct` AS `doc_direct`,`d`.`doc_note` AS `doc_note`,`d`.`doc_signed` AS `doc_signed`,`d`.`signPer_id` AS `signPer_id`,`d`.`important_id` AS `important_id`,`d`.`doc_date` AS `doc_date`,`d`.`doc_limit_time` AS `doc_limit_time`,`d`.`doc_sort` AS `doc_sort`,`d`.`doc_active` AS `doc_active`,`d`.`doc_file` AS `doc_file`,`d`.`user_id` AS `user_id`,`r`.`receive_id` AS `receive_id`,`r`.`doc_id` AS `R_doc_id`,`r`.`department_id` AS `R_department_id`,`r`.`receive_per` AS `receive_per`,`r`.`receive_note` AS `receive_note`,`r`.`receive_time` AS `receive_time`,`r`.`read_status` AS `read_status`,`r`.`read_time` AS `read_time`,`r`.`read_per` AS `read_per` from (`tbl_vbs` `D` join `tbl_receives` `R` on((`d`.`doc_id` = `r`.`doc_id`))));

INSERT INTO doc_receive VALUES("1","Thông báo","Hành chính","Phòng Hành chính - T? ch?c","1","489","V/v t? ch?c cu?c g?p g? giao l?u gi?a 2 cty t?i Church Hotel Hàng Gai vào lúc: 18h00‘ ngày 10/10/2012","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng Hành chính gi?i quy?t.\n- Sao chuy?n các phòng ban khác bi?t và s?p x?p th?i gian","","2012-10-02 00:00:00","Nguy?n Quý H?u","1","2013-03-18 14:59:00","","0","2","2","14","172","1","1","11","Chu?n b? di?n v?n","2013-03-18 02:03:59","0","","0");
INSERT INTO doc_receive VALUES("1","Thông báo","Hành chính","Phòng Hành chính - T? ch?c","1","489","V/v t? ch?c cu?c g?p g? giao l?u gi?a 2 cty t?i Church Hotel Hàng Gai vào lúc: 18h00‘ ngày 10/10/2012","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng Hành chính gi?i quy?t.\n- Sao chuy?n các phòng ban khác bi?t và s?p x?p th?i gian","","2012-10-02 00:00:00","Nguy?n Quý H?u","1","2013-03-18 14:59:00","","0","2","2","14","173","1","2","5","D? trù kinh phí","2013-03-18 02:03:59","0","","0");
INSERT INTO doc_receive VALUES("1","Thông báo","Hành chính","Phòng Hành chính - T? ch?c","1","489","V/v t? ch?c cu?c g?p g? giao l?u gi?a 2 cty t?i Church Hotel Hàng Gai vào lúc: 18h00‘ ngày 10/10/2012","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng Hành chính gi?i quy?t.\n- Sao chuy?n các phòng ban khác bi?t và s?p x?p th?i gian","","2012-10-02 00:00:00","Nguy?n Quý H?u","1","2013-03-18 14:59:00","","0","2","2","14","174","1","3","18","Chu?n b? thi?t b? ?i?n t?, trình chi?u","2013-03-18 02:03:59","0","","0");
INSERT INTO doc_receive VALUES("1","Thông báo","Hành chính","Phòng Hành chính - T? ch?c","1","489","V/v t? ch?c cu?c g?p g? giao l?u gi?a 2 cty t?i Church Hotel Hàng Gai vào lúc: 18h00‘ ngày 10/10/2012","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng Hành chính gi?i quy?t.\n- Sao chuy?n các phòng ban khác bi?t và s?p x?p th?i gian","","2012-10-02 00:00:00","Nguy?n Quý H?u","1","2013-03-18 14:59:00","","0","2","2","14","175","1","4","8","","2013-03-18 02:03:59","0","","0");
INSERT INTO doc_receive VALUES("1","Thông báo","Hành chính","Phòng Hành chính - T? ch?c","1","489","V/v t? ch?c cu?c g?p g? giao l?u gi?a 2 cty t?i Church Hotel Hàng Gai vào lúc: 18h00‘ ngày 10/10/2012","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng Hành chính gi?i quy?t.\n- Sao chuy?n các phòng ban khác bi?t và s?p x?p th?i gian","","2012-10-02 00:00:00","Nguy?n Quý H?u","1","2013-03-18 14:59:00","","0","2","2","14","176","1","6","7","","2013-03-18 02:03:59","0","","0");
INSERT INTO doc_receive VALUES("1","Thông báo","Hành chính","Phòng Hành chính - T? ch?c","1","489","V/v t? ch?c cu?c g?p g? giao l?u gi?a 2 cty t?i Church Hotel Hàng Gai vào lúc: 18h00‘ ngày 10/10/2012","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng Hành chính gi?i quy?t.\n- Sao chuy?n các phòng ban khác bi?t và s?p x?p th?i gian","","2012-10-02 00:00:00","Nguy?n Quý H?u","1","2013-03-18 14:59:00","","0","2","2","14","177","1","7","9","","2013-03-18 02:03:59","0","","0");
INSERT INTO doc_receive VALUES("1","Thông báo","Hành chính","Phòng Hành chính - T? ch?c","1","489","V/v t? ch?c cu?c g?p g? giao l?u gi?a 2 cty t?i Church Hotel Hàng Gai vào lúc: 18h00‘ ngày 10/10/2012","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng Hành chính gi?i quy?t.\n- Sao chuy?n các phòng ban khác bi?t và s?p x?p th?i gian","","2012-10-02 00:00:00","Nguy?n Quý H?u","1","2013-03-18 14:59:00","","0","2","2","14","178","1","8","0","","2013-03-18 02:03:59","0","","0");
INSERT INTO doc_receive VALUES("1","Thông báo","Hành chính","Phòng Hành chính - T? ch?c","1","489","V/v t? ch?c cu?c g?p g? giao l?u gi?a 2 cty t?i Church Hotel Hàng Gai vào lúc: 18h00‘ ngày 10/10/2012","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng Hành chính gi?i quy?t.\n- Sao chuy?n các phòng ban khác bi?t và s?p x?p th?i gian","","2012-10-02 00:00:00","Nguy?n Quý H?u","1","2013-03-18 14:59:00","","0","2","2","14","179","1","9","0","","2013-03-18 02:03:59","0","","0");
INSERT INTO doc_receive VALUES("1","Thông báo","Hành chính","Phòng Hành chính - T? ch?c","1","489","V/v t? ch?c cu?c g?p g? giao l?u gi?a 2 cty t?i Church Hotel Hàng Gai vào lúc: 18h00‘ ngày 10/10/2012","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng Hành chính gi?i quy?t.\n- Sao chuy?n các phòng ban khác bi?t và s?p x?p th?i gian","","2012-10-02 00:00:00","Nguy?n Quý H?u","1","2013-03-18 14:59:00","","0","2","2","14","180","1","10","0","","2013-03-18 02:03:59","0","","0");
INSERT INTO doc_receive VALUES("1","Thông báo","Hành chính","Phòng Hành chính - T? ch?c","1","489","V/v t? ch?c cu?c g?p g? giao l?u gi?a 2 cty t?i Church Hotel Hàng Gai vào lúc: 18h00‘ ngày 10/10/2012","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng Hành chính gi?i quy?t.\n- Sao chuy?n các phòng ban khác bi?t và s?p x?p th?i gian","","2012-10-02 00:00:00","Nguy?n Quý H?u","1","2013-03-18 14:59:00","","0","2","2","14","181","1","11","0","","2013-03-18 02:03:59","0","","0");
INSERT INTO doc_receive VALUES("3","Thông báo","Xây d?ng ph?n m?m","Phòng Hành chính - T? ch?c","1","257/TB-UBND","V/v thông báo gói th?u ph?n m?m qu?n lý Thi ?ua-khen th??ng tri?n khai cho phòng N?i V?.","","","1970-01-01 00:00:00","Nguy?n Phúc Quang","1","2013-03-19 09:18:00","","0","2","2","14","192","3","1","0","Cho ý ki?n góp ý","2013-03-19 09:03:18","0","","0");
INSERT INTO doc_receive VALUES("3","Thông báo","Xây d?ng ph?n m?m","Phòng Hành chính - T? ch?c","1","257/TB-UBND","V/v thông báo gói th?u ph?n m?m qu?n lý Thi ?ua-khen th??ng tri?n khai cho phòng N?i V?.","","","1970-01-01 00:00:00","Nguy?n Phúc Quang","1","2013-03-19 09:18:00","","0","2","2","14","193","3","2","0","Cho ý ki?n góp ý","2013-03-19 09:03:18","0","","0");
INSERT INTO doc_receive VALUES("3","Thông báo","Xây d?ng ph?n m?m","Phòng Hành chính - T? ch?c","1","257/TB-UBND","V/v thông báo gói th?u ph?n m?m qu?n lý Thi ?ua-khen th??ng tri?n khai cho phòng N?i V?.","","","1970-01-01 00:00:00","Nguy?n Phúc Quang","1","2013-03-19 09:18:00","","0","2","2","14","194","3","3","0","Cho ý ki?n góp ý","2013-03-19 09:03:18","0","","0");
INSERT INTO doc_receive VALUES("3","Thông báo","Xây d?ng ph?n m?m","Phòng Hành chính - T? ch?c","1","257/TB-UBND","V/v thông báo gói th?u ph?n m?m qu?n lý Thi ?ua-khen th??ng tri?n khai cho phòng N?i V?.","","","1970-01-01 00:00:00","Nguy?n Phúc Quang","1","2013-03-19 09:18:00","","0","2","2","14","195","3","4","0","Cho ý ki?n góp ý","2013-03-19 09:03:18","0","","0");
INSERT INTO doc_receive VALUES("3","Thông báo","Xây d?ng ph?n m?m","Phòng Hành chính - T? ch?c","1","257/TB-UBND","V/v thông báo gói th?u ph?n m?m qu?n lý Thi ?ua-khen th??ng tri?n khai cho phòng N?i V?.","","","1970-01-01 00:00:00","Nguy?n Phúc Quang","1","2013-03-19 09:18:00","","0","2","2","14","196","3","6","0","Cho ý ki?n góp ý","2013-03-19 09:03:18","0","","0");
INSERT INTO doc_receive VALUES("3","Thông báo","Xây d?ng ph?n m?m","Phòng Hành chính - T? ch?c","1","257/TB-UBND","V/v thông báo gói th?u ph?n m?m qu?n lý Thi ?ua-khen th??ng tri?n khai cho phòng N?i V?.","","","1970-01-01 00:00:00","Nguy?n Phúc Quang","1","2013-03-19 09:18:00","","0","2","2","14","197","3","7","0","Cho ý ki?n góp ý","2013-03-19 09:03:18","0","","0");
INSERT INTO doc_receive VALUES("3","Thông báo","Xây d?ng ph?n m?m","Phòng Hành chính - T? ch?c","1","257/TB-UBND","V/v thông báo gói th?u ph?n m?m qu?n lý Thi ?ua-khen th??ng tri?n khai cho phòng N?i V?.","","","1970-01-01 00:00:00","Nguy?n Phúc Quang","1","2013-03-19 09:18:00","","0","2","2","14","198","3","8","0","Cho ý ki?n góp ý","2013-03-19 09:03:18","0","","0");
INSERT INTO doc_receive VALUES("3","Thông báo","Xây d?ng ph?n m?m","Phòng Hành chính - T? ch?c","1","257/TB-UBND","V/v thông báo gói th?u ph?n m?m qu?n lý Thi ?ua-khen th??ng tri?n khai cho phòng N?i V?.","","","1970-01-01 00:00:00","Nguy?n Phúc Quang","1","2013-03-19 09:18:00","","0","2","2","14","199","3","9","0","Cho ý ki?n góp ý","2013-03-19 09:03:18","0","","0");
INSERT INTO doc_receive VALUES("3","Thông báo","Xây d?ng ph?n m?m","Phòng Hành chính - T? ch?c","1","257/TB-UBND","V/v thông báo gói th?u ph?n m?m qu?n lý Thi ?ua-khen th??ng tri?n khai cho phòng N?i V?.","","","1970-01-01 00:00:00","Nguy?n Phúc Quang","1","2013-03-19 09:18:00","","0","2","2","14","200","3","10","0","Cho ý ki?n góp ý","2013-03-19 09:03:18","0","","0");
INSERT INTO doc_receive VALUES("3","Thông báo","Xây d?ng ph?n m?m","Phòng Hành chính - T? ch?c","1","257/TB-UBND","V/v thông báo gói th?u ph?n m?m qu?n lý Thi ?ua-khen th??ng tri?n khai cho phòng N?i V?.","","","1970-01-01 00:00:00","Nguy?n Phúc Quang","1","2013-03-19 09:18:00","","0","2","2","14","201","3","11","0","Cho ý ki?n góp ý","2013-03-19 09:03:18","0","","0");
INSERT INTO doc_receive VALUES("4","Thông tri","T? ch?c t? v?n cho nhân dân các huy?n trên ??a bàn Tp","Phòng Hành chính - T? ch?c","1","347/TT-HND","V/v Lên k? ho?ch t? ch?c h?i th?o h??ng nghi?p cho các huy?n, th? tr?n có d? án thu h?i ??t trên ??a bàn thành ph?","K/c ?/c giám ??c:\nÝ ki?n tham m?u:\nChuy?n ??n phòng th??ng binh lao ??ng xã h?i huy?n t? ch?c và ph?i h?p v?i các phòng ban có liên quan","","2013-03-07 00:00:00","Nguy?n Kh?c D?ng","1","2013-03-19 10:41:00","","0","2","2","14","202","4","1","0","Chu?n b? di?n v?n, quà t?ng","2013-03-19 10:03:41","0","","0");
INSERT INTO doc_receive VALUES("4","Thông tri","T? ch?c t? v?n cho nhân dân các huy?n trên ??a bàn Tp","Phòng Hành chính - T? ch?c","1","347/TT-HND","V/v Lên k? ho?ch t? ch?c h?i th?o h??ng nghi?p cho các huy?n, th? tr?n có d? án thu h?i ??t trên ??a bàn thành ph?","K/c ?/c giám ??c:\nÝ ki?n tham m?u:\nChuy?n ??n phòng th??ng binh lao ??ng xã h?i huy?n t? ch?c và ph?i h?p v?i các phòng ban có liên quan","","2013-03-07 00:00:00","Nguy?n Kh?c D?ng","1","2013-03-19 10:41:00","","0","2","2","14","203","4","2","0","Chuy?n kinh phí v? chi nhánh Thanh Hóa","2013-03-19 10:03:41","0","","0");
INSERT INTO doc_receive VALUES("4","Thông tri","T? ch?c t? v?n cho nhân dân các huy?n trên ??a bàn Tp","Phòng Hành chính - T? ch?c","1","347/TT-HND","V/v Lên k? ho?ch t? ch?c h?i th?o h??ng nghi?p cho các huy?n, th? tr?n có d? án thu h?i ??t trên ??a bàn thành ph?","K/c ?/c giám ??c:\nÝ ki?n tham m?u:\nChuy?n ??n phòng th??ng binh lao ??ng xã h?i huy?n t? ch?c và ph?i h?p v?i các phòng ban có liên quan","","2013-03-07 00:00:00","Nguy?n Kh?c D?ng","1","2013-03-19 10:41:00","","0","2","2","14","204","4","4","0","","2013-03-19 10:03:41","0","","0");
INSERT INTO doc_receive VALUES("4","Thông tri","T? ch?c t? v?n cho nhân dân các huy?n trên ??a bàn Tp","Phòng Hành chính - T? ch?c","1","347/TT-HND","V/v Lên k? ho?ch t? ch?c h?i th?o h??ng nghi?p cho các huy?n, th? tr?n có d? án thu h?i ??t trên ??a bàn thành ph?","K/c ?/c giám ??c:\nÝ ki?n tham m?u:\nChuy?n ??n phòng th??ng binh lao ??ng xã h?i huy?n t? ch?c và ph?i h?p v?i các phòng ban có liên quan","","2013-03-07 00:00:00","Nguy?n Kh?c D?ng","1","2013-03-19 10:41:00","","0","2","2","14","205","4","8","0","","2013-03-19 10:03:41","0","","0");
INSERT INTO doc_receive VALUES("5","Thông t?","L?p k? ho?ch t? ch?c ki?m tra","Phòng Hành chính - T? ch?c","1","668/TT-SGT","V/v T? ch?c l?p k? ho?ch ki?m tra thanh tra giao thông trên ??a bàn thành ph?","","","2013-03-05 00:00:00","Nguy?n H?ng S?n","1","2013-03-21 13:46:00","","0","2","2","14","206","5","1","0","","2013-03-21 01:03:46","0","","0");
INSERT INTO doc_receive VALUES("5","Thông t?","L?p k? ho?ch t? ch?c ki?m tra","Phòng Hành chính - T? ch?c","1","668/TT-SGT","V/v T? ch?c l?p k? ho?ch ki?m tra thanh tra giao thông trên ??a bàn thành ph?","","","2013-03-05 00:00:00","Nguy?n H?ng S?n","1","2013-03-21 13:46:00","","0","2","2","14","207","5","2","0","","2013-03-21 01:03:46","0","","0");
INSERT INTO doc_receive VALUES("5","Thông t?","L?p k? ho?ch t? ch?c ki?m tra","Phòng Hành chính - T? ch?c","1","668/TT-SGT","V/v T? ch?c l?p k? ho?ch ki?m tra thanh tra giao thông trên ??a bàn thành ph?","","","2013-03-05 00:00:00","Nguy?n H?ng S?n","1","2013-03-21 13:46:00","","0","2","2","14","208","5","7","0","","2013-03-21 01:03:46","0","","0");
INSERT INTO doc_receive VALUES("5","Thông t?","L?p k? ho?ch t? ch?c ki?m tra","Phòng Hành chính - T? ch?c","1","668/TT-SGT","V/v T? ch?c l?p k? ho?ch ki?m tra thanh tra giao thông trên ??a bàn thành ph?","","","2013-03-05 00:00:00","Nguy?n H?ng S?n","1","2013-03-21 13:46:00","","0","2","2","14","209","5","3","0","","2013-03-21 01:03:46","0","","0");
INSERT INTO doc_receive VALUES("5","Thông t?","L?p k? ho?ch t? ch?c ki?m tra","Phòng Hành chính - T? ch?c","1","668/TT-SGT","V/v T? ch?c l?p k? ho?ch ki?m tra thanh tra giao thông trên ??a bàn thành ph?","","","2013-03-05 00:00:00","Nguy?n H?ng S?n","1","2013-03-21 13:46:00","","0","2","2","14","210","5","4","0","","2013-03-21 01:03:46","0","","0");
INSERT INTO doc_receive VALUES("5","Thông t?","L?p k? ho?ch t? ch?c ki?m tra","Phòng Hành chính - T? ch?c","1","668/TT-SGT","V/v T? ch?c l?p k? ho?ch ki?m tra thanh tra giao thông trên ??a bàn thành ph?","","","2013-03-05 00:00:00","Nguy?n H?ng S?n","1","2013-03-21 13:46:00","","0","2","2","14","211","5","6","0","","2013-03-21 01:03:46","0","","0");
INSERT INTO doc_receive VALUES("5","Thông t?","L?p k? ho?ch t? ch?c ki?m tra","Phòng Hành chính - T? ch?c","1","668/TT-SGT","V/v T? ch?c l?p k? ho?ch ki?m tra thanh tra giao thông trên ??a bàn thành ph?","","","2013-03-05 00:00:00","Nguy?n H?ng S?n","1","2013-03-21 13:46:00","","0","2","2","14","212","5","8","0","","2013-03-21 01:03:46","0","","0");
INSERT INTO doc_receive VALUES("5","Thông t?","L?p k? ho?ch t? ch?c ki?m tra","Phòng Hành chính - T? ch?c","1","668/TT-SGT","V/v T? ch?c l?p k? ho?ch ki?m tra thanh tra giao thông trên ??a bàn thành ph?","","","2013-03-05 00:00:00","Nguy?n H?ng S?n","1","2013-03-21 13:46:00","","0","2","2","14","213","5","9","0","","2013-03-21 01:03:46","0","","0");
INSERT INTO doc_receive VALUES("5","Thông t?","L?p k? ho?ch t? ch?c ki?m tra","Phòng Hành chính - T? ch?c","1","668/TT-SGT","V/v T? ch?c l?p k? ho?ch ki?m tra thanh tra giao thông trên ??a bàn thành ph?","","","2013-03-05 00:00:00","Nguy?n H?ng S?n","1","2013-03-21 13:46:00","","0","2","2","14","214","5","10","0","","2013-03-21 01:03:46","0","","0");
INSERT INTO doc_receive VALUES("5","Thông t?","L?p k? ho?ch t? ch?c ki?m tra","Phòng Hành chính - T? ch?c","1","668/TT-SGT","V/v T? ch?c l?p k? ho?ch ki?m tra thanh tra giao thông trên ??a bàn thành ph?","","","2013-03-05 00:00:00","Nguy?n H?ng S?n","1","2013-03-21 13:46:00","","0","2","2","14","215","5","11","0","","2013-03-21 01:03:46","0","","0");
INSERT INTO doc_receive VALUES("6","Thông t?","L?p k? ho?ch ??u t? cho các t?nh phía nam","Phòng Hành chính - T? ch?c","1","679/TT-BCT","V/v L?p k? ho?ch ??u t? cho các t?nh thành phía nam trong n?m 2013","","","2013-03-04 00:00:00","Lâm Qu?c Hùng","1","2013-03-21 14:07:00","","0","2","2","14","216","6","1","0","","2013-03-21 02:03:07","0","","0");
INSERT INTO doc_receive VALUES("6","Thông t?","L?p k? ho?ch ??u t? cho các t?nh phía nam","Phòng Hành chính - T? ch?c","1","679/TT-BCT","V/v L?p k? ho?ch ??u t? cho các t?nh thành phía nam trong n?m 2013","","","2013-03-04 00:00:00","Lâm Qu?c Hùng","1","2013-03-21 14:07:00","","0","2","2","14","217","6","2","0","","2013-03-21 02:03:07","0","","0");
INSERT INTO doc_receive VALUES("6","Thông t?","L?p k? ho?ch ??u t? cho các t?nh phía nam","Phòng Hành chính - T? ch?c","1","679/TT-BCT","V/v L?p k? ho?ch ??u t? cho các t?nh thành phía nam trong n?m 2013","","","2013-03-04 00:00:00","Lâm Qu?c Hùng","1","2013-03-21 14:07:00","","0","2","2","14","218","6","7","0","","2013-03-21 02:03:07","0","","0");
INSERT INTO doc_receive VALUES("6","Thông t?","L?p k? ho?ch ??u t? cho các t?nh phía nam","Phòng Hành chính - T? ch?c","1","679/TT-BCT","V/v L?p k? ho?ch ??u t? cho các t?nh thành phía nam trong n?m 2013","","","2013-03-04 00:00:00","Lâm Qu?c Hùng","1","2013-03-21 14:07:00","","0","2","2","14","219","6","3","0","","2013-03-21 02:03:07","0","","0");
INSERT INTO doc_receive VALUES("6","Thông t?","L?p k? ho?ch ??u t? cho các t?nh phía nam","Phòng Hành chính - T? ch?c","1","679/TT-BCT","V/v L?p k? ho?ch ??u t? cho các t?nh thành phía nam trong n?m 2013","","","2013-03-04 00:00:00","Lâm Qu?c Hùng","1","2013-03-21 14:07:00","","0","2","2","14","220","6","4","0","","2013-03-21 02:03:07","0","","0");
INSERT INTO doc_receive VALUES("6","Thông t?","L?p k? ho?ch ??u t? cho các t?nh phía nam","Phòng Hành chính - T? ch?c","1","679/TT-BCT","V/v L?p k? ho?ch ??u t? cho các t?nh thành phía nam trong n?m 2013","","","2013-03-04 00:00:00","Lâm Qu?c Hùng","1","2013-03-21 14:07:00","","0","2","2","14","221","6","6","0","","2013-03-21 02:03:07","0","","0");
INSERT INTO doc_receive VALUES("6","Thông t?","L?p k? ho?ch ??u t? cho các t?nh phía nam","Phòng Hành chính - T? ch?c","1","679/TT-BCT","V/v L?p k? ho?ch ??u t? cho các t?nh thành phía nam trong n?m 2013","","","2013-03-04 00:00:00","Lâm Qu?c Hùng","1","2013-03-21 14:07:00","","0","2","2","14","222","6","8","0","","2013-03-21 02:03:07","0","","0");
INSERT INTO doc_receive VALUES("6","Thông t?","L?p k? ho?ch ??u t? cho các t?nh phía nam","Phòng Hành chính - T? ch?c","1","679/TT-BCT","V/v L?p k? ho?ch ??u t? cho các t?nh thành phía nam trong n?m 2013","","","2013-03-04 00:00:00","Lâm Qu?c Hùng","1","2013-03-21 14:07:00","","0","2","2","14","223","6","9","0","","2013-03-21 02:03:07","0","","0");
INSERT INTO doc_receive VALUES("6","Thông t?","L?p k? ho?ch ??u t? cho các t?nh phía nam","Phòng Hành chính - T? ch?c","1","679/TT-BCT","V/v L?p k? ho?ch ??u t? cho các t?nh thành phía nam trong n?m 2013","","","2013-03-04 00:00:00","Lâm Qu?c Hùng","1","2013-03-21 14:07:00","","0","2","2","14","224","6","10","0","","2013-03-21 02:03:07","0","","0");
INSERT INTO doc_receive VALUES("6","Thông t?","L?p k? ho?ch ??u t? cho các t?nh phía nam","Phòng Hành chính - T? ch?c","1","679/TT-BCT","V/v L?p k? ho?ch ??u t? cho các t?nh thành phía nam trong n?m 2013","","","2013-03-04 00:00:00","Lâm Qu?c Hùng","1","2013-03-21 14:07:00","","0","2","2","14","225","6","11","0","","2013-03-21 02:03:07","0","","0");
INSERT INTO doc_receive VALUES("7","Công v?n","Xây d?ng ph?n m?m","Chi nhánh 3 - Khánh hòa","4","2350","V/v xây d?ng ph?n m?m qu?n lý và ?i?u hành công vi?c v?n phòng.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng Kinh doanh ph? trách gi?i quy?t\n- Sao chuy?n phòng D? án và phòng K? thu?t ph?i h?p","","2012-10-02 00:00:00","Nguy?n Th? Th?o","1","2013-04-24 11:57:00","","0","2","2","26","226","7","4","0","","2013-04-24 11:04:57","0","","0");
INSERT INTO doc_receive VALUES("8","Quy?t ??nh","T? v?n, lên d? án","Chi nhánh 3 - Khánh hòa","7","1249","Giao cho cty THA trách nhi?m t? v?n và lên d? án ??i v?i vi?c xây d?ng h? thông m?ng t?i s?.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phó giám ??c Nguy?n Quý H?u ph? trách.","","2012-10-02 00:00:00","Hoàng Duy Khanh","1","2013-04-24 11:58:00","","0","2","2","26","227","8","7","0","","2013-04-24 11:04:58","0","","0");
INSERT INTO doc_receive VALUES("8","Quy?t ??nh","T? v?n, lên d? án","Chi nhánh 3 - Khánh hòa","7","1249","Giao cho cty THA trách nhi?m t? v?n và lên d? án ??i v?i vi?c xây d?ng h? thông m?ng t?i s?.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phó giám ??c Nguy?n Quý H?u ph? trách.","","2012-10-02 00:00:00","Hoàng Duy Khanh","1","2013-04-24 11:58:00","","0","2","2","26","228","8","3","0","","2013-04-24 11:04:58","0","","0");
INSERT INTO doc_receive VALUES("8","Quy?t ??nh","T? v?n, lên d? án","Chi nhánh 3 - Khánh hòa","7","1249","Giao cho cty THA trách nhi?m t? v?n và lên d? án ??i v?i vi?c xây d?ng h? thông m?ng t?i s?.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phó giám ??c Nguy?n Quý H?u ph? trách.","","2012-10-02 00:00:00","Hoàng Duy Khanh","1","2013-04-24 11:58:00","","0","2","2","26","229","8","4","0","","2013-04-24 11:04:58","0","","0");
INSERT INTO doc_receive VALUES("9","Công v?n","Xây d?ng ph?n m?m","Chi nhánh 3 - Khánh hòa","4","1345","V/v ?? ngh? cty THA c? ??i di?n ??n S? ?? cùng k?t h?p tri?n khai DVC tr?c tuy?n tích h?p trên c?ng thông tin S?.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng K? thu?t ph? trách gi?i quy?t;\n- Sao chuy?n phòng Kinh doanh ph?i h?p.","","2012-10-04 00:00:00","Nguy?n Th? Hà Ninh","1","2013-04-24 12:00:00","","0","2","2","26","230","9","4","0","","2013-04-24 12:04:00","0","","0");
INSERT INTO doc_receive VALUES("10","Công v?n","T? v?n, lên d? án","Phòng K? thu?t","11","12/CV-CKXL7","V/v ?? ngh? công ty THA c? ng??i t?i t? v?n l?p ??t h? th?ng m?ng n?i b? toàn b? công ty và các phân x??ng s?n xu?t.","Kính g?i ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n ?/c phó giám ??c Nguy?n Quý H?u ph? trách.","","2013-02-19 00:00:00","Nguy?n Quang Tri?u","1","2013-04-24 12:53:00","","0","2","2","1","231","10","11","0","","2013-04-24 12:04:53","0","","0");



DROP TABLE doc_reports;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `doc_reports` AS select `d`.`doc_id` AS `doc_id`,`d`.`docCat_id` AS `docCat_id`,`d`.`docField_id` AS `docField_id`,`d`.`docLevel_id` AS `docLevel_id`,`d`.`unit_name` AS `unit_name`,`d`.`doc_code` AS `doc_code`,`d`.`doc_num` AS `doc_num`,`d`.`doc_desc` AS `doc_desc`,`d`.`doc_note` AS `doc_note`,`d`.`doc_note_date` AS `doc_note_date`,`d`.`doc_recevied` AS `doc_recevied`,`d`.`doc_limit_time` AS `doc_limit_time`,`d`.`doc_signed` AS `doc_signed`,`d`.`doc_moved` AS `doc_moved`,`d`.`signPer_id` AS `signPer_id`,`d`.`signObj_id` AS `signObj_id`,`d`.`secret_id` AS `secret_id`,`d`.`important_id` AS `important_id`,`d`.`doc_date` AS `doc_date`,`d`.`doc_sort` AS `doc_sort`,`d`.`doc_traned` AS `doc_traned`,`d`.`doc_replied` AS `doc_replied`,`d`.`doc_active` AS `doc_active`,`d`.`doc_theodoi` AS `doc_theodoi`,`d`.`doc_file` AS `doc_file`,`d`.`user_id` AS `user_id`,`d`.`input_per` AS `input_per`,`dr`.`docReply_id` AS `docReply_id`,`dr`.`doc_id` AS `DR_doc_id`,`dr`.`user_id` AS `DR_user_id`,`dr`.`department_id` AS `DR_department_id`,`dr`.`main_department` AS `DR_main_department`,`dr`.`process_per` AS `process_per`,`dr`.`docReply_active` AS `docReply_active`,`dr`.`docReply_traned` AS `docReply_traned`,`dr`.`process_level` AS `process_level`,`dr`.`coordinate_per` AS `coordinate_per`,`dr`.`recevie_per` AS `recevie_per`,`dr`.`docReply_date` AS `DR_docReply_date`,`dr`.`docReply_numday` AS `docReply_numday`,`dr`.`docReply_limit_time` AS `docReply_limit_time` from (`tbl_docs` `D` join `tbl_docreplys` `DR` on((`d`.`doc_id` = `dr`.`doc_id`))) group by `d`.`doc_id`;

INSERT INTO doc_reports VALUES("1","Công v?n","Xây d?ng ph?n m?m","2","UBND thành ph? HN","2350","1","V/v xây d?ng ph?n m?m qu?n lý và ?i?u hành công vi?c v?n phòng.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng Kinh doanh ph? trách gi?i quy?t\n- Sao chuy?n phòng D? án và phòng K? thu?t ph?i h?p","","2012-10-03","1970-01-01","2012-10-02","2013-02-22","Nguy?n Th? Th?o","Ch? t?ch","1","1","2012-10-03","","1","1","2","1","1","7","1","3","1","7","6,3","4","","","0","","","0","2013-02-25","","2013-03-08");
INSERT INTO doc_reports VALUES("2","Quy?t ??nh","T? v?n, lên d? án","2","S? Công Th??ng TPHN","1249","2","Giao cho cty THA trách nhi?m t? v?n và lên d? án ??i v?i vi?c xây d?ng h? thông m?ng t?i s?.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phó giám ??c Nguy?n Quý H?u ph? trách.","","2012-10-03","1970-01-01","2012-10-02","2013-02-22","Hoàng Duy Khanh","Giám ??c","1","1","2012-10-03","","1","1","2","1","1","7","1","4","2","7","","0","","0","0","","","8","2013-02-25","","2013-03-08");
INSERT INTO doc_reports VALUES("3","Quy?t ??nh","T? v?n, lên d? án","2","S? tài chính","1250","3","Quy?t ??nh giao kinh phí cho cty THA th?c hi?n vi?c T? v?n, lên d? án t?i S? công th??ng.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng K? toán - tài v? ph? trách gi?i quy?t.","","2012-10-03","1970-01-01","2012-10-02","2013-02-22","Nguy?n Công Soái","Giám ??c","1","1","2012-10-03","","1","1","2","1","2","7","1","5","3","7","0","2","0","0","0","0","0","0","2013-02-27","6","2013-03-11");
INSERT INTO doc_reports VALUES("4","Gi?y m?i","Thi?t k? ?? h?a","4","Cty TNHH MTV ?TPT Nhà&?ô th?","198","4","V/v m?i ??i di?n cty THA ??n tham d? cu?c h?p th?o lu?n ph??ng pháp thi?t k? banno áp phích cho cty TNHH MTV ?TPT Nhà&?ô th? nh?n k? ni?m 15 n?m thành l?p.","","","2012-10-03","1970-01-01","2012-10-02","1970-01-01","Nguy?n Danh C?","Giám ??c","1","1","2012-10-03","","1","1","2","0","2","11,7","1","1","4","7","0","0","0","0","0","0","0","8","2013-02-19","","2013-01-01");
INSERT INTO doc_reports VALUES("5","Thông báo","Hành chính","4","Cty Tech-Mart","489","5","V/v t? ch?c cu?c g?p g? giao l?u gi?a 2 cty t?i Church Hotel Hàng Gai vào lúc: 18h00\\&lsquo; ngày 10/10/2012","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng Hành chính gi?i quy?t.\n- Sao chuy?n các phòng ban khác bi?t và s?p x?p th?i gian","","2012-10-03","1970-01-01","2012-10-02","2013-02-19","Nguy?n Quý H?u","Giám ??c","1","1","2012-10-03","","1","1","2","0","1","7","1","2","5","7","6,1,2,4,3","1","0","0","0","0","0","0","2013-02-19","","2013-01-01");
INSERT INTO doc_reports VALUES("6","Công v?n","Xây d?ng ph?n m?m","2","S? Xây D?ng TPHN","3454","6","V/v ?? ngh? cty THA ti?n hành cài ??t và t?p hu?n s? d?ng ph?n m?m m?t c?a.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng K? thu?t gi?i quy?t\n- Sao chuy?n phòng Kinh doanh ph?i h?p","2013-03-13","2012-10-03","1970-01-01","2012-10-03","2013-02-19","Cao Khoa B?ng","Giám ??c","1","1","2012-10-03","","1","1","1","0","2","7","1","6","6","7","4","3","0","0","1","0","0","0","2013-02-28","","2013-01-01");
INSERT INTO doc_reports VALUES("7","Thông báo","Xây d?ng ph?n m?m","3","UBND Qu?n Tây H?","598","7","V/v thông báo t? ch?c ??u th?u gói th?u xây l?p h? thông m?ng cho khu liên c?.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng D? án gi?i quy?t\n- Chuy?n phòng Kinh doanh ph?i h?p","","2012-10-03","1970-01-01","2012-10-03","2013-02-19","Nguy?n Phúc Quang","Ch? t?ch","1","1","2012-10-03","","1","1","2","1","2","7","1","8","7","7","4","6","0","0","0","0","0","0","2013-03-06","5.5","2013-03-13");
INSERT INTO doc_reports VALUES("8","?ính chính V?n b?n","Hành chính","4","Cty Tech-Mart","499","8","?ính chính l?i v?n b?n s? 489 th?i gian t? ch?c giao l?u s? là 18h30‘. ??a ?i?m không thay ??i.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng D? án gi?i quy?t\n- Sao chuy?n phòng Kinh doanh ph?i h?p","","2012-10-04","1970-01-01","2012-10-03","2013-02-19","Nguy?n Quý H?u","Giám ??c","1","2","2012-10-03","","1","1","2","0","2","7","1","17","8","7","0","6","0","0","0","0","0","0","2013-03-19","","2013-01-01");
INSERT INTO doc_reports VALUES("9","Thông báo","","0","Cty Tech-Mart","223","9","Thông báo l?ch b?o trì thi?t b? tin h?c tháng 10-2012 ??n cty THA.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng Tri?n khai-B?o hành gi?i quy?t\n- Sao chuy?n phòng Kinh doanh ph?i h?p","","2013-02-01","1970-01-01","2012-10-04","2013-02-19","Nguy?n Quý H?u","Giám ??c","1","1","2012-10-05","","1","1","2","0","2","7","1","18","9","7","0","7","0","0","0","0","0","0","2013-03-19","","2013-01-01");
INSERT INTO doc_reports VALUES("10","Công v?n","Xây d?ng ph?n m?m","0","S? Tài chính Hà N?i","1345","10","V/v ?? ngh? cty THA c? ??i di?n ??n S? ?? cùng k?t h?p tri?n khai DVC tr?c tuy?n tích h?p trên c?ng thông tin S?.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng K? thu?t ph? trách gi?i quy?t;\n- Sao chuy?n phòng Kinh doanh ph?i h?p.","","2012-10-05","1970-01-01","2012-10-04","2013-02-19","Nguy?n Th? Hà Ninh","Giám ??c","1","1","2012-10-05","","1","1","2","1","1","7","1","19","10","7","0","3","0","0","0","0","0","0","2013-03-19","","2013-03-29");
INSERT INTO doc_reports VALUES("11","Công v?n","T? v?n, lên d? án","4","Cty CP C? khí & Xây l?p s? 7","12/CV-CKXL7","11","V/v ?? ngh? công ty THA c? ng??i t?i t? v?n l?p ??t h? th?ng m?ng n?i b? toàn b? công ty và các phân x??ng s?n xu?t.","Kính g?i ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n ?/c phó giám ??c Nguy?n Quý H?u ph? trách.","","2013-02-22","1970-01-01","2013-02-19","2013-02-22","Nguy?n Quang Tri?u","Giám ??c","1","1","2013-02-20","","1","1","2","1","1","7","1","20","11","7","0","0","0","0","0","0","0","8","2013-03-19","10","2013-04-03");
INSERT INTO doc_reports VALUES("12","Quy?t ??nh","T? v?n, lên d? án","2","UBND thành ph? HN","1252/Q?-UBND","12","V/v quy?t ??nh ch?n công ty THA là ??n v? t? v?n và l?p d? án t?ng th? ??i v?i gói th?u ph?n m?m qu?n lý và ?i?u hành tác nghi?p tri?n khai t?i t?t c? các qu?n, huy?n thu?c Hà N?i.","K/c ?/c giám ??c:\nÝ ki?n tham m?u:\n- Chuy?n phòng kinh doanh th?c hi?n;\n- Sao chuy?n phó giám ??c Nguy?n Quý H?u giám sát.","","2013-02-21","1970-01-01","2013-02-21","2013-03-07","Nguy?n Th? Th?o","Ch? t?ch","1","1","2013-02-21","","1","1","2","0","1","7","1","9","12","7","0","4","0","0","1","0","8","0","2013-03-07","","2013-01-01");
INSERT INTO doc_reports VALUES("23","Thông tri","Nâng cao n?ng l?c cho cán b? nhân viên v?n phòng","3","Phòng công ch?ng NN s? 1","345/TT-UBND","23","V/v T? ch?c h?c h?i th?o nâng cao nghi?p v? cho cán b? v?n phòng nh?m nâng cao n?ng l?c","??ng ý","","2013-03-19","1970-01-01","2013-03-05","2013-04-23","Nguy?n H?u ??","Phó ch? t?ch","1","1","2013-03-19","","1","1","2","0","2","7","14","24","23","7","0","2","0","0","0","0","0","0","2013-04-23","","2013-01-01");
INSERT INTO doc_reports VALUES("27","Thông t?","L?p k? ho?ch t? ch?c ki?m tra","2","Thanh tra S?_S? GTHN","668/TT-SGT","27","V/v T? ch?c l?p k? ho?ch ki?m tra thanh tra giao thông trên ??a bàn thành ph?","??ng ý v?i v?n b?n","","2013-03-19","1970-01-01","2013-03-05","2013-04-23","Nguy?n H?ng S?n","Phó giám ??c","1","1","2013-03-19","","1","1","2","0","1","7","14","25","27","7","0","0","0","0","0","0","0","8","2013-04-23","","2013-01-01");
INSERT INTO doc_reports VALUES("28","Thông tri","T? ch?c t? v?n cho nhân dân các huy?n trên ??a bàn Tp","2","H?i Nông dân HN","347/TT-HND","28","V/v Lên k? ho?ch t? ch?c h?i th?o h??ng nghi?p cho các huy?n, th? tr?n có d? án thu h?i ??t trên ??a bàn thành ph?","K/c ?/c giám ??c:\nÝ ki?n tham m?u:\nChuy?n ??n phòng th??ng binh lao ??ng xã h?i huy?n t? ch?c và ph?i h?p v?i các phòng ban có liên quan","","2013-03-19","1970-01-01","2013-03-07","2013-03-19","Nguy?n Kh?c D?ng","Phó Ban Th??ng Tr?c","1","1","2013-03-19","","1","1","2","0","1","7","14","21","28","7","0","1","0","1","0","0","0","0","2013-03-19","","2013-01-01");
INSERT INTO doc_reports VALUES("33","Thông báo","Thi?t k? ?? h?a","3","UBND huy?n Ch??ng M?","25/UBND","31","V/v Thi?t k? bi?n qu?ng cáo cho công ty TNHH ABC","?ã cho ý ki?n và chuy?n phòng ban x? lý","2013-04-23","2013-04-23","1970-01-01","2013-04-23","2013-04-23","Ngô Th? Thanh H?ng","Phó ch? t?ch","1","1","2013-04-23","","1","1","1","0","2","7","24","22","33","7","0","1","0","0","1","0","0","0","2013-04-23","","2013-01-01");
INSERT INTO doc_reports VALUES("34","Công V?n","","0","U? Ban Th??ng V? Qu?c H?i","07-UBND-DN","32","Ngh? quy?t gi?i quy?t các th?c m?c c?a ng??i dân","Không ??ng ý","","2013-04-23","1970-01-01","2013-04-23","2013-04-23","D??ng K? Lân","Tr??ng C? Quan Th??ng tr?c","1","1","2013-04-23","","1","1","2","0","2","7","24","30","34","7","0","0","0","1","0","0","0","8","2013-04-24","","2013-01-01");
INSERT INTO doc_reports VALUES("35","Thông t?","T? v?n, lên d? án","2","UBND Qu?n Hoàn Ki?m","0214/UBND","33","V/v t? v?n thi?t k? d? án c?u ???ng b?","??ng ý v?i h??ng gi?i quy?t c?a cty","2013-04-23","2013-04-23","1970-01-01","2013-04-23","2013-04-23","Ng? Duy Hi?u","Giám ??c","1","1","2013-04-23","","1","1","1","0","2","7","24","26","35","7","0","0","0","1","0","0","0","8","2013-04-23","","2013-01-01");



DROP TABLE doc_users;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `doc_users` AS select `d`.`doc_id` AS `doc_id`,`d`.`docCat_id` AS `docCat_id`,`d`.`docField_id` AS `docField_id`,`d`.`docLevel_id` AS `docLevel_id`,`d`.`unit_name` AS `unit_name`,`d`.`doc_code` AS `doc_code`,`d`.`doc_num` AS `doc_num`,`d`.`doc_desc` AS `doc_desc`,`d`.`doc_note` AS `doc_note`,`d`.`doc_recevied` AS `doc_recevied`,`d`.`doc_limit_time` AS `doc_limit_time`,`d`.`doc_signed` AS `doc_signed`,`d`.`doc_moved` AS `doc_moved`,`d`.`signPer_id` AS `signPer_id`,`d`.`signObj_id` AS `signObj_id`,`d`.`secret_id` AS `secret_id`,`d`.`important_id` AS `important_id`,`d`.`doc_date` AS `doc_date`,`d`.`doc_sort` AS `doc_sort`,`d`.`doc_traned` AS `doc_traned`,`d`.`doc_replied` AS `doc_replied`,`d`.`doc_active` AS `doc_active`,`d`.`doc_file` AS `doc_file`,`d`.`user_id` AS `user_id`,`d`.`input_per` AS `input_per`,`u`.`user_fullname` AS `user_fullname`,`u`.`object_id` AS `object_id` from (`tbl_docs` `D` join `tbl_users` `U` on((`d`.`user_id` = `u`.`user_id`)));

INSERT INTO doc_users VALUES("1","Công v?n","Xây d?ng ph?n m?m","2","UBND thành ph? HN","2350","1","V/v xây d?ng ph?n m?m qu?n lý và ?i?u hành công vi?c v?n phòng.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng Kinh doanh ph? trách gi?i quy?t\n- Sao chuy?n phòng D? án và phòng K? thu?t ph?i h?p","2012-10-03","1970-01-01","2012-10-02","2013-02-22","Nguy?n Th? Th?o","Ch? t?ch","1","1","2012-10-03","","1","1","2","1","7","1","D??ng Vi?t Hùng","1");
INSERT INTO doc_users VALUES("2","Quy?t ??nh","T? v?n, lên d? án","2","S? Công Th??ng TPHN","1249","2","Giao cho cty THA trách nhi?m t? v?n và lên d? án ??i v?i vi?c xây d?ng h? thông m?ng t?i s?.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phó giám ??c Nguy?n Quý H?u ph? trách.","2012-10-03","1970-01-01","2012-10-02","2013-02-22","Hoàng Duy Khanh","Giám ??c","1","1","2012-10-03","","1","1","2","1","7","1","D??ng Vi?t Hùng","1");
INSERT INTO doc_users VALUES("3","Quy?t ??nh","T? v?n, lên d? án","2","S? tài chính","1250","3","Quy?t ??nh giao kinh phí cho cty THA th?c hi?n vi?c T? v?n, lên d? án t?i S? công th??ng.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng K? toán - tài v? ph? trách gi?i quy?t.","2012-10-03","1970-01-01","2012-10-02","2013-02-22","Nguy?n Công Soái","Giám ??c","1","1","2012-10-03","","1","1","2","2","7","1","D??ng Vi?t Hùng","1");
INSERT INTO doc_users VALUES("4","Gi?y m?i","Thi?t k? ?? h?a","4","Cty TNHH MTV ?TPT Nhà&?ô th?","198","4","V/v m?i ??i di?n cty THA ??n tham d? cu?c h?p th?o lu?n ph??ng pháp thi?t k? banno áp phích cho cty TNHH MTV ?TPT Nhà&?ô th? nh?n k? ni?m 15 n?m thành l?p.","","2012-10-03","1970-01-01","2012-10-02","1970-01-01","Nguy?n Danh C?","Giám ??c","1","1","2012-10-03","","1","1","2","2","11,7","1","?àm Thanh An","4");
INSERT INTO doc_users VALUES("5","Thông báo","Hành chính","4","Cty Tech-Mart","489","5","V/v t? ch?c cu?c g?p g? giao l?u gi?a 2 cty t?i Church Hotel Hàng Gai vào lúc: 18h00\\&lsquo; ngày 10/10/2012","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng Hành chính gi?i quy?t.\n- Sao chuy?n các phòng ban khác bi?t và s?p x?p th?i gian","2012-10-03","1970-01-01","2012-10-02","2013-02-19","Nguy?n Quý H?u","Giám ??c","1","1","2012-10-03","","1","1","2","1","7","1","D??ng Vi?t Hùng","1");
INSERT INTO doc_users VALUES("6","Công v?n","Xây d?ng ph?n m?m","2","S? Xây D?ng TPHN","3454","6","V/v ?? ngh? cty THA ti?n hành cài ??t và t?p hu?n s? d?ng ph?n m?m m?t c?a.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng K? thu?t gi?i quy?t\n- Sao chuy?n phòng Kinh doanh ph?i h?p","2012-10-03","1970-01-01","2012-10-03","2013-02-19","Cao Khoa B?ng","Giám ??c","1","1","2012-10-03","","1","1","1","2","7","1","D??ng Vi?t Hùng","1");
INSERT INTO doc_users VALUES("7","Thông báo","Xây d?ng ph?n m?m","3","UBND Qu?n Tây H?","598","7","V/v thông báo t? ch?c ??u th?u gói th?u xây l?p h? thông m?ng cho khu liên c?.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng D? án gi?i quy?t\n- Chuy?n phòng Kinh doanh ph?i h?p","2012-10-03","1970-01-01","2012-10-03","2013-02-19","Nguy?n Phúc Quang","Ch? t?ch","1","1","2012-10-03","","1","1","2","2","7","1","D??ng Vi?t Hùng","1");
INSERT INTO doc_users VALUES("8","?ính chính V?n b?n","Hành chính","4","Cty Tech-Mart","499","8","?ính chính l?i v?n b?n s? 489 th?i gian t? ch?c giao l?u s? là 18h30‘. ??a ?i?m không thay ??i.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng D? án gi?i quy?t\n- Sao chuy?n phòng Kinh doanh ph?i h?p","2012-10-04","1970-01-01","2012-10-03","2013-02-19","Nguy?n Quý H?u","Giám ??c","1","2","2012-10-03","","1","1","2","2","7","1","D??ng Vi?t Hùng","1");
INSERT INTO doc_users VALUES("9","Thông báo","","0","Cty Tech-Mart","223","9","Thông báo l?ch b?o trì thi?t b? tin h?c tháng 10-2012 ??n cty THA.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng Tri?n khai-B?o hành gi?i quy?t\n- Sao chuy?n phòng Kinh doanh ph?i h?p","2013-02-01","1970-01-01","2012-10-04","2013-02-19","Nguy?n Quý H?u","Giám ??c","1","1","2012-10-05","","1","1","2","2","7","1","D??ng Vi?t Hùng","1");
INSERT INTO doc_users VALUES("10","Công v?n","Xây d?ng ph?n m?m","0","S? Tài chính Hà N?i","1345","10","V/v ?? ngh? cty THA c? ??i di?n ??n S? ?? cùng k?t h?p tri?n khai DVC tr?c tuy?n tích h?p trên c?ng thông tin S?.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng K? thu?t ph? trách gi?i quy?t;\n- Sao chuy?n phòng Kinh doanh ph?i h?p.","2012-10-05","1970-01-01","2012-10-04","2013-02-19","Nguy?n Th? Hà Ninh","Giám ??c","1","1","2012-10-05","","1","1","2","1","7","1","D??ng Vi?t Hùng","1");
INSERT INTO doc_users VALUES("11","Công v?n","T? v?n, lên d? án","4","Cty CP C? khí & Xây l?p s? 7","12/CV-CKXL7","11","V/v ?? ngh? công ty THA c? ng??i t?i t? v?n l?p ??t h? th?ng m?ng n?i b? toàn b? công ty và các phân x??ng s?n xu?t.","Kính g?i ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n ?/c phó giám ??c Nguy?n Quý H?u ph? trách.","2013-02-22","1970-01-01","2013-02-19","2013-02-22","Nguy?n Quang Tri?u","Giám ??c","1","1","2013-02-20","","1","1","2","1","7","1","D??ng Vi?t Hùng","1");
INSERT INTO doc_users VALUES("12","Quy?t ??nh","T? v?n, lên d? án","2","UBND thành ph? HN","1252/Q?-UBND","12","V/v quy?t ??nh ch?n công ty THA là ??n v? t? v?n và l?p d? án t?ng th? ??i v?i gói th?u ph?n m?m qu?n lý và ?i?u hành tác nghi?p tri?n khai t?i t?t c? các qu?n, huy?n thu?c Hà N?i.","K/c ?/c giám ??c:\nÝ ki?n tham m?u:\n- Chuy?n phòng kinh doanh th?c hi?n;\n- Sao chuy?n phó giám ??c Nguy?n Quý H?u giám sát.","2013-02-21","1970-01-01","2013-02-21","2013-03-07","Nguy?n Th? Th?o","Ch? t?ch","1","1","2013-02-21","","1","1","2","1","7","1","D??ng Vi?t Hùng","1");
INSERT INTO doc_users VALUES("20","Thông t?","L?p k? ho?ch phân b? tài chính n?m 2015","3","Phòng TCKH ?ông Anh","458/TT-UBND","20","V/v L?p k? ho?ch tài chính cho các phòng ban c?a Huy?n th? tr?n và các xã trong n?m 2015","Tôi ??ng ý","2013-03-19","1970-01-01","2013-03-22","2013-04-24","Nguy?n Kh?c Th?","Ch? t?ch","1","1","2013-03-19","","1","2","2","2","7","14","D??ng Vi?t Hùng","1");
INSERT INTO doc_users VALUES("21","Thông t?","Qu?n lí v?n ?? d?y thêm h?c thêm","2","S? Giáo D?c và ?ào T?o TPHN","459/TT-UBND","21","V/v Qu?n lý v?n ?? d?y thêm h?c thêm trên ??a bàn toàn thành ph? ??ng th?i nâng cao ch?t l??ng giáo d?c ?ào t?o","K/c ?/c giám ??c:\nÝ ki?n tham m?u:\nS? giáo d?c k?t h?p v?i ?y ban nhân dân các qu?n huy?n và các phòng giáo d?c t? ch?c thanh ki?m tra v?n ?? d?y thêm h?c thêm trên ??a bàn thành ph?\nCó ý ki?n tham m?u cho lãnh ??o","2013-03-19","1970-01-01","2013-03-23","2013-03-19","Nguy?n Công Soái","Phó ch? t?ch","1","1","2013-03-19","","1","2","2","2","7","14","D??ng Vi?t Hùng","1");
INSERT INTO doc_users VALUES("22","Thông t?","Nâng cao hi?u su?t s? d?ng n?ng l??ng","2","S? Khoa H?c và Công Ngh? TPHN","460/TT-SKHCN","22","V/v c?i ti?n s?a ch?a h? th?ng truy?n t?i ?i?n trên ??a bàn toàn thành ph?,nh?m ?áp ?ng nâng cao ch?t l??ng trong giai ?o?n phát tri?n m?i","K/c ?/c giám ??c:\nÝ ki?n tham m?u:\nT? ch?c ki?m tra ?ánh giá tình hình c? s? h? t?ng c?a h? th?ng truy?n t?i ?i?n,\nl?p k? ho?ch nâng c?p c?i t?o ?? xu?t v?i UBND thành ph?","2013-03-19","1970-01-01","2013-03-04","2013-03-19","Ngô Th? Thanh H?ng","Phó ch? t?ch","1","1","2013-03-19","","1","2","2","2","7","14","D??ng Vi?t Hùng","1");
INSERT INTO doc_users VALUES("23","Thông tri","Nâng cao n?ng l?c cho cán b? nhân viên v?n phòng","3","Phòng công ch?ng NN s? 1","345/TT-UBND","23","V/v T? ch?c h?c h?i th?o nâng cao nghi?p v? cho cán b? v?n phòng nh?m nâng cao n?ng l?c","??ng ý","2013-03-19","1970-01-01","2013-03-05","2013-04-23","Nguy?n H?u ??","Phó ch? t?ch","1","1","2013-03-19","","1","1","2","2","7","14","D??ng Vi?t Hùng","1");
INSERT INTO doc_users VALUES("24","Thông t?","H?i th?o t? v?n pháp lu?t","2","S? T? Pháp TPHN","560/TT-STP","24","V/v L?p k? ho?ch t? ch?c h?i th?o t? v?n pháp lu?n trên ??a bàn toàn thành ph? trong n?m 2013","K/c ?/c giám ??c:\nÝ ki?n tham m?u:\nPh?i k?t h?p v?i ?y ban nhân dân các Qu?n Huy?n t? ch?c h?i th?o, t? v?n pháp lu?n cho cán b? công nhân viên và nhân dân trên ??a bàn","2013-03-19","1970-01-01","2013-03-02","2013-03-19","Lê Anh Tu?n","Phó ch? t?ch","1","1","2013-03-19","","1","2","2","2","7","14","D??ng Vi?t Hùng","1");
INSERT INTO doc_users VALUES("25","Thông t?","L?p k? ho?ch ??u t? cho các t?nh phía nam","1","B? công th??ng","679/TT-BCT","25","V/v L?p k? ho?ch ??u t? cho các t?nh thành phía nam trong n?m 2013","??ng ý","2013-03-19","1970-01-01","2013-03-04","2013-04-23","Lâm Qu?c Hùng","Phó Chánh V?n Phòng","1","1","2013-03-19","","1","2","2","1","7","14","D??ng Vi?t Hùng","1");
INSERT INTO doc_users VALUES("26","Thông t?","T? v?n, lên d? án","3","Phòng công ch?ng NN s? 2","209/TT-UBND","26","V/v L?p k? ho?ch d? án làm vi?c trong n?m 2013 và ??nh h??ng phát tri?n trong nh?ng n?m ti?p theo","K/c ?/c giám ??c:\nÝ ki?n tham m?u:\ng?i ??n phòng lao ??ng th??ng binh và xã h?i lên k? ho?ch t? ch?c ngày h?i vi?c làm trên ??a bàn huy?n","2013-03-19","1970-01-01","2013-03-05","2013-03-19","Lê V?n Th?","Phó ch? t?ch","1","1","2013-03-19","","1","2","2","2","7","14","D??ng Vi?t Hùng","1");
INSERT INTO doc_users VALUES("27","Thông t?","L?p k? ho?ch t? ch?c ki?m tra","2","Thanh tra S?_S? GTHN","668/TT-SGT","27","V/v T? ch?c l?p k? ho?ch ki?m tra thanh tra giao thông trên ??a bàn thành ph?","??ng ý v?i v?n b?n","2013-03-19","1970-01-01","2013-03-05","2013-04-23","Nguy?n H?ng S?n","Phó giám ??c","1","1","2013-03-19","","1","1","2","1","7","14","D??ng Vi?t Hùng","1");
INSERT INTO doc_users VALUES("28","Thông tri","T? ch?c t? v?n cho nhân dân các huy?n trên ??a bàn Tp","2","H?i Nông dân HN","347/TT-HND","28","V/v Lên k? ho?ch t? ch?c h?i th?o h??ng nghi?p cho các huy?n, th? tr?n có d? án thu h?i ??t trên ??a bàn thành ph?","K/c ?/c giám ??c:\nÝ ki?n tham m?u:\nChuy?n ??n phòng th??ng binh lao ??ng xã h?i huy?n t? ch?c và ph?i h?p v?i các phòng ban có liên quan","2013-03-19","1970-01-01","2013-03-07","2013-03-19","Nguy?n Kh?c D?ng","Phó Ban Th??ng Tr?c","1","1","2013-03-19","","1","1","2","1","7","14","D??ng Vi?t Hùng","1");
INSERT INTO doc_users VALUES("31","Công v?n","","1","Trung tâm Khuy?n Nông&T? v?n PTCN","112354","29","V?n B?n","Xem xét v? các ch?c n?ng và d?ch v?","2013-04-23","1970-01-01","2013-04-12","2013-04-23","Mai Xuân Vinh","Tr??ng ban","1","1","2013-04-23","","1","2","2","2","8","1","Nguy?n Quý H?u","2");
INSERT INTO doc_users VALUES("32","Công v?n","Qu?n tr? m?ng","0","S? Công Th??ng TPHN","06-UBND-VP","30","Thi?t k? ?? h?a","\n?ông ý v?n b?n ?úng","2013-04-23","1970-01-01","2013-04-23","2013-04-23","Ngô Quang Ti?n","Th? tr??ng","2","2","2013-04-23","","1","2","2","2","8","24","Nguy?n Quý H?u","2");
INSERT INTO doc_users VALUES("33","Thông báo","Thi?t k? ?? h?a","3","UBND huy?n Ch??ng M?","25/UBND","31","V/v Thi?t k? bi?n qu?ng cáo cho công ty TNHH ABC","?ã cho ý ki?n và chuy?n phòng ban x? lý","2013-04-23","1970-01-01","2013-04-23","2013-04-23","Ngô Th? Thanh H?ng","Phó ch? t?ch","1","1","2013-04-23","","1","1","1","2","7","24","D??ng Vi?t Hùng","1");
INSERT INTO doc_users VALUES("34","Công V?n","","0","U? Ban Th??ng V? Qu?c H?i","07-UBND-DN","32","Ngh? quy?t gi?i quy?t các th?c m?c c?a ng??i dân","Không ??ng ý","2013-04-23","1970-01-01","2013-04-23","2013-04-23","D??ng K? Lân","Tr??ng C? Quan Th??ng tr?c","1","1","2013-04-23","","1","1","2","2","7","24","D??ng Vi?t Hùng","1");
INSERT INTO doc_users VALUES("35","Thông t?","T? v?n, lên d? án","2","UBND Qu?n Hoàn Ki?m","0214/UBND","33","V/v t? v?n thi?t k? d? án c?u ???ng b?","??ng ý v?i h??ng gi?i quy?t c?a cty","2013-04-23","1970-01-01","2013-04-23","2013-04-23","Ng? Duy Hi?u","Giám ??c","1","1","2013-04-23","","1","1","1","2","7","24","D??ng Vi?t Hùng","1");



DROP TABLE tbl_addusers;

CREATE TABLE `tbl_addusers` (
  `addUser_id` int(11) NOT NULL auto_increment,
  `user_sent` int(11) default '0',
  `user_id` varchar(250) default '0',
  `doc_id` int(11) default '0',
  `addUser_desc` varchar(250) default NULL,
  `addUser_date` datetime default NULL,
  PRIMARY KEY  (`addUser_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE tbl_baotris;

CREATE TABLE `tbl_baotris` (
  `baotri_id` int(11) NOT NULL auto_increment,
  `baotri_lan` int(11) default NULL,
  `vttb_cat_id` varchar(250) default NULL,
  `vttb_sub_id` varchar(250) default NULL,
  `vttb_id` varchar(250) default NULL,
  `baotri_cost` int(11) default '0',
  `baotri_date` date default NULL,
  `baotri_sort` int(11) default '0',
  `baotri_active` tinyint(4) default '1',
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`baotri_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE tbl_config;

CREATE TABLE `tbl_config` (
  `config_id` int(11) NOT NULL auto_increment,
  `owner_name` varchar(255) default NULL,
  `owner_add` varchar(255) default NULL,
  `owner_phone` varchar(255) default NULL,
  `owner_fax` varchar(255) default NULL,
  `owner_email` varchar(255) default NULL,
  `owner_reemail` varchar(255) default NULL,
  `owner_url` varchar(255) default NULL,
  `site_logo` varchar(255) default NULL,
  `site_banner` varchar(255) default NULL,
  `site_border` varchar(255) default NULL,
  `sat_ra` tinyint(4) default NULL,
  `sun_ra` tinyint(4) default NULL,
  `site_port` varchar(50) default NULL,
  `site_active` tinyint(1) default NULL,
  `site_inactive_info` varchar(255) default NULL,
  PRIMARY KEY  (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO tbl_config VALUES("1","CÔNG TY TNHH T? V?N THI?T K? CÔNG NGH? VÀ D?CH V? T?NG H?P THA","S? 3, ngõ L?nh C?, Khâm Thiên, P. Th? Quan, Q. ??ng ?a, Hà N?i","0973 559 746","043.8243.186","anhvan3103@gmail.com","","THA","2000000","01-01-2013","","2","2","COM5","","");



DROP TABLE tbl_cv_cats;

CREATE TABLE `tbl_cv_cats` (
  `cv_cat_id` int(11) NOT NULL auto_increment,
  `cv_cat_name` varchar(250) default NULL COMMENT 'ten',
  `cv_cat_desc` text COMMENT 'mo ta',
  `cv_cat_priority` tinyint(4) default '0' COMMENT 'uu tien',
  `cv_cat_date` date default NULL COMMENT 'ngay tao',
  `cv_cat_sort` int(11) default '0' COMMENT 'sap xep',
  `cv_cat_active` tinyint(4) default '0' COMMENT 'tinh trang: huy / thuc hien',
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`cv_cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO tbl_cv_cats VALUES("1","Chu?n b? t?p hu?n tin h?c ?ng d?ng SNV Ninh Bình.","Các phòng K? thu?t, Kinh doanh, Tri?n khai c? ng??i th?c hi?n các công vi?c c?n thi?t.","1","2013-03-26","","1","7");
INSERT INTO tbl_cv_cats VALUES("3","Tri?n khai ph?n m?m Offices t?i 6 huy?n t?nh Ninh Bình","Các phòng K? thu?t, kinh doanh, tri?n khai th?c hi?n","0","2013-03-26","0","1","7");



DROP TABLE tbl_cv_indexs;

CREATE TABLE `tbl_cv_indexs` (
  `cv_index_id` int(11) NOT NULL auto_increment,
  `cv_sub_id` int(11) default NULL COMMENT 'khoa ngoai',
  `process_user` int(11) default NULL COMMENT 'nguoi nhan viec',
  `cv_index_name` varchar(250) default NULL COMMENT 'ten',
  `cv_index_desc` text COMMENT 'mo ta',
  `cv_index_date` date default NULL,
  `cv_index_sort` int(11) default '0',
  `cv_index_active` tinyint(4) default '0',
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`cv_index_id`),
  KEY `FK_tbl_cv_indexs` (`cv_sub_id`),
  CONSTRAINT `FK_tbl_cv_indexs` FOREIGN KEY (`cv_sub_id`) REFERENCES `tbl_cv_subs` (`cv_sub_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

INSERT INTO tbl_cv_indexs VALUES("1","1","10","","","2013-03-27","0","0","18");
INSERT INTO tbl_cv_indexs VALUES("2","1","12","","","2013-03-27","0","0","18");
INSERT INTO tbl_cv_indexs VALUES("4","2","15","","","2013-03-27","0","0","9");
INSERT INTO tbl_cv_indexs VALUES("11","3","16","","","2013-03-27","0","0","17");
INSERT INTO tbl_cv_indexs VALUES("12","3","22","","","2013-03-27","0","0","17");
INSERT INTO tbl_cv_indexs VALUES("17","2","13","","","2013-03-28","0","0","9");



DROP TABLE tbl_cv_logs;

CREATE TABLE `tbl_cv_logs` (
  `cv_log_id` int(11) NOT NULL auto_increment,
  `cv_index_id` int(11) default NULL COMMENT 'khoa ngoai',
  `cv_log_num_day` date default NULL COMMENT 'so ngay cho viec',
  `cv_log_desc` varchar(250) default NULL COMMENT 'ten',
  `cv_log_note` varchar(250) default NULL COMMENT 'ghi chu',
  `cv_log_date` date default NULL COMMENT 'ngay tao',
  `cv_log_sort` int(11) default '0',
  `cv_log_active` tinyint(4) default '0' COMMENT 'tinh trang: hoan thanh/chua',
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`cv_log_id`),
  KEY `FK_tbl_cv_logs` (`cv_index_id`),
  CONSTRAINT `FK_tbl_cv_logs` FOREIGN KEY (`cv_index_id`) REFERENCES `tbl_cv_indexs` (`cv_index_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

INSERT INTO tbl_cv_logs VALUES("3","1","","Tài li?u h??ng d?n","30 b?","","","1","18");
INSERT INTO tbl_cv_logs VALUES("4","2","","Tài li?u h??ng d?n","20 b?","","0","1","18");
INSERT INTO tbl_cv_logs VALUES("5","2","","Chu?n b? laptop","2 cái","","0","0","18");
INSERT INTO tbl_cv_logs VALUES("6","2","","Chu?n b? Ipad","01 cái","","0","1","18");
INSERT INTO tbl_cv_logs VALUES("13","1","","Chu?n b? máy chi?u màn chi?u","01 cái","","0","1","18");
INSERT INTO tbl_cv_logs VALUES("14","4","","??t xe oto 7 ch?","Giá cáo nh?t là 4tr (kho?ng 500km)","","0","0","9");
INSERT INTO tbl_cv_logs VALUES("15","4","","Chu?n b? 05 USB 3G","M?i cái n?p s?n 50k","","0","0","9");
INSERT INTO tbl_cv_logs VALUES("16","17","","Chu?n b? 02 loa máy tính","Công su?t 2.0 dB","","0","0","9");
INSERT INTO tbl_cv_logs VALUES("17","17","","Chu?n b? 02 mic ko dây","Thêm 4 pin d? phòng","","0","0","9");
INSERT INTO tbl_cv_logs VALUES("18","11","","??t phòng nhà ngh? 5 ngày","2 phòng triple","","0","0","17");
INSERT INTO tbl_cv_logs VALUES("19","11","","Mua 10 chai lavie dùng trên ???ng","lo?i 1.5 lit","","0","0","17");
INSERT INTO tbl_cv_logs VALUES("20","12","","?i theo phòng k? thu?t chi tr? kinh phí thi?t b?","l?y phi?u thu","","0","0","17");
INSERT INTO tbl_cv_logs VALUES("21","12","","?i theo phòng tri?n khai - b?o hành chi tr? kinh phí v?t d?ng, tài ki?u","l?y phi?u thu","","0","0","17");
INSERT INTO tbl_cv_logs VALUES("22","12","","Gi? kinh phí d? trù chi tr? n?u c?n","l?y phi?u thu","","0","0","17");



DROP TABLE tbl_cv_subs;

CREATE TABLE `tbl_cv_subs` (
  `cv_sub_id` int(11) NOT NULL auto_increment,
  `cv_cat_id` int(11) default NULL COMMENT 'khoa ngoai',
  `department_id` int(11) default NULL COMMENT 'khoa ngoai phong',
  `cv_sub_name` varchar(250) default NULL COMMENT 'ten',
  `cv_sub_desc` text COMMENT 'mo ta',
  `cv_sub_time_limit` date default NULL COMMENT 'thoi han',
  `cv_sub_date` date default NULL COMMENT 'ngay tao',
  `cv_sub_sort` int(11) default '0',
  `cv_sub_active` tinyint(4) default '0',
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`cv_sub_id`),
  KEY `FK_tbl_cv_subs` (`cv_cat_id`),
  CONSTRAINT `FK_tbl_cv_subs` FOREIGN KEY (`cv_cat_id`) REFERENCES `tbl_cv_cats` (`cv_cat_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO tbl_cv_subs VALUES("1","1","3","Chu?n b? thi?t b?, tài li?u k? thu?t 1","1. Laptop: 05 chi?c\n2. Máy chi?u   màn chi?u: 01 chi?c\n3. Ipad: 01 chi?c\n4. Tài li?u h??ng d?n: 50 b?","2013-04-05","2013-03-27","","","1");
INSERT INTO tbl_cv_subs VALUES("2","1","7","Chu?n b? ph??ng ti?n, thi?t b?","1. Xe oto 7 ch?: 01 cái\n2. Loa: 02 cái\n3. Mic: 02 cái\n4. USB 3G: 05 cái (N?p s?n 100k/01 cái)","2013-03-29","2013-03-27","","","1");
INSERT INTO tbl_cv_subs VALUES("3","1","4","Chu?n b? kinh phí","1. Kinh phí ?i l?i: 2tr\n2. Kinh phí ?n ng?: 3tr\n3. Kinh phí thi?t b?, tài li?u: 3tr\n4. Kinh phí khác: 2tr","2013-03-27","2013-03-27","","","1");



DROP TABLE tbl_departments;

CREATE TABLE `tbl_departments` (
  `department_id` int(11) NOT NULL auto_increment,
  `department_name` varchar(250) default NULL,
  `department_ununicode` varchar(250) default NULL COMMENT 'ten khong dau',
  `department_standfor` varchar(250) default NULL COMMENT 'viet tat',
  `department_desc` text,
  `department_date` datetime default NULL,
  `department_sort` int(11) default '0',
  `department_type` tinyint(4) default '1' COMMENT 'dhnb - tnvb',
  `department_active` tinyint(4) default '0',
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

INSERT INTO tbl_departments VALUES("1","Phòng Hành chính - T? ch?c","PhongHanhchinhTochuc","HCTC","Phòng Hành chính - T? ch?c ??m nhi?m ch?c n?ng t? ch?c và qu?n lý nhân s?, l?ch bi?u, ti?p nh?n v?n b?n ??n và phát hành v?n b?n ?i...","2012-09-24 00:00:00","","3","1","");
INSERT INTO tbl_departments VALUES("2","Phòng K? toán - Tài v?","PhongKetoanTaivu","KTTV","Phòng k? toán qu?n lý s? sách ch?ng t? và làm các công tác liên quan ??n thu? và tài chính doanh nghi?p.","2012-09-24 00:00:00","","3","1","");
INSERT INTO tbl_departments VALUES("3","Phòng K? thu?t","PhongKythuat","KT","Phòng K? thu?t th?c hi?n các nhi?m v? chuyên môn c?a công ty.","2012-09-24 00:00:00","0","3","1","");
INSERT INTO tbl_departments VALUES("4","Phòng Kinh doanh","PhongKinhdoanh","KD","Phòng kinh doanh th?c hi?n công tác marketing và th?c hi?n h?p ??ng v?i khách hàng.","2012-09-24 00:00:00","0","3","1","");
INSERT INTO tbl_departments VALUES("6","Phòng D? án","PhongDuan","DA","Phòng D? án th?c hi?n vi?c chu?n b? h? s? và lên k? ho?ch ??u th?u d? án, qu?n lý ti?n ?? và ch?t l??ng d? án.","2012-09-24 00:00:00","0","1","1","");
INSERT INTO tbl_departments VALUES("7","Phòng Tri?n khai-B?o hành","Phong Trien khaiBao hanh","TKBH","Phòng Tri?n khai-B?o hành th?c hi?n vi?c tri?n khai cài ??t, ?ào t?o, h??ng d?n, h? tr? khách hàng, ph?i h?p v?i phòng k? thu?t th?c hi?n b?o hành khi c?n thi?t.","2013-03-19 00:00:00","","3","1","");
INSERT INTO tbl_departments VALUES("8","Chi nhánh 1 - Thanh Hóa","Chi nhanh 1  Thanh Hoa","CN1-TH","","2013-03-15 00:00:00","0","2","1","");
INSERT INTO tbl_departments VALUES("9","Chi nhánh 2 - ?à N?ng","Chi nhanh 2  Da N?ng","CN2-?N","","2013-03-15 00:00:00","0","2","1","");
INSERT INTO tbl_departments VALUES("10","Chi nhánh 3 - Khánh hòa","Chi nhanh 3  Khanh hoa","CN3-KH","","2013-03-15 00:00:00","0","2","1","");
INSERT INTO tbl_departments VALUES("11","Chi nhánh 4 - TP.HCM","Chi nhanh 4  TP.HCM","CN4-TP.HCM","","2013-03-15 00:00:00","0","2","1","");



DROP TABLE tbl_dlfiles;

CREATE TABLE `tbl_dlfiles` (
  `dlfile_id` int(11) NOT NULL auto_increment,
  `dl_id` int(11) default '0',
  `dlfile_name` varchar(100) default NULL,
  `dlfile_path` varchar(250) default NULL,
  `dlfile_date` date default NULL,
  `dlfile_sort` int(11) default NULL,
  `dlfile_active` tinyint(4) default '1',
  `user_id` int(11) default '0',
  PRIMARY KEY  (`dlfile_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO tbl_dlfiles VALUES("1","2","Ch??ng I","../kdl_uploads_2013/6a9c50c768c6aced12e798ec96df824a.png","2013-03-24","","","14");
INSERT INTO tbl_dlfiles VALUES("2","2","Ch??ng II","../kdl_uploads_2013/c6f8592cb23b3356e3af6c6ea28cfdb2.jpg","2013-03-24","","","14");
INSERT INTO tbl_dlfiles VALUES("4","2","Ch??ng III","../kdl_uploads_2013/43e5d0817b23d0bfacd3e1a37dd29e27.jpg","2013-03-24","","1","14");



DROP TABLE tbl_dlkhos;

CREATE TABLE `tbl_dlkhos` (
  `kdl_id` int(11) NOT NULL auto_increment,
  `department_id` int(11) default '0',
  `kdl_name` varchar(100) default NULL,
  `kdl_ununicode` varchar(100) default NULL,
  `kdl_type` tinyint(4) default '1' COMMENT '1: chung, 2: p/b, 3:ca nhan',
  `kdl_date` date default NULL,
  `kdl_sort` int(11) default NULL,
  `kdl_active` tinyint(4) default NULL,
  `user_id` int(11) default '0',
  PRIMARY KEY  (`kdl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

INSERT INTO tbl_dlkhos VALUES("1","0","V?n hóa công s?","Van hoa cong so","1","2013-03-24","","1","14");
INSERT INTO tbl_dlkhos VALUES("2","0","Ti?ng Anh giao ti?p","Tieng Anh giao tiep","1","2013-03-24","","1","14");
INSERT INTO tbl_dlkhos VALUES("3","0","Tin h?c v?n phòng","Tin hoc van phong","1","2013-03-24","","1","14");
INSERT INTO tbl_dlkhos VALUES("4","","Qu?n lý công vi?c cá nhân","Quan ly cong viec ca nhan","1","2013-03-25","","1","1");
INSERT INTO tbl_dlkhos VALUES("5","1","Ki?n th?c qu?n lý hành chính","Kien thuc quan ly hanh chinh","2","2013-03-24","","1","14");
INSERT INTO tbl_dlkhos VALUES("6","1","Ki?n th?c qu?n lý nhân s?","Kien thuc quan ly nhan su","2","2013-03-24","","1","14");
INSERT INTO tbl_dlkhos VALUES("7","1","Ki?n th?c t? ch?c h?i th?o, s? ki?n","Kien thuc to chuc hoi thao, su kien","2","2013-03-24","","1","14");
INSERT INTO tbl_dlkhos VALUES("8","1","K? n?ng ?i?u hành cu?c h?p","Ky nang dieu hanh cuoc hop","2","2013-03-24","","1","14");
INSERT INTO tbl_dlkhos VALUES("9","0","Các m?u báo cáo","Cac mau bao cao","3","2013-03-24","","1","14");



DROP TABLE tbl_dls;

CREATE TABLE `tbl_dls` (
  `dl_id` int(11) NOT NULL auto_increment,
  `kdl_id` int(11) default '0',
  `dl_name` varchar(250) default NULL,
  `dl_note` varchar(250) default NULL,
  `dl_date` date default NULL,
  `dl_sort` int(11) default NULL,
  `dl_active` tinyint(4) default '1',
  `dl_file` tinyint(4) default '2',
  `user_id` int(11) default '0',
  PRIMARY KEY  (`dl_id`),
  KEY `FK_tbl_dls` (`kdl_id`),
  CONSTRAINT `FK_tbl_dls` FOREIGN KEY (`kdl_id`) REFERENCES `tbl_dlkhos` (`kdl_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

INSERT INTO tbl_dls VALUES("1","4","Làm vi?c có k? ho?ch","??nh ngh?a k? ho?ch làm vi?c, h??ng d?n cách l?p k? ho?ch và qu?n lý k? ho?ch","2013-03-26","","1","2","16");
INSERT INTO tbl_dls VALUES("2","4","Cách s?p x?p kho d? li?u cá nhân","H??ng d?n b?n cách s?p x?p d? li?u s? sách, gi?y t?, d? li?u máy tính","2013-03-24","","1","1","14");
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
  `docCat_id` int(11) NOT NULL auto_increment,
  `docCat_name` varchar(250) default NULL,
  `docCat_ununicode` varchar(250) default NULL,
  `docCat_standfor` varchar(250) default NULL,
  `docCat_type` tinyint(4) default '0',
  `docCat_typical` tinyint(4) default '0',
  `docCat_viewdepart` tinyint(4) default '1',
  `docCat_view` tinyint(4) default '1',
  `docCat_out` tinyint(4) default '0',
  `docCat_desc` text,
  `docCat_date` datetime default NULL,
  `docCat_sort` int(11) default '0',
  `docCat_active` int(11) default '0',
  `user_id` int(11) default '0',
  PRIMARY KEY  (`docCat_id`)
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
  `docday_id` int(11) NOT NULL auto_increment,
  `docday_name` varchar(250) default NULL,
  `docday_ununicode` varchar(250) default NULL,
  `docday_standfor` varchar(250) default NULL,
  `docday_num` float default '0',
  `docday_date` date default NULL,
  `docday_sort` int(11) default '0',
  `docday_active` tinyint(4) default '0',
  PRIMARY KEY  (`docday_id`)
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



DROP TABLE tbl_docfields;

CREATE TABLE `tbl_docfields` (
  `docField_id` int(11) NOT NULL auto_increment,
  `docField_name` varchar(250) default NULL,
  `docField_ununicode` varchar(250) default NULL,
  `docField_desc` text,
  `docField_date` datetime default NULL,
  `docField_sort` int(11) default NULL,
  `docField_active` int(11) default NULL,
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`docField_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

INSERT INTO tbl_docfields VALUES("1","Thi?t k? ?? h?a","Thietkedohoa","","2012-10-01 00:00:00","","1","");
INSERT INTO tbl_docfields VALUES("2","Xây d?ng ph?n m?m","Xaydungphanmem","","2012-10-01 00:00:00","","1","");
INSERT INTO tbl_docfields VALUES("3","T? v?n, lên d? án","Tuvan,lenduan","","2012-10-01 00:00:00","","1","");
INSERT INTO tbl_docfields VALUES("4","B?o trì, b?o d??ng","Baotri,baoduong","","2012-10-01 00:00:00","","1","");
INSERT INTO tbl_docfields VALUES("5","Xây l?p m?ng, h? th?ng ph?n c?ng","Xaylapmang,hethongphancung","","2012-10-01 00:00:00","","1","");
INSERT INTO tbl_docfields VALUES("6","Qu?n tr? m?ng","Quantrimang","","2012-10-01 00:00:00","","1","");
INSERT INTO tbl_docfields VALUES("7","Qu?n tr? n?i dung, SEO","Quantrinoidung,SEO","","2012-10-01 00:00:00","","1","");



DROP TABLE tbl_docfiles;

CREATE TABLE `tbl_docfiles` (
  `docFile_id` int(11) NOT NULL auto_increment,
  `doc_id` int(11) default NULL,
  `docFile_name` varchar(250) default NULL,
  `docFile_path` varchar(250) default NULL,
  `docFile_date` datetime default NULL,
  `docFile_sort` int(11) default NULL,
  `docFile_active` int(11) default NULL,
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`docFile_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

INSERT INTO tbl_docfiles VALUES("1","10","1345 - 1: B?n scan","../doc_uploads_2012/5e1aa47c6b3f2ae83de55255c5613594.jpg","2012-10-12 00:00:00","","","1");
INSERT INTO tbl_docfiles VALUES("2","10","1345 - 2: T?p tin liên quan","../doc_uploads_2012/90659bdbb5ff70930d5715e39e92d4f8.jpg","2012-10-12 00:00:00","","","1");
INSERT INTO tbl_docfiles VALUES("5","10","1345 - 3: V?n b?n tr? l?i","../doc_uploads_2012/e15a20956031b03c2a653e3bd7faf955.jpg","2012-10-12 00:00:00","","","1");
INSERT INTO tbl_docfiles VALUES("6","10","1345 - 4: K?t lu?n","../doc_uploads_2012/3165ece81acee9a73efcf60c7f99a7fb.jpg","2012-10-12 00:00:00","","","1");
INSERT INTO tbl_docfiles VALUES("7","10","1345 - 5: Thông báo","../doc_uploads_2012/1be0bbf5216efa8f4aec1726ceb40d67.jpg","2012-10-12 00:00:00","","","1");
INSERT INTO tbl_docfiles VALUES("8","10","1345 - 6: Biên b?n","../doc_uploads_2012/394c5a5117f6f2100cd8f94bbfd8a119.jpg","2012-11-14 00:00:00","","","1");
INSERT INTO tbl_docfiles VALUES("9","17","255/CV-NHN","../doc_uploads_2013/858b72212749a0c5341ed090fbc50045.jpg","2013-03-14 00:00:00","","","14");
INSERT INTO tbl_docfiles VALUES("10","16","257/TB-UBND","../doc_uploads_2013/3a7f66fc47bdddc8cf1312c1ab945b8c.jpg","2013-03-14 00:00:00","","","14");
INSERT INTO tbl_docfiles VALUES("11","5","489","../doc_uploads_2013/e30dc7a62f16b6198d5ab91ea38160a9.jpg","2013-03-15 00:00:00","","","14");
INSERT INTO tbl_docfiles VALUES("12","1","2350","../doc_uploads_2013/22a3b317ee6bf71e9e6bf1f0aab29a9e.jpg","2013-03-19 00:00:00","","","14");
INSERT INTO tbl_docfiles VALUES("13","2","1249","../doc_uploads_2013/41db304c0609056da30457eef50deea8.png","2013-03-19 00:00:00","","","14");
INSERT INTO tbl_docfiles VALUES("14","11","12/CV-CKXL7","../doc_uploads_2013/36d1db0b345698f640733f97977d2b67.pdf","2013-03-19 00:00:00","","","11");
INSERT INTO tbl_docfiles VALUES("15","12","1252/Q?-UBND","../doc_uploads_2013/029734eec3f6b4a559053b49c7089773.pdf","2013-03-19 00:00:00","","","11");
INSERT INTO tbl_docfiles VALUES("16","18","456/TB-SCT","../doc_uploads_2013/407f86ccf890c0ebdd5e25ee249f8aac.jpg","2013-03-19 00:00:00","","","11");
INSERT INTO tbl_docfiles VALUES("17","27","668/TT-SGT","../doc_uploads_2013/832b298af3402ee344d9887b17a7ea9f.jpg","2013-03-19 00:00:00","","","11");
INSERT INTO tbl_docfiles VALUES("18","13","245/TB-HID","../doc_uploads_2013/0cf530d8041391f68655575ba4610fd4.jpg","2013-03-19 00:00:00","","","11");
INSERT INTO tbl_docfiles VALUES("19","25","679/TT-BCT","../doc_uploads_2013/f857e77f656bb4787ed20fd7092b90f0.png","2013-03-19 00:00:00","","","14");
INSERT INTO tbl_docfiles VALUES("20","28","347/TT-HND","../doc_uploads_2013/26aa5b4ed5bd50145a1c10b4340b6b75.jpg","2013-03-19 00:00:00","","","14");
INSERT INTO tbl_docfiles VALUES("21","25","679/TT-BCT","../doc_uploads_2013/637bf824b853a607483d3e30b53f2699.jpg","2013-03-28 00:00:00","","","14");



DROP TABLE tbl_doclevels;

CREATE TABLE `tbl_doclevels` (
  `docLevel_id` int(11) NOT NULL auto_increment,
  `docLevel_name` varchar(250) default NULL,
  `docLevel_standfor` varchar(250) default NULL,
  `docLevel_desc` text,
  `docLevel_date` datetime default NULL,
  `docLevel_sort` int(11) default NULL,
  `docLevel_active` int(11) default NULL,
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`docLevel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO tbl_doclevels VALUES("1","Trung ??ng","TW","","2012-10-01 00:00:00","","1","");
INSERT INTO tbl_doclevels VALUES("2","Thành ph?","TP","","2012-10-01 00:00:00","","1","");
INSERT INTO tbl_doclevels VALUES("3","Huy?n","H","","2012-10-01 00:00:00","","1","");
INSERT INTO tbl_doclevels VALUES("4","Khác","K","","2012-10-01 00:00:00","","1","");



DROP TABLE tbl_docoutfiles;

CREATE TABLE `tbl_docoutfiles` (
  `docOutFile_id` int(11) NOT NULL auto_increment,
  `docOut_id` int(11) default '0',
  `docOutFile_name` varchar(250) default NULL,
  `docOutFile_path` varchar(250) default NULL,
  `docOutFile_date` datetime default NULL,
  `docOutFile_sort` int(11) default '0',
  `docOutFile_active` tinyint(4) default '0',
  `user_id` int(11) default '0',
  PRIMARY KEY  (`docOutFile_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO tbl_docoutfiles VALUES("1","10","7/THA-HCTC","../doc_uploads_2012/3860ffb00dde3bc949b442c28560cc99.jpg","","0","0","0");
INSERT INTO tbl_docoutfiles VALUES("2","9","6/KH/THA-KTTV","../doc_uploads_2013/7f91c59527e4ce93401357e90b57d1ff.jpg","","0","0","0");
INSERT INTO tbl_docoutfiles VALUES("3","7","5/KL/THA-DA","../doc_uploads_2013/efbef6e90d007600e5ad8a41fc1e07a3.jpg","","0","0","0");
INSERT INTO tbl_docoutfiles VALUES("4","5","4/TB/THA-HCTC","../doc_uploads_2013/0f5ed2d53a53c1b5d190c8f912b628d4.jpg","","0","0","0");
INSERT INTO tbl_docoutfiles VALUES("5","4","3/CV-THA","../doc_uploads_2013/6be961cdad35507c550aaef46a357ab0.jpg","","0","0","0");
INSERT INTO tbl_docoutfiles VALUES("6","11","01/THA-KD","../doc_uploads_2013/1743796159a81d0b79a4c2be4d1646cf.doc","","0","0","0");



DROP TABLE tbl_docouts;

CREATE TABLE `tbl_docouts` (
  `docOut_id` int(11) NOT NULL auto_increment,
  `docField_id` varchar(250) default NULL,
  `docCat_id` int(11) default '0',
  `department_id` int(11) default '0',
  `unit_name` varchar(250) default NULL COMMENT 'noi nhan',
  `unit_name_02` varchar(250) default NULL COMMENT 'noi nhan tu danh',
  `docOut_num` int(11) default '0' COMMENT 'he so chung',
  `docOut_num_typical` int(11) default '0' COMMENT 'he so rieng',
  `docOut_code` varchar(250) default NULL,
  `docOut_desc` text,
  `docOut_note` varchar(250) default NULL,
  `docOut_pagenum` int(11) default '0' COMMENT 'so trang',
  `secret_id` int(11) default '0' COMMENT 'do mat',
  `important_id` int(11) default '0' COMMENT 'do khan',
  `docOut_signed` int(11) default '0' COMMENT 'ng ky',
  `interdisci_name` varchar(250) default '0' COMMENT 'ng ky lien nganh',
  `interdisci_name_02` varchar(250) default NULL COMMENT 'ng ky lien nganh tu danh',
  `docOut_obj` varchar(250) default NULL COMMENT 'chuc vu ',
  `docOut_date` datetime default NULL,
  `docOut_file` tinyint(4) default '0' COMMENT 'tinh trang file',
  `input_per` int(11) default '0',
  PRIMARY KEY  (`docOut_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

INSERT INTO tbl_docouts VALUES("1","Hành chính","6","1","","Công ty CP Tech-mart","1","","1/CTr/THA-HCTC","Ch??ng trình h?i th?o gi?i thi?u v? ph?n m?m Qu?n lý - ?i?u hành n?i b?.","","1","0","0","11","","","Tr??ng phòng/ban","2012-10-10 00:00:00","0","1");
INSERT INTO tbl_docouts VALUES("2","Xây l?p m?ng, h? th?ng ph?n c?ng","4","3","","Công ty Tech-Mart","","1","1/GM/THA-KT","M?i Cty Tech-Mart tham d? cu?c h?p t?p hu?n v? tri?n khai cài ??t Server ph?c v? c?u hình ph?n m?m QL-?H n?i b?","","2","0","0","8","","","Phó Giám ??c","2012-10-10 00:00:00","0","1");
INSERT INTO tbl_docouts VALUES("3","Hành chính","1","1","","Các thành viên công ty THA","2","0","2/CV-THA","V/v yêu c?u các thành viên trong cty th?c hi?n vi?c ?i làm ?úng gi? và có ý th?c gi? gìn v? sinh bàn gh? và d?ng c? làm vi?c.","","1","0","0","7","0","","Giám ??c","2012-10-12 00:00:00","0","1");
INSERT INTO tbl_docouts VALUES("4","Xây d?ng ph?n m?m","1","6","","Cty Th?m ??nh giá Hà N?i","3","0","3/CV-THA","V/v yêu c?u cty Th?m ??nh giá hà n?i s?m hoàn t?t th? t?c thanh lý h?p ??ng ph?n m?m T?G.","","1","0","0","7","0","","Giám ??c","2012-10-12 00:00:00","1","1");
INSERT INTO tbl_docouts VALUES("5","Hành chính","3","1","","Toàn th? nhân viên cty THA","4","0","4/TB/THA-HCTC","Thông báo t?i toàn th? nhân viên cty THA v? l?ch ho?t ??ng th? thao - du l?ch c?a cty quý IV n?m 2012","","2","0","0","11","0","","Tr??ng phòng/ban","2012-10-12 00:00:00","1","1");
INSERT INTO tbl_docouts VALUES("6","Xây l?p m?ng, h? th?ng ph?n c?ng","4","4","77, 134, 157, 161","","","2","2/GM/THA-KD","Kính m?i quý khách c?a ??i di?n ??n v? ??n tham gia cu?c h?i th?o t?p hu?n nghi?p v? qu?n lý và s? d?ng ph?n m?m QL-?H n?i b?.","","1","0","0","7","","","Giám ??c","2012-10-12 00:00:00","2","1");
INSERT INTO tbl_docouts VALUES("7","Xây d?ng ph?n m?m","15","6","89, 150, 194, 146","","5","0","5/KL/THA-DA","K?t lu?n v? công tác t?p hu?n s? d?ng h? th?ng ph?n m?m QL-?H n?i b? ??i v?i các khách hàng c?a cty THA.","","5","0","0","7","0","","Giám ??c","2012-10-12 00:00:00","1","1");
INSERT INTO tbl_docouts VALUES("8","Khác","4","1","","Cty Tech-Mart, cty H?o V?ng, cty BeoBell","0","3","3/GM/THA-HCTC","M?i các thành viên cty Tech-Mart, H?o v?ng, BeoBell tham gia bu?i thi ??u bóng ?á giao h?u do cty THA t? ch?c vào ngày 15/10/2012.","","1","0","0","11","0","","Tr??ng phòng/ban","2012-10-12 00:00:00","0","1");
INSERT INTO tbl_docouts VALUES("9","K? toán tài chính","9","2","","Các cty thành viên","6","0","6/KH/THA-KTTV","K? ho?ch tài v? quý IV n?m 2012 và k? ho?ch ki?m tra s? sách ch?ng t? n?m 2009-2012 ph?c v? ki?m toán ??c l?p l?n 1.","","2","0","0","7","0","","Giám ??c","2012-10-12 00:00:00","1","1");
INSERT INTO tbl_docouts VALUES("10","Hành chính","2","1","","Các ty thành viên, nhân viên cty THA","7","0","7/THA-HCTC","Quy?t ??nh thành l?p ??i bóng liên h?p gi?a các cty THA, Tech-Mart, H?o Vong, BeoBell.","","2","0","0","11","0","","Tr??ng phòng/ban","2012-10-12 00:00:00","1","1");
INSERT INTO tbl_docouts VALUES("11","","2","4","193","","1","0","01/THA-KD","Quy?t ??nh thành l?p ??i bóng liên h?p gi?a các công ty liên nghành","","1","0","0","7","0","","Giám ??c","2013-04-24 00:00:00","1","24");



DROP TABLE tbl_docreplys;

CREATE TABLE `tbl_docreplys` (
  `docReply_id` int(11) NOT NULL auto_increment,
  `doc_id` int(11) default '0' COMMENT 'ma van ban',
  `user_id` int(11) default '0' COMMENT 'nguoi ra y kien',
  `coordinate_per` varchar(250) default '0' COMMENT 'pho lanh dao phoi hop (chuyen cho ld)',
  `coordinate_depart` varchar(250) default '0' COMMENT 'phong ban phoi hop (chuyen cho pb)',
  `recevie_per` int(11) default '0' COMMENT 'nguoi nhan (pgd)',
  `docReply_date` date default NULL COMMENT 'ngay ra y kien',
  `docReply_desc` text COMMENT 'noi dung y kien',
  `docReply_numday` float default NULL COMMENT 'so ngay xu ly',
  `docReply_limit_time` date default NULL COMMENT 'han xu ly',
  `department_id` varchar(11) default '0' COMMENT 'phong phoi hop (chuyen cho pb)',
  `process_per` int(11) default '0' COMMENT 'nguoi giai quyet',
  `process_level` int(11) default '0' COMMENT 'cap giai quyet',
  `main_department` int(11) default '0' COMMENT 'phong chu tri',
  `docReply_sort` int(11) default '0',
  `docReply_active` tinyint(4) default '0' COMMENT 'hien thi hay ko',
  `docReply_traned` tinyint(4) default '0' COMMENT 'da co y kien khac chua',
  `input_per` int(11) default '0' COMMENT 'nguoi nhap',
  PRIMARY KEY  (`docReply_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

INSERT INTO tbl_docreplys VALUES("1","4","7","0","4","8","2013-02-19","Chuy?n ??ng chí Nguy?n Quý H?u - Phó Giám ??c","","2013-01-01","0","0","0","0","0","0","0","0");
INSERT INTO tbl_docreplys VALUES("2","5","7","0","0","0","2013-02-19","Chuy?n Phòng Hành chính - T? ch?c","","2013-01-01","6,1,2,4,3","0","0","1","0","0","0","0");
INSERT INTO tbl_docreplys VALUES("3","1","7","","","0","2013-02-25","Chuy?n Phòng Kinh doanh","","2013-03-08","6,3","","","4","","","0","");
INSERT INTO tbl_docreplys VALUES("4","2","7","","","8","2013-02-25","Chuy?n ??ng chí Nguy?n Quý H?u - Phó Giám ??c","","2013-03-08","","","","0","","0","0","");
INSERT INTO tbl_docreplys VALUES("5","3","7","0","0","0","2013-02-27","Chuy?n Phòng K? toán - Tài v?","6","2013-03-11","0","0","0","2","0","0","0","0");
INSERT INTO tbl_docreplys VALUES("6","6","7","0","0","0","2013-02-28","Chuy?n Phòng K? thu?t","","2013-01-01","4","0","0","3","0","0","1","0");
INSERT INTO tbl_docreplys VALUES("7","2","8","0","0","0","2013-03-06","Chuy?n Phòng D? án","","2013-03-07","4","0","0","6","0","1","0","0");
INSERT INTO tbl_docreplys VALUES("8","7","7","0","0","0","2013-03-06","Chuy?n Phòng D? án","5.5","2013-03-13","4","0","0","6","0","0","0","0");
INSERT INTO tbl_docreplys VALUES("9","12","7","8","0","0","2013-03-07","Chuy?n Phòng Kinh doanh","","2013-01-01","0","0","0","4","0","0","1","0");
INSERT INTO tbl_docreplys VALUES("14","12","17","0","0","0","2013-03-12","Chuy?n ?/c V?nh ph? trách gi?i quy?t","","1970-01-01","0","16","0","0","0","0","0","17");
INSERT INTO tbl_docreplys VALUES("15","6","18","0","0","0","2013-03-13","Chuy?n ?/c H?i g?y ph? trách gi?i quy?t","","1970-01-01","0","10","7","0","0","0","1","18");
INSERT INTO tbl_docreplys VALUES("16","6","10","0","0","0","2013-03-13","Chuy?n ?/c H?i béo gi?i quy?t và so?n th?o v?n b?n tr? l?i.","","1970-01-01","0","12","8","0","","0","0","10");
INSERT INTO tbl_docreplys VALUES("17","8","7","0","0","0","2013-03-19","Chuy?n Phòng D? án","","2013-01-01","0","0","0","6","0","0","0","0");
INSERT INTO tbl_docreplys VALUES("18","9","7","0","0","0","2013-03-19","Chuy?n Phòng Tri?n khai-B?o hành","","2013-01-01","0","0","0","7","0","0","0","0");
INSERT INTO tbl_docreplys VALUES("19","10","7","0","0","0","2013-03-19","Chuy?n Phòng K? thu?t","","2013-03-29","0","0","0","3","0","0","0","0");
INSERT INTO tbl_docreplys VALUES("20","11","7","0","0","8","2013-03-19","Chuy?n ??ng chí Nguy?n Quý H?u - Phó Giám ??c","10","2013-04-03","0","0","0","0","0","0","0","0");
INSERT INTO tbl_docreplys VALUES("21","28","7","0","0","0","2013-03-19","Chuy?n Phòng Hành chính - T? ch?c","","2013-01-01","0","0","0","1","0","1","0","0");
INSERT INTO tbl_docreplys VALUES("22","33","7","0","0","0","2013-04-23","Chuy?n Phòng Hành chính - T? ch?c","","2013-01-01","0","0","0","1","0","0","1","0");
INSERT INTO tbl_docreplys VALUES("23","33","11","0","0","0","2013-04-23","yêu c?u làm ngay trong ngày","","2013-04-26","0","27","8","0","0","0","0","11");
INSERT INTO tbl_docreplys VALUES("24","23","7","0","0","0","2013-04-23","Chuy?n Phòng K? toán - Tài v?","","2013-01-01","0","0","0","2","0","0","0","0");
INSERT INTO tbl_docreplys VALUES("25","27","7","0","0","8","2013-04-23","Chuy?n ??ng chí Nguy?n Quý H?u - Phó Giám ??c","","2013-01-01","0","0","0","0","0","0","0","0");
INSERT INTO tbl_docreplys VALUES("26","35","7","0","0","8","2013-04-23","Chuy?n ??ng chí Nguy?n Quý H?u - Phó Giám ??c","","2013-01-01","0","0","0","0","0","1","0","0");
INSERT INTO tbl_docreplys VALUES("27","35","8","0","0","0","2013-04-23","Chuy?n Phòng K? thu?t","","2013-01-01","0","0","0","3","0","0","1","0");
INSERT INTO tbl_docreplys VALUES("28","35","18","0","0","0","2013-04-23","gi?i quy?t trong ngày","","2013-04-23","0","12","8","0","0","0","0","18");
INSERT INTO tbl_docreplys VALUES("29","28","7","0","0","0","2013-04-24","Chuy?n Phòng K? toán - Tài v?","","2013-01-01","0","0","0","2","0","0","0","0");
INSERT INTO tbl_docreplys VALUES("30","34","7","0","0","8","2013-04-24","Chuy?n ??ng chí Nguy?n Quý H?u - Phó Giám ??c","","2013-01-01","0","0","0","0","0","1","0","0");
INSERT INTO tbl_docreplys VALUES("31","2","8","0","0","0","2013-04-24","Chuy?n Phòng Hành chính - T? ch?c","","2013-01-01","0","0","0","1","0","0","0","0");
INSERT INTO tbl_docreplys VALUES("32","34","8","0","0","0","2013-04-24","Chuy?n Phòng Kinh doanh","","2013-01-01","0","0","0","4","0","0","0","0");



DROP TABLE tbl_docs;

CREATE TABLE `tbl_docs` (
  `doc_id` int(11) NOT NULL auto_increment,
  `docCat_id` varchar(250) default NULL,
  `docField_id` varchar(250) default NULL,
  `docLevel_id` int(11) default '0',
  `unit_name` varchar(250) default NULL COMMENT 'noi gui den',
  `doc_code` varchar(250) default NULL COMMENT 'so ky hieu',
  `doc_num` int(11) default '0' COMMENT 'so den',
  `doc_desc` text COMMENT 'trich yeu',
  `doc_note` text COMMENT 'dung lam noi dung tham muu',
  `doc_note_code` varchar(250) default NULL COMMENT 'so hieu van ban giai quyet',
  `doc_note_sign_date` date default NULL COMMENT 'ngay ky van ban giai quyet',
  `doc_note_sign_per` varchar(250) default NULL COMMENT 'nguoi ky van ban giai quyet',
  `doc_note_date` date default NULL COMMENT 'ngay giai quyet',
  `doc_recevied` date default NULL,
  `doc_limit_time` date default NULL COMMENT 'han giai quyet (ko dung)',
  `doc_signed` date default NULL COMMENT 'ngay ky',
  `doc_moved` date default NULL COMMENT 'ngay phan loai',
  `signPer_id` varchar(250) default NULL COMMENT 'nguoi ky',
  `signObj_id` varchar(250) default NULL COMMENT 'chuc vu ng ky',
  `secret_id` int(11) default '0' COMMENT 'do mat',
  `important_id` int(11) default '0' COMMENT 'do khan',
  `doc_date` date default NULL COMMENT 'ngay nhap',
  `doc_sort` int(11) default NULL,
  `doc_traned` tinyint(4) default '2' COMMENT 'tinh trang chuyen',
  `doc_replied` tinyint(4) default '2' COMMENT 'tinh trang cho y kien chi dao dau tien',
  `doc_active` tinyint(11) default '2' COMMENT 'da giai quyet hay chua',
  `doc_file` tinyint(4) default '2' COMMENT 'xac dinh van ban co file dinh kem hay chua',
  `user_id` varchar(250) default '0' COMMENT 'nguoi nhan phan loai hoac chuyen thang de chi dao',
  `input_per` int(11) default '0' COMMENT 'nguoi nhap van ban',
  `doc_theodoi` tinyint(4) default '0' COMMENT 'xac dinh van ban can theo doi',
  PRIMARY KEY  (`doc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

INSERT INTO tbl_docs VALUES("1","Công v?n","Xây d?ng ph?n m?m","2","UBND thành ph? HN","2350","1","V/v xây d?ng ph?n m?m qu?n lý và ?i?u hành công vi?c v?n phòng.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng Kinh doanh ph? trách gi?i quy?t\n- Sao chuy?n phòng D? án và phòng K? thu?t ph?i h?p","","","","","2012-10-03","1970-01-01","2012-10-02","2013-02-22","Nguy?n Th? Th?o","Ch? t?ch","1","1","2012-10-03","","1","1","2","1","7","1","1");
INSERT INTO tbl_docs VALUES("2","Quy?t ??nh","T? v?n, lên d? án","2","S? Công Th??ng TPHN","1249","2","Giao cho cty THA trách nhi?m t? v?n và lên d? án ??i v?i vi?c xây d?ng h? thông m?ng t?i s?.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phó giám ??c Nguy?n Quý H?u ph? trách.","","","","","2012-10-03","1970-01-01","2012-10-02","2013-02-22","Hoàng Duy Khanh","Giám ??c","1","1","2012-10-03","","1","1","2","1","7","1","1");
INSERT INTO tbl_docs VALUES("3","Quy?t ??nh","T? v?n, lên d? án","2","S? tài chính","1250","3","Quy?t ??nh giao kinh phí cho cty THA th?c hi?n vi?c T? v?n, lên d? án t?i S? công th??ng.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng K? toán - tài v? ph? trách gi?i quy?t.","","","","","2012-10-03","1970-01-01","2012-10-02","2013-02-22","Nguy?n Công Soái","Giám ??c","1","1","2012-10-03","","1","1","2","2","7","1","1");
INSERT INTO tbl_docs VALUES("4","Gi?y m?i","Thi?t k? ?? h?a","4","Cty TNHH MTV ?TPT Nhà&?ô th?","198","4","V/v m?i ??i di?n cty THA ??n tham d? cu?c h?p th?o lu?n ph??ng pháp thi?t k? banno áp phích cho cty TNHH MTV ?TPT Nhà&?ô th? nh?n k? ni?m 15 n?m thành l?p.","","","","","","2012-10-03","1970-01-01","2012-10-02","1970-01-01","Nguy?n Danh C?","Giám ??c","1","1","2012-10-03","","1","1","2","2","11,7","1","0");
INSERT INTO tbl_docs VALUES("5","Thông báo","Hành chính","4","Cty Tech-Mart","489","5","V/v t? ch?c cu?c g?p g? giao l?u gi?a 2 cty t?i Church Hotel Hàng Gai vào lúc: 18h00\\&lsquo; ngày 10/10/2012","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng Hành chính gi?i quy?t.\n- Sao chuy?n các phòng ban khác bi?t và s?p x?p th?i gian","","","","","2012-10-03","1970-01-01","2012-10-02","2013-02-19","Nguy?n Quý H?u","Giám ??c","1","1","2012-10-03","","1","1","2","1","7","1","0");
INSERT INTO tbl_docs VALUES("6","Công v?n","Xây d?ng ph?n m?m","2","S? Xây D?ng TPHN","3454","6","V/v ?? ngh? cty THA ti?n hành cài ??t và t?p hu?n s? d?ng ph?n m?m m?t c?a.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng K? thu?t gi?i quy?t\n- Sao chuy?n phòng Kinh doanh ph?i h?p","","2013-03-13","","2013-03-13","2012-10-03","1970-01-01","2012-10-03","2013-02-19","Cao Khoa B?ng","Giám ??c","1","1","2012-10-03","","1","1","1","2","7","1","0");
INSERT INTO tbl_docs VALUES("7","Thông báo","Xây d?ng ph?n m?m","3","UBND Qu?n Tây H?","598","7","V/v thông báo t? ch?c ??u th?u gói th?u xây l?p h? thông m?ng cho khu liên c?.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng D? án gi?i quy?t\n- Chuy?n phòng Kinh doanh ph?i h?p","","","","","2012-10-03","1970-01-01","2012-10-03","2013-02-19","Nguy?n Phúc Quang","Ch? t?ch","1","1","2012-10-03","","1","1","2","2","7","1","1");
INSERT INTO tbl_docs VALUES("8","?ính chính V?n b?n","Hành chính","4","Cty Tech-Mart","499","8","?ính chính l?i v?n b?n s? 489 th?i gian t? ch?c giao l?u s? là 18h30‘. ??a ?i?m không thay ??i.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng D? án gi?i quy?t\n- Sao chuy?n phòng Kinh doanh ph?i h?p","","","","","2012-10-04","1970-01-01","2012-10-03","2013-02-19","Nguy?n Quý H?u","Giám ??c","1","2","2012-10-03","","1","1","2","2","7","1","0");
INSERT INTO tbl_docs VALUES("9","Thông báo","","0","Cty Tech-Mart","223","9","Thông báo l?ch b?o trì thi?t b? tin h?c tháng 10-2012 ??n cty THA.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng Tri?n khai-B?o hành gi?i quy?t\n- Sao chuy?n phòng Kinh doanh ph?i h?p","","","","","2013-02-01","1970-01-01","2012-10-04","2013-02-19","Nguy?n Quý H?u","Giám ??c","1","1","2012-10-05","","1","1","2","2","7","1","0");
INSERT INTO tbl_docs VALUES("10","Công v?n","Xây d?ng ph?n m?m","0","S? Tài chính Hà N?i","1345","10","V/v ?? ngh? cty THA c? ??i di?n ??n S? ?? cùng k?t h?p tri?n khai DVC tr?c tuy?n tích h?p trên c?ng thông tin S?.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng K? thu?t ph? trách gi?i quy?t;\n- Sao chuy?n phòng Kinh doanh ph?i h?p.","","","","","2012-10-05","1970-01-01","2012-10-04","2013-02-19","Nguy?n Th? Hà Ninh","Giám ??c","1","1","2012-10-05","","1","1","2","1","7","1","1");
INSERT INTO tbl_docs VALUES("11","Công v?n","T? v?n, lên d? án","4","Cty CP C? khí & Xây l?p s? 7","12/CV-CKXL7","11","V/v ?? ngh? công ty THA c? ng??i t?i t? v?n l?p ??t h? th?ng m?ng n?i b? toàn b? công ty và các phân x??ng s?n xu?t.","Kính g?i ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n ?/c phó giám ??c Nguy?n Quý H?u ph? trách.","","","","","2013-02-22","1970-01-01","2013-02-19","2013-02-22","Nguy?n Quang Tri?u","Giám ??c","1","1","2013-02-20","","1","1","2","1","7","1","1");
INSERT INTO tbl_docs VALUES("12","Quy?t ??nh","T? v?n, lên d? án","2","UBND thành ph? HN","1252/Q?-UBND","12","V/v quy?t ??nh ch?n công ty THA là ??n v? t? v?n và l?p d? án t?ng th? ??i v?i gói th?u ph?n m?m qu?n lý và ?i?u hành tác nghi?p tri?n khai t?i t?t c? các qu?n, huy?n thu?c Hà N?i.","K/c ?/c giám ??c:\nÝ ki?n tham m?u:\n- Chuy?n phòng kinh doanh th?c hi?n;\n- Sao chuy?n phó giám ??c Nguy?n Quý H?u giám sát.","","","","","2013-02-21","1970-01-01","2013-02-21","2013-03-07","Nguy?n Th? Th?o","Ch? t?ch","1","1","2013-02-21","","1","1","2","1","7","1","0");
INSERT INTO tbl_docs VALUES("13","Thông báo","Thi?t k? ?? h?a","4","Công ty TNHH ??u t? xây l?p và Phát tri?n Nhà","245/TB-HID","13","V/v thông báo m? phiên ??u giá gói thi?t k? công trình liên h?p v?n hóa-th? thao ??ng Mai t?i phòng 302, nhà T17, Lê V?n L??ng, ??ng ?a, HN.","","","","","","2013-02-22","1970-01-01","2013-02-20","1970-01-01","Tr?n Th? Kim","Giám ??c","1","1","2013-02-22","","2","2","2","1","0","1","0");
INSERT INTO tbl_docs VALUES("14","Công v?n","B?o trì, b?o d??ng","4","T? ch?c t? v?n rà phá bom mìn và v?t li?u n? MAG Vi?t Nam","143/CV-MAG","14","V/v ?? ngh? cty THA tr? giúp t? v?n và ti?n hành ký k?t h?p ??ng b?o trì, b?o d??ng h? th?ng m?ng, thi?t b? tin h?c t?i MAG.","","","","","","2013-02-22","1970-01-01","2013-02-22","1970-01-01","Lê Anh Th?","Phó giám ??c","1","1","2013-02-22","","2","2","2","2","0","1","0");
INSERT INTO tbl_docs VALUES("15","Công v?n","B?o trì, b?o d??ng","4","Công ty CP thi?t b? công nghi?p Vi?t Ti?n","187/CV-VT","15","V/v ?? ngh? công ty THA ti?n hành gia h?n h?p ??ng b?o trì, b?o d??ng h? th?ng thi?t b? tin h?c và ph?n m?m c?a công ty Vi?t Ti?n n?m 2013.","","","","","","2013-02-22","1970-01-01","2013-02-22","1970-01-01","Bùi Nguyên Soái","Giám ??c","1","1","2013-02-22","","2","2","2","2","0","1","0");
INSERT INTO tbl_docs VALUES("16","Thông báo","Xây d?ng ph?n m?m","3","UBND Qu?n Tây H?","257/TB-UBND","16","V/v thông báo gói th?u ph?n m?m qu?n lý Thi ?ua-khen th??ng tri?n khai cho phòng N?i V?.","","","","","","2013-02-22","1970-01-01","1970-01-01","1970-01-01","Nguy?n Phúc Quang","Ch? t?ch","1","1","2013-02-22","","2","2","2","1","0","1","0");
INSERT INTO tbl_docs VALUES("17","Công v?n","Thi?t k? ?? h?a","4","Công ty QL và PT nhà HN","255/CV-NHN","17","V/v ?? ngh? công ty THA so?n th?o h?p ??ng thi?t k? áp-phích cho gi?i bòng ?á do công ty QL và PT nhà HN ??ng cai.","","","","","","2013-03-07","1970-01-01","2013-03-07","1970-01-01","Nguy?n Lân H?i","Giám ??c","1","1","2013-03-07","","2","2","2","1","0","14","0");
INSERT INTO tbl_docs VALUES("18","Thông báo","Thi?t k? ?? h?a","2","S? Công Th??ng TPHN","456/TB-SCT","18","V/v ?? ngh? công ty THA so?n th?o h?p ??ng thi?t k? giao di?n công thông tin cho s? công th??ng","","","","","","2013-03-19","1970-01-01","2013-03-20","1970-01-01","Ngô Quang Trung","Giám ??c","1","1","2013-03-19","","2","2","2","1","0","14","0");
INSERT INTO tbl_docs VALUES("19","Thông t?","T? v?n, lên d? án","1","B? Tài nguyên và Môi tr??ng","457/TT-BTNMT","19","Vv T? v?n thi?t k? xây d?ng h? th?ng qu?n lý môi tr??ng sông h? khu v?c ??ng b?ng sông H?ng giai ?o?n 2015-2020","","","","","","2013-03-19","1970-01-01","2013-03-20","1970-01-01","Nguy?n Duy Trung","Giám ??c","1","1","2013-03-19","","2","2","2","2","0","14","0");
INSERT INTO tbl_docs VALUES("20","Thông t?","L?p k? ho?ch phân b? tài chính n?m 2015","3","Phòng TCKH ?ông Anh","458/TT-UBND","20","V/v L?p k? ho?ch tài chính cho các phòng ban c?a Huy?n th? tr?n và các xã trong n?m 2015","Tôi ??ng ý","","","","","2013-03-19","1970-01-01","2013-03-22","2013-04-24","Nguy?n Kh?c Th?","Ch? t?ch","1","1","2013-03-19","","1","2","2","2","7","14","0");
INSERT INTO tbl_docs VALUES("21","Thông t?","Qu?n lí v?n ?? d?y thêm h?c thêm","2","S? Giáo D?c và ?ào T?o TPHN","459/TT-UBND","21","V/v Qu?n lý v?n ?? d?y thêm h?c thêm trên ??a bàn toàn thành ph? ??ng th?i nâng cao ch?t l??ng giáo d?c ?ào t?o","K/c ?/c giám ??c:\nÝ ki?n tham m?u:\nS? giáo d?c k?t h?p v?i ?y ban nhân dân các qu?n huy?n và các phòng giáo d?c t? ch?c thanh ki?m tra v?n ?? d?y thêm h?c thêm trên ??a bàn thành ph?\nCó ý ki?n tham m?u cho lãnh ??o","","","","","2013-03-19","1970-01-01","2013-03-23","2013-03-19","Nguy?n Công Soái","Phó ch? t?ch","1","1","2013-03-19","","1","2","2","2","7","14","0");
INSERT INTO tbl_docs VALUES("22","Thông t?","Nâng cao hi?u su?t s? d?ng n?ng l??ng","2","S? Khoa H?c và Công Ngh? TPHN","460/TT-SKHCN","22","V/v c?i ti?n s?a ch?a h? th?ng truy?n t?i ?i?n trên ??a bàn toàn thành ph?,nh?m ?áp ?ng nâng cao ch?t l??ng trong giai ?o?n phát tri?n m?i","K/c ?/c giám ??c:\nÝ ki?n tham m?u:\nT? ch?c ki?m tra ?ánh giá tình hình c? s? h? t?ng c?a h? th?ng truy?n t?i ?i?n,\nl?p k? ho?ch nâng c?p c?i t?o ?? xu?t v?i UBND thành ph?","","","","","2013-03-19","1970-01-01","2013-03-04","2013-03-19","Ngô Th? Thanh H?ng","Phó ch? t?ch","1","1","2013-03-19","","1","2","2","2","7","14","0");
INSERT INTO tbl_docs VALUES("23","Thông tri","Nâng cao n?ng l?c cho cán b? nhân viên v?n phòng","3","Phòng công ch?ng NN s? 1","345/TT-UBND","23","V/v T? ch?c h?c h?i th?o nâng cao nghi?p v? cho cán b? v?n phòng nh?m nâng cao n?ng l?c","??ng ý","","","","","2013-03-19","1970-01-01","2013-03-05","2013-04-23","Nguy?n H?u ??","Phó ch? t?ch","1","1","2013-03-19","","1","1","2","2","7","14","0");
INSERT INTO tbl_docs VALUES("24","Thông t?","H?i th?o t? v?n pháp lu?t","2","S? T? Pháp TPHN","560/TT-STP","24","V/v L?p k? ho?ch t? ch?c h?i th?o t? v?n pháp lu?n trên ??a bàn toàn thành ph? trong n?m 2013","K/c ?/c giám ??c:\nÝ ki?n tham m?u:\nPh?i k?t h?p v?i ?y ban nhân dân các Qu?n Huy?n t? ch?c h?i th?o, t? v?n pháp lu?n cho cán b? công nhân viên và nhân dân trên ??a bàn","","","","","2013-03-19","1970-01-01","2013-03-02","2013-03-19","Lê Anh Tu?n","Phó ch? t?ch","1","1","2013-03-19","","1","2","2","2","7","14","0");
INSERT INTO tbl_docs VALUES("25","Thông t?","L?p k? ho?ch ??u t? cho các t?nh phía nam","1","B? công th??ng","679/TT-BCT","25","V/v L?p k? ho?ch ??u t? cho các t?nh thành phía nam trong n?m 2013","??ng ý","","","","","2013-03-19","1970-01-01","2013-03-04","2013-04-23","Lâm Qu?c Hùng","Phó Chánh V?n Phòng","1","1","2013-03-19","","1","2","2","1","7","14","0");
INSERT INTO tbl_docs VALUES("26","Thông t?","T? v?n, lên d? án","3","Phòng công ch?ng NN s? 2","209/TT-UBND","26","V/v L?p k? ho?ch d? án làm vi?c trong n?m 2013 và ??nh h??ng phát tri?n trong nh?ng n?m ti?p theo","K/c ?/c giám ??c:\nÝ ki?n tham m?u:\ng?i ??n phòng lao ??ng th??ng binh và xã h?i lên k? ho?ch t? ch?c ngày h?i vi?c làm trên ??a bàn huy?n","","","","","2013-03-19","1970-01-01","2013-03-05","2013-03-19","Lê V?n Th?","Phó ch? t?ch","1","1","2013-03-19","","1","2","2","2","7","14","0");
INSERT INTO tbl_docs VALUES("27","Thông t?","L?p k? ho?ch t? ch?c ki?m tra","2","Thanh tra S?_S? GTHN","668/TT-SGT","27","V/v T? ch?c l?p k? ho?ch ki?m tra thanh tra giao thông trên ??a bàn thành ph?","??ng ý v?i v?n b?n","","","","","2013-03-19","1970-01-01","2013-03-05","2013-04-23","Nguy?n H?ng S?n","Phó giám ??c","1","1","2013-03-19","","1","1","2","1","7","14","0");
INSERT INTO tbl_docs VALUES("28","Thông tri","T? ch?c t? v?n cho nhân dân các huy?n trên ??a bàn Tp","2","H?i Nông dân HN","347/TT-HND","28","V/v Lên k? ho?ch t? ch?c h?i th?o h??ng nghi?p cho các huy?n, th? tr?n có d? án thu h?i ??t trên ??a bàn thành ph?","K/c ?/c giám ??c:\nÝ ki?n tham m?u:\nChuy?n ??n phòng th??ng binh lao ??ng xã h?i huy?n t? ch?c và ph?i h?p v?i các phòng ban có liên quan","","","","","2013-03-19","1970-01-01","2013-03-07","2013-03-19","Nguy?n Kh?c D?ng","Phó Ban Th??ng Tr?c","1","1","2013-03-19","","1","1","2","1","7","14","0");
INSERT INTO tbl_docs VALUES("31","Công v?n","","1","Trung tâm Khuy?n Nông&T? v?n PTCN","112354","29","V?n B?n","Xem xét v? các ch?c n?ng và d?ch v?","","","","","2013-04-23","1970-01-01","2013-04-12","2013-04-23","Mai Xuân Vinh","Tr??ng ban","1","1","2013-04-23","","1","2","2","2","8","1","0");
INSERT INTO tbl_docs VALUES("32","Công v?n","Qu?n tr? m?ng","0","S? Công Th??ng TPHN","06-UBND-VP","30","Thi?t k? ?? h?a","\n?ông ý v?n b?n ?úng","","","","","2013-04-23","1970-01-01","2013-04-23","2013-04-23","Ngô Quang Ti?n","Th? tr??ng","2","2","2013-04-23","","1","2","2","2","8","24","0");
INSERT INTO tbl_docs VALUES("33","Thông báo","Thi?t k? ?? h?a","3","UBND huy?n Ch??ng M?","25/UBND","31","V/v Thi?t k? bi?n qu?ng cáo cho công ty TNHH ABC","?ã cho ý ki?n và chuy?n phòng ban x? lý","s? 094","2013-04-23","Nguy?n Quý H?u","2013-04-23","2013-04-23","1970-01-01","2013-04-23","2013-04-23","Ngô Th? Thanh H?ng","Phó ch? t?ch","1","1","2013-04-23","","1","1","1","2","7","24","0");
INSERT INTO tbl_docs VALUES("34","Công V?n","","0","U? Ban Th??ng V? Qu?c H?i","07-UBND-DN","32","Ngh? quy?t gi?i quy?t các th?c m?c c?a ng??i dân","Không ??ng ý","","","","","2013-04-23","1970-01-01","2013-04-23","2013-04-23","D??ng K? Lân","Tr??ng C? Quan Th??ng tr?c","1","1","2013-04-23","","1","1","2","2","7","24","0");
INSERT INTO tbl_docs VALUES("35","Thông t?","T? v?n, lên d? án","2","UBND Qu?n Hoàn Ki?m","0214/UBND","33","V/v t? v?n thi?t k? d? án c?u ???ng b?","??ng ý v?i h??ng gi?i quy?t c?a cty","s? 85","2013-04-23","D??ng Vi?t Hùng","2013-04-23","2013-04-23","1970-01-01","2013-04-23","2013-04-23","Ng? Duy Hi?u","Giám ??c","1","1","2013-04-23","","1","1","1","2","7","24","0");



DROP TABLE tbl_feedbacks;

CREATE TABLE `tbl_feedbacks` (
  `feedback_id` int(11) NOT NULL auto_increment,
  `doc_id` int(11) default '0',
  `feedback_cont` text,
  `feedback_date` datetime default NULL,
  `read_status` tinyint(4) default '0',
  `read_time` datetime default NULL,
  `user_id` int(11) default '0',
  PRIMARY KEY  (`feedback_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO tbl_feedbacks VALUES("1","3","Tôi ?ã xem và nh?t chí v?i v?n b?n","2013-05-01 08:05:05","0","","14");



DROP TABLE tbl_hdsds;

CREATE TABLE `tbl_hdsds` (
  `hdsd_id` int(11) NOT NULL auto_increment,
  `hdsd_name` varchar(250) default NULL,
  `hdsd_path` varchar(250) default NULL,
  `hdsd_date` date default NULL,
  `hdsd_sort` int(11) default NULL,
  `hdsd_active` tinyint(4) default NULL,
  PRIMARY KEY  (`hdsd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO tbl_hdsds VALUES("1","H??ng d?n s? 1","../hdsd_uploads/e679b049cfc782e011867729bd2e28e3.swf","2013-05-03","","1");
INSERT INTO tbl_hdsds VALUES("2","H??ng d?n s? 2","../hdsd_uploads/e679b049cfc782e011867729bd2e28e3.swf","2013-05-03","","1");



DROP TABLE tbl_holidays;

CREATE TABLE `tbl_holidays` (
  `holiday_id` int(11) NOT NULL auto_increment,
  `holiday_name` varchar(250) default NULL,
  `holiday_date` date default NULL,
  `holiday_sort` int(11) default NULL,
  `holiday_active` tinyint(4) default '1',
  PRIMARY KEY  (`holiday_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO tbl_holidays VALUES("1","Ngh? bù gi? t?","2012-04-02","","1");
INSERT INTO tbl_holidays VALUES("2","Ngh? ngày Gi?i phóng Mi?n nam","2012-04-30","0","1");
INSERT INTO tbl_holidays VALUES("3","Ngh? ngày Qu?c t? lao ??ng","2012-05-01","0","1");
INSERT INTO tbl_holidays VALUES("4","Ngh? bù Qu?c khánh","2012-09-03","2","1");
INSERT INTO tbl_holidays VALUES("5","Ngh? t?t âm l?ch","2013-04-23","","1");



DROP TABLE tbl_importants;

CREATE TABLE `tbl_importants` (
  `important_id` int(11) NOT NULL auto_increment,
  `important_name` varchar(250) default NULL,
  `important_desc` text,
  `important_date` datetime default NULL,
  `important_sort` int(11) default '0',
  `important_active` tinyint(4) default '0',
  PRIMARY KEY  (`important_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO tbl_importants VALUES("1","Bình th??ng","<p>&#160;</p>","2011-04-12 00:00:00","","1");
INSERT INTO tbl_importants VALUES("2","Kh?n","<p>&#160;</p>","2011-07-25 00:00:00","0","1");
INSERT INTO tbl_importants VALUES("3","T?i kh?n","<p>&#160;</p>","2011-07-25 00:00:00","0","1");



DROP TABLE tbl_interdiscis;

CREATE TABLE `tbl_interdiscis` (
  `interdisci_id` int(11) NOT NULL auto_increment,
  `interdisci_name` varchar(250) default NULL,
  `interdisci_ununicode` varchar(250) default NULL,
  `interdisci_desc` text,
  `interdisci_date` datetime default NULL,
  `interdisci_sort` int(11) default NULL,
  `interdisci_active` tinyint(4) default NULL,
  PRIMARY KEY  (`interdisci_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO tbl_interdiscis VALUES("4","Nguy?n Tr?ng ?ông","Nguyen Trong Dong","<p>&#160;</p>","2011-11-29 00:00:00","","1");
INSERT INTO tbl_interdiscis VALUES("5","Hà Minh H?i","Ha Minh Hai","<p>&#160;</p>","2011-11-29 00:00:00","","1");
INSERT INTO tbl_interdiscis VALUES("6","?oàn Thanh Long","Doan Thanh Long","<p>&#160;</p>","2011-11-29 00:00:00","","1");



DROP TABLE tbl_levels;

CREATE TABLE `tbl_levels` (
  `level_id` int(11) NOT NULL auto_increment,
  `level_name` varchar(250) default NULL,
  `level_desc` text,
  `level_date` datetime default NULL,
  `level_sort` int(11) default '0',
  `level_active` tinyint(4) default '0',
  PRIMARY KEY  (`level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO tbl_levels VALUES("1","Qu?c h?i","<p>Qu?c h?i là c?p b?u c? cao nh?t t?i Vi?t Nam</p>","2011-03-15 00:00:00","","1");
INSERT INTO tbl_levels VALUES("2","T?nh - Thành ph?","<p>T?nh - Thành ph? là c?p b?u c? th? 2 d??i Qu?c h?i</p>","2011-03-15 00:00:00","0","1");
INSERT INTO tbl_levels VALUES("3","Qu?n - Huy?n - Th? Xã - TP tr?c thu?c","<p>Qu?n - Huy?n - Th? Xã - TP tr?c thu?c là c?p b?u c? th? 3 d??i T?nh - Thành ph?</p>","2011-03-15 00:00:00","0","1");
INSERT INTO tbl_levels VALUES("4","Ph??ng - Xã - Th? Tr?n","<p>Ph??ng - Xã - Th? Tr?n là c?p b?u c? th? 4 c?ng là th?p nh?t.</p>","2011-03-15 00:00:00","0","1");



DROP TABLE tbl_modules;

CREATE TABLE `tbl_modules` (
  `mod_id` int(11) NOT NULL auto_increment,
  `mod_name` varchar(255) default NULL,
  `mod_desc` varchar(255) default NULL,
  `mod_date` datetime default NULL,
  `mod_sort` int(11) default '0',
  `mod_active` tinyint(1) default '0',
  PRIMARY KEY  (`mod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8;

INSERT INTO tbl_modules VALUES("7","modules","Module ch?c n?ng","2011-02-15 00:00:00","0","0");
INSERT INTO tbl_modules VALUES("11","users","Thành viên","2011-02-15 00:00:00","0","0");
INSERT INTO tbl_modules VALUES("84","objects","Ch?c v?","2011-03-08 00:00:00","0","0");
INSERT INTO tbl_modules VALUES("85","units","??n v?","2011-03-08 00:00:00","0","0");
INSERT INTO tbl_modules VALUES("106","msgs","Tin nh?n","2011-04-09 00:00:00","","1");
INSERT INTO tbl_modules VALUES("107","importants","","","0","0");
INSERT INTO tbl_modules VALUES("108","secrets","","","0","0");
INSERT INTO tbl_modules VALUES("109","signobjs","","","0","0");
INSERT INTO tbl_modules VALUES("110","signpers","","","0","0");
INSERT INTO tbl_modules VALUES("112","config","","","0","0");
INSERT INTO tbl_modules VALUES("113","departments","","","0","0");
INSERT INTO tbl_modules VALUES("114","docs","","","0","0");
INSERT INTO tbl_modules VALUES("244","daydocs","","","0","0");
INSERT INTO tbl_modules VALUES("245","hdsds","","","0","0");
INSERT INTO tbl_modules VALUES("246","interdiscis","","","0","0");
INSERT INTO tbl_modules VALUES("247","ports","","","0","0");
INSERT INTO tbl_modules VALUES("248","holidays","","","0","0");
INSERT INTO tbl_modules VALUES("249","thangluongs","","","0","0");
INSERT INTO tbl_modules VALUES("250","trinhdos","","","0","0");
INSERT INTO tbl_modules VALUES("251","truyennhans","","","0","0");
INSERT INTO tbl_modules VALUES("253","chat","","","0","0");
INSERT INTO tbl_modules VALUES("254","kdls","","","0","0");
INSERT INTO tbl_modules VALUES("256","congviecs","","","0","0");
INSERT INTO tbl_modules VALUES("257","plans","","","0","0");
INSERT INTO tbl_modules VALUES("258","vttbs","","","0","0");



DROP TABLE tbl_msgs;

CREATE TABLE `tbl_msgs` (
  `msg_id` int(11) NOT NULL auto_increment,
  `user_sent` int(11) default '0',
  `user_recevie` varchar(250) default '0',
  `msg_name` varchar(250) default NULL,
  `msg_cont` text,
  `msg_date` date default NULL,
  `msg_sort` int(11) default '0',
  `msg_active` int(11) default '0',
  PRIMARY KEY  (`msg_id`)
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
  `msgUser_id` int(11) NOT NULL auto_increment,
  `msg_id` int(11) default '0',
  `user_id` int(11) default '0',
  `msgUser_type` tinyint(4) default '0' COMMENT '0: binh thuong, 1: quan trong, 2: rac',
  `msgUser_active` tinyint(4) default '0',
  PRIMARY KEY  (`msgUser_id`),
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
  `object_id` int(11) NOT NULL auto_increment,
  `object_name` varchar(250) default NULL,
  `object_standfor` varchar(250) default NULL,
  `object_desc` text,
  `object_date` datetime default NULL,
  `object_sort` int(11) default '0',
  `object_active` tinyint(4) default '0',
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO tbl_objects VALUES("1","Giám ??c","G?","Giám ??c là qu?n lý cao nhât c?a công ty.","2012-09-24 00:00:00","0","1","");
INSERT INTO tbl_objects VALUES("2","Phó Giám ??c","PG?","Phó giám ??c là ng??i ph? giúp giám ??c v? m?t m?ng nghi?p v? nào ?ó.","2012-09-24 00:00:00","0","1","");
INSERT INTO tbl_objects VALUES("3","K? toán tr??ng","KTT","K? toán tr??ng là ng??i qu?n lý k? toán viên, ?i?u hành phòng k? toán th?c hi?n công tác thu? - tài chính.","2012-09-24 00:00:00","0","1","");
INSERT INTO tbl_objects VALUES("4","Tr??ng phòng/ban","TP","Tr??ng phòng là ng??i qu?n lý 1 phòng / ban nào ?ó.","2012-09-24 00:00:00","","1","");
INSERT INTO tbl_objects VALUES("5","Phó tr??ng phòng/ban","PTP","Phó tr??ng phòng / ban là ng??i giúp tr??ng phòng / ban chia s? công vi?c trong phòng.","2012-09-24 00:00:00","0","1","");
INSERT INTO tbl_objects VALUES("6","Nhân viên","NV","Nhân viên là ng??i tr?c ti?p th?c hi?n 1 công vi?c ho?c 1 ph?n c?a 1 công vi?c chung trong phòng ho?c k?t h?p v?i phòng khác.","2012-09-25 00:00:00","","1","");



DROP TABLE tbl_plan_details;

CREATE TABLE `tbl_plan_details` (
  `plan_id` int(11) NOT NULL auto_increment,
  `plan_subject` varchar(250) default NULL COMMENT 'muc tieu cong viec',
  `plan_start` datetime default NULL COMMENT 'thoi gian bat dau',
  `plan_end` datetime default NULL COMMENT 'thoi gian ket thuc',
  `plan_cont` text COMMENT 'noi nung cong viec',
  `plan_date` date default NULL,
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

INSERT INTO tbl_plan_details VALUES("2","H??ng d?n c?u hình ph?n m?m","2013-04-09 13:30:00","2013-04-11 11:30:00","1. Ph?n m?m 1 c?a SNN\n2. D?ch v? công tr?c tuy?n SNN\n3. Ph?n m?m 1 c?a STC\n4. Kiêm tra KIOT màn hình c?m ?ng STC","2013-04-09","1");
INSERT INTO tbl_plan_details VALUES("10","H?p cty demo ph?n m?m","2013-04-12 08:30:00","2013-04-12 10:30:00","1. Ph?n m?m DVC tr?c tuy?n S? NNPTNN\n2. Ph?n m?m QLHS M?t c?a S? NNPTNN","2013-04-11","7");
INSERT INTO tbl_plan_details VALUES("11","H?n","2013-04-30 12:00:00","2013-04-30 03:00:00","Có h?n","2013-04-25","11");
INSERT INTO tbl_plan_details VALUES("12","H?p cty sau ngh? l? 30/04 - 01/05","2013-05-06 08:30:00","2013-05-06 11:30:00","Bàn v? công tác k? thu?t và b?o trì\nTh?ng nh?t cách th?c tri?n khai PM m?t c?a STC","2013-05-01","7");
INSERT INTO tbl_plan_details VALUES("13","G?p khách hàng bên S? NN ","2013-05-06 14:30:00","2013-05-06 16:30:00","Bàn v? PM Qu?n lý báo cáo","2013-05-01","7");
INSERT INTO tbl_plan_details VALUES("14","G?p khách hàng bên S? TC Hà N?i","2013-05-07 08:30:00","2013-05-07 11:30:00","Bàn v? PM qu?n lý sau thanh tra","2013-05-01","7");
INSERT INTO tbl_plan_details VALUES("15","Làm vi?c t?i v?n phòng bên HQV","2013-05-07 13:30:00","2013-05-07 17:20:00","X? lý các công vi?c chung","2013-05-01","7");
INSERT INTO tbl_plan_details VALUES("16","G?p g? và làm vi?c v?i cán b? bên S? T? pháp Hà N?i","2013-05-08 08:30:00","2013-05-08 16:30:00","Làm vi?c v? PM qu?n lý H? t?ch trong quá trình tri?n khai.","2013-05-01","7");
INSERT INTO tbl_plan_details VALUES("17","Ki?m tra vi?c tri?n khai ph?n m?m t?i chi nhán Thanh Hóa","2013-05-09 08:30:00","2013-05-09 16:30:00","Ki?m tra vi?c tri?n khai các ph?n m?m QL v?n b?n, Truy?n nh?n V?n b?n, M?t c?a","2013-05-01","7");
INSERT INTO tbl_plan_details VALUES("18","??i chi?u vi?c kh?c ph?c các yêu c?u ph?n m?m t?i Thanh Hóa","2013-05-10 08:00:00","2013-05-10 10:00:00","Làm vi?c v?i b? ph?n k? thu?t t?i công ty","2013-05-01","7");
INSERT INTO tbl_plan_details VALUES("19","G?p khách hàng UBND Qu?n C?u Gi?y","2013-05-10 10:30:00","2013-05-10 12:00:00","Làm vi?c v? ph?n m?m QL ng??i có công","2013-05-01","7");
INSERT INTO tbl_plan_details VALUES("20","G?p khách hàng bên UBND Qu?n Thanh Xuân","2013-05-10 14:00:00","2013-05-10 16:30:00","Làm vi?c v? h? th?ng máy ch? và h?p ??ng b?o trì ph?n c?ng","2013-05-01","7");



DROP TABLE tbl_plancats;

CREATE TABLE `tbl_plancats` (
  `plancat_id` int(11) NOT NULL auto_increment,
  `plancat_name` varchar(250) default NULL,
  `plancat_date` date default NULL,
  `plancat_sort` int(11) default NULL,
  `plancat_active` tinyint(4) default NULL,
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`plancat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE tbl_plans;

CREATE TABLE `tbl_plans` (
  `plan_id` int(11) NOT NULL auto_increment,
  `plancat_id` int(11) default NULL COMMENT 'khoa ngoai category',
  `plan_subject` varchar(250) default NULL COMMENT 'muc tieu cong viec',
  `plan_start` datetime default NULL COMMENT 'thoi gian bat dau',
  `plan_end` datetime default NULL COMMENT 'thoi gian ket thuc',
  `plan_zone` varchar(250) default NULL COMMENT 'dia diem thuc hien',
  `plan_cont` text COMMENT 'noi nung cong viec',
  `plan_warning` tinyint(4) default NULL COMMENT 'trang thai canh bao',
  `plan_date` date default NULL,
  `plan_sort` int(11) default NULL,
  `plan_show` tinyint(4) default NULL COMMENT 'co hien tren lich hay ko',
  `plan_status` tinyint(4) default NULL COMMENT 'trang thai hoan thanh',
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE tbl_ports;

CREATE TABLE `tbl_ports` (
  `port_id` int(11) NOT NULL auto_increment,
  `port_name` varchar(50) default NULL,
  `port_date` date default NULL,
  `port_sort` int(11) default NULL,
  `port_active` tinyint(4) default NULL,
  PRIMARY KEY  (`port_id`)
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
  `receive_id` int(11) NOT NULL auto_increment COMMENT 'ma van ban den',
  `doc_id` int(11) NOT NULL default '0' COMMENT 'ma van ban goc',
  `department_id` int(11) NOT NULL default '0' COMMENT 'ma don vi',
  `receive_per` int(11) default '0',
  `receive_note` text,
  `receive_time` datetime NOT NULL COMMENT 'thoi gian nhan',
  `receive_sms` tinyint(4) default '0' COMMENT 'nhan sms',
  `doc_status` tinyint(4) default '0' COMMENT 'tinh trang van ban',
  `read_status` tinyint(4) NOT NULL default '0' COMMENT 'tinh trang xem',
  `read_time` datetime default NULL COMMENT 'thoi gian xem',
  `read_per` int(11) default '0',
  PRIMARY KEY  (`receive_id`),
  KEY `FK_tbl_receives` (`doc_id`),
  KEY `FK1_tbl_receives` (`department_id`),
  CONSTRAINT `FK_tbl_receives` FOREIGN KEY (`doc_id`) REFERENCES `tbl_vbs` (`doc_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=232 DEFAULT CHARSET=utf8;

INSERT INTO tbl_receives VALUES("172","1","1","11","Chu?n b? di?n v?n","2013-03-18 02:03:59","1","0","0","","0");
INSERT INTO tbl_receives VALUES("173","1","2","5","D? trù kinh phí","2013-03-18 02:03:59","1","0","0","","0");
INSERT INTO tbl_receives VALUES("174","1","3","18","Chu?n b? thi?t b? ?i?n t?, trình chi?u","2013-03-18 02:03:59","1","0","0","","0");
INSERT INTO tbl_receives VALUES("175","1","4","8","","2013-03-18 02:03:59","0","0","0","","0");
INSERT INTO tbl_receives VALUES("176","1","6","7","","2013-03-18 02:03:59","0","0","0","","0");
INSERT INTO tbl_receives VALUES("177","1","7","9","","2013-03-18 02:03:59","0","0","0","","0");
INSERT INTO tbl_receives VALUES("178","1","8","0","","2013-03-18 02:03:59","0","0","0","","0");
INSERT INTO tbl_receives VALUES("179","1","9","0","","2013-03-18 02:03:59","0","0","0","","0");
INSERT INTO tbl_receives VALUES("180","1","10","0","","2013-03-18 02:03:59","0","0","0","","0");
INSERT INTO tbl_receives VALUES("181","1","11","0","","2013-03-18 02:03:59","0","0","0","","0");
INSERT INTO tbl_receives VALUES("192","3","1","0","Cho ý ki?n góp ý","2013-03-19 09:03:18","0","0","0","","0");
INSERT INTO tbl_receives VALUES("193","3","2","0","Cho ý ki?n góp ý","2013-03-19 09:03:18","0","0","0","","0");
INSERT INTO tbl_receives VALUES("194","3","3","0","Cho ý ki?n góp ý","2013-03-19 09:03:18","0","0","0","","0");
INSERT INTO tbl_receives VALUES("195","3","4","0","Cho ý ki?n góp ý","2013-03-19 09:03:18","0","0","0","","0");
INSERT INTO tbl_receives VALUES("196","3","6","0","Cho ý ki?n góp ý","2013-03-19 09:03:18","0","0","0","","0");
INSERT INTO tbl_receives VALUES("197","3","7","0","Cho ý ki?n góp ý","2013-03-19 09:03:18","0","0","0","","0");
INSERT INTO tbl_receives VALUES("198","3","8","0","Cho ý ki?n góp ý","2013-03-19 09:03:18","0","0","0","","0");
INSERT INTO tbl_receives VALUES("199","3","9","0","Cho ý ki?n góp ý","2013-03-19 09:03:18","0","0","0","","0");
INSERT INTO tbl_receives VALUES("200","3","10","0","Cho ý ki?n góp ý","2013-03-19 09:03:18","0","0","0","","0");
INSERT INTO tbl_receives VALUES("201","3","11","0","Cho ý ki?n góp ý","2013-03-19 09:03:18","0","0","0","","0");
INSERT INTO tbl_receives VALUES("202","4","1","0","Chu?n b? di?n v?n, quà t?ng","2013-03-19 10:03:41","0","0","0","","0");
INSERT INTO tbl_receives VALUES("203","4","2","0","Chuy?n kinh phí v? chi nhánh Thanh Hóa","2013-03-19 10:03:41","0","0","0","","0");
INSERT INTO tbl_receives VALUES("204","4","4","0","","2013-03-19 10:03:41","0","0","0","","0");
INSERT INTO tbl_receives VALUES("205","4","8","0","","2013-03-19 10:03:41","0","0","0","","0");
INSERT INTO tbl_receives VALUES("206","5","1","0","","2013-03-21 01:03:46","0","0","0","","0");
INSERT INTO tbl_receives VALUES("207","5","2","0","","2013-03-21 01:03:46","0","0","0","","0");
INSERT INTO tbl_receives VALUES("208","5","7","0","","2013-03-21 01:03:46","0","0","0","","0");
INSERT INTO tbl_receives VALUES("209","5","3","0","","2013-03-21 01:03:46","0","0","0","","0");
INSERT INTO tbl_receives VALUES("210","5","4","0","","2013-03-21 01:03:46","0","0","0","","0");
INSERT INTO tbl_receives VALUES("211","5","6","0","","2013-03-21 01:03:46","0","0","0","","0");
INSERT INTO tbl_receives VALUES("212","5","8","0","","2013-03-21 01:03:46","0","0","0","","0");
INSERT INTO tbl_receives VALUES("213","5","9","0","","2013-03-21 01:03:46","0","0","0","","0");
INSERT INTO tbl_receives VALUES("214","5","10","0","","2013-03-21 01:03:46","0","0","0","","0");
INSERT INTO tbl_receives VALUES("215","5","11","0","","2013-03-21 01:03:46","0","0","0","","0");
INSERT INTO tbl_receives VALUES("216","6","1","0","","2013-03-21 02:03:07","0","0","0","","0");
INSERT INTO tbl_receives VALUES("217","6","2","0","","2013-03-21 02:03:07","0","0","0","","0");
INSERT INTO tbl_receives VALUES("218","6","7","0","","2013-03-21 02:03:07","0","0","0","","0");
INSERT INTO tbl_receives VALUES("219","6","3","0","","2013-03-21 02:03:07","0","0","0","","0");
INSERT INTO tbl_receives VALUES("220","6","4","0","","2013-03-21 02:03:07","0","0","0","","0");
INSERT INTO tbl_receives VALUES("221","6","6","0","","2013-03-21 02:03:07","0","0","0","","0");
INSERT INTO tbl_receives VALUES("222","6","8","0","","2013-03-21 02:03:07","0","0","0","","0");
INSERT INTO tbl_receives VALUES("223","6","9","0","","2013-03-21 02:03:07","0","0","0","","0");
INSERT INTO tbl_receives VALUES("224","6","10","0","","2013-03-21 02:03:07","0","0","0","","0");
INSERT INTO tbl_receives VALUES("225","6","11","0","","2013-03-21 02:03:07","0","0","0","","0");
INSERT INTO tbl_receives VALUES("226","7","4","0","","2013-04-24 11:04:57","1","0","0","","0");
INSERT INTO tbl_receives VALUES("227","8","7","0","","2013-04-24 11:04:58","1","0","0","","0");
INSERT INTO tbl_receives VALUES("228","8","3","0","","2013-04-24 11:04:58","0","0","0","","0");
INSERT INTO tbl_receives VALUES("229","8","4","0","","2013-04-24 11:04:58","0","0","0","","0");
INSERT INTO tbl_receives VALUES("230","9","4","0","","2013-04-24 12:04:00","1","0","0","","0");
INSERT INTO tbl_receives VALUES("231","10","11","0","","2013-04-24 12:04:53","1","0","0","","0");



DROP TABLE tbl_recusers;

CREATE TABLE `tbl_recusers` (
  `recUser_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default '0',
  `receive_id` int(11) default '0',
  `read_time` datetime default NULL,
  `read_status` tinyint(4) default '0',
  `recUser_date` datetime default NULL,
  PRIMARY KEY  (`recUser_id`),
  KEY `FK1_tbl_recusers` (`user_id`),
  KEY `FK_tbl_recusers` (`receive_id`),
  CONSTRAINT `FK_tbl_recusers` FOREIGN KEY (`receive_id`) REFERENCES `tbl_receives` (`receive_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8;

INSERT INTO tbl_recusers VALUES("53","19","178","","0","2013-03-18 02:03:59");
INSERT INTO tbl_recusers VALUES("54","20","179","","0","2013-03-18 02:03:59");
INSERT INTO tbl_recusers VALUES("55","21","180","","0","2013-03-18 02:03:59");
INSERT INTO tbl_recusers VALUES("65","7","192","","0","2013-03-19 09:03:18");
INSERT INTO tbl_recusers VALUES("66","11","192","","0","2013-03-19 09:03:18");
INSERT INTO tbl_recusers VALUES("67","14","192","2013-05-01 20:00:11","1","2013-03-19 09:03:18");
INSERT INTO tbl_recusers VALUES("68","5","193","","0","2013-03-19 09:03:18");
INSERT INTO tbl_recusers VALUES("69","6","193","","0","2013-03-19 09:03:18");
INSERT INTO tbl_recusers VALUES("70","1","194","","0","2013-03-19 09:03:18");
INSERT INTO tbl_recusers VALUES("71","10","194","","0","2013-03-19 09:03:18");
INSERT INTO tbl_recusers VALUES("72","12","194","","0","2013-03-19 09:03:18");
INSERT INTO tbl_recusers VALUES("73","18","194","","0","2013-03-19 09:03:18");
INSERT INTO tbl_recusers VALUES("74","16","195","","0","2013-03-19 09:03:18");
INSERT INTO tbl_recusers VALUES("75","8","195","","0","2013-03-19 09:03:18");
INSERT INTO tbl_recusers VALUES("76","17","195","","0","2013-03-19 09:03:18");
INSERT INTO tbl_recusers VALUES("77","9","197","","0","2013-03-19 09:03:18");
INSERT INTO tbl_recusers VALUES("78","13","197","","0","2013-03-19 09:03:18");
INSERT INTO tbl_recusers VALUES("79","15","197","","0","2013-03-19 09:03:18");
INSERT INTO tbl_recusers VALUES("80","19","198","","0","2013-03-19 09:03:18");
INSERT INTO tbl_recusers VALUES("81","20","199","","0","2013-03-19 09:03:18");
INSERT INTO tbl_recusers VALUES("82","21","200","","0","2013-03-19 09:03:18");
INSERT INTO tbl_recusers VALUES("83","7","202","","0","2013-03-19 10:03:41");
INSERT INTO tbl_recusers VALUES("84","11","202","","0","2013-03-19 10:03:41");
INSERT INTO tbl_recusers VALUES("85","14","202","2013-03-21 14:13:59","1","2013-03-19 10:03:41");
INSERT INTO tbl_recusers VALUES("86","5","203","","0","2013-03-19 10:03:41");
INSERT INTO tbl_recusers VALUES("87","6","203","","0","2013-03-19 10:03:41");
INSERT INTO tbl_recusers VALUES("88","16","204","","0","2013-03-19 10:03:41");
INSERT INTO tbl_recusers VALUES("89","8","204","","0","2013-03-19 10:03:41");
INSERT INTO tbl_recusers VALUES("90","17","204","","0","2013-03-19 10:03:41");
INSERT INTO tbl_recusers VALUES("91","19","205","","0","2013-03-19 10:03:41");
INSERT INTO tbl_recusers VALUES("92","7","206","","0","2013-03-21 01:03:46");
INSERT INTO tbl_recusers VALUES("93","11","206","","0","2013-03-21 01:03:46");
INSERT INTO tbl_recusers VALUES("94","14","206","","0","2013-03-21 01:03:46");
INSERT INTO tbl_recusers VALUES("95","5","207","","0","2013-03-21 01:03:46");
INSERT INTO tbl_recusers VALUES("96","6","207","","0","2013-03-21 01:03:46");
INSERT INTO tbl_recusers VALUES("97","9","208","","0","2013-03-21 01:03:46");
INSERT INTO tbl_recusers VALUES("98","13","208","","0","2013-03-21 01:03:46");
INSERT INTO tbl_recusers VALUES("99","15","208","","0","2013-03-21 01:03:46");
INSERT INTO tbl_recusers VALUES("100","1","209","2013-04-23 12:36:08","1","2013-03-21 01:03:46");
INSERT INTO tbl_recusers VALUES("101","10","209","","0","2013-03-21 01:03:46");
INSERT INTO tbl_recusers VALUES("102","18","209","","0","2013-03-21 01:03:46");
INSERT INTO tbl_recusers VALUES("103","12","209","","0","2013-03-21 01:03:46");
INSERT INTO tbl_recusers VALUES("104","16","210","","0","2013-03-21 01:03:46");
INSERT INTO tbl_recusers VALUES("105","8","210","","0","2013-03-21 01:03:46");
INSERT INTO tbl_recusers VALUES("106","17","210","","0","2013-03-21 01:03:46");
INSERT INTO tbl_recusers VALUES("107","19","212","","0","2013-03-21 01:03:46");
INSERT INTO tbl_recusers VALUES("108","20","213","","0","2013-03-21 01:03:46");
INSERT INTO tbl_recusers VALUES("109","21","214","","0","2013-03-21 01:03:46");
INSERT INTO tbl_recusers VALUES("110","7","216","2013-05-02 23:10:01","1","2013-03-21 02:03:07");
INSERT INTO tbl_recusers VALUES("111","11","216","2013-04-24 11:51:27","1","2013-03-21 02:03:07");
INSERT INTO tbl_recusers VALUES("112","14","216","2013-03-25 08:38:29","1","2013-03-21 02:03:07");
INSERT INTO tbl_recusers VALUES("113","5","217","","0","2013-03-21 02:03:07");
INSERT INTO tbl_recusers VALUES("114","6","217","","0","2013-03-21 02:03:07");
INSERT INTO tbl_recusers VALUES("115","9","218","","0","2013-03-21 02:03:07");
INSERT INTO tbl_recusers VALUES("116","13","218","","0","2013-03-21 02:03:07");
INSERT INTO tbl_recusers VALUES("117","15","218","","0","2013-03-21 02:03:07");
INSERT INTO tbl_recusers VALUES("118","1","219","2013-04-09 15:13:33","1","2013-03-21 02:03:07");
INSERT INTO tbl_recusers VALUES("119","10","219","","0","2013-03-21 02:03:07");
INSERT INTO tbl_recusers VALUES("120","18","219","","0","2013-03-21 02:03:07");
INSERT INTO tbl_recusers VALUES("121","12","219","","0","2013-03-21 02:03:07");
INSERT INTO tbl_recusers VALUES("122","16","220","","0","2013-03-21 02:03:07");
INSERT INTO tbl_recusers VALUES("123","8","220","","0","2013-03-21 02:03:07");
INSERT INTO tbl_recusers VALUES("124","17","220","","0","2013-03-21 02:03:07");
INSERT INTO tbl_recusers VALUES("125","19","222","","0","2013-03-21 02:03:07");
INSERT INTO tbl_recusers VALUES("126","20","223","","0","2013-03-21 02:03:07");
INSERT INTO tbl_recusers VALUES("127","21","224","","0","2013-03-21 02:03:07");
INSERT INTO tbl_recusers VALUES("128","16","226","","0","2013-04-24 11:04:57");
INSERT INTO tbl_recusers VALUES("129","8","226","","0","2013-04-24 11:04:57");
INSERT INTO tbl_recusers VALUES("130","17","226","","0","2013-04-24 11:04:57");
INSERT INTO tbl_recusers VALUES("131","22","226","","0","2013-04-24 11:04:57");
INSERT INTO tbl_recusers VALUES("132","23","226","","0","2013-04-24 11:04:57");
INSERT INTO tbl_recusers VALUES("133","9","227","","0","2013-04-24 11:04:58");
INSERT INTO tbl_recusers VALUES("134","13","227","","0","2013-04-24 11:04:58");
INSERT INTO tbl_recusers VALUES("135","15","227","","0","2013-04-24 11:04:58");
INSERT INTO tbl_recusers VALUES("136","1","228","","0","2013-04-24 11:04:58");
INSERT INTO tbl_recusers VALUES("137","10","228","","0","2013-04-24 11:04:58");
INSERT INTO tbl_recusers VALUES("138","18","228","","0","2013-04-24 11:04:58");
INSERT INTO tbl_recusers VALUES("139","12","228","","0","2013-04-24 11:04:58");
INSERT INTO tbl_recusers VALUES("140","16","229","","0","2013-04-24 11:04:58");
INSERT INTO tbl_recusers VALUES("141","8","229","2013-04-24 11:58:28","1","2013-04-24 11:04:58");
INSERT INTO tbl_recusers VALUES("142","17","229","","0","2013-04-24 11:04:58");
INSERT INTO tbl_recusers VALUES("143","22","229","","0","2013-04-24 11:04:58");
INSERT INTO tbl_recusers VALUES("144","23","229","","0","2013-04-24 11:04:58");
INSERT INTO tbl_recusers VALUES("145","16","230","","0","2013-04-24 12:04:00");
INSERT INTO tbl_recusers VALUES("146","8","230","","0","2013-04-24 12:04:00");
INSERT INTO tbl_recusers VALUES("147","17","230","","0","2013-04-24 12:04:00");
INSERT INTO tbl_recusers VALUES("148","22","230","","0","2013-04-24 12:04:00");
INSERT INTO tbl_recusers VALUES("149","23","230","","0","2013-04-24 12:04:00");
INSERT INTO tbl_recusers VALUES("150","29","231","","0","2013-04-24 12:04:53");



DROP TABLE tbl_secrets;

CREATE TABLE `tbl_secrets` (
  `secret_id` int(11) NOT NULL auto_increment,
  `secret_name` varchar(250) default NULL,
  `secret_desc` text,
  `secret_date` datetime default NULL,
  `secret_sort` int(11) default '0',
  `secret_active` tinyint(4) default '0',
  PRIMARY KEY  (`secret_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO tbl_secrets VALUES("1","Bình th??ng","<p>&#160;</p>","2011-04-12 00:00:00","0","1");
INSERT INTO tbl_secrets VALUES("2","M?t","<p>&#160;</p>","2011-07-25 00:00:00","0","1");
INSERT INTO tbl_secrets VALUES("3","T?i m?t","<p>&#160;</p>","2011-07-25 00:00:00","0","1");



DROP TABLE tbl_signobjs;

CREATE TABLE `tbl_signobjs` (
  `signObj_id` int(11) NOT NULL auto_increment,
  `signObj_name` varchar(250) default NULL,
  `signObj_ununicode` varchar(250) default NULL,
  `signObj_desc` text,
  `signObj_date` datetime default NULL,
  `signObj_sort` int(11) default '0',
  `signObj_active` tinyint(4) default '0',
  PRIMARY KEY  (`signObj_id`)
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
  `signPer_id` int(11) NOT NULL auto_increment,
  `signPer_name` varchar(250) default NULL,
  `signPer_ununicode` varchar(250) default NULL,
  `signPer_desc` text,
  `signPer_date` datetime default NULL,
  `signPer_sort` int(11) default '0',
  `signPer_active` tinyint(4) default '0',
  PRIMARY KEY  (`signPer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8;

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
INSERT INTO tbl_signpers VALUES("26","Ph?m Kh?c Tu?n","Pham Khac Tuan","<p>&#160;</p>","2011-05-06 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("27","Nguy?n V?n Nhang","Nguyen Van Nhang","<p>&#160;</p>","2011-05-06 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("28","?? Huy Chi?n","Do Huy Chien","<p>&#160;</p>","2011-05-06 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("29","Nguy?n V?n Khôi","Nguyen Van Khoi","<p>&#160;</p>","2011-05-06 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("30","Nguy?n Qu?c Hùng","Nguyen Quoc Hung","<p>&#160;</p>","2011-05-12 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("31","Lê V?n D?c","Le Van Duc","<p>&#160;</p>","2011-05-13 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("32","Nguy?n ?ình ??c","Nguyen Dinh Duc","<p>&#160;</p>","2011-05-16 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("33","Lê Tu?n H?u","Le Tuan Huu","<p>&#160;</p>","2011-05-18 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("34","Nguy?n Tr?ng ?ông","Nguyen Trong Dong","<p>&#160;</p>","2011-05-18 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("35","L?u T?t Th?ng","Luu Tat Thang","<p>&#160;</p>","2011-05-18 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("36","Ph?m Chí Công","Pham Chi Cong","<p>&#160;</p>","2011-05-20 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("37","?oàn Thanh Long","Doan Thanh Long","<p>&#160;</p>","2011-05-20 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("38","Tr?n Thanh Nhã","Tran Thanh Nha","<p>&#160;</p>","2011-05-23 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("39","Nguy?n Công Soái","Nguyen Cong Soai","<p>&#160;</p>","2011-05-26 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("40","Ph?m V?n Tr?","Pham Van Tru","<p>&#160;</p>","2011-05-27 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("41","Nguy?n ??c Trí","Nguyen Duc Tri","<p>&#160;</p>","2011-05-27 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("42","Lê Ng?c Khiêm","Le Ngoc Khiem","<p>&#160;</p>","2011-05-27 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("43","Lê Anh Tu?n","Le Anh Tuan","<p>&#160;</p>","2011-05-27 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("44","Lã Th? Kim Ngân","La Thi Kim Ngan","<p>&#160;</p>","2011-05-27 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("45","Mai Xuân Vinh","Mai Xuan Vinh","<p>&#160;</p>","2011-05-27 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("46","Nguy?n Kh?c D?ng","Nguyen Khac Dung","<p>&#160;</p>","2011-05-27 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("47","Ph?m Quang Long","Pham Quang Long","<p>&#160;</p>","2011-05-30 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("48","Ph?m Xuân Ph??ng","Pham Xuan Phuong","<p>&#160;</p>","2011-05-30 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("49","Tô Th? H?nh","To Thi Hanh","<p>&#160;</p>","2011-05-30 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("50","Lâm Qu?c Hùng","Lam Quoc Hung","<p>&#160;</p>","2011-05-30 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("51","Nguy?n Xuân Tân","Nguyen Xuan Tan","<p>&#160;</p>","2011-05-30 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("52","Ph?m V?n Khánh","Pham Van Khanh","<p>&#160;</p>","2011-05-31 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("53","V??ng Th? Thanh H??ng","Vuong Thi Thanh Huong","<p>&#160;</p>","2011-06-01 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("54","Tr?n Xuân Vi?t","Tran Xuan Viet","<p>&#160;</p>","2011-06-01 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("55","Nguy?n V?n S?n","Nguyen Van Son","<p>&#160;</p>","2011-06-01 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("56","Ph?m Th? H?ng Nga","Pham Thi Hong Nga","<p>&#160;</p>","2011-06-01 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("57","?inh Th?o Oanh","Dinh Thao Oanh","<p>&#160;</p>","2011-06-02 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("58","Nguy?n Tr?ng Bình","Nguyen Trong Binh","<p>&#160;</p>","2011-06-02 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("59","Cao Khoa B?ng","Cao Khoa Bang","<p>&#160;</p>","2011-06-02 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("60","Nguy?n T?n D?ng","Nguyen Tan Dung","<p>&#160;</p>","2011-06-03 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("61","V? V?n H?u","Vu Van Hau","<p>&#160;</p>","2011-06-03 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("62","Ph?m H?ng S?n","Pham Hong Son","<p>&#160;</p>","2011-06-06 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("63","Khu?t Quang Trung","Khuat Quang Trung","<p>&#160;</p>","2011-06-06 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("64","V? Xuân Hoà","Vu Xuan Hoa","<p>&#160;</p>","2011-06-06 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("65","Nguy?n Th? Vi?t Yên","Nguyen Thi Viet Yen","<p>&#160;</p>","2011-06-06 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("66","Nguy?n Ti?n Tho?","Nguyen Tien Thoa","<p>&#160;</p>","2011-06-06 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("67","Nguy?n ??c Bi?n","Nguyen Duc Bien","<p>&#160;</p>","2011-06-07 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("68","?inh Quý Hu?n","Dinh Quy Huan","<p>&#160;</p>","2011-06-07 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("69","Nguy?n V?n Tu?n","Nguyen Van Tuan","<p>&#160;</p>","2011-06-07 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("70","Ngô Quang Trung","Ngo Quang Trung","<p>&#160;</p>","2011-06-07 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("71","??ng ?ình Phúc","Dang Dinh Phuc","<p>&#160;</p>","2011-06-07 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("72","??ng Tu?n Hùng","Dang Tuan Hung","<p>&#160;</p>","2011-06-07 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("73","?? Vi?t Bình","Do Viet Binh","<p>&#160;</p>","2011-06-07 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("74","?inh Quang V?","Dinh Quang Vu","<p>&#160;</p>","2011-06-07 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("75","Nguy?n V?n Yên","Nguyen Van Yen","<p>&#160;</p>","2011-06-07 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("76","Ph?m Hùng Ti?n","Pham Hung Tien","<p>&#160;</p>","2011-06-08 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("77","Tr?n Th? Minh H?nh","Tran Thi Minh Hanh","<p>&#160;</p>","2011-06-08 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("78","Th?ch Nh? S?","Thach Nhu Sy","<p>&#160;</p>","2011-06-09 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("79","Nguy?n H?u Chí","Nguyen Huu Chi","<p>&#160;</p>","2011-06-09 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("80","L?u Ti?n Long","Luu Tien Long","<p>&#160;</p>","2011-06-10 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("81","Ph?m Qu?c B?n","Pham Quoc Ban","<p>&#160;</p>","2011-06-10 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("82","Nguy?n Hoàng Linh","Nguyen Hoang Linh","<p>&#160;</p>","2011-06-10 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("83","?ào ??c Toàn","Dao Duc Toan","<p>&#160;</p>","2011-06-10 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("84","H? Quang L?i","Ho Quang Loi","<p>&#160;</p>","2011-06-13 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("85","Tr?n Huy Sáng","Tran Huy Sang","<p>&#160;</p>","2011-06-13 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("86","?ào Thái Phúc","Dao Thai Phuc","<p>&#160;</p>","2011-06-13 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("87","Hoàng Duy Khanh","Hoang Duy Khanh","<p>&#160;</p>","2011-06-13 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("88","?? Hoàng Anh Tu?n","Do Hoang Anh Tuan","<p>&#160;</p>","2011-06-13 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("89","Tr?n V? Lâm","Tran Vu Lam","<p>&#160;</p>","2011-06-13 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("90","?? H?ng Quang","Do Hong Quang","<p>&#160;</p>","2011-06-13 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("91","V? M?nh Hoà","Vu Manh Hoa","<p>&#160;</p>","2011-06-13 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("92","V? V?n T??ng","Vu Van Tuong","<p>&#160;</p>","2011-06-13 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("93","Nguy?n Ng?c Giao","Nguyen Ngoc Giao","<p>&#160;</p>","2011-06-13 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("94","Ngô Th? Thanh H?ng","Ngo Thi Thanh Hang","<p>&#160;</p>","2011-06-13 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("95","Tr?nh Hoà Bình","Trinh Hoa Binh","<p>&#160;</p>","2011-06-13 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("96","Lê Xuân Rao","Le Xuan Rao","<p>&#160;</p>","2011-06-14 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("97","?inh V?n To?n","Dinh Van Toan","<p>&#160;</p>","2011-06-14 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("98","Nguy?n Th? Vinh","Nguyen Thi Vinh","<p>&#160;</p>","2011-06-14 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("99","Nguy?n M?nh Hoàng","Nguyen Manh Hoang","<p>&#160;</p>","2011-06-15 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("100","?àm Qu?c Khánh","Dam Quoc Khanh","<ul>\n    <li>&#160;</li>\n</ul>","2011-06-15 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("102","Tr??ng Th? Nga","Truong Thi Nga","<p>&#160;</p>","2011-06-15 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("103","?? Tr?ng Qu?nh","Do Trong Quynh","<p>&#160;</p>","2011-06-15 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("104","?ào Xuân Tu?","Dao Xuan Tue","<p>&#160;</p>","2011-06-15 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("105","Nguy?n V?n ??ng","Nguyen Van Dong","<p>&#160;</p>","2011-06-15 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("106","Bùi Cách Tuy?n","Bui Cach Tuyen","<p>&#160;</p>","2011-06-15 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("107","Ngô Quang Ti?n","Ngo Quang Tien","<p>&#160;</p>","2011-06-16 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("108","?? V?n Thành","Do Van Thanh","<p>&#160;</p>","2011-06-16 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("109","Nguy?n V?n T?","Nguyen Van Tu","<p>&#160;</p>","2011-06-16 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("110","Nguy?n Nh? H?i","Nguyen Nhu Hai","<p>&#160;</p>","2011-06-16 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("111","Nguy?n Th? Hùng","Nguyen The Hung","<p>&#160;</p>","2011-06-16 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("112","V?n Tr?ng Lý","Van Trong Ly","<p>&#160;</p>","2011-06-16 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("113","Ph?m S? Danh","Pham Sy Danh","<p>&#160;</p>","2011-06-16 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("114","Lê V?n Th?","Le Van Thu","<p>&#160;</p>","2011-06-16 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("115","Nguy?n Th? Thuý Mai","Nguyen Thi Thuy Mai","<p>&#160;</p>","2011-06-16 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("116","Nguy?n Th? Công","Nguyen The Cong","<p>&#160;</p>","2011-06-16 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("117","Nguy?n V?n H?i","Nguyen Van Hai","<p>&#160;</p>","2011-06-17 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("118","Lê Quang Nhu?","Le Quang Nhue","<p>&#160;</p>","2011-06-17 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("119","Nguy?n Duy Trung","Nguyen Duy Trung","<p>&#160;</p>","2011-06-17 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("120","Nguy?n H?ng S?n","Nguyen Hong Son","<p>&#160;</p>","2011-06-17 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("121","Nguy?n Th?nh","Nguyen Thinh","<p>&#160;</p>","2011-06-17 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("122","Nguy?n Ti?n Minh","Nguyen Tien Minh","<p>&#160;</p>","2011-06-17 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("123","Nguy?n M?nh C??ng","Nguyen Manh Cuong","<p>&#160;</p>","2011-06-17 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("124","Nguy?n Kh?c Th?","Nguyen Khac Tho","<p>&#160;</p>","2011-06-17 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("126","Nguy?n Thanh H?ng","Nguyen Thanh Hang","<p>&#160;</p>","2011-06-17 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("127","Nguy?n ??c Sinh","Nguyen Duc Sinh","<p>&#160;</p>","2011-06-20 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("128","Lê Qu?c C??ng","Le Quoc Cuong","<p>&#160;</p>","2011-06-20 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("129","??u Th? Thu? H??ng","Dau Thi Thuy Huong","<p>&#160;</p>","2011-06-20 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("130","Nguy?n V?n Tu?n D?ng","Nguyen Van Tuan Dung","<p>&#160;</p>","2011-06-20 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("131","Hoàng Xuân Thu?","Hoang Xuan Thuy","<p>&#160;</p>","2011-06-20 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("132","Võ Quang Vinh","Vo Quang Vinh","<p>&#160;</p>","2011-06-21 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("133","Nguy?n Tr?ng L?","Nguyen Trong Le","<p>&#160;</p>","2011-06-22 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("134","Nguy?n Th? Ng?c Thanh","Nguyen Thi Ngoc Thanh","<p>&#160;</p>","2011-06-22 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("135","Tr?n Quý Trung","Tran Quy Trung","<p>&#160;</p>","2011-06-22 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("136","T? Vi?t Anh","Ta Viet Anh","<p>&#160;</p>","2011-06-22 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("137","?àm Ti?n Th?ng","Dam Tien Thang","<p>&#160;</p>","2011-06-22 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("138","Ph?m Ng?c Th?ch","Pham Ngoc Thach","<p>&#160;</p>","2011-06-22 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("139","Nguy?n Th? Hoa","Nguyen Thi Hoa","<p>&#160;</p>","2011-06-22 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("140","Nguy?n ??c L?c","Nguyen Dac Loc","<p>&#160;</p>","2011-06-22 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("141","Nguy?n Th? Nh? Mai","Nguyen Thi Nhu Mai","<p>&#160;</p>","2011-06-22 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("142","Tr?nh Bích H?ng","Trinh Bich Hong","<p>&#160;</p>","2011-06-22 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("143","?? V?n Tuy?n","Do Van Tuyen","<p>&#160;</p>","2011-06-23 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("144","Ngô Th? Doãn Thanh","Ngo Thi Doan Thanh","<p>&#160;</p>","2011-06-24 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("145","?ào V?n Bình","Dao Van Binh","<p>&#160;</p>","2011-06-24 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("146","Nguy?n H?u L??ng","Nguyen Huu Luong","<p>&#160;</p>","2011-06-24 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("147","Nguy?n Thanh H?i","Nguyen Thanh Hai","<p>&#160;</p>","2011-06-24 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("148","V? Ng?c Ph?ng","Vu Ngoc Phung","<p>&#160;</p>","2011-06-24 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("149","Tr?n Qu?c Chiêm","Tran Quoc Chiem","<p>&#160;</p>","2011-06-27 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("150","Tr?n H?u Chi?u","Tran Huu Chieu","<p>&#160;</p>","2011-06-27 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("151","Tr?nh Th? Khi?t","Trinh The Khiet","<p>&#160;</p>","2011-06-27 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("152","?àm V?n Bình","Dam Van Binh","<p>&#160;</p>","2011-06-27 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("153","Hoàng Long Quang","Hoang Long Quang","<p>&#160;</p>","2011-06-27 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("154","T? Quang Huy","Ta Quang Huy","<p>&#160;</p>","2011-06-27 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("155","Cù ??c T?","Cu Duc To","<p>&#160;</p>","2011-06-28 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("156","D??ng K? Lân","Duong Ky Lan","<p>&#160;</p>","2011-06-29 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("157","Nguy?n V?n V?","Nguyen Van Vy","<p>&#160;</p>","2011-06-29 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("158","Nguy?n Tr??ng S?n","Nguyen Truong Son","<p>&#160;</p>","2011-06-29 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("159","T? Anh Tu?n","Ta Anh Tuan","<p>&#160;</p>","2011-06-29 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("160","Kim V?n Qu?","Kim Van Que","<p>&#160;</p>","2011-06-29 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("161","Nguy?n Thái Long","Nguyen Thai Long","<p>&#160;</p>","2011-06-29 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("162","V? Thanh S?n","Vu Thanh Son","<p>&#160;</p>","2011-06-29 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("163","Tr?n Th? L??ng Anh","Tran Thi Luong Anh","<p>&#160;</p>","2011-06-29 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("164","?? Quang Hi?n","Do Quang Hien","<p>&#160;</p>","2011-06-29 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("165","Phan Ti?n Bình","Phan Tien Binh","<p>&#160;</p>","2011-06-29 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("166","Nguy?n Ng?c D?ng","Nguyen Ngoc Dung","<p>&#160;</p>","2011-06-30 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("167","Ng? Duy Hi?u","Ngo Duy Hieu","<p>&#160;</p>","2011-07-01 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("168","Nguy?n Huy Phùng","Nguyen Huy Phung","<p>&#160;</p>","2011-07-01 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("169","Di?p K?nh T?n","Diep Kinh Tan","<p>&#160;</p>","2011-07-01 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("170","Doãn V?n Kính","Doan Van Kinh","<p>&#160;</p>","2011-07-01 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("171","?ào Xuân Mùi","Dao Xuan Mui","<p>&#160;</p>","2011-07-01 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("172","Bùi V?n ??nh","Bui Van Dinh","<p>&#160;</p>","2011-07-01 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("173","Phí Qu?c Tu?n","Phi Quoc Tuan","<p>&#160;</p>","2011-07-13 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("174","Bùi ??c Hi?u","Bui Duc Hieu","<p>&#160;</p>","2011-10-28 00:00:00","0","1");
INSERT INTO tbl_signpers VALUES("175","Hoàng Thanh Vân","Hoang Thanh Van","<p>&#160;</p>","2011-10-31 00:00:00","0","1");



DROP TABLE tbl_suachuas;

CREATE TABLE `tbl_suachuas` (
  `suachua_id` int(11) NOT NULL auto_increment,
  `vttb_id` int(11) default NULL,
  `suachua_cont` varchar(250) default NULL,
  `suachua_cost` int(11) default '0',
  `suachua_pttt` tinyint(4) default '1',
  `suachua_date` date default NULL,
  `suachua_sort` int(11) default '0',
  `suachua_active` tinyint(4) default '1',
  `user_id` int(11) default '0',
  PRIMARY KEY  (`suachua_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE tbl_thangluongs;

CREATE TABLE `tbl_thangluongs` (
  `thangluong_id` int(11) NOT NULL auto_increment,
  `chucvu_id` int(11) default NULL,
  `thangluong_bac` int(11) default NULL,
  `thangluong_heso` float default NULL,
  `thangluong_hetbac` tinyint(4) default NULL,
  `thangluong_sonam` int(11) default NULL,
  `thangluong_date` date default NULL,
  `thangluong_sort` int(11) default NULL,
  `thangluong_active` tinyint(4) default NULL,
  PRIMARY KEY  (`thangluong_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

INSERT INTO tbl_thangluongs VALUES("1","1","1","3.5","2","3","2012-09-26","","1");
INSERT INTO tbl_thangluongs VALUES("2","1","2","4.5","2","3","2012-09-26","","1");
INSERT INTO tbl_thangluongs VALUES("3","1","3","5.5","1","","2012-09-26","","1");
INSERT INTO tbl_thangluongs VALUES("4","3","1","2.8","2","3","2012-09-26","","1");
INSERT INTO tbl_thangluongs VALUES("5","3","2","3.2","2","3","2012-09-26","","1");
INSERT INTO tbl_thangluongs VALUES("6","3","3","3.6","2","2","2012-09-26","","1");
INSERT INTO tbl_thangluongs VALUES("7","3","4","4","1","","2012-09-26","","1");
INSERT INTO tbl_thangluongs VALUES("8","2","1","3","2","3","2012-09-26","","1");
INSERT INTO tbl_thangluongs VALUES("9","2","2","3.4","2","3","2012-09-26","","1");
INSERT INTO tbl_thangluongs VALUES("10","2","3","3.8","2","2","2012-09-26","","1");
INSERT INTO tbl_thangluongs VALUES("11","2","4","4.2","1","","2012-09-26","","1");
INSERT INTO tbl_thangluongs VALUES("12","4","1","2.8","2","3","2012-09-26","","1");
INSERT INTO tbl_thangluongs VALUES("13","5","1","2.4","2","3","2012-09-26","","1");
INSERT INTO tbl_thangluongs VALUES("14","6","1","2","2","2","2012-09-26","","1");



DROP TABLE tbl_thaythes;

CREATE TABLE `tbl_thaythes` (
  `thaythe_id` int(11) NOT NULL auto_increment,
  `vttb_id` int(11) default NULL,
  `thaythe_cont` varchar(250) default NULL,
  `thaythe_cost` int(11) default '0',
  `thaythe_pttt` tinyint(4) default '1',
  `thaythe_date` date default NULL,
  `thaythe_sort` int(11) default '0',
  `thaythe_active` tinyint(4) default '1',
  `user_id` int(11) default '0',
  PRIMARY KEY  (`thaythe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE tbl_trinhdos;

CREATE TABLE `tbl_trinhdos` (
  `trinhdo_id` int(11) NOT NULL auto_increment,
  `trinhdo_name` varchar(250) default NULL,
  `trinhdo_standfor` varchar(250) default NULL,
  `trinhdo_desc` text,
  `trinhdo_date` date default NULL,
  `trinhdo_sort` int(11) default NULL,
  `trinhdo_active` tinyint(4) default NULL,
  PRIMARY KEY  (`trinhdo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO tbl_trinhdos VALUES("1","Cao h?c","CH","Trình ?? cao h?c, b?ng th?c s?","2012-09-27","","1");
INSERT INTO tbl_trinhdos VALUES("2","??i h?c","?H","Trình ?? ??i h?c, b?ng c? nhân ho?c b?ng t?t nghi?p.","2012-09-27","","1");
INSERT INTO tbl_trinhdos VALUES("3","Cao ??ng","C?","Trình ?? cao ??ng, b?ng c? nhân ho?c b?ng t?t nghi?p","2012-09-27","","1");
INSERT INTO tbl_trinhdos VALUES("4","K? s? - Ki?n trúc s?","KS-KTS","??i h?c t? 4.5 n?m - 5 n?m, b?ng k? s? / ki?n trúc s?.","2012-09-27","","1");
INSERT INTO tbl_trinhdos VALUES("5","Trung c?p","TC","Trình ?? trung c?p, b?ng t?t nghi?p","2012-09-27","","1");



DROP TABLE tbl_units;

CREATE TABLE `tbl_units` (
  `unit_id` int(11) NOT NULL auto_increment,
  `unit_name` varchar(250) default NULL,
  `unit_ununicode` varchar(250) default NULL,
  `unit_desc` text,
  `unit_date` datetime default NULL,
  `unit_sort` int(11) default '0',
  `unit_active` tinyint(4) default '0',
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=utf8;

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
INSERT INTO tbl_units VALUES("51","S? Giáo D?c và ?ào T?o TPHN","So Giao Duc va Dao Tao TPHN","<p>&#160;</p>","2011-04-28 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("52","Công ty TNHH ??u t? xây l?p và Phát tri?n Nhà","Cong ty TNHH Dau tu xay lap va Phat trien Nha","<p>&#160;</p>","2011-04-28 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("53","S? Thông tin và Truy?n Thông TPHN","So Thong tin va Truyen Thong TPHN","<p>&#160;</p>","2011-04-28 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("54","C?c Thu? TP Hà N?i","Cuc Thue TP Ha Noi","<p>&#160;</p>","2011-04-28 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("55","S? Tài Nguyên và Môi Tr??ng TPHN","So Tai Nguyen va Moi Truong TPHN","<p>&#160;</p>","2011-04-29 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("57","S? VH-TT và Du L?ch","So VHTT va Du Lich","","2011-05-05 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("58","S? Giao D?ch 1 - NH Phát Tri?n VN","So Giao Dich 1  NH Phat Trien VN","<p>&#160;</p>","2011-05-05 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("59","Ban QLDA Giao Thông 1","Ban QLDA Giao Thong 1","<p>&#160;</p>","2011-05-06 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("60","UBND Qu?n Hà ?ông","UBND Quan Ha Dong","<p>&#160;</p>","2011-05-06 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("61","UBND Qu?n Long Biên","UBND Quan Long Bien","<p>&#160;</p>","2011-05-06 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("62","UBND Qu?n ??ng ?a","UBND Quan Dong Da","<p>&#160;</p>","2011-05-06 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("63","UBND Qu?n Ba ?ình","UBND Quan Ba Dinh","<p>&#160;</p>","2011-05-06 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("64","UBND Qu?n C?u Gi?y","UBND Quan Cau Giay","<p>&#160;</p>","2011-05-06 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("65","UBND Qu?n Tây H?","UBND Quan Tay Ho","<p>&#160;</p>","2011-05-06 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("66","UBND Qu?n Thanh Xuân","UBND Quan Thanh Xuan","<p>&#160;</p>","2011-05-06 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("67","UBND Qu?n Hoàn Ki?m","UBND Quan Hoan Kiem","<p>&#160;</p>","2011-05-06 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("68","UBND Qu?n Hai Bà Tr?ng","UBND Quan Hai Ba Trung","<p>&#160;</p>","2011-09-26 00:00:00","","1","");
INSERT INTO tbl_units VALUES("69","??ng U? Kh?i Các CQTP","Dang Uy Khoi Cac CQTP","<p>&#160;</p>","2011-05-09 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("70","S? Công Th??ng TPHN","So Cong Thuong TPHN","<p>&#160;</p>","2011-05-11 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("71","UBND Huy?n","UBND Huyen","<p>&#160;</p>","2011-06-08 00:00:00","","1","");
INSERT INTO tbl_units VALUES("72","S? Y T? TPHN","So Y Te TPHN","<p>&#160;</p>","2011-05-18 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("73","H?ND Thành Ph? HN","HDND Thanh Pho HN","<p>&#160;</p>","2011-05-19 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("74","S? Lao ??ng TB&XH TPHN","So Lao Dong TB&XH TPHN","<p>&#160;</p>","2011-05-27 00:00:00","","1","");
INSERT INTO tbl_units VALUES("75","L?L? Thành ph? Hà n?i","LDLD Thanh pho Ha noi","<p>&#160;</p>","2011-05-27 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("76","H?i Làm V??n TPHN","Hoi Lam Vuon TPHN","<p>&#160;</p>","2011-05-27 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("77","Cty CP C? khí & Xây l?p s? 7","Cty CP Co khi & Xay lap so 7","<p>&#160;</p>","2011-05-27 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("78","Ban QLDA ?TXD B?o tàng L?ch s? QG_B? XD","Ban QLDA DTXD Bao tang Lich su QG_Bo XD","<p>&#160;</p>","2011-05-27 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("79","C?c H?i Quan TPHN","Cuc Hai Quan TPHN","<p>&#160;</p>","2011-05-27 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("80","Cty TNHH Th?ng Long GTC","Cty TNHH Thang Long GTC","<p>&#160;</p>","2011-05-27 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("81","H? ??nh giá Tài s?n L?HANT","HD Dinh gia Tai san LDHANT","<p>&#160;</p>","2011-05-27 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("82","Vi?n QHXD HN","Vien QHXD HN","<p>&#160;</p>","2011-05-27 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("83","Chi c?c QLCS_S? TC","Chi cuc QLCS_So TC","<p>&#160;</p>","2011-05-27 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("85","Cty CP ?TPT Nhà HN s? 5","Cty CP DTPT Nha HN so 5","<p>&#160;</p>","2011-05-27 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("86","Cty CP H?n ??t Vi?t","Cty CP Hon Dat Viet","<p>&#160;</p>","2011-05-27 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("87","Cty CP ?TXD&KD Nhà HN s? 35","Cty CP DTXD&KD Nha HN so 35","<p>&#160;</p>","2011-05-27 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("88","S? T? Pháp TPHN","So Tu Phap TPHN","<p>&#160;</p>","2011-05-30 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("89","Cty CP Th?m ??nh Giá & DV tài chính HN","Cty CP Tham Dinh Gia & DV tai chinh HN","<p>&#160;</p>","2011-05-30 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("90","V?n phòng Thành u? HN","Van phong Thanh uy HN","<p>&#160;</p>","2011-06-01 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("91","Ban Dân T?c TPHN","Ban Dan Toc TPHN","<p>&#160;</p>","2011-06-01 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("92","U? Ban Th??ng V? Qu?c H?i","Uy Ban Thuong Vu Quoc Hoi","<p>&#160;</p>","2011-06-01 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("93","Cty TNHH ?T&PT Nông Lâm nghi?p Sóc S?n","Cty TNHH DT&PT Nong Lam nghiep Soc Son","<p>&#160;</p>","2011-06-01 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("94","Trung tâm BT khu DT C? Loa - Thành c? HN","Trung tam BT khu DT Co Loa  Thanh co HN","<p>&#160;</p>","2011-06-01 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("95","Cty TNHH Công Viên Cây Xanh","Cty TNHH Cong Vien Cay Xanh","<p>&#160;</p>","2011-06-01 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("96","H?i ??ng Khoa h?c, Sáng Ki?n TPHN","Hoi Dong Khoa hoc, Sang Kien TPHN","<p>&#160;</p>","2011-06-01 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("97","Chi c?c PT Nông thôn - S? NN","Chi cuc PT Nong thon  So NN","<p>&#160;</p>","2011-06-01 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("98","Trung tâm GDTX","Trung tam GDTX","<p>&#160;</p>","2011-06-01 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("99","Ban QL?T&XD khu ?ô th? m?i HN","Ban QLDT&XD khu do thi moi HN","<p>&#160;</p>","2011-06-02 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("100","Cty KDPT Nhà và ?ô th? HN","Cty KDPT Nha va Do thi HN","<p>&#160;</p>","2011-06-02 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("101","Thanh tra TPHN","Thanh tra TPHN","<p>&#160;</p>","2011-06-02 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("102","NH?T & PT Campuchia Chi nhánh HN","NHDT & PT Campuchia Chi nhanh HN","<p>&#160;</p>","2011-06-02 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("103","H?i CCB Kh?i các CQ TPHN","Hoi CCB Khoi cac CQ TPHN","<p>&#160;</p>","2011-06-02 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("104","S? Khoa H?c và Công Ngh? TPHN","So Khoa Hoc va Cong Nghe TPHN","<p>&#160;</p>","2011-06-02 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("105","T?ng Cty Hàng H?i VN","Tong Cty Hang Hai VN","<p>&#160;</p>","2011-06-03 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("106","Trung tâm Gi?ng Cây tr?ng","Trung tam Giong Cay trong","<p>&#160;</p>","2011-06-06 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("107","Cty Qu?n lý B?n Xe HN","Cty Quan ly Ben Xe HN","<p>&#160;</p>","2011-06-06 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("108","B? T? L?nh Th? ?ô HN","Bo Tu Lenh Thu Do HN","<p>&#160;</p>","2011-06-07 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("109","Công ?oàn Viên Ch?c TPHN","Cong Doan Vien Chuc TPHN","<p>&#160;</p>","2011-06-07 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("110","Trung tâm GD ??t ?ai & PTQ? HN","Trung tam GD Dat dai & PTQD HN","<p>&#160;</p>","2011-06-07 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("111","Qu? ?TPT TP - Hà n?i","Quy DTPT TP  Ha noi","<p>&#160;</p>","2011-06-07 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("112","Cty TNHH Thu? l?i Sông Tích","Cty TNHH Thuy loi Song Tich","<p>&#160;</p>","2011-06-07 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("113","Cty CP ?TXD&KD N??c s?ch","Cty CP DTXD&KD Nuoc sach","<p>&#160;</p>","2011-06-07 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("114","Ban Tôn Giáo - S? N?i V? HN","Ban Ton Giao  So Noi Vu HN","<p>&#160;</p>","2011-06-08 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("115","Ban Thi ?ua - Khen Th??ng_S? N?i V? HN","Ban Thi Dua  Khen Thuong_So Noi Vu HN","<p>&#160;</p>","2011-06-08 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("116","Ban ch? ??o GPMB TP","Ban chi dao GPMB TP","<p>&#160;</p>","2011-06-09 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("117","Thanh tra S?_S? GTHN","Thanh tra So_So GTHN","<p>&#160;</p>","2011-06-09 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("118","Cty TNHH Thoát n??c Hà n?i","Cty TNHH Thoat nuoc Ha noi","<p>&#160;</p>","2011-06-09 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("119","Ban Tuyên Giáo Thành u? HN","Ban Tuyen Giao Thanh uy HN","<p>&#160;</p>","2011-06-13 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("120","Ban ch? ??o Ch??ng trình CNTT HN","Ban chi dao Chuong trinh CNTT HN","<p>&#160;</p>","2011-06-13 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("121","Cty TNHH Gi?ng gia súc HN","Cty TNHH Giong gia suc HN","<p>&#160;</p>","2011-06-13 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("122","Ban Tuyên Giáo ??ng u? kh?i các CQTP","Ban Tuyen Giao Dang uy khoi cac CQTP","<p>&#160;</p>","2011-06-13 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("123","B?nh Vi?n M?t Hà ?ông","Benh Vien Mat Ha Dong","<p>&#160;</p>","2011-06-13 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("124","Cty CP In và TM Hà Tây (IHATA)","Cty CP In va TM Ha Tay (IHATA)","<p>&#160;</p>","2011-06-13 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("125","Ban QLDA H? T?ng ?T","Ban QLDA Ha Tang DT","<p>&#160;</p>","2011-06-13 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("127","Ban ch? ??o XD ??ng và các ?oàn th? trong các DN ngoài NN thu?c TP","Ban chi dao XD Dang va cac Doan the trong cac DN ngoai NN thuoc TP","<p>&#160;</p>","2011-06-13 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("128","Ban QL các DA Tr?ng ?i?m PT?T HN","Ban QL cac DA Trong Diem PTDT HN","<p>&#160;</p>","2011-06-13 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("129","UBND Th? xã","UBND Thi xa","<p>&#160;</p>","2011-06-14 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("130","Cty TNHH ?i?n C? Th?ng Nh?t","Cty TNHH Dien Co Thong Nhat","<p>&#160;</p>","2011-06-14 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("131","C?c B?o v? chính tr? VII","Cuc Bao ve chinh tri VII","<p>&#160;</p>","2011-06-14 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("132","Ban QLDA QLNN v? MT","Ban QLDA QLNN ve MT","<p>&#160;</p>","2011-06-14 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("133","Ban QLDA PTCNTT&TT Hà n?i","Ban QLDA PTCNTT&TT Ha noi","<p>&#160;</p>","2011-06-15 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("134","Cty CP C? ?i?n & XD VN","Cty CP Co Dien & XD VN","<p>&#160;</p>","2011-06-15 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("135","Cty C?ng Hà Tây","Cty Cang Ha Tay","<p>&#160;</p>","2011-06-15 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("136","Cty CPXD s? 2 - Vinaconex","Cty CPXD so 2  Vinaconex","<p>&#160;</p>","2011-06-15 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("137","B? Tài nguyên và Môi tr??ng","Bo Tai nguyen va Moi truong","<p>&#160;</p>","2011-06-15 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("138","Cty ?TPT Thu? L?i Sông ?áy","Cty DTPT Thuy Loi Song Day","<p>&#160;</p>","2011-06-16 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("139","Ban QLDA  QL Nhà n??c v? MT","Ban QLDA  QL Nha nuoc ve MT","<p>&#160;</p>","2011-06-16 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("140","Ban QLDA Duy tu HTGT","Ban QLDA Duy tu HTGT","<p>&#160;</p>","2011-06-16 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("141","T?ng cty CP Vinaconex","Tong cty CP Vinaconex","<p>&#160;</p>","2011-06-16 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("142","Cty CPTM&DV Lã V?ng","Cty CPTM&DV La Vong","<p>&#160;</p>","2011-06-16 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("143","C?c H?u C?n_B? t? l?nh H?i Quân","Cuc Hau Can_Bo tu lenh Hai Quan","<p>&#160;</p>","2011-06-16 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("144","H?i  Ch? Th?p ?? TPHN","Hoi  Chu Thap Do TPHN","<p>&#160;</p>","2011-06-16 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("145","Qu? B?o v? Môi tr??ng HN","Quy Bao ve Moi truong HN","<p>&#160;</p>","2011-06-16 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("146","Cty CP XNK&XD Tân Tr??ng S?n","Cty CP XNK&XD Tan Truong Son","<p>&#160;</p>","2011-06-16 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("147","Cty TNHH PT khu ?ô th? Nam Th?ng Long","Cty TNHH PT khu do thi Nam Thang Long","<p>&#160;</p>","2011-06-16 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("148","Cty N??c s?ch HN","Cty Nuoc sach HN","<p>&#160;</p>","2011-06-16 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("149","V?n phòng Chính ph?","Van phong Chinh phu","<p>&#160;</p>","2011-06-16 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("150","Cty CP V?t t? VT Xi M?ng","Cty CP Vat tu VT Xi Mang","<p>&#160;</p>","2011-06-16 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("151","Trung tâm Nhân ??o Hoà Bình_H?i Ch? Th?p ?? VN","Trung tam Nhan dao Hoa Binh_Hoi Chu Thap do VN","<p>&#160;</p>","2011-06-17 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("152","Cty TNHH X? s? KTT?","Cty TNHH Xo so KTTD","<p>&#160;</p>","2011-06-17 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("153","BQL Ch?nh trang ?ô th? HN","BQL Chinh trang Do thi HN","<p>&#160;</p>","2011-06-17 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("154","Chi c?c thu? qu?n C?u Gi?y","Chi cuc thue quan Cau Giay","<p>&#160;</p>","2011-06-17 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("155","Trung tâm Khuy?n Nông&T? v?n PTCN","Trung tam Khuyen Nong&Tu van PTCN","<p>&#160;</p>","2011-06-20 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("157","Cty CP C? ?i?n Tr?n Phú","Cty CP Co Dien Tran Phu","<p>&#160;</p>","2011-06-20 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("158","H?i ??ng Thi ?ua - Khen th??ng TPHN","Hoi dong Thi dua  Khen thuong TPHN","<p>&#160;</p>","2011-06-21 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("159","Tr??ng C? Y t? HN","Truong CD Y te HN","<p>&#160;</p>","2011-06-22 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("160","BTV H?i LHPN Hà n?i","BTV Hoi LHPN Ha noi","<p>&#160;</p>","2011-06-22 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("161","Cty CP D?t Kim Hà n?i","Cty CP Det Kim Ha noi","<p>&#160;</p>","2011-06-22 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("162","Ngân Hàng ?T&PT VN","Ngan Hang DT&PT VN","<p>&#160;</p>","2011-06-22 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("163","Báo Kinh t? & ?ô Th? HN","Bao Kinh te & Do Thi HN","<p>&#160;</p>","2011-06-22 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("164","Ban QLDA N?ng L??ng Nông thôn 2","Ban QLDA Nang Luong Nong thon 2","<p>&#160;</p>","2011-06-22 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("165","Chi c?c B?o v? Th?c v?t HN","Chi cuc Bao ve Thuc vat HN","<p>&#160;</p>","2011-06-22 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("166","Chi c?c QLTT HN","Chi cuc QLTT HN","<p>&#160;</p>","2011-06-22 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("167","C? Quan Th??ng tr?c Ban ch? ??o 127/TP","Co Quan Thuong truc Ban chi dao 127/TP","<p>&#160;</p>","2011-06-22 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("168","Cty ?TTM và DV Qu?c T?","Cty DTTM va DV Quoc Te","<p>&#160;</p>","2011-06-22 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("169","Trung tâm Tr? giúp Pháp Lý NN","Trung tam Tro giup Phap Ly NN","<p>&#160;</p>","2011-06-23 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("170","BC? phòng, ch?ng AIDS và PCTN Ma Tuý, M?i Dâm HN","BCD phong, chong AIDS va PCTN Ma Tuy, Mai Dam HN","<p>&#160;</p>","2011-06-23 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("171","BC? Tr? giúp Ng??i nghèo HN","BCD Tro giup Nguoi ngheo HN","<p>&#160;</p>","2011-06-24 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("172","Trung tâm NC Bò và ??ng c? Ba Vì","Trung tam NC Bo va Dong co Ba Vi","<p>&#160;</p>","2011-06-24 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("173","Cty TNHH XNK và Phát Hành Phim VN","Cty TNHH XNK va Phat Hanh Phim VN","<p>&#160;</p>","2011-06-24 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("174","Ban QLDA ??u t? & XD","Ban QLDA Dau tu & XD","<p>&#160;</p>","2011-06-24 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("175","Cty TNHH Gamuda Land VN","Cty TNHH Gamuda Land VN","<p>&#160;</p>","2011-06-24 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("176","Ban ch? ??o C?i Cách TP","Ban chi dao Cai Cach TP","<p>&#160;</p>","2011-06-27 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("177","Ban ch? ??o công tác Tôn Giáo TP","Ban chi dao cong tac Ton Giao TP","<p>&#160;</p>","2011-06-27 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("178","BCH H?i Nông Dân TPHN","BCH Hoi Nong Dan TPHN","<p>&#160;</p>","2011-06-27 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("179","H?i ??ng ??nh giá TS L?HANT","Hoi dong Dinh gia TS LDHANT","<p>&#160;</p>","2011-06-27 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("180","Ban ch? huy PCLB TP","Ban chi huy PCLB TP","<p>&#160;</p>","2011-06-27 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("181","H?i  Sinh v?t C?nh TPHN","Hoi  Sinh vat Canh TPHN","<p>&#160;</p>","2011-06-27 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("182","B?o Hi?m XHVN","Bao Hiem XHVN","<p>&#160;</p>","2011-06-27 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("183","T?ng cty ?TPT H? t?ng ?ô th?","Tong cty DTPT Ha tang Do thi","<p>&#160;</p>","2011-06-27 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("184","Chi c?c Dân s? - KHHG?","Chi cuc Dan so  KHHGD","<p>&#160;</p>","2011-06-27 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("185","Cty CP ?T XL Th??ng M?i & D?ch v?","Cty CP DT XL Thuong Mai & Dich vu","<p>&#160;</p>","2011-06-28 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("186","Cty CPVT TM&DL ?ông Anh","Cty CPVT TM&DL Dong Anh","<p>&#160;</p>","2011-06-29 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("187","Ban QL các Khu CN&CX Hà n?i","Ban QL cac Khu CN&CX Ha noi","<p>&#160;</p>","2011-06-29 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("188","T?ng Cty TM Hà N?i","Tong Cty TM Ha Noi","<p>&#160;</p>","2011-06-29 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("189","Ban QLDA Khu ?ô th? M? Lao","Ban QLDA Khu do thi Mo Lao","<p>&#160;</p>","2011-06-29 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("190","Cty CP T?p ?oàn T&T","Cty CP Tap Doan T&T","<p>&#160;</p>","2011-06-29 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("191","Cty C? ph?n ?T&XD s? 1 HN","Cty Co phan DT&XD so 1 HN","<p>&#160;</p>","2011-06-29 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("192","Cty TNHH MTV ?TPT Nhà&?ô th?","Cty TNHH MTV DTPT Nha&Do thi","<p>&#160;</p>","2011-06-30 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("193","Ban Ch?p hành TPHN","Ban Chap hanh TPHN","<p>&#160;</p>","2011-07-01 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("194","Cty CP VT&XD Hà N?i","Cty CP VT&XD Ha Noi","<p>&#160;</p>","2011-07-01 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("195","Cty TNHH ?TPT Thu? l?i Sông Nhu?","Cty TNHH DTPT Thuy loi Song Nhue","<p>&#160;</p>","2011-07-01 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("196","B? Khoa H?c và Công Ngh?","Bo Khoa Hoc va Cong Nghe","<p>&#160;</p>","2011-07-01 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("197","B? NN&PT Nông Thôn","Bo NN&PT Nong Thon","<p>&#160;</p>","2011-07-01 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("198","Cty TNHH MTV ?TPT Thu? L?i sông ?áy","Cty TNHH MTV DTPT Thuy Loi song Day","<p>&#160;</p>","2011-07-01 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("199","Ban Kinh t? & Ngân sách HN","Ban Kinh te & Ngan sach HN","<p>&#160;</p>","2011-07-04 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("200","Vi?n NC&QL  Kinh t? Trung ??ng","Vien NC&QL  Kinh te Trung Uong","<p>&#160;</p>","2011-07-04 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("201","Ban QL Ch?nh trang ?ô th? HN","Ban QL Chinh trang Do thi HN","<p>&#160;</p>","2011-07-06 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("202","Ban CHQS qu?n Hoàn Ki?m","Ban CHQS quan Hoan Kiem","<p>&#160;</p>","2011-07-12 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("203","UB MTTQ Vi?t Nam TPHN","UB MTTQ Viet Nam TPHN","<p>&#160;</p>","2011-07-14 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("204","V?n phòng ?oàn ?BQH&H?ND TPHN","Van phong Doan DBQH&HDND TPHN","","2011-08-26 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("205","Ngân Hàng NN Vi?t Nam","Ngan Hang NN Viet Nam","<p>&#160;</p>","2011-09-09 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("206","Kho b?c Nhà n??c HN","Kho bac Nha nuoc HN","<p>&#160;</p>","2011-09-22 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("207","Theo công v?n","Theo cong van","<p>TCV</p>","2011-11-23 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("208","UBND huy?n Ch??ng M?","UBND huyen Chuong My","<p>&#160;</p>","2011-11-29 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("209","UBND huy?n Phú Xuyên","UBND huyen Phu Xuyen","<p>&#160;</p>","2011-11-29 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("210","T?ng cty ?T&PT Nhà HN","Tong cty DT&PT Nha HN","<p>&#160;</p>","2011-11-29 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("211","B? T? pháp","Bo Tu phap","<p>&#160;</p>","2011-11-29 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("212","C?c QL Giá - B? TC","Cuc QL Gia  Bo TC","<p>&#160;</p>","2011-11-29 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("213","T?ng C?c Thu?","Tong Cuc Thue","<p>&#160;</p>","2011-11-29 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("214","Kho b?c NN Thanh Trì","Kho bac NN Thanh Tri","<p>&#160;</p>","2011-11-29 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("215","C?c ?i?u tra ch?ng buôn l?u - T?ng c?c H?i quan","Cuc dieu tra chong buon lau  Tong cuc Hai quan","<p>&#160;</p>","2011-11-29 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("216","Các cty TNHH MTV thu?c UBND TP & các T?ng CTNN thu?c TP","Cac cty TNHH MTV thuoc UBND TP & cac Tong CTNN thuoc TP","<p>&#160;</p>","2011-11-30 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("217","Ban ch? ??o CT s? 08-CTr/TU c?a Thành U? Khoá XV","Ban chi dao CT so 08CTr/TU cua Thanh Uy Khoa XV","<p>&#160;</p>","2012-01-18 00:00:00","0","1","");
INSERT INTO tbl_units VALUES("218","Ban T? ch?c Thành u? HN","Ban To chuc Thanh uy HN","<p>&#160;</p>","2012-05-23 00:00:00","0","1","");



DROP TABLE tbl_users;

CREATE TABLE `tbl_users` (
  `user_id` int(11) NOT NULL auto_increment,
  `department_id` varchar(250) default '0',
  `unit_id` int(11) default '0',
  `object_id` int(11) default '0',
  `user_fullname` varchar(250) default NULL,
  `user_name` varchar(250) default NULL,
  `user_pass` varchar(250) default NULL,
  `user_encode_pass` varchar(250) default NULL,
  `user_phone` varchar(250) default NULL,
  `user_email` varchar(250) default NULL,
  `user_image` varchar(250) default NULL,
  `user_sex` tinyint(4) default NULL,
  `user_ngay_sinh` varchar(30) default NULL,
  `user_noi_sinh` varchar(100) default NULL,
  `user_thuong_tru` varchar(250) default NULL,
  `user_tam_tru` varchar(250) default NULL,
  `trinhdo_id` int(11) default NULL,
  `user_cmnd` varchar(30) default NULL,
  `user_ngay_cap` varchar(30) default NULL,
  `user_noi_cap` varchar(100) default NULL,
  `user_ngay_bat_dau` varchar(30) default NULL,
  `user_so_tai_khoan` varchar(20) default NULL,
  `user_ngan_hang` varchar(100) default NULL,
  `per_add` tinyint(1) default '0',
  `per_edit` tinyint(1) default '0',
  `per_del` tinyint(1) default '0',
  `per_act` tinyint(1) default '0',
  `per_view` tinyint(1) default '0',
  `per_sms` tinyint(1) default '0',
  `user_module` varchar(250) default '0',
  `user_sort` int(11) default '0',
  `user_level` tinyint(1) default '0',
  `user_level_tnvb` tinyint(4) default '0',
  `user_level_soft` int(11) default '3',
  `user_active` tinyint(1) default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

INSERT INTO tbl_users VALUES("1","3,","3","6","Qu?n tr?","admin","e10adc3949ba59abbe56e057f20f883e","123456","0972559746","anhvan3103@gmail.com","images/userimg/large_images/1361246911_P1040778.jpg","1","1986-03-31","T? Liêm, Hà N?i","Xuân ??nh, T? Liêm, Hà N?i","S? 23, ktt X-827, thôn Tân Xuân, Xuân ??nh, T? Liêm, HN","5","012504687","2002-03-30","Công an TP. Hà N?i","2010-01-01","01035890624","0","","","","","","3","","","1","1","3","1");
INSERT INTO tbl_users VALUES("5","2,","2","3","Tào Th? Ngân","ngantt","e10adc3949ba59abbe56e057f20f883e","123456","0904563237","vanngan8688@gmail.com","images/userimg/large_images/1348794757_vitbeo.jpg","1","1988-10-03","Thanh Oai, Hà N?i","Hà N?i","Hà N?i","2","110264044","2004-05-17","Công an t?nh Hà N?i","2010-01-01","010247787","VIB Bank","","","","","","3","","","6","3","3","1");
INSERT INTO tbl_users VALUES("6","2,","2","6","Bùi Thu Huy?n","huyenbt","e10adc3949ba59abbe56e057f20f883e","123456","0963089981","huyenbt269@gmail.com","images/userimg/large_images/1348802057_anh_hoso_huyen.jpg","2","1987-09-26","Long Biên, Hà N?i","Th?ch Bàn, Long Biên, Hà N?i","S? 18, T? 3, Th?ch Bàn, Long Biên, Hà N?i","5","019987384","2004-06-10","Công an TP. Hà N?i","2011-03-01","779458357243","Vietin Bank","","","","","","3","","","8","3","3","1");
INSERT INTO tbl_users VALUES("7","6,1,3,7,","1","1","D??ng Vi?t Hùng","hungdv","e10adc3949ba59abbe56e057f20f883e","123456","0903267002","hungduongviet@gmail.com","images/userimg/large_images/1348802876_anh_hoso_hungdv.jpg","1","1978-06-18","Hà N?i","Th? Quan, ??ng ?a, Hà N?i","S? 44, ngõ Trung Ti?n, Th? Quan, ??ng ?a, Hà N?i","4","012312387","2002-07-12","Công an TP. Hà N?i","2009-01-01","45863946589","Sacom Bank","0","0","0","0","0","3","0","0","4","3","3","1");
INSERT INTO tbl_users VALUES("8","4,","4","2","Nguy?n Quý H?u","huunq","e10adc3949ba59abbe56e057f20f883e","123456","0963049981","huunguyenquy@gmail.com","images/userimg/large_images/1348803322_anh_hoso_huunq.jpg","1","1983-11-04","Gia Lâm, Hà N?i","Sài ??ng, Gia Lâm, Hà N?i","Sài ??ng, Gia Lâm, Hà N?i","3","124563976","2001-12-08","Công an TP. Hà N?i","2011-05-01","234487687475","Vietin Bank","0","0","0","0","0","3","0","0","5","3","3","1");
INSERT INTO tbl_users VALUES("9","7,","7","4","Nguy?n Ng?c Hi?n","hiennn","e10adc3949ba59abbe56e057f20f883e","123456","0986983616","nguyenngochien1986@gmail.com","images/userimg/large_images/1348803972_anh_the.JPG","1","1986-10-12","Th??ng Tín, Hà N?i","Ninh S?, Th??ng Tín, Hà N?i","Thôn Sâm D??ng, Ninh S?, Th??ng Tín, Hà N?i","2","124584686","2002-04-23","Công an t?nh Hà N?i","2011-10-01","82648473677","Sacom Bank","","","","","","3","","","6","1","3","1");
INSERT INTO tbl_users VALUES("10","3,","3","5","Nguy?n Xuân H?i","hainx","e10adc3949ba59abbe56e057f20f883e","123456","01683849755","xuanhaitk5@gmail.com","images/userimg/large_images/1348804348_anh_hoso_hainx.jpg","1","1989-10-10","V?n Giang, H?ng Yên","V?n Giang, H?ng Yên","Kim Mã, ??ng ?a, Hà N?i","3","145198113","2006-07-16","Công an t?nh H?ng Yên","2011-08-01","2497682349","VIB Bank","","","","","","3","","","7","3","3","1");
INSERT INTO tbl_users VALUES("11","1,","1","4","?àm Thanh An","andt","e10adc3949ba59abbe56e057f20f883e","123456","0988908191","damthanhan81@yahoo.com","images/userimg/large_images/1348804842_anh_hoso_andt.jpg","2","1981-11-07","T? S?n, B?c Ninh","Th? Quan, ??ng ?a, Hà N?i","S? 44, ngõ Trung Ti?n, Th? Quan, ??ng ?a, Hà N?i","2","134987254","2000-04-05","Công an t?nh B?c Ninh","2009-01-01","87645937456","Sacom Bank","0","0","0","0","0","3","0","0","3","3","3","1");
INSERT INTO tbl_users VALUES("12","3,","3","6","Hoàng Tri?u H?i","haiht","e10adc3949ba59abbe56e057f20f883e","123456","0909913815","mr.heen@gmail.com","images/userimg/large_images/1348805239_anh_hoso_haiht.jpg","1","1987-12-26","??ng ?a, Hà N?i","Ngh?a ?ô, C?u Gi?y, Hà N?i","Ph? Doãn K? Thi?n, Ngh?a ?ô, C?u Gi?y, Hà N?i","2","010274568","2004-05-15","Công an TP. Hà N?i","2011-08-01","32432476784","VIB Bank","0","0","0","0","0","3","0","0","8","3","3","1");
INSERT INTO tbl_users VALUES("13","7,","7","5","?ào V?n Hi?p","hiepdv","e10adc3949ba59abbe56e057f20f883e","123456","0948856338","dvhiep8888@gmail.com","images/userimg/large_images/1348805656_anh_hoso_hiepdv.jpg","1","1989-07-01","?ông Anh, Hà N?i","Ph? L?, Sóc S?n, Hà N?i","S? 7, kh?i 14, Ph? L?, Sóc S?n, Hà N?i","5","012852891","2006-03-26","Công an TP. Hà N?i","2012-05-01","782374682776","VIP Bank","","","","","","3","","","8","3","3","1");
INSERT INTO tbl_users VALUES("14","1,","1","6","Lê Tuy?t Nga","ngalt","e10adc3949ba59abbe56e057f20f883e","123456","0984990481","tuyetnga_le84@yahoo.com","images/userimg/large_images/1348806096_anh_hoso_ngalt.jpg","2","1984-01-17","H?ng Quang, H?i D??ng","Thái Nguyên","??ng ?a, Hà N?i","5","145987686","2004-10-13","Công an t?nh H?i D??ng","2010-01-01","84629467497","Techcom Bank","0","0","0","0","0","3","0","0","9","2","3","1");
INSERT INTO tbl_users VALUES("15","7,","7","6","Lê V?n D?ng","dunglv","e10adc3949ba59abbe56e057f20f883e","123456","0946006636","mail.dunglv@gmail.com","images/userimg/large_images/1363311280_dunglv.jpg","1","1988-04-06","V?nh Phúc","Ph? Chùa Hà, ??nh Chung, V?nh Yên, V?nh Phúc","Phùng Khoang, Hà ?ông, Hà N?i","5","135267844","2011-03-31","CA.V?nh Phúc","2013-03-01","","","","","","","","3","","","8","3","3","1");
INSERT INTO tbl_users VALUES("16","4,","4","5","?inh Công V?nh","vinhdc","e10adc3949ba59abbe56e057f20f883e","123456","01697613570","vinh201084@gmail.com","images/userimg/large_images/1363311121_vinhdc.jpg","1","1984-10-20","Hà N?i","Thanh Oai, Hà N?i","Thanh Oai, Hà N?i","3","","2013-03-15","","2013-03-01","","","","","","","","3","","","7","3","3","1");
INSERT INTO tbl_users VALUES("17","4,","4","4","D??ng Anh Tu?n","tuanda","e10adc3949ba59abbe56e057f20f883e","123456","0988255986","tuanda@gmail.com","","1","--","Hà N?i","Ngõ L?nh C?, Khâm Thiên, ??ng ?a, Hà N?i","Ngõ L?nh C?, Khâm Thiên, ??ng ?a, Hà N?i","2","","--","","2008-10-01","","","0","0","0","0","0","3","0","0","6","3","3","1");
INSERT INTO tbl_users VALUES("18","3,","3","4","Lê Anh V?n","vanla","e10adc3949ba59abbe56e057f20f883e","123456","0972559746","anhvan3103@gmail.com","images/userimg/large_images/1363081629_P1040564.JPG","1","1986-03-31","Hà N?i","Xuân ??nh, T? Liêm, Hà N?i","S? 23, Khu tt X-817, thôn Tân Xuân, Xuân ??nh, T? Liêm, Hà N?i","5","012504687","2002-03-30","CA.Hà N?i","2011-02-15","","","","","","","","3","","","6","3","3","1");
INSERT INTO tbl_users VALUES("19","8,","8","4","Nguy?n Tr?ng Toàn","toannt","e10adc3949ba59abbe56e057f20f883e","123456","01252667622","toan79_vn@gmail.com","images/userimg/large_images/1363310827_toannt.jpg","1","1979-07-09","Thanh Hóa","Qu?ng X??ng, Thanh Hóa","Qu?ng X??ng, Thanh Hóa","2","","2013-03-15","","2013-01-01","","","","","","","","2","","","6","3","1","1");
INSERT INTO tbl_users VALUES("20","9,","9","4","Nguy?n Qu?nh Anh","anhnq","e10adc3949ba59abbe56e057f20f883e","123456","0988999308","quynhchuoi@gmail.com","images/userimg/large_images/1363311733_anhnq.jpg","2","1988-08-03","Hà N?i","Tôn Th?t Tùng, ??ng ?a, Hà N?i","H?i Châu, ?à N?ng","2","","2013-03-15","","2013-01-01","","","","","","","","2","","","6","3","1","1");
INSERT INTO tbl_users VALUES("21","10,","10","4","Bùi Th? Vi?t Hà","habtv","e10adc3949ba59abbe56e057f20f883e","123456","0974719918","minhminh_mua@yahoo.com.vn","images/userimg/large_images/1363312608_04_shop.jpg","2","1987-11-29","H?i Phòng","L??ng Khánh Thi?n, Ngô Quy?n, H?i Phòng","Th? xã Cam Ranh, Khánh Hòa","2","","--","","2013-01-01","","","0","0","0","0","0","2","0","0","6","3","1","1");
INSERT INTO tbl_users VALUES("22","4,","4","6","?? V?n Hi?u","hieudv","e10adc3949ba59abbe56e057f20f883e","123456","0903225688","hieudv94@gmail.com","","1","--","Long Biên, Hà N?i","Long Biên, Hà N?i","Long Biên, Hà N?i","5","","--","","2013-03-15","","","0","0","0","0","0","0","0","0","8","3","3","1");
INSERT INTO tbl_users VALUES("30","3,","3","6","Tr?n Thùy Linh","linhtt","e10adc3949ba59abbe56e057f20f883e","123456","0943561121","linhtt038@gmail.com","images/userimg/large_images/1367381468_lintt.jpg","2","1991-01-30","Nam ??nh","Nam ??nh","C?u Gi?y, Hà N?i","5","","2013-05-01","","2013-04-01","","","","","","","","2","","","8","3","3","1");



DROP TABLE tbl_userunits;

CREATE TABLE `tbl_userunits` (
  `userUnit_id` int(11) NOT NULL auto_increment,
  `userUnit_name` varchar(250) default NULL,
  `userUnit_desc` text,
  `userUnit_date` datetime default NULL,
  `userUnit_sort` int(11) default '0',
  `userUnit_active` tinyint(4) default '0',
  PRIMARY KEY  (`userUnit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




DROP TABLE tbl_vbfiles;

CREATE TABLE `tbl_vbfiles` (
  `docFile_id` int(11) NOT NULL auto_increment,
  `doc_id` int(11) default '0',
  `docFile_name` varchar(250) default NULL,
  `docFile_path` varchar(250) default NULL,
  `docFile_date` date default NULL,
  `docFile_sort` int(11) default '0',
  `docFile_active` int(11) default '0',
  `user_id` int(11) default '0',
  PRIMARY KEY  (`docFile_id`),
  KEY `FK_tbl_vbfiles` (`doc_id`),
  CONSTRAINT `FK_tbl_vbfiles` FOREIGN KEY (`doc_id`) REFERENCES `tbl_vbs` (`doc_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

INSERT INTO tbl_vbfiles VALUES("20","1","489","../doc_uploads_2013/e30dc7a62f16b6198d5ab91ea38160a9.jpg","2013-03-18","0","0","14");
INSERT INTO tbl_vbfiles VALUES("22","3","257/TB-UBND","../doc_uploads_2013/3a7f66fc47bdddc8cf1312c1ab945b8c.jpg","2013-03-19","0","0","14");
INSERT INTO tbl_vbfiles VALUES("23","4","347/TT-HND","../doc_uploads_2013/26aa5b4ed5bd50145a1c10b4340b6b75.jpg","2013-03-19","0","0","14");
INSERT INTO tbl_vbfiles VALUES("24","5","668/TT-SGT","../doc_uploads_2013/832b298af3402ee344d9887b17a7ea9f.jpg","2013-03-21","0","0","14");
INSERT INTO tbl_vbfiles VALUES("25","6","679/TT-BCT","../doc_uploads_2013/f857e77f656bb4787ed20fd7092b90f0.png","2013-03-21","0","0","14");
INSERT INTO tbl_vbfiles VALUES("26","7","2350","../doc_uploads_2013/22a3b317ee6bf71e9e6bf1f0aab29a9e.jpg","2013-04-24","0","0","26");
INSERT INTO tbl_vbfiles VALUES("27","8","1249","../doc_uploads_2013/41db304c0609056da30457eef50deea8.png","2013-04-24","0","0","26");
INSERT INTO tbl_vbfiles VALUES("28","9","1345 - 1: B?n scan","../doc_uploads_2012/5e1aa47c6b3f2ae83de55255c5613594.jpg","2013-04-24","0","0","26");
INSERT INTO tbl_vbfiles VALUES("29","9","1345 - 2: T?p tin liên quan","../doc_uploads_2012/90659bdbb5ff70930d5715e39e92d4f8.jpg","2013-04-24","0","0","26");
INSERT INTO tbl_vbfiles VALUES("30","9","1345 - 3: V?n b?n tr? l?i","../doc_uploads_2012/e15a20956031b03c2a653e3bd7faf955.jpg","2013-04-24","0","0","26");
INSERT INTO tbl_vbfiles VALUES("31","9","1345 - 4: K?t lu?n","../doc_uploads_2012/3165ece81acee9a73efcf60c7f99a7fb.jpg","2013-04-24","0","0","26");
INSERT INTO tbl_vbfiles VALUES("32","9","1345 - 5: Thông báo","../doc_uploads_2012/1be0bbf5216efa8f4aec1726ceb40d67.jpg","2013-04-24","0","0","26");
INSERT INTO tbl_vbfiles VALUES("33","9","1345 - 6: Biên b?n","../doc_uploads_2012/394c5a5117f6f2100cd8f94bbfd8a119.jpg","2013-04-24","0","0","26");
INSERT INTO tbl_vbfiles VALUES("34","10","12/CV-CKXL7","../doc_uploads_2013/36d1db0b345698f640733f97977d2b67.pdf","2013-04-24","0","0","1");



DROP TABLE tbl_vbreplyfiles;

CREATE TABLE `tbl_vbreplyfiles` (
  `docreplyfile_id` int(11) NOT NULL auto_increment,
  `docreply_id` int(11) default '0',
  `docreplyfile_name` varchar(250) default NULL,
  `docreplyfile_path` varchar(250) default NULL,
  `docreplyfile_date` datetime default NULL,
  `docreplyfile_sort` int(11) default '0',
  `docreplyfile_active` tinyint(4) default '0',
  `user_id` int(11) default '0',
  PRIMARY KEY  (`docreplyfile_id`),
  KEY `FK_tbl_vbreplyfiles` (`docreply_id`),
  CONSTRAINT `FK_tbl_vbreplyfiles` FOREIGN KEY (`docreply_id`) REFERENCES `tbl_vbreplys` (`docreply_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO tbl_vbreplyfiles VALUES("1","1","VB-N?i b?","../tnvb_uploads_2013/15e70dfc5deb06d2e3d44a349c2af777.jpg","2013-03-28 00:00:00","0","0","0");



DROP TABLE tbl_vbreplys;

CREATE TABLE `tbl_vbreplys` (
  `docreply_id` int(11) NOT NULL auto_increment,
  `doc_id` int(11) default '0',
  `docCat_id` varchar(250) default NULL,
  `docField_id` varchar(250) default NULL,
  `docreply_unit` varchar(250) default NULL,
  `docreply_code` varchar(250) default NULL,
  `docreply_desc` text,
  `docreply_direct` text COMMENT 'khong dung',
  `docreply_note` text COMMENT 'khong dung',
  `signPer_id` varchar(250) default NULL,
  `docreply_signed` date default NULL,
  `important_id` int(11) default '0' COMMENT 'khong dung',
  `docreply_limit_time` date default NULL COMMENT 'khong dung',
  `docreply_date` date default NULL,
  `user_id` int(11) default '0',
  `docreply_file` tinyint(4) default '2',
  PRIMARY KEY  (`docreply_id`),
  KEY `FK_tbl_docreplys` (`doc_id`),
  CONSTRAINT `FK_tbl_docreplys` FOREIGN KEY (`doc_id`) REFERENCES `tbl_vbs` (`doc_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO tbl_vbreplys VALUES("1","4","Công v?n","T? v?n, lên d? án","Phòng Hành chính - T? ch?c","N?i b?","V/v ch?n l?a nhân s? h?p tác gi?i quy?t v?n b?n s? 347/TT-HND","","","D??ng Vi?t Hùng","2013-03-21","0","","2013-03-21","14","1");
INSERT INTO tbl_vbreplys VALUES("2","8","","","","","","","","","1970-01-01","0","","2013-04-24","8","2");
INSERT INTO tbl_vbreplys VALUES("3","10","","","","","","","","","1970-01-01","0","","2013-04-24","29","2");



DROP TABLE tbl_vbs;

CREATE TABLE `tbl_vbs` (
  `doc_id` int(11) NOT NULL auto_increment COMMENT 'khoa chinh',
  `docin_id` int(11) default '0',
  `docout_id` int(11) default '0',
  `docCat_id` varchar(250) default NULL COMMENT 'loai van ban',
  `docField_id` varchar(250) default NULL COMMENT 'linh vuc',
  `doc_unit` varchar(250) default NULL,
  `department_id` int(11) default NULL COMMENT 'don vi phat hanh',
  `doc_code` varchar(250) default NULL COMMENT 'ky hieu',
  `doc_desc` text COMMENT 'trich yeu',
  `doc_direct` text COMMENT 'y kien chi dao',
  `doc_note` text COMMENT 'ghi chu',
  `doc_signed` datetime default NULL COMMENT 'ngay ky',
  `signPer_id` varchar(250) default NULL COMMENT 'nguoi ky',
  `important_id` int(11) default '0' COMMENT 'do khan',
  `secret_id` int(11) default '0' COMMENT 'do mat',
  `doc_date` datetime default NULL COMMENT 'ngay nhap',
  `doc_limit_time` date default NULL COMMENT 'han giai quyet',
  `doc_sort` int(11) default '0' COMMENT 'sap xep',
  `doc_active` tinyint(11) default '2' COMMENT 'tinh trang',
  `doc_file` tinyint(4) default '2' COMMENT 'tinh trang file',
  `user_id` int(11) default '0' COMMENT 'nguoi nhap',
  `doc_intype` tinyint(4) default '0' COMMENT 'kieu nhap: 0 - tay, 1 - vb den/di : hien tai ko dung',
  PRIMARY KEY  (`doc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

INSERT INTO tbl_vbs VALUES("1","5","0","Thông báo","Hành chính","Phòng Hành chính - T? ch?c","1","489","V/v t? ch?c cu?c g?p g? giao l?u gi?a 2 cty t?i Church Hotel Hàng Gai vào lúc: 18h00‘ ngày 10/10/2012","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng Hành chính gi?i quy?t.\n- Sao chuy?n các phòng ban khác bi?t và s?p x?p th?i gian","","2012-10-02 00:00:00","Nguy?n Quý H?u","1","1","2013-03-18 14:59:00","","0","2","2","14","0");
INSERT INTO tbl_vbs VALUES("3","16","0","Thông báo","Xây d?ng ph?n m?m","Phòng Hành chính - T? ch?c","1","257/TB-UBND","V/v thông báo gói th?u ph?n m?m qu?n lý Thi ?ua-khen th??ng tri?n khai cho phòng N?i V?.","","","1970-01-01 00:00:00","Nguy?n Phúc Quang","1","1","2013-03-19 09:18:00","","0","2","2","14","0");
INSERT INTO tbl_vbs VALUES("4","28","0","Thông tri","T? ch?c t? v?n cho nhân dân các huy?n trên ??a bàn Tp","Phòng Hành chính - T? ch?c","1","347/TT-HND","V/v Lên k? ho?ch t? ch?c h?i th?o h??ng nghi?p cho các huy?n, th? tr?n có d? án thu h?i ??t trên ??a bàn thành ph?","K/c ?/c giám ??c:\nÝ ki?n tham m?u:\nChuy?n ??n phòng th??ng binh lao ??ng xã h?i huy?n t? ch?c và ph?i h?p v?i các phòng ban có liên quan","","2013-03-07 00:00:00","Nguy?n Kh?c D?ng","1","1","2013-03-19 10:41:00","","0","2","2","14","0");
INSERT INTO tbl_vbs VALUES("5","27","0","Thông t?","L?p k? ho?ch t? ch?c ki?m tra","Phòng Hành chính - T? ch?c","1","668/TT-SGT","V/v T? ch?c l?p k? ho?ch ki?m tra thanh tra giao thông trên ??a bàn thành ph?","","","2013-03-05 00:00:00","Nguy?n H?ng S?n","1","1","2013-03-21 13:46:00","","0","2","2","14","0");
INSERT INTO tbl_vbs VALUES("6","25","0","Thông t?","L?p k? ho?ch ??u t? cho các t?nh phía nam","Phòng Hành chính - T? ch?c","1","679/TT-BCT","V/v L?p k? ho?ch ??u t? cho các t?nh thành phía nam trong n?m 2013","","","2013-03-04 00:00:00","Lâm Qu?c Hùng","1","1","2013-03-21 14:07:00","","0","2","2","14","0");
INSERT INTO tbl_vbs VALUES("7","1","0","Công v?n","Xây d?ng ph?n m?m","Chi nhánh 3 - Khánh hòa","4","2350","V/v xây d?ng ph?n m?m qu?n lý và ?i?u hành công vi?c v?n phòng.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng Kinh doanh ph? trách gi?i quy?t\n- Sao chuy?n phòng D? án và phòng K? thu?t ph?i h?p","","2012-10-02 00:00:00","Nguy?n Th? Th?o","1","1","2013-04-24 11:57:00","","0","2","2","26","0");
INSERT INTO tbl_vbs VALUES("8","2","0","Quy?t ??nh","T? v?n, lên d? án","Chi nhánh 3 - Khánh hòa","7","1249","Giao cho cty THA trách nhi?m t? v?n và lên d? án ??i v?i vi?c xây d?ng h? thông m?ng t?i s?.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phó giám ??c Nguy?n Quý H?u ph? trách.","","2012-10-02 00:00:00","Hoàng Duy Khanh","1","1","2013-04-24 11:58:00","","0","2","2","26","0");
INSERT INTO tbl_vbs VALUES("9","10","0","Công v?n","Xây d?ng ph?n m?m","Chi nhánh 3 - Khánh hòa","4","1345","V/v ?? ngh? cty THA c? ??i di?n ??n S? ?? cùng k?t h?p tri?n khai DVC tr?c tuy?n tích h?p trên c?ng thông tin S?.","Kính chuy?n ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n phòng K? thu?t ph? trách gi?i quy?t;\n- Sao chuy?n phòng Kinh doanh ph?i h?p.","","2012-10-04 00:00:00","Nguy?n Th? Hà Ninh","1","1","2013-04-24 12:00:00","","0","2","2","26","0");
INSERT INTO tbl_vbs VALUES("10","11","0","Công v?n","T? v?n, lên d? án","Phòng K? thu?t","11","12/CV-CKXL7","V/v ?? ngh? công ty THA c? ng??i t?i t? v?n l?p ??t h? th?ng m?ng n?i b? toàn b? công ty và các phân x??ng s?n xu?t.","Kính g?i ?/c giám ??c.\nÝ ki?n tham m?u:\n- Chuy?n ?/c phó giám ??c Nguy?n Quý H?u ph? trách.","","2013-02-19 00:00:00","Nguy?n Quang Tri?u","1","1","2013-04-24 12:53:00","","0","2","2","1","0");



DROP TABLE tbl_vttb_cats;

CREATE TABLE `tbl_vttb_cats` (
  `vttb_cat_id` int(11) NOT NULL auto_increment,
  `vttb_cat_name` varchar(250) default NULL,
  `vttb_cat_ununicode` varchar(250) default NULL,
  `vttb_cat_date` date default NULL,
  `vttb_cat_sort` int(11) default '0',
  `vttb_cat_active` tinyint(1) default '1',
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`vttb_cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO tbl_vttb_cats VALUES("1","V?t t? thi?t b?","Vat tu thiet bi","2013-04-18","0","1","1");
INSERT INTO tbl_vttb_cats VALUES("2","C? s? v?t ch?t","Co so vat chat","2013-04-18","0","1","1");
INSERT INTO tbl_vttb_cats VALUES("3","Ph??ng ti?n","Phuong tien","2013-04-18","0","1","1");
INSERT INTO tbl_vttb_cats VALUES("5","Các lo?i khác","Cac loai khac","2013-04-21","","1","1");



DROP TABLE tbl_vttb_datlichs;

CREATE TABLE `tbl_vttb_datlichs` (
  `vttb_datlich_id` int(11) NOT NULL auto_increment,
  `vttb_id` int(11) default NULL,
  `vttb_datlich_name` varchar(250) default NULL,
  `vttb_datlich_start` datetime default NULL,
  `vttb_datlich_end` datetime default NULL,
  `vttb_datlich_date` date default NULL,
  `vttb_datlich_cost` int(11) default '0',
  `user_id` int(11) default '0',
  PRIMARY KEY  (`vttb_datlich_id`),
  KEY `FK_tbl_vttb_datlichs` (`vttb_id`),
  CONSTRAINT `FK_tbl_vttb_datlichs` FOREIGN KEY (`vttb_id`) REFERENCES `tbl_vttbs` (`vttb_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO tbl_vttb_datlichs VALUES("1","3","T? ch?c h?p t?ng k?t ho?t ??ng cty trong quý I n?m 2013.","2013-04-25 08:30:00","2013-04-25 11:30:00","","0","14");
INSERT INTO tbl_vttb_datlichs VALUES("3","3","T? ch?c liên hoan cty m?ng ngày 30/04 và 01/05.","2013-04-27 15:30:00","2013-04-27 17:30:00","","0","14");



DROP TABLE tbl_vttb_repares;

CREATE TABLE `tbl_vttb_repares` (
  `vttb_repare_id` int(11) NOT NULL auto_increment,
  `vttb_id` int(11) default NULL COMMENT 'khoa ngoai',
  `vttb_repare_name` varchar(250) default NULL COMMENT 'noi dung',
  `vttb_repare_cost` int(11) default NULL COMMENT 'chi phi',
  `vttb_repare_paid_type` tinyint(1) default '1' COMMENT 'hinh thuc thanh toan: 1-tien mat; 2-cong no',
  `vttb_repare_date` date default NULL COMMENT 'ngay sua chua',
  `vttb_repare_code` varchar(50) default NULL COMMENT 'ma phieu',
  `vttb_repare_unit` varchar(250) default NULL COMMENT 'don vi sua chua',
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`vttb_repare_id`),
  KEY `FK_tbl_vttb_repares` (`vttb_id`),
  CONSTRAINT `FK_tbl_vttb_repares` FOREIGN KEY (`vttb_id`) REFERENCES `tbl_vttbs` (`vttb_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO tbl_vttb_repares VALUES("1","1","S?a màn hình","550000","2","2012-02-25","0025/PT-TM","Cty CP Tech-mart","18");
INSERT INTO tbl_vttb_repares VALUES("3","1","S?a bàn phím","300000","2","2013-02-24","0072/PT-TM","Cty CP Tech-mart","18");



DROP TABLE tbl_vttb_replaces;

CREATE TABLE `tbl_vttb_replaces` (
  `vttb_replace_id` int(11) NOT NULL auto_increment,
  `vttb_id` int(11) default NULL COMMENT 'khoa ngoai',
  `vttb_replace_name` varchar(250) default NULL COMMENT 'noi dung',
  `vttb_replace_cost` int(11) default NULL COMMENT 'chi phi',
  `vttb_replace_paid_type` tinyint(1) default '1' COMMENT 'hinh thuc thanh toan: 1-tien mat; 2-cong no',
  `vttb_replace_date` date default NULL COMMENT 'ngay thay the',
  `vttb_replace_code` varchar(50) default NULL COMMENT 'ma phieu',
  `vttb_replace_unit` varchar(250) default NULL COMMENT 'don vi thuc hien',
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`vttb_replace_id`),
  KEY `FK_tbl_vttb_replaces` (`vttb_id`),
  CONSTRAINT `FK_tbl_vttb_replaces` FOREIGN KEY (`vttb_id`) REFERENCES `tbl_vttbs` (`vttb_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO tbl_vttb_replaces VALUES("1","1","Thay ? c?ng","800000","2","2013-01-12","0052/PT-TM","Cty CP Tech-mart","18");



DROP TABLE tbl_vttb_subs;

CREATE TABLE `tbl_vttb_subs` (
  `vttb_sub_id` int(11) NOT NULL auto_increment,
  `vttb_cat_id` int(11) default NULL,
  `vttb_sub_name` varchar(250) default NULL,
  `vttb_sub_ununicode` varchar(250) default NULL,
  `vttb_sub_type` tinyint(1) default '1' COMMENT '1: chi dinh su dung, 2: dat lich su dung',
  `vttb_sub_date` date default NULL,
  `vttb_sub_sort` int(11) default '0',
  `vttb_sub_active` tinyint(1) default '1',
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`vttb_sub_id`),
  KEY `FK_tbl_vttb_subs` (`vttb_cat_id`),
  CONSTRAINT `FK_tbl_vttb_subs` FOREIGN KEY (`vttb_cat_id`) REFERENCES `tbl_vttb_cats` (`vttb_cat_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

INSERT INTO tbl_vttb_subs VALUES("1","2","Phòng h?p, h?i tr??ng","Phong hop, hoi truong","2","2013-04-21","","1","1");
INSERT INTO tbl_vttb_subs VALUES("2","2","Nhà kho","Nha kho","2","2013-04-21","0","1","1");
INSERT INTO tbl_vttb_subs VALUES("3","3","Xe oto con","Xe oto con","2","2013-04-21","0","1","1");
INSERT INTO tbl_vttb_subs VALUES("4","3","Xe t?i, bán t?i","Xe tai, ban tai","2","2013-04-21","0","1","1");
INSERT INTO tbl_vttb_subs VALUES("5","1","Máy vi tính","May vi tinh","1","2013-04-21","","1","1");
INSERT INTO tbl_vttb_subs VALUES("6","1","Thi?t b? in ?n, quét, sao chép","Thiet bi in an, quet, sao chep","1","2013-04-21","","1","1");
INSERT INTO tbl_vttb_subs VALUES("8","1","?i?n tho?i, Fax","Dien thoai, Fax","1","2013-04-21","0","1","1");
INSERT INTO tbl_vttb_subs VALUES("9","1","Thi?t b? trình chi?u, quay, ch?p","Thiet bi trinh chieu, quay, chup","1","2013-04-21","0","1","1");
INSERT INTO tbl_vttb_subs VALUES("10","5","Thi?t b? v? sinh","Thiet bi ve sinh","1","2013-04-22","","1","1");
INSERT INTO tbl_vttb_subs VALUES("11","5","?un n?u, l?u tr? th?c ph?m","Dun nau, luu tru thuc pham","1","2013-04-22","","1","1");
INSERT INTO tbl_vttb_subs VALUES("12","5","Thi?t b? chi?u sáng","Thiet bi chieu sang","1","2013-04-21","0","1","1");
INSERT INTO tbl_vttb_subs VALUES("13","1","Máy ch? và thi?t b? liên quan","May chu va thiet bi lien quan","1","2013-04-22","0","1","1");



DROP TABLE tbl_vttbs;

CREATE TABLE `tbl_vttbs` (
  `vttb_id` int(11) NOT NULL auto_increment,
  `vttb_sub_id` int(11) default NULL COMMENT 'khoa ngoai',
  `vttb_name` varchar(250) default NULL COMMENT 'ten vttb',
  `vttb_desc` varchar(250) default NULL COMMENT 'mo ta',
  `vttb_commission` date default NULL COMMENT 'hoat dong tu ngay',
  `vttb_limit` date default NULL COMMENT 'han phuc vu',
  `vttb_decommission` date default NULL COMMENT 'dung hoat dong ngay',
  `vttb_cost` int(11) default '0' COMMENT 'chi phi',
  `vttb_useby` int(11) default '0' COMMENT 'duoc dung boi',
  `vttb_date` date default NULL,
  `vttb_sort` int(11) default '0',
  `vttb_active` tinyint(1) default '1' COMMENT 'tinh trang',
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`vttb_id`),
  KEY `FK_tbl_vttbs` (`vttb_sub_id`),
  CONSTRAINT `FK_tbl_vttbs` FOREIGN KEY (`vttb_sub_id`) REFERENCES `tbl_vttb_subs` (`vttb_sub_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO tbl_vttbs VALUES("1","5","Lap-001","Laptop: Emachines (Core-I3, 160GB)","2010-01-01","2015-01-01","0000-00-00","10000000","18","2013-04-24","","1","1");
INSERT INTO tbl_vttbs VALUES("2","5","Lap-002","Laptop Dell (160GB, Ram 2GB)","2011-01-01","2016-01-01","0000-00-00","6500000","10","2013-04-24","0","1","1");
INSERT INTO tbl_vttbs VALUES("3","1","Phòng h?p s? 1","Phòng h?p trên t?ng 3, khu v?n phòng","2008-01-01","2023-01-01","0000-00-00","683000000","0","2013-04-24","0","1","1");
INSERT INTO tbl_vttbs VALUES("4","1","Phòng h?p s? 2","Phòng h?p trên t?ng 2, khu v?n phòng","2008-01-01","2023-01-01","0000-00-00","400000000","0","2013-04-24","0","1","1");
INSERT INTO tbl_vttbs VALUES("5","2","Kho 01-GL","Kho thuê h?n 7 n?m t?i Gia Lâm, Hà N?i","2008-01-01","2015-01-01","0000-00-00","840000000","0","2013-04-24","0","1","1");



