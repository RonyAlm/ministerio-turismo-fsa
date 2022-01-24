-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-01-2022 a las 15:21:25
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
-- Base de datos: `pruebas`
--

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
  `rela_razon_social_agencia` int(10) DEFAULT NULL,
  `rela_agencias_persona` int(11) DEFAULT NULL,
  `rela_agencia_direccion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `agencias`
--

INSERT INTO `agencias` (`id_agencias`, `descripcion_agencias`, `idoneo_agencia`, `matricula_agencia`, `legajo_agencia`, `cuit_agencia`, `categoria_agencia`, `rela_razon_social_agencia`, `rela_agencias_persona`, `rela_agencia_direccion`) VALUES
(7, 'Grimaro Tour', 'Orué, Griselda Mariel', '8059', '10735', '27-23667230-7', 'EVT', 116, NULL, 200),
(8, 'Alwa', 'Resquín, Ariadna Soledad', '14146', '16217', '20-26081048-1', 'EVT', 117, NULL, 201),
(9, 'Arapy Viajes', 'Arrúa, Claudia Belén', '14475', '18087', '27-28666159-4', 'EVT', 118, NULL, 202),
(10, 'Binomio Viajes y Turismo', 'Rolón, Hugo Orlando', '8583', '16563', '30-71513933-9', 'EVT', 119, NULL, 203),
(11, 'Bonus Track', '', '', '10693', '20-21367985-7', 'EVT', 120, NULL, 204),
(12, 'Diego Bregant Viajes', 'Bregant, Diego Alejandro', '9625', '14773', '20-25889351-5', 'EVT', 121, NULL, 205),
(13, 'Fentana Viajes y Turismo', 'Fentana, Hugo Ricardo', '7424', '11618', '20-10186376-0', 'EVT', 122, NULL, 206),
(14, 'La Oficina de Viajes', 'Navarro, Mariano Nicolas', '14687', '17028', '27-30359914-8', 'EVT', 123, NULL, 207),
(15, 'Los Alisos Viajes y Turismo', 'Franco, Ángel Gabriel', '14254', '13781', '30-71513933-9', 'EVT', 124, NULL, 208),
(16, 'M&M Turismo', 'Molina, Miguel Ángel', '2305', '8935', '20-10003071-4', 'EVT', 125, NULL, 209),
(17, 'Paraquaria Ecotravel & Business', 'González, Fernando Ariel', '15877', '14468', '30-71117859-3', 'EVT', 126, NULL, 210),
(18, 'Sakura Travel & Business', 'Fabricius, Ana Beatriz', '9814', '12338', '23-23269929-9', 'EVT', 127, NULL, 211),
(19, 'Salkantay', 'Ridella, Gimena Daiana', '12546', '15579', '20-41351246-9', 'EVT', 128, NULL, 212),
(20, 'Siacia Turismo', 'Angeloni, Andrea Elizabeth', '10539', '11415', '20-24149355-6', 'EVT', 129, NULL, 213),
(21, 'Solo Turismo Arg Fsa Fsa', 'Oviedo, Carlos Antonio', '9039', '18003', '20-21659960-9', 'EVT', 130, NULL, 214),
(22, 'Teresa - Tur', 'Blanco, Beatriz Del Carmen', '14654', '14653', '27-24149671-1', 'EVT', 131, NULL, 215),
(23, 'To Anywhere (Franquicia de Almundo.com)', 'Romero, Rita Belén', '15453', '17543', '30-71491815-6', 'EVT', 132, NULL, 216),
(24, 'Travel Rock', '', '', '11297', '30-70788118-2', 'EVT', 133, NULL, 217),
(25, 'Turismo De Castro', 'Romero, Graciela', '2334', '2041', '30-71581767-1', 'EVT', 134, NULL, 218),
(26, 'Vidivici', 'Salomón, Cristina Del Carmen', '15707', '17525', '20-22192334-1', 'EVT', 135, NULL, 219),
(27, 'Goya Turismo', '', '', '17224', '0', 'EVT', 136, NULL, 220),
(28, 'Tintes Religiosos', '', '', '15909', '0', 'EVT', 137, NULL, 221),
(29, 'Pisamos Fuerte Viajes (Casa Central)', 'Zenandez, Celeste Soledad', '14112', '17165', '24-36203365-5', 'EVT', 138, NULL, 222),
(30, 'Pisamos Fuerte Viajes (Suc. 1)', '', '', '17165', '24-36203365-5', 'EVT', 139, NULL, 223);

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
  `rela_habilitaciones` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `alojamientos`
--

INSERT INTO `alojamientos` (`id_alojamientos`, `descripcion_alojamientos`, `cuit_alojamiento`, `idoneo_alojamiento`, `estrella_alojamiento`, `rela_razon_social_alo`, `rela_tipo_alojamiento_aloja`, `rela_alojamiento_persona`, `rela_alojamiento_direccion`, `rela_alojamiento_rubro`, `rela_aloja_servicios`, `rela_aloja_serv_adicionales`, `rela_habilitaciones`) VALUES
(3, 'Hotel Internacional de Turismo', 0, '', 4, 46, 1, NULL, 110, 6, 35, 33, 1),
(4, 'Hotel Fermoza', 0, '', 0, 47, 1, NULL, 111, 2, 36, 34, 1),
(5, 'Hotel Formosa', 0, '', 3, 48, 1, NULL, 112, 2, 37, 35, 1),
(6, 'Hotel Nuevo Real', 0, '', 1, 49, 1, NULL, 113, 2, 38, 36, 1),
(7, 'Hotel Plaza', 0, 'Marlén Delgado', 3, 50, 1, NULL, 114, 6, 39, 37, 1),
(8, 'Howard Johnson', 0, '', 4, 51, 1, NULL, 115, 6, 40, 38, 1),
(9, 'Las Kalas Rental Suites', 0, '', 3, 53, 1, NULL, 117, 6, 42, 40, 1),
(10, 'Portal Del Sol', 0, 'César Romero', 3, 54, 1, NULL, 118, 2, 43, 41, 1),
(11, 'Hotel Regina', 0, '', 3, 55, 1, NULL, 119, 2, 44, 42, 1),
(12, 'Residencial Costanera', 0, 'Alejandro Tiñuk', 1, 56, 1, NULL, 120, 2, 45, 43, 1),
(13, 'Hotel Ronny', 0, '', 2, 57, 1, NULL, 121, 2, 46, 44, 1),
(14, 'El Cortijo Agroturismo', 30, 'Pablo Rodolfo Miño', 0, 58, 2, NULL, 122, 7, 47, 45, 1),
(15, 'Fruhwald Turismo Aventura', 0, '', 0, 62, 2, NULL, 126, 7, 48, 46, 1),
(16, 'Los Zorzales', 33714794529, 'MAuricio Malvasi', 0, 63, 2, NULL, 127, 7, 49, 47, 1),
(17, 'La Florencia', 0, '', 0, 64, 2, NULL, 128, 7, 50, 48, 1),
(18, 'La Madrina', 0, 'Rubén Omar Sosa', 0, 65, 2, NULL, 129, 7, 51, 49, 1),
(19, 'Miramonte', 27266934861, 'Karina Fleitas', 0, 66, 2, NULL, 130, 7, 52, 50, 1),
(20, 'Chuqui Cué', 20142549760, 'Mirian Michel', 0, 67, 2, NULL, 131, 7, 53, 51, 1),
(21, 'Posada Cris Dan', 0, '', 0, 68, 5, NULL, 132, 1, 54, 52, 1),
(22, 'Quintel', 0, '', 0, 69, 2, NULL, 133, NULL, 55, 53, 4),
(23, 'Quintel', 0, '', 0, 70, 5, NULL, 134, 4, 56, 54, 1),
(24, 'Cabañas De la Laguna', 20062627825, 'Gilberto Bandeo', 0, 71, 2, NULL, 135, 7, 57, 55, 1),
(25, 'Gran Capitan', 20247801554, 'Darío Sanabria', 0, 72, 2, NULL, 136, 7, 58, 56, 1),
(26, 'Los Tucanes', 0, '', 0, 73, 5, NULL, 137, 4, 59, 57, 1),
(27, 'Cabañas Picasso', 0, '', 0, 74, 2, NULL, 138, 7, 60, 58, 1),
(28, '12 de Octubre', 0, '', 0, 75, 5, NULL, 139, 1, 61, 59, 1),
(29, 'Hotel ArTur', 0, '', 0, 76, 1, NULL, 140, 2, 62, 60, 1),
(30, 'Hotel San Martín', 0, '', 2, 77, 1, NULL, 141, 2, 63, 61, 1),
(31, 'Hotel Embajador', 0, '', 0, 78, 1, NULL, 142, 2, 64, 62, 1),
(32, 'Hotel Orígenes', 0, '', 0, 79, 1, NULL, 143, 2, 65, 63, 1),
(33, 'Portal del Oeste', 0, '', 0, 80, 1, NULL, 144, 2, 66, 64, 1),
(34, 'Hotel Eva', 0, '', 0, 81, 1, NULL, 145, 2, 67, 65, 1),
(35, 'Hotel Dos Hermanos', 0, '', 0, 82, 1, NULL, 146, 2, 68, 66, 1),
(36, 'Hotel Las Lomitas', 0, '', 0, 83, 1, NULL, 147, 2, 69, 67, 1),
(37, 'Hospedaje María Belén', 0, '', 0, 84, 5, NULL, 148, 1, 70, 68, 1),
(38, 'Hospedaje Santa Fe', 0, '', 0, 85, 5, NULL, 150, 1, 71, 69, 1),
(39, 'Hospedaje Katarina', 0, '', 0, 86, 5, NULL, 151, 1, 72, 70, 1),
(40, 'Hospedaje El Viajante', 0, '', 0, 87, 5, NULL, 152, 1, 73, 71, 1),
(41, 'Hotel Plaza', 0, '', 0, 88, 1, NULL, 153, 2, 74, 72, 1),
(42, 'Hotel Melitona', 0, '', 0, 89, 1, NULL, 154, 2, 75, 73, 1),
(43, 'Hotel La Ribera', 0, '', 0, 90, 1, NULL, 155, 2, 76, 74, 1),
(44, 'Hospedaje Ceci', 0, '', 0, 91, 5, NULL, 156, 1, 77, 75, 1),
(45, 'Hotel Tokar', 0, '', 0, 92, 1, NULL, 157, 2, 78, 76, 1),
(46, 'Hospedaje Emy', 0, '', 0, 93, 5, NULL, 158, 1, 79, 77, 1),
(47, 'Hospedaje Jorgito', 0, '', 0, 94, 5, NULL, 159, 1, 80, 78, 1),
(48, 'Hotel y Motel El Manantial', 0, '', 0, 95, 1, NULL, 160, 2, 81, 79, 4),
(49, 'Hotel Oasis', 0, '', 0, 96, 1, NULL, 161, 2, 82, 80, 4),
(50, 'Hospedaje Al Paso', 0, '', 0, 97, 5, NULL, 162, 1, 83, 81, 4),
(51, 'Don Insfrán', 0, '', 0, 98, 1, NULL, 163, 2, 84, 82, 4),
(52, 'Luisin Hotel', 0, '', 0, 99, 1, NULL, 164, 2, 85, 83, 4),
(53, 'Imperial Apart Hotel', 0, '', 0, 100, 1, NULL, 165, 2, 86, 84, 4),
(54, 'Brimau Hotel', 0, '', 0, 101, 1, NULL, 166, 2, 87, 85, 4),
(55, 'Hotel Guaraní', 0, '', 0, 102, 1, NULL, 167, 2, 88, 86, 4),
(56, 'Hospedaje Flores', 0, '', 0, 103, 5, NULL, 168, 1, 89, 87, 4),
(57, 'Hospedaje Cabrera', 0, '', 0, 104, 5, NULL, 169, 1, 90, 88, 4),
(58, 'El Angelito (Ex Norte)', 0, '', 0, 105, 5, NULL, 170, 1, 91, 89, 4),
(59, 'El Indiano', 0, '', 0, 106, 5, NULL, 171, 1, 92, 90, 4),
(60, 'Hospedaje Karfa', 0, '', 0, 107, 5, NULL, 172, 1, 93, 91, 4),
(61, 'Gran Victoria', 0, '', 0, 108, 1, NULL, 173, 2, 94, 92, 4),
(62, 'Hotel Los Dos Pibes', 0, '', 0, 109, 1, NULL, 174, 2, 95, 93, 4),
(63, 'Victoria', 0, '', 0, 110, 1, NULL, 175, 2, 96, 94, 4),
(64, 'Magali', 0, '', 0, 111, 1, NULL, 176, 2, 97, 95, 4);

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
(2, 'Encuentro Internacional del Muralismo', 'formosa rod', '2022-01-14', '2022-01-16', NULL, '#380ce9', NULL),
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
(73, 'Navidad', 'Feriado Nacional', '2022-12-25', '2022-12-25', NULL, '#0d7406', NULL);

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
  `rela_servicios_generales` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `contacto`
--

INSERT INTO `contacto` (`id_contacto`, `descripcion_contacto`, `rela_tipo_contacto_cont`, `rela_alojamiento_contacto`, `rela_prestador_contacto`, `rela_guia_contacto`, `rela_contacto_agencia`, `rela_persona_contacto`, `rela_contacto_referente`, `rela_contacto_museo`, `rela_servicios_generales`) VALUES
(318, '3704671555', 2, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(319, '', 9, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(320, '', 1, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(321, '', 4, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(322, '', 5, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(323, '', 6, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(324, '', 7, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(325, '', 8, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(326, '3718629209', 2, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(327, '', 9, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(328, '', 1, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(329, '', 4, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(330, '', 5, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(331, '', 6, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(332, '', 7, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(333, '', 8, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL),
(334, '3704257285', 2, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(335, '', 9, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(336, '', 1, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(337, '', 4, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(338, '', 5, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(339, '', 6, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(340, '', 7, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(341, '', 8, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL),
(342, '3704201293', 2, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(343, '', 9, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(344, '', 1, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(345, '', 4, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(346, '', 5, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(347, '', 6, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(348, '', 7, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(349, '', 8, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL),
(350, '3704263282', 2, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(351, '', 9, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(352, '', 1, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(353, '', 4, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(354, '', 5, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(355, '', 6, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(356, '', 7, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(357, '', 8, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL),
(358, '3704613581', 2, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(359, '', 9, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(360, '', 1, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(361, '', 4, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(362, '', 5, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(363, '', 6, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(364, '', 7, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(365, '', 8, NULL, NULL, NULL, NULL, NULL, 6, NULL, NULL),
(366, '3711614118', 2, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(367, '', 9, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(368, '', 1, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(369, '', 4, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(370, '', 5, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(371, '', 6, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(372, '', 7, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(373, '', 8, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL),
(374, '', 2, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(375, '', 9, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(376, 'yaminafranco75@gmail.com', 1, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(377, '', 4, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(378, '', 5, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(379, '', 6, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(380, '', 7, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(381, '', 8, NULL, NULL, NULL, NULL, NULL, 8, NULL, NULL),
(382, '3716410254', 2, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(383, '', 9, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(384, '', 1, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(385, '', 4, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(386, '', 5, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(387, '', 6, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(388, '', 7, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(389, '', 8, NULL, NULL, NULL, NULL, NULL, 9, NULL, NULL),
(390, '3716617087', 2, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(391, '', 9, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(392, '', 1, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(393, '', 4, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(394, '', 5, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(395, '', 6, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(396, '', 7, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(397, '', 8, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL),
(398, '3704251876', 2, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(399, '', 9, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(400, '', 1, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(401, '', 4, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(402, '', 5, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(403, '', 6, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(404, '', 7, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(405, '', 8, NULL, NULL, NULL, NULL, NULL, 11, NULL, NULL),
(406, '3704386991', 2, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(407, '', 9, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(408, '', 1, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(409, '', 4, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(410, '', 5, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(411, '', 6, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(412, '', 7, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(413, '', 8, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL),
(414, '3716414586', 2, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(415, '', 9, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(416, '', 1, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(417, '', 4, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(418, '', 5, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(419, '', 6, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(420, '', 7, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(421, '', 8, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL),
(422, '3704706806', 2, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(423, '', 9, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(424, '', 1, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(425, '', 4, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(426, '', 5, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(427, '', 6, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(428, '', 7, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(429, '', 8, NULL, NULL, NULL, NULL, NULL, 14, NULL, NULL),
(430, '3704274747', 2, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(431, '', 9, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(432, '', 1, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(433, '', 4, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(434, '', 5, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(435, '', 6, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(436, '', 7, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(437, '', 8, NULL, NULL, NULL, NULL, NULL, 15, NULL, NULL),
(438, '3704613266', 2, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(439, '', 9, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(440, '', 1, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(441, '', 4, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(442, '', 5, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(443, '', 6, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(444, '', 7, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(445, '', 8, NULL, NULL, NULL, NULL, NULL, 16, NULL, NULL),
(446, '3716617295', 2, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL),
(447, '', 9, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL),
(448, '', 1, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL),
(449, '', 4, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL),
(450, '', 5, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL),
(451, '', 6, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL),
(452, '', 7, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL),
(453, '', 8, NULL, NULL, NULL, NULL, NULL, 17, NULL, NULL),
(454, '3704703116', 2, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL),
(455, '', 9, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL),
(456, '', 1, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL),
(457, '', 4, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL),
(458, '', 5, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL),
(459, '', 6, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL),
(460, '', 7, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL),
(461, '', 8, NULL, NULL, NULL, NULL, NULL, 18, NULL, NULL),
(462, '3718605001', 2, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL),
(463, '', 9, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL),
(464, '', 1, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL),
(465, '', 4, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL),
(466, '', 5, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL),
(467, '', 6, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL),
(468, '', 7, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL),
(469, '', 8, NULL, NULL, NULL, NULL, NULL, 19, NULL, NULL),
(470, '3704414692', 2, NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL),
(471, '', 9, NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL),
(472, '', 1, NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL),
(473, '', 4, NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL),
(474, '', 5, NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL),
(475, '', 6, NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL),
(476, '', 7, NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL),
(477, '', 8, NULL, NULL, NULL, NULL, NULL, 20, NULL, NULL),
(478, '3704414692', 2, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL),
(479, '', 9, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL),
(480, '', 1, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL),
(481, '', 4, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL),
(482, '', 5, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL),
(483, '', 6, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL),
(484, '', 7, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL),
(485, '', 8, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL),
(486, '3718552929', 2, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL),
(487, '', 9, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL),
(488, '', 1, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL),
(489, '', 4, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL),
(490, '', 5, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL),
(491, '', 6, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL),
(492, '', 7, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL),
(493, '', 8, NULL, NULL, NULL, NULL, NULL, 22, NULL, NULL),
(494, '3705036512', 2, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL),
(495, '', 9, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL),
(496, '', 1, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL),
(497, '', 4, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL),
(498, '', 5, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL),
(499, '', 6, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL),
(500, '', 7, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL),
(501, '', 8, NULL, NULL, NULL, NULL, NULL, 23, NULL, NULL),
(502, '3704302141', 2, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL),
(503, '', 9, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL),
(504, '', 1, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL),
(505, '', 4, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL),
(506, '', 5, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL),
(507, '', 6, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL),
(508, '', 7, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL),
(509, '', 8, NULL, NULL, NULL, NULL, NULL, 24, NULL, NULL),
(510, '3704387666', 2, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL),
(511, '', 9, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL),
(512, '', 1, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL),
(513, '', 4, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL),
(514, '', 5, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL),
(515, '', 6, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL),
(516, '', 7, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL),
(517, '', 8, NULL, NULL, NULL, NULL, NULL, 25, NULL, NULL),
(518, '3705009499', 2, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL),
(519, '', 9, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL),
(520, '', 1, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL),
(521, '', 4, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL),
(522, '', 5, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL),
(523, '', 6, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL),
(524, '', 7, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL),
(525, '', 8, NULL, NULL, NULL, NULL, NULL, 26, NULL, NULL),
(526, '3718418745', 2, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL),
(527, '', 9, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL),
(528, '', 1, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL),
(529, '', 4, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL),
(530, '', 5, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL),
(531, '', 6, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL),
(532, '', 7, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL),
(533, '', 8, NULL, NULL, NULL, NULL, NULL, 27, NULL, NULL),
(534, '3718635118', 2, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL),
(535, '', 9, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL),
(536, '', 1, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL),
(537, '', 4, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL),
(538, '', 5, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL),
(539, '', 6, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL),
(540, '', 7, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL),
(541, '', 8, NULL, NULL, NULL, NULL, NULL, 28, NULL, NULL),
(542, '3718625060', 2, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL),
(543, '', 9, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL),
(544, '', 1, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL),
(545, '', 4, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL),
(546, '', 5, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL),
(547, '', 6, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL),
(548, '', 7, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL),
(549, '', 8, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL),
(550, '3718599253', 2, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL),
(551, '', 9, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL),
(552, '', 1, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL),
(553, '', 4, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL),
(554, '', 5, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL),
(555, '', 6, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL),
(556, '', 7, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL),
(557, '', 8, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL),
(558, '3718549793', 2, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL),
(559, '', 9, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL),
(560, 'marianoortiz15@gmail.com', 1, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL),
(561, '', 4, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL),
(562, '', 5, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL),
(563, '', 6, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL),
(564, '', 7, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL),
(565, '', 8, NULL, NULL, NULL, NULL, NULL, 31, NULL, NULL),
(566, '3704231444', 2, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL),
(567, '', 9, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL),
(568, '', 1, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL),
(569, '', 4, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL),
(570, '', 5, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL),
(571, '', 6, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL),
(572, '', 7, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL),
(573, '', 8, NULL, NULL, NULL, NULL, NULL, 32, NULL, NULL),
(574, '3704230107', 2, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL),
(575, '4482521', 9, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL),
(576, '', 1, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL),
(577, '', 4, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL),
(578, '', 5, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL),
(579, '', 6, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL),
(580, '', 7, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL),
(581, '', 8, NULL, NULL, NULL, NULL, NULL, 33, NULL, NULL),
(582, '3704250475', 2, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL),
(583, '', 9, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL),
(584, '', 1, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL),
(585, '', 4, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL),
(586, '', 5, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL),
(587, '', 6, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL),
(588, '', 7, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL),
(589, '', 8, NULL, NULL, NULL, NULL, NULL, 34, NULL, NULL),
(590, '3704684389', 2, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL),
(591, '', 9, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL),
(592, '', 1, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL),
(593, '', 4, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL),
(594, '', 5, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL),
(595, '', 6, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL),
(596, '', 7, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL),
(597, '', 8, NULL, NULL, NULL, NULL, NULL, 35, NULL, NULL),
(598, '3704305581', 2, NULL, NULL, NULL, NULL, NULL, 36, NULL, NULL),
(599, '', 9, NULL, NULL, NULL, NULL, NULL, 36, NULL, NULL),
(600, '', 1, NULL, NULL, NULL, NULL, NULL, 36, NULL, NULL),
(601, '', 4, NULL, NULL, NULL, NULL, NULL, 36, NULL, NULL),
(602, '', 5, NULL, NULL, NULL, NULL, NULL, 36, NULL, NULL),
(603, '', 6, NULL, NULL, NULL, NULL, NULL, 36, NULL, NULL),
(604, '', 7, NULL, NULL, NULL, NULL, NULL, 36, NULL, NULL),
(605, '', 8, NULL, NULL, NULL, NULL, NULL, 36, NULL, NULL),
(606, '3704262569', 2, NULL, NULL, NULL, NULL, NULL, 37, NULL, NULL),
(607, '', 9, NULL, NULL, NULL, NULL, NULL, 37, NULL, NULL),
(608, '', 1, NULL, NULL, NULL, NULL, NULL, 37, NULL, NULL),
(609, '', 4, NULL, NULL, NULL, NULL, NULL, 37, NULL, NULL),
(610, '', 5, NULL, NULL, NULL, NULL, NULL, 37, NULL, NULL),
(611, '', 6, NULL, NULL, NULL, NULL, NULL, 37, NULL, NULL),
(612, '', 7, NULL, NULL, NULL, NULL, NULL, 37, NULL, NULL),
(613, '', 8, NULL, NULL, NULL, NULL, NULL, 37, NULL, NULL),
(614, '3704201770', 2, NULL, NULL, NULL, NULL, NULL, 38, NULL, NULL),
(615, '', 9, NULL, NULL, NULL, NULL, NULL, 38, NULL, NULL),
(616, '', 1, NULL, NULL, NULL, NULL, NULL, 38, NULL, NULL),
(617, '', 4, NULL, NULL, NULL, NULL, NULL, 38, NULL, NULL),
(618, '', 5, NULL, NULL, NULL, NULL, NULL, 38, NULL, NULL),
(619, '', 6, NULL, NULL, NULL, NULL, NULL, 38, NULL, NULL),
(620, '', 7, NULL, NULL, NULL, NULL, NULL, 38, NULL, NULL),
(621, '', 8, NULL, NULL, NULL, NULL, NULL, 38, NULL, NULL),
(622, '3704437333', 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(623, '4437333', 9, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(624, 'hoteldeturimofsa@gmail.com', 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(625, '', 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(626, '', 5, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(627, '', 6, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(628, '', 7, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(629, '', 8, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(630, '3704433289', 2, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(631, '4433289', 9, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(632, '', 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(633, '', 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(634, '', 5, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(635, '', 6, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(636, '', 7, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(637, '', 8, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(638, '3704550063', 2, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(639, 'No se registró', 9, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(640, '', 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(641, 'facebook.com/HOTEL-Formosa-321907728506696', 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(642, '', 5, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(643, '', 6, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(644, '', 7, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(645, '', 8, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(646, '3704428441', 2, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(647, '4428441', 9, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(648, '', 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(649, 'facebook.com/pages/Hotel-Real-Formosa/1072369076120166', 4, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(650, '', 5, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(651, '', 6, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(652, '', 7, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(653, '', 8, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(654, '3704429527', 2, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(655, '', 9, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(656, 'plaza_formosa@hotmail.com', 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(657, 'facebook.com/hotelplazaformosa', 4, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(658, '', 5, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(659, '', 6, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(660, '', 7, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(661, '', 8, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(662, '3704438900', 2, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(663, '4438900', 9, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(664, 'reservas@hjneoformosa.com.ar', 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(665, 'facebook.com/HJFormosa', 4, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(666, 'instagram.com/hjformosa', 5, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(667, '', 6, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(668, 'www.hjneoformosa.com.ar', 7, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(669, '', 8, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(670, '3704858458', 2, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(671, '3704588380', 2, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(672, '4428999', 9, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(673, 'laskalasrentalsuite@outlook.com', 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(674, 'facebook.com/LasKalas.fsa', 4, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(675, 'instagram.com/laskalasrestaurant', 5, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(676, '', 6, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(677, 'www.laskalasrentalsuites.com', 7, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(678, '', 8, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(679, '3704426908', 2, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(680, '4426908', 9, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(681, 'hotelportaldelsolfsa@hotmailcom', 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(682, 'facebook.com/martin.llanoaquino', 4, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(683, 'instagram.com/hotelportaldelsolfsa', 5, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(684, '', 6, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(685, 'www.hotelportaldelsolfsa.com', 7, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(686, '', 8, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(687, '3704421870', 2, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(688, '4421870', 9, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(689, 'hotelreginaformosa@hotmailcom', 1, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(690, 'facebook.com/HotelReginaFormosa', 4, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(691, 'instagram.com/hotelregina535', 5, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(692, '', 6, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(693, 'www.regina-hotel.com.ar', 7, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(694, '', 8, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(695, '3704435901', 2, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(696, '4435901', 9, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(697, 'alejandrotinuk@gmail.com', 1, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(698, 'facebook.com/ResidencialCostanera', 4, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(699, 'instagram.com/residencialcostanera', 5, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(700, '', 6, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(701, '', 7, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(702, '', 8, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(703, '3704456373', 2, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(704, '4456373', 9, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(705, 'hotelronnyfsa@hotmailcom', 1, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(706, 'facebook.com/hotel.ronny', 4, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(707, '', 5, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(708, '', 6, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(709, '', 7, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(710, '', 8, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(711, '3704305371', 2, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(712, '', 9, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(713, 'elcortijotur@gmail.com', 1, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(714, 'facebook.com/elcortijoagroecoturismo', 4, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(715, 'instagram.com/elcortijoaet', 5, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(716, '', 6, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(717, '', 7, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(718, '', 8, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(743, '3704711973', 2, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(744, '4425007', 9, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(745, 'fruhwaldturismoaventura@gmail.com', 1, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(746, '', 4, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(747, '', 5, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(748, '', 6, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(749, '', 7, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(750, '', 8, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(751, '3704971794', 2, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(752, '', 9, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(753, 'loszorzalesestancia@gmail.com', 1, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(754, 'facebook.com/LosZorzalesEstancia', 4, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(755, 'instagram.com/loszorzalesfsa', 5, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(756, '', 6, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(757, 'www.loszorzales.com.ar', 7, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(758, '', 8, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(759, '3704530437', 2, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(760, '', 9, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(761, 'patri06_arroyo@hotmail.com', 1, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(762, 'facebook.com/La-Florencia-125261564223541/', 4, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(763, '', 5, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(764, '', 6, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(765, '', 7, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(766, '', 8, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(767, '3704363400', 2, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(768, '', 9, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(769, 'cabanaslamadrina@gmail.com', 1, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(770, 'facebook.com/Cabañas-La-Madrina-Herradura-565122027002619', 4, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(771, 'instagram.com/complejo.lamadrina', 5, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(772, '', 6, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(773, '', 7, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(774, '3704851239 (Cel)', 8, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(775, '3704264780', 2, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(776, 'No se registró', 9, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(777, 'cabanasmiramonte@gmail.com', 1, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(778, 'facebook.com/miramonteherradura', 4, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(779, 'instagram.com/miramonteherradura', 5, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(780, '', 6, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(781, '', 7, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(782, '', 8, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(783, '3704680732', 2, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(784, '', 9, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(785, 'chuquicue@gmail.com', 1, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(786, 'facebook.com/Chuqui-Cue-1540445926208821', 4, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(787, 'instagram.com/chuquicue', 5, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(788, '', 6, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(789, '', 7, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(790, '', 8, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(791, '3704022337', 2, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(792, '', 9, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(793, '', 1, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(794, '', 4, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(795, '', 5, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(796, '', 6, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(797, '', 7, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(798, '', 8, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(799, '', 2, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(800, '', 9, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(801, '', 1, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(802, '', 4, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(803, '', 5, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(804, '', 6, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(805, '', 7, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(806, '', 8, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(807, '3704598713', 2, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(808, '', 9, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(809, 'quintel-herradura@hotmail.com', 1, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(810, 'facebook.com/Quintel-Herradura-315622672192902', 4, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(811, '', 5, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(812, '', 6, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(813, '', 7, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(814, '', 8, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(815, '3704399689', 2, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(816, '', 9, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(817, 'gbandeo@gmail.com', 1, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(818, 'facebook.com/cabanasdelalaguna.herradura', 4, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(819, '', 5, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(820, '', 6, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(821, '', 7, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(822, '', 8, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(823, '3704662882', 2, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(824, '', 9, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(825, 'angeldariosanabria@hotmail.com', 1, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(826, 'facebook.com/Cabañas-Gran-Capitán-344067769337418', 4, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(827, '', 5, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(828, '', 6, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(829, '', 7, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(830, '', 8, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(831, '3704682507', 2, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(832, '', 9, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(833, '', 1, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(834, 'facebook.com/Quinta-los-tucanes-102939011252292', 4, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(835, '', 5, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(836, '', 6, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(837, '', 7, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(838, '', 8, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(839, '3704260834', 2, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(840, '', 9, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(841, 'heizen_89@hotmail.com', 1, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(842, 'facebook.com/Cabañas-Picasso-1534098543550647', 4, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(843, '', 5, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(844, '', 6, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(845, '', 7, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(846, '', 8, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(847, '3718467357', 2, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(848, '3718425533', 9, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(849, '', 1, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(850, 'facebook.com/Residencial-12-De-Octubre-266850863831638', 4, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(851, '', 5, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(852, '', 6, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(853, '', 7, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(854, '', 8, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(855, '3718426730', 2, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(856, '', 9, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(857, '', 1, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(858, 'facebook.com/pages/Hotel-Ar-Tur-Clorinda-Formosa/350237235048100', 4, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(859, '', 5, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(860, '', 6, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(861, '', 7, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(862, '', 8, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(863, '3718421211', 2, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(864, 'No se registró', 9, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(865, 'residencialsanmartin@gmail.com', 1, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(866, 'facebook.com/Residencial-san-Martin-107636307313362', 4, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(867, '', 5, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(868, '', 6, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(869, '', 7, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(870, '', 8, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(871, '3718422264', 2, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(872, '', 9, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(873, '', 1, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(874, 'facebook.com/hotel-embajador-clorinda-formosa-223191111039574', 4, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(875, '', 5, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(876, '', 6, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(877, '', 7, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(878, '', 8, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(879, '3704629993', 2, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(880, '', 9, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(881, '', 1, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(882, 'facebook.com/profile.php?id=100057406511158', 4, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(883, '', 5, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(884, '', 6, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(885, '', 7, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(886, '', 8, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(887, '3704694471', 2, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(888, '', 9, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(889, '', 1, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(890, 'facebook.com/profile.php?id=100061038049180', 4, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(891, '', 5, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(892, '', 6, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(893, '', 7, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(894, '', 8, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(895, '3715616037', 2, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(896, '3715432492', 9, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(897, '', 1, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(898, 'facebook.com/pages/Hotel-Eva/395250607205542', 4, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(899, '', 5, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(900, '', 6, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(901, '', 7, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(902, '', 8, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(903, '', 2, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(904, '03715432306', 9, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(905, '', 1, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(906, '', 4, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(907, '', 5, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(908, '', 6, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(909, '', 7, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(910, '', 8, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(911, '3704547682', 2, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(912, '03715432137', 9, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(913, '', 1, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(914, '', 4, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(915, '', 5, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(916, '', 6, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(917, '', 7, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(918, '', 8, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(919, '3705038386', 2, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(920, '', 9, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(921, '', 1, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(922, '', 4, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(923, '', 5, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(924, '', 6, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(925, '', 7, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(926, '', 8, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(927, '3704826207', 2, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL),
(928, '', 9, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL),
(929, '', 1, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL),
(930, '', 4, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL),
(931, '', 5, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL),
(932, '', 6, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL),
(933, '', 7, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL),
(934, '', 8, NULL, NULL, NULL, NULL, NULL, 39, NULL, NULL),
(935, '3716432295', 2, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(936, '', 9, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(937, '', 1, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(938, '', 4, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(939, '', 5, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(940, '', 6, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(941, '', 7, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(942, '', 8, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(943, '3716617440', 2, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(944, 'No se registró', 9, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(945, '', 1, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(946, '', 4, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(947, '', 5, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(948, '', 6, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(949, '', 7, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(950, '', 8, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(951, '3704950440', 2, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(952, '', 9, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(953, '', 1, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(954, '', 4, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(955, '', 5, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(956, '', 6, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(957, '', 7, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(958, '', 8, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(959, '3704567602', 2, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(960, '', 9, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(961, '', 1, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(962, '', 4, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(963, '', 5, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(964, '', 6, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(965, '', 7, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(966, '', 8, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(967, '3704398839', 2, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(968, '', 9, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(969, '', 1, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(970, '', 4, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(971, '', 5, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(972, '', 6, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(973, '', 7, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(974, '', 8, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(975, '3704355521', 2, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(976, '3704480106', 9, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(977, '', 1, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(978, 'facebook.com/profile.php?id=100009935504429', 4, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(979, '', 5, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(980, '', 6, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(981, '', 7, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(982, '', 8, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(983, '3705020295', 2, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(984, '3704481963', 9, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(985, '', 1, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(986, 'facebook.com/hospedajececielcolorado', 4, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(987, '', 5, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(988, '', 6, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(989, '', 7, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(990, '', 8, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(991, '', 2, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(992, '03704481791', 9, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(993, '', 1, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(994, '', 4, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(995, '', 5, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(996, '', 6, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(997, '', 7, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(998, '', 8, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(999, '', 2, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1000, '03704480343', 9, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1001, '', 1, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1002, '', 4, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1003, '', 5, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1004, '', 6, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1005, '', 7, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1006, '', 8, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1007, '', 2, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1008, '03704480170', 9, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1009, '', 1, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1010, '', 4, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1011, '', 5, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1012, '', 6, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1013, '', 7, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1014, '', 8, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1015, '3704588880', 2, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1016, '', 9, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1017, '', 1, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1018, '', 4, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1019, '', 5, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1020, '', 6, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1021, '', 7, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1022, '', 8, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1023, '3704543121', 2, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1024, '', 9, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1025, '', 1, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1026, '', 4, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1027, '', 5, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1028, '', 6, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1029, '', 7, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1030, '', 8, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1031, '3704309063', 2, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1032, '', 9, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1033, '', 1, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1034, '', 4, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1035, '', 5, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1036, '', 6, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1037, '', 7, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1038, '', 8, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1039, '3704282520', 2, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1040, '03704490219', 9, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1041, '', 1, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1042, '', 4, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1043, '', 5, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1044, '', 6, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1045, '', 7, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1046, '', 8, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1047, '3718401770', 2, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1048, '', 9, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1049, '', 1, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1050, '', 4, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1051, '', 5, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1052, '', 6, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1053, '', 7, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1054, '', 8, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1055, '3718401070', 2, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1056, '', 9, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1057, '', 1, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1058, '', 4, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1059, '', 5, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1060, '', 6, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1061, '', 7, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1062, '', 8, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1063, '3718441991', 2, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1064, '03718401290', 9, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1065, '', 1, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1066, '', 4, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1067, '', 5, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1068, '', 6, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1069, '', 7, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1070, '', 8, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1071, '', 2, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1072, '03718470124', 9, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1073, '', 1, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1074, '', 4, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1075, '', 5, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1076, '', 6, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1077, '', 7, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1078, '', 8, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1079, '', 2, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1080, '3704497028', 9, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1081, '', 1, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1082, '', 4, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1083, '', 5, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1084, '', 6, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1085, '', 7, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1086, '', 8, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1087, '', 2, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1088, '03718615510', 9, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1089, '', 1, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1090, '', 4, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1091, '', 5, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1092, '', 6, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1093, '', 7, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1094, '', 8, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1095, '', 2, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1096, '03711615318', 9, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1097, '', 1, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1098, '', 4, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1099, '', 5, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1100, '', 6, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1101, '', 7, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1102, '', 8, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1103, '', 2, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1104, '03711420395', 9, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1105, '', 1, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1106, '', 4, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1107, '', 5, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1108, '', 6, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1109, '', 7, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1110, '', 8, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1111, '', 2, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1112, '03711420113', 9, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1113, '', 1, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1114, '', 4, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1115, '', 5, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1116, '', 6, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1117, '', 7, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1118, '', 8, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1119, '', 2, 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1120, '03704586044', 9, 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1121, '', 1, 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1122, '', 4, 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1123, '', 5, 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1124, '', 6, 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1125, '', 7, 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1126, '', 8, 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1127, '', 2, 62, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1128, '03704461341', 9, 62, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1129, '', 1, 62, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1130, '', 4, 62, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1131, '', 5, 62, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1132, '', 6, 62, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1133, '', 7, 62, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1134, '', 8, 62, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1135, '', 2, 63, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1136, '03704557692', 9, 63, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1137, '', 1, 63, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1138, '', 4, 63, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `contacto` (`id_contacto`, `descripcion_contacto`, `rela_tipo_contacto_cont`, `rela_alojamiento_contacto`, `rela_prestador_contacto`, `rela_guia_contacto`, `rela_contacto_agencia`, `rela_persona_contacto`, `rela_contacto_referente`, `rela_contacto_museo`, `rela_servicios_generales`) VALUES
(1139, '', 5, 63, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1140, '', 6, 63, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1141, '', 7, 63, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1142, '', 8, 63, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1143, '3704709051', 2, 64, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1144, '03704460275', 9, 64, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1145, '', 1, 64, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1146, '', 4, 64, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1147, '', 5, 64, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1148, '', 6, 64, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1149, '', 7, 64, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1150, '', 8, 64, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1256, '3718425240', 2, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL),
(1257, 'No se registró', 9, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL),
(1258, 'grimarotour@gmx.net', 1, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL),
(1259, 'facebook.com/grimarotour', 4, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL),
(1260, 'instagram.com/grimarotour', 5, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL),
(1261, '', 6, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL),
(1262, 'grimarotour.e-agencias.com.ar', 7, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL),
(1263, '', 8, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL),
(1264, '3704025515', 2, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL),
(1265, '03704435319', 9, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL),
(1266, 'pasajesexpressfsa@hotmail.com', 1, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL),
(1267, 'facebook.com/alwaviajes-109679708204538', 4, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL),
(1268, 'instagram.com/alwa.viajes', 5, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL),
(1269, '', 6, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL),
(1270, '', 7, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL),
(1271, 'alwa.viajes@gmail.com', 8, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL),
(1272, '3704686685', 2, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL),
(1273, '01145873700', 9, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL),
(1274, 'tramites@reservandoviajes.com', 1, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL),
(1275, 'facebook.com/arapyviajesfsa', 4, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL),
(1276, 'instagram.com/arapyviajes', 5, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL),
(1277, '', 6, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL),
(1278, 'ww.arapyviajesfsa.com', 7, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL),
(1279, 'info@arapyviajesfsa.com', 8, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL),
(1280, '03704420991', 2, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(1281, '', 9, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(1282, 'hola@binomioviajes.com.ar', 1, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(1283, 'facebook.com/binomioviajes', 4, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(1284, 'instagram.com/binomioviajes', 5, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(1285, '', 6, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(1286, 'binomioviajes.com.ar', 7, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(1287, '', 8, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL),
(1288, '03704423097', 2, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL),
(1289, '', 9, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL),
(1290, 'bonustrackformosa@hotmail.com', 1, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL),
(1291, 'facebook.com/bonustrackformosa', 4, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL),
(1292, 'instagram.com/bonustrackformosa', 5, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL),
(1293, '', 6, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL),
(1294, 'www.bonustrack.tur.ar', 7, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL),
(1295, '', 8, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL),
(1296, '3704615862', 2, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL),
(1297, '03704437191', 9, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL),
(1298, 'diegobregant@hotmail.com', 1, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL),
(1299, 'facebook.com/diegobregantviajesformosa', 4, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL),
(1300, 'instagram.com/diegobregantviajes', 5, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL),
(1301, '', 6, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL),
(1302, '', 7, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL),
(1303, '3704003555', 8, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL),
(1304, '3718426360', 2, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL),
(1305, '', 9, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL),
(1306, 'hfentana@hotmail.com', 1, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL),
(1307, '', 4, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL),
(1308, '', 5, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL),
(1309, '', 6, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL),
(1310, '', 7, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL),
(1311, '', 8, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL),
(1312, '3704040909', 2, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL),
(1313, '', 9, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL),
(1314, 'vale_ry@hotmail.com', 1, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL),
(1315, 'facebook.com/laoficinadeviajes2017', 4, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL),
(1316, 'instagram.com/laoficinadeviajes', 5, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL),
(1317, '', 6, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL),
(1318, 'www.laoficinadeviajes.tur.ar', 7, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL),
(1319, 'laoficinadeviajes@gmail.com', 8, NULL, NULL, NULL, 14, NULL, NULL, NULL, NULL),
(1320, '3704300055', 2, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL),
(1321, '', 9, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL),
(1322, 'cepy@binomioviajes.com.ar', 1, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL),
(1323, 'facebook.com/losalisosviajesfsa', 4, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL),
(1324, 'instagram.com/losalisosviajesfsa', 5, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL),
(1325, '', 6, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL),
(1326, '', 7, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL),
(1327, '3704599026', 8, NULL, NULL, NULL, 15, NULL, NULL, NULL, NULL),
(1328, '', 2, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL),
(1329, '03704434208', 9, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL),
(1330, 'mymturismo@mymturismo.com.ar', 1, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL),
(1331, 'facebook.com/mymturismofma', 4, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL),
(1332, '', 5, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL),
(1333, '', 6, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL),
(1334, '', 7, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL),
(1335, 'agenciamymturismo@gmail.com', 8, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL),
(1336, '370578416', 2, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL),
(1337, '03704425437', 9, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL),
(1338, 'gerencia@paraquaria-srl.com.ar', 1, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL),
(1339, 'facebook.com/PARAQUARIA.Ecotravel', 4, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL),
(1340, '', 5, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL),
(1341, '', 6, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL),
(1342, 'www.paraquaria-srl.com.ar/', 7, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL),
(1343, '', 8, NULL, NULL, NULL, 17, NULL, NULL, NULL, NULL),
(1344, '03704421432', 2, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL),
(1345, '4421011', 9, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL),
(1346, 'sakuraevt@hotmail.com', 1, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL),
(1347, 'facebook.com/SakuraViajesOk', 4, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL),
(1348, 'instagram.com/sakuraviajesok', 5, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL),
(1349, '', 6, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL),
(1350, '', 7, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL),
(1351, '', 8, NULL, NULL, NULL, 18, NULL, NULL, NULL, NULL),
(1352, '3704385365', 2, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL),
(1353, '4445094', 9, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL),
(1354, 'jorge99viajes@viajes.com', 1, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL),
(1355, '', 4, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL),
(1356, '', 5, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL),
(1357, '', 6, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL),
(1358, '', 7, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL),
(1359, '', 8, NULL, NULL, NULL, 19, NULL, NULL, NULL, NULL),
(1360, '3704660772', 2, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL),
(1361, '4420395', 9, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL),
(1362, 'siaciatur@yahoo.com.ar', 1, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL),
(1363, '', 4, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL),
(1364, '', 5, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL),
(1365, '', 6, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL),
(1366, '', 7, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL),
(1367, '4434858', 8, NULL, NULL, NULL, 20, NULL, NULL, NULL, NULL),
(1368, '3704238394', 2, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL),
(1369, '4426159', 9, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL),
(1370, 'staffturismo@hotmail.com', 1, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL),
(1371, 'facebook.com/STAFF.TRAVELDANCE.FORMOSA', 4, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL),
(1372, 'instagram.com/staff_turismo', 5, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL),
(1373, '', 6, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL),
(1374, 'www.staffturismo.com.ar', 7, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL),
(1375, '', 8, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL),
(1376, '', 2, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL),
(1377, '4445094', 9, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL),
(1378, 'viajes.tteresa@gmail.com', 1, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL),
(1379, '', 4, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL),
(1380, '', 5, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL),
(1381, '', 6, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL),
(1382, '', 7, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL),
(1383, '', 8, NULL, NULL, NULL, 22, NULL, NULL, NULL, NULL),
(1384, '3704887226', 2, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL),
(1385, '', 9, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL),
(1386, 'jessivaliente7@gmail.com', 1, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL),
(1387, '', 4, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL),
(1388, '', 5, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL),
(1389, '', 6, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL),
(1390, '', 7, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL),
(1391, '3704 415952', 8, NULL, NULL, NULL, 23, NULL, NULL, NULL, NULL),
(1392, '', 2, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL),
(1393, '4429399', 9, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL),
(1394, 'mkloss@travelrock.com', 1, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL),
(1395, 'facebook.com/Travel-Rock-Formosa-Oficial-580517758625314', 4, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL),
(1396, '', 5, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL),
(1397, '', 6, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL),
(1398, '', 7, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL),
(1399, '', 8, NULL, NULL, NULL, 24, NULL, NULL, NULL, NULL),
(1400, '3704738906', 2, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL),
(1401, '4434777', 9, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL),
(1402, 'receptivo@turismodecastro.com.ar', 1, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL),
(1403, 'facebook.com/turismo.decastro', 4, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL),
(1404, 'instagram.com/turismodecastro', 5, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL),
(1405, '', 6, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL),
(1406, 'www.turismodecastro.tur.ar', 7, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL),
(1407, 'ventas@turismodecastro.tur.ar', 8, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL),
(1408, '3704585764', 2, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL),
(1409, '', 9, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL),
(1410, 'vidiviciviajes@gmail.com', 1, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL),
(1411, 'facebook.com/vidiviciviajes', 4, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL),
(1412, 'instagram.com/vidiviciviajesfsa', 5, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL),
(1413, '', 6, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL),
(1414, '', 7, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL),
(1415, '3704000626', 8, NULL, NULL, NULL, 26, NULL, NULL, NULL, NULL),
(1416, '3704259228', 2, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL),
(1417, '4427123', 9, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL),
(1418, 'goyaturismo18@gmail.com', 1, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL),
(1419, 'facebook.com/goyaturis', 4, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL),
(1420, 'instagram.com/goyaturismo', 5, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL),
(1421, '', 6, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL),
(1422, 'www.goyaturismo.com.ar', 7, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL),
(1423, '3704834415', 8, NULL, NULL, NULL, 27, NULL, NULL, NULL, NULL),
(1424, '3704692263', 2, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL),
(1425, '4431009', 9, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL),
(1426, 'tintesreligiosos@hotmail.com', 1, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL),
(1427, 'facebook.com/lafabricadeamigos', 4, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL),
(1428, 'instagram.com/tintesreligiosos', 5, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL),
(1429, '', 6, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL),
(1430, '', 7, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL),
(1431, '', 8, NULL, NULL, NULL, 28, NULL, NULL, NULL, NULL),
(1432, '3718504666', 2, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL),
(1433, '', 9, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL),
(1434, 'ivandc@hotmail.com', 1, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL),
(1435, '', 4, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL),
(1436, '', 5, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL),
(1437, '', 6, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL),
(1438, '', 7, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL),
(1439, '', 8, NULL, NULL, NULL, 29, NULL, NULL, NULL, NULL),
(1440, '3704576625', 2, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL),
(1441, '', 9, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL),
(1442, 'mttimperio@hotmail.com', 1, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL),
(1443, '', 4, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL),
(1444, '', 5, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL),
(1445, '', 6, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL),
(1446, '', 7, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL),
(1447, '', 8, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL),
(1466, '111', 2, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(1467, '222', 9, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(1468, 'aldanacorreo@gmail.com', 1, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(1469, 'Formosa', 4, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(1470, 'Formosa', 5, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(1471, 'Formosa', 6, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(1472, 'Formosa', 7, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(1473, 'Formosa', 8, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL),
(1485, '3704506393', 2, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL),
(1486, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL),
(1487, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL),
(1488, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL),
(1489, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL),
(1490, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL),
(1491, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL),
(1492, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL),
(1493, '3718591618', 2, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL),
(1494, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL),
(1495, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL),
(1496, 'facebook.com/Museo-Regional-Del-Nordeste-Formoseño-1455583238010520', 4, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL),
(1497, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL),
(1498, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL),
(1499, 'formosa.gob.ar/patrimonio/museos/nordeste', 7, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL),
(1500, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL),
(1501, '3704699702', 2, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL),
(1502, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL),
(1503, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL),
(1504, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL),
(1505, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL),
(1506, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL),
(1507, 'formosa.gob.ar/patrimonio/museos/quinquenal', 7, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL),
(1508, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL),
(1509, '3704872200', 2, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL),
(1510, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL),
(1511, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL),
(1512, 'facebook.com/museo.sciullo.1', 4, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL),
(1513, 'instagram.com/museosacrop.carmelosciullo', 5, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL),
(1514, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL),
(1515, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL),
(1516, 'facebook.com/MUSEO-Historico-PADRE-Carmelo-SCIULLO-Parroquia-Virgen-del-Rosario-Formosa-268551653556877', 8, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL),
(1517, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL),
(1518, '4428585', 9, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL),
(1519, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL),
(1520, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL),
(1521, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL),
(1522, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL),
(1523, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL),
(1524, '*Para el teléfono fijo el interno es (6245)', 8, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL),
(1525, '3704904014', 2, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL),
(1526, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL),
(1527, 'iglesiacatedralfsa@gmail.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL),
(1528, 'facebook.com/CatedralFsa', 4, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL),
(1529, 'instagram.com/iglesiacatedralformosa', 5, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL),
(1530, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL),
(1531, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL),
(1532, '3704434608', 8, NULL, NULL, NULL, NULL, NULL, NULL, 8, NULL),
(1533, '3704346991', 2, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL),
(1534, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL),
(1535, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL),
(1536, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL),
(1537, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL),
(1538, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL),
(1539, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL),
(1540, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, 9, NULL),
(1541, '3704257285', 2, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL),
(1542, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL),
(1543, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL),
(1544, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL),
(1545, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL),
(1546, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL),
(1547, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL),
(1548, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL),
(1549, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL),
(1550, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL),
(1551, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL),
(1552, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL),
(1553, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL),
(1554, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL),
(1555, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL),
(1556, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, 11, NULL),
(1557, '3704341567', 2, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL),
(1558, 'No se registró', 9, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL),
(1559, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL),
(1560, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL),
(1561, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL),
(1562, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL),
(1563, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL),
(1564, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL),
(1565, '3704321381', 2, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL),
(1566, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL),
(1567, 'museoferroviariofsa@gmail.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL),
(1568, 'facebook.com/MuseoFerroviarioMunicipalFormosa', 4, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL),
(1569, 'instagram.com/ferroviariomuseo', 5, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL),
(1570, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL),
(1571, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL),
(1572, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL),
(1573, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL),
(1574, '4436423', 9, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL),
(1575, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL),
(1576, 'facebook.com/MuseoJPDuffard', 4, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL),
(1577, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL),
(1578, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL),
(1579, 'formosa.gob.ar/patrimonio/museos/regional', 7, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL),
(1580, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, 14, NULL),
(1590, '3704669537', 2, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL),
(1591, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL),
(1592, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL),
(1593, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL),
(1594, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL),
(1595, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL),
(1596, 'formosa.gob.ar/patrimonio/museocienciasnaturales', 7, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL),
(1597, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, 16, NULL),
(1620, '3704613581', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7),
(1621, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7),
(1622, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7),
(1623, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7),
(1624, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7),
(1625, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7),
(1626, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7),
(1627, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7),
(1628, '3704278408', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8),
(1629, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8),
(1630, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8),
(1631, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8),
(1632, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8),
(1633, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8),
(1634, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8),
(1635, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8),
(1636, '3704704619', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9),
(1637, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9),
(1638, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9),
(1639, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9),
(1640, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9),
(1641, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9),
(1642, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9),
(1643, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9),
(1644, '3718549793', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10),
(1645, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10),
(1646, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10),
(1647, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10),
(1648, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10),
(1649, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10),
(1650, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10),
(1651, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10),
(1652, '3716414586', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11),
(1653, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11),
(1654, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11),
(1655, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11),
(1656, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11),
(1657, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11),
(1658, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11),
(1659, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11),
(1660, '3716617291', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12),
(1661, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12),
(1662, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12),
(1663, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12),
(1664, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12),
(1665, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12),
(1666, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12),
(1667, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12),
(1668, '3704512121', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13),
(1669, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13),
(1670, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13),
(1671, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13),
(1672, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13),
(1673, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13),
(1674, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13),
(1675, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13),
(1676, '3704230107', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14),
(1677, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14),
(1678, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14),
(1679, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14),
(1680, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14),
(1681, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14),
(1682, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14),
(1683, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14),
(1684, '3718635118', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15),
(1685, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15),
(1686, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15),
(1687, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15),
(1688, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15),
(1689, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15),
(1690, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15),
(1691, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15),
(1692, '3718552929', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16),
(1693, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16),
(1694, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16),
(1695, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16),
(1696, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16),
(1697, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16),
(1698, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16),
(1699, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16),
(1700, '3705036512', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17),
(1701, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17),
(1702, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17),
(1703, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17),
(1704, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17),
(1705, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17),
(1706, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17),
(1707, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17),
(1708, '3704274747', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18),
(1709, '', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18),
(1710, '', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18),
(1711, '', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18),
(1712, '', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18),
(1713, '', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18),
(1714, '', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18),
(1715, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18);

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
(9, 'Ramón Lista');

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
(79, '', NULL, NULL, NULL, NULL, 3),
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
(150, 'Martín Polo y Saenz Peña', NULL, NULL, NULL, NULL, 2),
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
(169, 'Av. San Martín S/N', NULL, NULL, NULL, NULL, 58),
(170, 'San Martín y Tucumán', NULL, NULL, NULL, NULL, 41),
(171, 'Av. Degen', NULL, NULL, NULL, NULL, 41),
(172, 'Salta S/N', NULL, NULL, NULL, NULL, 41),
(173, 'Roque Saenz Peña S/N', NULL, NULL, NULL, NULL, 29),
(174, 'Av. 9 de Julio S/N', NULL, NULL, NULL, NULL, 29),
(175, 'Sarmiento 949', NULL, NULL, NULL, NULL, 29),
(176, 'Av. Pringles y Fray Mamerto Esquiu', NULL, NULL, NULL, NULL, 29),
(192, 'Av. 25 de Mayo esq. Belgrano', NULL, NULL, NULL, NULL, 61),
(200, 'Av. San Martín N° 985', NULL, NULL, NULL, NULL, 56),
(201, 'Belgrano N°616', NULL, NULL, NULL, NULL, 35),
(202, 'España N°135 (2 y 4)', NULL, NULL, NULL, NULL, 35),
(203, 'Fotheringham N°382', NULL, NULL, NULL, NULL, 35),
(204, 'Fotheringham N°390 (4)', NULL, NULL, NULL, NULL, 35),
(205, 'Fortín Yunka Nº1595', NULL, NULL, NULL, NULL, 35),
(206, 'Italia Nº1137', NULL, NULL, NULL, NULL, 56),
(207, 'Dena Funes Nº748', NULL, NULL, NULL, NULL, 35),
(208, 'Av. 25 de Mayo Nº473', NULL, NULL, NULL, NULL, 35),
(209, 'Av. 25 de Mayo Nº783', NULL, NULL, NULL, NULL, 35),
(210, 'Fotheringham Nº1546', NULL, NULL, NULL, NULL, 35),
(211, 'Fontana Nº662', NULL, NULL, NULL, NULL, 35),
(212, 'Pringles Nº691 (2)', NULL, NULL, NULL, NULL, 35),
(213, 'Pringles Nº650', NULL, NULL, NULL, NULL, 35),
(214, 'Mitre Nº222 (1)', NULL, NULL, NULL, NULL, 35),
(215, 'Pringles Nº691 (2)', NULL, NULL, NULL, NULL, 35),
(216, 'Padre Grotti Nº1165', NULL, NULL, NULL, NULL, 35),
(217, 'Fontana Nº766 (1º- 4 y 7)', NULL, NULL, NULL, NULL, 35),
(218, 'Av. 25 de Mayo Nº285', NULL, NULL, NULL, NULL, 35),
(219, 'España Nº729 (1)', NULL, NULL, NULL, NULL, 35),
(220, 'Fontana Nº466', NULL, NULL, NULL, NULL, 35),
(221, 'Fontana Nº1268', NULL, NULL, NULL, NULL, 35),
(222, '25 de Mayo y Colón', NULL, NULL, NULL, NULL, 57),
(223, 'Maipú Nº1207', NULL, NULL, NULL, NULL, 35),
(226, 'Formosa', NULL, NULL, NULL, NULL, 16),
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
(254, '', NULL, NULL, NULL, NULL, 30),
(255, '', NULL, NULL, NULL, NULL, 57),
(256, '', NULL, NULL, NULL, NULL, 45),
(257, '', NULL, NULL, NULL, NULL, 43),
(258, '', NULL, NULL, NULL, NULL, 23);

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
(49, 1, 11, NULL, NULL, NULL, NULL),
(50, 1, 12, NULL, NULL, NULL, NULL),
(51, 1, 13, NULL, NULL, NULL, NULL),
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
(69, 3, 28, NULL, NULL, NULL, NULL),
(70, 1, 29, NULL, NULL, NULL, NULL),
(71, 3, 30, NULL, NULL, NULL, NULL),
(72, 3, 31, NULL, NULL, NULL, NULL),
(73, 1, 32, NULL, NULL, NULL, NULL),
(74, 1, 33, NULL, NULL, NULL, NULL),
(75, 1, 34, NULL, NULL, NULL, NULL),
(76, 1, 35, NULL, NULL, NULL, NULL),
(77, 1, 36, NULL, NULL, NULL, NULL),
(78, 1, 37, NULL, NULL, NULL, NULL),
(79, 1, 38, NULL, NULL, NULL, NULL),
(80, 6, 39, NULL, NULL, NULL, NULL),
(81, 1, 40, NULL, NULL, NULL, NULL),
(82, 5, 41, NULL, NULL, NULL, NULL),
(83, 1, 42, NULL, NULL, NULL, NULL),
(84, 1, 43, NULL, NULL, NULL, NULL),
(85, 1, 44, NULL, NULL, NULL, NULL),
(86, 1, 45, NULL, NULL, NULL, NULL),
(87, 1, 46, NULL, NULL, NULL, NULL),
(88, 1, 47, NULL, NULL, NULL, NULL),
(89, 1, 48, NULL, NULL, NULL, NULL),
(90, 5, 49, NULL, NULL, NULL, NULL),
(91, 1, 50, NULL, NULL, NULL, NULL),
(92, 5, 51, NULL, NULL, NULL, NULL),
(93, 1, 52, NULL, NULL, NULL, NULL),
(94, 5, 53, NULL, NULL, NULL, NULL),
(95, 1, 54, NULL, NULL, NULL, NULL),
(96, 5, 55, NULL, NULL, NULL, NULL),
(97, 5, 56, NULL, NULL, NULL, NULL),
(98, 5, 57, NULL, NULL, NULL, NULL),
(99, 5, 58, NULL, NULL, NULL, NULL),
(100, 5, 59, NULL, NULL, NULL, NULL),
(101, 5, 60, NULL, NULL, NULL, NULL),
(102, 5, 61, NULL, NULL, NULL, NULL),
(103, 5, 62, NULL, NULL, NULL, NULL),
(104, 5, 63, NULL, NULL, NULL, NULL),
(105, 5, 64, NULL, NULL, NULL, NULL),
(117, 7, NULL, 7, NULL, NULL, NULL),
(118, 1, NULL, 8, NULL, NULL, NULL),
(119, 6, NULL, 9, NULL, NULL, NULL),
(120, 5, NULL, 10, NULL, NULL, NULL),
(121, 5, NULL, 11, NULL, NULL, NULL),
(122, 1, NULL, 12, NULL, NULL, NULL),
(123, 7, NULL, 13, NULL, NULL, NULL),
(124, 6, NULL, 14, NULL, NULL, NULL),
(125, 5, NULL, 15, NULL, NULL, NULL),
(126, 1, NULL, 16, NULL, NULL, NULL),
(127, 1, NULL, 17, NULL, NULL, NULL),
(128, 1, NULL, 18, NULL, NULL, NULL),
(129, 1, NULL, 19, NULL, NULL, NULL),
(130, 1, NULL, 20, NULL, NULL, NULL),
(131, 1, NULL, 21, NULL, NULL, NULL),
(132, 1, NULL, 22, NULL, NULL, NULL),
(133, 1, NULL, 23, NULL, NULL, NULL),
(134, 1, NULL, 24, NULL, NULL, NULL),
(135, 1, NULL, 25, NULL, NULL, NULL),
(136, 1, NULL, 26, NULL, NULL, NULL),
(137, 1, NULL, 27, NULL, NULL, NULL),
(138, 1, NULL, 28, NULL, NULL, NULL),
(139, 7, NULL, 29, NULL, NULL, NULL),
(140, 7, NULL, 30, NULL, NULL, NULL),
(142, 2, NULL, NULL, 2, NULL, NULL);

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
-- Estructura de tabla para la tabla `localidad`
--

CREATE TABLE `localidad` (
  `id_localidad` int(10) NOT NULL,
  `nombre_localidad` varchar(244) NOT NULL,
  `codigo_postal` int(11) DEFAULT NULL,
  `rela_provincia` int(10) NOT NULL,
  `rela_departamento` int(11) NOT NULL
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
(65, 'Banco Payaguá', NULL, 1, 3);

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
  `idoneo_museo` varchar(244) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `museo`
--

INSERT INTO `museo` (`id_museo`, `nombre_museo`, `horario_dia_museo`, `rela_direccion`, `descripcion_museo`, `idoneo_museo`) VALUES
(3, 'Casa de la Artesanía', 'Lunes a Viernes turno mañana 8:00 a 12:00, turno tarde 16:00 a 19:00. Sábados, por la mañana 09:00 a 12:00', 228, '', 'Víctor Falcón'),
(4, 'Museo Regional del Nordeste Formoseño', 'Lunes a Viernes turno mañana 8:00 a 12:00, turno tarde 14:00 a 18:00. Sábados turno mañana 09:00 a 11:00, turno tarde 16:00 a 18:00', 229, 'En la actualidad el museo cubre una superficie de 3.900 m2y en sus instalaciones ofrece, además de las salas de exposición, sala de conferencias, sanitarios, office, depósito administrativo, bar, estacionamiento, cisternas, parquización y un lago artificial.\r\nEl acervo del museo comprende documentos, correspondencia epistolar, uniformes y vestimentas, monedas y billetes, enseres domésticos, carruajes, artesanías, cuadros, instrumentos de labranza, muebles, aparatos de distinta épocas y reproducciones.\r\nEl abordaje temático se desarrolla en el sentido de reconstrucción colectiva de la memoria. Comprende los siguientes aspectos:\r\nCreencias de la región representadas por personajes de la mitología popular.\r\n', ''),
(5, 'Museo del Plan Quinquenal', 'Lunes a Viernes turno mañana 8:00 a 12:00, turno tarde 16:00 a 18:30. Sábados, domingos y feriados cerrado.', 230, 'Inaugurado el 16 de septiembre de 2013, el Museo del Plan Quinquenal se encuentra ubicado en la Escuela N°48 \"Domingo Bresanovich y Jacinto Somacal\", en la localidad de Colonia Pastoril.', ''),
(6, 'Museo Sacro Cultural ', 'Sàbados y Domingos Tarde 17:00 a 19:30  *Consultar por visitas guiadas durante la semana', 231, '', ''),
(7, 'Museo Histórico Policial \"Comisario Gral. de la Policía de Territorios Nacionales Justo Bobadilla\"', '*Cerrado por refacciones', 232, 'El Museo de la Policía de Formosa fue inaugurado el 11 de Noviembre de 1993, lleva el nombre del Comisarío General ® TTNN Dn. Justo Bobadilla', ''),
(8, 'Museo \"Nuestra Señora del Carmen\"', 'Cerrado', 233, '', ''),
(9, 'Museo y Casa de la Cultura', 'Comunicarse previamente para coordinar ', 234, '', ''),
(10, 'Museo \"Misión Laishi\"', 'Comunicarse para visitas guiadas', 235, '', ''),
(11, 'Museo del Carnaval', 'Comunicarse con la Municipalidad de Ibarreta', 236, '', ''),
(12, 'Museo y Casa Histórica ', 'Lunes a Viernes turno mañana 7:00 a 12:00, turno tarde 16:00 a 19:00. Sábados, domingos y feriados con aviso previo', 237, '', 'Yango Albornoz'),
(13, 'Museo Ferroviario', 'Lunes a Viernes turno mañana 8:00 a 12:00, turno tarde 16:00 a 20:00. Sábados, domingos y feriados de 16:00 a 21:00', 238, 'El museo adquiere, conserva, investiga, comunica y exhibe con propósito de estudio, educación y esparcimiento.', ''),
(14, 'Museo Histórico y Regional \"Juan Pablo Duffard\"', 'Lunes a Viernes de 08 a 12 horas y por la tarde de 15.30 a 19 horas. Sábados, Domingos y feriados por la mañana de 10 a 12 y por la tarde de 18 a 19 horas.', 239, 'El edificio del actual Museo era la residencia del Gobernador Fotheringham, construido en 1888. La casa se encuentra rodeada de anchos corredores cubiertos y techos altos cuyo fin era el de mitigar los calores del verano.\r\nFunciono como \"Casa de Gobierno\" del Territorio Nacional hasta 1981 en que por Decreto Provincial Nº 343/81 fue destinada para cumplir funciones de Museo.\r\nEl Museo Histórico y Regional es el primer Monumento Histórico Nacional por Decreto Nacional Nº 10.852/53, rubricado por el Presidente Perón.\r\nPor Decreto Nº 616 en el año 1988 del Gobierno Provincial, se le impuso el nombre \"Juan Pablo Duffard\" como justo homenaje a este pionero, quien inquebrantable y desinteresadamente tuvo la primera inquietud de espíritu conservacionista de objetos y Documentos, varios pertenecientes a los antiguos pobladores de la Villa Formosa. Hijo de Benjamín Duffard de origen francés que vino acompañando a Fontana para fundar Formosa. Hombre culto y preocupado por conservar el acervo cultural de sus ancestros, reunió pacientemente en su casa ubicada en la calle Moreno al 800 una gran cantidad de piezas históricas que paulatinamente fue ordenándolas con la idea de crear un museo y resguardar así la historia local.\r\nEste museo rescata y recuerda en el recorrido de sus nueves salas temáticas desde: la Fundación de la Ciudad, objetos y documentos de aquellos antiguos pobladores de la Villa Formosa; las familias fundadoras, la cultura indígena, las expediciones y sucesos militares; la evolución política, social y cultural del territorio; los Gobernadores y los símbolos Provinciales, no solo para la sociedad formoseña sino también a los turistas visitantes, estableciendo un vínculo tangible con el pasado.\r\nSala 1: \"Las familias Fundadoras\"\r\nSala 2: \"Antiguos Dueños de la Tierra\"\r\nSala 3: \"La Empresa Militar\"\r\nSala 4: \"La Empresa Militar\"\r\nSalas 5: \"Usos y Costumbres de las Familias Fundadoras\"\r\nSalas 6: \"Esparcimiento y recreación de las familias fundadoras\"\r\nSala 7: \"Institucional, de los símbolos provinciales y de los gobernadores constitucionales\"\r\nSala 8: \"De los Gobernadores del Territorio Nacional\"\r\nSala 9: \"Salón Auditorio\"\r\n', ''),
(16, 'Museo Provincial de Ciencias Naturales', 'Lunes a Sábados 09 a 12 horas.', 241, 'Se encuentra ubicado a 76 km de la ciudad capital, en la localidad de Villa Escolar, Departamento de Misión Laishí, en la Provincia de Formosa y a 100 km de la ciudad de Resistencia, Provincia del Chaco.\r\nEs un museo de modernas instalaciones, acorde al mundo que vivimos hoy, que difunde un Paisaje Cultural que se desarrolla en tres aristas: COMUNIDAD \"BIÓSFERA\" MUSEO. Museo donde convergen reflejos de nuestra región, paisajes de montes, selvas típicas de la región Chaqueña; costas barrancosas sobre el Río Bermejo y un lugar de encuentro cultural. Los hallazgos de restos paleontológicos están protegidos por la Ley Provincial Nº 1455 de Protección del Patrimonio Arqueológico y Paleontológico en adhesión a la Ley Nacional Nº 25.743 En el territorio Formoseño, en las barrancas del Río Bermejo se encontraron restos de megafauna extinta cuyos mejores representantes lo constituyen:\r\nEl grupo del orden CINGULATA cuyos representantes constituyen los GLYPTODON, los NEOSCLEROCALYPTUS y PAMPATHERIUM.\r\nEl grupo del orden NOTOUNGULATA lo representa la especie \"TOXODON\" y del orden TATIRGRADA, lo representa la especie MEGATERIUM.\r\nparte del acervo del Museo en recorrido de sus salas las siguientes colecciones:\r\nDE ELEMENTOS ANTROPOLÓGICOS\r\nDE PALEOVERTEBRADOS\r\nA la Fecha 12/12/14, la Colección Paleontológica cuenta con 145 ejemplares clasificados.\r\nDE PALEOVEGETALES\r\nDE RÉPLICAS DE FÓSILES ADQUIRIDOS EN EL MUSEO DE CIENCIAS NATURALES DE LA PLATA - NEOSCLEROCALYPTUS y PROPRAOPUS\r\nCOLECCIÓN DE ANIMALES EMBALSAMADOS\r\nCOLECCIÓN ARQUEOLÓGICA\r\nY un parque donde se encuentran las diferentes especies arbóreas locales y de nuestra región.\r\n', '');

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
  `cuil_persona` int(10) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `rela_persona_direccion` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id_persona`, `nombre_persona`, `apellido_persona`, `dni_persona`, `cuil_persona`, `fecha_nac`, `rela_persona_direccion`) VALUES
(1, 'david', 'pereyra', 37044625, 2037044625, '2020-05-13', NULL);

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
  `rela_persona_prestrador` int(10) DEFAULT NULL,
  `rela_prestador_direccion` int(11) NOT NULL,
  `rela_tipo_prestador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `prestadores`
--

INSERT INTO `prestadores` (`id_prestador`, `descripcion_prestador`, `cuit_prestador`, `dni_prestador`, `institucion_prestador`, `rela_razon_social_prestador`, `rela_persona_prestrador`, `rela_prestador_direccion`, `rela_tipo_prestador`) VALUES
(2, 'david guia', '123', 123, 'ass', NULL, NULL, 226, 2);

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
(85, ''),
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
(104, ''),
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
(119, 'Binomio S.R.L.'),
(120, 'Gutiérrez, Claudio Marcelo'),
(121, 'Bregant, Diego Alejandro'),
(122, 'Fentana, Hugo Ricardo'),
(123, 'Dominguez, Valeria Cristina'),
(124, 'Binomio S.R.L.'),
(125, 'Molina, Miguel Ángel'),
(126, 'Paraquaria S.R.L'),
(127, 'Musso, Carlos Marcelo'),
(128, 'López, Jorge Miguel'),
(129, 'Siacia, Ariel Ernesto'),
(130, 'Oviedo, Carlos Antonio'),
(131, 'Benítez, Teresa Laura'),
(132, 'Energym S.R.L.'),
(133, 'Travel Rock S.A.'),
(134, 'TDC S.R.L.'),
(135, 'Román, Claudio Julián'),
(136, ''),
(137, ''),
(138, 'Centurión, Iván David'),
(139, 'Centurión, Iván David');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `referentes_municipal`
--

CREATE TABLE `referentes_municipal` (
  `id_referentes` int(11) NOT NULL,
  `idoneo_referente` varchar(244) NOT NULL,
  `rela_direccion` int(11) NOT NULL,
  `rela_tipo_encargado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `referentes_municipal`
--

INSERT INTO `referentes_municipal` (`id_referentes`, `idoneo_referente`, `rela_direccion`, `rela_tipo_encargado`) VALUES
(1, 'Cristina Salomón', 72, 1),
(2, 'Danilo', 73, 7),
(3, 'Néstor Mendoza', 74, 7),
(4, 'Néstor Benitez', 75, 7),
(5, 'José Friedrich', 76, 7),
(6, 'Reinaldo Saporitti', 77, 1),
(7, 'Carlos Paton', 78, 6),
(8, 'Yamina Franco', 79, 7),
(9, 'Arnaldo Barrios', 80, 5),
(10, 'César Arias', 81, 7),
(11, 'Marta', 82, 7),
(12, 'Rubén Landriel', 83, 7),
(13, 'Charri', 84, 6),
(14, 'Adan Jarzynski', 85, 5),
(15, 'Marite Álvarez', 86, 1),
(16, 'Acosta Melanio', 87, 6),
(17, 'Eve Bonilla', 88, 6),
(18, 'Andrés De Yong', 89, 5),
(19, 'Matilde Muñoz', 90, 6),
(20, 'Luis Rivero', 91, 5),
(21, 'Julián Bordón', 92, 5),
(22, 'María', 93, 6),
(23, 'Carlos Paniagua', 94, 6),
(24, 'Roberto', 95, 6),
(25, 'Rosi Medina', 96, 6),
(26, 'Guillermo Silva', 97, 5),
(27, 'Lilian Consentino', 98, 6),
(28, 'Luis Blasich', 99, 5),
(29, 'Ana Blanco', 100, 6),
(30, 'Julio Murdoch', 101, 5),
(31, 'Mariano Ortiz', 102, 6),
(32, 'Graciela', 103, 6),
(33, 'Andrea Ibarlucea', 104, 1),
(34, 'Josefina Mendez', 105, 6),
(35, 'Daniel Alarcón', 106, 1),
(36, 'Lorenzo Schmidt', 107, 5),
(37, 'Gildo Martiarena', 108, 6),
(38, 'Antonio Caldera', 109, 5),
(39, 'Rafael Nacif', 149, 5);

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
(37, 60, 30, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(38, 60, 30, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(39, 122, 58, 0, 0, 0, 0, 0, '', '', 'Si', 'Si', '', ''),
(40, 134, 83, 0, 0, 0, 0, 0, '', '', 'Si', 'Si', 'Si', 'Si'),
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
(61, 0, 0, 0, 0, 0, 0, 0, '', '', 'Si', 'Si', '', ''),
(62, 50, 22, 0, 0, 0, 0, 0, '', '', 'Si', 'Si', '', ''),
(63, 100, 33, 0, 0, 0, 0, 0, '', '', 'Si', 'Si', '', ''),
(64, 70, 30, 0, 0, 0, 0, 0, '', '', 'Si', 'Si', '', ''),
(65, 19, 10, 0, 0, 0, 0, 0, '', '', 'Si', 'Si', '', ''),
(66, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(67, 200, 40, 0, 0, 0, 0, 0, '', '', 'Si', 'Si', '', ''),
(68, 40, 20, 0, 0, 0, 0, 0, '', '', 'Si', 'Si', '', ''),
(69, 20, 9, 0, 0, 0, 0, 0, '', '', 'Si', 'Si', '', ''),
(70, 27, 14, 0, 0, 0, 0, 0, '', '', 'Si', 'Si', '', ''),
(71, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
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
(86, 40, 10, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(87, 36, 10, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(88, 50, 35, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(89, 20, 9, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(90, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(91, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(92, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(93, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(94, 102, 28, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(95, 30, 12, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(96, 60, 24, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(97, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(99, 12, 3, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(100, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', ''),
(101, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '');

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
  `descripcion_servicio_general` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `servicios_generales`
--

INSERT INTO `servicios_generales` (`id_servicios_generales`, `nombre_servicio_general`, `idoneo_servicio_general`, `rela_direccion`, `rela_estacion`, `rela_tipo_servicio`, `rela_tipo_lugar`, `descripcion_servicio_general`) VALUES
(7, 'Playa Municipal', 'Reinaldo Saporiti', 247, 1, 1, 2, 'No está habilitada'),
(8, 'Pileta Municipal', 'Araceli Perez', 248, 1, 1, 1, 'Enero-Febrero'),
(9, 'Camping Municipal', 'Marcelo Fretes ', 249, 1, 1, 3, 'Todo el año disponible'),
(10, 'Pileta Municipal', 'Mariano Ortiz', 250, 1, 1, 1, 'Enero-Febrero'),
(11, 'Pileta Municipal', 'Edward Patiño', 251, 1, 1, 1, 'Enero-Febrero'),
(12, 'Pileta Municipal', 'Evelin Bobadilla', 252, 1, 1, 1, 'Enero-Febrero'),
(13, 'Pileta Municipal', 'David Falcón', 253, 1, 1, 1, 'Enero-Febrero'),
(14, 'Parque Acuático El Colorado', 'Andrea Ibarlucea', 254, 1, 1, 1, 'Costo de Ingreso:\r\n\r\nColoradenses: $200\r\nTuristas: $300'),
(15, 'Pileta Municipal', 'Luis Blasich', 255, 1, 1, 1, 'Enero-Febrero'),
(16, 'Pileta Municipal', 'María Zárate', 256, 1, 1, 1, 'Enero-Febrero'),
(17, 'Pileta Municipal', 'Carlos Paniagua', 257, 1, 1, 1, 'No está habilitado'),
(18, 'Parque Acuático Mansilla', 'José Escobar', 258, 1, 1, 1, 'Habilitado viernes, sábados y domingos.');

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
(4, 1, 'Formosa', 2),
(5, 2, 'Formosa', 2);

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
(69, 0, '', '', '', ''),
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
(88, 0, '', '', '', ''),
(89, 0, '', '', '', ''),
(90, 0, '', '', '', ''),
(91, 0, '', '', '', ''),
(92, 0, '', '', '', ''),
(93, 0, '', '', '', ''),
(94, 0, '', '', '', ''),
(95, 0, '', '', '', ''),
(97, 0, '', '', '', ''),
(98, 0, '', '', '', ''),
(99, 0, '', '', '', '');

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
(4, 'Invierno');

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
(5, 'Todo el año');

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
(11, 'piraguas');

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
(2, 'ministra', '1234', 1),
(3, 'admin', '1234', 1),
(5, 'liz', '1234', 3),
(6, 'visitante', '1234', 2);

--
-- Índices para tablas volcadas
--

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
  ADD PRIMARY KEY (`id_archivo_ima_vid`);

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
  ADD KEY `fk_servicios_generales` (`rela_servicios_generales`);

--
-- Indices de la tabla `departamentos_fsa`
--
ALTER TABLE `departamentos_fsa`
  ADD PRIMARY KEY (`id_departamentos_fsa`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`id_direccion`),
  ADD KEY `fk_direccion_localidad` (`rela_localidad_direccion`);

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
  ADD KEY `fk_persona_direccion` (`rela_persona_direccion`);

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
-- Indices de la tabla `usuario_contra`
--
ALTER TABLE `usuario_contra`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `fk_usuario_roles` (`rela_rol_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `agencias`
--
ALTER TABLE `agencias`
  MODIFY `id_agencias` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `alojamientos`
--
ALTER TABLE `alojamientos`
  MODIFY `id_alojamientos` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT de la tabla `archivos_ima_video`
--
ALTER TABLE `archivos_ima_video`
  MODIFY `id_archivo_ima_vid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `calendario`
--
ALTER TABLE `calendario`
  MODIFY `id_calendario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT de la tabla `contacto`
--
ALTER TABLE `contacto`
  MODIFY `id_contacto` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1716;

--
-- AUTO_INCREMENT de la tabla `departamentos_fsa`
--
ALTER TABLE `departamentos_fsa`
  MODIFY `id_departamentos_fsa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `id_direccion` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=259;

--
-- AUTO_INCREMENT de la tabla `estadistica`
--
ALTER TABLE `estadistica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado_actividad`
--
ALTER TABLE `estado_actividad`
  MODIFY `id_estado` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

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
-- AUTO_INCREMENT de la tabla `localidad`
--
ALTER TABLE `localidad`
  MODIFY `id_localidad` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

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
  MODIFY `id_persona` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `prestadores`
--
ALTER TABLE `prestadores`
  MODIFY `id_prestador` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `provincia`
--
ALTER TABLE `provincia`
  MODIFY `id_provincia` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `razon_social`
--
ALTER TABLE `razon_social`
  MODIFY `id_razon_social` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT de la tabla `referentes_municipal`
--
ALTER TABLE `referentes_municipal`
  MODIFY `id_referentes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

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
  MODIFY `id_servicio_alojamiento` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT de la tabla `servicios_generales`
--
ALTER TABLE `servicios_generales`
  MODIFY `id_servicios_generales` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `servicios_prestadores`
--
ALTER TABLE `servicios_prestadores`
  MODIFY `id_servicios_prestadores` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `serv_complemetarios_alojamiento`
--
ALTER TABLE `serv_complemetarios_alojamiento`
  MODIFY `id_serv_comple_alojamiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

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
  MODIFY `id_tipo_estacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tipo_estado`
--
ALTER TABLE `tipo_estado`
  MODIFY `id_tipo_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tipo_guias`
--
ALTER TABLE `tipo_guias`
  MODIFY `id_tipo_guis` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_lugar`
--
ALTER TABLE `tipo_lugar`
  MODIFY `id_tipo_lugar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tipo_prestador`
--
ALTER TABLE `tipo_prestador`
  MODIFY `id_tipo_prestador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_servicios_prestadores`
--
ALTER TABLE `tipo_servicios_prestadores`
  MODIFY `id_tipo_servicios_prestadores` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `tipo_sucursal`
--
ALTER TABLE `tipo_sucursal`
  MODIFY `id_tipo_sucursal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario_contra`
--
ALTER TABLE `usuario_contra`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  ADD CONSTRAINT `fk_museo_contacto` FOREIGN KEY (`rela_contacto_museo`) REFERENCES `museo` (`id_museo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_persona_contacto` FOREIGN KEY (`rela_persona_contacto`) REFERENCES `persona` (`id_persona`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_servicios_generales` FOREIGN KEY (`rela_servicios_generales`) REFERENCES `servicios_generales` (`id_servicios_generales`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Filtros para la tabla `guias`
--
ALTER TABLE `guias`
  ADD CONSTRAINT `fk_guias_persona` FOREIGN KEY (`rela_personas_guias`) REFERENCES `persona` (`id_persona`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_guias_tipo_guias` FOREIGN KEY (`rela_tipo_guias`) REFERENCES `tipo_guias` (`id_tipo_guis`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `fk_persona_direccion` FOREIGN KEY (`rela_persona_direccion`) REFERENCES `direccion` (`id_direccion`) ON DELETE CASCADE ON UPDATE CASCADE;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
