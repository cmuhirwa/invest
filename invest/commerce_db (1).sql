-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2017 at 11:38 AM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `commerce_db`
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

--
-- Dumping data for table `bids`
--

INSERT INTO `bids` (`transactionID`, `companyId`, `trUnityPrice`, `qty`, `itemCode`, `operation`, `purchaseOrder`, `deliverlyNote`, `docRefNumber`, `customerName`, `customerRef`, `address`, `operationStatus`, `doneOn`, `doneBy`) VALUES
(1, 1, '4000.00000', '6.00000', 6, 'In', '', '', '', '', '', '', 1, '2017-01-25 18:48:19', '2'),
(2, 1, '7328.00000', '27.00000', 7, 'In', '', '', '', '', '', '', 1, '2017-01-25 18:50:07', '2'),
(3, 1, '999999.99999', '3.00000', 8, 'In', '', '', '', '', '', '', 1, '2017-01-25 18:56:22', '2'),
(4, 3, '999999.99999', '1.00000', 9, 'In', '', '', '', '', '', '', 1, '2017-01-25 18:59:40', '5'),
(5, 3, '3500.00000', '5.00000', 10, 'In', '', '', '', '', '', '', 1, '2017-01-25 19:02:48', '5'),
(6, 3, '300.00000', '30000.00000', 11, 'In', '', '', '', '', '', '', 1, '2017-01-25 19:03:55', '5'),
(7, 7, '2000.00000', '20.00000', 12, 'In', '', '', '', '', '', '', 1, '2017-01-26 18:21:02', '7'),
(8, 7, '350000.00000', '4.00000', 13, 'In', '', '', '', '', '', '', 1, '2017-01-26 18:23:05', '7'),
(9, 1, '3445.00000', '43.00000', 14, 'In', '', '', '', '', '', '', 1, '2017-01-26 20:39:44', '2'),
(10, 0, '350001.00000', '0.00000', 1, '', '', '', '', 'Muirwa CLement', '', '', 0, '2017-01-26 21:19:09', NULL),
(11, 0, '350001.00000', '0.00000', 1, '', '', '', '', 'Muhriwa Clement', '0784848236', '', 0, '2017-01-26 21:19:55', NULL),
(12, 0, '500000.00000', '0.00000', 13, '', '', '', '', '', '9435739489', '', 0, '2017-01-26 21:22:52', NULL),
(13, 0, '450001.00000', '0.00000', 13, '', '', '', '', 'Muhirwa CLement', '0784848236', '', 0, '2017-01-26 21:28:30', NULL),
(14, 8, '34908.00000', '343.00000', 15, 'In', '', '', '', '', '', '', 1, '2017-01-26 22:44:16', '9'),
(15, 0, '34909.00000', '0.00000', 15, '', '', '', '', '', '', '', 0, '2017-01-26 22:47:13', NULL),
(16, 0, '35000.00000', '0.00000', 15, '', '', '', '', 'Muneza', '0784848234', '', 0, '2017-01-26 23:42:27', NULL),
(17, 0, '40000.00000', '0.00000', 15, '', '', '', '', 'Gladis', '072850976', '', 0, '2017-01-29 23:58:40', NULL),
(18, 11, '300.00000', '2.00000', 16, 'In', '', '', '', '', '', '', 1, '2017-01-30 05:58:44', '19'),
(19, 11, '347589.00000', '4.00000', 17, 'In', '', '', '', '', '', '', 1, '2017-01-30 06:03:36', '19'),
(20, 11, '4789.00000', '46.00000', 18, 'In', '', '', '', '', '', '', 1, '2017-01-30 06:07:06', '19'),
(21, 11, '4.00000', '34.00000', 19, 'In', '', '', '', '', '', '', 1, '2017-01-30 06:08:05', '19'),
(22, 0, '16901.00000', '0.00000', 30, '', '', '', '', '', '', '', 0, '2017-01-30 10:29:59', NULL),
(23, 0, '4050.00000', '0.00000', 33, '', '', '', '', 'Clement Muhirwa', '784848236', '', 0, '2017-01-30 10:35:40', NULL);

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
('Diplomatic', 1, 'A govement entity for the united kindom uk', 'UK Ambasy', '2093890278', 2, 'Kacyiru', '2017-01-25 18:10:09'),
('IT', 3, 'we can make almost enything', 'Fablab', '983289', 5, 'Kimironko', '2017-01-25 18:58:40'),
('cleanning', 4, 'big company', 'ikondera c ltd', '23456', 6, 'town', '2017-01-25 20:59:37'),
('cleanning', 5, 'big company', 'ikondera c ltd', '23456', 6, 'town', '2017-01-25 21:00:16'),
('cleanning', 6, 'big company', 'ikondera ', '23456', 6, 'town', '2017-01-25 21:01:14'),
('cleaning', 7, 'good service', 'kigali clining ltd', '30988', 7, 'gisozi', '2017-01-26 18:18:41'),
('TEch', 8, 'cjsdvk; jndsljkbnkj,sdbvnjhbdsvk j,bvnkj,kbsznvj k', 'NewComp', '960i0-torgo', 9, 'DSCMLk', '2017-01-26 22:43:11'),
('dsjcnkj', 9, 'sjdkcnkjsn', 'Comp', 'jncsdkj', 10, 'kdjsnckjn', '2017-01-27 01:33:46'),
('Suger', 10, 'We make suger products', 'Sosumo', '102163393', 11, 'Rutana', '2017-01-29 23:49:45'),
('Test', 11, 'Test', 'Test', 'Test', 19, 'Test', '2017-01-30 04:53:59'),
('TestInd', 12, 'DescritionTest is the better way to go', 'TestCOmp', '234909829', 17, 'TestLoc', '2017-01-30 09:08:48'),
('cleaning', 13, 'dfghhb', 'kigali cleaning', '4655', 20, 'Kacyiru', '2017-01-30 10:13:57');

-- --------------------------------------------------------

--
-- Table structure for table `items1`
--

CREATE TABLE `items1` (
  `itemId` bigint(20) NOT NULL,
  `itemName` varchar(50) NOT NULL,
  `productCode` bigint(20) NOT NULL,
  `quantity` double NOT NULL,
  `unit` varchar(50) NOT NULL,
  `unityPrice` double NOT NULL,
  `inDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `postedBy` varchar(50) NOT NULL,
  `itemCompanyCode` int(11) NOT NULL,
  `description` varchar(50) NOT NULL,
  `postDeadline` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items1`
--

INSERT INTO `items1` (`itemId`, `itemName`, `productCode`, `quantity`, `unit`, `unityPrice`, `inDate`, `postedBy`, `itemCompanyCode`, `description`, `postDeadline`) VALUES
(2, 'ameza', 1, 0, '4', 2000, '2017-01-25 18:39:46', '', 1, 'nziza', '0000-00-00'),
(3, 'sonitech', 7, 0, 'pc', 4000, '2017-01-25 18:43:30', '', 1, 'ninzima', '0000-00-00'),
(4, 'sonitech', 7, 0, 'pc', 4000, '2017-01-25 18:46:10', '', 1, 'ninzima', '0000-00-00'),
(5, 'sonitech', 7, 0, 'pc', 4000, '2017-01-25 18:46:52', '', 1, 'ninzima', '0000-00-00'),
(6, 'sonitech', 7, 0, 'pc', 4000, '2017-01-25 18:48:19', '', 1, 'ninzima', '0000-00-00'),
(7, 'Csdnk', 5, 0, 'jdh', 7328, '2017-01-25 18:50:07', '', 1, 'kdjwk', '0000-00-00'),
(8, 'corora', 4, 0, 'pc', 3000000, '2017-01-25 18:56:22', '', 1, 'ok', '0000-00-00'),
(9, 'RAV4', 3, 0, 'PC', 7500000, '2017-01-25 18:59:40', '', 3, 'this car is still new with a better color', '0000-00-00'),
(10, 'Boom', 7, 0, 'PC', 3500, '2017-01-25 19:02:48', '', 3, 'THis radio is the best ever', '0000-00-00'),
(11, 'Inyange', 19, 0, 'L', 300, '2017-01-25 19:03:55', '', 3, 'Amate meza kuva nabaho', '0000-00-00'),
(12, 'laclette', 23, 0, 'pc', 2000, '2017-01-26 18:21:02', '', 7, 'zose ninziza', '0000-00-00'),
(13, 'epson7', 20, 0, 'pc', 350000, '2017-01-26 18:23:05', '', 7, 'quality', '0000-00-00'),
(14, 'fghg', 20, 0, 'PC', 3445, '2017-01-26 20:39:44', '', 1, 'dfvghhfds', '0000-00-00'),
(15, 'New Item', 24, 0, '489', 34908, '2017-01-26 22:44:16', '', 8, 'fkj kjnkvck jmkjvn kjvn', '0000-00-00'),
(16, 'TheApp', 19, 0, 'PC', 300, '2017-01-30 05:58:44', '', 11, 'jkNCKJ kjnkjdsc', '0000-00-00'),
(17, 'Imandsjn', 19, 0, 'PC', 347589, '2017-01-30 06:03:36', '', 11, 'iucn hkjdnckjdc', '0000-00-00'),
(18, 'mxz', 1, 0, 'fds', 4789, '2017-01-30 06:07:06', '', 11, 'dskvnjds', '0000-00-00'),
(19, 'krjfn', 1, 0, 'we', 4, '2017-01-30 06:08:05', '', 11, 'sfdcdsc', '0000-00-00'),
(25, 'Test ITem', 19, 2, '', 300000, '2017-01-30 09:30:22', 'user', 12, 'fdkjnkds', '2017-01-31'),
(26, 'wood tables', 1, 0, '', 5000, '2017-01-30 10:00:42', 'ines', 7, 'ddjsh', '2017-01-30'),
(24, 'samat', 6, 4, 'rt', 500, '2017-01-30 08:16:05', 'asd', 11, 'iesjdkcn', '0000-00-00'),
(28, 'corora', 3, 0, '', 3000000, '2017-01-30 10:04:53', 'ines', 7, '3', '2017-01-31'),
(29, 'trisho', 23, 3, '', 1500, '2017-01-30 10:15:07', 'peace', 13, 'ydyufjv', '2017-01-31'),
(30, 'wood tables', 1, 20, '', 16900, '2017-01-30 10:17:06', 'peace', 13, 'fhjgferees', '2017-01-31'),
(32, 'honda', 6, 32, '', 4566, '2017-01-30 10:19:55', 'peace', 13, 'gdgcvfhdu', '2017-03-08'),
(33, 'grass', 18, 45, '', 4000, '2017-01-30 10:21:13', 'peace', 13, 'dfuyrfdjk', '2017-03-10'),
(34, 'reshjs', 24, 54, '', 34667, '2017-01-30 10:22:26', 'peace', 13, 'gdftstyufd', '2017-01-31'),
(35, 'sonitech', 7, 45, '', 45000, '2017-01-30 10:23:24', 'peace', 13, 'gstuhsd', '2017-04-07');

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
(1, 'knfvnjk nvfjk mnmkjcvnckvj', 'newname', '2017-01-26 22:38:52', 'Public', 0, 12);

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
(2, 'office', 'ibikoresho byo muri office', '', 'Active'),
(3, 'ibihingwa', '', '', 'Active'),
(5, 'Auto', '', '', 'Active'),
(6, 'Electronics', '', '', 'Active'),
(10, 'ibikoreshobyisuku', 'ubwoko bwose1', '', 'Active'),
(11, 'New Cat', 'vfdklnvkj', '', 'Active'),
(12, 'Resto', 'restorant items', '', 'Active'),
(13, 'Done', 'dskmc', '', 'Active');

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
(1, 'tables', '', 10, 'Active', 'me', 1),
(3, 'Toyota', '', 10, 'Active', 'me', 3),
(4, 'Benz', '', 10, 'Active', 'me', 3),
(5, 'BMW', '', 10, 'Active', 'me', 3),
(6, 'TVS', '', 10, 'Active', 'me', 4),
(7, 'Radio', '', 10, 'Active', 'me', 5),
(8, 'HeadPhones', '', 10, 'Active', 'me', 5),
(9, 'Camera', '', 10, 'Active', 'me', 6),
(10, 'Television', '', 10, 'Active', 'me', 6),
(11, 'Laptop', '', 10, 'Active', 'me', 7),
(12, 'Desktop', '', 10, 'Active', 'me', 7),
(13, 'Ipads', '', 10, 'Active', 'me', 7),
(14, 'Samsung', '', 10, 'Active', 'me', 8),
(15, 'Iphones', '', 10, 'Active', 'me', 8),
(16, 'Techno', '', 10, 'Active', 'me', 8),
(17, 'Chairs', '', 10, 'Active', 'me', 1),
(18, 'Droer', '', 10, 'Active', 'me', 1),
(19, 'Amata', '', 10, 'Active', 'me', 10),
(20, 'Printers', '', 10, 'Active', 'me', 11),
(23, 'lacllette', 'shhfjj', 10, 'Active', 'me', 15),
(24, 'Products', '', 10, 'Active', 'me', 16),
(25, 'Soft Drinks', '', 10, 'Active', 'me', 18),
(26, 'HardDrinks', 'kfjldgnmfkl', 10, 'Active', 'me', 18);

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
(1, 'furniture', 'ubikoresho byo mumbaho', '', 'Active', 2),
(2, 'imbuto', '', '', 'Active', 3),
(3, 'Cars', '', '', 'Active', 5),
(4, 'Moto', '', '', 'Active', 5),
(5, 'Audio', '', '', 'Active', 6),
(6, 'Video', '', '', 'Active', 6),
(7, 'Computer', '', '', 'Active', 6),
(8, 'Phones', '', '', 'Active', 6),
(9, 'Vegetables', '', '', 'Active', 3),
(10, 'Inyama', '', '', 'Active', 3),
(11, 'Tech', '', '', 'Active', 2),
(14, '', '', '', 'Active', 9),
(15, 'imashini ', 'iracyariyose', '', 'Active', 10),
(16, 'New Sub', 'dfkvn', '', 'Active', 11),
(17, 'Food', '', '', 'Active', 12),
(18, 'Drinks', 'this', '', 'Active', 12),
(19, '', '', '', 'Active', 11);

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
(1, 'admin', 'admin', 'superadmin', '0788888888', 'admin@gmail.com', 'admin'),
(2, 'clemy', 'clemy', 'Clementine', '0789898798', 'clemy@gmail.com', 'user'),
(5, 'cmuhirwa', 'cmuhirwa', 'Clement', '2389081', 'sdknckj@fnkj.sdkj', 'user'),
(6, 'njanga', 'njanga', 'njanga', '0788343425', 'njanga@gmail.com', 'user'),
(7, 'ines', 'ines', 'ines', '0788504229', 'uwase@gmial.com', 'user'),
(8, 'username', 'username', 'New User', '4509348', 'dflkmklm@kndfk.vdfn', 'user'),
(9, 'newname', 'newnamw', 'newname', '3490-9', 'LFDKMK@FGRMEKL', 'user'),
(10, '1', '1', '1', '1', '1', 'user'),
(11, 'glad', 'glad', 'Gladys', '09385098', 'dksjfndkj@FKJSNK.FSND', 'user'),
(12, '12', '12', '12', '12', '12', 'user'),
(13, 'qwer', 'qwer', 'qwer', 'qwer', 'qwer', 'user'),
(14, 'yeah', 'yeah', 'yeah', 'yeah', 'yeah', 'user'),
(15, 'am', 'am', 'am', '12', 'am', 'user'),
(16, 'this', 'this', 'This', '123', 'this', 'user'),
(17, 'user', 'user', 'user', '0788888888', 'user', 'user'),
(18, 'test', 'test', 'test', '5555', 'test', 'user'),
(19, 'asd', 'asd', 'asd', '123', 'asd', 'user'),
(20, 'peace', 'peace', 'mahoro', '877357', 'uwam@gmail.com', 'user');

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
  MODIFY `transactionID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `commentreplies`
--
ALTER TABLE `commentreplies`
  MODIFY `replyID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `company1`
--
ALTER TABLE `company1`
  MODIFY `companyId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `items1`
--
ALTER TABLE `items1`
  MODIFY `itemId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `postscomments`
--
ALTER TABLE `postscomments`
  MODIFY `commentId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `productcategory`
--
ALTER TABLE `productcategory`
  MODIFY `catId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `productId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `productsubcategory`
--
ALTER TABLE `productsubcategory`
  MODIFY `subCatId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
