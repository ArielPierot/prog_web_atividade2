CREATE DATABASE  IF NOT EXISTS `lista2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `lista2`;
-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: lista2
-- ------------------------------------------------------
-- Server version	8.0.12

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
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(3) NOT NULL,
  `nome` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,'170','Ciência da Computação');
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplinas`
--

DROP TABLE IF EXISTS `disciplinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `disciplinas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(8) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `n_creditos` int(11) NOT NULL,
  `pre_req_1` int(11) DEFAULT NULL,
  `pre_req_2` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pre_req_1` (`pre_req_1`),
  KEY `pre_req_2` (`pre_req_2`),
  CONSTRAINT `disciplinas_ibfk_1` FOREIGN KEY (`pre_req_1`) REFERENCES `disciplinas` (`id`),
  CONSTRAINT `disciplinas_ibfk_2` FOREIGN KEY (`pre_req_2`) REFERENCES `disciplinas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplinas`
--

LOCK TABLES `disciplinas` WRITE;
/*!40000 ALTER TABLE `disciplinas` DISABLE KEYS */;
INSERT INTO `disciplinas` VALUES (1,'COMP0393','PROG. FUNCIONAL',4,NULL,NULL),(2,'COMP0480','SEM. EM COMPUTAÇÃO',2,NULL,NULL),(3,'MAT0057','FUND. ELEM. MAT.',4,NULL,NULL),(4,'MAT0150','VET. GEO. ANAL.',4,NULL,NULL),(5,'MAT0151','CÁLCULO A',4,NULL,NULL),(6,'COMP0334','PROG. IMPERATIVA',4,1,NULL),(7,'COMP0410','LOG. P. COMPUTAÇÃO',4,1,NULL),(8,'FISI0260','FISICA 1',4,5,NULL),(9,'FISI0264','LAB. FISICA 1',2,5,NULL),(10,'MAT0078','ALG. LINEAR',4,NULL,NULL),(11,'MAT0152','CÁLCULO B',4,5,NULL),(12,'COMP0395','PROGR. ORIENT. OBJ.',4,6,NULL),(13,'COMP0405','ESTRUT. DADOS',4,6,NULL),(14,'COMP0409','LING. FORM. COMPIL.',4,3,6),(15,'MAT0153','CÁLCULO C',4,11,NULL);
/*!40000 ALTER TABLE `disciplinas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periodos`
--

DROP TABLE IF EXISTS `periodos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `periodos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `curso_id` int(11) NOT NULL,
  `n_periodo` varchar(3) NOT NULL,
  `disciplina_id` int(11) NOT NULL,
  `tipo_disciplina` varchar(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `curso_id` (`curso_id`),
  KEY `disciplina_id` (`disciplina_id`),
  CONSTRAINT `periodos_ibfk_1` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`),
  CONSTRAINT `periodos_ibfk_2` FOREIGN KEY (`disciplina_id`) REFERENCES `disciplinas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periodos`
--

LOCK TABLES `periodos` WRITE;
/*!40000 ALTER TABLE `periodos` DISABLE KEYS */;
INSERT INTO `periodos` VALUES (1,1,'1',1,'O'),(2,1,'1',2,'O'),(3,1,'1',3,'O'),(4,1,'1',4,'O'),(5,1,'1',5,'O'),(6,1,'2',6,'O'),(7,1,'2',7,'O'),(8,1,'2',8,'O'),(9,1,'2',9,'O'),(10,1,'2',10,'O');
/*!40000 ALTER TABLE `periodos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-12 14:48:56
