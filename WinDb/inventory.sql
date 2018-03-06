-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 04, 2017 at 02:51 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `loginId` varchar(100) NOT NULL,
  `pwd` varchar(250) NOT NULL,
  `names` varchar(100) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `residence` varchar(250) DEFAULT NULL,
  `workPlace` varchar(250) DEFAULT NULL,
  `account_type` enum('user','admin') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `loginId`, `pwd`, `names`, `phone`, `email`, `residence`, `workPlace`, `account_type`) VALUES
(1, 'admin', 'admin', 'Eric Mucyo', '0788880000', 'admin@trad.com', 'kimironko', 'town', 'admin'),
(4, 'cmuhirwa', 'clement123', 'clement', '0784848236', 'muhirwaclement@gmail.com', 'kimironko', 'town', 'user'),
(3, 'nana', 'nana', 'nana', '0788551893', 'dhbcjh', 'djbjb', 'dsvjhbsdjbh', 'user'),
(7, 'rehema', 'rehema123', 'REHEMA Shaban', '0788578657', 'rehegiraict@gmail.com', 'kigali', 'kigali', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `loginId` (`loginId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
