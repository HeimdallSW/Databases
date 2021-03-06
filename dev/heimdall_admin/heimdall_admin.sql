-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-06-2021 a las 04:18:37
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
-- Base de datos: `bd_heimdall_admin`
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
(2, 1, 1, 'Puerta 2', 'Alta', 'peatonal', 'Acceso por edificio de Biología', '2021-06-04', NULL, 1),
(3, 2, 2, 'Entrada Principal', 'Alta', 'Entrada', NULL, '2021-06-04', NULL, 1),
(4, 2, 2, 'Estacionamiento', 'Alta', 'Entrada', NULL, '2021-06-04', NULL, 1),
(5, 3, 3, 'Entrada Principal', 'Alta', 'Entrada', NULL, '2021-06-04', NULL, 1),
(6, 3, 3, 'Entrada Secundaria', 'Alta', 'Entrada', NULL, '2021-06-04', NULL, 1),
(7, 3, 3, 'Estacionamiento', 'Alta', 'Entrada/Salida', NULL, '2021-06-04', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administradorcliente`
--

CREATE TABLE `administradorcliente` (
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
  `Contrasena` varchar(100) DEFAULT NULL,
  `Area` varchar(50) DEFAULT NULL,
  `Turno` varchar(20) DEFAULT NULL,
  `Foto` varchar(255) DEFAULT NULL,
  `FechaAlta` date DEFAULT NULL,
  `StatusAdmin` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `administradorcliente`
--

INSERT INTO `administradorcliente` (`idAdministrador`, `Filial_Cliente_idCliente`, `Filial_idFilial`, `TipoAdministrador`, `Nombre`, `ApellidoP`, `ApellidoM`, `Genero`, `FechaNacimiento`, `Curp`, `NSS`, `Telefono`, `CodigoAdmin`, `Correo`, `Usuario`, `Contrasena`, `Area`, `Turno`, `Foto`, `FechaAlta`, `StatusAdmin`) VALUES
(1, 1, 1, 'Principal', 'Eulalio', 'Bautista', 'Hernández', 'masculino', '1990-11-07', 'BAHE901107', '19818973893', '5560302140', 'admin01', 'eulaliobh@gmail.com', '', '', 'Dirección', 'Matutino y Vespertin', NULL, '2021-06-04', 1),
(2, 2, 2, 'Principal', 'Edmundo', 'Ramírez', 'Sánchez', 'Masculino', '2021-06-03', 'EDMU25041979', '12345678901', '1234567890', 'admin02', 'edmundo@utvm.edu.mx', NULL, NULL, 'Administrativo', 'Matutino', NULL, '2021-06-04', 1),
(3, 3, 3, 'Principal', 'María Teresa', 'Arroyo', 'Rojas', 'Femenino', '1988-09-15', 'MTRF880915', '12345678923', '5689461523', 'admin03', 'mtarroyo@ioriente.edu.mx', NULL, NULL, 'Dirección', 'Matutino', NULL, '2021-06-04', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administradorheimdall`
--

CREATE TABLE `administradorheimdall` (
  `idAdministradorHeimdall` int(10) UNSIGNED NOT NULL,
  `TipoAdmnistrador` varchar(45) DEFAULT NULL,
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
-- Volcado de datos para la tabla `administradorheimdall`
--

INSERT INTO `administradorheimdall` (`idAdministradorHeimdall`, `TipoAdmnistrador`, `Nombre`, `ApellidoP`, `ApellidoM`, `Genero`, `FechaNacimiento`, `Curp`, `NSS`, `Telefono`, `CodigoAdmin`, `Correo`, `Usuario`, `Contrasena`, `Area`, `Turno`, `Foto`, `FechaAlta`, `StatusAdmin`) VALUES
(1, 'Principal', 'Roberto Isaac', 'Suaste', 'Martínez', 'Masculino', NULL, NULL, NULL, '5543654766', 'adminaira01', 'isaac@aira.mx', NULL, NULL, 'Desarrollo', 'Matutino', NULL, '2021-06-04', 1),
(2, 'General', 'Adair', 'Cruz', 'Guerrero', 'Masculino', '1999-07-25', 'CUGA990725HHGRRD04', NULL, '7712417279', 'adminaira02', 'adair@aira.mx', '', '', 'Desarrollo', 'Matutino', NULL, '2021-06-04', 1),
(3, 'General', 'Israel', 'Rebolledo', 'Hernández', 'masculino', '1982-11-23', 'REHI821123', '82374239934', '5514160025', 'adminaira03', 'israel@aira.mx', '', '', 'Desarrollo', 'matutino', NULL, '2021-06-04', 1);

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
  `Token` varchar(255) DEFAULT NULL,
  `StatusCliente` tinyint(1) DEFAULT NULL,
  `UrlSitioHeimdall` varchar(255) DEFAULT NULL,
  `FechaActivacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `GiroComercial`, `Nombre`, `RFC`, `Telefono`, `Correo`, `Url`, `Tamano`, `NombreDirector`, `Ambito`, `FechaAlta`, `Token`, `StatusCliente`, `UrlSitioHeimdall`, `FechaActivacion`) VALUES
(1, 'Educación', 'Universidad Autónoma Metropolitana', 'UAM740223H78', '5529301276', 'contacto@uam.edu.mx', 'http://www.uam.mx', 'G', 'Ángel Pérez Bautista', 'Universitario', '2021-06-04', '897561', 1, NULL, '2021-06-18'),
(2, 'Servicios', 'Universidad Tecnológica del Valle del Mezquital', 'UTV960729IJ3', '7597235684', 'utvm@utvm.edu.mx', 'http://www.utvm.edu.mx', 'G', 'Marco Antonio Ocadiz Cruz', 'Universidad Tecnologica', '2021-06-04', '957463', 1, NULL, '2021-06-18'),
(3, 'Educación', 'Instituto Oriente', 'IOP891006QF0', '2222450100', 'informes@ioriente.edu.mx', 'http://www.ioriente.edu.mx/', 'M', 'Enrique Flota Ocampo', 'Colegio Privado', '2021-06-04', '134975', 1, NULL, '2021-06-18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `componente`
--

CREATE TABLE `componente` (
  `idComponente` int(10) UNSIGNED NOT NULL,
  `Pedestal_Acceso_idAcceso` int(10) UNSIGNED NOT NULL,
  `Pedestal_Acceso_Filial_Cliente_idCliente` int(10) UNSIGNED NOT NULL,
  `Pedestal_Acceso_Filial_idFilial` int(10) UNSIGNED NOT NULL,
  `Pedestal_idPedestal` int(10) UNSIGNED NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Modelo` varchar(100) DEFAULT NULL,
  `NumeroSerie` varchar(100) DEFAULT NULL,
  `CodigoInterno` varchar(100) DEFAULT NULL,
  `FechaCompra` date DEFAULT NULL,
  `FechaInstalacion` date DEFAULT NULL,
  `Proveedor` varchar(100) DEFAULT NULL,
  `TelefonoProveedor` varchar(15) DEFAULT NULL,
  `CorreoProveedor` varchar(100) DEFAULT NULL,
  `PaisOrigen` varchar(100) DEFAULT NULL,
  `DireccionProveedor` varchar(100) DEFAULT NULL,
  `UrlProveedor` varchar(255) DEFAULT NULL,
  `StatusComponente` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contrato`
--

CREATE TABLE `contrato` (
  `idContrato` int(10) UNSIGNED NOT NULL,
  `Cliente_idCliente` int(10) UNSIGNED NOT NULL,
  `FechaInicio` date DEFAULT NULL,
  `FechaTermino` date DEFAULT NULL,
  `Vigencia` char(3) DEFAULT NULL,
  `Url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `contrato`
--

INSERT INTO `contrato` (`idContrato`, `Cliente_idCliente`, `FechaInicio`, `FechaTermino`, `Vigencia`, `Url`) VALUES
(1, 1, '2021-06-04', '2022-06-04', '12', NULL),
(2, 2, '2021-06-04', '2022-06-04', '12', NULL),
(3, 3, '2021-06-04', '2021-06-04', '12', NULL);

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
(1, 1, 1, 'México', 'CDMX', 'Iztapalapa', 'Leyes de reforma 1ra secc', '09340', 'Av. San Rafael Atlixco', NULL, '186', NULL, '19°21′41″N', '99°04′22″O', NULL, 'entre eje 6 y sur 21'),
(2, 2, 2, 'México', 'Hidalgo', 'Ixmiquilpan', 'El Nith', '42300', 'Carretera Ixmiquilpan-Capula Km. 4', 'N/A', 'N/A', NULL, '20.4831', '-99.2171', NULL, NULL),
(3, 3, 3, 'México', 'Puebla', 'Puebla', 'Jardines de San Manuel ', '72570', 'Av. San Francisco ', NULL, NULL, NULL, '19.010762', '-98.201703', NULL, NULL);

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
(1, 1, 'Unidad 1', 'UAM-Iztapalapa', 'Anastacio Clemente Ortíz', 'iztapalapa@uam.edu.mx', '5545206219', '5545206220', '2021-06-04', 1),
(2, 2, 'Matriz', 'Campus Ixmiquilpan', 'Marco Antonio Ocadiz Cruz', 'aocadiz@utvm.edu.mx', '123456789', '987654321', '2021-06-04', 1),
(3, 3, 'Matriz', 'Edificio Principal', 'María Teresa Arroyo Rojas', 'informes@ioriente.edu.mx', '2222450100', '2221411350', '2021-06-04', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mantenimiento`
--

CREATE TABLE `mantenimiento` (
  `idMantenimiento` int(10) UNSIGNED NOT NULL,
  `Pedestal_Acceso_idAcceso` int(10) UNSIGNED NOT NULL,
  `Pedestal_Acceso_Filial_Cliente_idCliente` int(10) UNSIGNED NOT NULL,
  `Pedestal_Acceso_Filial_idFilial` int(10) UNSIGNED NOT NULL,
  `Pedestal_idPedestal` int(10) UNSIGNED NOT NULL,
  `TipoMantenimiento` varchar(45) DEFAULT NULL,
  `StatusMantenimiento` varchar(30) DEFAULT NULL,
  `Reponsable` varchar(80) DEFAULT NULL,
  `Descripcion` text DEFAULT NULL,
  `FechaInicio` date DEFAULT NULL,
  `FechaFin` date DEFAULT NULL,
  `PersonalMantenimiento` varchar(80) DEFAULT NULL,
  `ReporteMantenimiento` blob DEFAULT NULL
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
(5, 1, 1, 2, '005', 'HG05', 'Hibrido', '2021-06-04', NULL, NULL, 1),
(6, 2, 2, 3, '006', 'HG06', 'Hibrido', '2021-06-04', NULL, NULL, 1),
(7, 2, 2, 4, '007', 'HG07', 'Hibrido', '2021-06-04', NULL, NULL, 1),
(8, 3, 3, 5, '008', 'HG08', 'Hibrido', '2021-06-04', NULL, NULL, 1),
(9, 3, 3, 6, '009', 'HG09', 'Hibrido', '2021-06-04', NULL, NULL, 1),
(10, 3, 3, 7, '010', 'HG10', 'Hibrido', '2021-06-04', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Indices de la tabla `administradorcliente`
--
ALTER TABLE `administradorcliente`
  ADD PRIMARY KEY (`idAdministrador`,`Filial_Cliente_idCliente`,`Filial_idFilial`),
  ADD KEY `AdministradorHeimdall_FKIndex1` (`Filial_idFilial`,`Filial_Cliente_idCliente`);

--
-- Indices de la tabla `administradorheimdall`
--
ALTER TABLE `administradorheimdall`
  ADD PRIMARY KEY (`idAdministradorHeimdall`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `componente`
--
ALTER TABLE `componente`
  ADD PRIMARY KEY (`idComponente`,`Pedestal_Acceso_idAcceso`,`Pedestal_Acceso_Filial_Cliente_idCliente`,`Pedestal_Acceso_Filial_idFilial`,`Pedestal_idPedestal`),
  ADD KEY `Componente_FKIndex1` (`Pedestal_idPedestal`,`Pedestal_Acceso_Filial_idFilial`,`Pedestal_Acceso_Filial_Cliente_idCliente`,`Pedestal_Acceso_idAcceso`);

--
-- Indices de la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD PRIMARY KEY (`idContrato`,`Cliente_idCliente`),
  ADD KEY `Contrato_FKIndex1` (`Cliente_idCliente`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`idDireccion`,`Filial_Cliente_idCliente`,`Filial_idFilial`),
  ADD KEY `Direccion_FKIndex1` (`Filial_idFilial`,`Filial_Cliente_idCliente`);

--
-- Indices de la tabla `filial`
--
ALTER TABLE `filial`
  ADD PRIMARY KEY (`idFilial`,`Cliente_idCliente`),
  ADD KEY `Filial_FKIndex1` (`Cliente_idCliente`);

--
-- Indices de la tabla `mantenimiento`
--
ALTER TABLE `mantenimiento`
  ADD PRIMARY KEY (`idMantenimiento`,`Pedestal_Acceso_idAcceso`,`Pedestal_Acceso_Filial_Cliente_idCliente`,`Pedestal_Acceso_Filial_idFilial`,`Pedestal_idPedestal`),
  ADD KEY `Mantenimiento_FKIndex1` (`Pedestal_idPedestal`,`Pedestal_Acceso_Filial_idFilial`,`Pedestal_Acceso_Filial_Cliente_idCliente`,`Pedestal_Acceso_idAcceso`);

--
-- Indices de la tabla `pedestal`
--
ALTER TABLE `pedestal`
  ADD PRIMARY KEY (`idPedestal`,`Acceso_Filial_idFilial`,`Acceso_Filial_Cliente_idCliente`,`Acceso_idAcceso`),
  ADD KEY `Pedestal_FKIndex1` (`Acceso_idAcceso`,`Acceso_Filial_Cliente_idCliente`,`Acceso_Filial_idFilial`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acceso`
--
ALTER TABLE `acceso`
  MODIFY `idAcceso` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `administradorcliente`
--
ALTER TABLE `administradorcliente`
  MODIFY `idAdministrador` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `administradorheimdall`
--
ALTER TABLE `administradorheimdall`
  MODIFY `idAdministradorHeimdall` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `contrato`
--
ALTER TABLE `contrato`
  MODIFY `idContrato` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `idDireccion` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `filial`
--
ALTER TABLE `filial`
  MODIFY `idFilial` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `mantenimiento`
--
ALTER TABLE `mantenimiento`
  MODIFY `idMantenimiento` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedestal`
--
ALTER TABLE `pedestal`
  MODIFY `idPedestal` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acceso`
--
ALTER TABLE `acceso`
  ADD CONSTRAINT `acceso_ibfk_1` FOREIGN KEY (`Filial_idFilial`,`Filial_Cliente_idCliente`) REFERENCES `filial` (`idFilial`, `Cliente_idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `administradorcliente`
--
ALTER TABLE `administradorcliente`
  ADD CONSTRAINT `administradorcliente_ibfk_1` FOREIGN KEY (`Filial_idFilial`,`Filial_Cliente_idCliente`) REFERENCES `filial` (`idFilial`, `Cliente_idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `componente`
--
ALTER TABLE `componente`
  ADD CONSTRAINT `componente_ibfk_1` FOREIGN KEY (`Pedestal_idPedestal`,`Pedestal_Acceso_Filial_idFilial`,`Pedestal_Acceso_Filial_Cliente_idCliente`,`Pedestal_Acceso_idAcceso`) REFERENCES `pedestal` (`idPedestal`, `Acceso_Filial_idFilial`, `Acceso_Filial_Cliente_idCliente`, `Acceso_idAcceso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD CONSTRAINT `contrato_ibfk_1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD CONSTRAINT `direccion_ibfk_1` FOREIGN KEY (`Filial_idFilial`,`Filial_Cliente_idCliente`) REFERENCES `filial` (`idFilial`, `Cliente_idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `filial`
--
ALTER TABLE `filial`
  ADD CONSTRAINT `filial_ibfk_1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `mantenimiento`
--
ALTER TABLE `mantenimiento`
  ADD CONSTRAINT `mantenimiento_ibfk_1` FOREIGN KEY (`Pedestal_idPedestal`,`Pedestal_Acceso_Filial_idFilial`,`Pedestal_Acceso_Filial_Cliente_idCliente`,`Pedestal_Acceso_idAcceso`) REFERENCES `pedestal` (`idPedestal`, `Acceso_Filial_idFilial`, `Acceso_Filial_Cliente_idCliente`, `Acceso_idAcceso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedestal`
--
ALTER TABLE `pedestal`
  ADD CONSTRAINT `pedestal_ibfk_1` FOREIGN KEY (`Acceso_idAcceso`,`Acceso_Filial_Cliente_idCliente`,`Acceso_Filial_idFilial`) REFERENCES `acceso` (`idAcceso`, `Filial_Cliente_idCliente`, `Filial_idFilial`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
