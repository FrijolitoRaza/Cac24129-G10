-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: b9izyfdweg22xryupidf-mysql.services.clever-cloud.com:3306
-- Tiempo de generación: 03-07-2024 a las 14:35:04
-- Versión del servidor: 8.0.22-13
-- Versión de PHP: 8.2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `b9izyfdweg22xryupidf`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Actores`
--

CREATE TABLE `Actores` (
  `ID_Actor` int NOT NULL,
  `Nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Calificaciones`
--

CREATE TABLE `Calificaciones` (
  `ID_Calificacion` int NOT NULL,
  `ID_Perfil` int NOT NULL,
  `ID_Pelicula` int NOT NULL,
  `Me_Gusta` tinyint(1) DEFAULT NULL,
  `Comentario` text,
  `Puntuacion` tinyint DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Directores`
--

CREATE TABLE `Directores` (
  `ID_Director` int NOT NULL,
  `Nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Historial`
--

CREATE TABLE `Historial` (
  `ID_Historial` int NOT NULL,
  `ID_Perfil` int NOT NULL,
  `ID_Pelicula` int NOT NULL,
  `Fecha_Vista` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Paises`
--

CREATE TABLE `Paises` (
  `ID_Pais` int NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `COD` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Paises`
--

INSERT INTO `Paises` (`ID_Pais`, `Nombre`, `COD`) VALUES
(1, 'Argentina', 'AR'),
(2, 'Bolivia', 'BO'),
(3, 'Brasil', 'BR'),
(4, 'Chile', 'CH'),
(5, 'Colombia', 'CO'),
(6, 'Ecuador', 'EC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Peliculas`
--

CREATE TABLE `Peliculas` (
  `ID_Pelicula` int NOT NULL,
  `Titulo` varchar(100) NOT NULL,
  `Fecha_Lanzamiento` date DEFAULT NULL,
  `Duracion` int NOT NULL,
  `Sinopsis` text,
  `Imagen` varchar(255) DEFAULT NULL,
  `Genero` varchar(50) DEFAULT NULL,
  `Restriccion_Edad` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Peliculas`
--

INSERT INTO `Peliculas` (`ID_Pelicula`, `Titulo`, `Fecha_Lanzamiento`, `Duracion`, `Sinopsis`, `Imagen`, `Genero`, `Restriccion_Edad`) VALUES
(1, 'El Padrino', '1972-03-24', 175, 'Un drama épico sobre la familia criminal Corleone y su lucha por mantener el poder en la mafia de Nueva York.', 'el_padrino.jpg', 'Drama', 18),
(2, 'Titanic', '1997-12-19', 195, 'Una historia de amor trágica a bordo del famoso transatlántico que se hundió en su viaje inaugural.', 'titanic.jpg', 'Romance', 13),
(3, 'El Caballero de la Noche', '2008-07-18', 152, 'Batman enfrenta a su mayor enemigo, el Joker, en una batalla por el alma de Gotham City.', 'el_caballero_de_la_noche.jpg', 'Acción', 13),
(4, 'Forrest Gump', '1994-07-06', 142, 'Un hombre con un bajo coeficiente intelectual relata su extraordinaria vida, que lo lleva a vivir eventos históricos clave en Estados Unidos.', 'forrest_gump.jpg', 'Drama', 13),
(6, 'El Señor de los Anillos: La Comunidad del Anillo', '2001-12-19', 178, 'Un joven hobbit y sus amigos emprenden una peligrosa misión para destruir un anillo maligno.', 'la_comunidad_del_anillo.jpg', 'Fantasía', 13),
(7, 'Gladiador', '2000-05-05', 155, 'Un general romano traicionado se convierte en gladiador y busca vengarse del emperador corrupto.', 'gladiador.jpg', 'Acción', 18),
(8, 'Intensamente', '2015-06-19', 95, 'Las emociones de una niña guían su vida a medida que se enfrenta a un cambio importante al mudarse a una nueva ciudad.', 'intensamente.jpg', 'Animación', 0),
(9, 'Matrix', '1999-03-31', 136, 'Un hacker descubre la verdad sobre su realidad y su papel en la guerra contra sus controladores.', 'matrix.jpg', 'Ciencia ficción', 18),
(10, 'Coco', '2017-10-27', 105, 'Un niño viaja a la Tierra de los Muertos para descubrir el misterio de su familia y perseguir su sueño de ser músico.', 'coco.jpg', 'Animación', 0),
(11, 'Avatar', '2009-12-18', 162, 'Un ex-marine parapléjico es enviado a la luna Pandora en una misión única, pero se debate entre seguir las órdenes y proteger el mundo que siente como su hogar.', 'avatar.jpg', 'Ciencia ficción', 13),
(12, 'Inception', '2010-07-16', 148, 'Un ladrón que roba secretos corporativos a través del uso de la tecnología de sueños se le da la tarea inversa de plantar una idea en la mente de un director ejecutivo.', 'inception.jpg', 'Ciencia ficción', 13),
(13, 'Jurassic Park', '2019-04-26', 333, 'Un dinosaurio se balanceaba sobre la tela de una araña...', 'dinosaurio.jpg', 'Aventura', 33),
(14, 'Jurassic Park', '2019-04-26', 333, 'Un dinosaurio se balanceaba sobre la tela de una araña...', 'dinosaurio.jpg', 'Aventura', 33),
(15, 'El Rey León', '1994-06-24', 88, 'Un joven león huye de su reino solo para aprender la verdadera responsabilidad y valentía.', 'el_rey_leon.jpg', 'Animación', 0),
(16, 'Pulp Fiction', '1994-10-14', 154, 'Las vidas de dos matones, una pareja de criminales, un boxeador y un gánster se entrelazan en cuatro historias de violencia y redención.', 'pulp_fiction.jpg', 'Crimen', 18),
(17, 'El Club de la Pelea', '1999-10-15', 139, 'Un oficinista insomne y un fabricante de jabón forman un club de lucha subterráneo que se convierte en algo mucho más grande.', 'el_club_de_la_pelea.jpg', 'Drama', 18),
(18, 'Toy Story', '1995-11-22', 81, 'Un niño pequeño y sus juguetes cobran vida cuando no están siendo observados. Los juguetes deben aprender a lidiar con los celos y la amistad.', 'toy_story.jpg', 'Animación', 0),
(19, 'Interestelar', '2014-11-07', 169, 'Un equipo de exploradores viaja a través de un agujero de gusano en el espacio en un intento por asegurar el futuro de la humanidad.', 'interestelar.jpg', 'Ciencia ficción', 13),
(22, 'Dogpool', '2025-02-12', 111, 'Dogpool es un mercenario que después de un experimento que le deja con habilidades curativas acelera su velocidad y adopta la identidad de Deadpool.', 'dogpool.jpg', 'Acción', 21),
(23, 'Ladypool', '2000-02-12', 98, 'Ladypool es un mercenario que después de un experimento que le deja con habilidades curativas acelera su velocidad y adopta la identidad de Deadpool.', 'ladypool.jpg', 'Acción', 18),
(24, 'Aquaman: El reino perdido', '2008-02-12', 93, 'Aquaman se balanceaba sobre la tela de una araña.....', 'aquaman.jpg', 'Aventura', 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Peliculas_Actores`
--

CREATE TABLE `Peliculas_Actores` (
  `ID_Pelicula` int NOT NULL,
  `ID_Actor` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Peliculas_Directores`
--

CREATE TABLE `Peliculas_Directores` (
  `ID_Pelicula` int NOT NULL,
  `ID_Director` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Perfiles`
--

CREATE TABLE `Perfiles` (
  `ID_Perfil` int NOT NULL,
  `ID_Usuario` int NOT NULL,
  `Nombre_a_Mostrar` varchar(50) NOT NULL,
  `Imagen` varchar(255) DEFAULT NULL,
  `ID_Tipo_Perfil` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Recomendaciones`
--

CREATE TABLE `Recomendaciones` (
  `ID_Recomendacion` int NOT NULL,
  `ID_Perfil` int NOT NULL,
  `ID_Pelicula` int NOT NULL,
  `Fecha_Recomendada` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Comentario` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Sesiones`
--

CREATE TABLE `Sesiones` (
  `ID_Sesion` int NOT NULL,
  `ID_Usuario` int NOT NULL,
  `Fecha_Inicio` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Fin` timestamp NULL DEFAULT NULL,
  `IP_Address` varchar(45) DEFAULT NULL,
  `Dispositivo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Suscripciones`
--

CREATE TABLE `Suscripciones` (
  `ID_Suscripcion` int NOT NULL,
  `Tipo` varchar(50) NOT NULL,
  `Precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Suscripciones`
--

INSERT INTO `Suscripciones` (`ID_Suscripcion`, `Tipo`, `Precio`) VALUES
(1, 'Normal', 20.00),
(2, 'Premium', 50.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Tipos_Perfil`
--

CREATE TABLE `Tipos_Perfil` (
  `ID_Tipo_Perfil` int NOT NULL,
  `Tipo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Tipos_Perfil`
--

INSERT INTO `Tipos_Perfil` (`ID_Tipo_Perfil`, `Tipo`) VALUES
(2, 'Kids'),
(1, 'Normal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuarios`
--

CREATE TABLE `Usuarios` (
  `ID_Usuario` int NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `Pass` varchar(100) NOT NULL,
  `FDN` date NOT NULL,
  `ID_Pais` int NOT NULL,
  `Fecha_Creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ID_Suscripcion` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Usuarios`
--

INSERT INTO `Usuarios` (`ID_Usuario`, `Nombre`, `Apellido`, `Correo`, `Pass`, `FDN`, `ID_Pais`, `Fecha_Creacion`, `ID_Suscripcion`) VALUES
(1, 'Juan', 'Pérez', 'juan@example.com', '$2b$10$km6OByofT/fjX3VQDZs3w.9jFDk6OAs0I3SwlM6/qUTGgJ0UEYRY2', '1990-05-15', 1, '2024-07-01 10:00:00', 1),
(2, 'María', 'Gómez', 'maria@example.com', '$2b$10$2NKaMBrbDSeF8MOg1z8T6u5e92kKxpyesRcDoEZf7USxGJL7XbTLy', '1988-08-20', 2, '2024-07-01 11:00:00', 2),
(3, 'Carlos', 'López', 'carlos@example.com', '$2b$10$ad1RcTC4W3wMhAy6uX8aY.1P1J4Kz4cM5qfzAwAa5RQwBGyj22X1K', '1995-03-10', 3, '2024-07-01 12:00:00', 1),
(4, 'Ana', 'Martínez', 'ana@example.com', '$2b$10$CkInYQoY1XrJo5QSYwCe6.CK2TQPHq6gbxX1vKfAfMv4CKoE43kiq', '1992-11-25', 4, '2024-07-01 13:00:00', 1),
(5, 'Pedro', 'Rodríguez', 'pedro@example.com', '$2b$10$D5a/dSeDOzg4C0S8BnQ.s.8z4JDCiV9ehG8EsmPjYoiJFMHZR4Z7e', '1987-07-30', 5, '2024-07-01 14:00:00', 2),
(6, 'Laura', 'Sánchez', 'laura@example.com', '$2b$10$GffQ0X4Ohx5XokxIu.T5fe2RZC2lTQ6t5Kc4fj/JH7ZpUH4K4pYV6', '1998-01-05', 6, '2024-07-01 15:00:00', 2),
(7, 'José', 'García', 'jose@example.com', '$2b$10$UaHZkFpI3Gv9qX1W9aj3MuTeH1.h3g3AfCUkC22fXV0LXfUHXtRJu', '1991-09-12', 1, '2024-07-01 16:00:00', 1),
(8, 'Sofía', 'Hernández', 'sofia@example.com', '$2b$10$3m72tWCr/Zve/VSlQYJcFu7/ztUf1Gkn/FhQVbq9ImFEL0jF6N4zG', '1993-04-18', 2, '2024-07-01 17:00:00', 2),
(9, 'Andrés', 'Fernández', 'andres@example.com', '$2b$10$VVTXBr95i6pPllR4pK4h.ePPhZ1BpPwUu8htWPU3cXTKRAv6rG0my', '1996-06-28', 3, '2024-07-01 18:00:00', 1),
(10, 'Gabriela', 'Marquez', 'gabriela@example.com', '$2b$10$zi8ddgD.t/79MIvbTLkUveQyFa7QlmSEAngrSKoFEZ86zSwqYR5KW', '1994-02-15', 4, '2024-07-01 19:00:00', 1),
(11, 'Manuel', 'Pérez', 'manuel@example.com', '$2b$10$yXlHfO0ibW8p.F/Y3Ztx3e3Kw9pGtnlLgJn/VVwMvKUlozpV7U2fa', '1997-10-08', 5, '2024-07-01 20:00:00', 2),
(12, 'Valentina', 'Díaz', 'valentina@example.com', '$2b$10$kN7BMoYi2fz5hV6c9KHL9en5SOrRqo/sqRf1LFXPSBfBZKk/nGr0y', '1990-12-03', 6, '2024-07-01 21:00:00', 2),
(13, 'Luis', 'González', 'luis@example.com', '$2b$10$tJ3HYU7.R5Gf.Vst1QOR9OzLxVdPRg9ER9c3OJAvZG6hQbpBdAuE2', '1999-04-22', 1, '2024-07-01 22:00:00', 1),
(14, 'Martina', 'Ortega', 'martina@example.com', '$2b$10$5ixO7gEh9X/pB1UkKNW/8eZJ26DntfD1s24jGj.wA.7dkmGtVab4e', '1993-08-14', 2, '2024-07-01 23:00:00', 2),
(15, 'Ricardo', 'Ramírez', 'ricardo@example.com', '$2b$10$6TCDbAhb8uW3IjD8D5s75eiRm4NckyFOZ7pTzyStGhC.XLpd2xPbC', '1991-06-17', 3, '2024-07-02 00:00:00', 1),
(16, 'Dogpool', 'Express', 'unemail@example.com', '$2b$10$d6A4SGYTSmxJGW8NU5gT.uaiYnEnUwJFtZWywLW83ih37SUQod746', '1988-08-20', 1, '2024-07-03 01:13:47', 2),
(25, 'Juan', 'Pérez', 'juan_OTRO@example.com', '$2b$10$vX0ZowkT7ekC2XR8LeIaIu5WdgnQCVXrlclz4PLc8izn3UIGFUDym', '1990-05-15', 1, '2024-07-03 03:46:50', NULL),
(26, 'Juan', 'Cruz', 'juancruz@ejemplo.com', '$2b$10$VRhwEDuCmPdAoMxY9kJdXOQ3nG97JfYy3H2nsD.ws3jB3eegX8h9K', '1999-11-01', 1, '2024-07-03 03:47:21', NULL),
(27, 'Juan', 'Pérez', 'juan_@example.com', '$2b$10$8bWBM.pr9IRzOeVEi05OSum7zLeBgFDUBkB6Oex10sSsOpEU1t5L.', '1990-05-15', 1, '2024-07-03 03:50:50', NULL),
(28, 'Ramon', 'Lopez', 'RLopez@example.com', '$2b$10$8/CuVabas49g2YiO1z4ZjOciQSgbhZIUxf.tJZV1SD9M/7QMlfBr.', '1990-05-15', 1, '2024-07-03 04:52:54', NULL),
(29, 'Roberto', 'Gomez', 'Rgomez@mail.com', '$2b$10$Z2a0Nnhf9.nlCR5jNje2yukyS0JeWC8/eMnWfeU40B8mNgTfjAbRO', '1999-01-01', 1, '2024-07-03 04:54:22', NULL),
(30, 'Manuel', 'Lopez', 'Mlopez@mail.com', '$2b$10$/E3UaIoZRSje3a1iX/EV4eSvlBv.xxA48qu5nL8wgCRfe.bWBVKgO', '1999-11-01', 1, '2024-07-03 04:58:19', NULL),
(31, 'Ramon', 'Martinez', 'RMartinez@example.com', '$2b$10$cwovvAWMUR9hoqDloPnhZubAsdM4Nk.p9iDPa3awNEiSjADTEhRuC', '1990-05-15', 1, '2024-07-03 05:22:22', NULL),
(32, 'Richard', 'Martines', 'RMartines@example.com', '$2b$10$DG16Q9ElUMEWzn9jgzfvRuvMJ8a6bnQEllLPilpLblHWHZHv9JFtO', '1990-05-15', 1, '2024-07-03 14:00:14', NULL),
(33, 'Luis', 'Martines', 'LMartines@example.com', '$2b$10$r2mLiaM3ws3Xz78uIFtcN.XG2uX.1symm5dwwIl7d1t0iDlke9gli', '1990-05-15', 1, '2024-07-03 14:18:40', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Actores`
--
ALTER TABLE `Actores`
  ADD PRIMARY KEY (`ID_Actor`),
  ADD UNIQUE KEY `Nombre` (`Nombre`);

--
-- Indices de la tabla `Calificaciones`
--
ALTER TABLE `Calificaciones`
  ADD PRIMARY KEY (`ID_Calificacion`),
  ADD UNIQUE KEY `ID_Perfil` (`ID_Perfil`,`ID_Pelicula`),
  ADD KEY `ID_Pelicula` (`ID_Pelicula`),
  ADD KEY `idx_calificaciones_perfil_pelicula` (`ID_Perfil`,`ID_Pelicula`);

--
-- Indices de la tabla `Directores`
--
ALTER TABLE `Directores`
  ADD PRIMARY KEY (`ID_Director`),
  ADD UNIQUE KEY `Nombre` (`Nombre`);

--
-- Indices de la tabla `Historial`
--
ALTER TABLE `Historial`
  ADD PRIMARY KEY (`ID_Historial`),
  ADD UNIQUE KEY `ID_Perfil` (`ID_Perfil`,`ID_Pelicula`,`Fecha_Vista`),
  ADD KEY `ID_Pelicula` (`ID_Pelicula`),
  ADD KEY `idx_historial_perfil_pelicula` (`ID_Perfil`,`ID_Pelicula`);

--
-- Indices de la tabla `Paises`
--
ALTER TABLE `Paises`
  ADD PRIMARY KEY (`ID_Pais`),
  ADD UNIQUE KEY `Nombre` (`Nombre`);

--
-- Indices de la tabla `Peliculas`
--
ALTER TABLE `Peliculas`
  ADD PRIMARY KEY (`ID_Pelicula`),
  ADD KEY `idx_peliculas_titulo_fecha` (`Titulo`,`Fecha_Lanzamiento`);

--
-- Indices de la tabla `Peliculas_Actores`
--
ALTER TABLE `Peliculas_Actores`
  ADD PRIMARY KEY (`ID_Pelicula`,`ID_Actor`),
  ADD KEY `idx_peliculas_actores_pelicula` (`ID_Pelicula`),
  ADD KEY `idx_peliculas_actores_actor` (`ID_Actor`);

--
-- Indices de la tabla `Peliculas_Directores`
--
ALTER TABLE `Peliculas_Directores`
  ADD PRIMARY KEY (`ID_Pelicula`,`ID_Director`),
  ADD KEY `idx_peliculas_directores_pelicula` (`ID_Pelicula`),
  ADD KEY `idx_peliculas_directores_director` (`ID_Director`);

--
-- Indices de la tabla `Perfiles`
--
ALTER TABLE `Perfiles`
  ADD PRIMARY KEY (`ID_Perfil`),
  ADD KEY `ID_Usuario` (`ID_Usuario`),
  ADD KEY `ID_Tipo_Perfil` (`ID_Tipo_Perfil`),
  ADD KEY `idx_perfiles_nombre_usuario` (`Nombre_a_Mostrar`,`ID_Usuario`);

--
-- Indices de la tabla `Recomendaciones`
--
ALTER TABLE `Recomendaciones`
  ADD PRIMARY KEY (`ID_Recomendacion`),
  ADD KEY `ID_Pelicula` (`ID_Pelicula`),
  ADD KEY `idx_recomendaciones_perfil_pelicula` (`ID_Perfil`,`ID_Pelicula`);

--
-- Indices de la tabla `Sesiones`
--
ALTER TABLE `Sesiones`
  ADD PRIMARY KEY (`ID_Sesion`),
  ADD KEY `idx_sesiones_usuario_fecha` (`ID_Usuario`,`Fecha_Inicio`);

--
-- Indices de la tabla `Suscripciones`
--
ALTER TABLE `Suscripciones`
  ADD PRIMARY KEY (`ID_Suscripcion`),
  ADD UNIQUE KEY `Tipo` (`Tipo`);

--
-- Indices de la tabla `Tipos_Perfil`
--
ALTER TABLE `Tipos_Perfil`
  ADD PRIMARY KEY (`ID_Tipo_Perfil`),
  ADD UNIQUE KEY `Tipo` (`Tipo`);

--
-- Indices de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD PRIMARY KEY (`ID_Usuario`),
  ADD UNIQUE KEY `Correo` (`Correo`),
  ADD KEY `ID_Pais` (`ID_Pais`),
  ADD KEY `ID_Suscripcion` (`ID_Suscripcion`),
  ADD KEY `idx_usuarios_nombre` (`Nombre`),
  ADD KEY `idx_usuarios_correo` (`Correo`),
  ADD KEY `idx_usuarios_nombre_apellido` (`Nombre`,`Apellido`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Actores`
--
ALTER TABLE `Actores`
  MODIFY `ID_Actor` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Calificaciones`
--
ALTER TABLE `Calificaciones`
  MODIFY `ID_Calificacion` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Directores`
--
ALTER TABLE `Directores`
  MODIFY `ID_Director` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Historial`
--
ALTER TABLE `Historial`
  MODIFY `ID_Historial` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Paises`
--
ALTER TABLE `Paises`
  MODIFY `ID_Pais` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `Peliculas`
--
ALTER TABLE `Peliculas`
  MODIFY `ID_Pelicula` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `Perfiles`
--
ALTER TABLE `Perfiles`
  MODIFY `ID_Perfil` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Recomendaciones`
--
ALTER TABLE `Recomendaciones`
  MODIFY `ID_Recomendacion` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Sesiones`
--
ALTER TABLE `Sesiones`
  MODIFY `ID_Sesion` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Suscripciones`
--
ALTER TABLE `Suscripciones`
  MODIFY `ID_Suscripcion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `Tipos_Perfil`
--
ALTER TABLE `Tipos_Perfil`
  MODIFY `ID_Tipo_Perfil` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  MODIFY `ID_Usuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Calificaciones`
--
ALTER TABLE `Calificaciones`
  ADD CONSTRAINT `Calificaciones_ibfk_1` FOREIGN KEY (`ID_Perfil`) REFERENCES `Perfiles` (`ID_Perfil`) ON DELETE CASCADE,
  ADD CONSTRAINT `Calificaciones_ibfk_2` FOREIGN KEY (`ID_Pelicula`) REFERENCES `Peliculas` (`ID_Pelicula`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Historial`
--
ALTER TABLE `Historial`
  ADD CONSTRAINT `Historial_ibfk_1` FOREIGN KEY (`ID_Perfil`) REFERENCES `Perfiles` (`ID_Perfil`) ON DELETE CASCADE,
  ADD CONSTRAINT `Historial_ibfk_2` FOREIGN KEY (`ID_Pelicula`) REFERENCES `Peliculas` (`ID_Pelicula`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Peliculas_Actores`
--
ALTER TABLE `Peliculas_Actores`
  ADD CONSTRAINT `Peliculas_Actores_ibfk_1` FOREIGN KEY (`ID_Pelicula`) REFERENCES `Peliculas` (`ID_Pelicula`) ON DELETE CASCADE,
  ADD CONSTRAINT `Peliculas_Actores_ibfk_2` FOREIGN KEY (`ID_Actor`) REFERENCES `Actores` (`ID_Actor`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Peliculas_Directores`
--
ALTER TABLE `Peliculas_Directores`
  ADD CONSTRAINT `Peliculas_Directores_ibfk_1` FOREIGN KEY (`ID_Pelicula`) REFERENCES `Peliculas` (`ID_Pelicula`) ON DELETE CASCADE,
  ADD CONSTRAINT `Peliculas_Directores_ibfk_2` FOREIGN KEY (`ID_Director`) REFERENCES `Directores` (`ID_Director`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Perfiles`
--
ALTER TABLE `Perfiles`
  ADD CONSTRAINT `Perfiles_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `Usuarios` (`ID_Usuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `Perfiles_ibfk_2` FOREIGN KEY (`ID_Tipo_Perfil`) REFERENCES `Tipos_Perfil` (`ID_Tipo_Perfil`);

--
-- Filtros para la tabla `Recomendaciones`
--
ALTER TABLE `Recomendaciones`
  ADD CONSTRAINT `Recomendaciones_ibfk_1` FOREIGN KEY (`ID_Perfil`) REFERENCES `Perfiles` (`ID_Perfil`) ON DELETE CASCADE,
  ADD CONSTRAINT `Recomendaciones_ibfk_2` FOREIGN KEY (`ID_Pelicula`) REFERENCES `Peliculas` (`ID_Pelicula`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Sesiones`
--
ALTER TABLE `Sesiones`
  ADD CONSTRAINT `Sesiones_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `Usuarios` (`ID_Usuario`) ON DELETE CASCADE;

--
-- Filtros para la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD CONSTRAINT `Usuarios_ibfk_1` FOREIGN KEY (`ID_Pais`) REFERENCES `Paises` (`ID_Pais`),
  ADD CONSTRAINT `Usuarios_ibfk_2` FOREIGN KEY (`ID_Suscripcion`) REFERENCES `Suscripciones` (`ID_Suscripcion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
