CREATE DATABASE  IF NOT EXISTS `cafeinteligencia` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cafeinteligencia`;
-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: cafeinteligencia
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.22.04.2

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
-- Table structure for table `levante`
--

DROP TABLE IF EXISTS `levante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `levante` (
  `id` int NOT NULL AUTO_INCREMENT,
  `imovel_id` int NOT NULL,
  `data_levantamento` date NOT NULL,
  `acessos` int NOT NULL,
  `usoforms` int DEFAULT NULL,
  `usomaps` int DEFAULT NULL,
  `usowhats` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_levante_imovel1_idx` (`imovel_id`),
  CONSTRAINT `fk_levante_imovel1` FOREIGN KEY (`imovel_id`) REFERENCES `imovel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `levante`
--

LOCK TABLES `levante` WRITE;
/*!40000 ALTER TABLE `levante` DISABLE KEYS */;
INSERT INTO `levante` VALUES (1,1,'2023-03-27',10,NULL,NULL,NULL),(2,2,'2023-03-27',12,NULL,NULL,NULL),(3,3,'2023-03-27',43,NULL,NULL,NULL),(4,4,'2023-03-27',13,NULL,NULL,NULL),(5,5,'2023-03-27',69,NULL,NULL,NULL),(6,6,'2023-03-27',1,NULL,NULL,NULL),(7,7,'2023-03-27',2,NULL,NULL,NULL),(8,8,'2023-03-27',7,NULL,NULL,NULL),(9,9,'2023-03-27',4,NULL,NULL,NULL),(10,10,'2023-03-27',15,NULL,NULL,NULL),(11,11,'2023-03-27',9,NULL,NULL,NULL),(12,12,'2023-03-27',6,NULL,NULL,NULL),(13,13,'2023-03-27',8,NULL,NULL,NULL),(14,14,'2023-03-27',7,NULL,NULL,NULL),(15,15,'2023-03-27',2,NULL,NULL,NULL),(16,17,'2023-03-27',1,NULL,NULL,NULL),(17,18,'2023-03-27',4,NULL,NULL,NULL),(18,19,'2023-03-27',1,NULL,NULL,NULL),(19,20,'2023-03-27',15,NULL,NULL,NULL),(20,21,'2023-03-27',10,NULL,NULL,NULL),(21,22,'2023-03-27',3,NULL,NULL,NULL),(22,23,'2023-03-27',2,NULL,NULL,NULL),(23,24,'2023-03-27',1,NULL,NULL,NULL),(24,25,'2023-03-27',5,NULL,NULL,NULL),(25,26,'2023-03-27',2,NULL,NULL,NULL),(26,27,'2023-03-27',23,NULL,NULL,NULL),(27,29,'2023-03-27',4,NULL,NULL,NULL),(28,30,'2023-03-27',8,NULL,NULL,NULL),(29,31,'2023-03-27',13,NULL,NULL,NULL),(30,32,'2023-03-27',7,NULL,NULL,NULL),(31,33,'2023-03-27',5,NULL,NULL,NULL),(32,35,'2023-03-27',2,NULL,NULL,NULL),(33,37,'2023-03-27',15,NULL,NULL,NULL),(34,38,'2023-03-27',14,NULL,NULL,NULL),(35,39,'2023-03-27',1,NULL,NULL,NULL),(36,40,'2023-03-27',1,NULL,NULL,NULL),(37,41,'2023-03-27',3,NULL,NULL,NULL),(38,44,'2023-03-27',13,NULL,NULL,NULL),(39,45,'2023-03-27',2,NULL,NULL,NULL),(40,47,'2023-03-27',6,NULL,NULL,NULL),(41,48,'2023-03-27',1,NULL,NULL,NULL),(42,49,'2023-03-27',3,NULL,NULL,NULL),(43,50,'2023-03-27',5,NULL,NULL,NULL),(44,51,'2023-03-27',21,NULL,NULL,NULL),(45,55,'2023-03-27',2,NULL,NULL,NULL),(46,59,'2023-03-27',17,NULL,NULL,NULL),(47,61,'2023-03-27',16,NULL,NULL,NULL),(48,62,'2023-03-27',7,NULL,NULL,NULL),(49,63,'2023-03-27',11,NULL,NULL,NULL),(50,64,'2023-03-27',5,NULL,NULL,NULL),(51,65,'2023-03-27',2,NULL,NULL,NULL),(52,66,'2023-03-27',2,NULL,NULL,NULL),(53,67,'2023-03-27',8,NULL,NULL,NULL),(54,68,'2023-03-27',5,NULL,NULL,NULL),(55,69,'2023-03-27',20,NULL,NULL,NULL),(56,70,'2023-03-27',2,NULL,NULL,NULL),(57,71,'2023-03-27',2,NULL,NULL,NULL),(58,73,'2023-03-27',1,NULL,NULL,NULL),(59,74,'2023-03-27',7,NULL,NULL,NULL),(60,75,'2023-03-27',10,NULL,NULL,NULL),(61,76,'2023-03-27',19,NULL,NULL,NULL),(62,77,'2023-03-27',4,NULL,NULL,NULL),(63,79,'2023-03-27',27,NULL,NULL,NULL),(64,80,'2023-03-27',17,NULL,NULL,NULL),(65,81,'2023-03-27',22,NULL,NULL,NULL),(66,82,'2023-03-27',1,NULL,NULL,NULL),(67,83,'2023-03-27',6,NULL,NULL,NULL),(68,85,'2023-03-27',15,NULL,NULL,NULL),(69,86,'2023-03-27',7,NULL,NULL,NULL),(70,87,'2023-03-27',6,NULL,NULL,NULL),(71,89,'2023-03-27',5,NULL,NULL,NULL),(72,90,'2023-03-27',1,NULL,NULL,NULL),(73,91,'2023-03-27',7,NULL,NULL,NULL),(74,92,'2023-03-27',6,NULL,NULL,NULL),(75,93,'2023-03-27',1,NULL,NULL,NULL),(76,95,'2023-03-27',10,NULL,NULL,NULL),(77,96,'2023-03-27',1,NULL,NULL,NULL),(78,97,'2023-03-27',21,NULL,NULL,NULL),(79,98,'2023-03-27',8,NULL,NULL,NULL),(80,99,'2023-03-27',21,NULL,NULL,NULL),(81,100,'2023-03-27',10,NULL,NULL,NULL),(82,102,'2023-03-27',3,NULL,NULL,NULL),(83,103,'2023-03-27',3,NULL,NULL,NULL),(84,105,'2023-03-27',13,NULL,NULL,NULL),(85,106,'2023-03-27',8,NULL,NULL,NULL),(86,107,'2023-03-27',8,NULL,NULL,NULL),(87,108,'2023-03-27',9,NULL,NULL,NULL),(88,109,'2023-03-27',722,NULL,NULL,NULL),(89,110,'2023-03-27',17,NULL,NULL,NULL),(90,111,'2023-03-27',6,NULL,NULL,NULL),(91,112,'2023-03-27',1,NULL,NULL,NULL),(92,113,'2023-03-27',19,NULL,NULL,NULL),(93,114,'2023-03-27',7,NULL,NULL,NULL),(94,116,'2023-03-27',1,NULL,NULL,NULL),(95,117,'2023-03-27',7,NULL,NULL,NULL),(96,118,'2023-03-27',1,NULL,NULL,NULL),(97,119,'2023-03-27',11,NULL,NULL,NULL),(98,121,'2023-03-27',1,NULL,NULL,NULL),(99,122,'2023-03-27',3,NULL,NULL,NULL),(100,125,'2023-03-27',4,NULL,NULL,NULL),(101,128,'2023-03-27',1,NULL,NULL,NULL),(102,130,'2023-03-27',2,NULL,NULL,NULL),(103,133,'2023-03-27',1,NULL,NULL,NULL),(104,134,'2023-03-27',28,NULL,NULL,NULL),(105,135,'2023-03-27',3,NULL,NULL,NULL),(106,136,'2023-03-27',4,NULL,NULL,NULL),(107,137,'2023-03-27',1,NULL,NULL,NULL),(108,138,'2023-03-27',5,NULL,NULL,NULL),(109,139,'2023-03-27',4,NULL,NULL,NULL),(110,146,'2023-03-27',17,NULL,NULL,NULL),(111,147,'2023-03-27',4,NULL,NULL,NULL),(112,148,'2023-03-27',12,NULL,NULL,NULL),(113,149,'2023-03-27',2,NULL,NULL,NULL),(114,150,'2023-03-27',13,NULL,NULL,NULL),(115,151,'2023-03-27',3,NULL,NULL,NULL),(116,152,'2023-03-27',7,NULL,NULL,NULL),(117,154,'2023-03-27',14,NULL,NULL,NULL),(118,156,'2023-03-27',2,NULL,NULL,NULL),(119,157,'2023-03-27',3,NULL,NULL,NULL),(120,158,'2023-03-27',1,NULL,NULL,NULL),(121,159,'2023-03-27',1,NULL,NULL,NULL),(122,160,'2023-03-27',1,NULL,NULL,NULL),(123,161,'2023-03-27',1,NULL,NULL,NULL),(124,162,'2023-03-27',1,NULL,NULL,NULL),(125,164,'2023-03-27',8,NULL,NULL,NULL),(126,165,'2023-03-27',1,NULL,NULL,NULL),(127,166,'2023-03-27',5,NULL,NULL,NULL),(128,167,'2023-03-27',6,NULL,NULL,NULL),(129,168,'2023-03-27',8,NULL,NULL,NULL),(130,169,'2023-03-27',7,NULL,NULL,NULL),(131,170,'2023-03-27',15,NULL,NULL,NULL),(132,173,'2023-03-27',2,NULL,NULL,NULL),(133,174,'2023-03-27',6,NULL,NULL,NULL),(134,175,'2023-03-27',3,NULL,NULL,NULL),(135,176,'2023-03-27',27,NULL,NULL,NULL),(136,177,'2023-03-27',4,NULL,NULL,NULL),(137,178,'2023-03-27',5,NULL,NULL,NULL),(138,181,'2023-03-27',1,NULL,NULL,NULL),(139,182,'2023-03-27',8,NULL,NULL,NULL),(140,183,'2023-03-27',15,NULL,NULL,NULL),(141,184,'2023-03-27',2,NULL,NULL,NULL),(142,187,'2023-03-27',2,NULL,NULL,NULL),(143,188,'2023-03-27',3,NULL,NULL,NULL),(144,189,'2023-03-27',2,NULL,NULL,NULL),(145,191,'2023-03-27',4,NULL,NULL,NULL),(146,192,'2023-03-27',11,NULL,NULL,NULL),(147,195,'2023-03-27',3,NULL,NULL,NULL),(148,196,'2023-03-27',4,NULL,NULL,NULL),(149,197,'2023-03-27',2,NULL,NULL,NULL),(150,198,'2023-03-27',9,NULL,NULL,NULL),(151,200,'2023-03-27',5,NULL,NULL,NULL),(152,201,'2023-03-27',11,NULL,NULL,NULL),(153,202,'2023-03-27',23,NULL,NULL,NULL),(154,204,'2023-03-27',7,NULL,NULL,NULL),(155,205,'2023-03-27',3,NULL,NULL,NULL),(156,206,'2023-03-27',11,NULL,NULL,NULL),(157,207,'2023-03-27',2,NULL,NULL,NULL),(158,210,'2023-03-27',9,NULL,NULL,NULL),(159,211,'2023-03-27',1,NULL,NULL,NULL),(160,212,'2023-03-27',2,NULL,NULL,NULL),(161,213,'2023-03-27',1,NULL,NULL,NULL),(162,214,'2023-03-27',7,NULL,NULL,NULL),(163,215,'2023-03-27',24,NULL,NULL,NULL),(164,216,'2023-03-27',3,NULL,NULL,NULL),(165,217,'2023-03-27',19,NULL,NULL,NULL),(166,218,'2023-03-27',3,NULL,NULL,NULL),(167,219,'2023-03-27',1,NULL,NULL,NULL),(168,220,'2023-03-27',15,NULL,NULL,NULL),(169,221,'2023-03-27',2,NULL,NULL,NULL),(170,223,'2023-03-27',1,NULL,NULL,NULL),(171,225,'2023-03-27',10,NULL,NULL,NULL),(172,227,'2023-03-27',2,NULL,NULL,NULL),(173,228,'2023-03-27',2,NULL,NULL,NULL),(174,229,'2023-03-27',4,NULL,NULL,NULL),(175,230,'2023-03-27',2,NULL,NULL,NULL),(176,231,'2023-03-27',7,NULL,NULL,NULL),(177,232,'2023-03-27',2,NULL,NULL,NULL),(178,233,'2023-03-27',1,NULL,NULL,NULL),(179,234,'2023-03-27',32,NULL,NULL,NULL),(180,235,'2023-03-27',1,NULL,NULL,NULL),(181,236,'2023-03-27',3,NULL,NULL,NULL),(182,237,'2023-03-27',9,NULL,NULL,NULL),(183,240,'2023-03-27',6,NULL,NULL,NULL),(184,241,'2023-03-27',4,NULL,NULL,NULL),(185,242,'2023-03-27',1,NULL,NULL,NULL),(186,243,'2023-03-27',14,NULL,NULL,NULL),(187,245,'2023-03-27',138,NULL,NULL,NULL),(188,246,'2023-03-27',8,NULL,NULL,NULL),(189,247,'2023-03-27',4,NULL,NULL,NULL),(190,248,'2023-03-27',4,NULL,NULL,NULL),(191,249,'2023-03-27',49,NULL,NULL,NULL),(192,250,'2023-03-27',1,NULL,NULL,NULL),(193,251,'2023-03-27',16,NULL,NULL,NULL),(194,252,'2023-03-27',9,NULL,NULL,NULL),(195,256,'2023-03-27',3,NULL,NULL,NULL),(196,259,'2023-03-27',8,NULL,NULL,NULL),(197,261,'2023-03-27',5,NULL,NULL,NULL),(198,262,'2023-03-27',6,NULL,NULL,NULL),(199,263,'2023-03-27',2,NULL,NULL,NULL),(200,264,'2023-03-27',5,NULL,NULL,NULL),(201,265,'2023-03-27',6,NULL,NULL,NULL),(202,266,'2023-03-27',1,NULL,NULL,NULL),(203,267,'2023-03-27',4,NULL,NULL,NULL),(204,268,'2023-03-27',1,NULL,NULL,NULL),(205,269,'2023-03-27',2,NULL,NULL,NULL),(206,270,'2023-03-27',9,NULL,NULL,NULL),(207,271,'2023-03-27',1,NULL,NULL,NULL),(208,272,'2023-03-27',1,NULL,NULL,NULL),(209,274,'2023-03-27',1,NULL,NULL,NULL),(210,277,'2023-03-27',4,NULL,NULL,NULL),(211,278,'2023-03-27',7,NULL,NULL,NULL),(212,279,'2023-03-27',16,NULL,NULL,NULL),(213,280,'2023-03-27',2,NULL,NULL,NULL),(214,284,'2023-03-27',1,NULL,NULL,NULL),(215,285,'2023-03-27',1,NULL,NULL,NULL),(216,286,'2023-03-27',6,NULL,NULL,NULL),(217,288,'2023-03-27',2,NULL,NULL,NULL),(218,289,'2023-03-27',65,NULL,NULL,NULL),(219,290,'2023-03-27',2,NULL,NULL,NULL),(220,291,'2023-03-27',1,NULL,NULL,NULL),(221,292,'2023-03-27',1,NULL,NULL,NULL),(222,293,'2023-03-27',2,NULL,NULL,NULL),(223,294,'2023-03-27',4,NULL,NULL,NULL),(224,295,'2023-03-27',18,NULL,NULL,NULL),(225,296,'2023-03-27',3,NULL,NULL,NULL),(226,297,'2023-03-27',1,NULL,NULL,NULL),(227,298,'2023-03-27',6,NULL,NULL,NULL),(228,299,'2023-03-27',6,NULL,NULL,NULL),(229,300,'2023-03-27',5,NULL,NULL,NULL),(230,301,'2023-03-27',2,NULL,NULL,NULL),(231,302,'2023-03-27',119,NULL,NULL,NULL),(232,303,'2023-03-27',23,NULL,NULL,NULL),(233,304,'2023-03-27',6,NULL,NULL,NULL),(234,305,'2023-03-27',12,NULL,NULL,NULL),(235,306,'2023-03-27',103,NULL,NULL,NULL),(236,307,'2023-03-27',1,NULL,NULL,NULL),(237,308,'2023-03-27',1,NULL,NULL,NULL),(238,309,'2023-03-27',7,NULL,NULL,NULL),(239,310,'2023-03-27',108,NULL,NULL,NULL),(240,311,'2023-03-27',5,NULL,NULL,NULL),(241,312,'2023-03-27',2,NULL,NULL,NULL),(242,313,'2023-03-27',3,NULL,NULL,NULL),(243,314,'2023-03-27',1,NULL,NULL,NULL),(244,315,'2023-03-27',10,NULL,NULL,NULL),(245,316,'2023-03-27',5,NULL,NULL,NULL),(246,317,'2023-03-27',3,NULL,NULL,NULL),(247,318,'2023-03-27',6,NULL,NULL,NULL),(248,319,'2023-03-27',2,NULL,NULL,NULL),(249,320,'2023-03-27',6,NULL,NULL,NULL),(250,321,'2023-03-27',5,NULL,NULL,NULL);
/*!40000 ALTER TABLE `levante` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-14 17:02:37
