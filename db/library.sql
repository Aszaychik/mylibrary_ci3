-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: db_library
-- ------------------------------------------------------
-- Server version	10.4.27-MariaDB

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
  `id` varchar(100) NOT NULL DEFAULT uuid(),
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
  `id` varchar(100) NOT NULL DEFAULT uuid(),
  `author` varchar(100) DEFAULT NULL,
  `publisher` varchar(100) DEFAULT NULL,
  `id_genre` varchar(100) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `publish_year` varchar(4) DEFAULT NULL,
  `thumb` varchar(100) DEFAULT NULL,
  `date` int(11) NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_books`
--

LOCK TABLES `tb_books` WRITE;
/*!40000 ALTER TABLE `tb_books` DISABLE KEYS */;
INSERT INTO `tb_books` VALUES ('03930125-7c24-11ed-ae79-8030499c85f7','Agus wibu','Garena','1','Java sangat menyenangkan','100','download_(4).jpeg',1671072964,94,'Vivamus himenaeos pede pellentesque turpis volutpat congue montes enim tincidunt commodo fermentum venenatis urna proin ornare euismod fringilla ultrices parturient'),('2c93a42b-7c26-11ed-ae79-8030499c85f7','Orochimaru','Elex media','1','10 Dosa besar hiruzen','2007','images_(3).jpeg',1671073892,NULL,NULL),('306fd63f-7c25-11ed-ae79-8030499c85f7','Jhone doe','Elex media','1','Java sangat Sulit ','2001','download_(5).jpeg',1671073469,NULL,NULL),('567d445a-7c24-11ed-ae79-8030499c85f7','Jhone doe','Garena','1','Ayo belajar java','2010','download_(3).jpeg',1671073103,NULL,NULL),('5aaca889-7c25-11ed-ae79-8030499c85f7','Jhone doe','Elex media','1','Filosofi Belajar Java','2001','download.jpeg',1671073540,NULL,NULL),('7fec2437-7c25-11ed-ae79-8030499c85f7','Alok','Moonton','1','Java adalah kunci','2017','download_(2).jpeg',1671073602,NULL,NULL),('9c1fdd43-7c25-11ed-ae79-8030499c85f7','Mukliss','Garena','1','Mengapa belajar java?','2001','images.jpeg',1671073649,0,''),('ae9a28fc-72f1-11ed-85c7-1570f26e4f41','Muklis','Garena','1','Java sangat mudah','2002','download_(1).jpeg',1670061786,800,'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Unde consequatur blanditiis nemo dolore aliquam minus ab cupiditate at iure excepturi, eius nihil hic quam? Soluta iste nostrum possimus obcaecati tenetur?'),('dc95dcf1-7c25-11ed-ae79-8030499c85f7','Abdul Kadir','Sinar Bulan','1','Pentingnya belajar java GUI','2001','images_(1)1.jpeg',1671073757,NULL,NULL),('f10929a9-7bc4-11ed-b649-0a0027000013','Adolf Hitler','Franz Eher Nachfolger GmbH','1','Mein Kampf','1925','download_(8)1.jpeg',1676969420,7,'Mein Kampf is the autobiography and political treatise of German dictator Adolf Hitler. The title of the book translates to “My Struggle” in German. Published in 1925, the book contains two volumes and was mostly written during Hitler’s imprisonment following his failed Munich Putsch coup attempt in 1923. The book contains details about the Nazi leader’s early life and outlines his political ideology and plans for Germany’s future. The book was very popular during the Third Reich, the period during which Hitler ruled Germany. After his death in 1945, however, the state of Bavaria banned the book and it was not published in Germany again until 2016. The book remains deeply controversial today due to its anti-Semitic content.'),('ffc3d441-7c25-11ed-ae79-8030499c85f7','Surya Purnama','Garena','1','Kenapa java itu sangat menyenangkan','2001','images_(2)1.jpeg',1671073817,NULL,NULL);
/*!40000 ALTER TABLE `tb_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_borrowing`
--

DROP TABLE IF EXISTS `tb_borrowing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_borrowing` (
  `id` varchar(100) NOT NULL DEFAULT uuid(),
  `id_book` varchar(100) NOT NULL,
  `borrow_date` bigint(20) NOT NULL,
  `returning_date` bigint(20) NOT NULL,
  `qty` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `mobile_phone` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `status` varchar(10) DEFAULT 'borrowing',
  PRIMARY KEY (`id`),
  KEY `fk_borrowing_books` (`id_book`),
  CONSTRAINT `fk_borrowing_books` FOREIGN KEY (`id_book`) REFERENCES `tb_books` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_borrowing`
--

LOCK TABLES `tb_borrowing` WRITE;
/*!40000 ALTER TABLE `tb_borrowing` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_borrowing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_genres`
--

DROP TABLE IF EXISTS `tb_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_genres` (
  `id` varchar(100) NOT NULL DEFAULT uuid(),
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
  `id` varchar(100) NOT NULL DEFAULT uuid(),
  `id_book` varchar(100) NOT NULL,
  `id_borrowing` varchar(100) NOT NULL,
  `late_fee` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_returning_book` (`id_book`),
  KEY `fk_returning_borrowing` (`id_borrowing`),
  CONSTRAINT `fk_returning_book` FOREIGN KEY (`id_book`) REFERENCES `tb_books` (`id`),
  CONSTRAINT `fk_returning_borrowing` FOREIGN KEY (`id_borrowing`) REFERENCES `tb_borrowing` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_returning`
--

LOCK TABLES `tb_returning` WRITE;
/*!40000 ALTER TABLE `tb_returning` DISABLE KEYS */;
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

-- Dump completed on 2022-12-23 20:13:58
