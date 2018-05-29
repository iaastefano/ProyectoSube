-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema proyectosube
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema proyectosube
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `proyectosube` DEFAULT CHARACTER SET latin1 ;
USE `proyectosube` ;

-- -----------------------------------------------------
-- Table `proyectosube`.`lineaTren`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`lineaTren` (
  `idLineaTren` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idLineaTren`),
  UNIQUE INDEX `idLineaTren_UNIQUE` (`idLineaTren` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectosube`.`ramalTren`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`ramalTren` (
  `idRamalTren` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `idLineaTren` INT(11) NOT NULL,
  PRIMARY KEY (`idRamalTren`),
  UNIQUE INDEX `idRamalTren_UNIQUE` (`idRamalTren` ASC),
  INDEX `fk_ramalTren_lineaTren1_idx` (`idLineaTren` ASC),
  CONSTRAINT `fk_lineaTren`
    FOREIGN KEY (`idLineaTren`)
    REFERENCES `proyectosube`.`lineaTren` (`idLineaTren`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectosube`.`estacionTren`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`estacionTren` (
  `idEstacionTren` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEstacionTren`),
  UNIQUE INDEX `idEstacionTren_UNIQUE` (`idEstacionTren` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectosube`.`ramal_tiene_estacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`ramal_tiene_estacion` (
  `idRamalEstacionTren` INT(11) NOT NULL AUTO_INCREMENT,
  `idRamalTren` INT(11) NOT NULL,
  `idEstacionTren` INT(11) NOT NULL,
  `nroEstacion` INT NOT NULL,
  PRIMARY KEY (`idRamalEstacionTren`),
  INDEX `fk_ramalTren_has_estacionTren_ramalTren_idx` (`idRamalTren` ASC),
  INDEX `fk_ramal_tiene_estacion_estacionTren1_idx` (`idEstacionTren` ASC),
  UNIQUE INDEX `idRamalEstacionTren_UNIQUE` (`idRamalEstacionTren` ASC),
  CONSTRAINT `fk_ramalTren_has_estacionTren_ramalTren`
    FOREIGN KEY (`idRamalTren`)
    REFERENCES `proyectosube`.`ramalTren` (`idRamalTren`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ramal_tiene_estacion_estacionTren1`
    FOREIGN KEY (`idEstacionTren`)
    REFERENCES `proyectosube`.`estacionTren` (`idEstacionTren`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectosube`.`tarifaTren`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`tarifaTren` (
  `idTarifaTren` INT(11) NOT NULL AUTO_INCREMENT,
  `cantEstaciones` INT(11) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `precio` FLOAT NOT NULL,
  PRIMARY KEY (`idTarifaTren`),
  UNIQUE INDEX `idTarifaTren_UNIQUE` (`idTarifaTren` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectosube`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `usuario` VARCHAR(45) NOT NULL,
  `contraseña` VARCHAR(45) NOT NULL,
  `dni` BIGINT(16) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE INDEX `idUsuario_UNIQUE` (`idUsuario` ASC),
  UNIQUE INDEX `dni_UNIQUE` (`dni` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectosube`.`tarjeta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`tarjeta` (
  `idTarjeta` INT NOT NULL AUTO_INCREMENT,
  `nroTarjeta` VARCHAR(45) NOT NULL,
  `saldo` FLOAT NOT NULL,
  `activa` BIT(1) NOT NULL,
  `idUsuario` INT(11) NOT NULL,
  PRIMARY KEY (`idTarjeta`),
  INDEX `fk_tarjeta_usuario1_idx` (`idUsuario` ASC),
  UNIQUE INDEX `idTarjeta_UNIQUE` (`idTarjeta` ASC),
  CONSTRAINT `fk_tarjeta_usuario1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `proyectosube`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectosube`.`redSube`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`redSube` (
  `idRedSube` INT(11) NOT NULL,
  `descuento` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRedSube`),
  UNIQUE INDEX `idRedSube_UNIQUE` (`idRedSube` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectosube`.`viaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`viaje` (
  `idViaje` INT NOT NULL AUTO_INCREMENT,
  `fechaHora` DATE NOT NULL,
  `idTarjeta` INT NOT NULL,
  `idRedSube` INT NOT NULL,
  PRIMARY KEY (`idViaje`),
  UNIQUE INDEX `idViaje_UNIQUE` (`idViaje` ASC),
  INDEX `fk_viaje_tarjeta1_idx` (`idTarjeta` ASC),
  INDEX `fk_viaje_redSube1_idx` (`idRedSube` ASC),
  CONSTRAINT `fk_viaje_tarjeta1`
    FOREIGN KEY (`idTarjeta`)
    REFERENCES `proyectosube`.`tarjeta` (`idTarjeta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_viaje_redSube1`
    FOREIGN KEY (`idRedSube`)
    REFERENCES `proyectosube`.`redSube` (`idRedSube`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectosube`.`boletoTren`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`boletoTren` (
  `idBoletoTren` INT(11) NOT NULL AUTO_INCREMENT,
  `idEstacionSubida` INT(11) NOT NULL,
  `idEstacionBajada` INT(11) NULL,
  `idTarifaTren` INT(11) NOT NULL,
  `precioFinal` FLOAT NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `idViaje` INT NOT NULL,
  PRIMARY KEY (`idBoletoTren`),
  INDEX `fk_estacionSubida_idx` (`idEstacionSubida` ASC),
  INDEX `fk_estacionBajada_idx` (`idEstacionBajada` ASC),
  INDEX `fk_boletoTren_viaje1_idx` (`idViaje` ASC),
  INDEX `fk_tarifa_idx` (`idTarifaTren` ASC),
  UNIQUE INDEX `idBoletoTren_UNIQUE` (`idBoletoTren` ASC),
  CONSTRAINT `fk_estacionSubida`
    FOREIGN KEY (`idEstacionSubida`)
    REFERENCES `proyectosube`.`estacionTren` (`idEstacionTren`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_estacionBajada`
    FOREIGN KEY (`idEstacionBajada`)
    REFERENCES `proyectosube`.`estacionTren` (`idEstacionTren`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tarifa`
    FOREIGN KEY (`idTarifaTren`)
    REFERENCES `proyectosube`.`tarifaTren` (`idTarifaTren`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_boletoTren_viaje1`
    FOREIGN KEY (`idViaje`)
    REFERENCES `proyectosube`.`viaje` (`idViaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectosube`.`lineaColectivo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`lineaColectivo` (
  `idLineaColectivo` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idLineaColectivo`),
  UNIQUE INDEX `idRamalColectivo_UNIQUE` (`idLineaColectivo` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectosube`.`tarifaColectivo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`tarifaColectivo` (
  `idTarifaColectivo` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NOT NULL,
  `precio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTarifaColectivo`),
  UNIQUE INDEX `idTarifaColectivo_UNIQUE` (`idTarifaColectivo` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectosube`.`boletoColectivo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`boletoColectivo` (
  `idBoletoColectivo` INT(11) NOT NULL,
  `idLineaColectivo` INT(11) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `precioFinal` FLOAT NOT NULL,
  `idTarifaColectivo` INT(11) NOT NULL,
  `idViaje` INT(11) NOT NULL,
  PRIMARY KEY (`idBoletoColectivo`),
  INDEX `fk_boletoColectivo_lineaColectivo1_idx` (`idLineaColectivo` ASC),
  INDEX `fk_boletoColectivo_tarifaColectivo1_idx` (`idTarifaColectivo` ASC),
  INDEX `fk_boletoColectivo_viaje1_idx` (`idViaje` ASC),
  UNIQUE INDEX `idBoletoColectivo_UNIQUE` (`idBoletoColectivo` ASC),
  CONSTRAINT `fk_boletoColectivo_lineaColectivo1`
    FOREIGN KEY (`idLineaColectivo`)
    REFERENCES `proyectosube`.`lineaColectivo` (`idLineaColectivo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_boletoColectivo_tarifaColectivo1`
    FOREIGN KEY (`idTarifaColectivo`)
    REFERENCES `proyectosube`.`tarifaColectivo` (`idTarifaColectivo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_boletoColectivo_viaje1`
    FOREIGN KEY (`idViaje`)
    REFERENCES `proyectosube`.`viaje` (`idViaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectosube`.`lineaSubte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`lineaSubte` (
  `idLineaSubte` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idLineaSubte`),
  UNIQUE INDEX `idLineaSubte_UNIQUE` (`idLineaSubte` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectosube`.`estacionSubte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`estacionSubte` (
  `idEstacionSubte` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `lineaSubte_idLineaSubte` INT(11) NOT NULL,
  PRIMARY KEY (`idEstacionSubte`),
  INDEX `fk_estacionSubte_lineaSubte1_idx` (`lineaSubte_idLineaSubte` ASC),
  UNIQUE INDEX `idEstacionSubte_UNIQUE` (`idEstacionSubte` ASC),
  CONSTRAINT `fk_estacionSubte_lineaSubte1`
    FOREIGN KEY (`lineaSubte_idLineaSubte`)
    REFERENCES `proyectosube`.`lineaSubte` (`idLineaSubte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectosube`.`tarifaSubte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`tarifaSubte` (
  `idTarifaSubte` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NOT NULL,
  `precio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTarifaSubte`),
  UNIQUE INDEX `idTarifaSubte_UNIQUE` (`idTarifaSubte` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectosube`.`boletoSubte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`boletoSubte` (
  `idBoletoSubte` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NOT NULL,
  `precio` FLOAT NOT NULL,
  `idTarifaSubte` INT NOT NULL,
  `idEstacionSubte` INT NOT NULL,
  `idViaje` INT NOT NULL,
  PRIMARY KEY (`idBoletoSubte`),
  INDEX `fk_boletoSubte_tarifaSubte1_idx` (`idTarifaSubte` ASC),
  INDEX `fk_boletoSubte_estacionSubte1_idx` (`idEstacionSubte` ASC),
  INDEX `fk_boletoSubte_viaje1_idx` (`idViaje` ASC),
  UNIQUE INDEX `idBoletoSubte_UNIQUE` (`idBoletoSubte` ASC),
  CONSTRAINT `fk_boletoSubte_tarifaSubte1`
    FOREIGN KEY (`idTarifaSubte`)
    REFERENCES `proyectosube`.`tarifaSubte` (`idTarifaSubte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_boletoSubte_estacionSubte1`
    FOREIGN KEY (`idEstacionSubte`)
    REFERENCES `proyectosube`.`estacionSubte` (`idEstacionSubte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_boletoSubte_viaje`
    FOREIGN KEY (`idViaje`)
    REFERENCES `proyectosube`.`viaje` (`idViaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectosube`.`beneficio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`beneficio` (
  `idBeneficio` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NOT NULL,
  `valor` FLOAT NOT NULL,
  PRIMARY KEY (`idBeneficio`),
  UNIQUE INDEX `idBeneficio_UNIQUE` (`idBeneficio` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectosube`.`usuario_tiene_beneficio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`usuario_tiene_beneficio` (
  `idUsuario` INT NOT NULL,
  `idBeneficio` INT NOT NULL,
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
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectosube`.`descuento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`descuento` (
  `idDescuento` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NOT NULL,
  `porcentaje` FLOAT NOT NULL,
  PRIMARY KEY (`idDescuento`),
  UNIQUE INDEX `idDescuento_UNIQUE` (`idDescuento` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectosube`.`usuario_tiene_descuento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`usuario_tiene_descuento` (
  `usuario_idUsuario` INT NOT NULL,
  `descuento_idDescuento` INT NOT NULL,
  PRIMARY KEY (`usuario_idUsuario`, `descuento_idDescuento`),
  INDEX `fk_usuario_has_descuento_descuento1_idx` (`descuento_idDescuento` ASC),
  INDEX `fk_usuario_has_descuento_usuario1_idx` (`usuario_idUsuario` ASC),
  CONSTRAINT `fk_usuario_has_descuento_usuario1`
    FOREIGN KEY (`usuario_idUsuario`)
    REFERENCES `proyectosube`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_descuento_descuento1`
    FOREIGN KEY (`descuento_idDescuento`)
    REFERENCES `proyectosube`.`descuento` (`idDescuento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyectosube`.`Movimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectosube`.`Movimiento` (
  `idMovimiento` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  `fechaHora` DATE NULL,
  `medio` VARCHAR(45) NULL,
  `detalle` VARCHAR(45) NULL,
  `valor` VARCHAR(45) NOT NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idMovimiento`),
  UNIQUE INDEX `idMovimiento_UNIQUE` (`idMovimiento` ASC),
  INDEX `fk_Movimiento_usuario1_idx` (`idUsuario` ASC),
  CONSTRAINT `fk_Movimiento_usuario1`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `proyectosube`.`usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
