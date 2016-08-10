SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Fornecedores`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Fornecedores` (
  `CODFORNECEDOR` INT NOT NULL ,
  `NOMEDAEMPRESA` VARCHAR(45) NOT NULL ,
  `CPFRESPONSAVEL` INT NOT NULL ,
  `ENDFORNECEDOR` VARCHAR(45) NOT NULL ,
  `CIDADEFORNECEDOR` VARCHAR(45) NOT NULL ,
  `CEPFORNECEDOR` INT NOT NULL ,
  `ESTADOFORNECEDOR` VARCHAR(45) NOT NULL ,
  `TELEFONEFORNECEDOR` INT NOT NULL ,
  PRIMARY KEY (`CODFORNECEDOR`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Categorias`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Categorias` (
  `CODIGOCATEGORIA` INT NOT NULL ,
  `NOMECATEGORIA` VARCHAR(45) NOT NULL ,
  `DESCRIÇAOCATEGORIA` VARCHAR(70) NULL ,
  PRIMARY KEY (`CODIGOCATEGORIA`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Produtos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Produtos` (
  `CODIGODOPRODUTO` INT NOT NULL ,
  `NOMEDOPRODUTO` VARCHAR(45) NOT NULL ,
  `QTDPORUNIDADE` INT NOT NULL ,
  `PREÇOUNITARIO` VARCHAR(10) NOT NULL ,
  `UNIDADESEMESTOQUE` INT NOT NULL ,
  `UNIDADESPERDIDAS` INT NOT NULL ,
  PRIMARY KEY (`CODIGODOPRODUTO`) ,
  CONSTRAINT `CODIGOFORNECEDOR`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Fornecedores` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CODIGOCATEGORIA`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Categorias` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `CODIGODOCLIENTE` INT NOT NULL ,
  `NOMEMEPRESA` VARCHAR(45) NOT NULL ,
  `ENDCLIENTE` VARCHAR(70) NOT NULL ,
  `CIDADECLIENTE` VARCHAR(45) NOT NULL ,
  `CEPCLIENTE` VARCHAR(45) NOT NULL ,
  `ESTADOCLIENTE` VARCHAR(45) NOT NULL ,
  `TELEFONECLIENTE` VARCHAR(45) NOT NULL ,
  `NOMECLIENTE` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`CODIGODOCLIENTE`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Funcionarios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Funcionarios` (
  `CODIGODOFUNCIONARIO` INT NOT NULL ,
  `NOMEFUNC` VARCHAR(60) NOT NULL ,
  `CARGO` VARCHAR(30) NOT NULL ,
  `DATANASC` VARCHAR(8) NOT NULL ,
  `DATACONTRATACAO` VARCHAR(8) NOT NULL ,
  `ENDERECOFUNC` VARCHAR(90) NOT NULL ,
  PRIMARY KEY (`CODIGODOFUNCIONARIO`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Transportadores`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Transportadores` (
  `CODIGOTRANSPORTADORA` INT NOT NULL ,
  `NOMETRANSPORTADORA` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`CODIGOTRANSPORTADORA`) )
DEFAULT CHARACTER SET = tis620;


-- -----------------------------------------------------
-- Table `mydb`.`Pedidos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Pedidos` (
  `IDPEDIDO` INT NOT NULL ,
  `DATADOPEDIDO` VARCHAR(8) NULL ,
  `DATAENTREGA` VARCHAR(8) NULL ,
  `DATAENVIO` VARCHAR(8) NULL ,
  `Transportadores_CODIGOTRANSPORTADORA` INT NOT NULL ,
  PRIMARY KEY (`IDPEDIDO`, `Transportadores_CODIGOTRANSPORTADORA`) ,
  INDEX `fk_Pedidos_Transportadores1_idx` (`Transportadores_CODIGOTRANSPORTADORA` ASC) ,
  CONSTRAINT `CODIGODOCLIENTE`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Cliente` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CODIGODOFUNCIONARIO`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Funcionarios` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedidos_Transportadores1`
    FOREIGN KEY (`Transportadores_CODIGOTRANSPORTADORA` )
    REFERENCES `mydb`.`Transportadores` (`CODIGOTRANSPORTADORA` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DetalhesDoProduto`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`DetalhesDoProduto` (
  `QUANTIDADE` INT NOT NULL ,
  CONSTRAINT `CODIGODOPRODUTO`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Produtos` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PRECOUNITARIO`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Produtos` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `IDPEDIDO`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Pedidos` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `mydb` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
