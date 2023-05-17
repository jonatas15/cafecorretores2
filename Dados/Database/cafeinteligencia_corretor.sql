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
-- Table structure for table `corretor`
--

DROP TABLE IF EXISTS `corretor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corretor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `celular` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `registro` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `obs` text COLLATE utf8mb4_general_ci,
  `foto` varchar(300) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `jetimobid` int DEFAULT NULL,
  `imoveis` text COLLATE utf8mb4_general_ci,
  `numimoveis` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corretor`
--

LOCK TABLES `corretor` WRITE;
/*!40000 ALTER TABLE `corretor` DISABLE KEYS */;
INSERT INTO `corretor` VALUES (1,'Jonatas (Webmaster)','jonatas.webdeveloper@gmail.com','(99) 93249-2349','12345','sdsadsa','IMG_20220824_132744_563.jpg',1232,'',0),(10,'Junior','junior@cafeimobiliaria.com.br','(55) 9 9707-0273','junior#caf3@23',NULL,NULL,NULL,NULL,NULL),(11,'Eduardo','eduardo@cafeimobiliaria.com.br','(55) 9 8431-7275','eduardo#caf3@23',NULL,NULL,NULL,NULL,NULL),(12,'Fábio C.','fabio@cafeimobiliaria.com.br','(55) 98131-4907','fabio#caf3@23','',NULL,1714,'0544;0095;0152;0198;0200;0359;0366;0372;0375;0377;0431;0434;0444;0462;0465;0466;0467;0523;0535;0536;0587;0588;0589;0622;0623;0624;0707;0808;0841;0874;0886;0891;0936;0949;0961;1030;1051;1112;1227;1228;1230;1231;1367;1332;1344;1347;1345;1346;1354;1406;1407;1420;1421;1422;1423;1424;1425;1426;1494;1334;1615;1755;1799;1862;1863;1935;2004;2033;2034;2088;2036;2042;2204;2216;2232;2353;2431;2485;2638;2679;2680;2708;2741;2775;2784;2803;2844;2842;2859;2887;2974;2975;3073;3093;3152;3153;3154;3166;3171;3200;3203;3249;3284;28712;28715;28716;28757;28795;28802;28948;29148;29149;29150;29151;31539;31608;31691;31941;32033;32058;321610;321677;321678;321679;321680;322694;322695;322696;322697;322698;322699;322700;322701;323081;323098;323099;323100;323101;323102;323145;323147;323148;323158;323159;323160;',145),(13,'Fabiano','fabiano@cafeimobiliaria.com.br','(55) 99921-8995','fabiano#caf3@23','',NULL,1715,'0024;0049;0058;0067;0094;0379;0235;0254;0262;0280;0337;0317;0319;0336;0393;0394;0396;0399;0410;0411;0451;0452;0457;0488;0531;0630;0685;0688;0689;0690;0720;0929;0980;1025;1026;1028;1098;1122;1123;1124;1247;1358;1362;1368;1378;1388;1387;1390;1394;1395;1513;1602;1609;1648;1662;1691;1719;1860;1859;1865;1883;1915;1954;1955;1957;1975;1995;1996;2118;2145;2146;2187;2239;2274;2317;2324;2391;2340;2392;2393;2394;2401;2464;2566;2568;2610;2660;2661;2675;2697;2763;2743;2760;2761;2765;2943;2983;3011;3033;3069;3118;3187;3239;28661;28663;28664;28720;28740;2761-1;28851;28894;28895;28982;28984;28985;29060;29072;29119;29260;31560;31703;31906;31907;31926;32068;32070;32080;32081;32230;32296;32366;32545;32637;32659;321232;321233;321234;321235;321400;321604;321687;321710;321711;321759;321864;321872;321905;321906;321913;322016;322029;322030;322031;322237;322278;322279;322317;322387;322400;322533;322638;322685;322686;322737;322749;322776;322899;322900;322901;322902;322903;322904;322907;322908;322917;323097;323212;323213;323286;',179),(14,'Ricardo Duarte','ri_duarte@cafeimobiliaria.com.br','(99) 99999-9999','r_duarte#caf3@23','',NULL,NULL,NULL,NULL),(15,'Rafael Mello','rafael_mello@cafeimobiliaria.com.br','','rafael_mello#caf3@23',NULL,NULL,NULL,NULL,NULL),(16,'Batirola','batirola@cafeimobiliaria.com.br','','batirola#caf3@23',NULL,NULL,NULL,NULL,NULL),(17,'Débora L. Santos','d_santos@cafeimobiliaria.com.br','(99) 99999-9999','d_santos#caf3@23','',NULL,NULL,NULL,NULL),(18,'Marciane','marciane@cafeimobiliaria.com.br','','marciane#caf3@23',NULL,NULL,NULL,NULL,NULL),(19,'Renan Alves','renan_alves@cafeimobiliaria.com.br','(55) 9 9963-0898','renan_alves#caf3@23',NULL,NULL,NULL,NULL,NULL),(20,'Luiz','luiz@cafeimobiliaria.com.br','','luiz#caf3@23',NULL,NULL,NULL,NULL,NULL),(21,'Rodrigo','rodrigo@cafeimobiliaria.com.br','','rodrigo#caf3@23',NULL,NULL,NULL,NULL,NULL),(22,'Régis','regis@cafeimobiliaria.com.br','','regis#caf3@23',NULL,NULL,NULL,NULL,NULL),(23,'Cassiano','cassiano@cafeimobiliaria.com.br','','cassiano#caf3@23',NULL,NULL,NULL,NULL,NULL),(24,'Valéria Alves','valeria_alves@cafeimobiliaria.com.br','(55) 9 9622-4208','valeria_alves#caf3@23',NULL,NULL,NULL,NULL,NULL),(25,'Felipe Amaral','felipe_amaral@cafeimobiliaria.com.br','','felipe_amaral#caf3@23',NULL,NULL,NULL,NULL,NULL),(26,'regis','regis@cafeimobiliaria.com.br','','regis#caf3@23',NULL,NULL,NULL,NULL,NULL),(27,'André','andre@cafeimobiliaria.com.br','(55) 9 8445-5309','andre#caf3@23',NULL,NULL,NULL,NULL,NULL),(28,'Eduardo Villas Boas','evillas_boas@cafeimobiliaria.com.br','(42) 34324-3243','ed_boas#caf3@23','',NULL,NULL,NULL,NULL),(29,'Débora Letícia','debora_leticia@cafeimobiliaria.com.br','','debora_leticia#caf3@23',NULL,NULL,NULL,NULL,NULL),(30,'Saymon Guimarães','s_guimaraes@cafeimobiliaria.com.br','(99) 99999-9999','s_guimaraes#caf3@23','',NULL,NULL,NULL,NULL),(31,'Ruanei Rodrigues de Souza','r_souza@cafeimobiliaria.com.br','(55) 98137-8533','r_souza#caf3@23','',NULL,NULL,NULL,NULL),(32,'Gildo da Silva Cezar','gildo_silva_cezar@cafeimobiliaria.com.br','(55) 99140-7439','g_cezar#caf3@23','',NULL,NULL,NULL,NULL),(33,'Ricardo Pires','ricardo_pires@cafeimobiliaria.com.br','','ricardo_pires#caf3@23',NULL,NULL,NULL,NULL,NULL),(34,'Adrian','adrian@cafeimobiliaria.com.br','(55) 9 9102-5562','adrian#caf3@23',NULL,NULL,NULL,NULL,NULL),(36,'Marta Ferreira','marta_ferreira@cafeimobiliaria.com.br','(55) 9 9669-3113','marta_ferreira#caf3@23',NULL,NULL,NULL,NULL,NULL),(37,'Jussair Cavalli','jussair_cavalli@cafeimobiliaria.com.br','(55) 9 9988-0123','jussair_cavalli#caf3@23',NULL,NULL,NULL,NULL,NULL),(38,'Sandro Brum','sandro_brum@cafeimobiliaria.com.br','(55) 9 9600-6710','sandro_brum#caf3@23',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `corretor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-14 17:02:43
