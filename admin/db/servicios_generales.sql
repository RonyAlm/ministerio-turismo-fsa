-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-08-2022 a las 13:30:52
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
(35, 'Reserva de Biósfera Laguna Oca', '', 347, 6, 1, 7, 'La RB se encuentra dentro de la denominada planicie de inundación de los ríos Paraguay y Paraná. Esta área es una típica llanura aluvial regida por la acción de los ríos antes mencionados y está constituida por brazos meandrosos laterales del canal principal, lagunas\r\nEste mosaico de ecosistemas donde se mezclan comunidades acuáticas, riachos y esteros bordeados por bosques en galería, sabanas inundables, pastizales y palmares, que alberga una invalorable riqueza en su biodiversidad, constituye un singular macroecosistema que da origen a un paisaje de particular belleza y de gran valor ecológico y ambiental.\r\nEn la RB son característicos los bosques fluviales y las áreas deprimidas con amplio dominio de vegetación herbácea, muchas veces compartidas con especies de palma.\r\nLos bosques en galería constituyen el ecosistema de mayor riqueza florística de la región Chaqueña, con contribuciones que pertenecen al bosque fluvial, ejemplares del bosque leñoso de madera dura y las propias de la formación. Son estructuras generalmente densas, con abundante sotobosque y una gran abundancia de epífitas, lianas y orquídeas. A estos bosques se los considera como el límite de penetración de la Selva Paranaense.\r\nLa gran variedad de ambientes (bosques, esteros, bañados, sabanas, pastizales, lagos y ríos) hace que se presente en la región una notable cantidad y diversidad de fauna silvestre.', '2022-02-14 09:25:58'),
(36, 'Estadio Club 8 de Diciembre', 'Presidente del Club Roberto Mereles', 404, 6, 1, 8, 'alquier de espacios para carpas, esta el club 8 de Diciembre ( a 6 cuadras del predio del Pomelo)\r\nPor carpa $ 2.000 por día, paso el número de contacto del resp. en ese tema por cualquier consulta.\r\nEl club cuenta con baños, cuidador y policía para esos días, se cobra por carpa no por cantidad de personas.\r\nCONSULTAR POR RAMIREZ EZEQUIEL 3718521441', '2022-08-31 08:22:41');

--
-- Índices para tablas volcadas
--

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
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `servicios_generales`
--
ALTER TABLE `servicios_generales`
  MODIFY `id_servicios_generales` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `servicios_generales`
--
ALTER TABLE `servicios_generales`
  ADD CONSTRAINT `fk_servicios_direccion` FOREIGN KEY (`rela_direccion`) REFERENCES `direccion` (`id_direccion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_servicios_estacion` FOREIGN KEY (`rela_estacion`) REFERENCES `tipo_estacion` (`id_tipo_estacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_servicios_lugar` FOREIGN KEY (`rela_tipo_lugar`) REFERENCES `tipo_lugar` (`id_tipo_lugar`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tipo_servicios` FOREIGN KEY (`rela_tipo_servicio`) REFERENCES `tipo_de_servicio` (`id_tipo_servicio`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
