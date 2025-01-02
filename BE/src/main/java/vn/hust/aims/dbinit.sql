-- MySQL dump 10.13  Distrib 9.0.1, for macos14.7 (arm64)
--
-- Host: localhost    Database: aims_test_tuan
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
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `authors` varchar(255) DEFAULT NULL,
  `cover_type` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `pages` int DEFAULT NULL,
  `publication_date` date DEFAULT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FKkmql8ftb2jr8821mhw3mi2vqm` FOREIGN KEY (`id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES ('John Doe','UNKNOWN','English',23,'2020-01-01','Kim Dong','Tieu thuyet',1),('Alice Smith','PAPERBACK','French',250,'2021-03-15','Librairie Française','Roman',2),('Bob Writer','UNKNOWN','Spanish',180,'2019-12-10','Casa de Libros','Novela',3),('Eva Editor','HARDCOVER','German',400,'2022-06-20','Buch Verlag','Roman',4),('Carlos Contributor','PAPERBACK','Italian',350,'2023-04-05','Casa Editrice','Romanzo',5),('Mia Author','UNKNOWN','Portuguese',280,'2024-01-10','Editora Livro','Romance',6),('John Doe','UNKNOWN','English',23,'2020-01-01','Kim Dong','Tieu thuyet',7),('Alice Smith','PAPERBACK','French',250,'2021-03-15','Librairie Française','Roman',8),('Bob Writer','UNKNOWN','Spanish',180,'2019-12-10','Casa de Libros','Novela',9),('Eva Editor','HARDCOVER','German',400,'2022-06-20','Buch Verlag','Roman',10),('Carlos Contributor','PAPERBACK','Italian',350,'2023-04-05','Casa Editrice','Romanzo',11),('Mia Author','UNKNOWN','Portuguese',280,'2024-01-10','Editora Livro','Romance',12),('John Doe','UNKNOWN','English',23,'2020-01-01','Kim Dong','Tieu thuyet',13),('Alice Smith','PAPERBACK','French',250,'2021-03-15','Librairie Française','Roman',14),('Bob Writer','UNKNOWN','Spanish',180,'2019-12-10','Casa de Libros','Novela',15),('Eva Editor','HARDCOVER','German',400,'2022-06-20','Buch Verlag','Roman',16),('Carlos Contributor','PAPERBACK','Italian',350,'2023-04-05','Casa Editrice','Romanzo',17),('Mia Author','UNKNOWN','Portuguese',280,'2024-01-10','Editora Livro','Romance',18),('John Doe','UNKNOWN','English',23,'2020-01-01','Kim Dong','Tieu thuyet',19),('Alice Smith','PAPERBACK','French',250,'2021-03-01','Kim DOng','Truyen',20);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` varchar(255) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES ('c2edc6dc-eb24-45f0-bea5-b55bf4bba30d',NULL,'2025-01-01 16:59:14.402879'),('ce1936ac-f05b-47fa-afa5-a4fa45a851a5',NULL,'2025-01-01 17:04:34.689818');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_media`
--

DROP TABLE IF EXISTS `cart_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_media` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `cart_id` varchar(255) DEFAULT NULL,
  `media_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK268pxr32lc7t95ob450p1w94` (`cart_id`),
  KEY `FKekbkyfulu7yfy04jjnsfv1cug` (`media_id`),
  CONSTRAINT `FK268pxr32lc7t95ob450p1w94` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  CONSTRAINT `FKekbkyfulu7yfy04jjnsfv1cug` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_media`
--

LOCK TABLES `cart_media` WRITE;
/*!40000 ALTER TABLE `cart_media` DISABLE KEYS */;
INSERT INTO `cart_media` VALUES (1,'2025-01-01 17:04:13.912424','2025-01-01 17:29:12.153824',5,'c2edc6dc-eb24-45f0-bea5-b55bf4bba30d',1);
/*!40000 ALTER TABLE `cart_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cd`
--

DROP TABLE IF EXISTS `cd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cd` (
  `artists` varchar(255) DEFAULT NULL,
  `genres` varchar(255) DEFAULT NULL,
  `record_label` varchar(255) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `track_list` varchar(255) DEFAULT NULL,
  `id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FKnlogrviwk5gnxadu9t5vooqvl` FOREIGN KEY (`id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cd`
--

LOCK TABLES `cd` WRITE;
/*!40000 ALTER TABLE `cd` DISABLE KEYS */;
INSERT INTO `cd` VALUES ('Adele','Pop','Music Records','2023-01-15','Hello, Someone Like You, Rolling in the Deep',21),('Ed Sheeran','Pop','Atlantic Records','2023-03-20','Shape of You, Thinking Out Loud',22),('John Coltrane','Jazz','Blue Note','2023-05-25','Giant Steps, My Favorite Things',23),('Calvin Harris','Electronic','Columbia Records','2023-07-10','Summer, Feel So Close',24),('Johnny Cash','Country','Sun Records','2023-09-15','Ring of Fire, I Walk the Line',25),('Lady Gaga','Pop','Interscope Records','2023-11-20','Bad Romance, Poker Face',26),('The Beatles','Rock','Apple Records','2024-01-10','Hey Jude, Let It Be',27),('Miles Davis','Jazz','Columbia Records','2024-03-15','So What, Kind of Blue',28),('Avicii','Electronic','PRMD','2024-05-20','Wake Me Up, Levels',29),('Shania Twain','Country','Mercury Nashville','2024-07-25','Man! I Feel Like a Woman!, Youre Still the One',30);
/*!40000 ALTER TABLE `cd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changelog`
--

DROP TABLE IF EXISTS `changelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changelog` (
  `id` bigint NOT NULL,
  `author_id` bigint DEFAULT NULL,
  `changed_media_id` bigint DEFAULT NULL,
  `is_price_change` int DEFAULT NULL,
  `timestamp` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changelog`
--

LOCK TABLES `changelog` WRITE;
/*!40000 ALTER TABLE `changelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `changelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_info`
--

DROP TABLE IF EXISTS `delivery_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_info`
--

LOCK TABLES `delivery_info` WRITE;
/*!40000 ALTER TABLE `delivery_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dvd`
--

DROP TABLE IF EXISTS `dvd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dvd` (
  `director` varchar(255) DEFAULT NULL,
  `disc_format` varchar(255) DEFAULT NULL,
  `genres` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `run_time` double DEFAULT NULL,
  `studio` varchar(255) DEFAULT NULL,
  `subtitles` varchar(255) DEFAULT NULL,
  `id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK7q90c69syre6p3f7kl2cquf75` FOREIGN KEY (`id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dvd`
--

LOCK TABLES `dvd` WRITE;
/*!40000 ALTER TABLE `dvd` DISABLE KEYS */;
INSERT INTO `dvd` VALUES ('Christopher Nolan','BLURAY','Action','English','2023-01-15',150.5,'Warner Bros.','English',31),('Quentin Tarantino','UNKNOWN','Crime','English','2023-03-20',180,'Miramax Films','English',32),('Steven Spielberg','BLURAY','Adventure','English','2023-05-25',130.75,'Amblin Entertainment','English',33),('Martin Scorsese','UNKNOWN','Drama','English','2023-07-10',160.25,'Paramount Pictures','English',34),('Hayao Miyazaki','BLURAY','Animation','Japanese','2023-09-15',120,'Studio Ghibli','English, Japanese',35),('Ridley Scott','UNKNOWN','Sci-Fi','English','2023-11-20',145.5,'20th Century Studios','English',36),('Alfred Hitchcock','BLURAY','Thriller','English','2024-01-10',110.75,'Paramount Pictures','English',37),('Stanley Kubrick','UNKNOWN','Mystery','English','2024-03-15',155,'Warner Bros.','English',38),('Spike Lee','BLURAY','Comedy','English','2024-05-20',140.5,'40 Acres and a Mule Filmworks','English',39),('Tim Burton','UNKNOWN','Fantasy','English','2024-07-25',125.25,'Walt Disney Pictures','English',40),('Ang Lee','BLURAY','Romance','English','2024-09-30',170.75,'Focus Features','English',41),('David Fincher','UNKNOWN','Mystery','English','2024-12-05',150,'20th Century Studios','English',42),('James Cameron','BLURAY','Sci-Fi','English','2025-02-10',180.25,'Lightstorm Entertainment','English',43),('George Lucas','UNKNOWN','Adventure','English','2025-04-15',165.5,'Lucasfilm','English',44),('Greta Gerwig','BLURAY','Drama','English','2025-06-20',120.75,'Columbia Pictures','English',45);
/*!40000 ALTER TABLE `dvd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (1);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lp`
--

DROP TABLE IF EXISTS `lp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lp` (
  `artists` varchar(255) DEFAULT NULL,
  `genres` varchar(255) DEFAULT NULL,
  `record_label` varchar(255) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `track_list` varchar(255) DEFAULT NULL,
  `id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FKe98sdusomowj0qlg51rp7w5ua` FOREIGN KEY (`id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lp`
--

LOCK TABLES `lp` WRITE;
/*!40000 ALTER TABLE `lp` DISABLE KEYS */;
INSERT INTO `lp` VALUES ('Elvis Presley','Rock and Roll','RCA Records','1956-03-23','Blue Suede Shoes, Heartbreak Hotel',46),('Miles Davis','Jazz','Columbia Records','1959-08-17','So What, Freddie Freeloader',47),('The Beatles','Rock','Parlophone','1967-05-26','Lucy in the Sky with Diamonds, A Day in the Life',48),('Michael Jackson','Pop','Epic Records','1982-11-30','Billie Jean, Beat It',49),('Bob Marley','Reggae','Island Records','1977-06-03','Three Little Birds, No Woman, No Cry',50);
/*!40000 ALTER TABLE `lp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `barcode_url` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image_url` text,
  `import_date` date DEFAULT NULL,
  `is_able_to_rush_delivery` bit(1) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity_in_stock` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `value` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_1','book','Interesting novel about life','http://localhost:8080/api/v1/media/images/image_url_1.jpg','2023-01-01',_binary '',19990,50,'The Journey of a Lifetime',29990,1.5),(2,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_2','book','Chart-topping music album','http://localhost:8080/api/v1/media/images/image_url_2.jpg','2023-02-15',_binary '\0',12990,100,'Harmony Melodies',18990,0.8),(3,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_3','book','Award-winning documentary','http://localhost:8080/api/v1/media/images/image_url_3.jpg','2023-03-20',_binary '',24990,30,'Discovering Nature',34990,2),(4,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_4','book','Classic vinyl record collection','http://localhost:8080/api/v1/media/images/image_url_4.jpg','2023-04-10',_binary '\0',39990,75,'Vintage Vibes',49990,2.5),(5,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_5','book','Suspenseful thriller','http://localhost:8080/api/v1/media/images/image_url_5.jpg','2023-05-05',_binary '',21990,40,'Whispers in the Shadows',31990,1.2),(6,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_6','book','Soulful jazz compilation','http://localhost:8080/api/v1/media/images/image_url_6.jpg','2023-06-12',_binary '\0',15990,90,'Smooth Jazz Express',25990,0.9),(7,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_7','book','Educational documentary series','http://localhost:8080/api/v1/media/images/image_url_7.jpg','2023-07-18',_binary '',29990,20,'The World Unveiled',39990,1.8),(8,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_8','book','Rock and roll classics','http://localhost:8080/api/v1/media/images/image_url_8.jpg','2023-08-22',_binary '\0',44990,60,'Rock Revolution',54990,2.7),(9,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_9','book','Heartwarming love story','http://localhost:8080/api/v1/media/images/image_url_9.jpg','2023-09-30',_binary '',17990,55,'Love Beyond Words',27990,1),(10,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_10','book','Energetic pop hits','http://localhost:8080/api/v1/media/images/image_url_10.jpg','2023-10-15',_binary '\0',14990,80,'Pop Sensation',24990,0.7),(11,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_11','book','Historical drama series','http://localhost:8080/api/v1/media/images/image_url_11.jpg','2023-11-25',_binary '',26990,25,'Epic Chronicles',36990,1.5),(12,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_12','book','Blues and soul compilation','http://localhost:8080/api/v1/media/images/image_url_12.jpg','2023-12-05',_binary '\0',49990,70,'Soulful Blues Journey',59990,2.8),(13,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_13','book','Inspirational self-help book','http://localhost:8080/api/v1/media/images/image_url_13.jpg','2024-01-01',_binary '',23990,45,'The Power of Positivity',33990,1.3),(14,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_14','book','Top 40 hits','http://localhost:8080/api/v1/media/images/image_url_14.jpg','2024-02-15',_binary '\0',16990,95,'Top 40 Countdown',26990,0.6),(15,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_15','book','Award-winning documentary','http://localhost:8080/api/v1/media/images/image_url_15.jpg','2024-03-20',_binary '',24990,30,'Discovering Nature',34990,1.8),(16,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_16','book','Classic vinyl record collection','http://localhost:8080/api/v1/media/images/image_url_16.jpg','2024-04-10',_binary '\0',39990,75,'Vintage Vibes',49990,2.5),(17,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_17','book','Suspenseful thriller','http://localhost:8080/api/v1/media/images/image_url_17.jpg','2024-05-05',_binary '',21990,40,'Whispers in the Shadows',31990,1.2),(18,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_18','book','Soulful jazz compilation','http://localhost:8080/api/v1/media/images/image_url_18.jpg','2024-06-12',_binary '\0',15990,90,'Smooth Jazz Express',25990,0.9),(19,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_19','book','Educational documentary series','http://localhost:8080/api/v1/media/images/image_url_19.jpg','2024-07-18',_binary '',29990,20,'The World Unveiled',39990,1.8),(20,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_20','book','Rock and roll classics','http://localhost:8080/api/v1/media/images/image_url_20.jpg','2024-08-22',_binary '\0',44990,60,'Rock Revolution',54990,2.7),(21,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_21','book','Heartwarming love story','http://localhost:8080/api/v1/media/images/image_url_21.jpg','2024-09-30',_binary '',17990,55,'Love Beyond Words',27990,1),(22,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_22','cd','Energetic pop hits','http://localhost:8080/api/v1/media/images/image_url_22.jpg','2024-10-15',_binary '\0',14990,80,'Pop Sensation',24990,0.7),(23,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_23','cd','Historical drama series','http://localhost:8080/api/v1/media/images/image_url_23.jpg','2024-11-25',_binary '',26990,25,'Epic Chronicles',36990,1.5),(24,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_24','cd','Blues and soul compilation','http://localhost:8080/api/v1/media/images/image_url_24.jpg','2024-12-05',_binary '\0',49990,70,'Soulful Blues Journey',59990,2.8),(25,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_25','cd','Inspirational self-help book','http://localhost:8080/api/v1/media/images/image_url_25.jpg','2025-01-01',_binary '',23990,45,'The Power of Positivity',33990,1.3),(26,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_26','cd','Top 40 hits','http://localhost:8080/api/v1/media/images/image_url_26.jpg','2025-02-15',_binary '\0',16990,95,'Top 40 Countdown',26990,0.6),(27,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_27','cd','Award-winning documentary','http://localhost:8080/api/v1/media/images/image_url_27.jpg','2025-03-20',_binary '',24990,30,'Discovering Nature',34990,1.8),(28,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_28','cd','Classic vinyl record collection','http://localhost:8080/api/v1/media/images/image_url_28.jpg','2025-04-10',_binary '\0',39990,75,'Vintage Vibes',49990,2.5),(29,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_29','cd','Suspenseful thriller','http://localhost:8080/api/v1/media/images/image_url_29.jpg','2025-05-05',_binary '',21990,40,'Whispers in the Shadows',31990,1.2),(30,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_30','cd','Soulful jazz compilation','http://localhost:8080/api/v1/media/images/image_url_30.jpg','2025-06-12',_binary '\0',15990,90,'Smooth Jazz Express',25990,0.9),(31,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_31','dvd','Educational documentary series','http://localhost:8080/api/v1/media/images/image_url_31.jpg','2025-07-18',_binary '',29990,20,'The World Unveiled',39990,1.8),(32,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_32','dvd','Rock and roll classics','http://localhost:8080/api/v1/media/images/image_url_32.jpg','2025-08-22',_binary '\0',44990,60,'Rock Revolution',54990,2.7),(33,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_33','dvd','Heartwarming love story','http://localhost:8080/api/v1/media/images/image_url_33.jpg','2025-09-30',_binary '',17990,55,'Love Beyond Words',27990,1),(34,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_34','dvd','Energetic pop hits','http://localhost:8080/api/v1/media/images/image_url_34.jpg','2025-10-15',_binary '\0',14990,80,'Pop Sensation',24990,0.7),(35,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_35','dvd','Historical drama series','http://localhost:8080/api/v1/media/images/image_url_35.jpg','2025-11-25',_binary '',26990,25,'Epic Chronicles',36990,1.5),(36,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_36','dvd','Blues and soul compilation','http://localhost:8080/api/v1/media/images/image_url_36.jpg','2025-12-05',_binary '\0',49990,70,'Soulful Blues Journey',59990,2.8),(37,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_37','dvd','Inspirational self-help book','http://localhost:8080/api/v1/media/images/image_url_37.jpg','2026-01-01',_binary '',23990,45,'The Power of Positivity',33990,1.3),(38,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_38','dvd','Top 40 hits','http://localhost:8080/api/v1/media/images/image_url_38.jpg','2026-02-15',_binary '\0',16990,95,'Top 40 Countdown',26990,0.6),(39,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_39','dvd','Award-winning documentary','http://localhost:8080/api/v1/media/images/image_url_39.jpg','2026-03-20',_binary '',24990,30,'Discovering Nature',34990,1.8),(40,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_40','dvd','Classic vinyl record collection','http://localhost:8080/api/v1/media/images/image_url_40.jpg','2026-04-10',_binary '\0',39990,75,'Vintage Vibes',49990,2.5),(41,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_41','dvd','Suspenseful thriller','http://localhost:8080/api/v1/media/images/image_url_41.jpg','2026-05-05',_binary '',21990,40,'Whispers in the Shadows',31990,1.2),(42,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_42','dvd','Soulful jazz compilation','http://localhost:8080/api/v1/media/images/image_url_42.jpg','2026-06-12',_binary '\0',15990,90,'Smooth Jazz Express',25990,0.9),(43,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_43','dvd','Educational documentary series','http://localhost:8080/api/v1/media/images/image_url_43.jpg','2026-07-18',_binary '',29990,20,'The World Unveiled',39990,1.8),(44,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_44','dvd','Rock and roll classics','http://localhost:8080/api/v1/media/images/image_url_44.jpg','2026-08-22',_binary '\0',44990,60,'Rock Revolution',54990,2.7),(45,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_45','dvd','Heartwarming love story','http://localhost:8080/api/v1/media/images/image_url_45.jpg','2026-09-30',_binary '',17990,55,'Love Beyond Words',27990,1),(46,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_46','lp','Energetic pop hits','http://localhost:8080/api/v1/media/images/image_url_46.jpg','2026-10-15',_binary '\0',14990,80,'Pop Sensation',24990,0.7),(47,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_47','lp','Historical drama series','http://localhost:8080/api/v1/media/images/image_url_47.jpg','2026-11-25',_binary '',26990,25,'Epic Chronicles',36990,1.5),(48,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_48','lp','Blues and soul compilation','http://localhost:8080/api/v1/media/images/image_url_48.jpg','2026-12-05',_binary '\0',49990,70,'Soulful Blues Journey',59990,2.8),(49,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_49','lp','Inspirational self-help book','http://localhost:8080/api/v1/media/images/image_url_49.jpg','2027-01-01',_binary '',23990,45,'The Power of Positivity',33990,1.3),(50,'2024-12-26 16:40:34.000000','2024-12-26 16:40:34.000000','barcode_url_50','lp','Top 40 hits','http://localhost:8080/api/v1/media/images/image_url_50.jpg','2027-02-15',_binary '\0',16990,95,'Top 40 Countdown',26990,0.6);
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` varchar(255) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `delivery_fee` double DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `vat` double DEFAULT NULL,
  `delivery_info_id` bigint DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrso8gtf6yjkk32cr6405yqtd7` (`delivery_info_id`),
  KEY `FKdtqbrqcg4ppri3bf8uwlbj9c1` (`transaction_id`),
  CONSTRAINT `FKdtqbrqcg4ppri3bf8uwlbj9c1` FOREIGN KEY (`transaction_id`) REFERENCES `payment_transaction` (`id`),
  CONSTRAINT `FKrso8gtf6yjkk32cr6405yqtd7` FOREIGN KEY (`delivery_info_id`) REFERENCES `delivery_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_media`
--

DROP TABLE IF EXISTS `order_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_media` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `is_order_for_rush_delivery` bit(1) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `media_id` bigint DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnmyc8c19j1wpxl3eft9khc1hm` (`media_id`),
  KEY `FKotl71dxnqgwj99yrnyfw8mg99` (`order_id`),
  CONSTRAINT `FKnmyc8c19j1wpxl3eft9khc1hm` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `FKotl71dxnqgwj99yrnyfw8mg99` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_media`
--

LOCK TABLES `order_media` WRITE;
/*!40000 ALTER TABLE `order_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_transaction`
--

DROP TABLE IF EXISTS `payment_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_transaction` (
  `id` varchar(255) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `timestamp` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_transaction`
--

LOCK TABLES `payment_transaction` WRITE;
/*!40000 ALTER TABLE `payment_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rush_order`
--

DROP TABLE IF EXISTS `rush_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rush_order` (
  `id` varchar(255) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `delivery_instruction` varchar(255) DEFAULT NULL,
  `delivery_time` datetime(6) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKkncda1um2mqxugd32bsd9i8c1` (`order_id`),
  CONSTRAINT `FKkncda1um2mqxugd32bsd9i8c1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rush_order`
--

LOCK TABLES `rush_order` WRITE;
/*!40000 ALTER TABLE `rush_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `rush_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sender`
--

DROP TABLE IF EXISTS `sender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sender` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `config` json NOT NULL,
  `provider` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sender`
--

LOCK TABLES `sender` WRITE;
/*!40000 ALTER TABLE `sender` DISABLE KEYS */;
INSERT INTO `sender` VALUES (1,NULL,NULL,'{\"mail\": {\"host\": \"smtp.gmail.com\", \"port\": \"587\", \"password\": \"gwpp vehb oqnr mkvk\", \"username\": \"chamsockhachhangaims@gmail.com\", \"properties\": {\"mail\": {\"mime\": {\"charset\": \"UTF\"}, \"smtp\": {\"auth\": true, \"starttls\": {\"enable\": true, \"required\": true}}}}, \"default-encoding\": \"UTF-8\"}}','GMAIL');
/*!40000 ALTER TABLE `sender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template`
--

DROP TABLE IF EXISTS `template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `template` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `content` text NOT NULL,
  `required_parameters` json NOT NULL,
  `title` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template`
--

LOCK TABLES `template` WRITE;
/*!40000 ALTER TABLE `template` DISABLE KEYS */;
INSERT INTO `template` VALUES (1,NULL,NULL,'<!DOCTYPE html>\n<html lang=\"vi\" xmlns:th=\"http://www.thymeleaf.org\">\n<head>\n  <meta charset=\"UTF-8\" />\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n  <title>Xác nhận đơn hàng</title>\n  <style>\n    body {\n      font-family: Arial, sans-serif;\n      line-height: 1.6;\n      margin: 0;\n      padding: 20px;\n      background-color: #f4f4f4;\n    }\n\n    .container {\n      max-width: 600px;\n      margin: 0 auto;\n      background-color: #ffffff;\n      padding: 20px;\n      border-radius: 5px;\n      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\n    }\n\n    h1 {\n      color: #333;\n    }\n\n    p {\n      color: #555;\n    }\n\n    .footer {\n      margin-top: 20px;\n      padding-top: 10px;\n      border-top: 1px solid #ddd;\n      color: #888;\n      font-size: 12px;\n    }\n  </style>\n</head>\n<body>\n<div class=\"container\">\n  <h1>Đặt hàng thành công</h1>\n  <p>\n    Cảm ơn bạn đã đặt hàng từ chúng tôi.\n  </p>\n  <p>Thông tin đơn hàng của bạn:</p>\n  <ul>\n    <li><strong>Mã đơn hàng:</strong> <span th:text=\"${orderId}\"></span></li>\n  </ul>\n  <p>\n    Để theo dõi tình trạng đơn hàng của bạn, vui lòng theo dõi <a th:href=\"${trace_order_link}\">tại đây</a>\n  </p>\n  <p>Cảm ơn bạn đã mua sắm tại cửa hàng chúng tôi!</p>\n  <div class=\"footer\">\n    <p>Trân trọng,<br />AIMS</p>\n  </div>\n</div>\n</body>\n</html>\n','[\"orderId\", \"trace_order_link\"]','Xác nhận đơn hàng'),(2,NULL,NULL,'<!DOCTYPE html>\n<html lang=\"vi\">\n<head>\n  <meta charset=\"UTF-8\" />\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n  <title>Xác nhận huỷ đơn hàng</title>\n  <style>\n    body {\n      font-family: Arial, sans-serif;\n      line-height: 1.6;\n      margin: 0;\n      padding: 20px;\n      background-color: #f4f4f4;\n    }\n\n    .container {\n      max-width: 600px;\n      margin: 0 auto;\n      background-color: #ffffff;\n      padding: 20px;\n      border-radius: 5px;\n      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\n    }\n\n    h1 {\n      color: #333;\n    }\n\n    p {\n      color: #555;\n    }\n\n    .footer {\n      margin-top: 20px;\n      padding-top: 10px;\n      border-top: 1px solid #ddd;\n      color: #888;\n      font-size: 12px;\n    }\n  </style>\n</head>\n<body>\n<div class=\"container\">\n  <h1>Xác nhận hủy đơn hàng</h1>\n  <p>\n    Chúng tôi nhận được yêu cầu huỷ đơn hàng từ bạn.\n  </p>\n  <p>Thông tin đơn hàng của bạn:</p>\n  <ul>\n    <li><strong>Mã đơn hàng:</strong> <span th:text=\"${orderId}\"></span></li>\n  </ul>\n  <p>Vui lòng xác nhận huỷ đơn hàng <a th:href=\"${confirm_cancel_order_link}\">tại đây</a>\n  <p>\n    Nếu có bất kỳ câu hỏi hoặc cần thêm hỗ trợ, vui lòng liên hệ với chúng\n    tôi qua địa chỉ email: chamsockhachhangaims@gmail.com\n  </p>\n  <p>Xin cảm ơn bạn đã chọn sản phẩm của chúng tôi!</p>\n  <div class=\"footer\">\n    <p>Trân trọng,<br />AIMS</p>\n  </div>\n</div>\n</body>\n</html>','[\"orderId\", \"confirm_cancel_order_link\"]','Xác nhận hủy đơn hàng'),(3,NULL,NULL,'<!DOCTYPE html>\n<html lang=\"vi\">\n<head>\n  <meta charset=\"UTF-8\" />\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n  <title>Hủy đơn hàng thành công</title>\n  <style>\n    body {\n      font-family: Arial, sans-serif;\n      line-height: 1.6;\n      margin: 0;\n      padding: 20px;\n      background-color: #f4f4f4;\n    }\n\n    .container {\n      max-width: 600px;\n      margin: 0 auto;\n      background-color: #ffffff;\n      padding: 20px;\n      border-radius: 5px;\n      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\n    }\n\n    h1 {\n      color: #333;\n    }\n\n    p {\n      color: #555;\n    }\n\n    .footer {\n      margin-top: 20px;\n      padding-top: 10px;\n      border-top: 1px solid #ddd;\n      color: #888;\n      font-size: 12px;\n    }\n  </style>\n</head>\n<body>\n<div class=\"container\">\n  <h1>Hủy đơn hàng thành công</h1>\n  <p>\n    Chúng tôi xin thông báo rằng đơn hàng của bạn đã được hủy thành công.\n  </p>\n  <p>Tiền sẽ được hoàn trả vào tài khoản của bạn chậm nhất sau 3 ngày làm việc.</p>\n  <p>Thông tin đơn hàng đã hủy:</p>\n  <ul>\n    <li><strong>Mã đơn hàng:</strong> <span th:text=\"${orderId}\"></span></li>\n  </ul>\n  <p>\n    Nếu có bất kỳ câu hỏi hoặc cần thêm hỗ trợ, vui lòng liên hệ với chúng\n    tôi qua địa chỉ email: chamsockhachhangaims@gmail.com\n  </p>\n  <p>Xin cảm ơn bạn đã chọn sản phẩm của chúng tôi!</p>\n  <div class=\"footer\">\n    <p>Trân trọng,<br />AIMS</p>\n  </div>\n</div>\n</body>\n</html>','[\"orderId\"]','Hủy đơn hàng thành công'),(4,NULL,NULL,'<!DOCTYPE html>\n<html lang=\"vi\" xmlns:th=\"http://www.thymeleaf.org\">\n<head>\n  <meta charset=\"UTF-8\" />\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n  <title>Đơn hàng đã được duyệt</title>\n  <style>\n    body {\n      font-family: Arial, sans-serif;\n      line-height: 1.6;\n      margin: 0;\n      padding: 20px;\n      background-color: #f4f4f4;\n    }\n\n    .container {\n      max-width: 600px;\n      margin: 0 auto;\n      background-color: #ffffff;\n      padding: 20px;\n      border-radius: 5px;\n      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\n    }\n\n    h1 {\n      color: #333;\n    }\n\n    p {\n      color: #555;\n    }\n\n    .footer {\n      margin-top: 20px;\n      padding-top: 10px;\n      border-top: 1px solid #ddd;\n      color: #888;\n      font-size: 12px;\n    }\n  </style>\n</head>\n<body>\n<div class=\"container\">\n  <h1>Đơn hàng đã được duyệt</h1>\n  <p>\n    Cảm ơn bạn đã đặt hàng từ chúng tôi.\n  </p>\n  <p>Thông tin đơn hàng của bạn:</p>\n  <ul>\n    <li><strong>Mã đơn hàng:</strong> <span th:text=\"${orderId}\"></span></li>\n  </ul>\n  <p>\n    Để theo dõi tình trạng đơn hàng của bạn, vui lòng theo dõi <a th:href=\"${trace_order_link}\">tại đây</a>\n  </p>\n  <p>Cảm ơn bạn đã mua sắm tại cửa hàng chúng tôi!</p>\n  <div class=\"footer\">\n    <p>Trân trọng,<br />AIMS</p>\n  </div>\n</div>\n</body>\n</html>\n','[\"orderId\", \"trace_order_link\"]','Đơn hàng đã được duyệt'),(5,NULL,NULL,'<!DOCTYPE html>\n<html lang=\"vi\" xmlns:th=\"http://www.thymeleaf.org\">\n<head>\n  <meta charset=\"UTF-8\" />\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n  <title>Đơn hàng đã bị từ chối</title>\n  <style>\n    body {\n      font-family: Arial, sans-serif;\n      line-height: 1.6;\n      margin: 0;\n      padding: 20px;\n      background-color: #f4f4f4;\n    }\n\n    .container {\n      max-width: 600px;\n      margin: 0 auto;\n      background-color: #ffffff;\n      padding: 20px;\n      border-radius: 5px;\n      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\n    }\n\n    h1 {\n      color: #333;\n    }\n\n    p {\n      color: #555;\n    }\n\n    .footer {\n      margin-top: 20px;\n      padding-top: 10px;\n      border-top: 1px solid #ddd;\n      color: #888;\n      font-size: 12px;\n    }\n  </style>\n</head>\n<body>\n<div class=\"container\">\n  <h1>Đơn hàng bị từ chối</h1>\n  <p>\n    Rất tiếc nhưng đơn hàng của bạn đã bị từ chối.\n  </p>\n  <p>Cảm ơn bạn đã mua sắm tại cửa hàng chúng tôi!</p>\n  <div class=\"footer\">\n    <p>Trân trọng,<br />AIMS</p>\n  </div>\n</div>\n</body>\n</html>\n','[\"\"]','Đơn hàng đã bị từ chối'),(6,NULL,NULL,'<!DOCTYPE html>\n<html lang=\"vi\" xmlns:th=\"http://www.thymeleaf.org\">\n<head>\n    <meta charset=\"UTF-8\" />\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n    <title th:text=\"${blockedState}\"></title>\n    <style>\n        body {\n          font-family: Arial, sans-serif;\n          line-height: 1.6;\n          margin: 0;\n          padding: 20px;\n          background-color: #f4f4f4;\n        }\n\n        .container {\n          max-width: 600px;\n          margin: 0 auto;\n          background-color: #ffffff;\n          padding: 20px;\n          border-radius: 5px;\n          box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\n        }\n\n        h1 {\n          color: #333;\n        }\n\n        p {\n          color: #555;\n        }\n\n        .footer {\n          margin-top: 20px;\n          padding-top: 10px;\n          border-top: 1px solid #ddd;\n          color: #888;\n          font-size: 12px;\n        }\n    </style>\n</head>\n<body>\n<div class=\"container\">\n    <h1>Tài khoản của bạn đã <span th:text=\"${blockedState}\"></span></h1>\n    <p>\n        Một quản trị viên đã <span th:text=\"${action}\"></span> tài khoản của bạn.\n    </p>\n    <p>\n        Để biết thêm chi tiết về hành động này, vui lòng liên hệ với chúng tôi bằng cách trả lời email này.\n    </p>\n    <p>Cảm ơn bạn đã sử dụng nền tảng bán hàng của chúng tôi!</p>\n    <div class=\"footer\">\n        <p>Trân trọng,<br />AIMS</p>\n    </div>\n</div>\n</body>\n</html>\n','[\"blockedState\", \"action\"]','Trạng thái tài khoản'),(7,NULL,NULL,'<!DOCTYPE html>\n<html lang=\"vi\" xmlns:th=\"http://www.thymeleaf.org\">\n<head>\n    <meta charset=\"UTF-8\" />\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n    <title>Tài khoản aims đã được tạo</title>\n    <style>\n        body {\n          font-family: Arial, sans-serif;\n          line-height: 1.6;\n          margin: 0;\n          padding: 20px;\n          background-color: #f4f4f4;\n        }\n\n        .container {\n          max-width: 600px;\n          margin: 0 auto;\n          background-color: #ffffff;\n          padding: 20px;\n          border-radius: 5px;\n          box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\n        }\n\n        h1 {\n          color: #333;\n        }\n\n        p {\n          color: #555;\n        }\n\n        .footer {\n          margin-top: 20px;\n          padding-top: 10px;\n          border-top: 1px solid #ddd;\n          color: #888;\n          font-size: 12px;\n        }\n    </style>\n</head>\n<body>\n<div class=\"container\">\n    <h1>Bạn đã được cấp tài khoản sử dụng hệ thống AIMS</h1>\n    <p>Bạn có thể đăng nhập sử dụng địa chỉ email này và mật khẩu sau đây:</p>\n    <p>Mật khẩu mới: <span th:text=\"${newPassword}\"></span></p>\n    <p>Nếu bạn có thắc mắc về sự kiện này, vui lòng liên hệ với chúng tôi bằng cách trả lời email này.</p>\n    <p>Cảm ơn bạn đã sử dụng nền tảng bán hàng của chúng tôi!</p>\n    <div class=\"footer\">\n        <p>Trân trọng,<br />AIMS</p>\n    </div>\n</div>\n</body>\n</html>\n','[\"newPassword\"]','Tạo người dùng'),(8,NULL,NULL,'<!DOCTYPE html>\n<html lang=\"vi\" xmlns:th=\"http://www.thymeleaf.org\">\n<head>\n    <meta charset=\"UTF-8\" />\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n    <title>Mật khẩu của bạn đã được thay đổi</title>\n    <style>\n        body {\n          font-family: Arial, sans-serif;\n          line-height: 1.6;\n          margin: 0;\n          padding: 20px;\n          background-color: #f4f4f4;\n        }\n\n        .container {\n          max-width: 600px;\n          margin: 0 auto;\n          background-color: #ffffff;\n          padding: 20px;\n          border-radius: 5px;\n          box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\n        }\n\n        h1 {\n          color: #333;\n        }\n\n        p {\n          color: #555;\n        }\n\n        .footer {\n          margin-top: 20px;\n          padding-top: 10px;\n          border-top: 1px solid #ddd;\n          color: #888;\n          font-size: 12px;\n        }\n    </style>\n</head>\n<body>\n<div class=\"container\">\n    <h1>Mật khẩu của bạn đã được thay đổi</h1>\n    <p>Một quản trị viên đã thay đổi mật khẩu tài khoản của bạn.</p>\n    <p>Mật khẩu mới: <span th:text=\"${newPassword}\"></span></p>\n    <p>Nếu bạn có thắc mắc về sự thay đổi này, vui lòng liên hệ với chúng tôi bằng cách trả lời email này.</p>\n    <p>Cảm ơn bạn đã sử dụng nền tảng bán hàng của chúng tôi!</p>\n    <div class=\"footer\">\n        <p>Trân trọng,<br />AIMS</p>\n    </div>\n</div>\n</body>\n</html>\n','[\"newPassword\"]','Đổi mật khẩu'),(9,NULL,NULL,'<!DOCTYPE html>\n<html lang=\"vi\" xmlns:th=\"http://www.thymeleaf.org\">\n<head>\n    <meta charset=\"UTF-8\" />\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n    <title>Thông tin người dùng đã được thay đổi</title>\n    <style>\n        body {\n          font-family: Arial, sans-serif;\n          line-height: 1.6;\n          margin: 0;\n          padding: 20px;\n          background-color: #f4f4f4;\n        }\n\n        .container {\n          max-width: 600px;\n          margin: 0 auto;\n          background-color: #ffffff;\n          padding: 20px;\n          border-radius: 5px;\n          box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\n        }\n\n        h1 {\n          color: #333;\n        }\n\n        p {\n          color: #555;\n        }\n\n        .footer {\n          margin-top: 20px;\n          padding-top: 10px;\n          border-top: 1px solid #ddd;\n          color: #888;\n          font-size: 12px;\n        }\n    </style>\n</head>\n<body>\n<div class=\"container\">\n    <h1>Thông tin người dùng đã được thay đổi</h1>\n    <p>Một quản trị viên đã thay đổi thông tin tài khoản của bạn.</p>\n    <p>Nếu bạn có thắc mắc về sự thay đổi này, vui lòng liên hệ với chúng tôi bằng cách trả lời email này.</p>\n    <p>Cảm ơn bạn đã sử dụng nền tảng bán hàng của chúng tôi!</p>\n    <div class=\"footer\">\n        <p>Trân trọng,<br />AIMS</p>\n    </div>\n</div>\n</body>\n</html>\n','[\"\"]','Cập nhật thông tin');
/*!40000 ALTER TABLE `template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL,
  `email` varchar(255) NOT NULL,
  `is_blocked` tinyint(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
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

-- Dump completed on 2025-01-02  1:09:30
