-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-07-2023 a las 16:46:23
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
-- Estructura de tabla para la tabla `tipo_organismo_nota`
--

CREATE TABLE `tipo_organismo_nota` (
  `id_tipo_org_nota` int(11) NOT NULL,
  `descripcion_org_nota` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_organismo_nota`
--

INSERT INTO `tipo_organismo_nota` (`id_tipo_org_nota`, `descripcion_org_nota`) VALUES
(1, 'Escuela'),
(2, 'Ministerio de Cultura'),
(3, 'Ministerio de Educación'),
(4, 'Casa de Gobierno');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tipo_organismo_nota`
--
ALTER TABLE `tipo_organismo_nota`
  ADD PRIMARY KEY (`id_tipo_org_nota`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tipo_organismo_nota`
--
ALTER TABLE `tipo_organismo_nota`
  MODIFY `id_tipo_org_nota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
