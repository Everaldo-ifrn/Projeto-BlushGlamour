-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.32

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Base','Fundação líquida de alta cobertura, ideal para uniformizar o tom da pele e oferecer um acabamento natural e duradouro.'),(2,'Batom','Produto essencial para realçar e colorir os lábios, disponível em uma variedade de tons e acabamentos, desde matte até gloss.'),(3,'Paleta','Conjunto de sombras compactas ou pigmentos soltos, projetados para criar looks variados e complementar a maquiagem dos olhos.'),(4,'Rimel','Máscara de cílios que alonga, define e dá volume aos cílios, realçando o olhar e proporcionando um efeito dramático ou natural, conforme desejado.'),(5,'Delineador','Produto utilizado para traçar linhas precisas ao redor dos olhos, disponível em formatos líquido, gel ou lápis para criar looks variados, desde sutis até dramáticos.'),(6,'Pincel','Ferramenta essencial para aplicar e esfumar produtos de maquiagem, disponível em diferentes formatos e tamanhos para atender às diversas necessidades de aplicação.');
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
INSERT INTO `cliente` VALUES ('15151515','giovanna','Gi@gmail.com','Gi123','2003-06-09',NULL),('2222222222','joao ','souza.gmail.com','123456','2003-06-09',NULL),('3333333333','joao ','felipe.joao1@escolar.ifrn.edu.br','felipe09','2003-06-09',NULL),('4444444444','joao','italo.gmail.com','italo123','2003-06-09',NULL),('454545454','joao felipe','joaoFelipe@gmail.com','Felipe123','2003-06-09',NULL),('4646466565','jaoo felipe souza','felipesouzaJoao@gmail.com','joao123456','1988-06-09','static/imagens/usuarios/jaoo felipe souza.jpg'),('4949494949','Marcia','marcia@gmail.com','marcia123','1988-06-09','static/imagens/usuarios/Marcia.jpg'),('8888888888','Rual','raul@gmail.com','raul123','2003-06-09','static/imagens/usuarios/Rual.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enderecoscliente`
--

LOCK TABLES `enderecoscliente` WRITE;
/*!40000 ALTER TABLE `enderecoscliente` DISABLE KEYS */;
INSERT INTO `enderecoscliente` VALUES (1,'padre joao batista de albuquerque','Ceará-Mirim','59570-000','RN','12','casa de esquina','3333333333','Nova Ceará-Mirim'),(2,'padre joao batista de albuquerque','Ceará-Mirim','59570-000','RN','12','casa de esquina','4444444444','Nova Ceará-Mirim'),(3,'','','','','','','2222222222',''),(4,'','','','','','','15151515',''),(5,'','','','','','','8888888888',''),(6,'','','','','','','454545454',''),(7,'padre joao batista de albuquerque','Natal','59570-000','RN','12','casa de esquina','4949494949','Nova Ceará-Mirim'),(8,'','','','','','','4646466565','');
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
INSERT INTO `enderecosfornecedores` VALUES (1,'a','a','45645','a','12',NULL,'12345678901234','a');
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
INSERT INTO `fornecedores` VALUES ('12345678901234','Joao','joao@gmail.com','1234','45454545');
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
INSERT INTO `imagens` VALUES (1,17745,'baseBrunaTavares_semFundo.png','baseBrunaTavares_semFundo.png','baseBrunaTavares_semFundo.png'),(2,16645,'BaseBocaRosa01_semFundo.png','BaseBocaRosa01_semFundo.png','BaseBocaRosa01_semFundo.png'),(3,18845,'baseNina01_semFundo.png','baseNina01_semFundo.png','baseNina01_semFundo.png'),(4,19945,'baseMari02_semFundo.png','baseMari02_semFundo.png','baseMari02_semFundo.png'),(5,110105,'DelineadorMari01_semFundo.png','DelineadorMari01_semFundo.png','DelineadorMari01_semFundo.png'),(6,111115,'DelineadorVult01_semFundo.png','DelineadorVult01_semFundo.png','DelineadorVult01_semFundo.png'),(7,112125,'batombrunaTavar.png','batombrunaTavar.png','batombrunaTavar.png'),(8,113135,'BatomMrubyKiss01_semFundo.png','BatomMrubyKiss01_semFundo.png','BatomMrubyKiss01_semFundo.png'),(9,114145,'BatomMerubyr01.png','BatomMerubyr01.png','BatomMerubyr01.png'),(10,115155,'BaseDior02_semFundo.png','BaseDior02_semFundo.png','BaseDior02_semFundo.png');
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
  KEY `fk_Produtos_Categoria1_idx` (`Categoria_idcategoria`),
  KEY `nome_da_chave_estrageira` (`cnpjFornecedor`),
  CONSTRAINT `fk_Produtos_Categoria1` FOREIGN KEY (`Categoria_idcategoria`) REFERENCES `categoria` (`idcategoria`),
  CONSTRAINT `nome_da_chave_estrageira` FOREIGN KEY (`cnpjFornecedor`) REFERENCES `fornecedores` (`cnpj`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (16645,'Base Boca rosa',25.50,100,'Base Boca Rosa é ideal para uma cobertura leve a média.',1,'12345678901234'),(17745,'Base Bruna tavares',50.50,50,'Base Bruna Tavares é uma base de alta cobertura e longa duração.',1,'12345678901234'),(18845,'Base Nina ',80.50,10,'Base Nina oferece um acabamento matte perfeito para peles oleosas.',1,'12345678901234'),(19945,'Base Mari',100.50,70,'Base Mari é reconhecida por sua fórmula hidratante e cobertura natural.',1,'12345678901234'),(110105,'Delineador Mari',50.50,50,'O Delineador Mari possui uma fórmula à prova d\'água e um aplicador preciso para criar looks deslumbrantes.',5,'12345678901234'),(111115,'Delineador Vult',25.50,100,'O Delineador Vult é conhecido por sua durabilidade e pigmentação intensa, garantindo um delineado perfeito.',5,'12345678901234'),(112125,'Batom Bruna Tavares',80.50,10,'O Batom Bruna Tavares é um clássico, conhecido por sua textura cremosa e cores vibrantes que destacam os lábios.',2,'12345678901234'),(113135,'Batom Meruby Kids',100.50,70,'O Batom Meruby Kids é desenvolvido especialmente para crianças, com fórmula suave e cores divertidas.',2,'12345678901234'),(114145,'Batom Merubyr',25.50,100,'O Batom Merubyr é um item essencial para qualquer nécessaire, oferecendo cores versáteis e longa duração.',2,'12345678901234'),(115155,'Base Dior',80.50,10,'A Base Dior é um ícone no mundo da maquiagem, conhecida por sua cobertura impecável e acabamento natural.',1,'12345678901234');
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

-- Dump completed on 2024-01-04 11:24:44
