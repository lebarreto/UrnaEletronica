-- MySQL dump 10.13  Distrib 8.0.16, for macos10.14 (x86_64)
--
-- Host: localhost    Database: projetoeleicao
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
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
-- Table structure for table `ModelCandidatos`
--

DROP TABLE IF EXISTS `ModelCandidatos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ModelCandidatos` (
  `numero` varchar(100) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `voto` int(11) NOT NULL,
  PRIMARY KEY (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ModelCandidatos`
--

LOCK TABLES `ModelCandidatos` WRITE;
/*!40000 ALTER TABLE `ModelCandidatos` DISABLE KEYS */;
INSERT INTO `ModelCandidatos` VALUES ('0','BRANCO',0),('1','NULO',0),('12','Ciro Gomes',1),('13','José Serra',1),('17','Jair Bolsonaro',0),('19','Cabo Daciolo',0);
/*!40000 ALTER TABLE `ModelCandidatos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ModelEstado`
--

DROP TABLE IF EXISTS `ModelEstado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ModelEstado` (
  `uf` varchar(2) NOT NULL,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`uf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ModelEstado`
--

LOCK TABLES `ModelEstado` WRITE;
/*!40000 ALTER TABLE `ModelEstado` DISABLE KEYS */;
INSERT INTO `ModelEstado` VALUES ('AC','Acre'),('PR','Paraná'),('RJ','Rio de Janeiro'),('SP','São Paulo');
/*!40000 ALTER TABLE `ModelEstado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ModelHabilitar`
--

DROP TABLE IF EXISTS `ModelHabilitar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ModelHabilitar` (
  `autoriza` varchar(50) NOT NULL,
  `titulo` varchar(10) NOT NULL,
  `autorizou` varchar(10) NOT NULL,
  `data` date DEFAULT NULL,
  `disponivel` enum('Y','N') DEFAULT 'N',
  `indisponivel` enum('Y','N') DEFAULT 'N',
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`autoriza`),
  KEY `titulo` (`titulo`),
  KEY `autorizou` (`autorizou`),
  CONSTRAINT `autorizacao_ibfk_1` FOREIGN KEY (`titulo`) REFERENCES `modeluser` (`titulo`),
  CONSTRAINT `autorizacao_ibfk_2` FOREIGN KEY (`autorizou`) REFERENCES `modeluser` (`titulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ModelHabilitar`
--

LOCK TABLES `ModelHabilitar` WRITE;
/*!40000 ALTER TABLE `ModelHabilitar` DISABLE KEYS */;
/*!40000 ALTER TABLE `ModelHabilitar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ModelMunicipio`
--

DROP TABLE IF EXISTS `ModelMunicipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ModelMunicipio` (
  `numero` int(5) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `uf` varchar(2) NOT NULL,
  PRIMARY KEY (`numero`),
  KEY `uf` (`uf`),
  CONSTRAINT `modelmunicipio_ibfk_1` FOREIGN KEY (`uf`) REFERENCES `modelestado` (`uf`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ModelMunicipio`
--

LOCK TABLES `ModelMunicipio` WRITE;
/*!40000 ALTER TABLE `ModelMunicipio` DISABLE KEYS */;
INSERT INTO `ModelMunicipio` VALUES (1,'São José dos Campos','SP');
/*!40000 ALTER TABLE `ModelMunicipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ModelUser`
--

DROP TABLE IF EXISTS `ModelUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ModelUser` (
  `titulo` varchar(12) NOT NULL,
  `emissao` date NOT NULL,
  `zona` varchar(3) DEFAULT NULL,
  `secao` varchar(4) DEFAULT NULL,
  `nome` varchar(100) NOT NULL,
  `nascimento` date NOT NULL,
  `nivel` int(1) DEFAULT NULL,
  `senha` varchar(16) NOT NULL,
  `AUT_ID` varchar(255) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `autorizou` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `disponivel` char(1) DEFAULT NULL,
  `indisponivel` char(1) DEFAULT NULL,
  `user_disponivel` char(1) DEFAULT 'N',
  `user_indisponivel` char(1) DEFAULT 'N',
  PRIMARY KEY (`titulo`),
  KEY `nivel` (`nivel`),
  CONSTRAINT `modeluser_ibfk_1` FOREIGN KEY (`nivel`) REFERENCES `nivel` (`nivel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ModelUser`
--

LOCK TABLES `ModelUser` WRITE;
/*!40000 ALTER TABLE `ModelUser` DISABLE KEYS */;
INSERT INTO `ModelUser` VALUES ('1111','2018-01-15','1','1','Nathan Maronez','2018-01-15',3,'1111',NULL,NULL,NULL,NULL,NULL,NULL,'N','Y'),('1234','2018-01-15','1','1','Laura Maia','2018-01-15',1,'1234',NULL,NULL,NULL,NULL,NULL,NULL,'N','Y'),('5678','2018-01-15','1','1','Letícia Barreto','2018-01-15',2,'5678',NULL,NULL,NULL,NULL,NULL,NULL,'N','N');
/*!40000 ALTER TABLE `ModelUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ModelZona`
--

DROP TABLE IF EXISTS `ModelZona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ModelZona` (
  `zona` int(11) NOT NULL AUTO_INCREMENT,
  `uf` varchar(50) NOT NULL,
  PRIMARY KEY (`zona`),
  KEY `uf` (`uf`),
  CONSTRAINT `modelzona_ibfk_1` FOREIGN KEY (`uf`) REFERENCES `modelestado` (`uf`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ModelZona`
--

LOCK TABLES `ModelZona` WRITE;
/*!40000 ALTER TABLE `ModelZona` DISABLE KEYS */;
INSERT INTO `ModelZona` VALUES (1,'SP');
/*!40000 ALTER TABLE `ModelZona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivel`
--

DROP TABLE IF EXISTS `nivel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `nivel` (
  `nivel` int(1) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(20) NOT NULL,
  PRIMARY KEY (`nivel`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel`
--

LOCK TABLES `nivel` WRITE;
/*!40000 ALTER TABLE `nivel` DISABLE KEYS */;
INSERT INTO `nivel` VALUES (1,'USUÁRIO COMUM'),(2,'MESÁRIO'),(3,'CHEFE DE SEÇÃO');
/*!40000 ALTER TABLE `nivel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-24 21:08:16
