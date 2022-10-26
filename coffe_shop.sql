-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-10-2022 a las 02:14:53
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
-- Base de datos: `coffe_shop`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `no_orden` tinyint(4) NOT NULL,
  `no_empleado` varchar(10) NOT NULL,
  `nombre_cliente` varchar(60) NOT NULL,
  `forma_pago` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `no_empleado` varchar(10) NOT NULL,
  `cargo` varchar(25) NOT NULL,
  `nombre_emp` varchar(70) NOT NULL,
  `edad_emp` tinyint(4) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `domicilio_emp` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventarios`
--

CREATE TABLE `inventarios` (
  `no_producto` varchar(6) NOT NULL,
  `nom_producto` varchar(30) NOT NULL,
  `prod_existencia` tinyint(5) NOT NULL,
  `marca_prod` varchar(20) NOT NULL,
  `codigo_prod` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `codigo_prod` varchar(10) NOT NULL,
  `nombre_prod` varchar(30) NOT NULL,
  `precio_prod` varchar(10) NOT NULL,
  `prod_disponible` tinyint(8) NOT NULL,
  `no_orden_pedido` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puestos`
--

CREATE TABLE `puestos` (
  `cargo` varchar(25) NOT NULL,
  `no_personal` tinyint(4) NOT NULL,
  `turno` varchar(10) NOT NULL,
  `sueldo_cargo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`no_orden`),
  ADD KEY `indice_empleados` (`no_empleado`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`no_empleado`),
  ADD KEY `indice_cargo` (`cargo`);

--
-- Indices de la tabla `inventarios`
--
ALTER TABLE `inventarios`
  ADD PRIMARY KEY (`no_producto`),
  ADD KEY `indice_prod` (`codigo_prod`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`codigo_prod`),
  ADD KEY `indice_orden` (`no_orden_pedido`);

--
-- Indices de la tabla `puestos`
--
ALTER TABLE `puestos`
  ADD PRIMARY KEY (`cargo`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `indice_empleados` FOREIGN KEY (`no_empleado`) REFERENCES `empleados` (`no_empleado`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `indice_cargo` FOREIGN KEY (`cargo`) REFERENCES `puestos` (`cargo`);

--
-- Filtros para la tabla `inventarios`
--
ALTER TABLE `inventarios`
  ADD CONSTRAINT `indice_prod` FOREIGN KEY (`codigo_prod`) REFERENCES `productos` (`codigo_prod`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `indice_orden` FOREIGN KEY (`no_orden_pedido`) REFERENCES `clientes` (`no_orden`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
