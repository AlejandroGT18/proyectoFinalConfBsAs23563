-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-12-2023 a las 13:39:02
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `confbsas23563`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oradores`
--

CREATE TABLE `oradores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `etiquetas` varchar(50) NOT NULL,
  `temas` varchar(200) NOT NULL,
  `fotoPerfil` varchar(300) DEFAULT NULL,
  `dni` int(11) NOT NULL,
  `tel` int(11) DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  `etiquetasDos` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `oradores`
--

INSERT INTO `oradores` (`id`, `nombre`, `apellido`, `etiquetas`, `temas`, `fotoPerfil`, `dni`, `tel`, `email`, `etiquetasDos`) VALUES
(3, 'Steve', 'Jobs', 'Java Script', 'Inicios de Apple, tecnologías utilizadas en las Mac. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'https://imgdb.net/storage/uploads/80eee944aad1ca133afd5f64e95069ef411ea60d845497dbc9f5bf2916524ad8.png', 35468465, NULL, 'sjobs@gmail.com', 'React'),
(4, 'Bill', 'Gates', 'JAVA', 'Nacimiento de Windows,  historia.. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'https://imgdb.net/storage/uploads/1d81e66905ab291ce139feedfdedbcbf06dfabf61aa0ad0b5ae96c45cc6f06a4.png', 23556486, NULL, 'bgates@microsoft.com', 'C++'),
(15, 'Ada', 'Lovelace', 'Negocios', '. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'https://imgdb.net/storage/uploads/f443e2b224b2574ee557f5fc5663e8bc0957c5db3d6b0a8ee85b08630557737b.jpeg', 35466846, NULL, 'alovelace@gmail.com', 'Startups'),
(16, 'Steve', 'Wozniak', 'Phyton', '. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'https://imgdb.net/storage/uploads/f9cf44c1a8877fbf6d5f2e8d70ba38b32549e52da122d8680f2968e34f8acdc1.jpg', 36589788, NULL, 'swozniak@gmail.com', NULL),
(28, 'Elon', 'Musk', 'C#', '. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'https://imgdb.net/storage/uploads/0b1302c12d8ed355c5b8891ccc7c484f48f5a2e18f96e1b55b7ab5fc0d8f6e9f.jpg', 45655489, NULL, 'emusk@gmail.com', NULL),
(31, 'Michelle', 'Obama', 'Java Script', '. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'https://imgdb.net/storage/uploads/cfa0481eabb062e57d8feed2206accbee04a77dec57feb0aa6cfe92699968138.jpg', 32298753, NULL, 'mobama@gmail.com', 'Python'),
(33, 'Greta', 'Thunberg', 'Startups', '. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'https://imgdb.net/storage/uploads/82ff37a80c9c8b434822fa86bae6fdc2d4e9a05d831990ecdf48e8dee2efab4c.jpg', 65458975, NULL, 'gthunberg@gmail.com', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `user` varchar(50) DEFAULT NULL,
  `pass` varchar(50) DEFAULT NULL,
  `fotoPerfil` varchar(200) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `rol` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `user`, `pass`, `fotoPerfil`, `nombre`, `apellido`, `rol`) VALUES
(1, 'alovelace@gmail.com', '1234', 'https://imgdb.net/storage/uploads/6e421ff4a337f905c5cbac6a3b7f47556031dea129f8340a51307b5ccdac9f15.png', 'Ada', 'Lovelace', 'orador'),
(2, 'bgates@gmail.com', '1234', 'https://imgdb.net/storage/uploads/1d81e66905ab291ce139feedfdedbcbf06dfabf61aa0ad0b5ae96c45cc6f06a4.png', 'Bill', 'Gates', 'orador'),
(3, 'sjobs@gmail.com', '1234', 'https://imgdb.net/storage/uploads/80eee944aad1ca133afd5f64e95069ef411ea60d845497dbc9f5bf2916524ad8.png', 'Steve', 'Jobs', 'orador'),
(4, 'swozniak@gmail.com', '1234', 'https://imgdb.net/storage/uploads/f9cf44c1a8877fbf6d5f2e8d70ba38b32549e52da122d8680f2968e34f8acdc1.jpg', 'Steve', 'Wozniak', 'orador'),
(5, 'emusk@gmail.com', '1234', 'https://imgdb.net/storage/uploads/0b1302c12d8ed355c5b8891ccc7c484f48f5a2e18f96e1b55b7ab5fc0d8f6e9f.jpg', 'Elon', 'Musk', 'orador'),
(6, 'mobama@gmail.com', '1234', 'https://imgdb.net/storage/uploads/cfa0481eabb062e57d8feed2206accbee04a77dec57feb0aa6cfe92699968138.jpg', 'Michelle', 'Obama', 'orador'),
(7, 'gthunberg@gmail.com', '1234', 'https://imgdb.net/storage/uploads/82ff37a80c9c8b434822fa86bae6fdc2d4e9a05d831990ecdf48e8dee2efab4c.jpg', 'Greta', 'Thunberg', 'orador'),
(8, 'mpaez@gmail.com', '1234', 'https://imgdb.net/storage/uploads/9c95847209d3361202cfa6b30ac31145a8cfe91277c46dc88bc262a68323a82f.png', 'Martin', 'Paez', 'espectador'),
(9, 'bantunez@gmail.com', '1234', 'https://imgdb.net/storage/uploads/76b447f22a016f2ef4ba209880f3908b3204a0d96f4431d9fd6876fa2a2b76b3.jpg', 'Belen', 'Antunez', 'espectador'),
(10, 'jperez@gmail.com', '1234', 'https://imgdb.net/storage/uploads/76b447f22a016f2ef4ba209880f3908b3204a0d96f4431d9fd6876fa2a2b76b3.jpg', 'Juan', 'Perez', 'espectador'),
(11, 'cfrere8', 'fD7.>(b$', 'https://imgdb.net/storage/uploads/76b447f22a016f2ef4ba209880f3908b3204a0d96f4431d9fd6876fa2a2b76b3.jpg', NULL, NULL, 'espectador'),
(12, 'cortes9', 'pT1`c8sa!z#7', 'https://imgdb.net/storage/uploads/76b447f22a016f2ef4ba209880f3908b3204a0d96f4431d9fd6876fa2a2b76b3.jpg', NULL, NULL, 'espectador'),
(13, 'admin@gmail.com', 'admin', 'https://imgdb.net/storage/uploads/76b447f22a016f2ef4ba209880f3908b3204a0d96f4431d9fd6876fa2a2b76b3.jpg', 'Admin', NULL, 'admin'),
(14, 'admin2@gmail.com', 'admin', 'https://imgdb.net/storage/uploads/76b447f22a016f2ef4ba209880f3908b3204a0d96f4431d9fd6876fa2a2b76b3.jpg', 'Admin', NULL, 'admin'),
(15, 'hgomez@gmail.com', 'aA123456', 'https://imgdb.net/storage/uploads/76b447f22a016f2ef4ba209880f3908b3204a0d96f4431d9fd6876fa2a2b76b3.jpg', NULL, NULL, 'espectador'),
(16, 'hgomez@codoacodo.edu.ar', 'aA123456', 'https://imgdb.net/storage/uploads/76b447f22a016f2ef4ba209880f3908b3204a0d96f4431d9fd6876fa2a2b76b3.jpg', NULL, NULL, 'espectador'),
(20, 'hfernandez@codoacodo.edu.ar', 'aA123456', 'https://imgdb.net/storage/uploads/76b447f22a016f2ef4ba209880f3908b3204a0d96f4431d9fd6876fa2a2b76b3.jpg', NULL, NULL, 'espectador'),
(24, 'usu@codoacodo.edu.ar', 'aA234567', 'https://imgdb.net/storage/uploads/76b447f22a016f2ef4ba209880f3908b3204a0d96f4431d9fd6876fa2a2b76b3.jpg', NULL, NULL, 'espectador'),
(31, 'dsasdqwe@codoacodo.edu.ar', 'a sadsadsafsafasfq', 'https://imgdb.net/storage/uploads/76b447f22a016f2ef4ba209880f3908b3204a0d96f4431d9fd6876fa2a2b76b3.jpg', NULL, NULL, 'espectador'),
(32, 'pepito@codoACodo.edu.ar', 'aA34567898', 'https://imgdb.net/storage/uploads/76b447f22a016f2ef4ba209880f3908b3204a0d96f4431d9fd6876fa2a2b76b3.jpg', NULL, NULL, 'espectador'),
(33, 'sdasdsa@codoacodo.edu.ar', 'aA234567aa', 'https://imgdb.net/storage/uploads/76b447f22a016f2ef4ba209880f3908b3204a0d96f4431d9fd6876fa2a2b76b3.jpg', NULL, NULL, 'espectador'),
(34, 'sdadsads@codoacodo.edu.ar', 'aA234567', 'https://imgdb.net/storage/uploads/76b447f22a016f2ef4ba209880f3908b3204a0d96f4431d9fd6876fa2a2b76b3.jpg', NULL, NULL, 'espectador'),
(35, 'sadasdsdsa@codoacodo.edu.ar', 'aA234567', 'https://imgdb.net/storage/uploads/76b447f22a016f2ef4ba209880f3908b3204a0d96f4431d9fd6876fa2a2b76b3.jpg', NULL, NULL, 'espectador'),
(36, 'dasds@codoacodo.edu.ar', 'aA234567', 'https://imgdb.net/storage/uploads/76b447f22a016f2ef4ba209880f3908b3204a0d96f4431d9fd6876fa2a2b76b3.jpg', NULL, NULL, 'espectador'),
(37, 'dsfdsd@codoacodo.edu.ar', 'aA234567', 'https://imgdb.net/storage/uploads/76b447f22a016f2ef4ba209880f3908b3204a0d96f4431d9fd6876fa2a2b76b3.jpg', NULL, NULL, 'espectador');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `oradores`
--
ALTER TABLE `oradores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_dni` (`dni`),
  ADD KEY `idx_ap` (`apellido`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user` (`user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `oradores`
--
ALTER TABLE `oradores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
