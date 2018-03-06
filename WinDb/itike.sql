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
-- Database: `itike`
--

-- --------------------------------------------------------

--
-- Table structure for table `eventing_pricing`
--

CREATE TABLE `eventing_pricing` (
  `id` int(11) NOT NULL,
  `event_code` int(11) NOT NULL,
  `pricing_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eventing_pricing`
--

INSERT INTO `eventing_pricing` (`id`, `event_code`, `pricing_code`) VALUES
(43, 74, 99),
(44, 75, 100),
(45, 75, 101),
(46, 76, 102),
(47, 76, 103),
(48, 77, 104),
(49, 77, 105);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id_event` int(11) NOT NULL,
  `Event_Name` varchar(100) NOT NULL,
  `Event_Cover` varchar(100) NOT NULL,
  `phone` text NOT NULL,
  `date_happ` date NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id_event`, `Event_Name`, `Event_Cover`, `phone`, `date_happ`, `user_id`) VALUES
(74, 'kLab concert', 'download.png', '0782178563', '2017-01-31', 3),
(75, 'Kigali count down', 'Cz_Ay_SXcAAzGtB.jpg', '0782178563', '2017-01-31', 3),
(76, 'Airtel concert', 'download (1).png', '0782178563', '2017-02-26', 1),
(77, 'shora concert', 'Penguins.jpg', '0785413311', '2017-01-31', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pricing`
--

CREATE TABLE `pricing` (
  `pricing_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `event_property` varchar(100) NOT NULL,
  `event_seats` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pricing`
--

INSERT INTO `pricing` (`pricing_id`, `price`, `event_property`, `event_seats`) VALUES
(99, 10000, 'All', 200),
(100, 20000, 'VIP', 1000),
(101, 10000, 'Other', 300),
(102, 10000, 'VIP', 100),
(103, 5000, 'Other', 200),
(104, 2000, 'vip', 20),
(105, 1000, 'other', 50);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `customer_pay_id` int(11) NOT NULL,
  `cust_event_choose` varchar(100) NOT NULL,
  `cust_pay_phone` text NOT NULL,
  `amount` int(11) NOT NULL,
  `cust_event_seats` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`customer_pay_id`, `cust_event_choose`, `cust_pay_phone`, `amount`, `cust_event_seats`, `user_id`) VALUES
(17, '74', '07746154151', 10000, '99', 3),
(18, '75', '.0321515646468468468', 20000, '100', 3),
(19, '75', '078542666', 20000, '101', 3),
(20, '75', '', 20000, '100', 3),
(21, '75', '07855266544', 10000, '101', 3),
(22, '74', '07746154151', 10000, '99', 3),
(23, '74', '07854545454545', 10000, '99', 1),
(24, '76', '07555165465165', 5000, '103', 1),
(25, '75', '078523654', 10000, '101', 2),
(26, '76', '0785214566', 10000, '102', 2),
(27, '77', '078541236', 1000, '105', 1),
(28, '75', '07854454545431', 20000, '100', 3),
(29, '76', '07854126977', 10000, '102', 1),
(30, '76', '0785412544', 5000, '103', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `password` int(11) NOT NULL,
  `phone` text NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `fullname`, `password`, `phone`, `status`) VALUES
(1, 'Muhoza yves', 12345, '0782178563', 'admin'),
(2, 'Mugisha clement', 12345, '0783191816', 'client'),
(3, 'clement', 12345, '0784848236', 'client');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `eventing_pricing`
--
ALTER TABLE `eventing_pricing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id_event`);

--
-- Indexes for table `pricing`
--
ALTER TABLE `pricing`
  ADD PRIMARY KEY (`pricing_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`customer_pay_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `eventing_pricing`
--
ALTER TABLE `eventing_pricing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id_event` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;
--
-- AUTO_INCREMENT for table `pricing`
--
ALTER TABLE `pricing`
  MODIFY `pricing_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;
--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `customer_pay_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
