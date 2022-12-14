-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping data for table db_library.tb_admins: ~0 rows (approximately)
DELETE FROM `tb_admins`;
INSERT INTO `tb_admins` (`id`, `username`, `password`) VALUES
	('c4f7ff34-70ac-11ed-a495-b9e03878af06', 'admin', 'admin');

-- Dumping data for table db_library.tb_books: ~0 rows (approximately)
DELETE FROM `tb_books`;
INSERT INTO `tb_books` (`id`, `author`, `publisher`, `id_genre`, `title`, `publish_year`, `thumb`, `date`, `stock`, `description`) VALUES
	('ae9a28fc-72f1-11ed-85c7-1570f26e4f41', 'Muklis', 'Garena', '1', 'Java sangat mudah', '2002', '83e8872c-9aa0-48ee-a2ee-85177abed344.jpg', 1670061786, 800, 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Unde consequatur blanditiis nemo dolore aliquam minus ab cupiditate at iure excepturi, eius nihil hic quam? Soluta iste nostrum possimus obcaecati tenetur?'),
	('f10929a9-7bc4-11ed-b649-0a0027000013', 'Adolf Hitler', 'Franz Eher Nachfolger GmbH', '1', 'Mein Kampf', '1925', 'Mein_Kampf.jpeg', 1676969420, 7, 'Mein Kampf is the autobiography and political treatise of German dictator Adolf Hitler. The title of the book translates to “My Struggle” in German. Published in 1925, the book contains two volumes and was mostly written during Hitler’s imprisonment following his failed Munich Putsch coup attempt in 1923. The book contains details about the Nazi leader’s early life and outlines his political ideology and plans for Germany’s future. The book was very popular during the Third Reich, the period during which Hitler ruled Germany. After his death in 1945, however, the state of Bavaria banned the book and it was not published in Germany again until 2016. The book remains deeply controversial today due to its anti-Semitic content.');

-- Dumping data for table db_library.tb_borrowing: ~7 rows (approximately)
DELETE FROM `tb_borrowing`;
INSERT INTO `tb_borrowing` (`id`, `id_book`, `borrow_date`, `returning_date`, `qty`, `name`, `mobile_phone`, `address`, `status`) VALUES
	('3abb6abb-73db-11ed-8226-cb08c4c1791c', 'ae9a28fc-72f1-11ed-85c7-1570f26e4f41', 1670162094, 1670766894, 2, 'MOCHAMMAD FAJRIN', '0881219021', 'MENDALAN', 'returned'),
	('51e01d10-73db-11ed-8226-cb08c4c1791c', 'ae9a28fc-72f1-11ed-85c7-1570f26e4f41', 1670162133, 1670766933, 11, 'MOCHAMMAD FAJRIN', '22', 'MENDALAN', 'returned'),
	('73c734ca-7439-11ed-8f1e-4edf74a7e790', 'ae9a28fc-72f1-11ed-85c7-1570f26e4f41', 1670202562, 1670807362, 100, 'MOCHAMMAD FAJRIN', '0881219021', 'MENDALAN', 'borrowing'),
	('8fea773d-73d3-11ed-8226-cb08c4c1791c', 'ae9a28fc-72f1-11ed-85c7-1570f26e4f41', 1670158801, 1670763601, 10, 'MOCHAMMAD FAJRIN', '21212121', 'MENDALAN', 'returned'),
	('c5b149f1-73dc-11ed-8226-cb08c4c1791c', 'ae9a28fc-72f1-11ed-85c7-1570f26e4f41', 1670162757, 1670767557, 100, 'MOCHAMMAD FAJRIN', '0881219021', 'MENDALAN', 'returned'),
	('c74c3fdb-73da-11ed-8226-cb08c4c1791c', 'ae9a28fc-72f1-11ed-85c7-1570f26e4f41', 1670161900, 1670766700, 11, 'MOCHAMMAD FAJRIN', '11', 'MENDALAN', 'returned'),
	('e7327ba5-73db-11ed-8226-cb08c4c1791c', 'ae9a28fc-72f1-11ed-85c7-1570f26e4f41', 1670162383, 1670767183, 555, 'MOCHAMMAD FAJRIN', '555', 'MENDALAN', 'returned');

-- Dumping data for table db_library.tb_genres: ~2 rows (approximately)
DELETE FROM `tb_genres`;
INSERT INTO `tb_genres` (`id`, `name`) VALUES
	('1', 'education'),
	('2', 'Sci-fi');

-- Dumping data for table db_library.tb_returning: ~0 rows (approximately)
DELETE FROM `tb_returning`;
INSERT INTO `tb_returning` (`id`, `id_book`, `id_borrowing`, `late_fee`) VALUES
	('a6ce1248-73dc-11ed-8226-cb08c4c1791c', 'ae9a28fc-72f1-11ed-85c7-1570f26e4f41', '3abb6abb-73db-11ed-8226-cb08c4c1791c', 2001),
	('a9d8f103-73dc-11ed-8226-cb08c4c1791c', 'ae9a28fc-72f1-11ed-85c7-1570f26e4f41', '51e01d10-73db-11ed-8226-cb08c4c1791c', 2001),
	('ac91fdb1-73dc-11ed-8226-cb08c4c1791c', 'ae9a28fc-72f1-11ed-85c7-1570f26e4f41', '8fea773d-73d3-11ed-8226-cb08c4c1791c', 2001),
	('af4d0350-73dc-11ed-8226-cb08c4c1791c', 'ae9a28fc-72f1-11ed-85c7-1570f26e4f41', 'c74c3fdb-73da-11ed-8226-cb08c4c1791c', 2001),
	('b2108834-73dc-11ed-8226-cb08c4c1791c', 'ae9a28fc-72f1-11ed-85c7-1570f26e4f41', 'e7327ba5-73db-11ed-8226-cb08c4c1791c', 2001),
	('cc88cb2c-73dc-11ed-8226-cb08c4c1791c', 'ae9a28fc-72f1-11ed-85c7-1570f26e4f41', 'c5b149f1-73dc-11ed-8226-cb08c4c1791c', 2001);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
