-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-06-2023 a las 13:28:54
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `prueba3`
--

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
(13, '3704367362', 2, 13),
(14, '3704342803', 2, 14),
(15, '3704342803', 2, 15),
(16, '3704342803', 2, 16),
(17, '3705092591', 2, 17),
(18, '3704765859', 2, 18),
(19, '3704666146', 2, 19),
(20, '3704469337', 2, 20),
(21, '3715402536', 2, 21),
(22, '3704386302', 2, 22),
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
(69, '', 2, 69),
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
(119, '123456789', 2, 119),
(120, '', 9, 119),
(121, '', 1, 119),
(122, '', 4, 119),
(123, '', 5, 119),
(124, '', 6, 119),
(125, '', 7, 119),
(126, '', 8, 119);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `contacto_cursos`
--
ALTER TABLE `contacto_cursos`
  ADD PRIMARY KEY (`id_contacto_cursos`),
  ADD KEY `fk_contacto_cursos` (`rela_contacto_cursos`),
  ADD KEY `fk_contacto_con_cursos` (`rela_contacto_con`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `contacto_cursos`
--
ALTER TABLE `contacto_cursos`
  MODIFY `id_contacto_cursos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `contacto_cursos`
--
ALTER TABLE `contacto_cursos`
  ADD CONSTRAINT `fk_contacto_con_cursos` FOREIGN KEY (`rela_contacto_con`) REFERENCES `tipo_contacto` (`id_tipo_contacto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_contacto_cursos` FOREIGN KEY (`rela_contacto_cursos`) REFERENCES `cursos` (`id_cursos`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
