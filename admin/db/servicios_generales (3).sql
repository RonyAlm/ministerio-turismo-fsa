-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-08-2022 a las 13:50:16
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

--
-- Volcado de datos para la tabla `servicios_generales`
--

INSERT INTO `servicios_generales` (`id_servicios_generales`, `nombre_servicio_general`, `idoneo_servicio_general`, `rela_direccion`, `rela_estacion`, `rela_tipo_servicio`, `rela_tipo_lugar`, `descripcion_servicio_general`, `fecha_edit_general`) VALUES
(36, 'Estadio Club 8 de Diciembre', 'Presidente del Club Roberto Mereles', 404, 6, 1, 8, 'alquier de espacios para carpas, esta el club 8 de Diciembre ( a 6 cuadras del predio del Pomelo)\r\nPor carpa $ 2.000 por día, paso el número de contacto del resp. en ese tema por cualquier consulta.\r\nEl club cuenta con baños, cuidador y policía para esos días, se cobra por carpa no por cantidad de personas.\r\nCONSULTAR POR RAMIREZ EZEQUIEL 3718521441', '2022-08-31 08:22:41');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
