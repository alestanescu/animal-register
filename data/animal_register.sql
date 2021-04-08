-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2021 at 06:33 PM
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
-- Table structure for table `registru`
--

CREATE TABLE `registru` (
  `id` int(11) NOT NULL,
  `nrCrotal` text NOT NULL,
  `sex` text NOT NULL,
  `birthday` date NOT NULL,
  `registrationDate` date NOT NULL,
  `exitDate` date DEFAULT NULL,
  `motherId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `registru`
--

INSERT INTO `registru` (`id`, `nrCrotal`, `sex`, `birthday`, `registrationDate`, `exitDate`, `motherId`) VALUES
(2, 'RO000', 'M', '2021-04-08', '2021-04-08', NULL, NULL),
(3, 'RO001', 'F', '2021-04-01', '2021-04-01', NULL, NULL),
(4, 'RO002', 'M', '2021-04-08', '2021-04-08', NULL, NULL),
(5, 'RO003', 'F', '2021-04-08', '2021-04-08', NULL, 3),
(6, 'RO004', 'M', '2021-04-08', '2021-04-08', NULL, 3);

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for table `registru`
--
ALTER TABLE `registru`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `registru`
--
ALTER TABLE `registru`
  ADD CONSTRAINT `registru_ibfk_1` FOREIGN KEY (`motherId`) REFERENCES `registru` (`id`) ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
