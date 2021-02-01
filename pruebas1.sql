-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-02-2021 a las 15:14:40
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pruebas1`
--
CREATE DATABASE IF NOT EXISTS `pruebas1` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `pruebas1`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tic_bd_compus`
--

DROP TABLE IF EXISTS `tic_bd_compus`;
CREATE TABLE `tic_bd_compus` (
  `id` int(10) NOT NULL,
  `cod_activo` varchar(50) CHARACTER SET utf32 COLLATE utf32_spanish2_ci DEFAULT NULL,
  `serial` varchar(100) CHARACTER SET utf32 COLLATE utf32_spanish2_ci NOT NULL,
  `centro_operacion` varchar(100) CHARACTER SET utf32 COLLATE utf32_spanish2_ci DEFAULT NULL,
  `usuario` varchar(100) CHARACTER SET utf32 COLLATE utf32_spanish2_ci NOT NULL,
  `procesador` varchar(100) CHARACTER SET utf32 COLLATE utf32_spanish2_ci DEFAULT NULL,
  `memo_ram` varchar(100) CHARACTER SET utf32 COLLATE utf32_spanish2_ci DEFAULT NULL,
  `disco_duro` varchar(100) CHARACTER SET utf32 COLLATE utf32_spanish2_ci DEFAULT NULL,
  `sis_operativo` varchar(100) CHARACTER SET utf32 COLLATE utf32_spanish2_ci DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=activo 0=inactivo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tic_bd_compus`
--

INSERT INTO `tic_bd_compus` (`id`, `cod_activo`, `serial`, `centro_operacion`, `usuario`, `procesador`, `memo_ram`, `disco_duro`, `sis_operativo`, `estado`) VALUES
(1, '0028886-000', 'GXLD9L2', 'BOGOTA', 'JUAN DIAZ', 'Core i3-6006U', '9182 MB', '500 GB', 'Windows 10 Pro', 1),
(2, '0008595-000', 'MXL20208TN', 'BOGOTA', 'PEDRO GOMEZ', 'Core i3-2100', '2048 MB', '465.8 GB', 'Windows 7 Pro', 1),
(3, '0015487-000', 'S10036C9', 'MEDELLIN', 'CARLOS JIMENEZ', 'Core i3-4130', '4096 MB', '465.8 GB', 'Windows 10 Pro', 1),
(4, '0015499-000', '5CD0157H3P', 'MEDELLIN', 'ANDREA GARCIA', 'Core i5-4500U', '8192 MB', '985 GB', 'Windows 10 Pro', 1),
(5, '0009693-000', '5CM3280CSZ', 'CALI', 'MARIA LOPEZ', 'Atom D2550', '4096 MB', '465.8 GB', 'Windows 7 Pro', 1);

--
-- Disparadores `tic_bd_compus`
--
DROP TRIGGER IF EXISTS `tic_bd_compus_bu`;
DELIMITER $$
CREATE TRIGGER `tic_bd_compus_bu` BEFORE UPDATE ON `tic_bd_compus` FOR EACH ROW INSERT INTO tic_bd_info 
              (ant_centro, 
               ant_usuario, 
               nuevo_centro, 
               nuevo_usuario, 
               f_registro) 
  VALUES      (old.centro_operacion, 
               old.usuario, 
               new.centro_operacion, 
               new.usuario,
               NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tic_bd_info`
--

DROP TABLE IF EXISTS `tic_bd_info`;
CREATE TABLE `tic_bd_info` (
  `id` int(11) NOT NULL,
  `serial_compu` varchar(200) COLLATE utf8_bin NOT NULL,
  `ant_centro` varchar(200) COLLATE utf8_bin NOT NULL,
  `ant_usuario` varchar(200) COLLATE utf8_bin NOT NULL,
  `nuevo_centro` varchar(200) COLLATE utf8_bin NOT NULL,
  `nuevo_usuario` varchar(200) COLLATE utf8_bin NOT NULL,
  `f_registro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tic_bd_compus`
--
ALTER TABLE `tic_bd_compus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `serial` (`serial`),
  ADD UNIQUE KEY `cod_activo` (`cod_activo`);

--
-- Indices de la tabla `tic_bd_info`
--
ALTER TABLE `tic_bd_info`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tic_bd_compus`
--
ALTER TABLE `tic_bd_compus`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=366;

--
-- AUTO_INCREMENT de la tabla `tic_bd_info`
--
ALTER TABLE `tic_bd_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
