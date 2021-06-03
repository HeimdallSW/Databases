-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-06-2021 a las 18:42:02
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mydb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acceso`
--

CREATE TABLE `acceso` (
  `idAcceso` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Prioridad` varchar(45) DEFAULT NULL,
  `TipoAcceso` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(200) DEFAULT NULL,
  `FechaAlta` date DEFAULT NULL,
  `FechaActualizacion` timestamp NULL DEFAULT NULL,
  `StatusAcceso` tinyint(1) DEFAULT NULL,
  `Filial_idFilial` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `idAdministrador` int(11) NOT NULL,
  `TipoAdministrador` varchar(45) DEFAULT NULL,
  `Nombre` varchar(80) DEFAULT NULL,
  `ApellidoP` varchar(80) DEFAULT NULL,
  `ApellidoM` varchar(80) DEFAULT NULL,
  `Genero` varchar(10) DEFAULT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `Curp` varchar(18) DEFAULT NULL,
  `NSS` varchar(11) DEFAULT NULL,
  `Telefono` varchar(10) DEFAULT NULL,
  `CodigoAdmin` varchar(30) DEFAULT NULL,
  `Correo` varchar(80) DEFAULT NULL,
  `Usuario` varchar(30) DEFAULT NULL,
  `Contrasena` varchar(15) DEFAULT NULL,
  `Area` varchar(50) DEFAULT NULL,
  `Turno` varchar(20) DEFAULT NULL,
  `Foto` varchar(255) DEFAULT NULL,
  `FechaAlta` date DEFAULT NULL,
  `StatusAdmin` tinyint(1) DEFAULT NULL,
  `Filial_idFilial` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `GiroComercial` varchar(80) DEFAULT NULL,
  `Nombre` varchar(80) DEFAULT NULL,
  `RFC` varchar(13) DEFAULT NULL,
  `Telefono` varchar(10) DEFAULT NULL,
  `Correo` varchar(80) DEFAULT NULL,
  `URL` varchar(100) DEFAULT NULL,
  `Tamano` char(1) DEFAULT NULL,
  `NombreDirector` varchar(80) DEFAULT NULL,
  `Ambito` varchar(80) DEFAULT NULL,
  `FechaAlta` date DEFAULT NULL,
  `StatusCliente` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='			';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `credencial`
--

CREATE TABLE `credencial` (
  `idCredencial` int(11) NOT NULL,
  `CodigoCredencial` varchar(128) DEFAULT NULL,
  `Tipo` varchar(45) DEFAULT NULL,
  `FechaEmision` date DEFAULT NULL,
  `FechaCancelacion` date DEFAULT NULL,
  `Vigencia` date DEFAULT NULL,
  `QRData` blob DEFAULT NULL,
  `StatusCredencial` tinyint(1) DEFAULT NULL,
  `Usuario_idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `idDireccion` int(11) NOT NULL,
  `Pais` varchar(50) DEFAULT NULL,
  `Estado` varchar(50) DEFAULT NULL,
  `Municipio` varchar(50) DEFAULT NULL,
  `Colonia` varchar(50) DEFAULT NULL,
  `CP` varchar(10) DEFAULT NULL,
  `Calle` varchar(80) DEFAULT NULL,
  `NumeroInterior` varchar(5) DEFAULT NULL,
  `NumeroExterior` varchar(5) DEFAULT NULL,
  `NombreEdificio` varchar(50) DEFAULT NULL,
  `Latitud` varchar(20) DEFAULT NULL,
  `Longitud` varchar(20) DEFAULT NULL,
  `UrlUbicacion` varchar(255) DEFAULT NULL,
  `Referencia` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

CREATE TABLE `documentos` (
  `idDocumentos` int(11) NOT NULL,
  `Nombre` varchar(80) DEFAULT NULL,
  `FechaCarga` timestamp NULL DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL,
  `Usuario_idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `filial`
--

CREATE TABLE `filial` (
  `idFilial` int(11) NOT NULL,
  `TipoFilial` varchar(45) DEFAULT NULL,
  `Nombre` varchar(80) DEFAULT NULL,
  `Encargado` varchar(100) DEFAULT NULL,
  `Correo` varchar(100) DEFAULT NULL,
  `Telefono1` varchar(10) DEFAULT NULL,
  `Telefono2` varchar(10) DEFAULT NULL,
  `FechaAlta:` date DEFAULT NULL,
  `StatusFilial` tinyint(1) DEFAULT NULL,
  `Cliente_idCliente` int(11) NOT NULL,
  `Direccion_idDireccion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `idGrupo` int(11) NOT NULL,
  `Nombre` varchar(80) DEFAULT NULL,
  `StatusGrupo` tinyint(1) DEFAULT NULL,
  `Filial_idFilial` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lectura`
--

CREATE TABLE `lectura` (
  `idLectura` int(11) NOT NULL,
  `CodigoCredencial` varchar(128) DEFAULT NULL,
  `ImagenTermica` blob DEFAULT NULL,
  `TempAmbiente` float DEFAULT NULL,
  `ValorTemp` float DEFAULT NULL,
  `EstadoSalud1` tinyint(1) DEFAULT NULL,
  `EstadoSalud2` tinyint(1) DEFAULT NULL,
  `EstadoSalud3` tinyint(1) DEFAULT NULL,
  `EstadoSalud4` tinyint(1) DEFAULT NULL,
  `EstadoSalud5` tinyint(1) DEFAULT NULL,
  `EstadoSalud6` tinyint(1) DEFAULT NULL,
  `EstadoSalud7` tinyint(1) DEFAULT NULL,
  `EstadoSalud8` tinyint(1) DEFAULT NULL,
  `EstadoSalud9` tinyint(1) DEFAULT NULL,
  `EstadoSalud10` tinyint(1) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Hora` time DEFAULT NULL,
  `Pedestal_idPedestal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo_heimdall`
--

CREATE TABLE `modulo_heimdall` (
  `idModulo_Heimdall` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Descripcion` varchar(200) DEFAULT NULL,
  `StatusModulo` tinyint(1) DEFAULT NULL,
  `Crear` tinyint(1) DEFAULT NULL,
  `Leer` tinyint(1) DEFAULT NULL,
  `Editar` tinyint(1) DEFAULT NULL,
  `Eliminar` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo_heimdall_has_grupo`
--

CREATE TABLE `modulo_heimdall_has_grupo` (
  `Modulo_Heimdall_idModulo_Heimdall` int(11) NOT NULL,
  `Grupo_idGrupo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedestal`
--

CREATE TABLE `pedestal` (
  `idPedestal` int(11) NOT NULL,
  `CodigoInterno` varchar(80) DEFAULT NULL,
  `NumeroSerie` varchar(80) DEFAULT NULL,
  `TipoConfiguracion` varchar(20) DEFAULT NULL,
  `FechaInstalacion` date DEFAULT NULL,
  `Observaciones` varchar(200) DEFAULT NULL,
  `Actualizacion` timestamp NULL DEFAULT NULL,
  `StatusPedestal` tinyint(1) DEFAULT NULL,
  `Acceso_idAcceso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `Nombre` varchar(80) DEFAULT NULL,
  `ApellidoP` varchar(80) DEFAULT NULL,
  `ApellidoM` varchar(80) DEFAULT NULL,
  `Genero` varchar(10) DEFAULT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `Matricula` varchar(50) DEFAULT NULL,
  `CodigoEmpleado` varchar(50) DEFAULT NULL,
  `QRCodTemp` varchar(80) DEFAULT NULL,
  `Curp` varchar(18) DEFAULT NULL,
  `NSS` varchar(11) DEFAULT NULL,
  `RFC` varchar(13) DEFAULT NULL,
  `Telefono` varchar(10) DEFAULT NULL,
  `Correo` varchar(80) DEFAULT NULL,
  `Contrasena` varchar(15) DEFAULT NULL,
  `idTutor1` int(11) DEFAULT NULL,
  `idTutor2` int(11) DEFAULT NULL,
  `idTutor3` int(11) DEFAULT NULL,
  `idTutor4` int(11) DEFAULT NULL,
  `idTutor5` int(11) DEFAULT NULL,
  `Cargo` varchar(50) DEFAULT NULL,
  `Area` varchar(50) DEFAULT NULL,
  `Turno` varchar(15) DEFAULT NULL,
  `Foto` varchar(255) DEFAULT NULL,
  `FechaAlta` date DEFAULT NULL,
  `Salon` varchar(50) DEFAULT NULL,
  `Grado` varchar(5) DEFAULT NULL,
  `Grupo` varchar(45) DEFAULT NULL,
  `Carrera` varchar(80) DEFAULT NULL,
  `EmpresaProveedor` varchar(200) DEFAULT NULL,
  `OrigenVisita` varchar(200) DEFAULT NULL,
  `Asunto` varchar(200) DEFAULT NULL,
  `Identificacion` varchar(80) DEFAULT NULL,
  `PersonaSolicitada` varchar(128) DEFAULT NULL,
  `Observaciones` varchar(255) DEFAULT NULL,
  `StatusUsuario` tinyint(1) DEFAULT NULL,
  `UrlModulo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acceso`
--
ALTER TABLE `acceso`
  ADD PRIMARY KEY (`idAcceso`),
  ADD KEY `fk_Acceso_Filial1_idx` (`Filial_idFilial`);

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`idAdministrador`),
  ADD KEY `fk_Administrador_Filial1_idx` (`Filial_idFilial`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `credencial`
--
ALTER TABLE `credencial`
  ADD PRIMARY KEY (`idCredencial`),
  ADD KEY `fk_Credencial_Usuario1_idx` (`Usuario_idUsuario`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`idDireccion`);

--
-- Indices de la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`idDocumentos`),
  ADD KEY `fk_Documentos_Usuario1_idx` (`Usuario_idUsuario`);

--
-- Indices de la tabla `filial`
--
ALTER TABLE `filial`
  ADD PRIMARY KEY (`idFilial`),
  ADD KEY `fk_Filial_Cliente_idx` (`Cliente_idCliente`),
  ADD KEY `fk_Filial_Direccion1_idx` (`Direccion_idDireccion`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`idGrupo`),
  ADD KEY `fk_Grupo_Filial1_idx` (`Filial_idFilial`);

--
-- Indices de la tabla `lectura`
--
ALTER TABLE `lectura`
  ADD PRIMARY KEY (`idLectura`),
  ADD KEY `fk_Lectura_Pedestal1_idx` (`Pedestal_idPedestal`);

--
-- Indices de la tabla `modulo_heimdall`
--
ALTER TABLE `modulo_heimdall`
  ADD PRIMARY KEY (`idModulo_Heimdall`);

--
-- Indices de la tabla `modulo_heimdall_has_grupo`
--
ALTER TABLE `modulo_heimdall_has_grupo`
  ADD PRIMARY KEY (`Modulo_Heimdall_idModulo_Heimdall`,`Grupo_idGrupo`),
  ADD KEY `fk_Modulo_Heimdall_has_Grupo_Grupo1_idx` (`Grupo_idGrupo`),
  ADD KEY `fk_Modulo_Heimdall_has_Grupo_Modulo_Heimdall1_idx` (`Modulo_Heimdall_idModulo_Heimdall`);

--
-- Indices de la tabla `pedestal`
--
ALTER TABLE `pedestal`
  ADD PRIMARY KEY (`idPedestal`),
  ADD KEY `fk_Pedestal_Acceso1_idx` (`Acceso_idAcceso`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acceso`
--
ALTER TABLE `acceso`
  MODIFY `idAcceso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `idAdministrador` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `credencial`
--
ALTER TABLE `credencial`
  MODIFY `idCredencial` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `idDireccion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `documentos`
--
ALTER TABLE `documentos`
  MODIFY `idDocumentos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `filial`
--
ALTER TABLE `filial`
  MODIFY `idFilial` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `grupo`
--
ALTER TABLE `grupo`
  MODIFY `idGrupo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `lectura`
--
ALTER TABLE `lectura`
  MODIFY `idLectura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedestal`
--
ALTER TABLE `pedestal`
  MODIFY `idPedestal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acceso`
--
ALTER TABLE `acceso`
  ADD CONSTRAINT `fk_Acceso_Filial1` FOREIGN KEY (`Filial_idFilial`) REFERENCES `filial` (`idFilial`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `fk_Administrador_Filial1` FOREIGN KEY (`Filial_idFilial`) REFERENCES `filial` (`idFilial`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `credencial`
--
ALTER TABLE `credencial`
  ADD CONSTRAINT `fk_Credencial_Usuario1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD CONSTRAINT `fk_Documentos_Usuario1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `filial`
--
ALTER TABLE `filial`
  ADD CONSTRAINT `fk_Filial_Cliente` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Filial_Direccion1` FOREIGN KEY (`Direccion_idDireccion`) REFERENCES `direccion` (`idDireccion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `fk_Grupo_Filial1` FOREIGN KEY (`Filial_idFilial`) REFERENCES `filial` (`idFilial`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `lectura`
--
ALTER TABLE `lectura`
  ADD CONSTRAINT `fk_Lectura_Pedestal1` FOREIGN KEY (`Pedestal_idPedestal`) REFERENCES `pedestal` (`idPedestal`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `modulo_heimdall_has_grupo`
--
ALTER TABLE `modulo_heimdall_has_grupo`
  ADD CONSTRAINT `fk_Modulo_Heimdall_has_Grupo_Grupo1` FOREIGN KEY (`Grupo_idGrupo`) REFERENCES `grupo` (`idGrupo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Modulo_Heimdall_has_Grupo_Modulo_Heimdall1` FOREIGN KEY (`Modulo_Heimdall_idModulo_Heimdall`) REFERENCES `modulo_heimdall` (`idModulo_Heimdall`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedestal`
--
ALTER TABLE `pedestal`
  ADD CONSTRAINT `fk_Pedestal_Acceso1` FOREIGN KEY (`Acceso_idAcceso`) REFERENCES `acceso` (`idAcceso`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
