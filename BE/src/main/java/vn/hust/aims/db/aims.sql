-- MySQL dump 10.13  Distrib 9.0.1, for macos14.7 (arm64)
--
-- Host: localhost    Database: aims
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `Book`
--

DROP TABLE IF EXISTS `Book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Book` (
  `id` int NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `cover_type` varchar(50) DEFAULT NULL,
  `publication_date` date DEFAULT NULL,
  `pages` int DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`id`) REFERENCES `Media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Book`
--

LOCK TABLES `Book` WRITE;
/*!40000 ALTER TABLE `Book` DISABLE KEYS */;
/*!40000 ALTER TABLE `Book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CD`
--

DROP TABLE IF EXISTS `CD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CD` (
  `id` int NOT NULL,
  `record_label` varchar(255) DEFAULT NULL,
  `track_list` text,
  `genres` varchar(100) DEFAULT NULL,
  `artists` varchar(255) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `cd_ibfk_1` FOREIGN KEY (`id`) REFERENCES `Media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CD`
--

LOCK TABLES `CD` WRITE;
/*!40000 ALTER TABLE `CD` DISABLE KEYS */;
/*!40000 ALTER TABLE `CD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DeliveryInfo`
--

DROP TABLE IF EXISTS `DeliveryInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DeliveryInfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeliveryInfo`
--

LOCK TABLES `DeliveryInfo` WRITE;
/*!40000 ALTER TABLE `DeliveryInfo` DISABLE KEYS */;
INSERT INTO `DeliveryInfo` VALUES (1,'Duc Chinh','chinh@gmail.com','1234567890','Hanoi','123 Ta Quang Buu'),(2,'Tung Duong','duong@gmail.com','0987654321','Hanoi','456 Ta Quang Buu');
/*!40000 ALTER TABLE `DeliveryInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DVD`
--

DROP TABLE IF EXISTS `DVD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DVD` (
  `id` int NOT NULL,
  `disc_format` varchar(50) DEFAULT NULL,
  `director` varchar(255) DEFAULT NULL,
  `runtime` int DEFAULT NULL,
  `studio` varchar(255) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL,
  `subtitles` varchar(100) DEFAULT NULL,
  `genre` varchar(100) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `dvd_ibfk_1` FOREIGN KEY (`id`) REFERENCES `Media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DVD`
--

LOCK TABLES `DVD` WRITE;
/*!40000 ALTER TABLE `DVD` DISABLE KEYS */;
/*!40000 ALTER TABLE `DVD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Media`
--

DROP TABLE IF EXISTS `Media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Media` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `value` decimal(10,2) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `quantity_in_stock` int DEFAULT NULL,
  `is_rush_delivery_enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Media`
--

LOCK TABLES `Media` WRITE;
/*!40000 ALTER TABLE `Media` DISABLE KEYS */;
INSERT INTO `Media` VALUES (1,'The Catcher in the Rye','Book',12.00,15.00,30,1),(2,'1984','Book',10.00,14.00,20,1),(3,'To Kill a Mockingbird','Book',13.00,17.00,25,1),(4,'Pride and Prejudice','Book',11.00,16.00,18,0),(5,'Moby Dick','Book',14.00,18.00,10,1),(6,'War and Peace','Book',20.00,25.00,12,0),(7,'The Hobbit','Book',15.00,20.00,22,1),(8,'Crime and Punishment','Book',18.00,22.00,8,1),(9,'Abbey Road','CD',9.00,12.00,50,1),(10,'Back in Black','CD',10.00,13.00,40,1),(11,'Rumours','CD',11.00,14.00,35,0),(12,'The Dark Side of the Moon','CD',12.00,15.00,25,1),(13,'Hotel California','CD',9.50,13.50,20,0),(14,'Born in the U.S.A.','CD',10.50,14.00,30,1),(15,'Greatest Hits','CD',11.00,15.00,28,1),(16,'Thriller','CD',13.00,17.00,12,0),(17,'The Matrix','DVD',20.00,25.00,15,1),(18,'Avatar','DVD',22.00,28.00,10,1),(19,'Titanic','DVD',18.00,23.00,20,1),(20,'Star Wars: A New Hope','DVD',19.00,24.00,18,0),(21,'The Godfather','DVD',17.00,22.00,25,1),(22,'The Lord of the Rings: The Fellowship of the Ring','DVD',21.00,27.00,14,1),(23,'Harry Potter and the Philosopher\'s Stone','DVD',19.50,25.00,12,1),(24,'Inception','DVD',25.00,30.00,8,1),(25,'Frozen','DVD',16.00,20.00,18,0);
/*!40000 ALTER TABLE `Media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MediaImages`
--

DROP TABLE IF EXISTS `MediaImages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MediaImages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `media_id` int NOT NULL,
  `image_url` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `mediaimages_ibfk_1` FOREIGN KEY (`media_id`) REFERENCES `Media` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MediaImages`
--

LOCK TABLES `MediaImages` WRITE;
/*!40000 ALTER TABLE `MediaImages` DISABLE KEYS */;
INSERT INTO `MediaImages` VALUES (1,1,'https://upload.wikimedia.org/wikipedia/commons/8/89/The_Catcher_in_the_Rye_%281951%2C_first_edition_cover%29.jpg'),(2,2,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQV4yWihrnwBCaQNXCMF_zSIAPDMidcLtnR3g&s'),(3,3,'https://m.media-amazon.com/images/I/81gepf1eMqL._AC_UF1000,1000_QL80_.jpg'),(4,4,'https://pibook.vn/upload/products/pride-and-prejudice.jpg'),(5,5,'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1644192967i/58438316.jpg'),(6,6,'https://m.media-amazon.com/images/M/MV5BM2NkMzc3YzItM2YxNy00YzQwLTlmMDUtZDVjMDNjMTlhYWIxXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg'),(7,7,'https://images-na.ssl-images-amazon.com/images/I/71jD4jMityL.jpg'),(8,8,'https://cdn.kobo.com/book-images/2293d740-178e-4da1-a849-b11d6308fbaa/1200/1200/False/crime-and-punishment-35.jpg'),(9,9,'https://m.media-amazon.com/images/I/81sBKBIcwvL._UF1000,1000_QL80_.jpg'),(10,10,'https://m.media-amazon.com/images/I/910RNT12iPL._UF1000,1000_QL80_.jpg'),(11,11,'https://m.media-amazon.com/images/I/612dJUebY5S._UF1000,1000_QL80_.jpg'),(12,12,'https://upload.wikimedia.org/wikipedia/vi/1/17/Dark_Side_of_the_Moon.jpg'),(13,13,'https://www.groovierecords.com/cdn/shop/products/LmpwZWc_17fc6f08-9bd8-403d-b2da-2e630b700d06_720x.jpg?v=1684752614'),(14,14,'https://m.media-amazon.com/images/I/51jSIKJYVpL._UF1000,1000_QL80_.jpg'),(15,15,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfQ3ThPPnUCWbbM83ktDWLFuaISEGws7TgeA&s'),(16,16,'https://i.ebayimg.com/images/g/Oc8AAOSw9OFZOFG5/s-l400.jpg'),(17,17,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2fJufvmtTQvpgB8NTuLaHbx7luUgG4DM4cQ&s'),(18,18,'https://i.pinimg.com/736x/a9/2b/37/a92b37c3ce1fd8b042cbd37b241cb634.jpg'),(19,19,'https://cover.box3.net/newsimg/dvdmov/max1359890944-front-cover.jpg'),(20,20,'https://static.wikia.nocookie.net/dvd/images/2/20/Star_Wars_%28Full_Cover%29.JPG/revision/latest/scale-to-width-down/1200?cb=20220711120737'),(21,21,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyvT89ZXpMydcXguzcOE5_kmH_kedKXdU-hQ&s'),(22,22,'https://m.media-amazon.com/images/I/91Zr2sUki8L._UF894,1000_QL80_.jpg'),(23,23,'https://i.ebayimg.com/images/g/1Y0AAOSwI~tgnSqs/s-l1200.jpg'),(24,24,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYtqQzcXaHlDO_yz9vurh19mVPoBhwftoSrQ&s'),(25,25,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYrKZz14ZViIs0JqjkBErkl0-FNSoXJITPPg&s');
/*!40000 ALTER TABLE `MediaImages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order`
--

DROP TABLE IF EXISTS `Order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `delivery_info_id` int DEFAULT NULL,
  `payment_transaction_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `delivery_info_id` (`delivery_info_id`),
  KEY `payment_transaction_id` (`payment_transaction_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`delivery_info_id`) REFERENCES `DeliveryInfo` (`id`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`payment_transaction_id`) REFERENCES `PaymentTransaction` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order`
--

LOCK TABLES `Order` WRITE;
/*!40000 ALTER TABLE `Order` DISABLE KEYS */;
INSERT INTO `Order` VALUES (1,1,1),(2,2,2);
/*!40000 ALTER TABLE `Order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order_Media`
--

DROP TABLE IF EXISTS `Order_Media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Order_Media` (
  `order_id` int NOT NULL,
  `media_id` int NOT NULL,
  `quantity` int DEFAULT NULL,
  `is_rush_delivery` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`order_id`,`media_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `order_media_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `Order` (`id`),
  CONSTRAINT `order_media_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `Media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order_Media`
--

LOCK TABLES `Order_Media` WRITE;
/*!40000 ALTER TABLE `Order_Media` DISABLE KEYS */;
INSERT INTO `Order_Media` VALUES (1,1,2,1),(1,2,1,0),(2,3,1,1);
/*!40000 ALTER TABLE `Order_Media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaymentTransaction`
--

DROP TABLE IF EXISTS `PaymentTransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PaymentTransaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) NOT NULL,
  `timestamp` datetime NOT NULL,
  `content` text,
  `state` varchar(50) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `delivery_fee` decimal(10,2) DEFAULT NULL,
  `VAT` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaymentTransaction`
--

LOCK TABLES `PaymentTransaction` WRITE;
/*!40000 ALTER TABLE `PaymentTransaction` DISABLE KEYS */;
INSERT INTO `PaymentTransaction` VALUES (1,100.00,'2024-12-19 10:00:00','Order payment','Completed',90.00,5.00,5.00,100.00),(2,200.00,'2024-12-19 11:00:00','Order payment','Pending',180.00,10.00,10.00,200.00);
/*!40000 ALTER TABLE `PaymentTransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RushOrder`
--

DROP TABLE IF EXISTS `RushOrder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RushOrder` (
  `id` int NOT NULL,
  `delivery_instruction` text,
  `delivery_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `rushorder_ibfk_1` FOREIGN KEY (`id`) REFERENCES `Order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RushOrder`
--

LOCK TABLES `RushOrder` WRITE;
/*!40000 ALTER TABLE `RushOrder` DISABLE KEYS */;
INSERT INTO `RushOrder` VALUES (1,'Leave package at the front door','2024-12-19 18:00:00');
/*!40000 ALTER TABLE `RushOrder` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-19 11:42:28
