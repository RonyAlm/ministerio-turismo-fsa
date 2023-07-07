-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-07-2023 a las 16:46:39
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

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
-- Estructura de tabla para la tabla `contacto_notas`
--

CREATE TABLE `contacto_notas` (
  `id_contacto_notas` int(11) NOT NULL,
  `descri_contacto_notas` varchar(255) DEFAULT NULL,
  `rela_contacto_con` int(11) NOT NULL,
  `rela_contacto_notas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contacto_notas`
--

INSERT INTO `contacto_notas` (`id_contacto_notas`, `descri_contacto_notas`, `rela_contacto_con`, `rela_contacto_notas`) VALUES
(1, '11', 2, 1),
(2, '22', 9, 1),
(3, 'correonotas@gmail.com', 1, 1),
(4, 'facebooknotas', 4, 1),
(5, 'instagramnotas', 5, 1),
(6, 'twitternotas', 6, 1),
(7, 'webnotas', 7, 1),
(8, 'otronotas', 8, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `contacto_notas`
--
ALTER TABLE `contacto_notas`
  ADD PRIMARY KEY (`id_contacto_notas`),
  ADD KEY `fk_con_notas` (`rela_contacto_con`),
  ADD KEY `fk_contacto_notas` (`rela_contacto_notas`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `contacto_notas`
--
ALTER TABLE `contacto_notas`
  MODIFY `id_contacto_notas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `contacto_notas`
--
ALTER TABLE `contacto_notas`
  ADD CONSTRAINT `fk_con_notas` FOREIGN KEY (`rela_contacto_con`) REFERENCES `tipo_contacto` (`id_tipo_contacto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_contacto_notas` FOREIGN KEY (`rela_contacto_notas`) REFERENCES `notas` (`id_notas`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
