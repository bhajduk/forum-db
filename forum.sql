-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: forum
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Pierwsza kategoria','Opis pierwszej kategorii'),(2,'Druga kategoria','Opis drugiej kategorii'),(3,'Trzecia kategoria','Opis trzeciej kategorii'),(4,'Czwarta kategoria','Opis czwartej kategorii'),(5,'Kategoria 1','Lorem ipsum dolor sit amet');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `post_id` int NOT NULL AUTO_INCREMENT,
  `subcategory_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content` text,
  `date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `subcategory_id` (`subcategory_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE SET NULL,
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategory` (`subcategory_id`) ON DELETE SET NULL,
  CONSTRAINT `post_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,1,1,'Tytul postu','Lorem ipsum dolor sit amet','2009-01-05 11:15:33'),(2,1,2,'Tytul postu','Nowa tresc postu lorem ipsum dolor sit amet','2009-04-03 15:00:01'),(3,2,3,'Tytul postu','Lorem ipsum dolor sit amet','2010-08-22 11:11:32'),(4,2,4,'Tytul postu','Lorem ipsum dolor sit amet','2010-12-01 14:09:11'),(5,3,5,'Tytul postu','Lorem ipsum dolor sit amet','2011-02-09 15:31:21'),(6,3,3,'Tytul postu','Lorem ipsum dolor sit amet','2012-01-22 08:00:01'),(7,4,1,'Tytul postu','Lorem ipsum dolor sit amet','2013-07-02 22:44:01'),(8,4,4,'Tytul postu','Lorem ipsum dolor sit amet','2014-10-11 02:14:01'),(9,5,2,'Tytul postu','Lorem ipsum dolor sit amet','2014-11-01 18:00:39'),(10,5,5,'Tytul postu','Lorem ipsum dolor sit amet','2015-01-17 17:02:12'),(11,6,1,'Tytul postu','Lorem ipsum dolor sit amet','2016-09-08 04:08:01'),(12,6,3,'Tytul postu','Lorem ipsum dolor sit amet','2016-11-21 08:30:41'),(13,7,2,'Tytul postu','Lorem ipsum dolor sit amet','2016-11-23 09:00:42'),(14,7,5,'Tytul postu','Lorem ipsum dolor sit amet','2019-01-11 12:13:13'),(15,8,4,'Tytul postu','Lorem ipsum dolor sit amet','2020-03-12 16:16:31'),(16,8,2,'Tytul postu','Lorem ipsum dolor sit amet','2020-04-01 20:17:03');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategory` (
  `subcategory_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`subcategory_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `subcategory_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategory`
--

LOCK TABLES `subcategory` WRITE;
/*!40000 ALTER TABLE `subcategory` DISABLE KEYS */;
INSERT INTO `subcategory` VALUES (1,1,'Pierwsza podkategoria w kategorii 1','Opis pierwszej podkategorii'),(2,1,'Druga podkategoria w kategrii 1','Opis drugiej podkategorii'),(3,2,'Pierwsza podkategoria w kategorii 2','Opis pierwszej podkategorii'),(4,2,'Druga podkategoria w kategrii 2','Opis drugiej podkategorii'),(5,3,'Pierwsza podkategoria w kategorii 3','Opis pierwszej podkategorii'),(6,3,'Druga podkategoria w kategrii 3','Opis drugiej podkategorii'),(7,4,'Pierwsza podkategoria w kategorii 4','Opis pierwszej podkategorii'),(8,4,'Druga podkategoria w kategrii 4','Opis drugiej podkategorii');
/*!40000 ALTER TABLE `subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `nick` varchar(10) DEFAULT NULL,
  `passwd` varchar(30) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'bhaj','qwerty','bhaj@mail.com','Poland'),(2,'ahac','zaq12wsx','ahac@mail.com','Poland'),(3,'jkow','zxcv','jkow@mail.com','UK'),(4,'anow','poiuyt','anow@mail.com','UK'),(5,'snab','sdund','snab@mail.com','Germany');
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

-- Dump completed on 2020-05-29 14:23:06
