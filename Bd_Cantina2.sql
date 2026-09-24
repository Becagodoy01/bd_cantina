-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: reseau.proxy.rlwy.net    Database: bd_cantina
-- ------------------------------------------------------
-- Server version	9.4.0

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
-- Table structure for table `Categorias`
--

DROP TABLE IF EXISTS `Categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Categorias` (
  `ID_categoria` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Descricao` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ID_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categorias`
--

LOCK TABLES `Categorias` WRITE;
/*!40000 ALTER TABLE `Categorias` DISABLE KEYS */;
INSERT INTO `Categorias` VALUES (1,'Salgados','Produtos Salgados'),(2,'Doces','Produtos Doces'),(3,'Bebidas','Bebidas disponíveis na cantina');
/*!40000 ALTER TABLE `Categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Estoque`
--

DROP TABLE IF EXISTS `Estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Estoque` (
  `ID_estoque` int unsigned NOT NULL AUTO_INCREMENT,
  `ID_produto` int unsigned NOT NULL,
  `Quantidade` int unsigned NOT NULL,
  `Disponibilidade` tinyint(1) NOT NULL,
  `Lote` varchar(50) DEFAULT NULL,
  `Validade` date DEFAULT NULL,
  `Data_entrada` datetime DEFAULT NULL,
  `Data_atualizacao` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_estoque`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Estoque`
--

LOCK TABLES `Estoque` WRITE;
/*!40000 ALTER TABLE `Estoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `Estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Itens_pedidos`
--

DROP TABLE IF EXISTS `Itens_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Itens_pedidos` (
  `ID_item` int NOT NULL AUTO_INCREMENT,
  `ID_pedido` int NOT NULL,
  `ID_produto` int NOT NULL,
  `Quantidade` int NOT NULL,
  `Preco_Unit` decimal(10,2) NOT NULL,
  `Subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID_item`),
  KEY `fk_itens_pedidos` (`ID_pedido`),
  KEY `fk_itens_produtos` (`ID_produto`),
  CONSTRAINT `fk_itens_pedidos` FOREIGN KEY (`ID_pedido`) REFERENCES `Pedidos` (`id_pedidos`),
  CONSTRAINT `fk_itens_produtos` FOREIGN KEY (`ID_produto`) REFERENCES `Produtos` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Itens_pedidos`
--

LOCK TABLES `Itens_pedidos` WRITE;
/*!40000 ALTER TABLE `Itens_pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Itens_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pedidos`
--

DROP TABLE IF EXISTS `Pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pedidos` (
  `id_pedidos` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `data_pedido` datetime NOT NULL,
  `status_pedido` varchar(30) NOT NULL,
  `valor_subtotal` decimal(10,2) DEFAULT NULL,
  `valor_total` decimal(10,2) DEFAULT NULL,
  `forma_pagamento` varchar(30) DEFAULT NULL,
  `status_pagamento` varchar(30) DEFAULT NULL,
  `observaçao` text,
  PRIMARY KEY (`id_pedidos`),
  KEY `fk_pedidos_login_usuario` (`id_usuario`),
  CONSTRAINT `fk_pedidos_login_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `login_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pedidos`
--

LOCK TABLES `Pedidos` WRITE;
/*!40000 ALTER TABLE `Pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Produtos`
--

DROP TABLE IF EXISTS `Produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Produtos` (
  `id_produto` int NOT NULL AUTO_INCREMENT,
  `id_categoria` int DEFAULT NULL,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  `preco` decimal(3,2) NOT NULL,
  `imagem` varchar(500) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_produto`),
  KEY `fk_produtos_categoria` (`id_categoria`),
  CONSTRAINT `fk_produtos_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `Categorias` (`ID_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Produtos`
--

LOCK TABLES `Produtos` WRITE;
/*!40000 ALTER TABLE `Produtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_adm`
--

DROP TABLE IF EXISTS `login_adm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_adm` (
  `id_adm` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `senha` varchar(255) NOT NULL,
  PRIMARY KEY (`id_adm`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_adm`
--

LOCK TABLES `login_adm` WRITE;
/*!40000 ALTER TABLE `login_adm` DISABLE KEYS */;
INSERT INTO `login_adm` VALUES (1,'cantina.escolaconrado@gmail.com','Cantinacr09$');
/*!40000 ALTER TABLE `login_adm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_usuario`
--

DROP TABLE IF EXISTS `login_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nome_completo` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `senha` varchar(100) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_usuario`
--

LOCK TABLES `login_usuario` WRITE;
/*!40000 ALTER TABLE `login_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-16 11:03:19
