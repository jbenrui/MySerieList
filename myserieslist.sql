-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-02-2022 a las 23:03:49
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `myserieslist`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generoprincipal`
--

CREATE TABLE `generoprincipal` (
  `idGenero` int(11) NOT NULL,
  `NomGenero` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `generoprincipal`
--

INSERT INTO `generoprincipal` (`idGenero`, `NomGenero`) VALUES
(1, 'Comedia'),
(2, 'Acción'),
(3, 'Ciencia Ficcion'),
(4, 'Drama'),
(5, 'Romance'),
(6, 'Terror'),
(7, 'Aventura'),
(8, 'Deportes'),
(9, 'Fantasia'),
(10, 'Historico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listaserie`
--

CREATE TABLE `listaserie` (
  `idList` int(11) NOT NULL,
  `NomList` varchar(100) NOT NULL,
  `idGenero` int(11) DEFAULT NULL,
  `idTipo` int(11) DEFAULT NULL,
  `idUser` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `listaserie`
--

INSERT INTO `listaserie` (`idList`, `NomList`, `idGenero`, `idTipo`, `idUser`) VALUES
(1, 'Hajime no Ippo', 8, 3, 1),
(2, 'Watchmen', 3, 6, 1),
(3, 'Slam Dunk', 8, 4, NULL),
(4, 'Rick & Morty', 1, 2, NULL),
(5, 'Slam Dunk', 8, 4, NULL),
(6, 'One punch man', 1, 3, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

CREATE TABLE `tipo` (
  `idTipo` int(11) NOT NULL,
  `NomTipo` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`idTipo`, `NomTipo`) VALUES
(1, 'Pelicula'),
(2, 'Serie'),
(3, 'Anime'),
(4, 'Manga'),
(5, 'Life Action'),
(6, 'Comic'),
(7, 'Documental'),
(8, 'Podcast');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUser` int(11) NOT NULL,
  `Alias` varchar(20) NOT NULL,
  `Contraseña` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUser`, `Alias`, `Contraseña`) VALUES
(1, 'usuario', 'usuario'),
(2, 'root', 'root');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `generoprincipal`
--
ALTER TABLE `generoprincipal`
  ADD PRIMARY KEY (`idGenero`);

--
-- Indices de la tabla `listaserie`
--
ALTER TABLE `listaserie`
  ADD PRIMARY KEY (`idList`);

--
-- Indices de la tabla `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`idTipo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `generoprincipal`
--
ALTER TABLE `generoprincipal`
  MODIFY `idGenero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `listaserie`
--
ALTER TABLE `listaserie`
  MODIFY `idList` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tipo`
--
ALTER TABLE `tipo`
  MODIFY `idTipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
