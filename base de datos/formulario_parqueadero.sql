-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 21-11-2024 a las 02:26:33
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `formulario_parqueadero`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `telefono` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombre`, `telefono`) VALUES
(1, 'kevin castañeda', '3177432779'),
(2, 'kevin castañeda', '3177432779'),
(3, 'kevin castañeda', '3177432779'),
(4, 'kevin castañeda', '3177432779'),
(5, 'kevin castañeda', '3177432779'),
(6, 'kevin castañeda', '3177432779'),
(7, 'kevin castañeda', '3177432779'),
(8, 'kevin castañeda', '3177432779'),
(9, 'kevin castañeda', '3177432779'),
(10, 'kevin', '3177432779'),
(11, 'alexis', '3177432779'),
(12, 'kevin', '3177432779'),
(13, 'carlos', '2222222222'),
(14, 'marcus', '2222222222'),
(15, 'kevin', '12121212'),
(16, 'alonso', '12121212'),
(17, 'katherine', '121212'),
(18, 'aleja', '1212'),
(19, 'kevin', '1212'),
(20, 'kevin', '121212'),
(21, 'katerine', '121212'),
(22, 'miguel', '1212'),
(23, 'miguel', '1212'),
(24, 'mayely', '121222112'),
(25, 'andres perdomo', '3155581313'),
(26, 'manuel vargas', '3183682952'),
(27, 'liever rojas', '3184575908'),
(28, 'mariori rojas', '3153286256'),
(29, 'hector fabio', '316000000'),
(30, 'monica narvaez', '3185340932'),
(31, 'matias rojas', '3214575908'),
(32, 'jader rojas', '3108798835'),
(33, 'kevin', 's'),
(34, 'kevin', 's'),
(35, 'kevin', 's'),
(36, 'kevin', 's');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puestos`
--

CREATE TABLE `puestos` (
  `id_puesto` int NOT NULL,
  `estado` enum('libre','ocupado') DEFAULT 'libre',
  `cliente_id` int DEFAULT NULL,
  `hora_entrada` datetime DEFAULT NULL,
  `hora_salida` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `puestos`
--

INSERT INTO `puestos` (`id_puesto`, `estado`, `cliente_id`, `hora_entrada`, `hora_salida`) VALUES
(1, 'ocupado', 24, '2024-11-19 14:40:00', '2024-11-19 18:00:05'),
(2, 'ocupado', 23, '2024-11-21 12:59:00', '2024-11-18 06:08:01'),
(3, 'ocupado', 25, '2024-11-19 14:41:00', NULL),
(4, 'ocupado', 26, '2024-11-19 14:42:00', NULL),
(5, 'ocupado', 27, '2024-11-19 14:43:00', NULL),
(6, 'ocupado', 28, '2024-11-19 14:44:00', NULL),
(7, 'libre', NULL, NULL, '2024-11-21 00:53:12'),
(8, 'ocupado', 30, '2024-11-19 14:45:00', NULL),
(9, 'ocupado', 31, '2024-11-19 14:46:00', NULL),
(10, 'ocupado', 32, '2024-11-19 15:19:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `id_vehiculo` int NOT NULL,
  `placa` varchar(20) DEFAULT NULL,
  `marca` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `cliente` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`id_vehiculo`, `placa`, `marca`, `color`, `cliente`) VALUES
(1, 'ipb49c', 'akt', 'azul', 1),
(2, 'ipb49c', 'akt', 'azul', 2),
(3, 'ipb49c', 'akt', 'azul', 3),
(4, 'ipb49c', 'akt', 'azul', 4),
(5, 'ipb49c', 'akt', 'azul', 5),
(6, 'ipb49c', 'akt', 'azul', 6),
(7, 'ipb49c', 'akt', 'azul', 7),
(8, 'ipb49c', 'akt', 'azul', 8),
(9, 'ipb49c', 'akt', 'azul', 9),
(10, 'aaa', 'akt', 'azul', 10),
(11, '1212', 'mazda', 'rojo', 11),
(12, '1111', 'toyota', 'azul', 12),
(13, 'asd', 'mazda', 'rojo', 13),
(14, '1212', 'mazda', 'rojo', 14),
(15, 'asd123', 'BMW', 'negro', 15),
(16, 'as', 'BMW', 'negro', 16),
(17, 'asd123', 'BMW', 'negro', 17),
(18, '12', '12', '12', 18),
(19, 'asd', '12', '12', 19),
(20, 'asd', 'bmw', 'amarillo', 20),
(21, '1212', 'bmw', 'amarillo', 21),
(22, 'asd221', 'BMW', 'negro', 22),
(23, 'asd221', 'BMW', 'negro', 23),
(24, 'fgh123', 'BMW', 'rojo', 24),
(25, 'wbm15h', 'honda', 'negro mate', 25),
(26, 'ozl34g', 'yamaha', 'amarilla', 26),
(27, 'nxo76d', 'honda', 'negra', 27),
(28, 'nkk740', 'toyota', 'blanco', 28),
(29, 'plk 348', 'toyota', 'gris', 29),
(30, 'fch 34d', 'yamaha', 'blanco', 30),
(31, 'rkr764', 'chevrolet', 'negro', 31),
(32, 'tlw18c', 'honda', 'negra', 32),
(33, 's', 's', 's', 33),
(34, 's', 's', 's', 34),
(35, 's', 's', 's', 35),
(36, 's', 's', 's', 36);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `puestos`
--
ALTER TABLE `puestos`
  ADD PRIMARY KEY (`id_puesto`),
  ADD KEY `cliente_puesto` (`cliente_id`);

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`id_vehiculo`),
  ADD KEY `clente_vehiculo` (`cliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `puestos`
--
ALTER TABLE `puestos`
  MODIFY `id_puesto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  MODIFY `id_vehiculo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `puestos`
--
ALTER TABLE `puestos`
  ADD CONSTRAINT `cliente_puesto` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id_cliente`);

--
-- Filtros para la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD CONSTRAINT `clente_vehiculo` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
