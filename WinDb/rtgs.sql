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
-- Database: `rtgs`
--

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  `bankcolor` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `name`, `type`, `bankcolor`) VALUES
(1, 'MTN Mobile Money', 'Telecom', '#ffbe00'),
(2, 'TIGO Cash', 'Telecom', '#002e6e'),
(3, 'AIRTEL Money', 'Telecom', '#ed1b24'),
(5, 'BANK OF KIGALI (BK)', 'bank', '#0c4ca0'),
(6, 'Bank Populaire du Rwanda (BPR)', 'bank', NULL),
(7, 'URWEGO OPPORTUNITY BANK', 'bank', NULL),
(8, 'ZIGAMA CREDIT AND SAVING SOCIETY', 'bank', NULL),
(9, 'COGEBANQUE', 'bank', NULL),
(10, 'GTBANK', 'bank', NULL),
(11, 'DEVELOPMENT BANK OF RWANDA (BRD)', 'bank', NULL),
(12, 'KCB', 'bank', '#8cc43d'),
(13, 'ECOBANK', 'bank', NULL),
(14, 'EQUITY', 'bank', '#aa4c0f'),
(15, 'I&M BANK', 'bank', NULL),
(16, 'AB BANK', 'bank', NULL),
(17, 'AGASEKE BANK', 'bank', NULL),
(18, 'UNGUKA', 'bank', NULL),
(19, 'ACCESS BANK RWANDA LTD', 'bank', NULL),
(20, 'CRANE BANK', 'bank', NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `groupbalance`
--
CREATE TABLE `groupbalance` (
`groupId` int(11)
,`accountNumber` varchar(50)
,`Balance` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `accountNumber` varchar(50) NOT NULL,
  `bankId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `groupId`, `accountNumber`, `bankId`) VALUES
(1, 1, '0784848236', 1),
(2, 17, '0784848236', 1),
(3, 18, '0788751595', 1),
(4, 3, '0725594646', 2),
(5, 2, '0784848236', 1),
(6, 19, '0784848236', 1),
(7, 20, '0784848236', 1),
(8, 21, '0725594646', 2),
(9, 22, '0725594646', 2),
(10, 23, '004556-123432', 5),
(11, 24, '897668-97876', 6),
(12, 25, 'fgf453', 8),
(13, 26, 'DFGDF453', 11),
(14, 27, '0784848236', 1),
(15, 28, '0784848236', 1),
(16, 29, '0788424547', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mnoapi`
--

CREATE TABLE `mnoapi` (
  `id` bigint(30) NOT NULL,
  `time` datetime NOT NULL,
  `transactionId` varchar(30) NOT NULL,
  `policyNumber` varchar(30) NOT NULL,
  `invoiceNumber` varchar(30) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `phone2` varchar(30) NOT NULL,
  `amount` varchar(30) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `nationalId` varchar(30) NOT NULL,
  `information` varchar(50) NOT NULL,
  `information2` varchar(50) NOT NULL,
  `agentName` varchar(30) NOT NULL,
  `agentId` varchar(30) NOT NULL,
  `feedback` varchar(50) NOT NULL,
  `balance` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `invoiceNumber` varchar(11) NOT NULL,
  `operation` enum('CREDIT','DEBIT') NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `forGroupId` int(11) NOT NULL,
  `3rdparty` varchar(20) NOT NULL,
  `3rdpartyId` varchar(50) NOT NULL,
  `bankCode` int(11) DEFAULT NULL,
  `transaction_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `actorName` varchar(50) NOT NULL,
  `status` varchar(30) NOT NULL,
  `accountNumber` varchar(50) NOT NULL,
  `cardType` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `contacts` varchar(20) NOT NULL,
  `privateor` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `invoiceNumber`, `operation`, `amount`, `forGroupId`, `3rdparty`, `3rdpartyId`, `bankCode`, `transaction_date`, `actorName`, `status`, `accountNumber`, `cardType`, `email`, `contacts`, `privateor`) VALUES
(1, '', 'DEBIT', 500, 1, 'TORQUE', '', 1, '2017-05-31 20:17:19', 'Muhirwa Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(2, '', 'CREDIT', 500, 1, 'TORQUE', '', 2, '2017-05-31 20:17:19', 'MONITOR', 'NETWORK ERROR', '0725594646', '', '', '', ''),
(3, '', 'DEBIT', 0, 0, 'TORQUE', '', 0, '2017-06-03 10:14:34', 'Muhirwa Clement', 'BALANCE', '0', '', '', '', ''),
(4, '', 'CREDIT', 0, 0, 'TORQUE', '', 0, '2017-06-03 10:14:34', '0Rwf', 'BALANCE', '', '', '', '', ''),
(5, '', 'DEBIT', 500, 1, 'TORQUE', '1496484885722', 1, '2017-06-03 10:14:44', 'Muhirwa Clement', 'APPROVED', '0784848236', '', '', '', ''),
(6, '', 'CREDIT', 500, 1, 'TORQUE', '', 0, '2017-06-03 10:14:44', 'MONITOR', 'PENDING', '', '', '', '', ''),
(7, '', 'DEBIT', 0, 0, 'TORQUE', '', 0, '2017-06-03 10:25:42', 'Muhirwa Clement', 'BALANCE', '0', '', '', '', ''),
(8, '', 'CREDIT', 0, 0, 'TORQUE', '', 0, '2017-06-03 10:25:42', '0Rwf', 'BALANCE', '', '', '', '', ''),
(9, '', 'DEBIT', 500, 1, 'TORQUE', '1496485558083', 0, '2017-06-03 10:25:58', 'Muhirwa Clement', 'DECLINED', '0', '', '', '', ''),
(10, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-03 10:25:58', 'MONITOR', 'CALLED', '0784848236', '', '', '', ''),
(11, '', 'DEBIT', 0, 0, 'TORQUE', '', 0, '2017-06-03 10:28:12', 'Muhirwa Clement', 'BALANCE', '0', '', '', '', ''),
(12, '', 'CREDIT', 0, 0, 'TORQUE', '', 0, '2017-06-03 10:28:12', '0Rwf', 'BALANCE', '', '', '', '', ''),
(13, '', 'DEBIT', 800, 1, 'TORQUE', '1496486355033', 1, '2017-06-03 10:39:15', 'Clement', 'PENDING', '0784848236', '', '', '', ''),
(14, '', 'CREDIT', 800, 1, 'TORQUE', '', 1, '2017-06-03 10:39:15', 'Muhirwa Clement', 'CALLED', '0784848236', '', '', '', ''),
(15, '', 'DEBIT', 0, 0, 'TORQUE', '', 0, '2017-06-03 13:47:37', 'Muhirwa Clement', 'BALANCE', '0', '', '', '', ''),
(16, '', 'CREDIT', 0, 0, 'TORQUE', '', 0, '2017-06-03 13:47:37', '0Rwf', 'BALANCE', '', '', '', '', ''),
(17, '', 'DEBIT', 500, 1, 'TORQUE', '1496497836308', 1, '2017-06-03 13:50:37', 'Muhirwa Clement', 'TARGET_AUTHORIZATION_ERROR', '0784848236', '', '', '', ''),
(18, '', 'CREDIT', 500, 1, 'TORQUE', '', 2, '2017-06-03 13:50:37', 'MONITOR', 'CALLED', '0725594646', '', '', '', ''),
(19, '', 'DEBIT', 500, 1, 'TORQUE', '1496497872335', 2, '2017-06-03 13:51:13', 'Muhirwa Clement', 'REQUESTED', '0725594646', '', '', '', ''),
(20, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-03 13:51:13', 'MONITOR', 'CALLED', '0784848236', '', '', '', ''),
(21, '', 'DEBIT', 200, 1, 'TORQUE', '1496498031561', 1, '2017-06-03 13:53:52', 'Muhirwa Clement', 'DECLINED', '0784848236', '', '', '', ''),
(22, '', 'CREDIT', 200, 1, 'TORQUE', '', 1, '2017-06-03 13:53:52', 'MONITOR', 'CALLED', '0784848236', '', '', '', ''),
(23, '', 'DEBIT', 500, 1, 'TORQUE', '1496498202496', 2, '2017-06-03 13:56:43', 'Muhirwa Clement', 'REQUESTED', '0726396284', '', '', '', ''),
(24, '', 'CREDIT', 500, 1, 'TORQUE', '', 2, '2017-06-03 13:56:43', 'MONITOR', 'CALLED', '0725594646', '', '', '', ''),
(25, '', 'DEBIT', 900, 1, 'TORQUE', '', 5, '2017-06-04 02:20:40', 'Test Visa', 'CALLED', 'VISA/MASTER', '', '', '', ''),
(26, '', 'CREDIT', 900, 1, 'TORQUE', '', 1, '2017-06-04 02:20:40', 'cle test', 'CALLED', '0784848236', '', '', '', ''),
(27, '', 'DEBIT', 9000, 1, 'BK', '', 5, '2017-06-04 02:25:30', 'JBJHB', 'CALLED', 'VISA/MASTER', '', '', '', ''),
(28, '', 'CREDIT', 9000, 1, 'TORQUE', '', 1, '2017-06-04 02:25:30', 'cle test', 'CALLED', '0784848236', '', '', '', ''),
(29, '', 'DEBIT', 2000, 1, 'BK', '', 5, '2017-06-04 02:26:11', 'hvhvjh', 'CALLED', 'VISA/MASTER', '', '', '', ''),
(30, '', 'CREDIT', 2000, 1, 'TORQUE', '', 1, '2017-06-04 02:26:11', 'cle test', 'CALLED', '0784848236', '', '', '', ''),
(31, '', 'DEBIT', 8000, 1, 'BK', '', 5, '2017-06-04 02:27:50', 'hgvhghgj', 'CALLED', 'VISA/MASTER', 'VISA', '', '', ''),
(32, '', 'CREDIT', 8000, 1, 'TORQUE', '', 1, '2017-06-04 02:27:50', 'cle test', 'CALLED', '0784848236', '', '', '', ''),
(33, '', 'DEBIT', 9000, 1, 'BK', '', 5, '2017-06-04 02:34:49', 'hgvhg', 'CALLED', 'VISA/MASTER', '', '', '', ''),
(34, '', 'CREDIT', 9000, 1, 'TORQUE', '', 1, '2017-06-04 02:34:49', 'cle test', 'CALLED', '0784848236', '', '', '', ''),
(35, '', 'DEBIT', 9000, 1, 'BK', '', 5, '2017-06-04 02:40:23', 'jhbmb', 'CALLED', 'VISA/MASTER', '', '', '', ''),
(36, '', 'CREDIT', 9000, 1, 'TORQUE', '', 1, '2017-06-04 02:40:23', 'cle test', 'CALLED', '0784848236', '', '', '', ''),
(37, '', 'DEBIT', 900, 1, 'BK', '', 5, '2017-06-04 07:22:36', '', 'CALLED', 'VISA/MASTER', '', '', '', ''),
(38, '', 'CREDIT', 900, 1, 'TORQUE', '', 1, '2017-06-04 07:22:36', 'cle test', 'CALLED', '0784848236', '', '', '', ''),
(39, '', 'DEBIT', 9000, 1, 'BK', '13', 5, '2017-06-05 08:06:28', 'uhjkkn', 'Declined', 'VISA/MASTER', '', 'jhbhj@fdcgfc.hhg', '', ''),
(40, '', 'CREDIT', 9000, 1, 'TORQUE', '', 1, '2017-06-05 08:06:28', 'Cle Test', 'CALLED', '', '', '', '', ''),
(41, '', 'DEBIT', 8000, 1, 'BK', '', 5, '2017-06-05 08:16:01', 'Gatete Yves', 'CALLED', 'VISA/MASTER', '', 'gateteyves@yahoo.com', '', ''),
(42, '', 'CREDIT', 8000, 1, 'TORQUE', '', 1, '2017-06-05 08:16:01', 'Cle Test', 'CALLED', 'muhirwaclement@gmail.com', '', '', '', ''),
(43, '', 'DEBIT', 5000, 1, 'BK', '14', 5, '2017-06-05 08:17:26', 'GATETE Yves', 'Declined', 'VISA/MASTER', '', 'gateteyves@gmail.com', '', ''),
(44, '', 'CREDIT', 5000, 1, 'TORQUE', '', 1, '2017-06-05 08:17:26', 'Cle Test', 'CALLED', 'muhirwaclement@gmail.com', '', '', '', ''),
(45, '', 'DEBIT', 9000, 1, 'BK', '15', 5, '2017-06-05 08:20:50', 'GATETE Yves', 'Declined', 'VISA/MASTER', '', 'gateteyves@gmail.com', '', ''),
(46, '', 'CREDIT', 9000, 1, 'TORQUE', '', 1, '2017-06-05 08:20:50', 'Cle Test', 'CALLED', '0784848236', '', 'muhirwaclement@gmail.com', '', ''),
(47, '', 'DEBIT', 8000, 1, 'BK', '', 5, '2017-06-06 11:00:34', 'Test this', 'CALLED', 'VISA/MASTER', '', 'email@gmail.com', '', ''),
(48, '', 'CREDIT', 8000, 1, 'TORQUE', '', 1, '2017-06-06 11:00:34', 'MUHIRWA Clement', 'CALLED', '0784848236', '', 'muhirwaclement@gmail.com', '', ''),
(49, '', 'DEBIT', 2000, 1, 'BK', '', 5, '2017-06-06 11:06:57', 'Yes Test it', 'CALLED', 'VISA/MASTER', '', 'test@email.test', '', ''),
(50, '', 'CREDIT', 2000, 1, 'TORQUE', '', 1, '2017-06-06 11:06:57', 'MUHIRWA Clement', 'CALLED', '0784848236', '', 'muhirwaclement@gmail.com', '', ''),
(51, '', 'DEBIT', 0, 0, 'TORQUE', '', 0, '2017-06-06 16:56:03', 'Muhirwa Clement', 'NETWORK ERROR', '0', '', '', '', ''),
(52, '', 'CREDIT', 0, 0, 'TORQUE', '', 0, '2017-06-06 16:56:03', 'CheckBalance', 'NETWORK ERROR', '', '', '', '', ''),
(53, '', 'DEBIT', 0, 0, 'TORQUE', '', 0, '2017-06-07 08:49:58', 'Muhirwa Clement', 'NETWORK ERROR', '0', '', '', '', ''),
(54, '', 'CREDIT', 0, 0, 'TORQUE', '', 0, '2017-06-07 08:49:58', 'CheckBalance', 'NETWORK ERROR', '', '', '', '', ''),
(55, '', 'DEBIT', 5000, 19, 'BK', '', 5, '2017-06-07 09:06:22', 'Muhirwa Clement', 'CALLED', 'VISA/MASTER', '', 'muhirwaclement@gmail.com', '', ''),
(56, '', 'CREDIT', 5000, 19, 'TORQUE', '', 1, '2017-06-07 09:06:22', 'MUHIRWA Clement', 'CALLED', '0784848236', '', 'muhirwaclement@gmail.com', '', ''),
(57, '', 'DEBIT', 0, 0, 'TORQUE', '', 0, '2017-06-07 10:00:07', 'Muhirwa Clement', 'NETWORK ERROR', '0', '', '', '', ''),
(58, '', 'CREDIT', 0, 0, 'TORQUE', '', 0, '2017-06-07 10:00:07', 'CheckBalance', 'NETWORK ERROR', '', '', '', '', ''),
(59, '', 'DEBIT', 0, 0, 'TORQUE', '', 0, '2017-06-07 10:01:00', 'Muhirwa Clement', 'NETWORK ERROR', '0', '', '', '', ''),
(60, '', 'CREDIT', 0, 0, 'TORQUE', '', 0, '2017-06-07 10:01:00', 'CheckBalance', 'NETWORK ERROR', '', '', '', '', ''),
(61, '', 'DEBIT', 0, 0, 'TORQUE', '', 0, '2017-06-07 10:55:21', 'Muhirwa Clement', 'NETWORK ERROR', '0', '', '', '', ''),
(62, '', 'CREDIT', 0, 0, 'TORQUE', '', 0, '2017-06-07 10:55:21', 'CheckBalance', 'NETWORK ERROR', '', '', '', '', ''),
(63, '', 'DEBIT', 0, 0, 'TORQUE', '', 0, '2017-06-07 10:56:12', 'Muhirwa Clement', 'NETWORK ERROR', '0', '', '', '', ''),
(64, '', 'CREDIT', 0, 0, 'TORQUE', '', 0, '2017-06-07 10:56:12', 'CheckBalance', 'NETWORK ERROR', '', '', '', '', ''),
(65, '', 'DEBIT', 0, 0, 'TORQUE', '', 0, '2017-06-07 10:56:17', 'Muhirwa Clement', 'NETWORK ERROR', '0', '', '', '', ''),
(66, '', 'CREDIT', 0, 0, 'TORQUE', '', 0, '2017-06-07 10:56:17', 'CheckBalance', 'NETWORK ERROR', '', '', '', '', ''),
(67, '', 'DEBIT', 0, 0, 'TORQUE', '', 0, '2017-06-07 10:58:29', 'Muhirwa Clement', 'NETWORK ERROR', '0', '', '', '', ''),
(68, '', 'CREDIT', 0, 0, 'TORQUE', '', 0, '2017-06-07 10:58:29', 'CheckBalance', 'NETWORK ERROR', '', '', '', '', ''),
(69, '', 'DEBIT', 0, 0, 'TORQUE', '', 0, '2017-06-07 10:58:32', 'Muhirwa Clement', 'NETWORK ERROR', '0', '', '', '', ''),
(70, '', 'CREDIT', 0, 0, 'TORQUE', '', 0, '2017-06-07 10:58:32', 'CheckBalance', 'NETWORK ERROR', '', '', '', '', ''),
(71, '', 'DEBIT', 0, 0, 'TORQUE', '', 0, '2017-06-07 11:06:41', 'Muhirwa Clement', 'NETWORK ERROR', '0', '', '', '', ''),
(72, '', 'CREDIT', 0, 0, 'TORQUE', '', 0, '2017-06-07 11:06:41', 'CheckBalance', 'NETWORK ERROR', '', '', '', '', ''),
(73, '', 'DEBIT', 0, 0, 'TORQUE', '', 0, '2017-06-07 18:38:47', 'Muhirwa Clement', 'BALANCE', '0', '', '', '', ''),
(74, '', 'CREDIT', 0, 0, 'TORQUE', '', 0, '2017-06-07 18:38:47', '0Rwf', 'BALANCE', '', '', '', '', ''),
(75, '', 'DEBIT', 0, 0, 'TORQUE', '', 0, '2017-06-08 14:15:48', 'Muhirwa Clement', 'NETWORK ERROR', '0', '', '', '', ''),
(76, '', 'CREDIT', 0, 0, 'TORQUE', '', 0, '2017-06-08 14:15:48', 'CheckBalance', 'NETWORK ERROR', '', '', '', '', ''),
(77, '', 'DEBIT', 0, 0, 'TORQUE', '', 0, '2017-06-08 14:16:41', 'Muhirwa Clement', 'NETWORK ERROR', '0', '', '', '', ''),
(78, '', 'CREDIT', 0, 0, 'TORQUE', '', 0, '2017-06-08 14:16:41', 'CheckBalance', 'NETWORK ERROR', '', '', '', '', ''),
(79, '', 'DEBIT', 800, 1, 'TORQUE', '', 1, '2017-06-08 17:08:28', 'Muhirwa Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(80, '', 'CREDIT', 800, 1, 'TORQUE', '', 1, '2017-06-08 17:08:28', 'MONITOR', 'NETWORK ERROR', '0788751595', '', '', '', ''),
(81, '', 'DEBIT', 800, 1, 'TORQUE', '', 1, '2017-06-08 17:08:43', 'Muhirwa Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(82, '', 'CREDIT', 800, 1, 'TORQUE', '', 1, '2017-06-08 17:08:43', 'MONITOR', 'NETWORK ERROR', '0788751595', '', '', '', ''),
(83, '', 'DEBIT', 500, 1, 'TORQUE', '1497009221857', 1, '2017-06-09 11:53:41', 'Muhirwa Clement', 'REQUESTED', '0788747516', '', '', '', ''),
(84, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-09 11:53:41', 'MONITOR', 'CALLED', '0784848236', '', '', '', ''),
(85, '', 'DEBIT', 0, 0, 'TORQUE', '', 0, '2017-06-09 11:58:06', 'Muhirwa Clement', 'BALANCE', '0', '', '', '', ''),
(86, '', 'CREDIT', 0, 0, 'TORQUE', '', 0, '2017-06-09 11:58:06', '0Rwf', 'BALANCE', '', '', '', '', ''),
(87, '', 'DEBIT', 500, 1, 'TORQUE', '1497009512119', 1, '2017-06-09 11:58:34', 'Muhirwa Clement', '', '0788747516', '', '', '', ''),
(88, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-09 11:58:34', 'MONITOR', '', '0784848236', '', '', '', ''),
(89, '', 'DEBIT', 0, 0, 'TORQUE', '', 0, '2017-06-09 11:59:45', 'Muhirwa Clement', 'NETWORK ERROR', '0', '', '', '', ''),
(90, '', 'CREDIT', 0, 0, 'TORQUE', '', 0, '2017-06-09 11:59:45', 'CheckBalance', 'NETWORK ERROR', '', '', '', '', ''),
(91, '', 'DEBIT', 0, 0, 'TORQUE', '', 0, '2017-06-09 12:00:49', 'Muhirwa Clement', 'BALANCE', '0', '', '', '', ''),
(92, '', 'CREDIT', 0, 0, 'TORQUE', '', 0, '2017-06-09 12:00:49', '0Rwf', 'BALANCE', '', '', '', '', ''),
(93, '', 'DEBIT', 0, 0, 'TORQUE', '', 0, '2017-06-09 12:01:21', 'Muhirwa Clement', 'NETWORK ERROR', '0', '', '', '', ''),
(94, '', 'CREDIT', 0, 0, 'TORQUE', '', 0, '2017-06-09 12:01:21', 'CheckBalance', 'NETWORK ERROR', '', '', '', '', ''),
(95, '', 'DEBIT', 700, 1, 'TORQUE', '', 1, '2017-06-09 13:58:00', 'fbc', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(96, '', 'CREDIT', 700, 1, 'TORQUE', '', 1, '2017-06-09 13:58:00', 'MUHIRWA Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(97, '', 'DEBIT', 0, 0, 'TORQUE', '', 0, '2017-06-09 14:03:18', 'Muhirwa Clement', 'NETWORK ERROR', '0', '', '', '', ''),
(98, '', 'CREDIT', 0, 0, 'TORQUE', '', 0, '2017-06-09 14:03:18', 'CheckBalance', 'NETWORK ERROR', '', '', '', '', ''),
(99, '', 'DEBIT', 800, 1, 'BK', '', 5, '2017-06-09 14:03:41', 'bcvb', 'CALLED', 'VISA/MASTER', '', 'fbdf@fhfd.fgd', '', ''),
(100, '', 'CREDIT', 800, 1, 'TORQUE', '', 1, '2017-06-09 14:03:41', 'MUHIRWA Clement', 'CALLED', '0784848236', '', 'muhirwaclement@gmail.com', '', ''),
(101, '', 'DEBIT', 500, 1, 'TORQUE', '', 1, '2017-06-09 17:35:32', 'Sample User', 'NETWORK ERROR', '0788752346', '', '', '', ''),
(102, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-09 17:35:32', 'MUHIRWA Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(103, '', 'DEBIT', 500, 1, 'TORQUE', '1497094739190', 1, '2017-06-10 11:39:01', 'Muhirwa Clement', 'TARGET_AUTHORIZATION_ERROR', '0784848236', '', '', '', ''),
(104, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-10 11:39:01', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(105, '', 'DEBIT', 9000, 1, 'TORQUE', '', 1, '2017-06-11 15:49:09', 'nmnmbm ', 'NETWORK ERROR', '07809808909', '', '', '', ''),
(106, '', 'CREDIT', 9000, 1, 'TORQUE', '', 1, '2017-06-11 15:49:09', 'MUHIRWA Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(107, '', 'DEBIT', 90000, 1, 'TORQUE', '', 1, '2017-06-11 15:49:31', 'kjnkjn', 'NETWORK ERROR', '07809980988', '', '', '', ''),
(108, '', 'CREDIT', 90000, 1, 'TORQUE', '', 1, '2017-06-11 15:49:31', 'MUHIRWA Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(109, '', 'DEBIT', 8000, 1, 'TORQUE', '', 1, '2017-06-11 15:58:06', 'Ntuza wo kwantuza', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(110, '', 'CREDIT', 8000, 1, 'TORQUE', '', 1, '2017-06-11 15:58:06', 'MUHIRWA Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(111, '', 'DEBIT', 8000, 1, 'TORQUE', '', 1, '2017-06-11 15:59:43', 'sxhjb', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(112, '', 'CREDIT', 8000, 1, 'TORQUE', '', 1, '2017-06-11 15:59:43', 'MUHIRWA Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(113, '', 'DEBIT', 8000, 1, 'TORQUE', '', 1, '2017-06-11 16:00:38', 'scdjnk', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(114, '', 'CREDIT', 8000, 1, 'TORQUE', '', 1, '2017-06-11 16:00:38', 'MUHIRWA Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(115, '', 'DEBIT', 8000, 1, 'TORQUE', '', 1, '2017-06-11 16:01:31', 'Alice', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(116, '', 'CREDIT', 8000, 1, 'TORQUE', '', 1, '2017-06-11 16:01:31', 'MUHIRWA Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(117, '', 'DEBIT', 9000, 1, 'TORQUE', '', 1, '2017-06-11 16:06:17', 'Assumpta MUSHIMISHA', 'NETWORK ERROR', '0788751595', '', '', '', ''),
(118, '', 'CREDIT', 9000, 1, 'TORQUE', '', 1, '2017-06-11 16:06:17', 'MUHIRWA Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(119, '', 'DEBIT', 9000, 1, 'TORQUE', '', 1, '2017-06-11 16:08:13', 'Mutoni Nanah', 'NETWORK ERROR', '0788551893', '', '', '', ''),
(120, '', 'CREDIT', 9000, 1, 'TORQUE', '', 1, '2017-06-11 16:08:13', 'MUHIRWA Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(121, '', 'DEBIT', 9000, 1, 'TORQUE', '', 1, '2017-06-11 16:09:20', 'Muhirwa Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(122, '', 'CREDIT', 9000, 1, 'TORQUE', '', 1, '2017-06-11 16:09:20', 'MUHIRWA Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(123, '', 'DEBIT', 9000, 1, 'TORQUE', '', 1, '2017-06-11 16:10:02', 'hbhj', 'NETWORK ERROR', '0789896765', '', '', '', ''),
(124, '', 'CREDIT', 9000, 1, 'TORQUE', '', 1, '2017-06-11 16:10:02', 'MUHIRWA Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(125, '', 'DEBIT', 5000, 7, 'TORQUE', '', 1, '2017-06-11 16:11:05', 'jjbjhbj hj', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(126, '', 'CREDIT', 5000, 7, 'TORQUE', '', 0, '2017-06-11 16:11:05', 'MUHIRWA Clement', 'NETWORK ERROR', '', '', '', '', ''),
(127, '', 'DEBIT', 5000, 7, 'TORQUE', '', 1, '2017-06-11 16:14:10', 'dcdsc', 'NETWORK ERROR', '0782342212', '', '', '', ''),
(128, '', 'CREDIT', 5000, 7, 'TORQUE', '', 0, '2017-06-11 16:14:10', 'MUHIRWA Clement', 'NETWORK ERROR', '', '', '', '', ''),
(129, '', 'DEBIT', 5000, 7, 'TORQUE', '', 1, '2017-06-11 16:14:47', 'cskbckb', 'NETWORK ERROR', '0782478973', '', '', '', ''),
(130, '', 'CREDIT', 5000, 7, 'TORQUE', '', 0, '2017-06-11 16:14:47', 'MUHIRWA Clement', 'NETWORK ERROR', '', '', '', '', ''),
(131, '', 'DEBIT', 5000, 7, 'TORQUE', '', 1, '2017-06-11 16:15:15', 'dcbsjhbc', 'NETWORK ERROR', '0783439803', '', '', '', ''),
(132, '', 'CREDIT', 5000, 7, 'TORQUE', '', 0, '2017-06-11 16:15:15', 'MUHIRWA Clement', 'NETWORK ERROR', '', '', '', '', ''),
(133, '', 'DEBIT', 5000, 7, 'TORQUE', '', 2, '2017-06-11 16:16:46', 'fgbnkjk', 'NETWORK ERROR', '0723438993', '', '', '', ''),
(134, '', 'CREDIT', 5000, 7, 'TORQUE', '', 0, '2017-06-11 16:16:46', 'MUHIRWA Clement', 'NETWORK ERROR', '', '', '', '', ''),
(135, '', 'DEBIT', 900, 1, 'TORQUE', '', 1, '2017-06-11 16:19:28', 'Muhirwa Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(136, '', 'CREDIT', 900, 1, 'TORQUE', '', 1, '2017-06-11 16:19:28', 'MONITOR', 'NETWORK ERROR', '0784567349', '', '', '', ''),
(137, '', 'DEBIT', 900, 1, 'TORQUE', '', 1, '2017-06-11 16:20:37', 'Muhirwa Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(138, '', 'CREDIT', 900, 1, 'TORQUE', '', 2, '2017-06-11 16:20:37', 'MONITOR', 'NETWORK ERROR', '0724567349', '', '', '', ''),
(139, '', 'DEBIT', 900, 1, 'TORQUE', '', 2, '2017-06-11 16:20:47', 'Muhirwa Clement', 'NETWORK ERROR', '0724848236', '', '', '', ''),
(140, '', 'CREDIT', 900, 1, 'TORQUE', '', 2, '2017-06-11 16:20:47', 'MONITOR', 'NETWORK ERROR', '0724567349', '', '', '', ''),
(141, '', 'DEBIT', 0, 0, 'TORQUE', '', 0, '2017-06-11 16:21:13', 'Muhirwa Clement', 'NETWORK ERROR', '0', '', '', '', ''),
(142, '', 'CREDIT', 0, 0, 'TORQUE', '', 0, '2017-06-11 16:21:13', 'CheckBalance', 'NETWORK ERROR', '', '', '', '', ''),
(143, '', 'DEBIT', 5000, 1, 'TORQUE', '', 1, '2017-06-11 17:10:34', 'Eric Rwamagana', 'NETWORK ERROR', '0785463742', '', '', '', ''),
(144, '', 'CREDIT', 5000, 1, 'TORQUE', '', 1, '2017-06-11 17:10:34', 'MUHIRWA Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(145, '', 'DEBIT', 90000, 1, 'TORQUE', '', 2, '2017-06-11 17:29:20', 'jbmnkjn7', 'NETWORK ERROR', '0726778809', '', '', '', ''),
(146, '', 'CREDIT', 90000, 1, 'TORQUE', '', 1, '2017-06-11 17:29:20', 'MUHIRWA Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(147, '', 'DEBIT', 9000, 2, 'BK', '', 5, '2017-06-11 17:46:40', 'bmnbnmbm', 'CALLED', 'VISA/MASTER', '', 'hbhjbj@fcfg.hbjh', '', ''),
(148, '', 'CREDIT', 9000, 2, 'TORQUE', '', 1, '2017-06-11 17:46:40', 'MUHIRWA Clement', 'CALLED', '0784848236', '', 'muhirwaclement@gmail.com', '', ''),
(149, '', 'DEBIT', 900, 7, 'TORQUE', '', 1, '2017-06-11 19:23:11', 'bcvbv', 'NETWORK ERROR', '0787574543', '', '', '', ''),
(150, '', 'CREDIT', 900, 7, 'TORQUE', '', 0, '2017-06-11 19:23:11', 'MUHIRWA Clement', 'NETWORK ERROR', '', '', '', '', ''),
(151, '', 'DEBIT', 900, 7, 'TORQUE', '', 2, '2017-06-11 19:23:53', 'fghfgd', 'NETWORK ERROR', '0725643457', '', '', '', ''),
(152, '', 'CREDIT', 900, 7, 'TORQUE', '', 0, '2017-06-11 19:23:53', 'MUHIRWA Clement', 'NETWORK ERROR', '', '', '', '', ''),
(153, '', 'DEBIT', 900, 7, 'TORQUE', '', 1, '2017-06-11 19:24:22', 'gdbdfbd', 'NETWORK ERROR', '0782342354', '', '', '', ''),
(154, '', 'CREDIT', 900, 7, 'TORQUE', '', 0, '2017-06-11 19:24:22', 'MUHIRWA Clement', 'NETWORK ERROR', '', '', '', '', ''),
(155, '', 'DEBIT', 9000, 7, 'TORQUE', '', 2, '2017-06-11 20:11:03', 'knjkj', 'NETWORK ERROR', '0727878987', '', '', '', ''),
(156, '', 'CREDIT', 9000, 7, 'TORQUE', '', 0, '2017-06-11 20:11:03', 'MUHIRWA Clement', 'NETWORK ERROR', '', '', '', '', ''),
(157, '', 'DEBIT', 9000, 2, 'TORQUE', '', 2, '2017-06-11 22:14:29', 'cxjnkj jsdcnj', 'NETWORK ERROR', '0724357894', '', '', '', ''),
(158, '', 'CREDIT', 9000, 2, 'TORQUE', '', 1, '2017-06-11 22:14:29', 'MUHIRWA Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(159, '', 'DEBIT', 9000, 2, 'TORQUE', '', 2, '2017-06-11 22:16:19', 'kjnkj', 'NETWORK ERROR', '0728687865', '', '', '', ''),
(160, '', 'CREDIT', 9000, 2, 'TORQUE', '', 1, '2017-06-11 22:16:19', 'MUHIRWA Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(161, '', 'DEBIT', 9000, 2, 'TORQUE', '', 1, '2017-06-11 22:17:39', 'scajk', 'NETWORK ERROR', '0783248798', '', '', '', ''),
(162, '', 'CREDIT', 9000, 2, 'TORQUE', '', 1, '2017-06-11 22:17:39', 'MUHIRWA Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(163, '', 'DEBIT', 9000, 2, 'TORQUE', '', 2, '2017-06-11 22:17:49', 'dskckjn', 'NETWORK ERROR', '0723284792', '', '', '', ''),
(164, '', 'CREDIT', 9000, 2, 'TORQUE', '', 1, '2017-06-11 22:17:49', 'MUHIRWA Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(165, '', 'DEBIT', 9000, 2, 'TORQUE', '', 1, '2017-06-11 22:19:17', 'knkjn', 'NETWORK ERROR', '0787678765', '', '', '', ''),
(166, '', 'CREDIT', 9000, 2, 'TORQUE', '', 1, '2017-06-11 22:19:17', 'MUHIRWA Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(167, '', 'DEBIT', 9000, 2, 'TORQUE', '', 2, '2017-06-11 22:19:29', 'bhjbhj', 'NETWORK ERROR', '0725466543', '', '', '', ''),
(168, '', 'CREDIT', 9000, 2, 'TORQUE', '', 1, '2017-06-11 22:19:29', 'MUHIRWA Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(169, '', 'DEBIT', 9000, 2, 'TORQUE', '', 2, '2017-06-11 22:20:54', 'ghjh1', 'NETWORK ERROR', '0724543456', '', '', '', ''),
(170, '', 'CREDIT', 9000, 2, 'TORQUE', '', 1, '2017-06-11 22:20:54', 'MUHIRWA Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(171, '', 'DEBIT', 9000, 2, 'TORQUE', '', 2, '2017-06-11 22:23:10', 'bdfb bghrtht nfgn', 'NETWORK ERROR', '0728567845', '', '', '', ''),
(172, '', 'CREDIT', 9000, 2, 'TORQUE', '', 1, '2017-06-11 22:23:10', 'MUHIRWA Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(173, '', 'DEBIT', 9000, 16, 'TORQUE', '', 1, '2017-06-11 22:25:16', 'fgbf', 'NETWORK ERROR', '0784534657', '', '', '', ''),
(174, '', 'CREDIT', 9000, 16, 'TORQUE', '', 1, '2017-06-11 22:25:16', 'MUHIRWA Clement', 'NETWORK ERROR', '', '', '', '', ''),
(175, '', 'DEBIT', 9000, 16, 'TORQUE', '', 1, '2017-06-11 22:26:38', 'fghm, h', 'NETWORK ERROR', '0785674534', '', '', '', ''),
(176, '', 'CREDIT', 9000, 16, 'TORQUE', '', 1, '2017-06-11 22:26:38', 'MUHIRWA Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(177, '', 'DEBIT', 9000, 1, 'BK', '', 5, '2017-06-12 21:31:55', '800', 'CALLED', 'VISA/MASTER', '', 'dvsd@dgddf.gnh', '', ''),
(178, '', 'CREDIT', 9000, 1, 'TORQUE', '', 1, '2017-06-12 21:31:55', 'MUHIRWA Clement', 'CALLED', '0784848236', '', 'muhirwaclement@gmail.com', '', ''),
(179, '', 'DEBIT', 90000, 1, 'BK', '1100000042', 5, '2017-06-13 13:28:45', 'Muhirwa Clement', 'Declined', 'xxxxxxxxxxxx3430', 'MC', 'clement@uplus.rw', '', ''),
(180, '', 'CREDIT', 90000, 1, 'TORQUE', '', 1, '2017-06-13 13:28:45', 'MUHIRWA Clement', 'CALLED', '0784848236', '', 'muhirwaclement@gmail.com', '', ''),
(181, '', 'DEBIT', 500, 1, 'TORQUE', '1497363355816', 1, '2017-06-13 14:15:47', 'Eric', 'REQUESTED', '0789396586', '', '', '', ''),
(182, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-13 14:15:47', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(183, '', 'DEBIT', 5000, 1, 'BK', '1100000043', 5, '2017-06-13 14:17:31', 'Dianne DUSAIDI', 'Declined', 'xxxxxxxxxxxx3430', 'MC', 'dusaidi@gmail.com', '', ''),
(184, '', 'CREDIT', 5000, 1, 'TORQUE', '', 1, '2017-06-13 14:17:31', 'MUHIRWA Clement', 'CALLED', '0784848236', '', 'muhirwaclement@gmail.com', '', ''),
(185, '', 'DEBIT', 0, 0, 'TORQUE', '', 0, '2017-06-13 14:36:58', 'Muhirwa Clement', 'BALANCE', '0', '', '', '', ''),
(186, '', 'CREDIT', 0, 0, 'TORQUE', '', 0, '2017-06-13 14:36:58', '0Rwf', 'BALANCE', '', '', '', '', ''),
(187, '', 'DEBIT', 0, 0, 'TORQUE', '', 0, '2017-06-13 14:38:35', 'Muhirwa Clement', 'BALANCE', '0', '', '', '', ''),
(188, '', 'CREDIT', 0, 0, 'TORQUE', '', 0, '2017-06-13 14:38:35', '0Rwf', 'BALANCE', '', '', '', '', ''),
(189, '', 'DEBIT', 500, 1, 'TORQUE', '1497364828392', 1, '2017-06-13 14:40:28', 'Eric', 'You sent invalid amount. Error', '0789396586', '', '', '', ''),
(190, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-13 14:40:28', 'MUHIRWA Clement', '', '0784848236', '', '', '', ''),
(191, '', 'DEBIT', 500, 1, 'TORQUE', '1497431149421', 1, '2017-06-14 09:05:50', 'testor', 'TARGET_AUTHORIZATION_ERROR', '0784848236', '', '', '', ''),
(192, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-14 09:05:50', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(193, '', 'DEBIT', 8000, 1, 'TORQUE', '1497431418356', 1, '2017-06-14 09:10:18', 'Testor', 'TARGET_AUTHORIZATION_ERROR', '0784848236', '', '', '', ''),
(194, '', 'CREDIT', 8000, 1, 'TORQUE', '', 1, '2017-06-14 09:10:18', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(195, '', 'DEBIT', 8000, 1, 'TORQUE', '1497431690467', 1, '2017-06-14 09:14:50', 'Testor2', 'TARGET_AUTHORIZATION_ERROR', '0784848236', '', '', '', ''),
(196, '', 'CREDIT', 8000, 1, 'TORQUE', '', 1, '2017-06-14 09:14:50', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(197, '', 'DEBIT', 800, 1, 'TORQUE', '1497431968376', 1, '2017-06-14 09:19:25', 'Testing', 'PENDING', '0784848236', '', '', '', ''),
(198, '', 'CREDIT', 800, 1, 'TORQUE', '', 1, '2017-06-14 09:19:25', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(199, '', 'DEBIT', 84000, 1, 'BK', '', 5, '2017-06-14 10:03:42', 'MUSHIMISHA Assumpta', 'APPROVED', 'xxxxxxxx0001', 'VC', 'hgvhgv@fgcfg.jgc', '0788751795', ''),
(200, '', 'CREDIT', 84000, 1, 'TORQUE', '', 1, '2017-06-14 10:03:42', 'MUHIRWA Clement', 'CALLED', '0784848236', '', 'muhirwaclement@gmail.com', '0784848236', ''),
(201, 'U1406170002', 'DEBIT', 7000, 10, 'BK', '1100000046', 5, '2017-06-14 12:01:26', 'TestorMuhirwa', 'Declined', 'xxxxxxxxxxxx0001', 'VC', 'muhirwaclement@gmail.com', '', ''),
(202, '', 'CREDIT', 7000, 10, 'TORQUE', '', 0, '2017-06-14 12:01:26', 'MUHIRWA Clement', 'CALLED', '', '', 'muhirwaclement@gmail.com', '', ''),
(203, '', 'DEBIT', 0, 0, 'BK', '', 0, '2017-06-14 13:01:46', '$pushName', 'CALLED', '$pushAccountNumber', '', '$pushEmail', '$pushContacts', ''),
(204, '', 'CREDIT', 0, 0, 'TORQUE', '', 0, '2017-06-14 13:01:46', '$pullName', 'CALLED', '$pullAccountNumber', '', '$pullEmail', '', ''),
(205, '', 'DEBIT', 4985, 10, 'BK', '', 5, '2017-06-14 13:03:20', 'sdkjcnjsd', 'CALLED', 'VISA/MASTER', '', 'sdckjn@vkjn.sdjhb', '1234', ''),
(206, '', 'CREDIT', 4985, 10, 'TORQUE', '', 0, '2017-06-14 13:03:20', 'MUHIRWA Clement', 'CALLED', '', '', 'muhirwaclement@gmail.com', '', ''),
(207, 'U1406170002', 'DEBIT', 900000, 10, 'BK', '1100000051', 5, '2017-06-14 13:07:31', 'clement', 'Declined', 'xxxxxxxxxxxx0001', 'VC', 'dskjcnkj@fkjn.dj', '0834978', ''),
(208, '', 'CREDIT', 9000, 10, 'TORQUE', '', 0, '2017-06-14 13:07:31', 'MUHIRWA Clement', 'CALLED', '', '', 'muhirwaclement@gmail.com', '', ''),
(209, '', 'DEBIT', 500, 1, 'TORQUE', '1497448758801', 1, '2017-06-14 13:59:19', 'Tuyishime Diane', 'REQUESTED', '0788857892', '', '', '', ''),
(210, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-14 13:59:19', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(211, '', 'DEBIT', 9000, 1, 'TORQUE', '', 1, '2017-06-14 23:22:31', 'uhkj', 'NETWORK ERROR', '0788787654', '', '', '', ''),
(212, '', 'CREDIT', 9000, 1, 'TORQUE', '', 1, '2017-06-14 23:22:31', 'MUHIRWA Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(213, '', 'DEBIT', 9000, 1, 'TORQUE', '', 1, '2017-06-14 23:26:45', 'nmn,', 'NETWORK ERROR', '0788875646', '', '', '', ''),
(214, '', 'CREDIT', 9000, 1, 'TORQUE', '', 1, '2017-06-14 23:26:45', 'MUHIRWA Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(215, '', 'DEBIT', 9000, 1, 'TORQUE', '', 1, '2017-06-14 23:31:21', '98987', 'NETWORK ERROR', '0789878708', '', '', '', ''),
(216, '', 'CREDIT', 9000, 1, 'TORQUE', '', 1, '2017-06-14 23:31:21', 'MUHIRWA Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(217, '', 'DEBIT', 9000, 1, 'TORQUE', '', 2, '2017-06-14 23:32:49', 'jhbj', 'NETWORK ERROR', '0728767686', '', '', '', ''),
(218, '', 'CREDIT', 9000, 1, 'TORQUE', '', 1, '2017-06-14 23:32:49', 'MUHIRWA Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(219, '', 'DEBIT', 5000, 1, 'TORQUE', '', 1, '2017-06-15 11:22:25', 'CLement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(220, '', 'CREDIT', 5000, 1, 'TORQUE', '', 1, '2017-06-15 11:22:25', 'MUHIRWA Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(221, '', 'DEBIT', 7000, 1, 'TORQUE', '1497525783472', 1, '2017-06-15 11:23:03', 'Clement', 'TARGET_AUTHORIZATION_ERROR', '0784848236', '', '', '', ''),
(222, '', 'CREDIT', 7000, 1, 'TORQUE', '', 1, '2017-06-15 11:23:03', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(223, '', 'DEBIT', 0, 0, 'TORQUE', '', 0, '2017-06-15 11:27:54', 'Muhirwa Clement', 'BALANCE', '0', '', '', '', ''),
(224, '', 'CREDIT', 0, 0, 'TORQUE', '', 0, '2017-06-15 11:27:54', '0Rwf', 'BALANCE', '', '', '', '', ''),
(225, '', 'DEBIT', 0, 0, 'TORQUE', '', 0, '2017-06-16 10:07:24', 'Muhirwa Clement', 'BALANCE', '0', '', '', '', ''),
(226, '', 'CREDIT', 0, 0, 'TORQUE', '', 0, '2017-06-16 10:07:24', '0Rwf', 'BALANCE', '', '', '', '', ''),
(227, '', 'DEBIT', 500, 1, 'TORQUE', '', 1, '2017-06-16 10:08:22', 'Muhirwa Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(228, '', 'CREDIT', 500, 1, 'TORQUE', '', 0, '2017-06-16 10:08:22', 'MONITOR', 'NETWORK ERROR', '', '', '', '', ''),
(229, '', 'DEBIT', 0, 0, 'TORQUE', '', 0, '2017-06-16 10:12:37', 'Muhirwa Clement', 'BALANCE', '0', '', '', '', ''),
(230, '', 'CREDIT', 0, 0, 'TORQUE', '', 0, '2017-06-16 10:12:37', '0Rwf', 'BALANCE', '', '', '', '', ''),
(231, '', 'DEBIT', 500, 1, 'TORQUE', '', 1, '2017-06-16 10:12:47', 'Muhirwa Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(232, '', 'CREDIT', 500, 1, 'TORQUE', '', 0, '2017-06-16 10:12:47', 'MONITOR', 'NETWORK ERROR', '', '', '', '', ''),
(233, '', 'DEBIT', 0, 0, 'TORQUE', '', 0, '2017-06-16 11:24:21', 'Muhirwa Clement', 'BALANCE', '0', '', '', '', ''),
(234, '', 'CREDIT', 0, 0, 'TORQUE', '', 0, '2017-06-16 11:24:21', '0Rwf', 'BALANCE', '', '', '', '', ''),
(235, '', 'DEBIT', 500, 1, 'TORQUE', '1497713975561', 1, '2017-06-17 15:39:32', 'Muhirwa Clement', 'REQUESTED', '0784848236', '', '', '', ''),
(236, '', 'CREDIT', 500, 1, 'TORQUE', '', 0, '2017-06-17 15:39:32', 'MONITOR', 'CALLED', '', '', '', '', ''),
(237, '', 'DEBIT', 500, 1, 'TORQUE', '1497714029687', 1, '2017-06-17 15:40:29', 'CLement Muhirwa', 'DECLINED', '0784848236', '', '', '', ''),
(238, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-17 15:40:29', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(239, '', 'DEBIT', 8000, 1, 'TORQUE', '', 1, '2017-06-18 14:07:57', 'Muhirwa Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(240, '', 'CREDIT', 8000, 1, 'TORQUE', '', 1, '2017-06-18 14:07:57', 'MUHIRWA Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(241, '', 'DEBIT', 9000, 1, 'TORQUE', '', 1, '2017-06-18 15:31:10', 'Testor', 'NETWORK ERROR', '0784567454', '', '', '', ''),
(242, '', 'CREDIT', 9000, 1, 'TORQUE', '', 1, '2017-06-18 15:31:10', 'MUHIRWA Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(243, '', 'DEBIT', 8000, 1, 'TORQUE', '', 2, '2017-06-18 15:36:49', 'The Future', 'NETWORK ERROR', '0725594646', '', '', '', ''),
(244, '', 'CREDIT', 8000, 1, 'TORQUE', '', 1, '2017-06-18 15:36:49', 'MUHIRWA Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(245, '', 'DEBIT', 800, 1, 'TORQUE', '1497813933543', 1, '2017-06-18 19:25:31', 'Clement Muhirwa', '', '0784848236', '', '', '', ''),
(246, '', 'CREDIT', 800, 1, 'TORQUE', '', 1, '2017-06-18 19:25:31', 'MUHIRWA Clement', '', '0784848236', '', '', '', ''),
(247, '', 'DEBIT', 900, 1, 'TORQUE', '', 1, '2017-06-18 19:27:22', 'Umutoni Francine', 'NETWORK ERROR', '0788551893', '', '', '', ''),
(248, '', 'CREDIT', 900, 1, 'TORQUE', '', 1, '2017-06-18 19:27:22', 'MUHIRWA Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(249, '', 'DEBIT', 800, 1, 'TORQUE', '', 1, '2017-06-18 19:28:14', 'Umutoni Francine', 'NETWORK ERROR', '0788551893', '', '', '', ''),
(250, '', 'CREDIT', 800, 1, 'TORQUE', '', 1, '2017-06-18 19:28:14', 'MUHIRWA Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(251, '', 'DEBIT', 500, 1, 'TORQUE', '1497814122893', 1, '2017-06-18 19:28:45', 'Clement Testor', 'TARGET_AUTHORIZATION_ERROR', '0784848236', '', '', '', ''),
(252, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-18 19:28:45', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(253, '', 'DEBIT', 500, 1, 'TORQUE', '1497814188061', 1, '2017-06-18 19:29:50', 'Assumpta Mushimisha', 'TARGET_AUTHORIZATION_ERROR', '0788751595', '', '', '', ''),
(254, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-18 19:29:50', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(255, '', 'DEBIT', 500, 1, 'TORQUE', '1497814298935', 1, '2017-06-18 19:31:39', 'Elize', 'REQUESTED', '0782384772', '', '', '', ''),
(256, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-18 19:31:39', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(257, '', 'DEBIT', 500, 1, 'TORQUE', '1497814749016', 1, '2017-06-18 19:39:11', 'Isaac Semusatsi', 'REQUESTED', '0784589841', '', '', '', ''),
(258, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-18 19:39:11', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(259, '', 'DEBIT', 500, 1, 'TORQUE', '1497814919645', 1, '2017-06-18 19:42:00', 'Semusatsi Isaac', 'REQUESTED', '0784589841', '', '', '', ''),
(260, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-18 19:42:00', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(261, '', 'DEBIT', 500, 1, 'TORQUE', '1497816525219', 1, '2017-06-18 20:08:45', 'Semusatsi Isaac', 'You sent invalid amount. Error', '0784589841', '', '', '', ''),
(262, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-18 20:08:45', 'MUHIRWA Clement', '', '0784848236', '', '', '', ''),
(263, '', 'DEBIT', 500, 1, 'TORQUE', '1497817877672', 1, '2017-06-18 20:31:18', 'Semusatsi Isaac', 'REQUESTED', '0784589841', '', '', '', ''),
(264, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-18 20:31:18', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(265, '', 'DEBIT', 500, 1, 'TORQUE', '1497818228879', 1, '2017-06-18 20:37:10', 'Semusatsi Isaac', 'DECLINED', '0784589841', '', '', '', ''),
(266, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-18 20:37:10', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(267, '', 'DEBIT', 500, 1, 'TORQUE', '1497818561919', 1, '2017-06-18 20:42:41', 'Ariane Iribagiza', 'ACCOUNTHOLDER_WITH_FRI_NOT_FOU', '0781680906', '', '', '', ''),
(268, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-18 20:42:41', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(269, '', 'DEBIT', 500, 1, 'TORQUE', '1497819449450', 1, '2017-06-18 20:57:30', 'Semusatsi Isaac', 'REQUESTED', '0784589841', '', '', '', ''),
(270, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-18 20:57:30', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(271, '', 'DEBIT', 500, 1, 'TORQUE', '1497820224459', 1, '2017-06-18 21:10:26', 'Semusatsi Isaac', 'REQUESTED', '0784589841', '', '', '', ''),
(272, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-18 21:10:26', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(273, '', 'DEBIT', 500, 1, 'TORQUE', '', 1, '2017-06-18 21:13:30', 'Semusatsi Isaac', 'NETWORK ERROR', '0784589841', '', '', '', ''),
(274, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-18 21:13:30', 'MUHIRWA Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(275, '', 'DEBIT', 500, 1, 'TORQUE', '', 1, '2017-06-18 21:18:22', 'Clement Testor', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(276, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-18 21:18:22', 'MUHIRWA Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(277, '', 'DEBIT', 500, 1, 'TORQUE', '1497820822195', 2, '2017-06-18 21:20:23', 'Clement Testor', 'DECLINED', '0725594646', '', '', '', ''),
(278, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-18 21:20:23', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(279, '', 'DEBIT', 500, 1, 'TORQUE', '1497822872094', 1, '2017-06-18 21:54:34', 'Jean Luc', 'TARGET_AUTHORIZATION_ERROR', '0789773162', '', '', '', ''),
(280, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-18 21:54:34', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(281, '', 'DEBIT', 500, 1, 'TORQUE', '1497823485482', 1, '2017-06-18 22:04:47', 'Jean Luc', 'TARGET_AUTHORIZATION_ERROR', '0789773162', '', '', '', ''),
(282, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-18 22:04:47', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(283, '', 'DEBIT', 500, 1, 'TORQUE', '1497824553711', 1, '2017-06-18 22:22:36', 'Jean Luc', 'TARGET_AUTHORIZATION_ERROR', '0789773162', '', '', '', ''),
(284, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-18 22:22:36', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(285, '', 'DEBIT', 500, 1, 'TORQUE', '1497824621032', 2, '2017-06-18 22:23:43', 'Clement test', 'REQUESTED', '0725594646', '', '', '', ''),
(286, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-18 22:23:43', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(287, '', 'DEBIT', 500, 1, 'TORQUE', '1497824983051', 2, '2017-06-18 22:29:43', 'Clement Testor', 'DECLINED', '0725594646', '', '', '', ''),
(288, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-18 22:29:43', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(289, '', 'DEBIT', 800, 1, 'TORQUE', '', 2, '2017-06-19 10:14:08', '', 'NETWORK ERROR', '0726767876', '', '', '', ''),
(290, '', 'CREDIT', 800, 1, 'TORQUE', '', 1, '2017-06-19 10:14:08', 'MUHIRWA Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(291, '', 'DEBIT', 800, 1, 'TORQUE', '', 1, '2017-06-19 10:14:35', '', 'NETWORK ERROR', '0788678687', '', '', '', ''),
(292, '', 'CREDIT', 800, 1, 'TORQUE', '', 1, '2017-06-19 10:14:35', 'MUHIRWA Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(293, '', 'DEBIT', 500, 1, 'TORQUE', '1497893420588', 1, '2017-06-19 17:30:23', 'Fais', 'TARGET_AUTHORIZATION_ERROR', '0783314932', '', '', '', ''),
(294, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-19 17:30:23', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(295, '', 'DEBIT', 800, 1, 'TORQUE', '', 1, '2017-06-20 10:46:25', 'Test This', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(296, '', 'CREDIT', 800, 1, 'TORQUE', '', 1, '2017-06-20 10:46:25', 'MUHIRWA Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(297, '', 'DEBIT', 5000, 1, 'TORQUE', '', 2, '2017-06-20 11:03:04', 'Umutoni Francine', 'NETWORK ERROR', '0722290887', '', '', '', ''),
(298, '', 'CREDIT', 5000, 1, 'TORQUE', '', 1, '2017-06-20 11:03:04', 'MUHIRWA Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(299, '', 'DEBIT', 9000, 1, 'TORQUE', '', 2, '2017-06-20 11:12:01', 'Testor', 'NETWORK ERROR', '0727665437', '', '', '', ''),
(300, '', 'CREDIT', 9000, 1, 'TORQUE', '', 1, '2017-06-20 11:12:01', 'MUHIRWA Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(301, '', 'DEBIT', 900, 1, 'TORQUE', '1497962313437', 1, '2017-06-20 12:38:40', 'Clement Testor', 'REQUESTED', '0784848236', '', '', '', ''),
(302, '', 'CREDIT', 900, 1, 'TORQUE', '', 1, '2017-06-20 12:38:40', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(303, '', 'DEBIT', 900, 1, 'TORQUE', '1497962912729', 1, '2017-06-20 12:48:40', 'Clement Testor', 'TARGET_AUTHORIZATION_ERROR', '0784848236', '', '', '', ''),
(304, '', 'CREDIT', 900, 1, 'TORQUE', '', 1, '2017-06-20 12:48:40', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(305, '', 'DEBIT', 900, 1, 'TORQUE', '1497963337659', 1, '2017-06-20 12:55:45', 'Elyse', 'REQUESTED', '0782384772', '', '', '', ''),
(306, '', 'CREDIT', 900, 1, 'TORQUE', '', 1, '2017-06-20 12:55:45', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(307, '', 'DEBIT', 500, 1, 'TORQUE', '1497963799251', 1, '2017-06-20 13:03:26', 'Elyse Testor', 'REQUESTED', '0782384772', '', '', '', ''),
(308, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-20 13:03:26', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(309, '', 'DEBIT', 500, 1, 'TORQUE', '1497964206802', 1, '2017-06-20 13:10:10', 'Elyse Testor', 'REQUESTED', '0782384772', '', '', '', ''),
(310, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-20 13:10:10', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(311, '', 'DEBIT', 500, 1, 'TORQUE', '1497964633942', 1, '2017-06-20 13:17:21', 'Elyse Testor', 'REQUESTED', '0782384772', '', '', '', ''),
(312, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-20 13:17:21', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(313, '', 'DEBIT', 500, 1, 'TORQUE', '1497967656032', 1, '2017-06-20 14:07:43', 'Clodette Testor', 'TARGET_AUTHORIZATION_ERROR', '0785653795', '', '', '', ''),
(314, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-20 14:07:43', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(315, '', 'DEBIT', 800, 1, 'TORQUE', '1497969838403', 1, '2017-06-20 14:44:05', 'Claudette Testor', 'TARGET_AUTHORIZATION_ERROR', '0785653795', '', '', '', ''),
(316, '', 'CREDIT', 800, 1, 'TORQUE', '', 1, '2017-06-20 14:44:05', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(317, '', 'DEBIT', 500, 1, 'TORQUE', '1497970100112', 1, '2017-06-20 14:48:27', 'Claudette Testor', 'TARGET_AUTHORIZATION_ERROR', '0785653795', '', '', '', ''),
(318, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-20 14:48:27', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(319, '', 'DEBIT', 500, 1, 'TORQUE', '1497970150511', 1, '2017-06-20 14:49:18', 'Elyse Testor', 'REQUESTED', '0782384772', '', '', '', ''),
(320, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-20 14:49:18', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(321, '', 'DEBIT', 900, 1, 'TORQUE', '1497980008408', 1, '2017-06-20 17:33:34', 'disapare', 'TARGET_AUTHORIZATION_ERROR', '0784848236', '', '', '', ''),
(322, '', 'CREDIT', 900, 1, 'TORQUE', '', 1, '2017-06-20 17:33:34', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(323, '', 'DEBIT', 700, 1, 'TORQUE', '1497980206621', 1, '2017-06-20 17:36:54', 'Test if this works', 'TARGET_AUTHORIZATION_ERROR', '0784848236', '', '', '', ''),
(324, '', 'CREDIT', 700, 1, 'TORQUE', '', 1, '2017-06-20 17:36:54', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(325, '', 'DEBIT', 700, 1, 'TORQUE', '1497980372131', 2, '2017-06-20 17:39:39', 'Clement Tigo Test', 'REQUESTED', '0725594646', '', '', '', ''),
(326, '', 'CREDIT', 700, 1, 'TORQUE', '', 1, '2017-06-20 17:39:39', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(327, '', 'DEBIT', 500, 1, 'TORQUE', '1498117604030', 1, '2017-06-22 07:46:32', 'Testor', 'TARGET_AUTHORIZATION_ERROR', '0784848236', '', '', '', ''),
(328, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-22 07:46:32', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(329, '', 'DEBIT', 500, 1, 'TORQUE', '1498117647783', 2, '2017-06-22 07:47:27', 'testor', 'REQUESTED', '0725594646', '', '', '', ''),
(330, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-22 07:47:27', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(331, '', 'DEBIT', 500, 1, 'TORQUE', '1498117859260', 2, '2017-06-22 07:50:58', 'testor', 'REQUESTED', '0725594646', '', '', '', ''),
(332, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-22 07:50:58', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(333, '', 'DEBIT', 500, 1, 'TORQUE', '1498117970962', 2, '2017-06-22 07:52:50', 'test', 'REQUESTED', '0725594646', '', '', '', ''),
(334, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-22 07:52:50', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(335, '', 'DEBIT', 800, 1, 'TORQUE', '1498118102867', 2, '2017-06-22 07:55:02', 'test', 'DECLINED', '0725594646', '', '', '', ''),
(336, '', 'CREDIT', 800, 1, 'TORQUE', '', 1, '2017-06-22 07:55:02', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(337, '', 'DEBIT', 800, 1, 'TORQUE', '1498118254893', 2, '2017-06-22 07:57:34', 'test', 'REQUESTED', '0725594646', '', '', '', ''),
(338, '', 'CREDIT', 800, 1, 'TORQUE', '', 1, '2017-06-22 07:57:34', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(339, '', 'DEBIT', 800, 1, 'TORQUE', '1498118427400', 2, '2017-06-22 08:00:26', 'test2', 'REQUESTED', '0725594646', '', '', '', ''),
(340, '', 'CREDIT', 800, 1, 'TORQUE', '', 1, '2017-06-22 08:00:26', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(341, '', 'DEBIT', 700, 1, 'TORQUE', '1498118536522', 2, '2017-06-22 08:02:16', 'test3', '', '0725594646', '', '', '', ''),
(342, '', 'CREDIT', 700, 1, 'TORQUE', '', 1, '2017-06-22 08:02:16', 'MUHIRWA Clement', '', '0784848236', '', '', '', ''),
(343, '', 'DEBIT', 800, 1, 'TORQUE', '1498118622413', 1, '2017-06-22 08:03:41', 'testmtn', 'TARGET_AUTHORIZATION_ERROR', '0784848236', '', '', '', ''),
(344, '', 'CREDIT', 800, 1, 'TORQUE', '', 1, '2017-06-22 08:03:41', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(345, '', 'DEBIT', 800, 1, 'TORQUE', '1498118743178', 2, '2017-06-22 08:05:42', 'test4', 'REQUESTED', '0725594646', '', '', '', ''),
(346, '', 'CREDIT', 800, 1, 'TORQUE', '', 1, '2017-06-22 08:05:42', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(347, '', 'DEBIT', 700, 1, 'TORQUE', '1498118857645', 2, '2017-06-22 08:07:34', 'test6', 'REQUESTED', '0725594646', '', '', '', ''),
(348, '', 'CREDIT', 700, 1, 'TORQUE', '', 1, '2017-06-22 08:07:34', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(349, '', 'DEBIT', 800, 1, 'TORQUE', '1498118955652', 2, '2017-06-22 08:09:15', 'test7', 'REQUESTED', '0725594646', '', '', '', ''),
(350, '', 'CREDIT', 800, 1, 'TORQUE', '', 1, '2017-06-22 08:09:15', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(351, '', 'DEBIT', 800, 1, 'TORQUE', '1498120744688', 2, '2017-06-22 08:39:04', 'Yes', '', '0725594646', '', '', '', ''),
(352, '', 'CREDIT', 800, 1, 'TORQUE', '', 1, '2017-06-22 08:39:04', 'MUHIRWA Clement', '', '0784848236', '', '', '', ''),
(353, '', 'DEBIT', 900, 1, 'TORQUE', '1498120921941', 2, '2017-06-22 08:42:01', 'testor', 'REQUESTED', '0725594646', '', '', '', ''),
(354, '', 'CREDIT', 900, 1, 'TORQUE', '', 1, '2017-06-22 08:42:01', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(355, '', 'DEBIT', 500, 1, 'TORQUE', '1498120973733', 1, '2017-06-22 08:42:53', 'testor', 'TARGET_AUTHORIZATION_ERROR', '0784848236', '', '', '', ''),
(356, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-22 08:42:53', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(357, '', 'DEBIT', 500, 1, 'TORQUE', '1498121045155', 2, '2017-06-22 08:44:04', 'testor', 'REQUESTED', '0725594646', '', '', '', ''),
(358, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-22 08:44:04', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(359, '', 'DEBIT', 500, 1, 'TORQUE', '1498121200740', 2, '2017-06-22 08:46:39', 'testor8', 'REQUESTED', '0725594646', '', '', '', ''),
(360, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-22 08:46:39', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(361, '', 'DEBIT', 500, 1, 'TORQUE', '1498121322127', 2, '2017-06-22 08:48:41', 'JsTimeCount', 'REQUESTED', '0725594646', '', '', '', ''),
(362, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-22 08:48:41', 'MUHIRWA Clement', 'CALLED', '0784848236', '', '', '', ''),
(363, '', 'DEBIT', 500, 1, 'TORQUE', '', 2, '2017-06-22 08:51:11', 'testor', 'NETWORK ERROR', '0725594646', '', '', '', ''),
(364, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-22 08:51:11', 'MUHIRWA Clement', 'NETWORK ERROR', '0784848236', '', '', '', ''),
(365, '', 'DEBIT', 500, 29, 'TORQUE', '1498129544378', 1, '2017-06-22 11:05:43', 'Jean Test', 'TARGET_AUTHORIZATION_ERROR', '0788424547', '', '', '', ''),
(366, '', 'CREDIT', 500, 29, 'TORQUE', '', 1, '2017-06-22 11:05:43', 'NIYOTWAGIRA Jean', 'CALLED', '0788424547', '', '', '', ''),
(367, '', 'DEBIT', 500, 29, 'TORQUE', '1498129995213', 2, '2017-06-22 11:13:14', 'Clement Test', 'REQUESTED', '0725594646', '', '', '', ''),
(368, '', 'CREDIT', 500, 29, 'TORQUE', '', 1, '2017-06-22 11:13:14', 'NIYOTWAGIRA Jean', 'CALLED', '0788424547', '', '', '', ''),
(369, 'U2706170003', 'DEBIT', 500, 1, 'TORQUE', '1100000057', 1, '2017-06-27 13:08:38', 'Test', 'Declined', 'xxxxxxxxxxxx3430', 'MC', '', '', ''),
(370, '', 'CREDIT', 500, 1, 'TORQUE', '', 1, '2017-06-27 13:08:38', 'New Name', 'NETWORK ERROR', '0784848236', '', '', '', '');

-- --------------------------------------------------------

--
-- Stand-in structure for view `transactionsview`
--
CREATE TABLE `transactionsview` (
`transactionId` int(11)
,`invoiceNumber` varchar(11)
,`operation` enum('CREDIT','DEBIT')
,`amount` int(11)
,`forGroupId` int(11)
,`3rdparty` varchar(20)
,`3rdpartyId` varchar(50)
,`bankName` varchar(255)
,`bankCode` int(11)
,`transaction_date` timestamp
,`actorName` varchar(50)
,`status` varchar(30)
,`accountNumber` varchar(50)
,`email` varchar(50)
,`contacts` varchar(20)
,`cardType` varchar(10)
);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` text NOT NULL,
  `phone` varchar(50) NOT NULL,
  `loginId` varchar(255) NOT NULL,
  `pwd` text NOT NULL,
  `level` enum('inspector','manager') NOT NULL,
  `visits` int(11) NOT NULL,
  `lastvisit` datetime NOT NULL,
  `createdBy` varchar(50) NOT NULL,
  `createdDate` date NOT NULL,
  `updatedBy` varchar(50) NOT NULL,
  `updatedDate` date NOT NULL,
  `archivedBy` varchar(50) NOT NULL,
  `archivedDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `loginId`, `pwd`, `level`, `visits`, `lastvisit`, `createdBy`, `createdDate`, `updatedBy`, `updatedDate`, `archivedBy`, `archivedDate`) VALUES
(1, 'Muhirwa Clement', '6edc3d0fc4242bb94eaefd7122b79572', '0784848236', 'cmuhirwa', '1e872ecd12db0840a855ed6267747b4b', 'manager', 37, '2017-06-20 15:16:50', 'Clement', '2017-05-29', '', '0000-00-00', '', '0000-00-00'),
(2, 'Alex Ntale', '3cb5be1c1cf0c4ff7efb56504f70bd5e', '0784968343', 'ntalea', 'b75bd008d5fecb1f50cf026532e8ae67', 'manager', 1, '2017-05-31 15:43:52', 'Clement', '2017-05-29', '', '0000-00-00', '', '0000-00-00'),
(3, 'Edward kirenga', '92aa9f9433058cb94b582ee56efdea37', '0783099700', 'edward', '6676e7d0995ebd8dbd136869a9358d14', 'manager', 0, '0000-00-00 00:00:00', 'Clement', '2017-05-29', '', '0000-00-00', '', '0000-00-00'),
(4, 'Dianne Dusaidi', 'f14a2d5b5ea7da10aa40e5e4ea6ae4b6', '0788351606', 'dusaidi', '2e0f833c1af26af7232bde344d4c6e51', 'manager', 2, '2017-05-31 15:44:50', 'Clement', '2017-05-29', '', '0000-00-00', '', '0000-00-00'),
(5, 'Mugabi Alan', 'a48199fb31219ff7816ba894ba0c2179', '0782895366', 'none', 'bab891de979ae791cfa37bfc88ed9e88', 'manager', 4, '2017-05-31 20:27:44', 'clement', '2017-05-31', '', '0000-00-00', '', '0000-00-00');

-- --------------------------------------------------------

--
-- Structure for view `groupbalance`
--
DROP TABLE IF EXISTS `groupbalance`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `groupbalance`  AS  select `g`.`groupId` AS `groupId`,`g`.`accountNumber` AS `accountNumber`,ifnull((select sum(`t`.`amount`) from `transactions` `t` where ((`t`.`status` = 'APPROVED') and (`t`.`forGroupId` = `g`.`groupId`))),0) AS `Balance` from `groups` `g` ;

-- --------------------------------------------------------

--
-- Structure for view `transactionsview`
--
DROP TABLE IF EXISTS `transactionsview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `transactionsview`  AS  select `t`.`id` AS `transactionId`,`t`.`invoiceNumber` AS `invoiceNumber`,`t`.`operation` AS `operation`,`t`.`amount` AS `amount`,`t`.`forGroupId` AS `forGroupId`,`t`.`3rdparty` AS `3rdparty`,`t`.`3rdpartyId` AS `3rdpartyId`,`b`.`name` AS `bankName`,`t`.`bankCode` AS `bankCode`,`t`.`transaction_date` AS `transaction_date`,`t`.`actorName` AS `actorName`,`t`.`status` AS `status`,`t`.`accountNumber` AS `accountNumber`,`t`.`email` AS `email`,`t`.`contacts` AS `contacts`,`t`.`cardType` AS `cardType` from (`transactions` `t` join `banks` `b` on((`t`.`bankCode` = `b`.`id`))) order by `t`.`id` desc ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=371;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
