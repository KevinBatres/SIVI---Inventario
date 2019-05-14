-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2019 at 11:11 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sivi_db`
--
CREATE DATABASE IF NOT EXISTS `sivi_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `sivi_db`;

-- --------------------------------------------------------

--
-- Table structure for table `catalog`
--

CREATE TABLE `catalog` (
  `id_cat` int(255) NOT NULL,
  `id_prod` int(255) NOT NULL,
  `id_prov` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(99) NOT NULL,
  `razon_social` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `rfc` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `correo_e` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `telefono` int(15) NOT NULL,
  `contrasena` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `credito_lim` varchar(1000) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `apellido` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `edad` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `facturas`
--

CREATE TABLE `facturas` (
  `id_factura` int(99) NOT NULL,
  `id_cliente` int(99) NOT NULL,
  `tipo_pago` int(99) NOT NULL,
  `status_cliente` int(99) NOT NULL,
  `id_tipo_cliente` int(99) NOT NULL,
  `total` float NOT NULL,
  `id_venta` int(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `idireccion`
--

CREATE TABLE `idireccion` (
  `id_direccion` int(99) NOT NULL,
  `calle` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `colonia` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `num_int` int(3) NOT NULL,
  `num_ext` int(3) NOT NULL,
  `cp` int(10) NOT NULL,
  `ciudad` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `id_cliente` int(99) NOT NULL,
  `estado` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `pais` varchar(50) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inf_usrs`
--

CREATE TABLE `inf_usrs` (
  `id_infusr` int(5) NOT NULL,
  `nomb_usr` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `ape_usr` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `tel_usr` int(15) NOT NULL,
  `dir_usr` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `fech_usr` date NOT NULL,
  `id_usr` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ingre`
--

CREATE TABLE `ingre` (
  `id_ingre` int(255) NOT NULL,
  `fac_prov` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `id_prov` int(5) NOT NULL,
  `fech_ingre` date NOT NULL,
  `t_pag` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `ingre`
--

INSERT INTO `ingre` (`id_ingre`, `fac_prov`, `id_prov`, `fech_ingre`, `t_pag`) VALUES
(10, '037135', 1, '2019-05-13', 'credito'),
(1, '11111', 1, '2019-04-09', 'contado'),
(3, '12345', 2, '2019-04-10', 'contado'),
(7, '353637', 1, '2019-04-10', 'credito'),
(9, '776655', 1, '2019-07-17', 'credito'),
(4, '77777', 1, '2019-04-10', 'contado'),
(5, '88888', 2, '2019-04-10', 'credito'),
(8, '987123', 2, '2019-06-05', 'contado'),
(6, '99999', 1, '2019-04-10', 'credito');

-- --------------------------------------------------------

--
-- Table structure for table `ingre_det`
--

CREATE TABLE `ingre_det` (
  `id_ingredet` int(255) NOT NULL,
  `id_prod` int(255) NOT NULL,
  `cant` double NOT NULL,
  `p_comp` decimal(10,0) NOT NULL,
  `no_fact` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `ingre_det`
--

INSERT INTO `ingre_det` (`id_ingredet`, `id_prod`, `cant`, `p_comp`, `no_fact`) VALUES
(1, 1, 20, '10000', '11111'),
(2, 2, 20, '10000', '11111'),
(3, 4, 20, '10000', '11111'),
(4, 1, 10, '1500', '12345'),
(5, 1, 5, '1500', '77777'),
(6, 2, 5, '1500', '77777'),
(7, 4, 5, '1500', '77777'),
(8, 1, 5, '10000', '88888'),
(9, 2, 5, '1000', '88888'),
(10, 4, 5, '1000', '88888'),
(11, 5, 15, '25', '99999'),
(12, 1, 5, '1500', '353637'),
(13, 1, 15, '3500', '987123'),
(14, 2, 10, '5678', '987123'),
(15, 4, 5, '89', '987123'),
(16, 1, 10, '7500', '776655'),
(17, 2, 25, '4560', '776655'),
(18, 5, 35, '15', '776655'),
(19, 1, 10, '5000', '037135');

--
-- Triggers `ingre_det`
--
DELIMITER $$
CREATE TRIGGER `ingreprods` AFTER INSERT ON `ingre_det` FOR EACH ROW UPDATE prodcts SET prodcts.cant = prodcts.cant + (SELECT cant FROM ingre_det WHERE ingre_det.id_ingredet = NEW.id_ingredet), prodcts.p_comp = (SELECT p_comp FROM ingre_det WHERE ingre_det.id_ingredet = NEW.id_ingredet) WHERE prodcts.id_prod = NEW.id_prod
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `prodcts`
--

CREATE TABLE `prodcts` (
  `id_prod` int(255) NOT NULL,
  `prod` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `med` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `cant` double(25,2) NOT NULL,
  `marc` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `p_comp` double(25,2) NOT NULL,
  `description` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `prec` double(25,2) NOT NULL,
  `discount` double(25,2) NOT NULL,
  `fech_prod` date NOT NULL,
  `img_url` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `prodcts`
--

INSERT INTO `prodcts` (`id_prod`, `prod`, `med`, `cant`, `marc`, `p_comp`, `description`, `prec`, `discount`, `fech_prod`, `img_url`) VALUES
(1, 'Bomba ', 'xxx', 5.00, 'asad', 5000.00, 'asd', 0.00, 0.00, '2019-04-11', 'pendiente'),
(2, 'Laptop Lenovo', 'xxx', 30.00, 'Lenovo', 4560.00, 'wertwe', 0.00, 0.00, '2019-04-17', 'pendiente'),
(4, 'Codo', 'xxx', 0.00, 'Foras', 89.00, 'asdaSD', 0.00, 0.00, '2019-04-10', 'pendiente'),
(5, 'Te Lisa 1\"', 'xxx', 40.00, 'Foras', 15.00, 'te', 0.00, 0.00, '2019-04-10', 'pendiente');

-- --------------------------------------------------------

--
-- Table structure for table `provs`
--

CREATE TABLE `provs` (
  `id_prov` int(255) NOT NULL,
  `nom_prov` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `tel_prov` int(255) NOT NULL,
  `dir_prov` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `provs`
--

INSERT INTO `provs` (`id_prov`, `nom_prov`, `tel_prov`, `dir_prov`) VALUES
(1, 'Durman', 1243542344, 'Guatemala'),
(2, 'Hidrotecnia', 1324354678, 'Guatemala, Guatemala, Zona 5'),
(3, 'Reflex', 23451243, 'GuatemalaZona8');

-- --------------------------------------------------------

--
-- Table structure for table `salid`
--

CREATE TABLE `salid` (
  `id_salid` int(255) NOT NULL,
  `desc_salid` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `fech_salid` date NOT NULL,
  `responsable` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `fact_salid` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `salid`
--

INSERT INTO `salid` (`id_salid`, `desc_salid`, `fech_salid`, `responsable`, `fact_salid`) VALUES
(1, 'Prueba de Egresos', '2019-04-09', 'Prueba 1', 1),
(2, 'Prueba de egreso 2', '2019-04-10', 'Kevin', 1),
(3, 'prob', '2019-04-10', 'yo2', 1),
(4, 'prob2', '2019-04-10', 'yo3', 1),
(5, 'intalacion', '2019-04-10', 'kevs', 1),
(6, 'facturar2', '2019-04-11', 'kevfac', 0),
(7, 'Priueba post', '2019-04-19', 'kin', 0),
(8, 'Grafi', '2019-05-08', 'Kevs', 0),
(9, 'Grafiacion', '2019-07-24', 'Kevin', 0);

-- --------------------------------------------------------

--
-- Table structure for table `salid_det`
--

CREATE TABLE `salid_det` (
  `id_salidet` int(255) NOT NULL,
  `id_prod` int(255) NOT NULL,
  `cant_salid` double NOT NULL,
  `id_salid` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `salid_det`
--

INSERT INTO `salid_det` (`id_salidet`, `id_prod`, `cant_salid`, `id_salid`) VALUES
(1, 1, 5, 1),
(2, 2, 5, 1),
(3, 4, 5, 1),
(4, 1, 10, 2),
(5, 1, 5, 3),
(6, 2, 5, 3),
(7, 4, 5, 3),
(8, 1, 5, 4),
(9, 1, 5, 5),
(10, 2, 5, 5),
(11, 4, 5, 5),
(12, 5, 5, 5),
(13, 1, 5, 6),
(14, 1, 5, 7),
(15, 2, 5, 7),
(16, 4, 5, 7),
(17, 5, 5, 7),
(18, 1, 25, 8),
(19, 4, 10, 8),
(20, 2, 5, 8),
(21, 1, 15, 9),
(22, 2, 10, 9),
(23, 4, 5, 9);

--
-- Triggers `salid_det`
--
DELIMITER $$
CREATE TRIGGER `egreprods` AFTER INSERT ON `salid_det` FOR EACH ROW UPDATE prodcts SET prodcts.cant = prodcts.cant - (SELECT cant_salid FROM salid_det WHERE salid_det.id_salidet = NEW.id_salidet) WHERE prodcts.id_prod = NEW.id_prod
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tipo_cliente`
--

CREATE TABLE `tipo_cliente` (
  `id_tipo_cliente` int(99) NOT NULL,
  `cliente_fisico` varchar(99) COLLATE utf8_spanish2_ci NOT NULL,
  `cliente_moral` varchar(99) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tipo_desc`
--

CREATE TABLE `tipo_desc` (
  `id_tipo_desc` int(99) NOT NULL,
  `descripcion` varchar(99) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_usuario`
--

CREATE TABLE `t_usuario` (
  `id_type` int(5) NOT NULL,
  `type` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `no_type` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `t_usuario`
--

INSERT INTO `t_usuario` (`id_type`, `type`, `no_type`) VALUES
(1, 'admin', 1),
(2, 'bodega', 2);

-- --------------------------------------------------------

--
-- Table structure for table `usr`
--

CREATE TABLE `usr` (
  `id_usr` int(5) NOT NULL,
  `us` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `pss` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `id_type` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `usr`
--

INSERT INTO `usr` (`id_usr`, `us`, `pss`, `id_type`) VALUES
(1, 'kevin', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 1),
(2, 'bodega', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 2),
(3, 'sha', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ventas`
--

CREATE TABLE `ventas` (
  `id_ventas` int(99) NOT NULL,
  `id_prod` int(255) NOT NULL,
  `precio` int(100) NOT NULL,
  `producto` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `cantidad_producto` int(100) NOT NULL,
  `status_venta` int(100) NOT NULL,
  `desc_manual` int(100) NOT NULL,
  `id_tipo_desc` int(99) NOT NULL,
  `total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `catalog`
--
ALTER TABLE `catalog`
  ADD PRIMARY KEY (`id_cat`),
  ADD KEY `prodcatalog` (`id_prod`),
  ADD KEY `provcatalog` (`id_prov`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indexes for table `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `id_cliente` (`id_cliente`,`id_tipo_cliente`,`id_venta`),
  ADD KEY `id_tipo_cliente` (`id_tipo_cliente`),
  ADD KEY `id_venta` (`id_venta`);

--
-- Indexes for table `idireccion`
--
ALTER TABLE `idireccion`
  ADD PRIMARY KEY (`id_direccion`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indexes for table `inf_usrs`
--
ALTER TABLE `inf_usrs`
  ADD PRIMARY KEY (`id_infusr`),
  ADD KEY `id_usr` (`id_usr`);

--
-- Indexes for table `ingre`
--
ALTER TABLE `ingre`
  ADD PRIMARY KEY (`fac_prov`),
  ADD UNIQUE KEY `fac_prov` (`fac_prov`),
  ADD UNIQUE KEY `id_ingre` (`id_ingre`),
  ADD KEY `prov_ingre` (`id_prov`);

--
-- Indexes for table `ingre_det`
--
ALTER TABLE `ingre_det`
  ADD PRIMARY KEY (`id_ingredet`),
  ADD KEY `prodingre` (`id_prod`),
  ADD KEY `no_fact` (`no_fact`);

--
-- Indexes for table `prodcts`
--
ALTER TABLE `prodcts`
  ADD PRIMARY KEY (`id_prod`);

--
-- Indexes for table `provs`
--
ALTER TABLE `provs`
  ADD PRIMARY KEY (`id_prov`);

--
-- Indexes for table `salid`
--
ALTER TABLE `salid`
  ADD PRIMARY KEY (`id_salid`);

--
-- Indexes for table `salid_det`
--
ALTER TABLE `salid_det`
  ADD PRIMARY KEY (`id_salidet`),
  ADD KEY `prodsalida` (`id_prod`),
  ADD KEY `saliddet` (`id_salid`);

--
-- Indexes for table `tipo_cliente`
--
ALTER TABLE `tipo_cliente`
  ADD PRIMARY KEY (`id_tipo_cliente`);

--
-- Indexes for table `tipo_desc`
--
ALTER TABLE `tipo_desc`
  ADD PRIMARY KEY (`id_tipo_desc`);

--
-- Indexes for table `t_usuario`
--
ALTER TABLE `t_usuario`
  ADD PRIMARY KEY (`id_type`);

--
-- Indexes for table `usr`
--
ALTER TABLE `usr`
  ADD PRIMARY KEY (`id_usr`),
  ADD KEY `user_type` (`id_type`);

--
-- Indexes for table `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_ventas`),
  ADD KEY `id_producto` (`id_prod`,`id_tipo_desc`),
  ADD KEY `id_tipo_desc` (`id_tipo_desc`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `catalog`
--
ALTER TABLE `catalog`
  MODIFY `id_cat` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(99) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `facturas`
--
ALTER TABLE `facturas`
  MODIFY `id_factura` int(99) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `idireccion`
--
ALTER TABLE `idireccion`
  MODIFY `id_direccion` int(99) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inf_usrs`
--
ALTER TABLE `inf_usrs`
  MODIFY `id_infusr` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ingre`
--
ALTER TABLE `ingre`
  MODIFY `id_ingre` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ingre_det`
--
ALTER TABLE `ingre_det`
  MODIFY `id_ingredet` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `prodcts`
--
ALTER TABLE `prodcts`
  MODIFY `id_prod` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `provs`
--
ALTER TABLE `provs`
  MODIFY `id_prov` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `salid`
--
ALTER TABLE `salid`
  MODIFY `id_salid` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `salid_det`
--
ALTER TABLE `salid_det`
  MODIFY `id_salidet` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tipo_cliente`
--
ALTER TABLE `tipo_cliente`
  MODIFY `id_tipo_cliente` int(99) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tipo_desc`
--
ALTER TABLE `tipo_desc`
  MODIFY `id_tipo_desc` int(99) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_usuario`
--
ALTER TABLE `t_usuario`
  MODIFY `id_type` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `usr`
--
ALTER TABLE `usr`
  MODIFY `id_usr` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_ventas` int(99) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `catalog`
--
ALTER TABLE `catalog`
  ADD CONSTRAINT `catalog_ibfk_1` FOREIGN KEY (`id_prod`) REFERENCES `prodcts` (`id_prod`),
  ADD CONSTRAINT `catalog_ibfk_2` FOREIGN KEY (`id_prov`) REFERENCES `provs` (`id_prov`);

--
-- Constraints for table `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `facturas_ibfk_2` FOREIGN KEY (`id_tipo_cliente`) REFERENCES `tipo_cliente` (`id_tipo_cliente`),
  ADD CONSTRAINT `facturas_ibfk_3` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_ventas`);

--
-- Constraints for table `idireccion`
--
ALTER TABLE `idireccion`
  ADD CONSTRAINT `idireccion_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);

--
-- Constraints for table `inf_usrs`
--
ALTER TABLE `inf_usrs`
  ADD CONSTRAINT `inf_usrs_ibfk_1` FOREIGN KEY (`id_usr`) REFERENCES `usr` (`id_usr`);

--
-- Constraints for table `ingre`
--
ALTER TABLE `ingre`
  ADD CONSTRAINT `ingre_ibfk_1` FOREIGN KEY (`id_prov`) REFERENCES `provs` (`id_prov`);

--
-- Constraints for table `ingre_det`
--
ALTER TABLE `ingre_det`
  ADD CONSTRAINT `ingre_det_ibfk_1` FOREIGN KEY (`id_prod`) REFERENCES `prodcts` (`id_prod`),
  ADD CONSTRAINT `ingre_det_ibfk_2` FOREIGN KEY (`no_fact`) REFERENCES `ingre` (`fac_prov`);

--
-- Constraints for table `salid_det`
--
ALTER TABLE `salid_det`
  ADD CONSTRAINT `salid_det_ibfk_1` FOREIGN KEY (`id_prod`) REFERENCES `prodcts` (`id_prod`),
  ADD CONSTRAINT `salid_det_ibfk_2` FOREIGN KEY (`id_salid`) REFERENCES `salid` (`id_salid`);

--
-- Constraints for table `usr`
--
ALTER TABLE `usr`
  ADD CONSTRAINT `usr_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `t_usuario` (`id_type`);

--
-- Constraints for table `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_tipo_desc`) REFERENCES `tipo_desc` (`id_tipo_desc`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_prod`) REFERENCES `prodcts` (`id_prod`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
