-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: final
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `adonis_schema`
--

DROP TABLE IF EXISTS `adonis_schema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adonis_schema` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `batch` int NOT NULL,
  `migration_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adonis_schema`
--

LOCK TABLES `adonis_schema` WRITE;
/*!40000 ALTER TABLE `adonis_schema` DISABLE KEYS */;
INSERT INTO `adonis_schema` VALUES (1,'database/migrations/1680039437605_users',1,'2023-03-28 21:37:58'),(2,'database/migrations/1680039437611_api_tokens',1,'2023-03-28 21:37:58');
/*!40000 ALTER TABLE `adonis_schema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adonis_schema_versions`
--

DROP TABLE IF EXISTS `adonis_schema_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adonis_schema_versions` (
  `version` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adonis_schema_versions`
--

LOCK TABLES `adonis_schema_versions` WRITE;
/*!40000 ALTER TABLE `adonis_schema_versions` DISABLE KEYS */;
INSERT INTO `adonis_schema_versions` VALUES (2);
/*!40000 ALTER TABLE `adonis_schema_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_tokens`
--

DROP TABLE IF EXISTS `api_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_tokens_token_unique` (`token`),
  KEY `api_tokens_user_id_foreign` (`user_id`),
  CONSTRAINT `api_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_tokens`
--

LOCK TABLES `api_tokens` WRITE;
/*!40000 ALTER TABLE `api_tokens` DISABLE KEYS */;
INSERT INTO `api_tokens` VALUES (5,11,'Opaque Access Token','api','1d35a90f56644a73b7b539c5a9f23eded795b8cbd56b0af30f8b0189c03fb04a',NULL,'2023-05-04 19:22:22'),(6,11,'Opaque Access Token','api','3719fb71a7b6d7ec6d07be4c5f6c143463a70a86d7f1ffb40a5b0f984c000f5d',NULL,'2023-05-05 11:02:37'),(7,11,'Opaque Access Token','api','29443d7055389a1acb3538fc1a6b241e0f4db124c745a7dafb0b4d0da89687f4',NULL,'2023-05-05 11:03:10'),(8,11,'Opaque Access Token','api','aefb85300d90d162405ba845b90a4d19c68f2c36aad2a7223a169fff421a427c',NULL,'2023-05-05 11:03:22'),(9,11,'Opaque Access Token','api','64c89645c747a7d87e7c1e5a51373ba2007a9e411e335a23fc64ea7632646078',NULL,'2023-05-05 11:03:38'),(10,11,'Opaque Access Token','api','53da441fc83d2d25bfdff64c1c91001168d69a2d65eb7daa3e21105ed268f5e9',NULL,'2023-05-05 11:05:40'),(11,11,'Opaque Access Token','api','8062814adf7a881ae08f7d7f5d56a441e04d2fb367ad008a26c764c64c18799f',NULL,'2023-05-05 11:06:27'),(12,11,'Opaque Access Token','api','70f618496800d6943148c848cb6b8ee1dfab0458ae688bfe8e5f33eef634891b',NULL,'2023-05-05 11:08:57'),(13,11,'Opaque Access Token','api','683a0bdcd35c6f99ff36ebfa375df87b20687ba66f6ce97aba2e66fd7c07e871',NULL,'2023-05-05 11:09:06'),(14,11,'Opaque Access Token','api','64f6d753f4b916e571757399ec6ae2a2441d432f73e637b9b89ac500d3f233e8',NULL,'2023-05-05 11:09:28'),(15,11,'Opaque Access Token','api','e7de6fb50c8fde038def52a328283f82908c1146d4d9c8dfed785ec8c9ab8d95',NULL,'2023-05-05 11:12:57'),(16,11,'Opaque Access Token','api','2a642ee6445b72405760195b79a9db5f91f2c91a91c7c2a15170752806161b81',NULL,'2023-05-05 11:37:53'),(17,11,'Opaque Access Token','api','11f604bd54347e9ebb6c97fb703de0059de8cb80bbefc94104a757d455cac0c2',NULL,'2023-05-05 11:40:09'),(18,11,'Opaque Access Token','api','344c1e6f2945068c17572978c471fe6e1450aa8eae4042f63ac8f1a198443ac3',NULL,'2023-05-05 11:42:58'),(19,11,'Opaque Access Token','api','932cf93cc5830e0f407a92ff35bbf87d09d3606131d608984cb4f93176632902',NULL,'2023-05-05 11:45:46'),(20,11,'Opaque Access Token','api','0af03e763626d46c8fa9fae72799c1ac29a269868e8fd784bbcb189346490f0c',NULL,'2023-05-05 11:56:07'),(21,12,'Opaque Access Token','api','8b21fb9de072c9b754d10b654f96b1504a0bf1cd5e3181741875b58e9545c056',NULL,'2023-05-05 11:57:44'),(22,11,'Opaque Access Token','api','4bb5d8d81e94343b6d0354abff09c3c3efaaba7b2a16006f49182dd6712363b8',NULL,'2023-05-05 12:03:47'),(23,11,'Opaque Access Token','api','7348fc32795271b31470fb47715faa4d05f1d5afc53d6e00f3673590588edfda',NULL,'2023-05-05 12:57:08'),(24,11,'Opaque Access Token','api','ba4dd5d23ad60651adeaae0855e42b17411fb18af041bd4d116cf8796fbf727f',NULL,'2023-05-05 13:54:10'),(25,11,'Opaque Access Token','api','0b9084f766f13177edc3d05b75ec30c27a001ccfdb10b51a004cc062148cd91f',NULL,'2023-05-05 14:29:58'),(26,11,'Opaque Access Token','api','99b647253317b47a6af16fa80b788f57d8d8818badbe04464dd3e7defed4e73d',NULL,'2023-05-05 14:53:08'),(27,11,'Opaque Access Token','api','7812945c6010a5b6e80f31a0a63fbcf5a5ee819a8a43db2b9c9badc8ec52f62e',NULL,'2023-05-05 15:09:26'),(28,11,'Opaque Access Token','api','bfd381967f36dd7f97d341467f3870a373ad67cbd05a85973259464db3a6abae',NULL,'2023-05-05 15:14:05'),(29,11,'Opaque Access Token','api','e245245e66b4ee453048638f924f1d06c1699a0e291a621d662e4780f78f6509',NULL,'2023-05-05 15:16:29'),(30,11,'Opaque Access Token','api','44e4e39e528fe86e595da8cf02f76cb3c86e54ceb40ea85f57d0ef649a83f7a1',NULL,'2023-05-05 15:17:03'),(31,11,'Opaque Access Token','api','5716f6c56450dd7cd95434b9e8e4be2cc98a00066d29e77d2810e033dfe38594',NULL,'2023-05-05 15:17:46'),(32,11,'Opaque Access Token','api','cd21335e61e6222502e4d516eb5312b96909d3fdfd0bc9b20471cd2968ff8762',NULL,'2023-05-05 15:19:28'),(33,11,'Opaque Access Token','api','ae0588108164fb0520b914626f7be0df1610e616dc9f1c6fb61fab76e7d862f2',NULL,'2023-05-05 15:23:03'),(34,11,'Opaque Access Token','api','3896bb9e44ca6ac5403a572662387f60a9f62ad9d6be510d7841651661b6d632',NULL,'2023-05-05 15:26:53'),(35,11,'Opaque Access Token','api','4404c8d652221b05f659f6f051e592a6c2752da3ed56f6627131849190aead57',NULL,'2023-05-05 15:27:58'),(36,11,'Opaque Access Token','api','666f0c843126f472ee5494c71c268652d730b3720f666c48952327eec98bbb64',NULL,'2023-05-05 15:32:28'),(37,11,'Opaque Access Token','api','93946cb0da8d7216b1f3827d7ccde40f020cba27fec83be7ace2980a89cb19e1',NULL,'2023-05-05 15:35:06'),(38,11,'Opaque Access Token','api','1eb91c5fb662c58869072c73b73e3a5ce2fc699e76b9b995817b53ae59cc87f0',NULL,'2023-05-05 15:37:43'),(39,11,'Opaque Access Token','api','a560b20bb50aad734bf45f44b0de3e98ddefd0c7352125b3d6d5c705db8aeca4',NULL,'2023-05-05 15:39:32'),(40,11,'Opaque Access Token','api','de561a6ddd6eac4de919e4095e4e6c923c0207fb86dfa310c503a2014979fe33',NULL,'2023-05-05 15:40:50'),(41,11,'Opaque Access Token','api','c61485b3e55ac91469ddcb3bb4207451800bc04d1591d396f9edec537c8ba46c',NULL,'2023-05-05 15:42:18'),(42,11,'Opaque Access Token','api','d5be6bc3134d1da38a8955a6d4d370d779852c26ffd604f3099b6eec0d708680',NULL,'2023-05-05 15:43:27'),(43,11,'Opaque Access Token','api','edcdf6c400449ff6ee3ff6c1298437138098390ff0d1a09107ddb93927b8b8aa',NULL,'2023-05-05 15:45:09'),(44,11,'Opaque Access Token','api','7eface015f1fc012e3537563ca421882bdb86c589830516f6451c033244ae05a',NULL,'2023-05-05 15:50:34'),(45,11,'Opaque Access Token','api','65c3df5ccc8246ad8307f2571f0ba780c2738eaae9cc0f029ebfbe65564a8ad3',NULL,'2023-05-05 17:28:45'),(46,11,'Opaque Access Token','api','e80e64d265cab3394f85ab0bc22845206cb8f868807fdbcbcf9d0edab4d86cf8',NULL,'2023-05-05 17:31:10'),(47,11,'Opaque Access Token','api','98b0e436e2440e7e39b5a8245fb414faba8c64dad8f72b0f400bff867bd4a9a7',NULL,'2023-05-05 17:34:53'),(48,11,'Opaque Access Token','api','9366789bc1d63a4506e53f4ad1d8ae88e7933d638e5163e4710719d684d8cde0',NULL,'2023-05-05 17:36:08'),(49,11,'Opaque Access Token','api','eef0a8c42bb6080da4aa266eeb926ae9a643a2d95d761eaf618ace9389d10d14',NULL,'2023-05-05 17:39:13'),(50,11,'Opaque Access Token','api','35045b6b2ef100b231f5f3e46323ed1fb19d0d596481589a8053465b4b87e4e5',NULL,'2023-05-05 17:47:36'),(51,11,'Opaque Access Token','api','2f25b8da7a38f02c4a3bff8615d9e144f94a2c61838a8bda492bc7bafa03f1e0',NULL,'2023-05-05 17:49:19'),(52,11,'Opaque Access Token','api','8a4175dfead88ede01e802748f93d3655f3e0fa08c8e658cd27a27831f71c3d8',NULL,'2023-05-05 17:51:05'),(53,11,'Opaque Access Token','api','e7ce207f05213d7b1a1e2aa1f50bfc1423e07cc9583b61ed38bc60ebfbc8bd95',NULL,'2023-05-05 17:59:40'),(54,11,'Opaque Access Token','api','002565d7d72ebd76a666f4b8b5c60659f2295684ccd7432d0c4ad9b93cf9c61d',NULL,'2023-05-05 17:59:45'),(55,11,'Opaque Access Token','api','e88558f8d7206810d86e5fc375a02e547dc64871feef5f8c8161348dd4030a43',NULL,'2023-05-05 18:08:35'),(56,11,'Opaque Access Token','api','9a192b2f7d8c87fe52041838ecea12ac93f569e7502210dcacfc82064b1b2dc0',NULL,'2023-05-05 18:08:44'),(57,11,'Opaque Access Token','api','d42190261a004d7a1b037461d8819471a0badebee33ce818ec77f3b5055d46c0',NULL,'2023-05-05 18:08:51'),(58,11,'Opaque Access Token','api','f65c824a734b44b65f4a211083be8cb8b0b1faaa17e5da72071b9f72d36a8d00',NULL,'2023-05-05 18:09:00'),(59,11,'Opaque Access Token','api','783c49fa5811ec76a452f58bc9e912b242744effab0f1ab4881a50ffc283f691',NULL,'2023-05-05 18:24:11'),(60,11,'Opaque Access Token','api','172bb75c50095b1196d4f1e4435bed8dc583b77d14472bf6092d1ec1c338f2dd',NULL,'2023-05-05 18:25:12'),(61,11,'Opaque Access Token','api','0c644e396ad1cd2a114d512552989ee2a8b6fa73e79d2a1fcc6cba497f4d376c',NULL,'2023-05-05 18:26:03'),(62,11,'Opaque Access Token','api','fa6b07ab0ff83e43d48fff8d9825e0b0ccc1f336ca4cd7a5bf083539d483c8ee',NULL,'2023-05-05 18:26:58'),(63,11,'Opaque Access Token','api','1097ea0ffda85304dc58adbf2cfc90532f48acfcc64a0479eddc863b9b976d67',NULL,'2023-05-05 18:27:08'),(64,11,'Opaque Access Token','api','5849f92e3d30c17e57231f9b8416f702fc4103fe9b2075f194beb6f4c6c7a5a0',NULL,'2023-05-05 18:28:05'),(65,11,'Opaque Access Token','api','87fe6da898add834fbf73a22ad3d9f0e3b4a5dc5aed1c2747db2e4057a576546',NULL,'2023-05-05 18:32:43'),(66,11,'Opaque Access Token','api','b6f3da48536b5411a02511346b1127ce65f9e409136a003ad1b3cee258c7f535',NULL,'2023-05-05 18:33:12'),(67,11,'Opaque Access Token','api','87186326b8e6895bd0d0fccd859e4525e3dea25ac32d0dd710499197a8d595b8',NULL,'2023-05-05 18:34:42'),(68,11,'Opaque Access Token','api','87942d615fe94e86cf50b16607cb48d3134c226503efa4567a56b986dd84342d',NULL,'2023-05-05 19:35:33'),(69,38,'Opaque Access Token','api','77fb34b94ebd9c4cc433c6892dacc0ab085248f5067a3716dab770234eaa569c',NULL,'2023-05-05 20:08:07'),(70,39,'Opaque Access Token','api','e2b3ef5bcca7a403720fb4767960ac6ae10025f9804e2ecd8a2d1e90b81a3c96',NULL,'2023-05-05 20:19:31'),(71,11,'Opaque Access Token','api','cf9d7370a01803f0c5e55f33bbf9ceb1e70b7bfff139c7a5b916bda5c0cb3e33',NULL,'2023-05-06 06:45:21'),(72,11,'Opaque Access Token','api','610791ac55a69f988a721ddf5cf9a5a63c8c47b872ae3789ec184bb1123fb059',NULL,'2023-05-06 06:53:18'),(73,11,'Opaque Access Token','api','321a56f3502b73567a717e334ec173fe8ce906ed32229001b8b8e1e8af2f8d55',NULL,'2023-05-06 06:55:28'),(74,11,'Opaque Access Token','api','be088d60558a655968922471fe3b9f4e23b9ed9f95caaf36a8ca03c95d287213',NULL,'2023-05-06 07:02:58');
/*!40000 ALTER TABLE `api_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `total_price` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_id_idx` (`product_id`),
  KEY `fk_user_id_idx` (`user_id`),
  CONSTRAINT `fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_UNIQUE` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'1','2023-03-26 20:06:37',NULL,NULL),(2,'2','2023-03-26 20:39:24',NULL,NULL),(3,'3','2023-03-26 20:39:24',NULL,NULL),(4,'4','2023-03-26 20:39:24',NULL,NULL),(6,'6','2023-03-26 21:00:10','2023-03-26 21:00:10',NULL),(7,'7\n','2023-03-26 21:00:43','2023-03-26 21:00:43',NULL),(8,'7','2023-03-26 21:01:32','2023-03-29 20:13:02',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `city` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `city_UNIQUE` (`city`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'عمان','2023-05-01 22:08:46',NULL,NULL),(2,'الزرقاء','2023-05-01 22:12:57',NULL,NULL),(3,'إربد','2023-05-01 22:12:57',NULL,NULL),(4,'الرصيفة','2023-05-01 22:12:57',NULL,NULL),(5,'القويسمة','2023-05-01 22:12:57',NULL,NULL),(6,'وادي السير','2023-05-01 22:12:57',NULL,NULL),(7,'تلاع العلي','2023-05-01 22:12:57',NULL,NULL),(8,'خريبة السوق','2023-05-01 22:12:57',NULL,NULL),(9,'العقبة','2023-05-01 22:12:57',NULL,NULL),(10,'السلط','2023-05-01 22:12:57',NULL,NULL),(11,'الرمثا','2023-05-01 22:12:57',NULL,NULL),(12,'مادبا','2023-05-01 22:12:57',NULL,NULL),(13,'الجبيهة','2023-05-01 22:12:57',NULL,NULL),(14,'مخيم البقعة','2023-05-01 22:12:57',NULL,NULL),(15,'صويلح','2023-05-01 22:12:57',NULL,NULL),(16,'المفرق','2023-05-01 22:12:57',NULL,NULL),(17,'سحاب','2023-05-01 22:12:57',NULL,NULL),(18,'مخيم حطين','2023-05-01 22:12:57',NULL,NULL),(19,'عين الباشا','2023-05-01 22:12:57',NULL,NULL),(20,'أم قصير','2023-05-01 22:12:57',NULL,NULL),(21,'جرش','2023-05-01 22:12:57',NULL,NULL),(22,'مرج الحمام','2023-05-01 22:12:57',NULL,NULL),(23,'الضليل','2023-05-01 22:12:57',NULL,NULL),(24,'معان','2023-05-01 22:12:57',NULL,NULL),(25,'الهاشمية','2023-05-01 22:12:57',NULL,NULL),(26,'إسكان أبو نصير','2023-05-01 22:12:57',NULL,NULL),(27,'الطفيلة','2023-05-01 22:12:57',NULL,NULL),(28,'كفرنجة','2023-05-01 22:12:57',NULL,NULL),(29,'الحصن','2023-05-01 22:12:57',NULL,NULL),(30,'الكرك','2023-05-01 22:12:57',NULL,NULL),(31,'الصريح','2023-05-01 22:12:57',NULL,NULL),(32,'إيدون','2023-05-01 22:12:57',NULL,NULL),(33,'المشارع','2023-05-01 22:12:57',NULL,NULL),(34,'بيت رأس','2023-05-01 22:12:57',NULL,NULL),(35,'عنجرة','2023-05-01 22:12:57',NULL,NULL),(36,'غور الصافي','2023-05-01 22:12:57',NULL,NULL),(37,'الشهيد عزمي','2023-05-01 22:12:57',NULL,NULL),(38,'كريمة','2023-05-01 22:12:57',NULL,NULL),(39,'ناعور','2023-05-01 22:12:57',NULL,NULL),(40,'شفا بدران','2023-05-01 22:12:57',NULL,NULL),(41,'ساكب','2023-05-01 22:12:57',NULL,NULL);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `discount_percent` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
INSERT INTO `discounts` VALUES (1,'1','1',1,'2023-03-26 20:05:39',NULL,NULL),(3,'5','5',5,'2023-03-27 12:01:29','2023-03-27 12:02:00',NULL),(4,'44','44',44,'2023-03-27 15:17:52',NULL,NULL),(5,'44','44',44,'2023-03-27 15:18:00',NULL,NULL),(6,'442','wwqq',12,'2023-03-28 17:09:13','2023-03-28 17:09:13',NULL);
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genders`
--

DROP TABLE IF EXISTS `genders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gender` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gender_UNIQUE` (`gender`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genders`
--

LOCK TABLES `genders` WRITE;
/*!40000 ALTER TABLE `genders` DISABLE KEYS */;
INSERT INTO `genders` VALUES (1,'Male','2023-05-04 18:50:28',NULL,NULL),(2,'Female','2023-05-04 18:50:28',NULL,NULL);
/*!40000 ALTER TABLE `genders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `total_price` double NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `status_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status_id_idx` (`status_id`),
  KEY `fk_product_id_idx` (`product_id`),
  KEY `fk_product_id2_idx` (`product_id`),
  KEY `fk_user_id3_idx` (`user_id`),
  CONSTRAINT `fk_product_id2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `fk_status_id` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `fk_users_id2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `amount` double NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_id2_idx` (`user_id`),
  CONSTRAINT `fk_user_id3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL,
  `quantity_in_stock` int NOT NULL,
  `image` text NOT NULL,
  `category_id` int NOT NULL,
  `discount_id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_cetagory_id_idx` (`category_id`),
  KEY `fk_discount_id_idx` (`discount_id`),
  CONSTRAINT `fk_cetagory_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `fk_discount_id` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'1','1',1,1,'1',1,1,'2023-03-26 20:06:44',NULL,NULL),(3,'mahss','hmnss',464,124,'jjgkkss',1,1,'2023-03-27 11:36:01','2023-03-27 12:05:39',NULL),(5,'gg','1222222',12,12,'erqwerqwer',1,1,'2023-03-29 19:43:34','2023-03-29 19:44:06',NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statuses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `status_UNIQUE` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (1,'3','2023-03-26 22:13:06','2023-03-27 11:49:18',NULL),(3,'5','2023-03-29 19:36:57','2023-03-29 19:36:57',NULL);
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_UNIQUE` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` VALUES (1,'User','2023-05-04 18:49:24',NULL,NULL),(2,'Admin','2023-05-04 18:49:24',NULL,NULL);
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fist_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `password` varchar(180) NOT NULL,
  `address` varchar(255) NOT NULL,
  `gender_id` int NOT NULL,
  `type_id` int NOT NULL,
  `city_id` int NOT NULL,
  `remember_me_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `phone_number_UNIQUE` (`phone_number`),
  UNIQUE KEY `user_name_UNIQUE` (`user_name`),
  KEY `fk_city_id_idx` (`city_id`),
  KEY `fk_gender_id_idx` (`gender_id`),
  KEY `fk_type_id_idx` (`type_id`),
  CONSTRAINT `fk_city_id` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  CONSTRAINT `fk_gender_id` FOREIGN KEY (`gender_id`) REFERENCES `genders` (`id`),
  CONSTRAINT `fk_type_id` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (11,'ome','ome','6633258','ome@gmail.com','ome+1998','$scrypt$n=16384,r=8,p=1$8eC7jHsh5E563i/LIKEzew$b/SZVhkx4aWy6IAi7TF5PVBTPSi83UfrrJLPfM/hokSFvOIKPFqchJNObsWKJNLd1xff/nGPFuyMBhYJwNKcDQ','ome',1,1,13,NULL,'2023-05-04 18:54:52','2023-05-04 18:54:52',NULL),(12,'2ome','2ome','26633258','ome2@gmail.com','2ome+1998','$scrypt$n=16384,r=8,p=1$5GoSjQvpvLFuetSTrJIJXw$iAf+zjcEkqiDT6ZdSVEkpAwxWnkzWNgZ+KuMUAmqOMV9NeDYUiUa1/gU8IZAvo9AuxbLFBni2MQe9JTHXYb0JA','2ome',1,1,13,NULL,'2023-05-04 19:05:29','2023-05-04 19:05:29',NULL),(13,'32ome','32ome','326633258','ome32@gmail.com','32ome+1998','$scrypt$n=16384,r=8,p=1$CAvMUBnyfN5q//T2hoHtBw$35+HQMvKvemzKEH0szLRSTXuhcAbzhRfaIJ5dcNaZoVb+sLmgLJYxfMX4PHRWf0ZmCbHxlZ+hRi3V8/PGX8PtQ','32ome',2,1,9,NULL,'2023-05-04 19:09:28','2023-05-04 19:09:28',NULL),(14,'432ome','432ome','4326633258','ome342@gmail.com','342ome+1998','$scrypt$n=16384,r=8,p=1$Z0id8KFhLNGUnA+GifZcug$xc0SlfN3gdwMk8U9YQcs1aImLlsOgEKGZ+Jo3N4kIYO4wc7QCusvDMEbQri+IN3OtgCxv6p3noo0CAhpjAO/vw','342ome',1,1,9,NULL,'2023-05-04 19:11:44','2023-05-04 19:11:44',NULL),(15,'azz','azazaz','741','om@gmail.com','ome','$scrypt$n=16384,r=8,p=1$bBp/mqwGGxwbyd1nqFr7mw$Az2HDmvbwKt0J20CnKKl1B+I1iEb8MEMSDJjqluZsHyiyBrEY9bMesdge6WRkSGapxmh8jbvv1MZ081IMSLD+w','qa',1,1,14,NULL,'2023-05-05 10:44:23','2023-05-05 10:44:23',NULL),(16,'mahmoud','thaher','0787006524','mthaher3@gmail.com','mthaher3','$scrypt$n=16384,r=8,p=1$ZZyy/HR8TEf+M+FJUZnv6g$B/Wm6VnsCmqz0Hl9jL1np0HTz2gCMAzF1+dMJF5IbSmfOmlVg8LD9qxfLBXj+EqvMhy7LW9kEtMe1lBF4MYHew','azrqa',1,1,4,NULL,'2023-05-05 19:20:17','2023-05-05 19:20:17',NULL),(17,'mahmoud','thaher','07870026524','mthahe2r3@gmail.com','mthaher32','$scrypt$n=16384,r=8,p=1$7M0xVEi5iJT3BwnxUmpOSw$m6YcbFnfDYC1o0Y5qidi6lUKbI0BVG3sq/XGQmgybvtLTWGt7YurIFayUw4Hhj0GNPVFSWMqRfl0EMYAwaHeYA','azrqa',1,1,4,NULL,'2023-05-05 19:22:07','2023-05-05 19:22:07',NULL),(18,'mahmoud','thaher','078700265224','mthahe22r3@gmail.com','mthaher322','$scrypt$n=16384,r=8,p=1$DHwSlNpcRRK7lIYP7mLTKg$/wqOacWvD1ht6Cj0g2b1oT+dY6LJNAooELO3CvfN3frcqI92QgXtyiMHVjPEPtEhwfUMLZovt0av2Q9N9nsszA','azrqa',1,1,4,NULL,'2023-05-05 19:27:14','2023-05-05 19:27:14',NULL),(19,'mahmoud','thaher','0787002765224','mthahe272r3@gmail.com','mthaher3272','$scrypt$n=16384,r=8,p=1$iIMxaGJ7NqKliewwKGOpVA$q1pFqmt0lXQdFC8cKuZh39wE+i1iNnTpVM28qVFNrfYjr92M0layfX1SCaIVEa1VgkPd61XLKkVW1WAuusZi0g','azrqa',1,1,4,NULL,'2023-05-05 19:27:45','2023-05-05 19:27:45',NULL),(20,'mahmoud','thaher','07870042765224','mthahe2742r3@gmail.com','mthaher32742','$scrypt$n=16384,r=8,p=1$F6jXw+87Jhz3wAYRDHQIcQ$zK8j6ygGyu/B69t3AO0TCwwkXwc+GCFRnBAYLAwX/S33dX29Y9PDJaoKhtra1UV6GJdMcfUtjSn2PWln+TmwOw','azrqa',1,1,4,NULL,'2023-05-05 19:33:29','2023-05-05 19:33:29',NULL),(21,'mahmoud','thaher','078700428765224','mthahe92742r3@gmail.com','mthaher327842','$scrypt$n=16384,r=8,p=1$T2tcM7uafnHm4YJdGGruDQ$YiN4f7OORAjBz2pq942VNtscfXzioXGLppkwimpi1+oQGiJHsoG04zNhOHbTVk65i26ezT4xg23jKM4yOZO0Yw','azrqa',1,1,4,NULL,'2023-05-05 19:33:49','2023-05-05 19:33:49',NULL),(22,'11b','12b','214','s@gmail.com','b22222','$scrypt$n=16384,r=8,p=1$D70rrW1erVOkZo/E7tKYFQ$jhgbjKLZoMu91HSS/+q/6xZHtXCuiv3o3wu0mErgZs3oWwTvgFRDnA21t9zr++Zmg34nbz/HXCbkwiE+HCVwUQ','n3333',1,1,13,NULL,'2023-05-05 19:39:11','2023-05-05 19:39:11',NULL),(23,'11b','12b','2124','s2@gmail.com','b222222','$scrypt$n=16384,r=8,p=1$MhIxukRPEQjwINlZiyRDRw$AY57yamQ42YRB6SyGXo4NpT/DlrX8ZTSTd/bzj/SswDzsKc7kbwl7Gt11K9z9p0oM2/q4PFA5PbO8f4BT5bnBA','n33323',1,1,13,NULL,'2023-05-05 19:41:22','2023-05-05 19:41:22',NULL),(24,'11b','12b','224','s2@gail.com','b2222','$scrypt$n=16384,r=8,p=1$Rh6M8bYa9eah2BHD/ihpPg$fN6cxM/8nx6NJzjValKr8dXPd9PTma3Sv4wEIaY5p16blmE6DgnK+MgrVxk/w6jGGfudaCcff/YqO7JgfQAX7w','n33323',1,1,13,NULL,'2023-05-05 19:42:29','2023-05-05 19:42:29',NULL),(25,'11b','12b','24','s@gail.com','b222','$scrypt$n=16384,r=8,p=1$tVTOKih5eid0V8Svf268ig$XUOzOG4zQraL400QsFR0YXzpCQkxxQXeoj9IWNRXbw7Rn8/wU1eRa+n6ltFNZcScaNEN8IsreEVVYB5b6Dj3xg','n33323',1,1,13,NULL,'2023-05-05 19:44:53','2023-05-05 19:44:53',NULL),(26,'11b','12b','4','s@ail.com','b22','$scrypt$n=16384,r=8,p=1$9LZS5YWBL5Hh28T/kMpoeA$k++fhHM4GYqTvB0ehlZvpPf665M4gA68PKMCTloelu8TZwpr9T2p85OkvO+1RDqdmqHbAgplfjre+c3uzweIOg','n33323',1,1,13,NULL,'2023-05-05 19:46:19','2023-05-05 19:46:19',NULL),(27,'11b','12b','47','s7@ail.com','b722','$scrypt$n=16384,r=8,p=1$PC1FJVT6jQiwAgbQoBKYWw$jmsM3Whc2nkQ7wrbG5IwqhsNt/ewtCXhyxPuhvzQBsq2BuysmppdGXqgzwgJnv7siSgkNhDXqhM0QrYKerxvUQ','n33323',1,1,13,NULL,'2023-05-05 19:46:57','2023-05-05 19:46:57',NULL),(28,'11b','12b','487','s78@ail.com','b7822','$scrypt$n=16384,r=8,p=1$o8R9yT77Uzf+C07QI40d0w$bt0AdbXCQB7cJuToZU18gmFCo1/zXGzMaeUb4xZliZ0KPdvwfTDO5CjI1Lhgc3UvOQpjAHLVYQ0n+ofULnig7A','n33323',1,1,13,NULL,'2023-05-05 19:47:51','2023-05-05 19:47:51',NULL),(29,'11b','12b','666332','s768@ail.com','b78m22','$scrypt$n=16384,r=8,p=1$+yy1telrtp1oItSqpV4KXA$4G/S3dqQhIt1yxlMr664bplf73m1+ImJ5myl41grkVTCIvJEFuWyq+hzUhRoBWEbfvyZlz5ZsG2frhnB6HnKrA','n33323',1,1,13,NULL,'2023-05-05 19:49:42','2023-05-05 19:49:42',NULL),(30,'11b','12b','6663432','s7z68@ail.com','bz78m22','$scrypt$n=16384,r=8,p=1$Vq4ZQ2SBPRiJYyMXugDAfA$oSj0w/e8bYeGiRPJ5wr2nyXfnIRmgM2mC2CndpkkDTZeQdQfDLvURBsAWNPv8z6luQ2PaGIeFhliMs9carZbsw','n33323',1,1,13,NULL,'2023-05-05 19:51:59','2023-05-05 19:51:59',NULL),(31,'11b','12b','66673432','s7z6q8@ail.com','bzq78m22','$scrypt$n=16384,r=8,p=1$o0hkvzERBa4PxgAOUkWnOA$eLzO9a4yKOzDh49GVycvYzPhrSXwovFVc6HeF16IXmy8EfBLLxkycxSoK2Z5fcvhe45buE+S9GQg/I8F8W8GAw','n33323',1,1,13,NULL,'2023-05-05 19:52:24','2023-05-05 19:52:24',NULL),(32,'q','q','44','wq@gmail.com','mk','$scrypt$n=16384,r=8,p=1$vEV42pq5I5JetzVyp1AjvA$VBTxk84hJxtdlPJf2C0vC0g3gTupOgwykd1MpllACLXaS5eYHZWn4GzMuH6zkv1mPuY68wD4urKWTeWGoylIuA','mk',1,1,13,NULL,'2023-05-05 20:03:44','2023-05-05 20:03:44',NULL),(33,'q','q','414','w1q@gmail.com','m1k','$scrypt$n=16384,r=8,p=1$GZL3OegJ4IIs+ME7yPLuog$pzXrggeROOo95efLqaei3S4KshsK8jQu5cY9PBPIzWzGmpypRPHpD9MaKU6DwlEJdMd4tWjV0VkcLrWxel0IPQ','mk',1,1,13,NULL,'2023-05-05 20:04:36','2023-05-05 20:04:36',NULL),(34,'q','q','4214','w21q@gmail.com','m21k','$scrypt$n=16384,r=8,p=1$1UEELJW351aXEKw8SmOeFQ$Jbo7y1Cv99evzQZ+UhsE0Ncsm3VIPto9D+QBz37cirwNNHnhZxjA533l4NMJ/olpB3saMFjfd9LSpNhy+4AAfA','mk',1,1,13,NULL,'2023-05-05 20:05:35','2023-05-05 20:05:35',NULL),(35,'q','q','42214','w221q@gmail.com','m221k','$scrypt$n=16384,r=8,p=1$B0tNvNheVI1Oq2eMsIfcKg$G44DyMhTUrtpgsAkrfRkW9nlGYmvlTEAb7c0b9sump/7fFavE4OEYlnQu74vVVJKppAB0TVcYbgvdIlAa0T5Cw','mk',1,1,13,NULL,'2023-05-05 20:06:58','2023-05-05 20:06:58',NULL),(36,'q','q','422414','w2421q@gmail.com','m2421k','$scrypt$n=16384,r=8,p=1$Sy4H5I1jc30CCZ4zG0G+CQ$0c2qlAkThAnMDiXG9LGv2fVMzGRmUo7gMBRKczxzn3CuLqHBx3i8cYMKKxUXueRxysmQx5IAa9VpgXd+cXtOhA','mk',1,1,13,NULL,'2023-05-05 20:07:19','2023-05-05 20:07:19',NULL),(37,'q','q','4224714','w24721q@gmail.com','m72421k','$scrypt$n=16384,r=8,p=1$yDpQYJmT8I395rlqYCzvvQ$xGm0S9TW+muDQDDIVt07FfluK7YeDWEZknD36j4LnisZLAguntJSh9mHPCwnFG1BundvHWVEAI0OaEfI5R42Uw','mk',1,1,13,NULL,'2023-05-05 20:07:33','2023-05-05 20:07:33',NULL),(38,'7777q77777','777q77777','42274714','w247721q@gmail.com','m724271k','$scrypt$n=16384,r=8,p=1$Heggu4Y7jvbk/cO2NXqffw$3fz+63xjH4lwRc3TDMag4bTiHGIlLrYSYAYe7T+9VQDtxtGjHg/hg/6VvuvHzvEl+jAorkqByIOHyY+Z2kYC3Q','mk',1,1,13,NULL,'2023-05-05 20:08:07','2023-05-05 20:08:07',NULL),(39,'zxzx','xzxzx','12','h@gmail.com','zx','$scrypt$n=16384,r=8,p=1$2u/cYaJrBtnvV7WBjX7Umg$YsTPWCo1ISVugZc6FpsizZe5fY0q3fiNaMr//t7pVYeEcr6sDz1TykQ04LXVznoBucDGi1rDiXgvERuXkZfBHQ','zx',1,1,12,NULL,'2023-05-05 20:19:31','2023-05-05 20:19:31',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-06 10:18:21
