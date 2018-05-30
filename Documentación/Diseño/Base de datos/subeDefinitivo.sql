-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema proyectosube
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema proyectosube
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `proyectosube` DEFAULT CHARACTER SET latin1 ;
USE `proyectosube` ;

-- -----------------------------------------------------
-- Table `proyectosube`.`beneficio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`beneficio` (
  `idBeneficio` INT(11) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NOT NULL,
  `valor` FLOAT NOT NULL,
  PRIMARY KEY (`idBeneficio`),
  UNIQUE INDEX `idBeneficio_UNIQUE` (`idBeneficio` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `proyectosube`.`lineacolectivo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`lineacolectivo` (
  `idLineaColectivo` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idLineaColectivo`),
  UNIQUE INDEX `idRamalColectivo_UNIQUE` (`idLineaColectivo` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `proyectosube`.`tarifacolectivo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`tarifacolectivo` (
  `idTarifaColectivo` INT(11) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NOT NULL,
  `precio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTarifaColectivo`),
  UNIQUE INDEX `idTarifaColectivo_UNIQUE` (`idTarifaColectivo` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `proyectosube`.`redsube`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`redsube` (
  `idRedSube` INT(11) NOT NULL AUTO_INCREMENT,
  `descuento` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRedSube`),
  UNIQUE INDEX `idRedSube_UNIQUE` (`idRedSube` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `proyectosube`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`usuario` (
  `idUsuario` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `usuario` VARCHAR(45) NOT NULL,
  `contraseña` VARCHAR(45) NOT NULL,
  `dni` BIGINT(16) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE INDEX `idUsuario_UNIQUE` (`idUsuario` ASC),
  UNIQUE INDEX `dni_UNIQUE` (`dni` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `proyectosube`.`tarjeta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`tarjeta` (
  `idTarjeta` INT(11) NOT NULL AUTO_INCREMENT,
  `nroTarjeta` VARCHAR(45) NOT NULL,
  `saldo` FLOAT NOT NULL,
  `activa` BIT(1) NOT NULL,
  `idUsuario` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idTarjeta`),
  UNIQUE INDEX `idTarjeta_UNIQUE` (`idTarjeta` ASC),
  INDEX `fk_tarjeta_usuario1_idx` (`idUsuario` ASC),
  CONSTRAINT `fk_tarjeta_usuario1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `proyectosube`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `proyectosube`.`viaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`viaje` (
  `idViaje` INT(11) NOT NULL AUTO_INCREMENT,
  `fechaHora` DATE NOT NULL,
  `idTarjeta` INT(11) NOT NULL,
  `idRedSube` INT(11) NOT NULL,
  PRIMARY KEY (`idViaje`),
  UNIQUE INDEX `idViaje_UNIQUE` (`idViaje` ASC),
  INDEX `fk_viaje_tarjeta1_idx` (`idTarjeta` ASC),
  INDEX `fk_viaje_redSube1_idx` (`idRedSube` ASC),
  CONSTRAINT `fk_viaje_redSube1`
    FOREIGN KEY (`idRedSube`)
    REFERENCES `proyectosube`.`redsube` (`idRedSube`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_viaje_tarjeta1`
    FOREIGN KEY (`idTarjeta`)
    REFERENCES `proyectosube`.`tarjeta` (`idTarjeta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `proyectosube`.`boletocolectivo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`boletocolectivo` (
  `idBoletoColectivo` INT(11) NOT NULL AUTO_INCREMENT,
  `idLineaColectivo` INT(11) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `precioFinal` FLOAT NOT NULL,
  `idTarifaColectivo` INT(11) NOT NULL,
  `idViaje` INT(11) NOT NULL,
  PRIMARY KEY (`idBoletoColectivo`),
  UNIQUE INDEX `idBoletoColectivo_UNIQUE` (`idBoletoColectivo` ASC),
  INDEX `fk_boletoColectivo_lineaColectivo1_idx` (`idLineaColectivo` ASC),
  INDEX `fk_boletoColectivo_tarifaColectivo1_idx` (`idTarifaColectivo` ASC),
  INDEX `fk_boletoColectivo_viaje1_idx` (`idViaje` ASC),
  CONSTRAINT `fk_boletoColectivo_lineaColectivo1`
    FOREIGN KEY (`idLineaColectivo`)
    REFERENCES `proyectosube`.`lineacolectivo` (`idLineaColectivo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_boletoColectivo_tarifaColectivo1`
    FOREIGN KEY (`idTarifaColectivo`)
    REFERENCES `proyectosube`.`tarifacolectivo` (`idTarifaColectivo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_boletoColectivo_viaje1`
    FOREIGN KEY (`idViaje`)
    REFERENCES `proyectosube`.`viaje` (`idViaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `proyectosube`.`lineasubte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`lineasubte` (
  `idLineaSubte` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idLineaSubte`),
  UNIQUE INDEX `idLineaSubte_UNIQUE` (`idLineaSubte` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `proyectosube`.`estacionsubte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`estacionsubte` (
  `idEstacionSubte` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `lineaSubte_idLineaSubte` INT(11) NOT NULL,
  PRIMARY KEY (`idEstacionSubte`),
  UNIQUE INDEX `idEstacionSubte_UNIQUE` (`idEstacionSubte` ASC),
  INDEX `fk_estacionSubte_lineaSubte1_idx` (`lineaSubte_idLineaSubte` ASC),
  CONSTRAINT `fk_estacionSubte_lineaSubte1`
    FOREIGN KEY (`lineaSubte_idLineaSubte`)
    REFERENCES `proyectosube`.`lineasubte` (`idLineaSubte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `proyectosube`.`tarifasubte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`tarifasubte` (
  `idTarifaSubte` INT(11) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NOT NULL,
  `precio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTarifaSubte`),
  UNIQUE INDEX `idTarifaSubte_UNIQUE` (`idTarifaSubte` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `proyectosube`.`boletosubte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`boletosubte` (
  `idBoletoSubte` INT(11) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NOT NULL,
  `precio` FLOAT NOT NULL,
  `idTarifaSubte` INT(11) NOT NULL,
  `idEstacionSubte` INT(11) NOT NULL,
  `idViaje` INT(11) NOT NULL,
  PRIMARY KEY (`idBoletoSubte`),
  UNIQUE INDEX `idBoletoSubte_UNIQUE` (`idBoletoSubte` ASC),
  INDEX `fk_boletoSubte_tarifaSubte1_idx` (`idTarifaSubte` ASC),
  INDEX `fk_boletoSubte_estacionSubte1_idx` (`idEstacionSubte` ASC),
  INDEX `fk_boletoSubte_viaje1_idx` (`idViaje` ASC),
  CONSTRAINT `fk_boletoSubte_estacionSubte1`
    FOREIGN KEY (`idEstacionSubte`)
    REFERENCES `proyectosube`.`estacionsubte` (`idEstacionSubte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_boletoSubte_tarifaSubte1`
    FOREIGN KEY (`idTarifaSubte`)
    REFERENCES `proyectosube`.`tarifasubte` (`idTarifaSubte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_boletoSubte_viaje`
    FOREIGN KEY (`idViaje`)
    REFERENCES `proyectosube`.`viaje` (`idViaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `proyectosube`.`estaciontren`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`estaciontren` (
  `idEstacionTren` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEstacionTren`),
  UNIQUE INDEX `idEstacionTren_UNIQUE` (`idEstacionTren` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `proyectosube`.`tarifatren`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`tarifatren` (
  `idTarifaTren` INT(11) NOT NULL AUTO_INCREMENT,
  `cantEstaciones` INT(11) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `precio` FLOAT NOT NULL,
  PRIMARY KEY (`idTarifaTren`),
  UNIQUE INDEX `idTarifaTren_UNIQUE` (`idTarifaTren` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `proyectosube`.`boletotren`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`boletotren` (
  `idBoletoTren` INT(11) NOT NULL AUTO_INCREMENT,
  `idEstacionSubida` INT(11) NOT NULL,
  `idEstacionBajada` INT(11) NULL DEFAULT NULL,
  `idTarifaTren` INT(11) NOT NULL,
  `precioFinal` FLOAT NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `idViaje` INT(11) NOT NULL,
  PRIMARY KEY (`idBoletoTren`),
  UNIQUE INDEX `idBoletoTren_UNIQUE` (`idBoletoTren` ASC),
  INDEX `fk_estacionSubida_idx` (`idEstacionSubida` ASC),
  INDEX `fk_estacionBajada_idx` (`idEstacionBajada` ASC),
  INDEX `fk_boletoTren_viaje1_idx` (`idViaje` ASC),
  INDEX `fk_tarifa_idx` (`idTarifaTren` ASC),
  CONSTRAINT `fk_boletoTren_viaje1`
    FOREIGN KEY (`idViaje`)
    REFERENCES `proyectosube`.`viaje` (`idViaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_estacionBajada`
    FOREIGN KEY (`idEstacionBajada`)
    REFERENCES `proyectosube`.`estaciontren` (`idEstacionTren`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_estacionSubida`
    FOREIGN KEY (`idEstacionSubida`)
    REFERENCES `proyectosube`.`estaciontren` (`idEstacionTren`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tarifa`
    FOREIGN KEY (`idTarifaTren`)
    REFERENCES `proyectosube`.`tarifatren` (`idTarifaTren`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `proyectosube`.`descuento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`descuento` (
  `idDescuento` INT(11) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NOT NULL,
  `porcentaje` FLOAT NOT NULL,
  PRIMARY KEY (`idDescuento`),
  UNIQUE INDEX `idDescuento_UNIQUE` (`idDescuento` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `proyectosube`.`lineatren`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`lineatren` (
  `idLineaTren` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idLineaTren`),
  UNIQUE INDEX `idLineaTren_UNIQUE` (`idLineaTren` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `proyectosube`.`movimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`movimiento` (
  `idMovimiento` INT(11) NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  `fechaHora` DATE NULL DEFAULT NULL,
  `medio` VARCHAR(45) NULL DEFAULT NULL,
  `detalle` VARCHAR(45) NULL DEFAULT NULL,
  `valor` VARCHAR(45) NOT NULL,
  `idUsuario` INT(11) NOT NULL,
  PRIMARY KEY (`idMovimiento`),
  UNIQUE INDEX `idMovimiento_UNIQUE` (`idMovimiento` ASC),
  INDEX `fk_Movimiento_usuario1_idx` (`idUsuario` ASC),
  CONSTRAINT `fk_Movimiento_usuario1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `proyectosube`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `proyectosube`.`ramaltren`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`ramaltren` (
  `idRamalTren` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `idLineaTren` INT(11) NOT NULL,
  PRIMARY KEY (`idRamalTren`),
  UNIQUE INDEX `idRamalTren_UNIQUE` (`idRamalTren` ASC),
  INDEX `fk_ramalTren_lineaTren1_idx` (`idLineaTren` ASC),
  CONSTRAINT `fk_lineaTren`
    FOREIGN KEY (`idLineaTren`)
    REFERENCES `proyectosube`.`lineatren` (`idLineaTren`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `proyectosube`.`ramal_tiene_estacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`ramal_tiene_estacion` (
  `idRamalEstacionTren` INT(11) NOT NULL AUTO_INCREMENT,
  `idRamalTren` INT(11) NOT NULL,
  `idEstacionTren` INT(11) NOT NULL,
  `nroEstacion` INT(11) NOT NULL,
  PRIMARY KEY (`idRamalEstacionTren`),
  UNIQUE INDEX `idRamalEstacionTren_UNIQUE` (`idRamalEstacionTren` ASC),
  INDEX `fk_ramalTren_has_estacionTren_ramalTren_idx` (`idRamalTren` ASC),
  INDEX `fk_ramal_tiene_estacion_estacionTren1_idx` (`idEstacionTren` ASC),
  CONSTRAINT `fk_ramalTren_has_estacionTren_ramalTren`
    FOREIGN KEY (`idRamalTren`)
    REFERENCES `proyectosube`.`ramaltren` (`idRamalTren`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ramal_tiene_estacion_estacionTren1`
    FOREIGN KEY (`idEstacionTren`)
    REFERENCES `proyectosube`.`estaciontren` (`idEstacionTren`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `proyectosube`.`usuario_tiene_beneficio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`usuario_tiene_beneficio` (
  `idUsuario` INT(11) NOT NULL,
  `idBeneficio` INT(11) NOT NULL,
  `ultimaFechaCobro` DATE NOT NULL,
  PRIMARY KEY (`idUsuario`, `idBeneficio`),
  INDEX `fk_usuario_has_beneficio_beneficio1_idx` (`idBeneficio` ASC),
  INDEX `fk_usuario_tiene_beneficio_usuario1_idx` (`idUsuario` ASC),
  CONSTRAINT `fk_usuario_has_beneficio_beneficio1`
    FOREIGN KEY (`idBeneficio`)
    REFERENCES `proyectosube`.`beneficio` (`idBeneficio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_tiene_beneficio_usuario1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `proyectosube`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `proyectosube`.`usuario_tiene_descuento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`usuario_tiene_descuento` (
  `usuario_idUsuario` INT(11) NOT NULL,
  `descuento_idDescuento` INT(11) NOT NULL,
  PRIMARY KEY (`usuario_idUsuario`, `descuento_idDescuento`),
  INDEX `fk_usuario_has_descuento_descuento1_idx` (`descuento_idDescuento` ASC),
  INDEX `fk_usuario_has_descuento_usuario1_idx` (`usuario_idUsuario` ASC),
  CONSTRAINT `fk_usuario_has_descuento_descuento1`
    FOREIGN KEY (`descuento_idDescuento`)
    REFERENCES `proyectosube`.`descuento` (`idDescuento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_descuento_usuario1`
    FOREIGN KEY (`usuario_idUsuario`)
    REFERENCES `proyectosube`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
