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
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `GiroComercial` VARCHAR(80) NULL,
  `Nombre` VARCHAR(80) NULL,
  `RFC` VARCHAR(13) NULL,
  `Telefono` VARCHAR(10) NULL,
  `Correo` VARCHAR(80) NULL,
  `URL` VARCHAR(100) NULL,
  `Tamano` CHAR(1) NULL,
  `NombreDirector` VARCHAR(80) NULL,
  `Ambito` VARCHAR(80) NULL,
  `FechaAlta` DATE NULL,
  `StatusCliente` TINYINT(1) NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB
COMMENT = '			';


-- -----------------------------------------------------
-- Table `mydb`.`Direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Direccion` (
  `idDireccion` INT NOT NULL AUTO_INCREMENT,
  `Pais` VARCHAR(50) NULL,
  `Estado` VARCHAR(50) NULL,
  `Municipio` VARCHAR(50) NULL,
  `Colonia` VARCHAR(50) NULL,
  `CP` VARCHAR(10) NULL,
  `Calle` VARCHAR(80) NULL,
  `NumeroInterior` VARCHAR(5) NULL,
  `NumeroExterior` VARCHAR(5) NULL,
  `NombreEdificio` VARCHAR(50) NULL,
  `Latitud` VARCHAR(20) NULL,
  `Longitud` VARCHAR(20) NULL,
  `UrlUbicacion` VARCHAR(255) NULL,
  `Referencia` VARCHAR(200) NULL,
  PRIMARY KEY (`idDireccion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Filial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Filial` (
  `idFilial` INT NOT NULL AUTO_INCREMENT,
  `TipoFilial` VARCHAR(45) NULL,
  `Nombre` VARCHAR(80) NULL,
  `Encargado` VARCHAR(100) NULL,
  `Correo` VARCHAR(100) NULL,
  `Telefono1` VARCHAR(10) NULL,
  `Telefono2` VARCHAR(10) NULL,
  `FechaAlta:` DATE NULL,
  `StatusFilial` TINYINT(1) NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Direccion_idDireccion` INT NOT NULL,
  PRIMARY KEY (`idFilial`),
  INDEX `fk_Filial_Cliente_idx` (`Cliente_idCliente` ASC),
  INDEX `fk_Filial_Direccion1_idx` (`Direccion_idDireccion` ASC),
  CONSTRAINT `fk_Filial_Cliente`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Filial_Direccion1`
    FOREIGN KEY (`Direccion_idDireccion`)
    REFERENCES `mydb`.`Direccion` (`idDireccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Acceso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Acceso` (
  `idAcceso` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(50) NULL,
  `Prioridad` VARCHAR(45) NULL,
  `TipoAcceso` VARCHAR(45) NULL,
  `Descripcion` VARCHAR(200) NULL,
  `FechaAlta` DATE NULL,
  `FechaActualizacion` TIMESTAMP NULL,
  `StatusAcceso` TINYINT(1) NULL,
  `Filial_idFilial` INT NOT NULL,
  PRIMARY KEY (`idAcceso`),
  INDEX `fk_Acceso_Filial1_idx` (`Filial_idFilial` ASC),
  CONSTRAINT `fk_Acceso_Filial1`
    FOREIGN KEY (`Filial_idFilial`)
    REFERENCES `mydb`.`Filial` (`idFilial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pedestal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pedestal` (
  `idPedestal` INT NOT NULL AUTO_INCREMENT,
  `CodigoInterno` VARCHAR(80) NULL,
  `NumeroSerie` VARCHAR(80) NULL,
  `TipoConfiguracion` VARCHAR(20) NULL,
  `FechaInstalacion` DATE NULL,
  `Observaciones` VARCHAR(200) NULL,
  `Actualizacion` TIMESTAMP NULL,
  `StatusPedestal` TINYINT(1) NULL,
  `Acceso_idAcceso` INT NOT NULL,
  PRIMARY KEY (`idPedestal`),
  INDEX `fk_Pedestal_Acceso1_idx` (`Acceso_idAcceso` ASC),
  CONSTRAINT `fk_Pedestal_Acceso1`
    FOREIGN KEY (`Acceso_idAcceso`)
    REFERENCES `mydb`.`Acceso` (`idAcceso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = ndbcluster;


-- -----------------------------------------------------
-- Table `mydb`.`Lectura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Lectura` (
  `idLectura` INT NOT NULL AUTO_INCREMENT,
  `CodigoCredencial` VARCHAR(128) NULL,
  `ImagenTermica` BLOB NULL,
  `TempAmbiente` FLOAT NULL,
  `ValorTemp` FLOAT NULL,
  `EstadoSalud1` TINYINT(1) NULL,
  `EstadoSalud2` TINYINT(1) NULL,
  `EstadoSalud3` TINYINT(1) NULL,
  `EstadoSalud4` TINYINT(1) NULL,
  `EstadoSalud5` TINYINT(1) NULL,
  `EstadoSalud6` TINYINT(1) NULL,
  `EstadoSalud7` TINYINT(1) NULL,
  `EstadoSalud8` TINYINT(1) NULL,
  `EstadoSalud9` TINYINT(1) NULL,
  `EstadoSalud10` TINYINT(1) NULL,
  `Fecha` DATE NULL,
  `Hora` TIME NULL,
  `Pedestal_idPedestal` INT NOT NULL,
  PRIMARY KEY (`idLectura`),
  INDEX `fk_Lectura_Pedestal1_idx` (`Pedestal_idPedestal` ASC),
  CONSTRAINT `fk_Lectura_Pedestal1`
    FOREIGN KEY (`Pedestal_idPedestal`)
    REFERENCES `mydb`.`Pedestal` (`idPedestal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Administrador` (
  `idAdministrador` INT NOT NULL AUTO_INCREMENT,
  `TipoAdministrador` VARCHAR(45) NULL,
  `Nombre` VARCHAR(80) NULL,
  `ApellidoP` VARCHAR(80) NULL,
  `ApellidoM` VARCHAR(80) NULL,
  `Genero` VARCHAR(10) NULL,
  `FechaNacimiento` DATE NULL,
  `Curp` VARCHAR(18) NULL,
  `NSS` VARCHAR(11) NULL,
  `Telefono` VARCHAR(10) NULL,
  `CodigoAdmin` VARCHAR(30) NULL,
  `Correo` VARCHAR(80) NULL,
  `Usuario` VARCHAR(30) NULL,
  `Contrasena` VARCHAR(15) NULL,
  `Area` VARCHAR(50) NULL,
  `Turno` VARCHAR(20) NULL,
  `Foto` BLOB NULL,
  `FechaAlta` DATE NULL,
  `StatusAdmin` TINYINT(1) NULL,
  `Filial_idFilial` INT NOT NULL,
  PRIMARY KEY (`idAdministrador`),
  INDEX `fk_Administrador_Filial1_idx` (`Filial_idFilial` ASC),
  CONSTRAINT `fk_Administrador_Filial1`
    FOREIGN KEY (`Filial_idFilial`)
    REFERENCES `mydb`.`Filial` (`idFilial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Grupo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Grupo` (
  `idGrupo` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(80) NULL,
  `StatusGrupo` TINYINT(1) NULL,
  `Filial_idFilial` INT NOT NULL,
  PRIMARY KEY (`idGrupo`),
  INDEX `fk_Grupo_Filial1_idx` (`Filial_idFilial` ASC),
  CONSTRAINT `fk_Grupo_Filial1`
    FOREIGN KEY (`Filial_idFilial`)
    REFERENCES `mydb`.`Filial` (`idFilial`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(80) NULL,
  `ApellidoP` VARCHAR(80) NULL,
  `ApellidoM` VARCHAR(80) NULL,
  `Genero` VARCHAR(10) NULL,
  `FechaNacimiento` DATE NULL,
  `Matricula` VARCHAR(50) NULL,
  `CodigoEmpleado` VARCHAR(50) NULL,
  `QRCodTemp` VARCHAR(80) NULL,
  `Curp` VARCHAR(18) NULL,
  `NSS` VARCHAR(11) NULL,
  `RFC` VARCHAR(13) NULL,
  `Telefono` VARCHAR(10) NULL,
  `Correo` VARCHAR(80) NULL,
  `Contrasena` VARCHAR(15) NULL,
  `idTutor1` INT NULL,
  `idTutor2` INT NULL,
  `idTutor3` INT NULL,
  `idTutor4` INT NULL,
  `idTutor5` INT NULL,
  `Cargo` VARCHAR(50) NULL,
  `Area` VARCHAR(50) NULL,
  `Turno` VARCHAR(15) NULL,
  `Foto` BLOB NULL,
  `FechaAlta` DATE NULL,
  `Salon` VARCHAR(50) NULL,
  `Grado` VARCHAR(5) NULL,
  `Grupo` VARCHAR(45) NULL,
  `Carrera` VARCHAR(80) NULL,
  `EmpresaProveedor` VARCHAR(200) NULL,
  `OrigenVisita` VARCHAR(200) NULL,
  `Asunto` VARCHAR(200) NULL,
  `Identificacion` VARCHAR(80) NULL,
  `PersonaSolicitada` VARCHAR(128) NULL,
  `Observaciones` VARCHAR(255) NULL,
  `StatusUsuario` TINYINT(1) NULL,
  `UrlModulo` VARCHAR(255) NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Modulo_Heimdall`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Modulo_Heimdall` (
  `idModulo_Heimdall` INT NOT NULL,
  `Nombre` VARCHAR(50) NULL,
  `Descripcion` VARCHAR(200) NULL,
  `StatusModulo` TINYINT(1) NULL,
  `Crear` TINYINT(1) NULL,
  `Leer` TINYINT(1) NULL,
  `Editar` TINYINT(1) NULL,
  `Eliminar` TINYINT(1) NULL,
  PRIMARY KEY (`idModulo_Heimdall`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Documentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Documentos` (
  `idDocumentos` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(80) NULL,
  `FechaCarga` TIMESTAMP NULL,
  `URL` VARCHAR(255) NULL,
  `Usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`idDocumentos`),
  INDEX `fk_Documentos_Usuario1_idx` (`Usuario_idUsuario` ASC),
  CONSTRAINT `fk_Documentos_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `mydb`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Modulo_Heimdall_has_Grupo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Modulo_Heimdall_has_Grupo` (
  `Modulo_Heimdall_idModulo_Heimdall` INT NOT NULL,
  `Grupo_idGrupo` INT NOT NULL,
  PRIMARY KEY (`Modulo_Heimdall_idModulo_Heimdall`, `Grupo_idGrupo`),
  INDEX `fk_Modulo_Heimdall_has_Grupo_Grupo1_idx` (`Grupo_idGrupo` ASC),
  INDEX `fk_Modulo_Heimdall_has_Grupo_Modulo_Heimdall1_idx` (`Modulo_Heimdall_idModulo_Heimdall` ASC),
  CONSTRAINT `fk_Modulo_Heimdall_has_Grupo_Modulo_Heimdall1`
    FOREIGN KEY (`Modulo_Heimdall_idModulo_Heimdall`)
    REFERENCES `mydb`.`Modulo_Heimdall` (`idModulo_Heimdall`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Modulo_Heimdall_has_Grupo_Grupo1`
    FOREIGN KEY (`Grupo_idGrupo`)
    REFERENCES `mydb`.`Grupo` (`idGrupo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Credencial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Credencial` (
  `idCredencial` INT NOT NULL AUTO_INCREMENT,
  `CodigoCredencial` VARCHAR(128) NULL,
  `Tipo` VARCHAR(45) NULL,
  `FechaEmision` DATE NULL,
  `FechaCancelacion` DATE NULL,
  `Vigencia` DATE NULL,
  `QRData` BLOB NULL,
  `StatusCredencial` TINYINT(1) NULL,
  `Usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`idCredencial`),
  INDEX `fk_Credencial_Usuario1_idx` (`Usuario_idUsuario` ASC),
  CONSTRAINT `fk_Credencial_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `mydb`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;