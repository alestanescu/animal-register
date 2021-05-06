-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2021 at 07:19 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `animal_register`
--

-- --------------------------------------------------------

--
-- Table structure for table `deparazitari`
--

CREATE TABLE `deparazitari` (
  `id` int(11) NOT NULL,
  `animalId` int(11) NOT NULL,
  `deparazitare` text DEFAULT NULL,
  `dataDeparazitare` date DEFAULT NULL,
  `produsul` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `deparazitari`
--

INSERT INTO `deparazitari` (`id`, `animalId`, `deparazitare`, `dataDeparazitare`, `produsul`) VALUES
(1, 2, 'Interna', '2020-10-06', 'Adebanz'),
(2, 2, 'Interna', '2021-03-01', 'Adebanz'),
(3, 3, 'Externa', '2021-01-05', 'Ivomec');

-- --------------------------------------------------------

--
-- Table structure for table `registru`
--

CREATE TABLE `registru` (
  `id` int(11) NOT NULL,
  `nrCrotal` text NOT NULL,
  `sex` text NOT NULL,
  `birthday` date NOT NULL,
  `registrationDate` date NOT NULL,
  `exitDate` date DEFAULT NULL,
  `motherId` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `registru`
--

INSERT INTO `registru` (`id`, `nrCrotal`, `sex`, `birthday`, `registrationDate`, `exitDate`, `motherId`, `description`) VALUES
(2, 'RO000', 'M', '2016-04-08', '2021-04-08', NULL, NULL, NULL),
(3, 'RO001', 'F', '2019-04-01', '2021-04-01', NULL, NULL, NULL),
(4, 'RO002', 'M', '2019-04-08', '2020-02-03', NULL, NULL, NULL),
(5, 'RO003', 'F', '2021-04-08', '2021-04-08', NULL, 3, NULL),
(6, 'RO004', 'M', '2021-04-08', '2021-04-08', NULL, 3, NULL),
(7, 'RO007', 'F', '2016-03-23', '2016-03-23', NULL, NULL, NULL),
(8, 'RO007', 'F', '2016-03-23', '2016-03-23', NULL, NULL, NULL),
(9, 'RO008', 'F', '2017-02-21', '2020-01-01', NULL, NULL, NULL),
(10, 'RO009', 'F', '2017-02-21', '2020-01-01', NULL, NULL, NULL),
(11, 'RO010', 'M', '2021-02-04', '2021-02-04', NULL, 7, NULL),
(12, 'RO011', 'F', '2021-02-12', '2021-02-12', NULL, 8, NULL),
(13, 'RO010', 'M', '2021-02-04', '2021-02-04', NULL, 9, NULL),
(14, 'RO011', 'F', '2021-02-12', '2021-02-12', NULL, 10, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `deparazitari`
--
ALTER TABLE `deparazitari`
  ADD PRIMARY KEY (`id`),
  ADD KEY `animalId` (`animalId`);

--
-- Indexes for table `registru`
--
ALTER TABLE `registru`
  ADD PRIMARY KEY (`id`),
  ADD KEY `motherId` (`motherId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `deparazitari`
--
ALTER TABLE `deparazitari`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `registru`
--
ALTER TABLE `registru`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `deparazitari`
--
ALTER TABLE `deparazitari`
  ADD CONSTRAINT `animalId` FOREIGN KEY (`animalId`) REFERENCES `registru` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `registru`
--
ALTER TABLE `registru`
  ADD CONSTRAINT `registru_ibfk_1` FOREIGN KEY (`motherId`) REFERENCES `registru` (`id`) ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
