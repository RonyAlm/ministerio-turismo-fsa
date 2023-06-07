-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-06-2023 a las 13:29:15
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
(1, 'Cintia Noemi Alegre', '32830617', 'policia', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(2, 'Jorge Orlando Ismael Perez', '24780381', 'periodista', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(3, 'Mariana Pasari Ocampo', '33994356', 'prof. artes visuales', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(4, 'Jimena Torrez', '45642655', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(5, 'Lucas Alejandro Coglhan', '39134176', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(6, 'Analia Soledad Lopez', '29324477', 'asist. En turismo', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(7, 'Maria Soledad Acevedo', '28080511', 'asesor turistico', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(8, 'Elida Perez', '37534226', 'empleada de comercio', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(9, 'Alan Nicolas Gomez', '44941468', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(10, 'Walter Daniel Rojas', '31406373', 'asist. En viajes y turismo', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(11, 'Yesica Daiana Benitez', '36016961', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(12, 'Cesar Manuel Gimenez', '29484415', 'guia turistico', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(13, 'Nelly Diaz', '16104883', 'emprendedora turistica', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(14, 'Claudia Beatriz Giorgi', '24149302', 'ama de casa', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(15, 'Luz Torales Giorgi', '46208270', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(16, 'Lujan Torales Giorgi', '46208271', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(17, 'Salome Rita Frias', '46321437', 'estudiante de cont. Publico', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(18, 'Oscar Seferino Gomez', '26211641', 'maestro mayor de obra', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(19, 'Liliana Muñoz', '22281439', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(20, 'Victoria Vega', '40486702', 'asist. Viajes y turismo', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(21, 'Analia Mirna Isabel Beloso', '29857979', 'docente', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(22, 'Mauricia Vega ', '35625952', 'asist. viajes y turismo', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(23, 'Eliana Gisel Gonzalez Alcaraz', '34047460', 'emprendedora ', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(24, 'Gerardo Nicolas Gomez', '33741467', '', 'Presente', 1, 29, '2023-06-07 11:18:36'),
(25, 'Elva Amarilla', '23002854', 'asist. En turismo', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(26, 'Barbara Valeria Gadea', '34842552', 'prof. educacion fisica', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(27, 'Monica Benitez', '22598207', 'administrativa', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(28, ' Eber Aurelio Godoy', '20222009', 'docente', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(29, 'Marlene Yanet Tocarchuk', '36959159', 'profesora', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(30, 'Monica Martinez ', '35624991', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(31, 'Sonia Medina ', '27675696', 'enfermera', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(32, 'Martina Ledesma', '45169505', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(33, 'Ana Laura Bernal', '35625434', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
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
(44, 'Ricardo Andres Maidana', '39316113', 'prof. de economia', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(45, 'Karen Adriana Rolon', '35897880', 'abogada', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(46, 'Patricia Elizabheth Benitez', '32368361', 'guia , asist. Turistico', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(47, 'Oriana Medeyro', '42297759', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(48, 'Ana Laura Bernal', '35625434', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(49, 'Adriana Noemi Arrollo', '31406492', 'abogada', 'Ausente', 1, 2, '2023-06-07 03:03:23'),
(50, 'Hector Jonathan Gill', '40988554', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(51, 'Yesica Ramona Maldonado', '38379613', 'prof. educacion fisica', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(52, 'Ayelen Valdez', '41283320', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(53, 'Florencia Michelle Garcia', '36958628', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(54, 'Milena Abigail Bobadilla', '45050503', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(55, 'Mayra Gabriela Martinez', '42634505', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(56, 'Ramon Maximiliano Villalba', '43330621', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(57, 'Juan Marcelo Vazquez', '31178299', 'prestador turistico', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(58, 'Gonzalo David Vazquez ', '45745929', 'prestador turistico', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(59, ' Franco Nicolas Santichia', '39720345', 'Porf. Biologia ', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(60, 'Lia Maribel Ramos ', '44226337', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(61, 'Carla Gimena Delgado ', '46393509', 'Trayecto Tec. Turismo ', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(62, 'Cecilia Raquel Arce', '38575461', '', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(63, 'Marcelino Abel Torales', '25466590', 'Op. Turistcio', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(64, 'Sonia Griselda Medina', '27675696', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(65, 'Matias Fernando Gabriel Alonso', '40803879', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(66, 'Viviana Cecilia Chaparro', '26678286', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(67, 'Diego Sebastian Lopez', '41519117', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(68, 'Maria Andrea Belen Ibarlucea Campanini ', '31998204', 'directora de turismo el colorado', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(69, 'Evelin Elizabeth Bonilla', '32285027', 'directora de turismo pozo del tigre', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(70, 'Rolando David Pereira', '37044625', 'programador', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(71, 'Lina Griselda Galvan', '24713135', 'peluquera', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(72, 'Agustina Araceli Fernadnez', '37799674', 'Asistente viajers Turismo', 'Ausente', 1, 2, '2023-06-07 03:03:25'),
(73, 'Evelin Solange Leiva', '37588485', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(74, 'Leandra Ezequiel Augusto', '40627367', 'Policia', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(75, 'Marcelo Fabian Vizgarra', '30316752', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(76, 'Diego Sebastian Lopez', '41519117', 'Asistente en Turismo', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(77, 'Dina Magali Ramos', '406207935', 'Tec. Economia Social', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(78, 'Brenda Maria Elena Acosta', '42633851', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(79, 'Emilia Clarisa Krachinsky', '39606227', 'Empl.  Publicos', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(80, 'Maria de los Milagros Cortez Collar', '42805935', 'Policia', 'Presente', 1, 35, '2023-06-07 11:26:38'),
(81, 'VictoriaVanesa Gajan', '39902189', 'Profesora', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(82, 'Jose Luis Leon', '29296736', 'Empl. Publicos', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(83, 'Diana Elizabeth Villalba', '36017739', 'Tec. Publicidad', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(84, 'Roberto Leliur', '22192611', 'Empl. Publicos', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(85, 'Luisa Florentina Mora', '32264473', '', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(86, 'Natalia Valieri', '28445333', '', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(87, 'Alicia Noemi Diaz', '26211530', 'Agentes de Viajes', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(88, 'Monica Manuela Benitez', '25405288', 'empleada publica', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(89, 'Oscar Lisandro Chaves', '23667108', 'empleado publico', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(90, 'Geronimo de Jesus Colman', '30678323', 'guia de cheroga ', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(91, 'Lorena Fabiola Ruiz', '31746850', 'docente', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(92, 'Liz Maribel Ortellado', '42036070', '', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(93, 'Brian Max Gimenez ', '36955946', '', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(94, 'Analia Mazzo', '27349625', 'docente', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(95, 'Rocio Magalí Benitez', '37110173', 'lic. en turismo', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(96, 'Adolfo Castro', '32478707', 'Agentes de Viajes', 'Ausente', 1, 2, '2023-06-07 11:02:15'),
(97, 'Camila Janet Rojas', '40212184', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(98, 'Florencia Argüello', '41785381', 'estudiante', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(99, 'Pablo Lionel Monges', '22927112', 'Docente', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(100, 'Otto Federico Nenning', '29672527', 'contador publico', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(101, 'Silvana Cardozo', '29907772', 'veterinaria', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(102, 'Andrea Belen', '42758664', '', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(103, 'Camila Belen Ocampo', '43685737', '', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(104, 'Ramona Catalina Silva', '21866994', '', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(105, 'Sheila Alejandra Castaño', '41398435', '', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(106, 'Emmanuel Gaona', '39605435', '', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(107, 'Paniagua Andrea Belen', '4258664', '', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(108, 'Santiago Rodrigo Vazquez', '32519377', 'empleado publico reserva guaycilec', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(109, 'Rodrigo Baez', '38192110', 'tecnico en refrigeracion', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(110, 'Antonia del rosario Barrios', '43350967', 'tec. Op. Guaycolec', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(111, 'Nilda Carmen  Almirón', '23544840', 'neo', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(112, 'Roxana Soledad Gamarra', '37211484', '', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(113, 'Carlos Quinteros', '43887522', '', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(114, 'Luana Ailen Franco', '45467387', '', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(115, 'Miguel Luciano Leguizamon', '31945225', '', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(116, 'Laura Yanel Robles', '36956449', '', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(117, 'Mara Soledad Diez', '29450896', '', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(118, 'Fernando Daniel Chaile', '34594850', '', 'Ausente', 1, 2, '0000-00-00 00:00:00'),
(119, 'Agostina Magali Palacio', '40224258', 'casi abogada', 'Ausente', 1, 35, '2023-06-07 10:55:24');

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

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id_cursos`),
  ADD KEY `fk_localidad_cursos` (`rela_localidad_cursos`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id_cursos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD CONSTRAINT `fk_localidad_cursos` FOREIGN KEY (`rela_localidad_cursos`) REFERENCES `localidad` (`id_localidad`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
