-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: shoponline
-- ------------------------------------------------------
-- Server version	8.0.13

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
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `card` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `orderstatus_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `item_id` bigint(20) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2ed9frcrusvd3w7xu4yjmblyw` (`orderstatus_id`),
  KEY `FK_bghvg4xo76su71a9k40s0rplq` (`user_id`),
  KEY `FK_i4t4slhnllw4mcajo3lifcaf5` (`item_id`),
  CONSTRAINT `FK_2ed9frcrusvd3w7xu4yjmblyw` FOREIGN KEY (`orderstatus_id`) REFERENCES `orderstatus` (`id`),
  CONSTRAINT `FK_bghvg4xo76su71a9k40s0rplq` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_i4t4slhnllw4mcajo3lifcaf5` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
INSERT INTO `card` VALUES (125,'nguyenvanb','2020-06-25 18:18:03','nguyenvanb','2020-06-25 18:18:14',1,3,6990000,2,3),(126,'nguyenvanb','2020-06-25 18:18:17','nguyenvanb','2020-06-25 18:22:14',1,3,16990000,1,3),(127,'nguyenvanb','2020-06-25 18:22:31','nguyenvanb','2020-06-25 18:22:36',1,3,13990000,3,3);
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'admin','2020-06-18 16:40:52','admin','2020-06-18 16:40:52','samsung','samsung','image/samsung_s7_edge.jpg'),(2,'admin','2020-06-20 14:40:58','admin','2020-06-20 14:40:58','sony','sony','image/sony_xperi_l4.jpg'),(3,'admin','2020-06-20 14:41:31','admin','2020-06-20 14:41:31','apple','apple','image/iPhone-11-4.jpg'),(4,'admin','2020-06-20 14:46:56','admin','2020-06-20 14:46:56','oppo','oppo','image/oppo-a12-64gb.jpg'),(5,'admin','2020-06-20 14:47:52','admin','2020-06-20 14:47:52','nokia','nokia','image/nokia-83-5g-1.jpg');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `content` text,
  `description` text,
  `name` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_o4nr676s6g7eokrjsmt7ujs2p` (`category_id`),
  CONSTRAINT `FK_o4nr676s6g7eokrjsmt7ujs2p` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'admin','2020-06-20 14:53:37','admin','2020-06-20 14:53:37','','Bộ sản phẩm gồm: Sạc,Tai nghe,Sách hướng dẫn,Hộp,Cây lấy sim,Ốp lưng,Cáp','Samsung Galaxy S20+',16990000,'image/samsung-galaxy-s20-plus.jpg',1),(2,'admin','2020-06-20 15:08:49','admin','2020-06-20 15:08:49','','Báº£o hÃ nh chÃ­nh hÃ£ng 12 thÃ¡ng.','Samsung Galaxy A21s (6GB/64GB)',6990000,'image/Samsung_Galaxy_A21s.jpg',1),(3,'admin','2020-06-20 15:09:55','admin','2020-06-20 15:09:55','','Bá» sáº£n pháº©m gá»m: Há»p, Sáº¡c, Tai nghe, SÃ¡ch hÆ°á»ng dáº«n, CÃ¡p, CÃ¢y láº¥y sim, á»p lÆ°ng, Adapter chuyá»n USB','Samsung Galaxy S10+',13990000,'image/Samsung_Galaxy_S10+.jpg',1),(4,'admin','2020-06-20 15:37:26','admin','2020-06-20 15:37:26','','\r\n','Sony Xperia 5',17990000,'image/Sony_Xperia_5.jpg',2),(5,'admin','2020-06-20 15:38:25','admin','2020-06-20 15:38:25','','\r\n','Sony Xperia 1',19990000,'image/Sony_Xperia_1.jpg',2),(6,'admin','2020-06-20 15:40:28','admin','2020-06-20 15:40:28','','\r\n','SONY XPERIA XZ3',7990000,'image/SONY_XPERIA_XZ3.jpg',2),(7,'admin','2020-06-20 15:42:17','admin','2020-06-20 15:42:17','','\r\n','iPhone 11 64GB',19490000,'image/iPhone_11_64GB.jpg',3),(8,'admin','2020-06-20 15:43:23','admin','2020-06-20 15:43:23','','\r\n','iPhone 11 Pro Max 512GB',39990000,'image/iPhone_11_Pro_Max_512GB.jpg',3),(9,'admin','2020-06-20 15:45:47','admin','2020-06-20 15:45:47','','\r\n','iPhone Xs Max 256GB',25990000,'image/iPhone_Xs_Max_256GB.jpg',3),(10,'admin','2020-06-20 15:48:10','admin','2020-06-20 15:48:10','','\r\n','OPPO Find X2',19990000,'image/OPPO_Find_X2.jpg',4),(11,'admin','2020-06-20 15:49:29','admin','2020-06-20 15:49:29','','\r\n','OPPO Reno3 Pro',13990000,'image/OPPO_Reno3_Pro.jpg',4),(12,'admin','2020-06-20 15:51:34','admin','2020-06-20 15:51:34','','\r\n','OPPO A92',6990000,'image/OPPO_A92.jpg',4),(13,'admin','2020-06-20 15:53:41','admin','2020-06-20 15:53:41','','\r\n','nokia 6',6990000,'image/nokia_6.jpg',5),(14,'admin','2020-06-20 15:56:20','admin','2020-06-20 15:56:20','','\r\n','nokia 8.2',12990000,'image/nokia_8.2.jpg',5),(15,'admin','2020-06-20 15:57:13','admin','2020-06-20 15:57:13','','\r\n','nokia C1',10990000,'image/nokia_c1.jpg',5);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderstatus`
--

DROP TABLE IF EXISTS `orderstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orderstatus` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderstatus`
--

LOCK TABLES `orderstatus` WRITE;
/*!40000 ALTER TABLE `orderstatus` DISABLE KEYS */;
INSERT INTO `orderstatus` VALUES (1,NULL,NULL,NULL,NULL,'preorder','preorder',NULL),(2,NULL,NULL,NULL,NULL,'waiting','waiting',NULL),(3,NULL,NULL,NULL,NULL,'shiping','shiping',NULL),(4,NULL,NULL,NULL,NULL,'complete','complete',NULL),(5,NULL,NULL,NULL,NULL,'failing','failing',NULL);
/*!40000 ALTER TABLE `orderstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,NULL,NULL,NULL,NULL,'ADMIN','Quản trị'),(2,NULL,NULL,NULL,NULL,'USER','Người dùng');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,NULL,NULL,NULL,NULL,'Phạm Thanh Tâm','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG',1,'admin'),(2,NULL,NULL,NULL,NULL,'nguyễn văn A','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG',1,'nguyenvana'),(3,NULL,NULL,NULL,NULL,'nguyễn văn B','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG',1,'nguyenvanb'),(4,NULL,NULL,NULL,NULL,'nguyễn văn C','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG',1,'nguyenvanc');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_role` (
  `userid` bigint(20) NOT NULL,
  `roleid` bigint(20) NOT NULL,
  KEY `FK_jpkvqqgndeonhr2alguthv64e` (`roleid`),
  KEY `FK_jwv62hhuqojjk7pot7kaex3e1` (`userid`),
  CONSTRAINT `FK_jpkvqqgndeonhr2alguthv64e` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`),
  CONSTRAINT `FK_jwv62hhuqojjk7pot7kaex3e1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1),(2,1),(2,2),(3,2),(4,2);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'shoponline'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-28 17:02:56
