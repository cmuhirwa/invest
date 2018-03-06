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
-- Database: `inventory2`
--

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `itemId` bigint(20) NOT NULL,
  `itemName` varchar(50) NOT NULL,
  `kode` varchar(11) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `unityPrice` double NOT NULL,
  `inDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `addedBy` varchar(10) NOT NULL,
  `sync` enum('no','yes') NOT NULL,
  `syncid` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`itemId`, `itemName`, `kode`, `unit`, `unityPrice`, `inDate`, `addedBy`, `sync`, `syncid`) VALUES
(1, 'IRANGE SOFTWHITE (AMAZI)', '0001', 'L', 540, '2017-04-12 08:27:51', 'me', 'yes', 0),
(2, 'IRANGE WHITE (AMAVUTA)', '0002', 'L', 2000, '2017-04-12 08:27:51', 'me', 'yes', 0),
(3, 'IRANGE BLACK (AMAVUTA)', '0003', 'L', 2000, '2017-04-12 08:27:51', 'me', 'yes', 0),
(4, 'IBIRAHURE FIME', '0004', 'm2', 3500, '2017-04-12 08:27:51', 'me', 'yes', 0),
(5, 'IBIRAHURE BISANZWE', '0005', 'm2', 2000, '2017-04-12 08:27:51', 'me', 'yes', 0),
(6, 'INSINGA NTO', '0006', 'm', 150, '2017-04-12 08:27:51', 'me', 'yes', 0),
(7, 'INSINGA NINI', '0007', 'm', 24, '2017-04-12 08:27:51', 'me', 'yes', 0),
(8, 'AMPULI', '0008', 'pc', 600, '2017-04-12 08:27:51', 'me', 'yes', 0),
(9, 'SOKET', '0009', 'pc', 1500, '2017-04-12 08:27:51', 'me', 'yes', 0),
(10, 'INTERIPTERI', '0010', 'pc', 2000, '2017-04-12 08:27:51', 'me', 'yes', 0),
(11, 'PRISE', '0011', 'pc', 600, '2017-04-12 08:27:51', 'me', 'yes', 0),
(12, 'TIYO Y AMAZI', '0012', 'm', 1000, '2017-04-12 08:27:51', 'me', 'yes', 0),
(13, 'TIYO Y UMURIRO', '0013', 'm', 200, '2017-04-12 08:27:51', 'me', 'yes', 0),
(14, 'SIMA SIMBA BORA', '0014', 'Kg', 650, '2017-04-12 08:27:51', 'me', 'yes', 0),
(15, 'SIMA SIMERWA', '0015', 'Kg', 670, '2017-04-12 08:27:51', 'me', 'yes', 0),
(16, 'SIMA KILIMANJALO', '0016', 'Kg', 640, '2017-04-12 08:27:51', 'me', 'yes', 0),
(17, 'TOILETE A1', '0017', 'Pc', 50000, '2017-04-12 08:27:51', 'me', 'yes', 0),
(18, 'TOILETE A2', '0018', 'Pc', 65000, '2017-04-12 08:27:51', 'me', 'yes', 0),
(19, 'RAVABO', '0019', 'Pc', 15000, '2017-04-12 08:27:51', 'me', 'yes', 0),
(20, 'SHOWER X1', '0020', 'Pc', 80000, '2017-04-12 08:27:51', 'me', 'yes', 0),
(21, 'SHOWER X2', '0021', 'Pc', 155000, '2017-04-12 08:27:51', 'me', 'yes', 0),
(22, 'ROBINE YA DOUCHE', '0022', 'Pc', 3500, '2017-04-12 08:27:51', 'me', 'yes', 0),
(23, 'AMAKARO DOUCHE', '0023', 'Pc', 600, '2017-04-12 08:27:51', 'me', 'yes', 0),
(24, 'AMAKARO MUNZU', '0024', 'Pc', 600, '2017-04-12 08:27:51', 'me', 'yes', 0),
(25, 'DELL X501', '001258', 'PC', 300000, '2017-04-12 08:27:51', 'me', 'yes', 0),
(32, 'TENT', '012012', 'PC', 500000, '2017-04-18 12:45:26', 'me', 'yes', 4),
(31, 'JUICE', '0120', 'Botle', 700, '2017-04-17 10:09:00', 'me', 'yes', 3),
(30, 'ISUKALI', '01231', 'KG', 1000, '2017-04-14 20:27:53', 'me', 'yes', 2);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `transactionId` int(11) NOT NULL,
  `invoiceId` varchar(50) NOT NULL,
  `amount` decimal(20,5) NOT NULL,
  `amountLeft` decimal(20,5) NOT NULL,
  `donedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`transactionId`, `invoiceId`, `amount`, `amountLeft`, `donedate`) VALUES
(1, 'INV2016-18', '32000.00000', '32000.00000', '2017-04-28 12:49:22'),
(2, 'INV2016-2', '97500.00000', '97500.00000', '2017-04-28 12:49:22'),
(3, 'INV2016-23', '90000.00000', '90000.00000', '2017-04-28 12:49:22'),
(4, 'INV2016-26', '2000.00000', '2000.00000', '2017-04-28 12:49:22'),
(5, 'INV2016-28', '900000.00000', '900000.00000', '2017-04-28 12:49:22'),
(6, 'INV2016-3', '7200.00000', '7200.00000', '2017-04-28 12:49:22'),
(7, 'INV2017-14', '300000.00000', '300000.00000', '2017-04-28 12:49:22'),
(8, 'INV2017-16', '280000.00000', '280000.00000', '2017-04-28 12:49:22'),
(9, 'INV2017-22', '2000.00000', '2000.00000', '2017-04-28 12:49:22'),
(10, 'INV2017-25', '5000.00000', '5000.00000', '2017-04-28 12:49:22'),
(11, 'INV2017-29', '300000.00000', '300000.00000', '2017-04-28 12:49:22'),
(12, 'INV2017-30', '10000.00000', '10000.00000', '2017-04-28 12:49:22'),
(13, 'INV2017-32', '1007000.00000', '1007000.00000', '2017-04-28 12:49:22'),
(14, 'INV2017-33', '1000000.00000', '1000000.00000', '2017-04-28 12:49:22'),
(15, 'INV2017-37', '1920700.00000', '1920700.00000', '2017-04-28 12:49:22'),
(16, 'INV2017-40', '500000.00000', '500000.00000', '2017-04-28 12:49:22'),
(17, 'INV2017-6', '352800.00000', '352800.00000', '2017-04-28 12:49:22'),
(18, 'INV2017-44', '9000.00000', '9000.00000', '2017-04-28 14:38:56'),
(19, 'INV2017-46', '200000.00000', '200000.00000', '2017-04-28 14:43:02'),
(20, 'INV2017-47', '1002100.00000', '1002100.00000', '2017-04-29 10:40:53'),
(21, 'INV2017-48', '50000.00000', '50000.00000', '2017-04-29 10:41:44'),
(22, 'INV2017-49', '24000.00000', '14000.00000', '2017-04-29 10:43:27');

-- --------------------------------------------------------

--
-- Table structure for table `returnoninvestment`
--

CREATE TABLE `returnoninvestment` (
  `transactionID` bigint(20) DEFAULT NULL,
  `doneOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `operation` varchar(20) DEFAULT NULL,
  `itemCode` varchar(11) DEFAULT NULL,
  `itemName` varchar(50) DEFAULT NULL,
  `qty` decimal(20,5) DEFAULT NULL,
  `trUnityPrice` decimal(20,5) DEFAULT NULL,
  `PURCHASE_PRICE` decimal(20,5) DEFAULT NULL,
  `GAIN_UNIT` decimal(21,5) DEFAULT NULL,
  `GAIN_PER_OPERATION` decimal(41,10) DEFAULT NULL,
  `INVESTMENT` decimal(40,10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `serieid`
--

CREATE TABLE `serieid` (
  `serieID` bigint(50) NOT NULL,
  `serieDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userOn` varchar(50) NOT NULL,
  `sync` enum('no','yes') NOT NULL,
  `syncid` bigint(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `serieid`
--

INSERT INTO `serieid` (`serieID`, `serieDate`, `userOn`, `sync`, `syncid`) VALUES
(1, '2016-05-22 15:52:49', 'cmuhirwa', 'no', 0),
(2, '2016-05-22 17:06:36', 'cmuhirwa', 'no', 0),
(3, '2016-05-22 17:08:14', 'cmuhirwa', 'no', 0),
(4, '2016-05-22 17:19:20', 'cmuhirwa', 'no', 0),
(5, '2016-05-22 17:20:17', 'cmuhirwa', 'no', 0),
(6, '2016-05-22 17:23:22', 'cmuhirwa', 'no', 0),
(7, '2016-05-22 17:27:47', 'cmuhirwa', 'no', 0),
(8, '2016-05-22 17:33:12', 'cmuhirwa', 'no', 0),
(9, '2016-05-22 17:33:38', 'cmuhirwa', 'no', 0),
(10, '2016-05-22 17:35:28', 'cmuhirwa', 'no', 0),
(11, '2016-05-22 17:37:26', 'cmuhirwa', 'no', 0),
(12, '2016-05-23 02:42:56', 'cmuhirwa', 'no', 0),
(13, '2016-05-23 03:00:12', 'cmuhirwa', 'no', 0),
(14, '2016-05-23 03:12:36', 'cmuhirwa', 'no', 0),
(15, '2016-05-23 05:45:34', 'cmuhirwa', 'no', 0),
(16, '2016-05-23 06:09:08', 'cmuhirwa', 'no', 0),
(17, '2016-05-24 07:06:35', 'cmuhirwa', 'no', 0),
(18, '2016-05-24 08:40:17', 'cmuhirwa', 'no', 0),
(19, '2016-05-24 08:41:06', 'cmuhirwa', 'no', 0),
(20, '2016-05-24 17:13:49', 'cmuhirwa', 'no', 0),
(21, '2016-05-24 17:17:52', 'cmuhirwa', 'no', 0),
(22, '2016-05-24 17:18:33', 'cmuhirwa', 'no', 0),
(23, '2016-05-24 17:19:06', 'cmuhirwa', 'no', 0),
(24, '2016-05-24 17:42:19', 'cmuhirwa', 'no', 0),
(25, '2016-05-24 17:43:56', 'cmuhirwa', 'no', 0),
(26, '2016-05-25 03:12:03', 'cmuhirwa', 'no', 0),
(27, '2016-05-25 15:10:17', 'cmuhirwa', 'no', 0),
(28, '2017-04-09 06:48:44', 'cmuhirwa', 'no', 0),
(29, '2017-04-09 07:09:50', 'cmuhirwa', 'no', 0),
(30, '2017-04-09 07:10:35', 'cmuhirwa', 'no', 0),
(31, '2017-04-09 07:12:31', '', 'no', 0),
(32, '2017-04-09 07:13:55', 'cmuhirwa', 'no', 0),
(33, '2017-04-09 07:23:00', 'cmuhirwa', 'no', 0),
(34, '2017-04-09 07:23:10', 'cmuhirwa', 'no', 0),
(35, '2017-04-09 07:23:22', 'cmuhirwa', 'no', 0),
(36, '2017-04-09 07:24:31', 'cmuhirwa', 'no', 0),
(37, '2017-04-09 07:37:06', 'cmuhirwa', 'no', 0),
(38, '2017-04-09 13:53:05', 'cmuhirwa', 'no', NULL),
(39, '2017-04-09 15:02:03', 'cmuhirwa', 'no', NULL),
(40, '2017-04-09 15:02:19', 'cmuhirwa', 'no', NULL),
(41, '2017-04-11 19:34:48', 'cmuhirwa', 'no', NULL),
(42, '2017-04-11 19:37:35', 'cmuhirwa', 'no', NULL),
(43, '2017-04-11 19:38:37', 'cmuhirwa', 'no', NULL),
(44, '2017-04-11 19:38:43', 'cmuhirwa', 'no', NULL),
(45, '2017-04-11 19:39:32', 'cmuhirwa', 'no', NULL),
(46, '2017-04-11 19:40:05', 'cmuhirwa', 'no', NULL),
(47, '2017-04-12 08:30:08', 'cmuhirwa', 'no', NULL),
(48, '2017-04-14 20:30:25', 'cmuhirwa', 'no', NULL),
(49, '2017-04-14 20:31:51', 'cmuhirwa', 'no', NULL),
(50, '2017-04-14 20:31:52', 'cmuhirwa', 'no', NULL),
(51, '2017-04-14 20:31:54', 'cmuhirwa', 'no', NULL),
(52, '2017-04-14 20:32:21', 'cmuhirwa', 'no', NULL),
(53, '2017-04-14 20:37:59', 'cmuhirwa', 'no', NULL),
(54, '2017-04-16 10:19:00', 'cmuhirwa', 'no', NULL),
(55, '2017-04-17 10:04:17', 'cmuhirwa', 'no', NULL),
(56, '2017-04-17 10:06:34', 'cmuhirwa', 'no', NULL),
(57, '2017-04-18 09:30:17', 'cmuhirwa', 'no', NULL),
(58, '2017-04-18 12:54:35', 'cmuhirwa', 'no', NULL),
(59, '2017-04-18 12:58:55', 'cmuhirwa', 'no', NULL),
(60, '2017-04-18 13:03:01', 'cmuhirwa', 'no', NULL),
(61, '2017-04-18 13:08:01', 'cmuhirwa', 'no', NULL),
(62, '2017-04-18 13:12:37', 'cmuhirwa', 'no', NULL),
(63, '2017-04-18 13:14:23', 'cmuhirwa', 'no', NULL),
(64, '2017-04-18 13:28:39', 'cmuhirwa', 'no', NULL),
(65, '2017-04-18 13:30:56', 'cmuhirwa', 'no', NULL),
(66, '2017-04-18 13:31:33', 'REHEMA', 'no', NULL),
(67, '2017-04-18 13:32:30', 'REHEMA', 'no', NULL),
(68, '2017-04-18 13:33:38', 'cmuhirwa', 'no', NULL),
(69, '2017-04-28 12:51:09', 'admin', 'no', NULL),
(70, '2017-04-28 14:18:58', 'admin', 'no', NULL),
(71, '2017-04-28 14:41:43', 'admin', 'no', NULL),
(72, '2017-04-28 14:42:01', 'admin', 'no', NULL),
(73, '2017-04-29 10:40:28', 'cmuhirwa', 'no', NULL),
(74, '2017-04-29 10:41:13', 'cmuhirwa', 'no', NULL),
(75, '2017-04-29 10:43:12', 'cmuhirwa', 'no', NULL),
(76, '2017-04-29 10:49:56', 'cmuhirwa', 'no', NULL),
(77, '2017-04-29 10:50:24', 'cmuhirwa', 'no', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transactionID` bigint(20) NOT NULL,
  `trUnityPrice` decimal(20,5) NOT NULL,
  `qty` decimal(20,5) NOT NULL,
  `itemCode` varchar(11) NOT NULL,
  `operation` varchar(20) NOT NULL,
  `purchaseOrder` varchar(50) NOT NULL,
  `deliverlyNote` varchar(50) NOT NULL,
  `docRefNumber` varchar(50) NOT NULL,
  `customerName` varchar(50) NOT NULL,
  `customerRef` varchar(50) NOT NULL,
  `operationNotes` varchar(300) NOT NULL,
  `operationStatus` int(2) NOT NULL,
  `doneOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `doneBy` varchar(100) DEFAULT NULL,
  `sync` enum('no','yes') NOT NULL,
  `syncid` bigint(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transactionID`, `trUnityPrice`, `qty`, `itemCode`, `operation`, `purchaseOrder`, `deliverlyNote`, `docRefNumber`, `customerName`, `customerRef`, `operationNotes`, `operationStatus`, `doneOn`, `doneBy`, `sync`, `syncid`) VALUES
(1, '500.00000', '9000.00000', '16', 'In', 'PO-01', 'DV-01', 'SLIP No. 831593', 'TOLIRWA Ltd', 'TIN. 0001586/337', 'Kumwenda wishyurwa mumezi 12, attached is the contract of instalement', 1, '2017-04-11 21:01:19', 'Clement', 'yes', 0),
(2, '550.00000', '1200.00000', '24', 'In', 'PO-01', 'DV-01', 'SLIP No. 831593', 'TOLIRWA Ltd', 'TIN. 0001586/337', 'Kumwenda wishyurwa mumezi 12, attached is the contract of instalement', 1, '2017-04-11 21:01:20', 'Clement', 'yes', 0),
(3, '550.00000', '600.00000', '23', 'In', 'PO-01', 'DV-01', 'SLIP No. 831593', 'TOLIRWA Ltd', 'TIN. 0001586/337', 'Kumwenda wishyurwa mumezi 12, attached is the contract of instalement', 1, '2017-04-11 21:01:22', 'Clement', 'yes', 0),
(4, '920.00000', '100.00000', '12', 'In', 'PO-01', 'DV-01', 'SLIP No. 831593', 'TOLIRWA Ltd', 'TIN. 0001586/337', 'Kumwenda wishyurwa mumezi 12, attached is the contract of instalement', 1, '2017-04-11 21:01:23', 'Clement', 'yes', 0),
(5, '650.00000', '150.00000', '16', 'Out', 'INV2016-2', 'Gasabo/ Kimironko', 'ACCESS 03282070', 'KAMANZI Jean nepo', '0786661228', '', 3, '2017-04-11 21:01:24', 'Clement', 'yes', 0),
(6, '600.00000', '12.00000', '24', 'Out', 'INV2016-3', 'N/A', 'N/A', 'N/A', 'N/A', '', 1, '2017-04-11 21:01:25', 'Clement', 'yes', 0),
(8, '640.00000', '50.00000', '16', 'Out', 'INV2016-18', 'N/A', 'N/A', 'N/A', 'N/A', '', 1, '2017-04-11 21:01:26', 'Clement', 'yes', 0),
(12, '600.00000', '100.00000', '24', 'Out', 'INV2016-23', 'N/A', 'N/A', 'N/A', 'N/A', '', 1, '2017-04-11 21:01:27', 'Clement', 'yes', 0),
(11, '600.00000', '50.00000', '23', 'Out', 'INV2016-23', 'FDVFDVFMMG', 'N/A', 'FJHTDF CVDFV', '45564534', 'ytgrfeds', 1, '2017-04-11 21:01:28', 'Clement', 'yes', 0),
(13, '1500.00000', '50.00000', '3', 'In', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', 1, '2017-04-11 21:01:29', 'Clement', 'yes', 0),
(14, '2000.00000', '1.00000', '3', 'Out', 'INV2016-26', 'N/A', 'N/A', 'N/A', 'N/A', '', 1, '2017-04-11 21:01:32', 'Clement', 'yes', 0),
(15, '250000.00000', '6.00000', '25', 'In', 'PO-01', 'DV-02', 'BK 34574982', 'FABLAB', '078545464', '', 1, '2017-04-11 21:01:35', 'Clement', 'yes', 0),
(16, '1500.00000', '500.00000', '2', 'In', 'PO-01', 'DV-02', 'BK 34574982', 'FABLAB', '078545464', '', 1, '2017-04-11 21:01:36', 'Clement', 'yes', 0),
(17, '300000.00000', '3.00000', '25', 'Out', 'INV2016-28', 'KIMIRONKO/ Gasabo', 'N/A', 'KAYONGA raul', '0788807007', 'comments here', 1, '2017-04-11 21:01:37', 'Clement', 'yes', 0),
(20, '300000.00000', '1.00000', '25', 'Out', 'INV2017-6', 'N/A', 'N/A', 'N/A', 'N/A', '', 1, '2017-04-11 21:01:38', 'Clement', 'yes', 0),
(21, '600.00000', '88.00000', '24', 'Out', 'INV2017-6', 'N/A', 'N/A', 'N/A', 'N/A', '', 1, '2017-04-11 21:01:39', 'Clement', 'yes', 0),
(22, '250000.00000', '2.00000', '25', 'In', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', 1, '2017-04-11 21:01:42', 'Clement', 'yes', 0),
(23, '300000.00000', '1.00000', '25', 'Out', 'INV2017-14', 'N/A', 'N/A', 'N/A', 'N/A', '', 1, '2017-04-11 21:01:44', 'Clement', 'yes', 0),
(24, '280000.00000', '1.00000', '25', 'Out', 'INV2017-16', 'N/A', 'N/A', 'N/A', 'N/A', '', 1, '2017-04-11 21:01:45', 'Clement', 'yes', 0),
(26, '250.00000', '1000.00000', '28', 'In', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', 1, '2017-04-12 08:30:47', 'Clement', 'yes', 0),
(27, '860.00000', '500.00000', '30', 'In', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', 1, '2017-04-14 20:29:52', 'Clement', 'no', NULL),
(28, '1000.00000', '2.00000', '30', 'Out', 'INV2017-22', 'N/A', 'N/A', 'N/A', 'N/A', '', 1, '2017-04-14 20:30:40', 'Clement', 'no', NULL),
(29, '1000.00000', '5.00000', '30', 'Out', 'INV2017-25', 'N/A', 'N/A', 'N/A', 'N/A', '', 1, '2017-04-14 20:32:02', 'Clement', 'no', NULL),
(30, '300000.00000', '1.00000', '25', 'Out', 'INV2017-29', 'N/A', 'N/A', 'N/A', 'N/A', '', 1, '2017-04-17 10:05:46', 'Clement', 'no', NULL),
(31, '1000.00000', '10.00000', '30', 'Out', 'INV2017-30', 'KACYIIRU', 'N/A', 'LAMBERT', '0781187555', '', 1, '2017-04-17 10:07:14', 'Clement', 'no', NULL),
(32, '420000.00000', '10.00000', '32', 'In', 'PO001', 'DEV001', 'BK123987', 'MITSUMI', '0789444383', '', 1, '2017-04-18 12:50:59', 'Clement', 'no', NULL),
(33, '650.00000', '20.00000', '31', 'In', 'PO001', 'DEV001', 'BK123987', 'MITSUMI', '0789444383', '', 1, '2017-04-18 12:51:14', 'Clement', 'no', NULL),
(34, '1800.00000', '100.00000', '2', 'In', 'PO001', 'DEV001', 'BK123987', 'MITSUMI', '0789444383', '', 1, '2017-04-18 12:51:40', 'Clement', 'no', NULL),
(35, '500000.00000', '2.00000', '32', 'Out', 'INV2017-32', 'KIMIRONKO', 'N/A', 'ISAAC', '0784589841', '', 1, '2017-04-18 12:56:19', 'Clement', 'no', NULL),
(36, '700.00000', '10.00000', '31', 'Out', 'INV2017-32', 'KIMIRONKO', 'N/A', 'ISAAC', '0784589841', '', 1, '2017-04-18 12:56:35', 'Clement', 'no', NULL),
(37, '500000.00000', '1.00000', '32', 'Out', 'INV2017-33', 'N/A', 'N/A', 'ISAAC', 'N/A', '', 1, '2017-04-18 12:59:08', 'Clement', 'no', NULL),
(38, '500000.00000', '1.00000', '32', 'Out', 'INV2017-33', 'N/A', 'N/A', 'ISAAC', 'N/A', '', 1, '2017-04-18 12:59:08', 'Clement', 'no', NULL),
(39, '500000.00000', '3.00000', '32', 'Out', 'INV2017-37', 'N/A', 'N/A', 'N/A', 'N/A', '', 1, '2017-04-18 13:14:30', 'Clement', 'no', NULL),
(40, '700.00000', '1.00000', '31', 'Out', 'INV2017-37', 'N/A', 'N/A', 'N/A', 'N/A', '', 1, '2017-04-18 13:14:36', 'Clement', 'no', NULL),
(41, '300000.00000', '1.00000', '25', 'Out', 'INV2017-37', 'N/A', 'N/A', 'N/A', 'N/A', '', 1, '2017-04-18 13:14:41', 'Clement', 'no', NULL),
(42, '600.00000', '200.00000', '24', 'Out', 'INV2017-37', 'N/A', 'N/A', 'N/A', 'N/A', '', 1, '2017-04-18 13:14:48', 'Clement', 'no', NULL),
(46, '1000.00000', '9.00000', '30', 'Out', 'INV2017-44', 'N/A', 'N/A', 'N/A', 'N/A', '', 1, '2017-04-28 14:38:54', 'Eric Mucyo', 'no', NULL),
(44, '500000.00000', '1.00000', '32', 'Out', 'INV2017-40', 'N/A', 'N/A', 'N/A', 'N/A', '', 1, '2017-04-18 13:32:01', 'REHEMA Shaban', 'no', NULL),
(45, '1800.00000', '100.00000', '3', 'In', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', '', 1, '2017-04-26 08:24:54', 'Eric Mucyo', 'no', NULL),
(47, '2000.00000', '100.00000', '2', 'Out', 'INV2017-46', 'N/A', 'N/A', 'Alice', '0788654778', '', 1, '2017-04-28 14:42:59', 'Eric Mucyo', 'no', NULL),
(48, '500000.00000', '2.00000', '32', 'Out', 'INV2017-47', 'N/A', 'N/A', 'N/A', 'N/A', '', 1, '2017-04-29 10:40:33', 'Clement', 'no', NULL),
(49, '700.00000', '3.00000', '31', 'Out', 'INV2017-47', 'N/A', 'N/A', 'CLement', '0784848236', '', 1, '2017-04-29 10:40:51', 'Clement', 'no', NULL),
(50, '1000.00000', '50.00000', '30', 'Out', 'INV2017-48', 'N/A', 'N/A', 'Isaac', '078435876', '', 1, '2017-04-29 10:41:41', 'Clement', 'no', NULL),
(51, '1000.00000', '24.00000', '30', 'Out', 'INV2017-49', 'N/A', 'N/A', 'Test', '5645', '', 1, '2017-04-29 10:43:26', 'Clement', 'no', NULL);

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
  `account_type` enum('user','admin') NOT NULL,
  `sync` enum('no','yes') NOT NULL,
  `syncid` bigint(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `loginId`, `pwd`, `names`, `phone`, `email`, `residence`, `workPlace`, `account_type`, `sync`, `syncid`) VALUES
(1, 'admin', 'admin', 'Eric Mucyo', '0788880000', 'admin@trad.com', 'kimironko', 'town', 'admin', 'yes', 3),
(4, 'cmuhirwa', 'clement123', 'Clement', '0784848236', 'muhirwaclement@gmail.com', 'kimironko', 'town', 'user', 'yes', 2),
(9, 'test', 'test', 'TestUser2', '0788', 'email@smk.com', NULL, 'dklk', 'user', 'yes', 0),
(8, 'rehema', 'rehema123', 'REHEMA Shaban', '0788578657', 'rehegiraict@gmail.com', NULL, 'Town', 'user', 'yes', 0),
(10, '12n', '12n', 'nn', '0222', 'jhjhnkjn', NULL, 'hhklm;l', 'user', 'yes', 0),
(11, '124', '124', 'n', '0220', 'jhjhnkj', NULL, 'hhklm;', 'user', 'yes', 0),
(12, 'ghkjhj', 'ghj', 'dfd', '521', 'hjhkhjg', NULL, 'ghjkhm', 'user', 'yes', 0),
(13, 'ghkjhjdfv', 'ghjdvd', 'dfdf', '5214', 'hjhkhjgdf', NULL, 'ghjkhmsdv', 'user', 'yes', 0),
(14, 'ghkjh', 'gh', 'df', '52', 'hjhkhj', NULL, 'ghjkh', 'user', 'yes', 0),
(15, 'ghkjhdsfghj', 'ghdfg', 'dfsfdghj', '524567', 'hjhkhjfghj', NULL, 'ghjkhfghjk', 'user', 'yes', 0),
(16, 'ghjhgfds', 'fghjhgf', 'xfg', '4543', 'dfg', NULL, 'dfghjgg', 'user', 'yes', 0),
(17, 'ghjhgfd', 'fghjhg', 'xf', '454', 'df', NULL, 'dfghjg', 'user', 'yes', 0),
(18, 'ghjhgfdi', 'fghjhgi', 'xfi', '4546', 'dfi', NULL, 'dfghjgi', 'user', 'yes', 0),
(19, 'ghjhgfdiu', 'fghjhgiu', 'xfih', '45469', 'dfiu', NULL, 'dfghjgiu', 'user', 'yes', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`itemId`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`transactionId`);

--
-- Indexes for table `serieid`
--
ALTER TABLE `serieid`
  ADD PRIMARY KEY (`serieID`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transactionID`);

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
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `itemId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `transactionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `serieid`
--
ALTER TABLE `serieid`
  MODIFY `serieID` bigint(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;
--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transactionID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
