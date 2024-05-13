-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: amazondb
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `ward` varchar(255) DEFAULT NULL,
  `seller_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `default_address` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKe5f1yqi42si3d5gpi2dr22umo` (`seller_id`),
  KEY `FKda8tuywtf0gb6sedwk7la1pgi` (`user_id`),
  CONSTRAINT `FKda8tuywtf0gb6sedwk7la1pgi` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKe5f1yqi42si3d5gpi2dr22umo` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'HCM','Thu Duc','KVC','Binh Tho',1,1,_binary ''),(2,'HCM','Thu Duc','KVC','Linh Chieu',NULL,1,_binary '\0'),(12,'HCM','Tan Binh','104','Pho Quang',NULL,1,_binary '\0'),(13,'HCM','Binh Thanh','275 Nguyen Van Dau','15',NULL,1,_binary '\0');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_seq`
--

DROP TABLE IF EXISTS `address_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_seq`
--

LOCK TABLES `address_seq` WRITE;
/*!40000 ALTER TABLE `address_seq` DISABLE KEYS */;
INSERT INTO `address_seq` VALUES (1);
/*!40000 ALTER TABLE `address_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `confirm_password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute`
--

DROP TABLE IF EXISTS `attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKodmc4a3tlyg001pq3owlhwsgv` (`product_id`),
  CONSTRAINT `FKodmc4a3tlyg001pq3owlhwsgv` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute`
--

LOCK TABLES `attribute` WRITE;
/*!40000 ALTER TABLE `attribute` DISABLE KEYS */;
INSERT INTO `attribute` VALUES (1,'Brand','Amazon',1),(2,'Material','Saga',1),(3,'Expired','3 years',1),(4,'Manufacturer ','4 Value',1),(5,'Brand','Amazon',2),(6,'Material','Saga',2),(7,'Expired','3 years',2),(8,'Manufacturer ','4 Value',2),(9,'Brand','Amazon',3),(10,'Material','Saga',3),(11,'Expired','3 years',4),(12,'Manufacturer ','4 Value',5),(13,'Brand','Amazon',5),(14,'Material','Saga',5),(15,'Expired','3 years',5),(16,'Manufacturer ','4 Value',5);
/*!40000 ALTER TABLE `attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bullet`
--

DROP TABLE IF EXISTS `bullet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bullet` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2jlmpiac9rbhamk6o8v87h73g` (`product_id`),
  CONSTRAINT `FK2jlmpiac9rbhamk6o8v87h73g` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bullet`
--

LOCK TABLES `bullet` WRITE;
/*!40000 ALTER TABLE `bullet` DISABLE KEYS */;
/*!40000 ALTER TABLE `bullet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_uk` (`user_id`),
  CONSTRAINT `FKl70asp4l4w0jmbm1tqyofho4o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_line`
--

DROP TABLE IF EXISTS `cart_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_line` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int DEFAULT NULL,
  `cart_id` bigint DEFAULT NULL,
  `variant_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_4mg5yri7ssaadubia8c289goh` (`variant_id`),
  KEY `FK8oljrxf47o5d2jrqo0gh0ds8r` (`cart_id`),
  CONSTRAINT `FK8oljrxf47o5d2jrqo0gh0ds8r` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  CONSTRAINT `FK9312te2f5b4eub4k2n37qcmya` FOREIGN KEY (`variant_id`) REFERENCES `variant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_line`
--

LOCK TABLES `cart_line` WRITE;
/*!40000 ALTER TABLE `cart_line` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `parent_category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdi4x1yrvivfjqs0vsh9ux99dv` (`parent_category_id`),
  CONSTRAINT `FKdi4x1yrvivfjqs0vsh9ux99dv` FOREIGN KEY (`parent_category_id`) REFERENCES `parent_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Top',1),(2,'Bot',1),(3,'Sneaker',2),(4,'Sandals',2),(5,'Men \'s Watch',3),(6,'Necklace',4),(7,'Bracelet',4),(8,'Top',5),(9,'Bot',5),(10,'Sneaker',6),(11,'Sandals',6),(12,'Women\'s Watch',7),(13,'Bracelet',8),(14,'Earring',8),(15,'Top',9),(16,'Bot',9),(17,'Top',10),(18,'Bot',10),(19,'Top',11),(20,'Bot',11),(21,'Sneakers',12),(22,'Sandals',12),(23,'Rings',13),(24,'Bracelet',13),(25,'Uniforms',14),(26,'Top',15),(27,'Bot',15),(28,'Sneakers',16),(29,'Sandals',16),(30,'Bracelet',17),(31,'Rings',17),(32,'Uniforms',18),(33,'Men\'s Perfume',19),(34,'Women\'s Perfume',19),(35,'Skin Care',20),(36,'Hair Care',20);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_room`
--

DROP TABLE IF EXISTS `chat_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_room` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `chat_name` varchar(255) DEFAULT NULL,
  `timestamp` datetime(6) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjqx1ixf0jep8hhi0jxhak9jor` (`user_id`),
  CONSTRAINT `FKjqx1ixf0jep8hhi0jxhak9jor` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_room`
--

LOCK TABLES `chat_room` WRITE;
/*!40000 ALTER TABLE `chat_room` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_room_sellers`
--

DROP TABLE IF EXISTS `chat_room_sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_room_sellers` (
  `chat_room_id` bigint NOT NULL,
  `sellers_id` bigint NOT NULL,
  KEY `FKj0jd3ppt03ype4p4raek00nid` (`sellers_id`),
  KEY `FKgunyl1lido61wjain7064gq5i` (`chat_room_id`),
  CONSTRAINT `FKgunyl1lido61wjain7064gq5i` FOREIGN KEY (`chat_room_id`) REFERENCES `chat_room` (`id`),
  CONSTRAINT `FKj0jd3ppt03ype4p4raek00nid` FOREIGN KEY (`sellers_id`) REFERENCES `seller` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_room_sellers`
--

LOCK TABLES `chat_room_sellers` WRITE;
/*!40000 ALTER TABLE `chat_room_sellers` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_room_sellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `review_id` bigint DEFAULT NULL,
  `seller_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnf4ni761w29tmtgdxymmgvg8r` (`review_id`),
  KEY `FKpuvjbvilmejcati6qfv7fk4jr` (`seller_id`),
  CONSTRAINT `FKnf4ni761w29tmtgdxymmgvg8r` FOREIGN KEY (`review_id`) REFERENCES `review` (`id`),
  CONSTRAINT `FKpuvjbvilmejcati6qfv7fk4jr` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `img_path` varchar(255) DEFAULT NULL,
  `store_category_id` bigint DEFAULT NULL,
  `variant_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKop02g2fq5creudb8syiboj1v4` (`store_category_id`),
  KEY `FKhwsd8yi59lrjdglentdi7y0lr` (`variant_id`),
  KEY `FKgpextbyee3uk9u6o2381m7ft1` (`product_id`),
  CONSTRAINT `FKgpextbyee3uk9u6o2381m7ft1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKhwsd8yi59lrjdglentdi7y0lr` FOREIGN KEY (`variant_id`) REFERENCES `variant` (`id`),
  CONSTRAINT `FKop02g2fq5creudb8syiboj1v4` FOREIGN KEY (`store_category_id`) REFERENCES `store_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/hongtt34/Samsung-Galaxy-Z-Flip5-1.jpg',NULL,1,NULL),(2,'https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/02/Samsung-Galaxy-Z-Flip5-3.jpg',NULL,1,NULL),(3,'https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/02/Samsung-Galaxy-Z-Flip5-6.jpg',NULL,1,NULL),(4,'https://images.fpt.shop/unsafe/filters:quality(90)/fptshop.com.vn/Uploads/images/2015/Tin-Tuc/hongtt34/Samsung-Galaxy-Z-Flip5-3.jpg',NULL,1,NULL),(5,'https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/Phone/Samsung/samsung_s/S23/Samsung-Galaxy-S23-Plus-6.jpg',NULL,2,NULL),(6,'https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/Phone/Samsung/samsung_s/S23/Samsung-Galaxy-S23-Plus-14.jpg',NULL,2,NULL),(7,'https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/Phone/Samsung/samsung_s/S23/Samsung-Galaxy-S23-Plus-7.jpg',NULL,2,NULL),(8,'https://cdn2.cellphones.com.vn/insecure/rs:fill:0:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/Phone/Samsung/samsung_s/S23/Samsung-Galaxy-S23-Plus-2.jpg',NULL,2,NULL),(9,'https://m.media-amazon.com/images/S/aplus-media/vc/af10b8af-6a97-494c-96db-0d85f82f6a0e.__CR0,0,800,600_PT0_SX800_V1___.jpg',NULL,3,NULL),(10,'https://m.media-amazon.com/images/S/aplus-media/vc/4d89a921-5589-482f-8f19-0e0ef40d4015.__CR0,0,800,600_PT0_SX800_V1___.jpg',NULL,3,NULL),(11,'https://m.media-amazon.com/images/S/aplus-media/vc/2b9ad0a9-4a6e-4eba-8eb7-71947e3c0f73.__CR0,0,800,600_PT0_SX800_V1___.jpg',NULL,3,NULL),(12,'https://m.media-amazon.com/images/S/aplus-media/vc/8c3f90da-2731-4ff7-8f04-9463a87c636d.__CR133,0,800,600_PT0_SX800_V1___.jpg',NULL,3,NULL),(13,'https://m.media-amazon.com/images/S/aplus-media/vc/1a0fe803-aad3-4760-b7ee-cfbb2b1a90bb.__CR0,0,1021,766_PT0_SX800_V1___.jpg',NULL,3,NULL),(14,'https://m.media-amazon.com/images/I/61JQeqmlXdL._AC_SX679_.jpg',NULL,4,NULL),(15,'https://m.media-amazon.com/images/I/61JQeqmlXdL._AC_SX679_.jpg',NULL,4,NULL),(16,'https://m.media-amazon.com/images/I/61JQeqmlXdL._AC_SX679_.jpg',NULL,4,NULL),(17,'https://m.media-amazon.com/images/I/61JQeqmlXdL._AC_SX679_.jpg',NULL,4,NULL),(18,'https://pos.nvncdn.com/8c9639-78018/ps/20240116_0g043OwT6F.jpeg',NULL,5,NULL),(19,'https://pos.nvncdn.com/8c9639-78018/ps/20240116_0g043OwT6F.jpeg',NULL,5,NULL),(20,'https://pos.nvncdn.com/8c9639-78018/ps/20240116_d56cei62MQ.jpeg',NULL,5,NULL),(21,'https://pos.nvncdn.com/8c9639-78018/ps/20240116_sNHYiagyY8.jpeg',NULL,5,NULL),(22,'https://pos.nvncdn.com/8c9639-78018/ps/20230907_JpPRQdRJje.jpeg',NULL,6,NULL),(23,'https://pos.nvncdn.com/8c9639-78018/ps/20230825_7NnlxNlbeH.jpeg',NULL,6,NULL),(24,'https://pos.nvncdn.com/8c9639-78018/ps/20230913_pKXNLWYqKA.jpeg',NULL,6,NULL),(25,'https://pos.nvncdn.com/8c9639-78018/ps/20230907_A89C8Yy6lD.jpeg',NULL,6,NULL),(26,'https://pos.nvncdn.com/8c9639-78018/ps/20231124_jeOXt8fwW4.jpeg',NULL,7,NULL),(27,'https://pos.nvncdn.com/8c9639-78018/ps/20231106_sVhlquYrIp.jpeg',NULL,7,NULL),(28,'https://pos.nvncdn.com/8c9639-78018/ps/20231124_V1M1IjVSGi.jpeg',NULL,7,NULL),(29,'https://pos.nvncdn.com/8c9639-78018/ps/20231106_mpBCxZ3yuh.jpeg',NULL,7,NULL),(30,'https://pos.nvncdn.com/8c9639-78018/ps/20220909_tySPGZlyi0lVeaNid3r931bF.jpg',NULL,8,NULL),(31,'https://pos.nvncdn.com/8c9639-78018/ps/20230303_MadIlPkJrLFaQFrT.jpeg',NULL,8,NULL),(32,'https://pos.nvncdn.com/8c9639-78018/ps/20221214_zKpje6qS4cOTIlrCUadzGIrD.jpg',NULL,8,NULL);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_category`
--

DROP TABLE IF EXISTS `main_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_category`
--

LOCK TABLES `main_category` WRITE;
/*!40000 ALTER TABLE `main_category` DISABLE KEYS */;
INSERT INTO `main_category` VALUES (1,'Men\'s Fashion'),(2,'Women\'s Fashion'),(3,'Kid\'s Fashion'),(4,'Boy\'s Fashion'),(5,'Girl\'s Fashion'),(6,'Beauty');
/*!40000 ALTER TABLE `main_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `option_table`
--

DROP TABLE IF EXISTS `option_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `option_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKm9cu0j5aiumj8l980rl0npyuc` (`product_id`),
  CONSTRAINT `FKm9cu0j5aiumj8l980rl0npyuc` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `option_table`
--

LOCK TABLES `option_table` WRITE;
/*!40000 ALTER TABLE `option_table` DISABLE KEYS */;
INSERT INTO `option_table` VALUES (1,'Color',1,NULL),(2,'Size',1,NULL),(3,'Color',2,NULL),(4,'Size',2,NULL),(5,'Color',3,NULL),(6,'Size',3,NULL),(7,'Color',4,NULL),(8,'Length',4,NULL),(9,'Color',5,NULL),(10,'Length',5,NULL),(11,'Color',6,NULL),(12,'Length',6,NULL);
/*!40000 ALTER TABLE `option_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `optionvalue`
--

DROP TABLE IF EXISTS `optionvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `optionvalue` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `value` varchar(255) DEFAULT NULL,
  `option_id` bigint DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5wwdvjt16wq8psj2hb79i5fmj` (`option_id`),
  CONSTRAINT `FK5wwdvjt16wq8psj2hb79i5fmj` FOREIGN KEY (`option_id`) REFERENCES `option_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `optionvalue`
--

LOCK TABLES `optionvalue` WRITE;
/*!40000 ALTER TABLE `optionvalue` DISABLE KEYS */;
INSERT INTO `optionvalue` VALUES (1,'Blue',1,NULL),(2,'Red',1,NULL),(3,'S',2,NULL),(4,'M',2,NULL),(5,'Blue',3,NULL),(6,'Black',3,NULL),(7,'S',4,NULL),(8,'M',4,NULL),(9,'RED',5,NULL),(10,'MIN',5,NULL),(11,'XL',6,NULL),(12,'XL',6,NULL),(13,'Pink',7,NULL),(14,'Green',7,NULL),(15,'12cm',8,NULL),(16,'10cm',8,NULL),(17,'Pink',9,NULL),(18,'Green',9,NULL),(19,'12cm',10,NULL),(20,'10cm',10,NULL),(21,'Pink',11,NULL),(22,'Green',11,NULL),(23,'12cm',12,NULL),(24,'10cm',12,NULL);
/*!40000 ALTER TABLE `optionvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `quantity` int NOT NULL,
  `order_id` bigint DEFAULT NULL,
  `variant_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKt4dc2r9nbvbujrljv3e23iibt` (`order_id`),
  KEY `FKbysnyo102axy9hhcx4fnnyx3w` (`variant_id`),
  CONSTRAINT `FKbysnyo102axy9hhcx4fnnyx3w` FOREIGN KEY (`variant_id`) REFERENCES `variant` (`id`),
  CONSTRAINT `FKt4dc2r9nbvbujrljv3e23iibt` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,24.99,1,1,6),(2,17.91,2,1,1),(3,17.91,1,2,1),(4,17.91,3,3,1),(5,17.91,2,4,1),(6,24.99,4,5,8),(7,17.91,30,6,1),(8,24.99,4,7,4),(9,10.19,1,8,1);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_date` varchar(255) DEFAULT NULL,
  `order_total` double DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `address_id` bigint DEFAULT NULL,
  `payment_method_id` bigint DEFAULT NULL,
  `shipping_method_id` bigint DEFAULT NULL,
  `store_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `accepted_at` datetime(6) DEFAULT NULL,
  `canceled_at` datetime(6) DEFAULT NULL,
  `completed_at` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `delivering_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKf5464gxwc32ongdvka2rtvw96` (`address_id`),
  KEY `FKgeqwl6x0iadp9e2459uh3o8fv` (`payment_method_id`),
  KEY `FK1bpkyadf57g8aq50sa975jip` (`shipping_method_id`),
  KEY `FK5n14sr4mswfdtaoiwj7rkt0mw` (`store_id`),
  KEY `FKel9kyl84ego2otj2accfd8mr7` (`user_id`),
  CONSTRAINT `FK1bpkyadf57g8aq50sa975jip` FOREIGN KEY (`shipping_method_id`) REFERENCES `shipping_method` (`id`),
  CONSTRAINT `FK5n14sr4mswfdtaoiwj7rkt0mw` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`),
  CONSTRAINT `FKel9kyl84ego2otj2accfd8mr7` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKf5464gxwc32ongdvka2rtvw96` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `FKgeqwl6x0iadp9e2459uh3o8fv` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2024-05-06',68.81,'COMPLETED',1,1,1,1,1,NULL,NULL,NULL,NULL,NULL),(2,'2024-05-06',25.91,'COMPLETED',2,1,1,1,1,NULL,NULL,NULL,NULL,NULL),(3,'2024-05-07',61.730000000000004,'PENDING',12,3,1,1,1,NULL,NULL,NULL,NULL,NULL),(4,'2024-05-07',43.82,'COMPLETED',13,5,1,1,1,NULL,NULL,NULL,NULL,NULL),(5,'2024-05-10',107.96,'PENDING',2,1,1,1,1,NULL,NULL,NULL,NULL,NULL),(6,'2024-05-11',545.3,'PENDING',1,5,1,1,1,NULL,NULL,NULL,NULL,NULL),(7,'2024-05-12',107.96,'PENDING',13,5,1,1,1,NULL,NULL,NULL,NULL,NULL),(8,'2024-05-13',18.189999999999998,'PENDING',13,3,1,1,1,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parent_category`
--

DROP TABLE IF EXISTS `parent_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parent_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `main_category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjo1jmq2baat3qp2natesobtjw` (`main_category_id`),
  CONSTRAINT `FKjo1jmq2baat3qp2natesobtjw` FOREIGN KEY (`main_category_id`) REFERENCES `main_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parent_category`
--

LOCK TABLES `parent_category` WRITE;
/*!40000 ALTER TABLE `parent_category` DISABLE KEYS */;
INSERT INTO `parent_category` VALUES (1,'Clothing',1),(2,'Shoes',1),(3,'Watches',1),(4,'Accesories',1),(5,'Clothing',2),(6,'Shoes',2),(7,'Watches',2),(8,'Accesories',2),(9,'Under 1 years',3),(10,'1 to 6 Years',3),(11,'Clothing',4),(12,'Shoes',4),(13,'Accesories',4),(14,'Shool Uniforms',4),(15,'Clothing',5),(16,'Shoes',5),(17,'Accesories',5),(18,'Shool Uniforms',5),(19,'Perfumes',6),(20,'Makeup',6);
/*!40000 ALTER TABLE `parent_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_token`
--

DROP TABLE IF EXISTS `password_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_token` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `expiry_date` datetime(6) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_gbs8o6n9w9gik94if9etivdoh` (`user_id`),
  CONSTRAINT `FKm1ug9u624tahdket1qqn0s9cg` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_token`
--

LOCK TABLES `password_token` WRITE;
/*!40000 ALTER TABLE `password_token` DISABLE KEYS */;
INSERT INTO `password_token` VALUES (17,'2024-05-08 18:58:52.783000','eb8189c3-5948-40cf-83c9-1eac06751e57',1);
/*!40000 ALTER TABLE `password_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_method` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cart_number` decimal(38,0) DEFAULT NULL,
  `default_payment` bit(1) DEFAULT NULL,
  `expiration_date` varchar(255) DEFAULT NULL,
  `name_on_card` varchar(255) DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9qgi86n91j5kxnymanelaa1ag` (`user_id`),
  CONSTRAINT `FK9qgi86n91j5kxnymanelaa1ag` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_method`
--

LOCK TABLES `payment_method` WRITE;
/*!40000 ALTER TABLE `payment_method` DISABLE KEYS */;
INSERT INTO `payment_method` VALUES (1,11111111,NULL,'05/27','abc',1),(2,12345678910111,NULL,'02/24','VIETCOMBANK',1),(3,4703122512369856,NULL,'02/24','AGRIBANK',1),(4,1111111111111111,NULL,'05/23','VIETCOMBANK',1),(5,4732023658963145,NULL,'05/25','SHINHANBANK',1);
/*!40000 ALTER TABLE `payment_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_at` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `main_picture` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  `store_id` bigint DEFAULT NULL,
  `store_category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`),
  KEY `FKjlfidudl1gwqem0flrlomvlcl` (`store_id`),
  KEY `FKk1wgaghyc5ank9xwjlofbdbvu` (`store_category_id`),
  CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FKjlfidudl1gwqem0flrlomvlcl` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`),
  CONSTRAINT `FKk1wgaghyc5ank9xwjlofbdbvu` FOREIGN KEY (`store_category_id`) REFERENCES `store_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'2024-05-05 11:38:14.000000','Factory Unlocked Android Smartphone, 256GB, Compact, Foldable Design, One-Hand Control, Best Selfies, Full Cover Screen, Hands-Free Use, US Version, 2023, Mint','https://m.media-amazon.com/images/I/61NKaFRAyRL._AC_SL1500_.jpg','Active','SAMSUNG Galaxy Z Flip 5 Cell Phone','2024-05-05 11:38:14.000000',1,1,1),(2,'2024-05-05 11:38:14.000000','Nice Item, good quatity','https://pos.nvncdn.com/8c9639-78018/ps/20240116_R7tDuN4qOB.jpeg','Active','Shirt For Men','2024-05-05 11:38:14.000000',1,1,1),(3,'2024-05-05 11:38:14.000000','Factory Unlocked Android Smartphone, 128GB, 6.5” FHD Super AMOLED Screen, Long Battery Life, US Version, Black','https://m.media-amazon.com/images/I/71HN4P-pd5L._AC_SX679_.jpg','Active','SAMSUNG Galaxy A53 5G Cell Phone','2024-05-05 11:38:14.000000',1,1,1),(4,'2024-05-05 11:38:14.000000','Series Quantum HDR+, Dolby Atmos Object Tracking Sound Lite, Direct Full Array, Q-Symphony 3.0, Gaming Hub, Smart TV with Alexa Built-in (QN75Q80C, 2023 Model)','https://m.media-amazon.com/images/I/81QKVuZZa7L._AC_SL1500_.jpg','Active','SAMSUNG 75-Inch QLED 4K Q80C TV','2024-05-05 11:38:14.000000',1,1,1),(5,'2024-05-05 11:38:14.000000','Dolby Atmos, Object Tracking Sound+, Anti-Glare, Gaming Hub, Q-Symphony, Smart TV with Alexa Built-in (QN85QN90C, 2023 Model)','https://m.media-amazon.com/images/I/81mu53Xnv2L._AC_SL1500_.jpg','Active','SAMSUNG 85-Inch Neo QLED 4K QN90C TV','2024-05-05 11:38:14.000000',1,1,1),(6,'2024-05-05 11:38:14.000000','Series Quantum HDR, Dolby Atmos, Object Tracking Sound, Laser Slim Design, Smart TV with Alexa Built-In (QN55S95BAFXZA, 2022 Model)','https://m.media-amazon.com/images/I/81VgG90AUIL._AC_SL1500_.jpg','Active','SAMSUNG 55-Inch OLED 4K S95B TV','2024-05-05 11:38:14.000000',1,1,1),(7,'2024-05-05 11:38:14.000000','P68 Water- and Dust-Resistant, Long Battery Life, Powerful Processor, S Pen, 8MP Camera, US Version, 2023, Mint','https://m.media-amazon.com/images/I/51p6DZSg3kL._AC_SL1500_.jpg','Active','SAMSUNG Galaxy Tab S9 FE Wi-Fi 10.9\" 128GB, Free Smart Book Cover','2024-05-05 11:38:14.000000',1,1,1),(8,'2024-05-05 11:38:14.000000','Detailed Drawing, Comfort Grip, Premium Sleek Design, Compatible with Galaxy S21 Ultra and Higher, Galaxy Note10 and Higher, Galaxy Tab S Series and PCs, White','https://m.media-amazon.com/images/I/41hbLtiXoyL._AC_SX679_.jpg','Active','SAMSUNG Galaxy Tab S9 FE S Pen Accessory','2024-05-05 11:38:14.000000',1,1,1),(9,'2024-05-05 11:38:14.000000','13th Gen Intel Core i7-1355U Processor / 16 GB / 512GB, Thin and Light, FHD Screen, Fingerprint Reader, HD Webcam, 2023 Model, NP750XFG-KB2US, Silver','https://m.media-amazon.com/images/I/61g-UVN2ZpL._AC_SX466_.jpg','Active','SAMSUNG 15.6” Galaxy Book3 Laptop Computer','2024-05-05 11:38:14.000000',1,1,1),(10,'2024-05-05 11:38:14.000000','Wi-Fi, Lightweight Slim Durable Design, 12-Hour-Battery, 4GB Memory, 32GB eMMC, Silver/Black','https://m.media-amazon.com/images/I/815zitaLEvS._AC_SX466_.jpg','Active','SAMSUNG Galaxy Chromebook Go 14\" Laptop Computer','2024-05-05 11:38:14.000000',1,1,1),(11,'2024-05-05 11:38:14.000000','Home System w/ HEPA Filtration, 360 Degree Purification, Pet Mode, Smart Control, Traps Dust, AX350A9350N, Grey','https://m.media-amazon.com/images/I/91WfzWpcQoL._AC_SL1500_.jpg','Active','SAMSUNG BESPOKE Cube Air Purifier, Odor Eliminator','2024-05-05 11:38:14.000000',1,1,1),(12,'2024-05-05 11:38:14.000000','lim Width for Small Spaces, Even Cooling, LED Lighting, Slide Shelf, RB10FSR4ESR/AA, Fingerprint Resistant Stainless Steel','https://m.media-amazon.com/images/I/710GecmYvWL._AC_SL1500_.jpg','Active','SAMSUNG 11.3 Cu Ft 24\" Bottom Freezer Refrigerator','2024-05-05 11:38:14.000000',1,1,1),(13,'2024-05-05 11:38:14.000000','Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday','https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg','Active','Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops','2024-05-05 11:38:14.000000',1,1,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productattribute`
--

DROP TABLE IF EXISTS `productattribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productattribute` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbdeahwkm4d4qqyvromy4dk2os` (`product_id`),
  CONSTRAINT `FKbdeahwkm4d4qqyvromy4dk2os` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productattribute`
--

LOCK TABLES `productattribute` WRITE;
/*!40000 ALTER TABLE `productattribute` DISABLE KEYS */;
INSERT INTO `productattribute` VALUES (1,'Brand','Amazon',1),(2,'Material','Saga',1),(3,'Expired','3 years',1),(4,'Manufacturer ','4 Value',1),(5,'Brand','Amazon',2),(6,'Material','Saga',2),(7,'Expired','3 years',2),(8,'Manufacturer ','4 Value',2),(9,'Brand','Amazon',3),(10,'Material','Saga',3),(11,'Expired','3 years',4),(12,'Manufacturer ','4 Value',5),(13,'Brand','Amazon',5),(14,'Material','Saga',5),(15,'Expired','3 years',5),(16,'Manufacturer ','4 Value',5);
/*!40000 ALTER TABLE `productattribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `create_at` datetime(6) DEFAULT NULL,
  `image01` varchar(255) DEFAULT NULL,
  `image02` varchar(255) DEFAULT NULL,
  `image03` varchar(255) DEFAULT NULL,
  `image04` varchar(255) DEFAULT NULL,
  `image05` varchar(255) DEFAULT NULL,
  `star` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `update_at` datetime(6) DEFAULT NULL,
  `verified_admin` bit(1) NOT NULL,
  `verified_shop` bit(1) NOT NULL,
  `video` varchar(255) DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  `variant_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrrkqlt8co52qjdj34nqv97xn4` (`customer_id`),
  KEY `FKe8m89ak394e2uwpvivnvhmoi0` (`variant_id`),
  CONSTRAINT `FKe8m89ak394e2uwpvivnvhmoi0` FOREIGN KEY (`variant_id`) REFERENCES `variant` (`id`),
  CONSTRAINT `FKrrkqlt8co52qjdj34nqv97xn4` FOREIGN KEY (`customer_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,'Seriously these are the best things I\'ve found. They have helped my plantar fascitis better than the Shot the foot doctor gave, and the many physical therapy appointments which cost me every time I went. I wish I had found them before all that. Even after','2024-05-05 12:08:43.000000','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg',5,'I wish that I had found these before I spent 1000\"s on doctors and Physical therapy','2024-05-05 12:08:43.000000',_binary '',_binary '',NULL,1,1),(2,'Seriously these are the best things I\'ve found. They have helped my plantar fascitis better than the Shot the foot doctor gave, and the many physical therapy appointments which cost me every time I went. I wish I had found them before all that. Even after','2024-05-05 12:08:43.000000','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg',4,'I wish that I had found these before I spent 1000\"s on doctors and Physical therapy','2024-05-05 12:08:43.000000',_binary '',_binary '',NULL,1,1),(3,'Seriously these are the best things I\'ve found. They have helped my plantar fast better than the Shot the foot doctor gave, and the many physical therapy appointments which cost me every time I went. I wish I had found them before all that. Even after all','2024-05-05 12:08:43.000000','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg',3,'I wish that I had found these before I spent 1000\"s on doctors and Physical therapy','2024-05-05 12:08:43.000000',_binary '',_binary '',NULL,1,1),(4,'Seriously these are the best things I\'ve found. They have helped my plantar fascitis better than the Shot the foot doctor gave, and the many physical therapy appointments which cost me every time I went. I wish I had found them before all that. Even after','2024-05-05 12:08:43.000000','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg',1,'I wish that I had found these before I spent 1000\"s on doctors and Physical therapy','2024-05-05 12:08:43.000000',_binary '',_binary '',NULL,1,1),(5,'Seriously these are the best things I\'ve found. They have helped my plantar fascitis better than the Shot the foot doctor gave, and the many physical therapy appointments which cost me every time I went. I wish I had found them before all that. Even after','2024-05-05 12:08:43.000000','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg',2,'I wish that I had found these before I spent 1000\"s on doctors and Physical therapy','2024-05-05 12:08:43.000000',_binary '',_binary '',NULL,1,2),(6,'Seriously these are the best things I\'ve found. They have helped my plantar fascitis better than the Shot the foot doctor gave, and the many physical therapy appointments which cost me every time I went. I wish I had found them before all that. Even after','2024-05-05 12:08:43.000000','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg',2,'I wish that I had found these before I spent 1000\"s on doctors and Physical therapy','2024-05-05 12:08:43.000000',_binary '',_binary '',NULL,1,2),(7,'Seriously these are the best things I\'ve found. They have helped my plantar fascitis better than the Shot the foot doctor gave, and the many physical therapy appointments which cost me every time I went. I wish I had found them before all that. Even after','2024-05-05 12:08:43.000000','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg',2,'I wish that I had found these before I spent 1000\"s on doctors and Physical therapy','2024-05-05 12:08:43.000000',_binary '',_binary '',NULL,1,2),(8,'Seriously these are the best things I\'ve found. They have helped my plantar fascitis better than the Shot the foot doctor gave, and the many physical therapy appointments which cost me every time I went. I wish I had found them before all that. Even after','2024-05-05 12:08:43.000000','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg',4,'I wish that I had found these before I spent 1000\"s on doctors and Physical therapy','2024-05-05 12:08:43.000000',_binary '',_binary '',NULL,1,2),(9,'Seriously these are the best things I\'ve found. They have helped my plantar fascitis better than the Shot the foot doctor gave, and the many physical therapy appointments which cost me every time I went. I wish I had found them before all that. Even after','2024-05-05 12:08:43.000000','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg',1,'I wish that I had found these before I spent 1000\"s on doctors and Physical therapy','2024-05-05 12:08:43.000000',_binary '',_binary '',NULL,1,2),(10,'Seriously these are the best things I\'ve found. They have helped my plantar fascitis better than the Shot the foot doctor gave, and the many physical therapy appointments which cost me every time I went. I wish I had found them before all that. Even after','2024-05-05 12:08:43.000000','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg',1,'I wish that I had found these before I spent 1000\"s on doctors and Physical therapy','2024-05-05 12:08:43.000000',_binary '',_binary '',NULL,1,1),(11,'Seriously these are the best things I\'ve found. They have helped my plantar fascitis better than the Shot the foot doctor gave, and the many physical therapy appointments which cost me every time I went. I wish I had found them before all that. Even after','2024-05-05 12:08:43.000000','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg',1,'I wish that I had found these before I spent 1000\"s on doctors and Physical therapy','2024-05-05 12:08:43.000000',_binary '',_binary '',NULL,1,3),(12,'Seriously these are the best things I\'ve found. They have helped my plantar fascitis better than the Shot the foot doctor gave, and the many physical therapy appointments which cost me every time I went. I wish I had found them before all that. Even after','2024-05-05 12:08:43.000000','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg',1,'I wish that I had found these before I spent 1000\"s on doctors and Physical therapy','2024-05-05 12:08:43.000000',_binary '',_binary '',NULL,1,4),(13,'Seriously these are the best things I\'ve found. They have helped my plantar fascitis better than the Shot the foot doctor gave, and the many physical therapy appointments which cost me every time I went. I wish I had found them before all that. Even after','2024-05-05 12:08:43.000000','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg',1,'I wish that I had found these before I spent 1000\"s on doctors and Physical therapy','2024-05-05 12:08:43.000000',_binary '',_binary '',NULL,1,5),(14,'Seriously these are the best things I\'ve found. They have helped my plantar fascitis better than the Shot the foot doctor gave, and the many physical therapy appointments which cost me every time I went. I wish I had found them before all that. Even after','2024-05-05 12:08:43.000000','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg',1,'I wish that I had found these before I spent 1000\"s on doctors and Physical therapy','2024-05-05 12:08:43.000000',_binary '',_binary '',NULL,1,6),(15,'Seriously these are the best things I\'ve found. They have helped my plantar fascitis better than the Shot the foot doctor gave, and the many physical therapy appointments which cost me every time I went. I wish I had found them before all that. Even after','2024-05-05 12:08:43.000000','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg','https://m.media-amazon.com/images/I/71kp5w3wNVL.__AC_SX300_SY300_QL70_FMwebp_.jpg',3,'I wish that I had found these before I spent 1000\"s on doctors and Physical therapy','2024-05-05 12:08:43.000000',_binary '',_binary '',NULL,1,1),(16,'You need to buy something more','2024-05-05 17:13:25.072000',NULL,NULL,NULL,NULL,NULL,5,' Nice product, i love it!!!','2024-05-05 17:13:25.072000',_binary '',_binary '',NULL,1,1),(32,'asdasdasd','2024-05-08 23:59:51.245000',NULL,NULL,NULL,NULL,NULL,2,'toi test thu','2024-05-08 23:59:51.245000',_binary '',_binary '',NULL,1,1),(33,'13123123123','2024-05-10 17:54:09.276000',NULL,NULL,NULL,NULL,NULL,0,'ahihihih','2024-05-10 17:54:09.276000',_binary '',_binary '',NULL,1,1),(34,'13123123123','2024-05-10 17:54:09.782000',NULL,NULL,NULL,NULL,NULL,0,'ahihihih','2024-05-10 17:54:09.782000',_binary '',_binary '',NULL,1,1),(35,'13123123123','2024-05-10 17:54:10.192000',NULL,NULL,NULL,NULL,NULL,0,'ahihihih','2024-05-10 17:54:10.192000',_binary '',_binary '',NULL,1,1),(36,'13123123123','2024-05-10 17:54:12.406000',NULL,NULL,NULL,NULL,NULL,1,'ahihihih','2024-05-10 17:54:12.406000',_binary '',_binary '',NULL,1,1),(37,'gkhk','2024-05-10 17:54:56.370000',NULL,NULL,NULL,NULL,NULL,1,'kjhkjh','2024-05-10 17:54:56.370000',_binary '',_binary '',NULL,1,1),(38,'fffff','2024-05-10 17:54:56.370000',NULL,NULL,NULL,NULL,NULL,5,'sssssss','2024-05-10 17:54:56.370000',_binary '',_binary '',NULL,1,1);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `save_for_later`
--

DROP TABLE IF EXISTS `save_for_later`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `save_for_later` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int DEFAULT NULL,
  `cart_id` bigint DEFAULT NULL,
  `variant_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_qvvfnp67vb8s7u1tvlbxok5pv` (`variant_id`),
  KEY `FKs80bksujhm0wl4tge38kbqim4` (`cart_id`),
  CONSTRAINT `FKpplj306vxajeb5x5hxm131jtk` FOREIGN KEY (`variant_id`) REFERENCES `variant` (`id`),
  CONSTRAINT `FKs80bksujhm0wl4tge38kbqim4` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `save_for_later`
--

LOCK TABLES `save_for_later` WRITE;
/*!40000 ALTER TABLE `save_for_later` DISABLE KEYS */;
INSERT INTO `save_for_later` VALUES (102,2,1,1);
/*!40000 ALTER TABLE `save_for_later` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `balance` double DEFAULT NULL,
  `birthday` datetime(6) DEFAULT NULL,
  `confirm_password` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `seller_name` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES (1,NULL,NULL,NULL,NULL,'test@gmail.com',_binary '','$2a$10$/XsJbKEaw.TLGGUPgWBTH.pyBaxBTVfciUSGZ.PNBYt2ejOt2CIy2',NULL,'ROLE_SELLER','Samsung',NULL),(2,NULL,NULL,NULL,NULL,'hoangnghiango999@gmail.com',_binary '','$2a$12$NGY3wbgZlvy6C3Mq3As9feUdXFsNEXhtzn2nEX5XPEH96gbOShjz6',NULL,'ROLE_SELLER','HoangNghia1907',NULL),(3,NULL,NULL,NULL,NULL,'thienphu9706@gmail.com',_binary '','$2a$12$NGY3wbgZlvy6C3Mq3As9feUdXFsNEXhtzn2nEX5XPEH96gbOShjz6',NULL,'ROLE_SELLER','ThienPhu2705',NULL),(4,NULL,NULL,NULL,NULL,'test@gmail.com',_binary '','$2a$12$NGY3wbgZlvy6C3Mq3As9feUdXFsNEXhtzn2nEX5XPEH96gbOShjz6',NULL,'ROLE_SELLER','Samsung',NULL),(5,NULL,NULL,NULL,NULL,'hoangnghiango999@gmail.com',_binary '','$2a$12$NGY3wbgZlvy6C3Mq3As9feUdXFsNEXhtzn2nEX5XPEH96gbOShjz6',NULL,'ROLE_SELLER','HoangNghia1907',NULL),(6,NULL,NULL,NULL,NULL,'thienphu9706@gmail.com',_binary '','$2a$12$NGY3wbgZlvy6C3Mq3As9feUdXFsNEXhtzn2nEX5XPEH96gbOShjz6',NULL,'ROLE_SELLER','ThienPhu2705',NULL);
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipper`
--

DROP TABLE IF EXISTS `shipper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipper` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `balance` double DEFAULT NULL,
  `birthday` datetime(6) DEFAULT NULL,
  `confirm_password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipper`
--

LOCK TABLES `shipper` WRITE;
/*!40000 ALTER TABLE `shipper` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_method`
--

DROP TABLE IF EXISTS `shipping_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping_method` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_method`
--

LOCK TABLES `shipping_method` WRITE;
/*!40000 ALTER TABLE `shipping_method` DISABLE KEYS */;
INSERT INTO `shipping_method` VALUES (1,'STANDARD',8);
/*!40000 ALTER TABLE `shipping_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_order`
--

DROP TABLE IF EXISTS `shop_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_date` varchar(255) DEFAULT NULL,
  `order_total` double DEFAULT NULL,
  `quantity` int NOT NULL,
  `address_id` bigint DEFAULT NULL,
  `payment_method_id` bigint DEFAULT NULL,
  `shipping_method_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `variant_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7qvgu9j9j0webqibpbjggiq10` (`address_id`),
  KEY `FK6f8eia37r3t36jyqsi8a051bg` (`payment_method_id`),
  KEY `FKr071vaj9u2aey781nm0hj09y7` (`shipping_method_id`),
  KEY `FK7ln2hb3a1ugyr7h92rloxv0b` (`user_id`),
  KEY `FK6dcws8clc2mijgm8irmx9m305` (`variant_id`),
  CONSTRAINT `FK6dcws8clc2mijgm8irmx9m305` FOREIGN KEY (`variant_id`) REFERENCES `variant` (`id`),
  CONSTRAINT `FK6f8eia37r3t36jyqsi8a051bg` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`id`),
  CONSTRAINT `FK7ln2hb3a1ugyr7h92rloxv0b` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK7qvgu9j9j0webqibpbjggiq10` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `FKr071vaj9u2aey781nm0hj09y7` FOREIGN KEY (`shipping_method_id`) REFERENCES `shipping_method` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_order`
--

LOCK TABLES `shop_order` WRITE;
/*!40000 ALTER TABLE `shop_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `admin_reply` varchar(255) DEFAULT NULL,
  `deals_image` varchar(255) DEFAULT NULL,
  `deals_square_image` varchar(255) DEFAULT NULL,
  `editting_name` varchar(255) DEFAULT NULL,
  `home_image` varchar(255) DEFAULT NULL,
  `interactive_image` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `seller_id` bigint DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `editing_name` varchar(255) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_lm3wwmh9c4ba8a8bd20gu2fhk` (`seller_id`),
  CONSTRAINT `FKj4q0xpdv18obklj5r7vxn4gdh` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,NULL,'https://m.media-amazon.com/images/S/al-na-9d5791cf-3faf/d055fa5e-475d-46bf-b294-20e0032ca4ae._CR0%2C0%2C3000%2C600_SX1920_.jpg','https://m.media-amazon.com/images/S/al-na-9d5791cf-3faf/b54208fd-28ef-4d09-87e0-e7fb7a2a63c1._CR0%2C0%2C1500%2C1500_SX480_SY480_.jpg',NULL,'https://m.media-amazon.com/images/S/al-na-9d5791cf-3faf/1f6cbd86-1e6a-42d5-bd7c-e137bfef3fc6._CR0%2C0%2C3000%2C600_SX1920_.jpg','https://m.media-amazon.com/images/S/aplus-media-library-service-media/4ecf88c7-c019-4a3e-8d40-6867ac6ebd8a.__CR0,0,2022,1251_PT0_SX970_V1___.png','https://1000logos.net/wp-content/uploads/2017/06/Samsung-emblem.png','Samsung Store',1,NULL,NULL,NULL),(2,NULL,'https://m.media-amazon.com/images/S/al-na-9d5791cf-3faf/d055fa5e-475d-46bf-b294-20e0032ca4ae._CR0%2C0%2C3000%2C600_SX1920_.jpg','https://m.media-amazon.com/images/S/al-na-9d5791cf-3faf/b54208fd-28ef-4d09-87e0-e7fb7a2a63c1._CR0%2C0%2C1500%2C1500_SX480_SY480_.jpg',NULL,'https://m.media-amazon.com/images/S/al-na-9d5791cf-3faf/1f6cbd86-1e6a-42d5-bd7c-e137bfef3fc6._CR0%2C0%2C3000%2C600_SX1920_.jpg','https://m.media-amazon.com/images/S/aplus-media-library-service-media/4ecf88c7-c019-4a3e-8d40-6867ac6ebd8a.__CR0,0,2022,1251_PT0_SX970_V1___.png','https://1000logos.net/wp-content/uploads/2017/06/Samsung-emblem.png','Flowers Store',2,NULL,NULL,NULL);
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_category`
--

DROP TABLE IF EXISTS `store_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  `store_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKm2p2repecp4mx2i2ibmw75deb` (`category_id`),
  KEY `FK3xftrk8cr9na0kj9c21kirtwt` (`store_id`),
  CONSTRAINT `FK3xftrk8cr9na0kj9c21kirtwt` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`),
  CONSTRAINT `FKm2p2repecp4mx2i2ibmw75deb` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_category`
--

LOCK TABLES `store_category` WRITE;
/*!40000 ALTER TABLE `store_category` DISABLE KEYS */;
INSERT INTO `store_category` VALUES (1,'Phones & Watches',NULL,1),(2,'Galaxy Z Series',1,1),(3,'Galaxy S Series',1,1),(4,'Galaxy A Series',1,1);
/*!40000 ALTER TABLE `store_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_seller`
--

DROP TABLE IF EXISTS `token_seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_seller` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `expiry_date` datetime(6) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `seller_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_r58t744ikiyanqrgt0ljwdy8a` (`seller_id`),
  CONSTRAINT `FKevg1hqmlxii3kdugitl2ptk15` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_seller`
--

LOCK TABLES `token_seller` WRITE;
/*!40000 ALTER TABLE `token_seller` DISABLE KEYS */;
/*!40000 ALTER TABLE `token_seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `birthday` date DEFAULT NULL,
  `client_name` varchar(255) DEFAULT NULL,
  `confirm_password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `gender` bit(1) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,NULL,'John',NULL,'truongngocminhcat@gmail.com',_binary '',_binary '\0','$2a$10$/XsJbKEaw.TLGGUPgWBTH.pyBaxBTVfciUSGZ.PNBYt2ejOt2CIy2','123-456-7890','ROLE_USER');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variant`
--

DROP TABLE IF EXISTS `variant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variant` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `img` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `sale_price` double NOT NULL,
  `sku_code` varchar(255) DEFAULT NULL,
  `stock_quantity` int NOT NULL,
  `weight` double NOT NULL,
  `product_id` bigint DEFAULT NULL,
  `variant_picture` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjjpllnln6hk6hj98uesgxno00` (`product_id`),
  CONSTRAINT `FKjjpllnln6hk6hj98uesgxno00` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variant`
--

LOCK TABLES `variant` WRITE;
/*!40000 ALTER TABLE `variant` DISABLE KEYS */;
INSERT INTO `variant` VALUES (1,'https://m.media-amazon.com/images/I/61NKaFRAyRL._AC_SL1500_.jpg',NULL,'SAMSUNG Galaxy Z Flip 5 Cell Phone',17.91,10.19,'SKU002',50,0.7,1,NULL),(2,'https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg',NULL,'Samsung Galaxy S23 Plus 8GB 256GB',24.99,20.99,'SKU002',50,0.7,1,NULL),(3,'https://fakestoreapi.com/img/81Zt42ioCgL._AC_SX679_.jpg',NULL,'Samsung 3 49-Inch CHG90 144Hz Curved Gaming Monitor (LC49HG90DMNXZA) – Super Ultrawide Screen QLED',17.91,10.19,'SKU002',50,0.7,1,NULL),(4,'https://pos.nvncdn.com/8c9639-78018/ps/20240115_8EgFH1MmvN.jpeg',NULL,'BRAVE BLAZER - BLACK',24.99,20.99,'SKU002',50,0.7,1,NULL),(5,'https://pos.nvncdn.com/8c9639-78018/ps/20240116_R7tDuN4qOB.jpeg',NULL,'ANDREW SHIRT- BLUE',27.91,10.19,'SKU002',50,0.7,2,NULL),(6,'https://pos.nvncdn.com/8c9639-78018/ps/20230825_7NnlxNlbeH.jpeg',NULL,' GABRI DENIM BLAZER- BLUE',24.99,20.99,'SKU002',50,0.7,2,NULL),(7,'https://pos.nvncdn.com/8c9639-78018/ps/20231124_jeOXt8fwW4.jpeg',NULL,'RAW BLAZER- BLACK',17.91,10.19,'SKU002',50,0.7,2,NULL),(8,'https://pos.nvncdn.com/8c9639-78018/ps/20240115_8EgFH1MmvN.jpeg',NULL,'BRAVE BLAZER -BLACK',24.99,20.99,'SKU002',50,0.7,2,NULL),(9,'https://fakestoreapi.com/img/81Zt42ioCgL._AC_SX679_.jpg',NULL,'Samsung 49 1-Inch CHG90 144Hz Curved Gaming Monitor (LC49HG90DMNXZA) – Super Ultrawide Screen QLED',27.91,10.19,'SKU002',50,0.7,3,NULL),(10,'https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg',NULL,'Kissonic 2 mens 2 Piece Outfits Casual Cotton Linen Shirt and High Waisted Drawstring Shorts Lounge Tracksuit Sets Blue M',24.99,20.99,'SKU002',50,0.7,3,NULL),(11,'https://fakestoreapi.com/img/81Zt42ioCgL._AC_SX679_.jpg',NULL,'Samsung 3 49-Inch CHG90 144Hz Curved Gaming Monitor (LC49HG90DMNXZA) – Super Ultrawide Screen QLED',17.91,10.19,'SKU002',50,0.7,3,NULL),(12,'https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg',NULL,'Kissonic 4 mens 2 Piece Outfits Casual Cotton Linen Shirt and High Waisted Drawstring Shorts Lounge Tracksuit Sets Blue M',24.99,20.99,'SKU002',50,0.7,3,NULL);
/*!40000 ALTER TABLE `variant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variant_optionvalue`
--

DROP TABLE IF EXISTS `variant_optionvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variant_optionvalue` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `optionvalue_id` bigint DEFAULT NULL,
  `variant_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7bjdt9nx8ycua8sy3teduec3e` (`optionvalue_id`),
  KEY `FK12mha5sanf21g9b3c24705cq0` (`variant_id`),
  CONSTRAINT `FK12mha5sanf21g9b3c24705cq0` FOREIGN KEY (`variant_id`) REFERENCES `variant` (`id`),
  CONSTRAINT `FK7bjdt9nx8ycua8sy3teduec3e` FOREIGN KEY (`optionvalue_id`) REFERENCES `optionvalue` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variant_optionvalue`
--

LOCK TABLES `variant_optionvalue` WRITE;
/*!40000 ALTER TABLE `variant_optionvalue` DISABLE KEYS */;
INSERT INTO `variant_optionvalue` VALUES (1,1,1),(2,3,1),(3,2,2),(4,4,2),(5,1,3),(6,4,3),(7,2,4),(8,3,4),(9,5,5),(10,7,5),(11,5,6),(12,8,6),(13,6,7),(14,7,7),(15,6,8),(16,8,8);
/*!40000 ALTER TABLE `variant_optionvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verification_token`
--

DROP TABLE IF EXISTS `verification_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `verification_token` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `expiry_date` datetime(6) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_q6jibbenp7o9v6tq178xg88hg` (`user_id`),
  CONSTRAINT `FKrdn0mss276m9jdobfhhn2qogw` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verification_token`
--

LOCK TABLES `verification_token` WRITE;
/*!40000 ALTER TABLE `verification_token` DISABLE KEYS */;
INSERT INTO `verification_token` VALUES (1,'2024-05-06 11:18:27.029000','7b242212-1f51-4460-81d5-c6e5cf09ac4f',1);
/*!40000 ALTER TABLE `verification_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verify_seller`
--

DROP TABLE IF EXISTS `verify_seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `verify_seller` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `expiry_date` datetime(6) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `seller_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ini72aua6sbawnf4ubmnfgpuc` (`seller_id`),
  CONSTRAINT `FKnf27cxvfwy0evjm4ow4dx7hc7` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verify_seller`
--

LOCK TABLES `verify_seller` WRITE;
/*!40000 ALTER TABLE `verify_seller` DISABLE KEYS */;
/*!40000 ALTER TABLE `verify_seller` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-13 16:39:23
