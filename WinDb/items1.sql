-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 04, 2017 at 02:50 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `items1`
--

-- --------------------------------------------------------

--
-- Table structure for table `items1`
--

CREATE TABLE `items1` (
  `itemId` bigint(20) NOT NULL,
  `itemName` varchar(50) NOT NULL,
  `abrev` varchar(10) NOT NULL,
  `createdBy` varchar(50) NOT NULL,
  `createdDate` datetime NOT NULL,
  `updatedBy` varchar(50) NOT NULL,
  `updatedDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `productCode` bigint(20) NOT NULL,
  `unitPrice` double NOT NULL,
  `unit` varchar(50) NOT NULL,
  `itemCompanyCode` int(11) NOT NULL,
  `description` varchar(50) NOT NULL,
  `status` enum('close','open') NOT NULL,
  `changeOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items1`
--

INSERT INTO `items1` (`itemId`, `itemName`, `abrev`, `createdBy`, `createdDate`, `updatedBy`, `updatedDate`, `productCode`, `unitPrice`, `unit`, `itemCompanyCode`, `description`, `status`, `changeOn`) VALUES
(1, 'Bralirwa', 'BLR', 'JEAN', '2017-03-02 09:21:33', 'JEAN', '2017-04-25 16:49:14', 5, 127, '', 1, 'ibinyobwa', 'open', '2017-04-25 16:47:02'),
(2, 'KCB Bank', 'KCB', 'JEAN', '2017-03-02 10:03:46', 'JEAN', '2017-04-25 16:49:14', 5, 127, '', 1, 'this is the best bank ever', 'open', '2017-04-25 09:56:03'),
(3, 'Equity Bank', 'EQT', 'JEAN', '2017-03-02 10:15:27', 'JEAN', '2017-04-25 16:49:14', 5, 127, '', 1, 'this bank is for every people and it is doing well', 'open', '2017-04-25 09:56:27'),
(4, 'Crystal Ventures', 'CTV', 'jean', '2017-03-02 10:37:43', 'jean', '2017-04-25 21:17:54', 6, 127, '', 1, 'the group of projects combined', 'open', '2017-04-25 09:56:40'),
(5, 'Bank Of Kigali', 'BK', 'c', '2017-03-06 02:59:52', 'c', '2017-04-25 21:18:49', 5, 127, '', 1, 'this product is the first on the market ever', 'open', '0000-00-00 00:00:00'),
(6, 'Bank Of Kigali', 'BK', 'nana', '2017-03-06 03:12:20', 'nana', '2017-04-25 21:19:41', 5, 127, '', 1, 'this bank has a stable market', 'close', '0000-00-00 00:00:00'),
(9, 'I&M Bank', 'I&M', 'gla', '2017-03-06 05:25:57', 'gla', '2017-04-25 21:19:25', 5, 103, '', 6, 'this bank is the best', 'open', '0000-00-00 00:00:00'),
(10, 'I&M Bank', 'I&M', 'Mbeya', '2017-03-06 10:46:54', 'Mbeya', '2017-04-25 16:49:14', 5, 203, '', 7, 'the bank of africa', 'close', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `items1`
--
ALTER TABLE `items1`
  ADD PRIMARY KEY (`itemId`),
  ADD KEY `productCode` (`productCode`),
  ADD KEY `itemCompanyCode` (`itemCompanyCode`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `items1`
--
ALTER TABLE `items1`
  MODIFY `itemId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
