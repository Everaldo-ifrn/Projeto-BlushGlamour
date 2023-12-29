CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `carrinho`
--

DROP TABLE IF EXISTS `carrinho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrinho` (
  `carrinhoID` int NOT NULL,
  `Cliente_cpf` varchar(11) NOT NULL,
  PRIMARY KEY (`carrinhoID`),
  UNIQUE KEY `Cliente_cpf_UNIQUE` (`Cliente_cpf`),
  KEY `fk_Carrinho_Cliente1_idx` (`Cliente_cpf`),
  CONSTRAINT `cliente_cpf` FOREIGN KEY (`Cliente_cpf`) REFERENCES `cliente` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrinho`
--

LOCK TABLES `carrinho` WRITE;
/*!40000 ALTER TABLE `carrinho` DISABLE KEYS */;
INSERT INTO `carrinho` VALUES (1,'12345678901');
/*!40000 ALTER TABLE `carrinho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrinho_has_produtos`
--

DROP TABLE IF EXISTS `carrinho_has_produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrinho_has_produtos` (
  `Carrinho_carrinhoID` int NOT NULL,
  `Produtos_codigoDeBarra` int NOT NULL,
  `quantidade` int NOT NULL,
  `total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Carrinho_carrinhoID`,`Produtos_codigoDeBarra`),
  KEY `fk_Carrinho_has_Produtos_Produtos1_idx` (`Produtos_codigoDeBarra`),
  KEY `fk_Carrinho_has_Produtos_Carrinho1_idx` (`Carrinho_carrinhoID`),
  CONSTRAINT `fk_Carrinho_has_Produtos_Carrinho1` FOREIGN KEY (`Carrinho_carrinhoID`) REFERENCES `carrinho` (`carrinhoID`),
  CONSTRAINT `fk_Carrinho_has_Produtos_Produtos1` FOREIGN KEY (`Produtos_codigoDeBarra`) REFERENCES `produtos` (`codigoDeBarra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrinho_has_produtos`
--

LOCK TABLES `carrinho_has_produtos` WRITE;
/*!40000 ALTER TABLE `carrinho_has_produtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrinho_has_produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `idcategoria` int NOT NULL AUTO_INCREMENT,
  `nomeCategoria` varchar(255) DEFAULT NULL,
  `descricaoCategoria` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idcategoria`),
  UNIQUE KEY `idcategoria_UNIQUE` (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Base','Produtos para maquiagem dos olhos'),(2,'Batom','Produtos para os lábios'),(3,'Delineado','Produtod para os cílios');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `cpf` varchar(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `dataNascimento` date NOT NULL,
  `imagemPerfil` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cpf`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('12345678901','Maria S.ilva','maria@email.com','senha123','1990-05-15','perfil.jpg');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enderecoscliente`
--

DROP TABLE IF EXISTS `enderecoscliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enderecoscliente` (
  `idEnderecos` int NOT NULL AUTO_INCREMENT,
  `rua` varchar(255) NOT NULL,
  `cidade` varchar(255) NOT NULL,
  `cep` varchar(9) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `numResidencia` varchar(10) NOT NULL,
  `Complemento` varchar(255) DEFAULT NULL,
  `Cliente_cpf` varchar(11) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  PRIMARY KEY (`idEnderecos`),
  UNIQUE KEY `Cliente_cpf_UNIQUE` (`Cliente_cpf`),
  CONSTRAINT `cpfCliente` FOREIGN KEY (`Cliente_cpf`) REFERENCES `cliente` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enderecoscliente`
--

LOCK TABLES `enderecoscliente` WRITE;
/*!40000 ALTER TABLE `enderecoscliente` DISABLE KEYS */;
INSERT INTO `enderecoscliente` VALUES (1,'Rua das Flores','São Paulo','12345-678','SP','100','Apto 101','12345678901','Centro');
/*!40000 ALTER TABLE `enderecoscliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enderecosfornecedores`
--

DROP TABLE IF EXISTS `enderecosfornecedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enderecosfornecedores` (
  `idEnderecos` int NOT NULL AUTO_INCREMENT,
  `rua` varchar(255) NOT NULL,
  `cidade` varchar(255) NOT NULL,
  `cep` varchar(9) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `numResidencia` varchar(10) NOT NULL,
  `Complemento` varchar(255) DEFAULT NULL,
  `cnpjFornecedores` varchar(14) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  PRIMARY KEY (`idEnderecos`),
  UNIQUE KEY `cnpjFornecedores_UNIQUE` (`cnpjFornecedores`),
  CONSTRAINT `cnpjFornecedores` FOREIGN KEY (`cnpjFornecedores`) REFERENCES `fornecedores` (`cnpj`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enderecosfornecedores`
--

LOCK TABLES `enderecosfornecedores` WRITE;
/*!40000 ALTER TABLE `enderecosfornecedores` DISABLE KEYS */;
INSERT INTO `enderecosfornecedores` VALUES (1,'Av. Principal','Rio de Janeiro','54321-098','RJ','200',NULL,'12345678901234','Centro');
/*!40000 ALTER TABLE `enderecosfornecedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedores`
--

DROP TABLE IF EXISTS `fornecedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedores` (
  `cnpj` varchar(14) NOT NULL,
  `nomeFornecedor` varchar(255) NOT NULL,
  `EmailFornecedor` varchar(255) NOT NULL,
  `senhaFornecedorl` varchar(50) NOT NULL,
  `telefoneFornecedor` varchar(15) NOT NULL,
  PRIMARY KEY (`cnpj`),
  UNIQUE KEY `EmailFornecedor_UNIQUE` (`EmailFornecedor`),
  UNIQUE KEY `senhaFornecedorl_UNIQUE` (`senhaFornecedorl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedores`
--

LOCK TABLES `fornecedores` WRITE;
/*!40000 ALTER TABLE `fornecedores` DISABLE KEYS */;
INSERT INTO `fornecedores` VALUES ('11223344556650','Fornecedor Batom','fornecedor4@xyz.com','forn222','982222233'),('11223344556677','Fornecedor Batom','fornecedor2@xyz.com','forn321','982222222'),('12345678901234','Fornecedor Base','fornecedor1@xyz.com','forn123','981111111'),('12345678901240','Fornecedor Batom','fornecedor3@xyz.com','forn333','982222244'),('43210987654321','Fornecedor Delineado','fornecedor5@xyz.com','forn444','983333333');
/*!40000 ALTER TABLE `fornecedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagens`
--

DROP TABLE IF EXISTS `imagens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagens` (
  `idImagens` int NOT NULL,
  `Produtos_codigoDeBarra` int NOT NULL,
  `imgCard` varchar(255) DEFAULT NULL,
  `imgMaisVendido` varchar(255) DEFAULT NULL,
  `imgProduto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idImagens`),
  KEY `fk_Imagens_Produtos1_idx` (`Produtos_codigoDeBarra`),
  CONSTRAINT `fk_Imagens_Produtos1` FOREIGN KEY (`Produtos_codigoDeBarra`) REFERENCES `produtos` (`codigoDeBarra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagens`
--

LOCK TABLES `imagens` WRITE;
/*!40000 ALTER TABLE `imagens` DISABLE KEYS */;
INSERT INTO `imagens` VALUES (1,11111,NULL,'imagens/produtos/Bases/BaseBocaRosa01.png',NULL),(2,22222,NULL,'imagens/produtos/Batons/BatomBrunaTavares03_semFundo.png',NULL),(3,33333,NULL,'imagens/produtos/Delineadores/DelineadorMari01_semFundo.png',NULL),(4,44444,NULL,'imagens/produtos/Bases/baseMari02_semFundo.png',NULL),(5,55555,NULL,'imagens/produtos/Batons/BatomMerubyr01_semFundo.png',NULL);
/*!40000 ALTER TABLE `imagens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `codigoDeBarra` int NOT NULL,
  `nomeProduto` varchar(300) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `quantidade_estoque` int NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `Categoria_idcategoria` int NOT NULL,
  `cnpjFornecedor` varchar(14) NOT NULL,
  PRIMARY KEY (`codigoDeBarra`),
  UNIQUE KEY `cnpjFornecedor_UNIQUE` (`cnpjFornecedor`),
  KEY `fk_Produtos_Categoria1_idx` (`Categoria_idcategoria`),
  CONSTRAINT `cnpjFornecedor` FOREIGN KEY (`cnpjFornecedor`) REFERENCES `fornecedores` (`cnpj`),
  CONSTRAINT `fk_Produtos_Categoria1` FOREIGN KEY (`Categoria_idcategoria`) REFERENCES `categoria` (`idcategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (11111,'Base Boca Rosa',68.00,100,'Boca rosa By Payot Mate 03 FRancisca, 30 ml',1,'12345678901234'),(22222,'Batom Bruna Tavares',39.90,100,'Batom Líquido Bruna Matte - Bt, Bruna Tavares',2,'11223344556677'),(33333,'Delineado Mari Maria',47.50,100,'Delineador Líquido Spot, Mari Maria',3,'43210987654321'),(44444,'Base Mari Maria',29.90,100,'Base Aveludada e Uniforme, Mari Maria',1,'12345678901240'),(55555,'Batom Ruby Rose',28.80,100,'Batom liquido matte melu',2,'11223344556650');
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefone`
--

DROP TABLE IF EXISTS `telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefone` (
  `idTelefone` int NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `Cliente_cpf` varchar(11) NOT NULL,
  PRIMARY KEY (`idTelefone`),
  KEY `fk_Telefone_Cliente1_idx` (`Cliente_cpf`),
  CONSTRAINT `fk_Telefone_Cliente1` FOREIGN KEY (`Cliente_cpf`) REFERENCES `cliente` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefone`
--

LOCK TABLES `telefone` WRITE;
/*!40000 ALTER TABLE `telefone` DISABLE KEYS */;
INSERT INTO `telefone` VALUES (1,'987654321','12345678901');
/*!40000 ALTER TABLE `telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendas`
--

DROP TABLE IF EXISTS `vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendas` (
  `vendaID` int NOT NULL,
  `valorTotal` decimal(10,2) DEFAULT NULL,
  `carrinhoID` int NOT NULL,
  PRIMARY KEY (`vendaID`),
  UNIQUE KEY `idVendas_UNIQUE` (`vendaID`) /*!80000 INVISIBLE */,
  KEY `carrinhoID_idx` (`carrinhoID`),
  CONSTRAINT `carrinhoID` FOREIGN KEY (`carrinhoID`) REFERENCES `carrinho` (`carrinhoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas`
--

LOCK TABLES `vendas` WRITE;
/*!40000 ALTER TABLE `vendas` DISABLE KEYS */;
INSERT INTO `vendas` VALUES (1,50.00,1);
/*!40000 ALTER TABLE `vendas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-29 11:25:15
