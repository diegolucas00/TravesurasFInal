-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2022 at 07:30 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travesuras`
--

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

CREATE TABLE `categoria` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categoria`
--

INSERT INTO `categoria` (`Id`, `Nombre`) VALUES
(1, 'Pañaleria'),
(2, 'Papeleria');

-- --------------------------------------------------------

--
-- Table structure for table `pedido`
--

CREATE TABLE `pedido` (
  `Id` int(11) NOT NULL,
  `FechaCreacion` datetime NOT NULL,
  `Estado` varchar(20) NOT NULL,
  `FechaCambioEstado` datetime NOT NULL,
  `FKProveedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pedido`
--

INSERT INTO `pedido` (`Id`, `FechaCreacion`, `Estado`, `FechaCambioEstado`, `FKProveedor`) VALUES
(1, '2022-04-21 16:12:57', 'EN PROCESO', '2022-04-21 16:12:57', 1),
(2, '2022-04-21 16:37:19', 'EN PROCESO', '2022-04-21 16:37:19', 1),
(3, '2022-04-21 16:39:30', 'EN PROCESO', '2022-04-21 16:39:30', 1),
(4, '2022-04-21 16:40:32', 'EN PROCESO', '2022-04-21 16:40:32', 1),
(5, '2022-04-21 16:41:52', 'EN PROCESO', '2022-04-21 16:41:52', 1),
(6, '2022-04-21 16:42:47', 'EN PROCESO', '2022-04-21 16:42:47', 1),
(7, '2022-04-21 16:45:07', 'EN PROCESO', '2022-04-21 16:45:07', 1),
(8, '2022-04-21 16:46:43', 'EN PROCESO', '2022-04-21 16:46:43', 1),
(9, '2022-04-21 16:47:32', 'EN PROCESO', '2022-04-21 16:47:32', 1),
(10, '2022-04-21 16:48:02', 'EN PROCESO', '2022-04-21 16:48:02', 1),
(11, '2022-04-21 16:49:03', 'EN PROCESO', '2022-04-21 16:49:03', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pedidoproducto`
--

CREATE TABLE `pedidoproducto` (
  `Id` int(11) NOT NULL,
  `FRPedido` int(11) NOT NULL,
  `FRProducto` int(11) NOT NULL,
  `CantidadPauqete` int(11) NOT NULL,
  `CantidadUnidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pedidoproducto`
--

INSERT INTO `pedidoproducto` (`Id`, `FRPedido`, `FRProducto`, `CantidadPauqete`, `CantidadUnidad`) VALUES
(1, 1, 1, 0, 0),
(2, 2, 1, 0, 0),
(3, 3, 1, 1, 1),
(4, 4, 4, 0, 1),
(5, 5, 4, 0, 0),
(6, 6, 1, 7, 5),
(7, 6, 7, 7, 5),
(8, 7, 1, 0, 0),
(9, 7, 4, 0, 2),
(10, 7, 7, 5, 7),
(11, 8, 7, 0, 2),
(12, 8, 6, 0, 3),
(13, 9, 4, 0, 0),
(14, 9, 6, 2, 4),
(15, 10, 4, 0, 0),
(16, 10, 6, 3, 2),
(17, 11, 4, 5, 0),
(18, 11, 1, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `producto`
--

CREATE TABLE `producto` (
  `Id` int(10) NOT NULL,
  `Nombre` varchar(80) NOT NULL,
  `Img` varchar(30) DEFAULT 'VACIO',
  `ImgPQ` varchar(30) DEFAULT 'VACIO',
  `ValorPaquete` int(11) NOT NULL,
  `ValorUnidad` int(11) NOT NULL,
  `CantidadUnitario` int(11) DEFAULT 0,
  `CantidadPaquete` int(11) DEFAULT 0,
  `Descripcion` varchar(80) DEFAULT 'VACIO',
  `FechaCreacion` date NOT NULL,
  `FRSudCategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `producto`
--

INSERT INTO `producto` (`Id`, `Nombre`, `Img`, `ImgPQ`, `ValorPaquete`, `ValorUnidad`, `CantidadUnitario`, `CantidadPaquete`, `Descripcion`, `FechaCreacion`, `FRSudCategoria`) VALUES
(1, 'A', NULL, NULL, 0, 0, 0, 3, NULL, '2022-04-16', 1),
(4, 'B', NULL, NULL, 0, 0, 0, 5, NULL, '2022-04-16', 1),
(6, 'R', NULL, NULL, 0, 0, 0, 4, NULL, '2022-04-16', 1),
(7, 'Z', NULL, NULL, 0, 0, 10, 0, NULL, '2022-04-16', 1),
(10, 'PAÑALES', NULL, NULL, 22000, 1000, 0, 2, NULL, '2022-04-22', 1),
(12, 'LAPIZ', NULL, NULL, 10000, 1000, 50, 12, NULL, '2022-04-22', 1);

-- --------------------------------------------------------

--
-- Table structure for table `proveedor`
--

CREATE TABLE `proveedor` (
  `Id` int(11) NOT NULL,
  `NIT` varchar(30) DEFAULT 'Personal',
  `NombreEmpresa` varchar(80) NOT NULL,
  `NombreVendedor` varchar(80) NOT NULL,
  `Correo` varchar(30) DEFAULT 'No tiene',
  `Celular` varchar(15) DEFAULT 'No tiene',
  `Direccion` varchar(50) NOT NULL DEFAULT 'Personal'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `proveedor`
--

INSERT INTO `proveedor` (`Id`, `NIT`, `NombreEmpresa`, `NombreVendedor`, `Correo`, `Celular`, `Direccion`) VALUES
(1, '123-1-null', 'nose', 'DIEGO', 'diegolucas@gmail.com', '3102788323', 'Calle 49 b sur # 5 h - 53'),
(2, '213213-1', 'nose', 'a', 'diegolucas@gmail.com', '3102788323', 'Calle 49 b sur # 5 h - 53'),
(4, '2132132-1', 'nose', 'a', 'diegolucas@gmail.com', '3102788323', 'Calle 49 b sur # 5 h - 53'),
(5, '1321-1', 'nose', 'a', 'diegolucas@gmail.com', '3102788323', 'Calle 49 b sur # 5 h - 53'),
(6, '21321-1', 'nose', 'a', 'diegolucas@gmail.com', '3102788323', 'Calle 49 b sur # 5 h - 53'),
(7, '33124-1', 'nose', 'a', 'diegolucas@gmail.com', '3102788323', 'Calle 49 b sur # 5 h - 53'),
(8, '21312-1', 'nose', 'a', 'diegolucas@gmail.com', '3102788323', 'Calle 49 b sur # 5 h - 53'),
(9, '123-5', 'nose', 'Diego', 'diegolucas@gmail.com', '3102788328', 'Calle 49 b sur # 5 h - 53'),
(15, '789999-1', 'asdas', 'asdsadsaff', 'diegolucas@gmail.com', '', 'Calle 49 b sur # 5 h - 53');

-- --------------------------------------------------------

--
-- Table structure for table `proveedorcategoria`
--

CREATE TABLE `proveedorcategoria` (
  `FRProveedor` int(11) NOT NULL,
  `FRCategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `proveedorcategoria`
--

INSERT INTO `proveedorcategoria` (`FRProveedor`, `FRCategoria`) VALUES
(1, 2),
(2, 2),
(7, 1),
(7, 2),
(8, 1),
(8, 2),
(9, 1),
(9, 2),
(15, 1);

-- --------------------------------------------------------

--
-- Table structure for table `subcategoria`
--

CREATE TABLE `subcategoria` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `FRCategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subcategoria`
--

INSERT INTO `subcategoria` (`Id`, `Nombre`, `FRCategoria`) VALUES
(1, 'Pañales', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FRSPrveedor_` (`FKProveedor`);

--
-- Indexes for table `pedidoproducto`
--
ALTER TABLE `pedidoproducto`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FRSPedido_` (`FRPedido`),
  ADD KEY `FRSProducto_` (`FRProducto`);

--
-- Indexes for table `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Nombre` (`Nombre`),
  ADD KEY `FR_SubCategoriaPro` (`FRSudCategoria`);

--
-- Indexes for table `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `NIT` (`NIT`);

--
-- Indexes for table `proveedorcategoria`
--
ALTER TABLE `proveedorcategoria`
  ADD PRIMARY KEY (`FRProveedor`,`FRCategoria`),
  ADD KEY `FRProveedor_SubCategora` (`FRCategoria`);

--
-- Indexes for table `subcategoria`
--
ALTER TABLE `subcategoria`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FR_CategoriaSud` (`FRCategoria`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pedido`
--
ALTER TABLE `pedido`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pedidoproducto`
--
ALTER TABLE `pedidoproducto`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `producto`
--
ALTER TABLE `producto`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `FRSPrveedor_` FOREIGN KEY (`FKProveedor`) REFERENCES `proveedor` (`Id`);

--
-- Constraints for table `pedidoproducto`
--
ALTER TABLE `pedidoproducto`
  ADD CONSTRAINT `FRSPedido_` FOREIGN KEY (`FRPedido`) REFERENCES `pedido` (`Id`),
  ADD CONSTRAINT `FRSProducto_` FOREIGN KEY (`FRProducto`) REFERENCES `producto` (`Id`);

--
-- Constraints for table `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `FR_SubCategoriaPro` FOREIGN KEY (`FRSudCategoria`) REFERENCES `subcategoria` (`Id`);

--
-- Constraints for table `proveedorcategoria`
--
ALTER TABLE `proveedorcategoria`
  ADD CONSTRAINT `FRProveedor_SubCategora` FOREIGN KEY (`FRCategoria`) REFERENCES `categoria` (`Id`),
  ADD CONSTRAINT `FRSCategora_Proveedor` FOREIGN KEY (`FRProveedor`) REFERENCES `proveedor` (`Id`);

--
-- Constraints for table `subcategoria`
--
ALTER TABLE `subcategoria`
  ADD CONSTRAINT `FR_CategoriaSud` FOREIGN KEY (`FRCategoria`) REFERENCES `categoria` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
