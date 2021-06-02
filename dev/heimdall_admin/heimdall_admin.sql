-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-06-2021 a las 17:30:44
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
-- Base de datos: `heimdall_admin`
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administradorheimdall`
--

CREATE TABLE `administradorheimdall` (
  `idAdministrador` int(10) UNSIGNED NOT NULL,
  `Grupo_idGrupo` int(10) UNSIGNED NOT NULL,
  `TipoAdministrador` varchar(45) DEFAULT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `ApellidorP` varchar(100) DEFAULT NULL,
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `idGrupo` int(10) UNSIGNED NOT NULL,
  `NombreGrupo` varchar(50) DEFAULT NULL,
  `Descripcion` text DEFAULT NULL,
  `StatusGrupo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Estructura de tabla para la tabla `moduloheimdall`
--

CREATE TABLE `moduloheimdall` (
  `idModuloHeimdall` int(10) UNSIGNED NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `UrlModulo` varchar(255) DEFAULT NULL,
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
  `ModuloHeimdall_idModuloHeimdall` int(10) UNSIGNED NOT NULL
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
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acceso`
--
ALTER TABLE `acceso`
  ADD PRIMARY KEY (`idAcceso`,`Filial_Cliente_idCliente`,`Filial_idFilial`),
  ADD KEY `Acceso_FKIndex1` (`Filial_idFilial`,`Filial_Cliente_idCliente`);

--
-- Indices de la tabla `administradorheimdall`
--
ALTER TABLE `administradorheimdall`
  ADD PRIMARY KEY (`idAdministrador`,`Grupo_idGrupo`),
  ADD KEY `Administrador_FKIndex2` (`Grupo_idGrupo`);

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
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`idGrupo`);

--
-- Indices de la tabla `mantenimiento`
--
ALTER TABLE `mantenimiento`
  ADD PRIMARY KEY (`idMantenimiento`,`Pedestal_Acceso_idAcceso`,`Pedestal_Acceso_Filial_Cliente_idCliente`,`Pedestal_Acceso_Filial_idFilial`,`Pedestal_idPedestal`),
  ADD KEY `Mantenimiento_FKIndex1` (`Pedestal_idPedestal`,`Pedestal_Acceso_Filial_idFilial`,`Pedestal_Acceso_Filial_Cliente_idCliente`,`Pedestal_Acceso_idAcceso`);

--
-- Indices de la tabla `moduloheimdall`
--
ALTER TABLE `moduloheimdall`
  ADD PRIMARY KEY (`idModuloHeimdall`);

--
-- Indices de la tabla `moduloheimdall_has_grupo`
--
ALTER TABLE `moduloheimdall_has_grupo`
  ADD PRIMARY KEY (`Grupo_idGrupo`,`ModuloHeimdall_idModuloHeimdall`),
  ADD KEY `ModuloHeimdall_has_Grupo_FKIndex1` (`Grupo_idGrupo`),
  ADD KEY `ModuloHeimdall_has_Grupo_FKIndex2` (`ModuloHeimdall_idModuloHeimdall`);

--
-- Indices de la tabla `pedestal`
--
ALTER TABLE `pedestal`
  ADD PRIMARY KEY (`idPedestal`,`Acceso_Filial_idFilial`,`Acceso_Filial_Cliente_idCliente`,`Acceso_idAcceso`),
  ADD KEY `Pedestal_FKIndex1` (`Acceso_idAcceso`,`Acceso_Filial_Cliente_idCliente`,`Acceso_Filial_idFilial`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acceso`
--
ALTER TABLE `acceso`
  MODIFY `idAcceso` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `administradorheimdall`
--
ALTER TABLE `administradorheimdall`
  MODIFY `idAdministrador` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `idDireccion` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT de la tabla `mantenimiento`
--
ALTER TABLE `mantenimiento`
  MODIFY `idMantenimiento` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acceso`
--
ALTER TABLE `acceso`
  ADD CONSTRAINT `acceso_ibfk_1` FOREIGN KEY (`Filial_idFilial`,`Filial_Cliente_idCliente`) REFERENCES `filial` (`idFilial`, `Cliente_idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `administradorheimdall`
--
ALTER TABLE `administradorheimdall`
  ADD CONSTRAINT `administradorheimdall_ibfk_1` FOREIGN KEY (`Grupo_idGrupo`) REFERENCES `grupo` (`idGrupo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `componente`
--
ALTER TABLE `componente`
  ADD CONSTRAINT `componente_ibfk_1` FOREIGN KEY (`Pedestal_idPedestal`,`Pedestal_Acceso_Filial_idFilial`,`Pedestal_Acceso_Filial_Cliente_idCliente`,`Pedestal_Acceso_idAcceso`) REFERENCES `pedestal` (`idPedestal`, `Acceso_Filial_idFilial`, `Acceso_Filial_Cliente_idCliente`, `Acceso_idAcceso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
-- Filtros para la tabla `moduloheimdall_has_grupo`
--
ALTER TABLE `moduloheimdall_has_grupo`
  ADD CONSTRAINT `moduloheimdall_has_grupo_ibfk_1` FOREIGN KEY (`Grupo_idGrupo`) REFERENCES `grupo` (`idGrupo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `moduloheimdall_has_grupo_ibfk_2` FOREIGN KEY (`ModuloHeimdall_idModuloHeimdall`) REFERENCES `moduloheimdall` (`idModuloHeimdall`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedestal`
--
ALTER TABLE `pedestal`
  ADD CONSTRAINT `pedestal_ibfk_1` FOREIGN KEY (`Acceso_idAcceso`,`Acceso_Filial_Cliente_idCliente`,`Acceso_Filial_idFilial`) REFERENCES `acceso` (`idAcceso`, `Filial_Cliente_idCliente`, `Filial_idFilial`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
