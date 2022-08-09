-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-08-2022 a las 16:44:02
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pruebas2`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrarContactosFestivales` ()   SELECT c.descripcion_contacto, c.rela_festivales,
        c.rela_tipo_contacto_cont 
        FROM contacto c 
        INNER JOIN festivales f ON f.id_festivales = c.rela_festivales
        WHERE f.id_festivales LIKE  c.rela_festivales
        AND (c.rela_tipo_contacto_cont = 2 OR  c.rela_tipo_contacto_cont = 9) 
        ORDER BY c.rela_tipo_contacto_cont$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acientos`
--

CREATE TABLE `acientos` (
  `id_acientos` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(7, 'Grimaro Tour', 'Orué, Griselda Mariel', '8059', '10735', '27-23667230-7', 'EVT', NULL, 116, NULL, 200),
(8, 'Alwa', 'Resquín, Ariadna Soledad', '14146', '16217', '20-26081048-1', 'EVT', NULL, 117, NULL, 201),
(9, 'Arapy Viajes', 'Arrúa, Claudia Belén', '14475', '18087', '27-28666159-4', 'EVT', NULL, 118, NULL, 202),
(12, 'Diego Bregant Viajes', 'Bregant, Diego Alejandro', '9625', '14773', '20-25889351-5', 'EVT', NULL, 121, NULL, 205),
(13, 'Fentana Viajes y Turismo', 'Fentana, Hugo Ricardo', '7424', '11618', '20-10186376-0', 'EVT', NULL, 122, NULL, 206),
(16, 'M&M Turismo', 'Molina, Miguel Ángel', '2305', '8935', '20-10003071-4', 'EVT', NULL, 125, NULL, 209),
(17, 'Paraquaria Ecotravel & Business', 'González, Fernando Ariel', '15877', '14468', '30-71117859-3', 'EVT', NULL, 126, NULL, 210),
(18, 'Sakura Travel & Business', 'Fabricius, Ana Beatriz', '9814', '12338', '23-23269929-9', 'EVT', NULL, 127, NULL, 211),
(19, 'Salkantay', 'Ridella, Gimena Daiana', '12546', '15579', '20-41351246-9', 'EVT', '2022-07-18 10:10:13', 128, NULL, 212),
(20, 'Siacia Turismo', 'Angeloni, Andrea Elizabeth', '10539', '11415', '20-24149355-6', 'EVT', NULL, 129, NULL, 213),
(21, 'Solo Turismo Arg Fsa Fsa', 'Oviedo, Carlos Antonio', '9039', '18003', '20-21659960-9', 'EVT', NULL, 130, NULL, 214),
(23, 'To Anywhere (Franquicia de Almundo.com)', 'Romero, Rita Belén', '15453', '17543', '30-71491815-6', 'EVT', NULL, 132, NULL, 216),
(24, 'Travel Rock', '', '', '11297', '30-70788118-2', 'EVT', NULL, 133, NULL, 217),
(25, 'Turismo De Castro', 'Romero, Graciela', '2334', '2041', '30-71581767-1', 'EVT', NULL, 134, NULL, 218),
(26, 'Vidivici', 'Salomón, Cristina Del Carmen', '15707', '17525', '20-22192334-1', 'EVT', NULL, 135, NULL, 219),
(27, 'Goya Turismo', '', '', '17224', '0', 'EVT', NULL, 136, NULL, 220),
(28, 'Tintes Religiosos', '', '', '15909', '0', 'EVT', NULL, 137, NULL, 221),
(29, 'Pisamos Fuerte Viajes (Casa Central)', 'Zenandez, Celeste Soledad', '14112', '17165', '24-36203365-5', 'EVT', NULL, 138, NULL, 222);

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
(4, 'Hotel Fermoza', 0, '', 0, 47, 1, NULL, 111, 2, 36, 34, 1, NULL),
(5, 'Hotel Formosa', 0, '', 3, 48, 1, NULL, 112, 2, 37, 35, 1, NULL),
(6, 'Hotel Nuevo Real', 0, '', 1, 49, 1, NULL, 113, 2, 38, 36, 1, NULL),
(7, 'Hotel Plaza', 0, 'Marlén Delgado', 3, 50, 1, NULL, 114, 6, 39, 37, 1, NULL),
(8, 'Howard Johnson', 0, '', 4, 51, 1, NULL, 115, 6, 40, 38, 1, NULL),
(9, 'Las Kalas Rental Suites', 0, '', 3, 53, 1, NULL, 117, 6, 42, 40, 1, NULL),
(10, 'Portal Del Sol', 0, 'César Romero', 3, 54, 1, NULL, 118, 2, 43, 41, 1, NULL),
(11, 'Hotel Regina', 0, '', 3, 55, 1, NULL, 119, 2, 44, 42, 1, '2022-07-18 11:20:01'),
(12, 'Residencial Costanera', 0, 'Alejandro Tiñuk', 1, 56, 1, NULL, 120, 2, 45, 43, 1, NULL),
(13, 'Hotel Ronny', 0, '', 2, 57, 1, NULL, 121, 2, 46, 44, 1, NULL),
(14, 'El Cortijo Agroturismo', -71544756, 'Pablo Rodolfo Miño', 0, 58, 2, NULL, 122, 7, 47, 45, 1, NULL),
(15, 'Fruhwald Turismo Aventura', 0, '', 0, 62, 2, NULL, 126, 7, 48, 46, 1, NULL),
(16, 'Los Zorzales', 33714794529, 'MAuricio Malvasi', 0, 63, 2, NULL, 127, 7, 49, 47, 1, NULL),
(17, 'La Florencia', 0, '', 0, 64, 2, NULL, 128, 7, 50, 48, 1, NULL),
(18, 'La Madrina', 0, 'Rubén Omar Sosa', 0, 65, 2, NULL, 129, 7, 51, 49, 1, NULL),
(19, 'Miramonte', 27266934861, 'Karina Fleitas', 0, 66, 2, NULL, 130, 7, 52, 50, 1, NULL),
(20, 'Chuqui Cué', 20142549760, 'Mirian Michel', 0, 67, 2, NULL, 131, 7, 53, 51, 1, NULL),
(21, 'Posada Cris Dan', 0, '', 0, 68, 5, NULL, 132, 1, 54, 52, 1, NULL),
(22, 'Quintel', 0, '', 0, 69, 2, NULL, 133, NULL, 55, 53, 4, NULL),
(23, 'Quintel', 0, '', 0, 70, 5, NULL, 134, 4, 56, 54, 1, NULL),
(24, 'Cabañas De la Laguna', 20062627825, 'Gilberto Bandeo', 0, 71, 2, NULL, 135, 7, 57, 55, 1, NULL),
(25, 'Gran Capitan', 20247801554, 'Darío Sanabria', 0, 72, 2, NULL, 136, 7, 58, 56, 1, NULL),
(26, 'Los Tucanes', 0, '', 0, 73, 5, NULL, 137, 4, 59, 57, 1, NULL),
(27, 'Cabañas Picasso', 0, '', 0, 74, 2, NULL, 138, 7, 60, 58, 1, NULL),
(28, '12 de Octubre', 0, '', 0, 75, 5, NULL, 139, 1, 61, 59, 1, '2022-07-15 11:12:54'),
(29, 'Hotel ArTur', 0, '', 0, 76, 1, NULL, 140, 2, 62, 60, 1, '2022-07-18 10:34:52'),
(30, 'Residencial San Martín', 0, '', 2, 77, 6, NULL, 141, 2, 63, 61, 1, '2022-07-18 10:22:21'),
(31, 'Hotel Embajador', 0, '', 0, 78, 1, NULL, 142, 2, 64, 62, 1, '2022-07-15 10:35:58'),
(32, 'Hotel Orígenes', 0, '', 0, 79, 1, NULL, 143, 2, 65, 63, 1, NULL),
(33, 'Portal del Oeste', 0, '', 0, 80, 1, NULL, 144, 2, 66, 64, 1, NULL),
(34, 'Hotel Eva', 0, '', 0, 81, 1, NULL, 145, 2, 67, 65, 1, NULL),
(35, 'Hotel Dos Hermanos', 0, '', 0, 82, 1, NULL, 146, 2, 68, 66, 1, '2022-07-22 11:37:44'),
(36, 'Hotel Las Lomitas', 0, '', 0, 83, 1, NULL, 147, 2, 69, 67, 1, NULL),
(37, 'Hospedaje María Belén', 0, '', 0, 84, 5, NULL, 148, 1, 70, 68, 1, NULL),
(39, 'Hospedaje Katarina', 0, '', 0, 86, 5, NULL, 151, 1, 72, 70, 1, NULL),
(40, 'Hospedaje El Viajante', 0, '', 0, 87, 5, NULL, 152, 1, 73, 71, 1, '2022-07-22 11:20:57'),
(41, 'Hotel Plaza', 0, '', 0, 88, 1, NULL, 153, 2, 74, 72, 1, NULL),
(42, 'Hotel Melitona', 0, '', 0, 89, 1, NULL, 154, 2, 75, 73, 1, '2022-07-22 11:19:40'),
(43, 'Hotel La Ribera', 0, '', 0, 90, 1, NULL, 155, 2, 76, 74, 1, '2022-07-22 11:43:29'),
(44, 'Hospedaje Ceci', 0, '', 0, 91, 5, NULL, 156, 1, 77, 75, 1, '2022-07-18 11:08:59'),
(45, 'Hotel Irupé', 0, '', 0, 92, 1, NULL, 157, 2, 78, 76, 1, '2022-07-22 11:41:24'),
(46, 'Hospedaje Ermy', 0, '', 0, 93, 5, NULL, 158, 1, 79, 77, 1, NULL),
(47, 'Hospedaje Jorgito', 0, '', 0, 94, 5, NULL, 159, 1, 80, 78, 1, '2022-07-22 11:34:37'),
(48, 'Hotel y Motel El Manantial', 0, '', 0, 95, 1, NULL, 160, 2, 81, 79, 4, NULL),
(49, 'Hotel Oasis', 0, '', 0, 96, 1, NULL, 161, 2, 82, 80, 4, NULL),
(50, 'Hospedaje Al Paso', 0, '', 0, 97, 5, NULL, 162, 1, 83, 81, 4, NULL),
(51, 'Don Insfrán', 0, '', 0, 98, 1, NULL, 163, 2, 84, 82, 4, NULL),
(52, 'Luisin Hotel', 0, '', 0, 99, 1, NULL, 164, 2, 85, 83, 4, NULL),
(53, 'Imperial Apart Hotel', 0, '', 0, 100, 1, NULL, 165, 2, 86, 84, 4, '2022-02-11 10:48:16'),
(54, 'Brimau Hotel', 0, '', 0, 101, 1, NULL, 166, 2, 87, 85, 4, NULL),
(55, 'Hotel Guaraní', 0, '', 0, 102, 1, NULL, 167, 2, 88, 86, 4, '2022-07-22 11:36:10'),
(56, 'Hospedaje Flores', 0, '', 0, 103, 5, NULL, 168, 1, 89, 87, 4, '2022-07-22 11:35:04'),
(58, 'El Angelito (Ex Norte)', 0, '', 0, 105, 5, NULL, 170, 1, 91, 89, 4, '2022-07-22 11:35:55'),
(59, 'El Indiano', 0, '', 0, 106, 5, NULL, 171, 1, 92, 90, 1, '2022-07-22 12:01:34'),
(60, 'Hospedaje Karfa', 0, '', 0, 107, 5, NULL, 172, 1, 93, 91, 4, '2022-07-22 11:35:26'),
(61, 'Gran Victoria', 0, '', 0, 108, 1, NULL, 173, 2, 94, 92, 4, '2022-07-22 11:38:29'),
(62, 'Hotel Los Dos Pibes', 0, '', 0, 109, 1, NULL, 174, 2, 95, 93, 4, '2022-07-22 11:38:15'),
(63, 'Victoria', 0, '', 0, 110, 1, NULL, 175, 2, 96, 94, 4, '2022-07-22 11:38:00'),
(64, 'Magali', 0, '', 0, 111, 1, NULL, 176, 2, 97, 95, 4, NULL),
(65, 'Los Tucanes', 0, '', 0, 141, 2, NULL, 276, 7, 102, 100, 1, NULL),
(66, 'Cabañas Doña Elsa', 0, '', 0, 142, 2, NULL, 294, 7, 103, 101, 4, NULL),
(67, 'El Patio de Risso', 0, '', 0, 143, 5, NULL, 295, 1, 104, 102, 4, NULL),
(68, 'Hotel Del Río', 0, '', 0, 144, 1, NULL, 296, 2, 105, 103, 4, '2022-07-15 10:40:05'),
(72, 'Hospedaje El Ricky', 0, '', 0, 148, 5, NULL, 341, 1, 109, 107, 4, '2022-07-22 11:37:25'),
(73, 'Hotel Génesis', 0, '', 0, 149, 1, NULL, 345, 2, 110, 108, 4, '2022-02-14 08:45:00'),
(77, 'Hotel Residencial España', 0, '', 0, 153, 6, NULL, 367, 1, 114, 112, 4, '2022-07-18 09:21:52'),
(78, 'Gran Hospedaje', 0, '', 0, 154, 5, NULL, 369, 1, 115, 113, 1, '2022-07-22 11:23:25');

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
(7, 'Comunicación');

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
  `rela_gastronomia_contacto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `contacto`
--

INSERT INTO `contacto` (`id_contacto`, `descripcion_contacto`, `rela_tipo_contacto_cont`, `rela_alojamiento_contacto`, `rela_prestador_contacto`, `rela_guia_contacto`, `rela_contacto_agencia`, `rela_persona_contacto`, `rela_contacto_referente`, `rela_contacto_museo`, `rela_servicios_generales`, `rela_festivales`, `rela_gastronomia_contacto`) VALUES
(318, '3704671555', 2, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(319, '', 9, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(320, '', 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(321, '', 4, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(322, '', 5, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(323, '', 6, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(324, '', 7, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(325, '', 8, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(326, '3718629209', 2, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL),
(327, '', 9, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL),
(328, '', 1, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL),
(329, '', 4, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL),
(330, '', 5, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL),
(331, '', 6, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL),
(332, '', 7, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL),
(333, '', 8, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL),
(334, '3704257285', 2, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL),
(335, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL),
(336, '', 1, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL),
(337, '', 4, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL),
(338, '', 5, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL),
(339, '', 6, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL),
(340, '', 7, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL),
(341, '', 8, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL),
(342, '3704201293', 2, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL),
(343, '', 9, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL),
(344, '', 1, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL),
(345, '', 4, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL),
(346, '', 5, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL),
(347, '', 6, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL),
(348, '', 7, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL),
(349, '', 8, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL),
(350, '3704263282', 2, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL),
(351, '', 9, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL),
(352, '', 1, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL),
(353, '', 4, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL),
(354, '', 5, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL),
(355, '', 6, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL),
(356, '', 7, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL),
(357, '', 8, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL),
(358, '3704613581', 2, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL),
(359, '', 9, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL),
(360, '', 1, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL),
(361, '', 4, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL),
(362, '', 5, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL),
(363, '', 6, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL),
(364, '', 7, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL),
(365, '', 8, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL),
(366, '3711614118', 2, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL),
(367, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL),
(368, '', 1, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL),
(369, '', 4, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL),
(370, '', 5, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL),
(371, '', 6, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL),
(372, '', 7, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL),
(373, 'Intendente Reserva Natural Formosa', 8, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL),
(382, '3716410254', 2, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL),
(383, '', 9, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL),
(384, '', 1, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL),
(385, '', 4, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL),
(386, '', 5, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL),
(387, '', 6, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL),
(388, '', 7, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL),
(389, '', 8, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL),
(390, '3716617087', 2, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(391, '', 9, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(392, '', 1, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(393, '', 4, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(394, '', 5, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(395, '', 6, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(396, '', 7, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(397, '', 8, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(398, '3704251876', 2, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL),
(399, '', 9, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL),
(400, '', 1, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL),
(401, '', 4, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL),
(402, '', 5, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL),
(403, '', 6, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL),
(404, '', 7, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL),
(405, '', 8, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL),
(406, '3704386991', 2, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL),
(407, '', 9, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL),
(408, '', 1, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL),
(409, '', 4, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL),
(410, '', 5, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL),
(411, '', 6, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL),
(412, '', 7, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL),
(413, '', 8, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL),
(414, '3716414586', 2, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL),
(415, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL),
(416, '', 1, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL),
(417, '', 4, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL),
(418, '', 5, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL),
(419, '', 6, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL),
(420, '', 7, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL),
(421, '', 8, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL),
(422, '3704706806', 2, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL),
(423, '', 9, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL),
(424, '', 1, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL),
(425, '', 4, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL),
(426, '', 5, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL),
(427, '', 6, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL),
(428, '', 7, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL),
(429, '', 8, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL),
(430, '3704274747', 2, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL),
(431, '', 9, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL),
(432, '', 1, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL),
(433, '', 4, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL),
(434, '', 5, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL),
(435, '', 6, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL),
(436, '', 7, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL),
(437, '', 8, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL),
(438, '3704613266', 2, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL),
(439, '', 9, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL),
(440, '', 1, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL),
(441, '', 4, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL),
(442, '', 5, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL),
(443, '', 6, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL),
(444, '', 7, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL),
(445, '', 8, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL),
(446, '3716617295', 2, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL),
(447, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL),
(448, '', 1, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL),
(449, '', 4, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL),
(450, '', 5, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL),
(451, '', 6, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL),
(452, '', 7, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL),
(453, '', 8, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL),
(454, '3704703116', 2, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL),
(455, '', 9, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL),
(456, '', 1, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL),
(457, '', 4, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL),
(458, '', 5, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL),
(459, '', 6, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL),
(460, '', 7, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL),
(461, '', 8, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL),
(462, '3718605001', 2, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL),
(463, '', 9, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL),
(464, '', 1, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL),
(465, '', 4, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL),
(466, '', 5, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL),
(467, '', 6, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL),
(468, '', 7, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL),
(469, '', 8, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL),
(470, '3704414692', 2, NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL),
(471, '', 9, NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL),
(472, '', 1, NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL),
(473, '', 4, NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL),
(474, '', 5, NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL),
(475, '', 6, NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL),
(476, '', 7, NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL),
(477, '', 8, NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL),
(478, '3704414692', 2, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL),
(479, '', 9, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL),
(480, '', 1, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL),
(481, '', 4, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL),
(482, '', 5, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL),
(483, '', 6, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL),
(484, '', 7, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL),
(485, '', 8, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL),
(486, '3718552929', 2, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL),
(487, '', 9, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL),
(488, '', 1, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL),
(489, '', 4, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL),
(490, '', 5, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL),
(491, '', 6, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL),
(492, '', 7, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL),
(493, '', 8, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL),
(494, '3705036512', 2, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL),
(495, '', 9, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL),
(496, '', 1, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL),
(497, '', 4, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL),
(498, '', 5, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL),
(499, '', 6, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL),
(500, '', 7, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL),
(501, '', 8, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL),
(502, '3704302141', 2, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL),
(503, '', 9, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL),
(504, '', 1, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL),
(505, '', 4, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL),
(506, '', 5, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL),
(507, '', 6, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL),
(508, '', 7, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL),
(509, '', 8, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL),
(510, '3704387666', 2, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL),
(511, '', 9, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL),
(512, '', 1, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL),
(513, '', 4, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL),
(514, '', 5, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL),
(515, '', 6, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL),
(516, '', 7, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL),
(517, '', 8, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL),
(518, '3705009499', 2, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL),
(519, '', 9, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL),
(520, '', 1, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL),
(521, '', 4, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL),
(522, '', 5, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL),
(523, '', 6, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL),
(524, '', 7, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL),
(525, '', 8, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL),
(526, '3718418745', 2, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL),
(527, '', 9, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL),
(528, '', 1, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL),
(529, '', 4, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL),
(530, '', 5, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL),
(531, '', 6, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL),
(532, '', 7, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL),
(533, '', 8, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL),
(534, '3718635118', 2, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL),
(535, '', 9, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL),
(536, '', 1, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL),
(537, '', 4, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL),
(538, '', 5, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL),
(539, '', 6, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL),
(540, '', 7, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL),
(541, '', 8, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL),
(542, '3718625060', 2, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL),
(543, '', 9, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL),
(544, '', 1, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL),
(545, '', 4, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL),
(546, '', 5, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL),
(547, '', 6, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL),
(548, '', 7, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL),
(549, '', 8, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL),
(550, '3718599253', 2, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL),
(551, '', 9, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL),
(552, '', 1, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL),
(553, '', 4, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL),
(554, '', 5, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL),
(555, '', 6, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL),
(556, '', 7, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL),
(557, '', 8, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL),
(558, '3718549793', 2, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL),
(559, '', 9, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL),
(560, 'marianoortiz15@gmail.com', 1, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL),
(561, '', 4, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL),
(562, '', 5, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL),
(563, '', 6, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL),
(564, '', 7, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL),
(565, '', 8, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL, NULL, NULL),
(566, '3704231444', 2, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL),
(567, '', 9, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL),
(568, '', 1, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL),
(569, '', 4, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL),
(570, '', 5, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL),
(571, '', 6, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL),
(572, '', 7, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL),
(573, '', 8, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL, NULL, NULL),
(574, '3704230107', 2, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL),
(575, '4482521', 9, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL),
(576, '', 1, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL),
(577, '', 4, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL),
(578, '', 5, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL),
(579, '', 6, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL),
(580, '', 7, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL),
(581, '', 8, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL, NULL, NULL),
(582, '3704250475', 2, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL, NULL, NULL),
(583, '', 9, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL, NULL, NULL),
(584, '', 1, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL, NULL, NULL),
(585, '', 4, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL, NULL, NULL),
(586, '', 5, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL, NULL, NULL),
(587, '', 6, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL, NULL, NULL),
(588, '', 7, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL, NULL, NULL),
(589, '', 8, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL, NULL, NULL),
(590, '3704684389', 2, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL, NULL, NULL),
(591, '', 9, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL, NULL, NULL),
(592, '', 1, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL, NULL, NULL),
(593, '', 4, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL, NULL, NULL),
(594, '', 5, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL, NULL, NULL),
(595, '', 6, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL, NULL, NULL),
(596, '', 7, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL, NULL, NULL),
(597, '', 8, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL, NULL, NULL),
(598, '3704305581', 2, NULL, NULL, NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL),
(599, '', 9, NULL, NULL, NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL),
(600, '', 1, NULL, NULL, NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL),
(601, '', 4, NULL, NULL, NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL),
(602, '', 5, NULL, NULL, NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL),
(603, '', 6, NULL, NULL, NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL),
(604, '', 7, NULL, NULL, NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL),
(605, '', 8, NULL, NULL, NULL, NULL, NULL, 36, NULL, NULL, NULL, NULL),
(606, '3704262569', 2, NULL, NULL, NULL, NULL, NULL, 37, NULL, NULL, NULL, NULL),
(607, '', 9, NULL, NULL, NULL, NULL, NULL, 37, NULL, NULL, NULL, NULL),
(608, '', 1, NULL, NULL, NULL, NULL, NULL, 37, NULL, NULL, NULL, NULL),
(609, '', 4, NULL, NULL, NULL, NULL, NULL, 37, NULL, NULL, NULL, NULL),
(610, '', 5, NULL, NULL, NULL, NULL, NULL, 37, NULL, NULL, NULL, NULL),
(611, '', 6, NULL, NULL, NULL, NULL, NULL, 37, NULL, NULL, NULL, NULL),
(612, '', 7, NULL, NULL, NULL, NULL, NULL, 37, NULL, NULL, NULL, NULL),
(613, '', 8, NULL, NULL, NULL, NULL, NULL, 37, NULL, NULL, NULL, NULL),
(614, '3704201770', 2, NULL, NULL, NULL, NULL, NULL, 38, NULL, NULL, NULL, NULL),
(615, '', 9, NULL, NULL, NULL, NULL, NULL, 38, NULL, NULL, NULL, NULL),
(616, '', 1, NULL, NULL, NULL, NULL, NULL, 38, NULL, NULL, NULL, NULL),
(617, '', 4, NULL, NULL, NULL, NULL, NULL, 38, NULL, NULL, NULL, NULL),
(618, '', 5, NULL, NULL, NULL, NULL, NULL, 38, NULL, NULL, NULL, NULL),
(619, '', 6, NULL, NULL, NULL, NULL, NULL, 38, NULL, NULL, NULL, NULL),
(620, '', 7, NULL, NULL, NULL, NULL, NULL, 38, NULL, NULL, NULL, NULL),
(621, '', 8, NULL, NULL, NULL, NULL, NULL, 38, NULL, NULL, NULL, NULL),
(622, '3704437333', 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(623, '4437333', 9, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(624, 'hoteldeturimofsa@gmail.com', 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(625, '', 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(626, '', 5, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(627, '', 6, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(628, '', 7, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(629, '', 8, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(630, '3704433289', 2, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(631, '4433289', 9, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(632, '', 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(633, '', 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(634, '', 5, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(635, '', 6, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(636, '', 7, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(637, '', 8, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(638, '3704450063', 2, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(639, 'No se registró', 9, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(640, '', 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(641, 'facebook.com/HOTEL-Formosa-321907728506696', 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(642, '', 5, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(643, '', 6, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(644, '', 7, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(645, '', 8, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(646, '3704428441', 2, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(647, '4428441', 9, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(648, '', 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(649, 'facebook.com/pages/Hotel-Real-Formosa/1072369076120166', 4, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(650, '', 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(651, '', 6, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(652, '', 7, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(653, '', 8, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(654, '3704429527', 2, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(655, '', 9, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(656, 'plaza_formosa@hotmail.com', 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(657, 'facebook.com/hotelplazaformosa', 4, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(658, '', 5, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(659, '', 6, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(660, '', 7, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(661, '', 8, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(662, '3704438900', 2, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(663, '4438900', 9, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(664, 'reservas@hjneoformosa.com.ar', 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(665, 'facebook.com/HJFormosa', 4, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(666, 'instagram.com/hjformosa', 5, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(667, '', 6, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(668, 'www.hjneoformosa.com.ar', 7, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(669, 'Capacidad disminuida (60 plazas)', 8, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(670, '', 2, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(671, '3704588380', 2, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(672, '4428999', 9, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(673, 'laskalasrentalsuite@outlook.com', 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(674, 'facebook.com/LasKalas.fsa', 4, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(675, 'instagram.com/laskalasrestaurant', 5, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(676, '', 6, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(677, 'www.laskalasrentalsuites.com', 7, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(678, '', 8, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(679, '3704426908', 2, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(680, '4426908', 9, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(681, 'hotelportaldelsolfsa@hotmail.com', 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(682, 'facebook.com/martin.llanoaquino', 4, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(683, 'instagram.com/hotelportaldelsolfsa', 5, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(684, '', 6, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(685, 'www.hotelportaldelsolfsa.com', 7, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(686, '', 8, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(687, '3704421870', 2, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(688, '4421870', 9, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(689, 'info@regina-hotel.com.ar', 1, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(690, 'facebook.com/HotelReginaFormosa', 4, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(691, 'instagram.com/hotelregina535', 5, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(692, '', 6, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(693, 'www.regina-hotel.com.ar', 7, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(694, 'hotelreginaformosa@hotmail.com', 8, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(695, '3704435901', 2, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(696, '4435901', 9, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(697, 'alejandrotinuk@gmail.com', 1, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(698, 'facebook.com/ResidencialCostanera', 4, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(699, 'instagram.com/residencialcostanera', 5, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(700, '', 6, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(701, '', 7, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(702, '', 8, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(703, '3704456373', 2, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(704, '4456373', 9, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(705, 'hotelronnyfsa@hotmail.com', 1, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(706, 'facebook.com/hotel.ronny', 4, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(707, '', 5, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(708, '', 6, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(709, '', 7, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(710, '', 8, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(711, '3704305371', 2, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(712, 'No se registró', 9, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(713, 'elcortijotur@gmail.com', 1, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(714, 'facebook.com/elcortijoagroecoturismo', 4, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(715, 'instagram.com/elcortijoaet', 5, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(716, '', 6, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(717, '', 7, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(718, '', 8, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(743, '3704711973', 2, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(744, '4425007', 9, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(745, 'fruhwaldturismoaventura@gmail.com', 1, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(746, '', 4, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(747, '', 5, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(748, '', 6, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(749, '', 7, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(750, '', 8, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(751, '3704971794', 2, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(752, '', 9, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(753, 'loszorzalesestancia@gmail.com', 1, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(754, 'facebook.com/LosZorzalesEstancia', 4, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(755, 'instagram.com/loszorzalesfsa', 5, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(756, '', 6, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(757, 'www.loszorzales.com.ar', 7, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(758, '', 8, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(759, '3704530437', 2, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(760, '', 9, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(761, 'patri06_arroyo@hotmail.com', 1, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(762, 'facebook.com/La-Florencia-125261564223541/', 4, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(763, '', 5, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(764, '', 6, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(765, '', 7, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(766, '', 8, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(767, '3704363400', 2, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(768, '', 9, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(769, 'cabanaslamadrina@gmail.com', 1, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(770, 'facebook.com/Cabañas-La-Madrina-Herradura-565122027002619', 4, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(771, 'instagram.com/complejo.lamadrina', 5, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(772, '', 6, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(773, '', 7, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(774, '3704851239 (Cel)', 8, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(775, '3704264780', 2, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(776, 'No se registró', 9, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(777, 'cabanasmiramonte@gmail.com', 1, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(778, 'facebook.com/miramonteherradura', 4, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(779, 'instagram.com/miramonteherradura', 5, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(780, '', 6, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(781, '', 7, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(782, '', 8, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(783, '3704680732', 2, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(784, '', 9, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(785, 'chuquicue@gmail.com', 1, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(786, 'facebook.com/Chuqui-Cue-1540445926208821', 4, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(787, 'instagram.com/chuquicue', 5, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(788, '', 6, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(789, '', 7, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(790, '', 8, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(791, '3704022337', 2, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(792, '', 9, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(793, '', 1, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(794, '', 4, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(795, '', 5, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(796, '', 6, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(797, '', 7, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(798, '', 8, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(799, '', 2, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(800, '', 9, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(801, '', 1, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(802, '', 4, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(803, '', 5, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(804, '', 6, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(805, '', 7, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(806, '', 8, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(807, '3704598713', 2, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(808, '', 9, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(809, 'quintel-herradura@hotmail.com', 1, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(810, 'facebook.com/Quintel-Herradura-315622672192902', 4, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(811, '', 5, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(812, '', 6, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(813, '', 7, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(814, '', 8, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(815, '3704399689', 2, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(816, '', 9, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(817, 'gbandeo@gmail.com', 1, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(818, 'facebook.com/cabanasdelalaguna.herradura', 4, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(819, '', 5, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(820, '', 6, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(821, '', 7, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(822, '', 8, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(823, '3704662882', 2, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(824, '', 9, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(825, 'angeldariosanabria@hotmail.com', 1, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(826, 'facebook.com/Cabañas-Gran-Capitán-344067769337418', 4, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(827, '', 5, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(828, '', 6, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(829, '', 7, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(830, '', 8, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(831, '3704682507', 2, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(832, '', 9, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(833, '', 1, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(834, 'facebook.com/Quinta-los-tucanes-102939011252292', 4, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(835, '', 5, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(836, '', 6, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(837, '', 7, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(838, '', 8, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(839, '3704260834', 2, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(840, '', 9, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(841, 'heizen_89@hotmail.com', 1, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(842, 'facebook.com/Cabañas-Picasso-1534098543550647', 4, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(843, '', 5, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(844, '', 6, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(845, '', 7, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(846, '', 8, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(847, '3718467357', 2, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(848, '3718425533', 9, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(849, 'deserteagle749@hotmail.com', 1, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(850, 'facebook.com/Residencial-12-De-Octubre-266850863831638', 4, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(851, '', 5, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(852, '', 6, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(853, '', 7, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(854, '', 8, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(855, '3718426730', 2, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(856, 'No se registró', 9, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(857, 'contactos@hotelar-tur.com', 1, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(858, 'facebook.com/pages/Hotel-Ar-Tur-Clorinda-Formosa/350237235048100', 4, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(859, '', 5, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(860, '', 6, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(861, '', 7, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(862, '', 8, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(863, '3718421211', 2, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(864, 'No se registró', 9, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(865, 'residencialsanmartin@gmail.com', 1, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(866, 'facebook.com/Residencial-san-Martin-107636307313362', 4, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(867, '', 5, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(868, '', 6, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(869, '', 7, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(870, 'zozulangelina51@gmail.com', 8, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(871, '3718422264', 2, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(872, 'No se registró', 9, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(873, 'hotelembajador@hotmail.com', 1, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(874, 'facebook.com/hotel-embajador-clorinda-formosa-223191111039574', 4, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(875, '', 5, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(876, '', 6, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(877, 'www.hembajador.como.ar', 7, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(878, '', 8, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(879, '3704629993', 2, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(880, '', 9, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(881, '', 1, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(882, 'facebook.com/profile.php?id=100057406511158', 4, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(883, '', 5, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(884, '', 6, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(885, '', 7, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(886, '', 8, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(887, '3704694471', 2, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(888, 'No se registró', 9, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(889, '', 1, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(890, 'facebook.com/profile.php?id=100061038049180', 4, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(891, '', 5, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(892, '', 6, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(893, '', 7, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(894, '', 8, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(895, '3715616037', 2, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(896, '3715432492', 9, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(897, '', 1, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(898, 'facebook.com/pages/Hotel-Eva/395250607205542', 4, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(899, '', 5, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(900, '', 6, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(901, '', 7, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(902, '', 8, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(903, '3715432306', 2, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(904, '3715432306', 9, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(905, '', 1, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(906, '', 4, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(907, '', 5, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(908, '', 6, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(909, '', 7, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(910, '', 8, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(911, '3704547682', 2, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(912, '03715432137', 9, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(913, '', 1, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(914, '', 4, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(915, '', 5, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(916, '', 6, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(917, '', 7, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(918, '', 8, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(919, '3705038386', 2, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(920, '', 9, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(921, '', 1, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(922, '', 4, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(923, '', 5, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(924, '', 6, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(925, '', 7, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(926, '', 8, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(927, '3704826207', 2, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL, NULL, NULL),
(928, '', 9, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL, NULL, NULL),
(929, '', 1, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL, NULL, NULL),
(930, '', 4, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL, NULL, NULL),
(931, '', 5, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL, NULL, NULL),
(932, '', 6, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL, NULL, NULL),
(933, '', 7, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL, NULL, NULL),
(934, '', 8, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL, NULL, NULL),
(943, '3716617440', 2, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(944, 'No se registró', 9, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(945, '', 1, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(946, '', 4, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(947, '', 5, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(948, '', 6, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(949, '', 7, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(950, '', 8, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(951, '3704940537', 2, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(952, 'No se registró', 9, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(953, '', 1, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(954, '', 4, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(955, '', 5, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(956, '', 6, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(957, '', 7, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(958, '(03716) 432352', 8, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(959, '3704567602', 2, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(960, 'No se registró', 9, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(961, '', 1, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(962, '', 4, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(963, '', 5, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(964, '', 6, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(965, '', 7, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(966, '', 8, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(967, '3704230653', 2, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(968, 'No se registró', 9, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(969, '', 1, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(970, '', 4, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(971, '', 5, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(972, '', 6, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(973, '', 7, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(974, '(03716) 432532', 8, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(975, '3704355521', 2, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(976, '3704480106', 9, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(977, '', 1, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(978, 'facebook.com/profile.php?id=100009935504429', 4, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(979, '', 5, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(980, '', 6, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(981, '', 7, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(982, '', 8, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(983, '3704571414', 2, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(984, '3704481963', 9, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(985, 'cecilianoemipaz@gmail.com', 1, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(986, 'facebook.com/hospedajececielcolorado', 4, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(987, '', 5, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(988, '', 6, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(989, '', 7, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(990, '', 8, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(991, '3704251888', 2, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(992, '3704481791', 9, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(993, '', 1, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(994, '', 4, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(995, '', 5, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(996, '', 6, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(997, '', 7, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(998, '', 8, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(999, '3704348480', 2, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1000, '3704480343', 9, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1001, '', 1, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1002, '', 4, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1003, '', 5, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1004, '', 6, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1005, '', 7, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1006, '', 8, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1007, '3704480170', 2, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1008, 'No se registró', 9, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1009, '', 1, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1010, '', 4, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1011, '', 5, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1012, '', 6, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1013, '', 7, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1014, '', 8, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1015, '3704588880', 2, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `contacto` (`id_contacto`, `descripcion_contacto`, `rela_tipo_contacto_cont`, `rela_alojamiento_contacto`, `rela_prestador_contacto`, `rela_guia_contacto`, `rela_contacto_agencia`, `rela_persona_contacto`, `rela_contacto_referente`, `rela_contacto_museo`, `rela_servicios_generales`, `rela_festivales`, `rela_gastronomia_contacto`) VALUES
(1016, '', 9, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1017, '', 1, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1018, '', 4, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1019, '', 5, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1020, '', 6, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1021, '', 7, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1022, '', 8, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1023, '3704543121', 2, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1024, 'No se registró', 9, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1025, '', 1, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1026, '', 4, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1027, '', 5, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1028, '', 6, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1029, '', 7, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1030, '', 8, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1031, '3704309063', 2, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1032, '', 9, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1033, '', 1, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1034, '', 4, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1035, '', 5, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1036, '', 6, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1037, '', 7, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1038, '', 8, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1039, '3704282520', 2, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1040, '3704490219', 9, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1041, '', 1, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1042, '', 4, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1043, '', 5, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1044, '', 6, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1045, '', 7, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1046, '', 8, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1047, '3718401770', 2, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1048, 'No se registró', 9, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1049, '', 1, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1050, '', 4, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1051, '', 5, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1052, '', 6, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1053, '', 7, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1054, '', 8, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1055, '3718401070', 2, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1056, 'No se registró', 9, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1057, 'imperialaparthotel@gmail.com', 1, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1058, 'facebook.com/Imperial-Apart-Hotel-Tu-hogar-lejos-de-Casa-1924294441122606', 4, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1059, 'instagram.com/imperial_apart_hotel', 5, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1060, '', 6, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1061, '', 7, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1062, '(03718) 401070 (Fijo)', 8, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1063, '3718441991', 2, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1064, '03718401290', 9, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1065, '', 1, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1066, '', 4, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1067, '', 5, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1068, '', 6, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1069, '', 7, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1070, '', 8, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1071, '3718470124', 2, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1072, '3718470124', 9, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1073, '', 1, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1074, '', 4, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1075, '', 5, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1076, '', 6, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1077, '', 7, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1078, '', 8, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1079, '3704497028', 2, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1080, '3704497028', 9, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1081, '', 1, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1082, '', 4, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1083, '', 5, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1084, '', 6, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1085, '', 7, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1086, '', 8, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1095, '3711615318', 2, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1096, '3711615318', 9, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1097, '', 1, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1098, '', 4, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1099, '', 5, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1100, '', 6, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1101, '', 7, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1102, '', 8, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1103, '3711420395', 2, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1104, '3711420395', 9, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1105, '', 1, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1106, '', 4, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1107, '', 5, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1108, '', 6, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1109, '', 7, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1110, '', 8, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1111, '3711420113', 2, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1112, '3711420113', 9, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1113, '', 1, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1114, '', 4, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1115, '', 5, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1116, '', 6, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1117, '', 7, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1118, '', 8, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1119, '3704586044', 2, 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1120, '3704586044', 9, 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1121, '', 1, 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1122, 'facebook.com/Hotel-Gran-Victoria-456394581394437', 4, 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1123, '', 5, 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1124, '', 6, 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1125, '', 7, 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1126, '', 8, 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1127, '3704461341', 2, 62, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1128, '3704461341', 9, 62, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1129, '', 1, 62, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1130, '', 4, 62, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1131, '', 5, 62, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1132, '', 6, 62, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1133, '', 7, 62, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1134, '', 8, 62, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1135, '3704557692', 2, 63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1136, '3704557692', 9, 63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1137, '', 1, 63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1138, '', 4, 63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1139, '', 5, 63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1140, '', 6, 63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1141, '', 7, 63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1142, '', 8, 63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1143, '3704709051', 2, 64, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1144, '3704460275', 9, 64, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1145, 'hotelmagali.pirane@gmail.com', 1, 64, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1146, '', 4, 64, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1147, '', 5, 64, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1148, '', 6, 64, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1149, '', 7, 64, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1150, '', 8, 64, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1256, '3718425240', 2, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL),
(1257, 'No se registró', 9, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL),
(1258, 'grimarotour@gmx.net', 1, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL),
(1259, 'facebook.com/grimarotour', 4, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL),
(1260, 'instagram.com/grimarotour', 5, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL),
(1261, '', 6, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL),
(1262, 'grimarotour.e-agencias.com.ar', 7, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL),
(1263, '', 8, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL),
(1264, '3704025515', 2, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL),
(1265, '03704435319', 9, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL),
(1266, 'pasajesexpressfsa@hotmail.com', 1, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL),
(1267, 'facebook.com/alwaviajes-109679708204538', 4, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL),
(1268, 'instagram.com/alwa.viajes', 5, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL),
(1269, '', 6, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL),
(1270, '', 7, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL),
(1271, 'alwa.viajes@gmail.com', 8, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL),
(1272, '3704686685', 2, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL),
(1273, '01145873700', 9, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL),
(1274, 'tramites@reservandoviajes.com', 1, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL),
(1275, 'facebook.com/arapyviajesfsa', 4, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL),
(1276, 'instagram.com/arapyviajes', 5, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL),
(1277, '', 6, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL),
(1278, 'ww.arapyviajesfsa.com', 7, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL),
(1279, 'info@arapyviajesfsa.com', 8, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL),
(1296, '3704615862', 2, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL),
(1297, '03704437191', 9, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL),
(1298, 'diegobregant@hotmail.com', 1, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL),
(1299, 'facebook.com/diegobregantviajesformosa', 4, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL),
(1300, 'instagram.com/diegobregantviajes', 5, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL),
(1301, '', 6, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL),
(1302, '', 7, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL),
(1303, '3704003555', 8, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL),
(1304, '3718426360', 2, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL),
(1305, '', 9, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL),
(1306, 'hfentana@hotmail.com', 1, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL),
(1307, '', 4, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL),
(1308, '', 5, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL),
(1309, '', 6, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL),
(1310, '', 7, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL),
(1311, '', 8, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL),
(1328, '', 2, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL),
(1329, '03704434208', 9, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL),
(1330, 'mymturismo@mymturismo.com.ar', 1, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL),
(1331, 'facebook.com/mymturismofma', 4, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL),
(1332, '', 5, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL),
(1333, '', 6, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL),
(1334, '', 7, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL),
(1335, 'agenciamymturismo@gmail.com', 8, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL),
(1336, '370578416', 2, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL),
(1337, '03704425437', 9, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL),
(1338, 'gerencia@paraquaria-srl.com.ar', 1, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL),
(1339, 'facebook.com/PARAQUARIA.Ecotravel', 4, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL),
(1340, '', 5, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL),
(1341, '', 6, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL),
(1342, 'www.paraquaria-srl.com.ar/', 7, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL),
(1343, '', 8, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL),
(1344, '03704421432', 2, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL),
(1345, '4421011', 9, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL),
(1346, 'sakuraevt@hotmail.com', 1, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL),
(1347, 'facebook.com/SakuraViajesOk', 4, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL),
(1348, 'instagram.com/sakuraviajesok', 5, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL),
(1349, '', 6, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL),
(1350, '', 7, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL),
(1351, '', 8, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL),
(1352, '3704385365', 2, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL),
(1353, '4445094', 9, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL),
(1354, 'jorge99viajes@gmail.com', 1, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL),
(1355, '', 4, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL),
(1356, '', 5, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL),
(1357, '', 6, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL),
(1358, '', 7, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL),
(1359, '', 8, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL),
(1360, '3704660772', 2, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL),
(1361, '4420395', 9, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL),
(1362, 'siaciatur@yahoo.com.ar', 1, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL),
(1363, '', 4, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL),
(1364, '', 5, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL),
(1365, '', 6, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL),
(1366, '', 7, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL),
(1367, '4434858', 8, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL),
(1368, '3704238394', 2, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL),
(1369, '4426159', 9, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL),
(1370, 'staffturismo@hotmail.com', 1, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL),
(1371, 'facebook.com/STAFF.TRAVELDANCE.FORMOSA', 4, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL),
(1372, 'instagram.com/staff_turismo', 5, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL),
(1373, '', 6, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL),
(1374, 'www.staffturismo.com.ar', 7, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL),
(1375, '', 8, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL),
(1384, '3704887226', 2, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(1385, '', 9, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(1386, 'jessivaliente7@gmail.com', 1, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(1387, '', 4, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(1388, '', 5, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(1389, '', 6, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(1390, '', 7, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(1391, '3704 415952', 8, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(1392, '', 2, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL),
(1393, '4429399', 9, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL),
(1394, 'mkloss@travelrock.com', 1, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL),
(1395, 'facebook.com/Travel-Rock-Formosa-Oficial-580517758625314', 4, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL),
(1396, '', 5, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL),
(1397, '', 6, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL),
(1398, '', 7, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL),
(1399, '', 8, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL),
(1400, '3704738906', 2, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL),
(1401, '4434777', 9, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL),
(1402, 'receptivo@turismodecastro.com.ar', 1, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL),
(1403, 'facebook.com/turismo.decastro', 4, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL),
(1404, 'instagram.com/turismodecastro', 5, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL),
(1405, '', 6, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL),
(1406, 'www.turismodecastro.tur.ar', 7, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL),
(1407, 'ventas@turismodecastro.tur.ar', 8, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL),
(1408, '3704585764', 2, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL),
(1409, '', 9, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL),
(1410, 'vidiviciviajes@gmail.com', 1, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL),
(1411, 'facebook.com/vidiviciviajes', 4, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL),
(1412, 'instagram.com/vidiviciviajesfsa', 5, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL),
(1413, '', 6, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL),
(1414, '', 7, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL),
(1415, '3704000626', 8, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL),
(1416, '3704259228', 2, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL),
(1417, '4427123', 9, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL),
(1418, 'goyaturismo18@gmail.com', 1, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL),
(1419, 'facebook.com/goyaturis', 4, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL),
(1420, 'instagram.com/goyaturismo', 5, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL),
(1421, '', 6, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL),
(1422, 'www.goyaturismo.com.ar', 7, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL),
(1423, '3704834415', 8, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL),
(1424, '3704692263', 2, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL),
(1425, '4431009', 9, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL),
(1426, 'tintesreligiosos@hotmail.com', 1, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL),
(1427, 'facebook.com/lafabricadeamigos', 4, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL),
(1428, 'instagram.com/tintesreligiosos', 5, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL),
(1429, '', 6, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL),
(1430, '', 7, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL),
(1431, '', 8, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL),
(1432, '3718504666', 2, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL),
(1433, '', 9, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL),
(1434, 'ivandc@hotmail.com', 1, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL),
(1435, '', 4, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL),
(1436, '', 5, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL),
(1437, '', 6, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL),
(1438, '', 7, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL),
(1439, '', 8, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL, NULL, NULL),
(1485, '3704506393', 2, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL),
(1486, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL),
(1487, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL),
(1488, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL),
(1489, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL),
(1490, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL),
(1491, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL),
(1492, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL),
(1493, '3718591618', 2, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL),
(1494, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL),
(1495, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL),
(1496, 'facebook.com/Museo-Regional-Del-Nordeste-Formoseño-1455583238010520', 4, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL),
(1497, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL),
(1498, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL),
(1499, 'formosa.gob.ar/patrimonio/museos/nordeste', 7, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL),
(1500, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL),
(1501, '3704699702', 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL),
(1502, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL),
(1503, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL),
(1504, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL),
(1505, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL),
(1506, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL),
(1507, 'formosa.gob.ar/patrimonio/museos/quinquenal', 7, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL),
(1508, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL),
(1509, '3704872200', 2, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL),
(1510, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL),
(1511, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL),
(1512, 'facebook.com/museo.sciullo.1', 4, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL),
(1513, 'instagram.com/museosacrop.carmelosciullo', 5, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL),
(1514, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL),
(1515, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL),
(1516, 'facebook.com/MUSEO-Historico-PADRE-Carmelo-SCIULLO-Parroquia-Virgen-del-Rosario-Formosa-268551653556877', 8, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL),
(1517, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL),
(1518, '4428585', 9, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL),
(1519, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL),
(1520, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL),
(1521, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL),
(1522, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL),
(1523, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL),
(1524, '*Para el teléfono fijo el interno es (6245)', 8, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL),
(1525, '3704904014', 2, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL),
(1526, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL),
(1527, 'iglesiacatedralfsa@gmail.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL),
(1528, 'facebook.com/CatedralFsa', 4, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL),
(1529, 'instagram.com/iglesiacatedralformosa', 5, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL),
(1530, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL),
(1531, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL),
(1532, '3704434608', 8, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL),
(1533, '3704346991', 2, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL),
(1534, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL),
(1535, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL),
(1536, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL),
(1537, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL),
(1538, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL),
(1539, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL),
(1540, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL),
(1541, '3704257285', 2, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL),
(1542, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL),
(1543, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL),
(1544, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL),
(1545, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL),
(1546, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL),
(1547, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL),
(1548, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL),
(1549, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL),
(1550, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL),
(1551, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL),
(1552, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL),
(1553, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL),
(1554, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL),
(1555, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL),
(1556, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL),
(1557, '3704341567', 2, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL),
(1558, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL),
(1559, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL),
(1560, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL),
(1561, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL),
(1562, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL),
(1563, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL),
(1564, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL),
(1565, '3704321381', 2, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL),
(1566, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL),
(1567, 'museoferroviariofsa@gmail.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL),
(1568, 'facebook.com/MuseoFerroviarioMunicipalFormosa', 4, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL),
(1569, 'instagram.com/ferroviariomuseo', 5, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL),
(1570, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL),
(1571, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL),
(1572, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL),
(1573, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL),
(1574, '4436423', 9, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL),
(1575, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL),
(1576, 'facebook.com/MuseoJPDuffard', 4, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL),
(1577, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL),
(1578, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL),
(1579, 'formosa.gob.ar/patrimonio/museos/regional', 7, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL),
(1580, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL, NULL),
(1590, '3704669537', 2, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL),
(1591, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL),
(1592, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL),
(1593, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL),
(1594, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL),
(1595, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL),
(1596, 'formosa.gob.ar/patrimonio/museocienciasnaturales', 7, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL),
(1597, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL),
(1620, '3704613581', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(1621, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(1622, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(1623, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(1624, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(1625, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(1626, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(1627, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(1628, '3704278408', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1629, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1630, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1631, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1632, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1633, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1634, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1635, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(1636, '3704704619', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(1637, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(1638, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(1639, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(1640, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(1641, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(1642, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(1643, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(1644, '3718549793', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(1645, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(1646, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(1647, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(1648, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(1649, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(1650, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(1651, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(1652, '3716414586', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(1653, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(1654, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(1655, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(1656, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(1657, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(1658, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(1659, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(1660, '3716617291', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1661, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1662, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1663, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1664, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1665, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1666, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1667, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(1668, '3704512121', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1669, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1670, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1671, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1672, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1673, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1674, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1675, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(1676, '3704230107', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1677, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1678, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1679, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1680, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1681, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1682, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1683, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(1684, '3718635118', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1685, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1686, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1687, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1688, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1689, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1690, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1691, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(1692, '3718552929', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(1693, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(1694, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(1695, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(1696, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(1697, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(1698, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(1699, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(1700, '3705036512', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL),
(1701, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL),
(1702, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL),
(1703, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL),
(1704, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL),
(1705, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL),
(1706, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL),
(1707, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL),
(1708, '3704274747', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL),
(1709, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL),
(1710, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL),
(1711, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL),
(1712, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL),
(1713, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL),
(1714, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL),
(1715, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL),
(1740, '3704235905', 2, NULL, NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL),
(1741, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL),
(1742, '', 1, NULL, NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL),
(1743, '', 4, NULL, NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL),
(1744, '', 5, NULL, NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL),
(1745, '', 6, NULL, NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL),
(1746, '', 7, NULL, NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL),
(1747, '', 8, NULL, NULL, NULL, NULL, NULL, 40, NULL, NULL, NULL, NULL),
(1748, '3704578225', 2, NULL, NULL, NULL, NULL, NULL, 41, NULL, NULL, NULL, NULL),
(1749, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 41, NULL, NULL, NULL, NULL),
(1750, '', 1, NULL, NULL, NULL, NULL, NULL, 41, NULL, NULL, NULL, NULL),
(1751, '', 4, NULL, NULL, NULL, NULL, NULL, 41, NULL, NULL, NULL, NULL),
(1752, '', 5, NULL, NULL, NULL, NULL, NULL, 41, NULL, NULL, NULL, NULL),
(1753, '', 6, NULL, NULL, NULL, NULL, NULL, 41, NULL, NULL, NULL, NULL),
(1754, '', 7, NULL, NULL, NULL, NULL, NULL, 41, NULL, NULL, NULL, NULL),
(1755, '', 8, NULL, NULL, NULL, NULL, NULL, 41, NULL, NULL, NULL, NULL),
(1756, '3704236819', 2, NULL, NULL, NULL, NULL, NULL, 42, NULL, NULL, NULL, NULL),
(1757, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 42, NULL, NULL, NULL, NULL),
(1758, '', 1, NULL, NULL, NULL, NULL, NULL, 42, NULL, NULL, NULL, NULL),
(1759, '', 4, NULL, NULL, NULL, NULL, NULL, 42, NULL, NULL, NULL, NULL),
(1760, '', 5, NULL, NULL, NULL, NULL, NULL, 42, NULL, NULL, NULL, NULL),
(1761, '', 6, NULL, NULL, NULL, NULL, NULL, 42, NULL, NULL, NULL, NULL),
(1762, '', 7, NULL, NULL, NULL, NULL, NULL, 42, NULL, NULL, NULL, NULL),
(1763, '', 8, NULL, NULL, NULL, NULL, NULL, 42, NULL, NULL, NULL, NULL),
(1764, '3704575912', 2, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1765, '3704821777', 2, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1766, '', 9, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1767, 'cherogaturismo@gmail.com', 1, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1768, 'facebook.com/FormosaExcursiones', 4, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1769, 'iinstagram.com/cheroga_turismo_activo', 5, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1770, '', 6, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1771, '', 7, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1772, '', 8, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1773, '3718528136', 2, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1774, '', 9, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1775, 'plmonges@gmail.com', 1, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1776, 'facebook.com/Newetclorinda', 4, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1777, 'instagram.com/newet_espiritudelatierra', 5, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1778, '', 6, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1779, 'www.newetaventuras.com', 7, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1780, '', 8, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1781, '3718603046', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL),
(1782, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL),
(1783, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL),
(1784, 'facebook.com/Camping-Dalto-262475937193667', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL),
(1785, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL),
(1786, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL),
(1787, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL),
(1788, '3718414554', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL),
(1789, '3718514511', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL),
(1790, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL),
(1791, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL),
(1792, 'facebook.com/paseo.lamolina', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL),
(1793, 'instagram.com/paseo_la_molina', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL),
(1794, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL),
(1795, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL),
(1796, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL),
(1797, '3704413923', 2, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1798, '', 9, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1799, 'fede_fsa@yahoo.com.ar', 1, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1800, 'facebook.com/Dominguez-Excursiones-109813514932158', 4, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1801, 'instagram.com/federicoj.dominguez', 5, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1802, '', 6, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1803, '', 7, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1804, '', 8, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1805, '3704008877', 2, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1806, 'No se registró', 9, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1807, 'fernandogaona2015@gmail.com', 1, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1808, 'facebook.com/fernando.gaona.902', 4, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1809, 'instagram.com/fgona68', 5, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1810, '', 6, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1811, '', 7, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1812, '', 8, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1813, '3704581937', 2, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1814, 'No se registró', 9, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1815, 'julioguardavidas@gmail.com', 1, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1816, 'facebook.com/odisea.formosa', 4, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1817, 'instagram.com/odisea_formosa', 5, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1818, '', 6, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1819, '', 7, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1820, 'Jonathan Zalazar (3704722119)', 8, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1821, '3704204297', 2, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1822, '', 9, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1823, 'gimenec@gmail.com', 1, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1824, 'facebook.com/BichosDeRio', 4, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1825, 'instagram.com/bichosderio', 5, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1826, '', 6, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1827, 'linktr.ee/bichosderio', 7, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1828, '', 8, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1829, '3704814383', 2, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1830, '3704567193', 2, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1831, 'No se registró', 9, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1832, 'tifsty@gmail.com', 1, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1833, 'facebook.com/nauticaajereysyrype', 4, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1834, 'instagram.com/nautica.ajere.ysyrype', 5, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1835, '', 6, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1836, '', 7, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1837, '', 8, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1838, '3704602468', 2, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1839, 'No se registró', 9, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1840, 'matiastoloza21@gmail.com', 1, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1841, 'facebook.com/igluespacio', 4, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1842, 'instagram.com/igluespacio', 5, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1843, '', 6, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1844, '', 7, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1845, '', 8, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1846, '3704608983', 2, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1847, '3704571842', 2, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1848, '', 9, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1849, 'chiloruiz009@gmail.com', 1, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1850, 'facebook.com/chilo.ruiz.56', 4, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1851, '', 5, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1852, '', 6, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1853, '', 7, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1854, 'facebook.com/chiloruiz00', 8, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1855, '3704230107', 2, 65, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1856, '', 9, 65, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1857, '', 1, 65, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1858, '', 4, 65, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1859, '', 5, 65, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1860, '', 6, 65, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1861, '', 7, 65, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1862, '', 8, 65, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1863, '3704395896', 2, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1864, 'No se registró', 9, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1865, 'mariecor66@outlook.com', 1, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1866, 'facebook.com/Guaycurú-Artesanías-salvajes-109474737601326', 4, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1867, 'instagram.com/guaycuru_artesanias.salvajes', 5, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1868, '', 6, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1869, '', 7, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1870, '', 8, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1871, '3704672687', 2, NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1872, 'No se registró', 9, NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1873, 'santiagobuchara1@gmail.com', 1, NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1874, 'facebook.com/profile.php?id=100041806945944', 4, NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1875, '', 5, NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1876, '', 6, NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1877, '', 7, NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1878, '', 8, NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1879, '3704678355', 2, NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1880, 'No se registró', 9, NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1881, 'tittystefani@gmail.com', 1, NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1882, 'facebook.com/pages/Urena-Herradura-Formosa-Argentina/180407245728125', 4, NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1883, '', 5, NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1884, '', 6, NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1885, '', 7, NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1886, '', 8, NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1887, '3718477001', 2, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1888, '1150137526', 2, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1889, '', 9, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1890, 'eljabiru@gmail.com', 1, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1891, 'facebook.com/El-Jabiru-Avistajes-135611343164312', 4, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1892, '', 5, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1893, '', 6, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1894, '', 7, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1895, '', 8, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1896, '3704274747', 2, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1897, 'No se registró', 9, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1898, 'turismoestrella.naturaleza@gmail.com', 1, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1899, 'facebook.com/LaEstrellaTurismo', 4, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `contacto` (`id_contacto`, `descripcion_contacto`, `rela_tipo_contacto_cont`, `rela_alojamiento_contacto`, `rela_prestador_contacto`, `rela_guia_contacto`, `rela_contacto_agencia`, `rela_persona_contacto`, `rela_contacto_referente`, `rela_contacto_museo`, `rela_servicios_generales`, `rela_festivales`, `rela_gastronomia_contacto`) VALUES
(1900, '', 5, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1901, '', 6, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1902, '', 7, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1903, '', 8, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1904, '3715432223', 2, NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1905, '', 9, NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1906, 'richlac@hotmail.com', 1, NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1907, 'facebook.com/LacudriTransporte', 4, NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1908, '', 5, NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1909, '', 6, NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1910, '', 7, NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1911, '', 8, NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1912, '3704098545', 2, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1913, '', 9, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1914, '', 1, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1915, 'facebook.com/iwoka.mojondefierro', 4, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1916, '', 5, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1917, '', 6, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1918, '', 7, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1919, '', 8, NULL, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1920, '3704307686', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL),
(1921, '3704369262', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL),
(1922, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL),
(1923, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL),
(1924, 'facebook.com/lidio.chavez.100', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL),
(1925, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL),
(1926, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL),
(1927, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL),
(1928, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL),
(1929, '3704061902', 2, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1930, 'No se registró', 9, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1931, 'almarazcristian7@gmail.com', 1, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1932, 'facebook.com/kayaksym.alquila', 4, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1933, 'instagram.com/kayak_sym', 5, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1934, '', 6, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1935, '', 7, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1936, '', 8, NULL, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1937, '3715480425', 2, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1938, '', 9, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1939, '', 1, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1940, '', 4, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1941, '', 5, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1942, '', 6, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1943, '', 7, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1944, '', 8, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1945, '3704340934', 2, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1946, '', 9, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1947, '', 1, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1948, '', 4, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1949, '', 5, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1950, '', 6, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1951, '', 7, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1952, '', 8, NULL, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1953, '3715616050', 2, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1954, '', 9, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1955, '', 1, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1956, '', 4, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1957, '', 5, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1958, '', 6, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1959, '', 7, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1960, '', 8, NULL, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1961, '3704239016', 2, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1962, '', 9, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1963, '', 1, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1964, '', 4, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1965, '', 5, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1966, '', 6, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1967, '', 7, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1968, '', 8, NULL, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1969, '3704651022', 2, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1970, 'No se registró', 9, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1971, '', 1, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1972, '', 4, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1973, '', 5, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1974, '', 6, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1975, '', 7, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1976, '', 8, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1977, '3704208325', 2, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1978, 'No se registró', 9, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1979, '', 1, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1980, '', 4, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1981, '', 5, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1982, '', 6, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1983, '', 7, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1984, '', 8, NULL, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1985, '3704578971', 2, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1986, 'No se registró', 9, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1987, '', 1, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1988, '', 4, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1989, '', 5, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1990, '', 6, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1991, '', 7, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1992, '', 8, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1993, '3704667631', 2, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1994, '', 9, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1995, '', 1, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1996, '', 4, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1997, '', 5, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1998, '', 6, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1999, '', 7, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2000, '', 8, NULL, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2001, '3704382257', 2, 66, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2002, 'No se registró', 9, 66, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2003, '', 1, 66, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2004, '', 4, 66, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2005, '', 5, 66, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2006, '', 6, 66, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2007, '', 7, 66, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2008, '', 8, 66, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2009, '3704720760', 2, 67, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2010, 'No se registró', 9, 67, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2011, '', 1, 67, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2012, '', 4, 67, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2013, '', 5, 67, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2014, '', 6, 67, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2015, '', 7, 67, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2016, '', 8, 67, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2017, '3718521119', 2, 68, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2018, 'No se registró', 9, 68, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2019, '', 1, 68, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2020, '', 4, 68, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2021, '', 5, 68, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2022, '', 6, 68, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2023, '', 7, 68, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2024, '', 8, 68, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2025, '3718530544', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL),
(2026, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL),
(2027, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL),
(2028, 'facebook.com/Camping-Ñande-Roga-701398100724453', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL),
(2029, 'instagram.com/campingnanderoga', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL),
(2030, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL),
(2031, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL),
(2032, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL),
(2033, '3704667631', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL),
(2034, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL),
(2035, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL),
(2036, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL),
(2037, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL),
(2038, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL),
(2039, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL),
(2040, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL),
(2041, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL),
(2042, '3704647525', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL),
(2043, '3704206012', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL),
(2044, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL),
(2045, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL),
(2046, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL),
(2047, 'facebook.com/El-Predio-Camping-Pileta-841031522962121', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL),
(2048, 'instagram.com/el_predio_', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL),
(2049, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL),
(2050, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL),
(2051, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL),
(2052, '3704680732', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL),
(2053, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL),
(2054, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL),
(2055, 'facebook.com/Chuqui-Cue-1540445926208821', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL),
(2056, 'instagram.com/chuquicue', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL),
(2057, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL),
(2058, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL),
(2059, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL),
(2060, '3704236819', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL),
(2061, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL),
(2062, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL),
(2063, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL),
(2064, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL),
(2065, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL),
(2066, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL),
(2067, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL),
(2068, '3704707154', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL),
(2069, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL),
(2070, 'raulomarsoraire@gmail.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL),
(2071, 'facebook.com/profile.php?id=100063227989320', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL),
(2072, 'instagram.com/camping_montelindo', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL),
(2073, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL),
(2074, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL),
(2075, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL),
(2076, '3704618061', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL),
(2077, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL),
(2078, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL),
(2079, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL),
(2080, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL),
(2081, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL),
(2082, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL),
(2083, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL),
(2092, '3718417763', 2, NULL, NULL, NULL, NULL, NULL, 43, NULL, NULL, NULL, NULL),
(2093, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 43, NULL, NULL, NULL, NULL),
(2094, '', 1, NULL, NULL, NULL, NULL, NULL, 43, NULL, NULL, NULL, NULL),
(2095, 'facebook.com/profile.php?id=100057165561229', 4, NULL, NULL, NULL, NULL, NULL, 43, NULL, NULL, NULL, NULL),
(2096, '', 5, NULL, NULL, NULL, NULL, NULL, 43, NULL, NULL, NULL, NULL),
(2097, '', 6, NULL, NULL, NULL, NULL, NULL, 43, NULL, NULL, NULL, NULL),
(2098, '', 7, NULL, NULL, NULL, NULL, NULL, 43, NULL, NULL, NULL, NULL),
(2099, '', 8, NULL, NULL, NULL, NULL, NULL, 43, NULL, NULL, NULL, NULL),
(2100, '3704201877', 2, NULL, NULL, NULL, NULL, NULL, 44, NULL, NULL, NULL, NULL),
(2101, '4480299', 9, NULL, NULL, NULL, NULL, NULL, 44, NULL, NULL, NULL, NULL),
(2102, '', 1, NULL, NULL, NULL, NULL, NULL, 44, NULL, NULL, NULL, NULL),
(2103, '', 4, NULL, NULL, NULL, NULL, NULL, 44, NULL, NULL, NULL, NULL),
(2104, '', 5, NULL, NULL, NULL, NULL, NULL, 44, NULL, NULL, NULL, NULL),
(2105, '', 6, NULL, NULL, NULL, NULL, NULL, 44, NULL, NULL, NULL, NULL),
(2106, '', 7, NULL, NULL, NULL, NULL, NULL, 44, NULL, NULL, NULL, NULL),
(2107, '', 8, NULL, NULL, NULL, NULL, NULL, 44, NULL, NULL, NULL, NULL),
(2108, '3718601558', 2, NULL, NULL, NULL, NULL, NULL, 45, NULL, NULL, NULL, NULL),
(2109, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 45, NULL, NULL, NULL, NULL),
(2110, '', 1, NULL, NULL, NULL, NULL, NULL, 45, NULL, NULL, NULL, NULL),
(2111, '', 4, NULL, NULL, NULL, NULL, NULL, 45, NULL, NULL, NULL, NULL),
(2112, '', 5, NULL, NULL, NULL, NULL, NULL, 45, NULL, NULL, NULL, NULL),
(2113, '', 6, NULL, NULL, NULL, NULL, NULL, 45, NULL, NULL, NULL, NULL),
(2114, '', 7, NULL, NULL, NULL, NULL, NULL, 45, NULL, NULL, NULL, NULL),
(2115, '', 8, NULL, NULL, NULL, NULL, NULL, 45, NULL, NULL, NULL, NULL),
(2148, '3704947853', 2, NULL, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL),
(2149, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL),
(2150, '', 1, NULL, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL),
(2151, '', 4, NULL, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL),
(2152, '', 5, NULL, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL),
(2153, '', 6, NULL, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL),
(2154, '', 7, NULL, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL),
(2155, '', 8, NULL, NULL, NULL, NULL, NULL, 50, NULL, NULL, NULL, NULL),
(2156, '3704219582', 2, NULL, NULL, NULL, NULL, NULL, 51, NULL, NULL, NULL, NULL),
(2157, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 51, NULL, NULL, NULL, NULL),
(2158, '', 1, NULL, NULL, NULL, NULL, NULL, 51, NULL, NULL, NULL, NULL),
(2159, '', 4, NULL, NULL, NULL, NULL, NULL, 51, NULL, NULL, NULL, NULL),
(2160, '', 5, NULL, NULL, NULL, NULL, NULL, 51, NULL, NULL, NULL, NULL),
(2161, '', 6, NULL, NULL, NULL, NULL, NULL, 51, NULL, NULL, NULL, NULL),
(2162, '', 7, NULL, NULL, NULL, NULL, NULL, 51, NULL, NULL, NULL, NULL),
(2163, '', 8, NULL, NULL, NULL, NULL, NULL, 51, NULL, NULL, NULL, NULL),
(2164, '3704698522', 2, NULL, NULL, NULL, NULL, NULL, 52, NULL, NULL, NULL, NULL),
(2165, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 52, NULL, NULL, NULL, NULL),
(2166, '', 1, NULL, NULL, NULL, NULL, NULL, 52, NULL, NULL, NULL, NULL),
(2167, '', 4, NULL, NULL, NULL, NULL, NULL, 52, NULL, NULL, NULL, NULL),
(2168, '', 5, NULL, NULL, NULL, NULL, NULL, 52, NULL, NULL, NULL, NULL),
(2169, '', 6, NULL, NULL, NULL, NULL, NULL, 52, NULL, NULL, NULL, NULL),
(2170, '', 7, NULL, NULL, NULL, NULL, NULL, 52, NULL, NULL, NULL, NULL),
(2171, 'Concejal de Belgrano', 8, NULL, NULL, NULL, NULL, NULL, 52, NULL, NULL, NULL, NULL),
(2172, '3704300273', 2, NULL, NULL, NULL, NULL, NULL, 53, NULL, NULL, NULL, NULL),
(2173, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 53, NULL, NULL, NULL, NULL),
(2174, '', 1, NULL, NULL, NULL, NULL, NULL, 53, NULL, NULL, NULL, NULL),
(2175, '', 4, NULL, NULL, NULL, NULL, NULL, 53, NULL, NULL, NULL, NULL),
(2176, '', 5, NULL, NULL, NULL, NULL, NULL, 53, NULL, NULL, NULL, NULL),
(2177, '', 6, NULL, NULL, NULL, NULL, NULL, 53, NULL, NULL, NULL, NULL),
(2178, '', 7, NULL, NULL, NULL, NULL, NULL, 53, NULL, NULL, NULL, NULL),
(2179, '', 8, NULL, NULL, NULL, NULL, NULL, 53, NULL, NULL, NULL, NULL),
(2200, '3704251730', 2, NULL, NULL, NULL, NULL, NULL, 58, NULL, NULL, NULL, NULL),
(2201, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 58, NULL, NULL, NULL, NULL),
(2202, '', 1, NULL, NULL, NULL, NULL, NULL, 58, NULL, NULL, NULL, NULL),
(2203, '', 4, NULL, NULL, NULL, NULL, NULL, 58, NULL, NULL, NULL, NULL),
(2204, '', 5, NULL, NULL, NULL, NULL, NULL, 58, NULL, NULL, NULL, NULL),
(2205, '', 6, NULL, NULL, NULL, NULL, NULL, 58, NULL, NULL, NULL, NULL),
(2206, '', 7, NULL, NULL, NULL, NULL, NULL, 58, NULL, NULL, NULL, NULL),
(2207, '3704224503', 8, NULL, NULL, NULL, NULL, NULL, 58, NULL, NULL, NULL, NULL),
(2208, '3704600380', 2, NULL, NULL, NULL, NULL, NULL, 59, NULL, NULL, NULL, NULL),
(2209, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 59, NULL, NULL, NULL, NULL),
(2210, '', 1, NULL, NULL, NULL, NULL, NULL, 59, NULL, NULL, NULL, NULL),
(2211, '', 4, NULL, NULL, NULL, NULL, NULL, 59, NULL, NULL, NULL, NULL),
(2212, '', 5, NULL, NULL, NULL, NULL, NULL, 59, NULL, NULL, NULL, NULL),
(2213, '', 6, NULL, NULL, NULL, NULL, NULL, 59, NULL, NULL, NULL, NULL),
(2214, '', 7, NULL, NULL, NULL, NULL, NULL, 59, NULL, NULL, NULL, NULL),
(2215, '', 8, NULL, NULL, NULL, NULL, NULL, 59, NULL, NULL, NULL, NULL),
(2216, '3704070187', 2, NULL, NULL, NULL, NULL, NULL, 60, NULL, NULL, NULL, NULL),
(2217, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 60, NULL, NULL, NULL, NULL),
(2218, '', 1, NULL, NULL, NULL, NULL, NULL, 60, NULL, NULL, NULL, NULL),
(2219, '', 4, NULL, NULL, NULL, NULL, NULL, 60, NULL, NULL, NULL, NULL),
(2220, '', 5, NULL, NULL, NULL, NULL, NULL, 60, NULL, NULL, NULL, NULL),
(2221, '', 6, NULL, NULL, NULL, NULL, NULL, 60, NULL, NULL, NULL, NULL),
(2222, '', 7, NULL, NULL, NULL, NULL, NULL, 60, NULL, NULL, NULL, NULL),
(2223, '', 8, NULL, NULL, NULL, NULL, NULL, 60, NULL, NULL, NULL, NULL),
(2224, '3704613644', 2, NULL, NULL, NULL, NULL, NULL, 61, NULL, NULL, NULL, NULL),
(2225, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 61, NULL, NULL, NULL, NULL),
(2226, '', 1, NULL, NULL, NULL, NULL, NULL, 61, NULL, NULL, NULL, NULL),
(2227, '', 4, NULL, NULL, NULL, NULL, NULL, 61, NULL, NULL, NULL, NULL),
(2228, '', 5, NULL, NULL, NULL, NULL, NULL, 61, NULL, NULL, NULL, NULL),
(2229, '', 6, NULL, NULL, NULL, NULL, NULL, 61, NULL, NULL, NULL, NULL),
(2230, '', 7, NULL, NULL, NULL, NULL, NULL, 61, NULL, NULL, NULL, NULL),
(2231, '', 8, NULL, NULL, NULL, NULL, NULL, 61, NULL, NULL, NULL, NULL),
(2232, '3704803687', 2, NULL, NULL, NULL, NULL, NULL, 62, NULL, NULL, NULL, NULL),
(2233, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 62, NULL, NULL, NULL, NULL),
(2234, '', 1, NULL, NULL, NULL, NULL, NULL, 62, NULL, NULL, NULL, NULL),
(2235, '', 4, NULL, NULL, NULL, NULL, NULL, 62, NULL, NULL, NULL, NULL),
(2236, '', 5, NULL, NULL, NULL, NULL, NULL, 62, NULL, NULL, NULL, NULL),
(2237, '', 6, NULL, NULL, NULL, NULL, NULL, 62, NULL, NULL, NULL, NULL),
(2238, '', 7, NULL, NULL, NULL, NULL, NULL, 62, NULL, NULL, NULL, NULL),
(2239, '', 8, NULL, NULL, NULL, NULL, NULL, 62, NULL, NULL, NULL, NULL),
(2240, '3704206644', 2, NULL, NULL, NULL, NULL, NULL, 63, NULL, NULL, NULL, NULL),
(2241, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 63, NULL, NULL, NULL, NULL),
(2242, '', 1, NULL, NULL, NULL, NULL, NULL, 63, NULL, NULL, NULL, NULL),
(2243, '', 4, NULL, NULL, NULL, NULL, NULL, 63, NULL, NULL, NULL, NULL),
(2244, '', 5, NULL, NULL, NULL, NULL, NULL, 63, NULL, NULL, NULL, NULL),
(2245, '', 6, NULL, NULL, NULL, NULL, NULL, 63, NULL, NULL, NULL, NULL),
(2246, '', 7, NULL, NULL, NULL, NULL, NULL, 63, NULL, NULL, NULL, NULL),
(2247, '', 8, NULL, NULL, NULL, NULL, NULL, 63, NULL, NULL, NULL, NULL),
(2248, '3704413814', 2, NULL, NULL, NULL, NULL, NULL, 64, NULL, NULL, NULL, NULL),
(2249, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 64, NULL, NULL, NULL, NULL),
(2250, '', 1, NULL, NULL, NULL, NULL, NULL, 64, NULL, NULL, NULL, NULL),
(2251, '', 4, NULL, NULL, NULL, NULL, NULL, 64, NULL, NULL, NULL, NULL),
(2252, '', 5, NULL, NULL, NULL, NULL, NULL, 64, NULL, NULL, NULL, NULL),
(2253, '', 6, NULL, NULL, NULL, NULL, NULL, 64, NULL, NULL, NULL, NULL),
(2254, '', 7, NULL, NULL, NULL, NULL, NULL, 64, NULL, NULL, NULL, NULL),
(2255, '', 8, NULL, NULL, NULL, NULL, NULL, 64, NULL, NULL, NULL, NULL),
(2256, '3704815573', 2, NULL, NULL, NULL, NULL, NULL, 65, NULL, NULL, NULL, NULL),
(2257, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 65, NULL, NULL, NULL, NULL),
(2258, '', 1, NULL, NULL, NULL, NULL, NULL, 65, NULL, NULL, NULL, NULL),
(2259, '', 4, NULL, NULL, NULL, NULL, NULL, 65, NULL, NULL, NULL, NULL),
(2260, '', 5, NULL, NULL, NULL, NULL, NULL, 65, NULL, NULL, NULL, NULL),
(2261, '', 6, NULL, NULL, NULL, NULL, NULL, 65, NULL, NULL, NULL, NULL),
(2262, '', 7, NULL, NULL, NULL, NULL, NULL, 65, NULL, NULL, NULL, NULL),
(2263, '3718480085', 8, NULL, NULL, NULL, NULL, NULL, 65, NULL, NULL, NULL, NULL),
(2264, '3704608765', 2, NULL, NULL, NULL, NULL, NULL, 66, NULL, NULL, NULL, NULL),
(2265, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 66, NULL, NULL, NULL, NULL),
(2266, '', 1, NULL, NULL, NULL, NULL, NULL, 66, NULL, NULL, NULL, NULL),
(2267, '', 4, NULL, NULL, NULL, NULL, NULL, 66, NULL, NULL, NULL, NULL),
(2268, '', 5, NULL, NULL, NULL, NULL, NULL, 66, NULL, NULL, NULL, NULL),
(2269, '', 6, NULL, NULL, NULL, NULL, NULL, 66, NULL, NULL, NULL, NULL),
(2270, '', 7, NULL, NULL, NULL, NULL, NULL, 66, NULL, NULL, NULL, NULL),
(2271, '', 8, NULL, NULL, NULL, NULL, NULL, 66, NULL, NULL, NULL, NULL),
(2280, '3718416388', 2, NULL, NULL, NULL, NULL, NULL, 68, NULL, NULL, NULL, NULL),
(2281, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, 68, NULL, NULL, NULL, NULL),
(2282, '', 1, NULL, NULL, NULL, NULL, NULL, 68, NULL, NULL, NULL, NULL),
(2283, '', 4, NULL, NULL, NULL, NULL, NULL, 68, NULL, NULL, NULL, NULL),
(2284, '', 5, NULL, NULL, NULL, NULL, NULL, 68, NULL, NULL, NULL, NULL),
(2285, '', 6, NULL, NULL, NULL, NULL, NULL, 68, NULL, NULL, NULL, NULL),
(2286, '', 7, NULL, NULL, NULL, NULL, NULL, 68, NULL, NULL, NULL, NULL),
(2287, '', 8, NULL, NULL, NULL, NULL, NULL, 68, NULL, NULL, NULL, NULL),
(2323, '3704346991', 2, NULL, NULL, NULL, NULL, NULL, 75, NULL, NULL, NULL, NULL),
(2324, '', 9, NULL, NULL, NULL, NULL, NULL, 75, NULL, NULL, NULL, NULL),
(2325, '', 1, NULL, NULL, NULL, NULL, NULL, 75, NULL, NULL, NULL, NULL),
(2326, '', 4, NULL, NULL, NULL, NULL, NULL, 75, NULL, NULL, NULL, NULL),
(2327, '', 5, NULL, NULL, NULL, NULL, NULL, 75, NULL, NULL, NULL, NULL),
(2328, '', 6, NULL, NULL, NULL, NULL, NULL, 75, NULL, NULL, NULL, NULL),
(2329, '', 7, NULL, NULL, NULL, NULL, NULL, 75, NULL, NULL, NULL, NULL),
(2330, '', 8, NULL, NULL, NULL, NULL, NULL, 75, NULL, NULL, NULL, NULL),
(2331, '3718400203', 2, 72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2332, 'No se registró', 9, 72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2333, '', 1, 72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2334, 'facebook.com/Hospedaje-El-Riki-688187351299176', 4, 72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2335, '', 5, 72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2336, '', 6, 72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2337, '', 7, 72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2338, '(03718) 400203 (Fijo)', 8, 72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2339, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL),
(2340, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL),
(2341, 'riopilcomayo@apn.gob.ar', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL),
(2342, 'facebook.com/parquenacionalriopilcomayo', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL),
(2343, 'instagram.com/parquenacionalriopilcomayo', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL),
(2344, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL),
(2345, 'argentina.gob.ar/parquesnacionales/riopilcomayo', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL),
(2346, '(03718) 470045 (Fijo)', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL),
(2347, '3711614118', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL),
(2348, '3704222336', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL),
(2349, '3704222335', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL),
(2350, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL),
(2351, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL),
(2352, 'rnformosa@apn.gob.ar', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL),
(2353, 'facebook.com/reserva.formosa', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL),
(2354, 'instagram.com/rnformosa', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL),
(2355, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL),
(2356, 'argentina.gob.ar/parquesnacionales/formosa', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL),
(2357, '3711403048 (Natalia Alonzo)', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL),
(2358, '3704550754', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL),
(2359, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL),
(2360, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL),
(2361, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL),
(2362, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL),
(2363, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL),
(2364, 'formosa.gob.ar/produccion/guaycolec', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL),
(2365, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL),
(2366, '3704231878', 2, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2367, '', 9, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2368, '', 1, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2369, 'facebook.com/Hotel-Genesis-158954604147464', 4, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2370, '', 5, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2371, '', 6, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2372, '', 7, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2373, '', 8, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2374, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL),
(2375, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL),
(2376, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL),
(2377, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL),
(2378, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL),
(2379, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL),
(2380, 'formosahermosa.gob.ar/region-oeste/reserva-natural-riacho-teuquito-2/', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL),
(2381, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL),
(2382, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL),
(2383, '4436698', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL),
(2384, 'ucap.rblo@formosa.gob.ar', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL),
(2385, 'facebook.com/RBLOFormosa/', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL),
(2386, 'instagram.com/lagunaocayherraduras', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL),
(2387, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL),
(2388, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL),
(2389, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL),
(2390, '3624691354', 2, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2391, '', 9, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2392, 'info@lorient.com.ar', 1, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2393, 'facebook.com/leonardo.oscar.39', 4, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2394, '', 5, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2395, '', 6, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2396, 'https://lorient.com.ar/', 7, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2397, '(0362) 4442729 (Fijo)', 8, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2398, '3704415790', 2, NULL, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2399, '3704661153', 2, NULL, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2400, '', 9, NULL, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2401, 'l.lauraisabel@yahoo.com', 1, NULL, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2402, 'facebook.com/alquilerdeautosfsa', 4, NULL, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2403, '', 5, NULL, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2404, '', 6, NULL, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2405, '', 7, NULL, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2406, '', 8, NULL, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2407, '123', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL),
(2408, '321', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL),
(2409, 'pasajesexpressfsa1111@hotmail.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL),
(2410, 'facebook museo', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL),
(2411, 'diegoinstagram', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL),
(2412, 'diegotwitter', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL),
(2413, 'diegoweb', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL),
(2414, 'bonusOtro', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL),
(2415, '123333', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL),
(2416, '32121', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL),
(2417, '4444', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL),
(2418, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL),
(2419, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL),
(2420, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL),
(2421, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL),
(2422, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL),
(2423, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL),
(2424, '999999999', 2, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL),
(2425, '8888888', 2, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL),
(2426, '11111111111111', 9, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL),
(2427, 'valentino.dp@gmail.com', 1, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL),
(2428, '4444', 2, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL),
(2429, '55555', 9, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL),
(2430, 'matias@gmail.com', 1, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL),
(2431, '3704555555', 2, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL),
(2432, '3704666666', 2, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL),
(2433, '4411111', 9, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL),
(2434, 'ronaldo@almiron.com', 1, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL),
(2476, '3705089699', 2, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2477, '', 9, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2478, '', 1, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2479, '', 4, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2480, '', 5, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2481, '', 6, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2482, '', 7, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2483, '', 8, NULL, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2484, '3704430973', 2, 77, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2485, '', 9, 77, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2486, 'res.espana@pgci-lar.com', 1, 77, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2487, '', 4, 77, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2488, '', 5, 77, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2489, '', 6, 77, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2490, '', 7, 77, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2491, '', 8, 77, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2500, '3704001426', 2, 78, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2501, '', 9, 78, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2502, '', 1, 78, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2503, '', 4, 78, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2504, '', 5, 78, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2505, '', 6, 78, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2506, '', 7, 78, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2507, '', 8, 78, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2508, '1111', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(2509, '2222', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(2510, '3333', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(2511, 'gastronomiados@gmail.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(2512, 'facebookdos', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(2513, 'instagramdos', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(2514, 'twitterdos', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(2515, 'webdos', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(2516, 'otrodos', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(2517, '1234', 2, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL),
(2518, '4321', 9, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL),
(2519, 'davidpereyra2013.dp@gmail.com', 1, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL),
(2520, '3704858458', 2, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL),
(2521, '', 9, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL),
(2522, 'davidpereyra2013.dp@gmail.com', 1, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL);

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
(3, 'Central');

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
(75, '', NULL, NULL, NULL, NULL, 23),
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
(111, 'Maipú 296', NULL, NULL, NULL, NULL, 35),
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
(126, 'Barrio San Cayetano', NULL, NULL, NULL, NULL, 24),
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
(144, 'RN N°81 Acceso Oeste Km 1460', NULL, NULL, NULL, NULL, 1),
(145, 'Av. San Martín 250', NULL, NULL, NULL, NULL, 1),
(146, 'Matienzo y Brasil', NULL, NULL, NULL, NULL, 1),
(147, 'Güemes y Rivadavia', NULL, NULL, NULL, NULL, 1),
(148, 'Av. 25 de Mayo S/N (Sobre RN N°81)', NULL, NULL, NULL, NULL, 1),
(149, '', NULL, NULL, NULL, NULL, 41),
(151, 'Buenos Aires y San Antonio', NULL, NULL, NULL, NULL, 2),
(152, 'Padre Bonino S/N ', NULL, NULL, NULL, NULL, 2),
(153, 'Belgrano y Saenz Peña', NULL, NULL, NULL, NULL, 2),
(154, 'RN N° 81 (Acceso a Ibarreta)', NULL, NULL, NULL, NULL, 2),
(155, 'Carlos Pellegrini y Av. 25 de Mayo', NULL, NULL, NULL, NULL, 30),
(156, 'Av. 25 de Mayo 199', NULL, NULL, NULL, NULL, 30),
(157, 'Carlos Pellegrini y Esquiu ', NULL, NULL, NULL, NULL, 30),
(158, 'Av. San Martín 524', NULL, NULL, NULL, NULL, 30),
(159, 'Av. San Martín 540', NULL, NULL, NULL, NULL, 30),
(160, 'Ruta 1, camino a Villafañe (A 5 km de El Colorado) ', NULL, NULL, NULL, NULL, 30),
(161, 'Av. San Martín esq. Saavedra', NULL, NULL, NULL, NULL, 33),
(162, 'RP N°1 Acceso a Villafañe', NULL, NULL, NULL, NULL, 33),
(163, '', NULL, NULL, NULL, NULL, 33),
(164, 'José Hernandez S/N (Entre Fontana y Av. Fray Bollini)', NULL, NULL, NULL, NULL, 57),
(165, 'RN N°86 y Av. Dr. Ortiz', NULL, NULL, NULL, NULL, 57),
(166, 'RN N°86 y Av. 25 de Mayo', NULL, NULL, NULL, NULL, 57),
(167, 'Av. San Martín y Sargento Cabral', NULL, NULL, NULL, NULL, 57),
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
(212, 'Pringles Nº691 (2)', NULL, NULL, NULL, NULL, 35),
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
(229, 'Ubicado a la mano izquierda de la Ruta Nacional Nº 86 \"Docentes Argentinos\" en el camino de acceso a Laguna Blanca.', NULL, NULL, NULL, NULL, 57),
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
(271, 'Isla de Oro', NULL, NULL, NULL, NULL, 35),
(272, 'Espacio Cultural \"Iglú\"', NULL, NULL, NULL, NULL, 35),
(273, '', NULL, NULL, NULL, NULL, 35),
(274, 'San Martín 294', NULL, NULL, NULL, NULL, 35),
(275, 'Fortín La Soledad', NULL, NULL, NULL, NULL, 1),
(276, 'Camping Municipal', NULL, NULL, NULL, NULL, 30),
(277, 'B° Bernardino Rivadavia', NULL, NULL, NULL, NULL, 35),
(278, 'Barrio San José', NULL, NULL, NULL, NULL, 24),
(279, '', NULL, NULL, NULL, NULL, 24),
(280, '', NULL, NULL, NULL, NULL, 57),
(281, '', NULL, NULL, NULL, NULL, 1),
(282, 'Av. San Martín 130', NULL, NULL, NULL, NULL, 1),
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
(345, 'Av. Gutnisky 3924', NULL, NULL, NULL, NULL, 35),
(346, '.', NULL, NULL, NULL, NULL, 41),
(347, '', NULL, NULL, NULL, NULL, 35),
(348, 'Aeropuerto Internacional Formosa', NULL, NULL, NULL, NULL, 35),
(349, '', NULL, NULL, NULL, NULL, 35),
(350, NULL, NULL, NULL, NULL, NULL, NULL),
(352, NULL, NULL, NULL, NULL, NULL, 6),
(353, NULL, NULL, NULL, NULL, NULL, 16),
(354, NULL, NULL, NULL, NULL, NULL, 16),
(356, 'dean funes', NULL, NULL, NULL, NULL, 35),
(357, 'dean funes 11111', NULL, NULL, NULL, NULL, 25),
(358, 'la casa de matias', NULL, NULL, NULL, NULL, 16),
(359, 'circuito 5', NULL, NULL, NULL, NULL, 35),
(360, 'Paraguay 520', NULL, NULL, NULL, NULL, 35),
(366, '', NULL, NULL, NULL, NULL, 24),
(367, 'Bergrano 1032, Formosa', NULL, NULL, NULL, NULL, 35),
(369, 'Hipólito Irigoyen casi Ruta Nacional N° 81	', NULL, NULL, NULL, NULL, 2),
(370, 'segundo domicilio de gastronomia', NULL, NULL, NULL, NULL, 9),
(371, 'parag', NULL, NULL, NULL, NULL, 35),
(372, 'Paraguay 520', NULL, NULL, NULL, NULL, 35);

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
  `rela_estado_evento` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado_actividad`
--

INSERT INTO `estado_actividad` (`id_estado`, `rela_tipo_estado`, `rela_estado_alojamiento`, `rela_estado_agencia`, `rela_estado_prestador`, `rela_estado_guia`, `rela_estado_evento`) VALUES
(41, 1, 3, NULL, NULL, NULL, NULL),
(42, 9, 4, NULL, NULL, NULL, NULL),
(43, 1, 5, NULL, NULL, NULL, NULL),
(44, 1, 6, NULL, NULL, NULL, NULL),
(45, 1, 7, NULL, NULL, NULL, NULL),
(46, 1, 8, NULL, NULL, NULL, NULL),
(47, 1, 9, NULL, NULL, NULL, NULL),
(48, 1, 10, NULL, NULL, NULL, NULL),
(49, 3, 11, NULL, NULL, NULL, NULL),
(50, 1, 12, NULL, NULL, NULL, NULL),
(51, 3, 13, NULL, NULL, NULL, NULL),
(52, 1, 14, NULL, NULL, NULL, NULL),
(56, 1, 15, NULL, NULL, NULL, NULL),
(57, 1, 16, NULL, NULL, NULL, NULL),
(58, 1, 17, NULL, NULL, NULL, NULL),
(59, 1, 18, NULL, NULL, NULL, NULL),
(60, 1, 19, NULL, NULL, NULL, NULL),
(61, 1, 20, NULL, NULL, NULL, NULL),
(62, 9, 21, NULL, NULL, NULL, NULL),
(63, NULL, 22, NULL, NULL, NULL, NULL),
(64, 1, 23, NULL, NULL, NULL, NULL),
(65, 1, 24, NULL, NULL, NULL, NULL),
(66, 1, 25, NULL, NULL, NULL, NULL),
(67, 1, 26, NULL, NULL, NULL, NULL),
(68, 1, 27, NULL, NULL, NULL, NULL),
(69, 6, 28, NULL, NULL, NULL, NULL),
(70, 1, 29, NULL, NULL, NULL, NULL),
(71, 9, 30, NULL, NULL, NULL, NULL),
(72, 3, 31, NULL, NULL, NULL, NULL),
(73, 1, 32, NULL, NULL, NULL, NULL),
(74, 6, 33, NULL, NULL, NULL, NULL),
(75, 1, 34, NULL, NULL, NULL, NULL),
(76, 1, 35, NULL, NULL, NULL, NULL),
(77, 1, 36, NULL, NULL, NULL, NULL),
(78, 1, 37, NULL, NULL, NULL, NULL),
(80, 1, 39, NULL, NULL, NULL, NULL),
(81, 1, 40, NULL, NULL, NULL, NULL),
(82, 3, 41, NULL, NULL, NULL, NULL),
(83, 1, 42, NULL, NULL, NULL, NULL),
(84, 1, 43, NULL, NULL, NULL, NULL),
(85, 1, 44, NULL, NULL, NULL, NULL),
(86, 1, 45, NULL, NULL, NULL, NULL),
(87, 1, 46, NULL, NULL, NULL, NULL),
(88, 1, 47, NULL, NULL, NULL, NULL),
(89, 1, 48, NULL, NULL, NULL, NULL),
(90, 1, 49, NULL, NULL, NULL, NULL),
(91, 1, 50, NULL, NULL, NULL, NULL),
(92, 6, 51, NULL, NULL, NULL, NULL),
(93, 6, 52, NULL, NULL, NULL, NULL),
(94, 1, 53, NULL, NULL, NULL, NULL),
(95, 1, 54, NULL, NULL, NULL, NULL),
(96, 3, 55, NULL, NULL, NULL, NULL),
(97, 1, 56, NULL, NULL, NULL, NULL),
(99, 5, 58, NULL, NULL, NULL, NULL),
(100, 1, 59, NULL, NULL, NULL, NULL),
(101, 5, 60, NULL, NULL, NULL, NULL),
(102, 3, 61, NULL, NULL, NULL, NULL),
(103, 6, 62, NULL, NULL, NULL, NULL),
(104, 1, 63, NULL, NULL, NULL, NULL),
(105, 1, 64, NULL, NULL, NULL, NULL),
(117, 7, NULL, 7, NULL, NULL, NULL),
(118, 1, NULL, 8, NULL, NULL, NULL),
(119, 6, NULL, 9, NULL, NULL, NULL),
(122, 1, NULL, 12, NULL, NULL, NULL),
(123, 7, NULL, 13, NULL, NULL, NULL),
(126, 1, NULL, 16, NULL, NULL, NULL),
(127, 1, NULL, 17, NULL, NULL, NULL),
(128, 1, NULL, 18, NULL, NULL, NULL),
(129, 1, NULL, 19, NULL, NULL, NULL),
(130, 1, NULL, 20, NULL, NULL, NULL),
(131, 1, NULL, 21, NULL, NULL, NULL),
(133, 1, NULL, 23, NULL, NULL, NULL),
(134, 1, NULL, 24, NULL, NULL, NULL),
(135, 1, NULL, 25, NULL, NULL, NULL),
(136, 1, NULL, 26, NULL, NULL, NULL),
(137, 1, NULL, 27, NULL, NULL, NULL),
(138, 1, NULL, 28, NULL, NULL, NULL),
(139, 7, NULL, 29, NULL, NULL, NULL),
(145, 1, NULL, NULL, 4, NULL, NULL),
(146, 1, NULL, NULL, 5, NULL, NULL),
(147, 1, NULL, NULL, 6, NULL, NULL),
(148, 1, NULL, NULL, 7, NULL, NULL),
(149, 1, NULL, NULL, 8, NULL, NULL),
(150, 1, NULL, NULL, 9, NULL, NULL),
(151, 5, NULL, NULL, 10, NULL, NULL),
(152, 1, NULL, NULL, 11, NULL, NULL),
(153, 1, NULL, NULL, 12, NULL, NULL),
(154, 1, 65, NULL, NULL, NULL, NULL),
(155, 1, NULL, NULL, 13, NULL, NULL),
(156, 5, NULL, NULL, 14, NULL, NULL),
(157, 1, NULL, NULL, 15, NULL, NULL),
(158, 5, NULL, NULL, 16, NULL, NULL),
(159, 5, NULL, NULL, 17, NULL, NULL),
(160, 5, NULL, NULL, 18, NULL, NULL),
(161, 5, NULL, NULL, 19, NULL, NULL),
(162, 5, NULL, NULL, 20, NULL, NULL),
(163, 9, NULL, NULL, 21, NULL, NULL),
(164, 9, NULL, NULL, 22, NULL, NULL),
(165, 9, NULL, NULL, 23, NULL, NULL),
(166, 9, NULL, NULL, 24, NULL, NULL),
(167, 9, NULL, NULL, 25, NULL, NULL),
(168, 9, NULL, NULL, 26, NULL, NULL),
(169, 9, NULL, NULL, 27, NULL, NULL),
(170, 9, NULL, NULL, 28, NULL, NULL),
(171, 1, 66, NULL, NULL, NULL, NULL),
(172, 1, 67, NULL, NULL, NULL, NULL),
(173, 6, 68, NULL, NULL, NULL, NULL),
(178, 1, 72, NULL, NULL, NULL, NULL),
(179, 9, 73, NULL, NULL, NULL, NULL),
(180, 1, NULL, NULL, 30, NULL, NULL),
(181, 1, NULL, NULL, 31, NULL, NULL),
(185, 1, NULL, NULL, 32, NULL, NULL),
(186, 9, 77, NULL, NULL, NULL, NULL),
(187, 1, 78, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `festivales`
--

CREATE TABLE `festivales` (
  `id_festivales` int(11) NOT NULL,
  `nombre_festival` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
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
(2, 'festival del festival 2', 'asdfdfasdfasdfasdfasdfasdfasdf', '2022-04-01', 352, 2, '2022-03-08 11:37:21', '0'),
(3, 'festival del festival 3', '123123123123123', '2022-04-30', 353, 2, '2022-03-08 11:40:53', 'david festi'),
(4, 'festivales palavecinos', 'festivales palavecinos pa', '2022-03-30', 354, 1, '2022-03-30 20:18:18', 'david festival');

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
  `date_updated_gastronomia` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `gastronomia`
--

INSERT INTO `gastronomia` (`id_gastronomia`, `denominacion_gastro`, `observacion_gastro`, `rela_direccion_gastro`, `dias_horarios`, `date_updated_gastronomia`) VALUES
(2, 'segunda gastronomia', 'observacion de gastronomia dos', 370, 'dias y horarios de gastronomia dos', NULL);

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
(1, '0000-00-00', '0000-00-00', 0, 0, 3),
(2, '2022-07-25', '2022-07-31', 0, 0, 4);

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
(71, 'Retiro', NULL, 24, NULL);

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
(4, 'Museo Regional del Nordeste Formoseño', 'Lunes a Viernes turno mañana 8:00 a 12:00, turno tarde 14:00 a 18:00. Sábados turno mañana 09:00 a 11:00, turno tarde 16:00 a 18:00', 229, 'En la actualidad el museo cubre una superficie de 3.900 m2y en sus instalaciones ofrece, además de las salas de exposición, sala de conferencias, sanitarios, office, depósito administrativo, bar, estacionamiento, cisternas, parquización y un lago artificial.\r\nEl acervo del museo comprende documentos, correspondencia epistolar, uniformes y vestimentas, monedas y billetes, enseres domésticos, carruajes, artesanías, cuadros, instrumentos de labranza, muebles, aparatos de distinta épocas y reproducciones.\r\nEl abordaje temático se desarrolla en el sentido de reconstrucción colectiva de la memoria. Comprende los siguientes aspectos:\r\nCreencias de la región representadas por personajes de la mitología popular.\r\n', '', NULL),
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
(1, 'david', 'pereyra', 37044625, 2037044625, '2020-05-13', NULL, NULL, NULL, NULL),
(2, 'aldana leyre', 'Iznardo', NULL, 23370446254, '2022-06-13', 356, 2, 'aaaaaaaaa', NULL),
(3, 'valentino', 'Galeano', NULL, 23370446254, '2022-07-08', 357, 1, 'bbbbbbbbbbbb', NULL),
(4, 'matias', 'ministerio', NULL, 1234, '2022-06-15', 358, 4, 'profesor', NULL),
(5, 'ronaldo ', 'Almiron', NULL, 27381921504, '2018-02-20', 359, 4, 'analista en sistema', NULL),
(6, 'claudio', 'arevalo', NULL, 321123321, '2022-07-08', 360, 1, 'analista en sistema', 11),
(7, 'gonzalo', 'bordoy', NULL, 123123123, '2022-08-24', 371, 4, 'comunicación ', 12),
(8, 'Rolando David', 'Pereyra', NULL, 20370446257, '1993-01-31', 372, 2, 'programador- analista en sistema', 13);

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
(1, 5, 3, 3, NULL, '123321', 2, 2, '321123', 3, NULL),
(2, 6, 1, 2, NULL, '123123', 2, 2, '321123', 1, NULL),
(3, 7, 2, NULL, NULL, '123', 2, 3, '321', 1, 1),
(4, 8, 4, 6, NULL, '', 2, 3, '', 3, 2);

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
(4, 'Adrian Subeldía', '', 0, 'Che Roga', NULL, NULL, NULL, 265, 3),
(5, 'Pablo Monges', '', 0, 'Newet \"Espíritu de la tierra\"', NULL, NULL, NULL, 266, 3),
(6, 'Federico J. Dominguez', '', 0, 'Dominguez Excursiones', NULL, NULL, NULL, 269, 3),
(7, 'Fernando Gaona', '20-20221994-3', 0, '', NULL, NULL, NULL, 270, 2),
(8, 'Julio Cesar Salazar', '0', 0, 'Odisea Formosa', NULL, NULL, NULL, 271, 3),
(9, 'Cesar Giménez', '', 0, 'Bichos de río', NULL, NULL, NULL, 272, 3),
(10, 'Marta Vázquez', '0', 0, 'Nautica Ajeré Ysyrype', NULL, '2022-07-14 09:48:43', NULL, 273, 3),
(11, 'Matías Toloza', '', 0, 'Iglú - Espacio Cultural', NULL, '2022-07-15 08:12:38', NULL, 274, 1),
(12, 'Francisco \"Chilo\" Ruíz', '', 0, '', NULL, NULL, NULL, 275, 2),
(13, 'María Elsa Coronel', '0', 0, 'Guaycurú Artesanías Salvajes', NULL, '2022-07-14 09:58:56', NULL, 277, 1),
(14, 'Santiago Buchara', '', 0, 'Paseos Náuticos Irupé', NULL, '2022-07-15 08:15:03', NULL, 278, 1),
(15, 'Teresa Stefani', '0', 0, 'Urena', NULL, '2022-07-15 08:11:00', NULL, 279, 1),
(16, 'Gisella Infantino', '', 0, 'El Jabirú Avistajes', NULL, NULL, NULL, 280, 1),
(17, 'Marité Álvarez', '0', 0, 'Turismo La Estrella', NULL, '2022-07-14 10:13:15', NULL, 281, 1),
(18, 'Jorge Lacuadri', '', 0, 'Lacuadri Viajes', NULL, NULL, NULL, 282, 1),
(19, 'Eduardo Orozco', '', 0, 'Iwoka Parque Natural', NULL, NULL, NULL, 283, 1),
(20, 'Almaraz Cristrian', '0', 0, 'Kayak Sym Formosa', NULL, '2022-07-13 19:13:22', NULL, 285, 1),
(21, 'Carlos Maldonado', '', 0, '', NULL, NULL, NULL, 286, 1),
(22, 'Pinto Santillán', '', 0, '', NULL, NULL, NULL, 287, 1),
(23, 'Horacio Maldonado', '', 0, '', NULL, NULL, NULL, 288, 1),
(24, 'Javier Santillán', '', 0, '', NULL, NULL, NULL, 289, 1),
(25, 'Carlos Arnedo', '0', 0, 'Comarca Bermejo', NULL, NULL, NULL, 290, 1),
(26, 'Claudio Wutzke', '0', 0, 'Comarca Bermejo', NULL, '2022-02-16 09:00:04', NULL, 291, 1),
(27, 'Teodoro Velázquez', '0', 0, 'Comarca Bermejo', NULL, '2022-02-16 09:00:16', NULL, 292, 1),
(28, 'Luis Cuesta', '', 0, 'Comarca Bermejo', NULL, NULL, NULL, 293, 1),
(30, 'Luis Barco', '', 0, 'Lorient S.A.', NULL, '2022-02-22 11:44:02', NULL, 348, 1),
(31, 'Laura López', '', 0, 'Alquiler de Autos en Formosa', NULL, '2022-02-22 11:48:58', NULL, 349, 1),
(32, 'Perla Cristina Rivero', '', 0, 'Club de Avistaje de Aves', NULL, '2022-07-14 11:12:30', NULL, 366, 1);

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
(62, ''),
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
(80, ''),
(81, ''),
(82, ''),
(83, ''),
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
(99, ''),
(100, ''),
(101, ''),
(102, ''),
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
(128, 'López, Jorge Miguel'),
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
(149, ''),
(153, ''),
(154, '');

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
(4, 'Néstor Benitez', NULL, 75, 7),
(5, 'José Friedrich', NULL, 76, 7),
(6, 'Reinaldo Saporitti', NULL, 77, 1),
(7, 'Carlos Paton', '2022-02-11 11:03:35', 78, 6),
(9, 'Arnaldo Barrios', NULL, 80, 5),
(10, 'César Arias', NULL, 81, 7),
(11, 'Marta', NULL, 82, 7),
(12, 'Rubén Landriel', NULL, 83, 7),
(13, 'Gustavo Patiño', NULL, 84, 1),
(14, 'Adan Jarzynski', NULL, 85, 5),
(15, 'Marite Álvarez', NULL, 86, 1),
(16, 'Acosta Melanio', NULL, 87, 6),
(17, 'Evelynn Bonilla', '2022-02-22 08:56:36', 88, 1),
(18, 'Andrés De Yong', NULL, 89, 5),
(19, 'Matilde Muñoz', NULL, 90, 6),
(20, 'Luis Rivero', NULL, 91, 5),
(21, 'Julián Bordón', NULL, 92, 5),
(22, 'María', NULL, 93, 6),
(23, 'Carlos Paniagua', NULL, 94, 6),
(24, 'Roberto', NULL, 95, 6),
(25, 'Rosi Medina', NULL, 96, 6),
(26, 'Guillermo Silva', NULL, 97, 5),
(27, 'Lilian Consentino', NULL, 98, 6),
(28, 'Luis Blasich', NULL, 99, 5),
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
(75, 'Ramiro Escotorin', NULL, 340, 3);

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
(48, 21, 3, 0, 0, 0, 0, 0, '', '', '', 'Si', '', ''),
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
(66, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(67, 200, 40, 0, 0, 0, 0, 0, '', '', 'Si', 'Si', '', ''),
(68, 40, 20, 0, 0, 0, 0, 0, '', '', 'Si', 'Si', '', ''),
(69, 20, 9, 0, 0, 0, 0, 0, '', '', 'Si', 'Si', '', ''),
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
(85, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(86, 40, 10, 0, 0, 0, 0, 0, '', '', 'Si', 'Si', 'Si', ''),
(87, 36, 10, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(88, 50, 35, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
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
(110, 0, 0, 0, 0, 0, 0, 0, '', '', 'si', 'si', 'si', ''),
(114, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(115, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '');

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
(35, 'Reserva de Biósfera Laguna Oca', '', 347, 6, 1, 7, 'La RB se encuentra dentro de la denominada planicie de inundación de los ríos Paraguay y Paraná. Esta área es una típica llanura aluvial regida por la acción de los ríos antes mencionados y está constituida por brazos meandrosos laterales del canal principal, lagunas\r\nEste mosaico de ecosistemas donde se mezclan comunidades acuáticas, riachos y esteros bordeados por bosques en galería, sabanas inundables, pastizales y palmares, que alberga una invalorable riqueza en su biodiversidad, constituye un singular macroecosistema que da origen a un paisaje de particular belleza y de gran valor ecológico y ambiental.\r\nEn la RB son característicos los bosques fluviales y las áreas deprimidas con amplio dominio de vegetación herbácea, muchas veces compartidas con especies de palma.\r\nLos bosques en galería constituyen el ecosistema de mayor riqueza florística de la región Chaqueña, con contribuciones que pertenecen al bosque fluvial, ejemplares del bosque leñoso de madera dura y las propias de la formación. Son estructuras generalmente densas, con abundante sotobosque y una gran abundancia de epífitas, lianas y orquídeas. A estos bosques se los considera como el límite de penetración de la Selva Paranaense.\r\nLa gran variedad de ambientes (bosques, esteros, bañados, sabanas, pastizales, lagos y ríos) hace que se presente en la región una notable cantidad y diversidad de fauna silvestre.', '2022-02-14 09:25:58');

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
(7, 6, 'Excursiones de cicloturismo y canotaje en la Ciudad de Formosa.', 4),
(8, 11, 'Excursiones de cicloturismo y canotaje en la Ciudad de Formosa.', 4),
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
(26, 7, 'Artesanías salvajes de la Laguna de los Indios. Mitos y leyendas, agua, flora y fauna tejen las historias de este lugar mágico donde crecí y que me inspiraron a llevar este emprendimiento.', 13),
(27, 6, 'Los mejores paseos para disfrutar de la fauna y la flora de la Laguna Herradura-Formosa', 14),
(28, 10, 'Los mejores paseos para disfrutar de la fauna y la flora de la Laguna Herradura-Formosa', 14),
(29, 3, 'Planteros de palma y vivero de orquídeas', 15),
(30, 3, 'Observación de Aves en la Provincia de Formosa en sus principales puntos: Parque Nacional Rio Pilcomayo, Bañado La Estrella y Reserva Natural Formosa.', 16),
(31, 7, '\"La Estrella\" es una organización dedicada al turismo rural y somos guía de visita al Bañado La Estrella.', 17),
(32, 8, 'Viajes y traslados de pasajeros servicio de logística y distribución de paquetería.', 18),
(33, 10, 'Viajes y traslados de pasajeros servicio de logística y distribución de paquetería.', 18),
(34, 7, '', 19),
(35, 1, 'Alquiler de kayaks', 20),
(36, 3, 'Guía vaqueano de aves - cabalgatas - piraguas - paseos turísticos - gastronomía local', 21),
(37, 9, 'Guía vaqueano de aves - cabalgatas - piraguas - paseos turísticos - gastronomía local', 21),
(38, 11, 'Guía vaqueano de aves - cabalgatas - piraguas - paseos turísticos - gastronomía local', 21),
(39, 7, 'Navegación y coordinación de turismo comunitario', 22),
(40, 8, 'Alojamiento y traslados en 4x4', 23),
(41, 10, 'Alojamiento y traslados en 4x4', 23),
(42, 6, 'Navegación', 24),
(43, 9, '', 25),
(44, 9, '', 26),
(45, 2, '', 27),
(46, 9, '', 28),
(48, 12, '', 30),
(49, 12, '', 31),
(50, 3, 'Cordina el club de avistaje de aves', 32);

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
(46, 0, '', '', '', ''),
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
(64, 0, '', '', '', ''),
(65, 0, '', '', '', ''),
(66, 0, '', '', '', ''),
(67, 0, '', '', '', ''),
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
(83, 0, '', '', '', ''),
(84, 0, '', '', '', ''),
(85, 0, '', '', '', ''),
(86, 0, '', '', '', ''),
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
(108, 0, '', '', '', ''),
(112, 0, '', '', '', ''),
(113, 0, '', '', '', '');

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
(6, 'RESIDENCIA');

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
(2, 'Privado');

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
(7, 'Reserva Natural');

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
(13, 'Alquiler de Combis');

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
-- Estructura de tabla para la tabla `usuario_contra`
--

CREATE TABLE `usuario_contra` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(244) NOT NULL,
  `contraseña` varchar(244) NOT NULL,
  `rela_rol_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario_contra`
--

INSERT INTO `usuario_contra` (`id_usuario`, `usuario`, `contraseña`, `rela_rol_id`) VALUES
(1, 'matias', 'mati3423', 3),
(2, 'ministra', 'sil4432', 1),
(3, 'admin', '1234', 1),
(5, 'liz', '1234', 3),
(6, 'visitante', '1234', 2),
(7, 'andres', '4ndres', 3),
(9, 'cecilia', 'ceci2022', 2),
(10, 'monica', 'moni2321', 3),
(11, 'claudioAr', 'claudioAr8272', 2),
(12, 'gonzaloBo', 'gonzaloBo9496', 2),
(13, 'DavidPe', 'DavidPe6119', 1);

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
  `rela_localidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `viajes`
--

INSERT INTO `viajes` (`id_viajes`, `horario_salida`, `horario_llegada`, `fecha_salida`, `fecha_llegada`, `rela_localidad`) VALUES
(1, '09:38:47', '10:00:00', '2022-02-01', '2022-02-02', 65);

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
  ADD KEY `fk_gastronomia_contacto` (`rela_gastronomia_contacto`);

--
-- Indices de la tabla `contacto_colectivo`
--
ALTER TABLE `contacto_colectivo`
  ADD PRIMARY KEY (`id_contacto_cole`),
  ADD KEY `fk_contacto_empresa` (`rela_empresa_colectivo`),
  ADD KEY `fk_empresa_contacto` (`rela_tipo_contacto_cont`);

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
  ADD KEY `fk_estado_prestador` (`rela_estado_prestador`);

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
-- Indices de la tabla `usuario_contra`
--
ALTER TABLE `usuario_contra`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `fk_usuario_roles` (`rela_rol_id`);

--
-- Indices de la tabla `viajes`
--
ALTER TABLE `viajes`
  ADD PRIMARY KEY (`id_viajes`),
  ADD KEY `fk_viajes_localidad` (`rela_localidad`);

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
  MODIFY `id_acientos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `agencias`
--
ALTER TABLE `agencias`
  MODIFY `id_agencias` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `alojamientos`
--
ALTER TABLE `alojamientos`
  MODIFY `id_alojamientos` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT de la tabla `archivos_ima_video`
--
ALTER TABLE `archivos_ima_video`
  MODIFY `id_archivo_ima_vid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `areas`
--
ALTER TABLE `areas`
  MODIFY `id_areas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `calendario`
--
ALTER TABLE `calendario`
  MODIFY `id_calendario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT de la tabla `contacto`
--
ALTER TABLE `contacto`
  MODIFY `id_contacto` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2523;

--
-- AUTO_INCREMENT de la tabla `contacto_colectivo`
--
ALTER TABLE `contacto_colectivo`
  MODIFY `id_contacto_cole` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `departamentos_fsa`
--
ALTER TABLE `departamentos_fsa`
  MODIFY `id_departamentos_fsa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `deptos_mintur`
--
ALTER TABLE `deptos_mintur`
  MODIFY `id_deptos_mintur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `dias_licencia`
--
ALTER TABLE `dias_licencia`
  MODIFY `id_dias_licencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `id_direccion` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=373;

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
  MODIFY `id_estado` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=188;

--
-- AUTO_INCREMENT de la tabla `festivales`
--
ALTER TABLE `festivales`
  MODIFY `id_festivales` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `gastronomia`
--
ALTER TABLE `gastronomia`
  MODIFY `id_gastronomia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id_licencias` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `localidad`
--
ALTER TABLE `localidad`
  MODIFY `id_localidad` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT de la tabla `museo`
--
ALTER TABLE `museo`
  MODIFY `id_museo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `id_pais` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id_persona` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `personales`
--
ALTER TABLE `personales`
  MODIFY `id_personal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `precio_acientos`
--
ALTER TABLE `precio_acientos`
  MODIFY `id_precios_acientos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `prestadores`
--
ALTER TABLE `prestadores`
  MODIFY `id_prestador` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `provincia`
--
ALTER TABLE `provincia`
  MODIFY `id_provincia` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `razon_social`
--
ALTER TABLE `razon_social`
  MODIFY `id_razon_social` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT de la tabla `referentes_municipal`
--
ALTER TABLE `referentes_municipal`
  MODIFY `id_referentes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

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
-- AUTO_INCREMENT de la tabla `servicios_alojamiento`
--
ALTER TABLE `servicios_alojamiento`
  MODIFY `id_servicio_alojamiento` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT de la tabla `servicios_generales`
--
ALTER TABLE `servicios_generales`
  MODIFY `id_servicios_generales` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `servicios_prestadores`
--
ALTER TABLE `servicios_prestadores`
  MODIFY `id_servicios_prestadores` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `serv_complemetarios_alojamiento`
--
ALTER TABLE `serv_complemetarios_alojamiento`
  MODIFY `id_serv_comple_alojamiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  MODIFY `id_sucursal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_alojamiento`
--
ALTER TABLE `tipo_alojamiento`
  MODIFY `id_tipo_alojamiento` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `id_tipo_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id_tipo_lugar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `id_tipo_servicios_prestadores` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
-- AUTO_INCREMENT de la tabla `usuario_contra`
--
ALTER TABLE `usuario_contra`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `viajes`
--
ALTER TABLE `viajes`
  MODIFY `id_viajes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  ADD CONSTRAINT `fk_persona_contacto` FOREIGN KEY (`rela_persona_contacto`) REFERENCES `persona` (`id_persona`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_servicios_generales` FOREIGN KEY (`rela_servicios_generales`) REFERENCES `servicios_generales` (`id_servicios_generales`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `contacto_colectivo`
--
ALTER TABLE `contacto_colectivo`
  ADD CONSTRAINT `fk_contacto_empresa` FOREIGN KEY (`rela_empresa_colectivo`) REFERENCES `empresa_colectivo` (`id_empresa_colectivo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_empresa_contacto` FOREIGN KEY (`rela_tipo_contacto_cont`) REFERENCES `tipo_contacto` (`id_tipo_contacto`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `fk_estado_tipo_estado` FOREIGN KEY (`rela_tipo_estado`) REFERENCES `tipo_estado` (`id_tipo_estado`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Filtros para la tabla `referentes_municipal`
--
ALTER TABLE `referentes_municipal`
  ADD CONSTRAINT `fk_referente_direccion` FOREIGN KEY (`rela_direccion`) REFERENCES `direccion` (`id_direccion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_referente_tipo_encargado` FOREIGN KEY (`rela_tipo_encargado`) REFERENCES `tipo_encargado` (`id_tipo_encargado`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `fk_usuario_roles` FOREIGN KEY (`rela_rol_id`) REFERENCES `roles` (`id_roles`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `viajes`
--
ALTER TABLE `viajes`
  ADD CONSTRAINT `fk_viajes_localidad` FOREIGN KEY (`rela_localidad`) REFERENCES `localidad` (`id_localidad`) ON DELETE CASCADE ON UPDATE CASCADE;

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
