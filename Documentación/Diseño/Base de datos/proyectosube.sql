-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-05-2018 a las 06:50:54
-- Versión del servidor: 10.1.32-MariaDB
-- Versión de PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyectosube`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `beneficio`
--

CREATE TABLE `beneficio` (
  `idBeneficio` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `valor` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boletocolectivo`
--

CREATE TABLE `boletocolectivo` (
  `idBoletoColectivo` int(11) NOT NULL,
  `idLineaColectivo` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `precioFinal` float NOT NULL,
  `idTarifaColectivo` int(11) NOT NULL,
  `idViaje` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boletosubte`
--

CREATE TABLE `boletosubte` (
  `idBoletoSubte` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `precio` float NOT NULL,
  `idTarifaSubte` int(11) NOT NULL,
  `idEstacionSubte` int(11) NOT NULL,
  `idViaje` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boletotren`
--

CREATE TABLE `boletotren` (
  `idBoletoTren` int(11) NOT NULL,
  `idEstacionSubida` int(11) NOT NULL,
  `idEstacionBajada` int(11) DEFAULT NULL,
  `idTarifaTren` int(11) NOT NULL,
  `precioFinal` float NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `idViaje` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descuento`
--

CREATE TABLE `descuento` (
  `idDescuento` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `porcentaje` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estacionsubte`
--

CREATE TABLE `estacionsubte` (
  `idEstacionSubte` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `lineaSubte_idLineaSubte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estacionsubte`
--

INSERT INTO `estacionsubte` (`idEstacionSubte`, `nombre`, `lineaSubte_idLineaSubte`) VALUES
(1, 'Bolivar', 1),
(2, 'Perú', 1),
(3, 'Piedras', 1),
(4, 'Av. de Mayo', 1),
(5, 'Lima', 1),
(6, 'Sáenz Peña', 1),
(7, 'Congreso', 1),
(8, 'Pasco', 1),
(9, 'Alberti', 1),
(10, 'Plaza Miserere', 1),
(11, 'Loria', 1),
(12, 'Castro Barros', 1),
(13, 'Río de Janeiro', 1),
(14, 'Acoyte', 1),
(15, 'Primera Junta', 1),
(16, 'Puan', 1),
(17, 'Carabobo', 1),
(18, 'San José de Flores', 1),
(19, 'San Pedrito', 1),
(20, 'Leandro N. Alem', 2),
(21, 'Florida', 2),
(22, 'Carlos Pellegrini', 2),
(23, 'Uruguay', 2),
(24, 'Callao', 2),
(25, 'Pasteur Amia', 2),
(26, 'Pueyrredón', 2),
(27, 'Carlos Gardel', 2),
(28, 'Medrano', 2),
(29, 'Ángel Gallardo', 2),
(30, 'Malabia O. Pugliese', 2),
(31, 'Dorrego', 2),
(32, 'F. Lacroze', 2),
(33, 'Tronador Villa Ortúzar', 2),
(34, 'De los Incas Parque Chas', 2),
(35, 'Echeverría', 2),
(36, 'Juan Manuel de Rosas Villa Urquiza', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estaciontren`
--

CREATE TABLE `estaciontren` (
  `idEstacionTren` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estaciontren`
--

INSERT INTO `estaciontren` (`idEstacionTren`, `nombre`) VALUES
(1, 'Pza. Constitución'),
(2, 'Hipólito Yrigoyen'),
(3, 'D. Santillán Y M. Kosteki'),
(4, 'Gerli'),
(5, 'Lanús'),
(6, 'Remedios de Escalada'),
(7, 'Banfield'),
(8, 'Lomas de Zamora'),
(9, 'Temperley'),
(10, 'Adrogué'),
(11, 'Burzaco'),
(12, 'Longchamps'),
(13, 'Glew'),
(14, 'Guernica'),
(15, 'Alejandro Korn'),
(16, 'Turdera'),
(17, 'Lavallol'),
(18, 'Luis Guillón'),
(19, 'Monte Grande'),
(20, 'El Jagüel'),
(21, 'Ezeiza');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineacolectivo`
--

CREATE TABLE `lineacolectivo` (
  `idLineaColectivo` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `lineacolectivo`
--

INSERT INTO `lineacolectivo` (`idLineaColectivo`, `nombre`) VALUES
(1, '160'),
(2, '74'),
(3, '79');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineasubte`
--

CREATE TABLE `lineasubte` (
  `idLineaSubte` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `lineasubte`
--

INSERT INTO `lineasubte` (`idLineaSubte`, `nombre`) VALUES
(1, 'A'),
(2, 'B'),
(3, 'C');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineatren`
--

CREATE TABLE `lineatren` (
  `idLineaTren` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `lineatren`
--

INSERT INTO `lineatren` (`idLineaTren`, `nombre`) VALUES
(4, 'Roca');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento`
--

CREATE TABLE `movimiento` (
  `idMovimiento` int(11) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `fechaHora` date DEFAULT NULL,
  `medio` varchar(45) DEFAULT NULL,
  `detalle` varchar(45) DEFAULT NULL,
  `valor` varchar(45) NOT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ramaltren`
--

CREATE TABLE `ramaltren` (
  `idRamalTren` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `idLineaTren` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ramaltren`
--

INSERT INTO `ramaltren` (`idRamalTren`, `nombre`, `idLineaTren`) VALUES
(1, 'Pza. Constitución - La Plata', 4),
(2, 'Pza. Constitución - Glew/A. Korn', 4),
(3, 'Pza. Constitución - Ezeiza/Cañuelas', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ramal_tiene_estacion`
--

CREATE TABLE `ramal_tiene_estacion` (
  `idRamalEstacionTren` int(11) NOT NULL,
  `idRamalTren` int(11) NOT NULL,
  `idEstacionTren` int(11) NOT NULL,
  `nroEstacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ramal_tiene_estacion`
--

INSERT INTO `ramal_tiene_estacion` (`idRamalEstacionTren`, `idRamalTren`, `idEstacionTren`, `nroEstacion`) VALUES
(1, 3, 1, 1),
(2, 3, 2, 2),
(3, 3, 3, 3),
(4, 3, 4, 4),
(5, 3, 5, 5),
(6, 3, 6, 6),
(7, 3, 7, 7),
(8, 3, 8, 8),
(9, 3, 9, 9),
(10, 3, 16, 10),
(11, 3, 17, 11),
(12, 3, 18, 12),
(13, 3, 19, 13),
(14, 3, 20, 14),
(15, 3, 21, 15),
(16, 2, 1, 1),
(17, 2, 2, 2),
(18, 2, 3, 3),
(19, 2, 4, 4),
(20, 2, 5, 5),
(21, 2, 6, 6),
(22, 2, 7, 7),
(23, 2, 8, 8),
(24, 2, 9, 9),
(25, 2, 10, 10),
(26, 2, 11, 11),
(27, 2, 12, 12),
(28, 2, 13, 13),
(29, 2, 14, 14),
(30, 2, 15, 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `redsube`
--

CREATE TABLE `redsube` (
  `idRedSube` int(11) NOT NULL,
  `descuento` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarifacolectivo`
--

CREATE TABLE `tarifacolectivo` (
  `idTarifaColectivo` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `precio` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarifasubte`
--

CREATE TABLE `tarifasubte` (
  `idTarifaSubte` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `precio` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarifatren`
--

CREATE TABLE `tarifatren` (
  `idTarifaTren` int(11) NOT NULL,
  `cantEstaciones` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjeta`
--

CREATE TABLE `tarjeta` (
  `idTarjeta` int(11) NOT NULL,
  `nroTarjeta` varchar(45) NOT NULL,
  `saldo` float NOT NULL,
  `activa` bit(1) NOT NULL,
  `idUsuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tarjeta`
--

INSERT INTO `tarjeta` (`idTarjeta`, `nroTarjeta`, `saldo`, `activa`, `idUsuario`) VALUES
(2, '123 456 789', 0, b'1', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `contraseña` varchar(45) NOT NULL,
  `dni` bigint(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_tiene_beneficio`
--

CREATE TABLE `usuario_tiene_beneficio` (
  `idUsuario` int(11) NOT NULL,
  `idBeneficio` int(11) NOT NULL,
  `ultimaFechaCobro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_tiene_descuento`
--

CREATE TABLE `usuario_tiene_descuento` (
  `usuario_idUsuario` int(11) NOT NULL,
  `descuento_idDescuento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viaje`
--

CREATE TABLE `viaje` (
  `idViaje` int(11) NOT NULL,
  `fechaHora` date NOT NULL,
  `idTarjeta` int(11) NOT NULL,
  `idRedSube` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `beneficio`
--
ALTER TABLE `beneficio`
  ADD PRIMARY KEY (`idBeneficio`),
  ADD UNIQUE KEY `idBeneficio_UNIQUE` (`idBeneficio`);

--
-- Indices de la tabla `boletocolectivo`
--
ALTER TABLE `boletocolectivo`
  ADD PRIMARY KEY (`idBoletoColectivo`),
  ADD UNIQUE KEY `idBoletoColectivo_UNIQUE` (`idBoletoColectivo`),
  ADD KEY `fk_boletoColectivo_lineaColectivo1_idx` (`idLineaColectivo`),
  ADD KEY `fk_boletoColectivo_tarifaColectivo1_idx` (`idTarifaColectivo`),
  ADD KEY `fk_boletoColectivo_viaje1_idx` (`idViaje`);

--
-- Indices de la tabla `boletosubte`
--
ALTER TABLE `boletosubte`
  ADD PRIMARY KEY (`idBoletoSubte`),
  ADD UNIQUE KEY `idBoletoSubte_UNIQUE` (`idBoletoSubte`),
  ADD KEY `fk_boletoSubte_tarifaSubte1_idx` (`idTarifaSubte`),
  ADD KEY `fk_boletoSubte_estacionSubte1_idx` (`idEstacionSubte`),
  ADD KEY `fk_boletoSubte_viaje1_idx` (`idViaje`);

--
-- Indices de la tabla `boletotren`
--
ALTER TABLE `boletotren`
  ADD PRIMARY KEY (`idBoletoTren`),
  ADD UNIQUE KEY `idBoletoTren_UNIQUE` (`idBoletoTren`),
  ADD KEY `fk_estacionSubida_idx` (`idEstacionSubida`),
  ADD KEY `fk_estacionBajada_idx` (`idEstacionBajada`),
  ADD KEY `fk_boletoTren_viaje1_idx` (`idViaje`),
  ADD KEY `fk_tarifa_idx` (`idTarifaTren`);

--
-- Indices de la tabla `descuento`
--
ALTER TABLE `descuento`
  ADD PRIMARY KEY (`idDescuento`),
  ADD UNIQUE KEY `idDescuento_UNIQUE` (`idDescuento`);

--
-- Indices de la tabla `estacionsubte`
--
ALTER TABLE `estacionsubte`
  ADD PRIMARY KEY (`idEstacionSubte`),
  ADD UNIQUE KEY `idEstacionSubte_UNIQUE` (`idEstacionSubte`),
  ADD KEY `fk_estacionSubte_lineaSubte1_idx` (`lineaSubte_idLineaSubte`);

--
-- Indices de la tabla `estaciontren`
--
ALTER TABLE `estaciontren`
  ADD PRIMARY KEY (`idEstacionTren`),
  ADD UNIQUE KEY `idEstacionTren_UNIQUE` (`idEstacionTren`);

--
-- Indices de la tabla `lineacolectivo`
--
ALTER TABLE `lineacolectivo`
  ADD PRIMARY KEY (`idLineaColectivo`),
  ADD UNIQUE KEY `idRamalColectivo_UNIQUE` (`idLineaColectivo`);

--
-- Indices de la tabla `lineasubte`
--
ALTER TABLE `lineasubte`
  ADD PRIMARY KEY (`idLineaSubte`),
  ADD UNIQUE KEY `idLineaSubte_UNIQUE` (`idLineaSubte`);

--
-- Indices de la tabla `lineatren`
--
ALTER TABLE `lineatren`
  ADD PRIMARY KEY (`idLineaTren`),
  ADD UNIQUE KEY `idLineaTren_UNIQUE` (`idLineaTren`);

--
-- Indices de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD PRIMARY KEY (`idMovimiento`),
  ADD UNIQUE KEY `idMovimiento_UNIQUE` (`idMovimiento`),
  ADD KEY `fk_Movimiento_usuario1_idx` (`idUsuario`);

--
-- Indices de la tabla `ramaltren`
--
ALTER TABLE `ramaltren`
  ADD PRIMARY KEY (`idRamalTren`),
  ADD UNIQUE KEY `idRamalTren_UNIQUE` (`idRamalTren`),
  ADD KEY `fk_ramalTren_lineaTren1_idx` (`idLineaTren`);

--
-- Indices de la tabla `ramal_tiene_estacion`
--
ALTER TABLE `ramal_tiene_estacion`
  ADD PRIMARY KEY (`idRamalEstacionTren`),
  ADD UNIQUE KEY `idRamalEstacionTren_UNIQUE` (`idRamalEstacionTren`),
  ADD KEY `fk_ramalTren_has_estacionTren_ramalTren_idx` (`idRamalTren`),
  ADD KEY `fk_ramal_tiene_estacion_estacionTren1_idx` (`idEstacionTren`);

--
-- Indices de la tabla `redsube`
--
ALTER TABLE `redsube`
  ADD PRIMARY KEY (`idRedSube`),
  ADD UNIQUE KEY `idRedSube_UNIQUE` (`idRedSube`);

--
-- Indices de la tabla `tarifacolectivo`
--
ALTER TABLE `tarifacolectivo`
  ADD PRIMARY KEY (`idTarifaColectivo`),
  ADD UNIQUE KEY `idTarifaColectivo_UNIQUE` (`idTarifaColectivo`);

--
-- Indices de la tabla `tarifasubte`
--
ALTER TABLE `tarifasubte`
  ADD PRIMARY KEY (`idTarifaSubte`),
  ADD UNIQUE KEY `idTarifaSubte_UNIQUE` (`idTarifaSubte`);

--
-- Indices de la tabla `tarifatren`
--
ALTER TABLE `tarifatren`
  ADD PRIMARY KEY (`idTarifaTren`),
  ADD UNIQUE KEY `idTarifaTren_UNIQUE` (`idTarifaTren`);

--
-- Indices de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD PRIMARY KEY (`idTarjeta`),
  ADD UNIQUE KEY `idTarjeta_UNIQUE` (`idTarjeta`),
  ADD KEY `fk_tarjeta_usuario1_idx` (`idUsuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `idUsuario_UNIQUE` (`idUsuario`),
  ADD UNIQUE KEY `dni_UNIQUE` (`dni`);

--
-- Indices de la tabla `usuario_tiene_beneficio`
--
ALTER TABLE `usuario_tiene_beneficio`
  ADD PRIMARY KEY (`idUsuario`,`idBeneficio`),
  ADD KEY `fk_usuario_has_beneficio_beneficio1_idx` (`idBeneficio`),
  ADD KEY `fk_usuario_tiene_beneficio_usuario1_idx` (`idUsuario`);

--
-- Indices de la tabla `usuario_tiene_descuento`
--
ALTER TABLE `usuario_tiene_descuento`
  ADD PRIMARY KEY (`usuario_idUsuario`,`descuento_idDescuento`),
  ADD KEY `fk_usuario_has_descuento_descuento1_idx` (`descuento_idDescuento`),
  ADD KEY `fk_usuario_has_descuento_usuario1_idx` (`usuario_idUsuario`);

--
-- Indices de la tabla `viaje`
--
ALTER TABLE `viaje`
  ADD PRIMARY KEY (`idViaje`),
  ADD UNIQUE KEY `idViaje_UNIQUE` (`idViaje`),
  ADD KEY `fk_viaje_tarjeta1_idx` (`idTarjeta`),
  ADD KEY `fk_viaje_redSube1_idx` (`idRedSube`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `beneficio`
--
ALTER TABLE `beneficio`
  MODIFY `idBeneficio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `boletocolectivo`
--
ALTER TABLE `boletocolectivo`
  MODIFY `idBoletoColectivo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `boletosubte`
--
ALTER TABLE `boletosubte`
  MODIFY `idBoletoSubte` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `boletotren`
--
ALTER TABLE `boletotren`
  MODIFY `idBoletoTren` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `descuento`
--
ALTER TABLE `descuento`
  MODIFY `idDescuento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estacionsubte`
--
ALTER TABLE `estacionsubte`
  MODIFY `idEstacionSubte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `estaciontren`
--
ALTER TABLE `estaciontren`
  MODIFY `idEstacionTren` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `lineacolectivo`
--
ALTER TABLE `lineacolectivo`
  MODIFY `idLineaColectivo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `lineasubte`
--
ALTER TABLE `lineasubte`
  MODIFY `idLineaSubte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `lineatren`
--
ALTER TABLE `lineatren`
  MODIFY `idLineaTren` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  MODIFY `idMovimiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ramaltren`
--
ALTER TABLE `ramaltren`
  MODIFY `idRamalTren` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ramal_tiene_estacion`
--
ALTER TABLE `ramal_tiene_estacion`
  MODIFY `idRamalEstacionTren` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `redsube`
--
ALTER TABLE `redsube`
  MODIFY `idRedSube` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tarifacolectivo`
--
ALTER TABLE `tarifacolectivo`
  MODIFY `idTarifaColectivo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tarifasubte`
--
ALTER TABLE `tarifasubte`
  MODIFY `idTarifaSubte` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tarifatren`
--
ALTER TABLE `tarifatren`
  MODIFY `idTarifaTren` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  MODIFY `idTarjeta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `viaje`
--
ALTER TABLE `viaje`
  MODIFY `idViaje` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `boletocolectivo`
--
ALTER TABLE `boletocolectivo`
  ADD CONSTRAINT `fk_boletoColectivo_lineaColectivo1` FOREIGN KEY (`idLineaColectivo`) REFERENCES `lineacolectivo` (`idLineaColectivo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_boletoColectivo_tarifaColectivo1` FOREIGN KEY (`idTarifaColectivo`) REFERENCES `tarifacolectivo` (`idTarifaColectivo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_boletoColectivo_viaje1` FOREIGN KEY (`idViaje`) REFERENCES `viaje` (`idViaje`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `boletosubte`
--
ALTER TABLE `boletosubte`
  ADD CONSTRAINT `fk_boletoSubte_estacionSubte1` FOREIGN KEY (`idEstacionSubte`) REFERENCES `estacionsubte` (`idEstacionSubte`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_boletoSubte_tarifaSubte1` FOREIGN KEY (`idTarifaSubte`) REFERENCES `tarifasubte` (`idTarifaSubte`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_boletoSubte_viaje` FOREIGN KEY (`idViaje`) REFERENCES `viaje` (`idViaje`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `boletotren`
--
ALTER TABLE `boletotren`
  ADD CONSTRAINT `fk_boletoTren_viaje1` FOREIGN KEY (`idViaje`) REFERENCES `viaje` (`idViaje`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estacionBajada` FOREIGN KEY (`idEstacionBajada`) REFERENCES `estaciontren` (`idEstacionTren`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estacionSubida` FOREIGN KEY (`idEstacionSubida`) REFERENCES `estaciontren` (`idEstacionTren`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tarifa` FOREIGN KEY (`idTarifaTren`) REFERENCES `tarifatren` (`idTarifaTren`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `estacionsubte`
--
ALTER TABLE `estacionsubte`
  ADD CONSTRAINT `fk_estacionSubte_lineaSubte1` FOREIGN KEY (`lineaSubte_idLineaSubte`) REFERENCES `lineasubte` (`idLineaSubte`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD CONSTRAINT `fk_Movimiento_usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ramaltren`
--
ALTER TABLE `ramaltren`
  ADD CONSTRAINT `fk_lineaTren` FOREIGN KEY (`idLineaTren`) REFERENCES `lineatren` (`idLineaTren`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ramal_tiene_estacion`
--
ALTER TABLE `ramal_tiene_estacion`
  ADD CONSTRAINT `fk_ramalTren_has_estacionTren_ramalTren` FOREIGN KEY (`idRamalTren`) REFERENCES `ramaltren` (`idRamalTren`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ramal_tiene_estacion_estacionTren1` FOREIGN KEY (`idEstacionTren`) REFERENCES `estaciontren` (`idEstacionTren`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD CONSTRAINT `fk_tarjeta_usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario_tiene_beneficio`
--
ALTER TABLE `usuario_tiene_beneficio`
  ADD CONSTRAINT `fk_usuario_has_beneficio_beneficio1` FOREIGN KEY (`idBeneficio`) REFERENCES `beneficio` (`idBeneficio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_tiene_beneficio_usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario_tiene_descuento`
--
ALTER TABLE `usuario_tiene_descuento`
  ADD CONSTRAINT `fk_usuario_has_descuento_descuento1` FOREIGN KEY (`descuento_idDescuento`) REFERENCES `descuento` (`idDescuento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_has_descuento_usuario1` FOREIGN KEY (`usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `viaje`
--
ALTER TABLE `viaje`
  ADD CONSTRAINT `fk_viaje_redSube1` FOREIGN KEY (`idRedSube`) REFERENCES `redsube` (`idRedSube`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_viaje_tarjeta1` FOREIGN KEY (`idTarjeta`) REFERENCES `tarjeta` (`idTarjeta`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
