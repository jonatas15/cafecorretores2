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
-- Table structure for table `numacros`
--

DROP TABLE IF EXISTS `numacros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `numacros` (
  `id` int NOT NULL AUTO_INCREMENT,
  `corretor_id` int NOT NULL,
  `leads_recebidos` int DEFAULT NULL,
  `percentual_conversao` decimal(10,2) DEFAULT NULL,
  `quant_vendas_vgc` int DEFAULT NULL,
  `quant_vendas_vgv` int DEFAULT NULL,
  `quant_visitas` int DEFAULT NULL,
  `quant_imoveis_agenciados` int DEFAULT NULL,
  `ticket_medio_venda` decimal(10,2) DEFAULT NULL,
  `custo_lead` decimal(10,2) DEFAULT NULL,
  `pos_ranking_geral_vendas` int DEFAULT NULL,
  `data` date DEFAULT NULL,
  `mes_referencia` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_numacros_corretor1_idx` (`corretor_id`),
  CONSTRAINT `fk_numacros_corretor1` FOREIGN KEY (`corretor_id`) REFERENCES `corretor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numacros`
--

LOCK TABLES `numacros` WRITE;
/*!40000 ALTER TABLE `numacros` DISABLE KEYS */;
INSERT INTO `numacros` VALUES (1,1,51,47.00,68,63,21,32,120000.00,734.00,33,'2023-03-16',1),(2,1,66,33.00,89,63,39,17,560000.00,400.00,12,'2023-03-16',2),(3,1,83,56.00,70,14,55,36,900500.00,200.00,10,'2023-03-16',3),(4,1,64,59.00,47,25,79,47,320000.00,125.00,1,'2023-03-20',4),(5,1,38,94.00,71,82,42,97,1002000.00,1223.00,11,'2023-03-20',5),(6,12,31,44.00,59,23,36,87,100200.00,300.00,41,'2023-03-30',3),(7,12,78,63.00,29,25,11,45,3000000.00,300.00,67,'2023-03-30',4),(8,13,37,46.00,48,29,26,29,1200000.00,230.00,5,'2023-03-30',3),(9,13,42,41.00,23,92,57,40,4500000.00,100.23,5,'2023-03-30',4),(10,13,69,34.00,29,85,97,45,9000000.00,4500.00,1,'2023-03-30',5);
/*!40000 ALTER TABLE `numacros` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-14 17:02:45
