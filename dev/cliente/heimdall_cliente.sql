-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-06-2021 a las 19:17:09
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `heimdall_cliente`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acceso`
--

CREATE TABLE `acceso` (
  `idAcceso` int(10) UNSIGNED NOT NULL,
  `Filial_Cliente_idCliente` int(10) UNSIGNED NOT NULL,
  `Filial_idFilial` int(10) UNSIGNED NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Prioridad` varchar(30) DEFAULT NULL,
  `TipoAcceso` varchar(45) DEFAULT NULL,
  `Descripcion` text DEFAULT NULL,
  `FechaAlta` date DEFAULT NULL,
  `FechaActualizacion` timestamp NULL DEFAULT NULL,
  `StatusAcceso` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `acceso`
--

INSERT INTO `acceso` (`idAcceso`, `Filial_Cliente_idCliente`, `Filial_idFilial`, `Nombre`, `Prioridad`, `TipoAcceso`, `Descripcion`, `FechaAlta`, `FechaActualizacion`, `StatusAcceso`) VALUES
(1, 1, 1, 'Puerta 1', 'Alta', 'Peatonal', 'Acceso Principal', '2021-06-04', NULL, 1),
(2, 1, 1, 'Puerta 2', 'Alta', 'peatonal', 'Acceso por edificio de Biología', '2021-06-04', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `idAdministrador` int(10) UNSIGNED NOT NULL,
  `Filial_Cliente_idCliente` int(10) UNSIGNED NOT NULL,
  `Filial_idFilial` int(10) UNSIGNED NOT NULL,
  `TipoAdministrador` varchar(45) DEFAULT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `ApellidoP` varchar(100) DEFAULT NULL,
  `ApellidoM` varchar(100) DEFAULT NULL,
  `Genero` varchar(15) DEFAULT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `Curp` varchar(18) DEFAULT NULL,
  `NSS` varchar(11) DEFAULT NULL,
  `Telefono` varchar(10) DEFAULT NULL,
  `CodigoAdmin` varchar(30) DEFAULT NULL,
  `Correo` varchar(80) DEFAULT NULL,
  `Usuario` varchar(15) DEFAULT NULL,
  `Contrasena` varchar(15) DEFAULT NULL,
  `Area` varchar(50) DEFAULT NULL,
  `Turno` varchar(20) DEFAULT NULL,
  `Foto` varchar(255) DEFAULT NULL,
  `FechaAlta` date DEFAULT NULL,
  `StatusAdmin` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`idAdministrador`, `Filial_Cliente_idCliente`, `Filial_idFilial`, `TipoAdministrador`, `Nombre`, `ApellidoP`, `ApellidoM`, `Genero`, `FechaNacimiento`, `Curp`, `NSS`, `Telefono`, `CodigoAdmin`, `Correo`, `Usuario`, `Contrasena`, `Area`, `Turno`, `Foto`, `FechaAlta`, `StatusAdmin`) VALUES
(1, 1, 1, 'Principal', 'Eulalio', 'Bautista', 'Hernández', 'masculino', '1990-11-07', 'BAHE901107', '19818973893', '5560302140', 'admin01', 'eulaliobh@gmail.com', '', '', 'Dirección', 'Matutino y Vespertin', NULL, '2021-06-04', 1);


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(10) UNSIGNED NOT NULL,
  `GiroComercial` varchar(80) DEFAULT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `RFC` varchar(13) DEFAULT NULL,
  `Telefono` varchar(10) DEFAULT NULL,
  `Correo` varchar(80) DEFAULT NULL,
  `Url` varchar(100) DEFAULT NULL,
  `Tamano` char(1) DEFAULT NULL,
  `NombreDirector` varchar(50) DEFAULT NULL,
  `Ambito` varchar(100) DEFAULT NULL,
  `FechaAlta` date DEFAULT NULL,
  `StatusCliente` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `GiroComercial`, `Nombre`, `RFC`, `Telefono`, `Correo`, `Url`, `Tamano`, `NombreDirector`, `Ambito`, `FechaAlta`, `StatusCliente`) VALUES
(1, 'Educación', 'Universidad Autónoma Metropolitana', 'UAM740223H78', '5529301276', 'contacto@uam.edu.mx', 'http://www.uam.mx', 'G', 'Ángel Pérez Bautista', 'Universitario', '2021-06-04', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `credencial`
--

CREATE TABLE `credencial` (
  `idCredencial` int(10) UNSIGNED NOT NULL,
  `Usuario_Grupo_idGrupo` int(10) UNSIGNED NOT NULL,
  `Usuario_Grupo_Filial_Cliente_idCliente` int(10) UNSIGNED NOT NULL,
  `Usuario_Grupo_Filial_idFilial` int(10) UNSIGNED NOT NULL,
  `Usuario_idUsuario` int(10) UNSIGNED NOT NULL,
  `CodigoCredencial` varchar(128) DEFAULT NULL,
  `Tipo` varchar(45) DEFAULT NULL,
  `FechaEmicion` date DEFAULT NULL,
  `FechaCancelacion` date DEFAULT NULL,
  `Vigencia` date DEFAULT NULL,
  `QRData` blob DEFAULT NULL,
  `StatusCredencial` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `idDireccion` int(10) UNSIGNED NOT NULL,
  `Filial_Cliente_idCliente` int(10) UNSIGNED NOT NULL,
  `Filial_idFilial` int(10) UNSIGNED NOT NULL,
  `Pais` varchar(50) DEFAULT NULL,
  `Estado` varchar(50) DEFAULT NULL,
  `Municipio` varchar(50) DEFAULT NULL,
  `Colonia` varchar(50) DEFAULT NULL,
  `CP` varchar(10) DEFAULT NULL,
  `Calle` varchar(100) DEFAULT NULL,
  `NumeroInterior` varchar(5) DEFAULT NULL,
  `NumeroExterior` varchar(5) DEFAULT NULL,
  `NombreEdificio` varchar(50) DEFAULT NULL,
  `Latitud` varchar(20) DEFAULT NULL,
  `Longitud` varchar(20) DEFAULT NULL,
  `UrlUbicacion` varchar(255) DEFAULT NULL,
  `Refencia` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`idDireccion`, `Filial_Cliente_idCliente`, `Filial_idFilial`, `Pais`, `Estado`, `Municipio`, `Colonia`, `CP`, `Calle`, `NumeroInterior`, `NumeroExterior`, `NombreEdificio`, `Latitud`, `Longitud`, `UrlUbicacion`, `Refencia`) VALUES
(1, 1, 1, 'México', 'CDMX', 'Iztapalapa', 'Leyes de reforma 1ra secc', '09340', 'Av. San Rafael Atlixco', NULL, '186', NULL, '19°21′41″N', '99°04′22″O', NULL, 'entre eje 6 y sur 21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

CREATE TABLE `documentos` (
  `idDocumento` int(10) UNSIGNED NOT NULL,
  `Usuario_Grupo_idGrupo` int(10) UNSIGNED NOT NULL,
  `Usuario_Grupo_Filial_Cliente_idCliente` int(10) UNSIGNED NOT NULL,
  `Usuario_Grupo_Filial_idFilial` int(10) UNSIGNED NOT NULL,
  `Usuario_idUsuario` int(10) UNSIGNED NOT NULL,
  `Nombre` varchar(80) DEFAULT NULL,
  `FechaSubida` timestamp NULL DEFAULT NULL,
  `URL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `filial`
--

CREATE TABLE `filial` (
  `idFilial` int(10) UNSIGNED NOT NULL,
  `Cliente_idCliente` int(10) UNSIGNED NOT NULL,
  `TipoFilial` varchar(45) DEFAULT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Encargado` varchar(80) DEFAULT NULL,
  `Correo` varchar(80) DEFAULT NULL,
  `Telefono1` varchar(10) DEFAULT NULL,
  `Telefono2` varchar(10) DEFAULT NULL,
  `FechaAlta` date DEFAULT NULL,
  `StatusFilial` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `filial`
--

INSERT INTO `filial` (`idFilial`, `Cliente_idCliente`, `TipoFilial`, `Nombre`, `Encargado`, `Correo`, `Telefono1`, `Telefono2`, `FechaAlta`, `StatusFilial`) VALUES
(1, 1, 'Unidad 1', 'UAM-Iztapalapa', 'Anastacio Clemente Ortíz', 'iztapalapa@uam.edu.mx', '5545206219', '5545206220', '2021-06-04', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `idGrupo` int(10) UNSIGNED NOT NULL,
  `Filial_Cliente_idCliente` int(10) UNSIGNED NOT NULL,
  `Filial_idFilial` int(10) UNSIGNED NOT NULL,
  `NombreGrupo` varchar(50) DEFAULT NULL,
  `Descripcion` text DEFAULT NULL,
  `StatusGrupo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lectura`
--

CREATE TABLE `lectura` (
  `idLectura` int(10) UNSIGNED NOT NULL,
  `Pedestal_idPedestal` int(10) UNSIGNED NOT NULL,
  `Pedestal_Acceso_idAcceso` int(10) UNSIGNED NOT NULL,
  `Pedestal_Acceso_Filial_Cliente_idCliente` int(10) UNSIGNED NOT NULL,
  `Pedestal_Acceso_Filial_idFilial` int(10) UNSIGNED NOT NULL,
  `CodigoCredencial` varchar(128) NOT NULL,
  `ImagenTermica` blob DEFAULT NULL,
  `TempAmbiente` float DEFAULT NULL,
  `ValorTemp` float DEFAULT NULL,
  `Estado_salud_1` tinyint(1) DEFAULT NULL,
  `Estado_salud_2` tinyint(1) DEFAULT NULL,
  `Estado_salud_3` tinyint(1) DEFAULT NULL,
  `Estado_salud_4` tinyint(1) DEFAULT NULL,
  `Estado_salud_5` tinyint(1) DEFAULT NULL,
  `Estado_salud_6` tinyint(1) DEFAULT NULL,
  `Estado_salud_7` tinyint(1) DEFAULT NULL,
  `Estado_salud_8` tinyint(1) DEFAULT NULL,
  `Estado_salud_9` tinyint(1) DEFAULT NULL,
  `Estado_salud_10` tinyint(1) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Hora` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `moduloheimdall`
--

CREATE TABLE `moduloheimdall` (
  `idModuloHeimdall` int(10) UNSIGNED NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Descripcion` text DEFAULT NULL,
  `StatusModulo` tinyint(1) DEFAULT NULL,
  `Crear` tinyint(1) DEFAULT NULL,
  `Leer` tinyint(1) DEFAULT NULL,
  `Editar` tinyint(1) DEFAULT NULL,
  `Eliminar` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `moduloheimdall_has_grupo`
--

CREATE TABLE `moduloheimdall_has_grupo` (
  `Grupo_idGrupo` int(10) UNSIGNED NOT NULL,
  `ModuloHeimdall_idModuloHeimdall` int(10) UNSIGNED NOT NULL,
  `Grupo_Filial_idFilial` int(10) UNSIGNED NOT NULL,
  `Grupo_Filial_Cliente_idCliente` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedestal`
--

CREATE TABLE `pedestal` (
  `idPedestal` int(10) UNSIGNED NOT NULL,
  `Acceso_Filial_idFilial` int(10) UNSIGNED NOT NULL,
  `Acceso_Filial_Cliente_idCliente` int(10) UNSIGNED NOT NULL,
  `Acceso_idAcceso` int(10) UNSIGNED NOT NULL,
  `CodigoInterno` varchar(100) DEFAULT NULL,
  `NumeroSerie` varchar(100) DEFAULT NULL,
  `TipoConfiguracion` varchar(20) DEFAULT NULL,
  `FechaInstalacion` date DEFAULT NULL,
  `Observaciones` text DEFAULT NULL,
  `Actualizacion` timestamp NULL DEFAULT NULL,
  `StatusPedestal` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedestal`
--

INSERT INTO `pedestal` (`idPedestal`, `Acceso_Filial_idFilial`, `Acceso_Filial_Cliente_idCliente`, `Acceso_idAcceso`, `CodigoInterno`, `NumeroSerie`, `TipoConfiguracion`, `FechaInstalacion`, `Observaciones`, `Actualizacion`, `StatusPedestal`) VALUES
(1, 1, 1, 1, '001', 'HG01', 'Hibrido', '2021-06-04', NULL, NULL, 1),
(2, 1, 1, 1, '002', 'HG02', 'Hibrido', '2021-06-04', NULL, NULL, 1),
(3, 1, 1, 1, '003', 'HG03', 'Hibrido', '2021-06-04', NULL, NULL, 1),
(4, 1, 1, 2, '004', 'HG04', 'Hibrido', '2021-06-04', NULL, NULL, 1),
(5, 1, 1, 2, '005', 'HG05', 'Hibrido', '2021-06-04', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(10) UNSIGNED NOT NULL,
  `Grupo_Filial_idFilial` int(10) UNSIGNED NOT NULL,
  `Grupo_Filial_Cliente_idCliente` int(10) UNSIGNED NOT NULL,
  `Grupo_idGrupo` int(10) UNSIGNED NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `ApellidoP` varchar(100) DEFAULT NULL,
  `ApellidoM` varchar(100) DEFAULT NULL,
  `Genero` varchar(15) DEFAULT NULL,
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
  `id_Tutor1` int(10) UNSIGNED DEFAULT NULL,
  `id_Tutor2` int(10) UNSIGNED DEFAULT NULL,
  `id_Tutor3` int(10) UNSIGNED DEFAULT NULL,
  `id_Tutor4` int(10) UNSIGNED DEFAULT NULL,
  `id_Tutor5` int(10) UNSIGNED DEFAULT NULL,
  `Cargo` varchar(50) DEFAULT NULL,
  `Area` varchar(15) DEFAULT NULL,
  `Turno` varchar(20) DEFAULT NULL,
  `Foto` varchar(255) DEFAULT NULL,
  `FechaAlta` date DEFAULT NULL,
  `Salon` varchar(80) DEFAULT NULL,
  `Grado` varchar(5) DEFAULT NULL,
  `Grupo` varchar(50) DEFAULT NULL,
  `Carrera` varchar(80) DEFAULT NULL,
  `EmpresaProveedor` varchar(255) DEFAULT NULL,
  `OrigenVisita` varchar(255) DEFAULT NULL,
  `Asunto` varchar(255) DEFAULT NULL,
  `Identificacion` varchar(100) DEFAULT NULL,
  `PersonaSolicitada` varchar(255) DEFAULT NULL,
  `Observaciones` varchar(255) DEFAULT NULL,
  `StatusUsuario` tinyint(1) DEFAULT NULL,
  `UrlModulo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acceso`
--
ALTER TABLE `acceso`
  ADD PRIMARY KEY (`idAcceso`,`Filial_Cliente_idCliente`,`Filial_idFilial`),
  ADD KEY `Acceso_FKIndex1` (`Filial_idFilial`,`Filial_Cliente_idCliente`);

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`idAdministrador`,`Filial_Cliente_idCliente`,`Filial_idFilial`),
  ADD KEY `Administrador_FKIndex1` (`Filial_idFilial`,`Filial_Cliente_idCliente`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `credencial`
--
ALTER TABLE `credencial`
  ADD PRIMARY KEY (`idCredencial`,`Usuario_Grupo_idGrupo`,`Usuario_Grupo_Filial_Cliente_idCliente`,`Usuario_Grupo_Filial_idFilial`,`Usuario_idUsuario`),
  ADD KEY `Credencial_FKIndex1` (`Usuario_idUsuario`,`Usuario_Grupo_Filial_idFilial`,`Usuario_Grupo_Filial_Cliente_idCliente`,`Usuario_Grupo_idGrupo`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`idDireccion`,`Filial_Cliente_idCliente`,`Filial_idFilial`),
  ADD KEY `Direccion_FKIndex1` (`Filial_idFilial`,`Filial_Cliente_idCliente`);

--
-- Indices de la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`idDocumento`,`Usuario_Grupo_idGrupo`,`Usuario_Grupo_Filial_Cliente_idCliente`,`Usuario_Grupo_Filial_idFilial`,`Usuario_idUsuario`),
  ADD KEY `Cartas_compromiso_FKIndex1` (`Usuario_idUsuario`,`Usuario_Grupo_Filial_idFilial`,`Usuario_Grupo_Filial_Cliente_idCliente`,`Usuario_Grupo_idGrupo`);

--
-- Indices de la tabla `filial`
--
ALTER TABLE `filial`
  ADD PRIMARY KEY (`idFilial`,`Cliente_idCliente`),
  ADD KEY `Filial_FKIndex1` (`Cliente_idCliente`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`idGrupo`,`Filial_Cliente_idCliente`,`Filial_idFilial`),
  ADD KEY `Grupo_FKIndex1` (`Filial_idFilial`,`Filial_Cliente_idCliente`);

--
-- Indices de la tabla `lectura`
--
ALTER TABLE `lectura`
  ADD PRIMARY KEY (`idLectura`,`Pedestal_idPedestal`,`Pedestal_Acceso_idAcceso`,`Pedestal_Acceso_Filial_Cliente_idCliente`,`Pedestal_Acceso_Filial_idFilial`),
  ADD KEY `Lectura_FKIndex2` (`Pedestal_idPedestal`,`Pedestal_Acceso_Filial_idFilial`,`Pedestal_Acceso_Filial_Cliente_idCliente`,`Pedestal_Acceso_idAcceso`);

--
-- Indices de la tabla `moduloheimdall`
--
ALTER TABLE `moduloheimdall`
  ADD PRIMARY KEY (`idModuloHeimdall`);

--
-- Indices de la tabla `moduloheimdall_has_grupo`
--
ALTER TABLE `moduloheimdall_has_grupo`
  ADD PRIMARY KEY (`Grupo_idGrupo`,`ModuloHeimdall_idModuloHeimdall`,`Grupo_Filial_idFilial`,`Grupo_Filial_Cliente_idCliente`),
  ADD KEY `ModuloHeimdall_has_Grupo_FKIndex1` (`Grupo_idGrupo`,`Grupo_Filial_Cliente_idCliente`,`Grupo_Filial_idFilial`),
  ADD KEY `ModuloHeimdall_has_Grupo_FKIndex2` (`ModuloHeimdall_idModuloHeimdall`);

--
-- Indices de la tabla `pedestal`
--
ALTER TABLE `pedestal`
  ADD PRIMARY KEY (`idPedestal`,`Acceso_Filial_idFilial`,`Acceso_Filial_Cliente_idCliente`,`Acceso_idAcceso`),
  ADD KEY `Pedestal_FKIndex1` (`Acceso_idAcceso`,`Acceso_Filial_Cliente_idCliente`,`Acceso_Filial_idFilial`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`,`Grupo_Filial_idFilial`,`Grupo_Filial_Cliente_idCliente`,`Grupo_idGrupo`),
  ADD KEY `Usuario_FKIndex1` (`Grupo_idGrupo`,`Grupo_Filial_Cliente_idCliente`,`Grupo_Filial_idFilial`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acceso`
--
ALTER TABLE `acceso`
  MODIFY `idAcceso` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `idAdministrador` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `credencial`
--
ALTER TABLE `credencial`
  MODIFY `idCredencial` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `idDireccion` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `documentos`
--
ALTER TABLE `documentos`
  MODIFY `idDocumento` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `filial`
--
ALTER TABLE `filial`
  MODIFY `idFilial` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `grupo`
--
ALTER TABLE `grupo`
  MODIFY `idGrupo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `lectura`
--
ALTER TABLE `lectura`
  MODIFY `idLectura` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `moduloheimdall`
--
ALTER TABLE `moduloheimdall`
  MODIFY `idModuloHeimdall` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedestal`
--
ALTER TABLE `pedestal`
  MODIFY `idPedestal` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acceso`
--
ALTER TABLE `acceso`
  ADD CONSTRAINT `acceso_ibfk_1` FOREIGN KEY (`Filial_idFilial`,`Filial_Cliente_idCliente`) REFERENCES `filial` (`idFilial`, `Cliente_idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `administrador_ibfk_1` FOREIGN KEY (`Filial_idFilial`,`Filial_Cliente_idCliente`) REFERENCES `filial` (`idFilial`, `Cliente_idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `credencial`
--
ALTER TABLE `credencial`
  ADD CONSTRAINT `credencial_ibfk_1` FOREIGN KEY (`Usuario_idUsuario`,`Usuario_Grupo_Filial_idFilial`,`Usuario_Grupo_Filial_Cliente_idCliente`,`Usuario_Grupo_idGrupo`) REFERENCES `usuario` (`idUsuario`, `Grupo_Filial_idFilial`, `Grupo_Filial_Cliente_idCliente`, `Grupo_idGrupo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD CONSTRAINT `direccion_ibfk_1` FOREIGN KEY (`Filial_idFilial`,`Filial_Cliente_idCliente`) REFERENCES `filial` (`idFilial`, `Cliente_idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD CONSTRAINT `documentos_ibfk_1` FOREIGN KEY (`Usuario_idUsuario`,`Usuario_Grupo_Filial_idFilial`,`Usuario_Grupo_Filial_Cliente_idCliente`,`Usuario_Grupo_idGrupo`) REFERENCES `usuario` (`idUsuario`, `Grupo_Filial_idFilial`, `Grupo_Filial_Cliente_idCliente`, `Grupo_idGrupo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `filial`
--
ALTER TABLE `filial`
  ADD CONSTRAINT `filial_ibfk_1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `grupo_ibfk_1` FOREIGN KEY (`Filial_idFilial`,`Filial_Cliente_idCliente`) REFERENCES `filial` (`idFilial`, `Cliente_idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `lectura`
--
ALTER TABLE `lectura`
  ADD CONSTRAINT `lectura_ibfk_1` FOREIGN KEY (`Pedestal_idPedestal`,`Pedestal_Acceso_Filial_idFilial`,`Pedestal_Acceso_Filial_Cliente_idCliente`,`Pedestal_Acceso_idAcceso`) REFERENCES `pedestal` (`idPedestal`, `Acceso_Filial_idFilial`, `Acceso_Filial_Cliente_idCliente`, `Acceso_idAcceso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `moduloheimdall_has_grupo`
--
ALTER TABLE `moduloheimdall_has_grupo`
  ADD CONSTRAINT `moduloheimdall_has_grupo_ibfk_1` FOREIGN KEY (`Grupo_idGrupo`,`Grupo_Filial_Cliente_idCliente`,`Grupo_Filial_idFilial`) REFERENCES `grupo` (`idGrupo`, `Filial_Cliente_idCliente`, `Filial_idFilial`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `moduloheimdall_has_grupo_ibfk_2` FOREIGN KEY (`ModuloHeimdall_idModuloHeimdall`) REFERENCES `moduloheimdall` (`idModuloHeimdall`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedestal`
--
ALTER TABLE `pedestal`
  ADD CONSTRAINT `pedestal_ibfk_1` FOREIGN KEY (`Acceso_idAcceso`,`Acceso_Filial_Cliente_idCliente`,`Acceso_Filial_idFilial`) REFERENCES `acceso` (`idAcceso`, `Filial_Cliente_idCliente`, `Filial_idFilial`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`Grupo_idGrupo`,`Grupo_Filial_Cliente_idCliente`,`Grupo_Filial_idFilial`) REFERENCES `grupo` (`idGrupo`, `Filial_Cliente_idCliente`, `Filial_idFilial`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
