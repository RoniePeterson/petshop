
-- -----------------------------------------------------
-- Schema petshop_db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `petshop_db`;
-- -----------------------------------------------------
-- Schema petshop_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `petshop_db` DEFAULT CHARACTER SET utf8 ;
USE `petshop_db` ;

-- -----------------------------------------------------
-- Table `petshop_db`.`Tutores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petshop_db`.`Tutores` (
  `TutorID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `TutorNome` VARCHAR(80) NOT NULL,
  `TutorEmail` VARCHAR(100) NOT NULL,
  `TutorPassword` VARCHAR(50) NOT NULL,
  `TutorTelefone` VARCHAR(20) NULL,
  PRIMARY KEY (`TutorID`),
  UNIQUE INDEX `email_UNIQUE` (`TutorEmail` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `petshop_db`.`Especies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petshop_db`.`Especies` (
  `EspecieID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `EspecieNome` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`EspecieID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `petshop_db`.`Racas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petshop_db`.`Racas` (
  `RacaID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `RacaNome` VARCHAR(50) NOT NULL,
  `EspecieID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`RacaID`),
  INDEX `fk_Racas_Especies1_idx` (`EspecieID` ASC) ,
  CONSTRAINT `fk_Racas_Especies1`
    FOREIGN KEY (`EspecieID`)
    REFERENCES `petshop_db`.`Especies` (`EspecieID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `petshop_db`.`Pets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petshop_db`.`Pets` (
  `PetID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `PetNome` VARCHAR(80) NOT NULL,
  `PetSexo` CHAR(1) NOT NULL DEFAULT 'M',
  `PetPeso` FLOAT NOT NULL,
  `PetDataNascimento` DATE NOT NULL,
  `PetFoto` VARCHAR(255) NULL,
  `TutorID` INT UNSIGNED NOT NULL,
  `RacaID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`PetID`),
  INDEX `fk_Pets_Tutores1_idx` (`TutorID` ASC) ,
  INDEX `fk_Pets_Racas1_idx` (`RacaID` ASC) ,
  CONSTRAINT `fk_Pets_Tutores1`
    FOREIGN KEY (`TutorID`)
    REFERENCES `petshop_db`.`Tutores` (`TutorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pets_Racas1`
    FOREIGN KEY (`RacaID`)
    REFERENCES `petshop_db`.`Racas` (`RacaID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `petshop_db`.`Categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petshop_db`.`Categorias` (
  `CategoriaID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `CategoriaNome` VARCHAR(100) NOT NULL,
  `CategoriaStatus` ENUM('ATIVO', 'INATIVO') NOT NULL DEFAULT 'ATIVO',
  PRIMARY KEY (`CategoriaID`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `petshop_db`.`Servicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petshop_db`.`Servicos` (
  `ServicoID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ServicoNome` VARCHAR(100) NOT NULL,
  `ServicoDescricao` VARCHAR(255) NULL,
  `ServicoPreco` DOUBLE NOT NULL DEFAULT 0,
  `ServicoStatus` ENUM('ATIVO', 'INATIVO') NOT NULL DEFAULT 'ATIVO',
  `CategoriaID` INT UNSIGNED,
  PRIMARY KEY (`ServicoID`),
  CONSTRAINT `fk_Categorias_Servicos`
    FOREIGN KEY (`CategoriaID`)
    REFERENCES `petshop_db`.`Categorias` (`CategoriaID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION) ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `petshop_db`.`Funcionarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petshop_db`.`Funcionarios` (
  `FuncionarioID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `FuncionarioNome` VARCHAR(80) NOT NULL,
  `FuncionarioEmail` VARCHAR(100) NOT NULL,
  `FuncionarioPassword` VARCHAR(50) NOT NULL,
  `FuncionarioTelefone` VARCHAR(20) NULL, 
  `FuncionarioTipo` ENUM('ADMINISTRADOR', 'FUNCIONARIO') NOT NULL DEFAULT 'FUNCIONARIO',
  `FuncionarioStatus` ENUM('ATIVO', 'INATIVO') NOT NULL DEFAULT 'ATIVO',
  PRIMARY KEY (`FuncionarioID`),
  UNIQUE INDEX `email_UNIQUE` (`FuncionarioEmail` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `petshop_db`.`OrdemServicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petshop_db`.`OrdemServicos` (
  `OrdemServicoID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `OrdemServicoData` DATE NOT NULL,
  `OrdemServicoNumero` VARCHAR(10) NOT NULL,
  `OrdemServicoStatus` ENUM('EM ANDAMENTO', 'CONCLUIDA', 'CANCELADA') NOT NULL,
  `OrdemServicoObservacao` VARCHAR(255) NULL,
  `PetID` INT UNSIGNED NOT NULL,
  `FuncionarioID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`OrdemServicoID`),
  INDEX `fk_OrdemServicos_Pets1_idx` (`PetID` ASC) ,
  INDEX `fk_OrdemServicos_Funcionarios1_idx` (`FuncionarioID` ASC) ,
  CONSTRAINT `fk_OrdemServicos_Pets1`
    FOREIGN KEY (`PetID`)
    REFERENCES `petshop_db`.`Pets` (`PetID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdemServicos_Funcionarios1`
    FOREIGN KEY (`FuncionarioID`)
    REFERENCES `petshop_db`.`Funcionarios` (`FuncionarioID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `petshop_db`.`ItensOrdemServicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `petshop_db`.`OrdemServicoItens` (
  `OrdemServicoItemID` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `OrdemServicoItemQuantidade` INT NOT NULL DEFAULT 1,
  `OrdemServicoItemValor` DOUBLE NOT NULL DEFAULT 0.0,
  `OrdemServicoID` INT UNSIGNED NOT NULL,
  `ServicoID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`OrdemServicoItemID`),
  CONSTRAINT `fk_OrdemServicoItem1`
    FOREIGN KEY (`OrdemServicoID`)
    REFERENCES `petshop_db`.`OrdemServicos` (`OrdemServicoID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Servico1`
    FOREIGN KEY (`ServicoID`)
    REFERENCES `petshop_db`.`Servicos` (`ServicoID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
