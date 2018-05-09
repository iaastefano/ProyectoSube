-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-05-2018 a las 21:37:00
-- Versión del servidor: 10.1.31-MariaDB
-- Versión de PHP: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sube`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boleto`
--

CREATE TABLE `boleto` (
  `idBoleto` int(11) NOT NULL,
  `idTransporte` int(11) NOT NULL,
  `fechaHora` datetime NOT NULL,
  `cerrado` tinyint(1) NOT NULL,
  `precioFinal` double NOT NULL,
  `descuento` double NOT NULL,
  `idViaje` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colectivo`
--

CREATE TABLE `colectivo` (
  `idColectivo` int(11) NOT NULL,
  `linea` int(11) NOT NULL,
  `ramal` varchar(1) NOT NULL,
  `interno` int(11) NOT NULL,
  `idSeccion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estacion`
--

CREATE TABLE `estacion` (
  `idEstacion` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento`
--

CREATE TABLE `movimiento` (
  `idMovimientos` int(11) NOT NULL,
  `idTransporte` int(11) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `fechaHora` datetime NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `detalle` varchar(45) DEFAULT NULL,
  `idTarjeta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion_colectivo`
--

CREATE TABLE `seccion_colectivo` (
  `idSeccion` int(11) NOT NULL,
  `precio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `seccion_colectivo`
--

INSERT INTO `seccion_colectivo` (`idSeccion`, `precio`) VALUES
(1, 9),
(2, 9.25),
(3, 9.5),
(4, 9.5),
(5, 10.25),
(6, 10.25),
(7, 10.25),
(8, 10.25),
(9, 10.25),
(10, 10.75);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion_tren`
--

CREATE TABLE `seccion_tren` (
  `idSeccion` int(11) NOT NULL,
  `precio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `seccion_tren`
--

INSERT INTO `seccion_tren` (`idSeccion`, `precio`) VALUES
(1, 2.75),
(2, 4),
(3, 5.5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subte`
--

CREATE TABLE `subte` (
  `idSubte` int(11) NOT NULL,
  `linea` varchar(1) NOT NULL,
  `interno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjeta`
--

CREATE TABLE `tarjeta` (
  `idTarjeta` int(11) NOT NULL,
  `numTarjeta` bigint(16) NOT NULL,
  `saldo` float NOT NULL,
  `activa` tinyint(4) NOT NULL,
  `idUsuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tramo`
--

CREATE TABLE `tramo` (
  `idTramo` int(11) NOT NULL,
  `idEstacionInicial` int(11) NOT NULL,
  `idEstacionFinal` int(11) NOT NULL,
  `idSeccion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transporte`
--

CREATE TABLE `transporte` (
  `idTransporte` int(11) NOT NULL,
  `idTren` int(11) NOT NULL,
  `idSubte` int(11) NOT NULL,
  `idColectivo` int(11) NOT NULL,
  `precio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tren`
--

CREATE TABLE `tren` (
  `idTren` int(11) NOT NULL,
  `idTramo` int(11) NOT NULL,
  `interno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `dni` bigint(8) NOT NULL,
  `pass` varchar(8) NOT NULL,
  `email` varchar(45) NOT NULL,
  `tarifaSocial` tinyint(4) NOT NULL,
  `estudiantil` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viaje`
--

CREATE TABLE `viaje` (
  `idViaje` int(11) NOT NULL,
  `fechaHora` datetime NOT NULL,
  `cantidadDeBoletos` int(11) NOT NULL,
  `idTarjeta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `boleto`
--
ALTER TABLE `boleto`
  ADD PRIMARY KEY (`idBoleto`),
  ADD KEY `fk_viaje` (`idViaje`),
  ADD KEY `fk_transporte` (`idTransporte`);

--
-- Indices de la tabla `colectivo`
--
ALTER TABLE `colectivo`
  ADD PRIMARY KEY (`idColectivo`),
  ADD KEY `fk_seccion_colevtivo` (`idSeccion`);

--
-- Indices de la tabla `estacion`
--
ALTER TABLE `estacion`
  ADD PRIMARY KEY (`idEstacion`);

--
-- Indices de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD PRIMARY KEY (`idMovimientos`),
  ADD UNIQUE KEY `idMovimientos_UNIQUE` (`idMovimientos`),
  ADD KEY `fk_tarjeta_movimiento` (`idTarjeta`);

--
-- Indices de la tabla `seccion_colectivo`
--
ALTER TABLE `seccion_colectivo`
  ADD PRIMARY KEY (`idSeccion`);

--
-- Indices de la tabla `seccion_tren`
--
ALTER TABLE `seccion_tren`
  ADD PRIMARY KEY (`idSeccion`);

--
-- Indices de la tabla `subte`
--
ALTER TABLE `subte`
  ADD PRIMARY KEY (`idSubte`);

--
-- Indices de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD PRIMARY KEY (`idTarjeta`),
  ADD UNIQUE KEY `idTarjeta_UNIQUE` (`idTarjeta`),
  ADD UNIQUE KEY `numTarjeta_UNIQUE` (`numTarjeta`),
  ADD KEY `fk_usuario_tarjeta` (`idUsuario`);

--
-- Indices de la tabla `tramo`
--
ALTER TABLE `tramo`
  ADD PRIMARY KEY (`idTramo`),
  ADD KEY `fk_estacion_inicial` (`idEstacionInicial`),
  ADD KEY `fk_estacion_final` (`idEstacionFinal`),
  ADD KEY `fk_seccion` (`idSeccion`);

--
-- Indices de la tabla `transporte`
--
ALTER TABLE `transporte`
  ADD PRIMARY KEY (`idTransporte`),
  ADD KEY `fk_colectivo` (`idColectivo`),
  ADD KEY `fk_subte` (`idSubte`),
  ADD KEY `fk_tren` (`idTren`);

--
-- Indices de la tabla `tren`
--
ALTER TABLE `tren`
  ADD PRIMARY KEY (`idTren`),
  ADD KEY `fk_tramo` (`idTramo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `idUsuario_UNIQUE` (`idUsuario`),
  ADD UNIQUE KEY `dni_UNIQUE` (`dni`);

--
-- Indices de la tabla `viaje`
--
ALTER TABLE `viaje`
  ADD PRIMARY KEY (`idViaje`),
  ADD KEY `fk_tarjeta_viaje` (`idTarjeta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `boleto`
--
ALTER TABLE `boleto`
  MODIFY `idBoleto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `colectivo`
--
ALTER TABLE `colectivo`
  MODIFY `idColectivo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estacion`
--
ALTER TABLE `estacion`
  MODIFY `idEstacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  MODIFY `idMovimientos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `seccion_colectivo`
--
ALTER TABLE `seccion_colectivo`
  MODIFY `idSeccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `seccion_tren`
--
ALTER TABLE `seccion_tren`
  MODIFY `idSeccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `subte`
--
ALTER TABLE `subte`
  MODIFY `idSubte` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  MODIFY `idTarjeta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tramo`
--
ALTER TABLE `tramo`
  MODIFY `idTramo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `transporte`
--
ALTER TABLE `transporte`
  MODIFY `idTransporte` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tren`
--
ALTER TABLE `tren`
  MODIFY `idTren` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `viaje`
--
ALTER TABLE `viaje`
  MODIFY `idViaje` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `boleto`
--
ALTER TABLE `boleto`
  ADD CONSTRAINT `fk_transporte` FOREIGN KEY (`idTransporte`) REFERENCES `transporte` (`idTransporte`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_viaje` FOREIGN KEY (`idViaje`) REFERENCES `viaje` (`idViaje`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `colectivo`
--
ALTER TABLE `colectivo`
  ADD CONSTRAINT `fk_seccion_colevtivo` FOREIGN KEY (`idSeccion`) REFERENCES `seccion_colectivo` (`idSeccion`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD CONSTRAINT `fk_tarjeta_movimiento` FOREIGN KEY (`idTarjeta`) REFERENCES `tarjeta` (`idTarjeta`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tarjeta`
--
ALTER TABLE `tarjeta`
  ADD CONSTRAINT `fk_usuario_tarjeta` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tramo`
--
ALTER TABLE `tramo`
  ADD CONSTRAINT `fk_estacion_final` FOREIGN KEY (`idEstacionFinal`) REFERENCES `estacion` (`idEstacion`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_estacion_inicial` FOREIGN KEY (`idEstacionInicial`) REFERENCES `estacion` (`idEstacion`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_seccion` FOREIGN KEY (`idSeccion`) REFERENCES `seccion_tren` (`idSeccion`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `transporte`
--
ALTER TABLE `transporte`
  ADD CONSTRAINT `fk_colectivo` FOREIGN KEY (`idColectivo`) REFERENCES `colectivo` (`idColectivo`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_subte` FOREIGN KEY (`idSubte`) REFERENCES `subte` (`idSubte`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tren` FOREIGN KEY (`idTren`) REFERENCES `tren` (`idTren`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tren`
--
ALTER TABLE `tren`
  ADD CONSTRAINT `fk_tramo` FOREIGN KEY (`idTramo`) REFERENCES `tramo` (`idTramo`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `viaje`
--
ALTER TABLE `viaje`
  ADD CONSTRAINT `fk_tarjeta_viaje` FOREIGN KEY (`idTarjeta`) REFERENCES `tarjeta` (`idTarjeta`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
