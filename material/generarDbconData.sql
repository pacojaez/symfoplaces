-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.7.24 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para symfoplaces
DROP DATABASE IF EXISTS `symfoplaces`;
CREATE DATABASE IF NOT EXISTS `symfoplaces` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `symfoplaces`;

-- Volcando estructura para tabla symfoplaces.comment
DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `place_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9474526CA76ED395` (`user_id`),
  KEY `IDX_9474526CDA6A219` (`place_id`),
  CONSTRAINT `FK_9474526CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_9474526CDA6A219` FOREIGN KEY (`place_id`) REFERENCES `place` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla symfoplaces.comment: ~13 rows (aproximadamente)
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` (`id`, `content`, `user_id`, `place_id`) VALUES
	(11, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint repellat qui dolor fugit eos quae alias est, totam nulla obcaecati earum a error veniam magnam quaerat numquam perferendis harum libero!', 3, 4),
	(12, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint repellat qui dolor fugit eos quae alias est, totam nulla obcaecati earum a error veniam magnam quaerat numquam perferendis harum libero!', 3, 4),
	(13, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint repellat qui dolor fugit eos quae alias est, totam nulla obcaecati earum a error veniam magnam quaerat numquam perferendis harum libero!', 3, 4),
	(14, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint repellat qui dolor fugit eos quae alias est, totam nulla obcaecati earum a error veniam magnam quaerat numquam perferendis harum libero!', 3, 4),
	(15, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint repellat qui dolor fugit eos quae alias est, totam nulla obcaecati earum a error veniam magnam quaerat numquam perferendis harum libero!', 3, 4),
	(16, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint repellat qui dolor fugit eos quae alias est, totam nulla obcaecati earum a error veniam magnam quaerat numquam perferendis harum libero!', 3, 2),
	(17, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint repellat qui dolor fugit eos quae alias est, totam nulla obcaecati earum a error veniam magnam quaerat numquam perferendis harum libero!', 3, 2),
	(18, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint repellat qui dolor fugit eos quae alias est, totam nulla obcaecati earum a error veniam magnam quaerat numquam perferendis harum libero!', 3, 2),
	(22, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint repellat qui dolor fugit eos quae alias est, totam nulla obcaecati earum a error veniam magnam quaerat numquam perferendis harum libero!', 2, 2),
	(23, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint repellat qui dolor fugit eos quae alias est, totam nulla obcaecati earum a error veniam magnam quaerat numquam perferendis harum libero!', 2, 2),
	(24, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint repellat qui dolor fugit eos quae alias est, totam nulla obcaecati earum a error veniam magnam quaerat numquam perferendis harum libero!', 2, 4),
	(25, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint repellat qui dolor fugit eos quae alias est, totam nulla obcaecati earum a error veniam magnam quaerat numquam perferendis harum libero!', 2, 4),
	(26, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint repellat qui dolor fugit eos quae alias est, totam nulla obcaecati earum a error veniam magnam quaerat numquam perferendis harum libero!', 2, 4);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;

-- Volcando estructura para tabla symfoplaces.doctrine_migration_versions
DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla symfoplaces.doctrine_migration_versions: ~15 rows (aproximadamente)
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
	('DoctrineMigrations\\Version20211201101508', '2021-12-03 14:33:21', 118),
	('DoctrineMigrations\\Version20211201102129', '2021-12-03 14:33:21', 65),
	('DoctrineMigrations\\Version20211201102741', '2021-12-03 14:33:21', 23),
	('DoctrineMigrations\\Version20211201103042', '2021-12-03 14:33:21', 21),
	('DoctrineMigrations\\Version20211201104140', '2021-12-03 14:33:21', 88),
	('DoctrineMigrations\\Version20211201104315', '2021-12-03 14:33:21', 87),
	('DoctrineMigrations\\Version20211201104420', '2021-12-03 14:33:21', 83),
	('DoctrineMigrations\\Version20211201104657', '2021-12-03 14:33:21', 86),
	('DoctrineMigrations\\Version20211202074128', '2021-12-03 14:33:22', 32),
	('DoctrineMigrations\\Version20211202074228', '2021-12-03 14:33:22', 31),
	('DoctrineMigrations\\Version20211202085924', '2021-12-03 14:33:22', 31),
	('DoctrineMigrations\\Version20211202103904', '2021-12-03 14:33:22', 53),
	('DoctrineMigrations\\Version20211202110217', '2021-12-03 14:33:22', 31),
	('DoctrineMigrations\\Version20211203075000', '2021-12-03 14:33:22', 63),
	('DoctrineMigrations\\Version20211209102651', '2021-12-10 16:15:51', 94);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;

-- Volcando estructura para tabla symfoplaces.photo
DROP TABLE IF EXISTS `photo`;
CREATE TABLE IF NOT EXISTS `photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `place_id` int(11) NOT NULL,
  `ruta` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_14B78418DA6A219` (`place_id`),
  CONSTRAINT `FK_14B78418DA6A219` FOREIGN KEY (`place_id`) REFERENCES `place` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla symfoplaces.photo: ~61 rows (aproximadamente)
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` (`id`, `title`, `description`, `place_id`, `ruta`) VALUES
	(19, 'Interior', NULL, 8, '61b8592509325.jpg'),
	(20, 'Interior', NULL, 8, '61b85938bd9cc.jpg'),
	(21, 'Interior', NULL, 8, '61b85947f1860.jpg'),
	(22, 'Interior', NULL, 8, '61b85957ea73f.jpg'),
	(23, 'Exterior', NULL, 8, '61b8596a4e002.jpg'),
	(24, 'Puente', NULL, 9, '61b85a640b4b5.jpg'),
	(26, 'Puente', NULL, 9, '61b85a857705c.jpg'),
	(27, 'Puente', NULL, 9, '61b85a93e1848.jpg'),
	(28, 'Molinos', NULL, 10, '61b85ae16dd1d.jpg'),
	(29, 'Molinos', NULL, 10, '61b85aeb975a1.jpg'),
	(30, 'Molinos', NULL, 10, '61b85af43244a.jpg'),
	(31, 'Molinos', NULL, 10, '61b85b05ec8ac.jpg'),
	(32, 'Molinos', NULL, 10, '61b85b0e73619.jpg'),
	(33, 'Dehesa', NULL, 11, '61b85b5e13f27.jpg'),
	(34, 'Dehesa', NULL, 11, '61b85b6917e5e.jpg'),
	(35, 'Dehesa', NULL, 11, '61b85b751c804.jpg'),
	(36, 'Dehesa', NULL, 11, '61b85b7defd0c.jpg'),
	(37, 'Dehesa', NULL, 11, '61b85b8885280.jpg'),
	(38, 'Dehesa', NULL, 11, '61b85b934b9f5.jpg'),
	(39, 'Dehesa', NULL, 11, '61b85ba024203.jpg'),
	(40, 'Delta', NULL, 12, '61b85be670031.jpg'),
	(41, 'Delta', NULL, 12, '61b85bf02095e.jpg'),
	(42, 'Delta', NULL, 12, '61b85bf91464d.jpg'),
	(43, 'Delta', NULL, 12, '61b85c0155b7f.jpg'),
	(44, 'Delta', NULL, 12, '61b85c0d6471b.jpg'),
	(45, 'Delta', NULL, 12, '61b85c18a0f02.jpg'),
	(46, 'Delta', NULL, 12, '61b85c2317174.jpg'),
	(47, 'Laguna de Gallocanta', NULL, 13, '61b85c77905e3.jpg'),
	(48, 'Laguna de Gallocanta', NULL, 13, '61b85c7f18d68.jpg'),
	(49, 'Laguna de Gallocanta', NULL, 13, '61b85c871dbc3.jpg'),
	(50, 'Laguna de Gallocanta', NULL, 13, '61b85c90979da.jpg'),
	(51, 'Laguna de Gallocanta', NULL, 13, '61b85c9a2e0e9.jpg'),
	(52, 'Laguna de Gallocanta', NULL, 13, '61b85ca3bae71.jpg'),
	(53, 'Laguna de Gallocanta', NULL, 13, '61b85cad72d5c.jpg'),
	(54, 'Catedral León', NULL, 14, '61b85ce5ab97d.jpg'),
	(55, 'Teatro romano', NULL, 15, '61b85d53ee8cb.jpg'),
	(56, 'Teatro romano', NULL, 15, '61b85d5eb66cf.jpg'),
	(57, 'Puerto de Navafría', NULL, 16, '61b85da708b10.jpg'),
	(58, 'Puerto de Navafría', NULL, 16, '61b85db27079b.jpg'),
	(59, 'Puerto de Navafría', NULL, 16, '61b85dc348979.jpg'),
	(60, 'Puerto de Navafría', NULL, 16, '61b85dcc8e328.jpg'),
	(61, 'Puerto de Navafría', NULL, 16, '61b85dd90a766.jpg'),
	(62, 'Oporto', NULL, 17, '61b85e4148019.jpg'),
	(63, 'Oporto', NULL, 17, '61b85e4c7318b.jpg'),
	(64, 'Oporto', NULL, 17, '61b85e53a8b01.jpg'),
	(65, 'Oporto', NULL, 17, '61b85e5cae7ec.jpg'),
	(66, 'Oporto', NULL, 17, '61b85e6498d8e.jpg'),
	(67, 'Oporto', NULL, 17, '61b85e6be4cbd.jpg'),
	(68, 'Oporto', NULL, 17, '61b85e735f695.jpg'),
	(69, 'Amanecer', NULL, 18, '61b85f3b31b83.jpg'),
	(70, 'Amanecer', NULL, 18, '61b85f49416e5.jpg'),
	(71, 'Amanecer', NULL, 18, '61b85f51b5a58.jpg'),
	(72, 'Amanecer', NULL, 18, '61b85f5aebc0d.jpg'),
	(73, 'Amanecer', NULL, 18, '61b85f6222d20.jpg'),
	(74, 'Amanecer', NULL, 18, '61b85f6d717a7.jpg'),
	(75, 'Catedral', NULL, 19, '61b85fee67ad2.jpg'),
	(77, 'Catedral', NULL, 19, '61b8600601666.jpg'),
	(78, 'Calle', NULL, 19, '61b8600f3854b.jpg'),
	(79, 'Cataratas', NULL, 20, '61b860c094d49.jpg'),
	(80, 'Cataratas', NULL, 20, '61b860cd6f79c.jpg'),
	(81, 'Cataratas', NULL, 20, '61b860d68f776.jpg');
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;

-- Volcando estructura para tabla symfoplaces.place
DROP TABLE IF EXISTS `place`;
CREATE TABLE IF NOT EXISTS `place` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text` longtext COLLATE utf8_unicode_ci,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `valoration` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_741D53CDA76ED395` (`user_id`),
  CONSTRAINT `FK_741D53CDA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla symfoplaces.place: ~15 rows (aproximadamente)
/*!40000 ALTER TABLE `place` DISABLE KEYS */;
INSERT INTO `place` (`id`, `titulo`, `country`, `city`, `text`, `type`, `valoration`, `user_id`, `created_at`) VALUES
	(2, 'Carcassone', 'Francia', 'Carcassone', 'La ciudad es conocida por su ciudadela amurallada, un conjunto arquitectónico medieval restaurado por Eugène Viollet-le-Duc en el siglo XIX y declarada en 1997 Patrimonio de la Humanidad por la Unesco.', 'Ciudad Amurallada', 3, 3, '2021-12-03 15:15:33'),
	(4, 'Cala San Frances', 'España', 'Lloret de Mar', 'Blanes es un municipio español de la comarca de La Selva en la provincia de Gerona, en la comunidad autónoma de Cataluña. Situado en la costa gerundense. Es el primer pueblo de la Costa Brava, por lo que es conocido como el "Portal de la Costa Brava". En tiempos romanos se la denominaba Blanda o Blandae.', 'Cala', 4, 3, '2021-12-03 15:20:40'),
	(8, 'Sagrada Familia', 'España', 'Barcelona', 'no descr', 'Catedral', 5, 4, '2021-12-13 16:02:42'),
	(9, 'Besalú', 'España', 'Besalú', 'El origen de la ciudad fue el castillo de Besalú que ya se encuentra documentado en el siglo x, construido encima de un cerro donde están los restos de la canónica de Santa María, en la Alta Edad Media. El trazado actual de la villa no responde fielmente a su estado original pero sí que posibilita a grandes rasgos la lectura de la urbanización de la Edad Media con la existencia de importantes edificios: el puente, los baños judíos, la iglesia del monasterio de San Pedro de Besalú y San Julián, antiguo hospital de peregrinos, la casa Cornellá, la iglesia de San Vicente y la sala gótica del Palacio de la Curia Real.\r\n\r\nBesalú deja ver una estructura arquitectónica y urbanística bastante coherente con el pasado medieval. La importancia monumental de Besalú viene dada fundamentalmente por su gran valor de conjunto, por su unidad, que la determina como una de las muestras más importantes y singulares de los conjuntos medievales de Cataluña.', 'Ciudad Amurallada', 4, 7, '2021-12-14 08:47:57'),
	(10, 'Consuegra', 'España', 'Consuegra', 'Sobre el monte Calderico se asentaron en el siglo VI a. C. los primeros pueblos carpetanos, dada su importancia estratégica para la transhumancia.\r\n\r\nCon las guerras púnicas se produce la conquista y asentamiento de una ciudad romana (la antigua Consaburum nombrada por Plinio), a los pies del Cerro Calderico, al ser abandonado el poblado situado sobre este. Consuegra alcanzó un gran desarrollo, siendo la principal ciudad de la Carpetania, un punto clave en los caminos hacia el norte y el sur. Se construyeron puentes, vías, una presa, un acueducto y un circo. Consuegra es citada por autores clásicos como Tito Livio o Ptolomeo. Por ella discurría la calzada romana llamada "Vía Laminium".\r\n\r\nLa mayoría de la población hispana y goda permaneció con la llegada de los árabes. El castillo se remonta a esta época. En el año 1085 cae Toledo ante Alfonso VI. Parece que Consuegra había pasado a manos de Castilla en 1083. En el año 1097 moría en la batalla de Consuegra el hijo de El Cid Campeador, Diego. En esta batalla, los ejércitos de Castilla mandados por el rey Alfonso VI, fueron vencidos por los almorávides al mando de Yusuf ibn Tasufin, cambiando de nuevo de manos. Fue reconquistada posteriormente por los cristianos.\r\n\r\nEn 1150 Alfonso VII entregó a su vasallo Rodrigo Rodríguez el castillo. En 1183 la población, junto a su alfoz, fue donada por Alfonso VIII, con la aprobación del papa Lucio III a la Soberana Orden del Hospital de San Juan de Jerusalén (Orden de Malta), que nombró a Consuegra cabeza del Gran Priorato de Castilla y León, en La Mancha, tomando el castillo como sede, y otorgándola el Fuero de Consuegra, copia del de Cuenca. Destacó en esta época bajo su tutela la defensa tras la batalla de Alarcos en 1195. Con la Batalla de las Navas de Tolosa, en 1212, se estabilizó finalmente la zona.', 'Ciudad', 4, 7, '2021-12-14 08:50:26'),
	(11, 'Dehesa', 'España', 'Cáceres', 'La dehesa (en portugués, montado) es un bosque formado por encinas, alcornoques u otras especies, con estrato inferior de pastizales o matorrales, donde la actividad del ser humano ha sido intensa en prácticamente la totalidad del bosque y generalmente están destinados al mantenimiento del ganado, a la actividad cinegética y al aprovechamiento de otros productos forestales (leñas, corcho, setas, etcétera).\r\n\r\nEs un ejemplo típico de sistema agrosilvopastoral y típico de la zona occidental de la península ibérica', 'Paraje Natural', 4, 7, '2021-12-14 08:52:33'),
	(12, 'Delta del Ebro', 'España', 'Tarragona', 'El Parque Natural del Delta del Ebro (en catalán, y de forma oficial, Parc natural del Delta del Ebre) es un espacio natural protegido español situado en la desembocadura del río Ebro, en la provincia de Tarragona, Cataluña, entre las comarcas del Bajo Ebro y del Montsiá. Fue declarado parque natural en agosto de 1983 y ampliado en 1986. Actualmente cuenta con una extensión de 7736 ha (3979 ha en el hemidelta derecho y 3757 ha en el izquierdo). Es zona ZEPA, espacio del Convenio de Ramsar y forma parte de la Reserva de la biosfera de las Tierras del Ebro.', 'Paraje Natural', 4, 7, '2021-12-14 08:54:46'),
	(13, 'Gallocanta', 'España', 'Gallocanta', 'La laguna de Gallocanta se encuentra en medio del Sistema Ibérico, en una planicie a 1000 msnm. Tiene un área de 14,4 km², con una anchura máxima de 2,8 km por 7,7 km de largo. Con una capacidad máxima de 5 hm³, la profundidad de sus aguas suele ser de 45-50 cm, aunque en época de aguas altas puede llegar hasta los 2 m.\r\n\r\nSe trata de un humedal único en España debido a su riqueza biológica y a su capacidad para albergar gran cantidad de aves.\r\n\r\nSu localización estratégica hace que cada año aves como patos buceadores y fochas utilicen la laguna como punto de invernada, como localidad de paso o se establezcan para la cría.\r\n\r\nAdemás, cada año la laguna de Gallocanta se convierte en un punto estratégico para las grandes concentraciones de grullas comunes que emigran en invierno hacia latitudes más cálidas. Situación favorecida por la disponibilidad de hábitat y por los recursos alimenticios que este humedal brinda a sus huéspedes zancudos y que ha convertido a la laguna de Gallocanta en uno de los enclaves españoles más importante para la grulla común.', 'Paraje Natural', 4, 7, '2021-12-14 08:57:09'),
	(14, 'Catedral de León', 'España', 'León', 'La catedral de Santa María de Regla de León es un templo de culto católico, sede episcopal de la diócesis de León, España, consagrada bajo la advocación de la Virgen María. Fue el primer monumento declarado en España mediante Real Orden de 28 de agosto del año 1844 (confirmada por Real Orden el 24 de septiembre del año 1845).\r\n\r\nIniciada en el siglo xiii, es una de las grandes obras del estilo gótico, de influencia francesa. Conocida con el sobrenombre de Pulchra leonina, que significa ‘Bella Leonesa’, se encuentra en pleno Camino de Santiago.3​\r\n\r\nLa catedral de León se conoce sobre todo por llevar al extremo la «desmaterialización» del arte gótico, es decir, la reducción de los muros a su mínima expresión para ser sustituidos por vitrales coloreados, constituyendo una de las mayores colecciones de vidrieras medievales del mundo.', 'Catedral', 5, 7, '2021-12-14 08:59:03'),
	(15, 'Mérida', 'España', 'Mérida', 'El teatro romano de Mérida  es un teatro histórico levantado por la Antigua Roma en la colonia Augusta Emerita, actual Mérida (España). Su creación fue promovida por el cónsul Marco Vipsanio Agripa y, según una fecha inscrita en el propio teatro, su inauguración se produjo hacia los años 16-15 a. C. «Príncipe entre los monumentos emeritenses», como lo denominó el arquitecto José Menéndez-Pidal,1​ el teatro es Patrimonio de la Humanidad desde 1993 como parte del conjunto arqueológico de Mérida.\r\n\r\nEl teatro ha sufrido varias remodelaciones, la más importante durante el siglo I d. C., cuando se levantó el frente escénico actual, y otra en época de Constantino I, entre los años 333 y 337. El teatro fue abandonado en el siglo IV d. C. tras la oficialización en el Imperio romano de la religión cristiana, que consideraba inmorales las representaciones teatrales. Demolido parcialmente y cubierto de tierra, durante siglos la única parte visible del edificio fueron las gradas superiores, bautizadas por los emeritenses como «Las Siete Sillas». Las excavaciones arqueológicas en el teatro comenzaron en 1910 y su reconstrucción parcial en 1962. Desde 1933 alberga la celebración del Festival Internacional de Teatro Clásico de Mérida.', 'Monumento Romano', 5, 7, '2021-12-14 09:00:53'),
	(16, 'Navafría', 'España', 'Madrid', 'El puerto de Navafría es un paso de montaña situado en la Sierra de Guadarrama (perteneciente al Sistema Central) y en el límite entre la Comunidad de Madrid y la provincia de Segovia (España). Por él pasa una carretera regional que comunica el municipio de Lozoya (Comunidad de Madrid) con el de Navafría (provincia de Segovia). La vertiente norte de la carretera transcurre por el término municipal de Aldealengua de Pedraza. Este puerto de montaña tiene una altura de 1773 msnm y desde él salen varios caminos que conducen al entorno del pico de El Nevero. El puerto de Navafría es el único que comunica directamente el valle del Lozoya con la provincia de Segovia y el único situado enteramente en los Montes Carpetanos. En este puerto está el Centro de esquí nórdico Navafría.', 'Paraje Natural', 3, 7, '2021-12-14 09:02:08'),
	(17, 'Oporto', 'Portugal', 'Oporto', 'Oporto es la segunda ciudad más poblada de Portugal, después de Lisboa. Tenía 297 559 habitantes en el año 2011. Su densidad de población es de 5560 habitantes/km².1​ Contornan el núcleo central de la ciudad de Oporto la subregión de Gran Oporto y, de manera más amplia, el Área Metropolitana de Oporto, que forma su área metropolitana de 2 959 045 habitantes.[cita requerida] Se encuentra en el norte del país, en la ribera derecha del Duero en su desembocadura en el océano Atlántico. Es sede del distrito homónimo, en la Región Norte de Portugal.\r\n\r\nLa leyenda cuenta que Cale era el nombre de uno de los argonautas griegos, que llegó hasta aquí en un viaje que hizo y en el que fundó un enclave comercial.[cita requerida]\r\n\r\nSe sabe que Cale era un pequeño asentamiento que ya conocían los griegos situado en la orilla izquierda del Duero, cerca de su desembocadura; tenía muy malas condiciones para la navegación por lo que los romanos trasladaron la ciudad a un lugar de mejores condiciones donde se pudiera construir un puerto. Durante las invasiones bárbaras, Cale pasaría a control suevo.\r\n\r\nHacia el 417 los alanos invadieron el territorio de los suevos, empujándolos hasta la orilla derecha del Duero donde hoy se sitúa Oporto. Los alanos, sin embargo, no llegarían a conquistar la villa. Hermerico I, el rey suevo, fortificó un castillo en la colina de Pena Ventosa, construyendo en su interior viviendas para las tropas. A este burgo se le llamó Cale Castrum Novum (castillo nuevo de Cale) adquiriendo la denominación de civitas. En la base de esa colina se situaba Portus Cale (puerto de Cale, actual Ribeira), que dio origen al nombre Portucale, que pasaría a designar también a la ciudad alta a partir de finales del s. v d. C.. Otro castillo, situado en la orilla de Vila Nova de Gaia, quedó como defensa avanzada de Cale. Ambos castillos figuran desde hace siglos en el escudo de armas de Oporto, situados a los lados de la Virgen María, protectora del burgo desde siempre y razón por la que la ciudad también es conocida en Portugal como: «ciudad de la Virgen».\r\n\r\nTras la conquista musulmana de la península ibérica, Oporto fue reconquistada y poblada por la nobleza y puebla gallega desde 868. En esta región fue establecido el Condado Portucalense que perteneció al Reino de Léon hasta independizarse, dando lugar al Reino de Portugal en 1139. Dicho condado se extendía desde el Miño hasta el Duero. Alfonso VI otorgó este condado a su hija bastarda Teresa, casada con Enrique de Borgoña. El hijo de ambos fue el primer rey independiente de Portugal, Alfonso Henríques.', 'Ciudad', 3, 7, '2021-12-14 09:04:52'),
	(18, 'Roca Grossa', 'España', 'Calella', NULL, 'Paraje Natural', 3, 7, '2021-12-14 09:09:01'),
	(19, 'Santiago de Compostela', 'España', 'Santiago de Compostela', 'La Santa Apostólica y Metropolitana Iglesia Catedral de Santiago de Compostela es un templo de culto católico situado en la ciudad homónima, en el centro de la provincia de La Coruña, en Galicia (España). Acoge el que, según la tradición, es el sepulcro del Apóstol Santiago, lo cual convirtió al templo en uno de los principales destinos de peregrinación de Europa durante la Edad Media a través del llamado Camino de Santiago, una ruta religiosa que comunicaba la península ibérica con el resto del continente. Esto fue determinante para que los reinos hispánicos medievales participaran en los movimientos culturales de la época; en la actualidad sigue siendo un importante destino de peregrinación. Un privilegio concedido en 1122 por el papa Calixto II declaró que serían «Año Santo» o «Año Jubilar» en Compostela todos los años en que el día 25 de julio, día de Santiago, coincidieran en domingo; este privilegio fue confirmado por el papa Alejandro III en su bula Regis aeterni en 1179.\r\n\r\nFue declarada Bien de Interés Cultural en 1896 y la ciudad vieja de Santiago de Compostela, que se concentra en torno a la catedral, fue declarada bien cultural Patrimonio de la Humanidad por la Unesco en 1985.\r\n\r\nEn 2015, en la aprobación por la Unesco de la ampliación del Camino de Santiago en España a «Caminos de Santiago de Compostela: Camino francés y Caminos del Norte de España», fue incluido como uno de los bienes individuales (n.º ref. 669bis-010).4', 'Catedral', 5, 7, '2021-12-14 09:11:58'),
	(20, 'Cataratas del Iguazú', 'Argentina', 'Iguazú', 'Las cataratas del Iguazú (en portugués: cataratas do Iguaçu), llamadas popularmente en Argentina como «Las Cataratas» o «Las Cataratas del Iguazú», son un conjunto de cataratas que se localizan sobre el río Iguazú, en el límite entre la provincia argentina de Misiones y el estado brasileño de Paraná. Están totalmente insertadas en áreas protegidas; el sector de la Argentina se encuentra dentro del parque nacional Iguazú, mientras que el de Brasil se encuentra en el parque nacional do Iguaçu. Fueron elegidas como una de las «Siete maravillas naturales del mundo».\r\n\r\nEstán formadas por 275 saltos, el 80 % de ellos se ubican del lado argentino. Un espectáculo aparte es su salto de mayor caudal y, con 80 m, también el más alto: la Garganta del Diablo, el cual se puede disfrutar en toda su majestuosidad desde solo 50 m, recorriendo las pasarelas que parten desde Puerto Canoas, al que se llega utilizando el servicio de trenes ecológicos. Por este salto pasa la frontera entre ambos países. Se pueden realizar paseos en lancha bajo los saltos y caminatas por senderos apreciando algunos animales de la selva semitropical perteneciente al distrito fitogeográfico de las selvas mixtas de la provincia fitogeográfica paranaense.', 'Paraje Natural', 4, 7, '2021-12-14 09:15:25');
/*!40000 ALTER TABLE `place` ENABLE KEYS */;

-- Volcando estructura para tabla symfoplaces.reset_password_request
DROP TABLE IF EXISTS `reset_password_request`;
CREATE TABLE IF NOT EXISTS `reset_password_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `selector` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `hashed_token` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_7CE748AA76ED395` (`user_id`),
  CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla symfoplaces.reset_password_request: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `reset_password_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `reset_password_request` ENABLE KEYS */;

-- Volcando estructura para tabla symfoplaces.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla symfoplaces.user: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `name`, `email`, `country`, `avatar`, `roles`, `password`, `city`, `created_at`, `is_verified`, `phone`) VALUES
	(1, 'Admin', 'admin@symfoplaces.com', 'España', NULL, '["ROLE_ADMIN"]', '$2y$13$NsSJ8P4SNVgdQxBFqaALYuIt4kEIJDOfHgVZ99vWjF4XDXajQSoca', 'terrassa', NULL, 1, NULL),
	(2, 'Editor', 'editor@symfoplaces.com', 'España', NULL, '["ROLE_EDITOR"]', '$2y$13$lRojSE21y5TXEHMzuyQTSeCSUKMN6bfheHY58W/AN2g37SwJLQwvy', 'terrassa', NULL, 1, NULL),
	(3, 'Usuario', 'usuario@symfoplaces.com', 'España', NULL, '["ROLE_USUARIO"]', '$2y$13$Fu1fTnU4OILUwtXUX2ex1uUMd7gRd8Bu7aYhFO2eTaZXQin7UenvK', 'terrassa', NULL, 1, NULL),
	(4, 'Paco Jaez', 'pacojaez2@gmail.com', 'España', NULL, '["ROLE_ADMIN"]', '$2y$13$VU6gOr9JIE29EIVk6wDnpuVcEHR83ZVE.eEgwP6O6CYaoqbEPhzWi', 'terrassa', NULL, 1, NULL),
	(5, 'Paco Jaez', 'pacojaez33@gmail.com', 'España', NULL, '[]', '$2y$13$evEK.BvvdSaqw0hmn5y5ou6Hyn/2sJbqiOV94zo/qwzk/lX7NGIOa', 'terrassa', NULL, 0, '656556565'),
	(6, 'Paco Jaez', 'pacojaez222@gmail.com', 'España', NULL, '["ROLE_ADMIN"]', '$2y$13$PRiWAloiyPa/qpziXlRgaOowKmFnpWk/sjv0aZB1gPY0I/GKahOVS', 'Terrassa', NULL, 1, '656556565'),
	(7, 'Paco Jaez', 'pacojaez@gmail.com', 'España', NULL, '["ROLE_ADMIN"]', '$2y$13$i0vBnx/RYeoujyGj2Q/8husThCtm/lJJInDKOGsX7ZZQTO..fsrI.', 'terrassa', NULL, 1, '656556565');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
