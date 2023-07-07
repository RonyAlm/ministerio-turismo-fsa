-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-07-2023 a las 16:47:20
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
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `id_notas` int(11) NOT NULL,
  `numero_nota` varchar(255) DEFAULT NULL,
  `fecha_ig_notas` date DEFAULT NULL,
  `fecha_sl_nota` date DEFAULT NULL,
  `remitente_nota` varchar(255) DEFAULT NULL,
  `descrip_motivo` varchar(255) DEFAULT NULL,
  `respuesta_nota` text DEFAULT NULL,
  `rela_tipo_org` int(11) NOT NULL,
  `rela_tipo_motivo` int(11) NOT NULL,
  `rela_dire_nota` int(11) NOT NULL,
  `fecha_edit_notas` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `notas`
--

INSERT INTO `notas` (`id_notas`, `numero_nota`, `fecha_ig_notas`, `fecha_sl_nota`, `remitente_nota`, `descrip_motivo`, `respuesta_nota`, `rela_tipo_org`, `rela_tipo_motivo`, `rela_dire_nota`, `fecha_edit_notas`) VALUES
(1, 'f1001', '2023-06-30', NULL, 'remitente', 'descripcion motivo', 'respuesta nota', 4, 1, 1, '2023-07-07 14:40:34');

--
-- Disparadores `notas`
--
DELIMITER $$
CREATE TRIGGER `crearnotas` AFTER INSERT ON `notas` FOR EACH ROW INSERT INTO auditoria(tabla, accion, new_value, usuario_id) VALUES ('notas', 'INSERT', CONCAT('{"`id_notas`":', new.`id_notas`, '}'), 3)
$$
DELIMITER ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id_notas`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `id_notas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
