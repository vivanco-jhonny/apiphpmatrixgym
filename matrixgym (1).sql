-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-11-2023 a las 01:31:28
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
-- Base de datos: `matrixgym`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `datacliente` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`datacliente`)),
  `dateregister` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client_plan`
--

CREATE TABLE `client_plan` (
  `id` int(11) NOT NULL,
  `iduser` int(8) NOT NULL,
  `idplan` int(8) NOT NULL,
  `datestart` varchar(50) NOT NULL,
  `state` varchar(25) NOT NULL,
  `dateregister` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan`
--

CREATE TABLE `plan` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `duration` int(8) NOT NULL,
  `price` double(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` double(6,2) NOT NULL,
  `image` varchar(500) NOT NULL,
  `stock` int(4) NOT NULL,
  `datein` varchar(50) NOT NULL,
  `dateregister` varchar(50) NOT NULL,
  `mark` varchar(50) NOT NULL,
  `state` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `image`, `stock`, `datein`, `dateregister`, `mark`, `state`) VALUES
(23, 'Reebok Polo Training Hombre Speedwick Amarillo', 48.30, 'https://d3fvqmu2193zmz.cloudfront.net/items_2/uid_commerces.1/uid_items_2.FDBVVSDI525Z/1500x1500/649C3F4337FEE-Polo-Training-Hombre-Speedwick.jpg', 0, '', '', '', ''),
(121, 'pasfa', 45.10, 'https://d3fvqmu2193zmz.cloudfront.net/items_2/uid_commerces.1/uid_items_2.FDBVVSDI525Z/1500x1500/649C3F4337FEE-Polo-Training-Hombre-Speedwick.jpg', 15, '1-10-2023', '2023-10-18', 'fdsasdfas', 'pendiente'),
(122, 'pasfa', 45.10, 'https://d3fvqmu2193zmz.cloudfront.net/items_2/uid_commerces.1/uid_items_2.FDBVVSDI525Z/1500x1500/649C3F4337FEE-Polo-Training-Hombre-Speedwick.jpg', 15, '1-10-2023', '2023-10-18', 'fdsasdfas', 'pendiente'),
(123, 'pasfa', 45.10, 'https://d3fvqmu2193zmz.cloudfront.net/items_2/uid_commerces.1/uid_items_2.FDBVVSDI525Z/1500x1500/649C3F4337FEE-Polo-Training-Hombre-Speedwick.jpg', 15, '1-10-2023', '2023-10-18', 'fdsasdfas', 'pendiente'),
(124, 'pasfa', 45.10, 'https://d3fvqmu2193zmz.cloudfront.net/items_2/uid_commerces.1/uid_items_2.FDBVVSDI525Z/1500x1500/649C3F4337FEE-Polo-Training-Hombre-Speedwick.jpg', 15, '1-10-2023', '2023-10-18', 'fdsasdfas', 'pendiente'),
(125, 'fasdfasdfasdf', 478.45, 'https://xtremesport.com.pe/666-superlarge_default/guantes-de-box-venum-12-onz.jpg', 45, '1-10-2023', '2023-09-20', 'fasfasdfasdf', 'disponible'),
(126, 'fasdfasdfasdf', 478.45, 'https://xtremesport.com.pe/666-superlarge_default/guantes-de-box-venum-12-onz.jpg', 45, '1-10-2023', '2023-09-20', 'fasfasdfasdf', 'disponible'),
(127, 'fasdfasdfasdf', 478.45, 'https://xtremesport.com.pe/666-superlarge_default/guantes-de-box-venum-12-onz.jpg', 45, '1-10-2023', '2023-09-20', 'fasfasdfasdf', 'disponible'),
(128, 'fasdfasdfasdf', 478.45, 'https://xtremesport.com.pe/666-superlarge_default/guantes-de-box-venum-12-onz.jpg', 45, '1-10-2023', '2023-09-20', 'fasfasdfasdf', 'disponible'),
(129, 'fasdfasdfasdf', 478.45, 'https://xtremesport.com.pe/666-superlarge_default/guantes-de-box-venum-12-onz.jpg', 45, '1-10-2023', '2023-09-20', 'fasfasdfasdf', 'disponible'),
(130, 'fasdfasdfasdf', 478.45, 'https://xtremesport.com.pe/666-superlarge_default/guantes-de-box-venum-12-onz.jpg', 45, '1-10-2023', '2023-09-20', 'fasfasdfasdf', 'disponible'),
(131, 'fasdfasdfasdf', 478.45, 'https://xtremesport.com.pe/666-superlarge_default/guantes-de-box-venum-12-onz.jpg', 45, '1-10-2023', '2023-09-20', 'fasfasdfasdf', 'disponible'),
(132, 'fasdfasdfasdf', 478.45, 'https://xtremesport.com.pe/666-superlarge_default/guantes-de-box-venum-12-onz.jpg', 45, '1-10-2023', '2023-09-20', 'fasfasdfasdf', 'disponible'),
(133, 'fasdfasdfasdf', 478.45, 'https://xtremesport.com.pe/666-superlarge_default/guantes-de-box-venum-12-onz.jpg', 45, '1-10-2023', '2023-09-20', 'fasfasdfasdf', 'disponible'),
(134, 'fasdfasdfasdf', 478.45, 'https://xtremesport.com.pe/666-superlarge_default/guantes-de-box-venum-12-onz.jpg', 45, '1-10-2023', '2023-09-20', 'fasfasdfasdf', 'disponible'),
(135, 'fasdfasdfasdf', 478.45, 'https://xtremesport.com.pe/666-superlarge_default/guantes-de-box-venum-12-onz.jpg', 45, '1-10-2023', '2023-09-20', 'fasfasdfasdf', 'disponible'),
(136, 'fasdfasdfasdf', 478.45, 'https://xtremesport.com.pe/666-superlarge_default/guantes-de-box-venum-12-onz.jpg', 45, '1-10-2023', '2023-09-20', 'fasfasdfasdf', 'disponible'),
(137, 'fasdfasdfasdf', 478.45, 'https://xtremesport.com.pe/666-superlarge_default/guantes-de-box-venum-12-onz.jpg', 45, '1-10-2023', '2023-09-20', 'fasfasdfasdf', 'disponible'),
(138, 'fasdfasdfasdf', 478.45, 'https://xtremesport.com.pe/666-superlarge_default/guantes-de-box-venum-12-onz.jpg', 45, '1-10-2023', '2023-09-20', 'fasfasdfasdf', 'disponible'),
(139, 'fasdfasdfasdf', 478.45, 'https://xtremesport.com.pe/666-superlarge_default/guantes-de-box-venum-12-onz.jpg', 45, '1-10-2023', '2023-09-20', 'fasfasdfasdf', 'disponible'),
(140, 'fasdfasdfasdf', 478.45, 'https://xtremesport.com.pe/666-superlarge_default/guantes-de-box-venum-12-onz.jpg', 45, '1-10-2023', '2023-09-20', 'fasfasdfasdf', 'disponible'),
(141, 'fasdfasdfasdf', 478.45, 'https://xtremesport.com.pe/666-superlarge_default/guantes-de-box-venum-12-onz.jpg', 45, '1-10-2023', '2023-09-20', 'fasfasdfasdf', 'disponible'),
(142, 'fasdfasdfasdf', 478.45, 'https://xtremesport.com.pe/666-superlarge_default/guantes-de-box-venum-12-onz.jpg', 45, '1-10-2023', '2023-09-20', 'fasfasdfasdf', 'disponible'),
(143, 'fasdfasdfasdf', 478.45, 'https://xtremesport.com.pe/666-superlarge_default/guantes-de-box-venum-12-onz.jpg', 45, '1-10-2023', '2023-09-20', 'fasfasdfasdf', 'disponible'),
(144, 'fasdfasdfasdf', 478.45, 'https://xtremesport.com.pe/666-superlarge_default/guantes-de-box-venum-12-onz.jpg', 45, '1-10-2023', '2023-09-20', 'fasfasdfasdf', 'disponible');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `permissions` varchar(20) NOT NULL,
  `state` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `permissions`, `state`) VALUES
(1, 'damned2002@gmail.com', 'admin', 'ready'),
(2, 'jhonnyvivanco.em@gmail.com', 'admin', 'ready');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `client_plan`
--
ALTER TABLE `client_plan`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `client_plan`
--
ALTER TABLE `client_plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `plan`
--
ALTER TABLE `plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
