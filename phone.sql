-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cmenu`
--

DROP TABLE IF EXISTS `cmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `pSlot` int(4) NOT NULL,
  `pLastSkin` int(11) NOT NULL DEFAULT 0,
  `pLastPosX` float NOT NULL DEFAULT 2495.35,
  `pLastPosY` float NOT NULL DEFAULT -1688.23,
  `pLastPosZ` float NOT NULL DEFAULT 13.6774,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cmenu`
--

LOCK TABLES `cmenu` WRITE;
/*!40000 ALTER TABLE `cmenu` DISABLE KEYS */;
/*!40000 ALTER TABLE `cmenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contects`
--

DROP TABLE IF EXISTS `contects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Cname` varchar(25) NOT NULL,
  `Cnumber` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contects`
--

LOCK TABLES `contects` WRITE;
/*!40000 ALTER TABLE `contects` DISABLE KEYS */;
/*!40000 ALTER TABLE `contects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music`
--

DROP TABLE IF EXISTS `music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `music` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `songName` varchar(20) NOT NULL,
  `songUrl` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music`
--

LOCK TABLES `music` WRITE;
/*!40000 ALTER TABLE `music` DISABLE KEYS */;
INSERT INTO `music` VALUES (2,'Up down funk','http://localhost/songs/updownfunk.mp3'),(3,'Power Hitz','https://live.powerhitz.com/hot108?esPlayer&cb=717441.mp3'),(4,'Hits radio','https://24503.live.streamtheworld.com/977_HITS.mp3'),(5,'Panjabi ','https://stream-60.zeno.fm/1k0y9f0cm0quv?zs=tX44i_SuTKmXfkoxKyoFiA'),(6,'MooseWala station','https://stream-054.zeno.fm/e5hahqs7twzuv?zs=y-2VId-uTt6Uck-4DS5EJw'),(7,'Hip hop bollywooed','https://stream-073.zeno.fm/dgrgdv2zrf9uv?zs=_brP037oSBa17JqQ1fUN1Q'),(8,'hitlist','http://66.85.88.174:80/hitlist'),(9,'horizon FM','http://hzgaming.net/horizonfm/radio.pls');
/*!40000 ALTER TABLE `music` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone`
--

DROP TABLE IF EXISTS `phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ownerid` int(11) NOT NULL,
  `phx` float NOT NULL DEFAULT 492,
  `phy` float NOT NULL DEFAULT 187,
  `bg` varchar(25) NOT NULL DEFAULT 'mdl-1005:background',
  `apmode` int(2) NOT NULL DEFAULT 0,
  `modelid` int(10) NOT NULL DEFAULT -1008,
  `boneid` tinyint(1) DEFAULT 6,
  `pos_x` float DEFAULT NULL,
  `pos_y` float DEFAULT NULL,
  `pos_z` float DEFAULT NULL,
  `rot_x` float DEFAULT NULL,
  `rot_y` float DEFAULT NULL,
  `rot_z` float DEFAULT NULL,
  `scale_x` float DEFAULT 1,
  `scale_y` float DEFAULT 1,
  `scale_z` float DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone`
--

LOCK TABLES `phone` WRITE;
/*!40000 ALTER TABLE `phone` DISABLE KEYS */;
INSERT INTO `phone` VALUES (1,0,500,200,'mdl-1005:background5',0,-1008,6,0,0,0,0,0,0,1,1,1);
/*!40000 ALTER TABLE `phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pName` varchar(32) NOT NULL,
  `hasphone` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'nicks',0),(2,'nicks',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-07 20:05:21
