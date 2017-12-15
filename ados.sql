-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-12-2017 a las 01:42:26
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 7.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ados`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(50) NOT NULL,
  `tipoc` varchar(50) NOT NULL,
  `nombrec` varchar(50) NOT NULL,
  `apellidop` varchar(50) NOT NULL,
  `apellidom` varchar(50) NOT NULL,
  `telefono` int(50) NOT NULL,
  `domicilio` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `rfc` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `tipoc`, `nombrec`, `apellidop`, `apellidom`, `telefono`, `domicilio`, `email`, `rfc`) VALUES
(1, '', 'MODIFICADO', 'LALO', 'Loera', 951425638, 'av mexico', 'allas@jaja', 'lalskals989'),
(2, '', 'ATRES', 'Loera', 'Loera', 0, 'av mexico', 'allas@jaja', 'lalskals989'),
(3, '', 'CLIENTE1', 'JUAREZ', 'JUAREZ', 987987, 'COL CENTRO', 'rul130394@gmail.com', 'HAHDAHD9898'),
(4, 'Publico', 'Jose', 'Avila', 'ramirez', 98754689, 'Av mexico', 'rul13@jajaj.com', 'RLRLR98989DAD'),
(5, 'Publico', 'ROBERT', 'LEGAS', 'TORRES', 2147483647, 'ALBINO 60', 'aloatomp_231330@hotmail.com', '987415856353686'),
(6, 'publico', 'cruz', 'cruz', 'cruz', 49236565, 'av mexico', 'rul@utzac', 'RFLFL98798');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` int(50) NOT NULL,
  `usuario` varchar(10) NOT NULL,
  `contrasena` varchar(10) NOT NULL,
  `nombreem` varchar(50) NOT NULL,
  `apellp` varchar(50) NOT NULL,
  `apellm` varchar(50) NOT NULL,
  `token` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_empleado`, `usuario`, `contrasena`, `nombreem`, `apellp`, `apellm`, `token`) VALUES
(1, '', '', 'ATRES', 'Loera', 'Loera', '9c1185a5c5e9fc54612808977ee8f548b2258d31'),
(2, '', '', 'Ados', 'Legaspi', 'Rodriguez', ''),
(3, '', '', 'ATRES', 'Loera', 'Loera', ''),
(4, '', '', 'ATRES', 'Loera', 'Loera', ''),
(5, '', '', 'Raul', 'cucheeditado', 'Rodriguez', ''),
(6, '', '', 'RAUL', 'Legaspi', 'LEGASPI', ''),
(7, '', '', 'Ados', 'Arte', 'Publico', ''),
(8, '', '', 'Sonia', 'Rosas', 'Rosas', ''),
(9, '', '', 'ROgelio', 'Rojas', 'Rojas', ''),
(10, '', '', 'Joel', 'Lopez', 'Lopez', ''),
(11, '', '', 'SOLEDAD', 'SORIANO', 'SORIA', ''),
(12, 'ROBERTO', 'ROBERTO123', 'Roberto', 'Gael', 'LEGASPI', '3e22b9935809cfb065ef355628552a13d8977657'),
(13, '', '', 'victor', 'loera', 'loera', ''),
(14, 'HECTOR123', 'HECTOR123', 'HECTOR', 'LEGASPI', 'RODRIGUEZ', '8eef868dc26493c16275da6da13afe5728e2d659'),
(15, 'CISNEROS', 'CISNEROS12', 'JONATHAN', 'CISNEROS', 'CISNEROS', 'adb063bf2b69bf0755ecd5749c12cf0a77fac69b'),
(16, 'FIGUEROA12', 'FIGUEROA12', 'Jose', 'Rodriguez', 'Figueroa', ''),
(17, 'RLR130394', 'RLR130394', 'RAUL', 'LEGASPI', 'RODRIGUEZ', '3fc93ac8181d4cce2ceeee3d698e37e678185cff'),
(18, 'ALOALO', 'ALOALOALO', 'ALONDRA', 'TORRES', 'ESQUIVEL', 'f27ed3efc3b50e46575ecfa99a4487a5ef8c3fe2'),
(19, 'raul', 'raul', 'raul', 'raul', 'raul', 'b6c8083fa190a422ec3c407744f147146760093d'),
(20, 'BMIRANDA', '1234', 'BRAULIO', 'MIRANDA', 'MIRANDA', '112d43670c8603a7acdf2cb10b3c0eeeecc9561b'),
(21, 'CRUZ', 'CRUZ', 'CRUZ', 'CRUZ', 'CRUZ', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes`
--

CREATE TABLE `ordenes` (
  `id_orden` int(50) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time(6) NOT NULL,
  `pdf` mediumblob NOT NULL,
  `id_clien` int(50) NOT NULL,
  `id_emp` int(50) NOT NULL,
  `imagen` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ordenes`
--

INSERT INTO `ordenes` (`id_orden`, `fecha`, `hora`, `pdf`, `id_clien`, `id_emp`, `imagen`) VALUES
(1, '2017-11-08', '08:00:00.000000', '', 2, 3, '51.jpg'),
(2, '2017-11-08', '06:00:00.000000', '', 2, 1, ''),
(3, '2017-11-14', '10:00:00.000000', '', 2, 4, ''),
(4, '2017-11-22', '11:00:00.000000', '', 1, 1, ''),
(5, '2017-11-22', '04:00:00.000000', '', 3, 12, ''),
(6, '2017-11-30', '04:00:00.000000', '', 2, 2, '20171101_1345443.jpg'),
(7, '0000-00-00', '00:00:00.000000', '', 1, 1, ''),
(8, '0000-00-00', '00:00:00.000000', '', 1, 1, ''),
(9, '0000-00-00', '00:00:00.000000', '', 1, 1, ''),
(10, '0000-00-00', '00:00:00.000000', '', 1, 1, ''),
(11, '0000-00-00', '00:00:00.000000', '', 1, 1, ''),
(13, '0000-00-00', '00:00:00.000000', '', 1, 14, ''),
(14, '0000-00-00', '00:00:00.000000', '', 1, 14, ''),
(15, '0000-00-00', '00:00:00.000000', '', 3, 14, ''),
(16, '0000-00-00', '00:00:00.000000', '', 2, 14, ''),
(17, '0000-00-00', '00:00:00.000000', '', 4, 14, ''),
(18, '0000-00-00', '00:00:00.000000', '', 3, 14, ''),
(19, '0000-00-00', '00:00:00.000000', '', 3, 14, ''),
(20, '0000-00-00', '00:00:00.000000', '', 3, 14, ''),
(21, '0000-00-00', '00:00:00.000000', '', 4, 14, ''),
(22, '0000-00-00', '00:00:00.000000', '', 3, 14, ''),
(23, '0000-00-00', '00:00:00.000000', '', 3, 14, ''),
(24, '0000-00-00', '00:00:00.000000', '', 4, 14, ''),
(25, '0000-00-00', '00:00:00.000000', '', 4, 14, ''),
(26, '0000-00-00', '00:00:00.000000', '', 4, 14, ''),
(27, '0000-00-00', '00:00:00.000000', '', 4, 14, ''),
(28, '0000-00-00', '00:00:00.000000', '', 3, 14, ''),
(29, '0000-00-00', '00:00:00.000000', '', 3, 14, ''),
(30, '0000-00-00', '00:00:00.000000', '', 3, 14, ''),
(31, '0000-00-00', '00:00:00.000000', '', 2, 14, ''),
(32, '0000-00-00', '00:00:00.000000', '', 4, 14, ''),
(33, '0000-00-00', '00:00:00.000000', '', 3, 14, ''),
(34, '0000-00-00', '00:00:00.000000', '', 4, 14, ''),
(35, '0000-00-00', '00:00:00.000000', '', 4, 14, ''),
(36, '0000-00-00', '00:00:00.000000', '', 4, 14, ''),
(37, '0000-00-00', '00:00:00.000000', '', 3, 14, ''),
(38, '0000-00-00', '00:00:00.000000', '', 4, 14, ''),
(39, '0000-00-00', '00:00:00.000000', '', 3, 14, ''),
(40, '0000-00-00', '00:00:00.000000', '', 4, 14, ''),
(41, '0000-00-00', '00:00:00.000000', '', 3, 14, ''),
(42, '0000-00-00', '00:00:00.000000', '', 3, 14, ''),
(43, '0000-00-00', '00:00:00.000000', '', 3, 14, ''),
(44, '0000-00-00', '00:00:00.000000', '', 1, 14, ''),
(45, '0000-00-00', '00:00:00.000000', '', 1, 14, ''),
(46, '0000-00-00', '00:00:00.000000', '', 4, 14, ''),
(47, '0000-00-00', '00:00:00.000000', '', 5, 18, ''),
(48, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(49, '0000-00-00', '00:00:00.000000', '', 4, 14, ''),
(50, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(51, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(52, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(53, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(54, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(55, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(56, '0000-00-00', '00:00:00.000000', '', 5, 10, ''),
(57, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(58, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(59, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(60, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(61, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(62, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(63, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(64, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(65, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(66, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(67, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(68, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(69, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(70, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(71, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(72, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(73, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(74, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(75, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(76, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(77, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(78, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(79, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(80, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(81, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(82, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(83, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(84, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(85, '0000-00-00', '00:00:00.000000', '', 2, 14, ''),
(86, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(87, '0000-00-00', '00:00:00.000000', '', 3, 14, ''),
(88, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(89, '0000-00-00', '00:00:00.000000', '', 4, 14, ''),
(90, '0000-00-00', '00:00:00.000000', '', 2, 14, ''),
(91, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(92, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(93, '0000-00-00', '00:00:00.000000', '', 1, 14, ''),
(94, '0000-00-00', '00:00:00.000000', '', 4, 14, ''),
(95, '0000-00-00', '00:00:00.000000', '', 4, 14, ''),
(96, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(97, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(98, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(99, '0000-00-00', '00:00:00.000000', '', 5, 14, ''),
(100, '0000-00-00', '00:00:00.000000', '', 2, 14, ''),
(101, '0000-00-00', '00:00:00.000000', '', 3, 14, ''),
(102, '0000-00-00', '00:00:00.000000', '', 2, 14, ''),
(103, '0000-00-00', '00:00:00.000000', '', 2, 20, ''),
(104, '0000-00-00', '00:00:00.000000', '', 2, 2, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_prod`
--

CREATE TABLE `orden_prod` (
  `id_ordenprod` int(11) NOT NULL,
  `id_producto` int(50) NOT NULL,
  `id_orden` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `orden_prod`
--

INSERT INTO `orden_prod` (`id_ordenprod`, `id_producto`, `id_orden`) VALUES
(2, 2, 1),
(6, 3, 3),
(23, 2, 91),
(25, 3, 95),
(29, 3, 98),
(31, 2, 101),
(32, 3, 102),
(33, 3, 103),
(34, 2, 104);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(50) NOT NULL,
  `nombrep` varchar(50) NOT NULL,
  `precio` int(50) NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombrep`, `precio`, `tipo`) VALUES
(2, 'LONA', 90, 'IMPRESO A GRAN FORMATO'),
(3, 'Vinil', 90, 'Impreso a gran Formato'),
(4, 'BOND OFICIO', 87, '87');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vistatotal`
--
CREATE TABLE `vistatotal` (
`id_ordenprod` int(11)
,`fecha` date
,`hora` time(6)
,`nombrep` varchar(50)
,`precio` int(50)
,`tipo` varchar(50)
,`nombreem` varchar(50)
,`apellp` varchar(50)
,`apellm` varchar(50)
,`nombrec` varchar(50)
,`apellidop` varchar(50)
,`apellidom` varchar(50)
,`telefono` int(50)
,`domicilio` varchar(50)
,`email` varchar(50)
,`rfc` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vistatotal`
--
DROP TABLE IF EXISTS `vistatotal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vistatotal`  AS  select `orden_prod`.`id_ordenprod` AS `id_ordenprod`,`ordenes`.`fecha` AS `fecha`,`ordenes`.`hora` AS `hora`,`productos`.`nombrep` AS `nombrep`,`productos`.`precio` AS `precio`,`productos`.`tipo` AS `tipo`,`empleados`.`nombreem` AS `nombreem`,`empleados`.`apellp` AS `apellp`,`empleados`.`apellm` AS `apellm`,`clientes`.`nombrec` AS `nombrec`,`clientes`.`apellidop` AS `apellidop`,`clientes`.`apellidom` AS `apellidom`,`clientes`.`telefono` AS `telefono`,`clientes`.`domicilio` AS `domicilio`,`clientes`.`email` AS `email`,`clientes`.`rfc` AS `rfc` from ((((`orden_prod` join `productos` on((`orden_prod`.`id_producto` = `productos`.`id_producto`))) join `ordenes` on((`orden_prod`.`id_orden` = `ordenes`.`id_orden`))) join `clientes` on((`ordenes`.`id_clien` = `clientes`.`id_cliente`))) join `empleados` on((`ordenes`.`id_emp` = `empleados`.`id_empleado`))) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indices de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD PRIMARY KEY (`id_orden`),
  ADD KEY `id_clien` (`id_clien`),
  ADD KEY `id_emp` (`id_emp`);

--
-- Indices de la tabla `orden_prod`
--
ALTER TABLE `orden_prod`
  ADD PRIMARY KEY (`id_ordenprod`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_cliente` (`id_orden`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_empleado` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  MODIFY `id_orden` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;
--
-- AUTO_INCREMENT de la tabla `orden_prod`
--
ALTER TABLE `orden_prod`
  MODIFY `id_ordenprod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD CONSTRAINT `ordenes_ibfk_1` FOREIGN KEY (`id_clien`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ordenes_ibfk_2` FOREIGN KEY (`id_emp`) REFERENCES `empleados` (`id_empleado`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `orden_prod`
--
ALTER TABLE `orden_prod`
  ADD CONSTRAINT `orden_prod_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orden_prod_ibfk_2` FOREIGN KEY (`id_orden`) REFERENCES `ordenes` (`id_orden`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
