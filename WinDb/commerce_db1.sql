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
-- Database: `commerce_db1`
--

-- --------------------------------------------------------

--
-- Table structure for table `bids`
--

CREATE TABLE `bids` (
  `transactionID` bigint(20) NOT NULL,
  `companyId` int(11) NOT NULL,
  `trUnityPrice` decimal(11,5) NOT NULL,
  `qty` decimal(11,5) NOT NULL,
  `itemCode` bigint(20) NOT NULL,
  `operation` varchar(20) NOT NULL,
  `purchaseOrder` varchar(50) NOT NULL,
  `deliverlyNote` varchar(50) NOT NULL,
  `docRefNumber` varchar(50) NOT NULL,
  `customerName` varchar(50) NOT NULL,
  `customerRef` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `operationStatus` int(2) NOT NULL,
  `doneOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `doneBy` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `title` varchar(30) NOT NULL,
  `surname` varchar(30) NOT NULL,
  `otherNames` varchar(30) NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(30) NOT NULL,
  `nidPassport` varchar(30) NOT NULL,
  `nationality` varchar(30) NOT NULL,
  `postalLine1` varchar(30) NOT NULL,
  `postalLine2` varchar(30) NOT NULL,
  `phyisicalLine3` varchar(30) NOT NULL,
  `postCode` varchar(30) NOT NULL,
  `taxCode` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL,
  `residentIn` varchar(30) NOT NULL,
  `telephone` varchar(30) NOT NULL,
  `fax` varchar(30) NOT NULL,
  `e-mail` varchar(30) NOT NULL,
  `bankName` varchar(30) NOT NULL,
  `branch` varchar(30) NOT NULL,
  `accountNumber` varchar(30) NOT NULL,
  `attachments` enum('none','nid','pass','birc') NOT NULL,
  `status` enum('pending','approved','decliend') NOT NULL,
  `statusBy` varchar(30) NOT NULL,
  `statusOn` date NOT NULL,
  `csdAccount` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `title`, `surname`, `otherNames`, `dob`, `gender`, `nidPassport`, `nationality`, `postalLine1`, `postalLine2`, `phyisicalLine3`, `postCode`, `taxCode`, `city`, `country`, `residentIn`, `telephone`, `fax`, `e-mail`, `bankName`, `branch`, `accountNumber`, `attachments`, `status`, `statusBy`, `statusOn`, `csdAccount`) VALUES
(1, 'mr', '', '', '2017-03-29', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'none', 'approved', '', '2017-03-06', ''),
(2, 'mr', '', '', '2017-03-29', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'none', 'pending', '', '2017-03-06', ''),
(3, 'none', '', '', '2017-03-29', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'none', 'pending', '', '2017-03-06', ''),
(10, 'Mr', 'Clement', 'Muhirwa', '1993-01-01', 'Male', '1199380036180077', 'Rwandan', 'Gasabo', 'Kimironko', 'Bibare', '1234', '1234', 'Kigali', 'Rwanda', 'Rwanda', '0784848236', 'none', 'muhirwaclement@gmail.com', 'Access Bank', 'Nyarygenge', '1004766582', 'none', 'pending', '', '0000-00-00', ''),
(11, 'Mr', 'test', 'hjbjnkm', '2017-03-28', 'Mr', '8976578', 'rwandan', 'hbn', 'gfhvhjbm', 'ghjbk', '768', 'gh76', 'kghj', 'gkl;', 'hjk', 'vhj,bkl876', 'uyio', 'ghghjk', 'hfjykg', 'jk', 'jkjl;', '', 'pending', '', '0000-00-00', ''),
(12, 'Mrs', 'Test', 'Test1', '2014-01-15', 'Mrs', '11923098098094', 'Rwandan', 'Kacyiru', 'Gasabo', '', 'Kigali123', '123TAx', 'Kigali', 'Rwanda', 'Rwanda', '0784848236', '23798', 'muhirwaclement@gmail.com', 'Access Bank', 'Kigali-Nyarugenge', '1003597982', '', 'pending', '', '0000-00-00', '');

-- --------------------------------------------------------

--
-- Table structure for table `commentreplies`
--

CREATE TABLE `commentreplies` (
  `replyID` bigint(20) NOT NULL,
  `replyNotes` varchar(250) NOT NULL,
  `replyBy` varchar(100) NOT NULL,
  `replyDatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `visibilityStatus` enum('Private','All users','Public') NOT NULL,
  `commentCode` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `company1`
--

CREATE TABLE `company1` (
  `businessType` varchar(50) NOT NULL,
  `companyId` int(11) NOT NULL,
  `companyDescription` varchar(50) NOT NULL,
  `companyName` varchar(50) NOT NULL,
  `companyTin` varchar(50) NOT NULL,
  `cumpanyUserCode` int(11) NOT NULL,
  `location` varchar(50) NOT NULL,
  `dateIn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company1`
--

INSERT INTO `company1` (`businessType`, `companyId`, `companyDescription`, `companyName`, `companyTin`, `cumpanyUserCode`, `location`, `dateIn`) VALUES
('Broker', 1, 'our company has 5 year experiance', 'CDH Capital', '43989kj', 2, 'Kigali', '2017-02-28 09:02:23'),
('Fintech', 2, 'our company is the best leading in capital brockra', 'Amros', '23234', 3, 'Kigali', '2017-02-28 10:03:53'),
('Finicaila Market', 3, 'Our company is the best in selling shares', 'Ali Brokers', '49832748789', 5, 'Kigali Kacyiru', '2017-03-01 11:52:21'),
('Stock Broker', 4, 'authorized selling agent for stocks and Bonds', 'CDH capital Ltd', '39475987', 6, 'Kigali', '2017-03-01 12:02:37'),
('', 5, 'this it the best investment vehicle ever', 'Inses', '12343534', 8, '', '2017-03-06 11:10:10'),
('', 6, 'OUr company is the best in the market of stock bro', 'Glad Broker', '234798', 9, '', '2017-03-06 13:13:33'),
('', 7, 'our company is the best in the market', 'Mbea-Brokerage ', '3442223', 10, '', '2017-03-06 18:45:46');

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
  `updatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `productCode` bigint(20) NOT NULL,
  `unitPrice` double NOT NULL,
  `unit` varchar(50) NOT NULL,
  `itemCompanyCode` int(11) NOT NULL,
  `description` varchar(50) NOT NULL,
  `status` enum('close','open') NOT NULL,
  `changeOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items1`
--

INSERT INTO `items1` (`itemId`, `itemName`, `abrev`, `createdBy`, `createdDate`, `updatedBy`, `updatedDate`, `productCode`, `unitPrice`, `unit`, `itemCompanyCode`, `description`, `status`, `changeOn`) VALUES
(1, 'Bralirwa', 'BLR', 'JEAN', '2017-03-02 09:21:33', 'JEAN', '2017-04-25 16:49:14', 5, 127, '', 1, 'ibinyobwa', 'open', '2017-04-25 16:47:02'),
(2, 'KCB Bank', 'KCB', 'JEAN', '2017-03-02 10:03:46', 'JEAN', '2017-04-30 22:46:59', 5, 127, '', 1, 'this is the best bank ever', 'open', '2017-04-30 22:46:59'),
(3, 'Equity Bank', 'EQT', 'JEAN', '2017-03-02 10:15:27', 'JEAN', '2017-04-25 16:49:14', 5, 127, '', 1, 'this bank is for every people and it is doing well', 'open', '2017-04-25 09:56:27'),
(4, 'Crystal Ventures', 'CTV', 'jean', '2017-03-02 10:37:43', 'jean', '2017-04-30 22:45:13', 6, 127, '', 1, 'the group of projects combined', 'open', '2017-04-30 22:45:13'),
(5, 'Bank Of Kigali', 'BK', 'c', '2017-03-06 02:59:52', 'c', '2017-04-25 21:18:49', 5, 127, '', 1, 'this product is the first on the market ever', 'open', '0000-00-00 00:00:00'),
(6, 'Bank Of Kigali', 'BK', 'nana', '2017-03-06 03:12:20', 'nana', '2017-04-25 21:19:41', 5, 127, '', 1, 'this bank has a stable market', 'close', '0000-00-00 00:00:00'),
(9, 'I&M Bank', 'I&M', 'gla', '2017-03-06 05:25:57', 'gla', '2017-04-25 21:19:25', 5, 103, '', 6, 'this bank is the best', 'open', '0000-00-00 00:00:00'),
(10, 'I&M Bank', 'I&M', 'Mbeya', '2017-03-06 10:46:54', 'Mbeya', '2017-04-25 16:49:14', 5, 203, '', 7, 'the bank of africa', 'close', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `postscomments`
--

CREATE TABLE `postscomments` (
  `commentId` bigint(20) NOT NULL,
  `commentNote` varchar(250) NOT NULL,
  `commentBy` varchar(100) NOT NULL,
  `commentDatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `visibilityStatus` enum('Private','All users','Public') NOT NULL,
  `userCode` bigint(20) NOT NULL,
  `postCode` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `postscomments`
--

INSERT INTO `postscomments` (`commentId`, `commentNote`, `commentBy`, `commentDatetime`, `visibilityStatus`, `userCode`, `postCode`) VALUES
(1, 'Mure is a good mother', 'mure', '2017-02-28 10:19:59', 'Public', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `productcategory`
--

CREATE TABLE `productcategory` (
  `catId` bigint(20) NOT NULL,
  `catNane` varchar(100) NOT NULL,
  `catDesc` varchar(250) NOT NULL,
  `createDate_By` varchar(100) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productcategory`
--

INSERT INTO `productcategory` (`catId`, `catNane`, `catDesc`, `createDate_By`, `status`) VALUES
(3, 'Agricultural', '', '', 'Active'),
(4, 'Energy', '', '', 'Active'),
(5, 'Banks', '', '', 'Active'),
(6, 'Equity', '', '', 'Active'),
(7, 'Real Estates', '', '', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `productId` bigint(20) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productDesc` varchar(150) NOT NULL,
  `unit` int(11) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `createDate_By` varchar(100) NOT NULL,
  `subCatCode` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productId`, `productName`, `productDesc`, `unit`, `status`, `createDate_By`, `subCatCode`) VALUES
(6, '3', '', 10, 'Active', 'me', 6),
(5, '2', '', 10, 'Active', 'me', 5),
(4, '1', '', 10, 'Active', 'me', 4),
(7, '4', '', 10, 'Active', 'me', 7),
(8, '5', '', 10, 'Active', 'me', 8);

-- --------------------------------------------------------

--
-- Table structure for table `productsubcategory`
--

CREATE TABLE `productsubcategory` (
  `subCatId` bigint(20) NOT NULL,
  `subCatName` varchar(100) NOT NULL,
  `subCatDesc` varchar(250) NOT NULL,
  `createDate_By` varchar(100) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `CatCode` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productsubcategory`
--

INSERT INTO `productsubcategory` (`subCatId`, `subCatName`, `subCatDesc`, `createDate_By`, `status`, `CatCode`) VALUES
(5, '1', '', '', 'Active', 6),
(4, '1', '', '', 'Active', 7),
(6, '1', '', '', 'Active', 5),
(7, '1', '', '', 'Active', 4),
(8, '1', '', '', 'Active', 3);

-- --------------------------------------------------------

--
-- Table structure for table `theask`
--

CREATE TABLE `theask` (
  `transactionId` bigint(20) NOT NULL,
  `companyId` int(11) NOT NULL,
  `unitPrice` decimal(11,5) NOT NULL,
  `bidPrice` decimal(11,0) NOT NULL,
  `priceType` enum('current','prev') NOT NULL,
  `qty` int(11) NOT NULL,
  `minQty` int(11) NOT NULL,
  `itemCode` bigint(20) NOT NULL,
  `doneOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `doneBy` varchar(100) NOT NULL,
  `operation` enum('close','open') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `theask`
--

INSERT INTO `theask` (`transactionId`, `companyId`, `unitPrice`, `bidPrice`, `priceType`, `qty`, `minQty`, `itemCode`, `doneOn`, `doneBy`, `operation`) VALUES
(1, 1, '305.00000', '0', 'prev', 0, 0, 1, '2017-03-02 17:21:33', '', 'close'),
(2, 1, '305.00000', '0', 'current', 0, 0, 1, '2017-03-02 17:21:33', '', 'close'),
(3, 1, '305.00000', '0', 'prev', 0, 0, 1, '2017-03-02 17:48:29', 'JEAN', 'close'),
(4, 1, '307.00000', '0', 'current', 0, 0, 1, '2017-03-02 17:48:29', 'JEAN', 'close'),
(5, 1, '305.00000', '0', 'prev', 0, 0, 1, '2017-03-02 17:57:27', 'JEAN', 'close'),
(6, 1, '306.00000', '0', 'current', 0, 0, 1, '2017-03-02 17:57:27', 'JEAN', 'close'),
(7, 1, '305.00000', '0', 'prev', 0, 0, 1, '2017-03-02 17:58:11', 'JEAN', 'close'),
(8, 1, '307.00000', '0', 'current', 0, 0, 1, '2017-03-02 17:58:11', 'JEAN', 'close'),
(9, 1, '307.00000', '0', 'prev', 0, 0, 1, '2017-03-02 17:59:27', 'JEAN', 'close'),
(10, 1, '304.00000', '0', 'current', 0, 0, 1, '2017-03-02 17:59:27', 'JEAN', 'close'),
(11, 1, '304.00000', '0', 'prev', 0, 0, 1, '2017-03-02 17:59:58', 'JEAN', 'close'),
(12, 1, '309.90000', '0', 'current', 0, 0, 1, '2017-03-02 17:59:58', 'JEAN', 'close'),
(13, 1, '309.90000', '0', 'prev', 0, 0, 1, '2017-03-02 18:00:29', 'JEAN', 'close'),
(14, 1, '307.25000', '0', 'current', 0, 0, 1, '2017-03-02 18:00:29', 'JEAN', 'close'),
(15, 1, '307.25000', '0', 'prev', 0, 0, 1, '2017-03-02 18:02:21', 'JEAN', 'close'),
(16, 1, '307.50000', '0', 'current', 0, 0, 1, '2017-03-02 18:02:21', 'JEAN', 'close'),
(17, 1, '203.00000', '0', 'prev', 0, 0, 2, '2017-03-02 18:03:46', '', 'close'),
(18, 1, '203.00000', '0', 'current', 0, 0, 2, '2017-03-02 18:03:46', '', 'close'),
(19, 1, '203.00000', '0', 'prev', 0, 0, 2, '2017-03-02 18:04:27', 'JEAN', 'close'),
(20, 1, '203.75000', '0', 'current', 0, 0, 2, '2017-03-02 18:04:27', 'JEAN', 'close'),
(21, 1, '178.00000', '0', 'prev', 0, 0, 3, '2017-03-02 18:15:27', '', 'close'),
(22, 1, '178.00000', '0', 'current', 0, 0, 3, '2017-03-02 18:15:27', '', 'close'),
(23, 1, '203.75000', '0', 'prev', 0, 0, 2, '2017-03-02 18:18:51', 'JEAN', 'close'),
(24, 1, '203.00000', '0', 'current', 0, 0, 2, '2017-03-02 18:18:51', 'JEAN', 'close'),
(25, 1, '218.00000', '0', 'prev', 0, 0, 4, '2017-03-02 18:37:43', '', 'close'),
(26, 1, '218.00000', '0', 'current', 0, 0, 4, '2017-03-02 18:37:43', '', 'close'),
(27, 1, '203.00000', '0', 'prev', 0, 0, 2, '2017-03-02 18:38:07', 'jean', 'close'),
(28, 1, '203.75000', '0', 'current', 0, 0, 2, '2017-03-02 18:38:07', 'jean', 'close'),
(29, 1, '203.75000', '0', 'prev', 0, 0, 2, '2017-03-02 18:38:17', 'jean', 'close'),
(30, 1, '203.75000', '0', 'current', 0, 0, 2, '2017-03-02 18:38:17', 'jean', 'close'),
(31, 1, '307.50000', '0', 'prev', 0, 0, 1, '2017-03-02 18:38:26', 'jean', 'close'),
(32, 1, '307.50000', '0', 'current', 0, 0, 1, '2017-03-02 18:38:26', 'jean', 'close'),
(33, 1, '218.00000', '0', 'prev', 0, 0, 4, '2017-03-02 18:42:08', 'jean', 'close'),
(34, 1, '0.00000', '0', 'current', 0, 0, 4, '2017-03-02 18:42:08', 'jean', 'close'),
(35, 1, '0.00000', '0', 'prev', 0, 0, 4, '2017-03-02 18:47:34', 'jean', 'close'),
(36, 1, '218.00000', '0', 'current', 0, 0, 4, '2017-03-02 18:47:34', 'jean', 'close'),
(37, 1, '218.00000', '0', 'prev', 0, 0, 4, '2017-03-02 18:47:46', 'jean', 'close'),
(38, 1, '0.00000', '0', 'current', 0, 0, 4, '2017-03-02 18:47:46', 'jean', 'close'),
(39, 1, '0.00000', '0', 'prev', 0, 0, 4, '2017-03-02 18:47:53', 'jean', 'close'),
(40, 1, '0.00000', '0', 'current', 0, 0, 4, '2017-03-02 18:47:53', 'jean', 'close'),
(41, 1, '0.00000', '0', 'prev', 0, 0, 4, '2017-03-02 18:48:04', 'jean', 'close'),
(42, 1, '218.00000', '0', 'current', 0, 0, 4, '2017-03-02 18:48:04', 'jean', 'close'),
(43, 1, '218.00000', '0', 'prev', 0, 0, 4, '2017-03-02 18:49:55', 'jean', 'close'),
(44, 1, '218.75000', '0', 'current', 0, 0, 4, '2017-03-02 18:49:55', 'jean', 'close'),
(45, 1, '178.00000', '0', 'prev', 0, 0, 3, '2017-03-03 07:42:12', 'jean', 'close'),
(46, 1, '178.25000', '0', 'current', 0, 0, 3, '2017-03-03 07:42:12', 'jean', 'close'),
(47, 1, '203.75000', '0', 'prev', 0, 0, 2, '2017-03-03 07:42:21', 'jean', 'close'),
(48, 1, '203.00000', '0', 'current', 0, 0, 2, '2017-03-03 07:42:21', 'jean', 'close'),
(49, 1, '307.50000', '0', 'prev', 0, 0, 1, '2017-03-03 07:42:28', 'jean', 'close'),
(50, 1, '308.00000', '0', 'current', 0, 0, 1, '2017-03-03 07:42:28', 'jean', 'close'),
(51, 1, '218.75000', '0', 'prev', 0, 0, 4, '2017-03-03 17:40:51', 'jean', 'close'),
(52, 1, '219.00000', '0', 'current', 0, 0, 4, '2017-03-03 17:40:51', 'jean', 'close'),
(53, 2, '237.00000', '0', 'prev', 0, 0, 5, '2017-03-06 10:59:52', '', 'close'),
(54, 2, '237.00000', '0', 'current', 0, 0, 5, '2017-03-06 10:59:52', '', 'close'),
(55, 2, '237.00000', '0', 'prev', 0, 0, 5, '2017-03-06 11:00:15', 'c', 'close'),
(56, 2, '237.03000', '0', 'current', 0, 0, 5, '2017-03-06 11:00:15', 'c', 'close'),
(57, 2, '237.03000', '0', 'prev', 0, 0, 5, '2017-03-06 11:01:27', 'c', 'close'),
(58, 2, '237.05000', '0', 'current', 0, 0, 5, '2017-03-06 11:01:27', 'c', 'close'),
(59, 2, '237.05000', '0', 'prev', 0, 0, 5, '2017-03-06 11:03:17', 'c', 'close'),
(60, 2, '237.01000', '0', 'current', 0, 0, 5, '2017-03-06 11:03:17', 'c', 'close'),
(61, 1, '219.00000', '0', 'prev', 0, 0, 4, '2017-03-06 11:03:44', 'jean', 'close'),
(62, 1, '218.75000', '0', 'current', 0, 0, 4, '2017-03-06 11:03:44', 'jean', 'close'),
(63, 1, '218.75000', '0', 'prev', 0, 0, 4, '2017-03-06 11:04:52', 'jean', 'close'),
(64, 1, '219.02000', '0', 'current', 0, 0, 4, '2017-03-06 11:04:52', 'jean', 'close'),
(65, 5, '227.00000', '0', 'prev', 0, 0, 6, '2017-03-06 11:12:20', '', 'close'),
(66, 5, '227.00000', '0', 'current', 0, 0, 6, '2017-03-06 11:12:20', '', 'close'),
(67, 1, '308.00000', '0', 'prev', 0, 0, 1, '2017-03-06 11:54:11', 'jean', 'close'),
(68, 1, '300.00000', '0', 'current', 0, 0, 1, '2017-03-06 11:54:11', 'jean', 'close'),
(69, 6, '123.00000', '0', 'prev', 0, 0, 7, '2017-03-06 13:23:36', '', 'close'),
(70, 6, '123.00000', '0', 'current', 0, 0, 7, '2017-03-06 13:23:36', '', 'close'),
(71, 6, '102.00000', '0', 'prev', 0, 0, 8, '2017-03-06 13:24:45', '', 'close'),
(72, 6, '102.00000', '0', 'current', 0, 0, 8, '2017-03-06 13:24:45', '', 'close'),
(73, 6, '103.00000', '0', 'prev', 0, 0, 9, '2017-03-06 13:25:57', '', 'close'),
(74, 6, '103.00000', '0', 'current', 0, 0, 9, '2017-03-06 13:25:57', '', 'close'),
(75, 6, '103.00000', '0', 'prev', 0, 0, 9, '2017-03-06 13:26:19', 'gla', 'close'),
(76, 6, '103.75000', '0', 'current', 0, 0, 9, '2017-03-06 13:26:19', 'gla', 'close'),
(77, 6, '103.75000', '0', 'prev', 0, 0, 9, '2017-03-06 13:26:37', 'gla', 'close'),
(78, 6, '102.25000', '0', 'current', 0, 0, 9, '2017-03-06 13:26:37', 'gla', 'close'),
(79, 6, '102.25000', '0', 'prev', 0, 0, 9, '2017-03-06 13:29:34', 'gla', 'close'),
(80, 6, '103.00000', '0', 'current', 0, 0, 9, '2017-03-06 13:29:34', 'gla', 'close'),
(81, 7, '203.00000', '0', 'prev', 0, 0, 10, '2017-03-06 18:46:54', '', 'close'),
(82, 7, '203.00000', '0', 'current', 0, 0, 10, '2017-03-06 18:46:54', '', 'close'),
(83, 7, '203.00000', '0', 'prev', 0, 0, 10, '2017-03-06 18:47:19', 'Mbeya', 'close'),
(84, 7, '203.25000', '0', 'current', 0, 0, 10, '2017-03-06 18:47:19', 'Mbeya', 'close'),
(85, 1, '300.00000', '0', 'prev', 0, 0, 1, '2017-03-07 11:46:02', 'jean', 'close'),
(86, 1, '308.00000', '0', 'current', 0, 0, 1, '2017-03-07 11:46:02', 'jean', 'close'),
(87, 1, '308.00000', '0', 'prev', 0, 0, 1, '2017-03-07 11:46:12', 'jean', 'close'),
(88, 1, '308.50000', '0', 'current', 0, 0, 1, '2017-03-07 11:46:12', 'jean', 'close'),
(89, 1, '219.02000', '0', 'prev', 0, 0, 4, '2017-03-07 12:09:41', 'jean', 'close'),
(90, 1, '220.00000', '0', 'current', 0, 0, 4, '2017-03-07 12:09:41', 'jean', 'close'),
(91, 1, '220.00000', '0', 'prev', 0, 0, 4, '2017-03-30 14:55:17', 'jean', 'close'),
(92, 1, '230.00000', '0', 'current', 0, 0, 4, '2017-03-30 14:55:17', 'jean', 'close'),
(93, 1, '230.00000', '0', 'prev', 0, 0, 4, '2017-04-24 09:07:26', 'jean', 'close'),
(94, 1, '0.00000', '0', 'current', 0, 0, 4, '2017-04-24 09:07:26', 'jean', 'close'),
(95, 1, '178.25000', '0', 'prev', 0, 0, 3, '2017-04-24 11:27:34', 'jean', 'close'),
(96, 1, '179.00000', '180', 'current', 100, 10, 3, '2017-04-24 11:27:34', 'jean', 'open'),
(97, 1, '203.00000', '0', 'prev', 0, 0, 2, '2017-04-24 11:30:38', 'jean', 'close'),
(98, 1, '204.00000', '205', 'current', 2000, 100, 2, '2017-04-24 11:30:38', 'jean', 'open'),
(99, 1, '204.00000', '205', 'prev', 2000, 100, 2, '2017-04-24 11:33:31', 'jean', 'close'),
(100, 1, '203.00000', '207', 'current', 1300, 100, 2, '2017-04-24 11:33:31', 'jean', 'open'),
(101, 1, '0.00000', '0', 'prev', 0, 0, 4, '2017-04-24 11:46:07', 'jean', 'close'),
(102, 1, '0.00000', '0', 'current', 0, 0, 4, '2017-04-24 11:46:07', 'jean', 'open'),
(103, 1, '203.00000', '207', 'prev', 1300, 100, 2, '2017-04-24 11:46:20', 'jean', 'close'),
(104, 1, '0.00000', '0', 'current', 0, 0, 2, '2017-04-24 11:46:20', 'jean', 'open'),
(105, 1, '179.00000', '180', 'prev', 100, 10, 3, '2017-04-24 11:49:12', 'jean', 'close'),
(106, 1, '179.00000', '180', 'current', 100, 10, 3, '2017-04-24 11:49:12', 'jean', 'open'),
(107, 1, '179.00000', '180', 'prev', 100, 10, 3, '2017-04-24 11:49:24', 'jean', 'close'),
(108, 1, '179.00000', '180', 'current', 100, 10, 3, '2017-04-24 11:49:24', 'jean', 'open'),
(109, 1, '0.00000', '0', 'prev', 0, 0, 4, '2017-04-24 11:49:30', 'jean', 'close'),
(110, 1, '0.00000', '0', 'current', 0, 0, 4, '2017-04-24 11:49:30', 'jean', 'open'),
(111, 1, '0.00000', '0', 'prev', 0, 0, 2, '2017-04-24 11:49:33', 'jean', 'close'),
(112, 1, '0.00000', '0', 'current', 0, 0, 2, '2017-04-24 11:49:33', 'jean', 'open'),
(113, 1, '308.50000', '0', 'prev', 0, 0, 1, '2017-04-24 11:49:35', 'jean', 'close'),
(114, 1, '308.50000', '0', 'current', 0, 0, 1, '2017-04-24 11:49:35', 'jean', 'open'),
(115, 1, '0.00000', '0', 'prev', 0, 0, 4, '2017-04-24 11:50:38', 'jean', 'close'),
(116, 1, '300.00000', '302', 'current', 2000, 100, 4, '2017-04-24 11:50:38', 'jean', 'open'),
(117, 1, '179.00000', '180', 'prev', 100, 10, 3, '2017-04-24 11:56:11', 'jean', 'close'),
(118, 1, '179.00000', '180', 'current', 100, 10, 3, '2017-04-24 11:56:11', 'jean', 'open'),
(119, 1, '179.00000', '180', 'prev', 100, 10, 3, '2017-04-24 11:56:11', 'jean', 'close'),
(120, 1, '179.00000', '180', 'current', 100, 10, 3, '2017-04-24 11:56:11', 'jean', 'open'),
(121, 1, '179.00000', '180', 'prev', 100, 10, 3, '2017-04-24 12:48:10', 'jean', 'close'),
(122, 1, '179.00000', '180', 'current', 100, 10, 3, '2017-04-24 12:48:10', 'jean', 'open'),
(123, 1, '0.00000', '0', 'prev', 0, 0, 2, '2017-04-24 12:48:13', 'jean', 'close'),
(124, 1, '0.00000', '0', 'current', 0, 0, 2, '2017-04-24 12:48:13', 'jean', 'open'),
(125, 1, '308.50000', '0', 'prev', 0, 0, 1, '2017-04-24 12:48:14', 'jean', 'close'),
(126, 1, '308.50000', '0', 'current', 0, 0, 1, '2017-04-24 12:48:14', 'jean', 'open'),
(127, 1, '300.00000', '302', 'prev', 2000, 100, 4, '2017-04-24 12:55:00', 'jean', 'close'),
(128, 1, '300.00000', '302', 'current', 2000, 100, 4, '2017-04-24 12:55:00', 'jean', 'open'),
(129, 1, '179.00000', '180', 'prev', 100, 10, 3, '2017-04-24 12:55:03', 'jean', 'close'),
(130, 1, '179.00000', '180', 'current', 100, 10, 3, '2017-04-24 12:55:03', 'jean', 'open'),
(131, 1, '0.00000', '0', 'prev', 0, 0, 2, '2017-04-24 12:55:04', 'jean', 'close'),
(132, 1, '0.00000', '0', 'current', 0, 0, 2, '2017-04-24 12:55:05', 'jean', 'open'),
(133, 1, '300.00000', '302', 'prev', 2000, 100, 4, '2017-04-24 17:34:44', 'jean', 'close'),
(134, 1, '300.00000', '302', 'current', 2000, 100, 4, '2017-04-24 17:34:44', 'jean', 'open'),
(135, 1, '179.00000', '180', 'prev', 100, 10, 3, '2017-04-24 17:35:02', 'jean', 'close'),
(136, 1, '180.00000', '183', 'current', 50000, 100, 3, '2017-04-24 17:35:02', 'jean', 'open'),
(137, 1, '300.00000', '302', 'prev', 2000, 100, 4, '2017-04-24 17:35:23', 'jean', 'close'),
(138, 1, '298.00000', '301', 'current', 2000, 100, 4, '2017-04-24 17:35:23', 'jean', 'open'),
(139, 1, '180.00000', '183', 'prev', 50000, 100, 3, '2017-04-24 19:09:22', 'jean', 'close'),
(140, 1, '180.00000', '183', 'current', 50000, 100, 3, '2017-04-24 19:09:22', 'jean', 'open'),
(141, 1, '308.50000', '0', 'prev', 0, 0, 1, '2017-04-24 19:59:09', 'jean', 'close'),
(142, 1, '309.50000', '0', 'current', 0, 0, 1, '2017-04-24 19:59:09', 'jean', 'open'),
(143, 1, '298.00000', '301', 'prev', 2000, 100, 4, '2017-04-24 19:59:44', 'jean', 'close'),
(144, 1, '300.00000', '301', 'current', 2000, 100, 4, '2017-04-24 19:59:44', 'jean', 'open'),
(145, 1, '180.00000', '183', 'prev', 50000, 100, 3, '2017-04-24 21:35:03', 'jean', 'close'),
(146, 1, '180.00000', '183', 'current', 50000, 100, 3, '2017-04-24 21:35:03', 'jean', 'open'),
(147, 1, '180.00000', '183', 'prev', 50000, 100, 3, '2017-04-24 23:27:35', 'jean', 'close'),
(148, 1, '180.00000', '183', 'current', 50000, 100, 3, '2017-04-24 23:27:35', 'jean', 'open'),
(149, 1, '0.00000', '0', 'prev', 0, 0, 2, '2017-04-24 23:31:10', 'jean', 'close'),
(150, 1, '0.00000', '0', 'current', 0, 0, 2, '2017-04-24 23:31:10', 'jean', 'open'),
(151, 1, '309.50000', '0', 'prev', 0, 0, 1, '2017-04-24 23:31:14', 'jean', 'close'),
(152, 1, '309.50000', '0', 'current', 0, 0, 1, '2017-04-24 23:31:14', 'jean', 'open'),
(153, 1, '180.00000', '183', 'prev', 50000, 100, 3, '2017-04-25 08:22:04', 'jean', 'close'),
(154, 1, '180.00000', '183', 'current', 50000, 100, 3, '2017-04-25 08:22:04', 'jean', 'open'),
(155, 1, '0.00000', '0', 'prev', 0, 0, 2, '2017-04-25 08:22:08', 'jean', 'close'),
(156, 1, '0.00000', '0', 'current', 0, 0, 2, '2017-04-25 08:22:08', 'jean', 'open'),
(157, 1, '309.50000', '0', 'prev', 0, 0, 1, '2017-04-25 08:22:11', 'jean', 'close'),
(158, 1, '309.50000', '0', 'current', 0, 0, 1, '2017-04-25 08:22:11', 'jean', 'open'),
(159, 1, '309.50000', '0', 'prev', 0, 0, 1, '2017-04-25 09:55:35', 'jean', 'close'),
(160, 1, '345.00000', '346', 'current', 1000, 100, 1, '2017-04-25 09:55:35', 'jean', 'open'),
(161, 1, '0.00000', '0', 'prev', 0, 0, 2, '2017-04-25 09:56:03', 'jean', 'close'),
(162, 1, '200.00000', '201', 'current', 3000, 100, 2, '2017-04-25 09:56:03', 'jean', 'open'),
(163, 1, '180.00000', '183', 'prev', 50000, 100, 3, '2017-04-25 09:56:27', 'jean', 'close'),
(164, 1, '182.00000', '188', 'current', 45000, 100, 3, '2017-04-25 09:56:27', 'jean', 'open'),
(165, 1, '300.00000', '301', 'prev', 2000, 100, 4, '2017-04-25 09:56:40', 'jean', 'close'),
(166, 1, '312.00000', '311', 'current', 2000, 100, 4, '2017-04-25 09:56:40', 'jean', 'open'),
(167, 1, '312.00000', '0', 'prev', 0, 0, 4, '2017-04-25 15:10:09', 'jean', 'close'),
(168, 1, '295.00000', '0', 'current', 0, 0, 4, '2017-04-25 15:10:09', 'jean', 'open'),
(169, 1, '345.00000', '346', 'prev', 1000, 100, 1, '2017-04-25 16:47:02', 'jean', 'close'),
(170, 1, '345.00000', '346', 'current', 1000, 100, 1, '2017-04-25 16:47:02', 'jean', 'open'),
(171, 1, '345.00000', '0', 'prev', 0, 0, 1, '2017-04-25 16:49:45', 'jean', 'close'),
(172, 1, '350.00000', '0', 'current', 0, 0, 1, '2017-04-25 16:49:45', 'jean', 'open'),
(173, 1, '295.00000', '0', 'prev', 0, 0, 4, '2017-04-25 18:02:57', 'jean', 'close'),
(174, 1, '320.00000', '0', 'current', 0, 0, 4, '2017-04-25 18:02:57', 'jean', 'open'),
(175, 1, '320.00000', '0', 'prev', 0, 0, 4, '2017-04-25 21:15:14', 'jean', 'close'),
(176, 1, '318.00000', '0', 'current', 0, 0, 4, '2017-04-25 21:15:14', 'jean', 'open'),
(177, 1, '318.00000', '0', 'prev', 0, 0, 4, '2017-04-30 22:45:13', 'jean', 'close'),
(178, 1, '300.00000', '0', 'current', 0, 0, 4, '2017-04-30 22:45:13', 'jean', 'open'),
(179, 1, '200.00000', '201', 'prev', 3000, 100, 2, '2017-04-30 22:46:59', 'jean', 'close'),
(180, 1, '200.00000', '201', 'current', 3000, 100, 2, '2017-04-30 22:46:59', 'jean', 'open');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transactionId` int(11) UNSIGNED NOT NULL,
  `qty` int(11) DEFAULT NULL,
  `itemCode` int(11) DEFAULT NULL,
  `trUnityPrice` int(11) DEFAULT NULL,
  `operation` varchar(50) DEFAULT NULL,
  `purchaseOrder` varchar(50) DEFAULT NULL,
  `deliverlyNote` varchar(50) DEFAULT NULL,
  `docRefNumber` varchar(50) DEFAULT NULL,
  `customerName` varchar(50) NOT NULL,
  `customerRef` varchar(50) DEFAULT NULL,
  `operationNotes` text,
  `operationStatus` varchar(50) DEFAULT NULL,
  `doneOn` date DEFAULT NULL,
  `doneBy` varchar(50) DEFAULT NULL,
  `companyCode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transactionId`, `qty`, `itemCode`, `trUnityPrice`, `operation`, `purchaseOrder`, `deliverlyNote`, `docRefNumber`, `customerName`, `customerRef`, `operationNotes`, `operationStatus`, `doneOn`, `doneBy`, `companyCode`) VALUES
(1, 100, 2, 102, 'In', 'Po1<br/>', 'Dev1<br/>', 'Doc1<br/>', 'Prov1<br/>', 'N/A<br/>', 'Com1<br/>', '1', '2017-03-06', 'jean', 0),
(2, 100, 2, 102, 'In', 'Po1', 'Dev1', 'Doc1', 'Prov1', 'N/A', 'Com1', '1', '2017-03-06', 'jean', 0),
(3, 100, 2, 102, 'In', 'Po1', 'Dev1', 'Doc1', 'Prov1', 'N/A', 'Com1', '1', '2017-03-06', 'jean', 0),
(4, 100, 2, 102, 'In', 'Po1', 'Dev1', 'Doc1', 'Prov1', 'N/A', 'Com1', '1', '2017-03-06', 'jean', 0),
(5, 200, 1, 137, 'In', 'Po1', 'Dev1', 'Doc1', 'Prov1', 'N/A', 'No Comment', '1', '2017-03-06', 'jean', 0),
(6, 200, 1, 137, 'In', 'Po1', 'Dev1', 'Doc1', 'Prov1', 'N/A', 'No Comment', '1', '2017-03-06', 'jean', 0),
(7, 200, 1, 137, 'In', 'Po1', 'Dev1', 'Doc1', 'Prov1', 'N/A', 'No Comment', '1', '2017-03-06', 'jean', 0),
(8, 400, 4, 187, 'In', 'Po1', 'Dev1', 'Doc1', 'Prov1', 'N/A', 'N/A', '1', '2017-03-06', 'jean', 0),
(9, 200, 4, 127, 'In', 'Pro2', 'Dev2', 'Doc2', 'Prov2', 'N/A', 'N/A', '1', '2017-03-06', 'jean', 0),
(10, 43, 0, 48, 'In', 'dsklcsdkjcn', 'kcjs', 'cdsjkn', 'sdcn', 'N/A', 'N/A', '1', '2017-03-06', 'c', 0),
(11, 43, 0, 48, 'In', 'dsklcsdkjcn', 'kcjs', 'cdsjkn', 'sdcn', 'N/A', 'N/A', '1', '2017-03-06', 'c', 0),
(12, 43, 0, 48, 'In', 'dsklcsdkjcn', 'kcjs', 'cdsjkn', 'sdcn', 'N/A', 'N/A', '1', '2017-03-06', 'c', 0),
(13, 43, 0, 48, 'In', 'dsklcsdkjcn', 'kcjs', 'cdsjkn', 'sdcn', 'N/A', 'N/A', '1', '2017-03-06', 'c', 0),
(14, 43, 0, 48, 'In', 'dsklcsdkjcn', 'kcjs', 'cdsjkn', 'sdcn', 'N/A', 'N/A', '1', '2017-03-06', 'c', 0),
(15, 43, 0, 48, 'In', 'dsklcsdkjcn', 'kcjs', 'cdsjkn', 'sdcn', 'N/A', 'N/A', '1', '2017-03-06', 'c', 0),
(16, 43, 0, 48, 'In', 'dsklcsdkjcn', 'kcjs', 'cdsjkn', 'sdcn', 'N/A', 'N/A', '1', '2017-03-06', 'c', 0),
(17, 43, 0, 48, 'In', 'dsklcsdkjcn', 'kcjs', 'cdsjkn', 'sdcn', 'N/A', 'N/A', '1', '2017-03-06', 'c', 0),
(18, 43, 0, 48, 'In', 'dsklcsdkjcn', 'kcjs', 'cdsjkn', 'sdcn', 'N/A', 'N/A', '1', '2017-03-06', 'c', 0),
(19, 400, 6, 120, 'In', 'Pur1', 'De1', 'Doc1', 'prov1', 'N/A', 'N/A', '1', '2017-03-06', 'nana', 0),
(20, 100, 1, 105, 'In', 'Po3', 'dev3', 'doc3', 'prov3', 'N/A', 'N/A', '1', '2017-03-06', 'jean', 0),
(21, 200, 9, 101, 'In', 'P01', 'D01', 'Dc01', 'Por1', 'N/A', 'N/A', '1', '2017-03-06', 'gla', 0),
(22, 200, 1, 102, 'In', 'Po2', 'De2', 'Doc3', 'Br', 'N/A', 'N/A', '1', '2017-03-06', 'jean', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `loginId` varchar(100) DEFAULT NULL,
  `pwd` varchar(250) NOT NULL,
  `names` varchar(100) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `account_type` enum('user','admin') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `loginId`, `pwd`, `names`, `phone`, `email`, `account_type`) VALUES
(1, 'admin', 'admin', '', '', '', 'admin'),
(2, 'jean', 'jean', 'Clement', '', '', 'user'),
(3, 'c', 'c', 'Kumutima', '', 'c', 'user'),
(4, 'mure', 'mure', 'mure', 'mure', 'mure', 'user'),
(5, 'aly', 'aly', 'Alli', '0827409283', 'aly@emai.com', 'user'),
(6, 'alex', 'alex', 'ALex', '12349084', 'alex@gmail.com', 'user'),
(7, 'pacy', 'pacy', 'pacy', '3458098', 'pacy', 'user'),
(8, 'nana', 'nana', 'Nana', '32489', 'nana', 'user'),
(9, 'gla', 'gla', 'Gladys', '2938', 'gla', 'user'),
(10, 'Mbeya', 'mbeya', 'Mbeya', '2983749', 'mbeya@SBCDJHC.DSCJB', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bids`
--
ALTER TABLE `bids`
  ADD PRIMARY KEY (`transactionID`),
  ADD KEY `itemCode` (`itemCode`),
  ADD KEY `itemCode_2` (`itemCode`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commentreplies`
--
ALTER TABLE `commentreplies`
  ADD PRIMARY KEY (`replyID`),
  ADD KEY `commentCode` (`commentCode`),
  ADD KEY `commentCode_2` (`commentCode`),
  ADD KEY `commentCode_3` (`commentCode`);

--
-- Indexes for table `company1`
--
ALTER TABLE `company1`
  ADD PRIMARY KEY (`companyId`),
  ADD KEY `cumpanyUserCode` (`cumpanyUserCode`);

--
-- Indexes for table `items1`
--
ALTER TABLE `items1`
  ADD PRIMARY KEY (`itemId`),
  ADD KEY `productCode` (`productCode`),
  ADD KEY `itemCompanyCode` (`itemCompanyCode`);

--
-- Indexes for table `postscomments`
--
ALTER TABLE `postscomments`
  ADD PRIMARY KEY (`commentId`),
  ADD KEY `userCode` (`userCode`);

--
-- Indexes for table `productcategory`
--
ALTER TABLE `productcategory`
  ADD PRIMARY KEY (`catId`),
  ADD UNIQUE KEY `catNane` (`catNane`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productId`),
  ADD UNIQUE KEY `productName` (`productName`),
  ADD KEY `subCatCode` (`subCatCode`),
  ADD KEY `subCatCode_2` (`subCatCode`);

--
-- Indexes for table `productsubcategory`
--
ALTER TABLE `productsubcategory`
  ADD PRIMARY KEY (`subCatId`),
  ADD KEY `CatCode` (`CatCode`),
  ADD KEY `CatCode_2` (`CatCode`),
  ADD KEY `CatCode_3` (`CatCode`);

--
-- Indexes for table `theask`
--
ALTER TABLE `theask`
  ADD PRIMARY KEY (`transactionId`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transactionId`);

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
-- AUTO_INCREMENT for table `bids`
--
ALTER TABLE `bids`
  MODIFY `transactionID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `commentreplies`
--
ALTER TABLE `commentreplies`
  MODIFY `replyID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `company1`
--
ALTER TABLE `company1`
  MODIFY `companyId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `items1`
--
ALTER TABLE `items1`
  MODIFY `itemId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `postscomments`
--
ALTER TABLE `postscomments`
  MODIFY `commentId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `productcategory`
--
ALTER TABLE `productcategory`
  MODIFY `catId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `productId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `productsubcategory`
--
ALTER TABLE `productsubcategory`
  MODIFY `subCatId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `theask`
--
ALTER TABLE `theask`
  MODIFY `transactionId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;
--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transactionId` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
