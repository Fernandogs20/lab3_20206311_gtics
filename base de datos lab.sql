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
-- Table `mydb`.`estadio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`estadio` ;

CREATE TABLE IF NOT EXISTS `mydb`.`estadio` (
  `idestadio` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `provincia` VARCHAR(45) NOT NULL,
  `club` VARCHAR(45) NULL,
  PRIMARY KEY (`idestadio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`seleccion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`seleccion` ;

CREATE TABLE IF NOT EXISTS `mydb`.`seleccion` (
  `idseleccion` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `tecnico` VARCHAR(45) NOT NULL,
  `estadio_idestadio` INT NOT NULL,
  PRIMARY KEY (`idseleccion`),
  INDEX `fk_seleccion_estadio1_idx` (`estadio_idestadio` ASC) VISIBLE,
  CONSTRAINT `fk_seleccion_estadio1`
    FOREIGN KEY (`estadio_idestadio`)
    REFERENCES `mydb`.`estadio` (`idestadio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`jugador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`jugador` ;

CREATE TABLE IF NOT EXISTS `mydb`.`jugador` (
  `idjugador` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `edad` INT NOT NULL,
  `posicion` VARCHAR(45) NOT NULL,
  `club` VARCHAR(45) NOT NULL,
  `seleccion_idseleccion` INT NOT NULL,
  PRIMARY KEY (`idjugador`),
  INDEX `fk_jugador_seleccion1_idx` (`seleccion_idseleccion` ASC) VISIBLE,
  CONSTRAINT `fk_jugador_seleccion1`
    FOREIGN KEY (`seleccion_idseleccion`)
    REFERENCES `mydb`.`seleccion` (`idseleccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`arbitro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`arbitro` ;

CREATE TABLE IF NOT EXISTS `mydb`.`arbitro` (
  `idarbitro` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idarbitro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`partido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`partido` ;

CREATE TABLE IF NOT EXISTS `mydb`.`partido` (
  `idpartido` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `numeroJornada` INT NOT NULL,
  `arbitro_idarbitro` INT NOT NULL,
  `seleccion_idseleccion` INT NOT NULL,
  `seleccion_idseleccion1` INT NOT NULL,
  PRIMARY KEY (`idpartido`),
  INDEX `fk_partido_arbitro_idx` (`arbitro_idarbitro` ASC) VISIBLE,
  INDEX `fk_partido_seleccion1_idx` (`seleccion_idseleccion` ASC) VISIBLE,
  INDEX `fk_partido_seleccion2_idx` (`seleccion_idseleccion1` ASC) VISIBLE,
  CONSTRAINT `fk_partido_arbitro`
    FOREIGN KEY (`arbitro_idarbitro`)
    REFERENCES `mydb`.`arbitro` (`idarbitro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_partido_seleccion1`
    FOREIGN KEY (`seleccion_idseleccion`)
    REFERENCES `mydb`.`seleccion` (`idseleccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_partido_seleccion2`
    FOREIGN KEY (`seleccion_idseleccion1`)
    REFERENCES `mydb`.`seleccion` (`idseleccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
