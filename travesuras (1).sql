-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2022 at 10:10 PM
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
-- Table structure for table `producto`
--

CREATE TABLE `producto` (
  `Id` varchar(10) NOT NULL,
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
-- Indexes for table `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FR_SubCategoriaPro` (`FRSudCategoria`);

--
-- Indexes for table `subcategoria`
--
ALTER TABLE `subcategoria`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FR_CategoriaSud` (`FRCategoria`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `FR_SubCategoriaPro` FOREIGN KEY (`FRSudCategoria`) REFERENCES `subcategoria` (`Id`);

--
-- Constraints for table `subcategoria`
--
ALTER TABLE `subcategoria`
  ADD CONSTRAINT `FR_CategoriaSud` FOREIGN KEY (`FRCategoria`) REFERENCES `categoria` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
