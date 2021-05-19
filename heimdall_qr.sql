-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-03-2021 a las 16:48:35
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
-- Base de datos: `heimdall_qr`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acceso`
--

CREATE TABLE `acceso` (
  `idAcceso` int(10) UNSIGNED NOT NULL,
  `Campus_Cliente_idCliente` int(10) UNSIGNED NOT NULL,
  `Campus_idCampus` int(10) UNSIGNED NOT NULL,
  `idCampus` int(10) UNSIGNED DEFAULT NULL,
  `Nombre` char(20) NOT NULL,
  `Ubicacion` char(40) NOT NULL,
  `Descripcion` text DEFAULT NULL,
  `Indefinido1` text DEFAULT NULL,
  `Indefinido2` text DEFAULT NULL,
  `Estado` tinyint(1) DEFAULT NULL,
  `FechaCreacion` timestamp NULL DEFAULT NULL,
  `FechaActualizacion` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `acceso`
--

INSERT INTO `acceso` (`idAcceso`, `Campus_Cliente_idCliente`, `Campus_idCampus`, `idCampus`, `Nombre`, `Ubicacion`, `Descripcion`, `Indefinido1`, `Indefinido2`, `Estado`, `FechaCreacion`, `FechaActualizacion`) VALUES
(1, 1, 1, NULL, 'Entrada Principal', 'Acceso principal por calle Rio Salado', 'Alumnos | Padres de Familia', NULL, NULL, NULL, NULL, NULL),
(2, 1, 1, NULL, 'Acceso Secundario', 'Salida principal por calle Rio Verde', 'Empleados | Profesores', NULL, NULL, NULL, NULL, NULL),
(3, 1, 1, NULL, 'Estacionamiento', 'Sobre Circuito Exterior', 'Administrativos', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accesogrupo`
--

CREATE TABLE `accesogrupo` (
  `idAccesoGrupo` int(10) UNSIGNED NOT NULL,
  `GrupoUsuario_idGrupoUsuario` int(11) NOT NULL,
  `AdminUsuarios` tinyint(1) DEFAULT NULL,
  `AdminCredenciales` tinyint(1) DEFAULT NULL,
  `AAdminPedestales` tinyint(1) DEFAULT NULL,
  `AAdminMantenimiento` tinyint(1) DEFAULT NULL,
  `MonitoreoGeneral` tinyint(1) DEFAULT NULL,
  `MonitoreoGrupo` tinyint(1) DEFAULT NULL,
  `MonitoreoUsuario` tinyint(1) DEFAULT NULL,
  `Reportes` tinyint(1) DEFAULT NULL,
  `AAdminCliente` tinyint(1) DEFAULT NULL,
  `NombreGrupo` char(40) DEFAULT NULL,
  `idGrupoUsuario` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campus`
--

CREATE TABLE `campus` (
  `idCampus` int(10) UNSIGNED NOT NULL,
  `Cliente_idCliente` int(10) UNSIGNED NOT NULL,
  `idCliente` int(10) UNSIGNED DEFAULT NULL,
  `idDireccion` int(10) UNSIGNED DEFAULT NULL,
  `Nombre` text NOT NULL,
  `Correo` text NOT NULL,
  `Telefono1` char(10) NOT NULL,
  `Telefono2` char(10) DEFAULT NULL,
  `FechaAlta` date NOT NULL,
  `Responsable` text NOT NULL,
  `Tipo` tinytext NOT NULL,
  `Indefinido1` text DEFAULT NULL,
  `Indefinido2` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `campus`
--

INSERT INTO `campus` (`idCampus`, `Cliente_idCliente`, `idCliente`, `idDireccion`, `Nombre`, `Correo`, `Telefono1`, `Telefono2`, `FechaAlta`, `Responsable`, `Tipo`, `Indefinido1`, `Indefinido2`) VALUES
(1, 1, NULL, NULL, 'Edificio Principal', 'informes@ioriente.edu.mx', '2222450100', '2221411350', '2020-10-14', 'María Teresa Arroyo Rojas', 'Matriz', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(10) UNSIGNED NOT NULL,
  `Nombre` text NOT NULL,
  `RFC` tinytext NOT NULL,
  `NombreAdmin` text NOT NULL,
  `TelefonoAdmin` tinytext NOT NULL,
  `FechaAlta` date NOT NULL,
  `Correo` text DEFAULT NULL,
  `Indefinido1` text DEFAULT NULL,
  `Indefinido2` text DEFAULT NULL,
  `Indefinido3` text DEFAULT NULL,
  `Indefinido4` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `Nombre`, `RFC`, `NombreAdmin`, `TelefonoAdmin`, `FechaAlta`, `Correo`, `Indefinido1`, `Indefinido2`, `Indefinido3`, `Indefinido4`) VALUES
(1, 'Instituto Oriente', 'IOP891006QF0', 'Enrique Flota Ocampo', '2222450100', '2020-10-14', 'informes@ioriente.edu.mx', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `credencial`
--

CREATE TABLE `credencial` (
  `idCredencial` int(10) UNSIGNED NOT NULL,
  `Usuario_idUsuario` int(11) NOT NULL,
  `Usuario_GrupoUsuario_idGrupoUsuario` int(11) NOT NULL,
  `Usuario_Cliente_idCliente` int(10) UNSIGNED NOT NULL,
  `idUsuario` int(10) UNSIGNED DEFAULT NULL,
  `Codigo` char(128) DEFAULT NULL,
  `Tipo` char(20) DEFAULT NULL,
  `Estatus` tinyint(1) DEFAULT NULL,
  `FechaEmision` timestamp NULL DEFAULT NULL,
  `FechaCancelacion` date DEFAULT NULL,
  `Vigencia` date DEFAULT NULL,
  `Asignacion` tinyint(1) DEFAULT NULL,
  `Indefinido1` text DEFAULT NULL,
  `Indefinido2` text DEFAULT NULL,
  `FechaActualizacion` timestamp NULL DEFAULT NULL,
  `QRData` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `credencial`
--

INSERT INTO `credencial` (`idCredencial`, `Usuario_idUsuario`, `Usuario_GrupoUsuario_idGrupoUsuario`, `Usuario_Cliente_idCliente`, `idUsuario`, `Codigo`, `Tipo`, `Estatus`, `FechaEmision`, `FechaCancelacion`, `Vigencia`, `Asignacion`, `Indefinido1`, `Indefinido2`, `FechaActualizacion`, `QRData`) VALUES
(26, 1, 2, 1, NULL, '2310010011', 'QR', 1, '2021-01-21 23:14:47', NULL, '2030-12-12', NULL, NULL, NULL, NULL, 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414851414141423043415941414142556d68596e41414141416b6c4551565234416577616674494141414c5853555242564f33425161376a5341774677587945376e2f6c6e4c2f6b716742427371644e4d434c2b595931527246474b4e55717852696e574b4d55617056696a46477555596f31537246474b4e55717852696e574b4d55617056696a46477555693465533845307164795368552b6d53304b6c305366676d6c53654b4e55717852696e574b42637655336c54456b3653304b6c386b7371626b76436d596f31537246474b4e6372466879586844705537564a35516553494a64366838557246474b64596f7852726c5970676b64437064456b3555666c6d7852696e574b4d556135654c484a614654365a4c517158524a6d4b52596f7852726c474b4e637646684b702b6b306958686d31542b4a6355617056696a464775556935636c345a7553304b6c30535868544576356c7852716c574b4d5561355434683847536349664b4c7976574b4d55617056696a584479556845366c53304b6e30695768552b6d53304b6e636f64496c6f564e3549676d64796b6b534f70553346577555596f3153724645752f6d63714a796f6e536268443559346b644371645370654554715654365a4c51715478527246474b4e55717852726c34575249366c536553304b6d63714e79526845366c557a6c4a517166534a654762696a564b735559703169675844366e636b595137564a354951716653715a776b6f565070564c6f6b64437064456a3670574b4d55613552696a584c7859556d345136564c517164796b6f524f3553514a6e636f645365685575695363714c7970574b4d55613552696a524c2f384d4f533849524b6c34524f7055744370334a48456a71564e7856726c474b4e557178524c68354b776a6570644370644574365568436553304b6c38557246474b64596f7852726c346d5571623072434579706445726f6b6e4b683053656953634b4c534a65464535596c696a564b7355596f31797357484a65454f6c547553304b6e636f64496c6f5576436963704a456a71564c676c764b74596f7852716c574b4e632f4469564c676d64537164796f74496c3459346b64437064456a71564e7856726c474b4e557178524c6e3563456a71564f354c51715851714a306b3453554b6e3069576855336d69574b4d55613552696a584c785953716670504b45796b6b53546c53364a4851714a7970764b74596f7852716c574b4e637643774a333553455471564c517166534a6146544f5648706b6e43536845366c53304b6e386b537852696e574b4d55614a6635686a56477355596f31537246474b64596f7852716c574b4d55613552696a564b7355596f31537246474b64596f7852716c574b4d556135542f414f306f4c6577614c65466d4141414141456c46546b5375516d4343),
(49, 2, 2, 1, NULL, '166642347', 'QR', 1, '2021-01-30 01:10:04', NULL, '2030-12-12', NULL, NULL, NULL, NULL, 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141414851414141423043415941414142556d68596e41414141416b6c4551565234416577616674494141414b7853555242564f33425157376b51417745775378432f2f3979726f38384e5342494d3273546a49672f57474d55613552696a564b7355596f31537246474b64596f7852716c574b4d55613552696a564b7355596f31537246474b64596f7852726c3471456b664a504b53524b65554f6d5338453071547852726c474b4e557178524c6c366d3871596b664a4c4b4853707653734b62696a564b7355597031696758483561454f31547553454b6e306958684a416d647968314a7545506c6b346f31537246474b64596f46384f7064456e6f5643597031696a46477156596f31774d6c3453544a48517166316d7852696e574b4d556135654c44564c34704353637158524b6555506c4e696a564b73555970316967584c3076432f3654534a65464e53666a4e696a564b735559703169675844366e384a556d34512b55764b64596f7852716c574b4e63504a53455471564c777074554f705575435a334b53524a4f6b76416d6c55387131696a46477156596f317738704e496c3455546c4a416d645370654554715654655a4e4b6c34524f35596b6b6443705046477555596f315372464575486b72436963704a456a71564c676c504a4f46457055744370394b7064456e6f56453653304b6d387156696a46477555596f31793857564a3646524f56453653304b6d63714a796f6e4354686a6952304b6c30534f70556e696a564b73555970316967584c3150706b74437064456d34512b556b4353644a364653364a4851716e557158684e2b6b574b4d55613552696a524a2f3849636c3455536c533849544b72395a7355597031696a464769582b3449456b664a504b48556e6f564c6f6b64437064456b3555756954636f664b6d596f31537246474b4e637246793154656c4953544a4851716e557158684a4d6b6e4b67386f64496c6f564e356f6c696a46477555596f31793857464a7545506c695352304b70314b6c34524f3553514a6e636f544b6d387131696a46477156596f31797356366e38543855617056696a46477555692b4753634b4c534a614654365653364a4a796f66464f7852696e574b4d556135654c445644354a705576436963714a796b6b53546c53364a4a796f764b6c596f7852726c474b4e637647794a487854456a71566b7952304b6c30534f70564f7055764348537166564b7852696a564b7355614a5031686a46477555596f31537246474b4e55717852696e574b4d55617056696a46477555596f31537246474b4e55717852696e574b4d55613552394b6e42586a46463241315141414141424a52553545726b4a6767673d3d);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `idDireccion` int(10) UNSIGNED NOT NULL,
  `Campus_Cliente_idCliente` int(10) UNSIGNED NOT NULL,
  `Campus_idCampus` int(10) UNSIGNED NOT NULL,
  `idCampus` int(10) UNSIGNED NOT NULL,
  `Calle` text NOT NULL,
  `NumeroInterior` tinytext DEFAULT NULL,
  `NumeroExterior` tinytext DEFAULT NULL,
  `Colonia` text NOT NULL,
  `CP` decimal(10,0) NOT NULL,
  `Estado` text NOT NULL,
  `Pais` text NOT NULL,
  `Municipio` text DEFAULT NULL,
  `Ciudad` text DEFAULT NULL,
  `Latitud` varchar(20) NOT NULL,
  `Longitud` varchar(20) NOT NULL,
  `Indefinido1` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`idDireccion`, `Campus_Cliente_idCliente`, `Campus_idCampus`, `idCampus`, `Calle`, `NumeroInterior`, `NumeroExterior`, `Colonia`, `CP`, `Estado`, `Pais`, `Municipio`, `Ciudad`, `Latitud`, `Longitud`, `Indefinido1`) VALUES
(1, 1, 1, 0, 'Av. San Francisco ', '1401 ', NULL, 'Jardines de San Manuel ', '72570', 'Puebla', 'México', NULL, 'Puebla', '19.010762', '-98.201703', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupousuario`
--

CREATE TABLE `grupousuario` (
  `idGrupoUsuario` int(11) NOT NULL,
  `idAccesoGrupo` int(10) UNSIGNED DEFAULT NULL,
  `NombreGrupo` char(40) DEFAULT NULL,
  `Descripcion` text DEFAULT NULL,
  `Estado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `grupousuario`
--

INSERT INTO `grupousuario` (`idGrupoUsuario`, `idAccesoGrupo`, `NombreGrupo`, `Descripcion`, `Estado`) VALUES
(1, NULL, 'Administrador', '', 1),
(2, NULL, 'Alumno', NULL, 1),
(3, NULL, 'Empleado', NULL, 1),
(4, NULL, 'Proveedor', NULL, 1),
(5, NULL, 'Invitado', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lectura`
--

CREATE TABLE `lectura` (
  `idLectura` int(10) UNSIGNED NOT NULL,
  `Pedestal_idPedestal` int(10) UNSIGNED NOT NULL,
  `Pedestal_Acceso_idAcceso` int(10) UNSIGNED NOT NULL,
  `Pedestal_Acceso_Campus_Cliente_idCliente` int(10) UNSIGNED NOT NULL,
  `Pedestal_Acceso_Campus_idCampus` int(10) UNSIGNED NOT NULL,
  `CodigoCredencial` char(128) DEFAULT NULL,
  `ImagenTermica` blob DEFAULT NULL,
  `TemperaturaAmbiente` float DEFAULT NULL,
  `ValorTemp` float DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `TiempoLectura` timestamp NULL DEFAULT NULL,
  `Hora` time DEFAULT NULL,
  `Asignado` tinyint(1) DEFAULT NULL,
  `Indefinido1` varchar(80) DEFAULT NULL,
  `Indefinido2` text DEFAULT NULL,
  `Indefinido3` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `lectura`
--

INSERT INTO `lectura` (`idLectura`, `Pedestal_idPedestal`, `Pedestal_Acceso_idAcceso`, `Pedestal_Acceso_Campus_Cliente_idCliente`, `Pedestal_Acceso_Campus_idCampus`, `CodigoCredencial`, `ImagenTermica`, `TemperaturaAmbiente`, `ValorTemp`, `Fecha`, `TiempoLectura`, `Hora`, `Asignado`, `Indefinido1`, `Indefinido2`, `Indefinido3`) VALUES
(1, 1, 1, 1, 1, '2310010011', NULL, 26.6, 35.4, '2021-01-21', '2021-01-21 23:44:20', '17:44:20', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `idLogin` int(10) UNSIGNED NOT NULL,
  `Usuario_GrupoUsuario_idGrupoUsuario` int(11) NOT NULL,
  `Usuario_idUsuario` int(11) NOT NULL,
  `Usuario_Cliente_idCliente` int(10) UNSIGNED NOT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `Password_2` char(255) DEFAULT NULL,
  `idUsuario` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedestal`
--

CREATE TABLE `pedestal` (
  `idPedestal` int(10) UNSIGNED NOT NULL,
  `Acceso_Campus_idCampus` int(10) UNSIGNED NOT NULL,
  `Acceso_Campus_Cliente_idCliente` int(10) UNSIGNED NOT NULL,
  `Acceso_idAcceso` int(10) UNSIGNED NOT NULL,
  `idAcceso` int(10) UNSIGNED DEFAULT NULL,
  `noAsset` char(20) DEFAULT NULL,
  `codigoInterno` char(20) DEFAULT NULL,
  `NumeroSerie` char(40) NOT NULL,
  `Configuracion` char(20) NOT NULL,
  `StatusPedestal` tinyint(1) NOT NULL,
  `FechaUltimoMantenimiento` date DEFAULT NULL,
  `FechaProximoMantenimiento` date DEFAULT NULL,
  `Observaciones` char(80) DEFAULT NULL,
  `Actualizacion` timestamp NULL DEFAULT NULL,
  `EntradaSalida` tinyint(1) DEFAULT NULL,
  `Indefinido2` text DEFAULT NULL,
  `Indefinido3` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedestal`
--

INSERT INTO `pedestal` (`idPedestal`, `Acceso_Campus_idCampus`, `Acceso_Campus_Cliente_idCliente`, `Acceso_idAcceso`, `idAcceso`, `noAsset`, `codigoInterno`, `NumeroSerie`, `Configuracion`, `StatusPedestal`, `FechaUltimoMantenimiento`, `FechaProximoMantenimiento`, `Observaciones`, `Actualizacion`, `EntradaSalida`, `Indefinido2`, `Indefinido3`) VALUES
(1, 1, 1, 1, NULL, NULL, NULL, 'PED01', 'Hibrido', 1, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(2, 1, 1, 1, NULL, NULL, NULL, 'PED02', 'Temperatura', 1, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(3, 1, 1, 2, NULL, NULL, NULL, 'PED03', 'Hibrido', 1, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(4, 1, 1, 3, NULL, NULL, NULL, 'PED04', 'Hibrido', 0, NULL, NULL, NULL, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('hdIGC3N7oFdtzApLSuMYtzRz72qC8anV', 1614382054, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('jgWAbclJ9U0TUEBVlXZE58OVu1N_jsfd', 1615663515, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `GrupoUsuario_idGrupoUsuario` int(11) NOT NULL,
  `Cliente_idCliente` int(10) UNSIGNED NOT NULL,
  `idCliente` int(10) UNSIGNED DEFAULT NULL,
  `idGrupoUsuario` int(10) UNSIGNED DEFAULT NULL,
  `Nombre` char(80) NOT NULL,
  `Apellidos` varchar(100) NOT NULL,
  `Genero` char(10) DEFAULT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `Curp` char(18) DEFAULT NULL,
  `Correo` char(120) DEFAULT NULL,
  `Telefono` varchar(10) DEFAULT NULL,
  `NSS` char(11) DEFAULT NULL,
  `Matricula` char(35) DEFAULT NULL,
  `NoInterno` char(35) DEFAULT NULL,
  `Turno` char(20) DEFAULT NULL,
  `Area` char(40) DEFAULT NULL,
  `Departamento` char(80) DEFAULT NULL,
  `Salon` varchar(80) DEFAULT NULL,
  `Grupo` varchar(80) DEFAULT NULL,
  `Grado` varchar(50) DEFAULT NULL,
  `Cargo` varchar(50) DEFAULT NULL,
  `Empresa` varchar(80) DEFAULT NULL,
  `Asunto` varchar(80) DEFAULT NULL,
  `Escolaridad` varchar(80) DEFAULT NULL,
  `Carrera` varchar(120) DEFAULT NULL,
  `FechaAlta` date DEFAULT NULL,
  `CodTemp` varchar(80) DEFAULT NULL,
  `Indefinido2` text DEFAULT NULL,
  `Indefinido3` text DEFAULT NULL,
  `Indefinido4` varchar(80) DEFAULT NULL,
  `NoSemestre` varchar(120) DEFAULT NULL,
  `NoCuatrimestre` varchar(120) DEFAULT NULL,
  `Imagen` varchar(255) DEFAULT NULL,
  `FechaCreacion` timestamp NULL DEFAULT NULL,
  `FechaActualizacion` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `GrupoUsuario_idGrupoUsuario`, `Cliente_idCliente`, `idCliente`, `idGrupoUsuario`, `Nombre`, `Apellidos`, `Genero`, `FechaNacimiento`, `Curp`, `Correo`, `Telefono`, `NSS`, `Matricula`, `NoInterno`, `Turno`, `Area`, `Departamento`, `Salon`, `Grupo`, `Grado`, `Cargo`, `Empresa`, `Asunto`, `Escolaridad`, `Carrera`, `FechaAlta`, `CodTemp`, `Indefinido2`, `Indefinido3`, `Indefinido4`, `NoSemestre`, `NoCuatrimestre`, `Imagen`, `FechaCreacion`, `FechaActualizacion`) VALUES
(1, 2, 1, NULL, NULL, 'Roberto Isaac', 'Suaste Martínez', 'Masculino', '1987-08-13', 'SUMR870813HDFSRB', 'isaac@aira.mx', '5543654766', NULL, '2310010011', NULL, 'Matutino', NULL, NULL, '', '', '', NULL, NULL, NULL, 'Maestria', 'Diseño Industrial', NULL, '2310010011', NULL, NULL, NULL, '', '10', '/assets/img/uploads/1610751368176.jpg', '2021-01-15 22:56:08', NULL),
(2, 2, 1, NULL, NULL, 'Aura Silvia', 'Martinez Ortiz de Echavarria', 'Femenino', '1989-04-07', 'AUSMO159JBS4569', 'agrosh7@gmail.com', '5520461771', NULL, '166642347', NULL, 'Vespertino', NULL, NULL, '', '', '', NULL, NULL, NULL, 'Maestria', 'Diseño Industrial', NULL, '166642347', NULL, NULL, NULL, '', '8', '/assets/img/uploads/1610764161245.jpg', '2021-01-16 02:29:21', '2021-01-16 02:30:30');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acceso`
--
ALTER TABLE `acceso`
  ADD PRIMARY KEY (`idAcceso`,`Campus_Cliente_idCliente`,`Campus_idCampus`),
  ADD KEY `Acceso_FKIndex1` (`Campus_idCampus`,`Campus_Cliente_idCliente`);

--
-- Indices de la tabla `accesogrupo`
--
ALTER TABLE `accesogrupo`
  ADD PRIMARY KEY (`idAccesoGrupo`,`GrupoUsuario_idGrupoUsuario`),
  ADD KEY `AccesoGrupo_FKIndex1` (`GrupoUsuario_idGrupoUsuario`);

--
-- Indices de la tabla `campus`
--
ALTER TABLE `campus`
  ADD PRIMARY KEY (`idCampus`,`Cliente_idCliente`),
  ADD KEY `Campus_FKIndex1` (`Cliente_idCliente`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `credencial`
--
ALTER TABLE `credencial`
  ADD PRIMARY KEY (`idCredencial`,`Usuario_idUsuario`,`Usuario_GrupoUsuario_idGrupoUsuario`,`Usuario_Cliente_idCliente`),
  ADD KEY `Credencial_FKIndex1` (`Usuario_idUsuario`,`Usuario_GrupoUsuario_idGrupoUsuario`,`Usuario_Cliente_idCliente`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`idDireccion`,`Campus_Cliente_idCliente`,`Campus_idCampus`),
  ADD KEY `Direccion_FKIndex1` (`Campus_idCampus`,`Campus_Cliente_idCliente`);

--
-- Indices de la tabla `grupousuario`
--
ALTER TABLE `grupousuario`
  ADD PRIMARY KEY (`idGrupoUsuario`);

--
-- Indices de la tabla `lectura`
--
ALTER TABLE `lectura`
  ADD PRIMARY KEY (`idLectura`,`Pedestal_idPedestal`,`Pedestal_Acceso_idAcceso`,`Pedestal_Acceso_Campus_Cliente_idCliente`,`Pedestal_Acceso_Campus_idCampus`),
  ADD KEY `Lectura_FKIndex1` (`Pedestal_idPedestal`,`Pedestal_Acceso_Campus_idCampus`,`Pedestal_Acceso_Campus_Cliente_idCliente`,`Pedestal_Acceso_idAcceso`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`idLogin`,`Usuario_GrupoUsuario_idGrupoUsuario`,`Usuario_idUsuario`,`Usuario_Cliente_idCliente`),
  ADD KEY `Login_FKIndex1` (`Usuario_idUsuario`,`Usuario_GrupoUsuario_idGrupoUsuario`,`Usuario_Cliente_idCliente`);

--
-- Indices de la tabla `pedestal`
--
ALTER TABLE `pedestal`
  ADD PRIMARY KEY (`idPedestal`,`Acceso_Campus_idCampus`,`Acceso_Campus_Cliente_idCliente`,`Acceso_idAcceso`),
  ADD KEY `Pedestal_FKIndex1` (`Acceso_idAcceso`,`Acceso_Campus_Cliente_idCliente`,`Acceso_Campus_idCampus`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`,`GrupoUsuario_idGrupoUsuario`,`Cliente_idCliente`),
  ADD KEY `Usuario_FKIndex2` (`GrupoUsuario_idGrupoUsuario`),
  ADD KEY `Usuario_FKIndex1` (`Cliente_idCliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acceso`
--
ALTER TABLE `acceso`
  MODIFY `idAcceso` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `accesogrupo`
--
ALTER TABLE `accesogrupo`
  MODIFY `idAccesoGrupo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `campus`
--
ALTER TABLE `campus`
  MODIFY `idCampus` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `credencial`
--
ALTER TABLE `credencial`
  MODIFY `idCredencial` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `idDireccion` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `grupousuario`
--
ALTER TABLE `grupousuario`
  MODIFY `idGrupoUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `lectura`
--
ALTER TABLE `lectura`
  MODIFY `idLectura` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `idLogin` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedestal`
--
ALTER TABLE `pedestal`
  MODIFY `idPedestal` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acceso`
--
ALTER TABLE `acceso`
  ADD CONSTRAINT `acceso_ibfk_1` FOREIGN KEY (`Campus_idCampus`,`Campus_Cliente_idCliente`) REFERENCES `campus` (`idCampus`, `Cliente_idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `accesogrupo`
--
ALTER TABLE `accesogrupo`
  ADD CONSTRAINT `accesogrupo_ibfk_1` FOREIGN KEY (`GrupoUsuario_idGrupoUsuario`) REFERENCES `grupousuario` (`idGrupoUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `campus`
--
ALTER TABLE `campus`
  ADD CONSTRAINT `campus_ibfk_1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `credencial`
--
ALTER TABLE `credencial`
  ADD CONSTRAINT `credencial_ibfk_1` FOREIGN KEY (`Usuario_idUsuario`,`Usuario_GrupoUsuario_idGrupoUsuario`,`Usuario_Cliente_idCliente`) REFERENCES `usuario` (`idUsuario`, `GrupoUsuario_idGrupoUsuario`, `Cliente_idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD CONSTRAINT `direccion_ibfk_1` FOREIGN KEY (`Campus_idCampus`,`Campus_Cliente_idCliente`) REFERENCES `campus` (`idCampus`, `Cliente_idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `lectura`
--
ALTER TABLE `lectura`
  ADD CONSTRAINT `lectura_ibfk_1` FOREIGN KEY (`Pedestal_idPedestal`,`Pedestal_Acceso_Campus_idCampus`,`Pedestal_Acceso_Campus_Cliente_idCliente`,`Pedestal_Acceso_idAcceso`) REFERENCES `pedestal` (`idPedestal`, `Acceso_Campus_idCampus`, `Acceso_Campus_Cliente_idCliente`, `Acceso_idAcceso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`Usuario_idUsuario`,`Usuario_GrupoUsuario_idGrupoUsuario`,`Usuario_Cliente_idCliente`) REFERENCES `usuario` (`idUsuario`, `GrupoUsuario_idGrupoUsuario`, `Cliente_idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedestal`
--
ALTER TABLE `pedestal`
  ADD CONSTRAINT `pedestal_ibfk_1` FOREIGN KEY (`Acceso_idAcceso`,`Acceso_Campus_Cliente_idCliente`,`Acceso_Campus_idCampus`) REFERENCES `acceso` (`idAcceso`, `Campus_Cliente_idCliente`, `Campus_idCampus`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`GrupoUsuario_idGrupoUsuario`) REFERENCES `grupousuario` (`idGrupoUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
