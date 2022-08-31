-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-08-2022 a las 14:03:40
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

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tipo_lugar`
--
ALTER TABLE `tipo_lugar`
  ADD PRIMARY KEY (`id_tipo_lugar`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tipo_lugar`
--
ALTER TABLE `tipo_lugar`
  MODIFY `id_tipo_lugar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
