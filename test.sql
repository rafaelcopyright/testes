-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 17-Set-2018 às 01:47
-- Versão do servidor: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cliente`
--

CREATE TABLE `tb_cliente` (
  `id_cliente` int(11) NOT NULL,
  `nome_cliente` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_cliente`
--

INSERT INTO `tb_cliente` (`id_cliente`, `nome_cliente`) VALUES
(1, 'Galatéia'),
(2, 'Milvus');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_dados`
--

CREATE TABLE `tb_dados` (
  `id_dados` int(11) NOT NULL,
  `cliente_id_cliente` int(11) NOT NULL,
  `mes` int(11) NOT NULL,
  `ano` int(11) NOT NULL,
  `visitas` int(11) NOT NULL,
  `leads` int(11) NOT NULL,
  `oportunidades` int(11) NOT NULL,
  `vendas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_dados`
--

INSERT INTO `tb_dados` (`id_dados`, `cliente_id_cliente`, `mes`, `ano`, `visitas`, `leads`, `oportunidades`, `vendas`) VALUES
(1, 1, 6, 2018, 1250, 280, 10, 2),
(2, 2, 6, 2018, 7800, 750, 125, 45),
(3, 1, 7, 2018, 1450, 250, 25, 3),
(4, 2, 7, 2018, 6900, 200, 60, 10),
(5, 1, 8, 2018, 1560, 155, 35, 5),
(6, 2, 8, 2018, 8700, 280, 115, 35),
(8, 1, 9, 2018, 780, 100, 25, 0),
(9, 2, 9, 2018, 3500, 150, 30, 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_cliente`
--
ALTER TABLE `tb_cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indexes for table `tb_dados`
--
ALTER TABLE `tb_dados`
  ADD PRIMARY KEY (`id_dados`),
  ADD KEY `fk_id_cliente` (`cliente_id_cliente`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_cliente`
--
ALTER TABLE `tb_cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_dados`
--
ALTER TABLE `tb_dados`
  MODIFY `id_dados` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `tb_dados`
--
ALTER TABLE `tb_dados`
  ADD CONSTRAINT `fk_id_cliente` FOREIGN KEY (`cliente_id_cliente`) REFERENCES `tb_cliente` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
