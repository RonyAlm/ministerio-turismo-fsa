-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-07-2023 a las 16:47:07
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
-- Estructura de tabla para la tabla `direccion_notas`
--

CREATE TABLE `direccion_notas` (
  `id_direccion_notas` int(11) NOT NULL,
  `calle_direccion_notas` varchar(255) DEFAULT NULL,
  `rela_localidad_nota` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `direccion_notas`
--

INSERT INTO `direccion_notas` (`id_direccion_notas`, `calle_direccion_notas`, `rela_localidad_nota`) VALUES
(1, 'domicilio motivo', 35);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `direccion_notas`
--
ALTER TABLE `direccion_notas`
  ADD PRIMARY KEY (`id_direccion_notas`),
  ADD KEY `fk_direccion_notas` (`rela_localidad_nota`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `direccion_notas`
--
ALTER TABLE `direccion_notas`
  MODIFY `id_direccion_notas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `direccion_notas`
--
ALTER TABLE `direccion_notas`
  ADD CONSTRAINT `fk_direccion_notas` FOREIGN KEY (`rela_localidad_nota`) REFERENCES `localidad` (`id_localidad`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
