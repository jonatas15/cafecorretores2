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
-- Table structure for table `auth_assignment`
--

DROP TABLE IF EXISTS `auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` int NOT NULL,
  `created_at` int DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_assignment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_assignment`
--

LOCK TABLES `auth_assignment` WRITE;
/*!40000 ALTER TABLE `auth_assignment` DISABLE KEYS */;
INSERT INTO `auth_assignment` VALUES ('Admin',2,1679011663);
/*!40000 ALTER TABLE `auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item`
--

DROP TABLE IF EXISTS `auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  `group_code` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  KEY `fk_auth_item_group_code` (`group_code`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_auth_item_group_code` FOREIGN KEY (`group_code`) REFERENCES `auth_item_group` (`code`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item`
--

LOCK TABLES `auth_item` WRITE;
/*!40000 ALTER TABLE `auth_item` DISABLE KEYS */;
INSERT INTO `auth_item` VALUES ('/*',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('//*',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('//controller',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('//crud',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('//extension',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('//form',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('//index',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('//model',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('//module',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/asset/*',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/asset/compress',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/asset/template',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/cache/*',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/cache/flush',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/cache/flush-all',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/cache/flush-schema',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/cache/index',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/debug/*',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/debug/default/*',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/debug/default/db-explain',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/debug/default/download-mail',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/debug/default/index',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/debug/default/toolbar',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/debug/default/view',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/debug/user/*',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/debug/user/reset-identity',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/debug/user/set-identity',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/fixture/*',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/fixture/load',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/fixture/unload',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/gii/*',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/gii/default/*',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/gii/default/action',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/gii/default/diff',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/gii/default/index',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/gii/default/preview',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/gii/default/view',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/hello/*',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/hello/index',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/help/*',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/help/index',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/help/list',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/help/list-action-options',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/help/usage',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/message/*',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/message/config',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/message/config-template',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/message/extract',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/migrate/*',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/migrate/create',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/migrate/down',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/migrate/fresh',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/migrate/history',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/migrate/mark',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/migrate/new',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/migrate/redo',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/migrate/to',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/migrate/up',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/serve/*',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/serve/index',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/user-management/*',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/user-management/auth/change-own-password',3,NULL,NULL,NULL,1675106515,1675106515,NULL),('/user-management/user-permission/set',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/user-management/user-permission/set-roles',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/user-management/user/bulk-activate',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/user-management/user/bulk-deactivate',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/user-management/user/bulk-delete',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/user-management/user/change-password',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/user-management/user/create',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/user-management/user/delete',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/user-management/user/grid-page-size',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/user-management/user/index',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/user-management/user/update',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('/user-management/user/view',3,NULL,NULL,NULL,1675106514,1675106514,NULL),('Admin',1,'Admin',NULL,NULL,1675106514,1675106514,NULL),('assignRolesToUsers',2,'Assign roles to users',NULL,NULL,1675106514,1675106514,'userManagement'),('bindUserToIp',2,'Bind user to IP',NULL,NULL,1675106515,1675106515,'userManagement'),('changeOwnPassword',2,'Change own password',NULL,NULL,1675106515,1675106515,'userCommonPermissions'),('changeUserPassword',2,'Change user password',NULL,NULL,1675106514,1675106514,'userManagement'),('commonPermission',2,'Common permission',NULL,NULL,1675106498,1675106498,NULL),('createUsers',2,'Create users',NULL,NULL,1675106514,1675106514,'userManagement'),('deleteUsers',2,'Delete users',NULL,NULL,1675106514,1675106514,'userManagement'),('editUserEmail',2,'Edit user email',NULL,NULL,1675106514,1675106514,'userManagement'),('editUsers',2,'Edit users',NULL,NULL,1675106514,1675106514,'userManagement'),('viewRegistrationIp',2,'View registration IP',NULL,NULL,1675106514,1675106514,'userManagement'),('viewUserEmail',2,'View user email',NULL,NULL,1675106514,1675106514,'userManagement'),('viewUserRoles',2,'View user roles',NULL,NULL,1675106514,1675106514,'userManagement'),('viewUsers',2,'View users',NULL,NULL,1675106514,1675106514,'userManagement'),('viewVisitLog',2,'View visit log',NULL,NULL,1675106514,1675106514,'userManagement');
/*!40000 ALTER TABLE `auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item_child`
--

DROP TABLE IF EXISTS `auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item_child`
--

LOCK TABLES `auth_item_child` WRITE;
/*!40000 ALTER TABLE `auth_item_child` DISABLE KEYS */;
INSERT INTO `auth_item_child` VALUES ('changeOwnPassword','/user-management/auth/change-own-password'),('assignRolesToUsers','/user-management/user-permission/set'),('assignRolesToUsers','/user-management/user-permission/set-roles'),('editUsers','/user-management/user/bulk-activate'),('editUsers','/user-management/user/bulk-deactivate'),('deleteUsers','/user-management/user/bulk-delete'),('changeUserPassword','/user-management/user/change-password'),('createUsers','/user-management/user/create'),('deleteUsers','/user-management/user/delete'),('viewUsers','/user-management/user/grid-page-size'),('viewUsers','/user-management/user/index'),('editUsers','/user-management/user/update'),('viewUsers','/user-management/user/view'),('Admin','assignRolesToUsers'),('Admin','changeOwnPassword'),('Admin','changeUserPassword'),('Admin','createUsers'),('Admin','deleteUsers'),('Admin','editUsers'),('editUserEmail','viewUserEmail'),('assignRolesToUsers','viewUserRoles'),('Admin','viewUsers'),('assignRolesToUsers','viewUsers'),('changeUserPassword','viewUsers'),('createUsers','viewUsers'),('deleteUsers','viewUsers'),('editUsers','viewUsers');
/*!40000 ALTER TABLE `auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item_group`
--

DROP TABLE IF EXISTS `auth_item_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_item_group` (
  `code` varchar(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item_group`
--

LOCK TABLES `auth_item_group` WRITE;
/*!40000 ALTER TABLE `auth_item_group` DISABLE KEYS */;
INSERT INTO `auth_item_group` VALUES ('userCommonPermissions','User common permission',1675106515,1675106515),('userManagement','User management',1675106514,1675106514);
/*!40000 ALTER TABLE `auth_item_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_rule`
--

DROP TABLE IF EXISTS `auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_rule`
--

LOCK TABLES `auth_rule` WRITE;
/*!40000 ALTER TABLE `auth_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chamada`
--

DROP TABLE IF EXISTS `chamada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chamada` (
  `id` int NOT NULL AUTO_INCREMENT,
  `corretor_id` int NOT NULL,
  `data` datetime NOT NULL,
  `titulo` varchar(250) NOT NULL,
  `descricao` text,
  `prioridade` enum('Urgente','Moderada','Quando puder') DEFAULT NULL,
  `prazo` time DEFAULT NULL,
  `horario` time DEFAULT NULL,
  `data_def` date DEFAULT NULL,
  PRIMARY KEY (`id`,`corretor_id`),
  KEY `fk_chamada_corretor1_idx` (`corretor_id`),
  CONSTRAINT `fk_chamada_corretor1` FOREIGN KEY (`corretor_id`) REFERENCES `corretor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chamada`
--

LOCK TABLES `chamada` WRITE;
/*!40000 ALTER TABLE `chamada` DISABLE KEYS */;
/*!40000 ALTER TABLE `chamada` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `imovel`
--

DROP TABLE IF EXISTS `imovel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imovel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `corretor_id` int NOT NULL,
  `codigo` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_imovel_corretor1_idx` (`corretor_id`),
  CONSTRAINT `fk_imovel_corretor1` FOREIGN KEY (`corretor_id`) REFERENCES `corretor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=325 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imovel`
--

LOCK TABLES `imovel` WRITE;
/*!40000 ALTER TABLE `imovel` DISABLE KEYS */;
INSERT INTO `imovel` VALUES (1,12,'0544'),(2,12,'0095'),(3,12,'0152'),(4,12,'0198'),(5,12,'0200'),(6,12,'0359'),(7,12,'0366'),(8,12,'0372'),(9,12,'0375'),(10,12,'0377'),(11,12,'0431'),(12,12,'0434'),(13,12,'0444'),(14,12,'0462'),(15,12,'0465'),(16,12,'0466'),(17,12,'0467'),(18,12,'0523'),(19,12,'0535'),(20,12,'0536'),(21,12,'0587'),(22,12,'0588'),(23,12,'0589'),(24,12,'0622'),(25,12,'0623'),(26,12,'0624'),(27,12,'0707'),(28,12,'0808'),(29,12,'0841'),(30,12,'0874'),(31,12,'0886'),(32,12,'0891'),(33,12,'0936'),(34,12,'0949'),(35,12,'0961'),(36,12,'1030'),(37,12,'1051'),(38,12,'1112'),(39,12,'1227'),(40,12,'1228'),(41,12,'1230'),(42,12,'1231'),(43,12,'1367'),(44,12,'1332'),(45,12,'1344'),(46,12,'1347'),(47,12,'1345'),(48,12,'1346'),(49,12,'1354'),(50,12,'1406'),(51,12,'1407'),(52,12,'1420'),(53,12,'1421'),(54,12,'1422'),(55,12,'1423'),(56,12,'1424'),(57,12,'1425'),(58,12,'1426'),(59,12,'1494'),(60,12,'1334'),(61,12,'1615'),(62,12,'1755'),(63,12,'1799'),(64,12,'1862'),(65,12,'1863'),(66,12,'1935'),(67,12,'2004'),(68,12,'2033'),(69,12,'2034'),(70,12,'2088'),(71,12,'2036'),(72,12,'2042'),(73,12,'2204'),(74,12,'2216'),(75,12,'2232'),(76,12,'2353'),(77,12,'2431'),(78,12,'2485'),(79,12,'2638'),(80,12,'2679'),(81,12,'2680'),(82,12,'2708'),(83,12,'2741'),(84,12,'2775'),(85,12,'2784'),(86,12,'2803'),(87,12,'2844'),(88,12,'2842'),(89,12,'2859'),(90,12,'2887'),(91,12,'2974'),(92,12,'2975'),(93,12,'3073'),(94,12,'3093'),(95,12,'3152'),(96,12,'3153'),(97,12,'3154'),(98,12,'3166'),(99,12,'3171'),(100,12,'3200'),(101,12,'3203'),(102,12,'3249'),(103,12,'3284'),(104,12,'28712'),(105,12,'28715'),(106,12,'28716'),(107,12,'28757'),(108,12,'28795'),(109,12,'28802'),(110,12,'28948'),(111,12,'29148'),(112,12,'29149'),(113,12,'29150'),(114,12,'29151'),(115,12,'31539'),(116,12,'31608'),(117,12,'31691'),(118,12,'31941'),(119,12,'32033'),(120,12,'32058'),(121,12,'321610'),(122,12,'321677'),(123,12,'321678'),(124,12,'321679'),(125,12,'321680'),(126,12,'322694'),(127,12,'322695'),(128,12,'322696'),(129,12,'322697'),(130,12,'322698'),(131,12,'322699'),(132,12,'322700'),(133,12,'322701'),(134,12,'323081'),(135,12,'323098'),(136,12,'323099'),(137,12,'323100'),(138,12,'323101'),(139,12,'323102'),(140,12,'323145'),(141,12,'323147'),(142,12,'323148'),(143,12,'323158'),(144,12,'323159'),(145,12,'323160'),(146,13,'0024'),(147,13,'0049'),(148,13,'0058'),(149,13,'0067'),(150,13,'0094'),(151,13,'0379'),(152,13,'0235'),(153,13,'0254'),(154,13,'0262'),(155,13,'0280'),(156,13,'0337'),(157,13,'0317'),(158,13,'0319'),(159,13,'0336'),(160,13,'0393'),(161,13,'0394'),(162,13,'0396'),(163,13,'0399'),(164,13,'0410'),(165,13,'0411'),(166,13,'0451'),(167,13,'0452'),(168,13,'0457'),(169,13,'0488'),(170,13,'0531'),(171,13,'0630'),(172,13,'0685'),(173,13,'0688'),(174,13,'0689'),(175,13,'0690'),(176,13,'0720'),(177,13,'0929'),(178,13,'0980'),(179,13,'1025'),(180,13,'1026'),(181,13,'1028'),(182,13,'1098'),(183,13,'1122'),(184,13,'1123'),(185,13,'1124'),(186,13,'1247'),(187,13,'1358'),(188,13,'1362'),(189,13,'1368'),(190,13,'1378'),(191,13,'1388'),(192,13,'1387'),(193,13,'1390'),(194,13,'1394'),(195,13,'1395'),(196,13,'1513'),(197,13,'1602'),(198,13,'1609'),(199,13,'1648'),(200,13,'1662'),(201,13,'1691'),(202,13,'1719'),(203,13,'1860'),(204,13,'1859'),(205,13,'1865'),(206,13,'1883'),(207,13,'1915'),(208,13,'1954'),(209,13,'1955'),(210,13,'1957'),(211,13,'1975'),(212,13,'1995'),(213,13,'1996'),(214,13,'2118'),(215,13,'2145'),(216,13,'2146'),(217,13,'2187'),(218,13,'2239'),(219,13,'2274'),(220,13,'2317'),(221,13,'2324'),(222,13,'2391'),(223,13,'2340'),(224,13,'2392'),(225,13,'2393'),(226,13,'2394'),(227,13,'2401'),(228,13,'2464'),(229,13,'2566'),(230,13,'2568'),(231,13,'2610'),(232,13,'2660'),(233,13,'2661'),(234,13,'2675'),(235,13,'2697'),(236,13,'2763'),(237,13,'2743'),(238,13,'2760'),(239,13,'2761'),(240,13,'2765'),(241,13,'2943'),(242,13,'2983'),(243,13,'3011'),(244,13,'3033'),(245,13,'3069'),(246,13,'3118'),(247,13,'3187'),(248,13,'3239'),(249,13,'28661'),(250,13,'28663'),(251,13,'28664'),(252,13,'28720'),(253,13,'28740'),(254,13,'2761-1'),(255,13,'28851'),(256,13,'28894'),(257,13,'28895'),(258,13,'28982'),(259,13,'28984'),(260,13,'28985'),(261,13,'29060'),(262,13,'29072'),(263,13,'29119'),(264,13,'29260'),(265,13,'31560'),(266,13,'31703'),(267,13,'31906'),(268,13,'31907'),(269,13,'31926'),(270,13,'32068'),(271,13,'32070'),(272,13,'32080'),(273,13,'32081'),(274,13,'32230'),(275,13,'32296'),(276,13,'32366'),(277,13,'32545'),(278,13,'32637'),(279,13,'32659'),(280,13,'321232'),(281,13,'321233'),(282,13,'321234'),(283,13,'321235'),(284,13,'321400'),(285,13,'321604'),(286,13,'321687'),(287,13,'321710'),(288,13,'321711'),(289,13,'321759'),(290,13,'321864'),(291,13,'321872'),(292,13,'321905'),(293,13,'321906'),(294,13,'321913'),(295,13,'322016'),(296,13,'322029'),(297,13,'322030'),(298,13,'322031'),(299,13,'322237'),(300,13,'322278'),(301,13,'322279'),(302,13,'322317'),(303,13,'322387'),(304,13,'322400'),(305,13,'322533'),(306,13,'322638'),(307,13,'322685'),(308,13,'322686'),(309,13,'322737'),(310,13,'322749'),(311,13,'322776'),(312,13,'322899'),(313,13,'322900'),(314,13,'322901'),(315,13,'322902'),(316,13,'322903'),(317,13,'322904'),(318,13,'322907'),(319,13,'322908'),(320,13,'322917'),(321,13,'323097'),(322,13,'323212'),(323,13,'323213'),(324,13,'323286');
/*!40000 ALTER TABLE `imovel` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `metas`
--

DROP TABLE IF EXISTS `metas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `agenciamentos` varchar(10) DEFAULT NULL,
  `placas` varchar(10) DEFAULT NULL,
  `gestao_imoveis` varchar(10) DEFAULT NULL,
  `recuperacao_leads` varchar(10) DEFAULT NULL,
  `prospeccoes` varchar(10) DEFAULT NULL,
  `incentivo_semanal` text,
  `corretor_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_metas_corretor1_idx` (`corretor_id`),
  CONSTRAINT `fk_metas_corretor1` FOREIGN KEY (`corretor_id`) REFERENCES `corretor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metas`
--

LOCK TABLES `metas` WRITE;
/*!40000 ALTER TABLE `metas` DISABLE KEYS */;
/*!40000 ALTER TABLE `metas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration`
--

DROP TABLE IF EXISTS `migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migration` (
  `version` varchar(180) COLLATE utf8mb4_general_ci NOT NULL,
  `apply_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration`
--

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` VALUES ('m000000_000000_base',1675106464),('m140608_173539_create_user_table',1675106474),('m140611_133903_init_rbac',1675106486),('m140808_073114_create_auth_item_group_table',1675106496),('m140809_072112_insert_superadmin_to_user',1675106498),('m140809_073114_insert_common_permisison_to_auth_item',1675106499),('m141023_141535_create_user_visit_log',1675106501),('m141116_115804_add_bind_to_ip_and_registration_ip_to_user',1675106505),('m141121_194858_split_browser_and_os_column',1675106511),('m141201_220516_add_email_and_email_confirmed_to_user',1675106514),('m141207_001649_create_basic_user_permissions',1675106515);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `superadmin` smallint DEFAULT '0',
  `created_at` int NOT NULL,
  `updated_at` int NOT NULL,
  `registration_ip` varchar(15) DEFAULT NULL,
  `bind_to_ip` varchar(255) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `email_confirmed` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'superadmin','_jVhj4hBo6_WuXSSde4Wj6o-MoOnbBNm','$2y$13$52wZwSDs6eWQReDYj8j4Fu4d6.OChxZzwjO2CN/cTuB4/1LqifXDe',NULL,1,1,1675106497,1675193069,NULL,'',NULL,0),(2,'jonatas','SF2fahAXmalyXrz7MpDYSXqVDRnwbE_U','$2y$13$dFtpK55xi0ck0qm09nOYbejluH7yzaWY3x7gFZW5nCu3zNPghDVgm',NULL,1,0,1679011600,1679011600,'127.0.0.1','','jonatas.webdeveloper@gmail.com',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_visit_log`
--

DROP TABLE IF EXISTS `user_visit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_visit_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `language` char(2) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `user_id` int DEFAULT NULL,
  `visit_time` int NOT NULL,
  `browser` varchar(30) DEFAULT NULL,
  `os` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_visit_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_visit_log`
--

LOCK TABLES `user_visit_log` WRITE;
/*!40000 ALTER TABLE `user_visit_log` DISABLE KEYS */;
INSERT INTO `user_visit_log` VALUES (6,'63d82b9c06c90','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1,1675111324,'Chrome','Linux'),(7,'63d82c46ef1f9','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1,1675111494,'Chrome','Linux'),(8,'63d9095f47ecf','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1,1675168095,'Chrome','Linux'),(9,'63d915ce15bbf','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1,1675171278,'Chrome','Linux'),(10,'63d94c66df278','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1,1675185254,'Chrome','Linux'),(11,'63d969e20ab13','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1,1675192802,'Chrome','Linux'),(12,'63d96af647a54','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1,1675193078,'Chrome','Linux'),(13,'63d96b140459b','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1,1675193108,'Chrome','Linux'),(14,'63da619cbd72c','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1,1675256220,'Chrome','Linux'),(15,'63da64ac9cd8f','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1,1675257004,'Chrome','Linux'),(16,'63da67f9f0b69','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1,1675257849,'Chrome','Linux'),(17,'63da6803cbb6e','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1,1675257859,'Chrome','Linux'),(18,'63daa66e1f8f3','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1,1675273838,'Chrome','Linux'),(19,'63dbac020de0c','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1,1675340802,'Chrome','Linux'),(20,'63dbada521c3d','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1,1675341221,'Chrome','Linux'),(21,'63dbc17b4afb4','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1,1675346299,'Chrome','Linux'),(22,'63dbf6e3d5553','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1,1675359971,'Chrome','Linux'),(23,'63dcf22b5190e','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1,1675424299,'Chrome','Linux'),(24,'63e39deec5d3c','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1,1675861486,'Chrome','Linux'),(25,'63e3a8c5ca4ac','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1,1675864261,'Chrome','Linux'),(26,'63e3f18fddd2d','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36',1,1675882895,'Chrome','Linux'),(27,'63eb788d48948','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36',1,1676376205,'Chrome','Linux'),(28,'63eb93d02aa7c','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36',1,1676383184,'Chrome','Linux'),(29,'6405e990994a1','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36',1,1678109072,'Chrome','Linux'),(30,'6405f997a9876','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36',1,1678113175,'Chrome','Linux'),(31,'6407340ac15b1','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36',1,1678193674,'Chrome','Linux'),(32,'64073ed7eefc2','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36',1,1678196439,'Chrome','Linux'),(33,'64077d3a5e46f','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36',1,1678212410,'Chrome','Linux'),(34,'64077dad61468','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36',1,1678212525,'Chrome','Linux'),(35,'6408bd8e18f61','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36',1,1678294414,'Chrome','Linux'),(36,'6409def5151e8','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',1,1678368501,'Chrome','Linux'),(37,'640a1784ddb2b','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',1,1678382980,'Chrome','Linux'),(38,'640b3c2317394','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',1,1678457891,'Chrome','Linux'),(39,'640b843f73704','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',1,1678476351,'Chrome','Linux'),(40,'640f17ae19cba','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',1,1678710702,'Chrome','Linux'),(41,'64106ac38adce','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',1,1678797507,'Chrome','Linux'),(42,'6411a15f1b41c','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',1,1678877023,'Chrome','Linux'),(43,'641367bed652b','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',1,1678993342,'Chrome','Linux'),(44,'6413ac0ad3e79','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',1,1679010826,'Chrome','Linux'),(45,'6413aed1b4184','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',1,1679011537,'Chrome','Linux'),(46,'6413b7c0a6b26','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',1,1679013824,'Chrome','Linux'),(47,'64146fd8bd422','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',1,1679060952,'Chrome','Linux'),(48,'641485200ada3','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',1,1679066400,'Chrome','Linux'),(49,'6414acd9124d9','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',1,1679076569,'Chrome','Linux'),(50,'6414cb68b9b3e','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',1,1679084392,'Chrome','Linux'),(51,'64185522b157f','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',1,1679316258,'Chrome','Linux'),(52,'641afd9a7e922','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',1,1679490458,'Chrome','Linux'),(53,'641b5de4cfac1','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',1,1679515108,'Chrome','Linux'),(54,'641c36564d7f7','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',1,1679570518,'Chrome','Linux'),(55,'641c4608b0312','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',1,1679574536,'Chrome','Linux'),(56,'641c5def8f837','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',1,1679580655,'Chrome','Linux'),(57,'641c93fa9e698','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',1,1679594490,'Chrome','Linux'),(58,'641c9d79c89a2','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',1,1679596921,'Chrome','Linux'),(59,'641cab41a04f8','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',1,1679600449,'Chrome','Linux'),(60,'641da940e0dd4','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',1,1679665472,'Chrome','Linux'),(61,'6421d4df7ae3a','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',1,1679938783,'Chrome','Linux'),(62,'6421e976976f5','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',1,1679944054,'Chrome','Linux'),(63,'64221e402af84','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',1,1679957568,'Chrome','Linux'),(64,'6422f240960d6','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',1,1680011840,'Chrome','Linux'),(65,'6423325a37387','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',1,1680028250,'Chrome','Linux'),(66,'642351d11919e','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',1,1680036305,'Chrome','Linux'),(67,'64237012ee5c7','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',1,1680044050,'Chrome','Linux'),(68,'642436006e1d3','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',1,1680094720,'Chrome','Linux'),(69,'6425cd2de1595','127.0.0.1','pt','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36 OPR/97.0.0.0',1,1680198958,'Chrome','Linux'),(70,'6425e6133371a','127.0.0.1','pt','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36 OPR/97.0.0.0',1,1680205331,'Chrome','Linux'),(71,'6426d30c6391b','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',1,1680265996,'Chrome','Linux'),(72,'642ac46ea7f46','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',1,1680524398,'Chrome','Linux'),(73,'642aeaaf428a2','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',1,1680534191,'Chrome','Linux'),(74,'642c09f16deb8','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',1,1680607729,'Chrome','Linux'),(75,'642d660ee4eed','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',1,1680696846,'Chrome','Linux'),(76,'642db4f109dab','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36',1,1680717041,'Chrome','Linux'),(77,'6433fd0dd7b82','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36',1,1681128717,'Chrome','Linux'),(78,'64355f7bb0444','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36',1,1681219451,'Chrome','Linux'),(79,'6435a4f560e1c','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36',1,1681237237,'Chrome','Linux'),(80,'6435dd9b9e918','127.0.0.1','en','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36',1,1681251739,'Chrome','Linux');
/*!40000 ALTER TABLE `user_visit_log` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `whatssend`
--

DROP TABLE IF EXISTS `whatssend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `whatssend` (
  `id` int NOT NULL AUTO_INCREMENT,
  `corretor_id` int NOT NULL,
  `chamada_id` int DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`corretor_id`),
  KEY `fk_whatssend_corretor1_idx` (`corretor_id`),
  KEY `fk_whatssend_chamada1_idx` (`chamada_id`),
  CONSTRAINT `fk_whatssend_chamada1` FOREIGN KEY (`chamada_id`) REFERENCES `chamada` (`id`),
  CONSTRAINT `fk_whatssend_corretor1` FOREIGN KEY (`corretor_id`) REFERENCES `corretor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whatssend`
--

LOCK TABLES `whatssend` WRITE;
/*!40000 ALTER TABLE `whatssend` DISABLE KEYS */;
/*!40000 ALTER TABLE `whatssend` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-14 17:04:01
