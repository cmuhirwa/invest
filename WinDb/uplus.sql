-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 04, 2017 at 02:48 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uplus`
--

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `groupName` varchar(50) DEFAULT NULL,
  `adminId` int(11) NOT NULL,
  `adminName` varchar(50) DEFAULT NULL,
  `adminPhone` varchar(50) DEFAULT NULL,
  `groupDesc` varchar(255) DEFAULT NULL,
  `groupStory` text NOT NULL,
  `groupTargetType` enum('target','any') NOT NULL,
  `targetAmount` bigint(20) NOT NULL,
  `perPersonType` enum('fixed','min','any') NOT NULL,
  `perPerson` varchar(11) NOT NULL,
  `expirationDate` date NOT NULL,
  `createdDate` date NOT NULL,
  `invitationSms` varchar(255) NOT NULL,
  `successNotificationSms` varchar(255) NOT NULL,
  `state` enum('private','public') NOT NULL,
  `likes` int(11) NOT NULL,
  `sms` int(11) NOT NULL DEFAULT '250',
  `visits` int(11) NOT NULL,
  `createdBy` varchar(50) NOT NULL,
  `updatedBy` varchar(50) NOT NULL,
  `updatedDate` date NOT NULL,
  `archivedBy` varchar(50) NOT NULL,
  `archivedDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `groupName`, `adminId`, `adminName`, `adminPhone`, `groupDesc`, `groupStory`, `groupTargetType`, `targetAmount`, `perPersonType`, `perPerson`, `expirationDate`, `createdDate`, `invitationSms`, `successNotificationSms`, `state`, `likes`, `sms`, `visits`, `createdBy`, `updatedBy`, `updatedDate`, `archivedBy`, `archivedDate`) VALUES
(1, 'Ubufasha Kuvuza Kanseri Sandrine', 8, 'MUHIRWA Clement', '784848236', 'Sandrine Mukundwa urwaye Cancer yerekeje mu Buhinde, ariko ubushobozi bukenewe ngo avurwe ntiburaboneka', '**Mu ntangiriro zâ€™ukwezi kwa Werurwe 2016, nibwo mu bitangazamakuru binyuranye hatangajwe inkuru isabira inkunga umunyarwandakazi Sandrine Mukundwa wâ€™imyaka 25 urwaye cancer, mu rwego rwo gufasha umuryango we kumwohereza kwivuriza mu gihugu cyâ€™u Buhinde. ** \n![enter image description here](http://inyarwanda.com/img/201605/logos/1463393076_sandrine.jpg "enter image title here")  \n\nKuri ubu, Sandrine yageze muri icyo gihugu, aho ari mu bitaro byitwa MIOT Hospital, ari nabyo bizamuvura iyi ndwara.\nNkâ€™uko bitangazwa nâ€™umubyeyi we, Bazatsinda Thomas, amadolari ya Amerika ibihumbi 14500 yaciwe ngo abashe kwivuza ntabwo yabonekeye rimwe mu gihe iyi ndwara ya Sandrine yamenyekanye igeze ku rwego rwa 2 (Stage 2) yari ikomeje kwiyongera, bityo ibi bitaro bikaba byaremeye ko uyu muryango uba wishyuye igice akaba yivuza, dore ko azamarayo igihe kigera ku byumweru 10 maze ikindi gice kikazishyurwa mu gihe azaba ari gukurikiranwa nâ€™abaganga.\nBazatsinda Thomas yatangarije umunyamakuru wa Inyarwanda.com ko,  \n![enter image description here](http://www.eng.inyarwanda.com/img/attachments/1457715096_sandrine_and_heard.jpg "enter image title here")', '', 8500000, '', '', '2017-06-28', '2017-04-29', 'Hi! Muhirwa Clement is raising 8,400,000 Rwf for Ubufasha Kuvuza Kanseri Sandrine. To contribute visit this link https://www.uplus.rw/f/i1 , for more info call Muhirwa Clement on 0784848236', '', 'public', 68, 245, 486, '', '', '0000-00-00', '', '0000-00-00'),
(2, 'Baby Brian Fund', 8, 'MUHIRWA Clement', '784848236', 'After the car accident baby brian recovered but left with a huge hospital bill, lets bring him back ho', 'Your session has expired, please SIGN IN again to continue  \n\nHaving a great bday thanks to Joan Mazim for movie ice cream, spa treatment.', '', 7000000, '', '', '0000-00-00', '2017-05-01', 'Hi! Muhirwa Clement is raising 500,000 Rwf for Baby Brian Fund. To contribute visit this link http://uplus.rw/f/i2 , for more info call Muhirwa Clement on 0784848236', '', 'private', 61, 250, 52, '', '', '0000-00-00', '', '0000-00-00'),
(3, 'Test89', 8, 'MUHIRWA Clement', '784848236', 'this was the way fored', '', '', 0, '', '', '0000-00-00', '2017-05-01', 'Hi! Muhirwa Clement is raising 800,000 Rwf for Test. To contribute visit this link http://uplus.rw/f/i3 , for more info call Muhirwa Clement on 0784848236', '', 'public', 3, 250, 12, '', '', '0000-00-00', '', '0000-00-00'),
(4, 'Duteranye', 8, 'MUHIRWA Clement', '784848236', 'duteranye amAKash', '', '', 0, '', '', '0000-00-00', '0000-00-00', '', '', 'private', 0, 250, 0, '', '', '0000-00-00', '', '0000-00-00'),
(5, 'testt', 8, 'MUHIRWA Clement', '784848236', 'fdgvdsv', '', '', 0, '', '', '2017-06-30', '2017-05-03', 'Hi! Muhirwa Clement is raising 800 Rwf for testt. To contribute visit this link http://uplus.rw/f/i5 , for more info call Muhirwa Clement on 0784848236', '', 'private', 0, 250, 0, '', '', '0000-00-00', '', '0000-00-00'),
(6, 'any', 8, 'MUHIRWA Clement', '784848236', 'this is the thing', '', '', 0, '', '', '0000-00-00', '2017-05-07', 'Hi! Muhirwa Clement is raising 9,000 Rwf for any. To contribute visit this link http://uplus.rw/f/i6 , for more info call Muhirwa Clement on 0784848236', '', 'private', 0, 250, 0, '', '', '0000-00-00', '', '0000-00-00'),
(7, 'Ubukwe Bwa Emmy', 8, 'MUHIRWA Clement', '784848236', 'Emmy Afite ubukwe mureke tumushyigikire', 'The UPlus duo developed a FinTech (Financial Technology) Application called UPlus Mutual partners that brings people together to create  \n\nThe UPlus duo developed a FinTech (Financial Technology) Application called UPlus Mutual partners that brings people together to createThe UPlus duo developed a FinTech (Financial Technology) Application called UPlus Mutual partners that brings people together to create', '', 3000000, '', '', '2017-08-10', '2017-05-08', 'Hi!  is raising 3,000 Rwf for test. To contribute visit this link http://uplus.rw/f/i7 , for more info call  on 0725594646', '', 'public', 41, 250, 49, '', '', '0000-00-00', '', '0000-00-00'),
(8, 'Face It', 8, 'MUHIRWA Clement', '784848236', 'yes please do it', '', '', 0, '', '', '0000-00-00', '2017-05-21', 'Hi! Cle Test is raising 8,000 Rwf for Face It. To contribute visit this link http://uplus.rw/f/i8 , for more info call Cle Test on 0784848236', '', 'private', 13, 250, 0, '', '', '0000-00-00', '', '0000-00-00'),
(9, 'this thing works', 8, 'MUHIRWA Clement', '784848236', 'yeah it realy works', '', '', 0, '', '', '0000-00-00', '2017-05-21', 'this thing works needs your help, we are raising : 900Rwf.\nTo contribute dail *182*1*8# and use #u+40mv9. For more info visit uplus.rw or call 0784848236.', 'Thank you {{contributorName}} for your significant contribution which supported this thing works up to {{CurrentAmount}} Rwf out of 900Rwf.', 'private', 12, 250, 0, '', '', '0000-00-00', '', '0000-00-00'),
(10, 'My Medication', 8, 'MUHIRWA Clement', '784848236', 'plz help', 'I am sk djcbsjbcjdh jkcsdbjcbdsm s [enter link description here](http://google.com)', '', 0, '', '', '0000-00-00', '2017-05-23', 'Hi! Edward  is raising 5,000 Rwf for My Medication. To contribute visit this link http://uplus.rw/f/i10 , for more info call  on 0783099700 ', '', 'public', 11, 249, 22, '', '', '0000-00-00', '', '0000-00-00'),
(11, '$groupName', 8, 'MUHIRWA Clement', '784848236', '$groupDesc', '', '', 0, '', '', '0000-00-00', '2017-05-31', '', '', 'private', 0, 250, 0, '$adminId', '', '0000-00-00', '', '0000-00-00'),
(12, 'test', 8, 'MUHIRWA Clement', '784848236', 'yes pls check for me', '', '', 0, '', '', '0000-00-00', '2017-05-31', '', '', 'private', 0, 250, 0, '8', '', '0000-00-00', '', '0000-00-00'),
(13, 'test', 8, 'MUHIRWA Clement', '784848236', 'yes pls check for me', '', '', 0, '', '', '0000-00-00', '2017-05-31', '', '', 'private', 0, 250, 0, '8', '', '0000-00-00', '', '0000-00-00'),
(14, 'test', 8, 'MUHIRWA Clement', '784848236', 'yes pls check for me', '', '', 0, '', '', '0000-00-00', '2017-05-31', 'Hi! Cle Test is raising 8,000 Rwf for test. To contribute visit this link http://uplus.rw/f/i14 , for more info call Cle Test on 0784848236', '', 'private', 0, 250, 0, '8', '', '0000-00-00', '', '0000-00-00'),
(15, 'test', 8, 'MUHIRWA Clement', '784848236', 'yes pls check for me', '', '', 0, 'fixed', '5000', '0000-00-00', '2017-05-31', 'Hi! Cle Test is raising 8,000 Rwf for test. To contribute visit this link http://uplus.rw/f/i15 , for more info call Cle Test on 0784848236', '', 'public', 3, 250, 62, '8', '', '0000-00-00', '', '0000-00-00'),
(16, 'yrfgd', 8, 'MUHIRWA Clement', '784848236', 'plz creat it', '', '', 0, '', '', '0000-00-00', '2017-05-31', 'Hi! Cle Test is raising 8,000 Rwf for yrfgd. To contribute visit this link http://uplus.rw/f/i16 , for more info call Cle Test on 0784848236', '', 'public', 3, 250, 10, '8', '', '0000-00-00', '', '0000-00-00'),
(17, 'HR', 8, 'MUHIRWA Clement', '784848236', 'YES DO IT!', '', '', 0, '', '', '0000-00-00', '2017-05-31', 'Hi! Cle Test is raising 75,443 Rwf for HR. To contribute visit this link http://uplus.rw/f/i17 , for more info call Cle Test on 0784848236', '', 'private', 5, 250, 5, '8', '', '0000-00-00', '', '0000-00-00'),
(18, 'hey', 14, 'MUHIRWA Clement', '0788751595', 'hgjh bjhbhj', '', 'target', 3000, '', '', '0000-00-00', '2017-06-04', 'Hi!  is raising 9,000 Rwf for hey. To contribute visit this link http://uplus.rw/f/i18 , for more info call  on 0788751595', '', 'private', 0, 250, 3, '14', '', '0000-00-00', '', '0000-00-00'),
(19, 'Ubukwe Bwa Ntuza', 8, 'MUHIRWA Clement', '0784848236', 'ndashaka gukora ubukwe nimunfashe', 'Tuzajya murukiko kuwambere', 'target', 700000, 'fixed', '5000', '0000-00-00', '2017-06-07', 'Hi! MUHIRWA Clement is raising 700,000 Rwf for My Wedding. To contribute visit this link http://uplus.rw/f/i19 , for more info call MUHIRWA Clement on 0784848236', '', 'public', 14, 250, 34, '8', '', '0000-00-00', '', '0000-00-00'),
(20, 'dem codes', 26, 'MUHIRWA Clement', '0784848236', NULL, '', 'target', 90000, 'fixed', '0', '2017-06-30', '2017-06-18', 'Hi!  is raising 0 Rwf for dem codes. To contribute visit this link http://uplus.rw/f/i20 , for more info call  on 0784848236', '', 'private', 0, 250, 0, '26', '', '0000-00-00', '', '0000-00-00'),
(21, 'TEST ME', 26, 'MUHIRWA Clement', '0784848236', NULL, '', 'target', 0, 'fixed', '0', '0000-00-00', '2017-06-18', 'Hi!  is raising 0 Rwf for TEST ME. To contribute visit this link http://uplus.rw/f/i21 , for more info call  on 0784848236', '', 'private', 0, 250, 0, '26', '', '0000-00-00', '', '0000-00-00'),
(22, 'Gisenyi Klab Picnic', 26, 'MUHIRWA Clement', '0784848236', '', '', 'target', 0, 'fixed', '15000', '0000-00-00', '2017-06-18', 'Hi!  is raising 0 Rwf for Giseny Klab Pcnic. To contribute visit this link http://uplus.rw/f/i22 , for more info call  on 0784848236', '', 'private', 4, 250, 0, '26', '', '0000-00-00', '', '0000-00-00'),
(23, 'My School Fees', 26, 'MUHIRWA Clement', '0784848236', NULL, '', 'target', 570000, 'fixed', '0', '0000-00-00', '2017-06-18', 'Hi!  is raising 570,000 Rwf for My School Fees. To contribute visit this link http://uplus.rw/f/i23 , for more info call  on 0784848236', '', 'private', 0, 250, 0, '26', '', '0000-00-00', '', '0000-00-00'),
(24, 'My Weeding', 26, 'MUHIRWA Clement', '0784848236', NULL, '', 'target', 0, 'fixed', '0', '0000-00-00', '2017-06-18', 'Hi!  is raising 0 Rwf for My Weeding. To contribute visit this link http://uplus.rw/f/i24 , for more info call  on 0784848236', '', 'private', 0, 250, 0, '26', '', '0000-00-00', '', '0000-00-00'),
(25, 'Think', 26, 'MUHIRWA Clement', '0784848236', NULL, '', 'any', 0, 'any', '0', '0000-00-00', '2017-06-18', 'Hi!  is raising 0 Rwf for Think. To contribute visit this link http://uplus.rw/f/i25 , for more info call  on 0784848236', '', 'private', 0, 250, 0, '26', '', '0000-00-00', '', '0000-00-00'),
(26, 'what ever', 27, 'MUHIRWA Clement', '0798567345', NULL, '', 'target', 180000, 'any', '0', '0000-00-00', '2017-06-18', 'Hi!  is raising 180,000 Rwf for what ever. To contribute visit this link http://uplus.rw/f/i26 , for more info call  on 0798567345', '', 'private', 0, 250, 0, '27', '', '0000-00-00', '', '0000-00-00'),
(27, 'EastAfricaParty', 26, 'MUHIRWA Clement', '0784848236', NULL, '', 'target', 8000000, '', '5000', '0000-00-00', '2017-06-18', 'Hi!  is raising 8,000,000 Rwf for EastAfricaParty. To contribute visit this link http://uplus.rw/f/i27 , for more info call  on 0784848236', '', 'private', 0, 250, 0, '26', '', '0000-00-00', '', '0000-00-00'),
(28, 'Celabrate', 8, NULL, '0784848238', NULL, '', 'any', 8000, '', '5000', '0000-00-00', '2017-06-20', 'Hi!  is raising 0 Rwf for Celabrate. To contribute visit this link http://uplus.rw/f/i28 , for more info call  on 0784848238', '', 'public', 0, 250, 7, '8', '', '0000-00-00', '', '0000-00-00'),
(29, 'Light Unsealing Event', 28, NULL, '0788424547', 'We would like to celebrate this milestone with you. ', 'TorQue Ltd is a rwandan software development company, incorporated in 2013, with a mission to create software solutions tailor made to the needs of wholesale distributors in Rwanda and Africa.', 'target', 500000, '', '2000', '0000-00-00', '2017-06-22', 'Hi!  is raising 500,000 Rwf for Light Unsealing Event. To contribute visit this link http://uplus.rw/f/i29 , for more info call  on 0788424547', '', 'private', 0, 249, 6, '28', '', '0000-00-00', '', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `groupuser`
--

CREATE TABLE `groupuser` (
  `id` int(11) NOT NULL,
  `joined` enum('maybe','no','yes') NOT NULL,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `createdBy` varchar(50) NOT NULL,
  `createdDate` date NOT NULL,
  `updatedBy` varchar(50) NOT NULL,
  `updatedDate` date NOT NULL,
  `archivedBy` varchar(50) NOT NULL,
  `archivedDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groupuser`
--

INSERT INTO `groupuser` (`id`, `joined`, `groupId`, `userId`, `createdBy`, `createdDate`, `updatedBy`, `updatedDate`, `archivedBy`, `archivedDate`) VALUES
(1, 'yes', 1, 8, '', '0000-00-00', '', '0000-00-00', '', '0000-00-00'),
(2, 'yes', 2, 8, '', '0000-00-00', '', '0000-00-00', '', '0000-00-00'),
(3, 'yes', 3, 8, '', '0000-00-00', '', '0000-00-00', '', '0000-00-00'),
(5, 'no', 4, 8, '', '0000-00-00', '', '0000-00-00', '', '0000-00-00'),
(6, 'yes', 5, 8, '', '0000-00-00', '', '0000-00-00', '', '0000-00-00'),
(7, 'yes', 6, 8, '', '0000-00-00', '', '0000-00-00', '', '0000-00-00'),
(8, 'yes', 7, 8, '', '0000-00-00', '', '0000-00-00', '', '0000-00-00'),
(9, 'yes', 8, 8, '', '0000-00-00', '', '0000-00-00', '', '0000-00-00'),
(10, 'yes', 9, 8, '', '0000-00-00', '', '0000-00-00', '', '0000-00-00'),
(11, 'yes', 9, 8, '', '0000-00-00', '', '0000-00-00', '', '0000-00-00'),
(12, 'yes', 10, 8, '', '0000-00-00', '', '0000-00-00', '', '0000-00-00'),
(13, 'yes', 10, 8, '', '0000-00-00', '', '0000-00-00', '', '0000-00-00'),
(14, 'yes', 0, 8, '$adminName', '2017-05-31', '', '0000-00-00', '', '0000-00-00'),
(15, 'yes', 15, 8, 'Cle Test', '2017-05-31', '', '0000-00-00', '', '0000-00-00'),
(16, 'yes', 16, 8, 'Cle Test', '2017-05-31', '', '0000-00-00', '', '0000-00-00'),
(17, 'yes', 17, 8, 'Cle Test', '2017-05-31', '', '0000-00-00', '', '0000-00-00'),
(18, 'yes', 18, 14, '', '2017-06-04', '', '0000-00-00', '', '0000-00-00'),
(19, 'yes', 1, 12, '', '0000-00-00', '', '0000-00-00', '', '0000-00-00'),
(20, 'yes', 19, 8, 'MUHIRWA Clement', '2017-06-07', '', '0000-00-00', '', '0000-00-00'),
(21, 'yes', 20, 26, '26', '2017-06-18', '', '0000-00-00', '', '0000-00-00'),
(22, 'yes', 21, 26, '26', '2017-06-18', '', '0000-00-00', '', '0000-00-00'),
(23, 'yes', 22, 26, '26', '2017-06-18', '', '0000-00-00', '', '0000-00-00'),
(24, 'yes', 23, 26, '26', '2017-06-18', '', '0000-00-00', '', '0000-00-00'),
(25, 'yes', 24, 26, '26', '2017-06-18', '', '0000-00-00', '', '0000-00-00'),
(26, 'yes', 25, 26, '26', '2017-06-18', '', '0000-00-00', '', '0000-00-00'),
(27, 'yes', 26, 27, '27', '2017-06-18', '', '0000-00-00', '', '0000-00-00'),
(28, 'yes', 27, 26, '26', '2017-06-18', '', '0000-00-00', '', '0000-00-00'),
(29, 'yes', 28, 8, '8', '2017-06-20', '', '0000-00-00', '', '0000-00-00'),
(30, 'yes', 29, 28, '28', '2017-06-22', '', '0000-00-00', '', '0000-00-00');

-- --------------------------------------------------------

--
-- Stand-in structure for view `invitations`
--
CREATE TABLE `invitations` (
`groupName` varchar(50)
,`invitor` varchar(50)
,`invitedDate` date
,`invite` varchar(50)
,`joining` enum('maybe','no','yes')
,`joinedDate` date
);

-- --------------------------------------------------------

--
-- Table structure for table `updatestransaction`
--

CREATE TABLE `updatestransaction` (
  `id` int(11) NOT NULL,
  `body` varchar(255) NOT NULL,
  `picture` enum('no','yes') NOT NULL,
  `video` enum('no','yes') NOT NULL,
  `groupId` int(11) NOT NULL,
  `createdBy` varchar(50) NOT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedBy` varchar(50) NOT NULL,
  `updatedDate` date NOT NULL,
  `archivedBy` varchar(50) NOT NULL,
  `archivedDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `updatestransaction`
--

INSERT INTO `updatestransaction` (`id`, `body`, `picture`, `video`, `groupId`, `createdBy`, `createdDate`, `updatedBy`, `updatedDate`, `archivedBy`, `archivedDate`) VALUES
(1, 'What would this be if we whare to help each other and solve our own problems?', 'no', 'no', 2, '', '2017-04-30 22:07:18', '', '0000-00-00', '', '0000-00-00'),
(2, 'Rwiza Tour is a private company that deals with the provision of touring services, within and outside Rwanda. We specialize in providing tourism services in schools, private and public institutions, and international organization and to individuals.', 'no', 'no', 2, '', '2017-04-30 22:31:24', '', '0000-00-00', '', '0000-00-00'),
(3, 'â€œIsuzuma ryâ€™ibanze ryarakozwe. Ikigaragara ni uko uburwayi afite bukomeye cyane, ku buryo kumuvura bizatwara igihe kirekire. Ikindi ni uko hagikenewe amadolari agera nibura ku bihumbi birindwi (7,000$) [ni ukuvuga akabakaba miliyoni 5 nâ€™igice zâ€™am', 'no', 'no', 1, '', '2017-05-05 02:57:53', '', '0000-00-00', '', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `3rdparty` varchar(50) NOT NULL,
  `3rdpartyId` varchar(250) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `active` varchar(50) DEFAULT NULL,
  `last_visit` date DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `profession` varchar(30) DEFAULT NULL,
  `bio` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `userType` varchar(50) DEFAULT NULL,
  `visits` int(11) DEFAULT NULL,
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

INSERT INTO `users` (`id`, `3rdparty`, `3rdpartyId`, `gender`, `phone`, `active`, `last_visit`, `name`, `email`, `profession`, `bio`, `password`, `userType`, `visits`, `createdBy`, `createdDate`, `updatedBy`, `updatedDate`, `archivedBy`, `archivedDate`) VALUES
(1, '', '1927845364128345', 'female', '15022455', '1', '2017-06-04', 'Bebe Claudette', '', NULL, NULL, '1234', NULL, 6, '', '0000-00-00', '', '0000-00-00', '', '0000-00-00'),
(8, '', '103646994601073087775', 'Male', '0784848238', '1', '2017-06-23', 'New Name', 'muhirwaclement@gmail.com', ' _testprofSSIONALE', 'this bio is not showing up', '1234', NULL, 55, '', '2017-05-01', '', '0000-00-00', '', '0000-00-00'),
(9, '', '', 'male', '0734879234', '0', NULL, NULL, '', NULL, NULL, '6607', NULL, 0, '', '0000-00-00', '', '0000-00-00', '', '0000-00-00'),
(10, '', '', '', '078585564654', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '', '0000-00-00', '', '0000-00-00', '', '0000-00-00'),
(11, '', '', '', '0783099700', '1', '2017-05-23', NULL, '', NULL, NULL, '4322', NULL, 1, '', '0000-00-00', '', '0000-00-00', '', '0000-00-00'),
(13, '', '', '', '0788751795', '0', NULL, NULL, '', NULL, NULL, '7757', NULL, 0, '', '2017-06-04', '', '0000-00-00', '', '0000-00-00'),
(14, '', '', '', '0788751595', '1', '2017-06-11', NULL, '', NULL, NULL, '4763', NULL, 5, '', '2017-06-04', '', '0000-00-00', '', '0000-00-00'),
(15, '', '', '', '0788747516', '0', NULL, NULL, '', NULL, NULL, '8528', NULL, 0, '', '2017-06-09', '', '0000-00-00', '', '0000-00-00'),
(16, '', '', '', '0576557457', '0', NULL, NULL, '', NULL, NULL, '9376', NULL, 0, '', '2017-06-13', '', '0000-00-00', '', '0000-00-00'),
(17, '', '', '', '0785467234', '0', NULL, NULL, '', NULL, NULL, '5876', NULL, 0, '', '2017-06-16', '', '0000-00-00', '', '0000-00-00'),
(18, '', '', '', '0788880000', '0', NULL, NULL, '', NULL, NULL, '6686', NULL, 0, '', '2017-06-16', '', '0000-00-00', '', '0000-00-00'),
(19, '', '', '', '07865654654', '0', NULL, NULL, '', NULL, NULL, '6984', NULL, 0, '', '2017-06-16', '', '0000-00-00', '', '0000-00-00'),
(20, '', '', '', '9786757', '0', NULL, NULL, '', NULL, NULL, '2265', NULL, 0, '', '2017-06-16', '', '0000-00-00', '', '0000-00-00'),
(21, '', '', '', '2394890', '0', NULL, NULL, '', NULL, NULL, '1829', NULL, 0, '', '2017-06-16', '', '0000-00-00', '', '0000-00-00'),
(22, '', '', '', '094805', '0', NULL, NULL, '', NULL, NULL, '5781', NULL, 0, '', '2017-06-16', '', '0000-00-00', '', '0000-00-00'),
(23, '', '', '', '987987', '0', NULL, NULL, '', NULL, NULL, '3546', NULL, 0, '', '2017-06-16', '', '0000-00-00', '', '0000-00-00'),
(24, '', '', '', '498789', '0', NULL, NULL, '', NULL, NULL, '3824', NULL, 0, '', '2017-06-16', '', '0000-00-00', '', '0000-00-00'),
(25, '', '', '', '0743979873', '0', NULL, NULL, '', NULL, NULL, '2574', NULL, 0, '', '2017-06-17', '', '0000-00-00', '', '0000-00-00'),
(26, '', '', '', '0784848236', '1', '2017-06-18', NULL, '', NULL, NULL, '9734', NULL, 7, '', '2017-06-17', '', '0000-00-00', '', '0000-00-00'),
(27, '', '', '', '0798567345', '1', '2017-06-18', NULL, '', NULL, NULL, '4060', NULL, 1, '', '2017-06-18', '', '0000-00-00', '', '0000-00-00'),
(28, '', '', 'male', '0788424547', '1', '2017-06-22', 'NIYOTWAGIRA Jean', '', NULL, NULL, '3428', NULL, 1, '', '2017-06-22', '', '0000-00-00', '', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `visitstrack`
--

CREATE TABLE `visitstrack` (
  `id` bigint(50) NOT NULL,
  `pageId` int(11) NOT NULL,
  `country` varchar(30) NOT NULL,
  `region` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `loc` varchar(30) NOT NULL,
  `org` varchar(30) NOT NULL,
  `visittime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `visitstrack`
--

INSERT INTO `visitstrack` (`id`, `pageId`, `country`, `region`, `city`, `ip`, `loc`, `org`, `visittime`) VALUES
(1, 1, 'RW', 'Kigali', 'Kigali', '41.186.56.14', '-1.9536,30.0606', 'AS36890 MTN Rwandacell', '2017-06-18 19:06:09'),
(2, 1, 'RW', 'Kigali', 'Kigali', '41.186.56.14', '-1.9536,30.0606', 'AS36890 MTN Rwandacell', '2017-06-18 19:23:11'),
(3, 2, 'RW', 'Kigali', 'Kigali', '41.186.56.14', '-1.9536,30.0606', 'AS36890 MTN Rwandacell', '2017-06-18 19:24:54'),
(4, 1, 'RW', 'Kigali', 'Kigali', '41.186.56.14', '-1.9536,30.0606', 'AS36890 MTN Rwandacell', '2017-06-18 19:25:16'),
(5, 1, 'RW', 'Kigali', 'Kigali', '41.186.56.14', '-1.9536,30.0606', 'AS36890 MTN Rwandacell', '2017-06-18 19:27:03'),
(6, 1, 'RW', 'Kigali', 'Kigali', '41.186.56.14', '-1.9536,30.0606', 'AS36890 MTN Rwandacell', '2017-06-18 19:27:33'),
(7, 1, 'RW', 'Kigali', 'Kigali', '41.186.56.14', '-1.9536,30.0606', 'AS36890 MTN Rwandacell', '2017-06-18 19:28:22'),
(8, 1, 'RW', 'Kigali', 'Kigali', '41.186.56.14', '-1.9536,30.0606', 'AS36890 MTN Rwandacell', '2017-06-18 19:29:31'),
(9, 1, 'RW', 'Kigali', 'Kigali', '41.186.56.14', '-1.9536,30.0606', 'AS36890 MTN Rwandacell', '2017-06-18 19:38:24'),
(10, 1, 'RW', 'Kigali', 'Kigali', '41.186.56.14', '-1.9536,30.0606', 'AS36890 MTN Rwandacell', '2017-06-18 19:40:21'),
(11, 1, 'RW', 'Kigali', 'Kigali', '41.186.56.14', '-1.9536,30.0606', 'AS36890 MTN Rwandacell', '2017-06-18 20:30:25'),
(12, 1, 'RW', 'Kigali', 'Kigali', '41.186.56.14', '-1.9536,30.0606', 'AS36890 MTN Rwandacell', '2017-06-18 20:32:03'),
(13, 1, 'RW', 'Kigali', 'Kigali', '41.186.56.14', '-1.9536,30.0606', 'AS36890 MTN Rwandacell', '2017-06-18 20:38:22'),
(14, 1, 'RW', 'Kigali', 'Kigali', '41.186.56.14', '-1.9536,30.0606', 'AS36890 MTN Rwandacell', '2017-06-18 20:41:13'),
(15, 1, 'RW', 'Kigali', 'Kigali', '41.186.56.14', '-1.9536,30.0606', 'AS36890 MTN Rwandacell', '2017-06-18 20:55:44'),
(16, 1, 'RW', 'Kigali', 'Kigali', '41.186.56.14', '-1.9536,30.0606', 'AS36890 MTN Rwandacell', '2017-06-18 21:09:57'),
(17, 1, 'RW', 'Kigali', 'Kigali', '41.186.56.14', '-1.9536,30.0606', 'AS36890 MTN Rwandacell', '2017-06-18 21:13:00'),
(18, 1, 'RW', 'Kigali', 'Kigali', '41.186.56.14', '-1.9536,30.0606', 'AS36890 MTN Rwandacell', '2017-06-18 21:17:50'),
(19, 1, 'RW', 'Kigali', 'Kigali', '41.186.56.14', '-1.9536,30.0606', 'AS36890 MTN Rwandacell', '2017-06-18 21:19:18'),
(20, 1, 'RW', 'Kigali', 'Kigali', '41.186.56.14', '-1.9536,30.0606', 'AS36890 MTN Rwandacell', '2017-06-18 21:53:57'),
(21, 1, 'RW', 'Kigali', 'Kigali', '41.186.56.14', '-1.9536,30.0606', 'AS36890 MTN Rwandacell', '2017-06-18 22:04:27'),
(22, 1, 'RW', 'Kigali', 'Kigali', '41.186.56.14', '-1.9536,30.0606', 'AS36890 MTN Rwandacell', '2017-06-18 22:21:46'),
(23, 1, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-19 16:40:35'),
(24, 1, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-19 16:41:49'),
(25, 1, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-19 16:57:53'),
(26, 1, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-19 17:31:23'),
(27, 1, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-20 12:29:07'),
(28, 1, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-20 12:29:25'),
(29, 1, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-20 12:30:03'),
(30, 1, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-20 12:30:15'),
(31, 1, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-20 12:30:29'),
(32, 1, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-20 12:35:12'),
(33, 1, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-20 12:35:35'),
(34, 1, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-20 12:36:19'),
(35, 1, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-20 12:37:12'),
(36, 1, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-20 12:38:28'),
(37, 1, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-20 12:43:07'),
(38, 1, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-20 12:47:36'),
(39, 1, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-20 12:59:22'),
(40, 1, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-20 13:09:36'),
(41, 1, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-20 13:09:43'),
(42, 1, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-20 13:16:04'),
(43, 1, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-20 14:06:52'),
(44, 1, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-20 14:40:35'),
(45, 1, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-20 14:41:11'),
(46, 1, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-20 14:43:18'),
(47, 1, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-20 14:48:12'),
(48, 1, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-20 14:49:05'),
(49, 1, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-20 17:27:36'),
(50, 1, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-20 17:33:09'),
(51, 1, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-20 17:34:27'),
(52, 7, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-20 17:35:18'),
(53, 7, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-20 17:36:27'),
(54, 1, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-20 17:36:37'),
(55, 1, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-20 22:14:01'),
(56, 3, 'RW', 'Kigali', 'Kibagabaga', '41.186.56.245', '-1.9333,30.1167', 'AS36890 MTN Rwandacell', '2017-06-22 07:45:15'),
(57, 1, 'RW', 'Kigali', 'Kibagabaga', '41.186.56.245', '-1.9333,30.1167', 'AS36890 MTN Rwandacell', '2017-06-22 07:45:55'),
(58, 1, 'RW', 'Kigali', 'Kibagabaga', '41.186.56.245', '-1.9333,30.1167', 'AS36890 MTN Rwandacell', '2017-06-22 07:50:41'),
(59, 1, 'RW', 'Kigali', 'Kibagabaga', '41.186.56.245', '-1.9333,30.1167', 'AS36890 MTN Rwandacell', '2017-06-22 07:52:37'),
(60, 1, 'RW', 'Kigali', 'Kibagabaga', '41.186.56.245', '-1.9333,30.1167', 'AS36890 MTN Rwandacell', '2017-06-22 07:54:43'),
(61, 1, 'RW', 'Kigali', 'Kibagabaga', '41.186.56.245', '-1.9333,30.1167', 'AS36890 MTN Rwandacell', '2017-06-22 07:57:07'),
(62, 1, 'RW', 'Kigali', 'Kibagabaga', '41.186.56.245', '-1.9333,30.1167', 'AS36890 MTN Rwandacell', '2017-06-22 08:01:59'),
(63, 1, 'RW', 'Kigali', 'Kibagabaga', '41.186.56.245', '-1.9333,30.1167', 'AS36890 MTN Rwandacell', '2017-06-22 08:03:26'),
(64, 1, 'RW', 'Kigali', 'Kibagabaga', '41.186.56.245', '-1.9333,30.1167', 'AS36890 MTN Rwandacell', '2017-06-22 08:05:28'),
(65, 1, 'RW', 'Kigali', 'Kibagabaga', '41.186.56.245', '-1.9333,30.1167', 'AS36890 MTN Rwandacell', '2017-06-22 08:07:16'),
(66, 1, 'RW', 'Kigali', 'Kibagabaga', '41.186.56.245', '-1.9333,30.1167', 'AS36890 MTN Rwandacell', '2017-06-22 08:09:03'),
(67, 1, 'RW', 'Kigali', 'Kibagabaga', '41.186.56.245', '-1.9333,30.1167', 'AS36890 MTN Rwandacell', '2017-06-22 08:11:59'),
(68, 1, 'RW', 'Kigali', 'Kibagabaga', '41.186.56.245', '-1.9333,30.1167', 'AS36890 MTN Rwandacell', '2017-06-22 08:41:46'),
(69, 1, 'RW', 'Kigali', 'Kibagabaga', '41.186.56.245', '-1.9333,30.1167', 'AS36890 MTN Rwandacell', '2017-06-22 08:42:41'),
(70, 1, 'RW', 'Kigali', 'Kibagabaga', '41.186.56.245', '-1.9333,30.1167', 'AS36890 MTN Rwandacell', '2017-06-22 08:50:23'),
(71, 1, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-22 10:53:16'),
(72, 29, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-22 10:59:17'),
(73, 29, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-22 10:59:47'),
(74, 29, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-22 11:04:08'),
(75, 29, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-22 11:04:22'),
(76, 29, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-22 11:12:58'),
(77, 29, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-22 11:57:02'),
(78, 1, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-27 13:12:42'),
(79, 1, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-27 13:16:40'),
(80, 1, 'RW', 'Kigali', 'Kacyiru', '41.74.174.251', '-1.9625,30.1056', 'AS37228 KT RWANDA NETWORK Ltd', '2017-06-27 13:19:02');

-- --------------------------------------------------------

--
-- Structure for view `invitations`
--
DROP TABLE IF EXISTS `invitations`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `invitations`  AS  select `g`.`groupName` AS `groupName`,`gu`.`createdBy` AS `invitor`,`gu`.`createdDate` AS `invitedDate`,`u`.`name` AS `invite`,`gu`.`joined` AS `joining`,`gu`.`updatedDate` AS `joinedDate` from ((`groupuser` `gu` join `groups` `g` on((`g`.`id` = `gu`.`groupId`))) join `users` `u` on((`u`.`id` = `gu`.`userId`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groupuser`
--
ALTER TABLE `groupuser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `updatestransaction`
--
ALTER TABLE `updatestransaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitstrack`
--
ALTER TABLE `visitstrack`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `groupuser`
--
ALTER TABLE `groupuser`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `updatestransaction`
--
ALTER TABLE `updatestransaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `visitstrack`
--
ALTER TABLE `visitstrack`
  MODIFY `id` bigint(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
