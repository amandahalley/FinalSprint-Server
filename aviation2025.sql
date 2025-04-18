
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
DROP TABLE IF EXISTS `aircraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aircraft` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `airlineName` varchar(255) NOT NULL,
  `numberOfPassengers` int NOT NULL,
  `airports` varbinary(255) DEFAULT NULL,
  `airport_id` bigint DEFAULT NULL,
  `airline_name` varchar(255) DEFAULT NULL,
  `number_of_passengers` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_aircraft_airport` (`airport_id`),
  CONSTRAINT `FK_aircraft_airport` FOREIGN KEY (`airport_id`) REFERENCES `airport` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `aircraft` WRITE;
/*!40000 ALTER TABLE `aircraft` DISABLE KEYS */;
INSERT INTO `aircraft` VALUES (1,'Boeing 737','Air Canada',254,NULL,NULL,NULL,NULL);
INSERT INTO `aircraft` VALUES (2,'Airbus A320','WestJet',292,NULL,NULL,NULL,NULL);
INSERT INTO `aircraft` VALUES (3,'Boeing 787 Dreamliner','Air Transat',349,NULL,NULL,NULL,NULL);
INSERT INTO `aircraft` VALUES (4,'Airbus A330','Porter Airlines',318,NULL,NULL,NULL,NULL);
INSERT INTO `aircraft` VALUES (5,'Boeing 777','Sunwing Airlines',194,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `aircraft` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `aircraft_airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aircraft_airport` (
  `aircraft_id` bigint NOT NULL,
  `airport_id` bigint NOT NULL DEFAULT '1',
  PRIMARY KEY (`aircraft_id`,`airport_id`),
  KEY `FKeuijrggcvo5mwrpu84v8anjp6` (`airport_id`),
  CONSTRAINT `FKeuijrggcvo5mwrpu84v8anjp6` FOREIGN KEY (`airport_id`) REFERENCES `airport` (`id`),
  CONSTRAINT `FKoxf408c9a7ntg9x5f6ujyfrip` FOREIGN KEY (`aircraft_id`) REFERENCES `aircraft` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `aircraft_airport` WRITE;
/*!40000 ALTER TABLE `aircraft_airport` DISABLE KEYS */;
INSERT INTO `aircraft_airport` VALUES (1,12);
INSERT INTO `aircraft_airport` VALUES (2,13);
INSERT INTO `aircraft_airport` VALUES (3,14);
INSERT INTO `aircraft_airport` VALUES (4,15);
INSERT INTO `aircraft_airport` VALUES (5,16);
/*!40000 ALTER TABLE `aircraft_airport` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `aircraft_passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aircraft_passenger` (
  `aircraft_id` bigint NOT NULL,
  `passenger_id` bigint NOT NULL,
  PRIMARY KEY (`aircraft_id`,`passenger_id`),
  KEY `FKl7kf1xvihl31tfxndvxyoaqkr` (`passenger_id`),
  CONSTRAINT `FK61bm7pr5rp4rrjlyo2kny9qe6` FOREIGN KEY (`aircraft_id`) REFERENCES `aircraft` (`id`),
  CONSTRAINT `FKl7kf1xvihl31tfxndvxyoaqkr` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `aircraft_passenger` WRITE;
/*!40000 ALTER TABLE `aircraft_passenger` DISABLE KEYS */;
INSERT INTO `aircraft_passenger` VALUES (1,1);
INSERT INTO `aircraft_passenger` VALUES (2,2);
INSERT INTO `aircraft_passenger` VALUES (3,3);
INSERT INTO `aircraft_passenger` VALUES (4,4);
INSERT INTO `aircraft_passenger` VALUES (5,5);
/*!40000 ALTER TABLE `aircraft_passenger` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `aircraft_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aircraft_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `aircraft_sequence` WRITE;
/*!40000 ALTER TABLE `aircraft_sequence` DISABLE KEYS */;
INSERT INTO `aircraft_sequence` VALUES (1);
/*!40000 ALTER TABLE `aircraft_sequence` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airport` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `city_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKf583ieaw0ttnwklqy222tfru0` (`city_id`),
  CONSTRAINT `FKf583ieaw0ttnwklqy222tfru0` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` VALUES (12,'YYT','St. John\'s',1);
INSERT INTO `airport` VALUES (13,'YYZ','Toronto Pearson',2);
INSERT INTO `airport` VALUES (14,'YVR','Vancouver International',3);
INSERT INTO `airport` VALUES (15,'YUL','Montréal-Trudeau',4);
INSERT INTO `airport` VALUES (16,'YYC','Calgary International',5);
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `airport_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airport_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `airport_sequence` WRITE;
/*!40000 ALTER TABLE `airport_sequence` DISABLE KEYS */;
INSERT INTO `airport_sequence` VALUES (6);
/*!40000 ALTER TABLE `airport_sequence` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `population` int NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'St. John\'s',110000,NULL);
INSERT INTO `city` VALUES (2,'Toronto',2731571,NULL);
INSERT INTO `city` VALUES (3,'Vancouver',631486,NULL);
INSERT INTO `city` VALUES (4,'Montreal',1704694,NULL);
INSERT INTO `city` VALUES (5,'Calgary',1239220,NULL);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `city_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `city_sequence` WRITE;
/*!40000 ALTER TABLE `city_sequence` DISABLE KEYS */;
INSERT INTO `city_sequence` VALUES (1);
/*!40000 ALTER TABLE `city_sequence` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `airport_id` bigint DEFAULT NULL,
  `city_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_passenger_airport` (`airport_id`),
  KEY `FKdl343iqf97f7k68vl44oo7htk` (`city_id`),
  CONSTRAINT `FK_passenger_airport` FOREIGN KEY (`airport_id`) REFERENCES `airport` (`id`),
  CONSTRAINT `FKdl343iqf97f7k68vl44oo7htk` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (1,'Taylor','Swift',NULL,12,NULL);
INSERT INTO `passenger` VALUES (2,'Keanu','Reeves',NULL,13,NULL);
INSERT INTO `passenger` VALUES (3,'Zendaya','Coleman',NULL,14,NULL);
INSERT INTO `passenger` VALUES (4,'Ryan','Reynolds',NULL,15,NULL);
INSERT INTO `passenger` VALUES (5,'Dwayne','Johnson',NULL,16,NULL);
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `passenger_aircraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger_aircraft` (
  `passenger_id` bigint NOT NULL,
  `aircraft_id` bigint NOT NULL,
  PRIMARY KEY (`passenger_id`,`aircraft_id`),
  KEY `FKlfcgwp6tatne5u00ihc48h35i` (`aircraft_id`),
  CONSTRAINT `FK2k1a82r2vto41tkyp6u1hbc8f` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`id`),
  CONSTRAINT `FKlfcgwp6tatne5u00ihc48h35i` FOREIGN KEY (`aircraft_id`) REFERENCES `aircraft` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `passenger_aircraft` WRITE;
/*!40000 ALTER TABLE `passenger_aircraft` DISABLE KEYS */;
INSERT INTO `passenger_aircraft` VALUES (1,1);
INSERT INTO `passenger_aircraft` VALUES (2,2);
INSERT INTO `passenger_aircraft` VALUES (3,3);
INSERT INTO `passenger_aircraft` VALUES (4,4);
INSERT INTO `passenger_aircraft` VALUES (5,5);
/*!40000 ALTER TABLE `passenger_aircraft` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `passenger_airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger_airport` (
  `passenger_id` bigint NOT NULL,
  `airport_id` bigint NOT NULL,
  PRIMARY KEY (`passenger_id`,`airport_id`),
  KEY `FKekt1pc7n8m2gpdpejt1bkyto3` (`airport_id`),
  CONSTRAINT `FK4yqexx3jiql9d9y7ndevviekg` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`id`),
  CONSTRAINT `FKekt1pc7n8m2gpdpejt1bkyto3` FOREIGN KEY (`airport_id`) REFERENCES `airport` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `passenger_airport` WRITE;
/*!40000 ALTER TABLE `passenger_airport` DISABLE KEYS */;
INSERT INTO `passenger_airport` VALUES (5,12);
INSERT INTO `passenger_airport` VALUES (1,13);
INSERT INTO `passenger_airport` VALUES (2,14);
INSERT INTO `passenger_airport` VALUES (3,15);
INSERT INTO `passenger_airport` VALUES (4,16);
/*!40000 ALTER TABLE `passenger_airport` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `passenger_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `passenger_sequence` WRITE;
/*!40000 ALTER TABLE `passenger_sequence` DISABLE KEYS */;
INSERT INTO `passenger_sequence` VALUES (1);
/*!40000 ALTER TABLE `passenger_sequence` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `passengers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passengers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `phoneNumber` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `passengers` WRITE;
/*!40000 ALTER TABLE `passengers` DISABLE KEYS */;
/*!40000 ALTER TABLE `passengers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

