-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-07-2023 a las 00:04:20
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mintur`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acientos`
--

CREATE TABLE `acientos` (
  `id_acientos` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `acientos`
--

INSERT INTO `acientos` (`id_acientos`, `descripcion`) VALUES
(1, 'Cama'),
(2, 'Semi-Cama'),
(3, 'Ejecutivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agencias`
--

CREATE TABLE `agencias` (
  `id_agencias` int(10) NOT NULL,
  `descripcion_agencias` varchar(244) NOT NULL,
  `idoneo_agencia` varchar(244) NOT NULL,
  `matricula_agencia` varchar(244) NOT NULL,
  `legajo_agencia` varchar(244) NOT NULL,
  `cuit_agencia` varchar(255) NOT NULL,
  `categoria_agencia` varchar(244) NOT NULL,
  `fecha_edit_agencia` datetime DEFAULT NULL,
  `rela_razon_social_agencia` int(10) DEFAULT NULL,
  `rela_agencias_persona` int(11) DEFAULT NULL,
  `rela_agencia_direccion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `agencias`
--

INSERT INTO `agencias` (`id_agencias`, `descripcion_agencias`, `idoneo_agencia`, `matricula_agencia`, `legajo_agencia`, `cuit_agencia`, `categoria_agencia`, `fecha_edit_agencia`, `rela_razon_social_agencia`, `rela_agencias_persona`, `rela_agencia_direccion`) VALUES
(7, 'Grimaro Tour', 'Orué, Griselda Mariel', '8059', '10735', '27-23667230-7', 'EVT', '2022-08-22 08:31:11', 116, NULL, 200),
(8, 'Alwa Viajes y Turismo', 'Resquín, Ariadna Soledad', '14146', '16217', '20-26081048-1', 'EVT', '2023-04-04 08:16:19', 117, NULL, 201),
(9, 'Arapy Viajes', 'Arrúa, Claudia Belén', '14475', '18087', '27-28666159-4', 'EVT', '2022-08-22 08:31:52', 118, NULL, 202),
(12, 'Diego Bregant Viajes', 'Bregant, Diego Alejandro', '9625', '14773', '20-25889351-5', 'EVT', NULL, 121, NULL, 205),
(13, 'Fentana Viajes y Turismo', 'Fentana, Hugo Ricardo', '7424', '11618', '20-10186376-0', 'EVT', '2022-08-22 08:31:35', 122, NULL, 206),
(16, 'M&M Turismo', 'Molina, Miguel Ángel', '2305', '8935', '20-10003071-4', 'EVT', '2023-05-16 10:14:30', 125, NULL, 209),
(17, 'Paraquaria Ecotravel & Business', 'González, Fernando Ariel', '15877', '14468', '30-71117859-3', 'EVT', NULL, 126, NULL, 210),
(18, 'Sakura Travel & Business', 'Fabricius, Ana Beatriz', '9814', '12338', '23-23269929-9', 'EVT', NULL, 127, NULL, 211),
(20, 'Siacia Turismo', 'Angeloni, Andrea Elizabeth', '10539', '11415', '20-24149355-6', 'EVT', NULL, 129, NULL, 213),
(21, 'Solo Turismo Arg Fsa Fsa', 'Oviedo, Carlos Antonio', '9039', '18003', '20-21659960-9', 'EVT', NULL, 130, NULL, 214),
(23, 'To Anywhere (Franquicia de Almundo.com)', 'Romero, Rita Belén', '15453', '17543', '30-71491815-6', 'EVT', NULL, 132, NULL, 216),
(24, 'Travel Rock', '', '', '11297', '30-70788118-2', 'EVT', NULL, 133, NULL, 217),
(25, 'Turismo De Castro', 'Romero, Graciela', '2334', '2041', '30-71581767-1', 'EVT', NULL, 134, NULL, 218),
(26, 'Vidivici', 'Salomón, Cristina Del Carmen', '15707', '17525', '20-22192334-1', 'EVT', NULL, 135, NULL, 219),
(27, 'Goya Turismo', '', '', '17224', '0', 'EVT', NULL, 136, NULL, 220),
(28, 'Tintes Religiosos', 'desconocido', '0000', '15909', '0', 'EVT', '2023-05-16 12:12:44', 137, NULL, 221),
(29, 'Pisamos Fuerte Viajes (Casa Central)', 'Zenandez, Celeste Soledad', '14112', '17165', '24-36203365-5', 'EVT', '2022-08-22 08:32:06', 138, NULL, 222),
(31, 'HIDDEN TRAILS', 'Sergio Adrián Subeldia', '8792', '12244', '0', 'EVT', '2022-10-04 08:07:40', 156, NULL, 410);

--
-- Disparadores `agencias`
--
DELIMITER $$
CREATE TRIGGER `borraragencias` AFTER DELETE ON `agencias` FOR EACH ROW INSERT INTO auditoria(tabla, accion,old_value, usuario_id) VALUES ('agencias', 'DELETE',CONCAT('{"`id_agencias`":', old.`id_agencias`, ',"`idoneo_agencia`":', old.`idoneo_agencia`, '}'), 25)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `crearagencias` AFTER INSERT ON `agencias` FOR EACH ROW INSERT INTO auditoria(tabla, accion, new_value, usuario_id) VALUES ('agencias', 'INSERT', CONCAT('{"`id_agencias`":', new.`id_agencias`, ',"`idoneo_agencia`":', new.`idoneo_agencia`, '}'), 3)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `editaragencias` AFTER UPDATE ON `agencias` FOR EACH ROW INSERT INTO auditoria(tabla, accion,old_value, new_value, usuario_id) VALUES ('agencias', 'UPDATE',CONCAT('{"`id_agencias`":', old.`id_agencias`, ',"`idoneo_agencia`":', old.`idoneo_agencia`, '}'), CONCAT('{"`id_agencias`":', new.`id_agencias`, ',"`idoneo_agencia`":', new.`idoneo_agencia`, '}'), 25)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alojamientos`
--

CREATE TABLE `alojamientos` (
  `id_alojamientos` int(10) NOT NULL,
  `descripcion_alojamientos` varchar(244) NOT NULL,
  `cuit_alojamiento` bigint(20) DEFAULT NULL,
  `idoneo_alojamiento` varchar(244) DEFAULT NULL,
  `estrella_alojamiento` int(11) DEFAULT NULL,
  `rela_razon_social_alo` int(10) DEFAULT NULL,
  `rela_tipo_alojamiento_aloja` int(10) NOT NULL,
  `rela_alojamiento_persona` int(11) DEFAULT NULL,
  `rela_alojamiento_direccion` int(11) DEFAULT NULL,
  `rela_alojamiento_rubro` int(10) DEFAULT NULL,
  `rela_aloja_servicios` int(11) DEFAULT NULL,
  `rela_aloja_serv_adicionales` int(11) DEFAULT NULL,
  `rela_habilitaciones` int(11) DEFAULT NULL,
  `fecha_edit_alojamiento` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `alojamientos`
--

INSERT INTO `alojamientos` (`id_alojamientos`, `descripcion_alojamientos`, `cuit_alojamiento`, `idoneo_alojamiento`, `estrella_alojamiento`, `rela_razon_social_alo`, `rela_tipo_alojamiento_aloja`, `rela_alojamiento_persona`, `rela_alojamiento_direccion`, `rela_alojamiento_rubro`, `rela_aloja_servicios`, `rela_aloja_serv_adicionales`, `rela_habilitaciones`, `fecha_edit_alojamiento`) VALUES
(3, 'Hotel Internacional de Turismo', 0, '', 4, 46, 1, NULL, 110, 6, 35, 33, 1, NULL),
(4, 'Hotel Fermoza', 0, '', 0, 47, 1, NULL, 111, 2, 36, 34, 1, '2023-05-03 11:05:32'),
(5, 'Hotel Formosa', 0, '', 3, 48, 1, NULL, 112, 2, 37, 35, 1, '2023-05-03 11:15:19'),
(6, 'Hotel Nuevo Real', 0, '', 1, 49, 1, NULL, 113, 2, 38, 36, 1, NULL),
(7, 'Hotel Plaza', 0, 'Marlén Delgado', 3, 50, 1, NULL, 114, 6, 39, 37, 1, '2023-05-03 11:14:26'),
(8, 'Howard Johnson', 0, '', 4, 51, 1, NULL, 115, 6, 40, 38, 1, '2023-05-03 11:12:55'),
(9, 'Las Kalas Rental Suites', 0, '', 3, 53, 1, NULL, 117, 6, 42, 40, 1, NULL),
(10, 'Portal Del Sol', 0, 'César Romero', 3, 54, 1, NULL, 118, 2, 43, 41, 1, NULL),
(11, 'Hotel Regina', 0, '', 3, 55, 1, NULL, 119, 2, 44, 42, 1, '2022-09-07 09:22:17'),
(12, 'Residencial Costanera', 0, 'Alejandro Tiñuk', 1, 56, 1, NULL, 120, 2, 45, 43, 1, NULL),
(13, 'Hotel Ronny', 0, '', 2, 57, 1, NULL, 121, 2, 46, 44, 1, '2023-05-03 11:07:09'),
(14, 'El Cortijo Agroturismo', -71544756, 'Pablo Rodolfo Miño', 0, 58, 2, NULL, 122, 7, 47, 45, 1, NULL),
(16, 'Los Zorzales', 33714794529, 'MAuricio Malvasi', 0, 63, 2, NULL, 127, 7, 49, 47, 1, NULL),
(17, 'La Florencia', 0, '', 0, 64, 2, NULL, 128, 7, 50, 48, 1, '2023-04-27 08:56:52'),
(18, 'La Madrina', 0, 'Rubén Omar Sosa', 0, 65, 2, NULL, 129, 7, 51, 49, 1, NULL),
(19, 'Miramonte', 27266934861, 'Karina Fleitas', 0, 66, 2, NULL, 130, 7, 52, 50, 1, NULL),
(20, 'Chuqui Cué', 20142549760, 'Mirian Michel', 0, 67, 2, NULL, 131, 7, 53, 51, 1, NULL),
(21, 'Posada Cris Dan', 0, '', 0, 68, 5, NULL, 132, 1, 54, 52, 1, NULL),
(22, 'Quintel', 0, '', 0, 69, 2, NULL, 133, NULL, 55, 53, 4, NULL),
(23, 'Quintel', 0, '', 0, 70, 5, NULL, 134, 4, 56, 54, 1, '2023-04-27 08:53:55'),
(24, 'Cabañas De la Laguna', 20062627825, 'Gilberto Bandeo', 0, 71, 2, NULL, 135, 7, 57, 55, 1, '2023-04-27 08:56:03'),
(25, 'Gran Capitan', 20247801554, 'Darío Sanabria', 0, 72, 2, NULL, 136, 7, 58, 56, 1, NULL),
(26, 'Los Tucanes', 0, '', 0, 73, 5, NULL, 137, 4, 59, 57, 1, '2023-04-27 08:55:11'),
(27, 'Cabañas El Picasso', 0, '', 0, 74, 2, NULL, 138, 7, 60, 58, 1, '2023-04-27 08:54:40'),
(28, '12 de Octubre', 0, '', 0, 75, 5, NULL, 139, 1, 61, 59, 1, '2022-07-15 11:12:54'),
(29, 'Hotel ArTur', 0, '', 0, 76, 1, NULL, 140, 2, 62, 60, 1, '2022-07-18 10:34:52'),
(30, 'Residencial San Martín', 0, '', 2, 77, 6, NULL, 141, 2, 63, 61, 1, '2022-07-18 10:22:21'),
(31, 'Hotel Embajador', 0, '', 0, 78, 1, NULL, 142, 2, 64, 62, 1, '2023-04-27 09:15:04'),
(32, 'Hotel Orígenes', 0, '', 0, 79, 1, NULL, 143, 2, 65, 63, 1, NULL),
(34, 'Hotel Eva', 0, '', 0, 81, 1, NULL, 145, 2, 67, 65, 1, NULL),
(37, 'Hospedaje Lucena', 0, '', 0, 84, 5, NULL, 148, 1, 70, 68, 1, '2023-04-26 10:37:37'),
(39, 'Hospedaje Katarina', 0, '', 0, 86, 5, NULL, 151, 1, 72, 70, 1, NULL),
(40, ' El Viajante', 0, '', 0, 87, 1, NULL, 152, 1, 73, 71, 1, '2023-05-03 11:26:25'),
(41, 'Hotel Plaza', 0, '', 0, 88, 1, NULL, 153, 2, 74, 72, 1, '2023-04-27 10:31:58'),
(42, 'Hotel Melitona', 0, '', 0, 89, 1, NULL, 154, 2, 75, 73, 1, '2023-05-03 11:25:22'),
(43, 'Hotel La Ribera', 0, '', 0, 90, 1, NULL, 155, 2, 76, 74, 1, '2023-04-26 11:57:49'),
(44, 'Hospedaje Ceci', 0, '', 0, 91, 5, NULL, 156, 1, 77, 75, 1, '2023-04-26 11:52:26'),
(45, 'Hotel Irupé', 0, '', 0, 92, 1, NULL, 157, 2, 78, 76, 1, '2023-04-26 11:54:18'),
(46, 'Hospedaje Ermy', 0, '', 0, 93, 5, NULL, 158, 1, 79, 77, 1, '2023-04-26 11:50:58'),
(47, 'Hospedaje Jorgito', 0, '', 0, 94, 5, NULL, 159, 1, 80, 78, 1, '2022-07-22 11:34:37'),
(48, 'Hotel y Motel El Manantial', 0, '', 0, 95, 1, NULL, 160, 2, 81, 79, 4, '2023-04-26 11:59:13'),
(49, 'Hotel Oasis', 0, '', 0, 96, 1, NULL, 161, 2, 82, 80, 4, NULL),
(50, 'Hospedaje Al Paso', 0, '', 0, 97, 5, NULL, 162, 1, 83, 81, 4, NULL),
(51, 'Don Insfrán', 0, '', 0, 98, 1, NULL, 163, 2, 84, 82, 4, NULL),
(53, 'Imperial Apart Hotel', 0, '', 0, 100, 1, NULL, 165, 2, 86, 84, 4, '2022-02-11 10:48:16'),
(54, 'Brimalu Hotel', 0, '', 0, 101, 1, NULL, 166, 2, 87, 85, 4, '2022-08-17 10:41:04'),
(56, 'Hospedaje Flores', 0, '', 0, 103, 5, NULL, 168, 1, 89, 87, 4, '2022-07-22 11:35:04'),
(58, 'El Angelito (Ex Norte)', 0, '', 0, 105, 5, NULL, 170, 1, 91, 89, 4, '2022-07-22 11:35:55'),
(59, 'El Indiano', 0, '', 0, 106, 5, NULL, 171, 1, 92, 90, 1, '2022-07-22 12:01:34'),
(60, 'Hospedaje Karfa', 0, '', 0, 107, 5, NULL, 172, 1, 93, 91, 4, '2022-07-22 11:35:26'),
(61, 'Gran Victoria', 0, '', 0, 108, 1, NULL, 173, 2, 94, 92, 4, '2022-07-22 11:38:29'),
(62, 'Hotel Los Dos Pibes', 0, '', 0, 109, 1, NULL, 174, 2, 95, 93, 4, '2022-07-22 11:38:15'),
(63, 'Victoria', 0, '', 0, 110, 1, NULL, 175, 2, 96, 94, 4, '2022-07-22 11:38:00'),
(64, 'Magali', 0, '', 0, 111, 1, NULL, 176, 2, 97, 95, 4, NULL),
(65, 'Los Tucanes', 0, '', 0, 141, 2, NULL, 276, 7, 102, 100, 1, NULL),
(66, 'Cabañas Doña Elsa', 0, '', 0, 142, 2, NULL, 294, 7, 103, 101, 4, '2023-04-26 11:53:46'),
(67, 'El Patio de Risso', 0, '', 0, 143, 5, NULL, 295, 1, 104, 102, 4, '2023-04-26 11:49:24'),
(68, 'Hotel Del Río', 0, '', 0, 144, 1, NULL, 296, 2, 105, 103, 4, '2023-05-04 17:57:54'),
(72, 'Hospedaje El Ricky', 0, '', 0, 148, 5, NULL, 341, 1, 109, 107, 4, '2022-07-22 11:37:25'),
(77, 'Hotel Residencial España', 0, '', 0, 153, 6, NULL, 367, 1, 114, 112, 4, '2022-07-18 09:21:52'),
(78, 'Gran Hospedaje', 0, '', 0, 154, 5, NULL, 369, 1, 115, 113, 1, '2023-05-03 11:27:15'),
(79, 'hotel Guaraní', 0, '', 0, 155, 1, NULL, 391, 2, 116, 114, 4, '2022-08-22 08:38:16'),
(80, 'Quinta La celia', 0, 'Lucas Ernesto Centurión', 0, 157, 4, NULL, 442, 4, 117, 115, 1, '2022-11-16 09:14:55'),
(81, 'Hospedaje Naturaleza', 0, '', 0, 158, 5, NULL, 500, 1, 118, 116, 1, '2023-04-26 10:39:40'),
(82, 'Hospedaje Tejada', 0, '', 0, 159, 5, NULL, 501, 1, 119, 117, 1, '2023-04-26 10:40:49'),
(83, 'Cabañas Doña Ana', 0, '', 0, 160, 2, NULL, 502, 7, 120, 118, 1, '2023-04-26 10:44:51'),
(84, 'Hospedaje Carabajal', 0, '', 0, 161, 5, NULL, 503, 1, 121, 119, 1, '2023-04-26 10:44:10'),
(85, 'La Ruta Verde', 0, '', 0, 162, 1, NULL, 508, 2, 122, 120, 1, '2023-04-26 11:57:17'),
(86, 'Don Joaquín', 0, '', 0, 163, 2, NULL, 517, 7, 123, 121, 1, '2023-04-27 08:59:06'),
(87, 'Santa Librada', 0, '', 0, 164, 4, NULL, 518, 4, 124, 122, 1, '2023-04-27 09:00:33'),
(88, 'La Quinta del Tío', 0, '', 0, 165, 4, NULL, 519, 1, 125, 123, 1, '2023-04-27 09:25:07'),
(89, 'ALTA GRACIA', 0, '', 0, 166, 2, NULL, 520, 7, 126, 124, 1, '2023-04-27 09:26:44'),
(90, 'La Candelaria', 0, '', 0, 167, 2, NULL, 521, 7, 127, 125, 1, '2023-04-27 09:30:36'),
(91, 'Alto del Monte', 0, '', 0, 168, 4, NULL, 522, 1, 128, 126, 1, '2023-04-27 09:31:30'),
(92, 'San Marcos', 0, '', 0, 169, 4, NULL, 523, 1, 129, 127, 1, '2023-04-27 09:32:20'),
(93, 'La Soñada', 0, '', 0, 170, 4, NULL, 524, 1, 130, 128, 1, '2023-04-27 09:34:29'),
(94, 'Los Penayo', 0, '', 0, 171, 4, NULL, 525, 1, 131, 129, 1, '2023-04-27 09:35:18'),
(95, 'Herradura', 0, '', 0, 172, 4, NULL, 526, 1, 132, 130, 1, '2023-04-27 09:37:22'),
(96, 'San Miguel', 0, '', 0, 173, 4, NULL, 527, 1, 133, 131, 1, '2023-04-27 09:38:13'),
(97, 'El Rey León', 0, '', 0, 174, 4, NULL, 528, 1, 134, 132, 1, '2023-04-27 09:39:04'),
(98, 'Las Orquídeas', 0, '', 0, 175, 4, NULL, 529, 1, 135, 133, 1, '2023-04-27 09:43:20'),
(99, 'Nuestro Sueño', 0, '', 0, 176, 4, NULL, 530, 1, 136, 134, 1, '2023-04-27 09:45:18'),
(100, 'Eco Quinta Herradura', 0, '', 0, 177, 4, NULL, 531, 1, 137, 135, 1, '2023-04-27 09:46:11'),
(101, 'Minerva', 0, '', 0, 178, 5, NULL, 532, 1, 138, 136, 1, '2023-04-27 09:46:57'),
(102, 'Casa Don Hector', 0, '', 0, 179, 5, NULL, 533, 1, 139, 137, 1, '2023-04-27 09:47:46'),
(103, 'Manuelita', 0, '', 0, 180, 5, NULL, 570, 1, 140, 138, 1, '2023-05-03 11:28:26'),
(106, 'La Misión', 0, 'karina', 0, 186, 7, NULL, 668, 1, 143, 143, 1, '2023-07-04 08:38:53');

--
-- Disparadores `alojamientos`
--
DELIMITER $$
CREATE TRIGGER `borrarAlojamientos` AFTER DELETE ON `alojamientos` FOR EACH ROW INSERT INTO auditoria(tabla, accion,old_value, usuario_id) VALUES ('Alojamientos', 'DELETE',CONCAT('{"`id_alojamientos`":', old.`id_alojamientos`, ',"`idoneo_alojamiento`":', old.`idoneo_alojamiento`, '}'), 71)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `crearAlojamientos` AFTER INSERT ON `alojamientos` FOR EACH ROW INSERT INTO auditoria(tabla, accion, new_value, usuario_id) VALUES ('Alojamientos', 'INSERT', CONCAT('{"`id_alojamientos`":', new.`id_alojamientos`, ',"`idoneo_alojamiento`":', new.`idoneo_alojamiento`, '}'), 3)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `editarAlojamientos` AFTER UPDATE ON `alojamientos` FOR EACH ROW INSERT INTO auditoria(tabla, accion,old_value, new_value, usuario_id) VALUES ('Alojamientos', 'UPDATE',CONCAT('{"`id_alojamientos`":', old.`id_alojamientos`, ',"`idoneo_alojamiento`":', old.`idoneo_alojamiento`, '}'), CONCAT('{"`id_alojamientos`":', new.`id_alojamientos`, ',"`idoneo_alojamiento`":', new.`idoneo_alojamiento`, '}'), 3)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivos_ima_video`
--

CREATE TABLE `archivos_ima_video` (
  `id_archivo_ima_vid` int(11) NOT NULL,
  `nombre_archivo` varchar(244) NOT NULL,
  `imagen_video` longblob NOT NULL,
  `rela_alojamiento` int(11) DEFAULT NULL,
  `rela_pileta` int(11) DEFAULT NULL,
  `rela_agencia` int(11) DEFAULT NULL,
  `rela_prestadores` int(11) DEFAULT NULL,
  `rela_referentes` int(11) DEFAULT NULL,
  `rela_festivales` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas`
--

CREATE TABLE `areas` (
  `id_areas` int(11) NOT NULL,
  `descriArea` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `areas`
--

INSERT INTO `areas` (`id_areas`, `descriArea`) VALUES
(1, 'Legal y Técnica'),
(2, 'Tesorería'),
(3, 'Recurso humano y Despacho'),
(4, 'Contable'),
(5, 'Mesa de Entrada'),
(6, 'Técnica'),
(7, 'Comunicación'),
(8, 'Promoción Turística');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia`
--

CREATE TABLE `asistencia` (
  `id_asistencia` int(11) NOT NULL,
  `in_p1` varchar(255) DEFAULT NULL,
  `on_p1` varchar(255) DEFAULT NULL,
  `in_p2` varchar(255) DEFAULT NULL,
  `on_p2` varchar(255) DEFAULT NULL,
  `fecha_asistencia` date NOT NULL,
  `semana_asistencia` varchar(255) NOT NULL,
  `rela_personal` int(11) NOT NULL,
  `date_updated_asistencia` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia2`
--

CREATE TABLE `asistencia2` (
  `id_asistencia2` int(11) NOT NULL,
  `nombre_personal` varchar(255) DEFAULT NULL,
  `fecha_asistencia` date NOT NULL,
  `hora_asistencia` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `asistencia2`
--

INSERT INTO `asistencia2` (`id_asistencia2`, `nombre_personal`, `fecha_asistencia`, `hora_asistencia`) VALUES
(1, '\"Emilia Clarisa Krachinsky\"', '2022-10-13', '08:56:03'),
(2, '\"admin\"', '2022-08-25', '22:54:51'),
(3, '\"admin\"', '2022-08-25', '22:55:09'),
(4, '\"admin\"', '2022-08-29', '08:16:46'),
(5, '\"admin\"', '2022-08-29', '08:16:49'),
(6, '\"admin\"', '2022-08-29', '08:17:23'),
(7, '\"admin\"', '2022-08-29', '08:17:26'),
(8, '\"admin\"', '2022-08-29', '08:32:45'),
(9, '\"admin\"', '2022-08-29', '08:32:48'),
(10, '\"admin\"', '2022-08-29', '08:32:51'),
(11, '\"Acevedo Rocio Vanina\"', '2022-08-29', '08:37:14'),
(12, '\"Rolando david Pereyra\"', '2022-08-29', '08:37:20'),
(13, '\"Rolando david Pereyra\"', '2022-08-29', '08:37:44'),
(14, '\"Rolando david Pereyra\"', '2022-08-29', '08:37:47'),
(15, '\"admin\"', '2022-08-29', '08:40:02'),
(16, '\"Roxana Edith Baez\"', '2022-08-29', '08:41:29'),
(17, '\"admin\"', '2022-08-29', '08:41:31'),
(18, '\"Jorge Arturo Ferro\"', '2022-08-29', '08:43:26'),
(19, '\"admin\"', '2022-08-29', '08:43:29'),
(20, '\"admin\"', '2022-08-29', '08:43:32'),
(21, '\"Martin Emanuel Canesin Rojas\"', '2022-08-29', '08:45:28'),
(22, '\"admin\"', '2022-08-29', '08:45:32'),
(23, '\"admin\"', '2022-08-29', '08:45:35'),
(24, '\"admin\"', '2022-08-29', '08:45:37'),
(25, '\"Nadia Itati Romero\"', '2022-08-29', '08:46:57'),
(26, '\"admin\"', '2022-08-29', '08:47:00'),
(27, '\"admin\"', '2022-08-29', '08:47:02'),
(28, '\"Rosa Cecilia Gimenez\"', '2022-08-29', '08:49:55'),
(29, '\"Rosa Cecilia Gimenez\"', '2022-08-29', '08:49:58'),
(30, '\"admin\"', '2022-08-29', '08:50:01'),
(31, '\"Regina Victoria Leguizamon\"', '2022-08-29', '08:52:13'),
(32, '\"admin\"', '2022-08-29', '08:52:14'),
(33, '\"Regina Victoria Leguizamon\"', '2022-08-29', '08:52:16'),
(34, '\"Regina Victoria Leguizamon\"', '2022-08-29', '08:52:18'),
(35, '\"admin\"', '2022-08-29', '08:52:19'),
(36, '\"Alfredo Pedro Iznardo\"', '2022-08-29', '08:53:56'),
(37, '\"admin\"', '2022-08-29', '08:53:58'),
(38, '\"Alfredo Pedro Iznardo\"', '2022-08-29', '08:53:58'),
(39, '\"admin\"', '2022-08-29', '08:54:09'),
(40, '\"admin\"', '2022-08-29', '08:54:13'),
(41, '\"admin\"', '2022-08-29', '08:54:15'),
(42, '\"German Felix Rave\"', '2022-08-29', '08:56:50'),
(43, '\"German Felix Rave\"', '2022-08-29', '08:56:54'),
(44, '\"admin\"', '2022-08-29', '08:56:57'),
(45, '\"admin\"', '2022-08-29', '08:58:05'),
(46, '\"Juan manuel Ojeda\"', '2022-08-29', '08:59:01'),
(47, '\"Juan manuel Ojeda\"', '2022-08-29', '08:59:05'),
(48, '\"Juan manuel Ojeda\"', '2022-08-29', '08:59:08'),
(49, '\"Juan manuel Ojeda\"', '2022-08-29', '08:59:12'),
(50, '\"admin\"', '2022-08-29', '08:59:17'),
(51, '\"admin\"', '2022-08-29', '08:59:19'),
(52, '\"admin\"', '2022-08-29', '08:59:44'),
(53, '\"admin\"', '2022-08-29', '08:59:55'),
(54, '\"admin\"', '2022-08-29', '09:00:00'),
(55, '\"admin\"', '2022-08-29', '09:00:06'),
(56, '\"admin\"', '2022-08-29', '09:00:08'),
(57, '\"Sabrina Evelyn Gonzalez\"', '2022-08-29', '09:01:16'),
(58, '\"Sabrina Evelyn Gonzalez\"', '2022-08-29', '09:01:19'),
(59, '\"Sabrina Evelyn Gonzalez\"', '2022-08-29', '09:01:22'),
(60, '\"admin\"', '2022-08-29', '09:01:27'),
(61, '\"Sabrina Evelyn Gonzalez\"', '2022-08-29', '09:01:29'),
(62, '\"admin\"', '2022-08-29', '09:01:30'),
(63, '\"Matias Rolando Rodriguez\"', '2022-08-29', '09:04:22'),
(64, '\"Matias Rolando Rodriguez\"', '2022-08-29', '09:04:25'),
(65, '\"Matias Rolando Rodriguez\"', '2022-08-29', '09:04:27'),
(66, '\"admin\"', '2022-08-29', '09:05:11'),
(67, '\"admin\"', '2022-08-29', '09:05:14'),
(68, '\"admin\"', '2022-08-29', '09:05:17'),
(69, '\"admin\"', '2022-08-29', '09:06:47'),
(70, '\"admin\"', '2022-08-29', '09:06:50'),
(71, '\"Sonia Marcela De Philippis\"', '2022-08-29', '09:08:27'),
(72, '\"Sonia Marcela De Philippis\"', '2022-08-29', '09:08:29'),
(73, '\"admin\"', '2022-08-29', '09:08:31'),
(74, '\"Sonia Marcela De Philippis\"', '2022-08-29', '09:08:32'),
(75, '\"Laura Soledad Escobar\"', '2022-08-29', '09:10:38'),
(76, '\"Laura Soledad Escobar\"', '2022-08-29', '09:10:41'),
(77, '\"admin\"', '2022-08-29', '09:10:42'),
(78, '\"admin\"', '2022-08-29', '09:10:47'),
(79, '\"Emilia Clarisa Krachinsky\"', '2022-08-29', '09:12:52'),
(80, '\"Emilia Clarisa Krachinsky\"', '2022-08-29', '09:12:55'),
(81, '\"admin\"', '2022-08-29', '09:12:57'),
(82, '\"admin\"', '2022-08-29', '09:13:05'),
(83, '\"admin\"', '2022-08-29', '09:18:41'),
(84, '\"admin\"', '2022-08-29', '09:19:06'),
(85, '\"Cecilia Hauff\"', '2022-08-29', '09:31:16'),
(86, '\"Maria De Los Angeles Ibarra\"', '2022-08-29', '09:32:52'),
(87, '\"admin\"', '2022-08-29', '09:32:54'),
(88, '\"Maria De Los Angeles Ibarra\"', '2022-08-29', '09:32:55'),
(89, '\"admin\"', '2022-08-29', '09:33:00'),
(90, '\"admin\"', '2022-08-29', '09:33:04'),
(91, '\"admin\"', '2022-08-29', '09:45:38'),
(92, '\"Lourdes Romina Centurion\"', '2022-08-29', '09:47:25'),
(93, '\"Lourdes Romina Centurion\"', '2022-08-29', '09:47:28'),
(94, '\"Lourdes Romina Centurion\"', '2022-08-29', '09:47:31'),
(95, '\"admin\"', '2022-08-29', '09:47:34'),
(96, '\"Lourdes Romina Centurion\"', '2022-08-29', '09:47:39'),
(97, '\"admin\"', '2022-08-29', '09:47:41'),
(98, '\"Vanina Caceres\"', '2022-08-29', '09:50:05'),
(99, '\"Vanina Caceres\"', '2022-08-29', '09:50:07'),
(100, '\"Vanina Caceres\"', '2022-08-29', '09:50:10'),
(101, '\"admin\"', '2022-08-29', '09:50:12'),
(102, '\"Zulima Noelia Garay\"', '2022-08-29', '09:52:13'),
(103, '\"Zulima Noelia Garay\"', '2022-08-29', '09:52:16'),
(104, '\"Zulima Noelia Garay\"', '2022-08-29', '09:52:19'),
(105, '\"admin\"', '2022-08-29', '09:52:21'),
(106, '\"Monica Daiana Ojeda\"', '2022-08-29', '09:53:55'),
(107, '\"Monica Daiana Ojeda\"', '2022-08-29', '09:54:00'),
(108, '\"admin\"', '2022-08-29', '10:21:40'),
(109, '\"admin\"', '2022-08-29', '10:37:19'),
(110, '\"admin\"', '2022-08-29', '10:38:42'),
(111, '\"admin\"', '2022-08-29', '12:02:29'),
(112, '\"Sabrina Evelyn Gonzalez\"', '2022-08-29', '12:02:51'),
(113, '\"\"', '2022-08-29', '15:57:08'),
(114, '\"\"', '2022-08-29', '15:57:12'),
(115, '\"\"', '2022-08-29', '15:57:16'),
(116, '\"\"', '2022-08-29', '15:59:57'),
(117, '\"\"', '2022-08-29', '16:00:16'),
(118, '\"\"', '2022-08-29', '17:36:27'),
(119, '\"\"', '2022-08-29', '17:36:31'),
(120, '\"admin\"', '2022-08-29', '17:39:04'),
(121, '\"admin\"', '2022-08-29', '17:39:06'),
(122, '\"Ronaldo Emmanuel Almiron \"', '2022-08-29', '17:41:54'),
(123, '\"Ronaldo Emmanuel Almiron \"', '2022-08-29', '17:41:56'),
(124, '\"Ronaldo Emmanuel Almiron \"', '2022-08-29', '17:42:23'),
(125, '\"Ronaldo Emmanuel Almiron \"', '2022-08-29', '17:45:05'),
(126, '\"Ronaldo Emmanuel Almiron \"', '2022-08-29', '17:45:07'),
(127, '\"Ronaldo Emmanuel Almiron \"', '2022-08-29', '17:45:10'),
(128, '\"admin\"', '2022-08-29', '17:50:22'),
(129, '\"admin\"', '2022-08-29', '17:51:53'),
(130, '\"Ronaldo Emmanuel Almiron \"', '2022-08-29', '17:52:03'),
(131, '\"Silvina Ramirez\"', '2022-08-29', '17:59:20'),
(132, '\"Silvina Ramirez\"', '2022-08-29', '17:59:28'),
(133, '\"admin\"', '2022-08-29', '17:59:31'),
(134, '\"Ronaldo Emmanuel Almiron \"', '2022-08-29', '17:59:38'),
(135, '\"Lorena Saracho Lobos\"', '2022-08-29', '18:01:12'),
(136, '\"Lorena Saracho Lobos\"', '2022-08-29', '18:01:20'),
(137, '\"Fernando Beron\"', '2022-08-29', '18:02:21'),
(138, '\"Fernando Beron\"', '2022-08-29', '18:02:24'),
(139, '\"Fernando Beron\"', '2022-08-29', '18:02:27'),
(140, '\"Ronaldo Emmanuel Almiron \"', '2022-08-29', '18:02:28'),
(141, '\"Ronaldo Emmanuel Almiron \"', '2022-08-29', '18:02:31'),
(142, '\"Fernando Beron\"', '2022-08-29', '18:02:34'),
(143, '\"Fernando Beron\"', '2022-08-29', '18:02:37'),
(144, '\"Fernando Beron\"', '2022-08-29', '18:02:41'),
(145, '\"Fernando Beron\"', '2022-08-29', '18:02:44'),
(146, '\"Ronaldo Emmanuel Almiron \"', '2022-08-29', '18:02:50'),
(147, '\"Fernando Beron\"', '2022-08-29', '18:02:52'),
(148, '\"Liz Mariel Sanchez\"', '2022-08-29', '18:03:51'),
(149, '\"Liz Mariel Sanchez\"', '2022-08-29', '18:03:55'),
(150, '\"admin\"', '2022-08-29', '18:04:06'),
(151, '\"Gaston Flores\"', '2022-08-29', '18:04:46'),
(152, '\"Gaston Flores\"', '2022-08-29', '18:04:49'),
(153, '\"Yanina Cardozo\"', '2022-08-29', '18:06:07'),
(154, '\"Yanina Cardozo\"', '2022-08-29', '18:06:10'),
(155, '\"Silvina Ramirez\"', '2022-08-29', '18:06:51'),
(156, '\"admin\"', '2022-08-29', '18:06:53'),
(157, '\"Silvina Ramirez\"', '2022-08-29', '18:06:55'),
(158, '\"Camila Blanca Juarez Amarilla\"', '2022-08-29', '18:09:28'),
(159, '\"Camila Blanca Juarez Amarilla\"', '2022-08-29', '18:09:32'),
(160, '\"admin\"', '2022-08-29', '18:09:34'),
(161, '\"Cecilia Ayelen Escalante\"', '2022-08-29', '18:10:53'),
(162, '\"Natalia Valieri\"', '2022-08-29', '18:11:53'),
(163, '\"Gloria Estela Monzon\"', '2022-08-29', '18:13:08'),
(164, '\"Mariana Anahi Coranel\"', '2022-08-29', '18:15:30'),
(165, '\"Mariana Anahi Coranel\"', '2022-08-29', '18:15:36'),
(166, '\"Juan Pablo Fernadez\"', '2022-08-29', '18:17:02'),
(167, '\"Juan Pablo Fernadez\"', '2022-08-29', '18:17:05'),
(168, '\"Ronaldo Emmanuel Almiron \"', '2022-08-29', '18:18:52'),
(169, '\"admin\"', '2022-08-29', '18:19:32'),
(170, '\"Juan manuel Ojeda\"', '2022-08-29', '18:22:32'),
(171, '\"admin\"', '2022-08-29', '18:23:19'),
(172, '\"Ronaldo Emmanuel Almiron \"', '2022-08-29', '18:26:45'),
(173, '\"Liz Mariel Sanchez\"', '2022-08-29', '18:33:50'),
(174, '\"Liz Mariel Sanchez\"', '2022-08-29', '18:33:54'),
(175, '\"Liz Mariel Sanchez\"', '2022-08-29', '18:33:57'),
(176, '\"Liz Mariel Sanchez\"', '2022-08-29', '18:34:07'),
(177, '\"Liz Mariel Sanchez\"', '2022-08-29', '18:34:11'),
(178, '\"Lourdes Romina Centurion\"', '2022-08-29', '18:34:12'),
(179, '\"Liz Mariel Sanchez\"', '2022-08-29', '18:34:18'),
(180, '\"Liz Mariel Sanchez\"', '2022-08-29', '18:34:21'),
(181, '\"Liz Mariel Sanchez\"', '2022-08-29', '18:34:24'),
(182, '\"Liz Mariel Sanchez\"', '2022-08-29', '18:34:29'),
(183, '\"admin\"', '2022-08-29', '18:35:00'),
(184, '\"Ronaldo Emmanuel Almiron \"', '2022-08-29', '18:35:05'),
(185, '\"admin\"', '2022-08-29', '18:35:55'),
(186, '\"Ronaldo Emmanuel Almiron \"', '2022-08-29', '18:35:58'),
(187, '\"Lourdes Romina Centurion\"', '2022-08-29', '18:44:57'),
(188, '\"admin\"', '2022-08-29', '19:16:54'),
(189, '\"Monica Daiana Ojeda\"', '2022-08-29', '19:20:18'),
(190, '\"Maria De Los Angeles Ibarra\"', '2022-08-29', '19:23:26'),
(191, '\"Yanina Cardozo\"', '2022-08-29', '19:23:39'),
(192, '\"Cecilia Hauff\"', '2022-08-29', '19:23:47'),
(193, '\"Camila Blanca Juarez Amarilla\"', '2022-08-29', '20:01:04'),
(194, '\"Silvina Ramirez\"', '2022-08-29', '20:01:39'),
(195, '\"Ronaldo Emmanuel Almiron \"', '2022-08-29', '20:01:47'),
(196, '\"Gloria Estela Monzon\"', '2022-08-29', '20:03:05'),
(197, '\"Gloria Estela Monzon\"', '2022-08-29', '20:03:15'),
(198, '\"Lorena Saracho Lobos\"', '2022-08-29', '20:04:34'),
(199, '\"Cecilia Ayelen Escalante\"', '2022-08-29', '20:06:53'),
(200, '\"Liz Mariel Sanchez\"', '2022-08-29', '20:09:46'),
(201, '\"Natalia Valieri\"', '2022-08-29', '20:12:38'),
(202, '\"Fernando Beron\"', '2022-08-29', '20:12:58'),
(203, '\"Gaston Flores\"', '2022-08-29', '20:28:40'),
(204, '\"Matias Rolando Rodriguez\"', '2022-08-30', '07:28:38'),
(205, '\"Laura Soledad Escobar\"', '2022-08-30', '07:29:35'),
(206, '\"Maria De Los Angeles Ibarra\"', '2022-08-30', '07:30:38'),
(207, '\"Monica Daiana Ojeda\"', '2022-08-30', '07:47:47'),
(208, '\"German Felix Rave\"', '2022-08-30', '07:49:18'),
(209, '\"Rosa Cecilia Gimenez\"', '2022-08-30', '07:49:37'),
(210, '\"Roxana Edith Baez\"', '2022-08-30', '07:56:12'),
(211, '\"Ronaldo Emmanuel Almiron \"', '2022-08-30', '07:56:57'),
(212, '\"Cecilia Hauff\"', '2022-08-30', '07:57:00'),
(213, '\"Vanina Caceres\"', '2022-08-30', '07:58:04'),
(214, '\"Nadia Itati Romero\"', '2022-08-30', '07:59:47'),
(215, '\"admin\"', '2022-08-30', '08:01:57'),
(216, '\"admin\"', '2022-08-30', '08:02:24'),
(217, '\"admin\"', '2022-08-30', '08:02:28'),
(218, '\"Marcelo Leon\"', '2022-08-30', '08:03:12'),
(219, '\"admin\"', '2022-08-30', '08:06:58'),
(220, '\"Mabel Edith Areco\"', '2022-08-30', '08:08:07'),
(221, '\"Mabel Edith Areco\"', '2022-08-30', '08:08:13'),
(222, '\"Jorge Arturo Ferro\"', '2022-08-30', '08:08:24'),
(223, '\"Martin Emanuel Canesin Rojas\"', '2022-08-30', '08:09:17'),
(224, '\"Regina Victoria Leguizamon\"', '2022-08-30', '08:11:50'),
(225, '\"Lourdes Romina Centurion\"', '2022-08-30', '08:12:57'),
(226, '\"Acevedo Rocio Vanina\"', '2022-08-30', '08:14:46'),
(227, '\"Julio Sergio Duran\"', '2022-08-30', '08:27:50'),
(228, '\"Sonia Marcela De Philippis\"', '2022-08-30', '08:36:03'),
(229, '\"Juan manuel Ojeda\"', '2022-08-30', '08:43:53'),
(230, '\"Emilia Clarisa Krachinsky\"', '2022-08-30', '09:02:20'),
(231, '\"Juan Pablo Fernadez\"', '2022-08-30', '09:31:38'),
(232, '\"Vanina Caceres\"', '2022-08-30', '11:07:42'),
(233, '\"Regina Victoria Leguizamon\"', '2022-08-30', '11:08:03'),
(234, '\"Mariana Anahi Coranel\"', '2022-08-30', '11:30:19'),
(235, '\"Matias Rolando Rodriguez\"', '2022-08-30', '11:31:35'),
(236, '\"Emilia Clarisa Krachinsky\"', '2022-08-30', '11:54:05'),
(237, '\"German Felix Rave\"', '2022-08-30', '12:00:20'),
(238, '\"Laura Soledad Escobar\"', '2022-08-30', '12:00:33'),
(239, '\"Jorge Arturo Ferro\"', '2022-08-30', '12:02:04'),
(240, '\"Juan Pablo Fernadez\"', '2022-08-30', '12:03:19'),
(241, '\"Nadia Itati Romero\"', '2022-08-30', '12:03:34'),
(242, '\"Martin Emanuel Canesin Rojas\"', '2022-08-30', '12:11:52'),
(243, '\"Maria De Los Angeles Ibarra\"', '2022-08-30', '12:12:12'),
(244, '\"admin\"', '2022-08-30', '12:13:06'),
(245, '\"Ronaldo Emmanuel Almiron \"', '2022-08-30', '12:16:30'),
(246, '\"Julio Sergio Duran\"', '2022-08-30', '12:48:07'),
(247, '\"Rosa Cecilia Gimenez\"', '2022-08-30', '12:52:34'),
(248, '\"Marcelo Leon\"', '2022-08-30', '12:55:29'),
(249, '\"Mariana Anahi Coranel\"', '2022-08-30', '12:56:40'),
(250, '\"Cecilia Hauff\"', '2022-08-30', '12:56:50'),
(251, '\"Roxana Edith Baez\"', '2022-08-30', '12:57:01'),
(252, '\"Lourdes Romina Centurion\"', '2022-08-30', '12:59:18'),
(253, '\"Monica Daiana Ojeda\"', '2022-08-30', '13:02:38'),
(254, '\"Sonia Marcela De Philippis\"', '2022-08-30', '13:05:05'),
(255, '\"Mabel Edith Areco\"', '2022-08-30', '15:02:47'),
(256, '\"Natalia Valieri\"', '2022-08-30', '15:45:46'),
(257, '\"Camila Blanca Juarez Amarilla\"', '2022-08-30', '15:53:56'),
(258, '\"Silvina Ramirez\"', '2022-08-30', '15:55:50'),
(259, '\"Emilia Clarisa Krachinsky\"', '2022-08-30', '15:56:42'),
(260, '\"Gloria Estela Monzon\"', '2022-08-30', '15:59:55'),
(261, '\"Vanina Caceres\"', '2022-08-30', '16:02:34'),
(262, '\"Fernando Beron\"', '2022-08-30', '16:03:13'),
(263, '\"Liz Mariel Sanchez\"', '2022-08-30', '16:03:20'),
(264, '\"Jorge Arturo Ferro\"', '2022-08-30', '16:03:48'),
(265, '\"Cecilia Ayelen Escalante\"', '2022-08-30', '16:07:11'),
(266, '\"Gaston Flores\"', '2022-08-30', '16:07:19'),
(267, '\"Lorena Saracho Lobos\"', '2022-08-30', '16:19:53'),
(268, '\"Monica Daiana Ojeda\"', '2022-08-30', '17:10:51'),
(269, '\"Roxana Edith Baez\"', '2022-08-30', '17:17:52'),
(270, '\"Emilia Clarisa Krachinsky\"', '2022-08-30', '17:57:20'),
(271, '\"Jorge Arturo Ferro\"', '2022-08-30', '18:01:07'),
(272, '\"Vanina Caceres\"', '2022-08-30', '18:05:19'),
(273, '\"Roxana Edith Baez\"', '2022-08-30', '19:21:43'),
(274, '\"Cecilia Ayelen Escalante\"', '2022-08-30', '19:55:29'),
(275, '\"Lorena Saracho Lobos\"', '2022-08-30', '19:58:40'),
(276, '\"Silvina Ramirez\"', '2022-08-30', '19:58:55'),
(277, '\"Camila Blanca Juarez Amarilla\"', '2022-08-30', '19:59:29'),
(278, '\"Gloria Estela Monzon\"', '2022-08-30', '20:00:09'),
(279, '\"Gaston Flores\"', '2022-08-30', '20:02:48'),
(280, '\"Monica Daiana Ojeda\"', '2022-08-30', '20:03:07'),
(281, '\"Fernando Beron\"', '2022-08-30', '20:05:52'),
(282, '\"Natalia Valieri\"', '2022-08-30', '20:06:02'),
(283, '\"Liz Mariel Sanchez\"', '2022-08-30', '20:09:40'),
(284, '\"Matias Rolando Rodriguez\"', '2022-08-31', '07:09:55'),
(285, '\"Maria De Los Angeles Ibarra\"', '2022-08-31', '07:34:44'),
(286, '\"German Felix Rave\"', '2022-08-31', '07:38:34'),
(287, '\"Laura Soledad Escobar\"', '2022-08-31', '07:39:28'),
(288, '\"Mariana Anahi Coranel\"', '2022-08-31', '07:50:41'),
(289, '\"Alfredo Pedro Iznardo\"', '2022-08-31', '07:50:55'),
(290, '\"Alfredo Pedro Iznardo\"', '2022-08-31', '07:51:00'),
(291, '\"Alfredo Pedro Iznardo\"', '2022-08-31', '07:51:05'),
(292, '\"Zulima Noelia Garay\"', '2022-08-31', '07:53:20'),
(293, '\"Roxana Edith Baez\"', '2022-08-31', '07:53:26'),
(294, '\"admin\"', '2022-08-31', '07:55:10'),
(295, '\"Vanina Caceres\"', '2022-08-31', '07:57:08'),
(296, '\"Nadia Itati Romero\"', '2022-08-31', '08:01:48'),
(297, '\"Rosa Cecilia Gimenez\"', '2022-08-31', '08:02:46'),
(298, '\"Juan manuel Ojeda\"', '2022-08-31', '08:05:28'),
(299, '\"Jorge Arturo Ferro\"', '2022-08-31', '08:06:20'),
(300, '\"Cecilia Hauff\"', '2022-08-31', '08:06:52'),
(301, '\"Regina Victoria Leguizamon\"', '2022-08-31', '08:16:16'),
(302, '\"Martin Emanuel Canesin Rojas\"', '2022-08-31', '08:17:44'),
(303, '\"Yanina Cardozo\"', '2022-08-31', '08:26:05'),
(304, '\"Acevedo Rocio Vanina\"', '2022-08-31', '08:27:21'),
(305, '\"Julio Sergio Duran\"', '2022-08-31', '08:30:29'),
(306, '\"Juan Pablo Fernadez\"', '2022-08-31', '08:41:58'),
(307, '\"Sonia Marcela De Philippis\"', '2022-08-31', '08:44:39'),
(308, '\"Regina Victoria Leguizamon\"', '2022-08-31', '11:06:31'),
(309, '\"Matias Rolando Rodriguez\"', '2022-08-31', '11:31:13'),
(310, '\"Maria De Los Angeles Ibarra\"', '2022-08-31', '11:43:40'),
(311, '\"Cecilia Hauff\"', '2022-08-31', '11:59:13'),
(312, '\"Laura Soledad Escobar\"', '2022-08-31', '12:00:23'),
(313, '\"German Felix Rave\"', '2022-08-31', '12:00:46'),
(314, '\"Jorge Arturo Ferro\"', '2022-08-31', '12:00:53'),
(315, '\"Nadia Itati Romero\"', '2022-08-31', '12:02:45'),
(316, '\"Yanina Cardozo\"', '2022-08-31', '12:06:22'),
(317, '\"admin\"', '2022-08-31', '12:08:21'),
(318, '\"Juan Pablo Fernadez\"', '2022-08-31', '12:11:52'),
(319, '\"Martin Emanuel Canesin Rojas\"', '2022-08-31', '12:12:52'),
(320, '\"Acevedo Rocio Vanina\"', '2022-08-31', '12:18:59'),
(321, '\"Vanina Caceres\"', '2022-08-31', '12:34:32'),
(322, '\"Roxana Edith Baez\"', '2022-08-31', '12:55:51'),
(323, '\"Julio Sergio Duran\"', '2022-08-31', '12:56:28'),
(324, '\"Alfredo Pedro Iznardo\"', '2022-08-31', '13:00:13'),
(325, '\"Rosa Cecilia Gimenez\"', '2022-08-31', '13:00:32'),
(326, '\"Sonia Marcela De Philippis\"', '2022-08-31', '13:02:47'),
(327, '\"Natalia Valieri\"', '2022-08-31', '15:49:00'),
(328, '\"Camila Blanca Juarez Amarilla\"', '2022-08-31', '15:49:08'),
(329, '\"Silvina Ramirez\"', '2022-08-31', '15:56:04'),
(330, '\"Fernando Beron\"', '2022-08-31', '15:58:38'),
(331, '\"Vanina Caceres\"', '2022-08-31', '16:02:07'),
(332, '\"Cecilia Hauff\"', '2022-08-31', '16:06:17'),
(333, '\"Cecilia Ayelen Escalante\"', '2022-08-31', '16:08:33'),
(334, '\"Gaston Flores\"', '2022-08-31', '16:08:40'),
(335, '\"Rosa Cecilia Gimenez\"', '2022-08-31', '16:09:44'),
(336, '\"Ronaldo Emmanuel Almiron \"', '2022-08-31', '16:17:59'),
(337, '\"Ronaldo Emmanuel Almiron \"', '2022-08-31', '16:27:11'),
(338, '\"Lorena Saracho Lobos\"', '2022-08-31', '16:27:37'),
(339, '\"Maria Soledad Palavecino\"', '2022-08-31', '16:30:13'),
(340, '\"Nicolas Gallegos\"', '2022-08-31', '16:31:57'),
(341, '\"Monica Daiana Ojeda\"', '2022-08-31', '17:11:25'),
(342, '\"Rosa Cecilia Gimenez\"', '2022-08-31', '18:08:38'),
(343, '\"Vanina Caceres\"', '2022-08-31', '18:11:21'),
(344, '\"Mariana Anahi Coranel\"', '2022-08-31', '18:21:19'),
(345, '\"Ronaldo Emmanuel Almiron \"', '2022-08-31', '18:27:10'),
(346, '\"Julieta Dolores Merlo\"', '2022-08-31', '18:27:15'),
(347, '\"Cecilia Hauff\"', '2022-08-31', '19:15:26'),
(348, '\"Monica Daiana Ojeda\"', '2022-08-31', '19:53:15'),
(349, '\"Julieta Dolores Merlo\"', '2022-08-31', '19:55:07'),
(350, '\"Ronaldo Emmanuel Almiron \"', '2022-08-31', '19:58:05'),
(351, '\"Maria Soledad Palavecino\"', '2022-08-31', '19:59:26'),
(352, '\"Silvina Ramirez\"', '2022-08-31', '19:59:33'),
(353, '\"Lorena Saracho Lobos\"', '2022-08-31', '20:00:12'),
(354, '\"Nicolas Gallegos\"', '2022-08-31', '20:01:07'),
(355, '\"Camila Blanca Juarez Amarilla\"', '2022-08-31', '20:01:19'),
(356, '\"Cecilia Ayelen Escalante\"', '2022-08-31', '20:04:34'),
(357, '\"Mariana Anahi Coranel\"', '2022-08-31', '20:04:57'),
(358, '\"Gaston Flores\"', '2022-08-31', '20:05:05'),
(359, '\"Natalia Valieri\"', '2022-08-31', '20:09:05'),
(360, '\"Natalia Valieri\"', '2022-08-31', '20:09:09'),
(361, '\"Laura Soledad Escobar\"', '2022-09-01', '07:07:06'),
(362, '\"Mabel Edith Areco\"', '2022-09-01', '07:28:17'),
(363, '\"Maria De Los Angeles Ibarra\"', '2022-09-01', '07:41:52'),
(364, '\"Marcelo Leon\"', '2022-09-01', '07:45:45'),
(365, '\"Alfredo Pedro Iznardo\"', '2022-09-01', '07:47:49'),
(366, '\"German Felix Rave\"', '2022-09-01', '07:47:58'),
(367, '\"Acevedo Rocio Vanina\"', '2022-09-01', '07:49:57'),
(368, '\"Cecilia Hauff\"', '2022-09-01', '07:53:11'),
(369, '\"Vanina Caceres\"', '2022-09-01', '07:54:17'),
(370, '\"Rosa Cecilia Gimenez\"', '2022-09-01', '07:55:17'),
(371, '\"Sabrina Evelyn Gonzalez\"', '2022-09-01', '07:55:58'),
(372, '\"Roxana Edith Baez\"', '2022-09-01', '07:56:36'),
(373, '\"Monica Daiana Ojeda\"', '2022-09-01', '07:58:00'),
(374, '\"admin\"', '2022-09-01', '07:59:21'),
(375, '\"Nadia Itati Romero\"', '2022-09-01', '08:01:55'),
(376, '\"Zulima Noelia Garay\"', '2022-09-01', '08:06:27'),
(377, '\"Julio Sergio Duran\"', '2022-09-01', '08:07:19'),
(378, '\"Jorge Arturo Ferro\"', '2022-09-01', '08:11:23'),
(379, '\"Mariana Anahi Coranel\"', '2022-09-01', '08:12:17'),
(380, '\"Lourdes Romina Centurion\"', '2022-09-01', '08:12:28'),
(381, '\"Regina Victoria Leguizamon\"', '2022-09-01', '08:15:25'),
(382, '\"Juan Pablo Fernadez\"', '2022-09-01', '08:19:33'),
(383, '\"Juan manuel Ojeda\"', '2022-09-01', '08:35:22'),
(384, '\"Yanina Cardozo\"', '2022-09-01', '08:36:13'),
(385, '\"Sonia Marcela De Philippis\"', '2022-09-01', '08:47:43'),
(386, '\"Emilia Clarisa Krachinsky\"', '2022-09-01', '08:53:55'),
(387, '\"Regina Victoria Leguizamon\"', '2022-09-01', '11:09:51'),
(388, '\"Vanina Caceres\"', '2022-09-01', '11:14:54'),
(389, '\"Yanina Cardozo\"', '2022-09-01', '11:27:16'),
(390, '\"Laura Soledad Escobar\"', '2022-09-01', '11:30:20'),
(391, '\"Maria De Los Angeles Ibarra\"', '2022-09-01', '11:45:31'),
(392, '\"German Felix Rave\"', '2022-09-01', '12:00:33'),
(393, '\"Jorge Arturo Ferro\"', '2022-09-01', '12:00:53'),
(394, '\"Sabrina Evelyn Gonzalez\"', '2022-09-01', '12:02:05'),
(395, '\"Nadia Itati Romero\"', '2022-09-01', '12:03:49'),
(396, '\"Acevedo Rocio Vanina\"', '2022-09-01', '12:04:45'),
(397, '\"Mariana Anahi Coranel\"', '2022-09-01', '12:07:06'),
(398, '\"admin\"', '2022-09-01', '12:10:45'),
(399, '\"Juan Pablo Fernadez\"', '2022-09-01', '12:16:50'),
(400, '\"Monica Daiana Ojeda\"', '2022-09-01', '12:37:33'),
(401, '\"Alfredo Pedro Iznardo\"', '2022-09-01', '12:54:11'),
(402, '\"Marcelo Leon\"', '2022-09-01', '12:56:52'),
(403, '\"Julio Sergio Duran\"', '2022-09-01', '12:57:37'),
(404, '\"Rosa Cecilia Gimenez\"', '2022-09-01', '12:57:55'),
(405, '\"Roxana Edith Baez\"', '2022-09-01', '13:02:02'),
(406, '\"Cecilia Hauff\"', '2022-09-01', '13:02:58'),
(407, '\"Lourdes Romina Centurion\"', '2022-09-01', '13:03:52'),
(408, '\"Sonia Marcela De Philippis\"', '2022-09-01', '13:11:50'),
(409, '\"Mabel Edith Areco\"', '2022-09-01', '15:28:27'),
(410, '\"Camila Blanca Juarez Amarilla\"', '2022-09-01', '15:42:03'),
(411, '\"Ronaldo Emmanuel Almiron \"', '2022-09-01', '15:47:23'),
(412, '\"Natalia Valieri\"', '2022-09-01', '15:49:19'),
(413, '\"Gloria Estela Monzon\"', '2022-09-01', '15:51:42'),
(414, '\"Jorge Arturo Ferro\"', '2022-09-01', '15:51:55'),
(415, '\"Fernando Beron\"', '2022-09-01', '15:54:35'),
(416, '\"Silvina Ramirez\"', '2022-09-01', '15:54:53'),
(417, '\"Emilia Clarisa Krachinsky\"', '2022-09-01', '15:55:05'),
(418, '\"Vanina Caceres\"', '2022-09-01', '15:57:09'),
(419, '\"Nicolas Gallegos\"', '2022-09-01', '16:04:45'),
(420, '\"Lorena Saracho Lobos\"', '2022-09-01', '16:09:33'),
(421, '\"Rosa Cecilia Gimenez\"', '2022-09-01', '16:13:23'),
(422, '\"Gaston Flores\"', '2022-09-01', '16:28:19'),
(423, '\"Cecilia Ayelen Escalante\"', '2022-09-01', '16:30:39'),
(424, '\"Maria De Los Angeles Ibarra\"', '2022-09-01', '16:50:12'),
(425, '\"Roxana Edith Baez\"', '2022-09-01', '17:18:16'),
(426, '\"Jorge Arturo Ferro\"', '2022-09-01', '17:34:28'),
(427, '\"Maria Soledad Palavecino\"', '2022-09-01', '17:57:08'),
(428, '\"Emilia Clarisa Krachinsky\"', '2022-09-01', '18:03:52'),
(429, '\"Rosa Cecilia Gimenez\"', '2022-09-01', '18:10:19'),
(430, '\"Mariana Anahi Coranel\"', '2022-09-01', '18:13:15'),
(431, '\"Vanina Caceres\"', '2022-09-01', '18:28:06'),
(432, '\"Roxana Edith Baez\"', '2022-09-01', '19:24:38'),
(433, '\"Maria De Los Angeles Ibarra\"', '2022-09-01', '19:53:53'),
(434, '\"Silvina Ramirez\"', '2022-09-01', '19:55:43'),
(435, '\"Maria Soledad Palavecino\"', '2022-09-01', '19:55:53'),
(436, '\"Ronaldo Emmanuel Almiron \"', '2022-09-01', '19:58:05'),
(437, '\"Lorena Saracho Lobos\"', '2022-09-01', '19:58:42'),
(438, '\"Cecilia Ayelen Escalante\"', '2022-09-01', '19:59:28'),
(439, '\"Nicolas Gallegos\"', '2022-09-01', '19:59:50'),
(440, '\"Gloria Estela Monzon\"', '2022-09-01', '19:59:55'),
(441, '\"Camila Blanca Juarez Amarilla\"', '2022-09-01', '20:00:39'),
(442, '\"Monica Daiana Ojeda\"', '2022-09-01', '20:00:51'),
(443, '\"Fernando Beron\"', '2022-09-01', '20:01:47'),
(444, '\"Natalia Valieri\"', '2022-09-01', '20:03:25'),
(445, '\"Gaston Flores\"', '2022-09-01', '20:05:46'),
(446, '\"Laura Soledad Escobar\"', '2022-09-02', '08:02:08'),
(447, '\"Matias Rolando Rodriguez\"', '2022-09-02', '08:02:29'),
(448, '\"Laura Soledad Escobar\"', '2022-09-02', '12:01:37'),
(449, '\"Matias Rolando Rodriguez\"', '2022-09-02', '12:01:44'),
(450, '\"Maria Soledad Palavecino\"', '2022-09-02', '15:55:29'),
(451, '\"Nicolas Gallegos\"', '2022-09-02', '16:21:14'),
(452, '\"Maria Soledad Palavecino\"', '2022-09-02', '20:00:37'),
(453, '\"Nicolas Gallegos\"', '2022-09-02', '20:00:53'),
(454, '\"Maria Soledad Palavecino\"', '2022-09-03', '07:46:53'),
(455, '\"Marcelo Leon\"', '2022-09-03', '07:56:34'),
(456, '\"Maria Soledad Palavecino\"', '2022-09-03', '11:23:48'),
(457, '\"Marcelo Leon\"', '2022-09-03', '11:23:55'),
(458, '\"Mabel Edith Areco\"', '2022-09-03', '15:57:01'),
(459, '\"Mabel Edith Areco\"', '2022-09-03', '20:04:55'),
(460, '\"Laura Soledad Escobar\"', '2022-09-05', '07:13:13'),
(461, '\"\"', '2022-09-05', '07:50:40'),
(462, '\"Zulima Noelia Garay\"', '2022-09-05', '07:52:24'),
(463, '\"Maria De Los Angeles Ibarra\"', '2022-09-05', '07:54:56'),
(464, '\"German Felix Rave\"', '2022-09-05', '07:55:23'),
(465, '\"Cecilia Hauff\"', '2022-09-05', '07:56:11'),
(466, '\"Monica Daiana Ojeda\"', '2022-09-05', '07:56:17'),
(467, '\"Mariana Anahi Coranel\"', '2022-09-05', '07:56:52'),
(468, '\"Mariana Anahi Coranel\"', '2022-09-05', '07:57:18'),
(469, '\"Roxana Edith Baez\"', '2022-09-05', '07:58:12'),
(470, '\"Mabel Edith Areco\"', '2022-09-05', '07:58:50'),
(471, '\"admin\"', '2022-09-05', '08:02:11'),
(472, '\"Alfredo Pedro Iznardo\"', '2022-09-05', '08:05:29'),
(473, '\"Gloria Arias\"', '2022-09-05', '08:06:58'),
(474, '\"Rosa Cecilia Gimenez\"', '2022-09-05', '08:07:21'),
(475, '\"Acevedo Rocio Vanina\"', '2022-09-05', '08:08:17'),
(476, '\"Sabrina Evelyn Gonzalez\"', '2022-09-05', '08:09:04'),
(477, '\"Jorge Arturo Ferro\"', '2022-09-05', '08:14:21'),
(478, '\"Regina Victoria Leguizamon\"', '2022-09-05', '08:21:16'),
(479, '\"Vanina Caceres\"', '2022-09-05', '08:27:47'),
(480, '\"Juan manuel Ojeda\"', '2022-09-05', '08:34:08'),
(481, '\"Emilia Clarisa Krachinsky\"', '2022-09-05', '08:40:03'),
(482, '\"Sonia Marcela De Philippis\"', '2022-09-05', '08:42:08'),
(483, '\"Juan Pablo Fernadez\"', '2022-09-05', '09:01:13'),
(484, '\"Regina Victoria Leguizamon\"', '2022-09-05', '11:07:15'),
(485, '\"Laura Soledad Escobar\"', '2022-09-05', '11:30:42'),
(486, '\"Maria De Los Angeles Ibarra\"', '2022-09-05', '11:47:02'),
(487, '\"Juan Pablo Fernadez\"', '2022-09-05', '11:54:14'),
(488, '\"Jorge Arturo Ferro\"', '2022-09-05', '12:02:01'),
(489, '\"Vanina Caceres\"', '2022-09-05', '12:02:26'),
(490, '\"German Felix Rave\"', '2022-09-05', '12:02:30'),
(491, '\"Cecilia Hauff\"', '2022-09-05', '12:06:04'),
(492, '\"Sabrina Evelyn Gonzalez\"', '2022-09-05', '12:08:10'),
(493, '\"Emilia Clarisa Krachinsky\"', '2022-09-05', '12:08:14'),
(494, '\"Acevedo Rocio Vanina\"', '2022-09-05', '12:11:56'),
(495, '\"admin\"', '2022-09-05', '12:17:18'),
(496, '\"Mariana Anahi Coranel\"', '2022-09-05', '12:39:11'),
(497, '\"Monica Daiana Ojeda\"', '2022-09-05', '12:39:48'),
(498, '\"Gloria Arias\"', '2022-09-05', '12:45:57'),
(499, '\"Rosa Cecilia Gimenez\"', '2022-09-05', '12:56:41'),
(500, '\"Alfredo Pedro Iznardo\"', '2022-09-05', '12:57:03'),
(501, '\"Roxana Edith Baez\"', '2022-09-05', '12:57:09'),
(502, '\"Sonia Marcela De Philippis\"', '2022-09-05', '13:01:24'),
(503, '\"Mabel Edith Areco\"', '2022-09-05', '13:01:34'),
(504, '\"Natalia Valieri\"', '2022-09-05', '15:49:17'),
(505, '\"Ronaldo Emmanuel Almiron \"', '2022-09-05', '15:51:55'),
(506, '\"Camila Blanca Juarez Amarilla\"', '2022-09-05', '15:57:07'),
(507, '\"Gloria Estela Monzon\"', '2022-09-05', '15:59:01'),
(508, '\"Silvina Ramirez\"', '2022-09-05', '16:01:43'),
(509, '\"Fernando Beron\"', '2022-09-05', '16:07:37'),
(510, '\"Gaston Flores\"', '2022-09-05', '16:07:43'),
(511, '\"Liz Mariel Sanchez\"', '2022-09-05', '16:08:11'),
(512, '\"Cecilia Ayelen Escalante\"', '2022-09-05', '16:10:09'),
(513, '\"Lorena Saracho Lobos\"', '2022-09-05', '16:13:18'),
(514, '\"Monica Daiana Ojeda\"', '2022-09-05', '16:38:24'),
(515, '\"Gloria Arias\"', '2022-09-05', '16:39:00'),
(516, '\"Mariana Anahi Coranel\"', '2022-09-05', '17:00:37'),
(517, '\"Rosa Cecilia Gimenez\"', '2022-09-05', '17:32:08'),
(518, '\"German Felix Rave\"', '2022-09-05', '17:49:15'),
(519, '\"Alfredo Pedro Iznardo\"', '2022-09-05', '18:02:39'),
(520, '\"Cecilia Hauff\"', '2022-09-05', '18:41:09'),
(521, '\"Rosa Cecilia Gimenez\"', '2022-09-05', '19:29:00'),
(522, '\"Monica Daiana Ojeda\"', '2022-09-05', '19:29:26'),
(523, '\"Gloria Arias\"', '2022-09-05', '19:29:35'),
(524, '\"Alfredo Pedro Iznardo\"', '2022-09-05', '19:58:56'),
(525, '\"Gloria Estela Monzon\"', '2022-09-05', '20:00:58'),
(526, '\"Camila Blanca Juarez Amarilla\"', '2022-09-05', '20:01:35'),
(527, '\"Silvina Ramirez\"', '2022-09-05', '20:01:56'),
(528, '\"Lorena Saracho Lobos\"', '2022-09-05', '20:02:08'),
(529, '\"Ronaldo Emmanuel Almiron \"', '2022-09-05', '20:03:03'),
(530, '\"Natalia Valieri\"', '2022-09-05', '20:07:04'),
(531, '\"Fernando Beron\"', '2022-09-05', '20:07:13'),
(532, '\"Liz Mariel Sanchez\"', '2022-09-05', '20:10:39'),
(533, '\"Mariana Anahi Coranel\"', '2022-09-05', '20:12:51'),
(534, '\"Cecilia Hauff\"', '2022-09-05', '20:14:35'),
(535, '\"Cecilia Ayelen Escalante\"', '2022-09-05', '20:14:40'),
(536, '\"Laura Soledad Escobar\"', '2022-09-06', '07:09:30'),
(537, '\"Mabel Edith Areco\"', '2022-09-06', '07:39:43'),
(538, '\"Roxana Edith Baez\"', '2022-09-06', '07:40:29'),
(539, '\"Marcelo Leon\"', '2022-09-06', '07:48:31'),
(540, '\"Rosa Cecilia Gimenez\"', '2022-09-06', '07:52:17'),
(541, '\"Mariana Anahi Coranel\"', '2022-09-06', '07:52:26'),
(542, '\"Cecilia Hauff\"', '2022-09-06', '07:54:01'),
(543, '\"Alfredo Pedro Iznardo\"', '2022-09-06', '07:54:09'),
(544, '\"Gloria Arias\"', '2022-09-06', '07:56:55'),
(545, '\"Monica Daiana Ojeda\"', '2022-09-06', '07:59:02'),
(546, '\"German Felix Rave\"', '2022-09-06', '07:59:54'),
(547, '\"Sabrina Evelyn Gonzalez\"', '2022-09-06', '08:00:46'),
(548, '\"Vanina Caceres\"', '2022-09-06', '08:01:05'),
(549, '\"admin\"', '2022-09-06', '08:01:11'),
(550, '\"Zulima Noelia Garay\"', '2022-09-06', '08:06:45'),
(551, '\"Nadia Itati Romero\"', '2022-09-06', '08:08:01'),
(552, '\"Jorge Arturo Ferro\"', '2022-09-06', '08:09:19'),
(553, '\"Julio Sergio Duran\"', '2022-09-06', '08:10:49'),
(554, '\"Regina Victoria Leguizamon\"', '2022-09-06', '08:13:33'),
(555, '\"Maria De Los Angeles Ibarra\"', '2022-09-06', '08:14:20'),
(556, '\"Lourdes Romina Centurion\"', '2022-09-06', '08:15:53'),
(557, '\"Acevedo Rocio Vanina\"', '2022-09-06', '08:16:27'),
(558, '\"Sonia Marcela De Philippis\"', '2022-09-06', '08:38:36'),
(559, '\"Emilia Clarisa Krachinsky\"', '2022-09-06', '08:53:10'),
(560, '\"Juan Pablo Fernadez\"', '2022-09-06', '09:33:07'),
(561, '\"Regina Victoria Leguizamon\"', '2022-09-06', '09:37:39'),
(562, '\"Laura Soledad Escobar\"', '2022-09-06', '11:30:36'),
(563, '\"Vanina Caceres\"', '2022-09-06', '11:38:32'),
(564, '\"Maria De Los Angeles Ibarra\"', '2022-09-06', '11:41:36'),
(565, '\"German Felix Rave\"', '2022-09-06', '12:00:16'),
(566, '\"Jorge Arturo Ferro\"', '2022-09-06', '12:01:05'),
(567, '\"Sabrina Evelyn Gonzalez\"', '2022-09-06', '12:01:21'),
(568, '\"Nadia Itati Romero\"', '2022-09-06', '12:07:46'),
(569, '\"Acevedo Rocio Vanina\"', '2022-09-06', '12:12:07'),
(570, '\"Emilia Clarisa Krachinsky\"', '2022-09-06', '12:12:13'),
(571, '\"admin\"', '2022-09-06', '12:14:57'),
(572, '\"Juan Pablo Fernadez\"', '2022-09-06', '12:27:30'),
(573, '\"Roxana Edith Baez\"', '2022-09-06', '12:40:38'),
(574, '\"Gloria Arias\"', '2022-09-06', '12:43:43'),
(575, '\"Marcelo Leon\"', '2022-09-06', '12:50:49'),
(576, '\"Rosa Cecilia Gimenez\"', '2022-09-06', '12:52:38'),
(577, '\"Mariana Anahi Coranel\"', '2022-09-06', '12:53:30'),
(578, '\"Alfredo Pedro Iznardo\"', '2022-09-06', '12:55:06'),
(579, '\"Monica Daiana Ojeda\"', '2022-09-06', '12:55:41'),
(580, '\"Cecilia Hauff\"', '2022-09-06', '12:59:00'),
(581, '\"Julio Sergio Duran\"', '2022-09-06', '12:59:37'),
(582, '\"Lourdes Romina Centurion\"', '2022-09-06', '13:05:40'),
(583, '\"Sonia Marcela De Philippis\"', '2022-09-06', '13:08:19'),
(584, '\"Alfredo Pedro Iznardo\"', '2022-09-06', '15:47:56'),
(585, '\"Natalia Valieri\"', '2022-09-06', '15:52:38'),
(586, '\"Jorge Arturo Ferro\"', '2022-09-06', '15:53:09'),
(587, '\"Silvina Ramirez\"', '2022-09-06', '15:53:55'),
(588, '\"Vanina Caceres\"', '2022-09-06', '15:56:18'),
(589, '\"Camila Blanca Juarez Amarilla\"', '2022-09-06', '15:57:36'),
(590, '\"Mabel Edith Areco\"', '2022-09-06', '15:57:41'),
(591, '\"Liz Mariel Sanchez\"', '2022-09-06', '16:00:51'),
(592, '\"Gloria Estela Monzon\"', '2022-09-06', '16:02:55'),
(593, '\"Ronaldo Emmanuel Almiron \"', '2022-09-06', '16:04:03'),
(594, '\"Lourdes Romina Centurion\"', '2022-09-06', '16:13:40'),
(595, '\"Emilia Clarisa Krachinsky\"', '2022-09-06', '16:15:00'),
(596, '\"Lorena Saracho Lobos\"', '2022-09-06', '16:17:23'),
(597, '\"Fernando Beron\"', '2022-09-06', '16:21:19'),
(598, '\"Cecilia Ayelen Escalante\"', '2022-09-06', '16:24:04'),
(599, '\"Roxana Edith Baez\"', '2022-09-06', '17:14:41'),
(600, '\"Cecilia Hauff\"', '2022-09-06', '17:35:38'),
(601, '\"Monica Daiana Ojeda\"', '2022-09-06', '17:49:14'),
(602, '\"Alfredo Pedro Iznardo\"', '2022-09-06', '17:56:51'),
(603, '\"Emilia Clarisa Krachinsky\"', '2022-09-06', '18:09:36'),
(604, '\"Vanina Caceres\"', '2022-09-06', '18:13:29'),
(605, '\"Lourdes Romina Centurion\"', '2022-09-06', '18:13:40'),
(606, '\"Juan Pablo Fernadez\"', '2022-09-06', '18:20:24'),
(607, '\"Jorge Arturo Ferro\"', '2022-09-06', '18:20:32'),
(608, '\"Roxana Edith Baez\"', '2022-09-06', '19:20:25'),
(609, '\"Cecilia Hauff\"', '2022-09-06', '19:34:59'),
(610, '\"Gloria Estela Monzon\"', '2022-09-06', '19:55:25'),
(611, '\"Camila Blanca Juarez Amarilla\"', '2022-09-06', '19:56:23'),
(612, '\"Silvina Ramirez\"', '2022-09-06', '19:56:59'),
(613, '\"Cecilia Ayelen Escalante\"', '2022-09-06', '19:57:32'),
(614, '\"Lorena Saracho Lobos\"', '2022-09-06', '20:00:24'),
(615, '\"Ronaldo Emmanuel Almiron \"', '2022-09-06', '20:00:30'),
(616, '\"Monica Daiana Ojeda\"', '2022-09-06', '20:05:47'),
(617, '\"Liz Mariel Sanchez\"', '2022-09-06', '20:06:01'),
(618, '\"Natalia Valieri\"', '2022-09-06', '20:06:27'),
(619, '\"Matias Rolando Rodriguez\"', '2022-09-07', '07:26:08'),
(620, '\"Mabel Edith Areco\"', '2022-09-07', '07:38:37'),
(621, '\"German Felix Rave\"', '2022-09-07', '07:43:06'),
(622, '\"Monica Daiana Ojeda\"', '2022-09-07', '07:43:50'),
(623, '\"Laura Soledad Escobar\"', '2022-09-07', '07:47:49'),
(624, '\"Gloria Arias\"', '2022-09-07', '07:47:58'),
(625, '\"Mariana Anahi Coranel\"', '2022-09-07', '07:50:19'),
(626, '\"Marcelo Leon\"', '2022-09-07', '07:50:37'),
(627, '\"Vanina Caceres\"', '2022-09-07', '08:01:17'),
(628, '\"Zulima Noelia Garay\"', '2022-09-07', '08:01:56'),
(629, '\"Sabrina Evelyn Gonzalez\"', '2022-09-07', '08:02:55'),
(630, '\"Maria De Los Angeles Ibarra\"', '2022-09-07', '08:03:01'),
(631, '\"Rosa Cecilia Gimenez\"', '2022-09-07', '08:04:13'),
(632, '\"admin\"', '2022-09-07', '08:04:38'),
(633, '\"Nadia Itati Romero\"', '2022-09-07', '08:05:37'),
(634, '\"Jorge Arturo Ferro\"', '2022-09-07', '08:12:37'),
(635, '\"Cecilia Hauff\"', '2022-09-07', '08:13:41'),
(636, '\"Regina Victoria Leguizamon\"', '2022-09-07', '08:14:20'),
(637, '\"Alfredo Pedro Iznardo\"', '2022-09-07', '08:18:35'),
(638, '\"Juan Pablo Fernadez\"', '2022-09-07', '08:25:07'),
(639, '\"Juan manuel Ojeda\"', '2022-09-07', '08:25:31'),
(640, '\"Yanina Cardozo\"', '2022-09-07', '08:27:25'),
(641, '\"Sonia Marcela De Philippis\"', '2022-09-07', '08:39:54'),
(642, '\"Emilia Clarisa Krachinsky\"', '2022-09-07', '08:56:34'),
(643, '\"Vanina Caceres\"', '2022-09-07', '11:05:28'),
(644, '\"Regina Victoria Leguizamon\"', '2022-09-07', '11:09:32'),
(645, '\"Matias Rolando Rodriguez\"', '2022-09-07', '11:31:47'),
(646, '\"Cecilia Hauff\"', '2022-09-07', '11:49:17'),
(647, '\"Maria De Los Angeles Ibarra\"', '2022-09-07', '11:51:39'),
(648, '\"German Felix Rave\"', '2022-09-07', '12:00:21'),
(649, '\"German Felix Rave\"', '2022-09-07', '12:00:21'),
(650, '\"Juan Pablo Fernadez\"', '2022-09-07', '12:02:51'),
(651, '\"Sabrina Evelyn Gonzalez\"', '2022-09-07', '12:02:55'),
(652, '\"Laura Soledad Escobar\"', '2022-09-07', '12:03:27'),
(653, '\"admin\"', '2022-09-07', '12:05:18'),
(654, '\"admin\"', '2022-09-07', '12:05:35'),
(655, '\"Jorge Arturo Ferro\"', '2022-09-07', '12:06:01'),
(656, '\"Nadia Itati Romero\"', '2022-09-07', '12:06:16'),
(657, '\"Yanina Cardozo\"', '2022-09-07', '12:08:27'),
(658, '\"Emilia Clarisa Krachinsky\"', '2022-09-07', '12:40:19'),
(659, '\"Gloria Arias\"', '2022-09-07', '12:53:49'),
(660, '\"Marcelo Leon\"', '2022-09-07', '12:54:01'),
(661, '\"Rosa Cecilia Gimenez\"', '2022-09-07', '12:54:17'),
(662, '\"Sonia Marcela De Philippis\"', '2022-09-07', '12:56:43'),
(663, '\"Natalia Valieri\"', '2022-09-07', '15:31:19'),
(664, '\"Cecilia Ayelen Escalante\"', '2022-09-07', '15:50:53'),
(665, '\"Camila Blanca Juarez Amarilla\"', '2022-09-07', '15:52:21'),
(666, '\"Silvina Ramirez\"', '2022-09-07', '15:56:09'),
(667, '\"Ronaldo Emmanuel Almiron \"', '2022-09-07', '16:00:45'),
(668, '\"Gloria Estela Monzon\"', '2022-09-07', '16:04:43'),
(669, '\"Gloria Arias\"', '2022-09-07', '16:09:52'),
(670, '\"Fernando Beron\"', '2022-09-07', '16:48:35'),
(671, '\"Gloria Arias\"', '2022-09-07', '18:31:16'),
(672, '\"Silvina Ramirez\"', '2022-09-07', '19:59:53'),
(673, '\"Camila Blanca Juarez Amarilla\"', '2022-09-07', '20:01:17'),
(674, '\"Gloria Estela Monzon\"', '2022-09-07', '20:01:45'),
(675, '\"Ronaldo Emmanuel Almiron \"', '2022-09-07', '20:02:21'),
(676, '\"Mariana Anahi Coranel\"', '2022-09-07', '20:15:19'),
(677, '\"Mariana Anahi Coranel\"', '2022-09-07', '20:15:25'),
(678, '\"Mariana Anahi Coranel\"', '2022-09-07', '20:15:29'),
(679, '\"Cecilia Ayelen Escalante\"', '2022-09-07', '20:15:37'),
(680, '\"Liz Mariel Sanchez\"', '2022-09-07', '20:16:05'),
(681, '\"Natalia Valieri\"', '2022-09-07', '20:30:23'),
(682, '\"Fernando Beron\"', '2022-09-07', '20:30:49'),
(683, '\"Matias Rolando Rodriguez\"', '2022-09-08', '07:24:05'),
(684, '\"Maria De Los Angeles Ibarra\"', '2022-09-08', '07:31:51'),
(685, '\"Mabel Edith Areco\"', '2022-09-08', '07:44:50'),
(686, '\"Laura Soledad Escobar\"', '2022-09-08', '07:48:24'),
(687, '\"Gloria Arias\"', '2022-09-08', '07:50:27'),
(688, '\"Zulima Noelia Garay\"', '2022-09-08', '07:52:15'),
(689, '\"Alfredo Pedro Iznardo\"', '2022-09-08', '07:52:21'),
(690, '\"Rosa Cecilia Gimenez\"', '2022-09-08', '07:54:47'),
(691, '\"German Felix Rave\"', '2022-09-08', '07:55:04'),
(692, '\"Marcelo Leon\"', '2022-09-08', '07:58:29'),
(693, '\"Cecilia Hauff\"', '2022-09-08', '07:58:43'),
(694, '\"Mariana Anahi Coranel\"', '2022-09-08', '08:01:42'),
(695, '\"admin\"', '2022-09-08', '08:02:11'),
(696, '\"Vanina Caceres\"', '2022-09-08', '08:03:19'),
(697, '\"Regina Victoria Leguizamon\"', '2022-09-08', '08:08:26'),
(698, '\"Jorge Arturo Ferro\"', '2022-09-08', '08:10:34'),
(699, '\"Sonia Marcela De Philippis\"', '2022-09-08', '08:34:31'),
(700, '\"Juan Pablo Fernadez\"', '2022-09-08', '08:49:10'),
(701, '\"Yanina Cardozo\"', '2022-09-08', '09:02:46'),
(702, '\"Emilia Clarisa Krachinsky\"', '2022-09-08', '09:13:36'),
(703, '\"Maria De Los Angeles Ibarra\"', '2022-09-08', '11:13:56'),
(704, '\"Regina Victoria Leguizamon\"', '2022-09-08', '11:14:17'),
(705, '\"Vanina Caceres\"', '2022-09-08', '11:47:10'),
(706, '\"Laura Soledad Escobar\"', '2022-09-08', '12:00:21'),
(707, '\"German Felix Rave\"', '2022-09-08', '12:00:57'),
(708, '\"Matias Rolando Rodriguez\"', '2022-09-08', '12:01:29'),
(709, '\"Juan Pablo Fernadez\"', '2022-09-08', '12:01:43'),
(710, '\"Emilia Clarisa Krachinsky\"', '2022-09-08', '12:04:49'),
(711, '\"Jorge Arturo Ferro\"', '2022-09-08', '12:05:48'),
(712, '\"Cecilia Hauff\"', '2022-09-08', '12:14:40'),
(713, '\"Rosa Cecilia Gimenez\"', '2022-09-08', '12:32:08'),
(714, '\"Alfredo Pedro Iznardo\"', '2022-09-08', '12:32:13'),
(715, '\"Marcelo Leon\"', '2022-09-08', '12:33:57'),
(716, '\"Gloria Arias\"', '2022-09-08', '12:48:11'),
(717, '\"Sonia Marcela De Philippis\"', '2022-09-08', '12:53:22'),
(718, '\"Mabel Edith Areco\"', '2022-09-08', '15:28:50'),
(719, '\"Maria Soledad Palavecino\"', '2022-09-08', '15:51:04'),
(720, '\"Camila Blanca Juarez Amarilla\"', '2022-09-08', '15:54:19'),
(721, '\"Silvina Ramirez\"', '2022-09-08', '15:55:10'),
(722, '\"Ronaldo Emmanuel Almiron \"', '2022-09-08', '15:57:54'),
(723, '\"Vanina Caceres\"', '2022-09-08', '15:58:22'),
(724, '\"Gloria Estela Monzon\"', '2022-09-08', '16:03:57'),
(725, '\"Lorena Saracho Lobos\"', '2022-09-08', '16:17:22'),
(726, '\"Cecilia Ayelen Escalante\"', '2022-09-08', '16:52:48'),
(727, '\"Gaston Flores\"', '2022-09-08', '16:52:52'),
(728, '\"Mariana Anahi Coranel\"', '2022-09-08', '17:10:10'),
(729, '\"Rosa Cecilia Gimenez\"', '2022-09-08', '17:15:39'),
(730, '\"Vanina Caceres\"', '2022-09-08', '18:37:52'),
(731, '\"Rosa Cecilia Gimenez\"', '2022-09-08', '19:04:26'),
(732, '\"Gloria Estela Monzon\"', '2022-09-08', '19:52:41'),
(733, '\"Silvina Ramirez\"', '2022-09-08', '19:55:01'),
(734, '\"Maria Soledad Palavecino\"', '2022-09-08', '19:55:21'),
(735, '\"Lorena Saracho Lobos\"', '2022-09-08', '20:00:14'),
(736, '\"Ronaldo Emmanuel Almiron \"', '2022-09-08', '20:01:53'),
(737, '\"Camila Blanca Juarez Amarilla\"', '2022-09-08', '20:02:44'),
(738, '\"Gaston Flores\"', '2022-09-08', '20:02:53'),
(739, '\"Cecilia Ayelen Escalante\"', '2022-09-08', '20:23:36'),
(740, '\"Mabel Edith Areco\"', '2022-09-09', '07:26:29'),
(741, '\"Rosa Cecilia Gimenez\"', '2022-09-09', '07:44:54'),
(742, '\"German Felix Rave\"', '2022-09-09', '07:51:29'),
(743, '\"Gloria Arias\"', '2022-09-09', '07:52:28'),
(744, '\"Vanina Caceres\"', '2022-09-09', '07:55:54'),
(745, '\"Alfredo Pedro Iznardo\"', '2022-09-09', '07:56:34'),
(746, '\"admin\"', '2022-09-09', '08:05:45'),
(747, '\"Regina Victoria Leguizamon\"', '2022-09-09', '08:21:24'),
(748, '\"Emilia Clarisa Krachinsky\"', '2022-09-09', '08:34:49'),
(749, '\"Sonia Marcela De Philippis\"', '2022-09-09', '08:39:43'),
(750, '\"Alfredo Pedro Iznardo\"', '2022-09-09', '10:01:10'),
(751, '\"Regina Victoria Leguizamon\"', '2022-09-09', '10:01:17'),
(752, '\"admin\"', '2022-09-09', '11:54:05'),
(753, '\"Emilia Clarisa Krachinsky\"', '2022-09-09', '11:58:57'),
(754, '\"Rosa Cecilia Gimenez\"', '2022-09-09', '12:46:20'),
(755, '\"Mabel Edith Areco\"', '2022-09-09', '13:12:15'),
(756, '\"Silvina Ramirez\"', '2022-09-09', '16:00:36'),
(757, '\"Ronaldo Emmanuel Almiron \"', '2022-09-09', '16:00:44'),
(758, '\"Maria Soledad Palavecino\"', '2022-09-09', '16:01:28'),
(759, '\"Gloria Estela Monzon\"', '2022-09-09', '16:08:21'),
(760, '\"Lorena Saracho Lobos\"', '2022-09-09', '18:54:46'),
(761, '\"Silvina Ramirez\"', '2022-09-09', '19:48:42'),
(762, '\"Gloria Estela Monzon\"', '2022-09-09', '19:50:04'),
(763, '\"Ronaldo Emmanuel Almiron \"', '2022-09-09', '19:53:34'),
(764, '\"Maria Soledad Palavecino\"', '2022-09-09', '19:53:38'),
(765, '\"Emilia Clarisa Krachinsky\"', '2022-09-10', '07:52:58'),
(766, '\"Mabel Edith Areco\"', '2022-09-11', '08:33:02'),
(767, '\"Emilia Clarisa Krachinsky\"', '2022-09-11', '12:02:54'),
(768, '\"Mabel Edith Areco\"', '2022-09-11', '12:03:00'),
(769, '\"Mabel Edith Areco\"', '2022-09-12', '07:39:32'),
(770, '\"Alfredo Pedro Iznardo\"', '2022-09-12', '07:43:04'),
(771, '\"Gloria Arias\"', '2022-09-12', '07:48:07'),
(772, '\"Maria De Los Angeles Ibarra\"', '2022-09-12', '07:49:31'),
(773, '\"Acevedo Rocio Vanina\"', '2022-09-12', '08:01:49'),
(774, '\"Emilia Clarisa Krachinsky\"', '2022-09-12', '08:42:24'),
(775, '\"Marcelo Leon\"', '2022-09-12', '08:43:51'),
(776, '\"Juan manuel Ojeda\"', '2022-09-12', '09:38:52'),
(777, '\"Maria De Los Angeles Ibarra\"', '2022-09-12', '11:25:30'),
(778, '\"Emilia Clarisa Krachinsky\"', '2022-09-12', '12:04:55'),
(779, '\"Acevedo Rocio Vanina\"', '2022-09-12', '12:15:49'),
(780, '\"Alfredo Pedro Iznardo\"', '2022-09-12', '12:30:43'),
(781, '\"Marcelo Leon\"', '2022-09-12', '12:38:35'),
(782, '\"Mabel Edith Areco\"', '2022-09-12', '12:58:14'),
(783, '\"Maria Soledad Palavecino\"', '2022-09-12', '15:49:45'),
(784, '\"Gloria Arias\"', '2022-09-12', '15:53:59'),
(785, '\"Gloria Arias\"', '2022-09-12', '15:54:24'),
(786, '\"Gloria Estela Monzon\"', '2022-09-12', '16:21:55'),
(787, '\"Gloria Arias\"', '2022-09-12', '18:26:09'),
(788, '\"Liz Mariel Sanchez\"', '2022-09-12', '18:43:26'),
(789, '\"Liz Mariel Sanchez\"', '2022-09-12', '19:43:46'),
(790, '\"Gloria Estela Monzon\"', '2022-09-12', '20:00:33'),
(791, '\"Maria Soledad Palavecino\"', '2022-09-12', '20:00:59'),
(792, '\"Laura Soledad Escobar\"', '2022-09-13', '07:14:55'),
(793, '\"Maria De Los Angeles Ibarra\"', '2022-09-13', '07:42:39'),
(794, '\"German Felix Rave\"', '2022-09-13', '07:51:55'),
(795, '\"Vanina Caceres\"', '2022-09-13', '07:55:39'),
(796, '\"Gloria Arias\"', '2022-09-13', '07:56:31'),
(797, '\"Zulima Noelia Garay\"', '2022-09-13', '07:56:36'),
(798, '\"Monica Daiana Ojeda\"', '2022-09-13', '07:57:27'),
(799, '\"Mariana Anahi Coranel\"', '2022-09-13', '07:58:46'),
(800, '\"Cecilia Hauff\"', '2022-09-13', '08:03:22'),
(801, '\"admin\"', '2022-09-13', '08:03:58'),
(802, '\"Rosa Cecilia Gimenez\"', '2022-09-13', '08:06:31'),
(803, '\"Jorge Arturo Ferro\"', '2022-09-13', '08:06:45'),
(804, '\"Regina Victoria Leguizamon\"', '2022-09-13', '08:14:21'),
(805, '\"Acevedo Rocio Vanina\"', '2022-09-13', '08:19:27'),
(806, '\"Sabrina Evelyn Gonzalez\"', '2022-09-13', '08:22:37'),
(807, '\"Juan Pablo Fernadez\"', '2022-09-13', '08:26:57'),
(808, '\"Juan manuel Ojeda\"', '2022-09-13', '08:33:52'),
(809, '\"Juan manuel Ojeda\"', '2022-09-13', '08:33:53'),
(810, '\"Sonia Marcela De Philippis\"', '2022-09-13', '08:44:45'),
(811, '\"Regina Victoria Leguizamon\"', '2022-09-13', '11:11:19'),
(812, '\"Vanina Caceres\"', '2022-09-13', '11:27:20'),
(813, '\"Laura Soledad Escobar\"', '2022-09-13', '11:30:31'),
(814, '\"Maria De Los Angeles Ibarra\"', '2022-09-13', '11:44:27'),
(815, '\"admin\"', '2022-09-13', '11:57:57'),
(816, '\"Cecilia Hauff\"', '2022-09-13', '11:59:48'),
(817, '\"German Felix Rave\"', '2022-09-13', '12:00:34'),
(818, '\"Jorge Arturo Ferro\"', '2022-09-13', '12:00:49'),
(819, '\"Juan Pablo Fernadez\"', '2022-09-13', '12:01:11'),
(820, '\"Sabrina Evelyn Gonzalez\"', '2022-09-13', '12:02:51'),
(821, '\"Acevedo Rocio Vanina\"', '2022-09-13', '12:23:33'),
(822, '\"Gloria Arias\"', '2022-09-13', '12:42:13'),
(823, '\"Rosa Cecilia Gimenez\"', '2022-09-13', '12:47:32'),
(824, '\"Mariana Anahi Coranel\"', '2022-09-13', '12:54:42'),
(825, '\"Monica Daiana Ojeda\"', '2022-09-13', '12:59:21'),
(826, '\"Vanina Caceres\"', '2022-09-13', '15:44:24'),
(827, '\"Natalia Valieri\"', '2022-09-13', '15:44:30'),
(828, '\"Maria Soledad Palavecino\"', '2022-09-13', '15:51:49'),
(829, '\"Ronaldo Emmanuel Almiron \"', '2022-09-13', '15:52:58'),
(830, '\"Silvina Ramirez\"', '2022-09-13', '15:54:58'),
(831, '\"Camila Blanca Juarez Amarilla\"', '2022-09-13', '16:01:23'),
(832, '\"Emilia Clarisa Krachinsky\"', '2022-09-13', '16:06:16'),
(833, '\"Nicolas Gallegos\"', '2022-09-13', '16:12:54'),
(834, '\"Liz Mariel Sanchez\"', '2022-09-13', '16:29:47'),
(835, '\"Lorena Saracho Lobos\"', '2022-09-13', '16:35:55'),
(836, '\"Jorge Arturo Ferro\"', '2022-09-13', '16:43:05'),
(837, '\"Cecilia Ayelen Escalante\"', '2022-09-13', '17:02:48'),
(838, '\"Monica Daiana Ojeda\"', '2022-09-13', '17:35:06'),
(839, '\"Emilia Clarisa Krachinsky\"', '2022-09-13', '17:55:32'),
(840, '\"Vanina Caceres\"', '2022-09-13', '18:14:10'),
(841, '\"Jorge Arturo Ferro\"', '2022-09-13', '18:49:09'),
(842, '\"Cecilia Ayelen Escalante\"', '2022-09-13', '19:57:04'),
(843, '\"Ronaldo Emmanuel Almiron \"', '2022-09-13', '20:00:48'),
(844, '\"Camila Blanca Juarez Amarilla\"', '2022-09-13', '20:01:01'),
(845, '\"Maria Soledad Palavecino\"', '2022-09-13', '20:01:06'),
(846, '\"Silvina Ramirez\"', '2022-09-13', '20:01:11'),
(847, '\"Lorena Saracho Lobos\"', '2022-09-13', '20:01:16'),
(848, '\"Nicolas Gallegos\"', '2022-09-13', '20:01:42'),
(849, '\"Liz Mariel Sanchez\"', '2022-09-13', '20:07:36'),
(850, '\"Natalia Valieri\"', '2022-09-13', '20:20:46'),
(851, '\"Matias Rolando Rodriguez\"', '2022-09-14', '07:23:25'),
(852, '\"Mabel Edith Areco\"', '2022-09-14', '07:32:12'),
(853, '\"Maria De Los Angeles Ibarra\"', '2022-09-14', '07:39:27'),
(854, '\"Laura Soledad Escobar\"', '2022-09-14', '07:42:26'),
(855, '\"German Felix Rave\"', '2022-09-14', '07:42:31'),
(856, '\"Vanina Caceres\"', '2022-09-14', '07:53:07'),
(857, '\"Rosa Cecilia Gimenez\"', '2022-09-14', '07:53:21'),
(858, '\"Marcelo Leon\"', '2022-09-14', '07:55:07'),
(859, '\"Roxana Edith Baez\"', '2022-09-14', '07:58:53'),
(860, '\"Cecilia Hauff\"', '2022-09-14', '08:00:27'),
(861, '\"Monica Daiana Ojeda\"', '2022-09-14', '08:00:57'),
(862, '\"Sabrina Evelyn Gonzalez\"', '2022-09-14', '08:03:04'),
(863, '\"Julio Sergio Duran\"', '2022-09-14', '08:04:21'),
(864, '\"admin\"', '2022-09-14', '08:05:21'),
(865, '\"Zulima Noelia Garay\"', '2022-09-14', '08:05:58'),
(866, '\"Acevedo Rocio Vanina\"', '2022-09-14', '08:07:43'),
(867, '\"Lourdes Romina Centurion\"', '2022-09-14', '08:08:47'),
(868, '\"Lourdes Romina Centurion\"', '2022-09-14', '08:08:48'),
(869, '\"Jorge Arturo Ferro\"', '2022-09-14', '08:09:12'),
(870, '\"Juan Pablo Fernadez\"', '2022-09-14', '08:18:04'),
(871, '\"Alfredo Pedro Iznardo\"', '2022-09-14', '08:26:01'),
(872, '\"Juan manuel Ojeda\"', '2022-09-14', '08:40:30'),
(873, '\"Sonia Marcela De Philippis\"', '2022-09-14', '08:40:40'),
(874, '\"Matias Rolando Rodriguez\"', '2022-09-14', '11:40:45'),
(875, '\"Maria De Los Angeles Ibarra\"', '2022-09-14', '11:43:14'),
(876, '\"Sabrina Evelyn Gonzalez\"', '2022-09-14', '11:50:07'),
(877, '\"Laura Soledad Escobar\"', '2022-09-14', '12:00:28');
INSERT INTO `asistencia2` (`id_asistencia2`, `nombre_personal`, `fecha_asistencia`, `hora_asistencia`) VALUES
(878, '\"Jorge Arturo Ferro\"', '2022-09-14', '12:01:03'),
(879, '\"admin\"', '2022-09-14', '12:01:13'),
(880, '\"Juan Pablo Fernadez\"', '2022-09-14', '12:01:21'),
(881, '\"Vanina Caceres\"', '2022-09-14', '12:05:06'),
(882, '\"Acevedo Rocio Vanina\"', '2022-09-14', '12:10:42'),
(883, '\"Acevedo Rocio Vanina\"', '2022-09-14', '12:10:42'),
(884, '\"Rosa Cecilia Gimenez\"', '2022-09-14', '12:39:08'),
(885, '\"Mariana Anahi Coranel\"', '2022-09-14', '12:46:48'),
(886, '\"Gloria Arias\"', '2022-09-14', '12:48:50'),
(887, '\"Alfredo Pedro Iznardo\"', '2022-09-14', '12:49:19'),
(888, '\"Julio Sergio Duran\"', '2022-09-14', '12:53:39'),
(889, '\"Marcelo Leon\"', '2022-09-14', '12:53:51'),
(890, '\"Monica Daiana Ojeda\"', '2022-09-14', '13:00:48'),
(891, '\"Roxana Edith Baez\"', '2022-09-14', '13:02:24'),
(892, '\"Lourdes Romina Centurion\"', '2022-09-14', '13:02:40'),
(893, '\"Sonia Marcela De Philippis\"', '2022-09-14', '13:03:55'),
(894, '\"Mabel Edith Areco\"', '2022-09-14', '13:15:58'),
(895, '\"Natalia Valieri\"', '2022-09-14', '15:46:18'),
(896, '\"Cecilia Ayelen Escalante\"', '2022-09-14', '15:51:04'),
(897, '\"Silvina Ramirez\"', '2022-09-14', '15:54:30'),
(898, '\"Maria Soledad Palavecino\"', '2022-09-14', '15:55:54'),
(899, '\"Gloria Estela Monzon\"', '2022-09-14', '15:58:46'),
(900, '\"Ronaldo Emmanuel Almiron \"', '2022-09-14', '16:12:10'),
(901, '\"Liz Mariel Sanchez\"', '2022-09-14', '16:21:21'),
(902, '\"Liz Mariel Sanchez\"', '2022-09-14', '16:21:26'),
(903, '\"Gaston Flores\"', '2022-09-14', '16:29:11'),
(904, '\"Lorena Saracho Lobos\"', '2022-09-14', '16:40:14'),
(905, '\"Zulima Noelia Garay\"', '2022-09-14', '17:01:48'),
(906, '\"Mariana Anahi Coranel\"', '2022-09-14', '17:01:54'),
(907, '\"Lourdes Romina Centurion\"', '2022-09-14', '17:23:07'),
(908, '\"Monica Daiana Ojeda\"', '2022-09-14', '17:27:58'),
(909, '\"Lourdes Romina Centurion\"', '2022-09-14', '19:26:46'),
(910, '\"Silvina Ramirez\"', '2022-09-14', '19:54:20'),
(911, '\"Gaston Flores\"', '2022-09-14', '19:55:09'),
(912, '\"Maria Soledad Palavecino\"', '2022-09-14', '19:55:29'),
(913, '\"Cecilia Ayelen Escalante\"', '2022-09-14', '19:56:54'),
(914, '\"Mariana Anahi Coranel\"', '2022-09-14', '19:57:12'),
(915, '\"Gloria Estela Monzon\"', '2022-09-14', '19:57:50'),
(916, '\"Lorena Saracho Lobos\"', '2022-09-14', '19:59:03'),
(917, '\"Ronaldo Emmanuel Almiron \"', '2022-09-14', '19:59:13'),
(918, '\"Liz Mariel Sanchez\"', '2022-09-14', '19:59:27'),
(919, '\"Natalia Valieri\"', '2022-09-14', '20:15:54'),
(920, '\"Matias Rolando Rodriguez\"', '2022-09-15', '07:21:01'),
(921, '\"Maria De Los Angeles Ibarra\"', '2022-09-15', '07:35:29'),
(922, '\"Roxana Edith Baez\"', '2022-09-15', '07:45:52'),
(923, '\"Alfredo Pedro Iznardo\"', '2022-09-15', '07:52:59'),
(924, '\"Monica Daiana Ojeda\"', '2022-09-15', '07:57:06'),
(925, '\"Cecilia Hauff\"', '2022-09-15', '07:57:36'),
(926, '\"Mariana Anahi Coranel\"', '2022-09-15', '07:57:45'),
(927, '\"Zulima Noelia Garay\"', '2022-09-15', '07:58:17'),
(928, '\"Gloria Arias\"', '2022-09-15', '07:58:24'),
(929, '\"Julio Sergio Duran\"', '2022-09-15', '08:01:39'),
(930, '\"Sabrina Evelyn Gonzalez\"', '2022-09-15', '08:01:45'),
(931, '\"admin\"', '2022-09-15', '08:05:37'),
(932, '\"Vanina Caceres\"', '2022-09-15', '08:10:23'),
(933, '\"Jorge Arturo Ferro\"', '2022-09-15', '08:11:52'),
(934, '\"Nadia Itati Romero\"', '2022-09-15', '08:12:31'),
(935, '\"Regina Victoria Leguizamon\"', '2022-09-15', '08:13:18'),
(936, '\"Juan manuel Ojeda\"', '2022-09-15', '08:19:58'),
(937, '\"Acevedo Rocio Vanina\"', '2022-09-15', '08:21:30'),
(938, '\"Lourdes Romina Centurion\"', '2022-09-15', '08:24:37'),
(939, '\"\"', '2022-09-15', '08:51:48'),
(940, '\"Yanina Cardozo\"', '2022-09-15', '08:51:54'),
(941, '\"Rosa Cecilia Gimenez\"', '2022-09-15', '09:06:46'),
(942, '\"Regina Victoria Leguizamon\"', '2022-09-15', '11:06:53'),
(943, '\"Vanina Caceres\"', '2022-09-15', '11:15:05'),
(944, '\"Maria De Los Angeles Ibarra\"', '2022-09-15', '11:45:19'),
(945, '\"Matias Rolando Rodriguez\"', '2022-09-15', '11:47:34'),
(946, '\"Jorge Arturo Ferro\"', '2022-09-15', '12:00:43'),
(947, '\"admin\"', '2022-09-15', '12:01:54'),
(948, '\"Yanina Cardozo\"', '2022-09-15', '12:02:46'),
(949, '\"Sabrina Evelyn Gonzalez\"', '2022-09-15', '12:06:59'),
(950, '\"Nadia Itati Romero\"', '2022-09-15', '12:12:38'),
(951, '\"Acevedo Rocio Vanina\"', '2022-09-15', '12:17:35'),
(952, '\"Gloria Arias\"', '2022-09-15', '12:38:24'),
(953, '\"Monica Daiana Ojeda\"', '2022-09-15', '12:40:37'),
(954, '\"Alfredo Pedro Iznardo\"', '2022-09-15', '12:44:49'),
(955, '\"Roxana Edith Baez\"', '2022-09-15', '12:45:44'),
(956, '\"Julio Sergio Duran\"', '2022-09-15', '12:52:31'),
(957, '\"Julio Sergio Duran\"', '2022-09-15', '12:52:31'),
(958, '\"Rosa Cecilia Gimenez\"', '2022-09-15', '12:55:42'),
(959, '\"Lourdes Romina Centurion\"', '2022-09-15', '12:55:50'),
(960, '\"Cecilia Hauff\"', '2022-09-15', '12:57:33'),
(961, '\"Mariana Anahi Coranel\"', '2022-09-15', '12:58:34'),
(962, '\"Jorge Arturo Ferro\"', '2022-09-15', '15:53:09'),
(963, '\"Vanina Caceres\"', '2022-09-15', '15:53:51'),
(964, '\"Silvina Ramirez\"', '2022-09-15', '15:55:04'),
(965, '\"Ronaldo Emmanuel Almiron \"', '2022-09-15', '16:00:10'),
(966, '\"Camila Blanca Juarez Amarilla\"', '2022-09-15', '16:03:48'),
(967, '\"Gloria Estela Monzon\"', '2022-09-15', '16:06:07'),
(968, '\"Liz Mariel Sanchez\"', '2022-09-15', '16:08:00'),
(969, '\"Cecilia Ayelen Escalante\"', '2022-09-15', '16:08:42'),
(970, '\"Maria De Los Angeles Ibarra\"', '2022-09-15', '16:16:39'),
(971, '\"Lorena Saracho Lobos\"', '2022-09-15', '16:18:18'),
(972, '\"Zulima Noelia Garay\"', '2022-09-15', '16:21:21'),
(973, '\"Nicolas Gallegos\"', '2022-09-15', '16:22:36'),
(974, '\"Juan Pablo Fernadez\"', '2022-09-15', '16:56:03'),
(975, '\"Roxana Edith Baez\"', '2022-09-15', '17:09:48'),
(976, '\"Rosa Cecilia Gimenez\"', '2022-09-15', '17:18:17'),
(977, '\"Jorge Arturo Ferro\"', '2022-09-15', '17:55:49'),
(978, '\"Monica Daiana Ojeda\"', '2022-09-15', '17:58:10'),
(979, '\"Cecilia Hauff\"', '2022-09-15', '17:59:05'),
(980, '\"Maria De Los Angeles Ibarra\"', '2022-09-15', '18:16:32'),
(981, '\"Vanina Caceres\"', '2022-09-15', '18:38:07'),
(982, '\"Rosa Cecilia Gimenez\"', '2022-09-15', '18:39:34'),
(983, '\"Roxana Edith Baez\"', '2022-09-15', '18:47:56'),
(984, '\"Cecilia Hauff\"', '2022-09-15', '19:57:36'),
(985, '\"Cecilia Ayelen Escalante\"', '2022-09-15', '19:57:47'),
(986, '\"Ronaldo Emmanuel Almiron \"', '2022-09-15', '20:00:30'),
(987, '\"Camila Blanca Juarez Amarilla\"', '2022-09-15', '20:01:01'),
(988, '\"Lorena Saracho Lobos\"', '2022-09-15', '20:01:12'),
(989, '\"Silvina Ramirez\"', '2022-09-15', '20:01:23'),
(990, '\"Nicolas Gallegos\"', '2022-09-15', '20:01:51'),
(991, '\"Gloria Estela Monzon\"', '2022-09-15', '20:03:09'),
(992, '\"Juan Pablo Fernadez\"', '2022-09-15', '20:05:08'),
(993, '\"Liz Mariel Sanchez\"', '2022-09-15', '20:13:06'),
(994, '\"Monica Daiana Ojeda\"', '2022-09-15', '20:21:45'),
(995, '\"Zulima Noelia Garay\"', '2022-09-15', '20:22:15'),
(996, '\"Mabel Edith Areco\"', '2022-09-16', '07:21:17'),
(997, '\"Matias Rolando Rodriguez\"', '2022-09-16', '07:22:29'),
(998, '\"Laura Soledad Escobar\"', '2022-09-16', '07:49:07'),
(999, '\"Marcelo Leon\"', '2022-09-16', '07:49:13'),
(1000, '\"Mariana Anahi Coranel\"', '2022-09-16', '07:54:30'),
(1001, '\"Vanina Caceres\"', '2022-09-16', '07:55:51'),
(1002, '\"Maria De Los Angeles Ibarra\"', '2022-09-16', '07:58:20'),
(1003, '\"Gloria Arias\"', '2022-09-16', '07:59:10'),
(1004, '\"Roxana Edith Baez\"', '2022-09-16', '07:59:16'),
(1005, '\"Cecilia Hauff\"', '2022-09-16', '08:01:19'),
(1006, '\"Jorge Arturo Ferro\"', '2022-09-16', '08:04:45'),
(1007, '\"Sabrina Evelyn Gonzalez\"', '2022-09-16', '08:05:50'),
(1008, '\"Zulima Noelia Garay\"', '2022-09-16', '08:06:35'),
(1009, '\"Monica Daiana Ojeda\"', '2022-09-16', '08:06:52'),
(1010, '\"Julio Sergio Duran\"', '2022-09-16', '08:08:32'),
(1011, '\"Lourdes Romina Centurion\"', '2022-09-16', '08:17:00'),
(1012, '\"Juan manuel Ojeda\"', '2022-09-16', '08:22:05'),
(1013, '\"Sonia Marcela De Philippis\"', '2022-09-16', '08:43:23'),
(1014, '\"Yanina Cardozo\"', '2022-09-16', '08:44:41'),
(1015, '\"Vanina Caceres\"', '2022-09-16', '11:08:11'),
(1016, '\"Matias Rolando Rodriguez\"', '2022-09-16', '11:29:59'),
(1017, '\"Maria De Los Angeles Ibarra\"', '2022-09-16', '11:57:09'),
(1018, '\"Sabrina Evelyn Gonzalez\"', '2022-09-16', '11:59:27'),
(1019, '\"Laura Soledad Escobar\"', '2022-09-16', '12:00:40'),
(1020, '\"Jorge Arturo Ferro\"', '2022-09-16', '12:04:34'),
(1021, '\"Gloria Arias\"', '2022-09-16', '12:42:53'),
(1022, '\"Marcelo Leon\"', '2022-09-16', '12:48:40'),
(1023, '\"Monica Daiana Ojeda\"', '2022-09-16', '12:52:00'),
(1024, '\"Sonia Marcela De Philippis\"', '2022-09-16', '12:58:16'),
(1025, '\"Lourdes Romina Centurion\"', '2022-09-16', '13:04:05'),
(1026, '\"Roxana Edith Baez\"', '2022-09-16', '13:05:14'),
(1027, '\"Cecilia Hauff\"', '2022-09-16', '13:06:12'),
(1028, '\"Mariana Anahi Coranel\"', '2022-09-16', '13:06:17'),
(1029, '\"Mabel Edith Areco\"', '2022-09-16', '13:08:10'),
(1030, '\"Natalia Valieri\"', '2022-09-16', '15:46:40'),
(1031, '\"Maria Soledad Palavecino\"', '2022-09-16', '15:48:24'),
(1032, '\"Liz Mariel Sanchez\"', '2022-09-16', '15:48:54'),
(1033, '\"Emilia Clarisa Krachinsky\"', '2022-09-16', '16:01:44'),
(1034, '\"Gloria Estela Monzon\"', '2022-09-16', '16:01:59'),
(1035, '\"Camila Blanca Juarez Amarilla\"', '2022-09-16', '16:03:11'),
(1036, '\"Ronaldo Emmanuel Almiron \"', '2022-09-16', '16:03:37'),
(1037, '\"Lorena Saracho Lobos\"', '2022-09-16', '16:14:27'),
(1038, '\"Fernando Beron\"', '2022-09-16', '16:16:46'),
(1039, '\"Cecilia Ayelen Escalante\"', '2022-09-16', '16:21:20'),
(1040, '\"Lourdes Romina Centurion\"', '2022-09-16', '16:35:52'),
(1041, '\"Gaston Flores\"', '2022-09-16', '17:09:57'),
(1042, '\"Monica Daiana Ojeda\"', '2022-09-16', '17:30:08'),
(1043, '\"Mariana Anahi Coranel\"', '2022-09-16', '17:53:18'),
(1044, '\"Emilia Clarisa Krachinsky\"', '2022-09-16', '19:50:29'),
(1045, '\"Gloria Estela Monzon\"', '2022-09-16', '19:56:00'),
(1046, '\"Lorena Saracho Lobos\"', '2022-09-16', '19:58:05'),
(1047, '\"Maria Soledad Palavecino\"', '2022-09-16', '19:59:35'),
(1048, '\"Ronaldo Emmanuel Almiron \"', '2022-09-16', '20:00:00'),
(1049, '\"Liz Mariel Sanchez\"', '2022-09-16', '20:00:33'),
(1050, '\"Camila Blanca Juarez Amarilla\"', '2022-09-16', '20:00:41'),
(1051, '\"Fernando Beron\"', '2022-09-16', '20:04:31'),
(1052, '\"Gaston Flores\"', '2022-09-16', '20:05:09'),
(1053, '\"Mariana Anahi Coranel\"', '2022-09-16', '20:06:24'),
(1054, '\"Natalia Valieri\"', '2022-09-16', '20:07:43'),
(1055, '\"Mabel Edith Areco\"', '2022-09-17', '07:59:10'),
(1056, '\"Lorena Saracho Lobos\"', '2022-09-17', '08:13:55'),
(1057, '\"Lorena Saracho Lobos\"', '2022-09-17', '12:05:59'),
(1058, '\"Mabel Edith Areco\"', '2022-09-17', '12:06:41'),
(1059, '\"Ronaldo Emmanuel Almiron \"', '2022-09-17', '16:03:35'),
(1060, '\"Regina Victoria Leguizamon\"', '2022-09-17', '16:17:29'),
(1061, '\"Ronaldo Emmanuel Almiron \"', '2022-09-17', '20:00:36'),
(1062, '\"Regina Victoria Leguizamon\"', '2022-09-17', '20:00:43'),
(1063, '\"Matias Rolando Rodriguez\"', '2022-09-19', '07:24:43'),
(1064, '\"Laura Soledad Escobar\"', '2022-09-19', '07:43:18'),
(1065, '\"Zulima Noelia Garay\"', '2022-09-19', '07:51:08'),
(1066, '\"Vanina Caceres\"', '2022-09-19', '07:53:26'),
(1067, '\"Gloria Arias\"', '2022-09-19', '07:55:55'),
(1068, '\"Cecilia Hauff\"', '2022-09-19', '07:56:21'),
(1069, '\"Mariana Anahi Coranel\"', '2022-09-19', '07:56:25'),
(1070, '\"Roxana Edith Baez\"', '2022-09-19', '07:57:16'),
(1071, '\"Jorge Arturo Ferro\"', '2022-09-19', '08:02:05'),
(1072, '\"Sabrina Evelyn Gonzalez\"', '2022-09-19', '08:03:12'),
(1073, '\"Nadia Itati Romero\"', '2022-09-19', '08:06:26'),
(1074, '\"admin\"', '2022-09-19', '08:09:19'),
(1075, '\"Rosa Cecilia Gimenez\"', '2022-09-19', '08:09:56'),
(1076, '\"\"', '2022-09-19', '08:12:30'),
(1077, '\"Regina Victoria Leguizamon\"', '2022-09-19', '08:12:34'),
(1078, '\"Mabel Edith Areco\"', '2022-09-19', '08:12:52'),
(1079, '\"Juan manuel Ojeda\"', '2022-09-19', '08:14:41'),
(1080, '\"Emilia Clarisa Krachinsky\"', '2022-09-19', '08:14:55'),
(1081, '\"Julio Sergio Duran\"', '2022-09-19', '08:16:05'),
(1082, '\"Juan Pablo Fernadez\"', '2022-09-19', '08:17:01'),
(1083, '\"Martin Emanuel Canesin Rojas\"', '2022-09-19', '08:17:09'),
(1084, '\"Acevedo Rocio Vanina\"', '2022-09-19', '08:17:27'),
(1085, '\"Maria De Los Angeles Ibarra\"', '2022-09-19', '08:17:41'),
(1086, '\"Lourdes Romina Centurion\"', '2022-09-19', '08:19:18'),
(1087, '\"Sonia Marcela De Philippis\"', '2022-09-19', '08:33:36'),
(1088, '\"Regina Victoria Leguizamon\"', '2022-09-19', '11:11:38'),
(1089, '\"Matias Rolando Rodriguez\"', '2022-09-19', '11:31:39'),
(1090, '\"Emilia Clarisa Krachinsky\"', '2022-09-19', '11:56:23'),
(1091, '\"Maria De Los Angeles Ibarra\"', '2022-09-19', '11:56:55'),
(1092, '\"Laura Soledad Escobar\"', '2022-09-19', '12:00:25'),
(1093, '\"admin\"', '2022-09-19', '12:01:05'),
(1094, '\"Jorge Arturo Ferro\"', '2022-09-19', '12:01:46'),
(1095, '\"Juan Pablo Fernadez\"', '2022-09-19', '12:02:10'),
(1096, '\"Sabrina Evelyn Gonzalez\"', '2022-09-19', '12:02:17'),
(1097, '\"Nadia Itati Romero\"', '2022-09-19', '12:06:00'),
(1098, '\"Vanina Caceres\"', '2022-09-19', '12:06:54'),
(1099, '\"Cecilia Hauff\"', '2022-09-19', '12:11:05'),
(1100, '\"Martin Emanuel Canesin Rojas\"', '2022-09-19', '12:14:11'),
(1101, '\"Acevedo Rocio Vanina\"', '2022-09-19', '12:23:13'),
(1102, '\"Monica Daiana Ojeda\"', '2022-09-19', '12:40:07'),
(1103, '\"Gloria Arias\"', '2022-09-19', '12:43:25'),
(1104, '\"Roxana Edith Baez\"', '2022-09-19', '12:50:05'),
(1105, '\"Sonia Marcela De Philippis\"', '2022-09-19', '12:57:10'),
(1106, '\"Lourdes Romina Centurion\"', '2022-09-19', '12:57:23'),
(1107, '\"Rosa Cecilia Gimenez\"', '2022-09-19', '12:57:31'),
(1108, '\"Julio Sergio Duran\"', '2022-09-19', '12:57:53'),
(1109, '\"Mabel Edith Areco\"', '2022-09-19', '13:00:39'),
(1110, '\"Silvina Ramirez\"', '2022-09-19', '15:54:40'),
(1111, '\"Maria Soledad Palavecino\"', '2022-09-19', '15:55:19'),
(1112, '\"Cecilia Ayelen Escalante\"', '2022-09-19', '16:01:03'),
(1113, '\"Camila Blanca Juarez Amarilla\"', '2022-09-19', '16:05:15'),
(1114, '\"Fernando Beron\"', '2022-09-19', '16:07:41'),
(1115, '\"Nicolas Gallegos\"', '2022-09-19', '16:08:19'),
(1116, '\"Lorena Saracho Lobos\"', '2022-09-19', '16:23:28'),
(1117, '\"Liz Mariel Sanchez\"', '2022-09-19', '16:40:44'),
(1118, '\"Gloria Arias\"', '2022-09-19', '16:53:07'),
(1119, '\"Monica Daiana Ojeda\"', '2022-09-19', '17:19:02'),
(1120, '\"Rosa Cecilia Gimenez\"', '2022-09-19', '17:31:00'),
(1121, '\"Cecilia Hauff\"', '2022-09-19', '17:34:41'),
(1122, '\"Maria Soledad Palavecino\"', '2022-09-19', '19:32:29'),
(1123, '\"Maria Soledad Palavecino\"', '2022-09-19', '19:32:55'),
(1124, '\"Rosa Cecilia Gimenez\"', '2022-09-19', '19:33:05'),
(1125, '\"Gloria Arias\"', '2022-09-19', '19:34:17'),
(1126, '\"Camila Blanca Juarez Amarilla\"', '2022-09-19', '20:00:25'),
(1127, '\"Silvina Ramirez\"', '2022-09-19', '20:01:02'),
(1128, '\"Lorena Saracho Lobos\"', '2022-09-19', '20:01:10'),
(1129, '\"Nicolas Gallegos\"', '2022-09-19', '20:04:33'),
(1130, '\"Mariana Anahi Coranel\"', '2022-09-19', '20:04:40'),
(1131, '\"Mariana Anahi Coranel\"', '2022-09-19', '20:04:45'),
(1132, '\"Cecilia Hauff\"', '2022-09-19', '20:05:34'),
(1133, '\"Fernando Beron\"', '2022-09-19', '20:10:22'),
(1134, '\"Liz Mariel Sanchez\"', '2022-09-19', '20:10:44'),
(1135, '\"Mabel Edith Areco\"', '2022-09-20', '07:30:36'),
(1136, '\"Maria De Los Angeles Ibarra\"', '2022-09-20', '07:37:28'),
(1137, '\"Matias Rolando Rodriguez\"', '2022-09-20', '07:40:28'),
(1138, '\"Laura Soledad Escobar\"', '2022-09-20', '07:43:15'),
(1139, '\"Vanina Caceres\"', '2022-09-20', '07:48:43'),
(1140, '\"Mariana Anahi Coranel\"', '2022-09-20', '07:51:46'),
(1141, '\"Cecilia Hauff\"', '2022-09-20', '07:52:54'),
(1142, '\"Marcelo Leon\"', '2022-09-20', '07:53:09'),
(1143, '\"Gloria Arias\"', '2022-09-20', '07:57:41'),
(1144, '\"admin\"', '2022-09-20', '07:59:22'),
(1145, '\"Sabrina Evelyn Gonzalez\"', '2022-09-20', '08:00:20'),
(1146, '\"Roxana Edith Baez\"', '2022-09-20', '08:01:26'),
(1147, '\"Monica Daiana Ojeda\"', '2022-09-20', '08:02:43'),
(1148, '\"Nadia Itati Romero\"', '2022-09-20', '08:03:55'),
(1149, '\"Lourdes Romina Centurion\"', '2022-09-20', '08:04:31'),
(1150, '\"Rosa Cecilia Gimenez\"', '2022-09-20', '08:10:11'),
(1151, '\"\"', '2022-09-20', '08:11:46'),
(1152, '\"Regina Victoria Leguizamon\"', '2022-09-20', '08:11:46'),
(1153, '\"Martin Emanuel Canesin Rojas\"', '2022-09-20', '08:12:21'),
(1154, '\"Jorge Arturo Ferro\"', '2022-09-20', '08:12:27'),
(1155, '\"Juan manuel Ojeda\"', '2022-09-20', '08:38:31'),
(1156, '\"Emilia Clarisa Krachinsky\"', '2022-09-20', '08:42:34'),
(1157, '\"Sonia Marcela De Philippis\"', '2022-09-20', '08:42:40'),
(1158, '\"Juan Pablo Fernadez\"', '2022-09-20', '08:43:04'),
(1159, '\"Julio Sergio Duran\"', '2022-09-20', '08:44:32'),
(1160, '\"Regina Victoria Leguizamon\"', '2022-09-20', '10:09:13'),
(1161, '\"Matias Rolando Rodriguez\"', '2022-09-20', '11:17:10'),
(1162, '\"Maria De Los Angeles Ibarra\"', '2022-09-20', '11:38:11'),
(1163, '\"admin\"', '2022-09-20', '11:57:18'),
(1164, '\"Sabrina Evelyn Gonzalez\"', '2022-09-20', '11:59:43'),
(1165, '\"Nadia Itati Romero\"', '2022-09-20', '12:00:19'),
(1166, '\"Laura Soledad Escobar\"', '2022-09-20', '12:00:26'),
(1167, '\"Jorge Arturo Ferro\"', '2022-09-20', '12:01:00'),
(1168, '\"Emilia Clarisa Krachinsky\"', '2022-09-20', '12:02:14'),
(1169, '\"Juan Pablo Fernadez\"', '2022-09-20', '12:03:34'),
(1170, '\"Vanina Caceres\"', '2022-09-20', '12:05:40'),
(1171, '\"Martin Emanuel Canesin Rojas\"', '2022-09-20', '12:05:56'),
(1172, '\"Gloria Arias\"', '2022-09-20', '12:47:08'),
(1173, '\"Monica Daiana Ojeda\"', '2022-09-20', '12:48:56'),
(1174, '\"Cecilia Hauff\"', '2022-09-20', '12:55:17'),
(1175, '\"Mariana Anahi Coranel\"', '2022-09-20', '12:57:01'),
(1176, '\"Rosa Cecilia Gimenez\"', '2022-09-20', '12:59:58'),
(1177, '\"Julio Sergio Duran\"', '2022-09-20', '13:00:22'),
(1178, '\"Marcelo Leon\"', '2022-09-20', '13:00:45'),
(1179, '\"Lourdes Romina Centurion\"', '2022-09-20', '13:01:19'),
(1180, '\"Roxana Edith Baez\"', '2022-09-20', '13:01:39'),
(1181, '\"Sonia Marcela De Philippis\"', '2022-09-20', '13:07:18'),
(1182, '\"Mabel Edith Areco\"', '2022-09-20', '15:09:58'),
(1183, '\"Vanina Caceres\"', '2022-09-20', '15:17:37'),
(1184, '\"Natalia Valieri\"', '2022-09-20', '15:48:19'),
(1185, '\"Maria Soledad Palavecino\"', '2022-09-20', '15:49:49'),
(1186, '\"Ronaldo Emmanuel Almiron \"', '2022-09-20', '15:52:11'),
(1187, '\"Silvina Ramirez\"', '2022-09-20', '15:55:35'),
(1188, '\"Camila Blanca Juarez Amarilla\"', '2022-09-20', '15:57:12'),
(1189, '\"Liz Mariel Sanchez\"', '2022-09-20', '16:02:44'),
(1190, '\"Emilia Clarisa Krachinsky\"', '2022-09-20', '16:05:42'),
(1191, '\"Gloria Estela Monzon\"', '2022-09-20', '16:06:04'),
(1192, '\"Cecilia Ayelen Escalante\"', '2022-09-20', '16:06:45'),
(1193, '\"Fernando Beron\"', '2022-09-20', '16:27:33'),
(1194, '\"Lorena Saracho Lobos\"', '2022-09-20', '16:34:59'),
(1195, '\"Gaston Flores\"', '2022-09-20', '16:49:27'),
(1196, '\"Mariana Anahi Coranel\"', '2022-09-20', '16:56:05'),
(1197, '\"Roxana Edith Baez\"', '2022-09-20', '17:15:48'),
(1198, '\"Monica Daiana Ojeda\"', '2022-09-20', '17:36:32'),
(1199, '\"Emilia Clarisa Krachinsky\"', '2022-09-20', '18:01:11'),
(1200, '\"Juan Pablo Fernadez\"', '2022-09-20', '18:13:18'),
(1201, '\"Maria De Los Angeles Ibarra\"', '2022-09-20', '18:22:14'),
(1202, '\"Cecilia Hauff\"', '2022-09-20', '18:28:38'),
(1203, '\"Vanina Caceres\"', '2022-09-20', '18:31:33'),
(1204, '\"Juan Pablo Fernadez\"', '2022-09-20', '18:31:46'),
(1205, '\"Roxana Edith Baez\"', '2022-09-20', '19:15:50'),
(1206, '\"Natalia Valieri\"', '2022-09-20', '19:49:30'),
(1207, '\"Lorena Saracho Lobos\"', '2022-09-20', '19:49:47'),
(1208, '\"Maria Soledad Palavecino\"', '2022-09-20', '19:49:55'),
(1209, '\"Ronaldo Emmanuel Almiron \"', '2022-09-20', '19:51:50'),
(1210, '\"Silvina Ramirez\"', '2022-09-20', '19:52:10'),
(1211, '\"Camila Blanca Juarez Amarilla\"', '2022-09-20', '19:56:44'),
(1212, '\"Gloria Estela Monzon\"', '2022-09-20', '19:58:08'),
(1213, '\"Fernando Beron\"', '2022-09-20', '20:01:32'),
(1214, '\"Gaston Flores\"', '2022-09-20', '20:10:34'),
(1215, '\"Juan manuel Ojeda\"', '2022-09-20', '20:10:44'),
(1216, '\"Liz Mariel Sanchez\"', '2022-09-20', '20:11:19'),
(1217, '\"Gaston Flores\"', '2022-09-20', '20:11:32'),
(1218, '\"Gaston Flores\"', '2022-09-20', '20:11:37'),
(1219, '\"Gaston Flores\"', '2022-09-20', '20:12:04'),
(1220, '\"Gaston Flores\"', '2022-09-20', '20:12:09'),
(1221, '\"Cecilia Hauff\"', '2022-09-20', '21:10:06'),
(1222, '\"Matias Rolando Rodriguez\"', '2022-09-21', '07:19:43'),
(1223, '\"Laura Soledad Escobar\"', '2022-09-21', '07:38:59'),
(1224, '\"Lourdes Romina Centurion\"', '2022-09-21', '07:55:23'),
(1225, '\"Gloria Arias\"', '2022-09-21', '07:55:49'),
(1226, '\"Jorge Arturo Ferro\"', '2022-09-21', '08:00:27'),
(1227, '\"Juan Pablo Fernadez\"', '2022-09-21', '08:03:37'),
(1228, '\"Julio Sergio Duran\"', '2022-09-21', '08:04:16'),
(1229, '\"Zulima Noelia Garay\"', '2022-09-21', '08:04:53'),
(1230, '\"Nadia Itati Romero\"', '2022-09-21', '08:05:08'),
(1231, '\"Sabrina Evelyn Gonzalez\"', '2022-09-21', '08:06:34'),
(1232, '\"admin\"', '2022-09-21', '08:07:25'),
(1233, '\"Martin Emanuel Canesin Rojas\"', '2022-09-21', '08:09:47'),
(1234, '\"Juan manuel Ojeda\"', '2022-09-21', '08:15:08'),
(1235, '\"Maria De Los Angeles Ibarra\"', '2022-09-21', '08:18:06'),
(1236, '\"Rosa Cecilia Gimenez\"', '2022-09-21', '08:18:44'),
(1237, '\"Sonia Marcela De Philippis\"', '2022-09-21', '08:47:13'),
(1238, '\"Matias Rolando Rodriguez\"', '2022-09-21', '11:31:43'),
(1239, '\"Maria De Los Angeles Ibarra\"', '2022-09-21', '11:56:04'),
(1240, '\"Laura Soledad Escobar\"', '2022-09-21', '12:00:43'),
(1241, '\"Nadia Itati Romero\"', '2022-09-21', '12:01:43'),
(1242, '\"Juan Pablo Fernadez\"', '2022-09-21', '12:03:17'),
(1243, '\"admin\"', '2022-09-21', '12:03:22'),
(1244, '\"Martin Emanuel Canesin Rojas\"', '2022-09-21', '12:05:01'),
(1245, '\"Sabrina Evelyn Gonzalez\"', '2022-09-21', '12:10:40'),
(1246, '\"Mariana Anahi Coranel\"', '2022-09-21', '12:38:17'),
(1247, '\"Mariana Anahi Coranel\"', '2022-09-21', '12:38:17'),
(1248, '\"Mariana Anahi Coranel\"', '2022-09-21', '12:38:22'),
(1249, '\"Cecilia Hauff\"', '2022-09-21', '12:38:38'),
(1250, '\"Gloria Arias\"', '2022-09-21', '12:48:05'),
(1251, '\"Sonia Marcela De Philippis\"', '2022-09-21', '12:59:20'),
(1252, '\"Lourdes Romina Centurion\"', '2022-09-21', '12:59:42'),
(1253, '\"Julio Sergio Duran\"', '2022-09-21', '12:59:50'),
(1254, '\"Rosa Cecilia Gimenez\"', '2022-09-21', '12:59:55'),
(1255, '\"Natalia Valieri\"', '2022-09-21', '15:46:57'),
(1256, '\"Ronaldo Emmanuel Almiron \"', '2022-09-21', '15:54:20'),
(1257, '\"Liz Mariel Sanchez\"', '2022-09-21', '15:55:36'),
(1258, '\"Maria Soledad Palavecino\"', '2022-09-21', '15:55:39'),
(1259, '\"Silvina Ramirez\"', '2022-09-21', '15:55:45'),
(1260, '\"Sonia Marcela De Philippis\"', '2022-09-21', '15:56:30'),
(1261, '\"Gaston Flores\"', '2022-09-21', '16:00:54'),
(1262, '\"Cecilia Ayelen Escalante\"', '2022-09-21', '16:00:58'),
(1263, '\"Gloria Estela Monzon\"', '2022-09-21', '16:09:52'),
(1264, '\"Lorena Saracho Lobos\"', '2022-09-21', '16:14:02'),
(1265, '\"Lourdes Romina Centurion\"', '2022-09-21', '16:17:50'),
(1266, '\"Camila Blanca Juarez Amarilla\"', '2022-09-21', '16:19:13'),
(1267, '\"Jorge Arturo Ferro\"', '2022-09-21', '17:27:15'),
(1268, '\"Monica Daiana Ojeda\"', '2022-09-21', '17:45:26'),
(1269, '\"Nicolas Gallegos\"', '2022-09-21', '17:56:06'),
(1270, '\"Sonia Marcela De Philippis\"', '2022-09-21', '17:56:11'),
(1271, '\"Gloria Arias\"', '2022-09-21', '17:58:23'),
(1272, '\"Lourdes Romina Centurion\"', '2022-09-21', '19:04:54'),
(1273, '\"Monica Daiana Ojeda\"', '2022-09-21', '19:23:53'),
(1274, '\"Jorge Arturo Ferro\"', '2022-09-21', '19:33:55'),
(1275, '\"Maria Soledad Palavecino\"', '2022-09-21', '19:54:38'),
(1276, '\"Silvina Ramirez\"', '2022-09-21', '19:55:07'),
(1277, '\"Ronaldo Emmanuel Almiron \"', '2022-09-21', '19:56:50'),
(1278, '\"Lorena Saracho Lobos\"', '2022-09-21', '19:57:44'),
(1279, '\"Gloria Arias\"', '2022-09-21', '19:59:54'),
(1280, '\"Liz Mariel Sanchez\"', '2022-09-21', '20:00:07'),
(1281, '\"Camila Blanca Juarez Amarilla\"', '2022-09-21', '20:00:12'),
(1282, '\"Gloria Estela Monzon\"', '2022-09-21', '20:01:00'),
(1283, '\"Nicolas Gallegos\"', '2022-09-21', '20:02:03'),
(1284, '\"Gaston Flores\"', '2022-09-21', '20:03:14'),
(1285, '\"Cecilia Ayelen Escalante\"', '2022-09-21', '20:05:36'),
(1286, '\"Natalia Valieri\"', '2022-09-21', '20:06:19'),
(1287, '\"Laura Soledad Escobar\"', '2022-09-22', '07:08:24'),
(1288, '\"Mabel Edith Areco\"', '2022-09-22', '07:25:47'),
(1289, '\"Vanina Caceres\"', '2022-09-22', '07:30:23'),
(1290, '\"Maria De Los Angeles Ibarra\"', '2022-09-22', '07:34:45'),
(1291, '\"Rosa Cecilia Gimenez\"', '2022-09-22', '07:47:06'),
(1292, '\"Gloria Arias\"', '2022-09-22', '07:54:08'),
(1293, '\"Julio Sergio Duran\"', '2022-09-22', '07:56:42'),
(1294, '\"Zulima Noelia Garay\"', '2022-09-22', '07:57:17'),
(1295, '\"Mariana Anahi Coranel\"', '2022-09-22', '08:01:49'),
(1296, '\"Nadia Itati Romero\"', '2022-09-22', '08:02:21'),
(1297, '\"Lourdes Romina Centurion\"', '2022-09-22', '08:05:10'),
(1298, '\"Cecilia Hauff\"', '2022-09-22', '08:05:15'),
(1299, '\"admin\"', '2022-09-22', '08:05:22'),
(1300, '\"Roxana Edith Baez\"', '2022-09-22', '08:06:58'),
(1301, '\"Jorge Arturo Ferro\"', '2022-09-22', '08:08:10'),
(1302, '\"Sabrina Evelyn Gonzalez\"', '2022-09-22', '08:08:54'),
(1303, '\"Marcelo Leon\"', '2022-09-22', '08:09:22'),
(1304, '\"Acevedo Rocio Vanina\"', '2022-09-22', '08:09:51'),
(1305, '\"Regina Victoria Leguizamon\"', '2022-09-22', '08:15:57'),
(1306, '\"Juan Pablo Fernadez\"', '2022-09-22', '08:22:45'),
(1307, '\"Sonia Marcela De Philippis\"', '2022-09-22', '08:41:06'),
(1308, '\"Emilia Clarisa Krachinsky\"', '2022-09-22', '08:57:49'),
(1309, '\"Regina Victoria Leguizamon\"', '2022-09-22', '11:09:13'),
(1310, '\"Maria De Los Angeles Ibarra\"', '2022-09-22', '11:49:38'),
(1311, '\"admin\"', '2022-09-22', '11:57:53'),
(1312, '\"Emilia Clarisa Krachinsky\"', '2022-09-22', '12:00:10'),
(1313, '\"Laura Soledad Escobar\"', '2022-09-22', '12:00:26'),
(1314, '\"Nadia Itati Romero\"', '2022-09-22', '12:01:09'),
(1315, '\"Juan Pablo Fernadez\"', '2022-09-22', '12:02:21'),
(1316, '\"Acevedo Rocio Vanina\"', '2022-09-22', '12:04:49'),
(1317, '\"Sabrina Evelyn Gonzalez\"', '2022-09-22', '12:08:11'),
(1318, '\"Vanina Caceres\"', '2022-09-22', '12:12:22'),
(1319, '\"Jorge Arturo Ferro\"', '2022-09-22', '12:37:05'),
(1320, '\"Gloria Arias\"', '2022-09-22', '12:46:34'),
(1321, '\"Cecilia Hauff\"', '2022-09-22', '12:53:08'),
(1322, '\"Lourdes Romina Centurion\"', '2022-09-22', '12:57:38'),
(1323, '\"Rosa Cecilia Gimenez\"', '2022-09-22', '12:57:58'),
(1324, '\"Roxana Edith Baez\"', '2022-09-22', '12:59:00'),
(1325, '\"Julio Sergio Duran\"', '2022-09-22', '12:59:15'),
(1326, '\"Marcelo Leon\"', '2022-09-22', '13:00:43'),
(1327, '\"Sonia Marcela De Philippis\"', '2022-09-22', '14:54:30'),
(1328, '\"Mabel Edith Areco\"', '2022-09-22', '14:58:08'),
(1329, '\"Natalia Valieri\"', '2022-09-22', '15:49:10'),
(1330, '\"Silvina Ramirez\"', '2022-09-22', '15:53:39'),
(1331, '\"Ronaldo Emmanuel Almiron \"', '2022-09-22', '15:54:09'),
(1332, '\"Gloria Estela Monzon\"', '2022-09-22', '16:03:26'),
(1333, '\"Liz Mariel Sanchez\"', '2022-09-22', '16:03:48'),
(1334, '\"Camila Blanca Juarez Amarilla\"', '2022-09-22', '16:05:47'),
(1335, '\"Vanina Caceres\"', '2022-09-22', '16:05:52'),
(1336, '\"Rosa Cecilia Gimenez\"', '2022-09-22', '16:07:53'),
(1337, '\"Fernando Beron\"', '2022-09-22', '16:14:18'),
(1338, '\"Cecilia Ayelen Escalante\"', '2022-09-22', '16:14:55'),
(1339, '\"Nicolas Gallegos\"', '2022-09-22', '16:15:50'),
(1340, '\"Lorena Saracho Lobos\"', '2022-09-22', '16:19:03'),
(1341, '\"Roxana Edith Baez\"', '2022-09-22', '16:53:18'),
(1342, '\"Monica Daiana Ojeda\"', '2022-09-22', '17:25:34'),
(1343, '\"Gaston Flores\"', '2022-09-22', '17:55:54'),
(1344, '\"Rosa Cecilia Gimenez\"', '2022-09-22', '18:05:57'),
(1345, '\"Lourdes Romina Centurion\"', '2022-09-22', '18:07:53'),
(1346, '\"Cecilia Hauff\"', '2022-09-22', '18:33:14'),
(1347, '\"Jorge Arturo Ferro\"', '2022-09-22', '18:39:04'),
(1348, '\"Mariana Anahi Coranel\"', '2022-09-22', '18:42:35'),
(1349, '\"Vanina Caceres\"', '2022-09-22', '18:45:12'),
(1350, '\"Roxana Edith Baez\"', '2022-09-22', '19:08:57'),
(1351, '\"Gaston Flores\"', '2022-09-22', '19:42:15'),
(1352, '\"Cecilia Hauff\"', '2022-09-22', '19:50:39'),
(1353, '\"Cecilia Ayelen Escalante\"', '2022-09-22', '19:54:51'),
(1354, '\"Ronaldo Emmanuel Almiron \"', '2022-09-22', '19:59:39'),
(1355, '\"Camila Blanca Juarez Amarilla\"', '2022-09-22', '20:01:02'),
(1356, '\"Gloria Estela Monzon\"', '2022-09-22', '20:01:16'),
(1357, '\"Lorena Saracho Lobos\"', '2022-09-22', '20:01:44'),
(1358, '\"Jorge Arturo Ferro\"', '2022-09-22', '20:03:11'),
(1359, '\"Lourdes Romina Centurion\"', '2022-09-22', '20:04:09'),
(1360, '\"Nicolas Gallegos\"', '2022-09-22', '20:04:34'),
(1361, '\"Monica Daiana Ojeda\"', '2022-09-22', '20:05:37'),
(1362, '\"Liz Mariel Sanchez\"', '2022-09-22', '20:05:45'),
(1363, '\"Fernando Beron\"', '2022-09-22', '20:08:10'),
(1364, '\"Natalia Valieri\"', '2022-09-22', '20:09:08'),
(1365, '\"Matias Rolando Rodriguez\"', '2022-09-23', '07:22:30'),
(1366, '\"Mabel Edith Areco\"', '2022-09-23', '07:33:22'),
(1367, '\"Maria De Los Angeles Ibarra\"', '2022-09-23', '07:35:47'),
(1368, '\"Laura Soledad Escobar\"', '2022-09-23', '07:39:22'),
(1369, '\"Mariana Anahi Coranel\"', '2022-09-23', '07:48:09'),
(1370, '\"Monica Daiana Ojeda\"', '2022-09-23', '07:48:51'),
(1371, '\"Vanina Caceres\"', '2022-09-23', '07:50:48'),
(1372, '\"Gloria Arias\"', '2022-09-23', '07:54:17'),
(1373, '\"Zulima Noelia Garay\"', '2022-09-23', '07:55:54'),
(1374, '\"Cecilia Hauff\"', '2022-09-23', '07:57:35'),
(1375, '\"Roxana Edith Baez\"', '2022-09-23', '07:59:36'),
(1376, '\"Sabrina Evelyn Gonzalez\"', '2022-09-23', '08:02:14'),
(1377, '\"Lourdes Romina Centurion\"', '2022-09-23', '08:04:26'),
(1378, '\"Jorge Arturo Ferro\"', '2022-09-23', '08:04:59'),
(1379, '\"Nadia Itati Romero\"', '2022-09-23', '08:07:37'),
(1380, '\"Acevedo Rocio Vanina\"', '2022-09-23', '08:08:45'),
(1381, '\"Juan Pablo Fernadez\"', '2022-09-23', '08:09:05'),
(1382, '\"Juan manuel Ojeda\"', '2022-09-23', '08:09:19'),
(1383, '\"Julio Sergio Duran\"', '2022-09-23', '08:10:21'),
(1384, '\"Emilia Clarisa Krachinsky\"', '2022-09-23', '09:03:33'),
(1385, '\"Matias Rolando Rodriguez\"', '2022-09-23', '11:35:07'),
(1386, '\"Vanina Caceres\"', '2022-09-23', '11:37:06'),
(1387, '\"Maria De Los Angeles Ibarra\"', '2022-09-23', '11:37:42'),
(1388, '\"Emilia Clarisa Krachinsky\"', '2022-09-23', '11:57:57'),
(1389, '\"Laura Soledad Escobar\"', '2022-09-23', '12:00:13'),
(1390, '\"Juan Pablo Fernadez\"', '2022-09-23', '12:02:36'),
(1391, '\"Sabrina Evelyn Gonzalez\"', '2022-09-23', '12:02:48'),
(1392, '\"Nadia Itati Romero\"', '2022-09-23', '12:02:56'),
(1393, '\"Jorge Arturo Ferro\"', '2022-09-23', '12:04:27'),
(1394, '\"Gloria Arias\"', '2022-09-23', '12:36:49'),
(1395, '\"Monica Daiana Ojeda\"', '2022-09-23', '12:39:30'),
(1396, '\"Mariana Anahi Coranel\"', '2022-09-23', '12:49:24'),
(1397, '\"Cecilia Hauff\"', '2022-09-23', '12:56:29'),
(1398, '\"Lourdes Romina Centurion\"', '2022-09-23', '13:04:40'),
(1399, '\"Roxana Edith Baez\"', '2022-09-23', '13:06:27'),
(1400, '\"Julio Sergio Duran\"', '2022-09-23', '13:06:33'),
(1401, '\"Mabel Edith Areco\"', '2022-09-23', '13:08:31'),
(1402, '\"Natalia Valieri\"', '2022-09-23', '15:51:58'),
(1403, '\"Vanina Caceres\"', '2022-09-23', '15:55:50'),
(1404, '\"Camila Blanca Juarez Amarilla\"', '2022-09-23', '15:57:45'),
(1405, '\"Gloria Estela Monzon\"', '2022-09-23', '16:12:13'),
(1406, '\"Cecilia Ayelen Escalante\"', '2022-09-23', '16:33:57'),
(1407, '\"Monica Daiana Ojeda\"', '2022-09-23', '17:43:57'),
(1408, '\"Gaston Flores\"', '2022-09-23', '17:51:07'),
(1409, '\"Vanina Caceres\"', '2022-09-23', '18:42:02'),
(1410, '\"Camila Blanca Juarez Amarilla\"', '2022-09-23', '20:04:04'),
(1411, '\"Gaston Flores\"', '2022-09-23', '20:04:36'),
(1412, '\"Gloria Estela Monzon\"', '2022-09-23', '20:04:37'),
(1413, '\"Gaston Flores\"', '2022-09-23', '20:04:40'),
(1414, '\"Fernando Beron\"', '2022-09-23', '20:05:57'),
(1415, '\"Natalia Valieri\"', '2022-09-23', '20:08:06'),
(1416, '\"Monica Daiana Ojeda\"', '2022-09-23', '20:08:12'),
(1417, '\"Cecilia Ayelen Escalante\"', '2022-09-23', '20:08:41'),
(1418, '\"Mabel Edith Areco\"', '2022-09-24', '08:04:18'),
(1419, '\"Marcelo Leon\"', '2022-09-24', '08:04:28'),
(1420, '\"Marcelo Leon\"', '2022-09-24', '11:56:14'),
(1421, '\"Gloria Estela Monzon\"', '2022-09-24', '15:59:05'),
(1422, '\"Gloria Estela Monzon\"', '2022-09-24', '19:58:44'),
(1423, '\"Matias Rolando Rodriguez\"', '2022-09-26', '07:16:37'),
(1424, '\"Mabel Edith Areco\"', '2022-09-26', '07:35:53'),
(1425, '\"Maria De Los Angeles Ibarra\"', '2022-09-26', '07:35:59'),
(1426, '\"Laura Soledad Escobar\"', '2022-09-26', '07:44:49'),
(1427, '\"Cecilia Hauff\"', '2022-09-26', '07:53:34'),
(1428, '\"Gloria Arias\"', '2022-09-26', '07:54:02'),
(1429, '\"Mariana Anahi Coranel\"', '2022-09-26', '07:55:48'),
(1430, '\"Monica Daiana Ojeda\"', '2022-09-26', '07:56:25'),
(1431, '\"Julio Sergio Duran\"', '2022-09-26', '07:58:52'),
(1432, '\"Marcelo Leon\"', '2022-09-26', '07:59:05'),
(1433, '\"Juan Pablo Fernadez\"', '2022-09-26', '08:01:35'),
(1434, '\"Acevedo Rocio Vanina\"', '2022-09-26', '08:02:16'),
(1435, '\"Rosa Cecilia Gimenez\"', '2022-09-26', '08:03:13'),
(1436, '\"Jorge Arturo Ferro\"', '2022-09-26', '08:04:40'),
(1437, '\"Jorge Arturo Ferro\"', '2022-09-26', '08:04:41'),
(1438, '\"Martin Emanuel Canesin Rojas\"', '2022-09-26', '08:06:00'),
(1439, '\"admin\"', '2022-09-26', '08:06:16'),
(1440, '\"Sabrina Evelyn Gonzalez\"', '2022-09-26', '08:07:24'),
(1441, '\"Nadia Itati Romero\"', '2022-09-26', '08:07:29'),
(1442, '\"Alfredo Pedro Iznardo\"', '2022-09-26', '08:08:11'),
(1443, '\"Roxana Edith Baez\"', '2022-09-26', '08:09:51'),
(1444, '\"Juan manuel Ojeda\"', '2022-09-26', '08:19:26'),
(1445, '\"Lourdes Romina Centurion\"', '2022-09-26', '08:22:42'),
(1446, '\"Emilia Clarisa Krachinsky\"', '2022-09-26', '08:30:42'),
(1447, '\"Sonia Marcela De Philippis\"', '2022-09-26', '08:38:57'),
(1448, '\"Matias Rolando Rodriguez\"', '2022-09-26', '11:34:55'),
(1449, '\"Maria De Los Angeles Ibarra\"', '2022-09-26', '11:43:47'),
(1450, '\"Emilia Clarisa Krachinsky\"', '2022-09-26', '11:55:05'),
(1451, '\"Laura Soledad Escobar\"', '2022-09-26', '12:00:11'),
(1452, '\"Lourdes Romina Centurion\"', '2022-09-26', '12:00:38'),
(1453, '\"admin\"', '2022-09-26', '12:01:58'),
(1454, '\"Jorge Arturo Ferro\"', '2022-09-26', '12:02:16'),
(1455, '\"Juan Pablo Fernadez\"', '2022-09-26', '12:04:39'),
(1456, '\"Acevedo Rocio Vanina\"', '2022-09-26', '12:04:59'),
(1457, '\"Sabrina Evelyn Gonzalez\"', '2022-09-26', '12:06:06'),
(1458, '\"Nadia Itati Romero\"', '2022-09-26', '12:08:29'),
(1459, '\"Martin Emanuel Canesin Rojas\"', '2022-09-26', '12:09:03'),
(1460, '\"Gloria Arias\"', '2022-09-26', '12:42:39'),
(1461, '\"Alfredo Pedro Iznardo\"', '2022-09-26', '12:45:21'),
(1462, '\"Mabel Edith Areco\"', '2022-09-26', '12:53:03'),
(1463, '\"Monica Daiana Ojeda\"', '2022-09-26', '12:56:57'),
(1464, '\"Roxana Edith Baez\"', '2022-09-26', '12:57:09'),
(1465, '\"Julio Sergio Duran\"', '2022-09-26', '12:58:34'),
(1466, '\"Rosa Cecilia Gimenez\"', '2022-09-26', '12:59:14'),
(1467, '\"Marcelo Leon\"', '2022-09-26', '12:59:22'),
(1468, '\"Sonia Marcela De Philippis\"', '2022-09-26', '12:59:49'),
(1469, '\"Natalia Valieri\"', '2022-09-26', '15:51:56'),
(1470, '\"Camila Blanca Juarez Amarilla\"', '2022-09-26', '15:52:25'),
(1471, '\"Fernando Beron\"', '2022-09-26', '15:52:52'),
(1472, '\"Silvina Ramirez\"', '2022-09-26', '15:56:45'),
(1473, '\"Regina Victoria Leguizamon\"', '2022-09-26', '16:01:00'),
(1474, '\"Nicolas Gallegos\"', '2022-09-26', '16:10:35'),
(1475, '\"Liz Mariel Sanchez\"', '2022-09-26', '16:15:42'),
(1476, '\"Lorena Saracho Lobos\"', '2022-09-26', '16:29:29'),
(1477, '\"Lourdes Romina Centurion\"', '2022-09-26', '16:32:16'),
(1478, '\"Cecilia Ayelen Escalante\"', '2022-09-26', '16:35:26'),
(1479, '\"Gaston Flores\"', '2022-09-26', '16:35:49'),
(1480, '\"Rosa Cecilia Gimenez\"', '2022-09-26', '16:58:10'),
(1481, '\"Mariana Anahi Coranel\"', '2022-09-26', '17:06:32'),
(1482, '\"Mariana Anahi Coranel\"', '2022-09-26', '17:06:37'),
(1483, '\"Gloria Arias\"', '2022-09-26', '17:24:38'),
(1484, '\"Monica Daiana Ojeda\"', '2022-09-26', '17:29:18'),
(1485, '\"Cecilia Hauff\"', '2022-09-26', '17:47:15'),
(1486, '\"Roxana Edith Baez\"', '2022-09-26', '18:05:48'),
(1487, '\"Maria De Los Angeles Ibarra\"', '2022-09-26', '18:26:06'),
(1488, '\"Rosa Cecilia Gimenez\"', '2022-09-26', '19:05:47'),
(1489, '\"Gloria Arias\"', '2022-09-26', '19:26:44'),
(1490, '\"Camila Blanca Juarez Amarilla\"', '2022-09-26', '19:59:56'),
(1491, '\"Regina Victoria Leguizamon\"', '2022-09-26', '20:00:03'),
(1492, '\"Lourdes Romina Centurion\"', '2022-09-26', '20:00:09'),
(1493, '\"Gaston Flores\"', '2022-09-26', '20:00:57'),
(1494, '\"Cecilia Hauff\"', '2022-09-26', '20:01:15'),
(1495, '\"Fernando Beron\"', '2022-09-26', '20:01:59'),
(1496, '\"Roxana Edith Baez\"', '2022-09-26', '20:02:46'),
(1497, '\"Liz Mariel Sanchez\"', '2022-09-26', '20:02:53'),
(1498, '\"Silvina Ramirez\"', '2022-09-26', '20:03:53'),
(1499, '\"Lorena Saracho Lobos\"', '2022-09-26', '20:04:06'),
(1500, '\"Nicolas Gallegos\"', '2022-09-26', '20:04:16'),
(1501, '\"Natalia Valieri\"', '2022-09-26', '20:05:13'),
(1502, '\"Cecilia Ayelen Escalante\"', '2022-09-26', '20:06:07'),
(1503, '\"Matias Rolando Rodriguez\"', '2022-09-27', '07:16:17'),
(1504, '\"Mariana Anahi Coranel\"', '2022-09-27', '07:22:18'),
(1505, '\"Cecilia Hauff\"', '2022-09-27', '07:26:48'),
(1506, '\"Monica Daiana Ojeda\"', '2022-09-27', '07:35:59'),
(1507, '\"Maria De Los Angeles Ibarra\"', '2022-09-27', '07:37:18'),
(1508, '\"Laura Soledad Escobar\"', '2022-09-27', '07:46:15'),
(1509, '\"Vanina Caceres\"', '2022-09-27', '07:51:08'),
(1510, '\"Alfredo Pedro Iznardo\"', '2022-09-27', '07:53:03'),
(1511, '\"Rosa Cecilia Gimenez\"', '2022-09-27', '07:57:35'),
(1512, '\"Roxana Edith Baez\"', '2022-09-27', '07:58:29'),
(1513, '\"Gloria Arias\"', '2022-09-27', '08:00:40'),
(1514, '\"Jorge Arturo Ferro\"', '2022-09-27', '08:01:37'),
(1515, '\"Julio Sergio Duran\"', '2022-09-27', '08:03:08'),
(1516, '\"Marcelo Leon\"', '2022-09-27', '08:03:14'),
(1517, '\"admin\"', '2022-09-27', '08:05:45'),
(1518, '\"Nadia Itati Romero\"', '2022-09-27', '08:06:39'),
(1519, '\"Sabrina Evelyn Gonzalez\"', '2022-09-27', '08:11:56'),
(1520, '\"Acevedo Rocio Vanina\"', '2022-09-27', '08:14:25'),
(1521, '\"Juan Pablo Fernadez\"', '2022-09-27', '08:14:44'),
(1522, '\"Martin Emanuel Canesin Rojas\"', '2022-09-27', '08:15:17'),
(1523, '\"Regina Victoria Leguizamon\"', '2022-09-27', '08:15:42'),
(1524, '\"Lourdes Romina Centurion\"', '2022-09-27', '08:22:59'),
(1525, '\"Emilia Clarisa Krachinsky\"', '2022-09-27', '08:43:37'),
(1526, '\"Sonia Marcela De Philippis\"', '2022-09-27', '08:46:35'),
(1527, '\"Gaston Flores\"', '2022-09-27', '08:52:00'),
(1528, '\"Juan manuel Ojeda\"', '2022-09-27', '08:59:23'),
(1529, '\"Regina Victoria Leguizamon\"', '2022-09-27', '11:06:24'),
(1530, '\"Matias Rolando Rodriguez\"', '2022-09-27', '11:31:57'),
(1531, '\"Maria De Los Angeles Ibarra\"', '2022-09-27', '11:38:56'),
(1532, '\"Emilia Clarisa Krachinsky\"', '2022-09-27', '11:55:08'),
(1533, '\"Laura Soledad Escobar\"', '2022-09-27', '12:00:04'),
(1534, '\"admin\"', '2022-09-27', '12:01:38'),
(1535, '\"Jorge Arturo Ferro\"', '2022-09-27', '12:02:37'),
(1536, '\"Nadia Itati Romero\"', '2022-09-27', '12:05:13'),
(1537, '\"Sabrina Evelyn Gonzalez\"', '2022-09-27', '12:05:29'),
(1538, '\"Acevedo Rocio Vanina\"', '2022-09-27', '12:07:01'),
(1539, '\"Juan Pablo Fernadez\"', '2022-09-27', '12:07:39'),
(1540, '\"Martin Emanuel Canesin Rojas\"', '2022-09-27', '12:18:18'),
(1541, '\"Gaston Flores\"', '2022-09-27', '12:24:57'),
(1542, '\"Vanina Caceres\"', '2022-09-27', '12:25:45'),
(1543, '\"Mariana Anahi Coranel\"', '2022-09-27', '12:31:59'),
(1544, '\"Gloria Arias\"', '2022-09-27', '12:39:36'),
(1545, '\"Monica Daiana Ojeda\"', '2022-09-27', '12:53:24'),
(1546, '\"Alfredo Pedro Iznardo\"', '2022-09-27', '12:55:43'),
(1547, '\"Rosa Cecilia Gimenez\"', '2022-09-27', '12:55:47'),
(1548, '\"Sonia Marcela De Philippis\"', '2022-09-27', '12:57:09'),
(1549, '\"Marcelo Leon\"', '2022-09-27', '12:58:24'),
(1550, '\"Julio Sergio Duran\"', '2022-09-27', '12:59:31'),
(1551, '\"Cecilia Hauff\"', '2022-09-27', '12:59:36'),
(1552, '\"Lourdes Romina Centurion\"', '2022-09-27', '13:00:28'),
(1553, '\"Roxana Edith Baez\"', '2022-09-27', '13:00:43'),
(1554, '\"Maria Soledad Palavecino\"', '2022-09-27', '15:48:03'),
(1555, '\"Vanina Caceres\"', '2022-09-27', '15:51:40'),
(1556, '\"Natalia Valieri\"', '2022-09-27', '15:55:59'),
(1557, '\"Natalia Valieri\"', '2022-09-27', '15:56:05'),
(1558, '\"Natalia Valieri\"', '2022-09-27', '15:56:10'),
(1559, '\"Gloria Estela Monzon\"', '2022-09-27', '16:03:32'),
(1560, '\"Ronaldo Emmanuel Almiron \"', '2022-09-27', '16:04:38'),
(1561, '\"Silvina Ramirez\"', '2022-09-27', '16:07:57'),
(1562, '\"Camila Blanca Juarez Amarilla\"', '2022-09-27', '16:09:38'),
(1563, '\"Liz Mariel Sanchez\"', '2022-09-27', '16:13:58'),
(1564, '\"Lorena Saracho Lobos\"', '2022-09-27', '16:15:29'),
(1565, '\"Rosa Cecilia Gimenez\"', '2022-09-27', '16:18:09'),
(1566, '\"Cecilia Ayelen Escalante\"', '2022-09-27', '16:20:30'),
(1567, '\"Cecilia Ayelen Escalante\"', '2022-09-27', '16:20:32'),
(1568, '\"Fernando Beron\"', '2022-09-27', '16:28:06'),
(1569, '\"Jorge Arturo Ferro\"', '2022-09-27', '17:59:26'),
(1570, '\"Vanina Caceres\"', '2022-09-27', '18:29:44'),
(1571, '\"Cecilia Hauff\"', '2022-09-27', '18:32:07'),
(1572, '\"Cecilia Hauff\"', '2022-09-27', '18:47:43'),
(1573, '\"Rosa Cecilia Gimenez\"', '2022-09-27', '19:22:59'),
(1574, '\"Cecilia Ayelen Escalante\"', '2022-09-27', '19:58:21'),
(1575, '\"Gloria Estela Monzon\"', '2022-09-27', '19:59:32'),
(1576, '\"Lorena Saracho Lobos\"', '2022-09-27', '19:59:40'),
(1577, '\"Maria Soledad Palavecino\"', '2022-09-27', '20:00:15'),
(1578, '\"Jorge Arturo Ferro\"', '2022-09-27', '20:00:35'),
(1579, '\"Silvina Ramirez\"', '2022-09-27', '20:01:16'),
(1580, '\"Camila Blanca Juarez Amarilla\"', '2022-09-27', '20:03:26'),
(1581, '\"Ronaldo Emmanuel Almiron \"', '2022-09-27', '20:03:42'),
(1582, '\"Liz Mariel Sanchez\"', '2022-09-27', '20:08:08'),
(1583, '\"Fernando Beron\"', '2022-09-27', '20:14:27'),
(1584, '\"Laura Soledad Escobar\"', '2022-09-28', '07:03:33'),
(1585, '\"Mabel Edith Areco\"', '2022-09-28', '07:34:23'),
(1586, '\"Monica Daiana Ojeda\"', '2022-09-28', '07:38:49'),
(1587, '\"Maria De Los Angeles Ibarra\"', '2022-09-28', '07:44:48'),
(1588, '\"Mariana Anahi Coranel\"', '2022-09-28', '07:45:13'),
(1589, '\"Cecilia Hauff\"', '2022-09-28', '07:48:10'),
(1590, '\"Roxana Edith Baez\"', '2022-09-28', '07:48:58'),
(1591, '\"Marcelo Leon\"', '2022-09-28', '07:51:03'),
(1592, '\"Rosa Cecilia Gimenez\"', '2022-09-28', '07:56:18'),
(1593, '\"Alfredo Pedro Iznardo\"', '2022-09-28', '07:56:47'),
(1594, '\"Gloria Arias\"', '2022-09-28', '07:58:24'),
(1595, '\"Zulima Noelia Garay\"', '2022-09-28', '08:00:47'),
(1596, '\"Sabrina Evelyn Gonzalez\"', '2022-09-28', '08:01:28'),
(1597, '\"Vanina Caceres\"', '2022-09-28', '08:02:38'),
(1598, '\"Julio Sergio Duran\"', '2022-09-28', '08:04:07'),
(1599, '\"Jorge Arturo Ferro\"', '2022-09-28', '08:06:26'),
(1600, '\"admin\"', '2022-09-28', '08:08:24'),
(1601, '\"Acevedo Rocio Vanina\"', '2022-09-28', '08:12:47'),
(1602, '\"Lourdes Romina Centurion\"', '2022-09-28', '08:13:43'),
(1603, '\"Sonia Marcela De Philippis\"', '2022-09-28', '08:40:00'),
(1604, '\"Emilia Clarisa Krachinsky\"', '2022-09-28', '08:43:17'),
(1605, '\"Juan manuel Ojeda\"', '2022-09-28', '08:45:57'),
(1606, '\"Juan Pablo Fernadez\"', '2022-09-28', '08:50:43'),
(1607, '\"Laura Soledad Escobar\"', '2022-09-28', '11:30:06'),
(1608, '\"Maria De Los Angeles Ibarra\"', '2022-09-28', '11:40:32'),
(1609, '\"Cecilia Hauff\"', '2022-09-28', '11:59:12'),
(1610, '\"Emilia Clarisa Krachinsky\"', '2022-09-28', '12:00:10'),
(1611, '\"Sabrina Evelyn Gonzalez\"', '2022-09-28', '12:02:12'),
(1612, '\"Juan Pablo Fernadez\"', '2022-09-28', '12:03:14'),
(1613, '\"Acevedo Rocio Vanina\"', '2022-09-28', '12:07:28'),
(1614, '\"Vanina Caceres\"', '2022-09-28', '12:07:35'),
(1615, '\"admin\"', '2022-09-28', '12:07:42'),
(1616, '\"Jorge Arturo Ferro\"', '2022-09-28', '12:10:12'),
(1617, '\"Alfredo Pedro Iznardo\"', '2022-09-28', '12:11:15'),
(1618, '\"Monica Daiana Ojeda\"', '2022-09-28', '12:18:38'),
(1619, '\"Roxana Edith Baez\"', '2022-09-28', '12:43:10'),
(1620, '\"Gloria Arias\"', '2022-09-28', '12:43:32'),
(1621, '\"Marcelo Leon\"', '2022-09-28', '12:50:15'),
(1622, '\"Rosa Cecilia Gimenez\"', '2022-09-28', '12:56:43'),
(1623, '\"Lourdes Romina Centurion\"', '2022-09-28', '12:57:07'),
(1624, '\"Julio Sergio Duran\"', '2022-09-28', '12:57:58'),
(1625, '\"Sonia Marcela De Philippis\"', '2022-09-28', '13:03:11'),
(1626, '\"Mabel Edith Areco\"', '2022-09-28', '13:09:04'),
(1627, '\"Zulima Noelia Garay\"', '2022-09-28', '14:09:51'),
(1628, '\"Camila Blanca Juarez Amarilla\"', '2022-09-28', '16:05:50'),
(1629, '\"Cecilia Ayelen Escalante\"', '2022-09-28', '16:12:45'),
(1630, '\"Gloria Estela Monzon\"', '2022-09-28', '16:13:06'),
(1631, '\"Fernando Beron\"', '2022-09-28', '16:14:51'),
(1632, '\"Lourdes Romina Centurion\"', '2022-09-28', '16:32:13'),
(1633, '\"Gloria Arias\"', '2022-09-28', '17:00:51'),
(1634, '\"Juan Pablo Fernadez\"', '2022-09-28', '18:05:42'),
(1635, '\"Lourdes Romina Centurion\"', '2022-09-28', '19:10:50'),
(1636, '\"Juan Pablo Fernadez\"', '2022-09-28', '19:14:10'),
(1637, '\"Gloria Estela Monzon\"', '2022-09-28', '19:55:48'),
(1638, '\"Cecilia Ayelen Escalante\"', '2022-09-28', '20:01:51'),
(1639, '\"Camila Blanca Juarez Amarilla\"', '2022-09-28', '20:03:01'),
(1640, '\"Fernando Beron\"', '2022-09-28', '20:05:26'),
(1641, '\"Matias Rolando Rodriguez\"', '2022-09-29', '07:24:12'),
(1642, '\"Laura Soledad Escobar\"', '2022-09-29', '07:24:26'),
(1643, '\"Vanina Caceres\"', '2022-09-29', '07:45:45'),
(1644, '\"Cecilia Hauff\"', '2022-09-29', '07:49:26'),
(1645, '\"Maria De Los Angeles Ibarra\"', '2022-09-29', '07:59:21'),
(1646, '\"Zulima Noelia Garay\"', '2022-09-29', '08:03:22'),
(1647, '\"Roxana Edith Baez\"', '2022-09-29', '08:06:08'),
(1648, '\"Laura Soledad Escobar\"', '2022-09-29', '12:00:16'),
(1649, '\"Vanina Caceres\"', '2022-09-29', '12:18:23'),
(1650, '\"Roxana Edith Baez\"', '2022-09-29', '12:18:31'),
(1651, '\"Natalia Valieri\"', '2022-09-29', '15:45:53'),
(1652, '\"Camila Blanca Juarez Amarilla\"', '2022-09-29', '15:47:46'),
(1653, '\"Fernando Beron\"', '2022-09-29', '16:02:33'),
(1654, '\"Gloria Estela Monzon\"', '2022-09-29', '16:03:24'),
(1655, '\"Vanina Caceres\"', '2022-09-29', '16:09:31'),
(1656, '\"Gaston Flores\"', '2022-09-29', '16:33:06'),
(1657, '\"Jorge Arturo Ferro\"', '2022-09-29', '17:20:30'),
(1658, '\"Vanina Caceres\"', '2022-09-29', '18:06:40'),
(1659, '\"Camila Blanca Juarez Amarilla\"', '2022-09-29', '20:00:24'),
(1660, '\"Gloria Estela Monzon\"', '2022-09-29', '20:00:56'),
(1661, '\"Gaston Flores\"', '2022-09-29', '20:01:22'),
(1662, '\"Natalia Valieri\"', '2022-09-29', '20:29:55'),
(1663, '\"Laura Soledad Escobar\"', '2022-09-30', '07:11:08'),
(1664, '\"Monica Daiana Ojeda\"', '2022-09-30', '07:54:13'),
(1665, '\"Vanina Caceres\"', '2022-09-30', '07:59:30'),
(1666, '\"Rosa Cecilia Gimenez\"', '2022-09-30', '07:59:47'),
(1667, '\"Zulima Noelia Garay\"', '2022-09-30', '08:03:30'),
(1668, '\"Alfredo Pedro Iznardo\"', '2022-09-30', '08:08:36'),
(1669, '\"Mabel Edith Areco\"', '2022-09-30', '08:10:01'),
(1670, '\"Gloria Arias\"', '2022-09-30', '08:13:43'),
(1671, '\"Julio Sergio Duran\"', '2022-09-30', '08:17:02'),
(1672, '\"Juan Pablo Fernadez\"', '2022-09-30', '08:28:15'),
(1673, '\"Acevedo Rocio Vanina\"', '2022-09-30', '08:40:19'),
(1674, '\"Laura Soledad Escobar\"', '2022-09-30', '11:30:05'),
(1675, '\"Acevedo Rocio Vanina\"', '2022-09-30', '11:50:33'),
(1676, '\"Vanina Caceres\"', '2022-09-30', '12:00:12'),
(1677, '\"Juan Pablo Fernadez\"', '2022-09-30', '12:08:46'),
(1678, '\"Gloria Arias\"', '2022-09-30', '12:50:39'),
(1679, '\"Sonia Marcela De Philippis\"', '2022-09-30', '13:02:42'),
(1680, '\"Julio Sergio Duran\"', '2022-09-30', '13:05:21'),
(1681, '\"Rosa Cecilia Gimenez\"', '2022-09-30', '13:05:26'),
(1682, '\"Mabel Edith Areco\"', '2022-09-30', '13:12:55'),
(1683, '\"Natalia Valieri\"', '2022-09-30', '15:49:06'),
(1684, '\"Camila Blanca Juarez Amarilla\"', '2022-09-30', '15:58:31'),
(1685, '\"Gloria Estela Monzon\"', '2022-09-30', '16:17:39'),
(1686, '\"Cecilia Ayelen Escalante\"', '2022-09-30', '16:23:33'),
(1687, '\"Gaston Flores\"', '2022-09-30', '17:13:32'),
(1688, '\"Gloria Estela Monzon\"', '2022-09-30', '19:58:21'),
(1689, '\"Camila Blanca Juarez Amarilla\"', '2022-09-30', '19:59:48'),
(1690, '\"Cecilia Ayelen Escalante\"', '2022-09-30', '19:59:58'),
(1691, '\"Gaston Flores\"', '2022-09-30', '20:00:07'),
(1692, '\"Natalia Valieri\"', '2022-09-30', '20:00:18'),
(1693, '\"Laura Soledad Escobar\"', '2022-10-01', '07:42:16'),
(1694, '\"Mabel Edith Areco\"', '2022-10-01', '08:25:14'),
(1695, '\"Laura Soledad Escobar\"', '2022-10-01', '12:00:52'),
(1696, '\"Mabel Edith Areco\"', '2022-10-01', '12:01:06'),
(1697, '\"Gloria Arias\"', '2022-10-01', '16:58:35'),
(1698, '\"Vanina Caceres\"', '2022-10-01', '17:10:22'),
(1699, '\"Vanina Caceres\"', '2022-10-01', '20:02:23'),
(1700, '\"Laura Soledad Escobar\"', '2022-10-03', '07:08:38'),
(1701, '\"Mabel Edith Areco\"', '2022-10-03', '07:30:49'),
(1702, '\"Maria De Los Angeles Ibarra\"', '2022-10-03', '07:34:04'),
(1703, '\"Vanina Caceres\"', '2022-10-03', '07:50:25'),
(1704, '\"Gloria Arias\"', '2022-10-03', '07:59:44'),
(1705, '\"Marcelo Leon\"', '2022-10-03', '08:05:11'),
(1706, '\"admin\"', '2022-10-03', '08:05:41'),
(1707, '\"Julio Sergio Duran\"', '2022-10-03', '08:06:29'),
(1708, '\"Jorge Arturo Ferro\"', '2022-10-03', '08:09:15'),
(1709, '\"Acevedo Rocio Vanina\"', '2022-10-03', '08:13:25'),
(1710, '\"Alfredo Pedro Iznardo\"', '2022-10-03', '08:25:09'),
(1711, '\"Sonia Marcela De Philippis\"', '2022-10-03', '08:39:00'),
(1712, '\"Juan Pablo Fernadez\"', '2022-10-03', '08:53:37'),
(1713, '\"Emilia Clarisa Krachinsky\"', '2022-10-03', '08:58:09'),
(1714, '\"Laura Soledad Escobar\"', '2022-10-03', '11:30:04'),
(1715, '\"admin\"', '2022-10-03', '11:59:36'),
(1716, '\"Juan Pablo Fernadez\"', '2022-10-03', '12:03:18'),
(1717, '\"Emilia Clarisa Krachinsky\"', '2022-10-03', '12:06:07'),
(1718, '\"Maria De Los Angeles Ibarra\"', '2022-10-03', '12:16:27'),
(1719, '\"Jorge Arturo Ferro\"', '2022-10-03', '12:20:18'),
(1720, '\"Acevedo Rocio Vanina\"', '2022-10-03', '12:22:00'),
(1721, '\"Gloria Arias\"', '2022-10-03', '12:43:50'),
(1722, '\"Vanina Caceres\"', '2022-10-03', '12:52:30'),
(1723, '\"Marcelo Leon\"', '2022-10-03', '12:55:51');
INSERT INTO `asistencia2` (`id_asistencia2`, `nombre_personal`, `fecha_asistencia`, `hora_asistencia`) VALUES
(1724, '\"Sonia Marcela De Philippis\"', '2022-10-03', '12:59:34'),
(1725, '\"Mabel Edith Areco\"', '2022-10-03', '13:01:01'),
(1726, '\"Julio Sergio Duran\"', '2022-10-03', '13:04:53'),
(1727, '\"Natalia Valieri\"', '2022-10-03', '15:50:56'),
(1728, '\"Silvina Ramirez\"', '2022-10-03', '15:53:02'),
(1729, '\"Gloria Estela Monzon\"', '2022-10-03', '16:04:30'),
(1730, '\"Lorena Saracho Lobos\"', '2022-10-03', '16:07:08'),
(1731, '\"Camila Blanca Juarez Amarilla\"', '2022-10-03', '16:14:51'),
(1732, '\"Nicolas Gallegos\"', '2022-10-03', '16:18:57'),
(1733, '\"Liz Mariel Sanchez\"', '2022-10-03', '16:37:04'),
(1734, '\"Gloria Arias\"', '2022-10-03', '16:43:17'),
(1735, '\"Cecilia Ayelen Escalante\"', '2022-10-03', '17:50:44'),
(1736, '\"Juan Pablo Fernadez\"', '2022-10-03', '18:10:54'),
(1737, '\"Juan Pablo Fernadez\"', '2022-10-03', '18:10:59'),
(1738, '\"Juan Pablo Fernadez\"', '2022-10-03', '18:11:03'),
(1739, '\"Nicolas Gallegos\"', '2022-10-03', '18:25:26'),
(1740, '\"Gloria Arias\"', '2022-10-03', '18:50:18'),
(1741, '\"Juan Pablo Fernadez\"', '2022-10-03', '18:55:54'),
(1742, '\"Silvina Ramirez\"', '2022-10-03', '19:43:08'),
(1743, '\"Lorena Saracho Lobos\"', '2022-10-03', '20:00:55'),
(1744, '\"Camila Blanca Juarez Amarilla\"', '2022-10-03', '20:05:44'),
(1745, '\"Liz Mariel Sanchez\"', '2022-10-03', '20:08:24'),
(1746, '\"Cecilia Ayelen Escalante\"', '2022-10-03', '20:09:24'),
(1747, '\"Natalia Valieri\"', '2022-10-03', '20:17:32'),
(1748, '\"Laura Soledad Escobar\"', '2022-10-04', '07:17:46'),
(1749, '\"Mabel Edith Areco\"', '2022-10-04', '07:31:42'),
(1750, '\"Alfredo Pedro Iznardo\"', '2022-10-04', '07:52:22'),
(1751, '\"Gloria Arias\"', '2022-10-04', '07:53:43'),
(1752, '\"Marcelo Leon\"', '2022-10-04', '07:54:17'),
(1753, '\"Rosa Cecilia Gimenez\"', '2022-10-04', '07:55:45'),
(1754, '\"Vanina Caceres\"', '2022-10-04', '07:56:06'),
(1755, '\"admin\"', '2022-10-04', '07:56:30'),
(1756, '\"Maria De Los Angeles Ibarra\"', '2022-10-04', '07:57:51'),
(1757, '\"Julio Sergio Duran\"', '2022-10-04', '08:06:37'),
(1758, '\"Jorge Arturo Ferro\"', '2022-10-04', '08:07:05'),
(1759, '\"Acevedo Rocio Vanina\"', '2022-10-04', '08:20:59'),
(1760, '\"Juan Pablo Fernadez\"', '2022-10-04', '08:32:50'),
(1761, '\"Sonia Marcela De Philippis\"', '2022-10-04', '08:45:04'),
(1762, '\"Laura Soledad Escobar\"', '2022-10-04', '11:30:19'),
(1763, '\"Maria De Los Angeles Ibarra\"', '2022-10-04', '11:43:33'),
(1764, '\"Jorge Arturo Ferro\"', '2022-10-04', '12:02:26'),
(1765, '\"Juan Pablo Fernadez\"', '2022-10-04', '12:03:18'),
(1766, '\"Acevedo Rocio Vanina\"', '2022-10-04', '12:05:10'),
(1767, '\"admin\"', '2022-10-04', '12:15:58'),
(1768, '\"Gloria Arias\"', '2022-10-04', '12:41:50'),
(1769, '\"Vanina Caceres\"', '2022-10-04', '12:54:11'),
(1770, '\"Rosa Cecilia Gimenez\"', '2022-10-04', '12:57:32'),
(1771, '\"Marcelo Leon\"', '2022-10-04', '12:58:15'),
(1772, '\"Sonia Marcela De Philippis\"', '2022-10-04', '12:58:41'),
(1773, '\"Julio Sergio Duran\"', '2022-10-04', '12:58:49'),
(1774, '\"Mabel Edith Areco\"', '2022-10-04', '12:59:34'),
(1775, '\"Maria Soledad Palavecino\"', '2022-10-04', '15:53:23'),
(1776, '\"Gloria Estela Monzon\"', '2022-10-04', '15:53:32'),
(1777, '\"Vanina Caceres\"', '2022-10-04', '15:57:33'),
(1778, '\"Rosa Cecilia Gimenez\"', '2022-10-04', '16:07:49'),
(1779, '\"Lorena Saracho Lobos\"', '2022-10-04', '16:08:30'),
(1780, '\"Camila Blanca Juarez Amarilla\"', '2022-10-04', '16:12:57'),
(1781, '\"Cecilia Ayelen Escalante\"', '2022-10-04', '16:20:34'),
(1782, '\"Liz Mariel Sanchez\"', '2022-10-04', '16:40:44'),
(1783, '\"Gaston Flores\"', '2022-10-04', '16:58:00'),
(1784, '\"Jorge Arturo Ferro\"', '2022-10-04', '18:02:40'),
(1785, '\"Vanina Caceres\"', '2022-10-04', '18:22:54'),
(1786, '\"Rosa Cecilia Gimenez\"', '2022-10-04', '18:47:32'),
(1787, '\"Maria Soledad Palavecino\"', '2022-10-04', '19:55:59'),
(1788, '\"Liz Mariel Sanchez\"', '2022-10-04', '20:01:29'),
(1789, '\"Camila Blanca Juarez Amarilla\"', '2022-10-04', '20:01:38'),
(1790, '\"Lorena Saracho Lobos\"', '2022-10-04', '20:01:42'),
(1791, '\"Cecilia Ayelen Escalante\"', '2022-10-04', '20:01:53'),
(1792, '\"Gaston Flores\"', '2022-10-04', '20:02:17'),
(1793, '\"Jorge Arturo Ferro\"', '2022-10-04', '20:02:24'),
(1794, '\"\"', '2022-10-04', '20:03:24'),
(1795, '\"Gloria Estela Monzon\"', '2022-10-04', '20:03:34'),
(1796, '\"Laura Soledad Escobar\"', '2022-10-05', '07:18:49'),
(1797, '\"Vanina Caceres\"', '2022-10-05', '07:51:33'),
(1798, '\"Monica Daiana Ojeda\"', '2022-10-05', '07:52:36'),
(1799, '\"Maria De Los Angeles Ibarra\"', '2022-10-05', '07:52:45'),
(1800, '\"Gloria Arias\"', '2022-10-05', '07:55:59'),
(1801, '\"Alfredo Pedro Iznardo\"', '2022-10-05', '07:58:36'),
(1802, '\"admin\"', '2022-10-05', '07:58:40'),
(1803, '\"Julio Sergio Duran\"', '2022-10-05', '08:02:53'),
(1804, '\"Marcelo Leon\"', '2022-10-05', '08:03:01'),
(1805, '\"Jorge Arturo Ferro\"', '2022-10-05', '08:05:14'),
(1806, '\"Acevedo Rocio Vanina\"', '2022-10-05', '08:08:52'),
(1807, '\"Rosa Cecilia Gimenez\"', '2022-10-05', '08:12:03'),
(1808, '\"Zulima Noelia Garay\"', '2022-10-05', '08:15:33'),
(1809, '\"Juan Pablo Fernadez\"', '2022-10-05', '08:21:28'),
(1810, '\"Juan manuel Ojeda\"', '2022-10-05', '08:32:38'),
(1811, '\"Sonia Marcela De Philippis\"', '2022-10-05', '08:45:08'),
(1812, '\"Emilia Clarisa Krachinsky\"', '2022-10-05', '09:02:55'),
(1813, '\"Laura Soledad Escobar\"', '2022-10-05', '11:30:04'),
(1814, '\"Emilia Clarisa Krachinsky\"', '2022-10-05', '11:51:59'),
(1815, '\"admin\"', '2022-10-05', '12:02:07'),
(1816, '\"Jorge Arturo Ferro\"', '2022-10-05', '12:02:39'),
(1817, '\"Juan Pablo Fernadez\"', '2022-10-05', '12:02:50'),
(1818, '\"Acevedo Rocio Vanina\"', '2022-10-05', '12:10:25'),
(1819, '\"Vanina Caceres\"', '2022-10-05', '12:33:46'),
(1820, '\"Gloria Arias\"', '2022-10-05', '12:37:04'),
(1821, '\"Monica Daiana Ojeda\"', '2022-10-05', '12:43:50'),
(1822, '\"Alfredo Pedro Iznardo\"', '2022-10-05', '13:00:56'),
(1823, '\"Julio Sergio Duran\"', '2022-10-05', '13:01:19'),
(1824, '\"Rosa Cecilia Gimenez\"', '2022-10-05', '13:01:21'),
(1825, '\"Marcelo Leon\"', '2022-10-05', '13:01:45'),
(1826, '\"Sonia Marcela De Philippis\"', '2022-10-05', '13:02:50'),
(1827, '\"Gloria Estela Monzon\"', '2022-10-05', '15:44:04'),
(1828, '\"Maria Soledad Palavecino\"', '2022-10-05', '15:47:34'),
(1829, '\"Ronaldo Emmanuel Almiron \"', '2022-10-05', '15:54:12'),
(1830, '\"Silvina Ramirez\"', '2022-10-05', '15:56:53'),
(1831, '\"Vanina Caceres\"', '2022-10-05', '16:00:17'),
(1832, '\"Gaston Flores\"', '2022-10-05', '16:00:32'),
(1833, '\"Fernando Beron\"', '2022-10-05', '16:01:43'),
(1834, '\"Camila Blanca Juarez Amarilla\"', '2022-10-05', '16:05:02'),
(1835, '\"Cecilia Ayelen Escalante\"', '2022-10-05', '16:17:47'),
(1836, '\"Nicolas Gallegos\"', '2022-10-05', '16:18:26'),
(1837, '\"Lorena Saracho Lobos\"', '2022-10-05', '16:26:46'),
(1838, '\"Gloria Arias\"', '2022-10-05', '16:54:55'),
(1839, '\"Monica Daiana Ojeda\"', '2022-10-05', '17:20:00'),
(1840, '\"Vanina Caceres\"', '2022-10-05', '18:16:31'),
(1841, '\"Gloria Arias\"', '2022-10-05', '18:49:25'),
(1842, '\"Monica Daiana Ojeda\"', '2022-10-05', '19:52:35'),
(1843, '\"Silvina Ramirez\"', '2022-10-05', '19:53:43'),
(1844, '\"Maria Soledad Palavecino\"', '2022-10-05', '19:53:48'),
(1845, '\"Lorena Saracho Lobos\"', '2022-10-05', '19:54:09'),
(1846, '\"Ronaldo Emmanuel Almiron \"', '2022-10-05', '19:56:07'),
(1847, '\"Fernando Beron\"', '2022-10-05', '19:57:23'),
(1848, '\"Gloria Estela Monzon\"', '2022-10-05', '19:58:14'),
(1849, '\"Camila Blanca Juarez Amarilla\"', '2022-10-05', '19:59:39'),
(1850, '\"Nicolas Gallegos\"', '2022-10-05', '20:03:50'),
(1851, '\"Cecilia Ayelen Escalante\"', '2022-10-05', '20:25:54'),
(1852, '\"Gaston Flores\"', '2022-10-05', '20:26:24'),
(1853, '\"Matias Rolando Rodriguez\"', '2022-10-06', '07:25:14'),
(1854, '\"Vanina Caceres\"', '2022-10-06', '07:42:11'),
(1855, '\"Monica Daiana Ojeda\"', '2022-10-06', '07:51:29'),
(1856, '\"Mariana Anahi Coranel\"', '2022-10-06', '07:53:13'),
(1857, '\"Laura Soledad Escobar\"', '2022-10-06', '07:55:20'),
(1858, '\"Maria De Los Angeles Ibarra\"', '2022-10-06', '07:56:50'),
(1859, '\"Alfredo Pedro Iznardo\"', '2022-10-06', '07:58:00'),
(1860, '\"Cecilia Hauff\"', '2022-10-06', '07:58:56'),
(1861, '\"Gloria Arias\"', '2022-10-06', '07:59:58'),
(1862, '\"Rosa Cecilia Gimenez\"', '2022-10-06', '08:01:39'),
(1863, '\"Zulima Noelia Garay\"', '2022-10-06', '08:01:59'),
(1864, '\"admin\"', '2022-10-06', '08:03:00'),
(1865, '\"Sabrina Evelyn Gonzalez\"', '2022-10-06', '08:03:12'),
(1866, '\"Jorge Arturo Ferro\"', '2022-10-06', '08:03:20'),
(1867, '\"Julio Sergio Duran\"', '2022-10-06', '08:06:14'),
(1868, '\"Nadia Itati Romero\"', '2022-10-06', '08:14:03'),
(1869, '\"Regina Victoria Leguizamon\"', '2022-10-06', '08:17:34'),
(1870, '\"Lourdes Romina Centurion\"', '2022-10-06', '08:19:18'),
(1871, '\"Marcelo Leon\"', '2022-10-06', '08:19:42'),
(1872, '\"Juan Pablo Fernadez\"', '2022-10-06', '08:19:48'),
(1873, '\"Juan manuel Ojeda\"', '2022-10-06', '08:25:30'),
(1874, '\"Sonia Marcela De Philippis\"', '2022-10-06', '08:41:05'),
(1875, '\"Emilia Clarisa Krachinsky\"', '2022-10-06', '08:54:30'),
(1876, '\"Regina Victoria Leguizamon\"', '2022-10-06', '11:09:12'),
(1877, '\"Matias Rolando Rodriguez\"', '2022-10-06', '11:30:37'),
(1878, '\"Maria De Los Angeles Ibarra\"', '2022-10-06', '11:48:40'),
(1879, '\"Laura Soledad Escobar\"', '2022-10-06', '12:00:03'),
(1880, '\"Emilia Clarisa Krachinsky\"', '2022-10-06', '12:00:30'),
(1881, '\"admin\"', '2022-10-06', '12:04:11'),
(1882, '\"Sabrina Evelyn Gonzalez\"', '2022-10-06', '12:04:33'),
(1883, '\"Jorge Arturo Ferro\"', '2022-10-06', '12:05:01'),
(1884, '\"Juan Pablo Fernadez\"', '2022-10-06', '12:07:29'),
(1885, '\"Nadia Itati Romero\"', '2022-10-06', '12:09:10'),
(1886, '\"Vanina Caceres\"', '2022-10-06', '12:25:31'),
(1887, '\"Gloria Arias\"', '2022-10-06', '12:49:44'),
(1888, '\"Alfredo Pedro Iznardo\"', '2022-10-06', '12:56:12'),
(1889, '\"Cecilia Hauff\"', '2022-10-06', '12:58:28'),
(1890, '\"Rosa Cecilia Gimenez\"', '2022-10-06', '12:59:28'),
(1891, '\"Monica Daiana Ojeda\"', '2022-10-06', '13:01:24'),
(1892, '\"Lourdes Romina Centurion\"', '2022-10-06', '13:01:36'),
(1893, '\"Julio Sergio Duran\"', '2022-10-06', '13:01:52'),
(1894, '\"Marcelo Leon\"', '2022-10-06', '13:02:08'),
(1895, '\"Sonia Marcela De Philippis\"', '2022-10-06', '13:02:41'),
(1896, '\"Maria Soledad Palavecino\"', '2022-10-06', '15:33:47'),
(1897, '\"Silvina Ramirez\"', '2022-10-06', '15:57:03'),
(1898, '\"Ronaldo Emmanuel Almiron \"', '2022-10-06', '15:58:15'),
(1899, '\"Vanina Caceres\"', '2022-10-06', '16:01:25'),
(1900, '\"Cecilia Ayelen Escalante\"', '2022-10-06', '16:09:03'),
(1901, '\"Nicolas Gallegos\"', '2022-10-06', '16:18:43'),
(1902, '\"Fernando Beron\"', '2022-10-06', '16:19:42'),
(1903, '\"Liz Mariel Sanchez\"', '2022-10-06', '16:22:46'),
(1904, '\"Lorena Saracho Lobos\"', '2022-10-06', '16:25:36'),
(1905, '\"Gaston Flores\"', '2022-10-06', '16:54:07'),
(1906, '\"Maria De Los Angeles Ibarra\"', '2022-10-06', '17:32:25'),
(1907, '\"Monica Daiana Ojeda\"', '2022-10-06', '17:58:11'),
(1908, '\"Vanina Caceres\"', '2022-10-06', '18:08:52'),
(1909, '\"Maria De Los Angeles Ibarra\"', '2022-10-06', '19:10:32'),
(1910, '\"Monica Daiana Ojeda\"', '2022-10-06', '19:54:02'),
(1911, '\"Ronaldo Emmanuel Almiron \"', '2022-10-06', '19:58:28'),
(1912, '\"Silvina Ramirez\"', '2022-10-06', '19:59:02'),
(1913, '\"Maria Soledad Palavecino\"', '2022-10-06', '19:59:18'),
(1914, '\"Fernando Beron\"', '2022-10-06', '20:00:24'),
(1915, '\"Lorena Saracho Lobos\"', '2022-10-06', '20:00:55'),
(1916, '\"Liz Mariel Sanchez\"', '2022-10-06', '20:01:04'),
(1917, '\"Nicolas Gallegos\"', '2022-10-06', '20:06:33'),
(1918, '\"Gaston Flores\"', '2022-10-06', '20:46:39'),
(1919, '\"Silvina Ramirez\"', '2022-10-07', '15:53:13'),
(1920, '\"Gloria Estela Monzon\"', '2022-10-07', '16:19:00'),
(1921, '\"Gloria Estela Monzon\"', '2022-10-07', '20:00:22'),
(1922, '\"Silvina Ramirez\"', '2022-10-07', '20:00:53'),
(1923, '\"Mabel Edith Areco\"', '2022-10-08', '07:56:14'),
(1924, '\"Lorena Saracho Lobos\"', '2022-10-08', '08:28:21'),
(1925, '\"Lorena Saracho Lobos\"', '2022-10-08', '12:07:40'),
(1926, '\"Mabel Edith Areco\"', '2022-10-08', '12:11:26'),
(1927, '\"Regina Victoria Leguizamon\"', '2022-10-08', '16:04:23'),
(1928, '\"Camila Blanca Juarez Amarilla\"', '2022-10-08', '16:14:02'),
(1929, '\"Camila Blanca Juarez Amarilla\"', '2022-10-08', '19:58:07'),
(1930, '\"Regina Victoria Leguizamon\"', '2022-10-08', '19:58:34'),
(1931, '\"Mabel Edith Areco\"', '2022-10-10', '07:50:26'),
(1932, '\"Acevedo Rocio Vanina\"', '2022-10-10', '10:08:20'),
(1933, '\"Mabel Edith Areco\"', '2022-10-10', '12:10:30'),
(1934, '\"Matias Rolando Rodriguez\"', '2022-10-10', '16:06:26'),
(1935, '\"Sabrina Evelyn Gonzalez\"', '2022-10-10', '16:09:01'),
(1936, '\"Sabrina Evelyn Gonzalez\"', '2022-10-10', '20:04:13'),
(1937, '\"Matias Rolando Rodriguez\"', '2022-10-10', '20:07:09'),
(1938, '\"Laura Soledad Escobar\"', '2022-10-11', '07:26:00'),
(1939, '\"Maria De Los Angeles Ibarra\"', '2022-10-11', '07:39:50'),
(1940, '\"Monica Daiana Ojeda\"', '2022-10-11', '07:47:29'),
(1941, '\"Roxana Edith Baez\"', '2022-10-11', '07:52:16'),
(1942, '\"Lourdes Romina Centurion\"', '2022-10-11', '07:54:49'),
(1943, '\"Vanina Caceres\"', '2022-10-11', '07:55:06'),
(1944, '\"Gloria Arias\"', '2022-10-11', '07:55:27'),
(1945, '\"Mariana Anahi Coranel\"', '2022-10-11', '07:58:13'),
(1946, '\"Alfredo Pedro Iznardo\"', '2022-10-11', '07:59:10'),
(1947, '\"Rosa Cecilia Gimenez\"', '2022-10-11', '08:00:21'),
(1948, '\"Cecilia Hauff\"', '2022-10-11', '08:00:44'),
(1949, '\"Marcelo Leon\"', '2022-10-11', '08:02:03'),
(1950, '\"Zulima Noelia Garay\"', '2022-10-11', '08:04:00'),
(1951, '\"admin\"', '2022-10-11', '08:06:27'),
(1952, '\"Julio Sergio Duran\"', '2022-10-11', '08:09:38'),
(1953, '\"Regina Victoria Leguizamon\"', '2022-10-11', '08:12:52'),
(1954, '\"Martin Emanuel Canesin Rojas\"', '2022-10-11', '08:13:02'),
(1955, '\"Acevedo Rocio Vanina\"', '2022-10-11', '08:16:11'),
(1956, '\"Sabrina Evelyn Gonzalez\"', '2022-10-11', '08:19:34'),
(1957, '\"Juan manuel Ojeda\"', '2022-10-11', '08:19:43'),
(1958, '\"Juan Pablo Fernadez\"', '2022-10-11', '08:23:53'),
(1959, '\"Sonia Marcela De Philippis\"', '2022-10-11', '08:47:23'),
(1960, '\"Emilia Clarisa Krachinsky\"', '2022-10-11', '08:50:53'),
(1961, '\"Regina Victoria Leguizamon\"', '2022-10-11', '11:10:01'),
(1962, '\"Laura Soledad Escobar\"', '2022-10-11', '11:30:04'),
(1963, '\"Emilia Clarisa Krachinsky\"', '2022-10-11', '11:55:44'),
(1964, '\"Juan Pablo Fernadez\"', '2022-10-11', '12:01:58'),
(1965, '\"admin\"', '2022-10-11', '12:02:09'),
(1966, '\"Acevedo Rocio Vanina\"', '2022-10-11', '12:04:15'),
(1967, '\"Maria De Los Angeles Ibarra\"', '2022-10-11', '12:16:52'),
(1968, '\"Sonia Marcela De Philippis\"', '2022-10-11', '12:49:52'),
(1969, '\"Gloria Arias\"', '2022-10-11', '12:50:50'),
(1970, '\"Julio Sergio Duran\"', '2022-10-11', '12:52:31'),
(1971, '\"Alfredo Pedro Iznardo\"', '2022-10-11', '12:52:39'),
(1972, '\"Vanina Caceres\"', '2022-10-11', '12:52:44'),
(1973, '\"Marcelo Leon\"', '2022-10-11', '12:56:13'),
(1974, '\"Cecilia Hauff\"', '2022-10-11', '12:56:19'),
(1975, '\"Sabrina Evelyn Gonzalez\"', '2022-10-11', '12:56:29'),
(1976, '\"Mariana Anahi Coranel\"', '2022-10-11', '12:56:44'),
(1977, '\"Martin Emanuel Canesin Rojas\"', '2022-10-11', '13:06:11'),
(1978, '\"Monica Daiana Ojeda\"', '2022-10-11', '13:06:23'),
(1979, '\"Roxana Edith Baez\"', '2022-10-11', '14:03:52'),
(1980, '\"Alfredo Pedro Iznardo\"', '2022-10-11', '15:20:21'),
(1981, '\"Silvina Ramirez\"', '2022-10-11', '15:52:55'),
(1982, '\"Camila Blanca Juarez Amarilla\"', '2022-10-11', '15:57:15'),
(1983, '\"Maria Soledad Palavecino\"', '2022-10-11', '15:58:14'),
(1984, '\"Fernando Beron\"', '2022-10-11', '16:10:01'),
(1985, '\"Lourdes Romina Centurion\"', '2022-10-11', '16:11:03'),
(1986, '\"Liz Mariel Sanchez\"', '2022-10-11', '16:13:39'),
(1987, '\"Monica Daiana Ojeda\"', '2022-10-11', '16:18:30'),
(1988, '\"Roxana Edith Baez\"', '2022-10-11', '16:38:45'),
(1989, '\"Cecilia Ayelen Escalante\"', '2022-10-11', '16:44:32'),
(1990, '\"Gaston Flores\"', '2022-10-11', '17:28:26'),
(1991, '\"Juan manuel Ojeda\"', '2022-10-11', '17:55:22'),
(1992, '\"Roxana Edith Baez\"', '2022-10-11', '18:04:45'),
(1993, '\"Jorge Arturo Ferro\"', '2022-10-11', '18:05:54'),
(1994, '\"Alfredo Pedro Iznardo\"', '2022-10-11', '18:06:15'),
(1995, '\"Julio Sergio Duran\"', '2022-10-11', '18:07:10'),
(1996, '\"Lourdes Romina Centurion\"', '2022-10-11', '18:10:33'),
(1997, '\"Rosa Cecilia Gimenez\"', '2022-10-11', '18:11:46'),
(1998, '\"Maria De Los Angeles Ibarra\"', '2022-10-11', '18:18:27'),
(1999, '\"Silvina Ramirez\"', '2022-10-11', '19:58:34'),
(2000, '\"Cecilia Ayelen Escalante\"', '2022-10-11', '19:59:45'),
(2001, '\"Maria Soledad Palavecino\"', '2022-10-11', '19:59:54'),
(2002, '\"Camila Blanca Juarez Amarilla\"', '2022-10-11', '20:00:17'),
(2003, '\"Jorge Arturo Ferro\"', '2022-10-11', '20:02:27'),
(2004, '\"Jorge Arturo Ferro\"', '2022-10-11', '20:02:27'),
(2005, '\"Monica Daiana Ojeda\"', '2022-10-11', '20:02:33'),
(2006, '\"Liz Mariel Sanchez\"', '2022-10-11', '20:02:42'),
(2007, '\"Fernando Beron\"', '2022-10-11', '20:02:58'),
(2008, '\"Gaston Flores\"', '2022-10-11', '20:03:05'),
(2009, '\"Julio Sergio Duran\"', '2022-10-11', '20:03:54'),
(2010, '\"Matias Rolando Rodriguez\"', '2022-10-12', '07:20:14'),
(2011, '\"Mabel Edith Areco\"', '2022-10-12', '07:30:43'),
(2012, '\"Juan manuel Ojeda\"', '2022-10-12', '07:39:12'),
(2013, '\"Laura Soledad Escobar\"', '2022-10-12', '07:44:17'),
(2014, '\"Monica Daiana Ojeda\"', '2022-10-12', '07:45:43'),
(2015, '\"Zulima Noelia Garay\"', '2022-10-12', '07:54:39'),
(2016, '\"Marcelo Leon\"', '2022-10-12', '07:57:38'),
(2017, '\"Gloria Arias\"', '2022-10-12', '07:58:06'),
(2018, '\"Nadia Itati Romero\"', '2022-10-12', '07:59:54'),
(2019, '\"Maria De Los Angeles Ibarra\"', '2022-10-12', '08:00:23'),
(2020, '\"Mariana Anahi Coranel\"', '2022-10-12', '08:00:54'),
(2021, '\"Cecilia Hauff\"', '2022-10-12', '08:01:51'),
(2022, '\"Jorge Arturo Ferro\"', '2022-10-12', '08:03:12'),
(2023, '\"Roxana Edith Baez\"', '2022-10-12', '08:03:57'),
(2024, '\"Vanina Caceres\"', '2022-10-12', '08:04:36'),
(2025, '\"Julio Sergio Duran\"', '2022-10-12', '08:05:40'),
(2026, '\"admin\"', '2022-10-12', '08:06:21'),
(2027, '\"Lourdes Romina Centurion\"', '2022-10-12', '08:07:31'),
(2028, '\"Rosa Cecilia Gimenez\"', '2022-10-12', '08:09:57'),
(2029, '\"Martin Emanuel Canesin Rojas\"', '2022-10-12', '08:10:22'),
(2030, '\"Alfredo Pedro Iznardo\"', '2022-10-12', '08:20:51'),
(2031, '\"Juan Pablo Fernadez\"', '2022-10-12', '08:25:03'),
(2032, '\"Sonia Marcela De Philippis\"', '2022-10-12', '08:45:42'),
(2033, '\"Matias Rolando Rodriguez\"', '2022-10-12', '11:30:48'),
(2034, '\"Nadia Itati Romero\"', '2022-10-12', '11:57:49'),
(2035, '\"Laura Soledad Escobar\"', '2022-10-12', '12:00:05'),
(2036, '\"Jorge Arturo Ferro\"', '2022-10-12', '12:03:27'),
(2037, '\"admin\"', '2022-10-12', '12:09:28'),
(2038, '\"Juan Pablo Fernadez\"', '2022-10-12', '12:26:26'),
(2039, '\"Maria De Los Angeles Ibarra\"', '2022-10-12', '12:26:35'),
(2040, '\"Vanina Caceres\"', '2022-10-12', '12:41:47'),
(2041, '\"Gloria Arias\"', '2022-10-12', '12:48:39'),
(2042, '\"Monica Daiana Ojeda\"', '2022-10-12', '12:50:32'),
(2043, '\"Sonia Marcela De Philippis\"', '2022-10-12', '12:55:29'),
(2044, '\"Marcelo Leon\"', '2022-10-12', '12:58:00'),
(2045, '\"Cecilia Hauff\"', '2022-10-12', '12:59:13'),
(2046, '\"Martin Emanuel Canesin Rojas\"', '2022-10-12', '12:59:22'),
(2047, '\"Mariana Anahi Coranel\"', '2022-10-12', '12:59:49'),
(2048, '\"Mariana Anahi Coranel\"', '2022-10-12', '13:00:11'),
(2049, '\"Julio Sergio Duran\"', '2022-10-12', '13:00:18'),
(2050, '\"Lourdes Romina Centurion\"', '2022-10-12', '13:03:35'),
(2051, '\"Roxana Edith Baez\"', '2022-10-12', '13:06:22'),
(2052, '\"Mabel Edith Areco\"', '2022-10-12', '13:20:30'),
(2053, '\"Camila Blanca Juarez Amarilla\"', '2022-10-12', '15:52:06'),
(2054, '\"Maria Soledad Palavecino\"', '2022-10-12', '15:54:41'),
(2055, '\"Silvina Ramirez\"', '2022-10-12', '15:54:47'),
(2056, '\"Vanina Caceres\"', '2022-10-12', '16:00:37'),
(2057, '\"Fernando Beron\"', '2022-10-12', '16:04:56'),
(2058, '\"Liz Mariel Sanchez\"', '2022-10-12', '16:05:26'),
(2059, '\"Sabrina Evelyn Gonzalez\"', '2022-10-12', '16:06:12'),
(2060, '\"Cecilia Ayelen Escalante\"', '2022-10-12', '16:10:19'),
(2061, '\"Nicolas Gallegos\"', '2022-10-12', '16:10:57'),
(2062, '\"Gloria Arias\"', '2022-10-12', '16:34:15'),
(2063, '\"Lorena Saracho Lobos\"', '2022-10-12', '16:40:25'),
(2064, '\"Mariana Anahi Coranel\"', '2022-10-12', '17:23:11'),
(2065, '\"Vanina Caceres\"', '2022-10-12', '17:46:41'),
(2066, '\"Rosa Cecilia Gimenez\"', '2022-10-12', '18:00:08'),
(2067, '\"Gaston Flores\"', '2022-10-12', '18:02:21'),
(2068, '\"Cecilia Hauff\"', '2022-10-12', '18:18:21'),
(2069, '\"Maria De Los Angeles Ibarra\"', '2022-10-12', '18:18:31'),
(2070, '\"Gloria Arias\"', '2022-10-12', '18:45:38'),
(2071, '\"Cecilia Hauff\"', '2022-10-12', '19:28:38'),
(2072, '\"Mariana Anahi Coranel\"', '2022-10-12', '19:55:33'),
(2073, '\"Maria De Los Angeles Ibarra\"', '2022-10-12', '19:56:08'),
(2074, '\"Camila Blanca Juarez Amarilla\"', '2022-10-12', '20:02:19'),
(2075, '\"Sabrina Evelyn Gonzalez\"', '2022-10-12', '20:02:39'),
(2076, '\"Silvina Ramirez\"', '2022-10-12', '20:07:04'),
(2077, '\"Maria Soledad Palavecino\"', '2022-10-12', '20:07:16'),
(2078, '\"Lorena Saracho Lobos\"', '2022-10-12', '20:07:53'),
(2079, '\"Gaston Flores\"', '2022-10-12', '20:24:27'),
(2080, '\"Nicolas Gallegos\"', '2022-10-12', '20:31:21'),
(2081, '\"Cecilia Ayelen Escalante\"', '2022-10-12', '20:31:32'),
(2082, '\"Liz Mariel Sanchez\"', '2022-10-12', '20:31:39'),
(2083, '\"Fernando Beron\"', '2022-10-12', '20:34:51'),
(2084, '\"Matias Rolando Rodriguez\"', '2022-10-13', '07:11:36'),
(2085, '\"Laura Soledad Escobar\"', '2022-10-13', '07:36:22'),
(2086, '\"Monica Daiana Ojeda\"', '2022-10-13', '07:48:50'),
(2087, '\"Gloria Arias\"', '2022-10-13', '07:48:57'),
(2088, '\"Cecilia Hauff\"', '2022-10-13', '07:54:54'),
(2089, '\"Zulima Noelia Garay\"', '2022-10-13', '07:56:14'),
(2090, '\"Rosa Cecilia Gimenez\"', '2022-10-13', '07:56:31'),
(2091, '\"Marcelo Leon\"', '2022-10-13', '07:59:52'),
(2092, '\"Alfredo Pedro Iznardo\"', '2022-10-13', '08:00:01'),
(2093, '\"Jorge Arturo Ferro\"', '2022-10-13', '08:00:39'),
(2094, '\"Julio Sergio Duran\"', '2022-10-13', '08:03:41'),
(2095, '\"Maria De Los Angeles Ibarra\"', '2022-10-13', '08:04:28'),
(2096, '\"Sabrina Evelyn Gonzalez\"', '2022-10-13', '08:07:47'),
(2097, '\"Juan Pablo Fernadez\"', '2022-10-13', '08:08:56'),
(2098, '\"admin\"', '2022-10-13', '08:09:42'),
(2099, '\"Nadia Itati Romero\"', '2022-10-13', '08:09:50'),
(2100, '\"Roxana Edith Baez\"', '2022-10-13', '08:10:25'),
(2101, '\"Lourdes Romina Centurion\"', '2022-10-13', '08:10:50'),
(2102, '\"Juan manuel Ojeda\"', '2022-10-13', '08:30:05'),
(2103, '\"Sonia Marcela De Philippis\"', '2022-10-13', '08:40:08'),
(2104, '\"Emilia Clarisa Krachinsky\"', '2022-10-13', '08:56:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoria`
--

CREATE TABLE `auditoria` (
  `id` int(11) NOT NULL,
  `tabla` varchar(255) NOT NULL,
  `accion` varchar(255) NOT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  `old_value` longtext CHARACTER SET utf8 DEFAULT NULL,
  `new_value` longtext CHARACTER SET utf8 DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `auditoria`
--

INSERT INTO `auditoria` (`id`, `tabla`, `accion`, `fecha`, `old_value`, `new_value`, `usuario_id`) VALUES
(106, 'Alojamientos', 'INSERT', '2023-05-04 17:40:00', NULL, '{\"`id_alojamientos`\":105,\"`idoneo_alojamiento`\":prueba rony}', 3),
(107, 'Alojamientos', 'UPDATE', '2023-05-04 17:42:09', '{\"`id_alojamientos`\":105,\"`idoneo_alojamiento`\":prueba rony}', '{\"`id_alojamientos`\":105,\"`idoneo_alojamiento`\":prueba rony}', 3),
(108, 'Alojamientos', 'UPDATE', '2023-05-04 17:42:09', '{\"`id_alojamientos`\":105,\"`idoneo_alojamiento`\":prueba rony}', '{\"`id_alojamientos`\":105,\"`idoneo_alojamiento`\":prueba rony}', 3),
(109, 'Alojamientos', 'UPDATE', '2023-05-04 17:42:09', '{\"`id_alojamientos`\":105,\"`idoneo_alojamiento`\":prueba rony}', '{\"`id_alojamientos`\":105,\"`idoneo_alojamiento`\":prueba rony}', 3),
(110, 'Alojamientos', 'DELETE', '2023-05-04 17:53:32', '{\"`id_alojamientos`\":104,\"`idoneo_alojamiento`\":prueba rony}', NULL, 3),
(111, 'Alojamientos', 'UPDATE', '2023-05-04 17:54:56', '{\"`id_alojamientos`\":68,\"`idoneo_alojamiento`\":}', '{\"`id_alojamientos`\":68,\"`idoneo_alojamiento`\":}', 3),
(112, 'Alojamientos', 'UPDATE', '2023-05-04 17:54:56', '{\"`id_alojamientos`\":68,\"`idoneo_alojamiento`\":}', '{\"`id_alojamientos`\":68,\"`idoneo_alojamiento`\":}', 3),
(113, 'Alojamientos', 'UPDATE', '2023-05-04 17:54:56', '{\"`id_alojamientos`\":68,\"`idoneo_alojamiento`\":}', '{\"`id_alojamientos`\":68,\"`idoneo_alojamiento`\":}', 3),
(114, 'Alojamientos', 'UPDATE', '2023-05-04 17:57:54', '{\"`id_alojamientos`\":68,\"`idoneo_alojamiento`\":}', '{\"`id_alojamientos`\":68,\"`idoneo_alojamiento`\":}', 3),
(115, 'Alojamientos', 'UPDATE', '2023-05-04 17:57:54', '{\"`id_alojamientos`\":68,\"`idoneo_alojamiento`\":}', '{\"`id_alojamientos`\":68,\"`idoneo_alojamiento`\":}', 3),
(116, 'Alojamientos', 'UPDATE', '2023-05-04 17:57:54', '{\"`id_alojamientos`\":68,\"`idoneo_alojamiento`\":}', '{\"`id_alojamientos`\":68,\"`idoneo_alojamiento`\":}', 71),
(117, 'gastronomia', 'insert', '2023-05-04 18:19:38', NULL, 'Lo de Victor Parrilla y Resto', 23),
(118, 'gastronomia', 'INSERT', '2023-05-05 09:58:15', NULL, '{\"`id_gastronomia`\":79}', 59),
(119, 'gastronomia', 'INSERT', '2023-05-05 10:03:36', NULL, '{\"`id_gastronomia`\":80}', 59),
(120, 'gastronomia', 'INSERT', '2023-05-05 10:09:38', NULL, '{\"`id_gastronomia`\":81}', 59),
(121, 'gastronomia', 'INSERT', '2023-05-05 10:13:15', NULL, '{\"`id_gastronomia`\":82}', 59),
(122, 'gastronomia', 'INSERT', '2023-05-05 10:17:50', NULL, '{\"`id_gastronomia`\":83}', 59),
(123, 'gastronomia', 'INSERT', '2023-05-05 10:21:18', NULL, '{\"`id_gastronomia`\":84}', 59),
(124, 'gastronomia', 'INSERT', '2023-05-05 10:24:14', NULL, '{\"`id_gastronomia`\":85}', 59),
(125, 'gastronomia', 'INSERT', '2023-05-05 10:28:27', NULL, '{\"`id_gastronomia`\":86}', 59),
(126, 'gastronomia', 'INSERT', '2023-05-05 11:47:05', NULL, '{\"`id_gastronomia`\":87}', 23),
(127, 'gastronomia', 'INSERT', '2023-05-05 11:49:20', NULL, '{\"`id_gastronomia`\":88}', 23),
(128, 'gastronomia', 'INSERT', '2023-05-05 11:51:02', NULL, '{\"`id_gastronomia`\":89}', 23),
(129, 'gastronomia', 'INSERT', '2023-05-05 11:53:05', NULL, '{\"`id_gastronomia`\":90}', 23),
(130, 'gastronomia', 'INSERT', '2023-05-05 11:55:13', NULL, '{\"`id_gastronomia`\":91}', 23),
(131, 'gastronomia', 'INSERT', '2023-05-05 11:56:50', NULL, '{\"`id_gastronomia`\":92}', 3),
(148, 'gastronomia', 'delete', '2023-05-10 08:24:42', 'SPUB', NULL, 23),
(149, 'gastronomia', 'INSERT', '2023-05-10 08:29:15', NULL, '{\"`id_gastronomia`\":93}', 23),
(150, 'gastronomia', 'INSERT', '2023-05-10 08:36:08', NULL, '{\"`id_gastronomia`\":94}', 23),
(151, 'gastronomia', 'INSERT', '2023-05-10 08:38:32', NULL, '{\"`id_gastronomia`\":95}', 23),
(152, 'gastronomia', 'INSERT', '2023-05-10 08:42:04', NULL, '{\"`id_gastronomia`\":96}', 23),
(153, 'gastronomia', 'INSERT', '2023-05-10 08:49:20', NULL, '{\"`id_gastronomia`\":97}', 23),
(154, 'gastronomia', 'INSERT', '2023-05-10 08:52:19', NULL, '{\"`id_gastronomia`\":98}', 23),
(155, 'prestadores', 'DELETE', '2023-05-11 12:35:41', '{\"`id_prestador`\":15}', NULL, 25),
(156, 'prestadores', 'UPDATE', '2023-05-11 12:38:57', '{\"`id_prestador`\":6}', '{\"`id_prestador`\":6}', 25),
(157, 'prestadores', 'UPDATE', '2023-05-12 09:23:13', '{\"`id_prestador`\":36}', '{\"`id_prestador`\":36}', 25),
(158, 'prestadores', 'UPDATE', '2023-05-12 09:23:59', '{\"`id_prestador`\":31}', '{\"`id_prestador`\":31}', 25),
(159, 'prestadores', 'INSERT', '2023-05-12 09:30:50', NULL, '{\"`id_prestador`\":46}', 25),
(160, 'prestadores', 'UPDATE', '2023-05-12 09:31:16', '{\"`id_prestador`\":36}', '{\"`id_prestador`\":36}', 3),
(161, 'prestadores', 'UPDATE', '2023-05-12 09:31:56', '{\"`id_prestador`\":31}', '{\"`id_prestador`\":31}', 3),
(162, 'Alojamientos', 'UPDATE', '2023-05-15 08:26:37', '{\"`id_alojamientos`\":33,\"`idoneo_alojamiento`\":}', '{\"`id_alojamientos`\":33,\"`idoneo_alojamiento`\":}', 71),
(163, 'Alojamientos', 'UPDATE', '2023-05-15 08:26:37', '{\"`id_alojamientos`\":33,\"`idoneo_alojamiento`\":}', '{\"`id_alojamientos`\":33,\"`idoneo_alojamiento`\":}', 71),
(164, 'Alojamientos', 'UPDATE', '2023-05-15 08:26:37', '{\"`id_alojamientos`\":33,\"`idoneo_alojamiento`\":}', '{\"`id_alojamientos`\":33,\"`idoneo_alojamiento`\":}', 3),
(165, 'Alojamientos', 'DELETE', '2023-05-15 08:28:41', '{\"`id_alojamientos`\":73,\"`idoneo_alojamiento`\":}', NULL, 3),
(166, 'Alojamientos', 'DELETE', '2023-05-15 08:29:40', '{\"`id_alojamientos`\":35,\"`idoneo_alojamiento`\":}', NULL, 71),
(167, 'Alojamientos', 'DELETE', '2023-05-15 08:30:02', '{\"`id_alojamientos`\":36,\"`idoneo_alojamiento`\":}', NULL, 71),
(168, 'Alojamientos', 'DELETE', '2023-05-15 08:30:13', '{\"`id_alojamientos`\":33,\"`idoneo_alojamiento`\":}', NULL, 71),
(169, 'prestadores', 'UPDATE', '2023-05-15 09:13:38', '{\"`id_prestador`\":7}', '{\"`id_prestador`\":7}', 25),
(170, 'prestadores', 'UPDATE', '2023-05-15 09:13:58', '{\"`id_prestador`\":6}', '{\"`id_prestador`\":6}', 25),
(171, 'prestadores', 'UPDATE', '2023-05-15 09:14:46', '{\"`id_prestador`\":6}', '{\"`id_prestador`\":6}', 25),
(172, 'prestadores', 'UPDATE', '2023-05-15 09:15:43', '{\"`id_prestador`\":10}', '{\"`id_prestador`\":10}', 25),
(173, 'prestadores', 'UPDATE', '2023-05-15 09:41:39', '{\"`id_prestador`\":46}', '{\"`id_prestador`\":46}', 25),
(174, 'agencias', 'UPDATE', '2023-05-15 09:53:46', '{\"`id_agencias`\":28,\"`idoneo_agencia`\":Canesin Martin}', '{\"`id_agencias`\":28,\"`idoneo_agencia`\":desconocido}', 25),
(175, 'agencias', 'UPDATE', '2023-05-15 09:54:19', '{\"`id_agencias`\":16,\"`idoneo_agencia`\":Molina, Miguel Ángel}', '{\"`id_agencias`\":16,\"`idoneo_agencia`\":Molina, Miguel Ángel}', 25),
(176, 'prestadores', 'UPDATE', '2023-05-15 10:23:33', '{\"`id_prestador`\":10}', '{\"`id_prestador`\":10}', 25),
(177, 'agencias', 'UPDATE', '2023-05-15 10:50:49', '{\"`id_agencias`\":19,\"`idoneo_agencia`\":Ridella, Gimena Daiana}', '{\"`id_agencias`\":19,\"`idoneo_agencia`\":Ridella, Gimena Daiana}', 25),
(178, 'agencias', 'DELETE', '2023-05-15 10:58:46', '{\"`id_agencias`\":19,\"`idoneo_agencia`\":Ridella, Gimena Daiana}', NULL, 25),
(179, 'agencias', 'UPDATE', '2023-05-16 10:14:30', '{\"`id_agencias`\":16,\"`idoneo_agencia`\":Molina, Miguel Ángel}', '{\"`id_agencias`\":16,\"`idoneo_agencia`\":Molina, Miguel Ángel}', 25),
(180, 'prestadores', 'UPDATE', '2023-05-16 10:21:00', '{\"`id_prestador`\":41}', '{\"`id_prestador`\":41}', 25),
(181, 'servicios_generales', 'INSERT', '2023-05-16 10:45:28', NULL, '{\"`id_servicios_generales`\":39,\"`idoneo_servicio_general`\":Aníbal Gimenez}', 25),
(182, 'servicios_generales', 'UPDATE', '2023-05-16 10:48:09', '{\"`id_servicios_generales`\":39,\"`idoneo_servicio_general`\":Aníbal Gimenez}', '{\"`id_servicios_generales`\":39,\"`idoneo_servicio_general`\":Aníbal Gimenez}', 25),
(183, 'prestadores', 'INSERT', '2023-05-16 10:52:51', NULL, '{\"`id_prestador`\":47}', 25),
(184, 'prestadores', 'INSERT', '2023-05-16 10:55:31', NULL, '{\"`id_prestador`\":48}', 25),
(185, 'prestadores', 'UPDATE', '2023-05-16 11:06:33', '{\"`id_prestador`\":47}', '{\"`id_prestador`\":47}', 25),
(186, 'prestadores', 'UPDATE', '2023-05-16 11:08:10', '{\"`id_prestador`\":48}', '{\"`id_prestador`\":48}', 25),
(187, 'prestadores', 'INSERT', '2023-05-16 11:12:00', NULL, '{\"`id_prestador`\":49}', 25),
(188, 'prestadores', 'INSERT', '2023-05-16 11:13:17', NULL, '{\"`id_prestador`\":50}', 25),
(189, 'prestadores', 'INSERT', '2023-05-16 11:15:14', NULL, '{\"`id_prestador`\":51}', 25),
(190, 'prestadores', 'INSERT', '2023-05-16 11:16:51', NULL, '{\"`id_prestador`\":52}', 25),
(191, 'prestadores', 'INSERT', '2023-05-16 11:18:05', NULL, '{\"`id_prestador`\":53}', 25),
(192, 'prestadores', 'INSERT', '2023-05-16 11:20:31', NULL, '{\"`id_prestador`\":54}', 25),
(193, 'prestadores', 'INSERT', '2023-05-16 11:23:30', NULL, '{\"`id_prestador`\":55}', 25),
(194, 'prestadores', 'INSERT', '2023-05-16 11:25:59', NULL, '{\"`id_prestador`\":56}', 25),
(195, 'prestadores', 'UPDATE', '2023-05-16 11:29:43', '{\"`id_prestador`\":12}', '{\"`id_prestador`\":12}', 25),
(196, 'prestadores', 'INSERT', '2023-05-16 11:31:30', NULL, '{\"`id_prestador`\":57}', 25),
(197, 'prestadores', 'UPDATE', '2023-05-16 11:32:37', '{\"`id_prestador`\":12}', '{\"`id_prestador`\":12}', 25),
(198, 'prestadores', 'UPDATE', '2023-05-16 11:34:17', '{\"`id_prestador`\":23}', '{\"`id_prestador`\":23}', 25),
(199, 'prestadores', 'UPDATE', '2023-05-16 11:41:19', '{\"`id_prestador`\":21}', '{\"`id_prestador`\":21}', 25),
(200, 'prestadores', 'INSERT', '2023-05-16 11:42:41', NULL, '{\"`id_prestador`\":58}', 25),
(201, 'prestadores', 'UPDATE', '2023-05-16 12:07:23', '{\"`id_prestador`\":21}', '{\"`id_prestador`\":21}', 25),
(202, 'agencias', 'UPDATE', '2023-05-16 12:12:44', '{\"`id_agencias`\":28,\"`idoneo_agencia`\":desconocido}', '{\"`id_agencias`\":28,\"`idoneo_agencia`\":desconocido}', 25),
(203, 'Alojamientos', 'DELETE', '2023-05-17 10:12:34', '{\"`id_alojamientos`\":15,\"`idoneo_alojamiento`\":}', NULL, 71),
(204, 'gastronomia', 'update', '2023-05-17 10:42:39', 'Panadería Pan Caliente ', 'Panadería Pan Caliente ', 59),
(205, 'gastronomia', 'INSERT', '2023-05-17 10:58:50', NULL, '{\"`id_gastronomia`\":99}', 59),
(206, 'gastronomia', 'INSERT', '2023-05-17 10:59:29', NULL, '{\"`id_gastronomia`\":100}', 59),
(207, 'gastronomia', 'INSERT', '2023-05-17 10:59:56', NULL, '{\"`id_gastronomia`\":101}', 59),
(208, 'prestadores', 'UPDATE', '2023-05-19 08:38:04', '{\"`id_prestador`\":12}', '{\"`id_prestador`\":12}', 25),
(209, 'prestadores', 'UPDATE', '2023-05-19 08:39:51', '{\"`id_prestador`\":22}', '{\"`id_prestador`\":22}', 25),
(210, 'prestadores', 'UPDATE', '2023-05-19 08:40:16', '{\"`id_prestador`\":14}', '{\"`id_prestador`\":14}', 25),
(211, 'prestadores', 'UPDATE', '2023-05-19 08:42:03', '{\"`id_prestador`\":24}', '{\"`id_prestador`\":24}', 25),
(212, 'prestadores', 'UPDATE', '2023-05-19 08:42:31', '{\"`id_prestador`\":23}', '{\"`id_prestador`\":23}', 25),
(213, 'prestadores', 'UPDATE', '2023-05-19 08:42:59', '{\"`id_prestador`\":19}', '{\"`id_prestador`\":19}', 25),
(214, 'prestadores', 'UPDATE', '2023-05-19 08:54:48', '{\"`id_prestador`\":22}', '{\"`id_prestador`\":22}', 25),
(215, 'transportes', 'DELETE', '2023-05-19 09:28:01', '{\"`id_transportes`\":3,\"`idoneo_transportes`\":idoneo transportes 3}', NULL, 3),
(216, 'Transportes', 'INSERT', '2023-05-19 09:30:39', NULL, '{\"`id_transportes`\":4,\"`idoneo_transportes`\":idoneo transporte}', 3),
(217, 'transportes', 'DELETE', '2023-05-19 09:33:31', '{\"`id_transportes`\":4,\"`idoneo_transportes`\":idoneo transporte}', NULL, 25),
(218, 'prestadores', 'DELETE', '2023-05-19 09:38:32', '{\"`id_prestador`\":18}', NULL, 25),
(219, 'Transportes', 'INSERT', '2023-05-19 09:42:42', NULL, '{\"`id_transportes`\":5,\"`idoneo_transportes`\":}', 25),
(220, 'Transportes', 'UPDATE', '2023-05-19 09:42:56', '{\"`id_transportes`\":5,\"`idoneo_transportes`\":}', '{\"`id_transportes`\":5,\"`idoneo_transportes`\":}', 25),
(221, 'prestadores', 'DELETE', '2023-05-19 09:46:52', '{\"`id_prestador`\":34}', NULL, 25),
(222, 'prestadores', 'UPDATE', '2023-05-19 09:49:45', '{\"`id_prestador`\":54}', '{\"`id_prestador`\":54}', 25),
(223, 'prestadores', 'UPDATE', '2023-05-19 09:50:07', '{\"`id_prestador`\":55}', '{\"`id_prestador`\":55}', 25),
(224, 'prestadores', 'DELETE', '2023-05-19 10:04:30', '{\"`id_prestador`\":36}', NULL, 25),
(225, 'Transportes', 'INSERT', '2023-05-19 10:14:40', NULL, '{\"`id_transportes`\":6,\"`idoneo_transportes`\":}', 25),
(226, 'prestadores', 'DELETE', '2023-05-19 10:18:23', '{\"`id_prestador`\":30}', NULL, 25),
(227, 'Transportes', 'INSERT', '2023-05-19 10:27:38', NULL, '{\"`id_transportes`\":7,\"`idoneo_transportes`\":luis Barco}', 25),
(228, 'prestadores', 'DELETE', '2023-05-19 10:56:52', '{\"`id_prestador`\":31}', NULL, 25),
(229, 'Transportes', 'INSERT', '2023-05-19 11:00:08', NULL, '{\"`id_transportes`\":8,\"`idoneo_transportes`\":laura lopez}', 25),
(230, 'prestadores', 'INSERT', '2023-05-19 11:45:06', NULL, '{\"`id_prestador`\":59}', 25),
(231, 'gastronomia', 'INSERT', '2023-05-31 09:11:19', NULL, '{\"`id_gastronomia`\":102}', 23),
(232, 'gastronomia', 'INSERT', '2023-05-31 09:21:51', NULL, '{\"`id_gastronomia`\":103}', 23),
(233, 'gastronomia', 'INSERT', '2023-05-31 09:26:19', NULL, '{\"`id_gastronomia`\":104}', 23),
(234, 'gastronomia', 'INSERT', '2023-05-31 09:35:28', NULL, '{\"`id_gastronomia`\":105}', 23),
(235, 'gastronomia', 'INSERT', '2023-05-31 09:39:13', NULL, '{\"`id_gastronomia`\":106}', 23),
(236, 'gastronomia', 'INSERT', '2023-05-31 09:42:15', NULL, '{\"`id_gastronomia`\":107}', 23),
(237, 'gastronomia', 'INSERT', '2023-05-31 09:53:55', NULL, '{\"`id_gastronomia`\":108}', 23),
(238, 'gastronomia', 'INSERT', '2023-05-31 09:55:57', NULL, '{\"`id_gastronomia`\":109}', 23),
(239, 'gastronomia', 'INSERT', '2023-05-31 09:57:59', NULL, '{\"`id_gastronomia`\":110}', 23),
(240, 'gastronomia', 'INSERT', '2023-05-31 10:02:57', NULL, '{\"`id_gastronomia`\":111}', 23),
(241, 'gastronomia', 'INSERT', '2023-05-31 10:04:36', NULL, '{\"`id_gastronomia`\":112}', 23),
(242, 'gastronomia', 'INSERT', '2023-05-31 10:06:18', NULL, '{\"`id_gastronomia`\":113}', 23),
(243, 'gastronomia', 'INSERT', '2023-05-31 10:08:59', NULL, '{\"`id_gastronomia`\":114}', 23),
(244, 'gastronomia', 'INSERT', '2023-05-31 10:13:33', NULL, '{\"`id_gastronomia`\":115}', 23),
(245, 'gastronomia', 'INSERT', '2023-05-31 10:16:10', NULL, '{\"`id_gastronomia`\":116}', 23),
(246, 'gastronomia', 'INSERT', '2023-05-31 10:18:07', NULL, '{\"`id_gastronomia`\":117}', 23),
(247, 'gastronomia', 'INSERT', '2023-05-31 10:20:56', NULL, '{\"`id_gastronomia`\":118}', 23),
(248, 'gastronomia', 'INSERT', '2023-05-31 10:22:37', NULL, '{\"`id_gastronomia`\":119}', 23),
(249, 'gastronomia', 'INSERT', '2023-05-31 10:24:59', NULL, '{\"`id_gastronomia`\":120}', 23),
(250, 'gastronomia', 'INSERT', '2023-05-31 10:33:17', NULL, '{\"`id_gastronomia`\":121}', 23),
(251, 'gastronomia', 'INSERT', '2023-05-31 10:48:02', NULL, '{\"`id_gastronomia`\":122}', 23),
(252, 'gastronomia', 'INSERT', '2023-05-31 10:49:36', NULL, '{\"`id_gastronomia`\":123}', 23),
(253, 'gastronomia', 'INSERT', '2023-05-31 10:50:39', NULL, '{\"`id_gastronomia`\":124}', 23),
(254, 'cursos', 'UPDATE', '2023-06-12 10:29:18', '{\"`id_cursos`\":110}', '{\"`id_cursos`\":110}', 3),
(255, 'cursos', 'UPDATE', '2023-06-12 10:29:42', '{\"`id_cursos`\":180}', '{\"`id_cursos`\":180}', 3),
(256, 'cursos', 'UPDATE', '2023-06-12 10:36:12', '{\"`id_cursos`\":72}', '{\"`id_cursos`\":72}', 3),
(257, 'cursos', 'UPDATE', '2023-06-12 10:42:52', '{\"`id_cursos`\":70}', '{\"`id_cursos`\":70}', 3),
(258, 'cursos', 'UPDATE', '2023-06-14 10:16:50', '{\"`id_cursos`\":61}', '{\"`id_cursos`\":61}', 3),
(259, 'cursos', 'UPDATE', '2023-06-14 10:48:36', '{\"`id_cursos`\":177}', '{\"`id_cursos`\":177}', 3),
(260, 'cursos', 'UPDATE', '2023-06-14 11:01:47', '{\"`id_cursos`\":158}', '{\"`id_cursos`\":158}', 3),
(261, 'cursos', 'UPDATE', '2023-06-14 11:34:01', '{\"`id_cursos`\":69}', '{\"`id_cursos`\":69}', 3),
(262, 'cursos', 'INSERT', '2023-06-22 09:42:56', NULL, '{\"`id_cursos`\":189}', 3),
(263, 'Alojamientos', 'INSERT', '2023-07-04 08:38:53', NULL, '{\"`id_alojamientos`\":106,\"`idoneo_alojamiento`\":karina}', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calendario`
--

CREATE TABLE `calendario` (
  `id_calendario` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `rela_localidad` int(11) DEFAULT NULL,
  `color` varchar(255) NOT NULL,
  `text_color_calendario` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `calendario`
--

INSERT INTO `calendario` (`id_calendario`, `title`, `descripcion`, `start`, `end`, `rela_localidad`, `color`, `text_color_calendario`) VALUES
(2, 'Encuentro Internacional del Muralismo', 'formosa', '2022-01-14', '2022-01-16', NULL, '#380ce9', NULL),
(8, 'Carnaval', 'Feriado Nacional', '2022-02-28', '2022-03-02', NULL, '#0d7406', NULL),
(9, 'Día Nacional de la Memoria por la Verdad y la Justicia', 'Feriado Nacional', '2022-03-24', '2022-03-24', NULL, '#0d7406', NULL),
(10, 'Día del Veterano y de los Caídos en la Guerra de Malvinas', 'Feriado Nacional', '2022-04-02', '2022-04-02', NULL, '#0d7406', NULL),
(11, 'Viernes Santo', 'Feriado Nacional', '2022-04-15', '2022-04-15', NULL, '#0d7406', NULL),
(12, 'Día del Trabajador', 'Feriado Nacional', '2022-05-01', '2022-05-01', NULL, '#0d7406', NULL),
(13, 'Día de la Revolución de Mayo', 'Feriado Nacional', '2022-05-25', '2022-05-25', NULL, '#0d7406', NULL),
(14, 'Paso a la Inmortalidad del Gral. Don Martín Miguel de Güemes', 'Trasladable', '2022-06-17', '2022-06-17', NULL, '#d4770c', NULL),
(15, 'Paso a la Inmortalidad del Gral. Manuel Belgrano', 'Feriado Nacional', '2022-06-20', '2022-06-20', NULL, '#0d7406', NULL),
(16, 'Día de la Independencia', 'Feriado Nacional', '2022-07-09', '2022-07-09', NULL, '#0d7406', NULL),
(17, 'Paso a la Inmortalidad del Gral. José de San Martín', 'Trasladable', '2022-08-15', '2022-08-15', NULL, '#d4770c', NULL),
(19, 'Día de la Soberanía Nacional', 'Feriado Nacional', '2022-11-20', '2022-11-20', NULL, '#0d7406', NULL),
(21, 'Fiesta internacional del rio, mate y terere', 'se realizara en los dias 21 al 23 de enero', '2022-01-21', '2022-01-24', NULL, '#380ce9', NULL),
(22, 'Aniversario San Hilario', 'Cumpleaños de localidad', '2022-01-15', '2022-01-15', NULL, '#9007cf', NULL),
(24, 'Aniversario Palo Santo', 'Cumpleaños de localidad', '2022-02-03', '2022-02-03', NULL, '#9007cf', NULL),
(25, 'Aniversario Comandante Fontana', 'Cumpleaños de localidad', '2022-02-03', '2022-02-03', NULL, '#9007cf', NULL),
(26, 'Aniversario El Colorado', 'Cumpleaños de localidad', '2022-02-11', '2022-02-11', NULL, '#9007cf', NULL),
(27, 'Día de la Mujer', 'Recordatorio', '2022-03-08', '2022-03-08', NULL, '#06c160', NULL),
(28, 'Aniversario Mojón de Fierro', 'Cumpleaños de localidad', '2022-03-21', '2022-03-21', NULL, '#9007cf', NULL),
(29, 'Aniversario Misión Laishí', 'Cumpleaños de localidad', '2022-03-25', '2022-03-25', NULL, '#9007cf', NULL),
(30, 'Aniversario Siete Palmas', 'Cumpleaños de localidad', '2022-04-02', '2022-04-02', NULL, '#9007cf', NULL),
(31, 'Aniversario Tres Lagunas', 'Cumpleaños de localidad', '2022-04-05', '2022-04-05', NULL, '#9007cf', NULL),
(32, 'Aniversario Ciudad de Formosa', 'Cumpleaños de localidad', '2022-04-08', '2022-04-08', NULL, '#9007cf', NULL),
(33, 'Aniversario SubTeniente Perín', 'Cumpleaños de localidad', '2022-04-30', '2022-04-30', NULL, '#9007cf', NULL),
(34, 'Aniversario Villa Dos Trece', 'Cumpleaños de localidad', '2022-05-09', '2022-05-09', NULL, '#9007cf', NULL),
(35, 'Aniversario Herradura', 'Cumpleaños de localidad', '2022-05-25', '2022-05-25', NULL, '#9007cf', NULL),
(36, 'Día del Medio Ambiente', 'Recordatorio', '2022-06-05', '2022-06-05', NULL, '#06c160', NULL),
(37, 'Aniversario Villa Gral. Belgrano', 'Cumpleaños de localidad', '2022-06-20', '2022-06-20', NULL, '#9007cf', NULL),
(38, 'Aniversario Laguna Blanca', 'Cumpleaños de localidad', '2022-06-22', '2022-06-22', NULL, '#9007cf', NULL),
(39, 'Aniversario Riacho He He', 'Cumpleaños de localidad', '2022-06-24', '2022-06-24', NULL, '#9007cf', NULL),
(40, 'Aniversario El Chorro', 'Cumpleaños de localidad', '2022-06-28', '2022-06-28', NULL, '#9007cf', NULL),
(41, 'Aniversario Villa Gral. Güemes', 'Cumpleaños de localidad', '2022-06-17', '2022-06-17', NULL, '#9007cf', NULL),
(42, 'Provincialización de Formosa', 'Recordatorio', '2022-06-28', '2022-06-28', NULL, '#06c160', NULL),
(43, 'Aniversario Ibarreta', 'Cumpleaños de localidad', '2022-07-11', '2022-07-11', NULL, '#9007cf', NULL),
(44, 'Aniversario Misión Tacaaglé', 'Cumpleaños de localidad', '2022-07-13', '2022-07-13', NULL, '#9007cf', NULL),
(45, 'Día de la Virgen del Carmen', 'Recordatorio', '2022-07-16', '2022-07-16', NULL, '#06c160', NULL),
(46, 'Aniversario Ingeniero Juárez', 'Cumpleaños de localidad', '2022-07-21', '2022-07-21', NULL, '#9007cf', NULL),
(47, 'Día Tradicional de la Caña con ruda', 'Recordatorio', '2022-08-01', '2022-08-01', NULL, '#06c160', NULL),
(48, 'Aniversario San Martín Dos', 'Cumpleaños de localidad', '2022-08-04', '2022-08-04', NULL, '#9007cf', NULL),
(49, 'Paso a la Inmortalidad del Gral. José de San Martín', 'Trasladable', '2022-08-17', '2022-08-17', NULL, '#d4770c', NULL),
(50, 'Aniversario El Espinillo', 'Cumpleaños de localidad', '2022-08-06', '2022-08-06', NULL, '#9007cf', NULL),
(51, 'Aniversario Los Chiriguanos', 'Cumpleaños de localidad', '2022-08-20', '2022-08-20', NULL, '#9007cf', NULL),
(52, 'Aniversario Villa Escolar', 'Cumpleaños de localidad', '2022-09-07', '2022-09-07', NULL, '#9007cf', NULL),
(53, 'Día de la Primavera', 'Recordatorio', '2022-09-21', '2022-09-21', NULL, '#06c160', NULL),
(54, 'Día del Estudiante', 'Recordatorio', '2022-09-21', '2022-09-21', NULL, '#06c160', NULL),
(55, 'Aniversario Pozo del Tigre', 'Cumpleaños de localidad', '2022-09-22', '2022-09-22', NULL, '#9007cf', NULL),
(56, 'Día Mundial del Turismo', 'Recordatorio', '2022-09-27', '2022-09-27', NULL, '#06c160', NULL),
(57, 'Aniversario Laguna Naineck', 'Cumpleaños de localidad', '2022-09-28', '2022-09-28', NULL, '#9007cf', NULL),
(58, 'Aniversario Clorinda', 'Cumpleaños de localidad', '2022-09-29', '2022-09-29', NULL, '#9007cf', NULL),
(59, 'Aniversario My Villafañe', 'Cumpleaños de localidad', '2022-10-06', '2022-10-06', NULL, '#9007cf', NULL),
(60, 'Aniversario Laguna Yema', 'Cumpleaños de localidad', '2022-10-08', '2022-10-08', NULL, '#9007cf', NULL),
(61, 'Aniversario Fortín Lugones', 'Cumpleaños de localidad', '2022-10-10', '2022-10-10', NULL, '#9007cf', NULL),
(62, 'Aniversario Gran Guardia', 'Cumpleaños de localidad', '2022-10-12', '2022-10-12', NULL, '#9007cf', NULL),
(63, 'Día del Respeto a la Diversidad Cultural', 'Trasladable', '2022-10-10', '2022-10-10', NULL, '#d4770c', NULL),
(64, 'Día del Respeto a la Diversidad Cultural', 'Trasladable', '2022-10-12', '2022-10-12', NULL, '#d4770c', NULL),
(65, 'Feriado con fines turísticos', 'Feriado turístico', '2022-10-07', '2022-10-07', NULL, '#88c408', NULL),
(66, 'Feriado con fines turísticos', 'Feriado turístico', '2022-11-21', '2022-11-21', NULL, '#88c408', NULL),
(67, 'Aniversario Las Lomitas', 'Cumpleaños de localidad', '2022-11-10', '2022-11-10', NULL, '#9007cf', NULL),
(69, 'Aniversario Estanislao del Campo', 'Cumpleaños de localidad', '2022-11-20', '2022-11-20', NULL, '#9007cf', NULL),
(70, 'Aniversario Pastoril', 'Cumpleaños de localidad', '2022-12-07', '2022-12-07', NULL, '#9007cf', NULL),
(72, 'Inmaculada Concepción de María', 'Feriado Nacional', '2022-12-08', '2022-12-08', NULL, '#0d7406', NULL),
(73, 'Navidad', 'Feriado Nacional', '2022-12-25', '2022-12-25', NULL, '#0d7406', NULL),
(74, 'Censo Nacional', 'Feriado Nacional/Recordatorio', '2022-05-18', '2022-05-18', NULL, '#00bae8', NULL),
(76, 'Fiesta del Río, Mate y Tereré', 'Ciudad de Formosa', '2022-03-04', '2022-03-07', NULL, '#063ee5', NULL),
(78, 'fiesta nacional del pomelo', 'fiesta del pomelo en laguna blanca', '2022-09-09', '2022-09-12', NULL, '#04f114', NULL),
(87, 'asdf', 'asdf', '2021-12-01', '2021-12-01', NULL, '#000000', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto`
--

CREATE TABLE `contacto` (
  `id_contacto` int(10) NOT NULL,
  `descripcion_contacto` varchar(244) NOT NULL,
  `rela_tipo_contacto_cont` int(10) NOT NULL,
  `rela_alojamiento_contacto` int(10) DEFAULT NULL,
  `rela_prestador_contacto` int(10) DEFAULT NULL,
  `rela_guia_contacto` int(10) DEFAULT NULL,
  `rela_contacto_agencia` int(11) DEFAULT NULL,
  `rela_persona_contacto` int(11) DEFAULT NULL,
  `rela_contacto_referente` int(11) DEFAULT NULL,
  `rela_contacto_museo` int(11) DEFAULT NULL,
  `rela_servicios_generales` int(11) DEFAULT NULL,
  `rela_festivales` int(11) DEFAULT NULL,
  `rela_gastronomia_contacto` int(11) DEFAULT NULL,
  `rela_organismo_contacto` int(11) DEFAULT NULL,
  `rela_contacto_salones` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `contacto`
--

INSERT INTO `contacto` (`id_contacto`, `descripcion_contacto`, `rela_tipo_contacto_cont`, `rela_alojamiento_contacto`, `rela_prestador_contacto`, `rela_guia_contacto`, `rela_contacto_agencia`, `rela_persona_contacto`, `rela_contacto_referente`, `rela_contacto_museo`, `rela_servicios_generales`, `rela_festivales`, `rela_gastronomia_contacto`, `rela_organismo_contacto`, `rela_contacto_salones`) VALUES
(318, '3704671555', 2, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(319, '', 9, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(320, '', 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(321, '', 4, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(322, '', 5, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(323, '', 6, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(324, '', 7, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(325, '', 8, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(326, '3718629209', 2, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(327, '', 9, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(328, '', 1, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(329, '', 4, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(330, '', 5, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(331, '', 6, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(332, '', 7, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(333, '', 8, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(334, '3704257285', 2, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL),
(335, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL),
(336, '', 1, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL),
(337, '', 4, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL),
(338, '', 5, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL),
(339, '', 6, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL),
(340, '', 7, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL),
(341, '', 8, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL),
(350, '3704263282', 2, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL),
(351, '', 9, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL),
(352, '', 1, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL),
(353, '', 4, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL),
(354, '', 5, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL),
(355, '', 6, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL),
(356, '', 7, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL),
(357, '', 8, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL),
(358, '3704613581', 2, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL),
(359, '', 9, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL),
(360, '', 1, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL),
(361, '', 4, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL),
(362, '', 5, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL),
(363, '', 6, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL),
(364, '', 7, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL),
(365, '', 8, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL),
(366, '3711614118', 2, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL),
(367, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL),
(368, '', 1, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL),
(369, '', 4, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL),
(370, '', 5, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL),
(371, '', 6, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL),
(372, '', 7, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL),
(373, 'Intendente Reserva Natural Formosa', 8, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL),
(382, '3716410254', 2, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL),
(383, '', 9, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL),
(384, '', 1, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL),
(385, '', 4, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL),
(386, '', 5, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL),
(387, '', 6, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL),
(388, '', 7, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL),
(389, '', 8, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL),
(390, '3716617087', 2, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL),
(391, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL),
(392, '', 1, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL),
(393, '', 4, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL),
(394, '', 5, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL),
(395, '', 6, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL),
(396, '', 7, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL),
(397, '', 8, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL),
(398, '3704251876', 2, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL),
(399, '', 9, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL),
(400, '', 1, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL),
(401, '', 4, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL),
(402, '', 5, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL),
(403, '', 6, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL),
(404, '', 7, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL),
(405, '', 8, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL),
(406, '3704386991', 2, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL),
(407, '', 9, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL),
(408, '', 1, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL),
(409, '', 4, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL),
(410, '', 5, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL),
(411, '', 6, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL),
(412, '', 7, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL),
(413, '', 8, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL),
(414, '3716414586', 2, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL),
(415, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL),
(416, '', 1, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL),
(417, '', 4, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL),
(418, '', 5, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL),
(419, '', 6, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL),
(420, '', 7, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL),
(421, '', 8, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL),
(422, '3704706806', 2, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL),
(423, '', 9, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL),
(424, '', 1, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL),
(425, '', 4, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL),
(426, '', 5, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL),
(427, '', 6, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL),
(428, '', 7, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL),
(429, '', 8, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL),
(430, '3704274747', 2, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(431, '', 9, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(432, '', 1, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(433, '', 4, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(434, '', 5, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(435, '', 6, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(436, '', 7, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(437, '', 8, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL),
(438, '3704613266', 2, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL),
(439, '', 9, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL),
(440, '', 1, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL),
(441, '', 4, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL),
(442, '', 5, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL),
(443, '', 6, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL),
(444, '', 7, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL),
(445, '', 8, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL),
(446, '3716617295', 2, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL),
(447, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL),
(448, '', 1, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL),
(449, '', 4, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL),
(450, '', 5, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL),
(451, '', 6, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL),
(452, '', 7, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL),
(453, '', 8, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL),
(454, '3704703116', 2, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL),
(455, '', 9, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL),
(456, '', 1, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL),
(457, '', 4, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL),
(458, '', 5, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL),
(459, '', 6, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL),
(460, '', 7, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL),
(461, '', 8, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL),
(462, '3718605001', 2, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL),
(463, '', 9, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL),
(464, '', 1, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL),
(465, '', 4, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL),
(466, '', 5, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL),
(467, '', 6, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL),
(468, '', 7, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL),
(469, '', 8, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL),
(470, '3704414692', 2, NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL),
(471, '', 9, NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL),
(472, '', 1, NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL),
(473, '', 4, NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL),
(474, '', 5, NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL),
(475, '', 6, NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL),
(476, '', 7, NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL),
(477, '', 8, NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL),
(478, '3704414692', 2, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL),
(479, '', 9, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL),
(480, '', 1, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL),
(481, '', 4, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL),
(482, '', 5, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL),
(483, '', 6, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL),
(484, '', 7, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL),
(485, '', 8, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL),
(486, '3718552929', 2, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL),
(487, '', 9, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL),
(488, '', 1, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL),
(489, '', 4, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL),
(490, '', 5, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL),
(491, '', 6, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL),
(492, '', 7, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL),
(493, '', 8, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL),
(494, '3705036512', 2, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(495, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(496, '', 1, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(497, '', 4, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(498, '', 5, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(499, '', 6, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(500, '', 7, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(501, '', 8, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(502, '3704302141', 2, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL),
(503, '', 9, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL),
(504, '', 1, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL),
(505, '', 4, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL),
(506, '', 5, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL),
(507, '', 6, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL),
(508, '', 7, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL),
(509, '', 8, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL),
(510, '3704387666', 2, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL),
(511, '', 9, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL),
(512, '', 1, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL),
(513, '', 4, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL),
(514, '', 5, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL),
(515, '', 6, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL),
(516, '', 7, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL),
(517, '', 8, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL),
(518, '3705009499', 2, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL),
(519, '', 9, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL),
(520, '', 1, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL),
(521, '', 4, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL),
(522, '', 5, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL),
(523, '', 6, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL),
(524, '', 7, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL),
(525, '', 8, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL),
(526, '3718418745', 2, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL),
(527, '', 9, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL),
(528, '', 1, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL),
(529, '', 4, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL),
(530, '', 5, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL),
(531, '', 6, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL),
(532, '', 7, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL),
(533, '', 8, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL),
(534, '3718635118', 2, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL),
(535, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL),
(536, '', 1, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL),
(537, '', 4, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL),
(538, '', 5, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL),
(539, '', 6, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL),
(540, '', 7, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL),
(541, '', 8, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL),
(542, '3718625060', 2, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL),
(543, '', 9, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL),
(544, '', 1, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL),
(545, '', 4, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL),
(546, '', 5, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL),
(547, '', 6, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL),
(548, '', 7, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL),
(549, '', 8, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL),
(550, '3718599253', 2, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL),
(551, '', 9, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL),
(552, '', 1, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL),
(553, '', 4, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL),
(554, '', 5, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL),
(555, '', 6, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL),
(556, '', 7, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL),
(557, '', 8, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL),
(558, '3718549793', 2, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL, NULL, NULL),
(559, '', 9, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL, NULL, NULL),
(560, 'marianoortiz15@gmail.com', 1, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL, NULL, NULL),
(561, '', 4, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL, NULL, NULL),
(562, '', 5, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL, NULL, NULL),
(563, '', 6, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL, NULL, NULL),
(564, '', 7, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL, NULL, NULL),
(565, '', 8, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL, NULL, NULL),
(566, '3704231444', 2, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL),
(567, '', 9, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL),
(568, '', 1, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL),
(569, '', 4, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL),
(570, '', 5, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL),
(571, '', 6, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL),
(572, '', 7, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL),
(573, '', 8, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL),
(574, '3704230107', 2, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL),
(575, '4482521', 9, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL),
(576, '', 1, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL),
(577, '', 4, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL),
(578, '', 5, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL),
(579, '', 6, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL),
(580, '', 7, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL),
(581, '', 8, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL),
(582, '3704250475', 2, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL, NULL, NULL, NULL, NULL),
(583, '', 9, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL, NULL, NULL, NULL, NULL),
(584, '', 1, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL, NULL, NULL, NULL, NULL),
(585, '', 4, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL, NULL, NULL, NULL, NULL),
(586, '', 5, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL, NULL, NULL, NULL, NULL),
(587, '', 6, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL, NULL, NULL, NULL, NULL),
(588, '', 7, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL, NULL, NULL, NULL, NULL),
(589, '', 8, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL, NULL, NULL, NULL, NULL),
(590, '3704684389', 2, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL, NULL, NULL, NULL, NULL),
(591, '', 9, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL, NULL, NULL, NULL, NULL),
(592, '', 1, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL, NULL, NULL, NULL, NULL),
(593, '', 4, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL, NULL, NULL, NULL, NULL),
(594, '', 5, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL, NULL, NULL, NULL, NULL),
(595, '', 6, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL, NULL, NULL, NULL, NULL),
(596, '', 7, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL, NULL, NULL, NULL, NULL),
(597, '', 8, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL, NULL, NULL, NULL, NULL),
(598, '3704305581', 2, NULL, NULL, NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL),
(599, '', 9, NULL, NULL, NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL),
(600, '', 1, NULL, NULL, NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL),
(601, '', 4, NULL, NULL, NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL),
(602, '', 5, NULL, NULL, NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL),
(603, '', 6, NULL, NULL, NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL),
(604, '', 7, NULL, NULL, NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL),
(605, '', 8, NULL, NULL, NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL),
(606, '3704262569', 2, NULL, NULL, NULL, NULL, NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(607, '', 9, NULL, NULL, NULL, NULL, NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(608, '', 1, NULL, NULL, NULL, NULL, NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(609, '', 4, NULL, NULL, NULL, NULL, NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(610, '', 5, NULL, NULL, NULL, NULL, NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(611, '', 6, NULL, NULL, NULL, NULL, NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(612, '', 7, NULL, NULL, NULL, NULL, NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(613, '', 8, NULL, NULL, NULL, NULL, NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(614, '3704201770', 2, NULL, NULL, NULL, NULL, NULL, 38, NULL, NULL, NULL, NULL, NULL, NULL),
(615, '', 9, NULL, NULL, NULL, NULL, NULL, 38, NULL, NULL, NULL, NULL, NULL, NULL),
(616, '', 1, NULL, NULL, NULL, NULL, NULL, 38, NULL, NULL, NULL, NULL, NULL, NULL),
(617, '', 4, NULL, NULL, NULL, NULL, NULL, 38, NULL, NULL, NULL, NULL, NULL, NULL),
(618, '', 5, NULL, NULL, NULL, NULL, NULL, 38, NULL, NULL, NULL, NULL, NULL, NULL),
(619, '', 6, NULL, NULL, NULL, NULL, NULL, 38, NULL, NULL, NULL, NULL, NULL, NULL),
(620, '', 7, NULL, NULL, NULL, NULL, NULL, 38, NULL, NULL, NULL, NULL, NULL, NULL),
(621, '', 8, NULL, NULL, NULL, NULL, NULL, 38, NULL, NULL, NULL, NULL, NULL, NULL),
(622, '3704437333', 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(623, '4437333', 9, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(624, 'hoteldeturimofsa@gmail.com', 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(625, '', 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(626, '', 5, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(627, '', 6, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(628, '', 7, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(629, '', 8, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(630, '3704624850', 2, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(631, 'No se registró', 9, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(632, 'hotelfermoza@hotmail.com', 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(633, '', 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(634, '', 5, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(635, '', 6, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(636, '', 7, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(637, '', 8, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(638, '3705380234', 2, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(639, 'No se registró', 9, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(640, '', 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(641, 'facebook.com/HOTEL-Formosa-321907728506696', 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(642, '', 5, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(643, '', 6, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(644, '', 7, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(645, '', 8, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(646, '3704428441', 2, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(647, '4428441', 9, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(648, '', 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(649, 'facebook.com/pages/Hotel-Real-Formosa/1072369076120166', 4, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(650, '', 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(651, '', 6, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(652, '', 7, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(653, '', 8, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(654, '3704429527', 2, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(655, '3704426767', 9, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(656, 'plaza_formosa@hotmail.com', 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(657, 'facebook.com/hotelplazaformosa', 4, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(658, '', 5, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(659, '', 6, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(660, '', 7, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(661, '', 8, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(662, '3704438900', 2, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(663, '1161592993', 9, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(664, 'reservas@hjneoformosa.com.ar', 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(665, 'facebook.com/HJFormosa', 4, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(666, 'instagram.com/hjformosa', 5, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(667, '', 6, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(668, 'www.hjneoformosa.com.ar', 7, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(669, 'Capacidad disminuida (60 plazas)', 8, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(670, '3704252285', 2, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(671, '3704588380', 2, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(672, '4428999', 9, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(673, 'laskalasrentalsuite@outlook.com', 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(674, 'facebook.com/LasKalas.fsa', 4, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(675, 'instagram.com/laskalasrestaurant', 5, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(676, '', 6, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(677, 'www.laskalasrentalsuites.com', 7, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(678, '', 8, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(679, '3704426908', 2, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(680, '4426908', 9, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(681, 'hotelportaldelsolfsa@hotmail.com', 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(682, 'facebook.com/martin.llanoaquino', 4, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(683, 'instagram.com/hotelportaldelsolfsa', 5, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(684, '', 6, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(685, 'www.hotelportaldelsolfsa.com', 7, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(686, '', 8, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(687, '3705031302', 2, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(688, '3704421870', 9, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(689, 'info@regina-hotel.com.ar', 1, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(690, 'facebook.com/HotelReginaFormosa', 4, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(691, 'instagram.com/hotelregina535', 5, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(692, '', 6, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(693, 'www.regina-hotel.com.ar', 7, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(694, 'hotelreginaformosa@hotmail.com', 8, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(695, '3704435901', 2, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(696, '4435901', 9, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(697, 'alejandrotinuk@gmail.com', 1, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(698, 'facebook.com/ResidencialCostanera', 4, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(699, 'instagram.com/residencialcostanera', 5, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(700, '', 6, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(701, '', 7, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(702, '', 8, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(703, '3705049078', 2, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(704, '4456373', 9, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(705, 'hotelronnyfsa@hotmail.com', 1, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(706, 'facebook.com/hotel.ronny', 4, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(707, '', 5, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(708, '', 6, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(709, '', 7, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(710, '', 8, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(711, '3704305371', 2, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(712, 'No se registró', 9, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(713, 'elcortijotur@gmail.com', 1, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(714, 'facebook.com/elcortijoagroecoturismo', 4, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(715, 'instagram.com/elcortijoaet', 5, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(716, '', 6, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(717, '', 7, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(718, '', 8, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(751, '3704971794', 2, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(752, '', 9, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(753, 'loszorzalesestancia@gmail.com', 1, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(754, 'facebook.com/LosZorzalesEstancia', 4, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(755, 'instagram.com/loszorzalesfsa', 5, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(756, '', 6, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(757, 'www.loszorzales.com.ar', 7, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(758, '', 8, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(759, '3704534877', 2, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(760, 'No se registró', 9, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(761, 'patri06_arroyo@hotmail.com', 1, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(762, 'facebook.com/La-Florencia-125261564223541/', 4, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(763, '', 5, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(764, '', 6, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(765, '', 7, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(766, '', 8, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(767, '3704363400', 2, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(768, '', 9, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(769, 'cabanaslamadrina@gmail.com', 1, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(770, 'facebook.com/Cabañas-La-Madrina-Herradura-565122027002619', 4, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(771, 'instagram.com/complejo.lamadrina', 5, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(772, '', 6, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(773, '', 7, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(774, '3704851239 (Cel)', 8, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(775, '3704264780', 2, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(776, 'No se registró', 9, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(777, 'cabanasmiramonte@gmail.com', 1, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(778, 'facebook.com/miramonteherradura', 4, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(779, 'instagram.com/miramonteherradura', 5, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(780, '', 6, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(781, '', 7, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(782, '', 8, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(783, '3704680732', 2, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(784, '', 9, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(785, 'chuquicue@gmail.com', 1, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(786, 'facebook.com/Chuqui-Cue-1540445926208821', 4, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(787, 'instagram.com/chuquicue', 5, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(788, '', 6, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(789, '', 7, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(790, '', 8, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(791, '3704022337', 2, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(792, '', 9, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(793, '', 1, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(794, '', 4, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(795, '', 5, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(796, '', 6, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(797, '', 7, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(798, '', 8, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(799, '', 2, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(800, '', 9, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(801, '', 1, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(802, '', 4, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(803, '', 5, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(804, '', 6, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(805, '', 7, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(806, '', 8, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(807, '3704598713', 2, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(808, 'No se registró', 9, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(809, 'quintel-herradura@hotmail.com', 1, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(810, 'facebook.com/Quintel-Herradura-315622672192902', 4, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(811, '', 5, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(812, '', 6, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(813, '', 7, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(814, '', 8, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(815, '3704399689', 2, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(816, '3704650616', 9, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(817, 'gbandeo@gmail.com', 1, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(818, 'facebook.com/cabanasdelalaguna.herradura', 4, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(819, '', 5, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(820, '', 6, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(821, '', 7, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(822, '', 8, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(823, '3704662882', 2, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(824, '', 9, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(825, 'angeldariosanabria@hotmail.com', 1, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(826, 'facebook.com/Cabañas-Gran-Capitán-344067769337418', 4, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(827, '', 5, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(828, '', 6, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(829, '', 7, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(830, '', 8, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(831, '3704560813', 2, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(832, 'No se registró', 9, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(833, '', 1, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(834, 'facebook.com/Quinta-los-tucanes-102939011252292', 4, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(835, '', 5, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(836, '', 6, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(837, '', 7, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(838, '', 8, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(839, '3704260834', 2, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(840, 'No se registró', 9, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(841, 'heizen_89@hotmail.com', 1, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(842, 'facebook.com/Cabañas-Picasso-1534098543550647', 4, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(843, '', 5, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(844, '', 6, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(845, '', 7, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(846, '', 8, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(847, '3718467357', 2, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(848, '3718425533', 9, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(849, 'deserteagle749@hotmail.com', 1, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(850, 'facebook.com/Residencial-12-De-Octubre-266850863831638', 4, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(851, '', 5, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(852, '', 6, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(853, '', 7, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(854, '', 8, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(855, '3718426730', 2, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(856, 'No se registró', 9, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(857, 'contactos@hotelar-tur.com', 1, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(858, 'facebook.com/pages/Hotel-Ar-Tur-Clorinda-Formosa/350237235048100', 4, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(859, '', 5, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(860, '', 6, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(861, '', 7, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(862, '', 8, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(863, '3718421211', 2, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(864, 'No se registró', 9, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(865, 'residencialsanmartin@gmail.com', 1, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(866, 'facebook.com/Residencial-san-Martin-107636307313362', 4, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(867, '', 5, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(868, '', 6, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(869, '', 7, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(870, 'zozulangelina51@gmail.com', 8, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(871, '3718422264', 2, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(872, 'No se registró', 9, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(873, 'hotelembajador@hotmail.com', 1, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(874, 'facebook.com/hotel-embajador-clorinda-formosa-223191111039574', 4, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(875, '', 5, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(876, '', 6, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(877, 'www.hembajador.como.ar', 7, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(878, '', 8, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(879, '3704629993', 2, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(880, '', 9, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(881, '', 1, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(882, 'facebook.com/profile.php?id=100057406511158', 4, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(883, '', 5, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(884, '', 6, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(885, '', 7, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(886, '', 8, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(895, '3715616037', 2, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(896, '3715432492', 9, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(897, '', 1, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(898, 'facebook.com/pages/Hotel-Eva/395250607205542', 4, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(899, '', 5, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(900, '', 6, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(901, '', 7, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(902, '', 8, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(919, '3704556173', 2, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(920, 'No se registró', 9, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(921, '', 1, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(922, '', 4, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(923, '', 5, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(924, '', 6, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(925, '', 7, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(926, '', 8, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(927, '3704826207', 2, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL, NULL, NULL, NULL, NULL),
(928, '', 9, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL, NULL, NULL, NULL, NULL),
(929, '', 1, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL, NULL, NULL, NULL, NULL),
(930, '', 4, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL, NULL, NULL, NULL, NULL),
(931, '', 5, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL, NULL, NULL, NULL, NULL),
(932, '', 6, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL, NULL, NULL, NULL, NULL),
(933, '', 7, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL, NULL, NULL, NULL, NULL),
(934, '', 8, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL, NULL, NULL, NULL, NULL),
(943, '3716617440', 2, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(944, 'No se registró', 9, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(945, '', 1, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(946, '', 4, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(947, '', 5, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(948, '', 6, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(949, '', 7, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(950, '', 8, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(951, '3704940537', 2, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(952, 'No se registró', 9, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(953, '', 1, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(954, '', 4, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(955, '', 5, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(956, '', 6, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(957, '', 7, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(958, '(03716) 432352', 8, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(959, '3704567602', 2, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(960, 'No se registró', 9, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(961, '', 1, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `contacto` (`id_contacto`, `descripcion_contacto`, `rela_tipo_contacto_cont`, `rela_alojamiento_contacto`, `rela_prestador_contacto`, `rela_guia_contacto`, `rela_contacto_agencia`, `rela_persona_contacto`, `rela_contacto_referente`, `rela_contacto_museo`, `rela_servicios_generales`, `rela_festivales`, `rela_gastronomia_contacto`, `rela_organismo_contacto`, `rela_contacto_salones`) VALUES
(962, '', 4, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(963, '', 5, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(964, '', 6, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(965, '', 7, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(966, '', 8, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(967, '3704398839', 2, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(968, '3716432532', 9, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(969, '', 1, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(970, '', 4, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(971, '', 5, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(972, '', 6, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(973, '', 7, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(974, '(03716) 432532', 8, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(975, '3705101922', 2, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(976, '3704480106', 9, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(977, '', 1, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(978, 'facebook.com/profile.php?id=100009935504429', 4, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(979, '', 5, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(980, '', 6, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(981, '', 7, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(982, '', 8, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(983, '3705020295', 2, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(984, '4481963', 9, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(985, 'cecilianoemipaz@gmail.com', 1, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(986, 'facebook.com/hospedajececielcolorado', 4, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(987, '', 5, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(988, '', 6, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(989, '', 7, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(990, '', 8, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(991, '3704251888', 2, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(992, '3704481791', 9, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(993, '', 1, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(994, '', 4, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(995, '', 5, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(996, '', 6, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(997, '', 7, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(998, '', 8, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(999, '3704480344', 2, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1000, 'No se registró', 9, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1001, '', 1, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1002, '', 4, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1003, '', 5, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1004, '', 6, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1005, '', 7, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1006, '', 8, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1007, '3704480170', 2, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1008, 'No se registró', 9, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1009, '', 1, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1010, '', 4, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1011, '', 5, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1012, '', 6, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1013, '', 7, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1014, '', 8, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1015, '3704480170', 2, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1016, '3704588880', 9, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1017, '', 1, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1018, '', 4, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1019, '', 5, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1020, '', 6, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1021, '', 7, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1022, '', 8, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1023, '3704543121', 2, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1024, 'No se registró', 9, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1025, '', 1, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1026, '', 4, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1027, '', 5, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1028, '', 6, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1029, '', 7, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1030, '', 8, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1031, '3704309063', 2, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1032, '', 9, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1033, '', 1, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1034, '', 4, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1035, '', 5, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1036, '', 6, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1037, '', 7, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1038, '', 8, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1039, '3704282520', 2, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1040, '3704490219', 9, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1041, '', 1, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1042, '', 4, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1043, '', 5, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1044, '', 6, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1045, '', 7, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1046, '', 8, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1055, '3718401070', 2, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1056, 'No se registró', 9, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1057, 'imperialaparthotel@gmail.com', 1, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1058, 'facebook.com/Imperial-Apart-Hotel-Tu-hogar-lejos-de-Casa-1924294441122606', 4, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1059, 'instagram.com/imperial_apart_hotel', 5, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1060, '', 6, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1061, '', 7, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1062, '(03718) 401070 (Fijo)', 8, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1063, '3718441991', 2, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1064, '3718401290', 9, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1065, '', 1, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1066, '', 4, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1067, '', 5, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1068, '', 6, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1069, '', 7, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1070, '', 8, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1079, '3704497028', 2, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1080, '3704497028', 9, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1081, '', 1, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1082, '', 4, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1083, '', 5, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1084, '', 6, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1085, '', 7, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1086, '', 8, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1095, '3711615318', 2, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1096, '3711615318', 9, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1097, '', 1, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1098, '', 4, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1099, '', 5, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1100, '', 6, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1101, '', 7, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1102, '', 8, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1103, '3711420395', 2, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1104, '3711420395', 9, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1105, '', 1, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1106, '', 4, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1107, '', 5, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1108, '', 6, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1109, '', 7, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1110, '', 8, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1111, '3711420113', 2, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1112, '3711420113', 9, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1113, '', 1, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1114, '', 4, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1115, '', 5, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1116, '', 6, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1117, '', 7, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1118, '', 8, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1119, '3704586044', 2, 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1120, '3704586044', 9, 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1121, '', 1, 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1122, 'facebook.com/Hotel-Gran-Victoria-456394581394437', 4, 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1123, '', 5, 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1124, '', 6, 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1125, '', 7, 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1126, '', 8, 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1127, '3704461341', 2, 62, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1128, '3704461341', 9, 62, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1129, '', 1, 62, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1130, '', 4, 62, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1131, '', 5, 62, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1132, '', 6, 62, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1133, '', 7, 62, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1134, '', 8, 62, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1135, '3704557692', 2, 63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1136, '3704557692', 9, 63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1137, '', 1, 63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1138, '', 4, 63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1139, '', 5, 63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1140, '', 6, 63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1141, '', 7, 63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1142, '', 8, 63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1143, '3704709051', 2, 64, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1144, '3704460275', 9, 64, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1145, 'hotelmagali.pirane@gmail.com', 1, 64, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1146, '', 4, 64, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1147, '', 5, 64, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1148, '', 6, 64, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1149, '', 7, 64, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1150, '', 8, 64, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1256, '3718425240', 2, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1257, 'No se registró', 9, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1258, 'grimarotour@gmx.net', 1, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1259, 'facebook.com/grimarotour', 4, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1260, 'instagram.com/grimarotour', 5, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1261, '', 6, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1262, 'grimarotour.e-agencias.com.ar', 7, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1263, '', 8, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1264, '3704025515', 2, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1265, '3704435319', 9, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1266, 'pasajesexpressfsa@hotmail.com', 1, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1267, 'facebook.com/alwaviajes-109679708204538', 4, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1268, 'instagram.com/alwa.viajes', 5, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1269, '', 6, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1270, '', 7, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1271, 'alwa.viajes@gmail.com', 8, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1272, '3704686685', 2, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1273, '1145873700', 9, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1274, 'tramites@reservandoviajes.com', 1, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1275, 'facebook.com/arapyviajesfsa', 4, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1276, 'instagram.com/arapyviajes', 5, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1277, '', 6, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1278, 'ww.arapyviajesfsa.com', 7, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1279, 'info@arapyviajesfsa.com', 8, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1296, '3704615862', 2, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1297, '03704437191', 9, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1298, 'diegobregant@hotmail.com', 1, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1299, 'facebook.com/diegobregantviajesformosa', 4, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1300, 'instagram.com/diegobregantviajes', 5, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1301, '', 6, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1302, '', 7, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1303, '3704003555', 8, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1304, '3718426360', 2, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1305, 'No se registró', 9, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1306, 'hfentana@hotmail.com', 1, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1307, '', 4, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1308, '', 5, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1309, '', 6, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1310, '', 7, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1311, '', 8, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1328, '03704434208', 2, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1329, '3704568626', 9, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1330, 'mymturismo@mymturismo.com.ar', 1, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1331, 'facebook.com/mymturismofma', 4, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1332, '', 5, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1333, '', 6, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1334, '', 7, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1335, 'agenciamymturismo@gmail.com', 8, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1336, '370578416', 2, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1337, '03704425437', 9, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1338, 'gerencia@paraquaria-srl.com.ar', 1, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1339, 'facebook.com/PARAQUARIA.Ecotravel', 4, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1340, '', 5, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1341, '', 6, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1342, 'www.paraquaria-srl.com.ar/', 7, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1343, '', 8, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1344, '03704421432', 2, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1345, '4421011', 9, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1346, 'sakuraevt@hotmail.com', 1, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1347, 'facebook.com/SakuraViajesOk', 4, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1348, 'instagram.com/sakuraviajesok', 5, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1349, '', 6, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1350, '', 7, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1351, '', 8, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1360, '3704660772', 2, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1361, '4420395', 9, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1362, 'siaciatur@yahoo.com.ar', 1, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1363, '', 4, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1364, '', 5, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1365, '', 6, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1366, '', 7, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1367, '4434858', 8, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1368, '3704238394', 2, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1369, '4426159', 9, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1370, 'staffturismo@hotmail.com', 1, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1371, 'facebook.com/STAFF.TRAVELDANCE.FORMOSA', 4, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1372, 'instagram.com/staff_turismo', 5, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1373, '', 6, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1374, 'www.staffturismo.com.ar', 7, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1375, '', 8, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1384, '3704887226', 2, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1385, '', 9, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1386, 'jessivaliente7@gmail.com', 1, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1387, '', 4, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1388, '', 5, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1389, '', 6, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1390, '', 7, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1391, '3704 415952', 8, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1392, '', 2, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1393, '4429399', 9, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1394, 'mkloss@travelrock.com', 1, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1395, 'facebook.com/Travel-Rock-Formosa-Oficial-580517758625314', 4, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1396, '', 5, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1397, '', 6, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1398, '', 7, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1399, '', 8, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1400, '3704738906', 2, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1401, '4434777', 9, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1402, 'receptivo@turismodecastro.com.ar', 1, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1403, 'facebook.com/turismo.decastro', 4, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1404, 'instagram.com/turismodecastro', 5, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1405, '', 6, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1406, 'www.turismodecastro.tur.ar', 7, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1407, 'ventas@turismodecastro.tur.ar', 8, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1408, '3704585764', 2, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1409, '', 9, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1410, 'vidiviciviajes@gmail.com', 1, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1411, 'facebook.com/vidiviciviajes', 4, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1412, 'instagram.com/vidiviciviajesfsa', 5, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1413, '', 6, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1414, '', 7, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1415, '3704000626', 8, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1416, '3704259228', 2, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1417, '4427123', 9, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1418, 'goyaturismo18@gmail.com', 1, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1419, 'facebook.com/goyaturis', 4, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1420, 'instagram.com/goyaturismo', 5, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1421, '', 6, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1422, 'www.goyaturismo.com.ar', 7, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1423, '3704834415', 8, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1424, '2645034839', 2, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1425, 'No se registró', 9, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1426, 'tintesreligiosos@hotmail.com', 1, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1427, 'facebook.com/tintesreligiosos', 4, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1428, 'instagram.com/tintesreligiosos', 5, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1429, '', 6, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1430, '', 7, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1431, '', 8, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1432, '3718504666', 2, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1433, 'No se registró', 9, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1434, 'ivandc@hotmail.com', 1, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1435, '', 4, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1436, '', 5, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1437, '', 6, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1438, '', 7, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1439, '', 8, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1485, '3704506393', 2, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL),
(1486, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL),
(1487, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL),
(1488, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL),
(1489, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL),
(1490, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL),
(1491, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL),
(1492, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL),
(1493, '3718591618', 2, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL),
(1494, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL),
(1495, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL),
(1496, 'facebook.com/Museo-Regional-Del-Nordeste-Formoseño-1455583238010520', 4, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL),
(1497, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL),
(1498, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL),
(1499, 'formosa.gob.ar/patrimonio/museos/nordeste', 7, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL),
(1500, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL),
(1501, '3704699702', 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL),
(1502, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL),
(1503, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL),
(1504, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL),
(1505, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL),
(1506, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL),
(1507, 'formosa.gob.ar/patrimonio/museos/quinquenal', 7, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL),
(1508, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL),
(1509, '3704872200', 2, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL),
(1510, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL),
(1511, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL),
(1512, 'facebook.com/museo.sciullo.1', 4, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL),
(1513, 'instagram.com/museosacrop.carmelosciullo', 5, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL),
(1514, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL),
(1515, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL),
(1516, 'facebook.com/MUSEO-Historico-PADRE-Carmelo-SCIULLO-Parroquia-Virgen-del-Rosario-Formosa-268551653556877', 8, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL),
(1517, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL),
(1518, '4428585', 9, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL),
(1519, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL),
(1520, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL),
(1521, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL),
(1522, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL),
(1523, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL),
(1524, '*Para el teléfono fijo el interno es (6245)', 8, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL),
(1525, '3704904014', 2, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL),
(1526, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL),
(1527, 'iglesiacatedralfsa@gmail.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL),
(1528, 'facebook.com/CatedralFsa', 4, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL),
(1529, 'instagram.com/iglesiacatedralformosa', 5, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL),
(1530, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL),
(1531, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL),
(1532, '3704434608', 8, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL),
(1533, '3704346991', 2, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL),
(1534, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL),
(1535, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL),
(1536, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL),
(1537, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL),
(1538, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL),
(1539, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL),
(1540, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL),
(1541, '3704257285', 2, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL),
(1542, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL),
(1543, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL),
(1544, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL),
(1545, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL),
(1546, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL),
(1547, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL),
(1548, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL),
(1549, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, NULL),
(1550, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, NULL),
(1551, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, NULL),
(1552, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, NULL),
(1553, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, NULL),
(1554, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, NULL),
(1555, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, NULL),
(1556, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, NULL),
(1557, '3704341567', 2, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL),
(1558, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL),
(1559, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL),
(1560, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL),
(1561, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL),
(1562, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL),
(1563, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL),
(1564, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL),
(1565, '3704321381', 2, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL),
(1566, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL),
(1567, 'museoferroviariofsa@gmail.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL),
(1568, 'facebook.com/MuseoFerroviarioMunicipalFormosa', 4, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL),
(1569, 'instagram.com/ferroviariomuseo', 5, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL),
(1570, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL),
(1571, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL),
(1572, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL),
(1573, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, NULL),
(1574, '4436423', 9, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, NULL),
(1575, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, NULL),
(1576, 'facebook.com/MuseoJPDuffard', 4, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, NULL),
(1577, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, NULL),
(1578, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, NULL),
(1579, 'formosa.gob.ar/patrimonio/museos/regional', 7, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, NULL),
(1580, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL, NULL),
(1590, '3704669537', 2, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL),
(1591, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL),
(1592, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL),
(1593, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL),
(1594, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL),
(1595, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL),
(1596, 'formosa.gob.ar/patrimonio/museocienciasnaturales', 7, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL),
(1597, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL),
(1620, '3704613581', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL),
(1621, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL),
(1622, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL),
(1623, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL),
(1624, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL),
(1625, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL),
(1626, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL),
(1627, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL),
(1628, '3704278408', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL),
(1629, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL),
(1630, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL),
(1631, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL),
(1632, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL),
(1633, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL),
(1634, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL),
(1635, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL),
(1636, '3704704619', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL),
(1637, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL),
(1638, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL),
(1639, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL),
(1640, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL),
(1641, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL),
(1642, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL),
(1643, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL),
(1644, '3718549793', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(1645, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(1646, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(1647, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(1648, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(1649, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(1650, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(1651, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(1652, '3716414586', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL),
(1653, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL),
(1654, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL),
(1655, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL),
(1656, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL),
(1657, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL),
(1658, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL),
(1659, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL),
(1660, '3716617291', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL),
(1661, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL),
(1662, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL),
(1663, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL),
(1664, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL),
(1665, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL),
(1666, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL),
(1667, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL),
(1668, '3704512121', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL),
(1669, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL),
(1670, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL),
(1671, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL),
(1672, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL),
(1673, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL),
(1674, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL),
(1675, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL),
(1676, '3704230107', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL),
(1677, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL),
(1678, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL),
(1679, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL),
(1680, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL),
(1681, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL),
(1682, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL),
(1683, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL),
(1684, '3718635118', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL),
(1685, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL),
(1686, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL),
(1687, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL),
(1688, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL),
(1689, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL),
(1690, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL),
(1691, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL),
(1692, '3718552929', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL),
(1693, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL),
(1694, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL),
(1695, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL),
(1696, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL),
(1697, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL),
(1698, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL),
(1699, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL),
(1700, '3705036512', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL),
(1701, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL),
(1702, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL),
(1703, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL),
(1704, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL),
(1705, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL),
(1706, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL),
(1707, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL),
(1708, '3704274747', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL),
(1709, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL),
(1710, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL),
(1711, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL),
(1712, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL),
(1713, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL),
(1714, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL),
(1715, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL),
(1740, '3704235905', 2, NULL, NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(1741, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(1742, '', 1, NULL, NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(1743, '', 4, NULL, NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(1744, '', 5, NULL, NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(1745, '', 6, NULL, NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(1746, '', 7, NULL, NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(1747, '', 8, NULL, NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(1748, '3704578225', 2, NULL, NULL, NULL, NULL, NULL, 41, NULL, NULL, NULL, NULL, NULL, NULL),
(1749, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 41, NULL, NULL, NULL, NULL, NULL, NULL),
(1750, '', 1, NULL, NULL, NULL, NULL, NULL, 41, NULL, NULL, NULL, NULL, NULL, NULL),
(1751, '', 4, NULL, NULL, NULL, NULL, NULL, 41, NULL, NULL, NULL, NULL, NULL, NULL),
(1752, '', 5, NULL, NULL, NULL, NULL, NULL, 41, NULL, NULL, NULL, NULL, NULL, NULL),
(1753, '', 6, NULL, NULL, NULL, NULL, NULL, 41, NULL, NULL, NULL, NULL, NULL, NULL),
(1754, '', 7, NULL, NULL, NULL, NULL, NULL, 41, NULL, NULL, NULL, NULL, NULL, NULL),
(1755, '', 8, NULL, NULL, NULL, NULL, NULL, 41, NULL, NULL, NULL, NULL, NULL, NULL),
(1756, '3704236819', 2, NULL, NULL, NULL, NULL, NULL, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(1757, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(1758, '', 1, NULL, NULL, NULL, NULL, NULL, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(1759, '', 4, NULL, NULL, NULL, NULL, NULL, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(1760, '', 5, NULL, NULL, NULL, NULL, NULL, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(1761, '', 6, NULL, NULL, NULL, NULL, NULL, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(1762, '', 7, NULL, NULL, NULL, NULL, NULL, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(1763, '', 8, NULL, NULL, NULL, NULL, NULL, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(1764, '3704557796', 2, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1765, '', 2, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1766, 'No se registró', 9, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1767, 'cherogaturismo@gmail.com', 1, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1768, 'facebook.com/FormosaExcursiones', 4, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1769, 'iinstagram.com/cheroga_turismo_activo', 5, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1770, '', 6, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1771, 'www.cheroga.com.ar', 7, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1772, 'hola@cheroga.com.ar', 8, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1773, '3718528136', 2, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1774, 'No se registró', 9, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1775, 'plmonges@gmail.com', 1, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1776, 'facebook.com/Newetclorinda', 4, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1777, 'instagram.com/newet_espiritudelatierra', 5, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1778, '', 6, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1779, 'www.newetaventuras.com', 7, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1780, '', 8, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1781, '3718603046', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL),
(1782, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL),
(1783, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL),
(1784, 'facebook.com/Camping-Dalto-262475937193667', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL),
(1785, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL),
(1786, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL),
(1787, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL),
(1788, '3718414554', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL),
(1789, '3718514511', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL),
(1790, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL);
INSERT INTO `contacto` (`id_contacto`, `descripcion_contacto`, `rela_tipo_contacto_cont`, `rela_alojamiento_contacto`, `rela_prestador_contacto`, `rela_guia_contacto`, `rela_contacto_agencia`, `rela_persona_contacto`, `rela_contacto_referente`, `rela_contacto_museo`, `rela_servicios_generales`, `rela_festivales`, `rela_gastronomia_contacto`, `rela_organismo_contacto`, `rela_contacto_salones`) VALUES
(1791, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL),
(1792, 'facebook.com/paseo.lamolina', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL),
(1793, 'instagram.com/paseo_la_molina', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL),
(1794, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL),
(1795, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL),
(1796, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL),
(1797, '3704413923', 2, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1798, 'No se registró', 9, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1799, 'fede_fsa@yahoo.com.ar', 1, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1800, 'facebook.com/Dominguez-Excursiones-109813514932158', 4, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1801, 'instagram.com/federicoj.dominguez', 5, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1802, '', 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1803, '', 7, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1804, '', 8, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1805, '3704008877', 2, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1806, 'No se registró', 9, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1807, 'fernandogaona2015@gmail.com', 1, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1808, 'facebook.com/fernando.gaona.902', 4, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1809, 'instagram.com/fgona68', 5, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1810, '', 6, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1811, '', 7, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1812, '', 8, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1813, '3704581937', 2, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1814, 'No se registró', 9, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1815, 'julioguardavidas@gmail.com', 1, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1816, 'facebook.com/odisea.formosa', 4, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1817, 'instagram.com/odisea_formosa', 5, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1818, '', 6, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1819, '', 7, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1820, 'Jonathan Zalazar (3704722119)', 8, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1821, '3704204297', 2, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1822, 'No se registró', 9, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1823, 'gimenec@gmail.com', 1, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1824, 'facebook.com/BichosDeRio', 4, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1825, 'instagram.com/bichosderio', 5, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1826, '', 6, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1827, 'linktr.ee/bichosderio', 7, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1828, '', 8, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1829, '3704814383', 2, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1830, '3704567193', 2, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1831, 'No se registró', 9, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1832, 'tifsty@gmail.com', 1, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1833, 'facebook.com/nauticaajereysyrype', 4, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1834, 'instagram.com/nautica.ajere.ysyrype', 5, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1835, '', 6, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1836, '', 7, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1837, '', 8, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1838, '3704602468', 2, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1839, 'No se registró', 9, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1840, 'matiastoloza21@gmail.com', 1, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1841, 'facebook.com/igluespacio', 4, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1842, 'instagram.com/igluespacio', 5, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1843, '', 6, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1844, '', 7, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1845, '', 8, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1846, '3704608983', 2, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1847, '3704571842', 2, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1848, 'No se registró', 9, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1849, 'chiloruiz009@gmail.com', 1, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1850, 'facebook.com/chilo.ruiz.56', 4, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1851, '', 5, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1852, '', 6, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1853, '', 7, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1854, 'facebook.com/chiloruiz00', 8, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1855, '3704230107', 2, 65, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1856, '', 9, 65, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1857, '', 1, 65, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1858, '', 4, 65, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1859, '', 5, 65, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1860, '', 6, 65, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1861, '', 7, 65, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1862, '', 8, 65, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1863, '3704395896', 2, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1864, 'No se registró', 9, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1865, 'mariecor66@outlook.com', 1, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1866, 'facebook.com/Guaycurú-Artesanías-salvajes-109474737601326', 4, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1867, 'instagram.com/guaycuru_artesanias.salvajes', 5, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1868, '', 6, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1869, '', 7, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1870, '', 8, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1871, '3704672687', 2, NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1872, 'No se registró', 9, NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1873, 'santiagobuchara1@gmail.com', 1, NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1874, 'facebook.com/profile.php?id=100041806945944', 4, NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1875, '', 5, NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1876, '', 6, NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1877, '', 7, NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1878, '', 8, NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1887, '3718477001', 2, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1888, '1150137526', 2, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1889, 'No se registró', 9, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1890, '', 1, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1891, '', 4, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1892, '', 5, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1893, '', 6, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1894, '', 7, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1895, '', 8, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1896, '3704274747', 2, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1897, 'No se registró', 9, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1898, 'turismoestrella.naturaleza@gmail.com', 1, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1899, 'facebook.com/LaEstrellaTurismo', 4, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1900, '', 5, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1901, '', 6, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1902, '', 7, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1903, '', 8, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1912, '3704098545', 2, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1913, 'No se registró', 9, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1914, '', 1, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1915, 'facebook.com/iwoka.mojondefierro', 4, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1916, '', 5, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1917, '', 6, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1918, '', 7, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1919, '', 8, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1920, '3704307686', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL),
(1921, '3704369262', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL),
(1922, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL),
(1923, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL),
(1924, 'facebook.com/lidio.chavez.100', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL),
(1925, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL),
(1926, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL),
(1927, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL),
(1928, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL),
(1929, '3704061902', 2, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1930, 'No se registró', 9, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1931, 'almarazcristian7@gmail.com', 1, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1932, 'facebook.com/kayaksym.alquila', 4, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1933, 'instagram.com/kayak_sym', 5, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1934, '', 6, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1935, '', 7, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1936, '', 8, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1937, '3715480425', 2, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1938, 'No se registró', 9, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1939, '', 1, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1940, '', 4, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1941, '', 5, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1942, '', 6, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1943, '', 7, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1944, '', 8, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1945, '3704340934', 2, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1946, 'No se registró', 9, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1947, '', 1, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1948, '', 4, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1949, '', 5, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1950, '', 6, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1951, '', 7, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1952, '', 8, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1953, '3715616050', 2, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1954, '3715407694', 9, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1955, '', 1, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1956, '', 4, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1957, '', 5, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1958, '', 6, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1959, '', 7, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1960, '', 8, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1961, '3704239016', 2, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1962, 'No se registró', 9, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1963, '', 1, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1964, '', 4, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1965, '', 5, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1966, '', 6, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1967, '', 7, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1968, '', 8, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1969, '3704651022', 2, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1970, 'No se registró', 9, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1971, '', 1, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1972, '', 4, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1973, '', 5, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1974, '', 6, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1975, '', 7, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1976, '', 8, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1977, '3704208325', 2, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1978, 'No se registró', 9, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1979, '', 1, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1980, '', 4, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1981, '', 5, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1982, '', 6, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1983, '', 7, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1984, '', 8, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1985, '3704578971', 2, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1986, 'No se registró', 9, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1987, '', 1, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1988, '', 4, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1989, '', 5, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1990, '', 6, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1991, '', 7, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1992, '', 8, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1993, '3704667631', 2, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1994, '', 9, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1995, '', 1, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1996, '', 4, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1997, '', 5, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1998, '', 6, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1999, '', 7, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2000, '', 8, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2001, '3704382257', 2, 66, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2002, 'No se registró', 9, 66, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2003, '', 1, 66, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2004, '', 4, 66, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2005, '', 5, 66, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2006, '', 6, 66, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2007, '', 7, 66, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2008, '', 8, 66, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2009, '3704720760', 2, 67, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2010, 'No se registró', 9, 67, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2011, '', 1, 67, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2012, '', 4, 67, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2013, '', 5, 67, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2014, '', 6, 67, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2015, '', 7, 67, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2016, '', 8, 67, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2017, '3718521119', 2, 68, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2018, 'No se registró', 9, 68, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2019, '', 1, 68, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2020, '', 4, 68, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2021, '', 5, 68, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2022, '', 6, 68, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2023, '', 7, 68, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2024, '', 8, 68, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2025, '3718530544', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL),
(2026, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL),
(2027, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL),
(2028, 'facebook.com/Camping-Ñande-Roga-701398100724453', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL),
(2029, 'instagram.com/campingnanderoga', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL),
(2030, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL),
(2031, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL),
(2032, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL),
(2033, '3704667631', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL),
(2034, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL),
(2035, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL),
(2036, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL),
(2037, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL),
(2038, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL),
(2039, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL),
(2040, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL),
(2041, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL),
(2042, '3704647525', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL),
(2043, '3704206012', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL),
(2044, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL),
(2045, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL),
(2046, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL),
(2047, 'facebook.com/El-Predio-Camping-Pileta-841031522962121', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL),
(2048, 'instagram.com/el_predio_', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL),
(2049, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL),
(2050, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL),
(2051, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL),
(2052, '3704680732', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL),
(2053, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL),
(2054, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL),
(2055, 'facebook.com/Chuqui-Cue-1540445926208821', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL),
(2056, 'instagram.com/chuquicue', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL),
(2057, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL),
(2058, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL),
(2059, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL),
(2060, '3704236819', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL),
(2061, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL),
(2062, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL),
(2063, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL),
(2064, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL),
(2065, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL),
(2066, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL),
(2067, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL),
(2068, '3704707154', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL),
(2069, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL),
(2070, 'raulomarsoraire@gmail.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL),
(2071, 'facebook.com/profile.php?id=100063227989320', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL),
(2072, 'instagram.com/camping_montelindo', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL),
(2073, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL),
(2074, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL),
(2075, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL),
(2076, '3704618061', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL),
(2077, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL),
(2078, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL),
(2079, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL),
(2080, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL),
(2081, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL),
(2082, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL),
(2083, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL),
(2092, '3718417763', 2, NULL, NULL, NULL, NULL, NULL, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(2093, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(2094, '', 1, NULL, NULL, NULL, NULL, NULL, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(2095, 'facebook.com/profile.php?id=100057165561229', 4, NULL, NULL, NULL, NULL, NULL, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(2096, '', 5, NULL, NULL, NULL, NULL, NULL, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(2097, '', 6, NULL, NULL, NULL, NULL, NULL, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(2098, '', 7, NULL, NULL, NULL, NULL, NULL, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(2099, '', 8, NULL, NULL, NULL, NULL, NULL, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(2100, '3704201877', 2, NULL, NULL, NULL, NULL, NULL, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(2101, '4480299', 9, NULL, NULL, NULL, NULL, NULL, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(2102, '', 1, NULL, NULL, NULL, NULL, NULL, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(2103, '', 4, NULL, NULL, NULL, NULL, NULL, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(2104, '', 5, NULL, NULL, NULL, NULL, NULL, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(2105, '', 6, NULL, NULL, NULL, NULL, NULL, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(2106, '', 7, NULL, NULL, NULL, NULL, NULL, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(2107, '', 8, NULL, NULL, NULL, NULL, NULL, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(2108, '3718601558', 2, NULL, NULL, NULL, NULL, NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(2109, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(2110, '', 1, NULL, NULL, NULL, NULL, NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(2111, '', 4, NULL, NULL, NULL, NULL, NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(2112, '', 5, NULL, NULL, NULL, NULL, NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(2113, '', 6, NULL, NULL, NULL, NULL, NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(2114, '', 7, NULL, NULL, NULL, NULL, NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(2115, '', 8, NULL, NULL, NULL, NULL, NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(2148, '3704947853', 2, NULL, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, NULL, NULL),
(2149, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, NULL, NULL),
(2150, '', 1, NULL, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, NULL, NULL),
(2151, '', 4, NULL, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, NULL, NULL),
(2152, '', 5, NULL, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, NULL, NULL),
(2153, '', 6, NULL, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, NULL, NULL),
(2154, '', 7, NULL, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, NULL, NULL),
(2155, '', 8, NULL, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, NULL, NULL),
(2156, '3704219582', 2, NULL, NULL, NULL, NULL, NULL, 51, NULL, NULL, NULL, NULL, NULL, NULL),
(2157, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 51, NULL, NULL, NULL, NULL, NULL, NULL),
(2158, '', 1, NULL, NULL, NULL, NULL, NULL, 51, NULL, NULL, NULL, NULL, NULL, NULL),
(2159, '', 4, NULL, NULL, NULL, NULL, NULL, 51, NULL, NULL, NULL, NULL, NULL, NULL),
(2160, '', 5, NULL, NULL, NULL, NULL, NULL, 51, NULL, NULL, NULL, NULL, NULL, NULL),
(2161, '', 6, NULL, NULL, NULL, NULL, NULL, 51, NULL, NULL, NULL, NULL, NULL, NULL),
(2162, '', 7, NULL, NULL, NULL, NULL, NULL, 51, NULL, NULL, NULL, NULL, NULL, NULL),
(2163, '', 8, NULL, NULL, NULL, NULL, NULL, 51, NULL, NULL, NULL, NULL, NULL, NULL),
(2164, '3704698522', 2, NULL, NULL, NULL, NULL, NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL),
(2165, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL),
(2166, '', 1, NULL, NULL, NULL, NULL, NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL),
(2167, '', 4, NULL, NULL, NULL, NULL, NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL),
(2168, '', 5, NULL, NULL, NULL, NULL, NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL),
(2169, '', 6, NULL, NULL, NULL, NULL, NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL),
(2170, '', 7, NULL, NULL, NULL, NULL, NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL),
(2171, 'Concejal de Belgrano', 8, NULL, NULL, NULL, NULL, NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL),
(2172, '3704300273', 2, NULL, NULL, NULL, NULL, NULL, 53, NULL, NULL, NULL, NULL, NULL, NULL),
(2173, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 53, NULL, NULL, NULL, NULL, NULL, NULL),
(2174, '', 1, NULL, NULL, NULL, NULL, NULL, 53, NULL, NULL, NULL, NULL, NULL, NULL),
(2175, '', 4, NULL, NULL, NULL, NULL, NULL, 53, NULL, NULL, NULL, NULL, NULL, NULL),
(2176, '', 5, NULL, NULL, NULL, NULL, NULL, 53, NULL, NULL, NULL, NULL, NULL, NULL),
(2177, '', 6, NULL, NULL, NULL, NULL, NULL, 53, NULL, NULL, NULL, NULL, NULL, NULL),
(2178, '', 7, NULL, NULL, NULL, NULL, NULL, 53, NULL, NULL, NULL, NULL, NULL, NULL),
(2179, '', 8, NULL, NULL, NULL, NULL, NULL, 53, NULL, NULL, NULL, NULL, NULL, NULL),
(2200, '3704251730', 2, NULL, NULL, NULL, NULL, NULL, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(2201, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(2202, '', 1, NULL, NULL, NULL, NULL, NULL, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(2203, '', 4, NULL, NULL, NULL, NULL, NULL, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(2204, '', 5, NULL, NULL, NULL, NULL, NULL, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(2205, '', 6, NULL, NULL, NULL, NULL, NULL, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(2206, '', 7, NULL, NULL, NULL, NULL, NULL, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(2207, '3704224503', 8, NULL, NULL, NULL, NULL, NULL, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(2208, '3704600380', 2, NULL, NULL, NULL, NULL, NULL, 59, NULL, NULL, NULL, NULL, NULL, NULL),
(2209, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 59, NULL, NULL, NULL, NULL, NULL, NULL),
(2210, '', 1, NULL, NULL, NULL, NULL, NULL, 59, NULL, NULL, NULL, NULL, NULL, NULL),
(2211, '', 4, NULL, NULL, NULL, NULL, NULL, 59, NULL, NULL, NULL, NULL, NULL, NULL),
(2212, '', 5, NULL, NULL, NULL, NULL, NULL, 59, NULL, NULL, NULL, NULL, NULL, NULL),
(2213, '', 6, NULL, NULL, NULL, NULL, NULL, 59, NULL, NULL, NULL, NULL, NULL, NULL),
(2214, '', 7, NULL, NULL, NULL, NULL, NULL, 59, NULL, NULL, NULL, NULL, NULL, NULL),
(2215, '', 8, NULL, NULL, NULL, NULL, NULL, 59, NULL, NULL, NULL, NULL, NULL, NULL),
(2216, '3704070187', 2, NULL, NULL, NULL, NULL, NULL, 60, NULL, NULL, NULL, NULL, NULL, NULL),
(2217, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 60, NULL, NULL, NULL, NULL, NULL, NULL),
(2218, '', 1, NULL, NULL, NULL, NULL, NULL, 60, NULL, NULL, NULL, NULL, NULL, NULL),
(2219, '', 4, NULL, NULL, NULL, NULL, NULL, 60, NULL, NULL, NULL, NULL, NULL, NULL),
(2220, '', 5, NULL, NULL, NULL, NULL, NULL, 60, NULL, NULL, NULL, NULL, NULL, NULL),
(2221, '', 6, NULL, NULL, NULL, NULL, NULL, 60, NULL, NULL, NULL, NULL, NULL, NULL),
(2222, '', 7, NULL, NULL, NULL, NULL, NULL, 60, NULL, NULL, NULL, NULL, NULL, NULL),
(2223, '', 8, NULL, NULL, NULL, NULL, NULL, 60, NULL, NULL, NULL, NULL, NULL, NULL),
(2224, '3704613644', 2, NULL, NULL, NULL, NULL, NULL, 61, NULL, NULL, NULL, NULL, NULL, NULL),
(2225, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 61, NULL, NULL, NULL, NULL, NULL, NULL),
(2226, '', 1, NULL, NULL, NULL, NULL, NULL, 61, NULL, NULL, NULL, NULL, NULL, NULL),
(2227, '', 4, NULL, NULL, NULL, NULL, NULL, 61, NULL, NULL, NULL, NULL, NULL, NULL),
(2228, '', 5, NULL, NULL, NULL, NULL, NULL, 61, NULL, NULL, NULL, NULL, NULL, NULL),
(2229, '', 6, NULL, NULL, NULL, NULL, NULL, 61, NULL, NULL, NULL, NULL, NULL, NULL),
(2230, '', 7, NULL, NULL, NULL, NULL, NULL, 61, NULL, NULL, NULL, NULL, NULL, NULL),
(2231, '', 8, NULL, NULL, NULL, NULL, NULL, 61, NULL, NULL, NULL, NULL, NULL, NULL),
(2232, '3704803687', 2, NULL, NULL, NULL, NULL, NULL, 62, NULL, NULL, NULL, NULL, NULL, NULL),
(2233, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 62, NULL, NULL, NULL, NULL, NULL, NULL),
(2234, '', 1, NULL, NULL, NULL, NULL, NULL, 62, NULL, NULL, NULL, NULL, NULL, NULL),
(2235, '', 4, NULL, NULL, NULL, NULL, NULL, 62, NULL, NULL, NULL, NULL, NULL, NULL),
(2236, '', 5, NULL, NULL, NULL, NULL, NULL, 62, NULL, NULL, NULL, NULL, NULL, NULL),
(2237, '', 6, NULL, NULL, NULL, NULL, NULL, 62, NULL, NULL, NULL, NULL, NULL, NULL),
(2238, '', 7, NULL, NULL, NULL, NULL, NULL, 62, NULL, NULL, NULL, NULL, NULL, NULL),
(2239, '', 8, NULL, NULL, NULL, NULL, NULL, 62, NULL, NULL, NULL, NULL, NULL, NULL),
(2240, '3704206644', 2, NULL, NULL, NULL, NULL, NULL, 63, NULL, NULL, NULL, NULL, NULL, NULL),
(2241, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 63, NULL, NULL, NULL, NULL, NULL, NULL),
(2242, '', 1, NULL, NULL, NULL, NULL, NULL, 63, NULL, NULL, NULL, NULL, NULL, NULL),
(2243, '', 4, NULL, NULL, NULL, NULL, NULL, 63, NULL, NULL, NULL, NULL, NULL, NULL),
(2244, '', 5, NULL, NULL, NULL, NULL, NULL, 63, NULL, NULL, NULL, NULL, NULL, NULL),
(2245, '', 6, NULL, NULL, NULL, NULL, NULL, 63, NULL, NULL, NULL, NULL, NULL, NULL),
(2246, '', 7, NULL, NULL, NULL, NULL, NULL, 63, NULL, NULL, NULL, NULL, NULL, NULL),
(2247, '', 8, NULL, NULL, NULL, NULL, NULL, 63, NULL, NULL, NULL, NULL, NULL, NULL),
(2248, '3704413814', 2, NULL, NULL, NULL, NULL, NULL, 64, NULL, NULL, NULL, NULL, NULL, NULL),
(2249, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 64, NULL, NULL, NULL, NULL, NULL, NULL),
(2250, '', 1, NULL, NULL, NULL, NULL, NULL, 64, NULL, NULL, NULL, NULL, NULL, NULL),
(2251, '', 4, NULL, NULL, NULL, NULL, NULL, 64, NULL, NULL, NULL, NULL, NULL, NULL),
(2252, '', 5, NULL, NULL, NULL, NULL, NULL, 64, NULL, NULL, NULL, NULL, NULL, NULL),
(2253, '', 6, NULL, NULL, NULL, NULL, NULL, 64, NULL, NULL, NULL, NULL, NULL, NULL),
(2254, '', 7, NULL, NULL, NULL, NULL, NULL, 64, NULL, NULL, NULL, NULL, NULL, NULL),
(2255, '', 8, NULL, NULL, NULL, NULL, NULL, 64, NULL, NULL, NULL, NULL, NULL, NULL),
(2256, '3704815573', 2, NULL, NULL, NULL, NULL, NULL, 65, NULL, NULL, NULL, NULL, NULL, NULL),
(2257, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 65, NULL, NULL, NULL, NULL, NULL, NULL),
(2258, '', 1, NULL, NULL, NULL, NULL, NULL, 65, NULL, NULL, NULL, NULL, NULL, NULL),
(2259, '', 4, NULL, NULL, NULL, NULL, NULL, 65, NULL, NULL, NULL, NULL, NULL, NULL),
(2260, '', 5, NULL, NULL, NULL, NULL, NULL, 65, NULL, NULL, NULL, NULL, NULL, NULL),
(2261, '', 6, NULL, NULL, NULL, NULL, NULL, 65, NULL, NULL, NULL, NULL, NULL, NULL),
(2262, '', 7, NULL, NULL, NULL, NULL, NULL, 65, NULL, NULL, NULL, NULL, NULL, NULL),
(2263, '3718480085', 8, NULL, NULL, NULL, NULL, NULL, 65, NULL, NULL, NULL, NULL, NULL, NULL),
(2264, '3704608765', 2, NULL, NULL, NULL, NULL, NULL, 66, NULL, NULL, NULL, NULL, NULL, NULL),
(2265, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 66, NULL, NULL, NULL, NULL, NULL, NULL),
(2266, '', 1, NULL, NULL, NULL, NULL, NULL, 66, NULL, NULL, NULL, NULL, NULL, NULL),
(2267, '', 4, NULL, NULL, NULL, NULL, NULL, 66, NULL, NULL, NULL, NULL, NULL, NULL),
(2268, '', 5, NULL, NULL, NULL, NULL, NULL, 66, NULL, NULL, NULL, NULL, NULL, NULL),
(2269, '', 6, NULL, NULL, NULL, NULL, NULL, 66, NULL, NULL, NULL, NULL, NULL, NULL),
(2270, '', 7, NULL, NULL, NULL, NULL, NULL, 66, NULL, NULL, NULL, NULL, NULL, NULL),
(2271, '', 8, NULL, NULL, NULL, NULL, NULL, 66, NULL, NULL, NULL, NULL, NULL, NULL),
(2280, '3718416388', 2, NULL, NULL, NULL, NULL, NULL, 68, NULL, NULL, NULL, NULL, NULL, NULL),
(2281, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 68, NULL, NULL, NULL, NULL, NULL, NULL),
(2282, '', 1, NULL, NULL, NULL, NULL, NULL, 68, NULL, NULL, NULL, NULL, NULL, NULL),
(2283, '', 4, NULL, NULL, NULL, NULL, NULL, 68, NULL, NULL, NULL, NULL, NULL, NULL),
(2284, '', 5, NULL, NULL, NULL, NULL, NULL, 68, NULL, NULL, NULL, NULL, NULL, NULL),
(2285, '', 6, NULL, NULL, NULL, NULL, NULL, 68, NULL, NULL, NULL, NULL, NULL, NULL),
(2286, '', 7, NULL, NULL, NULL, NULL, NULL, 68, NULL, NULL, NULL, NULL, NULL, NULL),
(2287, '', 8, NULL, NULL, NULL, NULL, NULL, 68, NULL, NULL, NULL, NULL, NULL, NULL),
(2323, '3704346991', 2, NULL, NULL, NULL, NULL, NULL, 75, NULL, NULL, NULL, NULL, NULL, NULL),
(2324, '', 9, NULL, NULL, NULL, NULL, NULL, 75, NULL, NULL, NULL, NULL, NULL, NULL),
(2325, '', 1, NULL, NULL, NULL, NULL, NULL, 75, NULL, NULL, NULL, NULL, NULL, NULL),
(2326, '', 4, NULL, NULL, NULL, NULL, NULL, 75, NULL, NULL, NULL, NULL, NULL, NULL),
(2327, '', 5, NULL, NULL, NULL, NULL, NULL, 75, NULL, NULL, NULL, NULL, NULL, NULL),
(2328, '', 6, NULL, NULL, NULL, NULL, NULL, 75, NULL, NULL, NULL, NULL, NULL, NULL),
(2329, '', 7, NULL, NULL, NULL, NULL, NULL, 75, NULL, NULL, NULL, NULL, NULL, NULL),
(2330, '', 8, NULL, NULL, NULL, NULL, NULL, 75, NULL, NULL, NULL, NULL, NULL, NULL),
(2331, '3718400203', 2, 72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2332, 'No se registró', 9, 72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2333, '', 1, 72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2334, 'facebook.com/Hospedaje-El-Riki-688187351299176', 4, 72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2335, '', 5, 72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2336, '', 6, 72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2337, '', 7, 72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2338, '(03718) 400203 (Fijo)', 8, 72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2339, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL),
(2340, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL),
(2341, 'riopilcomayo@apn.gob.ar', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL),
(2342, 'facebook.com/parquenacionalriopilcomayo', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL),
(2343, 'instagram.com/parquenacionalriopilcomayo', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL),
(2344, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL),
(2345, 'argentina.gob.ar/parquesnacionales/riopilcomayo', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL),
(2346, '(03718) 470045 (Fijo)', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL),
(2347, '3711614118', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL),
(2348, '3704222336', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL),
(2349, '3704222335', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL),
(2350, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL),
(2351, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL),
(2352, 'rnformosa@apn.gob.ar', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL),
(2353, 'facebook.com/reserva.formosa', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL),
(2354, 'instagram.com/rnformosa', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL),
(2355, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL),
(2356, 'argentina.gob.ar/parquesnacionales/formosa', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL),
(2357, '3711403048 (Natalia Alonzo)', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL),
(2358, '3704550754', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL),
(2359, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL),
(2360, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL),
(2361, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL),
(2362, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL),
(2363, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL),
(2364, 'formosa.gob.ar/produccion/guaycolec', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL),
(2365, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL),
(2374, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL, NULL, NULL),
(2375, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL, NULL, NULL),
(2376, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL, NULL, NULL),
(2377, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL, NULL, NULL),
(2378, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL, NULL, NULL),
(2379, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL, NULL, NULL),
(2380, 'formosahermosa.gob.ar/region-oeste/reserva-natural-riacho-teuquito-2/', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL, NULL, NULL),
(2381, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL, NULL, NULL),
(2382, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL, NULL, NULL),
(2383, '4436698', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL, NULL, NULL),
(2384, 'ucap.rblo@formosa.gob.ar', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL, NULL, NULL),
(2385, 'facebook.com/RBLOFormosa/', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL, NULL, NULL),
(2386, 'instagram.com/lagunaocayherraduras', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL, NULL, NULL),
(2387, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL, NULL, NULL),
(2388, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL, NULL, NULL),
(2389, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL, NULL, NULL),
(2476, '3705089699', 2, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2477, '', 9, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2478, '', 1, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2479, '', 4, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2480, '', 5, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2481, '', 6, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2482, '', 7, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2483, '', 8, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2484, '3704430973', 2, 77, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2485, '', 9, 77, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2486, 'res.espana@pgci-lar.com', 1, 77, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2487, '', 4, 77, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2488, '', 5, 77, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2489, '', 6, 77, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2490, '', 7, 77, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2491, '', 8, 77, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2500, '3704001426', 2, 78, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2501, 'No se registró', 9, 78, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2502, '', 1, 78, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2503, '', 4, 78, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2504, '', 5, 78, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2505, '', 6, 78, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2506, '', 7, 78, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2507, '', 8, 78, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2523, '3704283971', 2, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2524, '', 9, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2525, 'nancydelcarmenmonti@gmail.com', 1, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2526, '', 4, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2527, '', 5, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2528, '', 6, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2529, '', 7, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2530, '', 8, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2531, '3718082055', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(2532, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(2533, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(2534, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(2535, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(2536, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(2537, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(2538, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(2539, '3704927565', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(2540, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(2541, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(2542, 'TANQUE BAR', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(2543, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(2544, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(2545, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(2546, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(2547, '3718686360', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(2548, '3718585389', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(2549, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(2550, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(2551, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(2552, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(2553, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(2554, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(2555, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(2556, '3718581657', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(2557, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(2558, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(2559, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(2560, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(2561, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(2562, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(2563, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(2564, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(2565, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(2566, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(2567, 'FOODPARKDUBLIN', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(2568, 'FOODPARKDUBLIN', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(2569, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(2570, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(2571, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(2572, '3718558794', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(2573, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(2574, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(2575, 'LA MAMA DEL SANDWICH', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(2576, 'LA MAMA DEL SANDWICH', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(2577, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(2578, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(2579, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(2580, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(2581, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(2582, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL);
INSERT INTO `contacto` (`id_contacto`, `descripcion_contacto`, `rela_tipo_contacto_cont`, `rela_alojamiento_contacto`, `rela_prestador_contacto`, `rela_guia_contacto`, `rela_contacto_agencia`, `rela_persona_contacto`, `rela_contacto_referente`, `rela_contacto_museo`, `rela_servicios_generales`, `rela_festivales`, `rela_gastronomia_contacto`, `rela_organismo_contacto`, `rela_contacto_salones`) VALUES
(2583, 'NATALIA ACUÑA ', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(2584, 'NATALIA ACUÑA ', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(2585, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(2586, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(2587, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(2588, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(2589, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(2590, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(2591, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(2592, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(2593, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(2594, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(2595, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(2596, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(2597, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(2598, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(2599, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(2600, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(2601, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(2602, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(2603, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(2604, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(2605, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(2606, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(2607, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(2608, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(2609, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(2610, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(2611, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(2612, '3718470124', 2, 79, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2613, '3718470124', 9, 79, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2614, '', 1, 79, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2615, '', 4, 79, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2616, '', 5, 79, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2617, '', 6, 79, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2618, '', 7, 79, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2619, '', 8, 79, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2669, '0', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL),
(2670, '0', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL),
(2671, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL),
(2672, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL),
(2673, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL),
(2674, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL),
(2675, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL),
(2676, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL),
(2694, '3704811906', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(2695, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(2696, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(2697, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(2698, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(2699, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(2700, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(2701, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(2702, '3718639235', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL),
(2703, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL),
(2704, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL),
(2705, 'https://www.facebook.com/eldecanolagunense/', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL),
(2706, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL),
(2707, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL),
(2708, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL),
(2709, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL),
(2718, '3704039832', 2, NULL, NULL, NULL, NULL, NULL, 78, NULL, NULL, NULL, NULL, NULL, NULL),
(2719, '', 9, NULL, NULL, NULL, NULL, NULL, 78, NULL, NULL, NULL, NULL, NULL, NULL),
(2720, '', 1, NULL, NULL, NULL, NULL, NULL, 78, NULL, NULL, NULL, NULL, NULL, NULL),
(2721, '', 4, NULL, NULL, NULL, NULL, NULL, 78, NULL, NULL, NULL, NULL, NULL, NULL),
(2722, '', 5, NULL, NULL, NULL, NULL, NULL, 78, NULL, NULL, NULL, NULL, NULL, NULL),
(2723, '', 6, NULL, NULL, NULL, NULL, NULL, 78, NULL, NULL, NULL, NULL, NULL, NULL),
(2724, '', 7, NULL, NULL, NULL, NULL, NULL, 78, NULL, NULL, NULL, NULL, NULL, NULL),
(2725, '', 8, NULL, NULL, NULL, NULL, NULL, 78, NULL, NULL, NULL, NULL, NULL, NULL),
(2726, '3718449345', 2, NULL, NULL, NULL, NULL, NULL, 79, NULL, NULL, NULL, NULL, NULL, NULL),
(2727, '', 9, NULL, NULL, NULL, NULL, NULL, 79, NULL, NULL, NULL, NULL, NULL, NULL),
(2728, '', 1, NULL, NULL, NULL, NULL, NULL, 79, NULL, NULL, NULL, NULL, NULL, NULL),
(2729, '', 4, NULL, NULL, NULL, NULL, NULL, 79, NULL, NULL, NULL, NULL, NULL, NULL),
(2730, '', 5, NULL, NULL, NULL, NULL, NULL, 79, NULL, NULL, NULL, NULL, NULL, NULL),
(2731, '', 6, NULL, NULL, NULL, NULL, NULL, 79, NULL, NULL, NULL, NULL, NULL, NULL),
(2732, '', 7, NULL, NULL, NULL, NULL, NULL, 79, NULL, NULL, NULL, NULL, NULL, NULL),
(2733, '', 8, NULL, NULL, NULL, NULL, NULL, 79, NULL, NULL, NULL, NULL, NULL, NULL),
(2743, '3704557796', 2, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2744, '', 9, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2745, 'info@hiddentrails.tur.ar', 1, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2746, '', 4, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2747, '', 5, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2748, '', 6, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2749, 'www.hiddentrails.tur.ar', 7, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2750, '', 8, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2751, '3718680910', 2, NULL, NULL, NULL, NULL, NULL, 80, NULL, NULL, NULL, NULL, NULL, NULL),
(2752, '', 9, NULL, NULL, NULL, NULL, NULL, 80, NULL, NULL, NULL, NULL, NULL, NULL),
(2753, '', 1, NULL, NULL, NULL, NULL, NULL, 80, NULL, NULL, NULL, NULL, NULL, NULL),
(2754, '', 4, NULL, NULL, NULL, NULL, NULL, 80, NULL, NULL, NULL, NULL, NULL, NULL),
(2755, '', 5, NULL, NULL, NULL, NULL, NULL, 80, NULL, NULL, NULL, NULL, NULL, NULL),
(2756, '', 6, NULL, NULL, NULL, NULL, NULL, 80, NULL, NULL, NULL, NULL, NULL, NULL),
(2757, '', 7, NULL, NULL, NULL, NULL, NULL, 80, NULL, NULL, NULL, NULL, NULL, NULL),
(2758, '', 8, NULL, NULL, NULL, NULL, NULL, 80, NULL, NULL, NULL, NULL, NULL, NULL),
(2759, '3704269388', 2, 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2760, '', 9, 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2761, 'lucascent83@gmail.com', 1, 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2762, 'https://www.facebook.com/QuintaLaCelia', 4, 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2763, '', 5, 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2764, '', 6, 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2765, '', 7, 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2766, '', 8, 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2767, '3704811906', 2, NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2768, 'No se registró', 9, NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2769, '', 1, NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2770, 'Regionales Ibarreta', 4, NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2771, 'regionalesibarreta', 5, NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2772, '', 6, NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2773, '', 7, NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2774, '', 8, NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2777, '3704679954', 2, NULL, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2778, '', 9, NULL, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2779, '', 1, NULL, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2780, '', 4, NULL, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2781, 'establecimiento 3 de mayo', 5, NULL, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2782, '', 6, NULL, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2783, '', 7, NULL, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2784, '', 8, NULL, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2785, '3704573864', 2, NULL, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2786, '', 9, NULL, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2787, '', 1, NULL, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2788, 'elcantodelpitogueformosa', 4, NULL, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2789, '@elcantodelpitoguefsa', 5, NULL, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2790, '', 6, NULL, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2791, '', 7, NULL, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2792, '', 8, NULL, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2796, '3704675363', 2, NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2797, '', 9, NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2798, 'alwatoba@gmail.com', 1, NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2799, 'alwatoba', 4, NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2800, '@alwatoba', 5, NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2801, '', 6, NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2802, '', 7, NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2803, '', 8, NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2804, '3704417000', 2, NULL, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2805, 'No se registró', 9, NULL, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2806, '', 1, NULL, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2807, 'GUARDERIA NAUTICA HERRADURA', 4, NULL, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2808, 'guarderia.nautica.herradura', 5, NULL, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2809, '', 6, NULL, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2810, '', 7, NULL, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2811, '', 8, NULL, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2812, '', 2, NULL, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2813, '', 9, NULL, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2814, '', 1, NULL, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2815, 'El Edén-Quinta', 4, NULL, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2816, 'quinta.eleden', 5, NULL, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2817, '', 6, NULL, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2818, '', 7, NULL, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2819, '', 8, NULL, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2820, '3704245809', 2, NULL, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2821, '', 9, NULL, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2822, 'federamua@gmail.com', 1, NULL, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2823, 'Team Don SantiAgo Bike', 4, NULL, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2824, 'team_don_santiago_bike', 5, NULL, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2825, '', 6, NULL, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2826, '', 7, NULL, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2827, '', 8, NULL, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2828, '3704505171', 2, NULL, NULL, NULL, NULL, NULL, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(2829, '', 9, NULL, NULL, NULL, NULL, NULL, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(2830, '', 1, NULL, NULL, NULL, NULL, NULL, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(2831, '', 4, NULL, NULL, NULL, NULL, NULL, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(2832, '', 5, NULL, NULL, NULL, NULL, NULL, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(2833, '', 6, NULL, NULL, NULL, NULL, NULL, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(2834, '', 7, NULL, NULL, NULL, NULL, NULL, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(2835, '', 8, NULL, NULL, NULL, NULL, NULL, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(2851, '3704', 2, NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2852, '37044', 9, NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2853, 'gonzalo@gmail.com', 1, NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2854, '3704587883', 2, NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2855, 'No se registró', 9, NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2856, 'silvana@gmail.com', 1, NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2857, '3704832292', 2, NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2858, '', 9, NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2859, 'rony.almiron.015@gmail.com', 1, NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2860, '', 2, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2861, '-', 9, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2862, '-', 1, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2863, '', 2, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2864, '-', 9, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2865, '-', 1, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2866, '3704410275', 2, NULL, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2867, '-', 9, NULL, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2868, '-', 1, NULL, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2869, '3704299701', 2, NULL, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2870, '-', 9, NULL, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2871, '-', 1, NULL, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2872, '3704555123', 2, NULL, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2873, '-', 9, NULL, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2874, '-', 1, NULL, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2875, '3704703710', 2, NULL, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2876, '-', 9, NULL, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2877, '-', 1, NULL, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2878, '3704385617', 2, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2879, '-', 9, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2880, '-', 1, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2881, '3704387477', 2, NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2882, '-', 9, NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2883, '-', 1, NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2884, '3704369016', 2, NULL, NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2885, '-', 9, NULL, NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2886, '-', 1, NULL, NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2887, '3704366939', 2, NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2888, '-', 9, NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2889, '-', 1, NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2890, '3704067616', 2, NULL, NULL, NULL, NULL, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2891, '-', 9, NULL, NULL, NULL, NULL, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2892, '-', 1, NULL, NULL, NULL, NULL, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2893, '3704359511', 2, NULL, NULL, NULL, NULL, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2894, '-', 9, NULL, NULL, NULL, NULL, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2895, '-', 1, NULL, NULL, NULL, NULL, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2896, '3704674579', 2, NULL, NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2897, '-', 9, NULL, NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2898, '-', 1, NULL, NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2899, '3704587883', 2, NULL, NULL, NULL, NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2900, '-', 9, NULL, NULL, NULL, NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2901, '-', 1, NULL, NULL, NULL, NULL, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2902, '3704416770', 2, NULL, NULL, NULL, NULL, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2903, '-', 9, NULL, NULL, NULL, NULL, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2904, '-', 1, NULL, NULL, NULL, NULL, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2905, '3704715750', 2, NULL, NULL, NULL, NULL, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2906, '-', 9, NULL, NULL, NULL, NULL, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2907, '-', 1, NULL, NULL, NULL, NULL, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2908, '3704270521', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(2909, '4439955', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(2910, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(2911, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(2912, 'instagram.com/el_nuevofortin', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(2913, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(2914, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(2915, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(2916, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(2917, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(2918, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(2919, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(2920, 'instagram.com/sr_pancho_', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(2921, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(2922, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(2923, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(2924, '3704989334', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(2925, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(2926, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(2927, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(2928, 'instagram.com/adn.cafe.fsa', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(2929, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(2930, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(2931, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(2932, '3704013735', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL),
(2933, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL),
(2934, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL),
(2935, 'facebook.com/PancholoVIP', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL),
(2936, 'instagram.com/pancholoviprestobar', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL),
(2937, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL),
(2938, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL),
(2939, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL),
(2940, '3704090380', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL),
(2941, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL),
(2942, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL),
(2943, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL),
(2944, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL),
(2945, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL),
(2946, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL),
(2947, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL),
(2948, '3704954069', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL),
(2949, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL),
(2950, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL),
(2951, 'facebook.com/VeronaPizzaBar', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL),
(2952, 'instagram.com/pizzeria.bar.verona', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL),
(2953, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL),
(2954, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL),
(2955, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL),
(2956, '3704521114', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL),
(2957, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL),
(2958, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL),
(2959, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL),
(2960, 'instagram.com/puntonortekiosko', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL),
(2961, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL),
(2962, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL),
(2963, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL),
(2964, '3704574858', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL),
(2965, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL),
(2966, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL),
(2967, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL),
(2968, 'instagram.com/pizzeria_lord', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL),
(2969, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL),
(2970, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL),
(2971, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL),
(2972, '3704603360', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL),
(2973, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL),
(2974, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL),
(2975, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL),
(2976, 'instagram.com/elosolomitos', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL),
(2977, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL),
(2978, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL),
(2979, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL),
(2980, '3704', 2, NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2981, '-', 9, NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2982, '-', 1, NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2983, '3704413241', 2, NULL, NULL, NULL, NULL, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2984, '-', 9, NULL, NULL, NULL, NULL, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2985, '-', 1, NULL, NULL, NULL, NULL, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2986, '3704561925', 2, NULL, NULL, NULL, NULL, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2987, '-', 9, NULL, NULL, NULL, NULL, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2988, '-', 1, NULL, NULL, NULL, NULL, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2989, '3704', 2, NULL, NULL, NULL, NULL, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2990, '-', 9, NULL, NULL, NULL, NULL, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2991, '-', 1, NULL, NULL, NULL, NULL, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2992, '3704', 2, NULL, NULL, NULL, NULL, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2993, '-', 9, NULL, NULL, NULL, NULL, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2994, '-', 1, NULL, NULL, NULL, NULL, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2995, '3704710846', 2, NULL, NULL, NULL, NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2996, '-', 9, NULL, NULL, NULL, NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2997, '-', 1, NULL, NULL, NULL, NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2998, '3704', 2, NULL, NULL, NULL, NULL, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2999, '-', 9, NULL, NULL, NULL, NULL, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3000, '-', 1, NULL, NULL, NULL, NULL, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3001, '3704705365', 2, NULL, NULL, NULL, NULL, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3002, '3704', 9, NULL, NULL, NULL, NULL, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3003, 'o@o', 1, NULL, NULL, NULL, NULL, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3004, '3705036992', 2, NULL, NULL, NULL, NULL, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3005, '-', 9, NULL, NULL, NULL, NULL, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3006, '-', 1, NULL, NULL, NULL, NULL, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3007, '3704679601', 2, NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3008, '-', 9, NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3009, '-', 1, NULL, NULL, NULL, NULL, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3010, '3704357489', 2, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3011, '-', 9, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3012, '-', 1, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3013, '3704513575', 2, 81, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3014, '', 9, 81, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3015, '', 1, 81, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3016, '', 4, 81, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3017, '', 5, 81, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3018, '', 6, 81, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3019, '', 7, 81, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3020, '', 8, 81, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3021, '2901649378', 2, 82, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3022, '', 9, 82, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3023, '', 1, 82, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3024, '', 4, 82, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3025, '', 5, 82, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3026, '', 6, 82, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3027, '', 7, 82, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3028, '', 8, 82, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3029, '3715402889', 2, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3030, 'No se registró', 9, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3031, '', 1, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3032, '', 4, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3033, '', 5, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3034, '', 6, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3035, '', 7, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3036, '', 8, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3037, '3704836830', 2, 84, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3038, 'No se registró', 9, 84, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3039, '', 1, 84, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3040, '', 4, 84, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3041, '', 5, 84, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3042, '', 6, 84, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3043, '', 7, 84, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3044, '', 8, 84, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3069, '3704244643', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL),
(3070, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL),
(3071, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL),
(3072, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL),
(3073, 's.pub.drink.music', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL),
(3074, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL),
(3075, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL),
(3076, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL),
(3077, '3705101875', 2, 85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3078, 'No se registró', 9, 85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3079, '', 1, 85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3080, '', 4, 85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3081, '', 5, 85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3082, '', 6, 85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3083, '', 7, 85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3084, '', 8, 85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3085, '3705053195', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL),
(3086, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL),
(3087, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL),
(3088, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL),
(3089, 'Branca', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL),
(3090, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL),
(3091, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL),
(3092, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL),
(3093, '3705053195', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL),
(3094, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL),
(3095, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL),
(3096, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL),
(3097, 'Branca', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL),
(3098, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL),
(3099, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL),
(3100, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL),
(3101, '3704568836', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL),
(3102, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL),
(3103, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL),
(3104, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL),
(3105, 'club27', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL),
(3106, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL),
(3107, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL),
(3108, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL),
(3109, '3704210767', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL),
(3110, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL),
(3111, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL),
(3112, 'Capintán Milanesa', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL),
(3113, 'Capintán Milanesa', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL),
(3114, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL),
(3115, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL),
(3116, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL),
(3117, '3704604327', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL),
(3118, '3705343799', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL),
(3119, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL),
(3120, 'Indigobarfsa', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL),
(3121, 'Indigobarfsa', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL),
(3122, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL),
(3123, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL),
(3124, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL),
(3125, '3704594773', 2, NULL, NULL, NULL, NULL, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3126, '-', 9, NULL, NULL, NULL, NULL, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3127, 'r_cecilia_gimenez18@hotmail.com', 1, NULL, NULL, NULL, NULL, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3128, '3704299467', 2, NULL, NULL, NULL, NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3129, '-', 9, NULL, NULL, NULL, NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3130, '-', 1, NULL, NULL, NULL, NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3131, '3704', 2, NULL, NULL, NULL, NULL, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3132, '-', 9, NULL, NULL, NULL, NULL, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3133, '-', 1, NULL, NULL, NULL, NULL, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3134, '3704205352', 2, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3135, '', 9, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3136, '', 1, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3137, '', 4, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3138, '', 5, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3139, '', 6, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3140, '', 7, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3141, '', 8, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3142, '3704367362', 2, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3143, '', 9, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3144, '', 1, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3145, '', 4, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3146, '', 5, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3147, '', 6, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3148, '', 7, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3149, '', 8, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3150, '3704337191', 2, 88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3151, '', 9, 88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3152, '', 1, 88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3153, '', 4, 88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3154, '', 5, 88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3155, '', 6, 88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3156, '', 7, 88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3157, '', 8, 88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3158, '3704790014', 2, 89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3159, '3705024072', 2, 89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3160, '', 9, 89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3161, '', 1, 89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3162, '', 4, 89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3163, '', 5, 89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3164, '', 6, 89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3165, '', 7, 89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3166, '', 8, 89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3167, '3704398685', 2, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3168, '3704286137', 2, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3169, '3704540732', 2, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3170, '', 9, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3171, '', 1, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3172, '', 4, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3173, '', 5, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3174, '', 6, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3175, '', 7, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3176, '', 8, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3177, '3704597469', 2, 91, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3178, '', 9, 91, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3179, '', 1, 91, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3180, '', 4, 91, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3181, '', 5, 91, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3182, '', 6, 91, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3183, '', 7, 91, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3184, '', 8, 91, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3185, '3704666115', 2, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3186, '', 9, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3187, '', 1, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3188, '', 4, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3189, '', 5, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3190, '', 6, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3191, '', 7, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3192, '', 8, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3193, '3704643569', 2, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3194, '', 9, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3195, '', 1, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3196, '', 4, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3197, '', 5, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3198, '', 6, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3199, '', 7, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3200, '', 8, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3201, '3704089091', 2, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3202, '', 9, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3203, '', 1, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3204, '', 4, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3205, '', 5, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3206, '', 6, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3207, '', 7, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3208, '', 8, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3209, '3704210413', 2, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3210, '', 2, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3211, '', 9, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3212, '', 1, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3213, '', 4, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3214, '', 5, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3215, '', 6, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3216, '', 7, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3217, '', 8, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3218, '3704591261', 2, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3219, '', 9, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3220, '', 1, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3221, '', 4, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3222, '', 5, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3223, '', 6, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3224, '', 7, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3225, '', 8, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3226, '3704283456', 2, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3227, '', 9, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3228, '', 1, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3229, '', 4, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3230, '', 5, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3231, '', 6, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3232, '', 7, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3233, '', 8, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3234, '3704643569', 2, 98, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3235, '', 9, 98, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3236, '', 1, 98, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3237, '', 4, 98, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3238, '', 5, 98, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3239, '', 6, 98, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3240, '', 7, 98, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3241, '', 8, 98, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3242, '3704504188', 2, 99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3243, '', 9, 99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3244, '', 1, 99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3245, '', 4, 99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3246, '', 5, 99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3247, '', 6, 99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3248, '', 7, 99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3249, '', 8, 99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3250, '2966213325', 2, 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3251, '', 9, 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3252, '', 1, 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3253, '', 4, 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3254, '', 5, 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3255, '', 6, 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3256, '', 7, 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3257, '', 8, 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3258, '3704580765', 2, 101, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3259, '3704012906', 2, 101, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3260, '', 9, 101, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3261, '', 1, 101, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3262, '', 4, 101, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3263, '', 5, 101, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3264, '', 6, 101, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3265, '', 7, 101, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3266, '', 8, 101, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3267, '3704547648', 2, 102, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3268, '', 9, 102, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3269, '', 1, 102, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3270, '', 4, 102, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3271, '', 5, 102, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3272, '', 6, 102, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3273, '', 7, 102, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3274, '', 8, 102, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3275, '3705008650', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL),
(3276, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL),
(3277, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL),
(3278, 'nando escalante ', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL),
(3279, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL),
(3280, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL),
(3281, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL),
(3282, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL);
INSERT INTO `contacto` (`id_contacto`, `descripcion_contacto`, `rela_tipo_contacto_cont`, `rela_alojamiento_contacto`, `rela_prestador_contacto`, `rela_guia_contacto`, `rela_contacto_agencia`, `rela_persona_contacto`, `rela_contacto_referente`, `rela_contacto_museo`, `rela_servicios_generales`, `rela_festivales`, `rela_gastronomia_contacto`, `rela_organismo_contacto`, `rela_contacto_salones`) VALUES
(3283, '3705075295', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL),
(3284, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL),
(3285, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL),
(3286, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL),
(3287, 'labenichrestobar', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL),
(3288, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL),
(3289, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL),
(3290, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL),
(3291, '3705141000', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL),
(3292, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL),
(3293, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL),
(3294, 'bonafide formosa', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL),
(3295, 'bonafideformosa', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL),
(3296, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL),
(3297, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL),
(3298, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL),
(3299, '3704945412', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL),
(3300, '4438295', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL),
(3301, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL),
(3302, 'cafe_martinez_formosa_', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL),
(3303, 'cafe_martinez_formosa_', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL),
(3304, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL),
(3305, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL),
(3306, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL),
(3307, '3704328667', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, NULL, NULL),
(3308, '4430186', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, NULL, NULL),
(3309, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, NULL, NULL),
(3310, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, NULL, NULL),
(3311, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, NULL, NULL),
(3312, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, NULL, NULL),
(3313, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, NULL, NULL),
(3314, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 36, NULL, NULL),
(3315, '3705068767', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 37, NULL, NULL),
(3316, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 37, NULL, NULL),
(3317, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 37, NULL, NULL),
(3318, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 37, NULL, NULL),
(3319, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 37, NULL, NULL),
(3320, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 37, NULL, NULL),
(3321, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 37, NULL, NULL),
(3322, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 37, NULL, NULL),
(3323, '3704015908', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 38, NULL, NULL),
(3324, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 38, NULL, NULL),
(3325, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 38, NULL, NULL),
(3326, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 38, NULL, NULL),
(3327, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 38, NULL, NULL),
(3328, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 38, NULL, NULL),
(3329, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 38, NULL, NULL),
(3330, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 38, NULL, NULL),
(3331, '3715618873', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL),
(3332, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL),
(3333, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL),
(3334, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL),
(3335, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL),
(3336, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL),
(3337, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL),
(3338, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL),
(3339, '3704810314', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40, NULL, NULL),
(3340, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40, NULL, NULL),
(3341, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40, NULL, NULL),
(3342, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40, NULL, NULL),
(3343, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40, NULL, NULL),
(3344, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40, NULL, NULL),
(3345, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40, NULL, NULL),
(3346, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 40, NULL, NULL),
(3347, '3704004579', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 41, NULL, NULL),
(3348, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 41, NULL, NULL),
(3349, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 41, NULL, NULL),
(3350, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 41, NULL, NULL),
(3351, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 41, NULL, NULL),
(3352, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 41, NULL, NULL),
(3353, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 41, NULL, NULL),
(3354, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 41, NULL, NULL),
(3355, '3704956812', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 42, NULL, NULL),
(3356, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 42, NULL, NULL),
(3357, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 42, NULL, NULL),
(3358, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 42, NULL, NULL),
(3359, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 42, NULL, NULL),
(3360, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 42, NULL, NULL),
(3361, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 42, NULL, NULL),
(3362, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 42, NULL, NULL),
(3363, '3644652669', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 43, NULL, NULL),
(3364, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 43, NULL, NULL),
(3365, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 43, NULL, NULL),
(3366, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 43, NULL, NULL),
(3367, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 43, NULL, NULL),
(3368, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 43, NULL, NULL),
(3369, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 43, NULL, NULL),
(3370, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 43, NULL, NULL),
(3371, '3704801382', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 44, NULL, NULL),
(3372, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 44, NULL, NULL),
(3373, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 44, NULL, NULL),
(3374, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 44, NULL, NULL),
(3375, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 44, NULL, NULL),
(3376, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 44, NULL, NULL),
(3377, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 44, NULL, NULL),
(3378, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 44, NULL, NULL),
(3379, '3704690332', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 45, NULL, NULL),
(3380, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 45, NULL, NULL),
(3381, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 45, NULL, NULL),
(3382, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 45, NULL, NULL),
(3383, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 45, NULL, NULL),
(3384, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 45, NULL, NULL),
(3385, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 45, NULL, NULL),
(3386, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 45, NULL, NULL),
(3387, '3705068844', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 46, NULL, NULL),
(3388, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 46, NULL, NULL),
(3389, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 46, NULL, NULL),
(3390, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 46, NULL, NULL),
(3391, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 46, NULL, NULL),
(3392, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 46, NULL, NULL),
(3393, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 46, NULL, NULL),
(3394, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 46, NULL, NULL),
(3395, '3704651423', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 47, NULL, NULL),
(3396, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 47, NULL, NULL),
(3397, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 47, NULL, NULL),
(3398, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 47, NULL, NULL),
(3399, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 47, NULL, NULL),
(3400, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 47, NULL, NULL),
(3401, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 47, NULL, NULL),
(3402, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 47, NULL, NULL),
(3403, '3715401026', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 48, NULL, NULL),
(3404, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 48, NULL, NULL),
(3405, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 48, NULL, NULL),
(3406, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 48, NULL, NULL),
(3407, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 48, NULL, NULL),
(3408, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 48, NULL, NULL),
(3409, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 48, NULL, NULL),
(3410, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 48, NULL, NULL),
(3411, '3704231410', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 49, NULL, NULL),
(3412, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 49, NULL, NULL),
(3413, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 49, NULL, NULL),
(3414, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 49, NULL, NULL),
(3415, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 49, NULL, NULL),
(3416, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 49, NULL, NULL),
(3417, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 49, NULL, NULL),
(3418, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 49, NULL, NULL),
(3419, '3704201729', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50, NULL, NULL),
(3420, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50, NULL, NULL),
(3421, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50, NULL, NULL),
(3422, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50, NULL, NULL),
(3423, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50, NULL, NULL),
(3424, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50, NULL, NULL),
(3425, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50, NULL, NULL),
(3426, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50, NULL, NULL),
(3427, '3704700587', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 51, NULL, NULL),
(3428, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 51, NULL, NULL),
(3429, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 51, NULL, NULL),
(3430, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 51, NULL, NULL),
(3431, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 51, NULL, NULL),
(3432, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 51, NULL, NULL),
(3433, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 51, NULL, NULL),
(3434, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 51, NULL, NULL),
(3435, '3704618637', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 52, NULL, NULL),
(3436, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 52, NULL, NULL),
(3437, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 52, NULL, NULL),
(3438, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 52, NULL, NULL),
(3439, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 52, NULL, NULL),
(3440, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 52, NULL, NULL),
(3441, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 52, NULL, NULL),
(3442, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 52, NULL, NULL),
(3451, '3704410519', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 54, NULL, NULL),
(3452, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 54, NULL, NULL),
(3453, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 54, NULL, NULL),
(3454, 'Hakuna Matata', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 54, NULL, NULL),
(3455, 'hakunamatata', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 54, NULL, NULL),
(3456, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 54, NULL, NULL),
(3457, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 54, NULL, NULL),
(3458, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 54, NULL, NULL),
(3459, '3704703679', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 55, NULL, NULL),
(3460, '3705238916', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 55, NULL, NULL),
(3461, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 55, NULL, NULL),
(3462, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 55, NULL, NULL),
(3463, 'facebook.com/LaStradaFormosa', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 55, NULL, NULL),
(3464, 'instagram.com/la_strada_pizzeria', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 55, NULL, NULL),
(3465, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 55, NULL, NULL),
(3466, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 55, NULL, NULL),
(3467, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 55, NULL, NULL),
(3468, '3704621168', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 56, NULL, NULL),
(3469, '3704265029', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 56, NULL, NULL),
(3470, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 56, NULL, NULL),
(3471, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 56, NULL, NULL),
(3472, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 56, NULL, NULL),
(3473, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 56, NULL, NULL),
(3474, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 56, NULL, NULL),
(3475, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 56, NULL, NULL),
(3476, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 56, NULL, NULL),
(3477, '3704553194', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 57, NULL, NULL),
(3478, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 57, NULL, NULL),
(3479, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 57, NULL, NULL),
(3480, 'el garage de la cerveza ', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 57, NULL, NULL),
(3481, 'beerparacreer', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 57, NULL, NULL),
(3482, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 57, NULL, NULL),
(3483, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 57, NULL, NULL),
(3484, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 57, NULL, NULL),
(3485, '3704808222', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 58, NULL, NULL),
(3486, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 58, NULL, NULL),
(3487, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 58, NULL, NULL),
(3488, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 58, NULL, NULL),
(3489, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 58, NULL, NULL),
(3490, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 58, NULL, NULL),
(3491, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 58, NULL, NULL),
(3492, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 58, NULL, NULL),
(3493, '3704247358', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 59, NULL, NULL),
(3494, '4429909', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 59, NULL, NULL),
(3495, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 59, NULL, NULL),
(3496, 'Hamburguesería Tío Checho', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 59, NULL, NULL),
(3497, 'Hamburguesería Tío Checho', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 59, NULL, NULL),
(3498, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 59, NULL, NULL),
(3499, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 59, NULL, NULL),
(3500, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 59, NULL, NULL),
(3501, '3704391930', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60, NULL, NULL),
(3502, '4441060', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60, NULL, NULL),
(3503, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60, NULL, NULL),
(3504, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60, NULL, NULL),
(3505, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60, NULL, NULL),
(3506, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60, NULL, NULL),
(3507, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60, NULL, NULL),
(3508, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 60, NULL, NULL),
(3509, '3705066264', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 61, NULL, NULL),
(3510, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 61, NULL, NULL),
(3511, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 61, NULL, NULL),
(3512, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 61, NULL, NULL),
(3513, 'instagram.com/sushitimeformosa', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 61, NULL, NULL),
(3514, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 61, NULL, NULL),
(3515, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 61, NULL, NULL),
(3516, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 61, NULL, NULL),
(3517, '3704956697', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 62, NULL, NULL),
(3518, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 62, NULL, NULL),
(3519, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 62, NULL, NULL),
(3520, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 62, NULL, NULL),
(3521, 'baruc_resto', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 62, NULL, NULL),
(3522, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 62, NULL, NULL),
(3523, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 62, NULL, NULL),
(3524, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 62, NULL, NULL),
(3525, '3705111353', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 63, NULL, NULL),
(3526, '3704436744', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 63, NULL, NULL),
(3527, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 63, NULL, NULL),
(3528, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 63, NULL, NULL),
(3529, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 63, NULL, NULL),
(3530, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 63, NULL, NULL),
(3531, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 63, NULL, NULL),
(3532, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 63, NULL, NULL),
(3533, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 63, NULL, NULL),
(3534, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 64, NULL, NULL),
(3535, '4429045', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 64, NULL, NULL),
(3536, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 64, NULL, NULL),
(3537, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 64, NULL, NULL),
(3538, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 64, NULL, NULL),
(3539, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 64, NULL, NULL),
(3540, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 64, NULL, NULL),
(3541, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 64, NULL, NULL),
(3542, '3704546932', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 65, NULL, NULL),
(3543, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 65, NULL, NULL),
(3544, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 65, NULL, NULL),
(3545, 'romagus tu lugar', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 65, NULL, NULL),
(3546, 'romagus.fsa', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 65, NULL, NULL),
(3547, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 65, NULL, NULL),
(3548, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 65, NULL, NULL),
(3549, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 65, NULL, NULL),
(3550, '3704924529', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 66, NULL, NULL),
(3551, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 66, NULL, NULL),
(3552, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 66, NULL, NULL),
(3553, 'ilviale-fsa', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 66, NULL, NULL),
(3554, 'ilviale.fsa', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 66, NULL, NULL),
(3555, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 66, NULL, NULL),
(3556, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 66, NULL, NULL),
(3557, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 66, NULL, NULL),
(3558, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 67, NULL, NULL),
(3559, '4422287', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 67, NULL, NULL),
(3560, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 67, NULL, NULL),
(3561, 'Cascote', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 67, NULL, NULL),
(3562, 'cascotecafé', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 67, NULL, NULL),
(3563, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 67, NULL, NULL),
(3564, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 67, NULL, NULL),
(3565, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 67, NULL, NULL),
(3566, '3716432413', 2, 103, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3567, '', 9, 103, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3568, '', 1, 103, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3569, '', 4, 103, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3570, '', 5, 103, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3571, '', 6, 103, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3572, '', 7, 103, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3573, '', 8, 103, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3574, '3704401040', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 68, NULL, NULL),
(3575, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 68, NULL, NULL),
(3576, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 68, NULL, NULL),
(3577, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 68, NULL, NULL),
(3578, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 68, NULL, NULL),
(3579, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 68, NULL, NULL),
(3580, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 68, NULL, NULL),
(3581, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 68, NULL, NULL),
(3582, '3705026105', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 69, NULL, NULL),
(3583, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 69, NULL, NULL),
(3584, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 69, NULL, NULL),
(3585, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 69, NULL, NULL),
(3586, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 69, NULL, NULL),
(3587, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 69, NULL, NULL),
(3588, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 69, NULL, NULL),
(3589, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 69, NULL, NULL),
(3590, '3704586765', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70, NULL, NULL),
(3591, '3704012906', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70, NULL, NULL),
(3592, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70, NULL, NULL),
(3593, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70, NULL, NULL),
(3594, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70, NULL, NULL),
(3595, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70, NULL, NULL),
(3596, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70, NULL, NULL),
(3597, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 70, NULL, NULL),
(3598, '3705004602', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 71, NULL, NULL),
(3599, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 71, NULL, NULL),
(3600, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 71, NULL, NULL),
(3601, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 71, NULL, NULL),
(3602, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 71, NULL, NULL),
(3603, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 71, NULL, NULL),
(3604, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 71, NULL, NULL),
(3605, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 71, NULL, NULL),
(3606, '3704410022', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 72, NULL, NULL),
(3607, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 72, NULL, NULL),
(3608, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 72, NULL, NULL),
(3609, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 72, NULL, NULL),
(3610, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 72, NULL, NULL),
(3611, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 72, NULL, NULL),
(3612, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 72, NULL, NULL),
(3613, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 72, NULL, NULL),
(3614, '2974742760', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 73, NULL, NULL),
(3615, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 73, NULL, NULL),
(3616, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 73, NULL, NULL),
(3617, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 73, NULL, NULL),
(3618, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 73, NULL, NULL),
(3619, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 73, NULL, NULL),
(3620, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 73, NULL, NULL),
(3621, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 73, NULL, NULL),
(3622, '3704206670', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 74, NULL, NULL),
(3623, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 74, NULL, NULL),
(3624, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 74, NULL, NULL),
(3625, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 74, NULL, NULL),
(3626, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 74, NULL, NULL),
(3627, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 74, NULL, NULL),
(3628, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 74, NULL, NULL),
(3629, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 74, NULL, NULL),
(3630, '3704588776', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 75, NULL, NULL),
(3631, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 75, NULL, NULL),
(3632, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 75, NULL, NULL),
(3633, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 75, NULL, NULL),
(3634, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 75, NULL, NULL),
(3635, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 75, NULL, NULL),
(3636, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 75, NULL, NULL),
(3637, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 75, NULL, NULL),
(3638, '3704613377', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 76, NULL, NULL),
(3639, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 76, NULL, NULL),
(3640, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 76, NULL, NULL),
(3641, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 76, NULL, NULL),
(3642, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 76, NULL, NULL),
(3643, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 76, NULL, NULL),
(3644, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 76, NULL, NULL),
(3645, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 76, NULL, NULL),
(3646, '3704374877', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 77, NULL, NULL),
(3647, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 77, NULL, NULL),
(3648, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 77, NULL, NULL),
(3649, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 77, NULL, NULL),
(3650, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 77, NULL, NULL),
(3651, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 77, NULL, NULL),
(3652, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 77, NULL, NULL),
(3653, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 77, NULL, NULL),
(3670, '3704945604', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 78, NULL, NULL),
(3671, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 78, NULL, NULL),
(3672, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 78, NULL, NULL),
(3673, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 78, NULL, NULL),
(3674, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 78, NULL, NULL),
(3675, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 78, NULL, NULL),
(3676, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 78, NULL, NULL),
(3677, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 78, NULL, NULL),
(3678, '3704994515', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 79, NULL, NULL),
(3679, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 79, NULL, NULL),
(3680, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 79, NULL, NULL),
(3681, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 79, NULL, NULL),
(3682, 'instagram.com/green_dulce_salado', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 79, NULL, NULL),
(3683, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 79, NULL, NULL),
(3684, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 79, NULL, NULL),
(3685, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 79, NULL, NULL),
(3686, '3704956374', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 80, NULL, NULL),
(3687, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 80, NULL, NULL),
(3688, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 80, NULL, NULL),
(3689, 'facebook.com/DeliverydepostresFormosa', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 80, NULL, NULL),
(3690, 'instagram.com/deliverydepostres.fsa', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 80, NULL, NULL),
(3691, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 80, NULL, NULL),
(3692, 'www.sweetsdeliverydepostres.com.ar', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 80, NULL, NULL),
(3693, 'Trabaja con PedidosYa', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 80, NULL, NULL),
(3694, '3704777953', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 81, NULL, NULL),
(3695, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 81, NULL, NULL),
(3696, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 81, NULL, NULL),
(3697, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 81, NULL, NULL),
(3698, 'instagram.com/fabriziodrinks', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 81, NULL, NULL),
(3699, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 81, NULL, NULL),
(3700, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 81, NULL, NULL),
(3701, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 81, NULL, NULL),
(3702, '3704788733', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 82, NULL, NULL),
(3703, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 82, NULL, NULL),
(3704, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 82, NULL, NULL),
(3705, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 82, NULL, NULL),
(3706, 'instagram.com/chempanadas.ok', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 82, NULL, NULL),
(3707, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 82, NULL, NULL),
(3708, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 82, NULL, NULL),
(3709, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 82, NULL, NULL),
(3710, '3705225831', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 83, NULL, NULL),
(3711, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 83, NULL, NULL),
(3712, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 83, NULL, NULL),
(3713, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 83, NULL, NULL),
(3714, 'instagram.com/paseoalmaverde', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 83, NULL, NULL),
(3715, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 83, NULL, NULL),
(3716, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 83, NULL, NULL),
(3717, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 83, NULL, NULL),
(3718, '3704375659', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 84, NULL, NULL),
(3719, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 84, NULL, NULL),
(3720, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 84, NULL, NULL),
(3721, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 84, NULL, NULL),
(3722, 'instagram.com/riberaformosa', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 84, NULL, NULL),
(3723, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 84, NULL, NULL),
(3724, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 84, NULL, NULL),
(3725, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 84, NULL, NULL),
(3726, '3704216585', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 85, NULL, NULL),
(3727, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 85, NULL, NULL),
(3728, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 85, NULL, NULL),
(3729, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 85, NULL, NULL),
(3730, 'instagram.com/baldomerofsa', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 85, NULL, NULL),
(3731, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 85, NULL, NULL),
(3732, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 85, NULL, NULL),
(3733, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 85, NULL, NULL),
(3734, '3704273622', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 86, NULL, NULL),
(3735, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 86, NULL, NULL),
(3736, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 86, NULL, NULL),
(3737, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 86, NULL, NULL),
(3738, 'instagram.com/tatane.cerveceria.bar', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 86, NULL, NULL),
(3739, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 86, NULL, NULL),
(3740, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 86, NULL, NULL),
(3741, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 86, NULL, NULL),
(3742, '3704355527', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 87, NULL, NULL),
(3743, '3704364911', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 87, NULL, NULL),
(3744, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 87, NULL, NULL),
(3745, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 87, NULL, NULL),
(3746, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 87, NULL, NULL),
(3747, 'saboresresto ', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 87, NULL, NULL),
(3748, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 87, NULL, NULL),
(3749, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 87, NULL, NULL),
(3750, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 87, NULL, NULL),
(3751, '3704258518', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 88, NULL, NULL),
(3752, '4481283', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 88, NULL, NULL),
(3753, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 88, NULL, NULL),
(3754, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 88, NULL, NULL),
(3755, 'esquinadelclub', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 88, NULL, NULL),
(3756, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 88, NULL, NULL),
(3757, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 88, NULL, NULL),
(3758, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 88, NULL, NULL),
(3759, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 89, NULL, NULL),
(3760, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 89, NULL, NULL),
(3761, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 89, NULL, NULL),
(3762, 'Rotisería Bren', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 89, NULL, NULL),
(3763, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 89, NULL, NULL),
(3764, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 89, NULL, NULL),
(3765, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 89, NULL, NULL),
(3766, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 89, NULL, NULL),
(3767, '37042060733', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90, NULL, NULL),
(3768, '44480511', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90, NULL, NULL),
(3769, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90, NULL, NULL),
(3770, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90, NULL, NULL),
(3771, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90, NULL, NULL),
(3772, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90, NULL, NULL),
(3773, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90, NULL, NULL),
(3774, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90, NULL, NULL),
(3775, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 91, NULL, NULL),
(3776, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 91, NULL, NULL),
(3777, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 91, NULL, NULL),
(3778, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 91, NULL, NULL),
(3779, '_bocato_resto_bar', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 91, NULL, NULL),
(3780, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 91, NULL, NULL),
(3781, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 91, NULL, NULL),
(3782, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 91, NULL, NULL),
(3783, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 92, NULL, NULL),
(3784, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 92, NULL, NULL),
(3785, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 92, NULL, NULL),
(3786, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 92, NULL, NULL),
(3787, 'el_bar-202', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 92, NULL, NULL),
(3788, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 92, NULL, NULL),
(3789, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 92, NULL, NULL),
(3790, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 92, NULL, NULL),
(3879, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93, NULL, NULL),
(3880, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93, NULL, NULL),
(3881, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93, NULL, NULL),
(3882, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93, NULL, NULL),
(3883, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93, NULL, NULL),
(3884, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93, NULL, NULL),
(3885, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93, NULL, NULL),
(3886, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 93, NULL, NULL),
(3887, '3704625724', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 94, NULL, NULL),
(3888, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 94, NULL, NULL),
(3889, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 94, NULL, NULL),
(3890, 'la dulce esquina de LV', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 94, NULL, NULL),
(3891, 'ladulceesquinadelv', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 94, NULL, NULL),
(3892, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 94, NULL, NULL),
(3893, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 94, NULL, NULL),
(3894, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 94, NULL, NULL),
(3895, '3704061120', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95, NULL, NULL),
(3896, '4426714', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95, NULL, NULL),
(3897, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95, NULL, NULL),
(3898, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95, NULL, NULL),
(3899, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95, NULL, NULL),
(3900, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95, NULL, NULL),
(3901, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95, NULL, NULL),
(3902, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95, NULL, NULL),
(3903, '3704030303', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 96, NULL, NULL),
(3904, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 96, NULL, NULL),
(3905, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 96, NULL, NULL),
(3906, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 96, NULL, NULL),
(3907, 'rosaguaru.fsa', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 96, NULL, NULL),
(3908, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 96, NULL, NULL),
(3909, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 96, NULL, NULL),
(3910, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 96, NULL, NULL),
(3911, '3704211217', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 97, NULL, NULL),
(3912, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 97, NULL, NULL),
(3913, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 97, NULL, NULL),
(3914, 'El Tano Marino ', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 97, NULL, NULL),
(3915, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 97, NULL, NULL),
(3916, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 97, NULL, NULL),
(3917, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 97, NULL, NULL),
(3918, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 97, NULL, NULL),
(3919, '3704771709', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98, NULL, NULL),
(3920, '4425632', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98, NULL, NULL),
(3921, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98, NULL, NULL),
(3922, 'Paradise pizza bar', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98, NULL, NULL),
(3923, 'paradisepizzabar', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98, NULL, NULL),
(3924, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98, NULL, NULL),
(3925, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98, NULL, NULL),
(3926, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 98, NULL, NULL),
(3927, '3715401268', 2, NULL, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3928, 'No se registró', 9, NULL, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3929, 'CarlosHipolitoBritos@gmail.com', 1, NULL, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3930, 'Britos Carlos Hipolito', 4, NULL, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3931, '', 5, NULL, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3932, '', 6, NULL, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3933, '', 7, NULL, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3934, '', 8, NULL, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3935, '3704079432', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL, NULL, NULL),
(3936, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL, NULL, NULL),
(3937, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL, NULL, NULL),
(3938, 'Fan page La Posada del Cacique', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL, NULL, NULL),
(3939, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL, NULL, NULL),
(3940, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL, NULL, NULL),
(3941, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL, NULL, NULL),
(3942, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL, NULL, NULL),
(3943, '3715480678', 2, NULL, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3944, 'No se registró', 9, NULL, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3945, '', 1, NULL, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3946, '', 4, NULL, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3947, '', 5, NULL, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3948, '', 6, NULL, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3949, '', 7, NULL, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3950, '', 8, NULL, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3951, '3704038746', 2, NULL, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3952, 'No se registró', 9, NULL, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3953, '', 1, NULL, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3954, '', 4, NULL, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3955, '', 5, NULL, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3956, '', 6, NULL, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3957, '', 7, NULL, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3958, '', 8, NULL, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3959, '3704379463', 2, NULL, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3960, '', 9, NULL, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3961, '', 1, NULL, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3962, '', 4, NULL, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3963, '', 5, NULL, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3964, '', 6, NULL, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3965, '', 7, NULL, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3966, '', 8, NULL, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3967, '3718450625', 2, NULL, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3968, '', 9, NULL, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3969, '', 1, NULL, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `contacto` (`id_contacto`, `descripcion_contacto`, `rela_tipo_contacto_cont`, `rela_alojamiento_contacto`, `rela_prestador_contacto`, `rela_guia_contacto`, `rela_contacto_agencia`, `rela_persona_contacto`, `rela_contacto_referente`, `rela_contacto_museo`, `rela_servicios_generales`, `rela_festivales`, `rela_gastronomia_contacto`, `rela_organismo_contacto`, `rela_contacto_salones`) VALUES
(3970, '', 4, NULL, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3971, '', 5, NULL, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3972, '', 6, NULL, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3973, '', 7, NULL, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3974, '', 8, NULL, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3975, '3704721258', 2, NULL, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3976, '', 9, NULL, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3977, '', 1, NULL, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3978, '', 4, NULL, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3979, '', 5, NULL, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3980, '', 6, NULL, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3981, '', 7, NULL, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3982, '', 8, NULL, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3983, '3705006628', 2, NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3984, '', 9, NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3985, '', 1, NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3986, '', 4, NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3987, '', 5, NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3988, '', 6, NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3989, '', 7, NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3990, '', 8, NULL, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3991, '3704515654', 2, NULL, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3992, '', 9, NULL, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3993, '', 1, NULL, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3994, '', 4, NULL, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3995, '', 5, NULL, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3996, '', 6, NULL, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3997, '', 7, NULL, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3998, '', 8, NULL, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3999, '3715616864', 2, NULL, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4000, 'No se registró', 9, NULL, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4001, '', 1, NULL, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4002, '', 4, NULL, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4003, '', 5, NULL, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4004, '', 6, NULL, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4005, '', 7, NULL, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4006, '', 8, NULL, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4007, '3704038746', 2, NULL, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4008, 'No se registró', 9, NULL, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4009, '', 1, NULL, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4010, '', 4, NULL, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4011, '', 5, NULL, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4012, '', 6, NULL, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4013, '', 7, NULL, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4014, '', 8, NULL, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4015, '3715402698', 2, NULL, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4016, '', 9, NULL, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4017, '', 1, NULL, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4018, '', 4, NULL, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4019, '', 5, NULL, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4020, '', 6, NULL, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4021, '', 7, NULL, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4022, '', 8, NULL, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4023, '3715480425', 2, NULL, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4024, '', 9, NULL, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4025, '', 1, NULL, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4026, '', 4, NULL, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4027, '', 5, NULL, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4028, '', 6, NULL, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4029, '', 7, NULL, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4030, '', 8, NULL, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4031, '3704038746', 2, NULL, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4032, '', 9, NULL, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4033, '', 1, NULL, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4034, '', 4, NULL, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4035, '', 5, NULL, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4036, '', 6, NULL, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4037, '', 7, NULL, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4038, '', 8, NULL, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4039, '3704971794', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99, NULL, NULL),
(4040, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99, NULL, NULL),
(4041, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99, NULL, NULL),
(4042, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99, NULL, NULL),
(4043, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99, NULL, NULL),
(4044, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99, NULL, NULL),
(4045, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99, NULL, NULL),
(4046, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 99, NULL, NULL),
(4047, '3705018188', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, NULL, NULL),
(4048, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, NULL, NULL),
(4049, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, NULL, NULL),
(4050, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, NULL, NULL),
(4051, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, NULL, NULL),
(4052, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, NULL, NULL),
(4053, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, NULL, NULL),
(4054, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, NULL, NULL),
(4055, '3704044499', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 101, NULL, NULL),
(4056, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 101, NULL, NULL),
(4057, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 101, NULL, NULL),
(4058, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 101, NULL, NULL),
(4059, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 101, NULL, NULL),
(4060, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 101, NULL, NULL),
(4061, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 101, NULL, NULL),
(4062, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 101, NULL, NULL),
(4063, '3704469427', 2, NULL, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4064, '', 9, NULL, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4065, 'contadeliamp@hotmail.com', 1, NULL, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4066, '', 4, NULL, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4067, '', 5, NULL, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4068, '', 6, NULL, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4069, '', 7, NULL, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4070, '', 8, NULL, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4071, '3704504528', 2, NULL, NULL, NULL, NULL, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4072, '-', 9, NULL, NULL, NULL, NULL, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4073, 'emiliaclarisakrachinsky@gmail.com', 1, NULL, NULL, NULL, NULL, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4074, '3704', 2, NULL, NULL, NULL, NULL, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4075, '-', 9, NULL, NULL, NULL, NULL, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4076, '-', 1, NULL, NULL, NULL, NULL, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4077, '3718424622', 2, NULL, NULL, NULL, NULL, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4078, '-', 9, NULL, NULL, NULL, NULL, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4079, '-', 1, NULL, NULL, NULL, NULL, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4080, '3704', 2, NULL, NULL, NULL, NULL, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4081, '-', 9, NULL, NULL, NULL, NULL, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4082, '-', 1, NULL, NULL, NULL, NULL, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4083, '', 2, NULL, NULL, NULL, NULL, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4084, '-', 9, NULL, NULL, NULL, NULL, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4085, '-', 1, NULL, NULL, NULL, NULL, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4086, '3704078481', 2, NULL, NULL, NULL, NULL, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4087, '-', 9, NULL, NULL, NULL, NULL, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4088, '-', 1, NULL, NULL, NULL, NULL, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4089, '3704317250', 2, NULL, NULL, NULL, NULL, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4090, '-', 9, NULL, NULL, NULL, NULL, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4091, '-', 1, NULL, NULL, NULL, NULL, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4092, '3704302867', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 102, NULL, NULL),
(4093, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 102, NULL, NULL),
(4094, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 102, NULL, NULL),
(4095, 'Fritas', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 102, NULL, NULL),
(4096, 'fritasformosaok', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 102, NULL, NULL),
(4097, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 102, NULL, NULL),
(4098, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 102, NULL, NULL),
(4099, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 102, NULL, NULL),
(4100, '3704203795', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 103, NULL, NULL),
(4101, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 103, NULL, NULL),
(4102, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 103, NULL, NULL),
(4103, 'Hook Drugstore', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 103, NULL, NULL),
(4104, 'Hook Drugstore', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 103, NULL, NULL),
(4105, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 103, NULL, NULL),
(4106, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 103, NULL, NULL),
(4107, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 103, NULL, NULL),
(4108, '3704604894', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 104, NULL, NULL),
(4109, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 104, NULL, NULL),
(4110, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 104, NULL, NULL),
(4111, 'centro bar', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 104, NULL, NULL),
(4112, 'centro bar', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 104, NULL, NULL),
(4113, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 104, NULL, NULL),
(4114, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 104, NULL, NULL),
(4115, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 104, NULL, NULL),
(4116, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 105, NULL, NULL),
(4117, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 105, NULL, NULL),
(4118, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 105, NULL, NULL),
(4119, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 105, NULL, NULL),
(4120, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 105, NULL, NULL),
(4121, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 105, NULL, NULL),
(4122, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 105, NULL, NULL),
(4123, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 105, NULL, NULL),
(4124, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 106, NULL, NULL),
(4125, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 106, NULL, NULL),
(4126, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 106, NULL, NULL),
(4127, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 106, NULL, NULL),
(4128, 'lacasonadeltioanselmo', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 106, NULL, NULL),
(4129, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 106, NULL, NULL),
(4130, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 106, NULL, NULL),
(4131, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 106, NULL, NULL),
(4132, '3704581749', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 107, NULL, NULL),
(4133, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 107, NULL, NULL),
(4134, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 107, NULL, NULL),
(4135, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 107, NULL, NULL),
(4136, 'la_picadita_elcolorado', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 107, NULL, NULL),
(4137, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 107, NULL, NULL),
(4138, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 107, NULL, NULL),
(4139, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 107, NULL, NULL),
(4140, '3704067556', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 108, NULL, NULL),
(4141, '3704280457', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 108, NULL, NULL),
(4142, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 108, NULL, NULL),
(4143, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 108, NULL, NULL),
(4144, 'elasadito_2021', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 108, NULL, NULL),
(4145, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 108, NULL, NULL),
(4146, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 108, NULL, NULL),
(4147, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 108, NULL, NULL),
(4148, '3704612902', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 109, NULL, NULL),
(4149, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 109, NULL, NULL),
(4150, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 109, NULL, NULL),
(4151, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 109, NULL, NULL),
(4152, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 109, NULL, NULL),
(4153, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 109, NULL, NULL),
(4154, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 109, NULL, NULL),
(4155, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 109, NULL, NULL),
(4156, '3704704842', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 110, NULL, NULL),
(4157, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 110, NULL, NULL),
(4158, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 110, NULL, NULL),
(4159, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 110, NULL, NULL),
(4160, 'la_picadita_elcolorado', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 110, NULL, NULL),
(4161, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 110, NULL, NULL),
(4162, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 110, NULL, NULL),
(4163, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 110, NULL, NULL),
(4164, '3704823836', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 111, NULL, NULL),
(4165, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 111, NULL, NULL),
(4166, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 111, NULL, NULL),
(4167, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 111, NULL, NULL),
(4168, 'dateelgustoo20', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 111, NULL, NULL),
(4169, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 111, NULL, NULL),
(4170, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 111, NULL, NULL),
(4171, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 111, NULL, NULL),
(4172, '1140571269', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 112, NULL, NULL),
(4173, '3704798801', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 112, NULL, NULL),
(4174, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 112, NULL, NULL),
(4175, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 112, NULL, NULL),
(4176, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 112, NULL, NULL),
(4177, 'comedordonveron2021', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 112, NULL, NULL),
(4178, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 112, NULL, NULL),
(4179, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 112, NULL, NULL),
(4180, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 112, NULL, NULL),
(4181, '3704481047', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 113, NULL, NULL),
(4182, '3704252853', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 113, NULL, NULL),
(4183, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 113, NULL, NULL),
(4184, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 113, NULL, NULL),
(4185, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 113, NULL, NULL),
(4186, 'pastini2021', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 113, NULL, NULL),
(4187, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 113, NULL, NULL),
(4188, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 113, NULL, NULL),
(4189, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 113, NULL, NULL),
(4190, '3705057428', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 114, NULL, NULL),
(4191, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 114, NULL, NULL),
(4192, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 114, NULL, NULL),
(4193, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 114, NULL, NULL),
(4194, 'dublin_cafebar', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 114, NULL, NULL),
(4195, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 114, NULL, NULL),
(4196, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 114, NULL, NULL),
(4197, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 114, NULL, NULL),
(4198, '3704313398', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 115, NULL, NULL),
(4199, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 115, NULL, NULL),
(4200, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 115, NULL, NULL),
(4201, 'el hangar restó ', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 115, NULL, NULL),
(4202, 'hangarresto', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 115, NULL, NULL),
(4203, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 115, NULL, NULL),
(4204, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 115, NULL, NULL),
(4205, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 115, NULL, NULL),
(4206, '3704305307', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 116, NULL, NULL),
(4207, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 116, NULL, NULL),
(4208, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 116, NULL, NULL),
(4209, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 116, NULL, NULL),
(4210, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 116, NULL, NULL),
(4211, 'rotisería_angela', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 116, NULL, NULL),
(4212, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 116, NULL, NULL),
(4213, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 116, NULL, NULL),
(4214, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 116, NULL, NULL),
(4215, '3705003999', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 117, NULL, NULL),
(4216, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 117, NULL, NULL),
(4217, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 117, NULL, NULL),
(4218, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 117, NULL, NULL),
(4219, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 117, NULL, NULL),
(4220, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 117, NULL, NULL),
(4221, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 117, NULL, NULL),
(4222, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 117, NULL, NULL),
(4223, '3704647020', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 118, NULL, NULL),
(4224, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 118, NULL, NULL),
(4225, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 118, NULL, NULL),
(4226, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 118, NULL, NULL),
(4227, 'johaa.cakes', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 118, NULL, NULL),
(4228, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 118, NULL, NULL),
(4229, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 118, NULL, NULL),
(4230, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 118, NULL, NULL),
(4231, '3704524007', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 119, NULL, NULL),
(4232, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 119, NULL, NULL),
(4233, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 119, NULL, NULL),
(4234, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 119, NULL, NULL),
(4235, 's.o.sdrinks', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 119, NULL, NULL),
(4236, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 119, NULL, NULL),
(4237, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 119, NULL, NULL),
(4238, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 119, NULL, NULL),
(4239, '3704586792', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 120, NULL, NULL),
(4240, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 120, NULL, NULL),
(4241, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 120, NULL, NULL),
(4242, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 120, NULL, NULL),
(4243, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 120, NULL, NULL),
(4244, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 120, NULL, NULL),
(4245, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 120, NULL, NULL),
(4246, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 120, NULL, NULL),
(4247, '3705022933', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 121, NULL, NULL),
(4248, '3725473218', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 121, NULL, NULL),
(4249, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 121, NULL, NULL),
(4250, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 121, NULL, NULL),
(4251, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 121, NULL, NULL),
(4252, 'polijubelcolorado', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 121, NULL, NULL),
(4253, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 121, NULL, NULL),
(4254, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 121, NULL, NULL),
(4255, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 121, NULL, NULL),
(4256, '3704614196', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 122, NULL, NULL),
(4257, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 122, NULL, NULL),
(4258, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 122, NULL, NULL),
(4259, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 122, NULL, NULL),
(4260, 'venecia heladeria ', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 122, NULL, NULL),
(4261, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 122, NULL, NULL),
(4262, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 122, NULL, NULL),
(4263, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 122, NULL, NULL),
(4264, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 123, NULL, NULL),
(4265, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 123, NULL, NULL),
(4266, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 123, NULL, NULL),
(4267, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 123, NULL, NULL),
(4268, 'grido el colorado ', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 123, NULL, NULL),
(4269, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 123, NULL, NULL),
(4270, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 123, NULL, NULL),
(4271, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 123, NULL, NULL),
(4272, '3624048502', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 124, NULL, NULL),
(4273, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 124, NULL, NULL),
(4274, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 124, NULL, NULL),
(4275, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 124, NULL, NULL),
(4276, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 124, NULL, NULL),
(4277, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 124, NULL, NULL),
(4278, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 124, NULL, NULL),
(4279, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 124, NULL, NULL),
(4280, '3704231348', 2, 106, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4281, '', 9, 106, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4282, '', 1, 106, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4283, '', 4, 106, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4284, '', 5, 106, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4285, '', 6, 106, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4286, '', 7, 106, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4287, 'Comunicarse con Karina', 8, 106, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto_colectivo`
--

CREATE TABLE `contacto_colectivo` (
  `id_contacto_cole` int(11) NOT NULL,
  `descripcion_contacto` varchar(255) NOT NULL,
  `rela_tipo_contacto_cont` int(11) NOT NULL,
  `rela_empresa_colectivo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto_cursos`
--

CREATE TABLE `contacto_cursos` (
  `id_contacto_cursos` int(11) NOT NULL,
  `descri_contacto_cursos` varchar(255) DEFAULT NULL,
  `rela_contacto_con` int(11) DEFAULT NULL,
  `rela_contacto_cursos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `contacto_cursos`
--

INSERT INTO `contacto_cursos` (`id_contacto_cursos`, `descri_contacto_cursos`, `rela_contacto_con`, `rela_contacto_cursos`) VALUES
(1, '3704254958', 2, 1),
(2, '3704096639', 2, 2),
(3, '3537663375', 2, 3),
(4, '3704099061', 2, 4),
(5, '3705078325', 2, 5),
(6, '3704357872', 2, 6),
(7, '3704826400', 2, 7),
(8, '3704984719', 2, 8),
(9, '3764765511', 2, 9),
(10, '3704646001', 2, 10),
(11, '3704253860', 2, 11),
(12, '3704204297', 2, 12),
(14, '3704342803', 2, 14),
(15, '3704342803', 2, 15),
(16, '3704342803', 2, 16),
(17, '3705092591', 2, 17),
(18, '3704765859', 2, 18),
(19, '3704666146', 2, 19),
(21, '3715402536', 2, 21),
(23, '3704802332', 2, 23),
(24, '3704522848', 2, 24),
(25, '3704095679', 2, 25),
(26, '3704275633', 2, 26),
(27, '3704414328', 2, 27),
(28, '3704567193', 2, 28),
(29, '3704787450', 2, 29),
(30, '3704050324', 2, 30),
(31, '3704250621', 2, 31),
(32, '3704995621', 2, 32),
(33, '3704601445', 2, 33),
(34, '3704032515', 2, 34),
(35, '3704091702', 2, 35),
(36, '3704355650', 2, 36),
(37, '3704092880', 2, 37),
(38, '3704603064', 2, 38),
(39, '3705022912', 2, 39),
(40, '3704230078', 2, 40),
(41, '3704002890', 2, 41),
(42, '3704007114', 2, 42),
(43, '3794205813', 2, 43),
(44, '3704508536', 2, 44),
(45, '3704032661', 2, 45),
(46, '3705244645', 2, 46),
(47, '3704720048', 2, 47),
(48, '3704601445', 2, 48),
(49, '3704212669', 2, 49),
(50, '3704013062', 2, 50),
(51, '3704605727', 2, 51),
(52, '3704821295', 2, 52),
(53, '3704359723', 2, 53),
(54, '3705082237', 2, 54),
(55, '3704244813', 2, 55),
(56, '3704985867', 2, 56),
(57, '3704017910', 2, 57),
(58, '3704410527', 2, 58),
(59, '3704542777', 2, 59),
(60, '3718493177', 2, 60),
(61, '3704416855', 2, 61),
(62, '3704327245', 2, 62),
(63, '3704777562', 2, 63),
(64, '3704250621', 2, 64),
(65, '3718579677', 2, 65),
(66, '3704290065', 2, 66),
(67, '', 2, 67),
(68, '', 2, 68),
(69, '3716617295', 2, 69),
(70, '3704858458', 2, 70),
(71, '3704356041', 2, 71),
(72, '3704057042', 2, 72),
(73, '3704505812', 2, 73),
(74, '3704269172', 2, 74),
(75, '3704780741', 2, 75),
(76, '3704569587', 2, 76),
(77, '3704837962', 2, 77),
(78, '3704050452', 2, 78),
(79, '3704320521', 2, 79),
(80, '3704359130', 2, 80),
(81, '3704599887', 2, 81),
(82, '3704821800', 2, 82),
(83, '3704206839', 2, 83),
(84, '3704542892', 2, 84),
(85, '3704547002', 2, 85),
(86, '3704062713', 2, 86),
(87, '3704724200', 2, 87),
(88, '3704078481', 2, 88),
(89, '3704278507', 2, 89),
(90, '3704575912', 2, 90),
(91, '3704765512', 2, 91),
(92, '3705041036', 2, 92),
(93, '', 2, 93),
(94, '3704590067', 2, 94),
(95, '3718572216', 2, 95),
(96, '3704025515', 2, 96),
(97, '3704603263', 2, 97),
(98, '3704829933', 2, 98),
(99, '3718528136', 2, 99),
(100, '3704417000', 2, 100),
(101, '3704717272', 2, 101),
(102, '3704367512', 2, 102),
(103, '3705051133', 2, 103),
(104, '3704682019', 2, 104),
(105, '3704684009', 2, 105),
(106, '3705072528', 2, 106),
(107, '3704367512', 2, 107),
(108, '3705002263', 2, 108),
(109, '3704902577', 2, 109),
(110, '3705007844', 2, 110),
(111, '3704565829', 2, 111),
(112, '3704786174', 2, 112),
(113, '3704966677', 2, 113),
(114, '3704824490', 2, 114),
(115, '3704388580', 2, 115),
(116, '3704338284', 2, 116),
(117, '3704008809', 2, 117),
(118, '3718685705', 2, 118),
(127, '3764255431', 2, 120),
(128, '', 9, 120),
(129, '', 1, 120),
(130, '', 4, 120),
(131, '', 5, 120),
(132, '', 6, 120),
(133, '', 7, 120),
(134, '', 8, 120),
(135, '3704092880', 2, 121),
(136, '', 9, 121),
(137, '', 1, 121),
(138, '', 4, 121),
(139, '', 5, 121),
(140, '', 6, 121),
(141, '', 7, 121),
(142, '', 8, 121),
(143, '3704261978', 2, 122),
(144, '', 9, 122),
(145, '', 1, 122),
(146, '', 4, 122),
(147, '', 5, 122),
(148, '', 6, 122),
(149, '', 7, 122),
(150, '', 8, 122),
(151, '3704690143', 2, 123),
(152, '', 9, 123),
(153, '', 1, 123),
(154, '', 4, 123),
(155, '', 5, 123),
(156, '', 6, 123),
(157, '', 7, 123),
(158, '', 8, 123),
(159, '3704644514', 2, 124),
(160, '', 9, 124),
(161, '', 1, 124),
(162, '', 4, 124),
(163, '', 5, 124),
(164, '', 6, 124),
(165, '', 7, 124),
(166, '', 8, 124),
(167, '3704803868', 2, 125),
(168, '', 9, 125),
(169, '', 1, 125),
(170, '', 4, 125),
(171, '', 5, 125),
(172, '', 6, 125),
(173, '', 7, 125),
(174, '', 8, 125),
(175, '3704620724', 2, 126),
(176, '', 9, 126),
(177, '', 1, 126),
(178, '', 4, 126),
(179, '', 5, 126),
(180, '', 6, 126),
(181, '', 7, 126),
(182, '', 8, 126),
(183, '3704651022', 2, 127),
(184, '', 9, 127),
(185, '', 1, 127),
(186, '', 4, 127),
(187, '', 5, 127),
(188, '', 6, 127),
(189, '', 7, 127),
(190, '', 8, 127),
(191, '3704203077', 2, 128),
(192, '', 9, 128),
(193, '', 1, 128),
(194, '', 4, 128),
(195, '', 5, 128),
(196, '', 6, 128),
(197, '', 7, 128),
(198, '', 8, 128),
(199, '3704605864', 2, 129),
(200, '', 9, 129),
(201, '', 1, 129),
(202, '', 4, 129),
(203, '', 5, 129),
(204, '', 6, 129),
(205, '', 7, 129),
(206, '', 8, 129),
(207, '3704839924', 2, 130),
(208, '', 9, 130),
(209, '', 1, 130),
(210, '', 4, 130),
(211, '', 5, 130),
(212, '', 6, 130),
(213, '', 7, 130),
(214, '', 8, 130),
(215, '3704124692', 2, 131),
(216, '', 9, 131),
(217, '', 1, 131),
(218, '', 4, 131),
(219, '', 5, 131),
(220, '', 6, 131),
(221, '', 7, 131),
(222, '', 8, 131),
(223, '3704505171', 2, 132),
(224, '', 9, 132),
(225, '', 1, 132),
(226, '', 4, 132),
(227, '', 5, 132),
(228, '', 6, 132),
(229, '', 7, 132),
(230, '', 8, 132),
(231, '3704265321', 2, 133),
(232, '', 9, 133),
(233, '', 1, 133),
(234, '', 4, 133),
(235, '', 5, 133),
(236, '', 6, 133),
(237, '', 7, 133),
(238, '', 8, 133),
(239, '3704629722', 2, 134),
(240, '', 9, 134),
(241, '', 1, 134),
(242, '', 4, 134),
(243, '', 5, 134),
(244, '', 6, 134),
(245, '', 7, 134),
(246, '', 8, 134),
(247, '3704273430', 2, 135),
(248, '', 9, 135),
(249, '', 1, 135),
(250, '', 4, 135),
(251, '', 5, 135),
(252, '', 6, 135),
(253, '', 7, 135),
(254, '', 8, 135),
(255, '1150137526', 2, 136),
(256, '', 9, 136),
(257, '', 1, 136),
(258, '', 4, 136),
(259, '', 5, 136),
(260, '', 6, 136),
(261, '', 7, 136),
(262, '', 8, 136),
(263, '3624625460', 2, 137),
(264, '', 9, 137),
(265, '', 1, 137),
(266, '', 4, 137),
(267, '', 5, 137),
(268, '', 6, 137),
(269, '', 7, 137),
(270, '', 8, 137),
(271, '3718614632', 2, 138),
(272, '', 9, 138),
(273, '', 1, 138),
(274, '', 4, 138),
(275, '', 5, 138),
(276, '', 6, 138),
(277, '', 7, 138),
(278, '', 8, 138),
(279, '3624565850', 2, 139),
(280, '', 9, 139),
(281, '', 1, 139),
(282, '', 4, 139),
(283, '', 5, 139),
(284, '', 6, 139),
(285, '', 7, 139),
(286, '', 8, 139),
(287, '3704079007', 2, 140),
(288, '', 9, 140),
(289, '', 1, 140),
(290, '', 4, 140),
(291, '', 5, 140),
(292, '', 6, 140),
(293, '', 7, 140),
(294, '', 8, 140),
(295, '3704546909', 2, 141),
(296, '3704671555', 2, 142),
(297, '3704217899', 2, 143),
(298, '3704780437', 2, 144),
(299, '3704968201', 2, 145),
(300, '3704581205', 2, 146),
(301, '3704331017', 2, 147),
(302, '3704367362', 2, 148),
(303, '3704956075', 2, 149),
(304, '3704413923', 2, 150),
(305, '3704324837', 2, 151),
(306, '3704533340', 2, 152),
(307, '3704252678', 2, 153),
(308, '3704833922', 2, 154),
(309, '3704377203', 2, 155),
(310, '3704701986', 2, 156),
(311, '2932554751', 2, 157),
(312, '3704407762', 2, 158),
(313, '3718418745', 2, 159),
(314, '1', 2, 160),
(315, '3704808671', 2, 161),
(316, '3704808671', 2, 162),
(317, '3704576738', 2, 163),
(318, '3704386302', 2, 164),
(319, '3704469337', 2, 165),
(320, '3705055382', 2, 166),
(321, '3705042578', 2, 167),
(322, '3704819322', 2, 168),
(323, '3718657855', 2, 169),
(324, '3718693177', 2, 170),
(325, '3704063706', 2, 171),
(326, '3704694178', 2, 172),
(327, '3704860959', 2, 173),
(328, '3718440855', 2, 174),
(329, '3718443602', 2, 175),
(330, '3718464947', 2, 176),
(331, '3718464668', 2, 177),
(332, '3718521037', 2, 178),
(333, '3718580290', 2, 179),
(334, '3718441120', 2, 180),
(335, '3718527650', 2, 181),
(336, '3704790988', 2, 182),
(337, '3704551042', 2, 183),
(338, '3718558562', 2, 184),
(339, '3704357489', 2, 185),
(340, '3711492023', 2, 186),
(341, '3718614897', 2, 187),
(342, '3718459371', 2, 188),
(343, '3704066677', 2, 189),
(344, '', 9, 189),
(345, '', 1, 189),
(346, '', 4, 189),
(347, '', 5, 189),
(348, '', 6, 189),
(349, '', 7, 189),
(350, '', 8, 189);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto_transporte`
--

CREATE TABLE `contacto_transporte` (
  `id_contacto_transporte` int(11) NOT NULL,
  `descri_contacto_transporte` varchar(255) DEFAULT NULL,
  `rela_contacto_con` int(11) DEFAULT NULL,
  `rela_contacto_transporte` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `contacto_transporte`
--

INSERT INTO `contacto_transporte` (`id_contacto_transporte`, `descri_contacto_transporte`, `rela_contacto_con`, `rela_contacto_transporte`) VALUES
(26, '3705082304', 2, 5),
(27, 'No se registró', 9, 5),
(28, 'richlac@hotmail.com', 1, 5),
(29, 'https://www.facebook.com/LacudriTransporte', 4, 5),
(30, '', 5, 5),
(31, '', 6, 5),
(32, '', 7, 5),
(33, '', 8, 5),
(34, '3705018165', 2, 6),
(35, '3704577994', 2, 6),
(36, '', 2, 6),
(37, '', 9, 6),
(38, '', 1, 6),
(39, '', 4, 6),
(40, '', 5, 6),
(41, '', 6, 6),
(42, '', 7, 6),
(43, '', 8, 6),
(44, '3624691354', 2, 7),
(45, '0362442729', 9, 7),
(46, 'info@lorient.com.ar', 1, 7),
(47, 'facebook/leonardo.oscar.39', 4, 7),
(48, '', 5, 7),
(49, '', 6, 7),
(50, 'https://lorient.com.ar/', 7, 7),
(51, '', 8, 7),
(52, '3704415790', 2, 8),
(53, '3704661153', 2, 8),
(54, '', 9, 8),
(55, 'l.lauraisabel@yahoo.com.ar', 1, 8),
(56, 'https://www.facebook.com/alquilerdeautosfsa', 4, 8),
(57, '', 5, 8),
(58, '', 6, 8),
(59, '', 7, 8),
(60, '', 8, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `id_cursos` int(11) NOT NULL,
  `nombreapellido` varchar(255) DEFAULT NULL,
  `dni_cursos` varchar(255) DEFAULT NULL,
  `ocupacion_cursos` varchar(255) DEFAULT NULL,
  `presente_cursos` varchar(255) DEFAULT NULL,
  `tipo_cursos` int(11) DEFAULT NULL,
  `rela_localidad_cursos` int(11) DEFAULT NULL,
  `fecha_edit_curso` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`id_cursos`, `nombreapellido`, `dni_cursos`, `ocupacion_cursos`, `presente_cursos`, `tipo_cursos`, `rela_localidad_cursos`, `fecha_edit_curso`) VALUES
(1, 'Cintia Noemi Alegre', '32830617', 'policia', 'Presente', 1, 35, '2023-06-07 11:41:16'),
(2, 'Jorge Orlando Ismael Perez', '24780381', 'periodista', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(3, 'Mariana Pasari Ocampo', '33994356', 'prof. artes visuales', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(4, 'Jimena Torrez', '45642655', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(5, 'Lucas Alejandro Coglhan', '39134176', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(6, 'Analia Soledad Lopez', '29324477', 'asist. En turismo', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(7, 'Maria Soledad Acevedo', '29080511', 'asesor turistico', 'Presente', 1, 35, '2023-06-07 12:15:27'),
(8, 'Elida Perez', '37534226', 'empleada de comercio', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(9, 'Alan Nicolas Gomez', '44941468', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(10, 'Walter Daniel Rojas', '31406373', 'asist. En viajes y turismo', 'Presente', 1, 35, '2023-06-07 12:02:26'),
(11, 'Yesica Daiana Benitez', '36016961', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(12, 'Cesar Manuel Gimenez', '29484415', 'guia turistico', 'Presente', 1, 35, '2023-06-07 12:07:12'),
(14, 'Claudia Beatriz Giorgi', '24149302', 'ama de casa', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(15, 'Luz Torales Giorgi', '46208270', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(16, 'Lujan Torales Giorgi', '46208271', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(17, 'Salome Rita Frias', '46321437', 'estudiante de cont. Publico', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(18, 'Oscar Seferino Gomez', '26211641', 'maestro mayor de obra', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(19, 'Liliana Muñoz', '22281439', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(21, 'Analia Mirna Isabel Beloso', '29857979', 'docente', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(23, 'Eliana Gisel Gonzalez Alcaraz', '34047460', 'emprendedora ', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(24, 'Gerardo Nicolas Gomez', '33741467', '', 'Presente', 1, 29, '2023-06-07 11:18:36'),
(25, 'Elva Amarilla', '23002854', 'asist. En turismo', 'Presente', 1, 35, '2023-06-07 12:21:41'),
(26, 'Barbara Valeria Gadea', '34842552', 'prof. educacion fisica', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(27, 'Monica Benitez', '22598207', 'administrativa', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(28, ' Heber Aurelio Godoy', '20222009', 'docente', 'Presente', 1, 35, '2023-06-07 14:22:56'),
(29, 'Marlene Yanet Tocarchuk', '36959159', 'profesora', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(30, 'Monica Martinez ', '35624991', 'estudiante', 'Presente', 1, 35, '2023-06-07 11:58:27'),
(31, 'Sonia Medina ', '27675696', 'enfermera', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(32, 'Martina Ledesma', '45169505', 'estudiante', 'Presente', 1, 35, '2023-06-07 11:58:58'),
(33, 'Ana Laura Bernal', '35625434', 'estudiante', 'Presente', 1, 35, '2023-06-07 11:59:36'),
(34, 'Daniela Dalma Diaz', '33477528', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(35, 'Maximiliano Ramirez', '45050609', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(36, 'Maria Cristina Gorostegui', '22670104', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(37, 'Erica Dalma Yanet Cardozo', '37109503', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(38, 'Araceli Abigail Ferreira', '45971436', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(39, 'Patricia Belen Ramirez', '34465176', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(40, 'Ludmila Daniela Tocarchuk', '44343098', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(41, 'Maira Yaquelin Estigarribia', '39136130', 'estudiante ', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(42, 'Ailen Gonzalez', '42755410', 'estudiante', 'Ausente', 1, 2, '2023-06-07 03:03:28'),
(43, 'Soledad Colman', '38193155', '', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(44, 'Ricardo Andres Maidana', '39316113', 'prof. de economia', 'Presente', 1, 35, '2023-06-07 11:53:25'),
(45, 'Karen Adriana Rolon', '35897880', 'abogada', 'Presente', 1, 35, '2023-06-07 11:43:15'),
(46, 'Patricia Elizabheth Benitez', '32368361', 'guia , asist. Turistico', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(47, 'Oriana Medeyro', '42297759', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(48, 'Ana Laura Bernal', '35625434', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(49, 'Adriana Noemi Arroyo', '31406492', 'abogada', 'Presente', 1, 35, '2023-06-07 12:00:15'),
(50, 'Hector Jonathan Gill', '40988554', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(51, 'Yesica Ramona Maldonado', '38379613', 'prof. educacion fisica', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(52, 'Ayelen Valdez', '41283320', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(53, 'Florencia Michelle Garcia', '36958628', 'estudiante', 'Presente', 1, 35, '2023-06-07 13:02:15'),
(54, 'Milena Abigail Bobadilla', '45050503', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(55, 'Mayra Gabriela Martinez', '42634505', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(56, 'Ramon Maximiliano Villalba', '43330621', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(57, 'Juan Marcelo Vazquez', '31178299', 'prestador turistico', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(58, 'Gonzalo David Vazquez ', '45745929', 'prestador turistico', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(59, ' Franco Nicolas Santichia', '39720345', 'Porf. Biologia ', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(60, 'Lia Maribel Ramos ', '44226337', 'estudiante', 'Presente', 1, 2, '2023-06-07 11:56:44'),
(61, 'Carla Jimena Delgado ', '46393509', 'Trayecto Tec. Turismo ', 'Ausente', 1, 2, '2023-06-14 13:16:50'),
(62, 'Cecilia Raquel Arce', '38575461', '', 'Presente', 1, 1, '2023-06-07 11:43:34'),
(63, 'Marcelino Abel Torales', '25466590', 'Op. Turistcio', 'Presente', 1, 35, '2023-06-07 12:30:21'),
(64, 'Sonia Griselda Medina', '27675696', 'estudiante', 'Presente', 1, 2, '2023-06-07 11:57:08'),
(65, 'Matías Fernando Gabriel Alonzo', '40803879', 'estudiante', 'Presente', 1, 57, '2023-06-07 12:01:50'),
(66, 'Viviana Cecilia Chaparro', '29678286', 'estudiante', 'Presente', 1, 35, '2023-06-07 12:16:47'),
(67, 'Diego Sebastian Lopez', '41519117', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(68, 'Maria Andrea Belen Ibarlucea Campanini ', '31998204', 'directora de turismo el colorado', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(69, 'Evelin Elizabeth Bonilla', '32285027', 'directora de turismo pozo del tigre', 'Ausente', 1, 2, '2023-06-14 14:34:01'),
(70, 'Rolando David Pereyra', '37044625', 'programador', 'Ausente', 1, 2, '2023-06-12 13:42:52'),
(71, 'Lina Griselda Galvan', '24713135', 'peluquera', 'Presente', 1, 35, '2023-06-07 12:18:36'),
(72, 'Agustina Araceli Fernandez', '37799674', 'Asistente viajers Turismo', 'Ausente', 1, 2, '2023-06-12 13:36:12'),
(73, 'Evelin Solange Leiva', '37588485', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(74, 'Leandro Ezequiel Augusto', '40627367', 'Policia', 'Presente', 1, 35, '2023-06-07 12:03:05'),
(75, 'Marcelo Fabian Vizgarra', '30316752', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(76, 'Diego Sebastian Lopez', '41519117', 'Asistente en Turismo', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(77, 'Dina Magali Ramos', '40627935', 'Tec. Economia Social', 'Presente', 1, 61, '2023-06-07 11:56:21'),
(78, 'Brenda Maria Elena Acosta', '42633851', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(79, 'Emilia Clarisa Krachinsky', '39606227', 'Empl.  Publicos', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(80, 'Maria de los Milagros Cortez Collar', '42805935', 'Policia', 'Presente', 1, 35, '2023-06-07 11:26:38'),
(81, 'VictoriaVanesa Gajan', '39902189', 'Profesora', 'Presente', 1, 1, '2023-06-07 12:17:35'),
(82, 'Jose Luis Leon', '29296736', 'Empl. Publicos', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(83, 'Diana Elizabeth Villalba', '36017739', 'Tec. Publicidad', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(84, 'Roberto Leliur', '22192611', 'Empl. Publicos', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(85, 'Luisa Florentina Mora', '32264473', '', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(86, 'Natalia Valieri', '28445333', '', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(87, 'Alicia Noemi Diaz', '26211530', 'Agentes de Viajes', 'Presente', 1, 35, '2023-06-07 11:54:34'),
(88, 'Monica Manuela Benitez', '25405288', 'empleada publica', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(89, 'Oscar Lisandro Chaves', '23667108', 'empleado publico', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(90, 'Geronimo de Jesus Colman', '30678323', 'guia de cheroga ', 'Presente', 1, 35, '2023-06-07 12:35:22'),
(91, 'Lorena Fabiola Ruiz', '31746850', 'docente', 'Presente', 1, 6, '2023-06-07 12:29:33'),
(92, 'Liz Maribel Ortellado', '42036070', '', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(93, 'Brian Max Gimenez ', '36955946', '', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(94, 'Analia Mazzo', '27349625', 'docente', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(95, 'Rocio Magdalí Benitez', '37110173', 'lic. en turismo', 'Presente', 1, 57, '2023-06-07 12:01:07'),
(96, 'Adolfo Castro', '32478707', 'Agentes de Viajes', 'Ausente', 1, 2, '2023-06-07 11:38:45'),
(97, 'Camila Janet Rojas', '40212184', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(98, 'Florencia Argüello', '41785381', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(99, 'Pablo Lionel Monges', '22927112', 'Docente', 'Presente', 1, 2, '2023-06-07 12:23:07'),
(100, 'Otto Federico Nenning', '29672527', 'contador publico', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(101, 'Silvana Cardozo', '29907772', 'veterinaria', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(102, 'Andrea Belen', '42758664', '', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(103, 'Camila Belen Ocampo', '43685737', '', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(104, 'Ramona Catalina Silva', '21866994', '', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(105, 'Sheila Alejandra Castaño', '41398435', '', 'Presente', 1, 34, '2023-06-07 11:48:44'),
(106, 'Emmanuel Gaona', '39605342', '', 'Ausente', 1, 34, '2023-06-07 11:50:46'),
(107, 'Paniagua Andrea Belen', '4258664', '', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(108, 'Santiago Rodrigo Vazquez', '32519377', 'empleado publico reserva guaycilec', 'Presente', 1, 35, '2023-06-07 11:38:03'),
(109, 'Rodrigo Baez', '38192110', 'tecnico en refrigeracion', 'Ausente', 1, 35, '2023-06-07 11:52:15'),
(110, 'Antonia del Rosario Barrios', '43350967', 'tec. Op. Guaycolec', 'Presente', 1, 35, '2023-06-12 13:29:18'),
(111, 'Nilda Carmen  Almirón', '23544840', 'neo', 'Presente', 1, 35, '2023-06-07 11:49:34'),
(112, 'Roxana Soledad Gamarra', '37211484', '', 'Presente', 1, 2, '2023-06-07 11:47:05'),
(113, 'Carlos Quinteros', '43887522', '', 'Presente', 1, 2, '2023-06-07 11:46:54'),
(114, 'Luana Ailen Franco', '45467387', '', 'Presente', 1, 2, '2023-06-07 11:47:15'),
(115, 'Miguel Luciano Leguizamon', '31945225', '', 'Presente', 1, 25, '2023-06-07 11:46:36'),
(116, 'Laura Yanel Robles', '36956449', '', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(117, 'Mara Soledad Diez', '29450896', '', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(118, 'Fernando Daniel Chaile', '34594850', '', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(120, 'Leandro Abel Brizuela', '32048864', 'independiente', 'Presente', 1, 35, '2023-06-07 12:05:30'),
(121, 'Erica Cardozo', '37109503', 'Tecnicatura en turismo', 'Presente', 1, 30, '2023-06-07 21:10:58'),
(122, 'Maximiliano Vergara', '35589756', 'Empleado, Ministerio de Turismo', 'Presente', 1, 35, '2023-06-07 21:19:56'),
(123, 'Maria Aurora Venialgo', '22695882', 'Comerciante', 'Presente', 1, 35, '2023-06-07 21:23:16'),
(124, 'Ramona Rossemari Martinez', '30161469', 'Lic en Agronegocios', 'Presente', 1, 35, '2023-06-07 21:28:43'),
(125, 'Sandra Centurión', '25051354', 'Hotel Howard Johnson', 'Presente', 1, 35, '2023-06-07 21:31:35'),
(126, 'Micaela Alejandra Princich', '41351312', 'Hotel Howard Johnson', 'Presente', 1, 35, '2023-06-07 21:35:01'),
(127, 'Carlos Arnedo', '8230036', 'Ref. Turismo rural INTA', 'Presente', 1, 30, '2023-06-07 21:37:26'),
(128, 'Pedro Guillermo Salinas', '43350619', 'Empleado, Ministerio de Turismo', 'Presente', 1, 35, '2023-06-07 21:39:04'),
(129, 'Alina Viveros', '28481668', 'Ref. Museo Policial', 'Presente', 1, 35, '2023-06-07 21:42:32'),
(130, 'Liliana Mabel Azcona', '22670031', 'Empleada Hotelera', 'Presente', 1, 35, '2023-06-07 21:44:40'),
(131, 'Gustavo Cabrera', '24259346', 'Direccion Turismo', 'Presente', 1, 35, '2023-06-07 21:46:49'),
(132, 'Baccon Gustavo', '25408553', 'Turismo', 'Presente', 1, 29, '2023-06-07 21:48:32'),
(133, 'Romina Soledad Gonzalez', '37684226', 'Empleada Municipal', 'Presente', 1, 29, '2023-06-07 21:54:10'),
(134, 'Lucas Ramon Vera', '44343203', 'Empleada Municipal', 'Presente', 1, 29, '2023-06-07 21:58:03'),
(135, 'Nicolas Chamorro', '37684194', 'Empleado Municipal', 'Presente', 1, 29, '2023-06-07 22:00:12'),
(136, 'Gisela Infantino', '23522487', 'Lic. Turismo', 'Presente', 1, 57, '2023-06-07 22:02:03'),
(137, 'Mario German Alonso', '30791884', 'Parque Nacional', 'Presente', 1, 57, '2023-06-07 22:05:38'),
(138, 'Romina Alejandra Caballero', '34976765', 'Parque Nacional', 'Presente', 1, 57, '2023-06-07 22:10:34'),
(139, 'Joaquin Romero', '37169037', 'Parque Nacional', 'Presente', 1, 57, '2023-06-07 22:16:46'),
(140, 'Miryan Noemi Michel', '17967840', 'Tecnica, Propietaria de Chuquicue', 'Presente', 1, 24, '2023-06-07 22:20:33'),
(141, 'Diego Dario Medina', '28214551', 'empleado ministerio turismo', 'Presente', 1, 35, NULL),
(142, 'Cristina del Carmen Salomon', '14632134', 'directora turismo', 'Presente', 1, 35, NULL),
(143, 'Cristian Gavilan', '35489699', 'Policía en el bañado de la Estrella ruta 28', 'Presente', 1, 1, '2023-06-08 04:34:07'),
(144, 'Ricardo Herrera', '40988960', 'policia en el bañado ruta 28', 'Presente', 1, 1, '2023-06-08 04:33:42'),
(145, 'Sebastian Zalazar', '39901856', 'empleado de turismo y cultura', 'Presente', 1, 25, NULL),
(146, 'Omar Ricardo Lopez Otero', '25258741', 'policia en el bañado ruta 28', 'Presente', 1, 1, '2023-06-08 04:34:33'),
(147, 'Daniel Eduardo Foltz', '21659015', 'empleado gestor sociocultural', 'Presente', 1, 35, NULL),
(148, 'Nelly Diaz', '16104883', 'empleada turistica', 'Presente', 1, 24, NULL),
(149, 'Ruben Gonzalez', '17968118', 'empleado atencion turista', 'Presente', 1, 35, NULL),
(150, 'Rosa Raquel Vera', '22745858', 'agente de viajes', 'Presente', 1, 35, NULL),
(151, 'Nelson Oscar Ramirez', '26081048', 'agente de turismo', 'Presente', 1, 35, NULL),
(152, 'Claudia Alejandra Gleria', '22745978', 'gestora direccion turismo', 'Presente', 1, 35, NULL),
(153, 'Maria Griselda Fernandez', '26693334', 'direccion de turismo', 'Presente', 1, 35, NULL),
(154, 'Liset Ortiz', '35624299', 'moza en el hotel de turismo', 'Presente', 1, 35, NULL),
(155, 'Bernardina Benitez', '13659664', 'guia turistica museo', 'Presente', 1, 35, NULL),
(156, 'Rosana Cirila Mendez', '22418614', 'guia turistica museo', 'Presente', 1, 35, NULL),
(157, 'Argentina Prieto', '18249636', 'guia turistica museo', 'Presente', 1, 35, NULL),
(158, 'Juan Carlos Moya', '17090773', 'docente equipo tecnico municipalidad de formosa', 'Presente', 1, 35, '2023-06-14 14:01:47'),
(159, 'Lilian Casentino', '14191119', 'directora de cultura municipalidad', 'Presente', 1, 56, NULL),
(160, 'Maria Teresa Alvarez', '27063685', 'licenciada en turismo', 'Presente', 1, 1, NULL),
(161, 'Evelyn Carolina Cespedes', '26091613', 'docente gestora de cultura', 'Presente', 1, 35, '2023-06-08 04:36:37'),
(162, 'Romina Graciela Eymann', '30776114', 'empleada administracion Sakura', 'Presente', 1, 35, NULL),
(163, 'Anibal Lopresti Perluzky', '29110941', 'administrativo Sakura', 'Presente', 1, 35, NULL),
(164, 'Mauricia Vega', '25626952', 'guia turistica', 'Presente', 1, 35, NULL),
(165, 'Victoria Vega', '40446702', 'asistente de viaje y turismo', 'Presente', 1, 35, NULL),
(166, 'Nilda Malvina Brites', '29484494', 'policia museo policial', 'Presente', 1, 35, NULL),
(167, 'Gonzalo Sebastian Ozuna', '40987040', 'empleado Ministerio de turismo', 'Presente', 1, 35, NULL),
(168, 'Karla Marilen Rodriguez', '41013178', 'empleada Ministerio de turismo', 'Presente', 1, 35, NULL),
(169, 'Sofia Antonella Fader', '45381679', 'estudiante', 'Presente', 1, 57, NULL),
(170, 'Pablo Martinez', '44343107', 'estudiante', 'Presente', 1, 57, NULL),
(171, 'Evelyn Barboza', '46154286', 'estudiante', 'Presente', 1, 57, NULL),
(172, 'Martina Santillan', '45902760', 'estudiante', 'Presente', 1, 57, NULL),
(173, 'Matias Figueroa', '34349684', 'estudiante', 'Presente', 1, 57, NULL),
(174, 'Julieta Morales', '45969780', 'estudiante', 'Presente', 1, 57, NULL),
(175, 'Brisa Ruiz Diaz', '46028906', 'estudiante', 'Presente', 1, 57, NULL),
(176, 'Luz Ticiana Bobadilla', '45050171', 'estudiante', 'Presente', 1, 57, NULL),
(177, 'Yesica Mariel Saldivar', '39124288', 'estudiante', 'Presente', 1, 57, '2023-06-14 13:48:36'),
(178, 'Ingrid Lujan Salinas', '43888105', 'estudiante', 'Presente', 1, 57, NULL),
(179, 'Mayra Anahi Bobadilla', '45171766', 'estudiante', 'Presente', 1, 57, NULL),
(180, 'Antonella Isabel Figueredo', '46105266', 'estudiante', 'Presente', 1, 57, '2023-06-12 13:29:42'),
(181, 'Francisco Ramon Rupp', '42803167', 'estudiante', 'Presente', 1, 57, NULL),
(182, 'Maria Magdalena Gomez', '40737764', 'estudiante', 'Presente', 1, 57, NULL),
(183, 'Esteban Alejandro Rodas', '42758083', 'estudiante', 'Presente', 1, 57, NULL),
(184, 'Giuliana Belen Benitez', '38575196', 'estudiante', 'Presente', 1, 57, NULL),
(185, 'Rodrigo Salvador Garcia', '34511695', 'empleado Ministerio de turismo', 'Presente', 1, 35, NULL),
(186, 'Jennifer Andrea Lopez', '46065696', 'estudiante', 'Presente', 1, 35, NULL),
(187, 'Susana Elizabeth Fernandez', '37110112', 'estudiante', 'Presente', 1, 57, NULL),
(188, 'Miguel Leonel Avalos', '14560432', 'municipalidad de clorinda', 'Presente', 1, 56, NULL),
(189, 'Carlos Quinteros', '43887522', '', 'Presente', 1, 35, '2023-06-22 12:42:56');

--
-- Disparadores `cursos`
--
DELIMITER $$
CREATE TRIGGER `crearcursos_capacitaciones` AFTER INSERT ON `cursos` FOR EACH ROW INSERT INTO auditoria(tabla, accion, new_value, usuario_id) VALUES ('cursos', 'INSERT', CONCAT('{"`id_cursos`":', new.`id_cursos`, '}'), 3)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `editarcursos_capacitaciones` AFTER UPDATE ON `cursos` FOR EACH ROW INSERT INTO auditoria(tabla, accion,old_value, new_value, usuario_id) VALUES ('cursos', 'UPDATE',CONCAT('{"`id_cursos`":', old.`id_cursos`, '}'), CONCAT('{"`id_cursos`":', new.`id_cursos`, '}'), 3)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos_fsa`
--

CREATE TABLE `departamentos_fsa` (
  `id_departamentos_fsa` int(11) NOT NULL,
  `descripcion_departamentos` varchar(244) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `departamentos_fsa`
--

INSERT INTO `departamentos_fsa` (`id_departamentos_fsa`, `descripcion_departamentos`) VALUES
(1, 'Bermejo'),
(2, 'Formosa'),
(3, 'Laishí'),
(4, 'Matacos'),
(5, 'Patiño'),
(6, 'Pilagás'),
(7, 'Pilcomayo'),
(8, 'Pirané'),
(9, 'Ramón Lista'),
(10, 'Veiticinco de Mayo'),
(11, 'Quitilipi'),
(12, 'Almirante Brown'),
(13, 'General Güemes'),
(14, 'San Fernando');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deptos_mintur`
--

CREATE TABLE `deptos_mintur` (
  `id_deptos_mintur` int(11) NOT NULL,
  `descriDepartamento` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `deptos_mintur`
--

INSERT INTO `deptos_mintur` (`id_deptos_mintur`, `descriDepartamento`) VALUES
(1, 'Logística'),
(2, 'Administración'),
(3, 'Central'),
(4, 'Terminal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dias_licencia`
--

CREATE TABLE `dias_licencia` (
  `id_dias_licencia` int(11) NOT NULL,
  `rango_ini` int(11) NOT NULL,
  `rango_fin` int(11) NOT NULL,
  `dias_licencia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `dias_licencia`
--

INSERT INTO `dias_licencia` (`id_dias_licencia`, `rango_ini`, `rango_fin`, `dias_licencia`) VALUES
(1, 1, 5, 14),
(2, 6, 10, 21),
(3, 11, 15, 28),
(4, 16, 20, 35),
(5, 21, 25, 42),
(6, 26, 50, 49);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `id_direccion` int(10) NOT NULL,
  `calle_direccion` varchar(244) DEFAULT NULL,
  `altura_direccion` varchar(244) DEFAULT NULL,
  `numero_casa` varchar(244) DEFAULT NULL,
  `manzana_casa` varchar(255) DEFAULT NULL,
  `numero_departamento` varchar(244) DEFAULT NULL,
  `rela_localidad_direccion` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`id_direccion`, `calle_direccion`, `altura_direccion`, `numero_casa`, `manzana_casa`, `numero_departamento`, `rela_localidad_direccion`) VALUES
(54, '', NULL, NULL, NULL, NULL, NULL),
(55, '', NULL, NULL, NULL, NULL, NULL),
(60, 'Formosa', NULL, NULL, NULL, NULL, 35),
(61, 'Formosa', NULL, NULL, NULL, NULL, 26),
(63, 'paraguay 520', NULL, NULL, NULL, NULL, 9),
(64, 'paraguay 520', NULL, NULL, NULL, NULL, 9),
(65, 'paraguay 520', NULL, NULL, NULL, NULL, 9),
(66, 'paraguay 520', NULL, NULL, NULL, NULL, 2),
(67, 'asdf', NULL, NULL, NULL, NULL, 16),
(68, 'Formosa', NULL, NULL, NULL, NULL, 18),
(69, 'su casa2', NULL, NULL, NULL, NULL, 35),
(70, 'paraguay al mil', NULL, NULL, NULL, NULL, 15),
(72, '', NULL, NULL, NULL, NULL, 35),
(73, '', NULL, NULL, NULL, NULL, 34),
(74, '', NULL, NULL, NULL, NULL, 22),
(76, '', NULL, NULL, NULL, NULL, 25),
(77, '', NULL, NULL, NULL, NULL, 24),
(78, '', NULL, NULL, NULL, NULL, 41),
(80, '', NULL, NULL, NULL, NULL, 5),
(81, '', NULL, NULL, NULL, NULL, 5),
(82, '', NULL, NULL, NULL, NULL, 9),
(83, '', NULL, NULL, NULL, NULL, 7),
(84, '', NULL, NULL, NULL, NULL, 2),
(85, '', NULL, NULL, NULL, NULL, 2),
(86, '', NULL, NULL, NULL, NULL, 1),
(87, '', NULL, NULL, NULL, NULL, 11),
(88, '', NULL, NULL, NULL, NULL, 6),
(89, '', NULL, NULL, NULL, NULL, 6),
(90, '', NULL, NULL, NULL, NULL, 8),
(91, '', NULL, NULL, NULL, NULL, 8),
(92, '', NULL, NULL, NULL, NULL, 4),
(93, '', NULL, NULL, NULL, NULL, 45),
(94, '', NULL, NULL, NULL, NULL, 43),
(95, '', NULL, NULL, NULL, NULL, 43),
(96, '', NULL, NULL, NULL, NULL, 44),
(97, '', NULL, NULL, NULL, NULL, 44),
(98, '', NULL, NULL, NULL, NULL, 56),
(99, '', NULL, NULL, NULL, NULL, 57),
(100, '', NULL, NULL, NULL, NULL, 58),
(101, '', NULL, NULL, NULL, NULL, 58),
(102, '', NULL, NULL, NULL, NULL, 61),
(103, '', NULL, NULL, NULL, NULL, 29),
(104, '', NULL, NULL, NULL, NULL, 30),
(105, '', NULL, NULL, NULL, NULL, 33),
(106, '', NULL, NULL, NULL, NULL, 31),
(107, '', NULL, NULL, NULL, NULL, 32),
(108, '', NULL, NULL, NULL, NULL, 18),
(109, '', NULL, NULL, NULL, NULL, 19),
(110, 'San Martín 769', NULL, NULL, NULL, NULL, 35),
(111, 'Maipú 259', NULL, NULL, NULL, NULL, 35),
(112, 'Av. Dr. Luis Gutnisky 2636', NULL, NULL, NULL, NULL, 35),
(113, 'Belgrano 13', NULL, NULL, NULL, NULL, 35),
(114, 'José María Uriburu 920', NULL, NULL, NULL, NULL, 35),
(115, 'Av. Dr. Luis Gutnisky 3754', NULL, NULL, NULL, NULL, 35),
(116, 'Corrientes 219', NULL, NULL, NULL, NULL, 35),
(117, 'Corrientes 219', NULL, NULL, NULL, NULL, 35),
(118, 'Junín 527', NULL, NULL, NULL, NULL, 35),
(119, 'San Martín 535', NULL, NULL, NULL, NULL, 35),
(120, 'San Martín 885', NULL, NULL, NULL, NULL, 35),
(121, 'Av. Dr. Luis Gutnisky 3906', NULL, NULL, NULL, NULL, 35),
(122, 'Barrio Sargento Cabral', NULL, NULL, NULL, NULL, 24),
(127, 'Barrio La Playa Chacra 80', NULL, NULL, NULL, NULL, 24),
(128, 'Barrio San Cayetano', NULL, NULL, NULL, NULL, 24),
(129, 'Barrio 8 de Diciembre', NULL, NULL, NULL, NULL, 24),
(130, 'Barrio La Playa Mz 2 Parcela 5', NULL, NULL, NULL, NULL, 24),
(131, 'Barrio Sargento Cabral', NULL, NULL, NULL, NULL, 24),
(132, 'Barrio La Plata', NULL, NULL, NULL, NULL, 24),
(133, '', NULL, NULL, NULL, NULL, 24),
(134, 'RP N°1 Camino a la Playa', NULL, NULL, NULL, NULL, 24),
(135, 'Barrio La Playa Quinta N°155', NULL, NULL, NULL, NULL, 24),
(136, 'RP N°1 Km 2 Camino a la Playa', NULL, NULL, NULL, NULL, 24),
(137, 'Calle 2 de Abril S/N - Barrio Don Bosco', NULL, NULL, NULL, NULL, 24),
(138, 'Barrio La Plata', NULL, NULL, NULL, NULL, 24),
(139, '12 de Octubre 1165', NULL, NULL, NULL, NULL, 56),
(140, 'Av. España 1252', NULL, NULL, NULL, NULL, 56),
(141, '12 de Octubre 1150', NULL, NULL, NULL, NULL, 56),
(142, 'Av. San Martín 122', NULL, NULL, NULL, NULL, 56),
(143, 'RN N°81 Acceso Oeste Km 1467', NULL, NULL, NULL, NULL, 1),
(145, 'Av. San Martín 250', NULL, NULL, NULL, NULL, 1),
(148, 'Barrio Loma', NULL, NULL, NULL, NULL, 1),
(149, '', NULL, NULL, NULL, NULL, 41),
(151, 'Buenos Aires y San Antonio', NULL, NULL, NULL, NULL, 2),
(152, 'Padre Bonino S/N ', NULL, NULL, NULL, NULL, 2),
(153, 'Belgrano y Saenz Peña', NULL, NULL, NULL, NULL, 2),
(154, 'RN N° 81 (Acceso a Ibarreta)', NULL, NULL, NULL, NULL, 2),
(155, 'Carlos Pellegrini y Av. 25 de Mayo', NULL, NULL, NULL, NULL, 30),
(156, '25 de Mayo y Tucumán', NULL, NULL, NULL, NULL, 30),
(157, 'Carlos Pellegrini y Esquiu ', NULL, NULL, NULL, NULL, 30),
(158, 'Av. San Martín 524', NULL, NULL, NULL, NULL, 30),
(159, 'Av. San Martín 540', NULL, NULL, NULL, NULL, 30),
(160, 'Ruta 1, camino a Villafañe (A 5 km de El Colorado) ', NULL, NULL, NULL, NULL, 30),
(161, 'Av. San Martín esq. Saavedra', NULL, NULL, NULL, NULL, 33),
(162, 'RP N°1 Acceso a Villafañe', NULL, NULL, NULL, NULL, 33),
(163, '', NULL, NULL, NULL, NULL, 33),
(165, 'RN N°86 y Av. Dr. Ortiz', NULL, NULL, NULL, NULL, 57),
(166, 'RN N°86 y Av. 25 de Mayo', NULL, NULL, NULL, NULL, 57),
(168, 'Av. San Martín S/N', NULL, NULL, NULL, NULL, 23),
(170, 'San Martín y Tucumán', NULL, NULL, NULL, NULL, 41),
(171, 'Av Degen, entre Fernando anaquin y salta ', NULL, NULL, NULL, NULL, 41),
(172, 'Salta S/N', NULL, NULL, NULL, NULL, 41),
(173, 'Roque Saenz Peña S/N', NULL, NULL, NULL, NULL, 29),
(174, 'Av. 9 de Julio S/N', NULL, NULL, NULL, NULL, 29),
(175, 'Sarmiento 949', NULL, NULL, NULL, NULL, 29),
(176, 'Av. Pringles y Fray Mamerto Esquiu', NULL, NULL, NULL, NULL, 29),
(192, 'Av. 25 de Mayo esq. Belgrano', NULL, NULL, NULL, NULL, 61),
(200, 'Av. San Martín N° 985', NULL, NULL, NULL, NULL, 56),
(201, 'Belgrano N°616', NULL, NULL, NULL, NULL, 35),
(202, 'España N°135 (2 y 4)', NULL, NULL, NULL, NULL, 35),
(205, 'Fortín Yunka Nº1595', NULL, NULL, NULL, NULL, 35),
(206, 'Italia Nº1137', NULL, NULL, NULL, NULL, 56),
(209, 'Av. 25 de Mayo Nº783', NULL, NULL, NULL, NULL, 35),
(210, 'Fotheringham Nº1546', NULL, NULL, NULL, NULL, 35),
(211, 'Fontana Nº662', NULL, NULL, NULL, NULL, 35),
(213, 'Pringles Nº650', NULL, NULL, NULL, NULL, 35),
(214, 'Mitre Nº222 (1)', NULL, NULL, NULL, NULL, 35),
(216, 'Padre Grotti Nº1165', NULL, NULL, NULL, NULL, 35),
(217, 'Fontana Nº766 (1º- 4 y 7)', NULL, NULL, NULL, NULL, 35),
(218, 'Av. 25 de Mayo Nº285', NULL, NULL, NULL, NULL, 35),
(219, 'España Nº729 (1)', NULL, NULL, NULL, NULL, 35),
(220, 'Fontana Nº466', NULL, NULL, NULL, NULL, 35),
(221, 'Fontana Nº1268', NULL, NULL, NULL, NULL, 35),
(222, '25 de Mayo y Colón', NULL, NULL, NULL, NULL, 57),
(228, 'Av. 25 de Mayo esq. San Martín', NULL, NULL, NULL, NULL, 35),
(229, 'Ubicado a la mano izquierda de la Ruta Nacional Nº 86 y Pueyrredón ', NULL, NULL, NULL, NULL, 57),
(230, 'Ubicado en la Escuela N°48 \"Domingo Bresanovich y Jacinto Somacal\"', NULL, NULL, NULL, NULL, 34),
(231, 'Hipólito Irigoyen 4555', NULL, NULL, NULL, NULL, 35),
(232, ' Trinidad González entre la Avenida Italia y Rómulo Amadey (pegado a la Comisaría Seccional Cuarta)', NULL, NULL, NULL, NULL, 35),
(233, 'Av. 25 de Mayo 314 (Aula 1 - Centro catequístico - Salón Alegría)', NULL, NULL, NULL, NULL, 35),
(234, '', NULL, NULL, NULL, NULL, 3),
(235, '', NULL, NULL, NULL, NULL, 22),
(236, 'Av. 25 de Mayo y Jorge Newbery (Predio del Ferrocarril)', NULL, NULL, NULL, NULL, 2),
(237, '', NULL, NULL, NULL, NULL, 5),
(238, 'San Martín 668', NULL, NULL, NULL, NULL, 35),
(239, ' Av. 25 de Mayo esq. Belgrano ', NULL, NULL, NULL, NULL, 35),
(241, 'Av. Néstor Kirchner S/N', NULL, NULL, NULL, NULL, 25),
(247, '', NULL, NULL, NULL, NULL, 24),
(248, '', NULL, NULL, NULL, NULL, 25),
(249, '', NULL, NULL, NULL, NULL, 34),
(250, '', NULL, NULL, NULL, NULL, 61),
(251, '', NULL, NULL, NULL, NULL, 2),
(252, '', NULL, NULL, NULL, NULL, 6),
(253, '', NULL, NULL, NULL, NULL, 29),
(254, 'Camping Municipal', NULL, NULL, NULL, NULL, 30),
(255, '', NULL, NULL, NULL, NULL, 57),
(256, '', NULL, NULL, NULL, NULL, 45),
(257, '', NULL, NULL, NULL, NULL, 43),
(258, '', NULL, NULL, NULL, NULL, 23),
(261, 'r', NULL, NULL, NULL, NULL, NULL),
(262, '', NULL, NULL, NULL, NULL, 18),
(263, '', NULL, NULL, NULL, NULL, 3),
(264, '', NULL, NULL, NULL, NULL, 18),
(265, '', NULL, NULL, NULL, NULL, 35),
(266, 'Roque Saenz Peña 1198', NULL, NULL, NULL, NULL, 56),
(267, 'El Porteñito a metros del cruce fronterizo Clorinda-Falcón', NULL, NULL, NULL, NULL, 56),
(268, '', NULL, NULL, NULL, NULL, 60),
(269, 'San Martín 1577', NULL, NULL, NULL, NULL, 35),
(270, 'Mza 64 Casa 5 B° Irigoyen', NULL, NULL, NULL, NULL, 35),
(271, 'Isla de Oro - Formosa', NULL, NULL, NULL, NULL, 35),
(272, 'San Martin  N°294', NULL, NULL, NULL, NULL, 35),
(273, '', NULL, NULL, NULL, NULL, 35),
(274, 'San Martín 294', NULL, NULL, NULL, NULL, 35),
(275, 'FORTÍN SOLEDAD', NULL, NULL, NULL, NULL, 1),
(276, 'Camping Municipal', NULL, NULL, NULL, NULL, 30),
(277, 'B° Bernardino Rivadavia', NULL, NULL, NULL, NULL, 35),
(278, 'Barrio San José', NULL, NULL, NULL, NULL, 24),
(280, '', NULL, NULL, NULL, NULL, 57),
(281, '', NULL, NULL, NULL, NULL, 1),
(283, '', NULL, NULL, NULL, NULL, 38),
(284, 'A 63 km de Capital (Boca Riacho Pilagá)', NULL, NULL, NULL, NULL, 35),
(285, '', NULL, NULL, NULL, NULL, 35),
(286, 'Fortín La Soledad', NULL, NULL, NULL, NULL, 1),
(287, 'Fortín La Soledad', NULL, NULL, NULL, NULL, 1),
(288, 'Fortín La Soledad', NULL, NULL, NULL, NULL, 1),
(289, 'Fortín La Soledad', NULL, NULL, NULL, NULL, 1),
(290, '', NULL, NULL, NULL, NULL, 30),
(291, '', NULL, NULL, NULL, NULL, 30),
(292, '', NULL, NULL, NULL, NULL, 30),
(293, '', NULL, NULL, NULL, NULL, 22),
(294, 'Santa Fe 248', NULL, NULL, NULL, NULL, 30),
(295, 'Sarmiento 79', NULL, NULL, NULL, NULL, 30),
(296, 'Rivadavia 402', NULL, NULL, NULL, NULL, 56),
(297, 'Ruta 11 Km 10 camino a Puerto Pilcomayo', NULL, NULL, NULL, NULL, 56),
(298, '.', NULL, NULL, NULL, NULL, 22),
(299, 'Ruta Nacional 86, Km 1561', NULL, NULL, NULL, NULL, 8),
(300, '', NULL, NULL, NULL, NULL, 24),
(301, '.', NULL, NULL, NULL, NULL, 18),
(302, '', NULL, NULL, NULL, NULL, 29),
(303, '', NULL, NULL, NULL, NULL, 30),
(305, '', NULL, NULL, NULL, NULL, 56),
(306, '', NULL, NULL, NULL, NULL, 30),
(307, '', NULL, NULL, NULL, NULL, 61),
(308, 'rr', NULL, NULL, NULL, NULL, 1),
(309, 'rony', NULL, NULL, NULL, NULL, 8),
(310, 'ronaldo', NULL, NULL, NULL, NULL, 8),
(311, 'r', NULL, NULL, NULL, NULL, 8),
(312, '', NULL, NULL, NULL, NULL, 29),
(313, '', NULL, NULL, NULL, NULL, 33),
(314, '', NULL, NULL, NULL, NULL, 7),
(315, '', NULL, NULL, NULL, NULL, 36),
(316, 'ronaldo', NULL, NULL, NULL, NULL, 8),
(317, '', NULL, NULL, NULL, NULL, 8),
(318, 'ronaldo', NULL, NULL, NULL, NULL, 8),
(319, 'ema', NULL, NULL, NULL, NULL, 8),
(320, '', NULL, NULL, NULL, NULL, 39),
(321, '', NULL, NULL, NULL, NULL, 24),
(322, '', NULL, NULL, NULL, NULL, 22),
(323, '', NULL, NULL, NULL, NULL, 7),
(324, '', NULL, NULL, NULL, NULL, 1),
(325, '', NULL, NULL, NULL, NULL, 34),
(326, '', NULL, NULL, NULL, NULL, 25),
(327, '', NULL, NULL, NULL, NULL, 42),
(328, '', NULL, NULL, NULL, NULL, 9),
(329, 'rony', NULL, NULL, NULL, NULL, 8),
(330, '', NULL, NULL, NULL, NULL, 43),
(331, 'ronaldo', NULL, NULL, NULL, NULL, 8),
(332, '323', NULL, NULL, NULL, NULL, 8),
(333, 'r', NULL, NULL, NULL, NULL, 7),
(334, 'r', NULL, NULL, NULL, NULL, 6),
(335, 'r', NULL, NULL, NULL, NULL, 6),
(336, 'rony', NULL, NULL, NULL, NULL, 6),
(340, '', NULL, NULL, NULL, NULL, 3),
(341, 'Av. del Labrador y S Bolivar 3611', NULL, NULL, NULL, NULL, 58),
(342, '', NULL, NULL, NULL, NULL, 57),
(343, 'Ruta N N° 81 s/n, entre calles Urquiza y Mosconi', NULL, NULL, NULL, NULL, 41),
(344, 'A 25 km de la ciudad de Formosa sobre la ruta Nacional N°11, a la altura del km 1201', NULL, NULL, NULL, NULL, 35),
(346, '.', NULL, NULL, NULL, NULL, 41),
(347, '', NULL, NULL, NULL, NULL, 35),
(350, NULL, NULL, NULL, NULL, NULL, NULL),
(356, 'dean funes', NULL, NULL, NULL, NULL, 35),
(357, 'dean funes 11111', NULL, NULL, NULL, NULL, 25),
(358, 'la casa de matias', NULL, NULL, NULL, NULL, 16),
(359, 'circuito 5', NULL, NULL, NULL, NULL, 35),
(360, 'Paraguay 520', NULL, NULL, NULL, NULL, 35),
(366, '', NULL, NULL, NULL, NULL, 24),
(367, 'Bergrano 1032, Formosa', NULL, NULL, NULL, NULL, 35),
(369, 'Hipólito Irigoyen casi Ruta Nacional N° 81	', NULL, NULL, NULL, NULL, 2),
(371, 'parag', NULL, NULL, NULL, NULL, 35),
(372, 'Paraguay 520', NULL, NULL, NULL, NULL, 35),
(373, '', NULL, NULL, NULL, NULL, 35),
(381, 'A20', NULL, NULL, NULL, NULL, 57),
(382, 'A63', NULL, NULL, NULL, NULL, 57),
(383, 'A78', NULL, NULL, NULL, NULL, 57),
(384, 'A80', NULL, NULL, NULL, NULL, 57),
(385, 'A83', NULL, NULL, NULL, NULL, 57),
(386, 'A84', NULL, NULL, NULL, NULL, 57),
(387, 'B02 ', NULL, NULL, NULL, NULL, 57),
(388, 'B60', NULL, NULL, NULL, NULL, 57),
(389, 'B63', NULL, NULL, NULL, NULL, 57),
(390, 'B65', NULL, NULL, NULL, NULL, NULL),
(391, 'Av. San Martin y Sargento Cabral', NULL, NULL, NULL, NULL, 57),
(398, NULL, NULL, NULL, NULL, NULL, 57),
(403, 'no se registró', NULL, NULL, NULL, NULL, 2),
(404, ' Av. 9 de Julio, P3613 Laguna Blanca, Formosa', NULL, NULL, NULL, NULL, 57),
(406, 'no se registró ', NULL, NULL, NULL, NULL, 23),
(407, 'no se registró ', NULL, NULL, NULL, NULL, 45),
(408, NULL, NULL, NULL, NULL, NULL, NULL),
(410, 'B° Juan Manuel de Rosas m190 n7', NULL, NULL, NULL, NULL, 35),
(411, NULL, NULL, NULL, NULL, NULL, NULL),
(412, NULL, NULL, NULL, NULL, NULL, NULL),
(413, NULL, NULL, NULL, NULL, NULL, NULL),
(414, NULL, NULL, NULL, NULL, NULL, NULL),
(415, NULL, NULL, NULL, NULL, NULL, NULL),
(416, NULL, NULL, NULL, NULL, NULL, NULL),
(417, NULL, NULL, NULL, NULL, NULL, NULL),
(418, NULL, NULL, NULL, NULL, NULL, NULL),
(419, NULL, NULL, NULL, NULL, NULL, NULL),
(420, NULL, NULL, NULL, NULL, NULL, NULL),
(421, NULL, NULL, NULL, NULL, NULL, NULL),
(422, NULL, NULL, NULL, NULL, NULL, NULL),
(423, NULL, NULL, NULL, NULL, NULL, NULL),
(424, NULL, NULL, NULL, NULL, NULL, NULL),
(425, NULL, NULL, NULL, NULL, NULL, NULL),
(426, NULL, NULL, NULL, NULL, NULL, NULL),
(427, NULL, NULL, NULL, NULL, NULL, NULL),
(428, NULL, NULL, NULL, NULL, NULL, NULL),
(429, NULL, NULL, NULL, NULL, NULL, NULL),
(430, NULL, NULL, NULL, NULL, NULL, NULL),
(431, NULL, NULL, NULL, NULL, NULL, NULL),
(432, NULL, NULL, NULL, NULL, NULL, NULL),
(433, NULL, NULL, NULL, NULL, NULL, NULL),
(434, NULL, NULL, NULL, NULL, NULL, NULL),
(435, NULL, NULL, NULL, NULL, NULL, NULL),
(436, NULL, NULL, NULL, NULL, NULL, NULL),
(437, NULL, NULL, NULL, NULL, NULL, NULL),
(438, NULL, NULL, NULL, NULL, NULL, NULL),
(439, NULL, NULL, NULL, NULL, NULL, NULL),
(440, NULL, NULL, NULL, NULL, NULL, NULL),
(441, 'no se registró ', NULL, NULL, NULL, NULL, 72),
(442, 'San Antonio2, Lote rural 65, Parcela4', NULL, NULL, NULL, NULL, 35),
(443, 'Ruta 81 km1377', NULL, NULL, NULL, NULL, 2),
(444, 'ministerio', NULL, NULL, NULL, NULL, 35),
(445, '', NULL, NULL, NULL, NULL, 25),
(446, '', NULL, NULL, NULL, NULL, 35),
(447, 'para', NULL, NULL, NULL, NULL, 1),
(448, 'Av. Maradona N°570', NULL, NULL, NULL, NULL, 35),
(449, '', NULL, NULL, NULL, NULL, 24),
(450, 'Villa del Carmen- Virginia  Paez y 2°', NULL, NULL, NULL, NULL, 35),
(451, '2 de Abril S/N -Herradura', NULL, NULL, NULL, NULL, 24),
(452, '', NULL, NULL, NULL, NULL, 29),
(453, '', NULL, NULL, NULL, NULL, NULL),
(454, '', NULL, NULL, NULL, NULL, NULL),
(455, '', NULL, NULL, NULL, NULL, NULL),
(456, 'Muratalla 1454', NULL, NULL, NULL, NULL, 35),
(457, 'Muratalla 1454', NULL, NULL, NULL, NULL, 35),
(458, 'ministerio', NULL, NULL, NULL, NULL, 2),
(459, 'uriburu 9801', NULL, NULL, NULL, NULL, 2),
(460, 'uriburu 9801', NULL, NULL, NULL, NULL, 2),
(461, 'uriburu 980', NULL, NULL, NULL, NULL, 35),
(462, 'sarmiento', NULL, NULL, NULL, NULL, 35),
(463, 'Barrio 20 de Julio Mz 60 Cs 17', NULL, NULL, NULL, NULL, 35),
(464, 'Muratalla 1454', NULL, NULL, NULL, NULL, 35),
(465, '-', NULL, NULL, NULL, NULL, 35),
(466, 'B° Villa del Carmen Mz 34 Pc 5', NULL, NULL, NULL, NULL, 35),
(467, 'Av. Sargento Cabral N° 955 B° Vial', NULL, NULL, NULL, NULL, 35),
(468, 'Jose Maria Cabezon 2551 B° San Juan II', NULL, NULL, NULL, NULL, 35),
(469, 'Lorenzo Winter 1348', NULL, NULL, NULL, NULL, 35),
(470, 'B° Juan Manuel de Rosas - Casa: 07 - Mz: 207.', NULL, NULL, NULL, NULL, 35),
(471, 'B° Cono Sur II - Mz: 70. - Casa: 20.', NULL, NULL, NULL, NULL, 35),
(472, 'Av. Gonzalez Lelong 1605 - Piso: 2 - Depto: 2.', NULL, NULL, NULL, NULL, 35),
(473, 'Av. Napoleon Uriburu 1686', NULL, NULL, NULL, NULL, 35),
(474, 'Napoleón Uriburu N° 780. Depto 3', NULL, NULL, NULL, NULL, 35),
(475, 'B° La Nueva Formosa. Mz : 68. C: 20.', NULL, NULL, NULL, NULL, 35),
(476, 'Mendoza 946. B° Itatí', NULL, NULL, NULL, NULL, 35),
(477, 'B° La Nueva Formosa. Mz: 47. C: 11.', NULL, NULL, NULL, NULL, 35),
(478, 'B° Malvinas. Mz: 10. C: 227.', NULL, NULL, NULL, NULL, 35),
(479, 'Maipu 2234. B° Fontana', NULL, NULL, NULL, NULL, 35),
(480, 'Fontana 926', NULL, NULL, NULL, NULL, 35),
(481, 'Fontana 826', NULL, NULL, NULL, NULL, 35),
(482, 'Av. 25 de Mayo 772', NULL, NULL, NULL, NULL, 35),
(483, 'Av. 25 de Mayo 718', NULL, NULL, NULL, NULL, 35),
(484, 'Av. 9 de Julio 36', NULL, NULL, NULL, NULL, 35),
(485, 'España 879', NULL, NULL, NULL, NULL, 35),
(486, 'Sarmiento 701', NULL, NULL, NULL, NULL, 35),
(487, 'Av. 9 de Julio 628', NULL, NULL, NULL, NULL, 35),
(488, 'Fontana 651', NULL, NULL, NULL, NULL, 35),
(489, 'Madariaga 356. B° San Francisco', NULL, NULL, NULL, NULL, 35),
(490, 'Fotheringham 353', NULL, NULL, NULL, NULL, 35),
(491, 'Rivadavia 1182. B° San Martin', NULL, NULL, NULL, NULL, 35),
(492, 'Clorinda', NULL, NULL, NULL, NULL, 56),
(493, 'Eva Peron', NULL, NULL, NULL, NULL, 33),
(494, 'Junin 1173', NULL, NULL, NULL, NULL, 35),
(495, 'Avellaneda y Laprida S/N', NULL, NULL, NULL, NULL, 57),
(496, 'Pringles 55', NULL, NULL, NULL, NULL, 35),
(497, 'Padre Grotti 1524', NULL, NULL, NULL, NULL, 35),
(498, 'Padre Grotti 1524', NULL, NULL, NULL, NULL, 35),
(499, 'Padre Grotti 1524', NULL, NULL, NULL, NULL, 35),
(500, 'Barrio Loma', NULL, NULL, NULL, NULL, 1),
(501, 'Barrio Eva Peron', NULL, NULL, NULL, NULL, 1),
(502, 'Ruta 81 km 1474', NULL, NULL, NULL, NULL, 1),
(503, 'Barrio Emeta', NULL, NULL, NULL, NULL, 1),
(507, 'Dean Funes 388', NULL, NULL, NULL, NULL, 35),
(508, 'Pellegrini y Esquiú', NULL, NULL, NULL, NULL, 30),
(509, 'Junín y Dean Funes', NULL, NULL, NULL, NULL, 35),
(510, 'Junín y Dean Funes ', NULL, NULL, NULL, NULL, 35),
(511, 'Saavedra 524', NULL, NULL, NULL, NULL, 35),
(512, 'Padre Patiño 296', NULL, NULL, NULL, NULL, 35),
(513, 'Mitre 99', NULL, NULL, NULL, NULL, 35),
(514, 'Avenida 9 de Julio N° 1234', NULL, NULL, NULL, NULL, 35),
(515, 'Moreno 1066 - Dpto D', NULL, NULL, NULL, NULL, 35),
(516, '', NULL, NULL, NULL, NULL, 35),
(517, '', NULL, NULL, NULL, NULL, 24),
(518, '', NULL, NULL, NULL, NULL, 24),
(519, '', NULL, NULL, NULL, NULL, 24),
(520, '', NULL, NULL, NULL, NULL, 24),
(521, '', NULL, NULL, NULL, NULL, 24),
(522, '', NULL, NULL, NULL, NULL, 24),
(523, '', NULL, NULL, NULL, NULL, 24),
(524, '', NULL, NULL, NULL, NULL, 24),
(525, '', NULL, NULL, NULL, NULL, 24),
(526, '', NULL, NULL, NULL, NULL, 24),
(527, '', NULL, NULL, NULL, NULL, 24),
(528, '', NULL, NULL, NULL, NULL, 24),
(529, '', NULL, NULL, NULL, NULL, 24),
(530, '', NULL, NULL, NULL, NULL, 24),
(531, '', NULL, NULL, NULL, NULL, 24),
(532, '', NULL, NULL, NULL, NULL, 24),
(533, '', NULL, NULL, NULL, NULL, 24),
(534, 'Mitre y Junín ', NULL, NULL, NULL, NULL, 35),
(535, 'Eva Perón 697', NULL, NULL, NULL, NULL, 35),
(536, 'España 702', NULL, NULL, NULL, NULL, 35),
(537, 'Av. 25 de Mayo 717', NULL, NULL, NULL, NULL, 35),
(538, 'España 590', NULL, NULL, NULL, NULL, 35),
(539, 'Barrio Guarda La Tosca', NULL, NULL, NULL, NULL, 1),
(540, 'Av. San Martín ', NULL, NULL, NULL, NULL, 1),
(541, 'Sobre Ruta 81', NULL, NULL, NULL, NULL, 1),
(542, 'Barrio Isla Dorada ', NULL, NULL, NULL, NULL, 1),
(543, '25 de Mayo y 9 de Julio ', NULL, NULL, NULL, NULL, 1),
(544, 'Av. San Martín ', NULL, NULL, NULL, NULL, 1),
(545, 'Sobre Ruta 81', NULL, NULL, NULL, NULL, 1),
(546, 'Av. Belgrano 336', NULL, NULL, NULL, NULL, 1),
(547, 'Av. San Martín ', NULL, NULL, NULL, NULL, 1),
(548, 'Av. Entre Ríos esquina Saavedra ', NULL, NULL, NULL, NULL, 1),
(549, 'Barrio El Talar ', NULL, NULL, NULL, NULL, 1),
(550, 'Barrio Centro ', NULL, NULL, NULL, NULL, 1),
(551, 'Barrio Centro ', NULL, NULL, NULL, NULL, 1),
(552, 'Barrio Centro ', NULL, NULL, NULL, NULL, 1),
(553, 'Barrio Centro ', NULL, NULL, NULL, NULL, 1),
(554, 'Barrio Nueva Esperanza ', NULL, NULL, NULL, NULL, 1),
(556, 'Moreno 475', NULL, NULL, NULL, NULL, 35),
(557, 'Hipólito Yrigoyen 222', NULL, NULL, NULL, NULL, 35),
(558, 'Moreno 220', NULL, NULL, NULL, NULL, 35),
(559, 'Moreno 70 ', NULL, NULL, NULL, NULL, 35),
(560, 'Av. Napoleón Uriburu 185', NULL, NULL, NULL, NULL, 35),
(561, 'Av. González Lelong 218', NULL, NULL, NULL, NULL, 35),
(562, 'Belgrano 143', NULL, NULL, NULL, NULL, 35),
(563, 'Belgrano 926', NULL, NULL, NULL, NULL, 35),
(564, 'Rivadavia 99', NULL, NULL, NULL, NULL, 35),
(565, 'Belgrano 918', NULL, NULL, NULL, NULL, 35),
(566, 'Rivadavia 724 (peatonal) ', NULL, NULL, NULL, NULL, 35),
(567, 'Av. 25 de Mayo 271', NULL, NULL, NULL, NULL, 35),
(568, 'Av. 25 de Mayo 287', NULL, NULL, NULL, NULL, 35),
(569, 'Moreno y Av. 25 de Mayo ', NULL, NULL, NULL, NULL, 35),
(570, 'Av. 25 de Mayo, esquina Jorge Newbery', NULL, NULL, NULL, NULL, 2),
(571, 'Av. San Martin esquina Hipólito Irigoyen ', NULL, NULL, NULL, NULL, 24),
(572, 'Ruta Provincial 1', NULL, NULL, NULL, NULL, 24),
(573, 'Herradura', NULL, NULL, NULL, NULL, 24),
(574, '', NULL, NULL, NULL, NULL, 24),
(575, '', NULL, NULL, NULL, NULL, 24),
(576, '', NULL, NULL, NULL, NULL, 24),
(577, '', NULL, NULL, NULL, NULL, 24),
(578, '', NULL, NULL, NULL, NULL, 24),
(579, '', NULL, NULL, NULL, NULL, 24),
(580, '', NULL, NULL, NULL, NULL, 24),
(583, 'Ruta Nacional 11 km 1160 Barrio Pompeya', NULL, NULL, NULL, NULL, 35),
(584, 'Av. 25 de Mayo 506', NULL, NULL, NULL, NULL, 35),
(585, 'Brandsen 546', NULL, NULL, NULL, NULL, 35),
(586, 'Padre Patiño 1009', NULL, NULL, NULL, NULL, 35),
(587, 'José María Uriburu 142', NULL, NULL, NULL, NULL, 35),
(588, 'Paseo Costanero Vuelta Fermoza', NULL, NULL, NULL, NULL, 35),
(589, 'Paseo Costanero Vuelta Fermoza', NULL, NULL, NULL, NULL, 35),
(590, 'Paseo Costanero Vuelta Fermoza', NULL, NULL, NULL, NULL, 35),
(591, 'Salta 106 Este', NULL, NULL, NULL, NULL, 35),
(592, 'Av. Pellegrini y 25 de Mayo', NULL, NULL, NULL, NULL, 30),
(593, 'Av. San Martín y Martín Fierro ', NULL, NULL, NULL, NULL, 30),
(594, 'Buenos Aires 77', NULL, NULL, NULL, NULL, 30),
(595, 'Av. Pellegrini s/n', NULL, NULL, NULL, NULL, 30),
(596, 'Buenos Aires 60', NULL, NULL, NULL, NULL, 30),
(597, 'Buenos Aires 60', NULL, NULL, NULL, NULL, 30),
(609, 'Belgrano 544', NULL, NULL, NULL, NULL, 35),
(610, 'Belgrano 293', NULL, NULL, NULL, NULL, 35),
(611, 'Av. González Lelong 124', NULL, NULL, NULL, NULL, 35),
(612, 'San Martín 668', NULL, NULL, NULL, NULL, 35),
(613, 'Av. 25 de Mayo 55', NULL, NULL, NULL, NULL, 35),
(614, 'Av. 25 de Mayo 177', NULL, NULL, NULL, NULL, 35),
(615, '', NULL, NULL, NULL, NULL, 1),
(616, 'B° San José Obrero- Padre Patiño N°2500', NULL, NULL, NULL, NULL, 35),
(617, 'FORTIN SOLEDAD', NULL, NULL, NULL, NULL, 1),
(618, 'FORTIN SOLEDAD', NULL, NULL, NULL, NULL, 1),
(619, '', NULL, NULL, NULL, NULL, 1),
(620, '', NULL, NULL, NULL, NULL, 1),
(621, '', NULL, NULL, NULL, NULL, 1),
(622, '', NULL, NULL, NULL, NULL, 1),
(623, '', NULL, NULL, NULL, NULL, 1),
(624, 'FORTIN SOLEDAD', NULL, NULL, NULL, NULL, 1),
(625, 'FORTIN SOLEDAD', NULL, NULL, NULL, NULL, 1),
(626, 'FORTIN SOLEDAD', NULL, NULL, NULL, NULL, 1),
(627, 'FORTIN SOLEDAD', NULL, NULL, NULL, NULL, 1),
(628, 'FORTIN SOLEDAD', NULL, NULL, NULL, NULL, 1),
(629, 'herradura', NULL, NULL, NULL, NULL, 24),
(630, 'herradura', NULL, NULL, NULL, NULL, 24),
(631, 'herradura', NULL, NULL, NULL, NULL, 24),
(633, 'Av. San Martin N°130', NULL, NULL, NULL, NULL, 1),
(634, '', NULL, NULL, NULL, NULL, 35),
(635, 'Aeropuerto Internacional de Formosa', NULL, NULL, NULL, NULL, 35),
(636, '', NULL, NULL, NULL, NULL, 35),
(637, '', NULL, NULL, NULL, NULL, 35),
(638, 'Posadas N° 620. Dpto 3', NULL, NULL, NULL, NULL, 35),
(639, 'Mz 47 - Casa: 19 - Illia 2', NULL, NULL, NULL, NULL, 35),
(640, 'B° Eva Perón Mz 119 - Casa: 11', NULL, NULL, NULL, NULL, 56),
(641, '-', NULL, NULL, NULL, NULL, 35),
(642, 'Mz 45 - Casa: 14 - B° Ilia', NULL, NULL, NULL, NULL, 35),
(643, 'Mz 11 - Casa: 7 B° 8 de octubre', NULL, NULL, NULL, NULL, 35),
(644, 'Juan Jose Silva 1226', NULL, NULL, NULL, NULL, 35),
(645, 'Saavedra 110', NULL, NULL, NULL, NULL, 35),
(646, 'Belgrano 613', NULL, NULL, NULL, NULL, 35),
(647, 'España 213', NULL, NULL, NULL, NULL, 35),
(648, '20 de Junio casi Belgrano ', NULL, NULL, NULL, NULL, 30),
(649, 'Buenos Aires s/n', NULL, NULL, NULL, NULL, 30),
(650, '', NULL, NULL, NULL, NULL, 30),
(651, '', NULL, NULL, NULL, NULL, NULL),
(652, '', NULL, NULL, NULL, NULL, 30),
(653, '', NULL, NULL, NULL, NULL, 30),
(654, '', NULL, NULL, NULL, NULL, 30),
(655, 'Av. San Martín 691', NULL, NULL, NULL, NULL, NULL),
(656, 'Av. San Martin 284', NULL, NULL, NULL, NULL, 30),
(657, 'Cayo Novoa Gil y Nestor Kirchner Parque Acuatico', NULL, NULL, NULL, NULL, 30),
(658, 'Av. San Martin 498', NULL, NULL, NULL, NULL, 30),
(659, 'San Juan y Sarmiento ', NULL, NULL, NULL, NULL, 30),
(660, 'Buenos Aires N° 28', NULL, NULL, NULL, NULL, NULL),
(661, 'Av. San Martín y Mitre ', NULL, NULL, NULL, NULL, 30),
(662, 'Mendoza, Godoy Cruz ', NULL, NULL, NULL, NULL, 30),
(663, 'Av. 25 de Mayo entre Fontana y Alberdi ', NULL, NULL, NULL, NULL, 30),
(664, 'Santa Fe s/n ', NULL, NULL, NULL, NULL, 30),
(665, 'Buenos Aires N° 60 ', NULL, NULL, NULL, NULL, 30),
(666, 'San Juan y Sarmiento ', NULL, NULL, NULL, NULL, 30),
(667, 'San Juan s/n ', NULL, NULL, NULL, NULL, NULL),
(668, 'Av ejercito libertador 357', NULL, NULL, NULL, NULL, 43);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `educacion`
--

CREATE TABLE `educacion` (
  `id_educacion` int(11) NOT NULL,
  `descriEducacion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `educacion`
--

INSERT INTO `educacion` (`id_educacion`, `descriEducacion`) VALUES
(1, 'Primaria'),
(2, 'Secundaria'),
(3, 'Terciaria'),
(4, 'Universitario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa_colectivo`
--

CREATE TABLE `empresa_colectivo` (
  `id_empresa_colectivo` int(11) NOT NULL,
  `nombre_empresa` varchar(255) NOT NULL,
  `boleteria_empresa` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empresa_colectivo`
--

INSERT INTO `empresa_colectivo` (`id_empresa_colectivo`, `nombre_empresa`, `boleteria_empresa`) VALUES
(1, 'Godoy S.R.L.', NULL),
(2, 'Puerto Tirol SRL', NULL),
(3, 'Cruz Del Norte', NULL),
(4, 'Flecha Bus', NULL),
(5, 'Aguila Dorada Bis', NULL),
(6, 'El Pulqui', NULL),
(7, 'Tigre Iguazu', NULL),
(8, 'El Cometa', NULL),
(9, 'Andesmar', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadistica`
--

CREATE TABLE `estadistica` (
  `id` int(11) NOT NULL,
  `n_personas` int(11) NOT NULL,
  `n_autos` int(11) NOT NULL,
  `n_motos` int(11) NOT NULL,
  `n_bicicletas` int(11) NOT NULL,
  `dia_estadistica` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_actividad`
--

CREATE TABLE `estado_actividad` (
  `id_estado` int(10) NOT NULL,
  `rela_tipo_estado` int(10) DEFAULT NULL,
  `rela_estado_alojamiento` int(10) DEFAULT NULL,
  `rela_estado_agencia` int(10) DEFAULT NULL,
  `rela_estado_prestador` int(10) DEFAULT NULL,
  `rela_estado_guia` int(10) DEFAULT NULL,
  `rela_estado_evento` int(10) DEFAULT NULL,
  `rela_estado_salones` int(11) DEFAULT NULL,
  `rela_estado_transportes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado_actividad`
--

INSERT INTO `estado_actividad` (`id_estado`, `rela_tipo_estado`, `rela_estado_alojamiento`, `rela_estado_agencia`, `rela_estado_prestador`, `rela_estado_guia`, `rela_estado_evento`, `rela_estado_salones`, `rela_estado_transportes`) VALUES
(41, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL),
(45, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL),
(47, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL),
(49, 1, 11, NULL, NULL, NULL, NULL, NULL, NULL),
(50, 1, 12, NULL, NULL, NULL, NULL, NULL, NULL),
(51, 1, 13, NULL, NULL, NULL, NULL, NULL, NULL),
(52, 1, 14, NULL, NULL, NULL, NULL, NULL, NULL),
(57, 1, 16, NULL, NULL, NULL, NULL, NULL, NULL),
(58, 1, 17, NULL, NULL, NULL, NULL, NULL, NULL),
(59, 1, 18, NULL, NULL, NULL, NULL, NULL, NULL),
(60, 1, 19, NULL, NULL, NULL, NULL, NULL, NULL),
(61, 1, 20, NULL, NULL, NULL, NULL, NULL, NULL),
(62, 9, 21, NULL, NULL, NULL, NULL, NULL, NULL),
(63, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL),
(64, 2, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(65, 1, 24, NULL, NULL, NULL, NULL, NULL, NULL),
(66, 1, 25, NULL, NULL, NULL, NULL, NULL, NULL),
(67, 1, 26, NULL, NULL, NULL, NULL, NULL, NULL),
(68, 1, 27, NULL, NULL, NULL, NULL, NULL, NULL),
(69, 6, 28, NULL, NULL, NULL, NULL, NULL, NULL),
(70, 1, 29, NULL, NULL, NULL, NULL, NULL, NULL),
(71, 9, 30, NULL, NULL, NULL, NULL, NULL, NULL),
(72, 9, 31, NULL, NULL, NULL, NULL, NULL, NULL),
(73, 1, 32, NULL, NULL, NULL, NULL, NULL, NULL),
(75, 1, 34, NULL, NULL, NULL, NULL, NULL, NULL),
(78, 1, 37, NULL, NULL, NULL, NULL, NULL, NULL),
(80, 1, 39, NULL, NULL, NULL, NULL, NULL, NULL),
(81, 1, 40, NULL, NULL, NULL, NULL, NULL, NULL),
(82, 1, 41, NULL, NULL, NULL, NULL, NULL, NULL),
(83, 1, 42, NULL, NULL, NULL, NULL, NULL, NULL),
(84, 1, 43, NULL, NULL, NULL, NULL, NULL, NULL),
(85, 1, 44, NULL, NULL, NULL, NULL, NULL, NULL),
(86, 2, 45, NULL, NULL, NULL, NULL, NULL, NULL),
(87, 1, 46, NULL, NULL, NULL, NULL, NULL, NULL),
(88, 1, 47, NULL, NULL, NULL, NULL, NULL, NULL),
(89, 1, 48, NULL, NULL, NULL, NULL, NULL, NULL),
(90, 1, 49, NULL, NULL, NULL, NULL, NULL, NULL),
(91, 1, 50, NULL, NULL, NULL, NULL, NULL, NULL),
(92, 6, 51, NULL, NULL, NULL, NULL, NULL, NULL),
(94, 1, 53, NULL, NULL, NULL, NULL, NULL, NULL),
(95, 1, 54, NULL, NULL, NULL, NULL, NULL, NULL),
(97, 1, 56, NULL, NULL, NULL, NULL, NULL, NULL),
(99, 5, 58, NULL, NULL, NULL, NULL, NULL, NULL),
(100, 1, 59, NULL, NULL, NULL, NULL, NULL, NULL),
(101, 5, 60, NULL, NULL, NULL, NULL, NULL, NULL),
(102, 3, 61, NULL, NULL, NULL, NULL, NULL, NULL),
(103, 6, 62, NULL, NULL, NULL, NULL, NULL, NULL),
(104, 1, 63, NULL, NULL, NULL, NULL, NULL, NULL),
(105, 1, 64, NULL, NULL, NULL, NULL, NULL, NULL),
(117, 1, NULL, 7, NULL, NULL, NULL, NULL, NULL),
(118, 1, NULL, 8, NULL, NULL, NULL, NULL, NULL),
(119, 1, NULL, 9, NULL, NULL, NULL, NULL, NULL),
(122, 1, NULL, 12, NULL, NULL, NULL, NULL, NULL),
(123, 1, NULL, 13, NULL, NULL, NULL, NULL, NULL),
(126, 1, NULL, 16, NULL, NULL, NULL, NULL, NULL),
(127, 1, NULL, 17, NULL, NULL, NULL, NULL, NULL),
(128, 1, NULL, 18, NULL, NULL, NULL, NULL, NULL),
(130, 1, NULL, 20, NULL, NULL, NULL, NULL, NULL),
(131, 1, NULL, 21, NULL, NULL, NULL, NULL, NULL),
(133, 1, NULL, 23, NULL, NULL, NULL, NULL, NULL),
(134, 1, NULL, 24, NULL, NULL, NULL, NULL, NULL),
(135, 1, NULL, 25, NULL, NULL, NULL, NULL, NULL),
(136, 1, NULL, 26, NULL, NULL, NULL, NULL, NULL),
(137, 1, NULL, 27, NULL, NULL, NULL, NULL, NULL),
(138, 5, NULL, 28, NULL, NULL, NULL, NULL, NULL),
(139, 1, NULL, 29, NULL, NULL, NULL, NULL, NULL),
(145, 1, NULL, NULL, 4, NULL, NULL, NULL, NULL),
(146, 1, NULL, NULL, 5, NULL, NULL, NULL, NULL),
(147, 1, NULL, NULL, 6, NULL, NULL, NULL, NULL),
(148, 1, NULL, NULL, 7, NULL, NULL, NULL, NULL),
(149, 1, NULL, NULL, 8, NULL, NULL, NULL, NULL),
(150, 1, NULL, NULL, 9, NULL, NULL, NULL, NULL),
(151, 1, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(152, 1, NULL, NULL, 11, NULL, NULL, NULL, NULL),
(153, 1, NULL, NULL, 12, NULL, NULL, NULL, NULL),
(154, 1, 65, NULL, NULL, NULL, NULL, NULL, NULL),
(155, 1, NULL, NULL, 13, NULL, NULL, NULL, NULL),
(156, 1, NULL, NULL, 14, NULL, NULL, NULL, NULL),
(158, 1, NULL, NULL, 16, NULL, NULL, NULL, NULL),
(159, 5, NULL, NULL, 17, NULL, NULL, NULL, NULL),
(161, 1, NULL, NULL, 19, NULL, NULL, NULL, NULL),
(162, 5, NULL, NULL, 20, NULL, NULL, NULL, NULL),
(163, 1, NULL, NULL, 21, NULL, NULL, NULL, NULL),
(164, 9, NULL, NULL, 22, NULL, NULL, NULL, NULL),
(165, 1, NULL, NULL, 23, NULL, NULL, NULL, NULL),
(166, 1, NULL, NULL, 24, NULL, NULL, NULL, NULL),
(167, 9, NULL, NULL, 25, NULL, NULL, NULL, NULL),
(168, 9, NULL, NULL, 26, NULL, NULL, NULL, NULL),
(169, 9, NULL, NULL, 27, NULL, NULL, NULL, NULL),
(170, 9, NULL, NULL, 28, NULL, NULL, NULL, NULL),
(171, 2, 66, NULL, NULL, NULL, NULL, NULL, NULL),
(172, 2, 67, NULL, NULL, NULL, NULL, NULL, NULL),
(173, 6, 68, NULL, NULL, NULL, NULL, NULL, NULL),
(178, 1, 72, NULL, NULL, NULL, NULL, NULL, NULL),
(185, 1, NULL, NULL, 32, NULL, NULL, NULL, NULL),
(186, 9, 77, NULL, NULL, NULL, NULL, NULL, NULL),
(187, 2, 78, NULL, NULL, NULL, NULL, NULL, NULL),
(188, 1, NULL, NULL, 33, NULL, NULL, NULL, NULL),
(189, 1, 79, NULL, NULL, NULL, NULL, NULL, NULL),
(193, 1, NULL, 31, NULL, NULL, NULL, NULL, NULL),
(194, 1, 80, NULL, NULL, NULL, NULL, NULL, NULL),
(195, 1, NULL, NULL, 37, NULL, NULL, NULL, NULL),
(196, 1, NULL, NULL, 38, NULL, NULL, NULL, NULL),
(197, 1, NULL, NULL, 39, NULL, NULL, NULL, NULL),
(198, 1, NULL, NULL, 40, NULL, NULL, NULL, NULL),
(199, 1, NULL, NULL, 41, NULL, NULL, NULL, NULL),
(200, 1, NULL, NULL, 42, NULL, NULL, NULL, NULL),
(201, 1, NULL, NULL, 43, NULL, NULL, NULL, NULL),
(202, 1, 81, NULL, NULL, NULL, NULL, NULL, NULL),
(203, 1, 82, NULL, NULL, NULL, NULL, NULL, NULL),
(204, 1, 83, NULL, NULL, NULL, NULL, NULL, NULL),
(205, 1, 84, NULL, NULL, NULL, NULL, NULL, NULL),
(206, 1, 85, NULL, NULL, NULL, NULL, NULL, NULL),
(207, 1, 86, NULL, NULL, NULL, NULL, NULL, NULL),
(208, 1, 87, NULL, NULL, NULL, NULL, NULL, NULL),
(209, 1, 88, NULL, NULL, NULL, NULL, NULL, NULL),
(210, 1, 89, NULL, NULL, NULL, NULL, NULL, NULL),
(211, 1, 90, NULL, NULL, NULL, NULL, NULL, NULL),
(212, 1, 91, NULL, NULL, NULL, NULL, NULL, NULL),
(213, 1, 92, NULL, NULL, NULL, NULL, NULL, NULL),
(214, 1, 93, NULL, NULL, NULL, NULL, NULL, NULL),
(215, 1, 94, NULL, NULL, NULL, NULL, NULL, NULL),
(216, 1, 95, NULL, NULL, NULL, NULL, NULL, NULL),
(217, 1, 96, NULL, NULL, NULL, NULL, NULL, NULL),
(218, 1, 97, NULL, NULL, NULL, NULL, NULL, NULL),
(219, 1, 98, NULL, NULL, NULL, NULL, NULL, NULL),
(220, 1, 99, NULL, NULL, NULL, NULL, NULL, NULL),
(221, 1, 100, NULL, NULL, NULL, NULL, NULL, NULL),
(222, 1, 101, NULL, NULL, NULL, NULL, NULL, NULL),
(223, 1, 102, NULL, NULL, NULL, NULL, NULL, NULL),
(224, 1, 103, NULL, NULL, NULL, NULL, NULL, NULL),
(234, 1, NULL, NULL, 46, NULL, NULL, NULL, NULL),
(235, 1, NULL, NULL, 47, NULL, NULL, NULL, NULL),
(236, 1, NULL, NULL, 48, NULL, NULL, NULL, NULL),
(237, 1, NULL, NULL, 49, NULL, NULL, NULL, NULL),
(238, 1, NULL, NULL, 50, NULL, NULL, NULL, NULL),
(239, 1, NULL, NULL, 51, NULL, NULL, NULL, NULL),
(240, 1, NULL, NULL, 52, NULL, NULL, NULL, NULL),
(241, 1, NULL, NULL, 53, NULL, NULL, NULL, NULL),
(242, 1, NULL, NULL, 54, NULL, NULL, NULL, NULL),
(243, 1, NULL, NULL, 55, NULL, NULL, NULL, NULL),
(244, 1, NULL, NULL, 56, NULL, NULL, NULL, NULL),
(245, 1, NULL, NULL, 57, NULL, NULL, NULL, NULL),
(246, 1, NULL, NULL, 58, NULL, NULL, NULL, NULL),
(248, 1, NULL, NULL, NULL, NULL, NULL, NULL, 5),
(249, 9, NULL, NULL, NULL, NULL, NULL, NULL, 6),
(250, 9, NULL, NULL, NULL, NULL, NULL, NULL, 7),
(251, 1, NULL, NULL, NULL, NULL, NULL, NULL, 8),
(252, 1, NULL, NULL, 59, NULL, NULL, NULL, NULL),
(253, 1, 106, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `festivales`
--

CREATE TABLE `festivales` (
  `id_festivales` int(11) NOT NULL,
  `nombre_festival` varchar(255) NOT NULL,
  `descripcion` longtext NOT NULL,
  `fecha` date DEFAULT NULL,
  `rela_localidad` int(11) NOT NULL,
  `rela_tipo_servicio` int(11) NOT NULL,
  `fecha_edit_general` datetime DEFAULT NULL,
  `idoneo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `festivales`
--

INSERT INTO `festivales` (`id_festivales`, `nombre_festival`, `descripcion`, `fecha`, `rela_localidad`, `rela_tipo_servicio`, `fecha_edit_general`, `idoneo`) VALUES
(11, 'Fiesta del Pomelo', 'Colectivos (No esta 100% confirmado)----------------\r\n1)-Puerto Tirol: VIERNES 9 - SÁBADO 10:------------------*FORMOSA - LAGUNA BLANCA: Terminal de Ómnibus - Min. de Turismo horarios de salida: (9:30 - 15:00 - 17:00 - 19:00 - 20:00). Horarios de regreso: 04:45 - 05:00  ---------------------------------------------------------- *RIACHO HE-HÉ  - LAGUNA BLANCA: Salidas desde las 19:00 frecuencias cada hora.-------------------- DOMINGO 11 *FORMOSA - LAGUNA BLANCA: Terminal de Ómnibus - Min. de Turismo horarios de salida: 9:30 - 15:00  - 19:00 - 20:00. regresos: afuera del predio al finalizar shows.  -------------------------------*RIACHO HE-HÉ  - LAGUNA BLANCA: Salidas desde las 19:00 frecuencias cada hora.-------------------------------  2)-Nueva Godoy: VIERNES 9 - SÁBADO 10 - DOMINGO 11  *FORMOSA - LAGUNA BLANCA: Terminal de Ómnibus - Min. de Turismo... horarios de salida: (18:00 - 20:00).  (10:00 salida por clorinda).\r\n------*GRAL. GÜEMES - LAGUNA BLANCA: 11:00hs ------GRAL. BELGRANO - LAGUNA BLANCA: 16:00 HS *REGRESOS: afuera del predio al finalizar los shows.  3)-CRUCERO DEL SUR... VIERNES 9 - SÁBADO 10 - DOMINGO 11  *FORMOSA - LAGUNA BLANCA: Terminal de Ómnibus - Min. de Turismo... horarios de salida: (17:00 y 19:00) .---------------------------------------*RIACHO HE-HÉ  - LAGUNA BLANCA: Salidas desde ( 18:30 - 19:00 - 20:00 - 21:00 y 22:00) -----------------*CLORINDA - LAGUNA BLANCA ( 18:00 - 19:00 - 20:00 - 21:00 y 22:00) ------------------------------ ----------------*LAGUNA NAINECK - LAGUNA BLANCA (19:00 - 20:00 y 23:00)  -----------------------------------------------------*EL ESPINILLO - LAGUNA BLANCA  ( 18:00 - 19:00 - 20:00 - 21:00 ) ---------------------------*BUENA VISTA - LAGUNA BLANCA  ( 18:20 - 19:20 - 20:20 - 21:20 ) REGRESOS: afuera del predio al finalizar shows                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ', '2022-09-09', 398, 1, '2022-08-30 09:24:45', 'no se registró');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastronomia`
--

CREATE TABLE `gastronomia` (
  `id_gastronomia` int(11) NOT NULL,
  `denominacion_gastro` varchar(255) DEFAULT NULL,
  `observacion_gastro` longtext DEFAULT NULL,
  `rela_direccion_gastro` int(11) DEFAULT NULL,
  `dias_horarios` varchar(255) DEFAULT NULL,
  `date_updated_gastronomia` datetime DEFAULT NULL,
  `caracteristicas_gastronomia` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `gastronomia`
--

INSERT INTO `gastronomia` (`id_gastronomia`, `denominacion_gastro`, `observacion_gastro`, `rela_direccion_gastro`, `dias_horarios`, `date_updated_gastronomia`, `caracteristicas_gastronomia`) VALUES
(3, 'COMEDOR EL DOMI', 'PASTAS Y MINUTAS', 381, 'LUNES A LUNES / 8:00HS A 15:00HS 17:00HS A 00HS ', '2022-08-19 18:56:32', 'VIANDAS, DELIVERY, ALMUERZO, CENA '),
(4, 'TANQUE BAR', '', 382, 'LUNES A VIERNES / 20:00 HS A 04:OO HS AM', '2022-08-19 19:14:48', 'CERVEZA AETESANAL Y MINUTAS'),
(5, 'COMEDOR LORE', '', 383, 'LUNES A SABADOS / 08:00 HS A 14:00 HS', '2022-08-19 19:17:51', 'VIANDAS, DESAYUNO, ALMUERZO TRADICIONALES'),
(6, 'PUEBLO RESTO PUB', '', 384, 'MARTES A DOMINGO / 11:00 HS A 14:30 HS Y 19:00 HS A 01:00 HS AM', '2022-08-19 19:21:38', 'VENTAS DE COMIDAD, BEBIDAS'),
(7, 'FOOD PARK DUBLIN', '', 385, 'SABADO A DOMINGO /  ', '2022-08-19 19:24:15', 'VENTA DE BEBIDAS, COMIDAS'),
(8, 'LA MAMA DEL SANDWICH', 'SERVICIO DE EVENTOS', 386, 'LUNES A DOMINGO / 20:00 HS A 00:00 HS', '2022-08-19 19:28:51', 'SANDWICH, PIZZAS, HAMBURGUESAS'),
(9, 'COTILLÓN Y COMEDOR', 'EXCEPCIÓN DE VIANDAS ', 387, 'MARTES A DOMINGO / 17:00 A 23:00', '2022-08-19 19:31:56', 'VENTA DE COMIDAS Y COTILLÓN'),
(10, 'PANADERÍA Y CONFITERÍA MAXI', 'ANEXO FOTOCOPIAS', 388, 'LUNES A VIERNES  SABADOS / 08:00 A 12:00  16:00 A 20:00 08:00 A 12:00', '2022-08-19 19:33:16', 'CAFETERÍA'),
(11, '58 CAFÉ GOURMET', '', 389, '', '2022-08-19 19:34:02', 'CAFETERÍA/ ANEXO BAR'),
(12, 'laguna blanca', '', 390, 'LUNES A DOMINGO / 18:00 A 04:00', '2022-08-22 08:10:23', 'GASTRONÓMICO/ PIZZA Y MINUTAS'),
(13, 'Elaboración de Productos Regionales', '', 403, 'no se registró', '2022-08-30 12:00:00', 'miel, queso, cervezas, Dulce de leche,  mermeladas'),
(14, 'El Nuevo Fortín', 'Plato de la casa: Surubí relleno a la crema de limón', 480, 'Lunes a Lunes de 12 a 14:30 hs y de 21 a 00 hs', '2023-04-18 09:26:51', 'Gastronomía en general - Especialidad en pescados'),
(15, 'Sr. Pancho', '', 481, 'Lunes a Lunes de 18 a 01 hs', '2023-04-18 09:29:49', 'Panchería'),
(16, 'ADN', 'Especialidad: café y sandwich', 482, 'Lunes a Lunes de 07 a 13 hs y de 16:30 a 00:30 hs', '2023-04-18 09:33:46', 'Cafetería, almuerzo y cena'),
(17, 'Pancholo Vip Resto Bar', 'Especialidad: Hamburguesa Monster', 483, 'Lunes a Lunes de 07:30 a 16 hs y de 18 a 02 hs', '2023-04-18 09:38:36', 'Minutas'),
(18, 'MP Comidas', 'Motomandados', 484, 'Lunes a Lunes de 12 a 03 hs', '2023-04-18 09:52:48', 'Minutas'),
(19, 'Verona Pizzeria-Bar', 'Trabaja con Pedidos Ya.', 485, 'Lunes a Sábado de 11:30 a 15 hs/ Jueves a Martes de 20 a 01 hs', '2023-04-18 09:58:43', 'Gastronomía en general - Especialidad en pizzas a la piedra'),
(20, 'Punto Norte', '', 486, 'Lunes a Viernes de 07 a 00 hs/ Sábado 09 a 00 hs/ Domingo 16 a 00 hs', '2023-04-18 10:03:30', 'Kiosco Autoservicio '),
(21, 'Lord Pizzería', 'Horno a leña/ Trabaja con Pedidos Ya', 487, 'Jueves a Martes de 19:30 a 00:30 hs', '2023-04-18 10:09:42', 'Gastronomía en general - Especialidad en pizzas a la piedra'),
(22, 'El Oso Bar', 'Trabaja con Pedidos Ya/ Mejor Stand en \"Formosa Da Gusto\"', 488, 'Jueves a Martes de 19:30 a 00:30 hs', '2023-04-18 10:11:57', 'Minutas'),
(26, 'SPUB', 'Pelotero-juegos para niños. Formas de pago: Mercado pago-efectivo-debito                                                      ', 507, 'Jueves a Domingo 17 a 01 hs', '2023-04-26 11:56:03', 'Minutas-cervezas-tragos-gaseosas '),
(27, 'Branca ', 'Todos los medios de pago', 509, 'Miercoles a Lunes 18 a 00 hs.', '2023-04-26 11:58:32', 'Minutas- Bebidas (tragos, cervezas industriales, gaseosas, jugos)'),
(28, 'Mini Branca', 'Todos los medios de pago', 510, 'Miercoles a Lunes 18 a 00 hs.', '2023-04-26 12:01:18', 'Minutas-tragos-meriendas'),
(29, 'Club 27', 'todos los medios de pago', 511, 'Martes a Domingo 17 a 02 hs', '2023-04-26 12:03:46', 'Sandwiches de miga-snack-golosinas-gaseosas-jugos-cervezas'),
(30, 'Capitán Milanesa', 'Medios de pago: mercado pago-débito-onda-efectivo. Moto mandado- ya voy- speedy', 512, 'Lunes a Lunes 10 a 14 hs. y 19 a 00 hs.', '2023-04-26 12:07:44', 'Milanesas-lomos-picadas-hamburguesas-sandwiches- papas,batata y mandioca fritas.'),
(31, 'Indigo Coffe Bar', 'Todos los medios de pago. Servicios para eventos (catering) ', 513, 'Lunes a lunes 07:30 a 15 hs. 17 a 00 hs.', '2023-04-26 12:11:52', 'Minutas- cafetería- menú del día- tragos- menú a la carta- cerveza artesanal.'),
(32, 'Nando comidas al paso', 'Medios de pagos todos. Pedidos ya', 534, 'Lunes a lunes 18 a 00 hs', '2023-04-27 10:10:49', 'Minutas '),
(33, 'La Benich ', 'Todos los medios de pago. ', 535, 'Miércoles a lunes 10 a 13 hs y 18 a 20 hs', '2023-04-27 10:13:17', 'Minutas-menú a la carta- bebidas (tragos-licuados)'),
(34, 'Bonafide', 'Medios de pagos todos. Moto mandado', 536, 'Lunes a viernes 07 a 22 hs- Sábados, Domingos y feriados 08 22 hs', '2023-04-27 10:16:07', 'Cafetería-golosinas-chocolates-sándwiches.'),
(35, 'Café Martinez', 'Todos los medios de pago. Moto mandados.', 537, 'Lunes a viernes 6:30 a 13 hs-Lunes a jueves 16 a 22 hs- sabados y domingos 8 a 13 hs-viernes y sábados 16 a 23 hs y domingos 16 a 22 hs', '2023-04-27 10:21:05', 'Cafetería- desayunos-sándwiches. '),
(36, 'Barra Bar', '', 538, 'Miércoles a domingos 20 a 02 hs.', '2023-04-27 10:22:37', 'Minutas- bebidas '),
(37, 'Don Chachilo ', '', 539, '', '2023-04-27 10:40:29', 'Delivery'),
(38, 'La Terraza ', '', 540, '', '2023-04-27 10:41:22', 'Restaurante '),
(39, 'Alegui', '', 541, '', '2023-04-27 10:42:33', 'Restaurante '),
(40, 'El Correntino ', '', 542, '', '2023-04-27 10:43:45', 'Delivery'),
(41, 'Puro Gusto ', '', 543, '', '2023-04-27 10:44:43', 'Bar'),
(42, 'Resto Bar ', '', 544, '', '2023-04-27 10:45:26', 'Bar'),
(43, 'Brother\'s Bar ', '', 545, '', '2023-04-27 10:46:26', 'Bar'),
(44, 'Licuados y jugos Ady ', '', 546, '', '2023-04-27 10:47:28', 'Bar '),
(45, 'Titiro Heladería ', '', 547, '', '2023-04-27 10:48:17', 'Heladería '),
(46, 'Copetín al paso Los Amigos ', '', 548, '-', '2023-04-27 10:50:34', 'Comedor y delivery '),
(47, 'Soto Gabriela ', '', 549, '', '2023-04-27 10:51:25', 'Delivery'),
(48, 'Rapi Compras ', '', 550, '', '2023-04-27 10:52:22', 'Bar'),
(49, 'Estilo Criollo ', '', 551, '', '2023-04-27 10:53:13', 'Bar '),
(50, 'Bien Campero Bar ', '', 552, '', '2023-04-27 10:53:48', 'Bar'),
(51, 'Bulgaria ', '', 553, '', '2023-04-27 10:54:19', 'Bar'),
(52, 'La Morocha ', '', 554, '', '2023-04-27 10:55:08', 'Comedor '),
(54, 'Hakuna Matata ', 'Pelotero y juegos para niños. Todos los medios de pago ', 556, 'Lunes a jueves de 17 a 00 hs viernes sábados y domingos hasta las 02 hs', '2023-04-28 10:19:37', 'Minutas- tragos- gaseosas-cervezas artesanal e industrial- meriendas'),
(55, 'La Strada', 'Pizzas caseras - Especialidad: Pizza Super Strada', 557, 'Martes a Domingos de 20 hs a 01 hs', '2023-04-28 10:20:40', 'Pizzería Italiana'),
(56, 'Santo Remedio ', 'Todos los medios de pago. ', 558, 'Martes a sábados 19 a 23 hs. ', '2023-04-28 10:21:35', 'Minutas y bebidas en general. Delivery'),
(57, 'Garage de la Cerveza ', 'Moto mandado. Todos los medios de pago', 559, 'Viernes y sábados 20:30 a 04 hs', '2023-04-28 10:25:39', 'Minutas- cervezas- eventos (bandas en vivo)'),
(58, 'Totti 2', 'Especialidad: pizzas', 560, 'Lunes a Lunes de 19 hs a 01 hs', '2023-04-28 10:26:08', 'Rotisería'),
(59, 'Tío Checho', 'Todos los medios de pago. Moto mandados.', 561, 'Martes a domingos 20 a 01 Hs y sábados 20 a 02 Hs. ', '2023-04-28 10:29:06', 'Minutas-Bebidas (cerveza-gaseosas).Patio cervecero '),
(60, 'Cascabel Resto Bar', 'Especialidad: Pastas, Ñoquis, Ravioles', 562, 'Lunes a Lunes de 08 hs a 00 hs', '2023-04-28 10:28:54', 'Comida casera/regional'),
(61, 'Sushi Time', 'Especialidad: Sushi', 563, 'Lunes a Sábados de 8:30 hs a 12 hs y de 18 hs a 21 hs ', '2023-04-28 10:31:48', 'Sandwiches, jugos, sushi'),
(62, 'Baruc Resto Bar y Café', 'Moto mandado. Patio ', 564, 'Lunes a viernes 7:30 a 15 hs y 17 a 20:30/ Miércoles a sábado (Bar) 18 a 01 hs', '2023-04-28 10:32:20', 'Cafetería-panadería-viandas-minutas-menú del día. Tragos, cervezas.'),
(63, 'Copetín Paradise', 'Especialidad: Empanadas', 565, 'Lunes a Sábado de 06 hs a 22 hs/Domingos de 08 hs a 16 hs', '2023-04-28 10:34:47', 'Rotisería'),
(64, 'Copetín Paradise ', 'Medios de pago: efectivo y débito. ', 566, 'Lunes a sábados de 06 a 22 hs. ', '2023-04-28 10:38:38', 'Cafetería-minutas-menú del día-bebidas en Gral. '),
(65, 'Romagus ', 'Todos los medios de pago. ', 567, 'Lunes a sábados 08 a 03 hs Domingos de 17 a 03 hs', '2023-04-28 10:41:23', 'Poli rubro-cafetería- gaseosas- sándwiches en Gral.- cervezas. '),
(66, 'Il Viale', 'Todos los medios de pago. Moto mandados.', 568, 'Lunes a viernes 07 a 00 hs y sábados y domingos 07 a 01 hs.', '2023-04-28 10:44:16', 'Cafetería en Gral.- minutas- cervezas- gaseosas-tragos- panadería '),
(67, 'Cascote ', 'Todos los medios de pago. Moto mandados-Speedy', 569, 'Lunes a lunes 07 a 00:30 hs', '2023-04-28 10:48:49', 'Cafetería- menú a la carta- Bebidas (cervezas-tragos-gaseosas)'),
(68, 'Don Espíndola', '', 571, 'Lunes a Lunes ', '2023-05-04 10:20:56', ''),
(69, 'Parrilla Don Raul', '', 572, '', '2023-05-04 10:22:03', ''),
(70, 'Panadería Pan Caliente ', '', 573, '.', '2023-05-17 10:42:39', ''),
(71, 'Delicias Express', '', 574, '', '2023-05-04 10:23:52', 'Rotisería- delivery '),
(72, 'Luke\'i Drugstore', '', 575, '', '2023-05-04 10:25:15', ''),
(73, 'La Pastelería de Naty Delicias', '', 576, '', '2023-05-04 10:27:05', 'Tortas artesanales-Desayunos. Mesa dulce para eventos. '),
(74, 'Hamburguesería y Kiosco Emy ', '', 577, '', '2023-05-04 10:28:14', 'Minutas y productos comestibles en Gral.'),
(75, 'Copetín Wanda', '', 578, '', '2023-05-04 10:29:00', ''),
(76, 'Z Pizzería ', '', 579, '', '2023-05-04 10:30:05', 'Pizzas y empanadas fritas y al horno.'),
(77, 'Mary comidas ', '', 580, '', '2023-05-04 10:30:52', 'Minutas en Gral-delivery'),
(78, 'Lo de Victor Parrilla y Resto', '', 583, 'Lunes-martes-jueves y viernes 11 a 15 hs y 19 a 23 hs. Sábado medio día y noche y Domingos medio día ', '2023-05-04 18:19:38', 'Parrilla (Sábados y domingos)/platos elaborados-minutas-pastas-bebidas en Gral.'),
(79, 'Green/Guapaletas', 'Especialidad: rolls de canela, mbeyú, budines, café', 584, 'Martes a Domingos de 08 hs a 22 hs', '2023-05-05 09:58:15', 'Cafetería/Helados'),
(80, 'Sweets - Delivery de postres', 'Especialidad: Postre 3 leches, porciones de torta, alfajores, café', 585, 'Martes a Jueves de 09 hs a 13 hs y de 17 hs a 01 hs/Viernes a Domingos de 13 hs a 01 hs', '2023-05-05 10:03:36', 'Cafetería, postres'),
(81, 'Fabrizio Drinks & Restó', 'Especialidad: Empanadas y Pizzas caseras de la casa', 586, 'Lunes a Viernes de 09 hs a 14 hs y de 19 hs a 00 hs/Sábado de 07 hs a 01 hs/Domingos de 07 hs a 12 hs', '2023-05-05 10:09:38', 'Rotisería'),
(82, 'Chempanadas', 'Especialidad: Empanadas', 587, 'Lunes a Viernes de 10 hs a 14 hs y de 19:30 hs a 23 hs/Sábado de 19:30 hs a 23 hs', '2023-05-05 10:13:15', 'Rotisería'),
(83, 'Paseo Alma Verde', '', 588, 'Lunes a Lunes de 10 hs a 02 hs', '2023-05-05 10:17:50', 'Comida Regional'),
(84, 'Ribera', 'Con Reserva (whatsapp)', 589, 'Jueves a Sábados ALmuerzo y Cena/Domingo almuerzo', '2023-05-05 10:21:18', 'Comida Regional'),
(85, 'Baldomero', '', 590, 'Martes a Sábados desde las 19:30 hs/Domingos desde las 12 hs', '2023-05-05 10:24:14', 'Patio cervecero - Salón Restaurante - Heladería'),
(86, 'Tatané Bar', '', 591, 'Miércoles a Domingos desde las 18 hs', '2023-05-05 10:28:27', 'Cervecería'),
(87, 'Sabores Resto Bar', '', 592, 'Medio dia y noche', '2023-05-05 11:47:05', 'Resto bar-parrilla-confitería-heladería '),
(88, 'La Esquina Club', '', 593, 'todos los días desde las 19 hs', '2023-05-05 11:49:20', 'Restaurante-confitería '),
(89, 'Rotisería Bren ', '', 594, 'A partir de las 19 hs.', '2023-05-05 11:51:02', 'Rotisería y heladería '),
(90, 'El Quincho Comedor ', '', 595, 'Todos los días desde las 9 hs.', '2023-05-05 11:53:05', 'Servicio de viandas '),
(91, 'Bocato Resto Bar ', '', 596, 'A partir de las 19 hs.', '2023-05-05 11:55:13', ''),
(92, 'El Bar ', '', 597, 'Jueves a domingos de 20 a 04 hs.', '2023-05-05 11:56:50', 'restaurante-bar'),
(93, 'don Kilin  ', 'Juegos para niños', 609, 'Lunes a lunes de 18 a 02 hs.', '2023-05-10 08:29:15', 'Minutas-tragos y bebidas en gral.'),
(94, 'La Dulce Esquina', '', 610, 'Repostería-dulces-facturas-licuados ', '2023-05-10 08:36:08', ''),
(95, 'Pizzería EL Jazmín ', 'Delivery- todos los medios de pagos', 611, 'Lunes a lunes 20 a 01 hs.', '2023-05-10 08:38:32', 'Pizzas-minutas-bebidas en gral. '),
(96, 'Rosa Guaru ', 'Pedidos ya-spedy. Todos los medios de pago', 612, 'Martes a domingos 18 a 00 hs (cocina) Fines de semana hasta las 01 hs venta de tragos hasta las 02 hs', '2023-05-10 08:42:04', 'Minutas-tragos propios y de autor-cervezas industriales. '),
(97, 'Tano Marino ', 'Delivery- todos los medios de pagos', 613, 'Lunes a lunes 11 a 15 hs y 20 a 00 hs', '2023-05-10 08:49:20', 'Pastas- pescados- menú a la carta- Bife Moggia- surubí relleno- pescados de mar(frititos y filet)'),
(98, 'Paradise Pizza Bar', 'Motos mandados. Todos los medios de pago. ', 614, 'Lunes a lunes 09 a 14:30 hs y 17:30 a 00:30 hs', '2023-05-10 08:52:19', 'Pizzas (20 variedades)- minutas en gral. Bebidas (gaseosas y cervezas artesanales)'),
(99, 'Estancias Los Zorzales', '', 629, '', '2023-05-17 10:58:50', ''),
(100, 'Las Tanitas', '', 630, '', '2023-05-17 10:59:29', ''),
(101, 'Don Santiago ', '', 631, '', '2023-05-17 10:59:56', ''),
(102, 'Fritas', 'Delivery- moto mandado. todos los medios de pagos', 645, 'Lunes a sábados 9 a 13 hs y 17 a 21 hs', '2023-05-31 09:11:19', 'Licuados-gaseosas- cervezas industriales-sandwiches de miga, de frances con salame- pebetes-snacks en gral- tostadas'),
(103, 'hook Drugstore', 'Delivery-Todos los medios de pago. ', 646, 'Lunes a lunes 24 hs', '2023-05-31 09:21:51', 'Cafetería- sándwiches-Bebidas (licuados-gaseosas-cervezas). '),
(104, 'Centro Bar', 'Delivery-moto mandado. Medios de pago: débito-efectivo', 647, 'Lunes a sábados 8 a 12 hs y 17:30 a 21:30 hs y domingos 17:30 a 21 hs', '2023-05-31 09:26:19', 'Cafetería-minutas-postres-licuados-Mbeyu'),
(105, 'Mano\'s comidas ', '', 648, '19 hs', '2023-05-31 09:35:28', 'Comedor-restaurante'),
(106, 'La Casona del Tío Anselmo ', 'Delivery', 649, '20 a 00 hs', '2023-05-31 09:39:13', 'Pizzería '),
(107, 'La Picadita \"El Colorado\" ', '', 650, '', '2023-05-31 09:42:15', 'Comidas caseras '),
(108, 'El Asadito ', '', 651, '', '2023-05-31 09:53:55', 'comidas rápidas para llevar'),
(109, 'Lo de Tincho \"Rotisería\"', '', 652, '', '2023-05-31 09:55:57', 'Rotisería '),
(110, 'Tokar Express ', '', 653, '19 hs ', '2023-05-31 09:57:59', ''),
(111, 'Date el gusto-comidas caseras ', '', 654, 'desde las 20 hs', '2023-05-31 10:02:57', 'Comidas caseras para llevar'),
(112, 'Comedor Don Veron ', '', 655, '', '2023-05-31 10:04:36', 'Restaurante'),
(113, 'El Gran Pastini ', '', 656, '', '2023-05-31 10:06:18', ''),
(114, 'Dublin café-bar', '', 657, 'Martes a domingos ', '2023-05-31 10:08:59', ''),
(115, 'El Hangar Restó ', '', 658, '', '2023-05-31 10:13:33', ''),
(116, 'Rotisería Angela ', 'Delivery ', 659, '', '2023-05-31 10:16:10', 'Pizzería '),
(117, 'Dulces cositas-pastelería ', '', 660, '7 a 12 hs y 16 a 20 hs', '2023-05-31 10:18:07', 'Pastelería (desayuno-merienda) '),
(118, 'Joha Cakes-Pastelería-Panadería ', '', 661, '', '2023-05-31 10:20:56', ''),
(119, 'Sos Drink ', '', 662, '', '2023-05-31 10:22:37', 'Venta de bebidas y comidas '),
(120, 'Viandas Saludables ', 'Coordinar por whatsapp ', 663, 'lunes a viernes 8 a 13 hs. ', '2023-05-31 10:24:59', ''),
(121, 'Helados Polijub ', '', 664, 'lunes a viernes 12 a 22 hs- sábados y domingos hasta las 22 hs', '2023-05-31 10:33:17', 'Anexo cafetería '),
(122, 'Venecia Heladería ', '', 665, 'lunes a lunes 9 a 11:30 hs y 16 a 00 hs', '2023-05-31 10:48:02', 'Desayunos y meriendas '),
(123, 'Grido El Colorado ', 'Delivery al whatsapp 3705085190', 666, '12 a 00 hs', '2023-05-31 10:49:36', ''),
(124, 'Helados Willy ', '', 667, '8 a 23 hs', '2023-05-31 10:50:39', 'Heladería ');

--
-- Disparadores `gastronomia`
--
DELIMITER $$
CREATE TRIGGER `borrargastronomia` AFTER DELETE ON `gastronomia` FOR EACH ROW INSERT INTO auditoria(tabla, accion,old_value, usuario_id) VALUES ('gastronomia', 'DELETE',CONCAT('{"`id_gastronomia`":', old.`id_gastronomia`, '}'), 23)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `creargastronomia` AFTER INSERT ON `gastronomia` FOR EACH ROW INSERT INTO auditoria(tabla, accion, new_value, usuario_id) VALUES ('gastronomia', 'INSERT', CONCAT('{"`id_gastronomia`":', new.`id_gastronomia`, '}'), 23)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `editargastronomia` AFTER UPDATE ON `gastronomia` FOR EACH ROW INSERT INTO auditoria(tabla, accion,old_value, new_value, usuario_id) VALUES ('gastronomia', 'UPDATE',CONCAT('{"`id_gastronomia`":', old.`id_gastronomia`, '}'), CONCAT('{"`id_gastronomia`":', new.`id_gastronomia`, '}'), 59)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo_trabajo`
--

CREATE TABLE `grupo_trabajo` (
  `id_grupo_trabajo` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guias`
--

CREATE TABLE `guias` (
  `id_guias` int(11) NOT NULL,
  `cuit_guias` varchar(244) NOT NULL,
  `rela_tipo_guias` int(10) DEFAULT NULL,
  `rela_personas_guias` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habilitacion_municipal`
--

CREATE TABLE `habilitacion_municipal` (
  `id_habi_municipal` int(11) NOT NULL,
  `descripcion` varchar(244) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `habilitacion_municipal`
--

INSERT INTO `habilitacion_municipal` (`id_habi_municipal`, `descripcion`) VALUES
(1, 'Si'),
(2, 'No'),
(3, 'En Trámite'),
(4, 'Se Desconoce');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `licencias`
--

CREATE TABLE `licencias` (
  `id_licencias` int(11) NOT NULL,
  `fecha_ini` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `dias_restante` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `rela_personal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `licencias`
--

INSERT INTO `licencias` (`id_licencias`, `fecha_ini`, `fecha_fin`, `dias_restante`, `estado`, `rela_personal`) VALUES
(26, '2023-04-12', '2023-04-13', 12, 1, 12),
(27, '2023-03-20', '2023-03-23', 15, 1, 13),
(28, '2022-12-20', '2023-01-01', 0, 1, 14),
(29, '2022-12-26', '2023-01-31', 10, 1, 15),
(30, '2022-02-17', '2022-03-04', 9, 1, 16),
(31, '2022-05-16', '2022-05-27', 41, 1, 17),
(32, '2023-02-20', '2023-03-23', 15, 1, 18),
(33, '2023-01-05', '2023-01-06', 12, 1, 19),
(34, '2023-01-23', '2023-01-31', 14, 1, 20),
(35, '2023-03-06', '2023-03-27', 19, 1, 21),
(36, '2018-01-29', '2018-02-02', 49, 1, 22),
(37, '2022-11-22', '2022-12-02', 28, 1, 23),
(38, '2021-12-15', '2022-01-04', 19, 1, 24),
(39, '2023-04-10', '2023-04-17', 7, 1, 25),
(40, '2023-01-09', '2023-01-18', 27, 1, 26),
(41, '2022-10-12', '2022-11-09', 14, 1, 27),
(42, '0001-01-01', '0001-01-01', 0, 1, 28),
(43, '2022-02-24', '2022-03-11', 4, 1, 29),
(44, '2023-02-22', '2023-02-24', 11, 1, 30),
(45, '2023-01-09', '2023-01-20', 4, 1, 31),
(46, '2023-03-08', '2023-03-17', 6, 1, 32),
(47, '2023-01-16', '2023-02-14', 0, 1, 33),
(48, '0001-01-01', '0001-01-01', 0, 1, 34),
(49, '0001-01-01', '0001-01-01', 0, 1, 35),
(50, '2023-02-16', '2023-02-24', 16, 1, 36),
(51, '0001-01-01', '0001-01-01', 0, 1, 37),
(52, '2023-01-09', '2023-01-31', 4, 1, 38),
(53, '2022-02-07', '2022-02-25', 3, 1, 39),
(54, '2023-03-06', '2023-03-21', 0, 1, 40),
(55, '2022-11-14', '2022-11-21', 6, 1, 41),
(56, '2023-01-03', '2023-01-19', 1, 1, 42),
(57, '2022-01-03', '2022-01-07', 9, 1, 43),
(58, '2023-01-03', '2023-02-07', 1, 1, 44),
(59, '2023-05-02', '2023-05-06', 0, 1, 45),
(60, '2021-10-12', '2022-03-03', 0, 1, 46),
(61, '0001-01-01', '0001-01-01', 0, 1, 47),
(62, '0001-01-01', '0001-01-01', 0, 1, 48),
(63, '2023-04-24', '2023-06-05', 0, 1, 49),
(64, '2023-05-16', '2023-06-02', 16, 1, 50),
(65, '2023-04-10', '2023-04-19', 0, 1, 51);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidad`
--

CREATE TABLE `localidad` (
  `id_localidad` int(10) NOT NULL,
  `nombre_localidad` varchar(244) NOT NULL,
  `codigo_postal` int(11) DEFAULT NULL,
  `rela_provincia` int(10) NOT NULL,
  `rela_departamento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `localidad`
--

INSERT INTO `localidad` (`id_localidad`, `nombre_localidad`, `codigo_postal`, `rela_provincia`, `rela_departamento`) VALUES
(1, 'Las Lomitas', NULL, 1, 5),
(2, 'Ibarreta', NULL, 1, 5),
(3, 'Comandante Fontana', NULL, 1, 5),
(4, 'Villa General Güemes', NULL, 1, 5),
(5, 'Estanislao del Campo', NULL, 1, 5),
(6, 'Pozo del Tigre', NULL, 1, 5),
(7, 'General Manuel Belgrano', NULL, 1, 5),
(8, 'San Martin 2', NULL, 1, 5),
(9, 'Fortín Lugones', NULL, 1, 5),
(10, 'Subteniente Perín', NULL, 1, 5),
(11, 'Posta Cambio Zalazar', NULL, 1, 5),
(12, 'Colonia Sarmiento', NULL, 1, 5),
(13, 'Juan G. Bazán', NULL, 1, 5),
(14, 'Bartolomé de las Casas', NULL, 1, 5),
(15, 'El Recreo', NULL, 1, 5),
(16, 'San Martín 1', NULL, 1, 5),
(17, 'Fortín Sargento 1º Leyes', NULL, 1, 5),
(18, 'Laguna Yema', NULL, 1, 1),
(19, 'Los Chiriguanos', NULL, 1, 1),
(20, 'Pozo de Maza', NULL, 1, 1),
(21, 'Pozo del Mortero', NULL, 1, 1),
(22, 'Misión San Francisco de Laishi', NULL, 1, 3),
(23, 'General Lucio V. Mansilla', NULL, 1, 3),
(24, 'Herradura', NULL, 1, 3),
(25, 'Villa Escolar', NULL, 1, 3),
(26, 'Tatané', NULL, 1, 3),
(27, 'El Potrillo', NULL, 1, 9),
(28, 'General Mosconi', NULL, 1, 9),
(29, 'Pirané', NULL, 1, 8),
(30, 'El Colorado', NULL, 1, 8),
(31, 'Palo Santo', NULL, 1, 8),
(32, 'Villa Dos Trece', NULL, 1, 8),
(33, 'Mayor Vicente Villafañe', NULL, 1, 8),
(34, 'Colonia Pastoril', NULL, 1, 2),
(35, 'Formosa', NULL, 1, 2),
(36, 'Gran Guardia', NULL, 1, 2),
(37, 'Mariano Boedo', NULL, 1, 2),
(38, 'Mojón de Fierro', NULL, 1, 2),
(39, 'San Hilario', NULL, 1, 2),
(40, 'Villa del Carmen', NULL, 1, 2),
(41, 'Ingeniero Guillermo N. Juárez ', NULL, 1, 4),
(42, 'El Espinillo', NULL, 1, 6),
(43, 'Misión Tacaaglé', NULL, 1, 6),
(44, 'Tres Lagunas', NULL, 1, 6),
(45, 'Buena Vista', NULL, 1, 6),
(46, 'Portón Negro', NULL, 1, 6),
(47, 'Laguna Gallo', NULL, 1, 6),
(56, 'Clorinda', NULL, 1, 7),
(57, 'Laguna Blanca', NULL, 1, 7),
(58, 'Laguna Naick Neck', NULL, 1, 7),
(59, 'Palma Sola', NULL, 1, 7),
(60, 'Puerto Pilcomayo', NULL, 1, 7),
(61, 'Riacho He He', NULL, 1, 7),
(62, 'Riacho Negro', NULL, 1, 7),
(63, 'Siete Palmas', NULL, 1, 7),
(64, 'El Quebracho', NULL, 1, 9),
(65, 'Banco Payaguá', NULL, 1, 3),
(66, 'Resistencia', NULL, 2, 14),
(67, 'Machagai', NULL, 2, 10),
(68, 'Quitilipi', NULL, 2, 11),
(69, 'Pampa del Infierno', NULL, 2, 12),
(70, 'Taco Pozo', NULL, 2, 12),
(71, 'Retiro', NULL, 24, NULL),
(72, 'El Chorro', 3636, 1, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `museo`
--

CREATE TABLE `museo` (
  `id_museo` int(11) NOT NULL,
  `nombre_museo` varchar(244) NOT NULL,
  `horario_dia_museo` varchar(244) DEFAULT NULL,
  `rela_direccion` int(11) DEFAULT NULL,
  `descripcion_museo` longtext DEFAULT NULL,
  `idoneo_museo` varchar(244) DEFAULT NULL,
  `date_updated_museo` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `museo`
--

INSERT INTO `museo` (`id_museo`, `nombre_museo`, `horario_dia_museo`, `rela_direccion`, `descripcion_museo`, `idoneo_museo`, `date_updated_museo`) VALUES
(3, 'Casa de la Artesanía', 'Lunes a Viernes turno mañana 8:00 a 12:00, turno tarde 16:00 a 19:00. Sábados, por la mañana 09:00 a 12:00', 228, '', 'Víctor Falcón', NULL),
(4, 'Museo Regional del Nordeste Formoseño', 'Horarios de atención: lunes a viernes de 8 a 12 hs y de 13 a 17 hs; sábados y domingos de 9 a 11 hs y de 15 a 17 hs. Horarios especiales para la Fiesta del Pomelo: Sábado 10 y domingo 11 de septiembre, de 9 a 12 h y de 13 a 20 hs.', 229, 'En la actualidad el museo cubre una superficie de 3.900 m2y en sus instalaciones ofrece, además de las salas de exposición, sala de conferencias, sanitarios, office, depósito administrativo, bar, estacionamiento, cisternas, parquización y un lago artificial.\r\nEl acervo del museo comprende documentos, correspondencia epistolar, uniformes y vestimentas, monedas y billetes, enseres domésticos, carruajes, artesanías, cuadros, instrumentos de labranza, muebles, aparatos de distinta épocas y reproducciones.\r\nEl abordaje temático se desarrolla en el sentido de reconstrucción colectiva de la memoria. Comprende los siguientes aspectos:\r\nCreencias de la región representadas por personajes de la mitología popular.\r\n', '', NULL),
(5, 'Museo del Plan Quinquenal', 'Lunes a Viernes turno mañana 8:00 a 12:00, turno tarde 16:00 a 18:30. Sábados, domingos y feriados cerrado.', 230, 'Inaugurado el 16 de septiembre de 2013, el Museo del Plan Quinquenal se encuentra ubicado en la Escuela N°48 \"Domingo Bresanovich y Jacinto Somacal\", en la localidad de Colonia Pastoril.', '', NULL),
(6, 'Museo Sacro Cultural ', 'Sàbados y Domingos Tarde 17:00 a 19:30  *Consultar por visitas guiadas durante la semana', 231, '', '', NULL),
(7, 'Museo Histórico Policial \"Comisario Gral. de la Policía de Territorios Nacionales Justo Bobadilla\"', '*Cerrado por refacciones', 232, 'El Museo de la Policía de Formosa fue inaugurado el 11 de Noviembre de 1993, lleva el nombre del Comisarío General ® TTNN Dn. Justo Bobadilla', '', NULL),
(8, 'Museo \"Nuestra Señora del Carmen\"', 'Cerrado', 233, '', '', NULL),
(9, 'Museo y Casa de la Cultura', 'Comunicarse previamente para coordinar ', 234, '', '', NULL),
(10, 'Museo \"Misión Laishi\"', 'Comunicarse para visitas guiadas', 235, '', '', NULL),
(11, 'Museo del Carnaval', 'Comunicarse con la Municipalidad de Ibarreta', 236, '', '', NULL),
(12, 'Museo y Casa Histórica ', 'Lunes a Viernes turno mañana 7:00 a 12:00, turno tarde 16:00 a 19:00. Sábados, domingos y feriados con aviso previo', 237, '', 'Yango Albornoz', NULL),
(13, 'Museo Ferroviario', 'Lunes a Viernes turno mañana 8:00 a 12:00, turno tarde 16:00 a 20:00. Sábados, domingos y feriados de 16:00 a 21:00', 238, 'El museo adquiere, conserva, investiga, comunica y exhibe con propósito de estudio, educación y esparcimiento.', '', NULL),
(14, 'Museo Histórico y Regional \"Juan Pablo Duffard\"', 'Lunes a Viernes de 08 a 12 horas y por la tarde de 15.30 a 19 horas. Sábados, Domingos y feriados por la mañana de 10 a 12 y por la tarde de 18 a 19 horas.', 239, 'El edificio del actual Museo era la residencia del Gobernador Fotheringham, construido en 1888. La casa se encuentra rodeada de anchos corredores cubiertos y techos altos cuyo fin era el de mitigar los calores del verano.\r\nFunciono como \"Casa de Gobierno\" del Territorio Nacional hasta 1981 en que por Decreto Provincial Nº 343/81 fue destinada para cumplir funciones de Museo.\r\nEl Museo Histórico y Regional es el primer Monumento Histórico Nacional por Decreto Nacional Nº 10.852/53, rubricado por el Presidente Perón.\r\nPor Decreto Nº 616 en el año 1988 del Gobierno Provincial, se le impuso el nombre \"Juan Pablo Duffard\" como justo homenaje a este pionero, quien inquebrantable y desinteresadamente tuvo la primera inquietud de espíritu conservacionista de objetos y Documentos, varios pertenecientes a los antiguos pobladores de la Villa Formosa. Hijo de Benjamín Duffard de origen francés que vino acompañando a Fontana para fundar Formosa. Hombre culto y preocupado por conservar el acervo cultural de sus ancestros, reunió pacientemente en su casa ubicada en la calle Moreno al 800 una gran cantidad de piezas históricas que paulatinamente fue ordenándolas con la idea de crear un museo y resguardar así la historia local.\r\nEste museo rescata y recuerda en el recorrido de sus nueves salas temáticas desde: la Fundación de la Ciudad, objetos y documentos de aquellos antiguos pobladores de la Villa Formosa; las familias fundadoras, la cultura indígena, las expediciones y sucesos militares; la evolución política, social y cultural del territorio; los Gobernadores y los símbolos Provinciales, no solo para la sociedad formoseña sino también a los turistas visitantes, estableciendo un vínculo tangible con el pasado.\r\nSala 1: \"Las familias Fundadoras\"\r\nSala 2: \"Antiguos Dueños de la Tierra\"\r\nSala 3: \"La Empresa Militar\"\r\nSala 4: \"La Empresa Militar\"\r\nSalas 5: \"Usos y Costumbres de las Familias Fundadoras\"\r\nSalas 6: \"Esparcimiento y recreación de las familias fundadoras\"\r\nSala 7: \"Institucional, de los símbolos provinciales y de los gobernadores constitucionales\"\r\nSala 8: \"De los Gobernadores del Territorio Nacional\"\r\nSala 9: \"Salón Auditorio\"\r\n', '', NULL),
(16, 'Museo Provincial de Ciencias Naturales', 'Lunes a Sábados 09 a 12 horas.', 241, 'Se encuentra ubicado a 76 km de la ciudad capital, en la localidad de Villa Escolar, Departamento de Misión Laishí, en la Provincia de Formosa y a 100 km de la ciudad de Resistencia, Provincia del Chaco.\r\nEs un museo de modernas instalaciones, acorde al mundo que vivimos hoy, que difunde un Paisaje Cultural que se desarrolla en tres aristas: COMUNIDAD \"BIÓSFERA\" MUSEO. Museo donde convergen reflejos de nuestra región, paisajes de montes, selvas típicas de la región Chaqueña; costas barrancosas sobre el Río Bermejo y un lugar de encuentro cultural. Los hallazgos de restos paleontológicos están protegidos por la Ley Provincial Nº 1455 de Protección del Patrimonio Arqueológico y Paleontológico en adhesión a la Ley Nacional Nº 25.743 En el territorio Formoseño, en las barrancas del Río Bermejo se encontraron restos de megafauna extinta cuyos mejores representantes lo constituyen:\r\nEl grupo del orden CINGULATA cuyos representantes constituyen los GLYPTODON, los NEOSCLEROCALYPTUS y PAMPATHERIUM.\r\nEl grupo del orden NOTOUNGULATA lo representa la especie \"TOXODON\" y del orden TATIRGRADA, lo representa la especie MEGATERIUM.\r\nparte del acervo del Museo en recorrido de sus salas las siguientes colecciones:\r\nDE ELEMENTOS ANTROPOLÓGICOS\r\nDE PALEOVERTEBRADOS\r\nA la Fecha 12/12/14, la Colección Paleontológica cuenta con 145 ejemplares clasificados.\r\nDE PALEOVEGETALES\r\nDE RÉPLICAS DE FÓSILES ADQUIRIDOS EN EL MUSEO DE CIENCIAS NATURALES DE LA PLATA - NEOSCLEROCALYPTUS y PROPRAOPUS\r\nCOLECCIÓN DE ANIMALES EMBALSAMADOS\r\nCOLECCIÓN ARQUEOLÓGICA\r\nY un parque donde se encuentran las diferentes especies arbóreas locales y de nuestra región.\r\n', '', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `organismos`
--

CREATE TABLE `organismos` (
  `id_organismos` int(11) NOT NULL,
  `descripcion_organismos` varchar(255) DEFAULT NULL,
  `rela_tipo_de_servicio` int(11) NOT NULL,
  `reponsable_idoneo` varchar(244) DEFAULT NULL,
  `Sedes_organismos` varchar(255) DEFAULT NULL,
  `rela_direccion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `origen_destino`
--

CREATE TABLE `origen_destino` (
  `id_origen_destino` int(11) NOT NULL,
  `origen_localidad` int(11) NOT NULL,
  `destino_localidad` int(11) NOT NULL,
  `observacion_transporte` varchar(255) DEFAULT NULL,
  `rela_empresa_O_D` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `origen_destino`
--

INSERT INTO `origen_destino` (`id_origen_destino`, `origen_localidad`, `destino_localidad`, `observacion_transporte`, `rela_empresa_O_D`) VALUES
(17, 1, 2, 'hola este es mi primer vaso', 1),
(18, 35, 57, 'este pasaje sale muy caro', 2),
(19, 35, 3, '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `id_pais` int(10) NOT NULL,
  `nombre_pais` varchar(244) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`id_pais`, `nombre_pais`) VALUES
(1, 'Argentina'),
(2, 'Paraguay');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id_persona` int(10) NOT NULL,
  `nombre_persona` varchar(244) DEFAULT NULL,
  `apellido_persona` varchar(244) DEFAULT NULL,
  `dni_persona` int(10) DEFAULT NULL,
  `cuil_persona` bigint(20) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `rela_persona_direccion` int(10) DEFAULT NULL,
  `rela_educacion` int(11) DEFAULT NULL,
  `profesion` varchar(255) DEFAULT NULL,
  `rela_usuario_contra` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id_persona`, `nombre_persona`, `apellido_persona`, `dni_persona`, `cuil_persona`, `fecha_nac`, `rela_persona_direccion`, `rela_educacion`, `profesion`, `rela_usuario_contra`) VALUES
(21, 'Gonzalo', 'Bordoy', NULL, 1234, '2023-04-12', 461, 4, 'director', 40),
(22, 'Silvina', 'Castro', NULL, 123, '2023-04-12', 462, 4, 'contadora', 41),
(23, 'Ronaldo Emmanuel', 'Almirón', NULL, 20408042217, '1998-02-17', 463, 3, 'Analista en Tic - Programador Web', 42),
(24, 'Mabel Edith', 'Areco', NULL, 27235335668, '1976-10-15', 464, 2, '-', 43),
(25, 'Rodrigo Leandro', 'Areco', NULL, 20343486503, '1989-01-01', 465, 2, '-', 44),
(26, 'Gloria Hortencia', 'Arias', NULL, 27258893617, '1977-04-19', 466, 3, 'Analista en computacion', 45),
(27, 'Sabrina Edith', 'Arias', NULL, 0, '1980-02-15', 467, 2, '-', 46),
(28, 'Roxana Edith', 'Baez', NULL, 27345973864, '1989-05-29', 468, 4, 'Licenciada en Nutrición', 47),
(29, 'Laura Elena', 'Bareiro', NULL, 27335884561, '1988-09-15', 469, 4, 'Abogada', 48),
(30, 'Marta Noemí', 'Bobadilla', NULL, 27143080280, '1960-12-25', 470, 2, '-', 49),
(31, 'Antonio', 'Bondaruk', NULL, 20160868598, '1963-01-29', 471, 3, 'Perito Mercantil', 50),
(32, 'Facundo Martin', 'Britez', NULL, 20306785002, '1984-03-20', 472, 4, 'Contador Publico', 51),
(33, 'Javier Martin', 'Britez', NULL, 20251812633, '1975-12-05', 473, 2, '-', 52),
(34, 'Denis Vanina', ' Cáceres Ruíz Diaz', NULL, 27335884367, '1988-08-29', 474, 2, '-', 53),
(35, 'Mirta Esther', 'Cancino', NULL, 27161282788, '1962-10-25', 475, 1, '-', 54),
(36, 'Nilda Buenaventura', 'Candia Vera', NULL, 93970255, '1958-07-14', 476, 1, '-', 55),
(37, 'Andrea Silvina', 'Castro Echeveste', NULL, 27272548108, '1979-04-27', 477, 4, 'Contadora Publica', 56),
(38, 'Lourdes Romina', 'Centurión', NULL, 27310720157, '1984-06-27', 478, 4, 'Lic. en Nutrición.', 57),
(39, 'Mariana Anahi', 'Coronel', NULL, 27334560509, '1987-12-09', 479, 4, 'Lic. en Publicidad', 58),
(40, 'Sonia Marcela', 'De Philippis', NULL, 27324892864, '1986-10-08', 489, 4, 'Tecnica en Hotelería y Turismo', 60),
(41, 'Julio Sergio', 'Durán', NULL, 20205259849, '1968-12-27', 490, 4, 'Lic. en Agronegocios', 61),
(42, 'Gabriela Antonella', 'Elia Olmedo', NULL, 27339777018, '1988-10-21', 491, 4, 'Lic. en Comercio Exterior', 62),
(43, 'Alejo', 'Espinola', NULL, 20131731796, '1957-08-17', 492, 3, 'Perito Comercial Esp. en Administracion de empresas', 63),
(44, 'Walter Nestor', 'Fernandez', NULL, 20222089116, '1971-08-31', 493, 2, '-', 64),
(45, 'Maria Eva', 'Ferreira Aviles', NULL, 27332243301, '1987-07-18', 494, 2, '-', 65),
(46, 'Rocio', 'Magdali', NULL, 37110173, '1994-02-23', 495, 4, 'Lic. en Turismo', 66),
(47, 'Jorge Arturo', 'Ferro', NULL, 20211011298, '1969-10-26', 496, 3, 'Tec. en Turismo', 67),
(48, 'Ariel Gustavo', 'Garcia', NULL, 20262113966, '1977-09-25', 497, 2, '-', 68),
(49, 'Mauro Eugenio', 'Garcia', NULL, 20356781741, '1990-10-14', 498, 2, '-', 69),
(50, 'Rodrigo Salvador', 'Garcia', NULL, 20345116959, '1989-06-18', 499, 2, '-', 70),
(51, 'Rosa Cecilia', 'Gimenez', NULL, 27324997488, '1987-05-12', 514, 4, 'Abogada', 72),
(52, 'Hauff Colcombet', 'Cecilia', NULL, 23297971204, '1982-11-02', 515, 4, 'Lic. en Letras', 73),
(53, 'Pedro Alfredo', 'Iznardo', NULL, 23161680249, '1970-01-01', 516, 3, 'Perito Mercantil con esp. Auxiliar contable', 74),
(54, 'Clarisa Emilia', 'Krachinsky', NULL, 27396062270, '1996-05-02', 638, 2, '-', 77),
(55, 'Walter Simon', 'Larroza', NULL, 20163745977, '1963-07-04', 639, 4, '-', 78),
(56, 'Emilio Osvaldo', 'Leguizamon', NULL, 23162540459, '1963-02-13', 640, 2, '-', 79),
(57, 'Fiama Soledad', 'Lopez', NULL, 35088563, '1990-06-28', 641, 3, 'Perito Comercial Esp. en Administracion de empresas', 80),
(58, 'Gladys Isabel ', 'Martinez', NULL, 27213071535, '1970-03-03', 642, 3, 'Perito Mercantil con esp. Auxiliar en administracion', 81),
(59, 'Monica Manuela', 'Molina', NULL, 25405288, '1976-08-26', 643, 2, '-', 82),
(60, 'Roxana Celeste', 'Montellano', NULL, 27262113693, '1977-09-29', 644, 4, 'Abogada', 83);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personales`
--

CREATE TABLE `personales` (
  `id_personal` int(11) NOT NULL,
  `rela_persona` int(11) NOT NULL,
  `rela_tipo_personal` int(11) NOT NULL,
  `rela_area` int(11) DEFAULT NULL,
  `rela_grupo_trabajo` int(11) DEFAULT NULL,
  `n_legajo` varchar(255) DEFAULT NULL,
  `rela_tipo_estado` int(11) DEFAULT NULL,
  `rela_depto_mintur` int(11) DEFAULT NULL,
  `expediente` varchar(255) DEFAULT NULL,
  `rela_tipo_contrato` int(11) DEFAULT NULL,
  `anio_antiguedad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `personales`
--

INSERT INTO `personales` (`id_personal`, `rela_persona`, `rela_tipo_personal`, `rela_area`, `rela_grupo_trabajo`, `n_legajo`, `rela_tipo_estado`, `rela_depto_mintur`, `expediente`, `rela_tipo_contrato`, `anio_antiguedad`) VALUES
(12, 21, 2, 8, NULL, '123', 2, 3, '123', 1, 2),
(13, 22, 3, 4, NULL, '123', 2, 2, '321', 1, 2),
(14, 23, 3, 7, NULL, '', 2, 3, '', 3, 1),
(15, 24, 3, 5, NULL, '7514', 2, 3, '-', 1, 16),
(16, 25, 3, 8, NULL, '156589', 2, 3, '-', 1, 9),
(17, 26, 3, 5, NULL, '4794', 2, 3, '-', 1, 16),
(18, 27, 3, 5, NULL, '3201', 2, 2, '-', 1, 16),
(19, 28, 3, 6, NULL, '194553', 2, 3, '-', 1, 3),
(20, 29, 3, 1, NULL, '209382', 2, 2, '-', 1, 3),
(21, 30, 2, 5, NULL, '30742', 2, 4, '-', 1, 20),
(22, 31, 4, 4, NULL, '28729', 2, 2, '-', 1, 40),
(23, 32, 3, 4, NULL, '549', 2, 2, '-', 1, 16),
(24, 33, 2, 5, NULL, '156590', 2, 1, '-', 1, 10),
(25, 34, 3, 3, NULL, '209383', 2, 3, '-', 1, 3),
(26, 35, 3, 5, NULL, '28546', 2, 2, '-', 1, 21),
(27, 36, 3, 5, NULL, '119', 2, 3, '-', 1, 16),
(28, 37, 2, 4, NULL, '216911', 2, 2, '-', 1, 0),
(29, 38, 3, 3, NULL, '209381', 2, 3, '-', 1, 3),
(30, 39, 3, 7, NULL, '193745', 2, 3, '-', 1, 1),
(31, 40, 3, 5, NULL, '209385', 2, 3, '-', 1, 2),
(32, 41, 3, 6, NULL, '209384', 2, 3, '-', 1, 3),
(33, 42, 3, 5, NULL, '171838', 2, 1, '-', 1, 7),
(34, 43, 3, 5, NULL, '33357', 2, 3, '-', 1, 39),
(35, 44, 3, 5, NULL, '12331', 2, 3, '-', 1, 16),
(36, 45, 3, 5, NULL, '184145', 2, 3, '-', 1, 6),
(37, 46, 3, 8, NULL, '-', 2, 3, '-', 1, 0),
(38, 47, 3, 6, NULL, '123105', 2, 3, '-', 1, 11),
(39, 48, 3, 5, NULL, '156591', 2, 1, '-', 1, 9),
(40, 49, 3, 5, NULL, '68167', 2, 1, '-', 1, 9),
(41, 50, 3, 5, NULL, '80598', 2, 1, '-', 1, 9),
(42, 51, 3, 6, NULL, '213356', 2, 3, '-', 1, 2),
(43, 52, 3, 7, NULL, '118169', 2, 3, '-', 1, 2),
(44, 53, 3, 6, NULL, '51564', 2, 3, '-', 1, 11),
(45, 54, 3, 5, NULL, '209386', 2, 3, '-', 1, 3),
(46, 55, 3, 1, NULL, '22646', 2, 3, '-', 1, 38),
(47, 56, 3, 1, NULL, '28350', 2, 3, '-', 1, 39),
(48, 57, 3, 8, NULL, '218874', 2, 3, '-', 1, 0),
(49, 58, 3, 6, NULL, '13894', 2, 4, '-', 1, 16),
(50, 59, 3, 5, NULL, '5211', 2, 3, '-', 1, 0),
(51, 60, 3, 1, NULL, '213360', 2, 2, '-', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `precio_acientos`
--

CREATE TABLE `precio_acientos` (
  `id_precios_acientos` int(11) NOT NULL,
  `precio` varchar(255) NOT NULL,
  `rela_acientos` int(11) NOT NULL,
  `rela_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestadores`
--

CREATE TABLE `prestadores` (
  `id_prestador` int(10) NOT NULL,
  `descripcion_prestador` varchar(244) NOT NULL,
  `cuit_prestador` varchar(244) NOT NULL,
  `dni_prestador` int(10) DEFAULT NULL,
  `institucion_prestador` varchar(244) DEFAULT NULL,
  `rela_razon_social_prestador` int(10) DEFAULT NULL,
  `fecha_edit_prestador` datetime DEFAULT NULL,
  `rela_persona_prestrador` int(10) DEFAULT NULL,
  `rela_prestador_direccion` int(11) NOT NULL,
  `rela_tipo_prestador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `prestadores`
--

INSERT INTO `prestadores` (`id_prestador`, `descripcion_prestador`, `cuit_prestador`, `dni_prestador`, `institucion_prestador`, `rela_razon_social_prestador`, `fecha_edit_prestador`, `rela_persona_prestrador`, `rela_prestador_direccion`, `rela_tipo_prestador`) VALUES
(4, 'Adrian Subeldía', '0', 0, 'CHEROGA', NULL, '2023-04-26 18:53:59', NULL, 265, 3),
(5, 'Pablo Monges', '20229271122', 22927112, 'NEWET ESPIRITU DE LA TIERRA', NULL, '2023-04-04 12:03:32', NULL, 266, 3),
(6, 'Federico J. Dominguez', '20239886508', 23988650, 'DOMINGUEZ EXCURSIONES', NULL, '2023-05-15 09:14:46', NULL, 269, 3),
(7, 'Fernando Gaona', '20-20221994-3', 0, 'AVISTAJE DE AVES', NULL, '2023-05-15 09:13:38', NULL, 270, 2),
(8, 'Julio Cesar Salazar', '0', 0, 'ODISEA FORMOSA', NULL, '2023-04-04 12:01:29', NULL, 271, 3),
(9, 'Cesar Giménez', '20-29484415-6', 0, 'BICHOS DE RIO', NULL, '2023-04-04 09:48:17', NULL, 272, 3),
(10, 'Marta Vázquez', '0', 0, 'NAUTICA AJERÉ YSYRYPE ', NULL, '2023-05-15 10:23:33', NULL, 273, 3),
(11, 'Matías Toloza', '', 0, 'Iglú - Espacio Cultural', NULL, '2022-07-15 08:12:38', NULL, 274, 1),
(12, 'Francisco (Chilo ) Ruiz', '20-25009199-1 ', 25009199, '', NULL, '2023-05-19 08:38:04', NULL, 275, 2),
(13, 'María Elsa Coronel', '0', 0, 'GUAYCURU-ARTESANIAS SALVAJES', NULL, '2023-04-04 08:55:55', NULL, 277, 1),
(14, 'Santiago Buchara', '0', 0, 'Paseos Náuticos Irupé', NULL, '2023-05-19 08:40:16', NULL, 278, 1),
(16, 'Gisella Infantino', '0', 0, 'Guía del Parque Pilcomayo', NULL, '2022-09-06 10:40:25', NULL, 280, 2),
(17, 'Marité Álvarez', '0', 0, 'Turismo La Estrella', NULL, '2022-07-14 10:13:15', NULL, 281, 1),
(19, 'Eduardo Orozco', '0', 0, 'Iwoka Parque Natural', NULL, '2023-05-19 08:42:59', NULL, 283, 1),
(20, 'Almaraz Cristrian', '0', 0, 'Kayak Sym Formosa', NULL, '2022-07-13 19:13:22', NULL, 285, 1),
(21, 'Carlos Maldonado', '0', 0, '', NULL, '2023-05-16 12:07:23', NULL, 286, 1),
(22, 'Pinto Santillán', '0', 0, '', NULL, '2023-05-19 08:54:48', NULL, 287, 1),
(23, 'Horacio Maldonado', '0', 0, '', NULL, '2023-05-19 08:42:31', NULL, 288, 1),
(24, 'Javier Santillán', '0', 0, '', NULL, '2023-05-19 08:42:03', NULL, 289, 1),
(25, 'Carlos Arnedo', '0', 0, 'Comarca Bermejo', NULL, NULL, NULL, 290, 1),
(26, 'Claudio Wutzke', '0', 0, 'Comarca Bermejo', NULL, '2022-02-16 09:00:04', NULL, 291, 1),
(27, 'Teodoro Velázquez', '0', 0, 'Comarca Bermejo', NULL, '2022-02-16 09:00:16', NULL, 292, 1),
(28, 'Luis Cuesta', '', 0, 'Comarca Bermejo', NULL, NULL, NULL, 293, 1),
(32, 'Perla Cristina Rivero', '', 0, 'Club de Avistaje de Aves', NULL, '2022-07-14 11:12:30', NULL, 366, 1),
(33, 'Julian Galarza', '', 0, 'Granja don Julian', NULL, '2022-08-18 08:32:03', NULL, 373, 1),
(37, 'Dimitruk Carlos', '20-14862748-8', 0, 'REGIONALES IBARRETA', NULL, '2023-04-04 10:41:43', NULL, 443, 1),
(38, 'Felix Bonnet', '', 0, 'Establecimiento 3 de Mayo ', NULL, '2022-11-17 09:56:16', NULL, 445, 1),
(39, 'Antonella Griselda Arato', '', 0, 'El Canto del Pitogüé', NULL, '2022-11-17 12:01:59', NULL, 446, 1),
(40, 'Chagra Yandyra', '', 0, 'ALWA TOBA', NULL, '2023-04-04 08:51:17', NULL, 448, 1),
(41, 'Nenning Federico', '20-29672527-8', 29672527, 'GUARDERIA NAUTICA HERRADURA', NULL, '2023-05-16 10:21:00', NULL, 449, 1),
(42, 'BISTOLFI LILIAN', '', 17165149, 'QUINTA EL EDÉN', NULL, '2023-04-04 09:33:18', NULL, 450, 3),
(43, 'Ramua Federico', '20-25030145-7', 25030145, 'TEAM DON SANTIAGO BIKE', NULL, '2023-04-04 10:06:35', NULL, 451, 1),
(46, 'BRITOS CARLOS HIPÓLITO', '23-18086212-9', 18086212, 'BRITOS SERVICIOS', NULL, '2023-05-15 09:41:39', NULL, 615, 1),
(47, 'RUIZ ISIDORO', '0', 0, '', NULL, '2023-05-16 11:06:33', NULL, 617, 2),
(48, 'LA FUENTE EDUARDO', '0', 0, '', NULL, '2023-05-16 11:08:10', NULL, 618, 2),
(49, 'MORENO RICARDO', '', 0, '', NULL, '2023-05-16 11:12:00', NULL, 619, 2),
(50, 'MARTINEZ HECTOR', '', 0, '', NULL, '2023-05-16 11:13:17', NULL, 620, 1),
(51, 'HOURCADE ADRIAN', '', 0, '', NULL, '2023-05-16 11:15:14', NULL, 621, 1),
(52, 'zalasar Baloy', '', 0, '', NULL, '2023-05-16 11:16:51', NULL, 622, 2),
(53, 'LEDESMA EDUARDO', '', 0, '', NULL, '2023-05-16 11:18:05', NULL, 623, 1),
(54, 'SANTILLAN PINTO', '0', 0, '', NULL, '2023-05-19 09:49:45', NULL, 624, 2),
(55, 'SANTILLAN MIGUEL', '0', 0, '', NULL, '2023-05-19 09:50:07', NULL, 625, 2),
(56, 'AILAN ROGELIO', '', 0, '', NULL, '2023-05-16 11:25:59', NULL, 626, 2),
(57, 'MALDONADO CARLOS', '', 0, '', NULL, '2023-05-16 11:31:30', NULL, 627, 2),
(58, 'GALVAN FAUTINO', '', 0, '', NULL, '2023-05-16 11:42:41', NULL, 628, 1),
(59, 'Perez Delia Mabel', '', 26712985, '', NULL, '2023-05-19 11:45:06', NULL, 637, 1);

--
-- Disparadores `prestadores`
--
DELIMITER $$
CREATE TRIGGER `borrarprestadores` AFTER DELETE ON `prestadores` FOR EACH ROW INSERT INTO auditoria(tabla, accion,old_value, usuario_id) VALUES ('prestadores', 'DELETE',CONCAT('{"`id_prestador`":', old.`id_prestador`, '}'), 25)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `crearprestadores` AFTER INSERT ON `prestadores` FOR EACH ROW INSERT INTO auditoria(tabla, accion, new_value, usuario_id) VALUES ('prestadores', 'INSERT', CONCAT('{"`id_prestador`":', new.`id_prestador`, '}'), 25)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `editarprestadores` AFTER UPDATE ON `prestadores` FOR EACH ROW INSERT INTO auditoria(tabla, accion,old_value, new_value, usuario_id) VALUES ('prestadores', 'UPDATE',CONCAT('{"`id_prestador`":', old.`id_prestador`, '}'), CONCAT('{"`id_prestador`":', new.`id_prestador`, '}'), 25)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

CREATE TABLE `provincia` (
  `id_provincia` int(10) NOT NULL,
  `nombre_provincia` varchar(244) NOT NULL,
  `rela_pais` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `provincia`
--

INSERT INTO `provincia` (`id_provincia`, `nombre_provincia`, `rela_pais`) VALUES
(1, 'Formosa', 1),
(2, 'Chaco', 1),
(24, 'Buenos Aires', 1),
(25, 'Capital Federal', 1),
(26, 'Catamarca', 1),
(27, 'Chubut', 1),
(28, 'Córdoba', 1),
(29, 'Corrientes', 1),
(30, 'Entre Ríos', 1),
(31, 'Jujuy', 1),
(32, 'La Pampa', 1),
(33, 'La Rioja', 1),
(34, 'Mendoza', 1),
(35, 'Misiones', 1),
(36, 'Neuquén', 1),
(37, 'Río Negro', 1),
(38, 'Salta', 1),
(39, 'San Juan', 1),
(40, 'San Luis', 1),
(41, 'Santa Cruz', 1),
(42, 'Santa Fe', 1),
(43, 'Santiago del Estero', 1),
(44, 'Tierra del Fuego', 1),
(45, 'Tucumán', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `razon_particular`
--

CREATE TABLE `razon_particular` (
  `id_razon_particular` int(11) NOT NULL,
  `fecha_ini_razonparticular` date NOT NULL,
  `comprobante_particular` varchar(255) DEFAULT NULL,
  `rela_personal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `razon_particular`
--

INSERT INTO `razon_particular` (`id_razon_particular`, `fecha_ini_razonparticular`, `comprobante_particular`, `rela_personal`) VALUES
(8, '2023-04-12', NULL, 12),
(9, '2023-04-13', NULL, 13),
(10, '0001-01-01', NULL, 14),
(11, '0000-00-00', NULL, 15),
(12, '0000-00-00', NULL, 16),
(13, '0000-00-00', NULL, 17),
(14, '0000-00-00', NULL, 18),
(15, '0000-00-00', NULL, 19),
(16, '0000-00-00', NULL, 20),
(17, '0000-00-00', NULL, 21),
(18, '0000-00-00', NULL, 22),
(19, '0000-00-00', NULL, 23),
(20, '0000-00-00', NULL, 24),
(21, '0001-01-01', NULL, 25),
(22, '2022-12-07', NULL, 26),
(23, '0001-01-01', NULL, 27),
(24, '2022-03-18', NULL, 28),
(25, '2023-04-13', NULL, 29),
(26, '0001-01-01', NULL, 30),
(27, '2022-12-06', NULL, 31),
(28, '2022-12-27', NULL, 32),
(29, '2022-12-22', NULL, 33),
(30, '0001-01-01', NULL, 34),
(31, '0001-01-01', NULL, 35),
(32, '2022-08-03', NULL, 36),
(33, '0001-01-01', NULL, 37),
(34, '2022-12-16', NULL, 38),
(35, '0001-01-01', NULL, 39),
(36, '2022-03-30', NULL, 40),
(37, '2022-03-28', NULL, 41),
(38, '2023-04-10', NULL, 42),
(39, '2022-08-25', NULL, 43),
(40, '2022-12-28', NULL, 44),
(41, '0001-01-01', NULL, 45),
(42, '0001-01-01', NULL, 46),
(43, '0001-01-01', NULL, 47),
(44, '0001-01-01', NULL, 48),
(45, '0001-01-01', NULL, 49),
(46, '2019-10-23', NULL, 50),
(47, '0001-01-01', NULL, 51);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `razon_social`
--

CREATE TABLE `razon_social` (
  `id_razon_social` int(10) NOT NULL,
  `descripcion_razon_social` varchar(244) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `razon_social`
--

INSERT INTO `razon_social` (`id_razon_social`, `descripcion_razon_social`) VALUES
(38, ''),
(39, 'Diego Bregant Viajes'),
(40, 'hotel razon social'),
(42, 'portal razon social'),
(46, ''),
(47, ''),
(48, ''),
(49, ''),
(50, ''),
(51, ''),
(52, ''),
(53, ''),
(54, ''),
(55, ''),
(56, ''),
(57, ''),
(58, 'DOÑA SOFIA SRL'),
(63, 'Fideicomiso Los Zorzales'),
(64, ''),
(65, ''),
(66, 'Fleitas Fernanda Karina'),
(67, ''),
(68, ''),
(69, ''),
(70, ''),
(71, 'Gilberto Bandeo'),
(72, ''),
(73, ''),
(74, ''),
(75, ''),
(76, ''),
(77, ''),
(78, ''),
(79, ''),
(81, ''),
(84, ''),
(86, ''),
(87, ''),
(88, ''),
(89, ''),
(90, ''),
(91, ''),
(92, ''),
(93, ''),
(94, ''),
(95, ''),
(96, ''),
(97, ''),
(98, ''),
(100, ''),
(101, ''),
(103, ''),
(105, ''),
(106, ''),
(107, ''),
(108, ''),
(109, ''),
(110, ''),
(111, ''),
(113, ''),
(114, ''),
(115, ''),
(116, 'Orué, Griselda Mariel'),
(117, 'Ramírez, Nelson Oscar'),
(118, 'Funes, Claudia Vanesa'),
(121, 'Bregant, Diego Alejandro'),
(122, 'Fentana, Hugo Ricardo'),
(125, 'Molina, Miguel Ángel'),
(126, 'Paraquaria S.R.L'),
(127, 'Musso, Carlos Marcelo'),
(129, 'Siacia, Ariel Ernesto'),
(130, 'Oviedo, Carlos Antonio'),
(132, 'Energym S.R.L.'),
(133, 'Travel Rock S.A.'),
(134, 'TDC S.R.L.'),
(135, 'Román, Claudio Julián'),
(136, ''),
(137, ''),
(138, 'Centurión, Iván David'),
(140, 'r'),
(141, ''),
(142, ''),
(143, ''),
(144, '.'),
(148, ''),
(153, ''),
(154, ''),
(155, ''),
(156, 'Sergio Adrián Subeldia'),
(157, 'no se registró'),
(158, ''),
(159, ''),
(160, ''),
(161, ''),
(162, ''),
(163, ''),
(164, ''),
(165, ''),
(166, ''),
(167, ''),
(168, ''),
(169, ''),
(170, ''),
(171, ''),
(172, ''),
(173, ''),
(174, ''),
(175, ''),
(176, ''),
(177, ''),
(178, ''),
(179, ''),
(180, ''),
(186, 'no se registró');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `referentes_municipal`
--

CREATE TABLE `referentes_municipal` (
  `id_referentes` int(11) NOT NULL,
  `idoneo_referente` varchar(244) NOT NULL,
  `fecha_edit_referente` datetime DEFAULT NULL,
  `rela_direccion` int(11) NOT NULL,
  `rela_tipo_encargado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `referentes_municipal`
--

INSERT INTO `referentes_municipal` (`id_referentes`, `idoneo_referente`, `fecha_edit_referente`, `rela_direccion`, `rela_tipo_encargado`) VALUES
(1, 'Cristina Salomón', NULL, 72, 1),
(2, 'Danilo', NULL, 73, 7),
(3, 'Néstor Mendoza', NULL, 74, 6),
(5, 'José Friedrich', NULL, 76, 7),
(6, 'Reinaldo Saporitti', NULL, 77, 1),
(7, 'Carlos Paton', '2022-02-11 11:03:35', 78, 6),
(9, 'Arnaldo Barrios', NULL, 80, 5),
(10, 'César Arias', '2022-08-17 11:58:03', 81, 3),
(11, 'Marta', NULL, 82, 7),
(12, 'Rubén Landriel', NULL, 83, 7),
(13, 'Gustavo Patiño', NULL, 84, 1),
(14, 'Adan Jarzynski', NULL, 85, 5),
(15, 'Marite Álvarez', NULL, 86, 1),
(16, 'Acosta Melanio', NULL, 87, 6),
(17, 'Evelin Bonilla', '2022-08-17 11:58:35', 88, 1),
(18, 'Andrés De Yong', NULL, 89, 5),
(19, 'Matilde Muñoz', NULL, 90, 6),
(20, 'Luis Rivero', NULL, 91, 5),
(21, 'Julián Bordón', NULL, 92, 5),
(22, 'María', NULL, 93, 6),
(23, 'Carlos Paniagua', '2022-08-17 12:02:32', 94, 1),
(24, 'Roberto', NULL, 95, 6),
(25, 'Rosi Medina', NULL, 96, 6),
(26, 'Guillermo Silva', NULL, 97, 5),
(27, 'Lilian Consentino', NULL, 98, 6),
(28, 'Luis Blasich', '2022-08-11 11:13:38', 99, 6),
(29, 'Ana Blanco', NULL, 100, 6),
(30, 'Julio Murdoch', NULL, 101, 5),
(31, 'Mariano Ortiz', NULL, 102, 6),
(32, 'Graciela', NULL, 103, 6),
(33, 'Andrea Ibarlucea', NULL, 104, 1),
(34, 'Josefina Mendez', NULL, 105, 6),
(35, 'Daniel Alarcón', NULL, 106, 1),
(36, 'Lorenzo Schmidt', NULL, 107, 5),
(37, 'Gildo Martiarena', NULL, 108, 6),
(38, 'Antonio Caldera', NULL, 109, 5),
(39, 'Rafael Nacif', NULL, 149, 5),
(40, 'Luis Corvalán', NULL, 262, 5),
(41, 'Juan Carlos Jaquemin', '2022-02-24 11:31:05', 263, 5),
(42, 'Miguel Atanasio', NULL, 264, 6),
(43, 'Manuel Celauro', NULL, 305, 5),
(44, 'Mario Brignole', NULL, 306, 5),
(45, 'Ruben Solalinde', NULL, 307, 5),
(50, 'Mario Diakovsky', NULL, 312, 5),
(51, 'Hugo Onisinchuk', NULL, 313, 5),
(52, 'Damian Minetti', NULL, 314, 6),
(53, 'Sergio De Madariaga', NULL, 315, 5),
(58, 'Salvador Figueredo', NULL, 320, 5),
(59, 'Ernesto Heizenreder', NULL, 321, 5),
(60, 'José Lezcano', NULL, 322, 5),
(61, 'Aldo Minetti', NULL, 323, 5),
(62, 'Pablo Basualdo', NULL, 324, 6),
(63, 'Renzo Parra', NULL, 325, 5),
(64, 'Celia Robles', NULL, 326, 5),
(65, 'Carlos Sotelo', NULL, 327, 5),
(66, 'Norman Antonio Torrez', NULL, 328, 5),
(68, 'José Francisco Ravano', NULL, 330, 5),
(75, 'Ramiro Escotorin', NULL, 340, 3),
(78, 'Sol Gerase', '2022-09-19 08:33:17', 406, 1),
(79, 'Ruben Pereyra', '2022-09-19 08:34:04', 407, 5),
(80, 'Blasco Orlando', '2022-11-15 11:56:08', 441, 5),
(81, 'Gustavo Bacon', '2023-04-10 10:43:02', 452, 6);

--
-- Disparadores `referentes_municipal`
--
DELIMITER $$
CREATE TRIGGER `borrarreferentes` AFTER DELETE ON `referentes_municipal` FOR EACH ROW INSERT INTO auditoria(tabla, accion,old_value, usuario_id) VALUES ('referentes_municipal', 'DELETE',CONCAT('{"`id_referentes`":', old.`id_referentes`, ',"`idoneo_referente`":', old.`idoneo_referente`, '}'), 3)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `crearreferentes` AFTER INSERT ON `referentes_municipal` FOR EACH ROW INSERT INTO auditoria(tabla, accion, new_value, usuario_id) VALUES ('referentes_municipal', 'INSERT', CONCAT('{"`id_referentes`":', new.`id_referentes`, ',"`idoneo_referente`":', new.`idoneo_referente`, '}'), 3)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `editarreferentes` AFTER UPDATE ON `referentes_municipal` FOR EACH ROW INSERT INTO auditoria(tabla, accion,old_value, new_value, usuario_id) VALUES ('referentes_municipal', 'UPDATE',CONCAT('{"`id_referentes`":', old.`id_referentes`, ',"`idoneo_referente`":', old.`idoneo_referente`, '}'), CONCAT('{"`id_referentes`":', new.`id_referentes`, ',"`idoneo_referente`":', new.`idoneo_referente`, '}'), 3)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `region`
--

CREATE TABLE `region` (
  `id_region` int(10) NOT NULL,
  `nombre_region` varchar(244) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `region`
--

INSERT INTO `region` (`id_region`, `nombre_region`) VALUES
(1, 'Norte'),
(2, 'Sur'),
(3, 'Este'),
(4, 'Oeste'),
(5, 'Litoral');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_roles` int(11) NOT NULL,
  `roles` varchar(244) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_roles`, `roles`) VALUES
(1, 'administrador'),
(2, 'visualizacion'),
(3, 'registro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rubro_alojamiento`
--

CREATE TABLE `rubro_alojamiento` (
  `id_rubro_alojamiento` int(11) NOT NULL,
  `descripcion_rubro` varchar(244) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rubro_alojamiento`
--

INSERT INTO `rubro_alojamiento` (`id_rubro_alojamiento`, `descripcion_rubro`) VALUES
(1, 'HOSPEDAJE'),
(2, 'HOTELERÍA'),
(3, 'COMPLEJO TURÍSTICO'),
(4, 'CASA QUINTA'),
(5, 'APARTAMENTOS'),
(6, 'HOTELERÍA Y SALÓN DE EVENTO'),
(7, 'CABAÑAS'),
(8, 'OTRO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salones`
--

CREATE TABLE `salones` (
  `id_salones` int(11) NOT NULL,
  `nombre_salones` varchar(255) DEFAULT NULL,
  `cuit_salones` varchar(255) DEFAULT NULL,
  `idoneo_salones` varchar(255) DEFAULT NULL,
  `rela_direccion` int(11) DEFAULT NULL,
  `rela_servi_complementarios` int(11) DEFAULT NULL,
  `rela_habilitacion` int(11) DEFAULT NULL,
  `fecha_edit_salones` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Disparadores `salones`
--
DELIMITER $$
CREATE TRIGGER `borrarsalones` AFTER DELETE ON `salones` FOR EACH ROW INSERT INTO auditoria(tabla, accion,old_value, usuario_id) VALUES ('salones', 'DELETE',CONCAT('{"`id_salones`":', old.`id_salones`, ',"`idoneo_salones`":', old.`idoneo_salones`, '}'), 3)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `crearsalones` AFTER INSERT ON `salones` FOR EACH ROW INSERT INTO auditoria(tabla, accion, new_value, usuario_id) VALUES ('salones', 'INSERT', CONCAT('{"`id_salones`":', new.`id_salones`, ',"`idoneo_salones`":', new.`idoneo_salones`, '}'), 3)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `editarsalones` AFTER UPDATE ON `salones` FOR EACH ROW INSERT INTO auditoria(tabla, accion,old_value, new_value, usuario_id) VALUES ('salones', 'UPDATE',CONCAT('{"`id_salones`":', old.`id_salones`, ',"`idoneo_salones`":', old.`idoneo_salones`, '}'), CONCAT('{"`id_salones`":', new.`id_salones`, ',"`idoneo_salones`":', new.`idoneo_salones`, '}'), 3)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios_alojamiento`
--

CREATE TABLE `servicios_alojamiento` (
  `id_servicio_alojamiento` int(10) NOT NULL,
  `cantidad_plazas` int(11) DEFAULT NULL,
  `cantidad_total_hab` int(11) DEFAULT NULL,
  `cantidad_hab_single` int(11) DEFAULT NULL,
  `cantidad_hab_doble` int(11) DEFAULT NULL,
  `cantidad_hab_matrimoniales` int(11) DEFAULT NULL,
  `cantidad_hab_triple` int(11) DEFAULT NULL,
  `cantidad_hab_cuadruple` int(11) DEFAULT NULL,
  `apartamento_alojamiento` varchar(244) DEFAULT NULL,
  `otros_servicios` varchar(244) DEFAULT NULL,
  `wifi_alojamiento` varchar(244) DEFAULT NULL,
  `estacionamiento_alojamiento` varchar(244) DEFAULT NULL,
  `desayuno_alojamiento` varchar(244) DEFAULT NULL,
  `piscina_alojamiento` varchar(244) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `servicios_alojamiento`
--

INSERT INTO `servicios_alojamiento` (`id_servicio_alojamiento`, `cantidad_plazas`, `cantidad_total_hab`, `cantidad_hab_single`, `cantidad_hab_doble`, `cantidad_hab_matrimoniales`, `cantidad_hab_triple`, `cantidad_hab_cuadruple`, `apartamento_alojamiento`, `otros_servicios`, `wifi_alojamiento`, `estacionamiento_alojamiento`, `desayuno_alojamiento`, `piscina_alojamiento`) VALUES
(35, 120, 69, 0, 0, 0, 0, 0, '', '', 'Si', 'Si', 'Si', 'Si'),
(36, 43, 18, 0, 0, 0, 0, 0, '', '', 'Si', '', 'Si', ''),
(37, 60, 17, 0, 0, 0, 0, 0, '', 'Capacidad Variable', '', '', '', ''),
(38, 60, 30, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(39, 122, 58, 0, 0, 0, 0, 0, '', '', 'Si', 'Si', '', ''),
(40, 134, 83, 0, 0, 0, 0, 0, '', 'Separado completamente del CAS (personal, sabanas, cocina, recepción)', 'Si', 'Si', 'Si', 'Si'),
(41, 78, 29, 0, 0, 0, 0, 0, '', '', 'Si', 'Si', 'Si', ''),
(42, 78, 29, 0, 0, 0, 0, 0, '', '', 'Si', 'Si', 'Si', ''),
(43, 30, 19, 11, 2, 0, 1, 2, '', '', 'Si', 'Si', '', 'Si'),
(44, 100, 38, 0, 0, 0, 0, 0, '', '', 'Si', 'Si', 'Si', ''),
(45, 31, 14, 0, 0, 0, 0, 0, '', '', 'Si', 'Si', 'Si', ''),
(46, 40, 14, 0, 0, 0, 0, 0, '', '', 'Si', 'Si', 'Si', ''),
(47, 16, 4, 0, 0, 0, 0, 0, '', 'Cancha de tenis, senderos de interpretación señalizados, cabalgatas, kayak y piragüas', 'Si', 'Si', 'Si', 'Si'),
(49, 28, 6, 0, 0, 0, 0, 0, '', 'Restaurante, Salon de evento. Play day', 'Si', 'si', '', 'Si'),
(50, 55, 20, 0, 0, 0, 0, 0, '', 'Tv led, cocina con horno, heladera con freezer, vajilla, parrilla individual, aire acondicionado, solarium, servicio de blanquería', '', 'Si', '', 'Si'),
(51, 11, 2, 0, 0, 0, 0, 0, '', 'Parrillero, quincho', 'Si', 'Si', 'Si', 'Si'),
(52, 24, 6, 0, 0, 0, 0, 0, '', 'DirecTV, SUM, Parrillero, Plaza con juegos para niños', 'Si', 'Si', 'Si', 'Si'),
(53, 20, 3, 0, 0, 0, 0, 0, '', 'Parrillero, Cantina, Canchas, Oratorio', '', 'Si', '', 'Si'),
(54, 20, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(55, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(56, 14, 3, 0, 0, 0, 0, 0, '', '', '', 'Si', '', 'Si'),
(57, 30, 6, 0, 0, 0, 0, 0, '', '', 'Si', 'Si', '', ''),
(58, 25, 5, 0, 0, 0, 0, 0, '', 'Galería con asador,  heladera, comedor, cocina, DirecTV, quincho,  juegos para niños', 'Si', 'Si', '', 'Si'),
(59, 21, 2, 0, 0, 0, 0, 0, '', '', '', 'Si', '', ''),
(60, 12, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(61, 0, 0, 0, 0, 0, 0, 0, '', 'Tv, baño privado y cochera privada, agua caliente, venta de bebidas y minutas, lavandería', 'Si', 'Si', 'sin información', ''),
(62, 50, 22, 0, 0, 0, 0, 0, '', '', 'Si', 'Si', '', ''),
(63, 100, 33, 0, 0, 0, 0, 0, '', '', 'Si', 'Si', '', ''),
(64, 70, 30, 0, 0, 0, 0, 0, '', '', 'Si', 'Si', '', ''),
(65, 19, 10, 0, 0, 0, 0, 0, '', '', 'Si', 'Si', '', ''),
(67, 200, 40, 0, 0, 0, 0, 0, '', '', 'Si', 'Si', '', ''),
(70, 27, 14, 0, 0, 0, 0, 0, '', '', 'Si', 'Si', '', ''),
(72, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(73, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(74, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(75, 37, 20, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(76, 15, 11, 0, 0, 0, 0, 0, '', '', 'Si', 'Si', '', ''),
(77, 12, 9, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(78, 39, 12, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(79, 0, 10, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(80, 30, 15, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(81, 20, 8, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(82, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(83, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(84, 7, 3, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(86, 40, 10, 0, 0, 0, 0, 0, '', '', 'Si', 'Si', 'Si', ''),
(87, 36, 10, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(89, 20, 9, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(91, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(92, 0, 0, 0, 0, 0, 0, 0, '', '', 'si', 'si', ' de lunes a sabados y domingo tostadas', 'no'),
(93, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(94, 102, 28, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(95, 30, 12, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(96, 44, 20, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(97, 20, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(99, 12, 3, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(100, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(101, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(102, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(103, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(104, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(105, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(109, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', 'No', 'No'),
(114, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(115, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(116, 50, 35, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(117, 0, 0, 0, 0, 0, 0, 0, '', 'De esparcimiento y recreación, eventos, fiestas, reuniones en contacto armonioso con la naturaleza Formoseña', '', '', '', 'si'),
(118, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(119, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(120, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(121, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(122, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(123, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(124, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(125, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(126, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(127, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(128, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(129, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(130, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(131, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(132, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(133, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(134, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(135, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(136, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(137, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(138, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(139, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(140, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(143, 0, 3, 0, 0, 0, 0, 0, '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios_generales`
--

CREATE TABLE `servicios_generales` (
  `id_servicios_generales` int(11) NOT NULL,
  `nombre_servicio_general` varchar(255) NOT NULL,
  `idoneo_servicio_general` varchar(255) DEFAULT NULL,
  `rela_direccion` int(11) NOT NULL,
  `rela_estacion` int(11) NOT NULL,
  `rela_tipo_servicio` int(11) NOT NULL,
  `rela_tipo_lugar` int(11) NOT NULL,
  `descripcion_servicio_general` longtext DEFAULT NULL,
  `fecha_edit_general` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `servicios_generales`
--

INSERT INTO `servicios_generales` (`id_servicios_generales`, `nombre_servicio_general`, `idoneo_servicio_general`, `rela_direccion`, `rela_estacion`, `rela_tipo_servicio`, `rela_tipo_lugar`, `descripcion_servicio_general`, `fecha_edit_general`) VALUES
(7, 'Playa Municipal', 'Reinaldo Saporiti', 247, 1, 1, 2, 'No está habilitada', NULL),
(8, 'Pileta Municipal', 'Araceli Perez', 248, 1, 1, 1, 'Enero-Febrero', NULL),
(9, 'Camping Municipal', 'Marcelo Fretes ', 249, 1, 1, 3, 'Todo el año disponible', NULL),
(10, 'Pileta Municipal', 'Mariano Ortiz', 250, 1, 1, 1, 'Enero-Febrero', NULL),
(11, 'Pileta Municipal', 'Edward Patiño', 251, 1, 1, 1, 'Enero-Febrero', NULL),
(12, 'Pileta Municipal', 'Evelin Bobadilla', 252, 1, 1, 1, 'Enero-Febrero', NULL),
(13, 'Pileta Municipal', 'David Falcón', 253, 1, 1, 1, 'Enero-Febrero', NULL),
(14, 'Parque Acuático El Colorado', 'Andrea Ibarlucea', 254, 1, 1, 4, 'Costo de Ingreso:\r\n\r\nColoradenses: $200\r\nTuristas: $300', NULL),
(15, 'Pileta Municipal', 'Luis Blasich', 255, 1, 1, 1, 'Enero-Febrero', NULL),
(16, 'Pileta Municipal', 'María Zárate', 256, 1, 1, 1, 'Enero-Febrero', NULL),
(17, 'Pileta Municipal', 'Carlos Paniagua', 257, 1, 1, 1, 'No está habilitado', NULL),
(18, 'Parque Acuático Mansilla', 'José Escobar', 258, 1, 1, 1, 'Habilitado viernes, sábados y domingos.', NULL),
(21, 'Camping Dalto', 'Eugenio Garay', 267, 1, 2, 3, 'Camping Dalto es un lugar exquisito donde podes disfrutar de la naturaleza, complejos deportivos y la pesca. Esta situado en la ciudad de Clorinda provincia de Formosa.', NULL),
(22, 'Paseo La Molina', 'Lilian Molina', 268, 1, 2, 3, 'Lugar de esparcimiento para las familias.', NULL),
(23, 'Don Lidio Camping-Guardería Náutica', '', 284, 1, 2, 3, 'Guardería náutica, bajada de lanchas, alquiler de botes. ', NULL),
(24, 'Camping Ñande Roga', '', 297, 1, 2, 3, 'Para disfrutar de la Naturaleza Clorindense, en familia y con amigos, siempre con responsabilidad social\r\nConsultar por reserva de Quincho, parrillas y mesas.', NULL),
(25, 'Camping Doña Tuti', 'Luís Cuesta', 298, 1, 2, 3, 'Camping de la \"Comarca Bermejo\"\r\n\r\nPileta con solarium, canotaje, senderismo por el bosque nativo. ', NULL),
(26, 'El Predio', '', 299, 1, 2, 3, 'Camping más pileta. Espacio para deportes y día de campo.', NULL),
(27, 'Chuqui Cué', '', 300, 1, 2, 3, 'Espacio recreativo. Parrillas, pileta, cabañas, cantina, canchas, oratorio.', NULL),
(28, 'Camping municipal ', 'Miguel Atanasio', 301, 1, 1, 3, '', NULL),
(29, 'Camping Rio Soñado', 'Raúl Omar Soraire', 302, 1, 2, 3, 'Es un predio junto al río Monte Lindo. Se puede pescar, acampar, sólo o en familia o grupo de amigos.', NULL),
(30, 'Camping municipal', 'Andrea Ibarlucea', 303, 1, 1, 3, 'El Ingreso al camping es sin costo,  podes ingresar en cualquier horario, podes acampar, cuenta con parrillas, sanitarios,  canchas, circuito de mountain bike, juegos para niños, no se cobra estacionamiento,  no se cobra para acampar.', NULL),
(31, 'Parque Nacional Rio Pilcomayo', 'Miryan Ayala', 342, 6, 1, 6, 'Ecorregión: Chaco Húmedo\r\nSuperficie: 51.889 ha\r\nCreación: 1951 (Ley N° 14.073/51)\r\nSitio Ramsar (Humedales de Importancia Internacional)\r\n\r\nEste Parque Nacional resguarda una gran diversidad de ambientes acuáticos, terrestres e inundables que van desde lagunas y esteros, pastizales con palmeras, islas de bosques y selvas en galería que acompañan las márgenes de ríos.\r\n\r\nEsta variedad convierte al área en un lugar de importancia para la conservación de la biodiversidad de los ambientes húmedos chaqueños de nuestro país. Las isletas de bosques son tupidas, con árboles de madera dura como el lapacho, el quebracho colorado chaqueño, el algarrobo y el guayacán junto a numerosos arbustos, enredaderas, epífitas y un suelo tapizado de caraguataes.\r\nLa fauna incluye a las dos especies de yacarés, el negro y el overo; la boa curiyú, el mono carayá, murciélagos pescadores, carpincho, aguará popé, coatí, tapir, puma, zorro de monte, lobito de río, ocelote, aguará guazú y oso hormiguero grande. También se registraron más de 320 especies de aves, muchas asociadas a los humedales presentes.', '2022-02-11 11:31:00'),
(32, 'Reserva Natural Formosa', 'Carlos Paton', 343, 6, 1, 7, 'Provincia: Formosa\r\nEcorregión: Chaco Seco\r\nSuperficie: 9.005 ha\r\nCreación: 1968 (Ley N° 17.916/68)\r\n\r\nLa abundancia de cactus nos recuerda que estamos en una zona donde las lluvias son escasas. Sin embargo, la ubicación de la Reserva, entre los ríos Teuco (Bermejo) y Teuquito, aporta una riqueza adicional al típico ambiente xerófilo.\r\n\r\nEl río Teuco carcome las orillas con sus crecientes, formando altos barrancos. Las arenas transportadas se van depositando y forman islas que cambian su tamaño de acuerdo con el caudal del río. Allí crece el aliso de río, árbol que forma bosquecillos casi puros. El monte fuerte, donde se imponen el quebracho colorado santiagueño y el quebracho blanco, domina la Reserva, donde estos árboles crecen acompañado por el yuchán o palo borracho.\r\n\r\nEn sectores con suelos más arcillosos el palo santo se hace dominante y lo acompañan el quebrachillo y el palo azul. Acompañando a los principales cursos de agua, aparecen bosques ribereños con especies más dependientes de la humedad como el palo bolilla y la mora.', '2022-02-11 11:38:11'),
(33, 'Reserva Guaycolec', 'Ivana Iker', 344, 6, 1, 7, 'Se encuentra dentro de la región denominada el Gran Chaco por lo que cuenta con un patrimonio muy rico en números de especies, tanto de fauna como de flora aún no estudiada. Ocupa un área de 150 ha con una selva en galería del Riacho Pilagás.\r\nLa fauna existente en la Reserva es muy variada. Podemos encontrar especies en hábitat Natural y otras en cautiverio.\r\n\r\nAnfibios\r\n\r\nDentro de los anfibios encontramos algunas especies de anuros (ranas y sapos):\r\n\r\nReptiles\r\n\r\nEn el grupo de reptiles encontramos especies tales como: yacaré negro y overo, iguana overa, tortugas acuáticas y terrestres y un sin número de lagartijas, algunas serpientes como culebras verdes arborícola entra otras.\r\n\r\nAlgunos de los quelonios que podemos encontrar en la reserva son las tortugas terrestres (Chelolonides chilensis) y tortugas acuáticas (Phrynops hilari).\r\n\r\nAves\r\n\r\nAlgunas aves silvestres que podemos encontrar en la reserva Guaycolec como ser tucanes, Búhos, mira sol, jacanas, chuñas, muitú, entre otros.\r\n\r\nEl curso de agua más importante que pasa por la reserva es el riacho Pilagás albergando una gran cantidad de avifauna como garzas blancas, patillos, etc.\r\n\r\nMamíferos\r\n\r\nLos mamíferos que podes encontrar en la reserva son: carpinchos, aguara guazú, pecaries, jabalíes, tapires, coatíes, osos meleros, nutrias, monos carayás y mirikinas etc.', '2022-02-11 11:46:27'),
(34, 'Reserva de Biósfera Riacho Teuquito', '', 346, 6, 1, 7, 'Ocupa una superficie de 81.000 hectáreas y se crea en el año 2000 a raíz de la propuesta de la Argentina en que esta zona se declare reserva para proteger los recursos naturales y ambientales del Chaco Seco, impulsando la integración armónica de las poblaciones y la naturaleza.\r\n.\r\nFlora y fauna: Comprende especies vegetales como el quebracho colorado santiagueño y el blanco, el palo santo, algarrobos y cactus quimilero, mientras que su fauna  cuenta con especies como el tatú carreta, variedad de peces, anfibios, reptiles, yacaré ñato u overo, el tapir, el yaguareté, el chancho quimilero, etc.', '2022-02-14 09:26:29'),
(35, 'Reserva de Biósfera Laguna Oca', '', 347, 6, 1, 7, 'La RB se encuentra dentro de la denominada planicie de inundación de los ríos Paraguay y Paraná. Esta área es una típica llanura aluvial regida por la acción de los ríos antes mencionados y está constituida por brazos meandrosos laterales del canal principal, lagunas\r\nEste mosaico de ecosistemas donde se mezclan comunidades acuáticas, riachos y esteros bordeados por bosques en galería, sabanas inundables, pastizales y palmares, que alberga una invalorable riqueza en su biodiversidad, constituye un singular macroecosistema que da origen a un paisaje de particular belleza y de gran valor ecológico y ambiental.\r\nEn la RB son característicos los bosques fluviales y las áreas deprimidas con amplio dominio de vegetación herbácea, muchas veces compartidas con especies de palma.\r\nLos bosques en galería constituyen el ecosistema de mayor riqueza florística de la región Chaqueña, con contribuciones que pertenecen al bosque fluvial, ejemplares del bosque leñoso de madera dura y las propias de la formación. Son estructuras generalmente densas, con abundante sotobosque y una gran abundancia de epífitas, lianas y orquídeas. A estos bosques se los considera como el límite de penetración de la Selva Paranaense.\r\nLa gran variedad de ambientes (bosques, esteros, bañados, sabanas, pastizales, lagos y ríos) hace que se presente en la región una notable cantidad y diversidad de fauna silvestre.', '2022-02-14 09:25:58'),
(36, 'Estadio Club 8 de Diciembre', 'Presidente del Club Roberto Mereles', 404, 6, 1, 8, 'alquier de espacios para carpas, esta el club 8 de Diciembre ( a 6 cuadras del predio del Pomelo)\r\nPor carpa $ 2.000 por día, paso el número de contacto del resp. en ese tema por cualquier consulta.\r\nEl club cuenta con baños, cuidador y policía para esos días, se cobra por carpa no por cantidad de personas.\r\nCONSULTAR POR RAMIREZ EZEQUIEL 3718521441', '2022-08-31 08:22:41'),
(39, 'La Posada del Cacique', 'Aníbal Gimenez', 616, 6, 2, 3, 'Espacio Recreativo- Parrillas (disponible todo el año )\r\nPileta semi olímpica (disponible temporada de verano)', '2023-05-16 10:48:09');

--
-- Disparadores `servicios_generales`
--
DELIMITER $$
CREATE TRIGGER `borrarservigenerales` AFTER DELETE ON `servicios_generales` FOR EACH ROW INSERT INTO auditoria(tabla, accion,old_value, usuario_id) VALUES ('servicios_generales', 'DELETE',CONCAT('{"`id_servicios_generales`":', old.`id_servicios_generales`, ',"`idoneo_servicio_general`":', old.`idoneo_servicio_general`, '}'), 3)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `crearservigenerales` AFTER INSERT ON `servicios_generales` FOR EACH ROW INSERT INTO auditoria(tabla, accion, new_value, usuario_id) VALUES ('servicios_generales', 'INSERT', CONCAT('{"`id_servicios_generales`":', new.`id_servicios_generales`, ',"`idoneo_servicio_general`":', new.`idoneo_servicio_general`, '}'), 25)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `editarservigenerales` AFTER UPDATE ON `servicios_generales` FOR EACH ROW INSERT INTO auditoria(tabla, accion,old_value, new_value, usuario_id) VALUES ('servicios_generales', 'UPDATE',CONCAT('{"`id_servicios_generales`":', old.`id_servicios_generales`, ',"`idoneo_servicio_general`":', old.`idoneo_servicio_general`, '}'), CONCAT('{"`id_servicios_generales`":', new.`id_servicios_generales`, ',"`idoneo_servicio_general`":', new.`idoneo_servicio_general`, '}'), 25)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios_prestadores`
--

CREATE TABLE `servicios_prestadores` (
  `id_servicios_prestadores` int(11) NOT NULL,
  `rela_tipo_servicios_presta` int(11) DEFAULT NULL,
  `otros_servicios_prestadores` varchar(255) DEFAULT NULL,
  `rela_servicios_prestadores` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `servicios_prestadores`
--

INSERT INTO `servicios_prestadores` (`id_servicios_prestadores`, `rela_tipo_servicios_presta`, `otros_servicios_prestadores`, `rela_servicios_prestadores`) VALUES
(9, 2, 'Turismo aventura en piraguas-kayaks, kayak fishing, experiencias en contacto con la naturaleza ; senderismo observación de aves y campamentos', 5),
(10, 3, 'Turismo aventura en piraguas-kayaks, kayak fishing, experiencias en contacto con la naturaleza ; senderismo observación de aves y campamentos', 5),
(11, 6, 'Turismo aventura en piraguas-kayaks, kayak fishing, experiencias en contacto con la naturaleza ; senderismo observación de aves y campamentos', 5),
(12, 11, 'Turismo aventura en piraguas-kayaks, kayak fishing, experiencias en contacto con la naturaleza ; senderismo observación de aves y campamentos', 5),
(13, 8, 'Excursiones al Bañado La Estrella desde Ciudad de Formosa.', 6),
(14, 10, 'Excursiones al Bañado La Estrella desde Ciudad de Formosa.', 6),
(15, 2, 'Avistaje de aves y safari fotográfico. Campamentos ecológicos. recreación en la Naturaleza', 7),
(16, 3, 'Avistaje de aves y safari fotográfico. Campamentos ecológicos. recreación en la Naturaleza', 7),
(17, 2, '', 8),
(18, 4, '', 8),
(19, 1, 'Bichos de río es una comunidad de actividades al aire libre, canotaje, ciclismo aventura y acampe. - Fomentamos el respeto al medio ambiente, el uso responsable de los recursos naturales, el compañerismo y el trabajo en equipo.', 9),
(20, 4, 'Bichos de río es una comunidad de actividades al aire libre, canotaje, ciclismo aventura y acampe. - Fomentamos el respeto al medio ambiente, el uso responsable de los recursos naturales, el compañerismo y el trabajo en equipo.', 9),
(21, 1, 'Paseos, travesías y alquiler de embarcaciones', 10),
(22, 6, 'Paseos, travesías y alquiler de embarcaciones', 10),
(23, 4, 'Espacio de encuentro cultural', 11),
(24, 3, 'Guía local baqueano - paseos en piraguas, botes - avistaje de aves - caminatas y senderismo.', 12),
(25, 11, 'Guía local baqueano - paseos en piraguas, botes - avistaje de aves - caminatas y senderismo.', 12),
(27, 6, 'Los mejores paseos para disfrutar de la fauna y la flora de la Laguna Herradura-Formosa', 14),
(28, 10, 'Los mejores paseos para disfrutar de la fauna y la flora de la Laguna Herradura-Formosa', 14),
(31, 7, '\"La Estrella\" es una organización dedicada al turismo rural y somos guía de visita al Bañado La Estrella.', 17),
(34, 7, '', 19),
(35, 1, 'Alquiler de kayaks', 20),
(36, 3, 'Guía vaqueano de aves - cabalgatas - piraguas - paseos turísticos - gastronomía local', 21),
(37, 9, 'Guía vaqueano de aves - cabalgatas - piraguas - paseos turísticos - gastronomía local', 21),
(38, 11, 'Guía vaqueano de aves - cabalgatas - piraguas - paseos turísticos - gastronomía local', 21),
(39, 7, 'Navegación y coordinación de turismo comunitario', 22),
(42, 6, 'Navegación', 24),
(43, 9, '', 25),
(44, 9, '', 26),
(45, 2, '', 27),
(46, 9, '', 28),
(50, 3, 'Cordina el club de avistaje de aves', 32),
(51, 1, '', 33),
(54, 4, 'Guía de Parques', 16),
(56, 4, 'Productos Regionales', 37),
(57, 9, 'Turismo Rural - Doma y Amanse', 38),
(58, 4, 'Recuerdos de la provincia de Formosa', 39),
(59, 14, 'diseño y moda', 40),
(60, 14, 'Artesanías salvajes de la Laguna de los Indios. Mitos y leyendas, agua, flora y fauna tejen las historias de este lugar mágico donde crecí y que me inspiraron a llevar este emprendimiento.', 13),
(61, 15, 'GUARDERIA DE EMBARCACIONES- BAR- CANTINA-CAMPING', 41),
(62, 7, 'alojamientos temporarios-servicios para alquiler de eventos sociales-reuniones', 42),
(63, 4, 'Ciclismo- BiciTurismo- Paseos-Entrenamiento Ciclismo MTB y Ruta', 43),
(64, 1, 'Excursiones de cicloturismo y canotaje en la Ciudad de Formosa.', 4),
(65, 16, 'Excursiones de cicloturismo y canotaje en la Ciudad de Formosa.', 4),
(68, 8, 'GUIA- TRASLADOS -NAVEGACIÓN', 46),
(69, 4, 'Guias y Navegación', 47),
(70, 4, 'Guia y Navegación', 48),
(71, 4, 'GUIA Y NAVEGACIÓN', 49),
(72, 6, 'NAVEGACIÓN', 50),
(73, 6, 'NAVEGACIÓN', 51),
(74, 4, 'GUIA Y NAVEGACIÓN', 52),
(75, 6, 'NAVEGACIÓN', 53),
(76, 6, 'GUIA Y NAVEGACIÓN', 54),
(77, 6, 'GUIA Y NAVEGACIÓN', 55),
(78, 6, 'GUIA Y NAVEGACIÓN', 56),
(79, 4, 'GUIA Y NAVEGACIÓN', 57),
(80, 6, 'GUIA Y NAVEGACIÓN', 57),
(81, 9, '', 23),
(82, 9, 'TURISMO AVENTURA- CABALGATAS', 58),
(83, 17, 'GASTRONOMIA- FOOD TRUCK MOVIL PARA EVENTOS EN EL INTERIOR DE LA PROVINCIA', 59);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios_transportes`
--

CREATE TABLE `servicios_transportes` (
  `id_servicios_transportes` int(11) NOT NULL,
  `descripcion_serv_transportes` varchar(255) DEFAULT NULL,
  `fecha_edit_serv_transporte` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `rela_serv_transporte` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `servicios_transportes`
--

INSERT INTO `servicios_transportes` (`id_servicios_transportes`, `descripcion_serv_transportes`, `fecha_edit_serv_transporte`, `rela_serv_transporte`) VALUES
(5, 'transporte', '2023-05-19 12:42:56', 5),
(6, '', '2023-05-19 13:14:40', 6),
(7, 'transporte', '2023-05-19 13:27:38', 7),
(8, ' alquiler de autos', '2023-05-19 14:00:08', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `serv_complemetarios_alojamiento`
--

CREATE TABLE `serv_complemetarios_alojamiento` (
  `id_serv_comple_alojamiento` int(11) NOT NULL,
  `cantidad_salones` int(244) NOT NULL,
  `capacidad_salones` varchar(244) NOT NULL,
  `wifi_salones` varchar(244) NOT NULL,
  `estacionamiento_salones` varchar(255) NOT NULL,
  `otros_servicio_salones` varchar(244) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `serv_complemetarios_alojamiento`
--

INSERT INTO `serv_complemetarios_alojamiento` (`id_serv_comple_alojamiento`, `cantidad_salones`, `capacidad_salones`, `wifi_salones`, `estacionamiento_salones`, `otros_servicio_salones`) VALUES
(28, 0, '', '', '', ''),
(30, 0, 'no tiene', 'si se puede hacver', 'si tiene 2 salones', 'si posee 1 salon para reunion'),
(33, 2, '200 personas c/u', 'Si', 'Si', 'Terraza al aire libre, gastronomía.'),
(34, 0, '', '', '', ''),
(35, 0, '', '', '', ''),
(36, 0, '', '', 'tiene 2 salones habilitados', ''),
(37, 0, '', '', '', ''),
(38, 0, '', '', '', ''),
(39, 0, '', '', '', ''),
(40, 0, '', '', '', ''),
(41, 0, '', '', '', ''),
(42, 0, '', '', '', ''),
(43, 0, '', '', '', ''),
(44, 0, '', '', '', ''),
(45, 0, '', '', '', ''),
(47, 0, '', '', '', ''),
(48, 0, '', '', '', ''),
(49, 0, '', '', '', ''),
(50, 0, '', '', '', ''),
(51, 0, '', '', '', ''),
(52, 0, '', '', '', ''),
(53, 0, '', '', '', ''),
(54, 0, '', '', '', ''),
(55, 0, '', '', '', ''),
(56, 0, '', '', '', ''),
(57, 0, '', '', '', ''),
(58, 0, '', '', '', ''),
(59, 0, '', '', '', ''),
(60, 0, '', '', '', ''),
(61, 0, '', '', '', ''),
(62, 0, '', '', '', ''),
(63, 0, '', '', '', ''),
(65, 0, '', '', '', ''),
(68, 0, '', '', '', ''),
(70, 0, '', '', '', ''),
(71, 0, '', '', '', ''),
(72, 0, '', '', '', ''),
(73, 0, '', '', '', ''),
(74, 0, '', '', '', ''),
(75, 0, '', '', '', ''),
(76, 0, '', '', '', ''),
(77, 0, '', '', '', ''),
(78, 0, '', '', '', ''),
(79, 0, '', '', '', ''),
(80, 0, '', '', '', ''),
(81, 0, '', '', '', ''),
(82, 0, '', '', '', ''),
(84, 0, '', '', '', ''),
(85, 0, '', '', '', ''),
(87, 0, '', '', '', ''),
(89, 0, '', '', '', ''),
(90, 0, '', '', '', ''),
(91, 0, '', '', '', ''),
(92, 0, '', '', '', ''),
(93, 0, '', '', '', ''),
(94, 0, '', '', '', ''),
(95, 0, '', '', '', ''),
(97, 0, '', '', '', ''),
(98, 0, '', '', '', ''),
(99, 0, '', '', '', ''),
(100, 0, '', '', '', ''),
(101, 0, '', '', '', ''),
(102, 0, '', '', '', ''),
(103, 0, '', 'Si', '', 'Habitaciones de primer nivel, salon para eventos'),
(107, 0, '', '', '', ''),
(112, 0, '', '', '', ''),
(113, 0, '', '', '', ''),
(114, 0, '', '', '', ''),
(115, 1, '', '', '', ''),
(116, 0, '', '', '', ''),
(117, 0, '', '', '', ''),
(118, 0, '', '', '', ''),
(119, 0, '', '', '', ''),
(120, 0, '', '', '', ''),
(121, 0, '', '', '', ''),
(122, 0, '', '', '', ''),
(123, 0, '', '', '', ''),
(124, 0, '', '', '', ''),
(125, 0, '', '', '', ''),
(126, 0, '', '', '', ''),
(127, 0, '', '', '', ''),
(128, 0, '', '', '', ''),
(129, 0, '', '', '', ''),
(130, 0, '', '', '', ''),
(131, 0, '', '', '', ''),
(132, 0, '', '', '', ''),
(133, 0, '', '', '', ''),
(134, 0, '', '', '', ''),
(135, 0, '', '', '', ''),
(136, 0, '', '', '', ''),
(137, 0, '', '', '', ''),
(138, 0, '', '', '', ''),
(141, 1, '1', '1', '1', '1'),
(142, 1, '1', '1', '1', '1'),
(143, 0, '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `id_sucursal` int(11) NOT NULL,
  `rela_tipo_sucursal` int(11) DEFAULT NULL,
  `rela_sucursal_alojamiento` int(11) DEFAULT NULL,
  `rela_sucursal_agencia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tablas`
--

CREATE TABLE `tablas` (
  `id_tablas` int(11) NOT NULL,
  `descriTablas` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tablas`
--

INSERT INTO `tablas` (`id_tablas`, `descriTablas`) VALUES
(1, 'Todas las tablas'),
(2, 'Alojamientos'),
(3, 'Agencias'),
(4, 'Asistencia'),
(5, 'Calendario'),
(6, 'Festivales'),
(7, 'Gastronomía'),
(8, 'Museo'),
(9, 'Organismos'),
(10, 'Personales'),
(11, 'Prestadores'),
(12, 'Referente Municipal'),
(13, 'Salones'),
(14, 'Servicios Generales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE `tareas` (
  `id_tareas` int(11) NOT NULL,
  `descripcion_tareas` varchar(255) DEFAULT NULL,
  `checkbox_tareas` varchar(255) DEFAULT NULL,
  `modificacion_tareas` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tareas`
--

INSERT INTO `tareas` (`id_tareas`, `descripcion_tareas`, `checkbox_tareas`, `modificacion_tareas`) VALUES
(63, 'rony subi toda la información de alojamientos de las lomitas en la web', '1', '2023-05-15 19:05:16'),
(65, 'cambia el calendario de abril a MAYO', '1', '2023-07-03 11:38:14'),
(66, 'Fabi esta verificando el gastronomía para publicar en la web', '1', '2023-07-03 11:38:16'),
(67, 'Rony agregar el nuevo hospedaje de tacaagle a la web', '0', '2023-07-04 12:20:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_alojamiento`
--

CREATE TABLE `tipo_alojamiento` (
  `id_tipo_alojamiento` int(10) NOT NULL,
  `descripcion_tipo_alojamiento` varchar(244) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_alojamiento`
--

INSERT INTO `tipo_alojamiento` (`id_tipo_alojamiento`, `descripcion_tipo_alojamiento`) VALUES
(1, 'HOTEL'),
(2, 'CABAÑA'),
(4, 'QUINTA'),
(5, 'HOSPEDAJE'),
(6, 'RESIDENCIA'),
(7, 'HOSTEL'),
(8, 'HOSTAL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_contacto`
--

CREATE TABLE `tipo_contacto` (
  `id_tipo_contacto` int(10) NOT NULL,
  `descripcion_tipo_contacto` varchar(244) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_contacto`
--

INSERT INTO `tipo_contacto` (`id_tipo_contacto`, `descripcion_tipo_contacto`) VALUES
(1, 'correo'),
(2, 'telefono'),
(4, 'facebook'),
(5, 'instagram'),
(6, 'twitter'),
(7, 'sitio web'),
(8, 'otro'),
(9, 'telefono fijo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_contrato`
--

CREATE TABLE `tipo_contrato` (
  `id_tipo_contrato` int(11) NOT NULL,
  `descripcion_contrato` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_contrato`
--

INSERT INTO `tipo_contrato` (`id_tipo_contrato`, `descripcion_contrato`) VALUES
(1, 'Jornalizado/a'),
(2, 'Contrato Bajo'),
(3, 'Contrato Intermedio'),
(4, 'Contrato Alto'),
(5, 'Planta Permanente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_de_servicio`
--

CREATE TABLE `tipo_de_servicio` (
  `id_tipo_servicio` int(11) NOT NULL,
  `descripcion_servicio` varchar(244) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_de_servicio`
--

INSERT INTO `tipo_de_servicio` (`id_tipo_servicio`, `descripcion_servicio`) VALUES
(1, 'Público'),
(2, 'Privado'),
(3, 'ONG'),
(4, 'Organización sin fines de lucro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_encargado`
--

CREATE TABLE `tipo_encargado` (
  `id_tipo_encargado` int(11) NOT NULL,
  `descripcion_tipo_encargado` varchar(244) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_encargado`
--

INSERT INTO `tipo_encargado` (`id_tipo_encargado`, `descripcion_tipo_encargado`) VALUES
(1, 'Encargado de Turismo'),
(2, 'Encargado de Museos'),
(3, 'Encargado de Cultura'),
(4, 'Secretario/a'),
(5, 'Intendente'),
(6, 'Referente Local'),
(7, 'otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_estacion`
--

CREATE TABLE `tipo_estacion` (
  `id_tipo_estacion` int(11) NOT NULL,
  `descripcion_estacion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_estacion`
--

INSERT INTO `tipo_estacion` (`id_tipo_estacion`, `descripcion_estacion`) VALUES
(1, 'Verano'),
(2, 'Primavera'),
(3, 'Otoño'),
(4, 'Invierno'),
(6, 'Todo el año');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_estado`
--

CREATE TABLE `tipo_estado` (
  `id_tipo_estado` int(11) NOT NULL,
  `descripcion_tipo_estado` varchar(244) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_estado`
--

INSERT INTO `tipo_estado` (`id_tipo_estado`, `descripcion_tipo_estado`) VALUES
(1, 'Activo'),
(2, 'Baja'),
(3, 'Centro de aislamiento'),
(4, 'Cambio de domicilio'),
(5, 'Se desconoce situación'),
(6, 'Cierre temporario'),
(7, 'No Fiscalizadas'),
(8, 'Domicilio Virtual'),
(9, 'Falta Verificar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_estado_personal`
--

CREATE TABLE `tipo_estado_personal` (
  `id_tipo_estado_personal` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_estado_personal`
--

INSERT INTO `tipo_estado_personal` (`id_tipo_estado_personal`, `descripcion`) VALUES
(1, 'Activo'),
(2, 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_guias`
--

CREATE TABLE `tipo_guias` (
  `id_tipo_guis` int(10) NOT NULL,
  `descripcion_tipo_guias` varchar(244) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_lugar`
--

CREATE TABLE `tipo_lugar` (
  `id_tipo_lugar` int(11) NOT NULL,
  `descripcion_lugar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_lugar`
--

INSERT INTO `tipo_lugar` (`id_tipo_lugar`, `descripcion_lugar`) VALUES
(1, 'Pileta'),
(2, 'Playa'),
(3, 'Camping'),
(4, 'Parque Acuático'),
(6, 'Parque Nacional'),
(7, 'Reserva Natural'),
(8, 'Club Social y Deportivo'),
(9, 'Club Social'),
(10, 'Club Deportivo'),
(11, 'Estadio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_municipio`
--

CREATE TABLE `tipo_municipio` (
  `id_municipio` int(11) NOT NULL,
  `descripcion_municipio` varchar(244) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_municipio`
--

INSERT INTO `tipo_municipio` (`id_municipio`, `descripcion_municipio`) VALUES
(1, 'Nacional'),
(2, 'Provincial'),
(3, 'Municipal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_personal`
--

CREATE TABLE `tipo_personal` (
  `id_tipo_personal` int(11) NOT NULL,
  `descri_tipo_personal` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_personal`
--

INSERT INTO `tipo_personal` (`id_tipo_personal`, `descri_tipo_personal`) VALUES
(1, 'Ministra'),
(2, 'Director/ra'),
(3, 'Empleado/a'),
(4, 'Encargado/a'),
(5, 'Recursos Humanos'),
(6, 'Secretario/a'),
(7, 'Secretario/a Privada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_prestador`
--

CREATE TABLE `tipo_prestador` (
  `id_tipo_prestador` int(11) NOT NULL,
  `descripcion_tipo_prestador` varchar(244) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_prestador`
--

INSERT INTO `tipo_prestador` (`id_tipo_prestador`, `descripcion_tipo_prestador`) VALUES
(1, 'Prestador de Servicio'),
(2, 'Guía de Turismo'),
(3, 'Operador Turístico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_servicios_prestadores`
--

CREATE TABLE `tipo_servicios_prestadores` (
  `id_tipo_servicios_prestadores` int(11) NOT NULL,
  `descrip_tipo_serv_prestadores` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_servicios_prestadores`
--

INSERT INTO `tipo_servicios_prestadores` (`id_tipo_servicios_prestadores`, `descrip_tipo_serv_prestadores`) VALUES
(1, 'canotaje'),
(2, 'senderismo'),
(3, 'avistaje de aves'),
(4, 'turismo aventura'),
(5, 'guía de pesca'),
(6, 'paseo náutico '),
(7, 'turismo rural'),
(8, 'traslados'),
(9, 'cabalgata'),
(10, 'transporte'),
(11, 'piraguas'),
(12, 'Alquiler de Auto'),
(13, 'Alquiler de Combis'),
(14, 'Artesanías'),
(15, 'Guardería Náutica'),
(16, 'Ciclismo '),
(17, 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_sucursal`
--

CREATE TABLE `tipo_sucursal` (
  `id_tipo_sucursal` int(11) NOT NULL,
  `descripcion_tipo_sucursal` varchar(244) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_vehiculo`
--

CREATE TABLE `tipo_vehiculo` (
  `id_tipo_vehiculo` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_vehiculo`
--

INSERT INTO `tipo_vehiculo` (`id_tipo_vehiculo`, `descripcion`) VALUES
(1, 'Colectivo Larga Distancia'),
(2, 'Avión'),
(3, 'Avioneta'),
(4, 'Colectivo Urbano');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transportes`
--

CREATE TABLE `transportes` (
  `id_transportes` int(11) NOT NULL,
  `designacion_transporte` varchar(255) DEFAULT NULL,
  `idoneo_transportes` varchar(255) DEFAULT NULL,
  `rela_direccion` int(11) DEFAULT NULL,
  `fecha_edit_transporte` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `transportes`
--

INSERT INTO `transportes` (`id_transportes`, `designacion_transporte`, `idoneo_transportes`, `rela_direccion`, `fecha_edit_transporte`) VALUES
(5, 'Transporte Lacuadri', '', 633, '2023-05-19 12:42:56'),
(6, 'carmen traffic', '', 634, '2023-05-19 13:14:40'),
(7, 'Lorient S.A.', 'luis Barco', 635, '2023-05-19 13:27:38'),
(8, 'alquiler de autos en Formosa', 'laura lopez', 636, '2023-05-19 14:00:08');

--
-- Disparadores `transportes`
--
DELIMITER $$
CREATE TRIGGER `borrartransportes` AFTER DELETE ON `transportes` FOR EACH ROW INSERT INTO auditoria(tabla, accion,old_value, usuario_id) VALUES ('transportes', 'DELETE',CONCAT('{"`id_transportes`":', old.`id_transportes`, ',"`idoneo_transportes`":', old.`idoneo_transportes`, '}'), 25)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `crearTransportes` AFTER INSERT ON `transportes` FOR EACH ROW INSERT INTO auditoria(tabla, accion, new_value, usuario_id) VALUES ('Transportes', 'INSERT', CONCAT('{"`id_transportes`":', new.`id_transportes`, ',"`idoneo_transportes`":', new.`idoneo_transportes`, '}'), 25)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `editarTransportes` AFTER UPDATE ON `transportes` FOR EACH ROW INSERT INTO auditoria(tabla, accion,old_value, new_value, usuario_id) VALUES ('Transportes', 'UPDATE',CONCAT('{"`id_transportes`":', old.`id_transportes`, ',"`idoneo_transportes`":', old.`idoneo_transportes`, '}'), CONCAT('{"`id_transportes`":', new.`id_transportes`, ',"`idoneo_transportes`":', new.`idoneo_transportes`, '}'), 25)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_contra`
--

CREATE TABLE `usuario_contra` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(244) NOT NULL,
  `contraseña` varchar(244) NOT NULL,
  `rela_rol_id` int(11) NOT NULL,
  `rela_tablas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario_contra`
--

INSERT INTO `usuario_contra` (`id_usuario`, `usuario`, `contraseña`, `rela_rol_id`, `rela_tablas`) VALUES
(2, 'ministra', 'sil4432', 1, NULL),
(3, 'admin', '1234', 1, 1),
(6, 'visitante', '1234', 2, NULL),
(15, 'rrhh', 'rh2023', 3, NULL),
(23, 'roxana', 'rox2023', 3, NULL),
(25, 'ceciliag', 'cecig2023', 3, NULL),
(31, 'karla', 'karlar2023', 3, NULL),
(40, 'gonzaloBo', 'gonzaloBo2680', 2, NULL),
(41, 'silvinaCa', 'silvinaCa3044', 2, NULL),
(42, 'Ronaldo EmmanuelAl', 'Ronaldo EmmanuelAl6818', 2, NULL),
(43, 'Mabel EdithAr', 'Mabel EdithAr6650', 2, NULL),
(44, 'Rodrigo LeandroAr', 'Rodrigo LeandroAr1422', 2, NULL),
(45, 'Gloria HortenciaAr', 'Gloria HortenciaAr8646', 2, NULL),
(46, 'Sabrina EdithAr', 'Sabrina EdithAr9248', 2, NULL),
(47, 'Roxana EdithBa', 'Roxana EdithBa8622', 2, NULL),
(48, 'Laura ElenaBa', 'Laura ElenaBa3102', 2, NULL),
(49, 'Marta NoemíBo', 'Marta NoemíBo3443', 2, NULL),
(50, 'AntonioBo', 'AntonioBo1942', 2, NULL),
(51, 'Facundo MartinBr', 'Facundo MartinBr5451', 2, NULL),
(52, 'Javier MartinBr', 'Javier MartinBr3493', 2, NULL),
(53, 'Denis Vanina C', 'Denis Vanina C5937', 2, NULL),
(54, 'Mirta EstherCa', 'Mirta EstherCa3515', 2, NULL),
(55, 'Nilda BuenaventuraCa', 'Nilda BuenaventuraCa4375', 2, NULL),
(56, 'Andrea SilvinaCa', 'Andrea SilvinaCa1656', 2, NULL),
(57, 'Lourdes RominaCe', 'Lourdes RominaCe1908', 2, NULL),
(58, 'Mariana AnahiCo', 'Mariana AnahiCo4188', 2, NULL),
(59, 'matias', 'matias2023', 3, NULL),
(60, 'Sonia MarcelaDe', 'Sonia MarcelaDe3315', 2, NULL),
(61, 'Julio SergioDu', 'Julio SergioDu8753', 2, NULL),
(62, 'Gabriela AntonellaEl', 'Gabriela AntonellaEl3021', 2, NULL),
(63, 'AlejoEs', 'AlejoEs5997', 2, NULL),
(64, 'Walter NestorFe', 'Walter NestorFe4556', 2, NULL),
(65, 'Maria EvaFe', 'Maria EvaFe6126', 2, NULL),
(66, 'RocioMa', 'RocioMa1457', 2, NULL),
(67, 'JorgeFe', 'JorgeFe8295', 2, NULL),
(68, 'Ariel GustavoGa', 'Ariel GustavoGa5374', 2, NULL),
(69, 'Mauro EugenioGa', 'Mauro EugenioGa4078', 2, NULL),
(70, 'Rodrigo SalvadorGa', 'Rodrigo SalvadorGa7636', 2, NULL),
(71, 'nadia', 'nadiaR2023', 3, NULL),
(72, 'Rosa CeciliaGi', 'Rosa CeciliaGi5861', 2, NULL),
(73, 'Hauff ColcombetCe', 'Hauff ColcombetCe1980', 2, NULL),
(74, 'Pedro AlfredoIz', 'Pedro AlfredoIz7445', 2, NULL),
(75, 'maria', 'maria2023', 2, NULL),
(76, 'fabian', 'fabianb2023', 3, NULL),
(77, 'Clarisa EmiliaKr', 'Clarisa EmiliaKr4817', 2, NULL),
(78, 'Walter SimonLa', 'Walter SimonLa5780', 2, NULL),
(79, 'Emilio OsvaldoLe', 'Emilio OsvaldoLe4164', 2, NULL),
(80, 'Fiama SoledadLo', 'Fiama SoledadLo6010', 2, NULL),
(81, 'Gladys Isabel Ma', 'Gladys Isabel Ma6157', 2, NULL),
(82, 'Monica ManuelaMo', 'Monica ManuelaMo9639', 2, NULL),
(83, 'Roxana CelesteMo', 'Roxana CelesteMo9873', 2, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viajes`
--

CREATE TABLE `viajes` (
  `id_viajes` int(11) NOT NULL,
  `horario_salida` time DEFAULT NULL,
  `horario_llegada` time DEFAULT NULL,
  `fecha_salida` date DEFAULT NULL,
  `fecha_llegada` date DEFAULT NULL,
  `rela_origen_destino` int(11) DEFAULT NULL,
  `fecha_edit_viajes` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `viajes`
--

INSERT INTO `viajes` (`id_viajes`, `horario_salida`, `horario_llegada`, `fecha_salida`, `fecha_llegada`, `rela_origen_destino`, `fecha_edit_viajes`) VALUES
(65, NULL, NULL, NULL, NULL, 17, '2022-10-03 09:25:12'),
(66, '09:24:00', '09:30:00', NULL, NULL, 17, '2022-10-03 09:25:12'),
(67, '10:24:00', '10:30:00', NULL, NULL, 17, '2022-10-03 09:25:12'),
(68, '11:24:00', '11:30:00', NULL, NULL, 17, '2022-10-03 09:25:12'),
(69, NULL, NULL, NULL, NULL, 18, '2022-10-04 18:20:01'),
(70, '18:19:00', '18:30:00', NULL, NULL, 18, '2022-10-04 18:20:01'),
(71, '19:19:00', '19:19:00', NULL, NULL, 18, '2022-10-04 18:20:01'),
(72, NULL, NULL, NULL, NULL, 19, '2022-10-04 18:25:01'),
(73, '19:24:00', '19:30:00', NULL, NULL, 19, '2022-10-04 18:25:01'),
(74, '20:24:00', '20:30:00', NULL, NULL, 19, '2022-10-04 18:25:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viajes_precio_aciento`
--

CREATE TABLE `viajes_precio_aciento` (
  `id_vi_pr_ac` int(11) NOT NULL,
  `rela_viajes` int(11) NOT NULL,
  `rela_precio_aciento` int(11) NOT NULL,
  `observacion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acientos`
--
ALTER TABLE `acientos`
  ADD PRIMARY KEY (`id_acientos`);

--
-- Indices de la tabla `agencias`
--
ALTER TABLE `agencias`
  ADD PRIMARY KEY (`id_agencias`),
  ADD KEY `fk_agencia_razon_social` (`rela_razon_social_agencia`),
  ADD KEY `fk_agencia_persona` (`rela_agencias_persona`),
  ADD KEY `fk_agencia_direccion` (`rela_agencia_direccion`);

--
-- Indices de la tabla `alojamientos`
--
ALTER TABLE `alojamientos`
  ADD PRIMARY KEY (`id_alojamientos`),
  ADD KEY `fk_alojamiento_tipo_alo` (`rela_tipo_alojamiento_aloja`),
  ADD KEY `fk_alojamiento_persona` (`rela_alojamiento_persona`),
  ADD KEY `fk_alojamiento_direccion` (`rela_alojamiento_direccion`),
  ADD KEY `fk_alojamiento_razon` (`rela_razon_social_alo`),
  ADD KEY `fk_alojamiento_rubro` (`rela_alojamiento_rubro`),
  ADD KEY `fk_aloja_servicio` (`rela_aloja_servicios`),
  ADD KEY `fk_aloja_serv_adicionales` (`rela_aloja_serv_adicionales`),
  ADD KEY `fk_alojamientos_habilitacion` (`rela_habilitaciones`);

--
-- Indices de la tabla `archivos_ima_video`
--
ALTER TABLE `archivos_ima_video`
  ADD PRIMARY KEY (`id_archivo_ima_vid`),
  ADD KEY `fk_archivos_alojamientos` (`rela_alojamiento`),
  ADD KEY `fk_archivos_agencias` (`rela_agencia`),
  ADD KEY `fk_archivos_prestadores` (`rela_prestadores`),
  ADD KEY `fk_archivos_referentes` (`rela_referentes`);

--
-- Indices de la tabla `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id_areas`);

--
-- Indices de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD PRIMARY KEY (`id_asistencia`),
  ADD KEY `fk_asistencia_personal` (`rela_personal`);

--
-- Indices de la tabla `asistencia2`
--
ALTER TABLE `asistencia2`
  ADD PRIMARY KEY (`id_asistencia2`);

--
-- Indices de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usuario_auditoria` (`usuario_id`);

--
-- Indices de la tabla `calendario`
--
ALTER TABLE `calendario`
  ADD PRIMARY KEY (`id_calendario`),
  ADD KEY `fk_calendario_localidad` (`rela_localidad`);

--
-- Indices de la tabla `contacto`
--
ALTER TABLE `contacto`
  ADD PRIMARY KEY (`id_contacto`),
  ADD KEY `fk_contacto_alojamiento` (`rela_alojamiento_contacto`),
  ADD KEY `fk_contacto_prestador` (`rela_prestador_contacto`),
  ADD KEY `fk_contacto_guias` (`rela_guia_contacto`),
  ADD KEY `fk_persona_contacto` (`rela_persona_contacto`),
  ADD KEY `fk_contacto_tipo_contacto` (`rela_tipo_contacto_cont`),
  ADD KEY `fk_contacto_agencia` (`rela_contacto_agencia`),
  ADD KEY `fk_contacto_referente` (`rela_contacto_referente`),
  ADD KEY `fk_museo_contacto` (`rela_contacto_museo`),
  ADD KEY `fk_servicios_generales` (`rela_servicios_generales`),
  ADD KEY `fk_festivales` (`rela_festivales`),
  ADD KEY `fk_gastronomia_contacto` (`rela_gastronomia_contacto`),
  ADD KEY `fk_organismo_contacto` (`rela_organismo_contacto`),
  ADD KEY `fk_salones_contacto` (`rela_contacto_salones`);

--
-- Indices de la tabla `contacto_colectivo`
--
ALTER TABLE `contacto_colectivo`
  ADD PRIMARY KEY (`id_contacto_cole`),
  ADD KEY `fk_contacto_empresa` (`rela_empresa_colectivo`),
  ADD KEY `fk_empresa_contacto` (`rela_tipo_contacto_cont`);

--
-- Indices de la tabla `contacto_cursos`
--
ALTER TABLE `contacto_cursos`
  ADD PRIMARY KEY (`id_contacto_cursos`),
  ADD KEY `fk_contacto_cursos` (`rela_contacto_cursos`),
  ADD KEY `fk_contacto_con_cursos` (`rela_contacto_con`);

--
-- Indices de la tabla `contacto_transporte`
--
ALTER TABLE `contacto_transporte`
  ADD PRIMARY KEY (`id_contacto_transporte`),
  ADD KEY `fk_contacto_transporte` (`rela_contacto_transporte`),
  ADD KEY `fk_contacto_contacto` (`rela_contacto_con`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id_cursos`),
  ADD KEY `fk_localidad_cursos` (`rela_localidad_cursos`);

--
-- Indices de la tabla `departamentos_fsa`
--
ALTER TABLE `departamentos_fsa`
  ADD PRIMARY KEY (`id_departamentos_fsa`);

--
-- Indices de la tabla `deptos_mintur`
--
ALTER TABLE `deptos_mintur`
  ADD PRIMARY KEY (`id_deptos_mintur`);

--
-- Indices de la tabla `dias_licencia`
--
ALTER TABLE `dias_licencia`
  ADD PRIMARY KEY (`id_dias_licencia`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`id_direccion`),
  ADD KEY `fk_direccion_localidad` (`rela_localidad_direccion`);

--
-- Indices de la tabla `educacion`
--
ALTER TABLE `educacion`
  ADD PRIMARY KEY (`id_educacion`);

--
-- Indices de la tabla `empresa_colectivo`
--
ALTER TABLE `empresa_colectivo`
  ADD PRIMARY KEY (`id_empresa_colectivo`);

--
-- Indices de la tabla `estadistica`
--
ALTER TABLE `estadistica`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estado_actividad`
--
ALTER TABLE `estado_actividad`
  ADD PRIMARY KEY (`id_estado`),
  ADD KEY `fk_estado_alojamiento` (`rela_estado_alojamiento`),
  ADD KEY `fk_estado_agencia` (`rela_estado_agencia`),
  ADD KEY `fk_estado_guias` (`rela_estado_guia`),
  ADD KEY `fk_estado_tipo_estado` (`rela_tipo_estado`),
  ADD KEY `fk_estado_prestador` (`rela_estado_prestador`),
  ADD KEY `fk_estado_salones` (`rela_estado_salones`),
  ADD KEY `fk_estado_transportes` (`rela_estado_transportes`);

--
-- Indices de la tabla `festivales`
--
ALTER TABLE `festivales`
  ADD PRIMARY KEY (`id_festivales`),
  ADD KEY `fk_localidad` (`rela_localidad`),
  ADD KEY `fk_servicio` (`rela_tipo_servicio`);

--
-- Indices de la tabla `gastronomia`
--
ALTER TABLE `gastronomia`
  ADD PRIMARY KEY (`id_gastronomia`),
  ADD KEY `fk_gastronomia_direccion` (`rela_direccion_gastro`);

--
-- Indices de la tabla `grupo_trabajo`
--
ALTER TABLE `grupo_trabajo`
  ADD PRIMARY KEY (`id_grupo_trabajo`);

--
-- Indices de la tabla `guias`
--
ALTER TABLE `guias`
  ADD PRIMARY KEY (`id_guias`),
  ADD KEY `fk_guias_tipo_guias` (`rela_tipo_guias`),
  ADD KEY `fk_guias_persona` (`rela_personas_guias`);

--
-- Indices de la tabla `habilitacion_municipal`
--
ALTER TABLE `habilitacion_municipal`
  ADD PRIMARY KEY (`id_habi_municipal`);

--
-- Indices de la tabla `licencias`
--
ALTER TABLE `licencias`
  ADD PRIMARY KEY (`id_licencias`),
  ADD KEY `fk_personal_licencias` (`rela_personal`);

--
-- Indices de la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD PRIMARY KEY (`id_localidad`),
  ADD KEY `fk_localidad_provincia` (`rela_provincia`),
  ADD KEY `fk_localidad_departamento` (`rela_departamento`);

--
-- Indices de la tabla `museo`
--
ALTER TABLE `museo`
  ADD PRIMARY KEY (`id_museo`),
  ADD KEY `fk_museo_direccion` (`rela_direccion`);

--
-- Indices de la tabla `organismos`
--
ALTER TABLE `organismos`
  ADD PRIMARY KEY (`id_organismos`);

--
-- Indices de la tabla `origen_destino`
--
ALTER TABLE `origen_destino`
  ADD PRIMARY KEY (`id_origen_destino`),
  ADD KEY `origen_localidad` (`origen_localidad`),
  ADD KEY `destino_localidad` (`destino_localidad`),
  ADD KEY `fk_empresa` (`rela_empresa_O_D`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`id_pais`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id_persona`),
  ADD KEY `fk_persona_direccion` (`rela_persona_direccion`),
  ADD KEY `fk_persona_educacion` (`rela_educacion`),
  ADD KEY `fk_persona_usuario_contra` (`rela_usuario_contra`);

--
-- Indices de la tabla `personales`
--
ALTER TABLE `personales`
  ADD PRIMARY KEY (`id_personal`),
  ADD KEY `fk_persona_personales` (`rela_persona`),
  ADD KEY `fk_area_personales` (`rela_area`),
  ADD KEY `fk_grupo_personales` (`rela_grupo_trabajo`),
  ADD KEY `fk_tipo_personales_personales` (`rela_tipo_personal`),
  ADD KEY `fk_estado_personales` (`rela_tipo_estado`),
  ADD KEY `fk_depto_personales` (`rela_depto_mintur`),
  ADD KEY `fk_contrato_personales` (`rela_tipo_contrato`);

--
-- Indices de la tabla `precio_acientos`
--
ALTER TABLE `precio_acientos`
  ADD PRIMARY KEY (`id_precios_acientos`),
  ADD KEY `fk_aciento` (`rela_acientos`),
  ADD KEY `fk_empresa_precio` (`rela_empresa`);

--
-- Indices de la tabla `prestadores`
--
ALTER TABLE `prestadores`
  ADD PRIMARY KEY (`id_prestador`),
  ADD KEY `fk_prestador_razon` (`rela_razon_social_prestador`),
  ADD KEY `fk_prestador_persona` (`rela_persona_prestrador`),
  ADD KEY `fk_prestador_direccion` (`rela_prestador_direccion`),
  ADD KEY `fk_prestador_tipo_prestador` (`rela_tipo_prestador`);

--
-- Indices de la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`id_provincia`),
  ADD KEY `fk_provincia_pais` (`rela_pais`);

--
-- Indices de la tabla `razon_particular`
--
ALTER TABLE `razon_particular`
  ADD PRIMARY KEY (`id_razon_particular`),
  ADD KEY `fk_personal_razon` (`rela_personal`);

--
-- Indices de la tabla `razon_social`
--
ALTER TABLE `razon_social`
  ADD PRIMARY KEY (`id_razon_social`);

--
-- Indices de la tabla `referentes_municipal`
--
ALTER TABLE `referentes_municipal`
  ADD PRIMARY KEY (`id_referentes`),
  ADD KEY `fk_referente_direccion` (`rela_direccion`),
  ADD KEY `fk_referente_tipo_encargado` (`rela_tipo_encargado`);

--
-- Indices de la tabla `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`id_region`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_roles`);

--
-- Indices de la tabla `rubro_alojamiento`
--
ALTER TABLE `rubro_alojamiento`
  ADD PRIMARY KEY (`id_rubro_alojamiento`);

--
-- Indices de la tabla `salones`
--
ALTER TABLE `salones`
  ADD PRIMARY KEY (`id_salones`),
  ADD KEY `fk_salones_direccion` (`rela_direccion`),
  ADD KEY `fk_salones_serv_comple` (`rela_servi_complementarios`),
  ADD KEY `fk_salones_habilitacion` (`rela_habilitacion`);

--
-- Indices de la tabla `servicios_alojamiento`
--
ALTER TABLE `servicios_alojamiento`
  ADD PRIMARY KEY (`id_servicio_alojamiento`);

--
-- Indices de la tabla `servicios_generales`
--
ALTER TABLE `servicios_generales`
  ADD PRIMARY KEY (`id_servicios_generales`),
  ADD KEY `fk_servicios_direccion` (`rela_direccion`),
  ADD KEY `fk_servicios_lugar` (`rela_tipo_lugar`),
  ADD KEY `fk_servicios_estacion` (`rela_estacion`),
  ADD KEY `fk_tipo_servicios` (`rela_tipo_servicio`);

--
-- Indices de la tabla `servicios_prestadores`
--
ALTER TABLE `servicios_prestadores`
  ADD PRIMARY KEY (`id_servicios_prestadores`),
  ADD KEY `fk_servicios_tipo_servicios` (`rela_tipo_servicios_presta`),
  ADD KEY `fk_servicios_prestadores` (`rela_servicios_prestadores`);

--
-- Indices de la tabla `servicios_transportes`
--
ALTER TABLE `servicios_transportes`
  ADD PRIMARY KEY (`id_servicios_transportes`),
  ADD KEY `rela_serv_transporte` (`rela_serv_transporte`);

--
-- Indices de la tabla `serv_complemetarios_alojamiento`
--
ALTER TABLE `serv_complemetarios_alojamiento`
  ADD PRIMARY KEY (`id_serv_comple_alojamiento`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`id_sucursal`),
  ADD KEY `fk_sucursal_tipo_sucursal` (`rela_tipo_sucursal`),
  ADD KEY `fk_sucursal_alojamiento` (`rela_sucursal_alojamiento`),
  ADD KEY `fk_sucursal_agencia` (`rela_sucursal_agencia`);

--
-- Indices de la tabla `tablas`
--
ALTER TABLE `tablas`
  ADD PRIMARY KEY (`id_tablas`);

--
-- Indices de la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`id_tareas`);

--
-- Indices de la tabla `tipo_alojamiento`
--
ALTER TABLE `tipo_alojamiento`
  ADD PRIMARY KEY (`id_tipo_alojamiento`);

--
-- Indices de la tabla `tipo_contacto`
--
ALTER TABLE `tipo_contacto`
  ADD PRIMARY KEY (`id_tipo_contacto`);

--
-- Indices de la tabla `tipo_contrato`
--
ALTER TABLE `tipo_contrato`
  ADD PRIMARY KEY (`id_tipo_contrato`);

--
-- Indices de la tabla `tipo_de_servicio`
--
ALTER TABLE `tipo_de_servicio`
  ADD PRIMARY KEY (`id_tipo_servicio`);

--
-- Indices de la tabla `tipo_encargado`
--
ALTER TABLE `tipo_encargado`
  ADD PRIMARY KEY (`id_tipo_encargado`);

--
-- Indices de la tabla `tipo_estacion`
--
ALTER TABLE `tipo_estacion`
  ADD PRIMARY KEY (`id_tipo_estacion`);

--
-- Indices de la tabla `tipo_estado`
--
ALTER TABLE `tipo_estado`
  ADD PRIMARY KEY (`id_tipo_estado`);

--
-- Indices de la tabla `tipo_estado_personal`
--
ALTER TABLE `tipo_estado_personal`
  ADD PRIMARY KEY (`id_tipo_estado_personal`);

--
-- Indices de la tabla `tipo_guias`
--
ALTER TABLE `tipo_guias`
  ADD PRIMARY KEY (`id_tipo_guis`);

--
-- Indices de la tabla `tipo_lugar`
--
ALTER TABLE `tipo_lugar`
  ADD PRIMARY KEY (`id_tipo_lugar`);

--
-- Indices de la tabla `tipo_municipio`
--
ALTER TABLE `tipo_municipio`
  ADD PRIMARY KEY (`id_municipio`);

--
-- Indices de la tabla `tipo_personal`
--
ALTER TABLE `tipo_personal`
  ADD PRIMARY KEY (`id_tipo_personal`);

--
-- Indices de la tabla `tipo_prestador`
--
ALTER TABLE `tipo_prestador`
  ADD PRIMARY KEY (`id_tipo_prestador`);

--
-- Indices de la tabla `tipo_servicios_prestadores`
--
ALTER TABLE `tipo_servicios_prestadores`
  ADD PRIMARY KEY (`id_tipo_servicios_prestadores`);

--
-- Indices de la tabla `tipo_sucursal`
--
ALTER TABLE `tipo_sucursal`
  ADD PRIMARY KEY (`id_tipo_sucursal`);

--
-- Indices de la tabla `tipo_vehiculo`
--
ALTER TABLE `tipo_vehiculo`
  ADD PRIMARY KEY (`id_tipo_vehiculo`);

--
-- Indices de la tabla `transportes`
--
ALTER TABLE `transportes`
  ADD PRIMARY KEY (`id_transportes`);

--
-- Indices de la tabla `usuario_contra`
--
ALTER TABLE `usuario_contra`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `fk_usuario_roles` (`rela_rol_id`),
  ADD KEY `fk_usuarios_tablas` (`rela_tablas`);

--
-- Indices de la tabla `viajes`
--
ALTER TABLE `viajes`
  ADD PRIMARY KEY (`id_viajes`),
  ADD KEY `fk_origen_destino_viajes` (`rela_origen_destino`);

--
-- Indices de la tabla `viajes_precio_aciento`
--
ALTER TABLE `viajes_precio_aciento`
  ADD PRIMARY KEY (`id_vi_pr_ac`),
  ADD KEY `fk_viajes` (`rela_viajes`),
  ADD KEY `fk_precio_aciento` (`rela_precio_aciento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acientos`
--
ALTER TABLE `acientos`
  MODIFY `id_acientos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `agencias`
--
ALTER TABLE `agencias`
  MODIFY `id_agencias` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `alojamientos`
--
ALTER TABLE `alojamientos`
  MODIFY `id_alojamientos` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT de la tabla `archivos_ima_video`
--
ALTER TABLE `archivos_ima_video`
  MODIFY `id_archivo_ima_vid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `areas`
--
ALTER TABLE `areas`
  MODIFY `id_areas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  MODIFY `id_asistencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `asistencia2`
--
ALTER TABLE `asistencia2`
  MODIFY `id_asistencia2` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2105;

--
-- AUTO_INCREMENT de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=264;

--
-- AUTO_INCREMENT de la tabla `calendario`
--
ALTER TABLE `calendario`
  MODIFY `id_calendario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT de la tabla `contacto`
--
ALTER TABLE `contacto`
  MODIFY `id_contacto` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4288;

--
-- AUTO_INCREMENT de la tabla `contacto_colectivo`
--
ALTER TABLE `contacto_colectivo`
  MODIFY `id_contacto_cole` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `contacto_cursos`
--
ALTER TABLE `contacto_cursos`
  MODIFY `id_contacto_cursos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=351;

--
-- AUTO_INCREMENT de la tabla `contacto_transporte`
--
ALTER TABLE `contacto_transporte`
  MODIFY `id_contacto_transporte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id_cursos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT de la tabla `departamentos_fsa`
--
ALTER TABLE `departamentos_fsa`
  MODIFY `id_departamentos_fsa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `deptos_mintur`
--
ALTER TABLE `deptos_mintur`
  MODIFY `id_deptos_mintur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `dias_licencia`
--
ALTER TABLE `dias_licencia`
  MODIFY `id_dias_licencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `id_direccion` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=669;

--
-- AUTO_INCREMENT de la tabla `educacion`
--
ALTER TABLE `educacion`
  MODIFY `id_educacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `empresa_colectivo`
--
ALTER TABLE `empresa_colectivo`
  MODIFY `id_empresa_colectivo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `estadistica`
--
ALTER TABLE `estadistica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado_actividad`
--
ALTER TABLE `estado_actividad`
  MODIFY `id_estado` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=254;

--
-- AUTO_INCREMENT de la tabla `festivales`
--
ALTER TABLE `festivales`
  MODIFY `id_festivales` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `gastronomia`
--
ALTER TABLE `gastronomia`
  MODIFY `id_gastronomia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT de la tabla `grupo_trabajo`
--
ALTER TABLE `grupo_trabajo`
  MODIFY `id_grupo_trabajo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `guias`
--
ALTER TABLE `guias`
  MODIFY `id_guias` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `habilitacion_municipal`
--
ALTER TABLE `habilitacion_municipal`
  MODIFY `id_habi_municipal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `licencias`
--
ALTER TABLE `licencias`
  MODIFY `id_licencias` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT de la tabla `localidad`
--
ALTER TABLE `localidad`
  MODIFY `id_localidad` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT de la tabla `museo`
--
ALTER TABLE `museo`
  MODIFY `id_museo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `organismos`
--
ALTER TABLE `organismos`
  MODIFY `id_organismos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `origen_destino`
--
ALTER TABLE `origen_destino`
  MODIFY `id_origen_destino` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `id_pais` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id_persona` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `personales`
--
ALTER TABLE `personales`
  MODIFY `id_personal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `precio_acientos`
--
ALTER TABLE `precio_acientos`
  MODIFY `id_precios_acientos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `prestadores`
--
ALTER TABLE `prestadores`
  MODIFY `id_prestador` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de la tabla `provincia`
--
ALTER TABLE `provincia`
  MODIFY `id_provincia` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `razon_particular`
--
ALTER TABLE `razon_particular`
  MODIFY `id_razon_particular` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de la tabla `razon_social`
--
ALTER TABLE `razon_social`
  MODIFY `id_razon_social` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=187;

--
-- AUTO_INCREMENT de la tabla `referentes_municipal`
--
ALTER TABLE `referentes_municipal`
  MODIFY `id_referentes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT de la tabla `region`
--
ALTER TABLE `region`
  MODIFY `id_region` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_roles` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `rubro_alojamiento`
--
ALTER TABLE `rubro_alojamiento`
  MODIFY `id_rubro_alojamiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `salones`
--
ALTER TABLE `salones`
  MODIFY `id_salones` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `servicios_alojamiento`
--
ALTER TABLE `servicios_alojamiento`
  MODIFY `id_servicio_alojamiento` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT de la tabla `servicios_generales`
--
ALTER TABLE `servicios_generales`
  MODIFY `id_servicios_generales` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `servicios_prestadores`
--
ALTER TABLE `servicios_prestadores`
  MODIFY `id_servicios_prestadores` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT de la tabla `servicios_transportes`
--
ALTER TABLE `servicios_transportes`
  MODIFY `id_servicios_transportes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `serv_complemetarios_alojamiento`
--
ALTER TABLE `serv_complemetarios_alojamiento`
  MODIFY `id_serv_comple_alojamiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  MODIFY `id_sucursal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tablas`
--
ALTER TABLE `tablas`
  MODIFY `id_tablas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `id_tareas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT de la tabla `tipo_alojamiento`
--
ALTER TABLE `tipo_alojamiento`
  MODIFY `id_tipo_alojamiento` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tipo_contacto`
--
ALTER TABLE `tipo_contacto`
  MODIFY `id_tipo_contacto` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tipo_contrato`
--
ALTER TABLE `tipo_contrato`
  MODIFY `id_tipo_contrato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tipo_de_servicio`
--
ALTER TABLE `tipo_de_servicio`
  MODIFY `id_tipo_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipo_encargado`
--
ALTER TABLE `tipo_encargado`
  MODIFY `id_tipo_encargado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tipo_estacion`
--
ALTER TABLE `tipo_estacion`
  MODIFY `id_tipo_estacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tipo_estado`
--
ALTER TABLE `tipo_estado`
  MODIFY `id_tipo_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tipo_estado_personal`
--
ALTER TABLE `tipo_estado_personal`
  MODIFY `id_tipo_estado_personal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_guias`
--
ALTER TABLE `tipo_guias`
  MODIFY `id_tipo_guis` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_lugar`
--
ALTER TABLE `tipo_lugar`
  MODIFY `id_tipo_lugar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `tipo_municipio`
--
ALTER TABLE `tipo_municipio`
  MODIFY `id_municipio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_personal`
--
ALTER TABLE `tipo_personal`
  MODIFY `id_tipo_personal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tipo_prestador`
--
ALTER TABLE `tipo_prestador`
  MODIFY `id_tipo_prestador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_servicios_prestadores`
--
ALTER TABLE `tipo_servicios_prestadores`
  MODIFY `id_tipo_servicios_prestadores` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `tipo_sucursal`
--
ALTER TABLE `tipo_sucursal`
  MODIFY `id_tipo_sucursal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_vehiculo`
--
ALTER TABLE `tipo_vehiculo`
  MODIFY `id_tipo_vehiculo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `transportes`
--
ALTER TABLE `transportes`
  MODIFY `id_transportes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `usuario_contra`
--
ALTER TABLE `usuario_contra`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT de la tabla `viajes`
--
ALTER TABLE `viajes`
  MODIFY `id_viajes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT de la tabla `viajes_precio_aciento`
--
ALTER TABLE `viajes_precio_aciento`
  MODIFY `id_vi_pr_ac` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `agencias`
--
ALTER TABLE `agencias`
  ADD CONSTRAINT `fk_agencia_direccion` FOREIGN KEY (`rela_agencia_direccion`) REFERENCES `direccion` (`id_direccion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_agencia_persona` FOREIGN KEY (`rela_agencias_persona`) REFERENCES `persona` (`id_persona`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_agencia_razon_social` FOREIGN KEY (`rela_razon_social_agencia`) REFERENCES `razon_social` (`id_razon_social`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `alojamientos`
--
ALTER TABLE `alojamientos`
  ADD CONSTRAINT `fk_aloja_serv_adicionales` FOREIGN KEY (`rela_aloja_serv_adicionales`) REFERENCES `serv_complemetarios_alojamiento` (`id_serv_comple_alojamiento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_aloja_servicio` FOREIGN KEY (`rela_aloja_servicios`) REFERENCES `servicios_alojamiento` (`id_servicio_alojamiento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_alojamiento_direccion` FOREIGN KEY (`rela_alojamiento_direccion`) REFERENCES `direccion` (`id_direccion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_alojamiento_persona` FOREIGN KEY (`rela_alojamiento_persona`) REFERENCES `persona` (`id_persona`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_alojamiento_razon` FOREIGN KEY (`rela_razon_social_alo`) REFERENCES `razon_social` (`id_razon_social`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_alojamiento_rubro` FOREIGN KEY (`rela_alojamiento_rubro`) REFERENCES `rubro_alojamiento` (`id_rubro_alojamiento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_alojamiento_tipo_alo` FOREIGN KEY (`rela_tipo_alojamiento_aloja`) REFERENCES `tipo_alojamiento` (`id_tipo_alojamiento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_alojamientos_habilitacion` FOREIGN KEY (`rela_habilitaciones`) REFERENCES `habilitacion_municipal` (`id_habi_municipal`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `archivos_ima_video`
--
ALTER TABLE `archivos_ima_video`
  ADD CONSTRAINT `fk_archivos_agencias` FOREIGN KEY (`rela_agencia`) REFERENCES `agencias` (`id_agencias`),
  ADD CONSTRAINT `fk_archivos_alojamientos` FOREIGN KEY (`rela_alojamiento`) REFERENCES `alojamientos` (`id_alojamientos`),
  ADD CONSTRAINT `fk_archivos_prestadores` FOREIGN KEY (`rela_prestadores`) REFERENCES `prestadores` (`id_prestador`),
  ADD CONSTRAINT `fk_archivos_referentes` FOREIGN KEY (`rela_referentes`) REFERENCES `referentes_municipal` (`id_referentes`);

--
-- Filtros para la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD CONSTRAINT `fk_asistencia_personal` FOREIGN KEY (`rela_personal`) REFERENCES `personales` (`id_personal`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `auditoria`
--
ALTER TABLE `auditoria`
  ADD CONSTRAINT `fk_usuario_auditoria` FOREIGN KEY (`usuario_id`) REFERENCES `usuario_contra` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `calendario`
--
ALTER TABLE `calendario`
  ADD CONSTRAINT `fk_calendario_localidad` FOREIGN KEY (`rela_localidad`) REFERENCES `localidad` (`id_localidad`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `contacto`
--
ALTER TABLE `contacto`
  ADD CONSTRAINT `fk_contacto_agencia` FOREIGN KEY (`rela_contacto_agencia`) REFERENCES `agencias` (`id_agencias`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_contacto_alojamiento` FOREIGN KEY (`rela_alojamiento_contacto`) REFERENCES `alojamientos` (`id_alojamientos`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_contacto_guias` FOREIGN KEY (`rela_guia_contacto`) REFERENCES `guias` (`id_guias`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_contacto_prestador` FOREIGN KEY (`rela_prestador_contacto`) REFERENCES `prestadores` (`id_prestador`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_contacto_referente` FOREIGN KEY (`rela_contacto_referente`) REFERENCES `referentes_municipal` (`id_referentes`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_contacto_tipo_contacto` FOREIGN KEY (`rela_tipo_contacto_cont`) REFERENCES `tipo_contacto` (`id_tipo_contacto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_festivales` FOREIGN KEY (`rela_festivales`) REFERENCES `festivales` (`id_festivales`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_gastronomia_contacto` FOREIGN KEY (`rela_gastronomia_contacto`) REFERENCES `gastronomia` (`id_gastronomia`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_museo_contacto` FOREIGN KEY (`rela_contacto_museo`) REFERENCES `museo` (`id_museo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_organismo_contacto` FOREIGN KEY (`rela_organismo_contacto`) REFERENCES `organismos` (`id_organismos`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_persona_contacto` FOREIGN KEY (`rela_persona_contacto`) REFERENCES `persona` (`id_persona`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_salones_contacto` FOREIGN KEY (`rela_contacto_salones`) REFERENCES `salones` (`id_salones`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_servicios_generales` FOREIGN KEY (`rela_servicios_generales`) REFERENCES `servicios_generales` (`id_servicios_generales`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `contacto_colectivo`
--
ALTER TABLE `contacto_colectivo`
  ADD CONSTRAINT `fk_contacto_empresa` FOREIGN KEY (`rela_empresa_colectivo`) REFERENCES `empresa_colectivo` (`id_empresa_colectivo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_empresa_contacto` FOREIGN KEY (`rela_tipo_contacto_cont`) REFERENCES `tipo_contacto` (`id_tipo_contacto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `contacto_cursos`
--
ALTER TABLE `contacto_cursos`
  ADD CONSTRAINT `fk_contacto_con_cursos` FOREIGN KEY (`rela_contacto_con`) REFERENCES `tipo_contacto` (`id_tipo_contacto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_contacto_cursos` FOREIGN KEY (`rela_contacto_cursos`) REFERENCES `cursos` (`id_cursos`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `contacto_transporte`
--
ALTER TABLE `contacto_transporte`
  ADD CONSTRAINT `fk_contacto_contacto` FOREIGN KEY (`rela_contacto_con`) REFERENCES `tipo_contacto` (`id_tipo_contacto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_contacto_transporte` FOREIGN KEY (`rela_contacto_transporte`) REFERENCES `transportes` (`id_transportes`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD CONSTRAINT `fk_localidad_cursos` FOREIGN KEY (`rela_localidad_cursos`) REFERENCES `localidad` (`id_localidad`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD CONSTRAINT `fk_direccion_localidad` FOREIGN KEY (`rela_localidad_direccion`) REFERENCES `localidad` (`id_localidad`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `estado_actividad`
--
ALTER TABLE `estado_actividad`
  ADD CONSTRAINT `fk_estado_agencia` FOREIGN KEY (`rela_estado_agencia`) REFERENCES `agencias` (`id_agencias`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_estado_alojamiento` FOREIGN KEY (`rela_estado_alojamiento`) REFERENCES `alojamientos` (`id_alojamientos`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_estado_guias` FOREIGN KEY (`rela_estado_guia`) REFERENCES `guias` (`id_guias`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_estado_prestador` FOREIGN KEY (`rela_estado_prestador`) REFERENCES `prestadores` (`id_prestador`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_estado_salones` FOREIGN KEY (`rela_estado_salones`) REFERENCES `salones` (`id_salones`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_estado_tipo_estado` FOREIGN KEY (`rela_tipo_estado`) REFERENCES `tipo_estado` (`id_tipo_estado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_estado_transportes` FOREIGN KEY (`rela_estado_transportes`) REFERENCES `transportes` (`id_transportes`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `festivales`
--
ALTER TABLE `festivales`
  ADD CONSTRAINT `fk_localidad` FOREIGN KEY (`rela_localidad`) REFERENCES `direccion` (`id_direccion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_servicio` FOREIGN KEY (`rela_tipo_servicio`) REFERENCES `tipo_de_servicio` (`id_tipo_servicio`);

--
-- Filtros para la tabla `gastronomia`
--
ALTER TABLE `gastronomia`
  ADD CONSTRAINT `fk_gastronomia_direccion` FOREIGN KEY (`rela_direccion_gastro`) REFERENCES `direccion` (`id_direccion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `guias`
--
ALTER TABLE `guias`
  ADD CONSTRAINT `fk_guias_persona` FOREIGN KEY (`rela_personas_guias`) REFERENCES `persona` (`id_persona`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_guias_tipo_guias` FOREIGN KEY (`rela_tipo_guias`) REFERENCES `tipo_guias` (`id_tipo_guis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `licencias`
--
ALTER TABLE `licencias`
  ADD CONSTRAINT `fk_personal_licencias` FOREIGN KEY (`rela_personal`) REFERENCES `personales` (`id_personal`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD CONSTRAINT `fk_localidad_departamento` FOREIGN KEY (`rela_departamento`) REFERENCES `departamentos_fsa` (`id_departamentos_fsa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_localidad_provincia` FOREIGN KEY (`rela_provincia`) REFERENCES `provincia` (`id_provincia`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `museo`
--
ALTER TABLE `museo`
  ADD CONSTRAINT `fk_museo_direccion` FOREIGN KEY (`rela_direccion`) REFERENCES `direccion` (`id_direccion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `origen_destino`
--
ALTER TABLE `origen_destino`
  ADD CONSTRAINT `destino_localidad` FOREIGN KEY (`destino_localidad`) REFERENCES `localidad` (`id_localidad`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_empresa` FOREIGN KEY (`rela_empresa_O_D`) REFERENCES `empresa_colectivo` (`id_empresa_colectivo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `origen_localidad` FOREIGN KEY (`origen_localidad`) REFERENCES `localidad` (`id_localidad`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `fk_persona_direccion` FOREIGN KEY (`rela_persona_direccion`) REFERENCES `direccion` (`id_direccion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_persona_educacion` FOREIGN KEY (`rela_educacion`) REFERENCES `educacion` (`id_educacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_persona_usuario_contra` FOREIGN KEY (`rela_usuario_contra`) REFERENCES `usuario_contra` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `personales`
--
ALTER TABLE `personales`
  ADD CONSTRAINT `fk_area_personales` FOREIGN KEY (`rela_area`) REFERENCES `areas` (`id_areas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_contrato_personales` FOREIGN KEY (`rela_tipo_contrato`) REFERENCES `tipo_contrato` (`id_tipo_contrato`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_depto_personales` FOREIGN KEY (`rela_depto_mintur`) REFERENCES `deptos_mintur` (`id_deptos_mintur`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_estado_personales` FOREIGN KEY (`rela_tipo_estado`) REFERENCES `tipo_estado_personal` (`id_tipo_estado_personal`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_grupo_personales` FOREIGN KEY (`rela_grupo_trabajo`) REFERENCES `grupo_trabajo` (`id_grupo_trabajo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_persona_personales` FOREIGN KEY (`rela_persona`) REFERENCES `persona` (`id_persona`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tipo_personales_personales` FOREIGN KEY (`rela_tipo_personal`) REFERENCES `tipo_personal` (`id_tipo_personal`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `precio_acientos`
--
ALTER TABLE `precio_acientos`
  ADD CONSTRAINT `fk_aciento` FOREIGN KEY (`rela_acientos`) REFERENCES `acientos` (`id_acientos`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_empresa_precio` FOREIGN KEY (`rela_empresa`) REFERENCES `empresa_colectivo` (`id_empresa_colectivo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `prestadores`
--
ALTER TABLE `prestadores`
  ADD CONSTRAINT `fk_prestador_direccion` FOREIGN KEY (`rela_prestador_direccion`) REFERENCES `direccion` (`id_direccion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_prestador_persona` FOREIGN KEY (`rela_persona_prestrador`) REFERENCES `persona` (`id_persona`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_prestador_razon` FOREIGN KEY (`rela_razon_social_prestador`) REFERENCES `razon_social` (`id_razon_social`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_prestador_tipo_prestador` FOREIGN KEY (`rela_tipo_prestador`) REFERENCES `tipo_prestador` (`id_tipo_prestador`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD CONSTRAINT `fk_provincia_pais` FOREIGN KEY (`rela_pais`) REFERENCES `pais` (`id_pais`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `razon_particular`
--
ALTER TABLE `razon_particular`
  ADD CONSTRAINT `fk_personal_razon` FOREIGN KEY (`rela_personal`) REFERENCES `personales` (`id_personal`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `referentes_municipal`
--
ALTER TABLE `referentes_municipal`
  ADD CONSTRAINT `fk_referente_direccion` FOREIGN KEY (`rela_direccion`) REFERENCES `direccion` (`id_direccion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_referente_tipo_encargado` FOREIGN KEY (`rela_tipo_encargado`) REFERENCES `tipo_encargado` (`id_tipo_encargado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `salones`
--
ALTER TABLE `salones`
  ADD CONSTRAINT `fk_salones_direccion` FOREIGN KEY (`rela_direccion`) REFERENCES `direccion` (`id_direccion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_salones_habilitacion` FOREIGN KEY (`rela_habilitacion`) REFERENCES `habilitacion_municipal` (`id_habi_municipal`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_salones_serv_comple` FOREIGN KEY (`rela_servi_complementarios`) REFERENCES `serv_complemetarios_alojamiento` (`id_serv_comple_alojamiento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `servicios_generales`
--
ALTER TABLE `servicios_generales`
  ADD CONSTRAINT `fk_servicios_direccion` FOREIGN KEY (`rela_direccion`) REFERENCES `direccion` (`id_direccion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_servicios_estacion` FOREIGN KEY (`rela_estacion`) REFERENCES `tipo_estacion` (`id_tipo_estacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_servicios_lugar` FOREIGN KEY (`rela_tipo_lugar`) REFERENCES `tipo_lugar` (`id_tipo_lugar`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tipo_servicios` FOREIGN KEY (`rela_tipo_servicio`) REFERENCES `tipo_de_servicio` (`id_tipo_servicio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `servicios_prestadores`
--
ALTER TABLE `servicios_prestadores`
  ADD CONSTRAINT `fk_servicios_prestadores` FOREIGN KEY (`rela_servicios_prestadores`) REFERENCES `prestadores` (`id_prestador`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_servicios_tipo_servicios` FOREIGN KEY (`rela_tipo_servicios_presta`) REFERENCES `tipo_servicios_prestadores` (`id_tipo_servicios_prestadores`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `servicios_transportes`
--
ALTER TABLE `servicios_transportes`
  ADD CONSTRAINT `rela_serv_transporte` FOREIGN KEY (`rela_serv_transporte`) REFERENCES `transportes` (`id_transportes`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD CONSTRAINT `fk_sucursal_agencia` FOREIGN KEY (`rela_sucursal_agencia`) REFERENCES `agencias` (`id_agencias`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sucursal_alojamiento` FOREIGN KEY (`rela_sucursal_alojamiento`) REFERENCES `alojamientos` (`id_alojamientos`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sucursal_tipo_sucursal` FOREIGN KEY (`rela_tipo_sucursal`) REFERENCES `tipo_sucursal` (`id_tipo_sucursal`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario_contra`
--
ALTER TABLE `usuario_contra`
  ADD CONSTRAINT `fk_usuario_roles` FOREIGN KEY (`rela_rol_id`) REFERENCES `roles` (`id_roles`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usuarios_tablas` FOREIGN KEY (`rela_tablas`) REFERENCES `tablas` (`id_tablas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `viajes`
--
ALTER TABLE `viajes`
  ADD CONSTRAINT `fk_origen_destino_viajes` FOREIGN KEY (`rela_origen_destino`) REFERENCES `origen_destino` (`id_origen_destino`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `viajes_precio_aciento`
--
ALTER TABLE `viajes_precio_aciento`
  ADD CONSTRAINT `fk_precio_aciento` FOREIGN KEY (`rela_precio_aciento`) REFERENCES `precio_acientos` (`id_precios_acientos`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_viajes` FOREIGN KEY (`rela_viajes`) REFERENCES `viajes` (`id_viajes`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
