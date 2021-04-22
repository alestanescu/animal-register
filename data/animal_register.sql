-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Gazdă: 127.0.0.1
-- Timp de generare: apr. 22, 2021 la 05:32 PM
-- Versiune server: 10.4.17-MariaDB
-- Versiune PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Bază de date: `animal_register`
--

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `registru`
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
-- Eliminarea datelor din tabel `registru`
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
-- Indexuri pentru tabele eliminate
--

--
-- Indexuri pentru tabele `registru`
--
ALTER TABLE `registru`
  ADD PRIMARY KEY (`id`),
  ADD KEY `motherId` (`motherId`);

--
-- AUTO_INCREMENT pentru tabele eliminate
--

--
-- AUTO_INCREMENT pentru tabele `registru`
--
ALTER TABLE `registru`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constrângeri pentru tabele eliminate
--

--
-- Constrângeri pentru tabele `registru`
--
ALTER TABLE `registru`
  ADD CONSTRAINT `registru_ibfk_1` FOREIGN KEY (`motherId`) REFERENCES `registru` (`id`) ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
