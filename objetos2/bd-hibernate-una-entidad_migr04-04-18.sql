-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: bd-hibernate-una-entidad_migr04-04-18
-- Source Schemata: bd-hibernate-una-entidad
-- Created: Wed Apr 04 10:55:39 2018
-- Workbench Version: 6.3.4
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------------------------------------------------------
-- Schema bd-hibernate-una-entidad_migr04-04-18
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `bd-hibernate-una-entidad_migr04-04-18` ;
CREATE SCHEMA IF NOT EXISTS `bd-hibernate-una-entidad_migr04-04-18` ;

-- ----------------------------------------------------------------------------
-- Table bd-hibernate-una-entidad_migr04-04-18.cliente
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd-hibernate-una-entidad_migr04-04-18`.`cliente` (
  `idCliente` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `apellido` VARCHAR(45) NOT NULL COMMENT '',
  `nombre` VARCHAR(45) NOT NULL COMMENT '',
  `dni` VARCHAR(45) NOT NULL COMMENT '',
  `fechaDeNacimiento` DATE NULL DEFAULT NULL COMMENT '',
  `baja` BIT(1) NULL DEFAULT b'0' COMMENT '',
  PRIMARY KEY (`idCliente`)  COMMENT '')
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table bd-hibernate-una-entidad_migr04-04-18.contacto
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd-hibernate-una-entidad_migr04-04-18`.`contacto` (
  `idcontacto` INT(11) NOT NULL COMMENT '',
  `email` VARCHAR(25) NULL DEFAULT NULL COMMENT '',
  `movil` VARCHAR(15) NULL DEFAULT NULL COMMENT '',
  `fijo` VARCHAR(15) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`idcontacto`)  COMMENT '',
  CONSTRAINT `fk_cliente`
    FOREIGN KEY (`idcontacto`)
    REFERENCES `bd-hibernate-una-entidad_migr04-04-18`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
SET FOREIGN_KEY_CHECKS = 1;
