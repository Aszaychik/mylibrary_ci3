-- MariaDB dump 10.19  Distrib 10.4.25-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: db_library
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `tb_admins`
--

DROP TABLE IF EXISTS `tb_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_admins` (
  `id` varchar(100) NOT NULL DEFAULT (uuid()),
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_admins`
--

LOCK TABLES `tb_admins` WRITE;
/*!40000 ALTER TABLE `tb_admins` DISABLE KEYS */;
INSERT INTO `tb_admins` VALUES ('c4f7ff34-70ac-11ed-a495-b9e03878af06','admin','admin');
/*!40000 ALTER TABLE `tb_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_books`
--

DROP TABLE IF EXISTS `tb_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_books` (
  `id` varchar(100) NOT NULL DEFAULT (uuid()),
  `author` varchar(100) DEFAULT NULL,
  `publisher` varchar(100) DEFAULT NULL,
  `id_genre` varchar(100) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `publish_year` varchar(4) DEFAULT NULL,
  `thumb` varchar(100) DEFAULT NULL,
  `date` int NOT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_books`
--

LOCK TABLES `tb_books` WRITE;
/*!40000 ALTER TABLE `tb_books` DISABLE KEYS */;
INSERT INTO `tb_books` VALUES ('ae9a28fc-72f1-11ed-85c7-1570f26e4f41','Muklis','Garena','1','Java sangat mudah','2002','',1670061786,800);
/*!40000 ALTER TABLE `tb_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_borrowing`
--

DROP TABLE IF EXISTS `tb_borrowing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_borrowing` (
  `id` varchar(100) NOT NULL DEFAULT (uuid()),
  `id_book` varchar(100) NOT NULL,
  `borrow_date` int NOT NULL,
  `returning_date` int NOT NULL,
  `qty` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `mobile_phone` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `status` varchar(10) DEFAULT 'borrowing',
  PRIMARY KEY (`id`),
  KEY `fk_borrowing_books` (`id_book`),
  CONSTRAINT `fk_borrowing_books` FOREIGN KEY (`id_book`) REFERENCES `tb_books` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_borrowing`
--

LOCK TABLES `tb_borrowing` WRITE;
/*!40000 ALTER TABLE `tb_borrowing` DISABLE KEYS */;
INSERT INTO `tb_borrowing` VALUES ('3abb6abb-73db-11ed-8226-cb08c4c1791c','ae9a28fc-72f1-11ed-85c7-1570f26e4f41',1670162094,1670766894,2,'MOCHAMMAD FAJRIN','0881219021','MENDALAN','returned'),('51e01d10-73db-11ed-8226-cb08c4c1791c','ae9a28fc-72f1-11ed-85c7-1570f26e4f41',1670162133,1670766933,11,'MOCHAMMAD FAJRIN','22','MENDALAN','returned'),('73c734ca-7439-11ed-8f1e-4edf74a7e790','ae9a28fc-72f1-11ed-85c7-1570f26e4f41',1670202562,1670807362,100,'MOCHAMMAD FAJRIN','0881219021','MENDALAN','borrowing'),('8fea773d-73d3-11ed-8226-cb08c4c1791c','ae9a28fc-72f1-11ed-85c7-1570f26e4f41',1670158801,1670763601,10,'MOCHAMMAD FAJRIN','21212121','MENDALAN','returned'),('c5b149f1-73dc-11ed-8226-cb08c4c1791c','ae9a28fc-72f1-11ed-85c7-1570f26e4f41',1670162757,1670767557,100,'MOCHAMMAD FAJRIN','0881219021','MENDALAN','returned'),('c74c3fdb-73da-11ed-8226-cb08c4c1791c','ae9a28fc-72f1-11ed-85c7-1570f26e4f41',1670161900,1670766700,11,'MOCHAMMAD FAJRIN','11','MENDALAN','returned'),('e7327ba5-73db-11ed-8226-cb08c4c1791c','ae9a28fc-72f1-11ed-85c7-1570f26e4f41',1670162383,1670767183,555,'MOCHAMMAD FAJRIN','555','MENDALAN','returned');
/*!40000 ALTER TABLE `tb_borrowing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_genres`
--

DROP TABLE IF EXISTS `tb_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_genres` (
  `id` varchar(100) NOT NULL DEFAULT (uuid()),
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_genres`
--

LOCK TABLES `tb_genres` WRITE;
/*!40000 ALTER TABLE `tb_genres` DISABLE KEYS */;
INSERT INTO `tb_genres` VALUES ('1','education'),('2','Sci-fi');
/*!40000 ALTER TABLE `tb_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_returning`
--

DROP TABLE IF EXISTS `tb_returning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_returning` (
  `id` varchar(100) NOT NULL DEFAULT (uuid()),
  `id_book` varchar(100) NOT NULL,
  `id_borrowing` varchar(100) NOT NULL,
  `late_fee` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_returning_book` (`id_book`),
  KEY `fk_returning_borrowing` (`id_borrowing`),
  CONSTRAINT `fk_returning_book` FOREIGN KEY (`id_book`) REFERENCES `tb_books` (`id`),
  CONSTRAINT `fk_returning_borrowing` FOREIGN KEY (`id_borrowing`) REFERENCES `tb_borrowing` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_returning`
--

LOCK TABLES `tb_returning` WRITE;
/*!40000 ALTER TABLE `tb_returning` DISABLE KEYS */;
INSERT INTO `tb_returning` VALUES ('a6ce1248-73dc-11ed-8226-cb08c4c1791c','ae9a28fc-72f1-11ed-85c7-1570f26e4f41','3abb6abb-73db-11ed-8226-cb08c4c1791c',2001),('a9d8f103-73dc-11ed-8226-cb08c4c1791c','ae9a28fc-72f1-11ed-85c7-1570f26e4f41','51e01d10-73db-11ed-8226-cb08c4c1791c',2001),('ac91fdb1-73dc-11ed-8226-cb08c4c1791c','ae9a28fc-72f1-11ed-85c7-1570f26e4f41','8fea773d-73d3-11ed-8226-cb08c4c1791c',2001),('af4d0350-73dc-11ed-8226-cb08c4c1791c','ae9a28fc-72f1-11ed-85c7-1570f26e4f41','c74c3fdb-73da-11ed-8226-cb08c4c1791c',2001),('b2108834-73dc-11ed-8226-cb08c4c1791c','ae9a28fc-72f1-11ed-85c7-1570f26e4f41','e7327ba5-73db-11ed-8226-cb08c4c1791c',2001),('cc88cb2c-73dc-11ed-8226-cb08c4c1791c','ae9a28fc-72f1-11ed-85c7-1570f26e4f41','c5b149f1-73dc-11ed-8226-cb08c4c1791c',2001);
/*!40000 ALTER TABLE `tb_returning` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-05  8:41:34
