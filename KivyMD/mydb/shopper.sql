-- MariaDB dump 10.19  Distrib 10.6.5-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: shopper
-- ------------------------------------------------------
-- Server version	10.6.5-MariaDB

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'groceries'),(2,'stuff'),(3,'party'),(4,'transport'),(5,'health');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groceries`
--

DROP TABLE IF EXISTS `groceries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groceries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `unit` varchar(30) DEFAULT NULL,
  `owned` int(11) DEFAULT 0,
  `needed` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groceries`
--

LOCK TABLES `groceries` WRITE;
/*!40000 ALTER TABLE `groceries` DISABLE KEYS */;
INSERT INTO `groceries` VALUES (1,'mineral water 1l','bottle',1,2),(2,'mineral water 0.5l','bottle',0,1),(3,'apple juice','bottle',1,0),(4,'orange juice','bottle',0,1),(5,'Sprite 0.5l','bottle',0,0),(6,'Coca-cola 0.5l','bottle',0,0),(7,'Pepsi 0.5l','bottle',0,0),(8,'baguette',NULL,1,2),(9,'white bread',NULL,1,0),(10,'wholemeal bread',NULL,0,0),(11,'burger bun',NULL,0,0),(12,'multi-seed roll',NULL,0,3),(13,'white basmati rice','dkg',10,20),(14,'brown rice','dkg',0,100),(15,'flour 450','kg',1,0),(16,'white sugar','kg',0,1),(17,'brown sugar','kg',0,0),(18,'cheddar cheese','dkg',0,25),(19,'camembert',NULL,2,0),(20,'butter',NULL,1,1),(21,'cottage cheese',NULL,1,2),(22,'mozzarella',NULL,1,0),(23,'milk 3.2%','bottle',1,1),(24,'milk 2.0%','bottle',0,0),(25,'mascarpone','dkg',0,40),(26,'gouda cheese','dkg',15,0),(27,'natural yoghurt','ml',200,400),(28,'strawberry yoghurt','ml',0,0),(29,'greek yoghurt','ml',0,0),(30,'apple','dkg',100,200),(31,'cucumber','dkg',30,0),(32,'bell pepper','dkg',0,0),(33,'pear','dkg',0,0),(34,'mushroom','dkg',100,0),(35,'ginger','dkg',0,0),(36,'onion','dkg',80,0),(37,'carrot','dkg',50,0),(38,'celery','dkg',0,75),(39,'beetroot','dkg',0,0),(40,'potato','dkg',0,0),(41,'Snickers',NULL,0,0),(42,'Kinder Chocolate',NULL,1,2),(43,'Milka Oreo',NULL,1,0),(44,'Wedel dark chocolate',NULL,0,0),(45,'Prince polo',NULL,0,0),(46,'honey','jar',0,1),(47,'strawberry jam','jar',1,0),(48,'black olives','jar',0,0),(49,'green olives','jar',1,0),(50,'dried tomatoes','jar',1,1),(53,'ad','liters',1,2),(55,'a','liters',1,2),(56,'b','liters',2,3),(57,'a','b',2,1),(58,'a','item',2,3),(59,'a','b',1,3),(60,'a','b',1,3),(61,'d','g',1,3),(62,'carrot','items',2,3);
/*!40000 ALTER TABLE `groceries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `health`
--

DROP TABLE IF EXISTS `health`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `health` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `health`
--

LOCK TABLES `health` WRITE;
/*!40000 ALTER TABLE `health` DISABLE KEYS */;
INSERT INTO `health` VALUES (1,'Ibuprom','painkiller'),(2,'APAP','painkiller'),(3,'Aspirin','painkiller'),(4,'Magne B6','vitamins'),(5,'Rutinoscorbin','vitamins'),(6,'lek. Henryk Nowak','dentist'),(7,'lek. Joanna Kowalska','dentist'),(8,'lek. Joanna Kowalska-Fiodorowicz','dentist'),(9,'lek. Renata Teodorczak','dentist'),(10,'lek. Renata Teodorczyk','dentist'),(11,'lek. Jerzy Wachowicz','orthopedist'),(12,'lek. Jerzy Wachowicz','orthopedist'),(16,'a','b'),(17,'a','a');
/*!40000 ALTER TABLE `health` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT curdate(),
  `place` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `place` (`place`),
  CONSTRAINT `log_ibfk_1` FOREIGN KEY (`place`) REFERENCES `places` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,'2022-01-02',36,64,NULL),(2,'2022-01-02',40,61,NULL),(3,'2022-01-02',20,9,NULL),(4,'2022-01-02',12,58,NULL),(5,'2022-01-02',39,18,NULL),(6,'2022-01-03',41,27,NULL),(7,'2022-01-03',21,59,NULL),(8,'2022-01-03',16,57,NULL),(9,'2022-01-03',22,33,NULL),(10,'2022-01-03',8,22,NULL),(11,'2022-01-04',1,15,NULL),(12,'2022-01-04',41,39,NULL),(13,'2022-01-04',21,26,NULL),(14,'2022-01-04',27,42,NULL),(15,'2022-01-05',24,37,NULL),(16,'2022-01-05',12,40,NULL),(17,'2022-01-07',11,23,NULL),(18,'2022-01-07',46,41,NULL),(19,'2022-01-07',16,51,NULL),(20,'2022-01-08',46,17,NULL),(21,'2022-01-08',17,8,NULL),(22,'2022-01-08',13,11,NULL),(23,'2022-01-09',41,46,NULL),(24,'2022-01-11',2,8,NULL),(25,'2022-01-11',11,59,NULL),(26,'2022-01-11',46,54,NULL),(27,'2022-01-11',21,40,NULL),(28,'2022-01-12',36,50,NULL),(29,'2022-01-12',34,9,NULL),(30,'2022-01-12',18,37,NULL),(31,'2022-01-13',33,44,NULL),(32,'2022-01-13',15,37,NULL),(33,'2022-01-13',39,21,NULL),(34,'2022-01-13',3,32,NULL),(35,'2022-01-14',6,14,NULL),(36,'2022-01-14',24,56,NULL),(37,'2022-01-14',47,8,NULL),(38,'2022-01-14',26,24,NULL),(39,'2022-01-15',7,47,NULL),(40,'2022-01-15',7,35,NULL),(41,'2022-01-15',8,19,NULL),(42,'2022-01-16',38,7,NULL),(43,'2022-01-16',48,43,NULL),(44,'2022-01-16',19,59,NULL),(45,'2022-01-16',23,35,NULL),(46,'2022-01-17',11,36,NULL),(47,'2022-01-17',1,30,NULL),(48,'2022-01-17',6,19,NULL),(49,'2022-01-18',45,49,NULL),(50,'2022-01-18',2,61,NULL),(57,'2022-01-19',64,15,NULL),(59,'2022-01-19',66,15,NULL),(60,'2022-01-19',68,15,NULL),(61,'2022-01-19',69,77,NULL),(62,'2022-01-19',70,84,NULL),(63,'2022-01-19',71,20,NULL),(64,'2022-01-19',71,90,NULL),(65,'2022-01-19',70,69,NULL),(66,'2022-01-19',74,10,NULL),(71,'2022-01-21',79,55,NULL),(72,'2022-01-22',80,62,NULL),(74,'2022-01-22',79,77,NULL),(75,'2022-01-22',79,85,NULL),(76,'2022-01-22',79,95,NULL),(78,'2022-01-22',79,4,NULL),(79,'2022-01-22',87,55,NULL),(80,'2022-01-23',79,99,NULL);
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER IF NOT EXISTS before_new_log
BEFORE INSERT
ON log FOR EACH ROW
BEGIN
IF NOT EXISTS (SELECT 1 FROM places WHERE places.id = NEW.place) THEN
    INSERT INTO places (NAME,address)
    VALUES (@placename, @placeaddress);
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER IF NOT EXISTS before_delete_log
BEFORE DELETE
ON log FOR EACH ROW
BEGIN
DELETE FROM shopping WHERE shopping.purchase_id=OLD.id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `party`
--

DROP TABLE IF EXISTS `party`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `party` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL,
  `participants` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `party`
--

LOCK TABLES `party` WRITE;
/*!40000 ALTER TABLE `party` DISABLE KEYS */;
INSERT INTO `party` VALUES (1,'coffee','Marek, Ania'),(2,'coffee','Ania'),(3,'coffee','Robert'),(4,'coffee','Robert, Ania'),(5,'lunch','Marek, Ania'),(6,'lunch','Ania'),(7,'lunch','Robert'),(8,'lunch','Robert, Ania'),(9,'lunch','Robert, Ania, Zosia'),(10,'lunch','Marek, Robert, Ania, Zosia'),(11,'lunch','Zosia'),(12,'club','Robert'),(13,'club','Robert, Ania'),(14,'club','Robert, Ania, Zosia'),(15,'club','Marek, Robert, Ania, Zosia'),(16,'club','Zosia, Marek'),(17,'club','Marek'),(18,'bowling','Marek, Ania, Zosia'),(19,'bowling','Ania, Robert, Piotr'),(20,'bowling','Robert, Piotr, Marcin'),(21,'bowling','Robert, Ania, Piotr, Marcin, Kuba'),(22,'mulled wine','Marek, Ania'),(23,'mulled wine','Ania, Zosia, Piotr'),(24,'mulled wine','Robert, Paulina'),(25,'mulled wine','Robert, Marek, Kasia'),(26,'exhibition','Marek, Ania, Robert, Jacek'),(27,'exhibition','Ania, Piotr'),(28,'exhibition','Robert'),(29,'exhibition','Robert, Ania'),(30,'dinner','Marek, Ania, Kasia'),(31,'dinner','Ania, Kuba'),(32,'dinner','Robert'),(33,'dinner','Robert, Ania'),(34,'dinner','Robert, Ania, Zosia'),(35,'dinner','Marek, Robert, Ania, Zosia'),(36,'dinner','Zosia, Robert'),(37,'beer','Robert'),(38,'beer','Robert, Ania'),(39,'beer','Robert, Ania, Zosia'),(40,'beer','Marek, Robert, Ania, Zosia'),(41,'beer','Zosia, Marek'),(42,'beer','Marek'),(43,'match','Marek, Ania, Zosia, Robert'),(44,'match','Ania, Robert, Piotr'),(45,'match','Robert, Piotr, Marcin'),(46,'match','Robert, Ania, Piotr, Marcin, Kuba'),(47,'cinema','Marek, Ania, Kuba'),(48,'cinema','Ania, Zosia, Piotr'),(49,'cinema','Robert, Paulina, Kuba'),(50,'cinema','Robert, Marek, Kasia');
/*!40000 ALTER TABLE `party` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places`
--

DROP TABLE IF EXISTS `places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `places` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `address` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places`
--

LOCK TABLES `places` WRITE;
/*!40000 ALTER TABLE `places` DISABLE KEYS */;
INSERT INTO `places` VALUES (1,'Biedronka','ul. Pilsudskiego 105, Wroclaw'),(2,'Biedronka','ul. Swidnicka 40, Wroclaw'),(3,'Biedronka','ul. Sucha 1, Wroclaw'),(4,'Biedronka','ul. Szewska 6/7, Wroclaw'),(5,'Biedronka','ul. Komandorska 147, Wroclaw'),(6,'Biedronka','ul. Duboisa 9, Wroclaw'),(7,'Lidl','ul. Braniborska 82, Wroclaw'),(8,'Lidl','ul. Borowska 134, Wroclaw'),(9,'Lidl','ul. Muchoborska 17, Wroclaw'),(10,'IKEA','ul. Czekoladowa 5, Bielany Wroclawskie'),(11,'Super-pharm','plac Grunwaldzki 22, Wroclaw'),(12,'Douglas','plac Grunwaldzki 22, Wroclaw'),(13,'DOZ Apteka','plac Grunwaldzki 22, Wroclaw'),(14,'hebe','plac Grunwaldzki 22, Wroclaw'),(15,'ROSSMANN','plac Grunwaldzki 22, Wroclaw'),(16,'Yves Rocher','plac Grunwaldzki 22, Wroclaw'),(17,'martes','plac Grunwaldzki 22, Wroclaw'),(18,'4f','plac Grunwaldzki 22, Wroclaw'),(19,'home&you','plac Grunwaldzki 22, Wroclaw'),(20,'DUKA','plac Grunwaldzki 22, Wroclaw'),(21,'Ochnik','plac Grunwaldzki 22, Wroclaw'),(22,'wojas','plac Grunwaldzki 22, Wroclaw'),(23,'Czas na Herbate','plac Grunwaldzki 22, Wroclaw'),(24,'Delikatesy T&J','plac Grunwaldzki 22, Wroclaw'),(25,'empik','plac Grunwaldzki 22, Wroclaw'),(26,'Media Markt','plac Grunwaldzki 22, Wroclaw'),(27,'Carto Store','plac Grunwaldzki 22, Wroclaw'),(28,'Super-pharm','plac Grunwaldzki 22, Wroclaw'),(29,'Big Star','plac Grunwaldzki 22, Wroclaw'),(30,'H&M','plac Grunwaldzki 22, Wroclaw'),(31,'Lavard','plac Grunwaldzki 22, Wroclaw'),(32,'LEVIS','plac Grunwaldzki 22, Wroclaw'),(33,'Medicine','plac Grunwaldzki 22, Wroclaw'),(34,'RESERVED','plac Grunwaldzki 22, Wroclaw'),(35,'ZARA','plac Grunwaldzki 22, Wroclaw'),(36,'Super-pharm','plac Grunwaldzki 22, Wroclaw'),(37,'Kaufland','ul. Sieradzka 7, Wroclaw'),(38,'Kaufland','ul. Jana Dlugosza 74, Wroclaw'),(39,'Kaufland','ul. Bardzka 1A, Wroclaw'),(40,'Kaufland','ul. Legnicka 62, Wroclaw'),(41,'Auchan','ul. Zwycieska 14b, Wroclaw'),(42,'Auchan','ul. Hubska 102-118, Wroclaw'),(43,'Auchan','ul. Krzywoustego 126, Wroclaw'),(44,'hebe','ul. Olawska 13, Wroclaw'),(45,'hebe','ul. Sucha 1, Wroclaw'),(46,'hebe','ul. Nowy Targ 28, Wroclaw'),(47,'Zabka','ul. Komandorska 8-12, Wroclaw'),(48,'Zabka','ul. Pilsudskiego 105, Wroclaw'),(49,'Zabka','ul. Podwale 66/2b, Wroclaw'),(50,'Zabka','ul. Ruska 61/1, Wroclaw'),(51,'s','s'),(64,'tesco','here'),(66,'tesco','there'),(68,'t','s'),(69,'t','a'),(70,'',''),(71,'a','b'),(72,'a','b'),(73,'',''),(74,'w','w'),(79,'a','a'),(80,'shop','somewhere'),(82,'a','a'),(83,'a','a'),(84,'a','a'),(86,'a','a'),(87,'Wroclaw','somewhere'),(88,'a','a');
/*!40000 ALTER TABLE `places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping`
--

DROP TABLE IF EXISTS `shopping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) NOT NULL,
  `groceries_id` int(11) DEFAULT NULL,
  `stuff_id` int(11) DEFAULT NULL,
  `party_id` int(11) DEFAULT NULL,
  `transport_id` int(11) DEFAULT NULL,
  `health_id` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_id` (`purchase_id`),
  KEY `groceries_id` (`groceries_id`),
  KEY `stuff_id` (`stuff_id`),
  KEY `party_id` (`party_id`),
  KEY `transport_id` (`transport_id`),
  KEY `health_id` (`health_id`),
  CONSTRAINT `shopping_ibfk_1` FOREIGN KEY (`purchase_id`) REFERENCES `log` (`id`) ON DELETE CASCADE,
  CONSTRAINT `shopping_ibfk_2` FOREIGN KEY (`groceries_id`) REFERENCES `groceries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `shopping_ibfk_3` FOREIGN KEY (`stuff_id`) REFERENCES `stuff` (`id`) ON DELETE CASCADE,
  CONSTRAINT `shopping_ibfk_4` FOREIGN KEY (`party_id`) REFERENCES `party` (`id`) ON DELETE CASCADE,
  CONSTRAINT `shopping_ibfk_5` FOREIGN KEY (`transport_id`) REFERENCES `transport` (`id`) ON DELETE CASCADE,
  CONSTRAINT `shopping_ibfk_6` FOREIGN KEY (`health_id`) REFERENCES `health` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping`
--

LOCK TABLES `shopping` WRITE;
/*!40000 ALTER TABLE `shopping` DISABLE KEYS */;
INSERT INTO `shopping` VALUES (1,1,NULL,1,NULL,NULL,NULL,399,NULL),(2,1,NULL,2,NULL,NULL,NULL,899,NULL),(3,1,NULL,40,NULL,NULL,NULL,4599,NULL),(4,1,NULL,41,NULL,NULL,NULL,6499,NULL),(5,1,NULL,42,NULL,NULL,NULL,6499,NULL),(6,1,NULL,1,NULL,NULL,NULL,399,NULL),(7,2,NULL,16,NULL,NULL,NULL,150099,NULL),(8,2,NULL,17,NULL,NULL,NULL,170099,NULL),(9,3,NULL,46,NULL,NULL,NULL,1099,NULL),(10,4,1,NULL,NULL,NULL,NULL,299,NULL),(11,4,50,NULL,NULL,NULL,NULL,899,NULL),(12,4,41,NULL,NULL,NULL,NULL,299,NULL),(13,5,8,NULL,NULL,NULL,NULL,199,NULL),(14,5,14,NULL,NULL,NULL,NULL,899,NULL),(15,5,19,NULL,NULL,NULL,NULL,599,NULL),(16,6,20,NULL,NULL,NULL,NULL,599,NULL),(17,6,21,NULL,NULL,NULL,NULL,249,NULL),(18,6,23,NULL,NULL,NULL,NULL,329,NULL),(19,6,31,NULL,NULL,NULL,NULL,427,NULL),(20,6,33,NULL,NULL,NULL,NULL,542,NULL),(21,6,35,NULL,NULL,NULL,NULL,766,NULL),(22,6,47,NULL,NULL,NULL,NULL,549,NULL),(23,6,48,NULL,NULL,NULL,NULL,599,NULL),(24,6,4,NULL,NULL,NULL,NULL,399,NULL),(25,7,NULL,NULL,NULL,NULL,2,599,NULL),(26,8,NULL,NULL,NULL,NULL,4,899,NULL),(27,9,9,NULL,NULL,NULL,NULL,399,NULL),(28,9,18,NULL,NULL,NULL,NULL,999,NULL),(29,9,NULL,14,NULL,NULL,NULL,399,NULL),(30,9,NULL,19,NULL,NULL,NULL,529,NULL),(31,10,NULL,18,NULL,NULL,NULL,1059,NULL),(32,11,NULL,3,NULL,NULL,NULL,3999,NULL),(33,11,NULL,4,NULL,NULL,NULL,3999,NULL),(34,12,NULL,27,NULL,NULL,NULL,559,NULL),(35,12,NULL,28,NULL,NULL,NULL,489,NULL),(36,13,6,NULL,NULL,NULL,NULL,599,NULL),(37,41,12,NULL,NULL,NULL,NULL,597,NULL),(38,41,22,NULL,NULL,NULL,NULL,399,NULL),(39,41,31,NULL,NULL,NULL,NULL,678,NULL),(40,41,32,NULL,NULL,NULL,NULL,493,NULL),(41,41,23,NULL,NULL,NULL,NULL,319,NULL),(42,41,25,NULL,NULL,NULL,NULL,899,NULL),(43,43,NULL,29,NULL,NULL,NULL,1099,NULL),(44,43,NULL,30,NULL,NULL,NULL,899,NULL),(45,45,NULL,35,NULL,NULL,NULL,999,NULL),(46,45,NULL,7,NULL,NULL,NULL,1599,NULL),(47,45,NULL,8,NULL,NULL,NULL,599,NULL),(48,45,NULL,9,NULL,NULL,NULL,499,NULL),(49,45,NULL,10,NULL,NULL,NULL,499,NULL),(50,46,NULL,15,NULL,NULL,NULL,15999,NULL),(51,57,53,NULL,NULL,NULL,NULL,12,NULL),(53,59,55,NULL,NULL,NULL,NULL,12,NULL),(54,59,56,NULL,NULL,NULL,NULL,10,NULL),(55,60,57,NULL,NULL,NULL,NULL,3,NULL),(56,61,58,NULL,NULL,NULL,NULL,1,NULL),(57,63,57,NULL,NULL,NULL,NULL,2,NULL),(58,64,57,NULL,NULL,NULL,NULL,2,NULL),(59,66,61,NULL,NULL,NULL,NULL,1,NULL),(60,71,NULL,NULL,NULL,16,NULL,2,NULL),(61,72,62,NULL,NULL,NULL,NULL,100,NULL),(62,74,NULL,NULL,NULL,17,NULL,2,NULL),(63,75,NULL,NULL,NULL,51,NULL,2,NULL),(64,76,NULL,NULL,NULL,51,NULL,2,NULL),(65,78,NULL,NULL,NULL,51,NULL,2,NULL),(66,79,NULL,NULL,NULL,55,NULL,3000,NULL),(67,80,NULL,NULL,NULL,51,NULL,2,NULL);
/*!40000 ALTER TABLE `shopping` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER IF NOT EXISTS before_new_shopping
BEFORE INSERT
ON shopping FOR EACH ROW
BEGIN
	IF NOT EXISTS (SELECT 1 FROM log WHERE log.id = NEW.purchase_id) THEN
	    INSERT INTO log (place,time)
	    VALUES (13, 13);
	END IF;
	IF NEW.groceries_id IS NOT NULL THEN
		IF NOT EXISTS (SELECT 1 FROM groceries WHERE groceries.id = NEW.groceries_id) THEN
		    INSERT INTO groceries (name)
		    VALUES ('guanciale');
		END IF;
	END IF;
	
	IF NEW.stuff_id IS  NOT NULL THEN
		IF NOT EXISTS (SELECT 1 FROM stuff WHERE stuff.id = NEW.stuff_id) THEN
		    INSERT INTO stuff (name)
		    VALUES ('hammer');
		END IF;
	END IF;
	IF NEW.party_id IS  NOT NULL THEN
		IF NOT EXISTS (SELECT 1 FROM party WHERE party.id = NEW.party_id) THEN
		    INSERT INTO party (type)
		    VALUES ('PAAAAARTTYYYY!');
		END IF;
	END IF;
	IF NEW.transport_id IS  NOT NULL THEN
		IF NOT EXISTS (SELECT 1 FROM transport WHERE transport.id = NEW.transport_id) THEN
		    INSERT INTO transport (type)
		    VALUES ('some_vehicle');
		END IF;
	END IF;

	IF NEW.health_id IS  NOT NULL THEN
		IF NOT EXISTS (SELECT 1 FROM health WHERE health.id = NEW.health_id) THEN
		    INSERT INTO health (type)
		    VALUES ('some_medical_stuff');
		END IF;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `stuff`
--

DROP TABLE IF EXISTS `stuff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stuff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `unit` varchar(30) DEFAULT NULL,
  `owned` int(11) DEFAULT 0,
  `needed` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stuff`
--

LOCK TABLES `stuff` WRITE;
/*!40000 ALTER TABLE `stuff` DISABLE KEYS */;
INSERT INTO `stuff` VALUES (1,'Dove soap original','bar',1,1),(2,'Nivea shower gel','bottle',0,0),(3,'black t-shirt',NULL,4,1),(4,'white t-shirt',NULL,1,1),(5,'white teacup',NULL,3,3),(6,'physics textbook',NULL,24,17),(7,'notebook A4',NULL,2,3),(8,'notebook A5',NULL,5,1),(9,'black pen',NULL,3,0),(10,'blue pen',NULL,2,0),(11,'pencil',NULL,0,2),(12,'ruler',NULL,1,0),(13,'backpack',NULL,2,0),(14,'tissues','box',0,1),(15,'red jumper',NULL,0,1),(16,'Hauga wardrobe',NULL,0,1),(17,'LERHAMN Table',NULL,0,1),(18,'Elmex toothpaste','tube',1,1),(19,'garbage bag','30 bag/roll',0,2),(20,'hairbrush',NULL,1,0),(21,'hairpin',NULL,3,1),(22,'Perwoll washing detergent for white',NULL,0,1),(23,'Perwoll washing detergent for black',NULL,1,0),(24,'Perwoll washing detergent for colors',NULL,1,0),(25,'Lenor fabric softener blue',NULL,1,0),(26,'Lenor fabric softener green',NULL,1,0),(27,'aluminum foil','roll',1,0),(28,'baking paper','roll',1,0),(29,'jar 470 ml',NULL,2,0),(30,'jar 220 ml',NULL,1,0),(31,'jar 740 ml',NULL,3,0),(32,'glass 150 ml',NULL,2,0),(33,'glass 250 ml',NULL,1,0),(34,'glass 300 ml',NULL,3,0),(35,'white paint','100 ml tube',1,0),(36,'black paint','100 ml tube',1,0),(37,'yellow paint','100 ml tube',1,0),(38,'green paint','100 ml tube',1,0),(39,'blue paint','100 ml tube',0,1),(40,'Finish Quantum Ultimate Lemon','tablet',21,68),(41,'Fairy All In One Dishwasher Original','tablet',11,0),(42,'Fairy All In One Dishwasher Lemon','tablet',11,0),(43,'kitchen towel','roll',1,1),(44,'shampoo for cats','bottle',0,12),(45,'Mahlkoenig coffee grinder',NULL,0,2),(46,'hdmi cable',NULL,0,0),(47,'Fairy Washing Up Liquid Original','bottle',0,0),(48,'Lightbulb LED 40W',NULL,0,2),(49,'Lightbulb LED 100W',NULL,0,1),(50,'Vileda mop refill',NULL,0,1);
/*!40000 ALTER TABLE `stuff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transport`
--

DROP TABLE IF EXISTS `transport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  `place` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport`
--

LOCK TABLES `transport` WRITE;
/*!40000 ALTER TABLE `transport` DISABLE KEYS */;
INSERT INTO `transport` VALUES (1,'fuel',NULL),(2,'repair',NULL),(3,'bus','Wroclaw'),(4,'bus','Poznan'),(5,'bus','Warszawa'),(6,'bus','Gdynia'),(7,'bus','Olsztyn'),(8,'bus','Lublin'),(9,'bus','Lubin'),(10,'bus','Brzeg'),(11,'bus','Kolobrzeg'),(12,'bus','Drezno'),(13,'bus','Praga'),(14,'bus','Torun'),(15,'train','Wroclaw'),(16,'train','Poznan'),(17,'train','Warszawa'),(18,'train','Gdynia'),(19,'train','Krakow'),(20,'train','Lublin'),(21,'train','Bydgoszcz'),(22,'train','Praga'),(23,'train','Drezno'),(24,'train','Brzeg'),(25,'train','Rzeszow'),(26,'train','Katowice'),(27,'train','Leszno'),(28,'train','Rybnik'),(29,'flight','Rzym'),(30,'flight','Praga'),(31,'flight','Barcelona'),(32,'flight','Madryt'),(33,'flight','Frankfurt'),(34,'flight','Berlin'),(35,'flight','Moskwa'),(36,'flight','Kopenhaga'),(37,'flight','Paryz'),(38,'flight','Nowy Jork'),(39,'flight','Chicago'),(40,'flight','Toronto'),(41,'flight','Drezno'),(42,'flight','Warszawa'),(43,'flight','Amsterdam'),(44,'flight','Porto'),(45,'taxi','Wroclaw'),(46,'taxi','Warszawa'),(47,'taxi','Rzym'),(48,'taxi','Gdynia'),(49,'taxi','Barcelona'),(50,'taxi','Frankfurt'),(51,'a','a'),(52,'a','a'),(54,'a','a'),(55,'car','Wroclaw'),(56,'a','a');
/*!40000 ALTER TABLE `transport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'shopper'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-23 11:56:40
