-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2022 at 12:26 PM
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
-- Table structure for table `factura`
--

CREATE TABLE `factura` (
  `Id` int(11) NOT NULL,
  `Fecha_Creacion` date NOT NULL,
  `Estado` varchar(20) NOT NULL,
  `Valor_Total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `factura`
--

INSERT INTO `factura` (`Id`, `Fecha_Creacion`, `Estado`, `Valor_Total`) VALUES
(1, '2022-04-23', 'Pagado', 114000),
(2, '2022-04-23', 'Pagado', 114000);

-- --------------------------------------------------------

--
-- Table structure for table `facturadetalle`
--

CREATE TABLE `facturadetalle` (
  `Id` int(11) NOT NULL,
  `FRFacturaPedido` int(11) NOT NULL,
  `FRProducto` int(11) NOT NULL,
  `CantidadPaquete` int(11) NOT NULL,
  `ValorPaquete` int(11) NOT NULL,
  `CantidadUnidad` int(11) NOT NULL,
  `ValorUnidad` int(11) NOT NULL,
  `ValorIVA` int(11) NOT NULL,
  `ValorTotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `facturadetalle`
--

INSERT INTO `facturadetalle` (`Id`, `FRFacturaPedido`, `FRProducto`, `CantidadPaquete`, `ValorPaquete`, `CantidadUnidad`, `ValorUnidad`, `ValorIVA`, `ValorTotal`) VALUES
(1, 5, 4, 5, 100, 0, 0, 95, 595),
(2, 5, 1, 0, 0, 2, 100, 38, 238),
(3, 6, 4, 5, 1000, 0, 0, 950, 5950),
(4, 6, 1, 0, 0, 2, 1000, 380, 2380),
(5, 7, 1, 0, 0, 2, 2000, 760, 4760),
(6, 7, 4, 2, 20000, 0, 0, 7600, 47600),
(7, 8, 1, 1, 1000, 0, 0, 190, 1190),
(8, 9, 4, 2, 10000, 0, 0, 3800, 23800),
(9, 9, 6, 2, 10000, 4, 0, 3800, 23800),
(10, 10, 6, 1, 100, 0, 0, 19, 119),
(11, 10, 7, 0, 0, 1, 1000, 190, 1190),
(12, 10, 12, 0, 0, 6, 5000, 5700, 35700);

-- --------------------------------------------------------

--
-- Table structure for table `facturapedido`
--

CREATE TABLE `facturapedido` (
  `Id` int(11) NOT NULL,
  `FRPedido` int(11) NOT NULL,
  `FechaCreacion` date NOT NULL,
  `SubTotal` int(11) NOT NULL,
  `IVA` int(11) NOT NULL,
  `Total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `facturapedido`
--

INSERT INTO `facturapedido` (`Id`, `FRPedido`, `FechaCreacion`, `SubTotal`, `IVA`, `Total`) VALUES
(1, 11, '2022-04-22', 700, 133, 833),
(2, 11, '2022-04-22', 700, 133, 833),
(3, 11, '2022-04-22', 700, 133, 833),
(4, 11, '2022-04-22', 700, 133, 833),
(5, 11, '2022-04-22', 700, 133, 833),
(6, 11, '2022-04-22', 7000, 1330, 8330),
(7, 13, '2022-04-22', 44000, 8360, 52360),
(8, 1, '2022-04-22', 1000, 190, 1190),
(9, 9, '2022-04-22', 40000, 7600, 47600),
(10, 12, '2022-04-22', 31100, 5909, 37009);

-- --------------------------------------------------------

--
-- Table structure for table `facturaproducto`
--

CREATE TABLE `facturaproducto` (
  `Id_Producto` int(11) NOT NULL,
  `Id_Factura` int(11) NOT NULL,
  `CantidadUnidad` int(11) NOT NULL,
  `ValorUnidad` int(11) NOT NULL,
  `CantidadPaquete` int(11) NOT NULL,
  `ValorPaquete` int(11) NOT NULL,
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `facturaproducto`
--

INSERT INTO `facturaproducto` (`Id_Producto`, `Id_Factura`, `CantidadUnidad`, `ValorUnidad`, `CantidadPaquete`, `ValorPaquete`, `ID`) VALUES
(12, 2, 7, 7000, 4, 40000, 1),
(10, 2, 1, 1000, 3, 66000, 2);

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
(11, '2022-04-21 16:49:03', 'APROBADO', '2022-04-21 16:49:03', 1),
(12, '2022-04-22 02:10:05', 'APROVADO', '2022-04-22 02:10:05', 1),
(13, '2022-04-22 02:10:43', 'APROBADO', '2022-04-22 02:10:43', 1);

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
(18, 11, 1, 0, 2),
(19, 12, 6, 1, 0),
(20, 12, 7, 0, 1),
(21, 12, 12, 0, 6),
(22, 13, 1, 0, 2),
(23, 13, 4, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `persona`
--

CREATE TABLE `persona` (
  `Cedula` int(11) NOT NULL,
  `Nombres` varchar(80) NOT NULL,
  `Apellidos` varchar(80) NOT NULL,
  `Celular` int(11) NOT NULL,
  `Correo` varchar(80) DEFAULT 'NO TIENE',
  `Estado` varchar(30) NOT NULL DEFAULT 'INACTIVO'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `persona`
--

INSERT INTO `persona` (`Cedula`, `Nombres`, `Apellidos`, `Celular`, `Correo`, `Estado`) VALUES
(1023981014, 'Diego', 'Cardona', 312510593, 'NO TIENE', 'ACTIVO');

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
-- Table structure for table `rol`
--

CREATE TABLE `rol` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rol`
--

INSERT INTO `rol` (`Id`, `Nombre`) VALUES
(1, 'ADMINISTRADOR');

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

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `Id` int(11) NOT NULL,
  `Cedula` int(11) NOT NULL,
  `Usuario` varchar(20) NOT NULL,
  `Contraseña` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`Id`, `Cedula`, `Usuario`, `Contraseña`) VALUES
(1, 1023981014, 'diego123', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `usuariorol`
--

CREATE TABLE `usuariorol` (
  `Id` int(11) NOT NULL,
  `FRUsuario` int(11) NOT NULL,
  `FRRol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usuariorol`
--

INSERT INTO `usuariorol` (`Id`, `FRUsuario`, `FRRol`) VALUES
(1, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `facturadetalle`
--
ALTER TABLE `facturadetalle`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FRFacturaPedido_` (`FRFacturaPedido`),
  ADD KEY `FRProducto_` (`FRProducto`);

--
-- Indexes for table `facturapedido`
--
ALTER TABLE `facturapedido`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FRPedido_` (`FRPedido`);

--
-- Indexes for table `facturaproducto`
--
ALTER TABLE `facturaproducto`
  ADD PRIMARY KEY (`ID`);

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
-- Indexes for table `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`Cedula`);

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
-- Indexes for table `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `subcategoria`
--
ALTER TABLE `subcategoria`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FR_CategoriaSud` (`FRCategoria`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FRUsuario_` (`Cedula`);

--
-- Indexes for table `usuariorol`
--
ALTER TABLE `usuariorol`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FRUsuario_r` (`FRUsuario`),
  ADD KEY `FRRol_U` (`FRRol`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `factura`
--
ALTER TABLE `factura`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `facturadetalle`
--
ALTER TABLE `facturadetalle`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `facturapedido`
--
ALTER TABLE `facturapedido`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `facturaproducto`
--
ALTER TABLE `facturaproducto`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pedido`
--
ALTER TABLE `pedido`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `pedidoproducto`
--
ALTER TABLE `pedidoproducto`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

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
-- AUTO_INCREMENT for table `rol`
--
ALTER TABLE `rol`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `usuariorol`
--
ALTER TABLE `usuariorol`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `facturadetalle`
--
ALTER TABLE `facturadetalle`
  ADD CONSTRAINT `FRFacturaPedido_` FOREIGN KEY (`FRFacturaPedido`) REFERENCES `facturapedido` (`Id`),
  ADD CONSTRAINT `FRProducto_` FOREIGN KEY (`FRProducto`) REFERENCES `producto` (`Id`);

--
-- Constraints for table `facturapedido`
--
ALTER TABLE `facturapedido`
  ADD CONSTRAINT `FRPedido_` FOREIGN KEY (`FRPedido`) REFERENCES `pedido` (`Id`);

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

--
-- Constraints for table `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FRUsuario_` FOREIGN KEY (`Cedula`) REFERENCES `persona` (`Cedula`);

--
-- Constraints for table `usuariorol`
--
ALTER TABLE `usuariorol`
  ADD CONSTRAINT `FRRol_U` FOREIGN KEY (`FRRol`) REFERENCES `rol` (`Id`),
  ADD CONSTRAINT `FRUsuario_r` FOREIGN KEY (`FRUsuario`) REFERENCES `usuario` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
