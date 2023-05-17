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
-- Table structure for table `visita`
--

DROP TABLE IF EXISTS `visita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visita` (
  `id` int NOT NULL AUTO_INCREMENT,
  `corretor_id` int DEFAULT NULL,
  `imovel_id` int DEFAULT NULL,
  `nome_corretor` varchar(145) DEFAULT NULL,
  `imobiliaria_parceira` varchar(245) DEFAULT NULL,
  `data_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_visita` date NOT NULL,
  `hora_visita` time DEFAULT NULL,
  `codigo_imovel` varchar(20) DEFAULT NULL,
  `visitante_nome` varchar(250) NOT NULL,
  `convertido` tinyint NOT NULL DEFAULT '0',
  `obs` text,
  `contrato` text,
  PRIMARY KEY (`id`),
  KEY `fk_visita_corretor1_idx` (`corretor_id`),
  KEY `fk_visita_imovel1_idx` (`imovel_id`),
  CONSTRAINT `fk_visita_corretor1` FOREIGN KEY (`corretor_id`) REFERENCES `corretor` (`id`),
  CONSTRAINT `fk_visita_imovel1` FOREIGN KEY (`imovel_id`) REFERENCES `imovel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visita`
--

LOCK TABLES `visita` WRITE;
/*!40000 ALTER TABLE `visita` DISABLE KEYS */;
INSERT INTO `visita` VALUES (1,NULL,NULL,'','','2023-04-05 14:53:29','2022-02-02',NULL,'','Flano',1,NULL,NULL),(2,1,1,'Sass','','2023-04-10 16:26:41','2023-04-09','04:15:00','','Flano',0,NULL,NULL),(3,13,158,'Sass','Sasa','2023-04-11 11:34:37','2023-04-09','11:30:00','21321321321','213213213213',0,NULL,'0'),(4,NULL,NULL,'','','2023-04-11 11:40:35','2023-04-10','11:30:00','','Flano',0,NULL,'1');
/*!40000 ALTER TABLE `visita` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-14 17:02:44
