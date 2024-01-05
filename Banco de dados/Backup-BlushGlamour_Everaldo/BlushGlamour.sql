-- MySQL Script generated by MySQL Workbench
-- Thu Jan  4 10:28:23 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering


SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `cpf` VARCHAR(11) NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `senha` VARCHAR(50) NOT NULL,
  `dataNascimento` DATE NOT NULL,
  `imagemPerfil` VARCHAR(255) NULL,
  PRIMARY KEY (`cpf`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Categoria` (
  `idcategoria` INT NOT NULL AUTO_INCREMENT,
  `nomeCategoria` VARCHAR(255) NULL,
  `descricaoCategoria` VARCHAR(255) NULL,
  PRIMARY KEY (`idcategoria`),
  UNIQUE INDEX `idcategoria_UNIQUE` (`idcategoria` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Fornecedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Fornecedores` (
  `cnpj` VARCHAR(14) NOT NULL,
  `nomeFornecedor` VARCHAR(255) NOT NULL,
  `EmailFornecedor` VARCHAR(255) NOT NULL,
  `senhaFornecedorl` VARCHAR(50) NOT NULL,
  `telefoneFornecedor` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`cnpj`),
  UNIQUE INDEX `EmailFornecedor_UNIQUE` (`EmailFornecedor` ASC) VISIBLE,
  UNIQUE INDEX `senhaFornecedorl_UNIQUE` (`senhaFornecedorl` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Produtos` (
  `codigoDeBarra` INT NOT NULL,
  `nomeProduto` VARCHAR(300) NOT NULL,
  `preco` DECIMAL(10,2) NOT NULL,
  `quantidade_estoque` INT NOT NULL,
  `descricao` VARCHAR(255) NULL,
  `Categoria_idcategoria` INT NOT NULL,
  `cnpjFornecedor` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`codigoDeBarra`),
  INDEX `fk_Produtos_Categoria1_idx` (`Categoria_idcategoria` ASC) VISIBLE,
  CONSTRAINT `fk_Produtos_Categoria1`
    FOREIGN KEY (`Categoria_idcategoria`)
    REFERENCES `mydb`.`Categoria` (`idcategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cnpjFornecedor`
    FOREIGN KEY (`cnpjFornecedor`)
    REFERENCES `mydb`.`Fornecedores` (`cnpj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EnderecosCliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EnderecosCliente` (
  `idEnderecos` INT NOT NULL AUTO_INCREMENT,
  `rua` VARCHAR(255) NOT NULL,
  `cidade` VARCHAR(255) NOT NULL,
  `cep` VARCHAR(9) NOT NULL,
  `estado` VARCHAR(255) NOT NULL,
  `numResidencia` VARCHAR(10) NOT NULL,
  `Complemento` VARCHAR(255) NULL,
  `Cliente_cpf` VARCHAR(11) NOT NULL,
  `bairro` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idEnderecos`),
  UNIQUE INDEX `Cliente_cpf_UNIQUE` (`Cliente_cpf` ASC) VISIBLE,
  CONSTRAINT `cpfCliente`
    FOREIGN KEY (`Cliente_cpf`)
    REFERENCES `mydb`.`Cliente` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Carrinho`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Carrinho` (
  `carrinhoID` INT NOT NULL AUTO_INCREMENT,
  `Cliente_cpf` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`carrinhoID`),
  INDEX `fk_Carrinho_Cliente1_idx` (`Cliente_cpf` ASC) VISIBLE,
  UNIQUE INDEX `Cliente_cpf_UNIQUE` (`Cliente_cpf` ASC) VISIBLE,
  CONSTRAINT `cliente_cpf`
    FOREIGN KEY (`Cliente_cpf`)
    REFERENCES `mydb`.`Cliente` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vendas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vendas` (
  `vendaID` INT NOT NULL,
  `valorTotal` DECIMAL(10,2) NULL,
  `carrinhoID` INT NOT NULL,
  PRIMARY KEY (`vendaID`),
  UNIQUE INDEX `idVendas_UNIQUE` (`vendaID` ASC) INVISIBLE,
  INDEX `carrinhoID_idx` (`carrinhoID` ASC) VISIBLE,
  CONSTRAINT `carrinhoID`
    FOREIGN KEY (`carrinhoID`)
    REFERENCES `mydb`.`Carrinho` (`carrinhoID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Imagens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Imagens` (
  `idImagens` INT NOT NULL AUTO_INCREMENT,
  `Produtos_codigoDeBarra` INT NOT NULL,
  `imgCard` VARCHAR(255) NULL,
  `imgMaisVendido` VARCHAR(255) NULL,
  `imgProduto` VARCHAR(255) NULL,
  PRIMARY KEY (`idImagens`),
  INDEX `fk_Imagens_Produtos1_idx` (`Produtos_codigoDeBarra` ASC) VISIBLE,
  CONSTRAINT `fk_Imagens_Produtos1`
    FOREIGN KEY (`Produtos_codigoDeBarra`)
    REFERENCES `mydb`.`Produtos` (`codigoDeBarra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EnderecosFornecedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EnderecosFornecedores` (
  `idEnderecos` INT NOT NULL AUTO_INCREMENT,
  `rua` VARCHAR(255) NOT NULL,
  `cidade` VARCHAR(255) NOT NULL,
  `cep` VARCHAR(9) NOT NULL,
  `estado` VARCHAR(255) NOT NULL,
  `numResidencia` VARCHAR(10) NOT NULL,
  `Complemento` VARCHAR(255) NULL,
  `cnpjFornecedores` VARCHAR(14) NOT NULL,
  `bairro` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idEnderecos`),
  UNIQUE INDEX `cnpjFornecedores_UNIQUE` (`cnpjFornecedores` ASC) VISIBLE,
  CONSTRAINT `cnpjFornecedores`
    FOREIGN KEY (`cnpjFornecedores`)
    REFERENCES `mydb`.`Fornecedores` (`cnpj`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Telefone` (
  `idTelefone` INT NOT NULL AUTO_INCREMENT,
  `telefone` VARCHAR(15) NOT NULL,
  `Cliente_cpf` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`idTelefone`),
  INDEX `fk_Telefone_Cliente1_idx` (`Cliente_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_Telefone_Cliente1`
    FOREIGN KEY (`Cliente_cpf`)
    REFERENCES `mydb`.`Cliente` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Carrinho_has_Produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Carrinho_has_Produtos` (
  `Carrinho_carrinhoID` INT NOT NULL,
  `Produtos_codigoDeBarra` INT NOT NULL,
  `quantidade` INT NOT NULL,
  `total` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`Carrinho_carrinhoID`, `Produtos_codigoDeBarra`),
  INDEX `fk_Carrinho_has_Produtos_Produtos1_idx` (`Produtos_codigoDeBarra` ASC) VISIBLE,
  INDEX `fk_Carrinho_has_Produtos_Carrinho1_idx` (`Carrinho_carrinhoID` ASC) VISIBLE,
  CONSTRAINT `fk_Carrinho_has_Produtos_Carrinho1`
    FOREIGN KEY (`Carrinho_carrinhoID`)
    REFERENCES `mydb`.`Carrinho` (`carrinhoID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Carrinho_has_Produtos_Produtos1`
    FOREIGN KEY (`Produtos_codigoDeBarra`)
    REFERENCES `mydb`.`Produtos` (`codigoDeBarra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
