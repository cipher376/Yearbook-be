-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2022 at 02:41 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yearbook`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `state` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `suburb` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `schoolId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `latLng` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `state`, `country`, `street`, `suburb`, `postcode`, `city`, `schoolId`, `userId`, `latLng`) VALUES
(1, 'Lagos', 'Azerbaijan', NULL, NULL, NULL, '', NULL, NULL, NULL),
(2, 'Delta', 'Bangladesh', NULL, NULL, NULL, '', NULL, NULL, NULL),
(3, 'Edo', 'Argentina', NULL, NULL, NULL, '', NULL, NULL, NULL),
(4, 'Edo', 'Bahamas', NULL, NULL, NULL, '', NULL, NULL, NULL),
(5, 'Edo', 'Bahamas', NULL, NULL, NULL, '', NULL, NULL, NULL),
(6, 'delta', 'Barbados', NULL, NULL, NULL, '', NULL, NULL, NULL),
(7, 'Edo', 'Bangladesh', NULL, NULL, NULL, '', NULL, NULL, NULL),
(8, 'Foropa', 'Barbados', NULL, NULL, NULL, '', NULL, NULL, NULL),
(9, 'Edo', 'Bangladesh', NULL, NULL, NULL, '', NULL, NULL, NULL),
(10, 'Edo', 'Bahamas', NULL, NULL, NULL, '', NULL, NULL, NULL),
(11, 'Lagos', 'Australia', NULL, NULL, NULL, '', NULL, NULL, NULL),
(12, 'Lagos', 'Bangladesh', NULL, NULL, NULL, '', NULL, NULL, NULL),
(13, 'Bayelsa', 'Azerbaijan', NULL, NULL, NULL, '', NULL, NULL, NULL),
(14, 'Lagos', 'Nigeria', NULL, NULL, NULL, '', NULL, NULL, NULL),
(15, 'Lagos', 'Austria', NULL, NULL, NULL, '', NULL, NULL, NULL),
(16, 'Lagos', 'Nigeria', NULL, NULL, NULL, '', NULL, NULL, NULL),
(17, 'Lagos', 'Armenia', NULL, NULL, NULL, '', NULL, NULL, NULL),
(18, 'Lagos', 'Armenia', NULL, NULL, NULL, '', NULL, NULL, NULL),
(19, 'Lagos', 'Armenia', NULL, NULL, NULL, '', NULL, NULL, NULL),
(20, 'Lagos', 'Armenia', NULL, NULL, NULL, '', NULL, NULL, NULL),
(21, 'delta', 'Andorra', NULL, NULL, NULL, '', NULL, NULL, NULL),
(22, 'delta', 'Bahamas', NULL, NULL, NULL, '', NULL, NULL, NULL),
(23, 'Edo', 'Azerbaijan', NULL, NULL, NULL, '', NULL, NULL, NULL),
(24, 'delta', 'Andorra', NULL, NULL, NULL, '', NULL, NULL, NULL),
(25, 'delta', 'Andorra', NULL, NULL, NULL, '', NULL, NULL, NULL),
(26, 'Edo', 'Bangladesh', NULL, NULL, NULL, '', NULL, NULL, NULL),
(27, 'Edo', 'Bangladesh', NULL, NULL, NULL, '', NULL, NULL, NULL),
(28, 'delta', 'Andorra', NULL, NULL, NULL, '', NULL, NULL, NULL),
(29, 'Bayelsa', 'Andorra', NULL, NULL, NULL, '', NULL, NULL, NULL),
(30, 'Edo2', 'Andorra', NULL, NULL, NULL, '', NULL, NULL, NULL),
(31, 'delta', 'Andorra', NULL, NULL, NULL, '', NULL, NULL, NULL),
(32, 'Bayelsa', 'Bahrain', NULL, NULL, NULL, '', NULL, NULL, NULL),
(33, 'Edo', 'Bangladesh', NULL, NULL, NULL, '', NULL, NULL, NULL),
(34, 'Edo', 'Bangladesh', NULL, NULL, NULL, '', NULL, NULL, NULL),
(35, 'Lagos', 'Armenia', NULL, NULL, NULL, '', NULL, NULL, NULL),
(36, 'delta', 'Bahamas', NULL, NULL, NULL, '', NULL, NULL, NULL),
(37, 'delta', 'Antigua and Barbuda', NULL, NULL, NULL, '', NULL, NULL, NULL),
(38, 'Lagos', 'Andorra', NULL, NULL, NULL, '', NULL, NULL, NULL),
(39, 'Lagos', 'Bahrain', NULL, NULL, NULL, '', NULL, NULL, NULL),
(40, 'Elbasan', 'Albania', NULL, NULL, '00233', 'Nandam', NULL, 14, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `alumni`
--

CREATE TABLE `alumni` (
  `id` int(11) NOT NULL,
  `yearStarted` datetime NOT NULL,
  `yearCompleted` datetime NOT NULL,
  `schoolIndexNumber` varchar(512) DEFAULT NULL,
  `schoolId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `alumni`
--

INSERT INTO `alumni` (`id`, `yearStarted`, `yearCompleted`, `schoolIndexNumber`, `schoolId`, `userId`) VALUES
(15, '2020-10-25 00:01:58', '2020-10-25 00:01:58', 'string', 2, 7),
(17, '2020-10-25 00:01:58', '2020-10-25 00:01:58', 'string', 86, 7),
(34, '2020-12-01 16:04:19', '2020-12-01 16:04:19', NULL, 4, 1),
(36, '2018-12-04 23:11:23', '2015-12-04 23:11:23', NULL, 1, 1),
(37, '2020-12-14 06:47:39', '2019-12-14 06:47:39', NULL, 2, 1),
(38, '2021-01-09 08:36:59', '2021-01-09 08:36:59', NULL, 301, 14),
(39, '2022-11-16 02:43:10', '2022-12-16 02:43:10', NULL, 72, 14),
(40, '2021-12-16 03:01:23', '2020-11-16 03:01:23', NULL, 4, 14);

-- --------------------------------------------------------

--
-- Table structure for table `audio`
--

CREATE TABLE `audio` (
  `id` int(11) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `fileName` varchar(512) NOT NULL,
  `fileUrl` varchar(512) NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `type` int(11) NOT NULL,
  `schoolId` int(11) DEFAULT NULL,
  `postId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `length` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `audio`
--

INSERT INTO `audio` (`id`, `description`, `fileName`, `fileUrl`, `dateCreated`, `type`, `schoolId`, `postId`, `userId`, `length`) VALUES
(1, '', '1_1605107906401.mp3', '/1_1605107906401.mp3', '2020-11-11 15:18:27', 2, NULL, 81, 1, -1),
(2, '', '1_1605107906401.mp3', '/1_1605107906401.mp3', '2020-11-11 15:18:27', 2, NULL, 80, 1, -1),
(3, '', '1_1606050070740.mp3', '/1_1606050070740.mp3', '2020-11-22 13:01:11', 2, NULL, 89, 1, -1),
(4, '', '1_1606050408768.mp3', '/1_1606050408768.mp3', '2020-11-22 13:06:51', 2, NULL, 90, 1, -1),
(5, '', '14_1609751261211.mp3', '/14_1609751261211.mp3', '2021-01-04 09:07:41', 2, NULL, 119, 14, -1),
(6, '', '14_1609751261209.mp3', '/14_1609751261209.mp3', '2021-01-04 09:07:41', 2, NULL, 119, 14, -1),
(7, '', '14_1609751261213.mp3', '/14_1609751261213.mp3', '2021-01-04 09:07:41', 2, NULL, 119, 14, -1),
(8, '', '14_1609753009047.mp3', '/14_1609753009047.mp3', '2021-01-04 09:36:49', 2, NULL, 120, 14, -1),
(9, '', '14_1609753009044.mp3', '/14_1609753009044.mp3', '2021-01-04 09:36:49', 2, NULL, 120, 14, -1),
(10, '', '14_1609753009048.mp3', '/14_1609753009048.mp3', '2021-01-04 09:36:49', 2, NULL, 120, 14, -1),
(11, '', '14_1609753009049.mp3', '/14_1609753009049.mp3', '2021-01-04 09:36:49', 2, NULL, 120, 14, -1),
(12, '', '14_1609753009051.mp3', '/14_1609753009051.mp3', '2021-01-04 09:36:49', 2, NULL, 120, 14, -1),
(13, '', '14_1609753009052.mp3', '/14_1609753009052.mp3', '2021-01-04 09:36:49', 2, NULL, 120, 14, -1),
(14, '', '14_1609753009054.mp3', '/14_1609753009054.mp3', '2021-01-04 09:36:49', 2, NULL, 120, 14, -1),
(15, '', '14_1609753151583.mp3', '/14_1609753151583.mp3', '2021-01-04 09:39:12', 2, NULL, 121, 14, -1),
(16, '', '14_1612581997463.mp3', '/14_1612581997463.mp3', '2021-02-06 03:26:37', 2, NULL, 191, 14, -1);

-- --------------------------------------------------------

--
-- Table structure for table `authentication`
--

CREATE TABLE `authentication` (
  `id` int(11) NOT NULL,
  `email` varchar(512) NOT NULL,
  `retryCount` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `lastLoggedIn` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `casbin_rule`
--

CREATE TABLE `casbin_rule` (
  `id` int(11) NOT NULL,
  `ptype` varchar(255) DEFAULT NULL,
  `v0` varchar(255) DEFAULT NULL,
  `v1` varchar(255) DEFAULT NULL,
  `v2` varchar(255) DEFAULT NULL,
  `v3` varchar(255) DEFAULT NULL,
  `v4` varchar(255) DEFAULT NULL,
  `v5` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `casbin_rule`
--

INSERT INTO `casbin_rule` (`id`, `ptype`, `v0`, `v1`, `v2`, `v3`, `v4`, `v5`) VALUES
(0, 'p', 'authUser', 'alumni', 'create', NULL, NULL, NULL),
(2, 'p', 'authUser', 'alumni_degree', 'create', NULL, NULL, NULL),
(6, 'p', 'authUser', 'media', 'create', NULL, NULL, NULL),
(7, 'p', 'authUser', 'media', 'upload', NULL, NULL, NULL),
(11, 'p', 'authUser', 'school_alumni', 'create', NULL, NULL, NULL),
(12, 'p', 'authUser', 'school_alumni', 'update-by-id', NULL, NULL, NULL),
(13, 'p', 'authUser', 'school_audio', 'create', NULL, NULL, NULL),
(15, 'p', 'authUser', 'user_address', 'create', NULL, NULL, NULL),
(16, 'p', 'authUser', 'user_photo', 'create', NULL, NULL, NULL),
(17, 'p', 'authUser', 'user', 'update-by-id', NULL, NULL, NULL),
(18, 'p', 'authUser', 'user', 'my-profile', NULL, NULL, NULL),
(22, 'p', 'authUser', 'alumni', 'delete-by-id', NULL, NULL, NULL),
(26, 'p', 'authUser', 'user', 'me', NULL, NULL, NULL),
(27, 'p', 'authUser', 'alumni_degree', 'update-by-id', NULL, NULL, NULL),
(29, 'p', 'authUser', 'comment', 'create', NULL, NULL, NULL),
(32, 'p', 'authUser', 'follow', 'create', NULL, NULL, NULL),
(35, 'p', 'authUser', 'follow', 'update-by-id', NULL, NULL, NULL),
(36, 'p', 'authUser', 'like', 'create', NULL, NULL, NULL),
(39, 'p', 'authUser', 'like', 'update-by-id', NULL, NULL, NULL),
(40, 'p', 'authUser', 'post_audio', 'create', NULL, NULL, NULL),
(41, 'p', 'authUser', 'post_audio', 'delete-by-id', NULL, NULL, NULL),
(42, 'p', 'authUser', 'post_config', 'create', NULL, NULL, NULL),
(43, 'p', 'authUser', 'post', 'create', NULL, NULL, NULL),
(45, 'p', 'authUser', 'user_config', 'create', NULL, NULL, NULL),
(47, 'p', 'authUser', 'address', 'update-by-id', NULL, NULL, NULL),
(50, 'p', 'authUser', 'alumni_degree', 'delete-by-id', NULL, NULL, NULL),
(51, 'p', 'authUser', 'alumni', 'update-by-id', NULL, NULL, NULL),
(52, 'p', 'authUser', 'photo', 'create', NULL, NULL, NULL),
(53, 'p', 'authUser', 'photo', 'update-by-id', NULL, NULL, NULL),
(54, 'p', 'authUser', 'photo', 'delete-by-id', NULL, NULL, NULL),
(55, 'p', 'authUser', 'user_address', 'update-by-id', NULL, NULL, NULL),
(56, 'p', 'authUser', 'user_photo', 'update-by-id', NULL, NULL, NULL),
(57, 'p', 'authUser', 'post_config', 'update-by-id', NULL, NULL, NULL),
(58, 'p', 'authUser', 'user_config', 'update-by-id', NULL, NULL, NULL),
(59, 'p', 'admin', 'address', 'list-all', NULL, NULL, NULL),
(60, 'p', 'admin', 'address', 'update-all', NULL, NULL, NULL),
(61, 'p', 'admin', 'address', 'find-by-id', NULL, NULL, NULL),
(62, 'p', 'admin', 'address', 'update-by-id', NULL, NULL, NULL),
(63, 'p', 'admin', 'address', 'replace-by-id', NULL, NULL, NULL),
(64, 'p', 'admin', 'address', 'delete-by-id', NULL, NULL, NULL),
(65, 'p', 'admin', 'address', 'count', NULL, NULL, NULL),
(66, 'p', 'admin', 'address', 'create-many', NULL, NULL, NULL),
(67, 'p', 'admin', 'alumni_degree', 'list-all', NULL, NULL, NULL),
(68, 'p', 'admin', 'alumni', 'update-all', NULL, NULL, NULL),
(69, 'p', 'admin', 'alumni', 'update-by-id', NULL, NULL, NULL),
(72, 'p', 'admin', 'alumni', 'replace-by-id', NULL, NULL, NULL),
(73, 'p', 'admin', 'alumni', 'delete-by-id', NULL, NULL, NULL),
(74, 'p', 'admin', 'alumni', 'delete-by-user-school-id', NULL, NULL, NULL),
(76, 'p', 'admin', 'comment ', 'delete-by-id', NULL, NULL, NULL),
(77, 'p', 'admin', 'follow ', 'delete-by-id', NULL, NULL, NULL),
(78, 'p', 'admin', 'follow ', 'update-by-id', NULL, NULL, NULL),
(79, 'p', 'admin', 'like ', 'update-by-id', NULL, NULL, NULL),
(80, 'p', 'admin', 'like ', 'delete-by-id', NULL, NULL, NULL),
(81, 'p', 'admin', 'media ', 'delete-by-id', NULL, NULL, NULL),
(82, 'p', 'admin', 'media ', 'update-all', NULL, NULL, NULL),
(83, 'p', 'admin', 'media ', 'update-by-id', NULL, NULL, NULL),
(84, 'p', 'admin', 'media ', 'replace-by-id', NULL, NULL, NULL),
(85, 'p', 'admin', 'media ', 'list-all-media', NULL, NULL, NULL),
(86, 'p', 'admin', 'photo', 'create', NULL, NULL, NULL),
(87, 'p', 'admin', 'photo', 'update-all', NULL, NULL, NULL),
(88, 'p', 'admin', 'photo', 'create-many', NULL, NULL, NULL),
(89, 'p', 'admin', 'photo', 'update-by-id', NULL, NULL, NULL),
(90, 'p', 'admin', 'photo', 'replace-by-id', NULL, NULL, NULL),
(91, 'p', 'admin', 'policy', 'count-policies', NULL, NULL, NULL),
(92, 'p', 'admin', 'policy', 'add-policy', NULL, NULL, NULL),
(93, 'p', 'admin', 'policy', 'remove-policy', NULL, NULL, NULL),
(94, 'p', 'admin', 'policy', 'has-policy', NULL, NULL, NULL),
(95, 'p', 'admin', 'policy', 'list-policy', NULL, NULL, NULL),
(96, 'p', 'admin', 'policy', 'list-subject', NULL, NULL, NULL),
(97, 'p', 'admin', 'policy', 'list-object', NULL, NULL, NULL),
(98, 'p', 'admin', 'policy', 'list-action', NULL, NULL, NULL),
(99, 'p', 'admin', 'policy', 'list-role', NULL, NULL, NULL),
(100, 'p', 'admin', 'post_config', 'delete-by-id', NULL, NULL, NULL),
(101, 'p', 'admin', 'post_config', 'update-by-id', NULL, NULL, NULL),
(102, 'p', 'admin', 'post_audio', 'delete-by-id', NULL, NULL, NULL),
(103, 'p', 'admin', 'post_audio', 'update-by-id', NULL, NULL, NULL),
(104, 'p', 'admin', 'post', 'update-by-id', NULL, NULL, NULL),
(105, 'p', 'admin', 'post', 'delete-by-id', NULL, NULL, NULL),
(106, 'p', 'admin', 'school_address', 'create', NULL, NULL, NULL),
(107, 'p', 'admin', 'school_address', 'update-by-id', NULL, NULL, NULL),
(108, 'p', 'admin', 'school_address', 'delete-by-id', NULL, NULL, NULL),
(109, 'p', 'admin', 'school_alumni', 'delete-by-id', NULL, NULL, NULL),
(110, 'p', 'admin', 'school_alumni', 'update-by-id', NULL, NULL, NULL),
(111, 'p', 'admin', 'school_audio', 'update-by-id', NULL, NULL, NULL),
(112, 'p', 'admin', 'school_audio', 'delete-by-id', NULL, NULL, NULL),
(113, 'p', 'admin', 'school_audio', 'create', NULL, NULL, NULL),
(114, 'p', 'admin', 'school_document', 'create', NULL, NULL, NULL),
(115, 'p', 'admin', 'school_document', 'update-by-id', NULL, NULL, NULL),
(116, 'p', 'admin', 'school_document', 'delete-by-id', NULL, NULL, NULL),
(117, 'p', 'admin', 'school_photo', 'create', NULL, NULL, NULL),
(118, 'p', 'admin', 'school_photo', 'update-by-id', NULL, NULL, NULL),
(119, 'p', 'admin', 'school_photo', 'delete-by-id', NULL, NULL, NULL),
(120, 'p', 'admin', 'school_details', 'create', NULL, NULL, NULL),
(121, 'p', 'admin', 'school_details', 'update-by-id', NULL, NULL, NULL),
(122, 'p', 'admin', 'school_details', 'delete-by-id', NULL, NULL, NULL),
(123, 'p', 'admin', 'school_video', 'create', NULL, NULL, NULL),
(124, 'p', 'admin', 'school_video', 'update-by-id', NULL, NULL, NULL),
(125, 'p', 'admin', 'school_video', 'delete-by-id', NULL, NULL, NULL),
(126, 'p', 'admin', 'school', 'create', NULL, NULL, NULL),
(127, 'p', 'admin', 'school', 'update-all', NULL, NULL, NULL),
(128, 'p', 'admin', 'school', 'delete-by-id', NULL, NULL, NULL),
(129, 'p', 'admin', 'school', 'replace-by-id', NULL, NULL, NULL),
(130, 'p', 'admin', 'school', 'update-by-id', NULL, NULL, NULL),
(131, 'p', 'admin', 'user_address', 'update-by-id', NULL, NULL, NULL),
(132, 'p', 'admin', 'user_address', 'delete-by-id', NULL, NULL, NULL),
(133, 'p', 'admin', 'user_config', 'update-by-id', NULL, NULL, NULL),
(134, 'p', 'admin', 'user_config', 'delete-by-id', NULL, NULL, NULL),
(135, 'p', 'admin', 'user_config', 'list-all', NULL, NULL, NULL),
(136, 'p', 'admin', 'user_photo', 'delete-by-id', NULL, NULL, NULL),
(137, 'p', 'admin', 'user_photo', 'update-by-id', NULL, NULL, NULL),
(138, 'p', 'admin', 'user', 'update-by-id', NULL, NULL, NULL),
(139, 'p', 'admin', 'user', 'delete', NULL, NULL, NULL),
(140, 'p', 'admin', 'user', 'ban-user', NULL, NULL, NULL),
(141, 'p', 'admin', 'user', 'block-user', NULL, NULL, NULL),
(142, 'p', 'admin', 'user', 'create-many', NULL, NULL, NULL),
(143, 'p', 'schoolAdmin', 'school', 'update-by-id', NULL, NULL, NULL),
(144, 'p', 'schoolAdmin', 'school_video', 'create', NULL, NULL, NULL),
(145, 'p', 'schoolAdmin', 'school_video', 'delete-by-id', NULL, NULL, NULL),
(146, 'p', 'schoolAdmin', 'school_details', 'create', NULL, NULL, NULL),
(147, 'p', 'schoolAdmin', 'school_details', 'udpate-by-id', NULL, NULL, NULL),
(148, 'p', 'schoolAdmin', 'school_photo', 'create', NULL, NULL, NULL),
(149, 'p', 'schoolAdmin', 'school_photo', 'delete-by-id', NULL, NULL, NULL),
(150, 'p', 'schoolAdmin', 'school_document', 'delete-by-id', NULL, NULL, NULL),
(151, 'p', 'schoolAdmin', 'school_document', 'create', NULL, NULL, NULL),
(152, 'p', 'schoolAdmin', 'school_audio', 'create', NULL, NULL, NULL),
(153, 'p', 'schoolAdmin', 'school_audio', 'delete-by-id', NULL, NULL, NULL),
(154, 'p', 'schoolAdmin', 'school_alumni', 'delete-by-id', NULL, NULL, NULL),
(155, 'p', 'schoolAdmin', 'school_alumni', 'update-by-id', NULL, NULL, NULL),
(156, 'p', 'schoolAdmin', 'school_address', 'update-by-id', NULL, NULL, NULL),
(157, 'p', 'schoolAdmin', 'school_address', 'create', NULL, NULL, NULL),
(158, 'p', 'schoolAdmin', 'post', 'update-by-id', NULL, NULL, NULL),
(159, 'p', 'schoolAdmin', 'post', 'delete-by-id', NULL, NULL, NULL),
(160, 'g', 'u10', 'authUser', NULL, NULL, NULL, NULL),
(161, 'g', 'u11', 'authUser', NULL, NULL, NULL, NULL),
(162, 'g', 'u1', 'authUser', NULL, NULL, NULL, NULL),
(163, 'g', 'u12', 'authUser', NULL, NULL, NULL, NULL),
(164, 'g', 'u8', 'authUser', NULL, NULL, NULL, NULL),
(165, 'g', 'u13', 'authUser', NULL, NULL, NULL, NULL),
(166, 'g', 'u14', 'authUser', NULL, NULL, NULL, NULL),
(167, 'g', 'u15', 'authUser', NULL, NULL, NULL, NULL),
(168, 'g', 'u14', 'admin', NULL, NULL, NULL, NULL),
(169, 'g', 'u16', 'authUser', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `message` varchar(512) NOT NULL,
  `initiatorId` int(11) DEFAULT NULL,
  `postId` int(11) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `message`, `initiatorId`, `postId`, `dateCreated`) VALUES
(1, 'fasdfdafd', 1, 111, NULL),
(2, 'sgfs f asdfda df', 1, 111, NULL),
(3, 'vrtwreythdghgreterbwetr', 1, 111, NULL),
(4, 'sfgfgsdfgsgfdg', 1, 111, NULL),
(5, 'sdgfgsdfgdfgsfg', 1, 111, NULL),
(6, 'sdgsdfgfgsdf', 1, 111, NULL),
(7, 'ggsfdgfdsgfsgvretrwtsg', 1, 111, NULL),
(8, 'love this picture ', 1, 111, NULL),
(9, 'yeah, what\'s up ', 1, 57, NULL),
(10, 'afd df sdf asdf', 1, 80, NULL),
(11, 'what is going on', 1, 80, NULL),
(12, 'dfssgfdgdsfgdfg', 1, 110, NULL),
(13, 'again', 1, 111, NULL),
(14, 'dfasdfdfasdfdfd', 1, 103, NULL),
(15, 'dfdsfsdf sdfdasfdfd', 1, 80, NULL),
(16, 'ghhhhhhhh', 1, 110, NULL),
(17, 'asds DSDASD', 1, 110, '2020-11-26 13:13:57'),
(18, 'dsfgfsdfgdfgs', 1, 91, '2020-11-26 13:15:49'),
(19, 'dfsgfdsgfgfdsg', 1, 111, '2020-11-26 13:32:32'),
(20, 'fgsfgsfdg', 1, 109, '2020-11-26 13:33:08'),
(21, 'fgsdgfgsdfgfdg', 1, 109, '2020-11-26 13:33:29'),
(22, 'sdDASDS', 1, 109, '2020-11-26 13:34:34'),
(23, 'DADSDASD', 1, 109, '2020-11-26 13:34:44'),
(24, 'Asds drwere', 1, 109, '2020-11-26 13:34:55'),
(25, 'dfsfgfdgfgsdf', 1, 105, '2020-11-26 13:36:52'),
(26, 'gsfdgdsfg', 1, 105, '2020-11-26 13:37:42'),
(27, 'sdfgfgsdf', 1, 105, '2020-11-26 13:37:47'),
(28, '23456', 1, 105, '2020-11-26 13:37:53'),
(29, '11112345', 1, 105, '2020-11-26 13:37:57'),
(30, 'dfafdafsdfadsf', 1, 108, '2020-11-26 13:39:13'),
(31, 'fdsafdfas', 1, 107, '2020-11-26 13:40:03'),
(32, 'sdfdfdsfdf', 1, 107, '2020-11-26 13:40:08'),
(33, 'asdfsdfdfsdf', 1, 107, '2020-11-26 13:40:17'),
(34, 'fff', 1, 108, '2020-11-26 13:41:28'),
(35, 'fffff', 1, 108, '2020-11-26 13:41:44'),
(36, 'hhhhhhh', 1, 108, '2020-11-26 13:42:03'),
(37, 'rrrrr', 1, 108, '2020-11-26 13:42:10'),
(38, 'rrrrrr', 1, 108, '2020-11-26 13:42:16'),
(39, 'eeeeee', 1, 108, '2020-11-26 13:42:33'),
(40, '11111111', 1, 109, '2020-11-26 13:44:06'),
(41, '111122233', 1, 109, '2020-11-26 13:44:15'),
(42, '11111', 1, 109, '2020-11-26 13:46:29'),
(43, '111112222222', 1, 109, '2020-11-26 13:46:38'),
(44, 'ghgfghgh', 1, 109, '2020-11-26 13:47:50'),
(45, '8888888', 1, 109, '2020-11-26 13:48:36'),
(46, '0000000000', 1, 109, '2020-11-26 13:48:45'),
(47, 'jkjkjhkjhkjh', 1, 109, '2020-11-26 13:49:11'),
(48, 'fghdfghgdfhg', 1, 109, '2020-11-26 13:53:45'),
(49, '1111111', 1, 109, '2020-11-26 13:54:02'),
(50, '11111', 1, 109, '2020-11-26 13:54:06'),
(51, '1111111', 1, 109, '2020-11-26 13:54:11'),
(52, 'safdfadsf', 1, 110, '2020-11-26 13:54:44'),
(53, '6666', 1, 111, '2020-11-26 13:59:28'),
(54, '66666', 1, 111, '2020-11-26 13:59:41'),
(55, 'aaaaaa', 1, 111, '2020-11-26 14:02:10'),
(56, 'aaaaaaa', 1, 111, '2020-11-26 14:02:18'),
(57, 'dsfsadfsdfasdf', 1, 111, '2020-11-26 14:05:41'),
(58, 'dddddd', 1, 111, '2020-11-26 14:05:49'),
(59, 'fsdadfsdfdsaf', 1, 110, '2020-11-26 14:06:00'),
(60, 'asdfdfasdfd', 1, 110, '2020-11-26 14:06:04'),
(61, 'dfasdfdfasdfdsafdfadsf', 1, 110, '2020-11-26 14:06:08'),
(62, 'ggggggg', 1, 110, '2020-11-26 14:09:36'),
(63, 'gggggg', 1, 110, '2020-11-26 14:09:41'),
(64, 'gggggg', 1, 110, '2020-11-26 14:09:49'),
(65, 'yyyyyyy', 1, 111, '2020-11-26 14:10:55'),
(66, 'yyyyyyyy', 1, 110, '2020-11-26 14:11:00'),
(67, 'uuuuuuuuu', 1, 108, '2020-11-26 14:11:12'),
(68, 'ioio', 1, 96, '2020-11-26 14:11:21'),
(69, 'eeeeee', 1, 96, '2020-11-26 14:11:35'),
(70, 'ererererer', 1, 96, '2020-11-26 14:11:40'),
(71, 'fsdafd afdasf d', 1, 111, '2020-11-26 15:09:35'),
(72, 'retetrtr', 1, 111, '2020-11-26 15:09:51'),
(73, 'hey', 1, 72, '2020-11-26 15:11:36'),
(74, '????', 1, 109, '2020-11-26 18:03:36'),
(75, '????????????', 1, 109, '2020-11-26 18:03:57'),
(76, 'dertyhg', 1, 111, '2020-11-26 18:16:48'),
(77, 'dasfl dlkafjd safjdl fjlkdjf aldjsfl asdjlf jsdlfkjdl fkjasldkfj ldskaf', 1, 111, '2020-11-27 00:50:31'),
(78, 'sdfadfadsfddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd', 1, 111, '2020-11-27 00:50:43'),
(79, 'eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee', 1, 111, '2020-11-27 01:01:17'),
(80, 'fsfd', 1, 89, '2020-11-27 01:57:00'),
(81, 'kkjkjjkkj????????', 1, 111, '2020-11-27 14:50:36'),
(82, 'undefined????????????????', 1, 104, '2020-11-27 14:52:31'),
(83, '????????????????????????', 1, 111, '2020-11-27 14:55:58'),
(84, '&#1F9A7&#1F61A&#263A-FE0F', 1, 111, '2020-11-27 15:18:05'),
(85, '1F44D-1F3FF1F6071F617', 1, 111, '2020-11-27 15:20:50'),
(86, '????????????????', 1, 111, '2020-11-27 15:21:59'),
(87, '&#????;&#????;&#????;&#????;', 1, 111, '2020-11-27 15:26:19'),
(88, ' &#1F606;  &#1F923; ', 1, 111, '2020-11-27 15:27:04'),
(89, ' \01F44D-1F3FF  \0263A-FE0F ', 1, 111, '2020-11-27 15:32:17'),
(90, ' \0????', 1, 111, '2020-11-27 15:33:14'),
(91, ' ???????? ???????? ???? ????', 1, 111, '2020-11-27 15:39:31'),
(92, ' ???? ????', 1, 111, '2020-11-27 15:51:19'),
(93, '????????????', 1, 111, '2020-11-27 15:53:19'),
(94, '????????☺️', 1, 111, '2020-11-27 15:54:56'),
(95, '????????????????????????????????????????', 1, 110, '2020-11-27 15:57:23'),
(96, '????????', 1, 110, '2020-11-27 16:01:06'),
(97, '????????????????', 1, 43, '2020-11-29 23:26:36'),
(98, 'kj jkkjhkjhgggkjg  gjkghkj', 1, 33, '2020-11-29 23:26:55'),
(99, '????????????????????????????????????', 1, 92, '2020-12-04 16:28:58'),
(100, 'fdsgfdfgfdsg', 1, 111, '2020-12-04 22:26:14'),
(101, 'yiiiii', 14, 198, '2022-11-16 03:14:17');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(33) DEFAULT NULL,
  `continent_id` varchar(200) DEFAULT NULL,
  `continent_name` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`country_id`, `country_name`, `continent_id`, `continent_name`) VALUES
(1, ' Andorra', '2', 'Asia'),
(2, ' Albania', '4', 'Europe'),
(3, ' Algeria', '1', 'Africa'),
(4, ' Andorra', '4', 'Europe'),
(5, ' Angola', '1', 'Africa'),
(6, ' Antigua and Barbuda', '5', 'North America'),
(7, ' Argentina', '6', 'South America'),
(8, ' Armenia', '4', 'Europe'),
(9, ' Australia', '3', 'Australia'),
(10, ' Austria', '4', 'Europe'),
(11, ' Azerbaijan', '4', 'Europe'),
(12, ' Bahamas', '5', 'North America'),
(13, ' Bahrain', '2', 'Asia'),
(14, ' Bangladesh', '2', 'Asia'),
(15, ' Barbados', '5', 'North America'),
(16, ' Belarus', '4', 'Europe'),
(17, ' Belgium', '4', 'Europe'),
(18, ' Belize', '5', 'North America'),
(19, ' Benin', '1', 'Africa'),
(20, ' Bhutan', '2', 'Asia'),
(21, ' Bolivia', '6', 'South America'),
(22, ' Bosnia and Herzegovina', '4', 'Europe'),
(23, ' Botswana', '1', 'Africa'),
(24, ' Brazil', '6', 'South America'),
(25, ' Brunei', '2', 'Asia'),
(26, ' Bulgaria', '4', 'Europe'),
(27, ' Burkina', '1', 'Africa'),
(28, ' Burma (Myanmar)', '2', 'Asia'),
(29, ' Burundi', '1', 'Africa'),
(30, ' Cambodia', '2', 'Asia'),
(31, ' Cameroon', '1', 'Africa'),
(32, ' Canada', '5', 'North America'),
(33, ' Cape Verde', '1', 'Africa'),
(34, ' Central African Republic', '1', 'Africa'),
(35, ' Chad', '1', 'Africa'),
(36, ' Chile', '6', 'South America'),
(37, ' China', '2', 'Asia'),
(38, ' Colombia', '6', 'South America'),
(39, ' Comoros', '1', 'Africa'),
(40, ' Congo', '1', 'Africa'),
(41, ' Congo, Democratic Republic of', '1', 'Africa'),
(42, ' Costa Rica', '5', 'North America'),
(43, ' Croatia', '4', 'Europe'),
(44, ' Cuba', '5', 'North America'),
(45, ' Cyprus', '4', 'Europe'),
(46, ' Czech Republic', '4', 'Europe'),
(47, ' Denmark', '4', 'Europe'),
(48, ' Djibouti', '1', 'Africa'),
(49, ' Dominica', '5', 'North America'),
(50, ' Dominican Republic', '5', 'North America'),
(51, ' East Timor', '1', 'Asia'),
(52, ' Ecuador', '6', 'South America'),
(53, ' Egypt', '1', 'Africa'),
(54, ' El Salvador', '5', 'North America'),
(55, ' Equatorial Guinea', '1', 'Africa'),
(56, ' Eritrea', '1', 'Africa'),
(57, ' Estonia', '4', 'Europe'),
(58, ' Ethiopia', '1', 'Africa'),
(59, ' Fiji', '3', 'Australia'),
(60, ' Finland', '4', 'Europe'),
(61, ' France', '4', 'Europe'),
(62, ' Gabon', '1', 'Africa'),
(63, ' Gambia', '1', 'Africa'),
(64, ' Georgia', '4', 'Europe'),
(65, ' Germany', '4', 'Europe'),
(66, ' Ghana', '1', 'Africa'),
(67, ' Greece', '4', 'Europe'),
(68, ' Grenada', '5', 'North America'),
(69, ' Guatemala', '5', 'North America'),
(70, ' Guinea', '1', 'Africa'),
(71, ' Guinea-Bissau', '1', 'Africa'),
(72, ' Guyana', '6', 'South America'),
(73, ' Haiti', '5', 'North America'),
(74, ' Honduras', '5', 'North America'),
(75, ' Hungary', '4', 'Europe'),
(76, ' Iceland', '4', 'Europe'),
(77, ' India', '2', 'Asia'),
(78, ' Indonesia', '2', 'Asia'),
(79, ' Iran', '2', 'Asia'),
(80, ' Iraq', '2', 'Asia'),
(81, ' Ireland', '4', 'Europe'),
(82, ' Israel', '2', 'Asia'),
(83, ' Italy', '4', 'Europe'),
(84, ' Ivory Coast', '1', 'Africa'),
(85, ' Jamaica', '5', 'North America'),
(86, ' Japan', '2', 'Asia'),
(87, ' Jordan', '2', 'Asia'),
(88, ' Kazakhstan', '2', 'Asia'),
(89, ' Kenya', '1', 'Africa'),
(90, ' Kiribati', '3', 'Australia'),
(91, ' Korea, North', '2', 'Asia'),
(92, ' Korea, South', '2', 'Asia'),
(93, ' Kuwait', '2', 'Asia'),
(94, ' Kyrgyzstan', '2', 'Asia'),
(95, ' Laos', '2', 'Asia'),
(96, ' Latvia', '4', 'Europe'),
(97, ' Lebanon', '2', 'Asia'),
(98, ' Lesotho', '1', 'Africa'),
(99, ' Liberia', '1', 'Africa'),
(100, ' Libya', '1', 'Africa'),
(101, ' Liechtenstein', '4', 'Europe'),
(102, ' Lithuania', '4', 'Europe'),
(103, ' Luxembourg', '4', 'Europe'),
(104, ' Macedonia', '4', 'Europe'),
(105, ' Madagascar', '1', 'Africa'),
(106, ' Malawi', '1', 'Africa'),
(107, ' Malaysia', '2', 'Asia'),
(108, ' Maldives', '2', 'Asia'),
(109, ' Mali', '1', 'Africa'),
(110, ' Malta', '4', 'Europe'),
(111, ' Marshall Islands', '3', 'Australia'),
(112, ' Mauritania', '1', 'Africa'),
(113, ' Mauritius', '1', 'Africa'),
(114, ' Mexico', '5', 'North America'),
(115, ' Micronesia', '3', 'Australia'),
(116, ' Moldova', '4', 'Europe'),
(117, ' Monaco', '4', 'Europe'),
(118, ' Mongolia', '2', 'Asia'),
(119, ' Montenegro', '4', 'Europe'),
(120, ' Morocco', '1', 'Africa'),
(121, ' Mozambique', '1', 'Africa'),
(122, ' Namibia', '1', 'Africa'),
(123, ' Nauru', '3', 'Australia'),
(124, ' Nepal', '2', 'Asia'),
(125, ' Netherlands', '4', 'Europe'),
(126, ' New Zealand', '3', 'Australia'),
(127, ' Nicaragua', '5', 'North America'),
(128, ' Niger', '1', 'Africa'),
(129, ' Nigeria', '1', 'Africa'),
(130, ' Norway', '4', 'Europe'),
(131, ' Oman', '2', 'Asia'),
(132, ' Pakistan', '2', 'Asia'),
(133, ' Palau', '3', 'Australia'),
(134, ' Panama', '5', 'North America'),
(135, ' Papua New Guinea', '3', 'Australia'),
(136, ' Paraguay', '6', 'South America'),
(137, ' Peru', '6', 'South America'),
(138, ' Philippines', '2', 'Asia'),
(139, ' Poland', '4', 'Europe'),
(140, ' Portugal', '4', 'Europe'),
(141, ' Qatar', '2', 'Asia'),
(142, ' Romania', '4', 'Europe'),
(143, ' Russian Federation', '2', 'Asia'),
(144, ' Rwanda', '1', 'Africa'),
(145, ' Saint Kitts and Nevis', '5', 'North America'),
(146, ' Saint Lucia', '5', 'North America'),
(147, ' Saint Vincent and the Grenadines', '5', 'North America'),
(148, ' Samoa', '3', 'Australia'),
(149, ' San Marino', '4', 'Europe'),
(150, ' Sao Tome and Principe', '1', 'Africa'),
(151, ' Saudi Arabia', '2', 'Asia'),
(152, ' Senegal', '1', 'Africa'),
(153, ' Serbia', '4', 'Europe'),
(154, ' Seychelles', '1', 'Africa'),
(155, ' Sierra Leone', '1', 'Africa'),
(156, ' Singapore', '2', 'Asia'),
(157, ' Slovakia', '4', 'Europe'),
(158, ' Slovenia', '4', 'Europe'),
(159, ' Solomon Islands', '3', 'Australia'),
(160, ' Somalia', '1', 'Africa'),
(161, ' South Africa', '1', 'Africa'),
(162, ' South Sudan', '1', 'Africa'),
(163, ' Spain', '4', 'Europe'),
(164, ' Sri Lanka', '2', 'Asia'),
(165, ' Sudan', '1', 'Africa'),
(166, ' Suriname', '6', 'South America'),
(167, ' Swaziland', '1', 'Africa'),
(168, ' Sweden', '4', 'Europe'),
(169, ' Switzerland', '4', 'Europe'),
(170, ' Syria', '2', 'Asia'),
(171, ' Tajikistan', '2', 'Asia'),
(172, ' Tanzania', '1', 'Africa'),
(173, ' Thailand', '2', 'Asia'),
(174, ' Togo', '1', 'Africa'),
(175, ' Tonga', '3', 'Australia'),
(176, ' Trinidad and Tobago', '5', 'North America'),
(177, ' Tunisia', '1', 'Africa'),
(178, ' Turkey', '2', 'Asia'),
(179, ' Turkmenistan', '2', 'Asia'),
(180, ' Tuvalu', '3', 'Australia'),
(181, ' Uganda', '1', 'Africa'),
(182, ' Ukraine', '4', 'Europe'),
(183, ' United Arab Emirates', '2', 'Asia'),
(184, ' United Kingdom', '4', 'Europe'),
(185, ' United States', '5', 'North America'),
(186, ' Uruguay', '6', 'South America'),
(187, ' Uzbekistan', '2', 'Asia'),
(188, ' Vanuatu', '3', 'Australia'),
(189, ' Vatican City', '4', 'Europe'),
(190, ' Venezuela', '6', 'South America'),
(191, ' Vietnam', '2', 'Asia'),
(192, ' Yemen', '2', 'Asia'),
(193, ' Zambia', '1', 'Africa'),
(194, ' Zimbabwe', '1', 'Africa');

-- --------------------------------------------------------

--
-- Table structure for table `degree`
--

CREATE TABLE `degree` (
  `id` int(11) NOT NULL,
  `name` varchar(512) DEFAULT NULL,
  `type` varchar(512) DEFAULT NULL,
  `programme` varchar(512) DEFAULT NULL,
  `cgpa` int(11) DEFAULT NULL,
  `alumniId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `device`
--

CREATE TABLE `device` (
  `id` int(11) NOT NULL,
  `token` varchar(512) DEFAULT NULL,
  `platform` varchar(512) NOT NULL,
  `uuid` varchar(512) DEFAULT NULL,
  `playerId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `device`
--

INSERT INTO `device` (`id`, `token`, `platform`, `uuid`, `playerId`) VALUES
(1, NULL, 'Android', '08d72c0c102bf06a', 9),
(2, NULL, 'Android', '08d72c0c102bf06a', NULL),
(3, NULL, 'Android', '08d72c0c102bf06a', 12),
(4, NULL, 'Android', '08d72c0c102bf06a', 12),
(5, NULL, 'Android', '08d72c0c102bf06a', 12),
(6, NULL, 'Android', '08d72c0c102bf06a', 12),
(7, NULL, 'Android', '08d72c0c102bf06a', 12),
(8, NULL, 'Android', '08d72c0c102bf06a', 12),
(9, NULL, 'Android', '08d72c0c102bf06a', 12),
(10, NULL, 'Android', '08d72c0c102bf06a', 12),
(11, NULL, 'Android', '08d72c0c102bf06a', 12),
(12, NULL, 'Android', '08d72c0c102bf06a', 12),
(13, NULL, 'Android', '08d72c0c102bf06a', 12),
(14, NULL, 'Android', '08d72c0c102bf06a', 12),
(15, NULL, 'Android', '08d72c0c102bf06a', NULL),
(16, NULL, 'Android', '08d72c0c102bf06a', 12),
(17, NULL, 'Android', '08d72c0c102bf06a', 12),
(18, NULL, 'Android', '08d72c0c102bf06a', 12),
(19, NULL, 'Android', '08d72c0c102bf06a', 12),
(20, NULL, 'Android', '08d72c0c102bf06a', 1),
(21, NULL, 'Android', '08d72c0c102bf06a', 12),
(22, NULL, 'Android', '08d72c0c102bf06a', 12),
(23, NULL, 'Android', '08d72c0c102bf06a', 3),
(24, NULL, 'Android', '08d72c0c102bf06a', 4),
(25, NULL, 'Android', '08d72c0c102bf06a', NULL),
(26, NULL, 'Android', '08d72c0c102bf06a', 12),
(27, NULL, 'Android', '08d72c0c102bf06a', 12),
(28, NULL, 'Android', '08d72c0c102bf06a', 12),
(29, NULL, 'Android', '08d72c0c102bf06a', 12),
(30, NULL, 'Android', '08d72c0c102bf06a', 12),
(31, NULL, 'Android', '08d72c0c102bf06a', 12),
(32, NULL, 'Android', '08d72c0c102bf06a', 12),
(33, NULL, 'Android', '08d72c0c102bf06a', 12),
(34, NULL, 'Android', '08d72c0c102bf06a', 12),
(35, NULL, 'Android', '08d72c0c102bf06a', 12),
(36, NULL, 'Android', '08d72c0c102bf06a', 12),
(37, NULL, 'Android', '08d72c0c102bf06a', 12),
(38, NULL, 'Android', '08d72c0c102bf06a', 12),
(39, NULL, 'Android', '08d72c0c102bf06a', 12),
(40, NULL, 'Android', '08d72c0c102bf06a', 12),
(41, NULL, 'Android', '08d72c0c102bf06a', 12),
(42, NULL, 'Android', '08d72c0c102bf06a', 12),
(43, NULL, 'Android', '08d72c0c102bf06a', 12),
(44, NULL, 'Android', '08d72c0c102bf06a', 12),
(45, NULL, 'Android', '08d72c0c102bf06a', 12),
(46, NULL, 'Android', '08d72c0c102bf06a', NULL),
(47, NULL, 'Android', '08d72c0c102bf06a', 14),
(48, NULL, 'Android', '08d72c0c102bf06a', 14),
(49, NULL, 'Android', '08d72c0c102bf06a', 14),
(50, NULL, 'Android', '08d72c0c102bf06a', 14),
(51, NULL, 'Android', '08d72c0c102bf06a', 14),
(52, NULL, 'Android', '08d72c0c102bf06a', 14),
(53, NULL, 'Android', '08d72c0c102bf06a', 14),
(54, NULL, 'Android', '08d72c0c102bf06a', 14),
(55, NULL, 'Android', '08d72c0c102bf06a', 14),
(56, NULL, 'Android', '08d72c0c102bf06a', 14),
(57, NULL, 'Android', '08d72c0c102bf06a', 14),
(58, NULL, 'Android', '08d72c0c102bf06a', 14),
(59, NULL, 'Android', '08d72c0c102bf06a', 14),
(60, NULL, 'Android', '08d72c0c102bf06a', 14),
(61, NULL, 'Android', '08d72c0c102bf06a', NULL),
(62, NULL, 'Android', '08d72c0c102bf06a', 14),
(63, NULL, 'Android', '08d72c0c102bf06a', 14),
(64, NULL, 'Android', '08d72c0c102bf06a', 14),
(65, NULL, 'Android', '08d72c0c102bf06a', 14),
(66, NULL, 'Android', '08d72c0c102bf06a', 14),
(67, NULL, 'Android', '08d72c0c102bf06a', 14),
(68, NULL, 'Android', '08d72c0c102bf06a', 14),
(69, NULL, 'Android', '08d72c0c102bf06a', 14),
(70, NULL, 'Android', '08d72c0c102bf06a', 14),
(71, NULL, 'Android', '08d72c0c102bf06a', 14),
(72, NULL, 'Android', '08d72c0c102bf06a', 14),
(73, NULL, 'Android', '08d72c0c102bf06a', 14),
(74, NULL, 'Android', '08d72c0c102bf06a', 14),
(75, NULL, 'Android', '08d72c0c102bf06a', 14),
(76, NULL, 'Android', '08d72c0c102bf06a', 14),
(77, NULL, 'Android', '08d72c0c102bf06a', 14),
(78, NULL, 'Android', '08d72c0c102bf06a', 14),
(79, NULL, 'Android', '08d72c0c102bf06a', 14),
(80, NULL, 'Android', '08d72c0c102bf06a', 14),
(81, NULL, 'Android', '08d72c0c102bf06a', 14),
(82, NULL, 'Android', '08d72c0c102bf06a', 14),
(83, NULL, 'Android', '08d72c0c102bf06a', 14),
(84, NULL, 'Android', '08d72c0c102bf06a', NULL),
(85, NULL, 'Android', '08d72c0c102bf06a', 14),
(86, NULL, 'Android', '08d72c0c102bf06a', 14),
(87, NULL, 'Android', '08d72c0c102bf06a', 14),
(88, NULL, 'Android', '08d72c0c102bf06a', 14),
(89, NULL, 'Android', '08d72c0c102bf06a', 14),
(90, NULL, 'Android', 'a272754d3025ec32', 16),
(91, NULL, 'Android', 'a272754d3025ec32', 16),
(92, NULL, 'Android', 'a272754d3025ec32', NULL),
(93, NULL, 'Android', 'a272754d3025ec32', 9),
(94, NULL, 'Android', 'a272754d3025ec32', 14),
(95, NULL, 'Android', 'a272754d3025ec32', 14),
(96, NULL, 'Android', 'a272754d3025ec32', 14),
(97, NULL, 'Android', 'a272754d3025ec32', NULL),
(98, NULL, 'Android', 'a272754d3025ec32', 14),
(99, NULL, 'Android', 'a272754d3025ec32', 14),
(100, NULL, 'Android', 'a272754d3025ec32', 14),
(101, NULL, 'Android', '08d72c0c102bf06a', NULL),
(102, NULL, 'Android', '08d72c0c102bf06a', 14),
(103, NULL, 'Android', '08d72c0c102bf06a', 14),
(104, NULL, 'Android', '08d72c0c102bf06a', 14),
(105, NULL, 'Android', '08d72c0c102bf06a', 9),
(106, NULL, 'Android', '08d72c0c102bf06a', 14),
(107, NULL, 'Android', '08d72c0c102bf06a', 14),
(108, NULL, 'Android', '08d72c0c102bf06a', 14),
(109, NULL, 'Android', '08d72c0c102bf06a', 14),
(110, NULL, 'Android', 'a272754d3025ec32', 14),
(111, NULL, 'Android', '08d72c0c102bf06a', 14),
(112, NULL, 'Android', '08d72c0c102bf06a', 14),
(113, NULL, 'Android', '08d72c0c102bf06a', 14),
(114, NULL, 'Android', '08d72c0c102bf06a', 14),
(115, NULL, 'Android', '08d72c0c102bf06a', 14),
(116, NULL, 'Android', '08d72c0c102bf06a', 14),
(117, NULL, 'Android', '08d72c0c102bf06a', 14),
(118, NULL, 'Android', '08d72c0c102bf06a', 14),
(119, NULL, 'Android', '08d72c0c102bf06a', 14),
(120, NULL, 'Android', 'a272754d3025ec32', 14),
(121, NULL, 'Android', 'a272754d3025ec32', 14),
(122, NULL, 'Android', 'a272754d3025ec32', 14),
(123, NULL, 'Android', 'a272754d3025ec32', NULL),
(124, NULL, 'Android', 'a272754d3025ec32', NULL),
(125, NULL, 'Android', 'a272754d3025ec32', 14),
(126, NULL, 'Android', 'a272754d3025ec32', 14),
(127, NULL, 'Android', 'a272754d3025ec32', 14),
(128, NULL, 'Android', 'a272754d3025ec32', 14),
(129, NULL, 'Android', 'a272754d3025ec32', 14),
(130, NULL, 'Android', 'a272754d3025ec32', 14),
(131, NULL, 'Android', 'a272754d3025ec32', 14),
(132, NULL, 'Android', 'a272754d3025ec32', 14),
(133, NULL, 'Android', 'a272754d3025ec32', 14),
(134, NULL, 'Android', 'a272754d3025ec32', 14),
(135, NULL, 'Android', 'a272754d3025ec32', 14),
(136, NULL, 'Android', 'a272754d3025ec32', 14),
(137, NULL, 'Android', 'a272754d3025ec32', 14),
(138, NULL, 'Android', 'a272754d3025ec32', 14),
(139, NULL, 'Android', 'a272754d3025ec32', 14),
(140, NULL, 'Android', 'a272754d3025ec32', 14),
(141, NULL, 'Android', 'a272754d3025ec32', NULL),
(142, NULL, 'Android', 'a272754d3025ec32', 14),
(143, NULL, 'Android', 'a272754d3025ec32', 14),
(144, NULL, 'Android', 'a272754d3025ec32', 14),
(145, NULL, 'Android', 'a272754d3025ec32', 14),
(146, NULL, 'Android', 'a272754d3025ec32', 14),
(147, NULL, 'Android', '08d72c0c102bf06a', 14),
(148, NULL, 'Android', '08d72c0c102bf06a', NULL),
(149, NULL, 'Android', '08d72c0c102bf06a', 14),
(150, NULL, 'Android', '08d72c0c102bf06a', 14),
(151, NULL, 'Android', 'a272754d3025ec32', NULL),
(152, NULL, 'Android', 'a272754d3025ec32', NULL),
(153, NULL, 'Android', 'a272754d3025ec32', 14),
(154, NULL, 'Android', 'a272754d3025ec32', 14),
(155, NULL, 'Android', 'a272754d3025ec32', NULL),
(156, NULL, 'Android', 'a272754d3025ec32', 14),
(157, NULL, 'Android', 'a272754d3025ec32', 14),
(158, NULL, 'Android', 'a272754d3025ec32', 14),
(159, NULL, 'Android', 'a272754d3025ec32', 14),
(160, NULL, 'Android', 'a272754d3025ec32', 14),
(161, NULL, 'Android', 'a272754d3025ec32', 14),
(162, NULL, 'Android', 'a272754d3025ec32', 14),
(163, NULL, 'Android', 'a272754d3025ec32', 14),
(164, NULL, 'Android', 'a272754d3025ec32', 14),
(165, NULL, 'Android', 'a272754d3025ec32', 14),
(166, NULL, 'Android', '08d72c0c102bf06a', NULL),
(167, NULL, 'Android', '08d72c0c102bf06a', 14),
(168, NULL, 'Android', '08d72c0c102bf06a', 14),
(169, NULL, 'Android', '08d72c0c102bf06a', 14),
(170, NULL, 'Android', '8dcf6d1953fe5ae1', NULL),
(171, NULL, 'Android', '8dcf6d1953fe5ae1', 14),
(172, NULL, 'Android', '8dcf6d1953fe5ae1', 14),
(173, NULL, 'Android', '8dcf6d1953fe5ae1', 14),
(174, NULL, 'Android', '8dcf6d1953fe5ae1', 14),
(175, NULL, 'Android', '8dcf6d1953fe5ae1', NULL),
(176, NULL, 'Android', '8dcf6d1953fe5ae1', 14),
(177, NULL, 'Android', '8dcf6d1953fe5ae1', 14),
(178, NULL, 'Android', '8dcf6d1953fe5ae1', 14),
(179, NULL, 'Android', '8dcf6d1953fe5ae1', NULL),
(180, NULL, 'Android', '8dcf6d1953fe5ae1', 14),
(181, NULL, 'Android', '8dcf6d1953fe5ae1', 14);

-- --------------------------------------------------------

--
-- Table structure for table `devicetopicthrough`
--

CREATE TABLE `devicetopicthrough` (
  `id` int(11) NOT NULL,
  `deviceId` int(11) NOT NULL,
  `topicId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

CREATE TABLE `document` (
  `id` int(11) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `fileName` varchar(512) NOT NULL,
  `fileUrl` varchar(512) NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `type` int(11) NOT NULL,
  `schoolId` int(11) DEFAULT NULL,
  `title` varchar(512) NOT NULL,
  `author` varchar(512) DEFAULT NULL,
  `postId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `documentpost`
--

CREATE TABLE `documentpost` (
  `id` int(11) NOT NULL,
  `title` varchar(512) NOT NULL,
  `author` varchar(512) DEFAULT NULL,
  `postId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `eventphotos`
--

CREATE TABLE `eventphotos` (
  `id` int(11) NOT NULL,
  `churchID` varchar(200) NOT NULL,
  `eventID` varchar(200) NOT NULL,
  `photoID` varchar(200) NOT NULL,
  `created_at` varchar(200) NOT NULL,
  `updated_at` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eventphotos`
--

INSERT INTO `eventphotos` (`id`, `churchID`, `eventID`, `photoID`, `created_at`, `updated_at`) VALUES
(13, '22', '2', '81', '2020-08-24 17:09:24', '2020-08-24 17:09:24'),
(16, '22', '8', '106', '2020-10-05 02:22:18', '2020-10-05 02:22:18'),
(17, '22', '8', '107', '2020-10-05 02:24:26', '2020-10-05 02:24:26');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `eventID` int(11) NOT NULL,
  `churchID` varchar(200) NOT NULL,
  `title` varchar(200) NOT NULL,
  `note` text NOT NULL,
  `author` varchar(200) NOT NULL,
  `startTime` varchar(200) NOT NULL,
  `endTime` varchar(200) NOT NULL,
  `addressID` varchar(200) NOT NULL,
  `updated_at` varchar(200) NOT NULL,
  `created_at` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`eventID`, `churchID`, `title`, `note`, `author`, `startTime`, `endTime`, `addressID`, `updated_at`, `created_at`) VALUES
(8, '22', 'Second Phase of COVID-19 palliatives distribution chart', '<p>good</p>', 'kokori', '10/04/2020', '10/04/2020', '59', '2020-10-05 02:20:48', '2020-10-05 02:20:48');

-- --------------------------------------------------------

--
-- Table structure for table `followthrough`
--

CREATE TABLE `followthrough` (
  `id` int(11) NOT NULL,
  `leaderId` int(11) NOT NULL,
  `followerId` int(11) NOT NULL,
  `dateFollowed` datetime DEFAULT NULL,
  `lastModified` datetime DEFAULT NULL,
  `isFollowing` tinyint(1) DEFAULT NULL,
  `leaderModelName` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `followthrough`
--

INSERT INTO `followthrough` (`id`, `leaderId`, `followerId`, `dateFollowed`, `lastModified`, `isFollowing`, `leaderModelName`) VALUES
(1, 1, 1, '2020-12-03 09:12:54', '2020-12-09 16:02:33', 0, 'school'),
(2, 19, 1, '2020-12-03 09:14:26', '2020-12-09 16:03:18', 1, 'school'),
(3, 2, 1, '2020-12-09 09:01:20', '2020-12-09 21:21:25', 0, 'school'),
(4, 7, 1, '2020-12-09 16:07:44', '2020-12-09 16:42:31', 1, 'user'),
(5, 10, 1, '2020-12-09 16:27:06', '2020-12-09 16:34:07', 1, 'school'),
(6, 4, 1, '2020-12-09 16:41:26', '2020-12-09 16:42:01', 1, 'user'),
(7, 9, 1, '2020-12-09 16:56:31', '2020-12-09 22:59:15', 1, 'school'),
(8, 8, 10, '2020-12-15 20:17:43', '2020-12-15 20:17:42', 0, 'school'),
(9, 1, 12, '2020-12-18 12:10:23', '2020-12-18 12:13:41', 1, 'user'),
(10, 1, 14, '2020-12-30 09:37:44', '2020-12-30 09:42:06', 1, 'school'),
(11, 13, 14, '2021-01-08 11:26:35', '2022-11-16 02:39:23', 0, 'user'),
(12, 301, 9, '2021-01-09 08:34:26', '2021-01-09 08:34:26', 1, 'school'),
(13, 3, 14, '2022-11-16 03:00:48', '2022-11-16 03:00:48', 1, 'school'),
(14, 16, 14, '2022-11-16 03:30:29', '2022-11-16 03:30:29', 1, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `friendshipthrough`
--

CREATE TABLE `friendshipthrough` (
  `id` int(11) NOT NULL,
  `initiatorId` int(11) NOT NULL,
  `acceptorId` int(11) NOT NULL,
  `accepted` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateAccepted` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `likethrough`
--

CREATE TABLE `likethrough` (
  `id` int(11) NOT NULL,
  `rate` tinyint(1) NOT NULL,
  `initiatorId` int(11) NOT NULL,
  `receiverId` int(11) DEFAULT NULL,
  `receiverName` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `likethrough`
--

INSERT INTO `likethrough` (`id`, `rate`, `initiatorId`, `receiverId`, `receiverName`) VALUES
(4, 1, 1, 111, 'post'),
(5, 1, 1, 106, 'post'),
(6, 1, 1, 104, 'post'),
(7, 1, 1, 102, 'post'),
(8, 1, 1, 101, 'post'),
(9, 1, 1, 110, 'post'),
(10, 0, 1, 96, 'post'),
(11, 0, 1, 96, 'post'),
(12, 1, 1, 96, 'post'),
(13, 0, 1, 96, 'post'),
(14, 1, 1, 96, 'post'),
(15, 0, 1, 96, 'post'),
(16, 1, 1, 96, 'post'),
(17, 0, 1, 96, 'post'),
(18, 1, 1, 96, 'post'),
(19, 0, 1, 96, 'post'),
(20, 1, 1, 96, 'post'),
(21, 0, 1, 96, 'post'),
(22, 1, 1, 96, 'post'),
(23, 0, 1, 96, 'post'),
(24, 1, 1, 96, 'post'),
(25, 0, 1, 96, 'post'),
(26, 1, 1, 96, 'post'),
(27, 0, 1, 96, 'post'),
(28, 0, 1, 109, 'post'),
(29, 0, 1, 109, 'post'),
(30, 1, 1, 109, 'post'),
(31, 1, 1, 98, 'post'),
(32, 1, 1, 92, 'post'),
(33, 1, 1, 87, 'post'),
(34, 0, 1, 85, 'post'),
(35, 0, 1, 107, 'post'),
(36, 1, 1, 70, 'post'),
(37, 1, 1, 65, 'post'),
(38, 1, 1, 88, 'post'),
(39, 1, 1, 86, 'post'),
(40, 1, 1, 84, 'post'),
(41, 1, 7, 33, 'post'),
(42, 1, 7, 1, 'post'),
(43, 1, 1, 90, 'post'),
(44, 1, 1, 99, 'post'),
(45, 1, 1, 103, 'post'),
(46, 1, 1, 108, 'post'),
(47, 1, 12, 113, 'post'),
(48, 1, 1, 105, 'post'),
(49, 1, 1, 100, 'post'),
(50, 1, 1, 95, 'post'),
(56, 1, 1, 110, 'post'),
(60, 1, 10, 116, 'post'),
(61, 1, 12, 116, 'post'),
(62, 1, 8, 116, 'post'),
(63, 1, 11, 116, 'post'),
(64, 1, 14, 130, 'post'),
(65, 1, 14, 131, 'post'),
(66, 1, 14, 1, 'post'),
(67, 1, 14, 2, 'post'),
(68, 1, 14, 196, 'post');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `fileName` varchar(512) NOT NULL,
  `fileUrl` varchar(512) NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `mediapost`
--

CREATE TABLE `mediapost` (
  `id` int(11) NOT NULL,
  `mediaType` int(11) NOT NULL,
  `sourceUrl` varchar(512) NOT NULL,
  `coverUrl` varchar(512) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `postId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `messagepost`
--

CREATE TABLE `messagepost` (
  `id` int(11) NOT NULL,
  `title` varchar(512) DEFAULT NULL,
  `message` varchar(512) NOT NULL,
  `postId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `subject` varchar(512) DEFAULT NULL,
  `body` varchar(512) NOT NULL,
  `receiver` text NOT NULL,
  `type` int(11) NOT NULL,
  `options` text DEFAULT NULL,
  `sentDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password`
--

CREATE TABLE `password` (
  `id` int(11) NOT NULL,
  `hash` varchar(512) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateModified` datetime NOT NULL,
  `modifiedBy` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `password`
--

INSERT INTO `password` (`id`, `hash`, `dateCreated`, `dateModified`, `modifiedBy`, `userId`) VALUES
(1, '$2a$10$THm6YzA0IwJy9ewDOmJ7geQ5YOD/E/paKGowCQUizGENeLDf4AiN6', '2020-12-24 00:00:00', '2020-12-24 00:00:00', 13, 13),
(2, '$2a$10$fgdNVZZUbe6PP7Ko8v1wXeX.x9E7cwNKpPYg6i4oF2PB.vbeTvE66', '2020-12-24 00:00:00', '2020-12-24 00:00:00', 14, 14),
(3, '$2a$10$XQYpeycjz7sku/i41UyODuT0JARLZnHI/AMQl7C1KLO3Xy/IltBki', '2020-12-24 00:00:00', '2020-12-24 00:00:00', 15, 15),
(4, '$2a$10$W1zzCMNbYtna9w2BtUOj7ORcbZhSJNOcEIcMnI2ApxhqLttxE7buy', '2021-01-14 00:00:00', '2021-01-14 00:00:00', 16, 16);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('robinsonagaga@gmail.com', '$2y$10$WfrAt0Fzd2EHpuvfN9u9.eNGjA/OmMLgg04XaQ3tZGCzjPo3E6M56', '2020-08-28 05:48:27');

-- --------------------------------------------------------

--
-- Table structure for table `pastors`
--

CREATE TABLE `pastors` (
  `pastorID` int(10) UNSIGNED NOT NULL,
  `churchID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pastorRight` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pastors`
--

INSERT INTO `pastors` (`pastorID`, `churchID`, `userID`, `pastorRight`, `remember_token`, `created_at`, `updated_at`) VALUES
(16, '22', '32', '2', NULL, '2020-08-25 01:24:48', '2020-08-25 01:24:48'),
(15, '22', '30', '1', NULL, '2020-08-24 07:23:15', '2020-08-24 07:23:15');

-- --------------------------------------------------------

--
-- Table structure for table `photo`
--

CREATE TABLE `photo` (
  `id` int(11) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `fileName` varchar(512) NOT NULL,
  `fileUrl` varchar(512) NOT NULL,
  `thumbnailUrl` varchar(512) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `type` int(11) NOT NULL,
  `schoolId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `coverImage` tinyint(1) DEFAULT NULL,
  `profile` tinyint(1) DEFAULT NULL,
  `flag` tinyint(1) DEFAULT NULL,
  `legend` varchar(512) DEFAULT NULL,
  `mimeType` varchar(512) DEFAULT NULL,
  `postId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `photo`
--

INSERT INTO `photo` (`id`, `description`, `fileName`, `fileUrl`, `thumbnailUrl`, `dateCreated`, `type`, `schoolId`, `userId`, `coverImage`, `profile`, `flag`, `legend`, `mimeType`, `postId`) VALUES
(1, '', 'tmp_IMG_20201103_2346104377081962031083043.jpg', '/media/download/tmp_IMG_20201103_2346104377081962031083043.jpg', '/media/download/thumb_tmp_IMG_20201103_2346104377081962031083043.jpg', '2020-11-08 09:00:07', 0, NULL, 1, 0, 0, 0, NULL, NULL, 48),
(2, '', 'tmp_IMG_20201103_2346104377081962031083043.jpg', '/media/download/tmp_IMG_20201103_2346104377081962031083043.jpg', '/media/download/thumb_tmp_IMG_20201103_2346104377081962031083043.jpg', '2020-11-08 09:00:07', 0, NULL, 1, 0, 0, 0, NULL, NULL, 49),
(3, '', 'tmp_IMG_20201103_2346052903222542216191928.jpg', '/media/download/tmp_IMG_20201103_2346052903222542216191928.jpg', '/media/download/thumb_tmp_IMG_20201103_2346052903222542216191928.jpg', '2020-11-08 09:01:33', 0, NULL, 1, 0, 0, 0, NULL, NULL, 48),
(4, '', 'tmp_IMG_20201103_2346052903222542216191928.jpg', '/media/download/tmp_IMG_20201103_2346052903222542216191928.jpg', '/media/download/thumb_tmp_IMG_20201103_2346052903222542216191928.jpg', '2020-11-08 09:01:33', 0, NULL, 1, 0, 0, 0, NULL, NULL, 50),
(5, '', 'tmp_IMG_20201103_2346052903222542216191928.jpg', '/media/download/tmp_IMG_20201103_2346052903222542216191928.jpg', '/media/download/thumb_tmp_IMG_20201103_2346052903222542216191928.jpg', '2020-11-08 09:01:33', 0, NULL, 1, 0, 0, 0, NULL, NULL, 50),
(6, '', 'tmp_IMG_20201103_2346055364863126268259533.jpg', '/media/download/tmp_IMG_20201103_2346055364863126268259533.jpg', '/media/download/thumb_tmp_IMG_20201103_2346055364863126268259533.jpg', '2020-11-08 09:04:37', 0, NULL, 1, 0, 0, 0, NULL, NULL, 48),
(7, '', 'tmp_IMG_20201103_2346055364863126268259533.jpg', '/media/download/tmp_IMG_20201103_2346055364863126268259533.jpg', '/media/download/thumb_tmp_IMG_20201103_2346055364863126268259533.jpg', '2020-11-08 09:04:37', 0, NULL, 1, 0, 0, 0, NULL, NULL, 51),
(8, '', 'tmp_IMG_20201103_2346055364863126268259533.jpg', '/media/download/tmp_IMG_20201103_2346055364863126268259533.jpg', '/media/download/thumb_tmp_IMG_20201103_2346055364863126268259533.jpg', '2020-11-08 09:04:37', 0, NULL, 1, 0, 0, 0, NULL, NULL, 51),
(9, '', 'tmp_IMG_20201103_2346055364863126268259533.jpg', '/media/download/tmp_IMG_20201103_2346055364863126268259533.jpg', '/media/download/thumb_tmp_IMG_20201103_2346055364863126268259533.jpg', '2020-11-08 09:04:37', 0, NULL, 1, 0, 0, 0, NULL, NULL, 51),
(10, '', 'tmp_IMG_20201103_2346103397152134324189962.jpg', '/media/download/tmp_IMG_20201103_2346103397152134324189962.jpg', '/media/download/thumb_tmp_IMG_20201103_2346103397152134324189962.jpg', '2020-11-08 16:08:57', 0, NULL, 1, 0, 0, 0, NULL, NULL, 56),
(11, '', 'tmp_IMG_20201103_234557911656769779110025.jpg', '/media/download/tmp_IMG_20201103_234557911656769779110025.jpg', '/media/download/thumb_tmp_IMG_20201103_234557911656769779110025.jpg', '2020-11-08 16:10:22', 0, NULL, 1, 0, 0, 0, NULL, NULL, 57),
(12, '', 'tmp_IMG_20201109_044216_66933386548813809956.jpg', '/media/download/tmp_IMG_20201109_044216_66933386548813809956.jpg', '/media/download/thumb_tmp_IMG_20201109_044216_66933386548813809956.jpg', '2020-11-09 04:46:26', 0, NULL, 1, 0, 0, 0, NULL, NULL, 58),
(13, '', '1605080601901.jpg', '/media/download/1605080601901.jpg', '/media/download/thumb_1605080601901.jpg', '2020-11-11 07:43:23', 0, NULL, 1, 0, 0, 0, NULL, NULL, 73),
(14, '', '1_1605116906354.jpg', '/media/download/1_1605116906354.jpg', '/media/download/thumb_1_1605116906354.jpg', '2020-11-11 17:48:31', 0, NULL, 1, 0, 0, 0, NULL, NULL, 82),
(15, '', '1_1606034310987.jpg', '/media/download/1_1606034310987.jpg', '/media/download/thumb_1_1606034310987.jpg', '2020-11-22 08:38:34', 0, NULL, 1, 0, 0, 0, NULL, NULL, 86),
(16, '', '1_1606051900088.jpg', '/media/download/1_1606051900088.jpg', '/media/download/thumb_1_1606051900088.jpg', '2020-11-22 13:31:41', 0, NULL, 1, 0, 0, 0, NULL, NULL, 91),
(17, '', '9_1608589569349.jpg', '/media/download/9_1608589569349.jpg', '/media/download/thumb_9_1608589569349.jpg', '2020-12-21 22:26:10', 0, NULL, 12, 0, 0, 0, NULL, NULL, NULL),
(18, '', '9_1608589751329.jpg', '/media/download/9_1608589751329.jpg', '/media/download/thumb_9_1608589751329.jpg', '2020-12-21 22:29:13', 0, NULL, 12, 0, 0, 0, '', '', NULL),
(19, '', '12_1608591295579.jpg', '/media/download/12_1608591295579.jpg', '/media/download/thumb_12_1608591295579.jpg', '2020-12-21 22:54:57', 0, NULL, 12, 0, 1, 0, '', '', NULL),
(20, '', '12_1608591517169.jpg', '/media/download/12_1608591517169.jpg', '/media/download/thumb_12_1608591517169.jpg', '2020-12-21 22:58:38', 0, NULL, 12, 0, 0, 0, '', '', NULL),
(27, '', '14_1610074471408.jpg', '/media/download/14_1610074471408.jpg', '/media/download/thumb_14_1610074471408.jpg', '2021-01-08 02:54:32', 0, NULL, 14, 0, 0, 0, NULL, NULL, 127),
(28, '', '14_1610074704610.jpg', '/media/download/14_1610074704610.jpg', '/media/download/thumb_14_1610074704610.jpg', '2021-01-08 02:58:25', 0, NULL, 14, 0, 0, 0, NULL, NULL, 128),
(29, '', '14_1610074742585.jpg', '/media/download/14_1610074742585.jpg', '/media/download/thumb_14_1610074742585.jpg', '2021-01-08 02:59:03', 0, NULL, 14, 0, 0, 0, NULL, NULL, 129),
(30, '', '14_1610074742581.png', '/media/download/14_1610074742581.png', '/media/download/thumb_14_1610074742581.png', '2021-01-08 02:59:03', 0, NULL, 14, 0, 0, 0, NULL, NULL, 129),
(31, '', 'JPEG_20210108_030236_2524350622747851314.jpg', '/media/download/JPEG_20210108_030236_2524350622747851314.jpg', '/media/download/thumb_JPEG_20210108_030236_2524350622747851314.jpg', '2021-01-08 03:02:45', 0, NULL, 14, 0, 1, 0, NULL, NULL, NULL),
(32, '', '(48)557_2_53_7_6_0_2021.jpg', 'http://localhost:3001/media/download/(48)557_2_53_7_6_0_2021.jpg', 'http://localhost:3001/media/download/thumb_(48)557_2_53_7_6_0_2021.jpg', '2021-01-09 07:53:02', 0, 4, NULL, 0, 0, 0, NULL, NULL, NULL),
(33, '', '1 50b (212)564_2_53_7_6_0_2021.jpg', 'http://localhost:3001/media/download/1 50b (212)564_2_53_7_6_0_2021.jpg', 'http://localhost:3001/media/download/thumb_1 50b (212)564_2_53_7_6_0_2021.jpg', '2021-01-09 07:53:02', 0, 4, NULL, 0, 0, 0, NULL, NULL, NULL),
(34, '', '(47)554_2_53_7_6_0_2021.jpg', 'http://localhost:3001/media/download/(47)554_2_53_7_6_0_2021.jpg', 'http://localhost:3001/media/download/thumb_(47)554_2_53_7_6_0_2021.jpg', '2021-01-09 07:53:02', 0, 4, NULL, 0, 0, 0, NULL, NULL, NULL),
(35, '', '0001560_2_53_7_6_0_2021.jpg', 'http://localhost:3001/media/download/0001560_2_53_7_6_0_2021.jpg', 'http://localhost:3001/media/download/thumb_0001560_2_53_7_6_0_2021.jpg', '2021-01-09 07:53:02', 0, 4, NULL, 0, 0, 0, NULL, NULL, NULL),
(36, '', '0003568_2_53_7_6_0_2021.jpg', 'http://localhost:3001/media/download/0003568_2_53_7_6_0_2021.jpg', 'http://localhost:3001/media/download/thumb_0003568_2_53_7_6_0_2021.jpg', '2021-01-09 07:53:02', 0, 4, NULL, 0, 0, 0, NULL, NULL, NULL),
(37, '', '(46)549_2_53_7_6_0_2021.jpg', 'http://localhost:3001/media/download/(46)549_2_53_7_6_0_2021.jpg', 'http://localhost:3001/media/download/thumb_(46)549_2_53_7_6_0_2021.jpg', '2021-01-09 07:53:02', 0, 4, NULL, 0, 0, 0, NULL, NULL, NULL),
(38, '', '004571_2_53_7_6_0_2021.jpg', 'http://localhost:3001/media/download/004571_2_53_7_6_0_2021.jpg', 'http://localhost:3001/media/download/thumb_004571_2_53_7_6_0_2021.jpg', '2021-01-09 07:53:05', 0, 4, NULL, 0, 0, 0, NULL, NULL, NULL),
(39, '', '4575_2_53_7_6_0_2021.jpg', 'http://localhost:3001/media/download/4575_2_53_7_6_0_2021.jpg', 'http://localhost:3001/media/download/thumb_4575_2_53_7_6_0_2021.jpg', '2021-01-09 07:53:05', 0, 4, NULL, 0, 0, 0, NULL, NULL, NULL),
(43, '', 'ACOPROM1465_11_4_9_5_0_2021.jpg', '/media/download/ACOPROM1465_11_4_9_5_0_2021.jpg', '/media/download/thumb_ACOPROM1465_11_4_9_5_0_2021.jpg', '2021-01-22 09:04:11', 0, 1, NULL, 0, 0, 0, NULL, NULL, NULL),
(44, '', 'ACF69463_11_4_9_5_0_2021.jpg', '/media/download/ACF69463_11_4_9_5_0_2021.jpg', '/media/download/thumb_ACF69463_11_4_9_5_0_2021.jpg', '2021-01-22 09:04:11', 0, 1, NULL, 0, 1, 0, NULL, NULL, NULL),
(45, '', 'ACF96E466_11_4_9_5_0_2021.jpg', '/media/download/ACF96E466_11_4_9_5_0_2021.jpg', '/media/download/thumb_ACF96E466_11_4_9_5_0_2021.jpg', '2021-01-22 09:04:11', 0, 1, NULL, 0, 0, 0, NULL, NULL, NULL),
(46, '', '1562703726165280_35_11_9_5_0_2021.jpg', '/media/download/1562703726165280_35_11_9_5_0_2021.jpg', '/media/download/thumb_1562703726165280_35_11_9_5_0_2021.jpg', '2021-01-22 09:11:35', 0, 2, NULL, 0, 0, 0, NULL, NULL, NULL),
(47, '', 'A-Bugs-Life284_35_11_9_5_0_2021.jpg', '/media/download/A-Bugs-Life284_35_11_9_5_0_2021.jpg', '/media/download/thumb_A-Bugs-Life284_35_11_9_5_0_2021.jpg', '2021-01-22 09:11:35', 0, 2, NULL, 0, 0, 0, NULL, NULL, NULL),
(48, '', 'anuc3429_11_59_9_5_0_2021.jpeg', '/media/download/anuc3429_11_59_9_5_0_2021.jpeg', '/media/download/thumb_anuc3429_11_59_9_5_0_2021.jpeg', '2021-01-22 09:59:11', 0, 301, NULL, 0, 1, 0, NULL, NULL, NULL),
(49, '', 'anuc2432_11_59_9_5_0_2021.jpeg', '/media/download/anuc2432_11_59_9_5_0_2021.jpeg', '/media/download/thumb_anuc2432_11_59_9_5_0_2021.jpeg', '2021-01-22 09:59:11', 0, 301, NULL, 1, 0, 0, NULL, NULL, NULL),
(50, '', 'anuc1436_11_59_9_5_0_2021.jpeg', '/media/download/anuc1436_11_59_9_5_0_2021.jpeg', '/media/download/thumb_anuc1436_11_59_9_5_0_2021.jpeg', '2021-01-22 09:59:11', 0, 301, NULL, 0, 0, 0, NULL, NULL, NULL),
(51, '', '14_1612605444846.jpg', '/media/download/14_1612605444846.jpg', '/media/download/thumb_14_1612605444846.jpg', '2021-02-06 09:57:24', 0, NULL, 14, 0, 0, 0, NULL, NULL, 195),
(52, '', 'undefined_1668568051819.jpg', '/media/download/undefined_1668568051819.jpg', '/media/download/thumb_undefined_1668568051819.jpg', '2022-11-16 03:07:32', 0, NULL, 14, 0, 0, 0, NULL, NULL, 197);

-- --------------------------------------------------------

--
-- Table structure for table `photopost`
--

CREATE TABLE `photopost` (
  `id` int(11) NOT NULL,
  `legend` varchar(512) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `postId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `photoID` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `caption` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`photoID`, `type`, `title`, `caption`, `url`, `created_at`, `updated_at`) VALUES
(49, '2', 'INDEX CASE: GOV DIRI ORDERS ONE-WEEK STAY-AT-HOME IN BAYELSA', '<p>good</p>', '/churchPhoto/1597171502524whatsapp image 2020-08-04 at 8.04.51 am.jpeg', '2020-08-12 01:45:02', '2020-08-12 01:45:02'),
(48, '2', 'We build the future leaders', '<p>good</p>', '/churchPhoto/1597171431943whatsapp image 2020-08-04 at 3.14.53 am.jpeg', '2020-08-12 01:43:51', '2020-08-12 01:43:51'),
(46, '1', 'profile photo', 'profile photo', '/profilePhoto/1597090727550204-2043209_african-american-female-engineer-hd-png-download.png', '2020-08-11 03:18:47', '2020-08-11 03:18:47'),
(45, '4', 'We build the future leaders', 'cover photo', '/photos/15970906265503.fw.png', '2020-08-11 03:17:06', '2020-08-11 03:17:06'),
(42, '4', 'fear of fear', 'cover photo', '/photos/15970722898833.fw.png', '2020-08-10 22:11:29', '2020-08-10 22:11:29'),
(43, '4', 'fear of fear', 'cover photo', '/photos/15970723355623.fw.png', '2020-08-10 22:12:15', '2020-08-10 22:12:15'),
(44, '4', 'fear of fear', 'cover photo', '/photos/1597090349441210-2105159_african-american-engineer-png-transparent-png.png', '2020-08-11 03:12:29', '2020-08-11 03:12:29'),
(40, '4', 'God works in a mysterious way -Pt2', 'cover photo', '/photos/159702935831116 brigade.jpg', '2020-08-10 10:15:58', '2020-08-10 10:15:58'),
(41, '4', 'Make a joyous sound', 'cover photo', '/photos/1597029963234204-2043209_african-american-female-engineer-hd-png-download.png', '2020-08-10 10:26:03', '2020-08-10 10:26:03'),
(32, '1', 'profile photo', 'profile photo', 'http://127.0.0.1:8000/profilePhoto/1598296311879cough.png', '2020-08-08 04:06:39', '2020-08-08 04:06:39'),
(62, '4', 'fear of fear', 'cover photo', 'http://127.0.0.1:8000/photos/159769940011716 brigade.jpg', '2020-08-18 04:23:20', '2020-08-18 04:23:20'),
(63, '4', 'We build the future leaders great job', 'cover photo', 'http://127.0.0.1:8000/photos/15977015609074.fw.png', '2020-08-18 04:59:20', '2020-08-18 04:59:20'),
(64, '4', 'We build the future leaders', 'cover photo', 'http://127.0.0.1:8000/photos/159770175676638af7493-baf1-4565-8958-ac0f891903e9.jpg', '2020-08-18 05:02:36', '2020-08-18 05:02:36'),
(65, '4', 'fear of fear', 'cover photo', 'http://127.0.0.1:8000/photos/159770330550616 brigade.jpg', '2020-08-18 05:28:25', '2020-08-18 05:28:25'),
(66, '8', 'fear of fear', '<p>good</p>', 'http://127.0.0.1:8000/eventPhoto/1597836802693aga.png', '2020-08-19 18:33:22', '2020-08-19 18:33:22'),
(67, '8', 'fear of fear', '<p>good</p>', 'http://127.0.0.1:8000/eventPhoto/1597836841918aga.png', '2020-08-19 18:34:01', '2020-08-19 18:34:01'),
(82, '1', 'profile photo', 'profile photo', 'http://127.0.0.1:8000/profilePhoto/1598313208965skin fasting is basically a vacation for your skin.jpg', '2020-08-25 06:53:28', '2020-08-25 06:53:28'),
(57, '1', 'profile photo', 'profile photo', 'http://127.0.0.1:8000/profilePhoto/1598226192437abortions clinic in johannesburg u can order… (1).jpg', '2020-08-14 07:51:05', '2020-08-14 07:51:05'),
(54, '2', 'INDEX CASE: GOV DIRI ORDERS ONE-WEEK STAY-AT-HOME IN BAYELSA', '<p>good</p>', '/churchPhoto/159717890258820200216_133244.jpg', '2020-08-12 03:48:22', '2020-08-12 03:48:22'),
(103, '4', 'We build the future leaders', 'cover photo', '/photos/1599250776359whatsapp image 2020-09-03 at 4.36.40 pm.jpeg', '2020-09-05 03:19:36', '2020-09-05 03:19:36'),
(96, '2', 'fear of fear', '<p>good</p>', 'http://127.0.0.1:8000/churchPhoto/1598501606362melissa-jeanty-ks4rtbgq_64-unsplash.jpg', '2020-08-27 11:13:26', '2020-08-27 11:13:26'),
(60, '1', 'profile photo', 'profile photo', 'http://127.0.0.1:8000/profilePhoto/1597513261708abortions clinic in johannesburg u can order….jpg', '2020-08-16 00:41:01', '2020-08-16 00:41:01'),
(88, '4', 'fear of fear', 'cover photo', 'http://127.0.0.1:8000/photos/1598397055399whatsapp image 2020-06-04 at 5.18.23 am.jpeg', '2020-08-26 06:10:55', '2020-08-26 06:10:55'),
(89, '4', 'We build the future leaders', 'cover photo', '/photos/15983971537984.fw.png', '2020-08-26 06:12:33', '2020-08-26 06:12:33'),
(90, '5', 'We build the future leaders', 'good', 'http://127.0.0.1:8000/photos/1598465428784our environment our life 2.jpg', '2020-08-27 01:10:29', '2020-08-27 01:10:29'),
(97, '2', 'We build the future leaders', '<p>We build the future leadersWe build the future leadersWe build the future leadersWe build the future leadersWe build the future leaders&nbsp;</p>', 'http://127.0.0.1:8000/churchPhoto/1598501680516national-cancer-institute-l8twzt4ccvq-unsplash.jpg', '2020-08-27 11:14:40', '2020-08-27 11:14:40'),
(81, '8', 'INDEX CASE: GOV DIRI ORDERS ONE-WEEK STAY-AT-HOME IN BAYELSA', '<p>good</p>', 'http://127.0.0.1:8000/eventPhoto/1598288964677anaya-katlego-cxkk4zu7ane-unsplash.jpg', '2020-08-25 00:09:24', '2020-08-25 00:09:24'),
(83, '5', 'fear of fear', 'good', 'http://127.0.0.1:8000/photos/1598380392429exercise.png', '2020-08-26 01:33:12', '2020-08-26 01:33:12'),
(84, '5', 'fear of fear', 'good', 'http://127.0.0.1:8000/photos/1598380456115exercise.png', '2020-08-26 01:34:16', '2020-08-26 01:34:16'),
(100, '4', 'Second Phase of COVID-19 palliatives distribution chart', 'cover photo', 'http://127.0.0.1:8000/photos/1598625170145whatsapp image 2020-08-27 at 5.46.49 am.jpeg', '2020-08-28 21:32:50', '2020-08-28 21:32:50'),
(101, '4', 'fear of fear', 'cover photo', 'http://127.0.0.1:8000/photos/15989529611883.fw.png', '2020-09-01 16:36:01', '2020-09-01 16:36:01'),
(102, '4', 'fear of fear', 'cover photo', 'http://127.0.0.1:8000/photos/15989552104844.fw.png', '2020-09-01 17:13:30', '2020-09-01 17:13:30'),
(104, '4', 'Second Phase of COVID-19 palliatives distribution chart Second Phase of COVID-19 palliatives distribution chart Second Phase of COVID-19 palliatives distribution chart', 'cover photo', '/photos/1599797645992backup_of_backup_of_bayelsa wokeni.jpg', '2020-09-11 11:14:05', '2020-09-11 11:14:05'),
(105, '4', 'INDEX CASE: GOV DIRI ORDERS ONE-WEEK STAY-AT-HOME IN BAYELSA  INDEX CASE: GOV DIRI ORDERS ONE-WEEK STAY-AT-HOME IN BAYELSA  INDEX CASE: GOV DIRI ORDERS ONE-WEEK STAY-AT-HOME IN BAYELSA', 'cover photo', '/photos/15997979693093.fw.png', '2020-09-11 11:19:29', '2020-09-11 11:19:29'),
(106, '8', 'We build the future leaders', '<p>good</p>', 'http://127.0.0.1:8000/eventPhoto/1601864538189nigeria60.png', '2020-10-05 09:22:18', '2020-10-05 09:22:18'),
(107, '8', 'We build the future leaders', '<p>good</p>', 'http://127.0.0.1:8000/eventPhoto/1601864666715wysd2.png', '2020-10-05 09:24:26', '2020-10-05 09:24:26');

-- --------------------------------------------------------

--
-- Table structure for table `phototype`
--

CREATE TABLE `phototype` (
  `typeID` int(10) UNSIGNED NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `phototype`
--

INSERT INTO `phototype` (`typeID`, `photo`, `type`, `created_at`, `updated_at`) VALUES
(1, 'USER_PHOTO', '1', NULL, NULL),
(2, 'CHURCH_PHOTO', '2', NULL, NULL),
(3, 'VIDEO_COVER', '3', NULL, NULL),
(4, 'AUDIO_COVER', '4', NULL, NULL),
(5, 'BOOK_COVER', '5', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `title` varchar(512) DEFAULT NULL,
  `message` varchar(512) NOT NULL,
  `schoolId` int(11) DEFAULT NULL,
  `photoId` int(11) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `shareCount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `userId`, `title`, `message`, `schoolId`, `photoId`, `dateCreated`, `shareCount`) VALUES
(1, 7, NULL, 'dafsdfasdf', NULL, NULL, NULL, NULL),
(2, 1, NULL, 'test', NULL, NULL, NULL, NULL),
(3, 7, NULL, 'sfdafsd asdfdsf', NULL, NULL, NULL, NULL),
(4, 7, NULL, 'sfdafsd asdfdsf', NULL, NULL, NULL, NULL),
(5, 7, NULL, 'sfdafsd asdfdsf', NULL, NULL, NULL, NULL),
(6, 7, NULL, 'sfdafsd asdfdsf', NULL, NULL, NULL, NULL),
(7, 7, NULL, 'sfdafsd asdfdsf', NULL, NULL, NULL, NULL),
(8, 7, NULL, 'sfdafsd asdfdsf', NULL, NULL, NULL, NULL),
(9, 7, NULL, 'sfdafsd asdfdsf', NULL, NULL, NULL, NULL),
(10, 7, NULL, 'sfdafsd asdfdsf', NULL, NULL, NULL, NULL),
(11, 7, NULL, 'sfdafsd asdfdsf', NULL, NULL, NULL, NULL),
(12, 7, NULL, 'sfdafsd asdfdsf', NULL, NULL, NULL, NULL),
(13, 7, NULL, 'sfdafsd asdfdsf', NULL, NULL, NULL, NULL),
(14, 7, NULL, 'sfdafsd asdfdsf', NULL, NULL, NULL, NULL),
(15, 7, NULL, 'sfdafsd asdfdsf', NULL, NULL, NULL, NULL),
(16, 7, NULL, 'sfdafsd asdfdsf', NULL, NULL, NULL, NULL),
(17, 7, NULL, 'sfdafsd asdfdsf', NULL, NULL, NULL, NULL),
(18, 7, NULL, 'sfdafsd asdfdsf', NULL, NULL, NULL, NULL),
(19, 7, NULL, 'sfdafsd asdfdsf', NULL, NULL, NULL, NULL),
(20, 7, NULL, 'sfdafsd asdfdsf', NULL, NULL, NULL, NULL),
(21, 7, NULL, 'sfdafsd asdfdsf', NULL, NULL, NULL, NULL),
(22, 7, NULL, 'dfasdfasdfasd dsafdasf', NULL, NULL, NULL, NULL),
(23, 7, NULL, 'dfasdfasdfasd dsafdasf', NULL, NULL, NULL, NULL),
(24, 7, NULL, 'fdsa dasf dfaf', NULL, NULL, NULL, NULL),
(25, 7, NULL, 'afdafd dasfd', NULL, NULL, NULL, NULL),
(26, 7, NULL, 'sdsadfas dfaf da fdf ad', NULL, NULL, NULL, NULL),
(27, 7, NULL, 'dasfdfasd', NULL, NULL, NULL, NULL),
(28, 7, NULL, 'xzdf', NULL, NULL, NULL, NULL),
(29, 7, NULL, 'fdafdsfdsfs', NULL, NULL, NULL, NULL),
(30, 7, NULL, 'sgsfgfsgdfgsdfg', NULL, NULL, NULL, NULL),
(31, 7, NULL, 'dfgsdfgfds', NULL, NULL, NULL, NULL),
(32, 7, NULL, 'sdfsdafdasfd', NULL, NULL, NULL, NULL),
(33, 7, NULL, 'dsafdfad', NULL, NULL, NULL, NULL),
(34, 7, NULL, 'vbfsfds', NULL, NULL, NULL, NULL),
(35, 7, NULL, 'gdfhdfhhd', NULL, NULL, NULL, NULL),
(36, 1, NULL, 'fdf dfa', NULL, NULL, NULL, NULL),
(37, 1, NULL, 'dad\'s sad asd', NULL, NULL, NULL, NULL),
(38, 1, NULL, 'thanks again for your time', NULL, NULL, NULL, NULL),
(39, 1, NULL, 'dffgfg fsgfg fd', NULL, NULL, NULL, NULL),
(40, 1, NULL, 'dffgfg fdgsfgfgsdfgfd fsd ', NULL, NULL, NULL, NULL),
(41, 1, NULL, 'for your help in this', NULL, NULL, NULL, NULL),
(42, 7, NULL, 'jfghjh\n', NULL, NULL, NULL, NULL),
(43, 1, NULL, 'hfjhgfjghj\n', NULL, NULL, NULL, NULL),
(44, 1, NULL, 'teste', NULL, NULL, NULL, NULL),
(45, 1, NULL, 'adfa asdf for your', NULL, NULL, NULL, NULL),
(46, 1, NULL, 'thanks for letting j', NULL, NULL, NULL, NULL),
(47, 1, NULL, 'test', NULL, NULL, NULL, NULL),
(48, 1, NULL, 'dfsasdfsdfadfas df ad.  adfa.   fdf.     ', NULL, NULL, NULL, NULL),
(49, 1, NULL, 'dfdsa. daf', NULL, NULL, NULL, NULL),
(50, 1, NULL, 'dfgfsdfgfdsg', NULL, NULL, NULL, NULL),
(51, 1, NULL, 'hgjg', NULL, NULL, NULL, NULL),
(52, 1, NULL, 'fghgdhg', NULL, NULL, NULL, NULL),
(53, 1, NULL, 'fsdgfds dgffds', NULL, NULL, NULL, NULL),
(54, 1, NULL, 'thanks', NULL, NULL, NULL, NULL),
(55, 1, NULL, 'dad\'s birthday', NULL, NULL, NULL, NULL),
(56, 1, NULL, 'thanks for your email', NULL, NULL, NULL, NULL),
(57, 1, NULL, 'we', NULL, NULL, NULL, NULL),
(58, 1, NULL, 'hello, ', NULL, NULL, NULL, NULL),
(59, 1, NULL, 'Whta\'s up', NULL, NULL, NULL, NULL),
(60, 1, NULL, 'afsdfasf', NULL, NULL, NULL, NULL),
(61, 1, NULL, 'afsd dsafd afsdf', NULL, NULL, NULL, NULL),
(62, 1, NULL, 'ADSDSAD', NULL, NULL, NULL, NULL),
(63, 1, NULL, 'sfdsfdf', NULL, NULL, NULL, NULL),
(64, 1, NULL, 'sfdsfdf', NULL, NULL, NULL, NULL),
(65, 1, NULL, 'sfdsfdf', NULL, NULL, NULL, NULL),
(66, 1, NULL, 'czxvcxxzcvxzcv', NULL, NULL, NULL, NULL),
(67, 1, NULL, 'thanks', NULL, NULL, NULL, NULL),
(68, 1, NULL, 'cvzxcvczv', NULL, NULL, NULL, NULL),
(69, 1, NULL, 'dfasdfas DS af', NULL, NULL, NULL, NULL),
(70, 1, NULL, 'dfasdfas df after dfa', NULL, NULL, NULL, NULL),
(71, 1, NULL, 'fdf dafdfas df', NULL, NULL, NULL, NULL),
(72, 1, NULL, 'adsfdf ad fas ', NULL, NULL, NULL, NULL),
(73, 1, NULL, 'thanks', NULL, NULL, NULL, NULL),
(74, 1, NULL, 'fasd fas fda fdf ad', NULL, NULL, NULL, NULL),
(75, 1, NULL, 'sfdafdfasdfasd', NULL, NULL, NULL, NULL),
(76, 1, NULL, 'dafeaefaefew', NULL, NULL, NULL, NULL),
(77, 1, NULL, 'fgsfg fsd gfsg for sfs gdfg fd', NULL, NULL, NULL, NULL),
(78, 1, NULL, 'adfsdfdasfdfasdfasd', NULL, NULL, NULL, NULL),
(79, 1, NULL, 'adfafdsfasdf', NULL, NULL, NULL, NULL),
(80, 1, NULL, 'fdgfgdfgdfg', NULL, NULL, NULL, NULL),
(81, 1, NULL, 'fgsgsd gfgfgsdfgf', NULL, NULL, NULL, NULL),
(82, 1, NULL, 'what\'s up guys', NULL, NULL, NULL, NULL),
(83, 1, NULL, 'Hey men, check this out', NULL, NULL, '2020-11-21 01:06:47', NULL),
(84, 1, NULL, 'testing', NULL, NULL, '2020-11-21 01:44:42', NULL),
(85, 1, NULL, ' your one n only cypher', NULL, NULL, '2020-11-21 01:44:42', NULL),
(86, 1, NULL, 'test', NULL, NULL, '2020-11-21 01:44:42', NULL),
(87, 1, NULL, 'dhtec fvjrd dgfdf', NULL, NULL, '2020-11-21 01:44:42', NULL),
(88, 1, NULL, 'fffhdtn dtgfhgdhghfg', NULL, NULL, '2020-11-21 01:44:42', NULL),
(89, 1, NULL, 'check this out', NULL, NULL, '2020-11-21 01:44:42', NULL),
(90, 1, NULL, 'tick tokk', NULL, NULL, '2020-11-21 01:44:42', NULL),
(91, 1, NULL, 'me n u', NULL, NULL, '2020-11-21 01:44:42', NULL),
(92, 1, NULL, 'sgfgsfdg sfd f', NULL, NULL, '2020-11-23 01:09:55', NULL),
(93, 1, NULL, 'ddhdgh dgh', NULL, NULL, '2020-11-23 01:09:55', NULL),
(94, 1, NULL, 'dsfgds dfdsgfsg', NULL, NULL, '2020-11-23 01:09:55', NULL),
(95, 1, NULL, 'gfsdg fgsdfg sdsgd', NULL, NULL, '2020-11-23 01:09:55', NULL),
(96, 1, NULL, '777777777', NULL, NULL, '2020-11-23 01:09:55', NULL),
(97, 1, NULL, 'hghghghgh', NULL, NULL, '2020-11-23 01:09:55', NULL),
(98, 1, NULL, 'fgfgfgf ', NULL, NULL, '2020-11-23 01:09:55', NULL),
(99, 1, NULL, 'test', NULL, NULL, '2020-11-23 01:09:55', NULL),
(100, 1, NULL, 'fgsfdgfg\n', NULL, NULL, NULL, NULL),
(101, 1, NULL, 'fdsgs', NULL, NULL, '2020-11-23 01:42:30', NULL),
(102, 1, NULL, 'ggggggggdfgsfgs', NULL, NULL, '2020-11-23 01:42:30', NULL),
(103, 1, NULL, 'afdasfd', NULL, NULL, '2020-11-23 01:42:30', NULL),
(104, 1, NULL, 'hgdhgdh gd h', NULL, NULL, '2020-11-23 01:45:43', NULL),
(105, 1, NULL, 'gdf ghdgh', NULL, NULL, '2020-11-23 01:45:48', NULL),
(106, 1, NULL, 'dfh       gh gh', NULL, NULL, '2020-11-23 01:45:56', NULL),
(107, 1, NULL, 'gggg', NULL, NULL, '2020-11-23 01:46:04', NULL),
(108, 1, NULL, 'ggggg', NULL, NULL, '2020-11-23 01:46:08', NULL),
(109, 1, NULL, 'sdfdfd', NULL, NULL, '2020-11-23 01:46:39', NULL),
(110, 1, NULL, 'fsgfgsfd', NULL, NULL, '2020-11-23 03:04:37', NULL),
(111, 1, NULL, 'past memories', NULL, NULL, '2020-11-23 03:09:21', NULL),
(112, NULL, NULL, 'kjhkhkjhjk', NULL, NULL, '2020-12-15 21:44:22', NULL),
(113, 12, NULL, 'tyyyuhgf', NULL, NULL, '2020-12-21 22:55:47', 0),
(114, 12, NULL, 'thanks to all my guys', NULL, NULL, '2020-12-22 09:03:58', 0),
(115, 12, NULL, 'afdfd afdafdfasd', NULL, NULL, '2020-12-22 09:04:36', 0),
(116, 12, NULL, 'fghl', NULL, NULL, '2020-12-22 09:06:14', 0),
(117, NULL, NULL, 'testing again', NULL, NULL, '2020-12-27 10:20:39', 0),
(118, NULL, NULL, 'trying again', NULL, NULL, '2020-12-27 10:21:22', 0),
(119, 14, NULL, 'audioooooooooo', NULL, NULL, '2021-01-04 09:07:41', 0),
(120, 14, NULL, 'trying', NULL, NULL, '2021-01-04 09:36:49', 0),
(121, 14, NULL, 'again', NULL, NULL, '2021-01-04 09:39:12', 0),
(122, 14, NULL, 'hello', NULL, NULL, '2021-01-08 01:18:13', 0),
(123, NULL, NULL, 'what\'s up', NULL, NULL, '2021-01-08 01:21:21', 0),
(124, NULL, NULL, 'gh', NULL, NULL, '2021-01-08 01:22:09', 0),
(125, NULL, NULL, 'yeah!', NULL, NULL, '2021-01-08 02:27:53', 0),
(126, NULL, NULL, 'fsgfgsdfgfdsg', NULL, NULL, '2021-01-08 02:40:16', 0),
(127, 14, NULL, 'yuui', NULL, NULL, '2021-01-08 02:54:31', 0),
(128, 14, NULL, 'this year', NULL, NULL, '2021-01-08 02:58:25', 0),
(129, 14, NULL, 'test', NULL, NULL, '2021-01-08 02:59:03', 0),
(130, 14, NULL, 'test', NULL, NULL, '2021-01-08 02:59:22', 0),
(131, 14, NULL, 'new beginnings', NULL, NULL, '2021-01-08 03:00:19', 0),
(132, 14, NULL, 'repost', NULL, NULL, '2021-01-08 03:01:05', 0),
(133, 9, NULL, 'test ', NULL, NULL, '2021-01-15 17:37:09', 0),
(134, 9, NULL, 'test', NULL, NULL, '2021-01-15 17:37:33', 0),
(135, NULL, NULL, 'hey', NULL, NULL, '2021-01-15 17:51:16', 0),
(136, NULL, NULL, 'what\'s up', NULL, NULL, '2021-01-15 17:51:35', 0),
(137, NULL, NULL, 'trying again\n', NULL, NULL, '2021-01-15 17:53:02', 0),
(138, NULL, NULL, 'what\'s up everyone', NULL, NULL, '2021-01-15 17:54:55', 0),
(139, 14, NULL, 'what\'s up', NULL, NULL, '2021-01-15 18:15:10', 0),
(140, NULL, NULL, 'go', NULL, NULL, '2021-01-15 20:15:01', 0),
(141, NULL, NULL, 'what\'s up', NULL, NULL, '2021-01-15 20:16:44', 0),
(142, NULL, NULL, 'good', NULL, NULL, '2021-01-15 20:18:17', 0),
(143, NULL, NULL, 'good', NULL, NULL, '2021-01-15 20:20:48', 0),
(144, 9, NULL, 'terms', NULL, NULL, '2021-01-15 20:40:11', 0),
(145, 14, NULL, 'weeeeee', NULL, NULL, '2021-01-15 20:41:17', 0),
(146, 14, NULL, 'jo', NULL, NULL, '2021-01-16 11:51:34', 0),
(147, 14, NULL, '...', NULL, NULL, '2021-01-16 11:52:48', 0),
(148, 14, NULL, 'thanks', NULL, NULL, '2021-01-16 11:53:00', 0),
(149, 14, NULL, 'ghfgh', NULL, NULL, '2021-01-16 11:54:13', 0),
(150, 14, NULL, 'fghghgfh', NULL, NULL, '2021-01-16 11:54:32', 0),
(151, 14, NULL, 'fghfghgfhghf', NULL, NULL, '2021-01-16 11:54:46', 0),
(152, 14, NULL, 'dfgdfgfgdfgfdgfg', NULL, NULL, '2021-01-16 11:55:44', 0),
(153, 14, NULL, 'rtertertr', NULL, NULL, '2021-01-16 11:59:31', 0),
(154, 14, NULL, 'fdgfdgfgdfg', NULL, NULL, '2021-01-16 11:59:57', 0),
(155, 14, NULL, 'thanks', NULL, NULL, '2021-01-16 12:15:36', 0),
(156, 14, NULL, 'fon', NULL, NULL, '2021-01-16 12:25:27', 0),
(157, 14, NULL, 'jkjj', NULL, NULL, '2021-01-16 12:50:33', 0),
(158, NULL, NULL, 'meeeee', NULL, NULL, '2021-01-19 10:04:21', 0),
(159, NULL, NULL, 'Yeo\n', NULL, NULL, '2021-01-19 10:21:56', 0),
(160, 14, NULL, 'yoooo', NULL, NULL, '2021-01-19 10:28:30', 0),
(161, 14, NULL, 'hey', NULL, NULL, '2021-01-19 10:29:52', 0),
(162, NULL, NULL, 'goooo', NULL, NULL, '2021-01-19 10:36:09', 0),
(163, 14, NULL, 'yeeeeei', NULL, NULL, '2021-01-19 10:37:10', 0),
(164, 14, NULL, 'aaahhhh', NULL, NULL, '2021-01-19 10:39:19', 0),
(165, 14, NULL, 'again', NULL, NULL, '2021-01-19 10:42:12', 0),
(166, 14, NULL, 'test', NULL, NULL, '2021-01-19 11:24:05', 0),
(167, 14, NULL, 'hey', NULL, NULL, '2021-01-19 11:24:13', 0),
(168, 14, NULL, '...', NULL, NULL, '2021-01-19 11:24:13', 0),
(169, 14, NULL, '...', NULL, NULL, '2021-01-19 11:24:18', 0),
(170, 14, NULL, 'test', NULL, NULL, '2021-01-19 11:27:10', 0),
(171, 14, NULL, 'test', NULL, NULL, '2021-01-19 11:29:46', 0),
(172, 14, NULL, '...', NULL, NULL, '2021-01-19 11:31:27', 0),
(173, 14, NULL, '...', NULL, NULL, '2021-01-19 11:44:12', 0),
(174, 14, NULL, '...', NULL, NULL, '2021-01-19 11:45:10', 0),
(175, 14, NULL, '...', NULL, NULL, '2021-01-19 11:55:39', 0),
(176, 14, NULL, '...', NULL, NULL, '2021-01-19 11:56:48', 0),
(177, 14, NULL, 'hello', NULL, NULL, '2021-01-19 11:57:46', 0),
(178, 14, NULL, '...', NULL, NULL, '2021-01-19 12:01:08', 0),
(179, 14, NULL, '...', NULL, NULL, '2021-01-19 12:01:33', 0),
(180, 14, NULL, '...', NULL, NULL, '2021-01-19 12:13:14', 0),
(181, 14, NULL, '...', NULL, NULL, '2021-01-19 12:13:16', 0),
(182, 14, NULL, 'daf adsfdas ', 301, NULL, '2021-01-22 02:15:10', 0),
(183, 14, NULL, 'Testing again', 301, NULL, '2021-01-22 10:38:31', 0),
(184, 14, NULL, 'helllo', 301, NULL, '2021-01-22 11:37:34', 0),
(185, 14, NULL, '...', 301, NULL, '2021-01-22 11:38:22', 0),
(186, NULL, NULL, 'test', NULL, NULL, '2021-02-06 02:53:28', 0),
(187, NULL, NULL, '...', NULL, NULL, '2021-02-06 02:55:20', 0),
(188, NULL, NULL, '...', NULL, NULL, '2021-02-06 02:56:39', 0),
(189, 14, NULL, '...', NULL, NULL, '2021-02-06 02:57:23', 0),
(190, 14, NULL, '...', NULL, NULL, '2021-02-06 03:04:43', 0),
(191, 14, NULL, '...', NULL, NULL, '2021-02-06 03:26:37', 0),
(192, 14, NULL, '...', NULL, NULL, '2021-02-06 08:35:21', 0),
(193, 14, NULL, '...', NULL, NULL, '2021-02-06 08:44:42', 0),
(194, 14, NULL, '...', NULL, NULL, '2021-02-06 09:15:13', 0),
(195, 14, NULL, '...', NULL, NULL, '2021-02-06 09:57:25', 0),
(196, 14, NULL, 'Hello everyone, class of 2021', 72, NULL, '2022-11-16 02:43:48', 0),
(197, 14, NULL, 'tyyhf', NULL, NULL, '2022-11-16 03:07:31', 0),
(198, 14, NULL, 'test', NULL, NULL, '2022-11-16 03:08:16', 0);

-- --------------------------------------------------------

--
-- Table structure for table `postaudiothrough`
--

CREATE TABLE `postaudiothrough` (
  `id` int(11) NOT NULL,
  `postId` int(11) DEFAULT NULL,
  `audioId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `postaudiothrough`
--

INSERT INTO `postaudiothrough` (`id`, `postId`, `audioId`) VALUES
(1, 122, 13),
(2, 122, 11),
(3, 132, 15);

-- --------------------------------------------------------

--
-- Table structure for table `postconfig`
--

CREATE TABLE `postconfig` (
  `id` int(11) NOT NULL,
  `isAnnouncement` tinyint(1) DEFAULT NULL,
  `isPrivate` tinyint(1) DEFAULT NULL,
  `postId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `postdocumentthrough`
--

CREATE TABLE `postdocumentthrough` (
  `id` int(11) NOT NULL,
  `postId` int(11) DEFAULT NULL,
  `documentId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `postphotothrough`
--

CREATE TABLE `postphotothrough` (
  `id` int(11) NOT NULL,
  `postId` int(11) DEFAULT NULL,
  `photoId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `postphotothrough`
--

INSERT INTO `postphotothrough` (`id`, `postId`, `photoId`) VALUES
(1, NULL, 1),
(2, NULL, 4),
(3, 59, 1),
(4, 59, 2),
(5, 60, 1),
(6, 60, 4),
(7, 61, 3),
(8, 61, 4),
(9, 62, 12),
(10, 62, 11),
(11, 83, 14),
(12, 109, 2),
(13, 110, 14),
(14, 130, 30),
(15, 165, 30),
(16, 178, 31),
(17, 185, 29),
(18, 198, 52);

-- --------------------------------------------------------

--
-- Table structure for table `postvideothrough`
--

CREATE TABLE `postvideothrough` (
  `id` int(11) NOT NULL,
  `postId` int(11) DEFAULT NULL,
  `videoId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `postvideothrough`
--

INSERT INTO `postvideothrough` (`id`, `postId`, `videoId`) VALUES
(1, 75, 9),
(2, 75, 10),
(3, 111, 8);

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `profileID` int(10) UNSIGNED NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `addressID` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photoID` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`profileID`, `firstname`, `lastname`, `email`, `id`, `addressID`, `phone`, `photoID`, `created_at`, `updated_at`) VALUES
(18, 'amaka', 'godwin', 'amakagodwin@gmail.com', '35', '56', '08034282630', '82', '2020-08-25 06:53:28', '2020-08-25 06:53:28'),
(16, 'lucky', 'adams', 'lucky@gmail.com', '32', '42', '08034282630', '57', '2020-08-14 07:51:05', '2020-08-14 07:51:05'),
(17, 'lekan', 'adeola', 'lekan@gmail.com', '33', '43', '08034282630', '60', '2020-08-16 00:41:01', '2020-08-16 00:41:01'),
(14, 'kokori', 'julius', 'kokori@gmail.com', '30', '32', '08034282630', '32', '2020-08-08 04:06:39', '2020-08-08 04:06:39');

-- --------------------------------------------------------

--
-- Table structure for table `pushmessage`
--

CREATE TABLE `pushmessage` (
  `id` int(11) NOT NULL,
  `body` varchar(512) NOT NULL,
  `subject` varchar(512) DEFAULT NULL,
  `dateCreated` varchar(512) DEFAULT NULL,
  `file` varchar(512) DEFAULT NULL,
  `fileUrls` text DEFAULT NULL,
  `topicId` int(11) DEFAULT NULL,
  `channel` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pushtopic`
--

CREATE TABLE `pushtopic` (
  `id` int(11) NOT NULL,
  `name` varchar(512) NOT NULL,
  `channelId` varchar(512) NOT NULL,
  `dateCreated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `resetrequest`
--

CREATE TABLE `resetrequest` (
  `id` int(11) NOT NULL,
  `resetToken` varchar(512) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateModified` datetime NOT NULL,
  `state` int(11) NOT NULL,
  `expiredTimeInMin` int(11) NOT NULL,
  `requestType` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `resetrequest`
--

INSERT INTO `resetrequest` (`id`, `resetToken`, `dateCreated`, `dateModified`, `state`, `expiredTimeInMin`, `requestType`, `userId`) VALUES
(1, '83af814823338d90217fa731a63c8daa0f9f1a8277c42133c9cffd15ffcca9cb001ae75b919389fd08694007d9556a45a957e939bfb4a3766141bb82c28cdb03', '2020-12-24 00:00:00', '2020-12-24 00:00:00', 0, 30, 1, 15),
(2, 'ece817b1ac10a79b18c4f10860e5bba5c3460ab68f8fcb7fc529c45e2ecd80b8608f6bbca594d057fb082536023823ef352ce7e375c93ed7f6ada988cf465654', '2020-12-24 00:00:00', '2020-12-24 00:00:00', 0, 30, 1, 15),
(3, 'c9f08a2f2e05a4ebcc7107bd739d09c4e7f1042210d64e68bafb94d40ae313dbff6b24ba31061b2df9eeb97f2092e847053712d896e88b94e88cf7a19f66f735', '2020-12-24 00:00:00', '2020-12-24 00:00:00', 0, 30, 1, 15),
(4, 'e12477808a2b4a90019aceb8cb3987a7b7f3ff19c88b91dae86d5ff17a78af1d933d960f7b35342ad1e7aaeacc3ce8f256b7ec126df19f5dc2238c9d4234983d', '2020-12-27 00:00:00', '2020-12-27 00:00:00', 0, 30, 1, 15),
(5, '1ddc4c64a951fb4021f70315eab770fb3b0ad4649bf396a59a1e5899c6529fc5903612323923f1a4e1550cfc9eac20ce6678a64ae0e9e86211aeecd340422e68', '2020-12-27 00:00:00', '2020-12-27 00:00:00', 0, 30, 1, 15),
(6, '72dcb51847f39186ebf804da34f0d10ebac1f86e8e6a19543dae0c0a822e186fa08a0eb79ec039fb91402f8ce9b724e3eed0fde98c7e71e6eb21320b2051298a', '2020-12-27 08:52:50', '2020-12-27 09:03:12', 1, 30, 1, 15),
(7, '71f7644ad5a61d23406eb1eb4c17825d50177e2fffde239f9c7ed0e9e103b909d03378e344cd921851b81466f36755973b1ef9a1aa6636030ceccd6685719f4f', '2021-01-10 05:11:09', '2021-01-10 05:11:09', 0, 30, 1, 15),
(8, 'bd224be8c7061c2e5f489eee01493e94a6ff90d0ebadf34f3c5efdc0bfce537ddaf72e23f3ff8bd95b6f85fa81ad2819a7360bc058e75f989f73f244df286e47', '2021-01-10 05:12:04', '2021-01-10 05:12:04', 0, 30, 1, 15);

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

CREATE TABLE `resources` (
  `resourceID` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isPublic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uploadby` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `artist` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resources`
--

INSERT INTO `resources` (`resourceID`, `title`, `type`, `note`, `url`, `isPublic`, `uploadby`, `artist`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Jesus is lord over all2', '4', 'weldone this a good job here', 'upload/1596637391950media applicantz.pdf', '0', 'mark david', 'Jesus Is Lord Over All2', NULL, '2020-08-05 06:23:35', '2020-08-05 06:23:35'),
(2, 'believe in God and be free', '4', '<p><span style=\"color: rgba(0, 0, 0, 0.84); font-family: Roboto, sans-serif; font-size: 16px;\">Both are complete and executed in completely different ways. Both are optimized and not bothered by the overhead of any of the calling functions.</span><span style=\"color: rgba(0, 0, 0, 0.84); font-family: Roboto, sans-serif; font-size: 16px;\">Both are complete and executed in completely different ways. Both are optimized and not bothered by the overhead of any of the calling functions.</span><span style=\"color: rgba(0, 0, 0, 0.84); font-family: Roboto, sans-serif; font-size: 16px;\">Both are complete and executed in completely different ways. Both are optimized and not bothered by the overhead of any of the calling functions.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.84); font-family: Roboto, sans-serif; font-size: 16px;\">Both are complete and executed in completely different ways. Both are optimized and not bothered by the overhead of any of the calling functions.</span><span style=\"color: rgba(0, 0, 0, 0.84); font-family: Roboto, sans-serif; font-size: 16px;\">Both are complete and executed in completely different ways. Both are optimized and not bothered by the overhead of any of the calling functions.</span><span style=\"color: rgba(0, 0, 0, 0.84); font-family: Roboto, sans-serif; font-size: 16px;\">Both are complete and executed in completely different ways. Both are optimized and not bothered by the overhead of any of the calling functions.</span></p><p><br></p><p><span style=\"color: rgba(0, 0, 0, 0.84); font-family: Roboto, sans-serif; font-size: 16px;\">Both are complete and executed in completely different ways. Both are optimized and not bothered by the overhead of any of the calling functions.</span><span style=\"color: rgba(0, 0, 0, 0.84); font-family: Roboto, sans-serif; font-size: 16px;\">Both are complete and executed in completely different ways. Both are optimized and not bothered by the overhead of any of the calling functions.</span><span style=\"color: rgba(0, 0, 0, 0.84); font-family: Roboto, sans-serif; font-size: 16px;\">Both are complete and executed in completely different ways. Both are optimized and not bothered by the overhead of any of the calling functions.</span><span style=\"color: rgba(0, 0, 0, 0.84); font-family: Roboto, sans-serif; font-size: 16px;\"><br></span><span style=\"color: rgba(0, 0, 0, 0.84); font-family: Roboto, sans-serif; font-size: 16px;\"><br></span><br></p>', 'upload/covid 19 press 7.pdf', '0', 'mark david', 'Dr. adeleke keyinde', NULL, '2020-08-07 17:39:46', '2020-08-07 17:39:46'),
(3, 'fear of fear', '1', 'gyugu', 'uhyt5gvf', '0', 'mark david', 'joe praize', NULL, '2020-08-08 05:33:56', '2020-08-08 05:33:56'),
(25, 'fear of fear', '1', 'good', '/premiumVideos/1597068842989silicon valley - s01e02 (o2tvseries.com).mp4', '0', 'robinson agaga', 'Barr. Richard Kingsley', NULL, '2020-08-10 21:14:02', '2020-08-10 21:14:02'),
(6, 'fear of fear', '1', 'GOOD', 'premiumVideos/1596845287595silicon valley - s02e06 (o2tvseries.com).mp4', '0', 'mark david', 'Barr. Richard Kingsley2', NULL, '2020-08-08 07:08:08', '2020-08-08 07:08:08'),
(7, 'fear of fear', '1', 'GOOD', 'premiumVideos/1596845420939silicon valley - s02e06 (o2tvseries.com).mp4', '0', 'mark david', 'Barr. Richard Kingsley2', NULL, '2020-08-08 07:10:20', '2020-08-08 07:10:20'),
(15, 'God works in a mysterious way -Pt2', '2', '<p><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; white-space: pre-wrap; background-color: rgb(249, 249, 249);\">Live the Journey, as we align our energy with these Precious World Monuments, while Celebrating a Major turning Point in the History of the World’s most Populous Nations…INDIA and CHINA!</span><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; white-space: pre-wrap; background-color: rgb(249, 249, 249);\">Live the Journey, as we align our energy with these Precious World Monuments, while Celebrating a Major turning Point in the History of the World’s most Populous Nations…INDIA and CHINA!</span><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; white-space: pre-wrap; background-color: rgb(249, 249, 249);\">Live the Journey, as we align our energy with these Precious World Monuments, while Celebrating a Major turning Point in the History of the World’s most Populous Nations…INDIA and CHINA!</span><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; white-space: pre-wrap; background-color: rgb(249, 249, 249);\">Live the Journey, as we align our energy with these Precious World Monuments, while Celebrating a Major turning Point in the History of the World’s most Populous Nations…INDIA and CHINA!</span></p><p><br></p><p><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; white-space: pre-wrap; background-color: rgb(249, 249, 249);\">Live the Journey, as we align our energy with these Precious World Monuments, while Celebrating a Major turning Point in the History of the World’s most Populous Nations…INDIA and CHINA!</span></p><p><br></p><p><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; white-space: pre-wrap; background-color: rgb(249, 249, 249);\">Live the Journey, as we align our energy with these Precious World Monuments, while Celebrating a Major turning Point in the History of the World’s most Populous Nations…INDIA and CHINA!</span><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; white-space: pre-wrap; background-color: rgb(249, 249, 249);\"><br></span><span style=\"color: rgb(3, 3, 3); font-family: Roboto, Arial, sans-serif; white-space: pre-wrap; background-color: rgb(249, 249, 249);\"><br></span>                      \r\n                     </p>', '/audios/159702935886801. fear of fear.mp3', '0', 'mark david', 'Deaconess Elizabeth Segun', NULL, '2020-08-10 10:15:58', '2020-08-10 10:15:58'),
(16, 'Make a joyous sound', '2', 'good', '/audios/159702996315802. catch in the dark.mp3', '0', 'mark david', 'David Oyedepo', NULL, '2020-08-10 10:26:03', '2020-08-10 10:26:03'),
(18, 'Believe in God and be free2', '4', '<p>good2</p>', 'upload/communication_strategy_pdf.pdf', '0', 'mark david', 'Believe In God And Be Free2', NULL, '2020-08-10 11:26:56', '2020-08-10 11:26:56'),
(19, 'SPDC Donates Medical Equipment To Bayelsa StateBayelsa State Governor, Senator Douye Diri, has pledged PDC Donates Medical Equipment To Bayelsa StateBayelsa State Governor, Senator Douye Diri', '4', '<p>good</p>', 'upload/communication strategy2.pdf', '0', 'mark david', 'Dr. adeleke keyinde', NULL, '2020-08-10 11:32:20', '2020-08-10 11:32:20'),
(29, 'fear of fear', '2', 'yuu', '/audios/159707228916404. i\'ll be your man.mp3', '0', 'robinson agaga', 'passengers', NULL, '2020-08-10 22:11:29', '2020-08-10 22:11:29'),
(30, 'fear of fear', '2', 'yuu', '/audios/159707233554404. i\'ll be your man.mp3', '0', 'robinson agaga', 'passengers', NULL, '2020-08-10 22:12:15', '2020-08-10 22:12:15'),
(31, 'Believe in God and be free', '4', '<p>good</p>', 'upload/MEDIA APPLICANTZ.pdf', '0', 'mark david', 'Believe In God And Be Free', NULL, '2020-08-11 03:03:24', '2020-08-11 03:03:24'),
(32, 'believe in God and be free', '4', '<p>goood</p>', 'upload/covid 19 press 7.pdf', '0', 'mark david', 'Dr. adeleke keyinde', NULL, '2020-08-11 03:05:20', '2020-08-11 03:05:20'),
(36, 'fear of fear', '2', 'good', '/audios/159709034924101. fear of fear.mp3', '0', 'mark david', 'fear', NULL, '2020-08-11 03:12:29', '2020-08-11 03:12:29'),
(37, 'We build the future leaders', '2', 'good', '/audios/159709062639401. fear of fear.mp3', '0', 'mark david', 'fear', NULL, '2020-08-11 03:17:06', '2020-08-11 03:17:06'),
(38, 'ygygiygig', '4', '<p>good</p>', '/upload/MEDIA APPLICANTZ.pdf', '0', 'kokori', 'Dr. adeleke keyinde', NULL, '2020-08-12 18:55:14', '2020-08-12 18:55:14'),
(39, 'believe in God and be free', '4', '<p>good</p>', '/upload/MEDIA APPLICANTZ.pdf', '0', 'kokori', 'Dr. adeleke keyinde', NULL, '2020-08-12 19:03:54', '2020-08-12 19:03:54'),
(40, 'SPDC Donates Medical Equipment To Bayelsa StateBayelsa State Governor, Senator Douye Diri, has pledged PDC Donates Medical Equipment To Bayelsa StateBayelsa State Governor, Senator Douye Diri', '4', '<p>good</p>', '/upload/PRESS RELEASE ON HCW confirmed covid 19.pdf', '0', 'kokori', 'Dr. adeleke keyinde', NULL, '2020-08-13 01:33:47', '2020-08-13 01:33:47'),
(41, 'believe in God and be free', '4', '<p>good</p>', '/upload/MEDIA APPLICANTZ.pdf', '0', 'kokori', 'Dr. adeleke keyinde', NULL, '2020-08-13 02:37:53', '2020-08-13 02:37:53'),
(42, 'focus on your raise with God', '4', '<p>good</p>', '/upload/MEDIA APPLICANTZ.pdf', '0', 'kokori', 'Barr. Richard Kingsley', NULL, '2020-08-13 02:40:23', '2020-08-13 02:40:23'),
(43, 'good is the real thing', '4', '<p>good</p>', '/upload/covid 19 press 6.pdf', '0', 'kokori', 'Barr. Richard Kingsley', NULL, '2020-08-13 02:43:02', '2020-08-13 02:43:02'),
(44, 'Believe in God and be free', '4', '<p><span style=\"font-family: system-ui, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Ubuntu, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; background-color: rgb(246, 246, 236);\">After much reviews and 2 years of researching; from blogs, youtube videos, publications in journals, and farm visitations etc. I intend to start my very own garden (vegetable garden) from scratch. So much has been said about agricultural revolution in Nigeria and under the present administration, so I intend finding out how profitable it would be.</span><br style=\"font-family: system-ui, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Ubuntu, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; background-color: rgb(246, 246, 236);\"><span style=\"font-family: system-ui, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Ubuntu, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; background-color: rgb(246, 246, 236);\">Please I welcome you all to my World. Let\'s explore together.</span></p><p><br></p><p><span style=\"font-family: system-ui, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Ubuntu, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; background-color: rgb(246, 246, 236);\">After much reviews and 2 years of researching; from blogs, youtube videos, publications in journals, and farm visitations etc. I intend to start my very own garden (vegetable garden) from scratch. So much has been said about agricultural revolution in Nigeria and under the present administration, so I intend finding out how profitable it would be.</span><br style=\"font-family: system-ui, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Ubuntu, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; background-color: rgb(246, 246, 236);\"><span style=\"font-family: system-ui, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Ubuntu, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; background-color: rgb(246, 246, 236);\">Please I welcome you all to my World. Let\'s explore together.</span></p><p><span style=\"font-family: system-ui, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Ubuntu, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; background-color: rgb(246, 246, 236);\"><br></span></p><p><span style=\"font-family: system-ui, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Ubuntu, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; background-color: rgb(246, 246, 236);\">After much reviews and 2 years of researching; from blogs, youtube videos, publications in journals, and farm visitations etc. I intend to start my very own garden (vegetable garden) from scratch. So much has been said about agricultural revolution in Nigeria and under the present administration, so I intend finding out how profitable it would be.</span><br style=\"font-family: system-ui, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Ubuntu, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; background-color: rgb(246, 246, 236);\"><span style=\"font-family: system-ui, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Ubuntu, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; background-color: rgb(246, 246, 236);\">Please I welcome you all to my World. Let\'s explore together.</span><span style=\"font-family: system-ui, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Ubuntu, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; background-color: rgb(246, 246, 236);\"><br></span><span style=\"font-family: system-ui, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Ubuntu, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; background-color: rgb(246, 246, 236);\"><br></span><br></p>', '/upload/MEDIA APPLICANTZ.pdf', '0', 'kokori', 'Believe In God And Be Free', NULL, '2020-08-13 02:46:26', '2020-08-13 02:46:26'),
(45, 'SPDC Donates Medical Equipment To Bayelsa StateBayelsa State Governor, Senator Douye Diri, has pledged PDC Donates Medical Equipment To Bayelsa StateBayelsa State Governor, Senator Douye Diri', '4', '<p>good</p>', 'http://127.0.0.1:8000/upload/FINAL A4 TUA Application Form Update 19 v2 (1).pdf', '0', 'kokori', 'Dr. adeleke keyinde', NULL, '2020-08-17 18:56:02', '2020-08-17 18:56:02'),
(46, 'fear of fear', '2', 'good', 'http://127.0.0.1:8000/audios/159769940056101. fear of fear.mp3', '0', 'kokori', 'passenger', NULL, '2020-08-18 04:23:20', '2020-08-18 04:23:20'),
(47, 'We build the future leaders great job', '2', 'good', 'http://127.0.0.1:8000/audios/159770156091801. simple song.mp3', '0', 'kokori', 'passengers', NULL, '2020-08-18 04:59:20', '2020-08-18 04:59:20'),
(48, 'We build the future leaders', '1', 'good', 'http://127.0.0.1:8000/premiumVideos/1597701756190silicon valley - s03e01 (tvshows4mobile.com).mp4', '0', 'kokori', 'Barr. Richard Kingsley', NULL, '2020-08-18 05:02:36', '2020-08-18 05:02:36'),
(49, 'INDEX CASE: GOV DIRI ORDERS ONE-WEEK STAY-AT-HOME IN BAYELSA', '1', 'good', 'uhyt5gvf', '0', 'kokori', 'Deaconess Elizabeth Segun', NULL, '2020-08-18 05:03:12', '2020-08-18 05:03:12'),
(50, 'INDEX CASE: GOV DIRI ORDERS ONE-WEEK STAY-AT-HOME IN BAYELSA', '1', 'good', 'uhyt5gvf', '0', 'kokori', 'Deaconess Elizabeth Segun', NULL, '2020-08-18 05:08:41', '2020-08-18 05:08:41'),
(60, 'fear of fear', '3', 'good', 'http://127.0.0.1:8000/books/1598380392660press release on 4 csses between 22-24 may.pdf', '0', 'lucky adams', 'Barr. Richard Kingsley', NULL, '2020-08-26 01:33:12', '2020-08-26 01:33:12'),
(52, 'SPDC Donates Medical Equipment To Bayelsa StateBayelsa State Governor, Senator Douye Diri, has pledged PDC Donates Medical Equipment To Bayelsa StateBayelsa State Governor, Senator Douye Diri', '9', 'report', 'http://127.0.0.1:8000/report/communication strategy2.docx', '0', 'kokori', 'kokori', NULL, '2020-08-22 18:50:57', '2020-08-22 18:50:57'),
(88, 'Second Phase of COVID-19 palliatives distribution chart Second Phase of COVID-19 palliatives distribution chart Second Phase of COVID-19 palliatives distribution chart', '2', 'Second Phase of COVID-19 palliatives distribution chartSecond Phase of COVID-19 palliatives distribution chartSecond Phase of COVID-19 palliatives distribution chart', '/audios/1599797645187aaliyah - at your best (you are love).mp3', '0', 'kokori', 'David Oyedepo', NULL, '2020-09-11 11:14:05', '2020-09-11 11:14:05'),
(57, 'SPDC Donates Medical Equipment To Bayelsa StateBayelsa State Governor, Senator Douye Diri, has pledged PDC Donates Medical Equipment To Bayelsa StateBayelsa State Governor, Senator Douye Diri', '4', '<p><span style=\"color: rgba(0, 0, 0, 0.52); font-family: Roboto, RobotoDraft, Helvetica, Arial, sans-serif; background-color: rgb(255, 236, 179);\">European Union laws require you to give European Union visitors information about cookies used and data collected on your blog. In many cases, these laws also require you to obtain consent.</span><br style=\"-webkit-tap-highlight-color: transparent; color: rgba(0, 0, 0, 0.52); font-family: Roboto, RobotoDraft, Helvetica, Arial, sans-serif; background-color: rgb(255, 236, 179);\"><br style=\"-webkit-tap-highlight-color: transparent; color: rgba(0, 0, 0, 0.52); font-family: Roboto, RobotoDraft, Helvetica, Arial, sans-serif; background-color: rgb(255, 236, 179);\"><span style=\"color: rgba(0, 0, 0, 0.52); font-family: Roboto, RobotoDraft, Helvetica, Arial, sans-serif; background-color: rgb(255, 236, 179);\">As a courtesy, we have added a notice on your blog to explain Google\'s use of certain Blogger and Google cookies, including use of Google Analytics and AdSense cookies, and other data collected by Google.</span><br style=\"-webkit-tap-highlight-color: transparent; color: rgba(0, 0, 0, 0.52); font-family: Roboto, RobotoDraft, Helvetica, Arial, sans-serif; background-color: rgb(255, 236, 179);\"><br style=\"-webkit-tap-highlight-color: transparent; color: rgba(0, 0, 0, 0.52); font-family: Roboto, RobotoDraft, Helvetica, Arial, sans-serif; background-color: rgb(255, 236, 179);\"><span style=\"color: rgba(0, 0, 0, 0.52); font-family: Roboto, RobotoDraft, Helvetica, Arial, sans-serif; background-color: rgb(255, 236, 179);\">You are responsible for confirming this notice actually works for your blog, and that it displays. If you employ other cookies, for example by adding third party features, this notice may not work for you. If you include functionality from other providers there may be extra information collected from your users</span></p>', 'http://127.0.0.1:8000/upload/communication_strategy_pdf.pdf', '0', 'lucky adams', 'Dr. adeleke keyinde', NULL, '2020-08-23 08:44:07', '2020-08-23 08:44:07'),
(58, 'believe in God and be free', '4', '<p>good</p>', 'http://127.0.0.1:8000/upload/covid 19 press 7.pdf', '0', 'kokori', 'Barr. Richard Kingsley', NULL, '2020-08-24 11:45:02', '2020-08-24 11:45:02'),
(65, 'fear of fear', '2', 'good', 'http://127.0.0.1:8000/audios/159839705515701. fear of fear.mp3', '0', 'lucky adams', 'fear', NULL, '2020-08-26 06:10:55', '2020-08-26 06:10:55'),
(66, 'We build the future leaders', '2', 'good', '/audios/159839715355901. fear of fear.mp3', '0', 'kokori', 'passengers', NULL, '2020-08-26 06:12:33', '2020-08-26 06:12:33'),
(67, 'believe in God and be free', '4', '<p>good</p>', 'upload/FINAL A4 TUA Application Form Update 19 v2.pdf', '0', 'kokori', 'Dr. adeleke keyinde', NULL, '2020-08-27 00:13:37', '2020-08-27 00:13:37'),
(68, 'We build the future leaders', '3', 'good', 'http://127.0.0.1:8000/books/1598465428138final a4 tua application form update 19 v2 (1).pdf', '0', 'kokori', 'Dr. adeleke keyinde', NULL, '2020-08-27 01:10:29', '2020-08-27 01:10:29'),
(71, 'believe in God and be free', '9', 'report', 'http://127.0.0.1:8000/report/PRESS RELEASE ON HCW confirmed covid 19.pdf', '0', 'kokori', 'kokori', NULL, '2020-08-27 05:02:29', '2020-08-27 05:02:29'),
(72, 'believe in God and be free', '9', 'report', 'http://127.0.0.1:8000/report/PRESS RELEASE ON HCW confirmed covid 19.pdf', '0', 'kokori', 'kokori', NULL, '2020-08-27 05:03:56', '2020-08-27 05:03:56'),
(73, 'SPDC Donates Medical Equipment To Bayelsa StateBayelsa State Governor, Senator Douye Diri, has pledged PDC Donates Medical Equipment To Bayelsa StateBayelsa State Governor, Senator Douye Diri', '9', 'report', 'http://127.0.0.1:8000/report/communication_strategy_pdf (5).pdf', '0', 'kokori', 'kokori', NULL, '2020-08-27 05:08:18', '2020-08-27 05:08:18'),
(74, 'SPDC Donates Medical Equipment To Bayelsa StateBayelsa State Governor, Senator Douye Diri, has pledged PDC Donates Medical Equipment To Bayelsa StateBayelsa State Governor, Senator Douye Diri', '9', 'report', 'http://127.0.0.1:8000/report/communication_strategy_pdf (5).pdf', '0', 'kokori', 'kokori', NULL, '2020-08-27 05:09:07', '2020-08-27 05:09:07'),
(82, 'fear of fear', '1', '<div class=\"kvgmc6g5 cxmmr5t8 oygrvhab hcukyx3x c1et5uql ii04i59q\" style=\"overflow-wrap: break-word; margin: 0px; white-space: pre-wrap; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(5, 5, 5); font-size: 15px;\"><div dir=\"auto\" style=\"font-family: inherit;\">The creation of Bayelsa State transudes  the hope of the Ijaws, but 24 years after, Bayelsans are left in hopeless optimism. The State is being described with economic innuendos; a place where abundant riches conjugate extreme poverty. The extremely high cost of living has also aided this paradox.</div></div><div class=\"o9v6fnle cxmmr5t8 oygrvhab hcukyx3x c1et5uql ii04i59q\" style=\"overflow-wrap: break-word; margin: 0.5em 0px 0px; white-space: pre-wrap; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(5, 5, 5); font-size: 15px;\"><div dir=\"auto\" style=\"font-family: inherit;\">In this fix, Agriculture stands as a veritable option out.  With an impressive youthful population and a favourable climate that allows planting all through, redirecting our attention to agriculture will not only nurture the economy, but provide jobs for the indigent youths.</div></div><div class=\"o9v6fnle cxmmr5t8 oygrvhab hcukyx3x c1et5uql ii04i59q\" style=\"overflow-wrap: break-word; margin: 0.5em 0px 0px; white-space: pre-wrap; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(5, 5, 5); font-size: 15px;\"><div dir=\"auto\" style=\"font-family: inherit;\">As awful as it is for Bayelsans to totally rely on sister states for almost  everything, especially agricultural products, it is an amazing opportunity, especially for the youths. With a very favourable climate that allows cultivation all through the year, making a living through Agriculture is a priceless opportunity.</div></div><div class=\"o9v6fnle cxmmr5t8 oygrvhab hcukyx3x c1et5uql ii04i59q\" style=\"overflow-wrap: break-word; margin: 0.5em 0px 0px; white-space: pre-wrap; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(5, 5, 5); font-size: 15px;\"><div dir=\"auto\" style=\"font-family: inherit;\">If agriculture is embraced,  coupled with value-addition, thousands of jobs opportunities will be created, the youths will be adequately engaged and self-reliant. Cultism and militant activities will gradually die off.</div></div>', 'uhyt5gvf', '0', 'kokori', 'joe praize', NULL, '2020-09-01 16:25:16', '2020-09-01 16:25:16'),
(78, 'Jesus is lord over all', '9', 'report', 'http://127.0.0.1:8000/report/covid 19 press 6.pdf', '0', 'kokori', 'kokori', NULL, '2020-08-27 05:16:57', '2020-08-27 05:16:57'),
(79, 'believe in God and be free', '4', '<p>greeg</p>', 'http://127.0.0.1:8000/upload/FINAL A4 TUA Application Form Update 19 v2 (1).pdf', '0', 'kokori', 'Dr. adeleke keyinde', NULL, '2020-08-27 11:22:22', '2020-08-27 11:22:22'),
(80, 'Jesus is lord over all', '4', '<p>good</p>', 'http://127.0.0.1:8000/upload/communication_strategy_pdf (5).pdf', '0', 'kokori', 'Dr. adeleke keyinde', NULL, '2020-08-27 18:03:00', '2020-08-27 18:03:00'),
(81, 'Second Phase of COVID-19 palliatives distribution chart', '1', 'good', 'uhyt5gvf', '0', 'lucky adams', 'David Oyedepo', NULL, '2020-08-28 21:32:50', '2020-08-28 21:32:50'),
(87, 'We build the future leaders', '2', 'good', '/audios/159925077613101. fear of fear.mp3', '0', 'kokori', 'passengers', NULL, '2020-09-05 03:19:36', '2020-09-05 03:19:36'),
(84, 'We build the future leaders', '1', 'good', '/premiumVideos/15989545698694.fw.png', '0', 'kokori', 'Dr. adeleke keyinde', NULL, '2020-09-01 17:02:49', '2020-09-01 17:02:49'),
(85, 'We build the future leaders', '1', 'good', '/premiumVideos/15989547746184.fw.png', '0', 'kokori', 'Dr. adeleke keyinde', NULL, '2020-09-01 17:06:14', '2020-09-01 17:06:14'),
(86, 'fear of fear', '1', 'good', 'http://127.0.0.1:8000/premiumVideos/1598955210956silicon valley - s02e01 (o2tvseries.com).mp4', '0', 'kokori', 'Barr. Richard Kingsley', NULL, '2020-09-01 17:13:30', '2020-09-01 17:13:30'),
(89, 'INDEX CASE: GOV DIRI ORDERS ONE-WEEK STAY-AT-HOME IN BAYELSA  INDEX CASE: GOV DIRI ORDERS ONE-WEEK STAY-AT-HOME IN BAYELSA  INDEX CASE: GOV DIRI ORDERS ONE-WEEK STAY-AT-HOME IN BAYELSA', '2', 'good', '/audios/1599797969912bennett b - midnight passionthe smoothjazz loft.mp3', '0', 'kokori', 'joe praize', NULL, '2020-09-11 11:19:29', '2020-09-11 11:19:29'),
(90, 'believe in God and be free', '4', '<p><span style=\"color: rgb(153, 153, 153); font-family: &quot;Nunito Sans&quot;, Arial, sans-serif; font-size: 16px; text-align: justify;\">Excellency, the Deputy Governor of our dear state, the head of the service, the chief of staff, deputy chief of staff, chief press secretary, principal secretary, the permanent secretary ministry of health and other very senior directors and officers of the ministry.</span><span style=\"color: rgb(153, 153, 153); font-family: &quot;Nunito Sans&quot;, Arial, sans-serif; font-size: 16px; text-align: justify;\"></span><br style=\"color: rgb(153, 153, 153); font-family: &quot;Nunito Sans&quot;, Arial, sans-serif; font-size: 16px; text-align: justify;\"><br style=\"color: rgb(153, 153, 153); font-family: &quot;Nunito Sans&quot;, Arial, sans-serif; font-size: 16px; text-align: justify;\"><span style=\"color: rgb(153, 153, 153); font-family: &quot;Nunito Sans&quot;, Arial, sans-serif; font-size: 16px; text-align: justify;\">You are aware that globally, there is a phenomenon that is threatening the health of all citizens across the world and unfortunately, we thought it was a phenomenon that is far away from Africa and not to mention our country Nigeria.</span><br style=\"color: rgb(153, 153, 153); font-family: &quot;Nunito Sans&quot;, Arial, sans-serif; font-size: 16px; text-align: justify;\"><br style=\"color: rgb(153, 153, 153); font-family: &quot;Nunito Sans&quot;, Arial, sans-serif; font-size: 16px; text-align: justify;\"><span style=\"color: rgb(153, 153, 153); font-family: &quot;Nunito Sans&quot;, Arial, sans-serif; font-size: 16px; text-align: justify;\">But unfortunately, the latest reports and developments is that the phenomenon is now here with us in Nigeria and that is the COVID, the Coronavirus that has devastated China and other countries, people dying in their thousands and so as a government and as a people, we felt it was necessary to invite you to look at safety valves so we can take preventive actions to ensure that this devastated sickness do not come into our shores here in Bayelsa.</span></p>', 'http://127.0.0.1:8000/upload/PRESS RELEASE ON HCW confirmed covid 19.pdf', '0', 'kokori', 'Dr. adeleke keyinde', NULL, '2020-09-11 11:46:22', '2020-09-11 11:46:22'),
(91, 'Jesus is lord over all', '4', '<p>good</p>', 'http://127.0.0.1:8000/upload/communication_strategy_pdf (5) (1).pdf', '0', 'kokori', 'Barr. Richard Kingsley', NULL, '2020-09-11 11:48:03', '2020-09-11 11:48:03'),
(92, 'SPDC Donates Medical Equipment To Bayelsa StateBayelsa State Governor, Senator Douye Diri, has pledged', '4', '<p>free</p>', 'http://127.0.0.1:8000/upload/covid 19 press 6.pdf', '0', 'kokori', 'SPDC Donates Medical Equipment To Bayelsa StateBayelsa State Governor, Senator Douye Diri, Has Pledged', NULL, '2020-09-11 12:20:15', '2020-09-11 12:20:15'),
(93, 'SPDC Donates Medical Equipment To Bayelsa StateBayelsa State Governor, Senator Douye Diri, has pledged PDC Donates Medical Equipment To Bayelsa StateBayelsa State Governor, Senator Douye Diri', '4', '<p>SPDC Donates Medical Equipment To Bayelsa Stat&nbsp;SPDC Donates Medical Equipment To Bayelsa Stat&nbsp;SPDC Donates Medical Equipment To Bayelsa Stat&nbsp;SPDC Donates Medical Equipment To Bayelsa Stat&nbsp;SPDC Donates Medical Equipment To Bayelsa Stat</p>', 'http://127.0.0.1:8000/upload/communication_strategy_pdf (5) (1).pdf', '0', 'kokori', 'Dr. adeleke keyinde', NULL, '2020-09-11 12:21:05', '2020-09-11 12:21:05');

-- --------------------------------------------------------

--
-- Table structure for table `resourcetype`
--

CREATE TABLE `resourcetype` (
  `typeID` int(10) UNSIGNED NOT NULL,
  `resource` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resourcetype`
--

INSERT INTO `resourcetype` (`typeID`, `resource`, `type`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'VIDEO', '1', NULL, NULL, NULL),
(2, 'AUDIO', '2', NULL, NULL, NULL),
(3, 'BOOK', '3', NULL, NULL, NULL),
(4, 'SERMON', '4', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `school`
--

CREATE TABLE `school` (
  `id` int(11) NOT NULL,
  `name` varchar(512) NOT NULL,
  `dateStarted` datetime NOT NULL,
  `type` varchar(512) NOT NULL,
  `gender` varchar(512) NOT NULL,
  `alumniId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `school`
--

INSERT INTO `school` (`id`, `name`, `dateStarted`, `type`, `gender`, `alumniId`) VALUES
(1, 'D\'Amore Inc', '2012-06-27 09:48:27', 'Seminary', 'Female', NULL),
(2, 'Bosco LLC', '2014-11-07 17:48:01', 'College', 'Male', NULL),
(3, 'Friesen, Thiel and Hoppe', '2008-10-22 19:07:03', 'University', 'Female', NULL),
(4, 'Hansen, Christiansen and Torphy', '2014-05-07 04:39:39', 'University', 'Male', NULL),
(5, 'Reichert-Bruen', '2015-05-04 04:33:55', 'Senior high school', 'Female', NULL),
(6, 'Yundt-Leffler', '2014-09-03 04:33:49', 'Senior high school', 'Female', NULL),
(7, 'Grimes-Maggio', '2019-04-25 13:34:29', 'Technical school', 'Male', NULL),
(8, 'Upton-D\'Amore', '2019-06-25 03:46:12', 'Seminary', 'Male', NULL),
(9, 'Hessel-MacGyver', '2009-08-20 06:38:45', 'Seminary', 'Female', NULL),
(10, 'Jerde Inc', '2012-04-27 02:21:47', 'Seminary', 'Male', NULL),
(11, 'Bashirian Group', '2013-04-19 00:59:25', 'Senior high school', 'Male', NULL),
(12, 'Quitzon Inc', '2003-06-01 14:33:10', 'University', 'Female', NULL),
(13, 'Murazik Group', '2005-07-10 16:46:46', 'Basic/Primary School', 'Male', NULL),
(14, 'Quigley Group', '2013-02-22 20:30:04', 'Basic/Primary School', 'Female', NULL),
(15, 'Frami Group', '2019-10-17 10:34:44', 'University', 'Female', NULL),
(16, 'Braun, Morar and Graham', '2001-12-25 18:16:11', 'Vocational school', 'Male', NULL),
(17, 'Wolff, Grimes and Grady', '2017-01-24 12:26:01', 'University', 'Female', NULL),
(18, 'Olson, Feeney and Balistreri', '2015-06-28 09:21:01', 'Basic/Primary School', 'Female', NULL),
(19, 'Olson, Waelchi and Langworth', '2011-04-25 14:43:28', 'University', 'Female', NULL),
(20, 'Hermann-Miller', '2009-05-03 01:58:23', 'Vocational school', 'Female', NULL),
(21, 'Thiel-Schneider', '2002-12-19 12:29:04', 'Basic/Primary School', 'Female', NULL),
(22, 'Moen Inc', '2017-09-08 17:32:35', 'Senior high school', 'Male', NULL),
(23, 'Bergnaum LLC', '2014-11-04 04:06:42', 'Junior high school', 'Male', NULL),
(24, 'Legros-Thompson', '2016-02-09 10:39:45', 'Junior high school', 'Male', NULL),
(25, 'Feeney, Yost and Breitenberg', '2012-05-25 04:16:39', 'Seminary', 'Male', NULL),
(26, 'Hahn, Brekke and Brekke', '2003-04-22 05:19:16', 'Vocational school', 'Female', NULL),
(27, 'Dietrich, Dickens and Brakus', '2017-08-31 23:00:00', 'Basic/Primary School', 'Male', NULL),
(28, 'Larkin-Bayer', '2002-08-29 07:00:10', 'Seminary', 'Male', NULL),
(29, 'Frami-Luettgen', '2005-02-10 09:58:31', 'University', 'Female', NULL),
(30, 'Hermann, Gleichner and Effertz', '2018-07-25 22:15:47', 'University', 'Female', NULL),
(31, 'Carter, West and Emard', '2011-03-22 19:23:55', 'University', 'Male', NULL),
(32, 'Morar, Bauch and Carroll', '2002-04-05 08:59:01', 'University', 'Female', NULL),
(33, 'Waelchi-Dicki', '2009-04-15 07:32:23', 'Seminary', 'Male', NULL),
(34, 'Satterfield-Luettgen', '2002-01-20 18:31:35', 'Vocational school', 'Male', NULL),
(35, 'Ullrich LLC', '2004-01-03 12:11:04', 'University', 'Female', NULL),
(36, 'Durgan, Langosh and Oberbrunner', '2007-07-24 14:15:43', 'Vocational school', 'Male', NULL),
(37, 'Zulauf LLC', '2015-07-06 14:35:19', 'Vocational school', 'Female', NULL),
(38, 'Weber, Douglas and Dach', '2006-01-27 14:14:51', 'Seminary', 'Male', NULL),
(39, 'Strosin, Botsford and MacGyver', '2010-04-29 14:48:26', 'Vocational school', 'Male', NULL),
(40, 'Jones, Skiles and Erdman', '2013-03-23 13:11:40', 'Basic/Primary School', 'Female', NULL),
(41, 'Senger Inc', '2011-07-22 00:37:38', 'Senior high school', 'Female', NULL),
(42, 'Feest LLC', '2012-09-01 08:31:14', 'Vocational school', 'Female', NULL),
(43, 'Kessler and Sons', '2010-01-23 14:59:11', 'College', 'Female', NULL),
(44, 'Kuhic-Johnson', '2001-02-10 02:05:44', 'University', 'Female', NULL),
(45, 'Rosenbaum and Sons', '2018-08-01 03:50:41', 'Seminary', 'Female', NULL),
(46, 'Jerde-Predovic', '2010-05-24 10:37:20', 'Basic/Primary School', 'Male', NULL),
(47, 'Feest-O\'Connell', '2017-06-09 08:14:26', 'Vocational school', 'Male', NULL),
(48, 'Herman-Hayes', '2015-07-15 22:20:23', 'Junior high school', 'Male', NULL),
(49, 'Baumbach, Herzog and Mueller', '2004-12-30 12:30:42', 'Seminary', 'Female', NULL),
(50, 'Wehner, Armstrong and Predovic', '2005-07-18 00:01:40', 'Basic/Primary School', 'Male', NULL),
(51, 'Dietrich, Windler and Will', '2000-12-26 20:34:08', 'University', 'Male', NULL),
(52, 'Zemlak, Little and Rolfson', '2013-03-13 16:02:53', 'Junior high school', 'Male', NULL),
(53, 'Grimes-Legros', '2009-04-03 23:36:58', 'Basic/Primary School', 'Male', NULL),
(54, 'Wolf, Kohler and Mayer', '2015-08-01 06:30:29', 'Basic/Primary School', 'Female', NULL),
(55, 'Muller, Reichert and Gibson', '2018-01-12 23:46:06', 'Technical school', 'Male', NULL),
(56, 'Parker Group', '2004-01-14 10:12:03', 'Vocational school', 'Female', NULL),
(57, 'Blanda, Mraz and Shanahan', '2004-11-18 16:05:04', 'University', 'Male', NULL),
(58, 'Mohr, Hagenes and Ullrich', '2005-07-03 18:50:12', 'Technical school', 'Female', NULL),
(59, 'Frami-Kulas', '2006-12-11 16:21:26', 'Seminary', 'Female', NULL),
(60, 'Ebert, Kulas and Abbott', '2009-09-03 07:14:12', 'University', 'Female', NULL),
(61, 'Hansen, Breitenberg and Reichert', '2007-08-26 23:30:21', 'Vocational school', 'Female', NULL),
(62, 'Becker, Hartmann and Ullrich', '2009-03-01 15:15:16', 'College', 'Male', NULL),
(63, 'Nienow Group', '2014-02-14 16:48:09', 'Seminary', 'Female', NULL),
(64, 'Jast, Kling and Turcotte', '2013-07-10 15:13:44', 'Junior high school', 'Female', NULL),
(65, 'Cassin-Hessel', '2009-05-01 13:25:13', 'Vocational school', 'Male', NULL),
(66, 'Bayer-Block', '2015-08-29 10:06:42', 'Vocational school', 'Female', NULL),
(67, 'Crona Group', '2001-11-29 08:06:12', 'University', 'Female', NULL),
(68, 'Swaniawski-Conroy', '2020-02-06 08:52:19', 'College', 'Female', NULL),
(69, 'Denesik-Murray', '2004-01-06 03:56:56', 'Seminary', 'Female', NULL),
(70, 'Rodriguez and Sons', '2012-08-20 17:22:24', 'Technical school', 'Male', NULL),
(71, 'Hessel, Braun and Conroy', '2013-03-25 12:24:18', 'University', 'Female', NULL),
(72, 'Runolfsdottir LLC', '2019-01-13 11:43:20', 'Senior high school', 'Female', NULL),
(73, 'Huels LLC', '2009-12-18 17:43:35', 'Basic/Primary School', 'Male', NULL),
(74, 'Kilback-Anderson', '2006-01-14 21:07:51', 'Senior high school', 'Female', NULL),
(75, 'Nitzsche-Erdman', '2014-01-16 04:36:18', 'College', 'Male', NULL),
(76, 'Maggio Group', '2015-08-02 10:33:30', 'Junior high school', 'Male', NULL),
(77, 'Moen and Sons', '2009-12-23 06:45:12', 'Vocational school', 'Female', NULL),
(78, 'Bauch-Mertz', '2003-04-29 19:06:13', 'Senior high school', 'Male', NULL),
(79, 'Trantow, Lueilwitz and Gusikowski', '2004-06-19 13:08:48', 'Senior high school', 'Female', NULL),
(80, 'Dare Inc', '2020-08-23 00:17:49', 'College', 'Female', NULL),
(81, 'Friesen-Huels', '2012-03-31 15:55:17', 'Basic/Primary School', 'Male', NULL),
(82, 'Keebler, Abshire and Zieme', '2006-07-13 01:11:54', 'Senior high school', 'Male', NULL),
(83, 'Veum, Nader and Connelly', '2008-12-01 01:01:05', 'Seminary', 'Female', NULL),
(84, 'Lebsack-Deckow', '2014-06-01 03:35:22', 'University', 'Female', NULL),
(85, 'Medhurst Group', '2003-05-08 07:17:44', 'Junior high school', 'Female', NULL),
(86, 'Fadel-Dibbert', '2003-04-04 20:17:16', 'Vocational school', 'Female', NULL),
(87, 'Collier-Gislason', '2013-11-07 22:45:01', 'College', 'Male', NULL),
(88, 'Kiehn-Johnson', '2011-04-07 14:45:11', 'University', 'Male', NULL),
(89, 'Dibbert-Stiedemann', '2017-06-26 00:24:42', 'Junior high school', 'Male', NULL),
(90, 'Bartell, Reichert and Kassulke', '2007-07-15 19:31:26', 'Technical school', 'Female', NULL),
(91, 'Heathcote LLC', '2009-01-18 18:40:19', 'College', 'Male', NULL),
(92, 'Hilll, Koss and Quigley', '2012-03-14 16:46:29', 'College', 'Female', NULL),
(93, 'Murazik-Bergstrom', '2005-06-07 23:58:10', 'Vocational school', 'Female', NULL),
(94, 'Stanton, Cormier and Marks', '2019-02-22 04:28:42', 'Seminary', 'Male', NULL),
(95, 'Will Group', '2014-08-22 14:18:00', 'Senior high school', 'Female', NULL),
(96, 'Morar, Spinka and Schmitt', '2007-04-12 22:15:37', 'Seminary', 'Female', NULL),
(97, 'Fisher, Hauck and Stamm', '2002-07-26 23:47:08', 'Seminary', 'Male', NULL),
(98, 'Rippin-Quigley', '2017-12-02 03:48:51', 'University', 'Female', NULL),
(99, 'Schultz-Bergstrom', '2002-10-21 03:11:55', 'Basic/Primary School', 'Female', NULL),
(100, 'Swift-Lowe', '2010-01-16 17:25:16', 'College', 'Male', NULL),
(101, 'McKenzie, Little and Schuster', '2017-02-15 06:04:13', 'Basic/Primary School', 'Female', NULL),
(102, 'Abernathy-Nienow', '2001-08-05 13:29:52', 'College', 'Male', NULL),
(103, 'Kovacek, Jacobs and Rowe', '2001-06-19 06:25:15', 'Vocational school', 'Male', NULL),
(104, 'Conroy-Smitham', '2006-04-06 03:49:54', 'Senior high school', 'Female', NULL),
(105, 'Spencer and Sons', '2015-12-18 16:24:29', 'Senior high school', 'Female', NULL),
(106, 'Konopelski Inc', '2008-04-22 14:30:10', 'Seminary', 'Female', NULL),
(107, 'Tillman-Fritsch', '2011-11-08 23:34:01', 'Junior high school', 'Male', NULL),
(108, 'Bernhard-Smitham', '2020-06-28 12:30:19', 'Basic/Primary School', 'Male', NULL),
(109, 'Terry, Brown and Zulauf', '2007-02-08 09:19:14', 'Vocational school', 'Female', NULL),
(110, 'Nader-Morar', '2013-12-20 15:25:43', 'Senior high school', 'Female', NULL),
(111, 'Mertz-Wilkinson', '2007-05-11 06:45:44', 'University', 'Male', NULL),
(112, 'Harber and Sons', '2011-04-17 05:36:35', 'College', 'Female', NULL),
(113, 'Orn-Mills', '2006-11-09 09:18:45', 'Basic/Primary School', 'Male', NULL),
(114, 'Sauer, McGlynn and Walsh', '2004-05-25 04:28:15', 'College', 'Male', NULL),
(115, 'Torphy, Kiehn and Purdy', '2004-02-23 21:30:38', 'Basic/Primary School', 'Male', NULL),
(116, 'McGlynn Inc', '2011-01-05 06:32:08', 'Technical school', 'Female', NULL),
(117, 'Bernier-Beer', '2017-10-22 05:40:54', 'University', 'Male', NULL),
(118, 'Doyle, Cremin and Buckridge', '2008-02-02 16:12:02', 'Senior high school', 'Male', NULL),
(119, 'Crist-Hayes', '2017-02-01 21:10:53', 'Technical school', 'Male', NULL),
(120, 'Schaefer-DuBuque', '2007-05-14 21:21:52', 'Seminary', 'Male', NULL),
(121, 'Trantow, Gorczany and Jaskolski', '2017-01-10 16:32:56', 'Junior high school', 'Female', NULL),
(122, 'Hauck Group', '2007-03-19 15:37:12', 'Technical school', 'Female', NULL),
(123, 'Trantow and Sons', '2000-12-09 06:32:29', 'Junior high school', 'Female', NULL),
(124, 'Tremblay-Simonis', '2007-01-10 10:48:40', 'Junior high school', 'Male', NULL),
(125, 'Rath and Sons', '2012-02-04 21:09:58', 'College', 'Male', NULL),
(126, 'Koss-Considine', '2006-07-04 08:53:00', 'Junior high school', 'Male', NULL),
(127, 'Grimes Group', '2003-05-02 21:00:59', 'Junior high school', 'Female', NULL),
(128, 'Pollich-Quigley', '2013-06-07 15:53:29', 'Vocational school', 'Female', NULL),
(129, 'Nader, Lesch and Altenwerth', '2019-07-03 20:53:29', 'College', 'Female', NULL),
(130, 'Adams Group', '2006-09-27 11:19:40', 'Senior high school', 'Male', NULL),
(131, 'Lebsack-Kris', '2003-03-16 10:13:22', 'University', 'Female', NULL),
(132, 'Mosciski Inc', '2019-06-22 17:09:21', 'Technical school', 'Female', NULL),
(133, 'Prosacco-Wolf', '2008-08-20 07:53:22', 'Technical school', 'Female', NULL),
(134, 'Hoppe, Hane and Moen', '2006-10-17 00:32:25', 'Seminary', 'Male', NULL),
(135, 'Robel Inc', '2009-04-13 04:15:00', 'University', 'Female', NULL),
(136, 'Heaney and Sons', '2015-05-02 04:16:18', 'Technical school', 'Male', NULL),
(137, 'Corwin Inc', '2015-05-16 21:52:34', 'Senior high school', 'Male', NULL),
(138, 'Lubowitz-Lind', '2011-06-24 07:09:31', 'Seminary', 'Female', NULL),
(139, 'Berge, Mayer and Franecki', '2013-11-12 08:56:54', 'Vocational school', 'Male', NULL),
(140, 'Barrows-Bauch', '2018-02-20 00:38:07', 'Basic/Primary School', 'Female', NULL),
(141, 'Simonis-Konopelski', '2012-03-06 06:59:28', 'Technical school', 'Male', NULL),
(142, 'Bradtke and Sons', '2012-02-08 15:31:47', 'Senior high school', 'Female', NULL),
(143, 'Funk-Wyman', '2004-02-26 01:16:17', 'Vocational school', 'Male', NULL),
(144, 'Spencer-Johnston', '2007-02-23 07:36:31', 'Seminary', 'Female', NULL),
(145, 'Abbott and Sons', '2010-01-26 05:02:23', 'Seminary', 'Female', NULL),
(146, 'Larson, Harris and Bernhard', '2016-04-06 04:45:06', 'College', 'Female', NULL),
(147, 'Upton LLC', '2006-01-01 00:36:19', 'Vocational school', 'Male', NULL),
(148, 'Hoeger LLC', '2010-04-26 13:15:24', 'Seminary', 'Male', NULL),
(149, 'Bashirian-Schaden', '2010-01-10 12:24:12', 'University', 'Male', NULL),
(150, 'Gleason Group', '2020-01-22 19:45:10', 'Junior high school', 'Female', NULL),
(151, 'Bergstrom LLC', '2001-02-08 02:38:55', 'University', 'Female', NULL),
(152, 'Romaguera Group', '2003-09-06 05:56:49', 'Basic/Primary School', 'Female', NULL),
(153, 'Satterfield, Jakubowski and Kub', '2012-01-11 10:07:33', 'Seminary', 'Male', NULL),
(154, 'Emard-Lang', '2020-09-11 05:13:48', 'Technical school', 'Female', NULL),
(155, 'Gutmann-Nicolas', '2001-03-10 08:39:49', 'Technical school', 'Male', NULL),
(156, 'Marvin, Wehner and O\'Kon', '2011-03-01 19:47:06', 'University', 'Male', NULL),
(157, 'Hane-Lockman', '2005-03-08 08:12:51', 'Vocational school', 'Female', NULL),
(158, 'MacGyver-Bergnaum', '2017-09-22 05:47:18', 'College', 'Male', NULL),
(159, 'Ebert-Goyette', '2019-11-28 06:32:50', 'Junior high school', 'Male', NULL),
(160, 'Lemke-Parker', '2019-12-16 14:35:45', 'Senior high school', 'Male', NULL),
(161, 'Hessel-Koch', '2007-01-03 07:24:59', 'Technical school', 'Female', NULL),
(162, 'Waelchi and Sons', '2015-11-28 00:47:46', 'Vocational school', 'Female', NULL),
(163, 'Rolfson Inc', '2013-06-03 09:57:52', 'Senior high school', 'Female', NULL),
(164, 'Kohler and Sons', '2020-01-15 02:24:02', 'Vocational school', 'Female', NULL),
(165, 'Erdman, Bogisich and Bernhard', '2010-11-09 05:53:39', 'Vocational school', 'Female', NULL),
(166, 'Marvin Inc', '2001-02-28 14:03:45', 'Junior high school', 'Male', NULL),
(167, 'Hand Inc', '2000-11-27 03:34:08', 'Seminary', 'Male', NULL),
(168, 'Nader, Mayer and Effertz', '2005-02-14 17:08:14', 'Junior high school', 'Male', NULL),
(169, 'Klocko-Hauck', '2011-01-22 09:16:39', 'University', 'Male', NULL),
(170, 'Veum LLC', '2003-09-05 11:54:32', 'Vocational school', 'Female', NULL),
(171, 'Schimmel-Krajcik', '2018-10-27 00:04:55', 'Technical school', 'Male', NULL),
(172, 'Johnston-O\'Conner', '2002-12-08 15:12:42', 'College', 'Male', NULL),
(173, 'Marquardt Inc', '2018-02-28 07:30:51', 'Vocational school', 'Female', NULL),
(174, 'McLaughlin Group', '2018-10-01 19:48:23', 'Technical school', 'Male', NULL),
(175, 'Bernier, Schmidt and Olson', '2013-05-15 00:46:45', 'Senior high school', 'Female', NULL),
(176, 'Crona, Grady and Turner', '2017-11-26 10:02:05', 'Junior high school', 'Male', NULL),
(177, 'Hagenes, Schmeler and Predovic', '2019-03-13 21:59:04', 'Seminary', 'Female', NULL),
(178, 'Hagenes LLC', '2004-03-19 18:23:49', 'Junior high school', 'Male', NULL),
(179, 'Halvorson, Cummings and Little', '2003-05-26 13:38:28', 'Senior high school', 'Male', NULL),
(180, 'Oberbrunner-O\'Hara', '2007-04-23 04:45:05', 'Technical school', 'Female', NULL),
(181, 'Stiedemann-Murazik', '2001-06-09 10:05:01', 'Basic/Primary School', 'Male', NULL),
(182, 'Cassin Inc', '2013-07-26 13:51:41', 'Seminary', 'Male', NULL),
(183, 'Cartwright, Ebert and D\'Amore', '2011-09-02 18:08:33', 'Senior high school', 'Female', NULL),
(184, 'Padberg, Huel and Schneider', '2002-06-26 12:23:33', 'Junior high school', 'Female', NULL),
(185, 'Fadel LLC', '2018-11-22 10:53:10', 'Seminary', 'Female', NULL),
(186, 'Stiedemann, Dickinson and Goyette', '2012-03-01 12:21:47', 'College', 'Female', NULL),
(187, 'Schulist-Barrows', '2019-11-28 15:15:10', 'Technical school', 'Male', NULL),
(188, 'Bahringer, Fay and Wuckert', '2014-12-06 10:16:06', 'College', 'Male', NULL),
(189, 'Schuster-Pollich', '2009-04-27 01:46:58', 'Seminary', 'Female', NULL),
(190, 'Kertzmann-Kuhlman', '2010-05-22 19:19:38', 'Technical school', 'Male', NULL),
(191, 'Lakin LLC', '2004-10-17 01:10:07', 'Basic/Primary School', 'Male', NULL),
(192, 'Stroman-Muller', '2014-05-22 10:11:06', 'Junior high school', 'Female', NULL),
(193, 'Murray-Pfeffer', '2020-02-04 06:50:04', 'Junior high school', 'Male', NULL),
(194, 'Lynch Inc', '2002-11-30 15:46:07', 'Basic/Primary School', 'Female', NULL),
(195, 'Stokes Group', '2007-11-10 20:39:28', 'University', 'Male', NULL),
(196, 'Monahan, Will and Koch', '2009-03-14 01:43:13', 'Vocational school', 'Male', NULL),
(197, 'Reilly-Schinner', '2013-02-23 04:59:08', 'Seminary', 'Female', NULL),
(198, 'Keebler, Wisoky and Bradtke', '2001-07-21 01:08:00', 'Junior high school', 'Male', NULL),
(199, 'Tremblay Inc', '2012-09-05 23:06:20', 'University', 'Female', NULL),
(200, 'McLaughlin, Armstrong and Leffler', '2002-10-03 22:00:13', 'Junior high school', 'Male', NULL),
(201, 'Streich-Reilly', '2004-03-17 19:03:48', 'University', 'mix', NULL),
(202, 'Larson, Lakin and Ryan', '2008-08-13 06:28:50', 'Senior high school', 'female', NULL),
(203, 'Lubowitz LLC', '2015-11-26 20:07:45', 'Basic/Primary School', 'male', NULL),
(204, 'Hane, McLaughlin and Dickens', '2007-02-02 12:01:07', 'Senior high school', 'female', NULL),
(205, 'Kilback, Wilkinson and Hansen', '2009-06-25 06:14:04', 'Junior high school', 'male', NULL),
(206, 'Schuppe-Boyer', '2009-02-16 17:41:52', 'Vocational school', 'male', NULL),
(207, 'Strosin, Morar and Weber', '2002-06-15 06:43:38', 'Senior high school', 'male', NULL),
(208, 'Effertz and Sons', '2006-09-22 16:50:18', 'Senior high school', 'female', NULL),
(209, 'Blanda, Franecki and Greenholt', '2006-01-25 10:12:33', 'Vocational school', 'female', NULL),
(210, 'Schaden LLC', '2017-07-20 20:09:17', 'Seminary', 'male', NULL),
(211, 'Kuvalis-Johnston', '2015-11-25 16:47:46', 'College', 'female', NULL),
(212, 'Hayes-Koch', '2005-01-18 14:11:59', 'Technical school', 'female', NULL),
(213, 'Swift-Jones', '2003-11-20 02:51:40', 'Technical school', 'male', NULL),
(214, 'Dibbert LLC', '2005-07-03 12:14:33', 'University', 'female', NULL),
(215, 'Bechtelar-Vandervort', '2012-08-08 09:05:00', 'University', 'mix', NULL),
(216, 'Legros Inc', '2000-10-26 18:30:03', 'Senior high school', 'mix', NULL),
(217, 'Cummerata-Haley', '2004-05-19 05:40:55', 'Vocational school', 'mix', NULL),
(218, 'White, Watsica and O\'Connell', '2003-11-20 09:50:26', 'Basic/Primary School', 'male', NULL),
(219, 'Christiansen-Schuster', '2005-07-17 02:28:50', 'Basic/Primary School', 'male', NULL),
(220, 'Cormier, Dach and Pagac', '2007-02-19 02:51:38', 'College', 'male', NULL),
(221, 'Crist-Lemke', '2001-01-24 21:52:28', 'Junior high school', 'mix', NULL),
(222, 'Bogisich Group', '2005-07-12 19:48:14', 'College', 'female', NULL),
(223, 'Zieme-Hahn', '2008-06-25 06:15:00', 'Vocational school', 'mix', NULL),
(224, 'Zieme, Schultz and Kovacek', '2011-09-29 00:59:34', 'University', 'mix', NULL),
(225, 'Renner Inc', '2019-02-01 14:25:49', 'Technical school', 'mix', NULL),
(226, 'Klein LLC', '2008-01-26 14:25:01', 'Basic/Primary School', 'female', NULL),
(227, 'Hirthe LLC', '2014-06-30 13:53:18', 'College', 'female', NULL),
(228, 'Mayer, Hermann and Ratke', '2004-07-18 20:58:57', 'Vocational school', 'mix', NULL),
(229, 'Leffler Inc', '2003-12-21 12:00:11', 'Technical school', 'mix', NULL),
(230, 'Sauer-Lind', '2020-08-22 08:39:14', 'College', 'male', NULL),
(231, 'Reinger-Witting', '2015-06-02 23:07:10', 'College', 'mix', NULL),
(232, 'Greenfelder and Sons', '2009-08-10 20:24:06', 'Senior high school', 'mix', NULL),
(233, 'Marvin, Huels and Weber', '2017-05-25 02:39:10', 'Seminary', 'mix', NULL),
(234, 'Pfeffer LLC', '2013-11-02 01:18:29', 'College', 'female', NULL),
(235, 'Gusikowski-Hudson', '2003-09-05 04:21:43', 'Junior high school', 'female', NULL),
(236, 'Wiegand-Blanda', '2017-07-03 13:34:33', 'Junior high school', 'male', NULL),
(237, 'Osinski-Greenfelder', '2017-02-23 11:51:41', 'University', 'female', NULL),
(238, 'Stehr-Huel', '2007-07-21 02:18:42', 'University', 'mix', NULL),
(239, 'Nitzsche-Windler', '2008-09-20 02:12:27', 'Vocational school', 'mix', NULL),
(240, 'Heaney LLC', '2003-04-07 23:53:37', 'Vocational school', 'female', NULL),
(241, 'Schiller-Walter', '2014-12-29 07:19:32', 'Vocational school', 'mix', NULL),
(242, 'Bernhard-Durgan', '2014-05-26 10:03:48', 'Basic/Primary School', 'female', NULL),
(243, 'Mann-Hermann', '2010-05-11 02:48:08', 'Junior high school', 'mix', NULL),
(244, 'McCullough LLC', '2001-01-12 07:12:03', 'Junior high school', 'male', NULL),
(245, 'Russel LLC', '2017-06-14 15:26:42', 'College', 'mix', NULL),
(246, 'Kunze, Krajcik and Schmeler', '2011-12-31 14:49:07', 'Vocational school', 'male', NULL),
(247, 'Heller Inc', '2004-05-21 09:06:52', 'Senior high school', 'male', NULL),
(248, 'Reilly-Swaniawski', '2019-06-29 10:08:39', 'Vocational school', 'male', NULL),
(249, 'Gorczany-Schowalter', '2014-02-05 21:25:36', 'Vocational school', 'male', NULL),
(250, 'Wiza Inc', '2017-10-25 05:26:59', 'College', 'female', NULL),
(251, 'Gusikowski-Prohaska', '2008-08-01 06:36:42', 'Junior high school', 'male', NULL),
(252, 'Nienow, Schaden and D\'Amore', '2001-10-27 12:01:07', 'Basic/Primary School', 'male', NULL),
(253, 'Lindgren-Robel', '2003-03-23 21:08:02', 'Technical school', 'male', NULL),
(254, 'Schaefer, Dickens and Brakus', '2014-06-25 20:07:22', 'Vocational school', 'male', NULL),
(255, 'Bradtke, Medhurst and Mayert', '2011-07-12 13:50:58', 'University', 'male', NULL),
(256, 'Wilderman, Lind and Rath', '2015-03-08 23:30:05', 'Senior high school', 'mix', NULL),
(257, 'Bechtelar, Lueilwitz and Schimmel', '2019-10-13 12:30:36', 'Technical school', 'male', NULL),
(258, 'Cruickshank, Koss and Little', '2011-11-15 14:48:42', 'Basic/Primary School', 'female', NULL),
(259, 'Dickens-Wilderman', '2005-07-31 01:20:42', 'Basic/Primary School', 'male', NULL),
(260, 'Harris and Sons', '2005-08-06 18:44:55', 'Technical school', 'mix', NULL),
(261, 'Hagenes and Sons', '2006-07-27 17:31:48', 'Basic/Primary School', 'male', NULL),
(262, 'Gerlach-Tillman', '2014-11-15 16:42:07', 'Senior high school', 'female', NULL),
(263, 'Stoltenberg, Predovic and Kohler', '2020-01-14 23:35:22', 'Basic/Primary School', 'male', NULL),
(264, 'Thiel, Legros and Rolfson', '2012-12-25 16:01:13', 'Basic/Primary School', 'male', NULL),
(265, 'Herzog and Sons', '2015-04-14 09:47:22', 'University', 'male', NULL),
(266, 'Beier, Krajcik and Hintz', '2020-05-02 12:56:39', 'Junior high school', 'mix', NULL),
(267, 'Wiegand and Sons', '2016-12-12 04:53:20', 'Technical school', 'mix', NULL),
(268, 'Shanahan, Wisoky and Wunsch', '2019-04-05 02:32:06', 'Junior high school', 'mix', NULL),
(269, 'Toy Inc', '2007-06-08 00:29:37', 'Junior high school', 'mix', NULL),
(270, 'Von, Wiegand and Kilback', '2020-02-29 13:01:15', 'College', 'mix', NULL),
(271, 'Kihn, Balistreri and Mitchell', '2001-07-13 11:19:35', 'University', 'female', NULL),
(272, 'Terry-Reilly', '2014-08-25 03:40:49', 'Basic/Primary School', 'male', NULL),
(273, 'Heidenreich Inc', '2010-04-01 13:59:42', 'Seminary', 'mix', NULL),
(274, 'Senger and Sons', '2010-04-16 08:36:01', 'Junior high school', 'female', NULL),
(275, 'Orn-Upton', '2008-03-12 08:31:39', 'Seminary', 'male', NULL),
(276, 'Armstrong, Schmitt and Hane', '2011-10-13 00:57:00', 'Junior high school', 'female', NULL),
(277, 'Moen Group', '2013-07-15 14:30:09', 'Vocational school', 'female', NULL),
(278, 'Walker-Carroll', '2006-03-29 10:10:21', 'Senior high school', 'male', NULL),
(279, 'Price LLC', '2003-09-13 04:15:02', 'Junior high school', 'female', NULL),
(280, 'Brown Inc', '2009-04-06 03:22:27', 'College', 'male', NULL),
(281, 'Denesik, Kemmer and Swift', '2003-09-08 08:14:01', 'College', 'male', NULL),
(282, 'Ritchie, Adams and Schroeder', '2005-12-21 05:02:04', 'Junior high school', 'male', NULL),
(283, 'Gleichner Group', '2016-07-29 03:42:44', 'Junior high school', 'male', NULL),
(284, 'Heller-Harvey', '2017-11-25 03:08:59', 'Technical school', 'female', NULL),
(285, 'Ankunding, Cruickshank and Ritchie', '2006-07-01 09:58:04', 'Junior high school', 'mix', NULL),
(286, 'Mayert LLC', '2002-12-28 05:30:18', 'Senior high school', 'female', NULL),
(287, 'Buckridge Inc', '2012-08-07 16:22:56', 'Senior high school', 'male', NULL),
(288, 'Denesik-Murphy', '2007-08-13 09:55:48', 'Basic/Primary School', 'mix', NULL),
(289, 'Kohler, Bergstrom and Hartmann', '2008-05-19 14:05:43', 'Vocational school', 'female', NULL),
(290, 'Nader Inc', '2004-01-08 16:35:49', 'Seminary', 'mix', NULL),
(291, 'Hauck, Trantow and Watsica', '2005-09-06 13:30:40', 'Vocational school', 'female', NULL),
(292, 'Wolff and Sons', '2017-11-27 16:56:54', 'Seminary', 'female', NULL),
(293, 'Goyette-Hartmann', '2016-07-19 20:34:37', 'Seminary', 'mix', NULL),
(294, 'Grant-Toy', '2005-01-29 22:09:28', 'Basic/Primary School', 'female', NULL),
(295, 'Metz LLC', '2020-08-21 11:03:52', 'Senior high school', 'female', NULL),
(296, 'Keebler-Gleason', '2015-08-07 16:52:37', 'Technical school', 'mix', NULL),
(297, 'Rosenbaum, Heathcote and Weissnat', '2017-01-27 02:17:18', 'University', 'male', NULL),
(298, 'Stehr Group', '2013-05-11 22:11:16', 'Technical school', 'mix', NULL),
(299, 'Lemke, Ratke and Labadie', '2010-12-27 20:01:54', 'Technical school', 'female', NULL),
(300, 'Krajcik LLC', '2009-11-07 00:51:52', 'College', 'female', NULL),
(301, 'All Nations University College', '2021-01-12 00:00:00', 'University', 'other', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `schooldetails`
--

CREATE TABLE `schooldetails` (
  `id` int(11) NOT NULL,
  `accommodationType` varchar(512) DEFAULT NULL,
  `helpline` varchar(512) DEFAULT NULL,
  `helpline2` varchar(512) DEFAULT NULL,
  `motto` varchar(512) DEFAULT NULL,
  `anthem` varchar(512) DEFAULT NULL,
  `departments` text DEFAULT NULL,
  `website` varchar(512) DEFAULT NULL,
  `about` varchar(512) DEFAULT NULL,
  `alias` varchar(512) DEFAULT NULL,
  `totalStudents` int(11) DEFAULT NULL,
  `studentAlias` varchar(512) DEFAULT NULL,
  `accommodationTypes` text DEFAULT NULL,
  `helpLines` varchar(512) DEFAULT NULL,
  `email` varchar(512) DEFAULT NULL,
  `mission` varchar(512) DEFAULT NULL,
  `vision` varchar(512) DEFAULT NULL,
  `alumniCount` int(11) DEFAULT NULL,
  `schoolId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schooldetails`
--

INSERT INTO `schooldetails` (`id`, `accommodationType`, `helpline`, `helpline2`, `motto`, `anthem`, `departments`, `website`, `about`, `alias`, `totalStudents`, `studentAlias`, `accommodationTypes`, `helpLines`, `email`, `mission`, `vision`, `alumniCount`, `schoolId`) VALUES
(1, 'No accommodation', '+1 616 995 6340', '927-754-8049', 'vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla', 'adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus', NULL, 'http://dummyimage.com/231x144.png/dddddd/000000', 'ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia', 'integer', 675, 'volutpat', NULL, '+98 129 953 5430', 'wmallabar0@github.com', 'mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id', 'sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in', 708, 1),
(2, 'Day', '+48 509 189 0441', '819-685-1681', 'integer ac neque duis bibendum morbi non quam nec dui luctus', 'accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus', NULL, 'http://dummyimage.com/189x230.png/5fa2dd/ffffff', 'orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst', 'sapien arcu', 543, 'sapien arcu', NULL, '+56 317 587 6754', 'lbrunstan3@jigsy.com', 'quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit', 'in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec', 431, 4),
(3, 'Boarding', '+55 888 743 5174', '833-924-0720', 'consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis', 'et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus', NULL, 'http://dummyimage.com/120x211.jpg/ff4444/ffffff', 'ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bi', 'at turpis', 865, 'est risus', NULL, '+86 233 662 8647', 'ebicker2@ocn.ne.jp', 'ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis', 'non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis', 848, 3),
(4, 'Rent', '+374 327 275 2190', '896-672-1119', 'accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi', 'amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare', NULL, 'http://dummyimage.com/190x177.png/dddddd/000000', 'purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id', 'ac', 888, 'purus', NULL, '+53 916 519 3296', 'atupman7@rambler.ru', 'mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit', 'sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque', 419, 8),
(5, 'Day', '+92 155 453 5571', '693-227-5698', 'integer pede justo lacinia eget tincidunt eget tempus vel pede morbi', 'posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat', NULL, 'http://dummyimage.com/238x210.png/ff4444/ffffff', 'vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est', 'in eleifend', 992, 'morbi', NULL, '+62 785 428 6200', 'hwoolfenden4@cbslocal.com', 'potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante', 'faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in', 986, 5),
(6, 'Day', '+86 600 746 3356', '429-138-2273', 'posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam', 'gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante', NULL, 'http://dummyimage.com/212x183.bmp/dddddd/000000', 'sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh', 'ut mauris', 175, 'pede', NULL, '+351 522 703 0598', 'hkollaschek5@washingtonpost.com', 'magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam', 'congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius', 994, 6),
(7, 'No accommodation', '+7 128 544 7904', '327-112-9532', 'mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar', 'mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis', NULL, 'http://dummyimage.com/243x224.png/cc0000/ffffff', 'vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget ', 'nulla tellus', 741, 'euismod', NULL, '+86 140 627 8679', 'wnutty9@seattletimes.com', 'dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel', 'nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem', 118, 10),
(8, 'Boarding', '+420 597 988 5149', '469-225-9950', 'quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec', 'aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non', NULL, 'http://dummyimage.com/227x151.jpg/dddddd/000000', 'justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum', 'molestie', 237, 'vel', NULL, '+86 730 516 0772', 'nasling8@xinhuanet.com', 'donec posuere metus vitae ipsum aliquam non mauris morbi non lectus', 'etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam', 312, 9),
(9, 'Hostel', '+62 758 811 4014', '828-609-9404', 'ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis', 'nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis', NULL, 'http://dummyimage.com/116x120.bmp/ff4444/ffffff', 'sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi', 'sapien', 598, 'ullamcorper', NULL, '+63 173 915 7362', 'rshevlin1@redcross.org', 'donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium', 'nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis', 587, 2),
(10, 'Hall', '+62 567 787 1360', '415-969-1075', 'in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien', 'dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet', NULL, 'http://dummyimage.com/115x179.png/cc0000/ffffff', 'viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna', 'pede lobortis', 239, 'leo rhoncus', NULL, '+81 113 423 1986', 'fbetza@phoca.cz', 'magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est', 'aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel', 822, 11),
(11, 'Hostel', '+1 432 752 8356', '543-345-6464', 'praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut', 'nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum', NULL, 'http://dummyimage.com/174x125.png/cc0000/ffffff', 'convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien', 'nulla nisl', 928, 'vulputate luctus', NULL, '+63 587 635 9979', 'hhaversonb@sfgate.com', 'pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula', 'lacinia aenean sit amet justo morbi ut odio cras mi', 579, 12),
(12, 'Day', '+595 519 865 7496', '149-143-0442', 'at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum', 'tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id', NULL, 'http://dummyimage.com/216x229.jpg/ff4444/ffffff', 'in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis', 'amet', 888, 'nibh in', NULL, '+62 447 220 1869', 'ewoodward6@woothemes.com', 'id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat', 'etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla', 60, 7),
(13, 'Hostel', '+62 589 934 5255', '876-575-8668', 'nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id', 'convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel', NULL, 'http://dummyimage.com/144x121.jpg/dddddd/000000', 'ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit', 'lacus morbi', 461, 'malesuada in', NULL, '+46 479 547 7025', 'nkindallc@slashdot.org', 'eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis', 'nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin', 159, 13),
(14, 'Day', '+81 355 496 6862', '461-497-3412', 'habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien', 'nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl', NULL, 'http://dummyimage.com/131x233.jpg/cc0000/ffffff', 'sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient', 'convallis nulla', 351, 'in', NULL, '+51 735 810 1567', 'escrivend@google.com.au', 'non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla', 'ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a', 689, 14),
(15, 'Day', '+46 171 157 6816', '812-329-7510', 'mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede', 'vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis', NULL, 'http://dummyimage.com/217x157.jpg/dddddd/000000', 'nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar', 'pellentesque ultrices', 58, 'mauris', NULL, '+62 534 528 4869', 'eubsdalee@craigslist.org', 'sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede', 'nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat', 494, 15),
(16, 'No accommodation', '+351 336 334 5748', '192-383-8249', 'platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida', 'felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed', NULL, 'http://dummyimage.com/112x112.jpg/dddddd/000000', 'cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maece', 'in hac', 387, 'curae duis', NULL, '+372 524 492 6462', 'lhagartf@behance.net', 'blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim', 'vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi', 908, 16),
(17, 'Day', '+62 371 217 9059', '672-431-0252', 'non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et', 'elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing', NULL, 'http://dummyimage.com/207x140.bmp/cc0000/ffffff', 'ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum', 'mauris ullamcorper', 331, 'gravida sem', NULL, '+52 646 680 2059', 'sfrankcombeg@example.com', 'aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus', 'in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at', 891, 17),
(18, 'Hostel', '+62 989 289 3201', '510-259-9606', 'orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a', 'elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi', NULL, 'http://dummyimage.com/164x137.png/5fa2dd/ffffff', 'nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis', 'blandit lacinia', 308, 'fusce', NULL, '+420 673 474 2841', 'kaltoftsh@pcworld.com', 'pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit', 'sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac', 400, 18),
(19, 'Boarding', '+86 546 543 7373', '557-566-0719', 'proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis', 'turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi', NULL, 'http://dummyimage.com/141x229.png/dddddd/000000', 'vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis', 'orci', 130, 'pede', NULL, '+1 423 785 9796', 'icacketti@booking.com', 'in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum', 'neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in', 730, 19),
(20, 'No accommodation', '+62 322 288 1731', '461-363-3871', 'ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit', 'vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim', NULL, 'http://dummyimage.com/126x195.bmp/cc0000/ffffff', 'sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in', 'sed', 533, 'integer', NULL, '+62 995 445 0128', 'ndyetj@sfgate.com', 'id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci', 'nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor', 166, 20),
(21, 'Day', '+62 420 734 1695', '345-742-0420', 'ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi', 'odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus', NULL, 'http://dummyimage.com/197x243.png/dddddd/000000', 'aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo', 'imperdiet', 733, 'donec ut', NULL, '+86 326 818 6426', 'abrizlandk@scientificamerican.com', 'vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed', 'potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et', 643, 21),
(22, 'Rent', '+7 647 668 1077', '145-993-7187', 'nibh in lectus pellentesque at nulla suspendisse potenti cras in purus', 'sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia', NULL, 'http://dummyimage.com/135x101.jpg/5fa2dd/ffffff', 'sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin', 'dolor sit', 234, 'leo maecenas', NULL, '+54 835 151 9305', 'dizattl@dailymail.co.uk', 'tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum', 'sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet', 887, 22),
(23, 'Hostel', '+55 893 138 3680', '113-541-8767', 'eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien', 'ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla', NULL, 'http://dummyimage.com/245x186.png/dddddd/000000', 'quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at', 'ultrices mattis', 245, 'vel', NULL, '+358 407 801 4793', 'llonglandm@cbslocal.com', 'dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet', 'id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia', 356, 23),
(24, 'No accommodation', '+63 424 956 7376', '322-257-8903', 'tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque', 'imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit', NULL, 'http://dummyimage.com/174x152.jpg/ff4444/ffffff', 'justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt e', 'quis libero', 592, 'vel nisl', NULL, '+86 177 256 8323', 'cschistln@privacy.gov.au', 'massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea', 'ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit', 508, 24),
(25, 'Rent', '+216 615 506 1664', '191-583-2003', 'consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum in', 'lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in', NULL, 'http://dummyimage.com/170x150.png/ff4444/ffffff', 'viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede', 'quis', 474, 'curabitur', NULL, '+84 309 496 1756', 'rpeso@sphinn.com', 'neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis', 'nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac', 656, 25),
(26, 'Boarding', '+30 905 400 3775', '598-834-4865', 'nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros', 'curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan', NULL, 'http://dummyimage.com/125x184.png/ff4444/ffffff', 'at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla', 'at velit', 619, 'morbi', NULL, '+81 721 661 9451', 'imagennyp@mysql.com', 'nunc proin at turpis a pede posuere nonummy integer non velit donec', 'semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus', 57, 26),
(27, 'Day', '+86 740 607 9515', '553-587-1062', 'fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis', 'felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec', NULL, 'http://dummyimage.com/197x137.jpg/ff4444/ffffff', 'consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio', 'dapibus duis', 333, 'cubilia curae', NULL, '+51 489 886 4098', 'sscooneq@apple.com', 'amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis', 'odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a', 62, 27),
(28, 'Boarding', '+55 623 452 4866', '377-789-4552', 'justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem', 'nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus', NULL, 'http://dummyimage.com/126x246.jpg/dddddd/000000', 'pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante', 'in', 930, 'pede', NULL, '+255 532 904 4682', 'savramovr@blog.com', 'in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer', 'vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut', 362, 28),
(29, 'Hall', '+351 743 543 9996', '231-371-6873', 'sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum', 'nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus', NULL, 'http://dummyimage.com/227x130.png/ff4444/ffffff', 'sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus', 'erat', 480, 'in quis', NULL, '+86 948 638 9130', 'sforces@harvard.edu', 'vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum', 'cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis', 634, 29),
(30, 'No accommodation', '+48 898 343 9471', '656-734-7724', 'orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a', 'dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat', NULL, 'http://dummyimage.com/144x206.jpg/cc0000/ffffff', 'lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta', 'amet', 304, 'quis', NULL, '+86 179 286 5386', 'aclowneyt@cbslocal.com', 'ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices', 'nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum', 972, 30),
(31, 'Hostel', '+218 899 530 2251', '248-848-2568', 'massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas', 'feugiat et eros vestibulum ac est lacinia nisi venenatis tristique', NULL, 'http://dummyimage.com/140x117.png/5fa2dd/ffffff', 'nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut', 'ipsum', 576, 'lacinia', NULL, '+33 677 228 9836', 'dcazinu@goo.ne.jp', 'nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis', 'vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat', 642, 31),
(32, 'Hostel', '+960 558 823 5068', '439-474-2763', 'aenean sit amet justo morbi ut odio cras mi pede malesuada', 'congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus', NULL, 'http://dummyimage.com/236x139.bmp/5fa2dd/ffffff', 'vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi', 'imperdiet sapien', 299, 'ipsum primis', NULL, '+351 451 141 8949', 'swarrilowv@cloudflare.com', 'eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere', 'maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros', 299, 32),
(33, 'Day', '+62 182 168 1106', '962-424-1418', 'augue a suscipit nulla elit ac nulla sed vel enim', 'rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede', NULL, 'http://dummyimage.com/131x145.png/ff4444/ffffff', 'vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede', 'erat', 149, 'volutpat', NULL, '+62 115 867 7225', 'gtanzerw@sun.com', 'aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo', 'massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer', 480, 33),
(34, 'Hostel', '+86 469 710 8664', '847-818-0993', 'a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt', 'duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia', NULL, 'http://dummyimage.com/190x133.jpg/dddddd/000000', 'eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictu', 'vivamus vel', 187, 'dapibus', NULL, '+62 148 444 2677', 'mbartolomeonix@spotify.com', 'suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien', 'turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est', 971, 34),
(35, 'Hostel', '+46 370 647 4748', '485-743-2768', 'mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus', 'ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque', NULL, 'http://dummyimage.com/114x157.png/cc0000/ffffff', 'at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in', 'convallis morbi', 386, 'donec odio', NULL, '+66 795 923 6407', 'abaxy@yale.edu', 'diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam', 'ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi', 711, 35),
(36, 'Day', '+62 658 451 6079', '423-737-4355', 'cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at', 'aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non', NULL, 'http://dummyimage.com/224x115.jpg/dddddd/000000', 'in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque', 'hac habitasse', 216, 'neque duis', NULL, '+48 385 126 8769', 'kgetcliffez@comsenz.com', 'leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem', 'nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit', 571, 36),
(37, 'Rent', '+46 529 269 5872', '683-109-2477', 'luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur', 'porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien', NULL, 'http://dummyimage.com/205x197.jpg/cc0000/ffffff', 'nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna', 'augue', 638, 'cursus vestibulum', NULL, '+62 228 258 2760', 'dchitson10@cnbc.com', 'quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices', 'donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis', 331, 37),
(38, 'No accommodation', '+420 989 131 3053', '839-854-8519', 'mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis', 'a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero', NULL, 'http://dummyimage.com/201x250.bmp/5fa2dd/ffffff', 'integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac', 'pellentesque ultrices', 562, 'aliquet', NULL, '+45 631 256 7850', 'nbeccero11@wikia.com', 'odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula', 'risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum', 109, 38),
(39, 'No accommodation', '+60 201 893 7649', '709-626-1980', 'mi nulla ac enim in tempor turpis nec euismod scelerisque', 'in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer', NULL, 'http://dummyimage.com/128x222.jpg/ff4444/ffffff', 'aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque', 'justo', 132, 'cras', NULL, '+977 163 615 3844', 'lslocket13@google.fr', 'ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet', 'vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo', 860, 40),
(40, 'Hall', '+509 957 548 4728', '174-823-8841', 'varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla', 'volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis', NULL, 'http://dummyimage.com/168x215.jpg/dddddd/000000', 'sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ', 'mi nulla', 525, 'non', NULL, '+7 350 491 5287', 'bschulz12@loc.gov', 'a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec', 'convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula', 533, 39),
(41, 'Boarding', '+86 227 735 9066', '103-142-1263', 'vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus', 'in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla', NULL, 'http://dummyimage.com/118x170.png/5fa2dd/ffffff', 'in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat mor', 'ut', 202, 'lorem ipsum', NULL, '+86 566 994 6754', 'bfrunks14@quantcast.com', 'pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus', 'integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor', 663, 41);
INSERT INTO `schooldetails` (`id`, `accommodationType`, `helpline`, `helpline2`, `motto`, `anthem`, `departments`, `website`, `about`, `alias`, `totalStudents`, `studentAlias`, `accommodationTypes`, `helpLines`, `email`, `mission`, `vision`, `alumniCount`, `schoolId`) VALUES
(42, 'No accommodation', '+62 344 393 1202', '453-983-5147', 'sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis', 'eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus', NULL, 'http://dummyimage.com/172x125.jpg/5fa2dd/ffffff', 'ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit', 'tristique', 672, 'facilisi', NULL, '+86 292 324 1214', 'mdurno15@marriott.com', 'dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat', 'eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec', 554, 42),
(43, 'Day', '+7 607 950 9431', '784-298-1445', 'fusce congue diam id ornare imperdiet sapien urna pretium nisl', 'duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum', NULL, 'http://dummyimage.com/171x148.jpg/5fa2dd/ffffff', 'ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat', 'nullam', 284, 'accumsan', NULL, '+359 508 340 3103', 'fportlock16@g.co', 'curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam', 'potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam', 693, 43),
(44, 'No accommodation', '+33 682 771 0350', '935-353-9564', 'velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros', 'amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales', NULL, 'http://dummyimage.com/129x128.jpg/dddddd/000000', 'et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida', 'malesuada', 352, 'in', NULL, '+86 865 438 3143', 'estripp18@shareasale.com', 'elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus', 'vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec', 123, 45),
(45, 'Hall', '+261 318 919 4208', '876-401-8084', 'etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate', 'donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede', NULL, 'http://dummyimage.com/211x165.jpg/ff4444/ffffff', 'pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque qu', 'sapien', 845, 'dictumst', NULL, '+48 359 349 5967', 'sbuttgow17@dyndns.org', 'nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed', 'ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus', 327, 44),
(46, 'Hostel', '+82 579 733 6799', '904-341-3121', 'sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin', 'elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere', NULL, 'http://dummyimage.com/223x183.jpg/cc0000/ffffff', 'posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonum', 'ut nulla', 391, 'dapibus nulla', NULL, '+86 892 989 0700', 'plars19@blogger.com', 'pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet', 'justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo', 240, 46),
(47, 'Rent', '+48 263 143 0256', '991-488-1730', 'lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam', 'rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut', NULL, 'http://dummyimage.com/139x125.bmp/cc0000/ffffff', 'non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula', 'penatibus', 954, 'at', NULL, '+86 911 228 2257', 'wklousner1a@sitemeter.com', 'venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis', 'ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros', 681, 47),
(48, 'Day', '+98 452 472 0659', '636-403-3891', 'nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis', 'quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel', NULL, 'http://dummyimage.com/204x152.png/5fa2dd/ffffff', 'mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut', 'ante', 541, 'praesent blandit', NULL, '+55 654 281 7699', 'awilmott1b@myspace.com', 'velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium', 'dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue', 297, 48),
(49, 'Hostel', '+62 637 862 1450', '722-478-2509', 'nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse', 'faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet', NULL, 'http://dummyimage.com/212x242.jpg/ff4444/ffffff', 'varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis vel dapibus at diam nam', 'nunc purus', 668, 'rutrum', NULL, '+48 864 383 7083', 'cchetwind1c@themeforest.net', 'mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis', 'morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac', 743, 49),
(50, 'Day', '+63 434 853 2537', '722-742-1855', 'nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet', 'pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at', NULL, 'http://dummyimage.com/129x197.png/dddddd/000000', 'in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris', 'purus', 165, 'pede lobortis', NULL, '+86 300 447 7349', 'jsmowton1d@godaddy.com', 'nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis vel dapibus at diam nam tristique tortor eu', 'adipiscing elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi', 479, 50),
(51, 'Boarding', '+86 375 900 2781', '402-825-6692', 'quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam', 'fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut', NULL, 'http://dummyimage.com/128x230.jpg/cc0000/ffffff', 'posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam', 'lacus', 53, 'vestibulum', NULL, '+63 840 908 3488', 'jstollsteimer1e@deviantart.com', 'nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh', 'in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor', 141, 51),
(52, 'No accommodation', '+387 617 562 5296', '418-278-0645', 'lacus purus aliquet at feugiat non pretium quis lectus suspendisse', 'praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non', NULL, 'http://dummyimage.com/247x131.bmp/5fa2dd/ffffff', 'in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et', 'dis', 151, 'neque aenean', NULL, '+7 108 493 3234', 'sgaymer1f@europa.eu', 'in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum', 'vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit', 122, 52),
(53, 'Hostel', '+380 342 318 1921', '580-944-7360', 'lectus in est risus auctor sed tristique in tempus sit', 'id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor', NULL, 'http://dummyimage.com/102x214.bmp/ff4444/ffffff', 'volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus or', 'amet', 173, 'lorem vitae', NULL, '+225 735 752 7031', 'egamon1g@ucla.edu', 'vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel', 'porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at', 327, 53),
(54, 'No accommodation', '+7 873 962 7577', '329-166-2554', 'nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae', 'consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc', NULL, 'http://dummyimage.com/117x106.png/ff4444/ffffff', 'ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero', 'pede', 179, 'consequat morbi', NULL, '+355 177 447 4195', 'tcody1h@ovh.net', 'molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum', 'duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin', 581, 54),
(55, 'Boarding', '+33 989 576 1261', '897-772-6438', 'nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus', 'nulla quisque arcu libero rutrum ac lobortis vel dapibus at diam nam', NULL, 'http://dummyimage.com/227x155.jpg/dddddd/000000', 'adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non', 'in ante', 792, 'urna pretium', NULL, '+82 251 894 2798', 'dbride1i@auda.org.au', 'turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et', 'consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus', 263, 55),
(56, 'No accommodation', '+86 651 278 1968', '290-191-4604', 'sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor', 'ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi', NULL, 'http://dummyimage.com/157x169.png/cc0000/ffffff', 'auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo', 'cursus urna', 454, 'sit', NULL, '+1 215 663 4321', 'aninnoli1j@independent.co.uk', 'cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam', 'at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse', 903, 56),
(57, 'No accommodation', '+62 500 381 0433', '496-586-4088', 'vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper', 'bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed', NULL, 'http://dummyimage.com/236x199.png/5fa2dd/ffffff', 'risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ant', 'fermentum justo', 463, 'nulla', NULL, '+27 204 406 6436', 'whobbing1k@state.gov', 'nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent', 'ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam', 607, 57),
(58, 'No accommodation', '+86 678 404 9794', '228-431-2659', 'vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac', 'faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris', NULL, 'http://dummyimage.com/124x190.png/cc0000/ffffff', 'sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat', 'fermentum donec', 404, 'eros viverra', NULL, '+51 194 965 3898', 'mdevons1l@miibeian.gov.cn', 'vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at', 'praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor', 615, 58),
(59, 'Day', '+46 616 933 4258', '436-146-9770', 'turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc', 'fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis', NULL, 'http://dummyimage.com/164x228.bmp/cc0000/ffffff', 'in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo', 'congue risus', 73, 'sed', NULL, '+351 561 655 6673', 'benever1m@com.com', 'pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac', 'pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis', 210, 59),
(60, 'Rent', '+351 882 866 6634', '373-616-6044', 'curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus', 'nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed', NULL, 'http://dummyimage.com/241x156.png/ff4444/ffffff', 'faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis', 'diam', 785, 'justo', NULL, '+62 712 747 8568', 'jlinham1n@nydailynews.com', 'pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id', 'nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in', 289, 60),
(61, 'Day', '+62 348 740 2873', '692-195-3338', 'suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas', 'eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id', NULL, 'http://dummyimage.com/145x151.jpg/5fa2dd/ffffff', 'nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis', 'quam', 257, 'vestibulum proin', NULL, '+86 388 667 7293', 'ndisbury1o@homestead.com', 'commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum', 'nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas', 892, 61),
(62, 'Day', '+359 882 933 7592', '405-685-3495', 'orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus', 'etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi', NULL, 'http://dummyimage.com/242x227.jpg/dddddd/000000', 'neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesen', 'varius nulla', 169, 'in', NULL, '+63 926 171 2785', 'kredhole1p@theguardian.com', 'mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in', 'dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa', 635, 62),
(63, 'Hostel', '+1 360 224 1799', '550-764-4329', 'vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis', 'condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus', NULL, 'http://dummyimage.com/247x107.png/ff4444/ffffff', 'neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio', 'hac', 648, 'dapibus at', NULL, '+33 440 182 2399', 'scolling1q@163.com', 'in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse', 'faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at', 65, 63),
(64, 'Hall', '+86 968 787 6677', '960-928-7267', 'morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed', 'lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta', NULL, 'http://dummyimage.com/166x170.png/5fa2dd/ffffff', 'metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam co', 'pretium iaculis', 821, 'aliquam convallis', NULL, '+84 248 481 6614', 'bsorrel1r@smugmug.com', 'duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas', 'purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut', 471, 64),
(65, 'Rent', '+385 680 167 3070', '925-160-1698', 'vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet', 'bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper', NULL, 'http://dummyimage.com/132x136.png/cc0000/ffffff', 'sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat prae', 'rutrum at', 966, 'et magnis', NULL, '+62 944 569 7444', 'kben1s@4shared.com', 'lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue', 'pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero', 807, 65),
(66, 'Hostel', '+62 250 953 5818', '508-966-9210', 'felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing', 'vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient', NULL, 'http://dummyimage.com/219x190.bmp/cc0000/ffffff', 'consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis vel dapibus at diam nam', 'penatibus', 561, 'pellentesque at', NULL, '+234 383 878 7250', 'mdjuricic1t@booking.com', 'sit amet consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia', 'elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis', 993, 66),
(67, 'Rent', '+63 741 850 1246', '124-888-8870', 'tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet', 'vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu', NULL, 'http://dummyimage.com/169x147.bmp/ff4444/ffffff', 'enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie', 'aliquam', 517, 'purus phasellus', NULL, '+62 574 598 8894', 'aspeddin1v@multiply.com', 'pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus', 'varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra', 750, 68),
(68, 'Hostel', '+7 369 617 2019', '378-326-1319', 'sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis', 'tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit', NULL, 'http://dummyimage.com/183x199.bmp/cc0000/ffffff', 'molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id', 'eget', 97, 'cras', NULL, '+86 894 705 8395', 'gcofax1u@liveinternet.ru', 'pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper', 'velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper', 982, 67),
(69, 'Day', '+93 110 641 8689', '685-913-6507', 'erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit', 'vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit', NULL, 'http://dummyimage.com/236x106.jpg/dddddd/000000', 'diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris', 'sed vestibulum', 292, 'nec nisi', NULL, '+48 842 588 6205', 'ccasson1w@ameblo.jp', 'turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris', 'erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris', 638, 69),
(70, 'Hall', '+86 802 178 8289', '470-682-9999', 'in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec', 'adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc', NULL, 'http://dummyimage.com/173x172.png/cc0000/ffffff', 'eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim', 'ut', 53, 'posuere nonummy', NULL, '+389 251 976 2669', 'bcamerello1y@dyndns.org', 'semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis', 'a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat', 711, 71),
(71, 'Hall', '+62 547 106 3659', '509-152-9171', 'sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam', 'parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor', NULL, 'http://dummyimage.com/158x173.jpg/cc0000/ffffff', 'sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut mass', 'lectus', 301, 'nibh', NULL, '+7 583 117 9169', 'bstinton1x@msn.com', 'nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta', 'lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum', 913, 70),
(72, 'Hostel', '+385 931 153 2214', '179-890-8716', 'dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est', 'nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis', NULL, 'http://dummyimage.com/144x182.jpg/ff4444/ffffff', 'pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu', 'in', 383, 'faucibus orci', NULL, '+63 441 351 6549', 'mwaite1z@privacy.gov.au', 'eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien', 'nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis vel dapibus at diam nam', 310, 72),
(73, 'Rent', '+7 813 792 1398', '483-873-1048', 'pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio', 'morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam', NULL, 'http://dummyimage.com/133x137.png/dddddd/000000', 'donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet', 'vitae', 51, 'luctus et', NULL, '+970 485 364 0559', 'rderuel20@weibo.com', 'pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum', 'a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis vel dapibus at', 665, 73),
(74, 'Boarding', '+7 997 788 6644', '998-624-4085', 'vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis', 'et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean', NULL, 'http://dummyimage.com/145x130.png/dddddd/000000', 'sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent', 'nunc commodo', 56, 'a', NULL, '+30 793 426 7855', 'dcabrera21@privacy.gov.au', 'ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean', 'pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus', 65, 74),
(75, 'Day', '+55 392 494 0976', '369-589-6033', 'vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse', 'morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet', NULL, 'http://dummyimage.com/234x138.png/5fa2dd/ffffff', 'elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio', 'massa', 732, 'auctor sed', NULL, '+48 461 755 5931', 'ylydall24@salon.com', 'eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus', 'sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam', 429, 77),
(76, 'Hall', '+977 407 718 7311', '870-499-6938', 'donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan', 'ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est', NULL, 'http://dummyimage.com/159x150.jpg/5fa2dd/ffffff', 'sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci', 'molestie hendrerit', 998, 'morbi', NULL, '+31 505 356 0061', 'cbird23@washington.edu', 'mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus', 'ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus', 253, 76),
(77, 'Day', '+63 781 771 4857', '200-226-2792', 'mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus', 'tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus', NULL, 'http://dummyimage.com/168x175.png/ff4444/ffffff', 'faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integ', 'pede', 205, 'eu', NULL, '+51 115 278 2430', 'moldcote22@scientificamerican.com', 'nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit', 'eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien', 269, 75),
(78, 'Hostel', '+504 794 477 4139', '488-825-8278', 'eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod', 'ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor', NULL, 'http://dummyimage.com/174x178.png/ff4444/ffffff', 'porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu', 'leo maecenas', 721, 'placerat', NULL, '+98 909 136 2107', 'averna25@opensource.org', 'molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit', 'ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam', 999, 78);
INSERT INTO `schooldetails` (`id`, `accommodationType`, `helpline`, `helpline2`, `motto`, `anthem`, `departments`, `website`, `about`, `alias`, `totalStudents`, `studentAlias`, `accommodationTypes`, `helpLines`, `email`, `mission`, `vision`, `alumniCount`, `schoolId`) VALUES
(79, 'Rent', '+420 481 554 7920', '163-774-5769', 'eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus', 'proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis', NULL, 'http://dummyimage.com/134x139.bmp/5fa2dd/ffffff', 'sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus', 'purus eu', 118, 'vel nulla', NULL, '+86 340 397 8756', 'edoughartie26@ask.com', 'ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac', 'at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante', 78, 79),
(80, 'Boarding', '+385 815 794 1107', '324-656-8899', 'ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu', 'sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non', NULL, 'http://dummyimage.com/233x237.bmp/dddddd/000000', 'erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis', 'sed', 648, 'sit amet', NULL, '+34 261 857 5323', 'dlarmour27@blogs.com', 'nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum', 'mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi', 381, 80),
(81, 'Hall', '+63 459 931 4726', '480-266-3755', 'cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit', 'duis bibendum felis sed interdum venenatis turpis enim blandit mi in', NULL, 'http://dummyimage.com/230x210.png/5fa2dd/ffffff', 'nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius', 'diam', 433, 'eu', NULL, '+972 288 521 8693', 'sgarfit28@cnet.com', 'libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia', 'quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum', 672, 81),
(82, 'Hall', '+63 356 221 3386', '316-976-6796', 'ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed', 'platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia', NULL, 'http://dummyimage.com/151x220.bmp/ff4444/ffffff', 'lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo', 'primis in', 371, 'ipsum primis', NULL, '+27 503 644 8004', 'pstiegar29@yandex.ru', 'sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti', 'quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec', 899, 82),
(83, 'No accommodation', '+95 616 240 4991', '231-881-8991', 'luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida', 'tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero', NULL, 'http://dummyimage.com/246x118.bmp/ff4444/ffffff', 'nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non matt', 'lorem ipsum', 504, 'justo', NULL, '+62 577 110 2560', 'ecrosskell2a@baidu.com', 'faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac', 'eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum', 319, 83),
(84, 'No accommodation', '+351 349 268 7385', '119-894-3465', 'a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet', 'tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante', NULL, 'http://dummyimage.com/206x224.png/dddddd/000000', 'nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus', 'pellentesque quisque', 558, 'ligula', NULL, '+62 823 495 8870', 'gsnalom2b@ocn.ne.jp', 'eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante', 'ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis', 452, 84),
(85, 'Boarding', '+81 327 195 6765', '644-587-4575', 'et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis', 'morbi non quam nec dui luctus rutrum nulla tellus in sagittis', NULL, 'http://dummyimage.com/108x162.png/5fa2dd/ffffff', 'eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at', 'orci luctus', 165, 'vestibulum proin', NULL, '+20 987 819 3234', 'djosipovic2c@t.co', 'sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at', 'vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci', 466, 85),
(86, 'Hall', '+86 112 648 5279', '464-200-6907', 'luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante', 'erat quisque erat eros viverra eget congue eget semper rutrum nulla', NULL, 'http://dummyimage.com/185x117.bmp/cc0000/ffffff', 'ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac', 'nulla', 141, 'maecenas tristique', NULL, '+52 338 149 5563', 'hrielly2d@cafepress.com', 'id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate', 'velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus', 948, 86),
(87, 'Hostel', '+357 289 311 7060', '517-550-4420', 'dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia', 'et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut', NULL, 'http://dummyimage.com/173x147.png/dddddd/000000', 'nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet', 'nec', 77, 'ligula', NULL, '+51 432 129 1685', 'fmatous2e@baidu.com', 'nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante', 'aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus', 542, 87),
(88, 'Day', '+86 436 854 0995', '400-125-1079', 'vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper', 'proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec', NULL, 'http://dummyimage.com/121x182.bmp/dddddd/000000', 'volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque', 'nullam', 801, 'cubilia', NULL, '+230 817 506 5735', 'fmarioneau2f@wikia.com', 'neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue', 'nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus', 306, 88),
(89, 'Rent', '+86 544 909 3025', '954-760-9026', 'quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh', 'nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst', NULL, 'http://dummyimage.com/248x142.bmp/ff4444/ffffff', 'accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo', 'eu felis', 946, 'in hac', NULL, '+55 483 781 3097', 'nfearon2g@xing.com', 'est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien', 'amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus', 745, 89),
(90, 'Boarding', '+62 621 207 3843', '778-281-2863', 'erat volutpat in congue etiam justo etiam pretium iaculis justo in hac', 'at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper', NULL, 'http://dummyimage.com/146x138.png/dddddd/000000', 'turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin', 'lacus curabitur', 438, 'in', NULL, '+62 749 534 2195', 'rdalesio2h@loc.gov', 'dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum', 'egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus', 207, 90),
(91, 'Hostel', '+298 265 640 6464', '240-785-7262', 'et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing', 'sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel', NULL, 'http://dummyimage.com/235x115.bmp/dddddd/000000', 'duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sa', 'magna', 665, 'sed', NULL, '+48 775 205 0516', 'tpearn2i@opera.com', 'at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis', 'massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel', 389, 91),
(92, 'Day', '+63 512 923 8043', '564-839-5777', 'lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in', 'dolor sit amet consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien varius', NULL, 'http://dummyimage.com/204x125.png/dddddd/000000', 'quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt', 'lacus morbi', 388, 'sodales', NULL, '+31 142 710 9178', 'aritson2k@printfriendly.com', 'fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id', 'sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante', 903, 93),
(93, 'No accommodation', '+7 381 589 8927', '169-894-9245', 'diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis', 'justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat', NULL, 'http://dummyimage.com/214x183.png/dddddd/000000', 'aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed', 'eros', 1000, 'nec sem', NULL, '+86 260 356 8922', 'abowlesworth2j@oaic.gov.au', 'orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien', 'dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis', 965, 92),
(94, 'Day', '+380 125 525 4524', '480-784-3839', 'dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi', 'curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum', NULL, 'http://dummyimage.com/117x247.bmp/dddddd/000000', 'gravida sem praesent id massa id nisl venenatis lacinia aenean sit', 'viverra diam', 204, 'eu interdum', NULL, '+7 829 438 7548', 'lolochan2l@marketwatch.com', 'sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas', 'aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum', 130, 94),
(95, 'Hall', '+351 111 710 9173', '337-339-7289', 'eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed', 'gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam', NULL, 'http://dummyimage.com/219x215.jpg/ff4444/ffffff', 'eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio', 'sit amet', 911, 'vulputate', NULL, '+691 618 226 7916', 'jwormstone2m@boston.com', 'augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non', 'ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis', 115, 95),
(96, 'Rent', '+86 120 377 8151', '442-159-7939', 'elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante', 'turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia', NULL, 'http://dummyimage.com/155x158.bmp/dddddd/000000', 'lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc', 'dolor', 225, 'lectus in', NULL, '+62 193 546 5037', 'jjuorio2n@senate.gov', 'dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat', 'et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium', 227, 96),
(97, 'Hall', '+46 441 482 2713', '509-792-4599', 'justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat', 'duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien', NULL, 'http://dummyimage.com/204x246.bmp/ff4444/ffffff', 'hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at do', 'sem', 298, 'tempus', NULL, '+227 179 110 5905', 'lscardifield2o@nbcnews.com', 'tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla', 'morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis', 225, 97),
(98, 'Day', '+508 904 314 0437', '338-846-3339', 'maecenas tristique est et tempus semper est quam pharetra magna ac consequat', 'justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero', NULL, 'http://dummyimage.com/163x215.png/dddddd/000000', 'orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui', 'odio porttitor', 783, 'donec semper', NULL, '+502 369 768 9237', 'gatton2p@bbc.co.uk', 'adipiscing elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend', 'ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam', 856, 98),
(99, 'Hostel', '+57 752 431 2737', '206-407-4904', 'erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque', 'convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate', NULL, 'http://dummyimage.com/140x100.bmp/dddddd/000000', 'at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis vel dapibus at diam nam tristique', 'morbi', 364, 'id ligula', NULL, '+62 568 386 8083', 'hknollesgreen2q@php.net', 'congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec', 'arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam', 649, 99),
(100, 'Day', '+62 877 700 4689', '647-537-5660', 'eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum', 'vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac', NULL, 'http://dummyimage.com/125x209.bmp/dddddd/000000', 'platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis', 'montes', 328, 'volutpat in', NULL, '+62 760 844 8994', 'lkopec2r@goo.ne.jp', 'arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat', 'tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at', 870, 100),
(101, 'Rent', '+92 742 367 1643', '415-113-6221', 'aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis', 'odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque', NULL, 'http://dummyimage.com/132x117.jpg/cc0000/ffffff', 'vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis', 'ut ultrices', 179, 'sapien', NULL, '+39 120 722 1021', 'swhibley0@tinyurl.com', 'venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea', 'ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae', 86, 101),
(102, 'Day', '+66 712 711 5389', '172-123-3017', 'lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at', 'ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus', NULL, 'http://dummyimage.com/137x128.bmp/dddddd/000000', 'aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et', 'eu', 875, 'in', NULL, '+359 980 726 2397', 'awhisker1@networkadvertising.org', 'duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa', 'id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien', 976, 102),
(103, 'Boarding', '+237 728 598 5558', '533-880-0689', 'et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum', 'scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh', NULL, 'http://dummyimage.com/162x203.bmp/cc0000/ffffff', 'id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue', 'nulla', 959, 'vestibulum vestibulum', NULL, '+62 407 697 1385', 'gmaddyson2@comcast.net', 'tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec', 'adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est', 826, 103),
(104, 'Rent', '+86 346 432 2724', '298-419-0460', 'dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst', 'curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi', NULL, 'http://dummyimage.com/171x202.png/cc0000/ffffff', 'mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus', 'luctus tincidunt', 843, 'convallis eget', NULL, '+1 650 155 8825', 'sjosefer3@chicagotribune.com', 'vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque', 'pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id', 873, 104),
(105, 'Hall', '+86 196 374 4165', '150-713-8389', 'non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla', 'vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id', NULL, 'http://dummyimage.com/144x204.png/5fa2dd/ffffff', 'lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat', 'interdum', 304, 'at nulla', NULL, '+47 662 627 2948', 'mbaythrop4@bandcamp.com', 'morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor', 'sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus', 711, 105),
(106, 'No accommodation', '+63 442 512 8089', '563-572-7257', 'pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet', 'sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit', NULL, 'http://dummyimage.com/132x249.bmp/ff4444/ffffff', 'dolor sit amet consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum in', 'a', 65, 'amet', NULL, '+55 515 143 2335', 'mottam5@unc.edu', 'pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae', 'duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt', 375, 106),
(107, 'Hostel', '+7 489 995 7520', '656-868-5460', 'ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae', 'vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus', NULL, 'http://dummyimage.com/186x148.bmp/5fa2dd/ffffff', 'integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl', 'vestibulum', 51, 'pellentesque ultrices', NULL, '+261 646 794 4350', 'cschorah6@tamu.edu', 'magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra', 'nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque', 663, 107),
(108, 'Day', '+63 453 571 7873', '577-151-2212', 'auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio', 'duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus', NULL, 'http://dummyimage.com/219x189.png/ff4444/ffffff', 'pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy', 'augue vel', 512, 'lorem', NULL, '+48 487 131 2727', 'mvinck7@fc2.com', 'vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare', 'quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel', 758, 108),
(109, 'No accommodation', '+962 558 292 0665', '245-687-6482', 'convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus', 'natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient', NULL, 'http://dummyimage.com/244x166.jpg/dddddd/000000', 'luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna', 'ut nunc', 891, 'ante vestibulum', NULL, '+505 121 711 2104', 'hpickin8@indiatimes.com', 'vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent', 'turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris', 632, 109),
(110, 'No accommodation', '+62 764 308 8847', '268-397-5116', 'elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in', 'accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris', NULL, 'http://dummyimage.com/200x220.bmp/dddddd/000000', 'cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy', 'bibendum morbi', 304, 'cubilia curae', NULL, '+54 698 635 1759', 'jcalliss9@csmonitor.com', 'viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede', 'at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed', 917, 110),
(111, 'Hostel', '+351 349 113 4576', '507-242-1413', 'vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut', 'pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus', NULL, 'http://dummyimage.com/205x111.bmp/ff4444/ffffff', 'rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est c', 'tortor', 923, 'justo', NULL, '+351 912 657 4340', 'jcasseya@blogs.com', 'praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim', 'in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut', 279, 111),
(112, 'Rent', '+48 605 321 9042', '787-938-1541', 'rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus', 'molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat', NULL, 'http://dummyimage.com/246x153.bmp/dddddd/000000', 'blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse', 'purus', 580, 'sem', NULL, '+64 273 483 5373', 'aplesingb@nbcnews.com', 'magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi', 'mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum', 765, 112),
(113, 'Rent', '+351 999 937 2365', '891-490-3987', 'curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus', 'quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi', NULL, 'http://dummyimage.com/212x188.png/5fa2dd/ffffff', 'et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula', 'ultrices libero', 333, 'nec', NULL, '+62 720 682 4184', 'astowc@yelp.com', 'suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce', 'sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi', 325, 113),
(114, 'No accommodation', '+62 763 622 3852', '806-870-7068', 'in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis', 'nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes', NULL, 'http://dummyimage.com/108x214.jpg/cc0000/ffffff', 'pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit', 'tortor quis', 53, 'volutpat', NULL, '+62 920 963 1713', 'mwaferd@trellian.com', 'mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at', 'ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus', 975, 114),
(115, 'No accommodation', '+375 293 239 4163', '732-747-6851', 'elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at', 'adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus', NULL, 'http://dummyimage.com/107x247.bmp/ff4444/ffffff', 'non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis', 'nunc donec', 58, 'convallis', NULL, '+86 307 527 5114', 'gsonscheinf@rakuten.co.jp', 'vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio', 'justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et', 886, 116),
(116, 'Day', '+1 321 416 3161', '491-217-8087', 'justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat', 'accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices', NULL, 'http://dummyimage.com/212x205.png/dddddd/000000', 'vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse', 'neque aenean', 341, 'ut massa', NULL, '+86 257 151 8874', 'mhelise@wix.com', 'nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non', 'morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit', 580, 115),
(117, 'Hall', '+62 509 527 8931', '563-773-5872', 'tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non', 'et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus', NULL, 'http://dummyimage.com/249x238.jpg/cc0000/ffffff', 'amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum', 'felis', 839, 'vitae ipsum', NULL, '+62 431 645 5069', 'arizonh@facebook.com', 'justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas', 'iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum', 915, 118),
(118, 'Day', '+66 847 847 3875', '483-126-6437', 'vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere', 'maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque', NULL, 'http://dummyimage.com/124x143.png/ff4444/ffffff', 'pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales ', 'turpis', 279, 'et magnis', NULL, '+58 308 812 3849', 'kberzing@wordpress.org', 'id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum', 'aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla', 76, 117),
(119, 'Boarding', '+86 663 328 5466', '904-454-4698', 'aliquam erat volutpat in congue etiam justo etiam pretium iaculis', 'morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper', NULL, 'http://dummyimage.com/215x235.bmp/dddddd/000000', 'in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis', 'neque duis', 346, 'nisl', NULL, '+63 388 149 8118', 'wbergeti@newyorker.com', 'vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse', 'lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien', 411, 119);
INSERT INTO `schooldetails` (`id`, `accommodationType`, `helpline`, `helpline2`, `motto`, `anthem`, `departments`, `website`, `about`, `alias`, `totalStudents`, `studentAlias`, `accommodationTypes`, `helpLines`, `email`, `mission`, `vision`, `alumniCount`, `schoolId`) VALUES
(120, 'Day', '+57 174 850 0940', '202-681-3144', 'risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero', 'nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam', NULL, 'http://dummyimage.com/178x181.jpg/cc0000/ffffff', 'venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales', 'neque', 336, 'ac', NULL, '+62 761 956 0108', 'bioselevj@scribd.com', 'amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie', 'sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie', 167, 120),
(121, 'Hall', '+62 317 990 5093', '530-350-1715', 'nec nisi volutpat eleifend donec ut dolor morbi vel lectus in', 'ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in', NULL, 'http://dummyimage.com/110x229.png/5fa2dd/ffffff', 'ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est', 'morbi', 102, 'varius integer', NULL, '+48 935 517 8548', 'echarrissonk@twitter.com', 'luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et', 'vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed', 387, 121),
(122, 'Rent', '+86 473 596 4203', '575-545-7608', 'in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin', 'nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst', NULL, 'http://dummyimage.com/130x139.bmp/ff4444/ffffff', 'nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit', 'aenean', 544, 'natoque', NULL, '+62 795 322 4391', 'kmaccarranel@skype.com', 'curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor', 'congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis', 565, 122),
(123, 'Hostel', '+1 616 491 3009', '919-222-8068', 'convallis tortor risus dapibus augue vel accumsan tellus nisi eu', 'massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere', NULL, 'http://dummyimage.com/138x210.jpg/ff4444/ffffff', 'nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis', 'lectus vestibulum', 488, 'arcu adipiscing', NULL, '+7 305 768 4519', 'amulkerrinsm@artisteer.com', 'dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim', 'nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium', 318, 123),
(124, 'Boarding', '+33 830 527 4917', '450-878-4399', 'quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl', 'quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est', NULL, 'http://dummyimage.com/222x118.bmp/cc0000/ffffff', 'risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ant', 'volutpat', 844, 'rhoncus', NULL, '+86 741 926 6806', 'gvialn@microsoft.com', 'etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum', 'ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum', 931, 124),
(125, 'Rent', '+62 385 837 4676', '255-607-9617', 'maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas', 'ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque', NULL, 'http://dummyimage.com/165x172.png/ff4444/ffffff', 'erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam', 'in', 890, 'nulla', NULL, '+86 604 805 7923', 'ckindreado@cafepress.com', 'auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem', 'rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id', 917, 125),
(126, 'Hall', '+356 545 880 1985', '556-605-0755', 'nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit', 'nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque', NULL, 'http://dummyimage.com/165x170.png/ff4444/ffffff', 'vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi', 'posuere', 275, 'sed vel', NULL, '+51 889 539 5304', 'hendleyp@redcross.org', 'potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl', 'ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat', 965, 126),
(127, 'Boarding', '+351 648 792 4794', '940-666-7504', 'phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat', 'interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui', NULL, 'http://dummyimage.com/206x171.bmp/5fa2dd/ffffff', 'id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id', 'interdum', 747, 'non pretium', NULL, '+48 651 347 0110', 'hdebankeq@youku.com', 'eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet', 'accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam', 876, 127),
(128, 'Day', '+86 187 956 7376', '172-149-9395', 'consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo', 'fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac', NULL, 'http://dummyimage.com/228x176.bmp/cc0000/ffffff', 'tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperd', 'nibh in', 382, 'tempus vel', NULL, '+81 608 987 2438', 'screasyr@slate.com', 'nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus', 'suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut', 225, 128),
(129, 'Boarding', '+55 959 658 3149', '580-142-2803', 'interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est', 'vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia', NULL, 'http://dummyimage.com/242x205.bmp/cc0000/ffffff', 'cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae', 'nullam', 633, 'in tempor', NULL, '+48 982 226 3938', 'mlargents@histats.com', 'dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla', 'odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam', 172, 129),
(130, 'Day', '+234 753 668 5850', '117-185-8227', 'at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus', 'donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu', NULL, 'http://dummyimage.com/132x101.png/dddddd/000000', 'vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec', 'vel', 762, 'dui', NULL, '+86 122 589 1510', 'elawnt@barnesandnoble.com', 'amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus', 'aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus', 56, 130),
(131, 'No accommodation', '+380 192 643 8716', '149-679-5376', 'orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum', 'lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at', NULL, 'http://dummyimage.com/157x169.png/5fa2dd/ffffff', 'eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut mas', 'felis', 836, 'quam', NULL, '+86 288 317 9231', 'ddarkinsu@netvibes.com', 'sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus', 'turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar', 468, 131),
(132, 'Day', '+86 152 240 6318', '859-822-3545', 'ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit', 'praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in', NULL, 'http://dummyimage.com/105x113.jpg/5fa2dd/ffffff', 'morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridic', 'vel', 225, 'praesent id', NULL, '+54 898 166 3318', 'jhowatv@netvibes.com', 'at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst', 'metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque', 812, 132),
(133, 'Hostel', '+63 568 338 6452', '846-650-2822', 'dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla', 'sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis', NULL, 'http://dummyimage.com/212x121.bmp/cc0000/ffffff', 'id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum', 'luctus tincidunt', 629, 'donec ut', NULL, '+57 444 492 9097', 'gdoerrlingx@oakley.com', 'pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis', 'dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare', 364, 134),
(134, 'Boarding', '+502 856 893 0904', '557-739-7105', 'etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida', 'in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue', NULL, 'http://dummyimage.com/152x102.jpg/cc0000/ffffff', 'sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum m', 'ultrices libero', 652, 'magnis', NULL, '+62 430 963 1293', 'msandiferw@princeton.edu', 'diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec', 'mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo', 480, 133),
(135, 'Boarding', '+92 360 180 9373', '804-801-0517', 'maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien', 'cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in', NULL, 'http://dummyimage.com/150x169.png/cc0000/ffffff', 'ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue', 'pede', 221, 'mattis', NULL, '+86 312 231 0816', 'jlistery@nifty.com', 'mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue', 'ligula sit amet eleifend pede libero quis orci nullam molestie', 924, 135),
(136, 'Boarding', '+1 631 548 4106', '878-487-7130', 'bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis', 'ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium', NULL, 'http://dummyimage.com/208x145.jpg/cc0000/ffffff', 'eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras', 'aliquam sit', 96, 'a', NULL, '+81 213 876 0545', 'neverissz@chicagotribune.com', 'integer non velit donec diam neque vestibulum eget vulputate ut ultrices', 'iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate', 515, 136),
(137, 'No accommodation', '+1 304 450 5111', '938-845-9309', 'nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas', 'sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros', NULL, 'http://dummyimage.com/241x202.png/ff4444/ffffff', 'fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien', 'mattis', 193, 'quis', NULL, '+62 429 187 2054', 'ztreeby10@ebay.com', 'nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst', 'turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum', 822, 137),
(138, 'Day', '+86 953 241 9322', '908-858-6310', 'eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum', 'bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue', NULL, 'http://dummyimage.com/187x215.png/cc0000/ffffff', 'ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras', 'lobortis ligula', 756, 'interdum', NULL, '+86 932 647 4959', 'ashipway11@mashable.com', 'nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur', 'pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras', 576, 138),
(139, 'Day', '+385 598 745 6441', '173-824-5994', 'ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus', 'condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis', NULL, 'http://dummyimage.com/110x130.jpg/cc0000/ffffff', 'dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien', 'eros elementum', 810, 'ante', NULL, '+86 376 620 6136', 'lrickcord12@go.com', 'sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a', 'id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor', 142, 139),
(140, 'Rent', '+30 424 462 7654', '706-391-2345', 'nibh in lectus pellentesque at nulla suspendisse potenti cras in', 'amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor', NULL, 'http://dummyimage.com/175x140.bmp/ff4444/ffffff', 'molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam', 'quam', 650, 'lobortis convallis', NULL, '+86 228 329 1711', 'varr13@reuters.com', 'felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius', 'facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus', 238, 140),
(141, 'Hall', '+84 862 236 9046', '464-894-1630', 'vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin', 'ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis', NULL, 'http://dummyimage.com/157x230.bmp/dddddd/000000', 'justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere', 'vestibulum', 217, 'et ultrices', NULL, '+55 753 142 3113', 'smcilwain14@omniture.com', 'nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere', 'lectus aliquam sit amet diam in magna bibendum imperdiet nullam', 500, 141),
(142, 'Hall', '+86 764 760 5119', '270-696-3420', 'lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt', 'primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel', NULL, 'http://dummyimage.com/155x219.jpg/5fa2dd/ffffff', 'maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla', 'sit', 731, 'curae donec', NULL, '+7 276 793 6866', 'tcrossfield16@eventbrite.com', 'platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia', 'pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim', 862, 143),
(143, 'No accommodation', '+380 555 317 0887', '527-239-7205', 'id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia', 'aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras', NULL, 'http://dummyimage.com/200x192.jpg/ff4444/ffffff', 'placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo', 'hendrerit', 251, 'dolor', NULL, '+86 138 644 8582', 'rsemple15@comsenz.com', 'tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet', 'amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio', 233, 142),
(144, 'No accommodation', '+234 983 321 7734', '713-327-6109', 'scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a', 'laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh', NULL, 'http://dummyimage.com/123x218.png/5fa2dd/ffffff', 'nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis', 'pede', 121, 'semper interdum', NULL, '+86 202 151 2928', 'aludlamme18@skype.com', 'odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae', 'justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros', 891, 145),
(145, 'Hall', '+43 987 297 0218', '634-205-7648', 'integer non velit donec diam neque vestibulum eget vulputate ut ultrices', 'cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis', NULL, 'http://dummyimage.com/177x133.jpg/ff4444/ffffff', 'sit amet consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accum', 'lobortis', 592, 'felis sed', NULL, '+93 393 922 3961', 'cmourant17@ebay.co.uk', 'vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in', 'id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas', 978, 144),
(146, 'No accommodation', '+7 433 344 3598', '217-982-5795', 'dolor vel est donec odio justo sollicitudin ut suscipit a feugiat', 'vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel', NULL, 'http://dummyimage.com/149x145.jpg/cc0000/ffffff', 'pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget', 'eu', 826, 'imperdiet et', NULL, '+63 863 117 3336', 'tcalken1a@sogou.com', 'sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis', 'duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis', 518, 147),
(147, 'Rent', '+62 366 525 9246', '776-377-6518', 'justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim', 'ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse', NULL, 'http://dummyimage.com/175x177.jpg/5fa2dd/ffffff', 'lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem', 'mauris', 432, 'felis', NULL, '+54 614 196 2561', 'rgoodhall19@businessinsider.com', 'bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac', 'mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel', 273, 146),
(148, 'Day', '+351 811 695 4279', '526-722-6892', 'sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus', 'posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut', NULL, 'http://dummyimage.com/204x161.png/ff4444/ffffff', 'morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et', 'pretium', 390, 'eget nunc', NULL, '+63 332 109 2480', 'mdickerson1b@skype.com', 'at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis', 'velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla', 634, 148),
(149, 'Rent', '+850 817 937 5972', '816-747-0774', 'consequat lectus in est risus auctor sed tristique in tempus sit amet sem', 'lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus', NULL, 'http://dummyimage.com/238x228.bmp/5fa2dd/ffffff', 'rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicu', 'odio condimentum', 959, 'nam nulla', NULL, '+381 305 930 5413', 'aithell1c@wix.com', 'integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et', 'maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis', 484, 149),
(150, 'Hostel', '+7 323 162 3473', '112-406-5179', 'donec semper sapien a libero nam dui proin leo odio porttitor id consequat in', 'nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit', NULL, 'http://dummyimage.com/104x183.jpg/dddddd/000000', 'at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a', 'sapien urna', 171, 'donec pharetra', NULL, '+351 248 940 6735', 'skinde1d@virginia.edu', 'quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi', 'nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus', 371, 150),
(151, 'Hostel', '+46 183 751 0663', '649-533-8400', 'porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst', 'laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat', NULL, 'http://dummyimage.com/148x222.bmp/ff4444/ffffff', 'nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare', 'magna', 832, 'morbi', NULL, '+7 847 872 8636', 'jtivnan1e@globo.com', 'quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae', 'ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla', 716, 151),
(152, 'Day', '+387 531 240 2900', '239-922-9210', 'non quam nec dui luctus rutrum nulla tellus in sagittis', 'nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et', NULL, 'http://dummyimage.com/240x148.bmp/ff4444/ffffff', 'faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras n', 'lacinia', 682, 'mauris', NULL, '+55 341 526 3065', 'ewoodland1f@vistaprint.com', 'condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim', 'in libero ut massa volutpat convallis morbi odio odio elementum eu', 88, 152),
(153, 'Day', '+55 462 117 1500', '779-620-4881', 'porttitor id consequat in consequat ut nulla sed accumsan felis ut', 'eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim', NULL, 'http://dummyimage.com/238x234.jpg/dddddd/000000', 'cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maece', 'magnis dis', 495, 'diam', NULL, '+55 173 155 3947', 'skurtis1g@people.com.cn', 'in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget', 'sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa', 95, 153),
(154, 'Hostel', '+382 449 324 9489', '356-210-8746', 'quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus', 'maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin', NULL, 'http://dummyimage.com/174x142.png/5fa2dd/ffffff', 'hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis', 'parturient montes', 430, 'velit', NULL, '+252 748 315 0177', 'ewilfing1h@about.me', 'vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo', 'pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras', 284, 154),
(155, 'Hall', '+233 737 467 1821', '996-413-4095', 'in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae', 'ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque', NULL, 'http://dummyimage.com/238x101.bmp/ff4444/ffffff', 'fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean ', 'vitae consectetuer', 406, 'ligula pellentesque', NULL, '+66 534 989 7741', 'llogie1i@sciencedaily.com', 'vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque', 'praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non', 678, 155),
(156, 'Hostel', '+976 772 914 1408', '574-399-0311', 'lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia', 'nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id', NULL, 'http://dummyimage.com/150x100.bmp/ff4444/ffffff', 'vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper', 'suspendisse potenti', 399, 'tristique', NULL, '+54 706 693 7877', 'ldacks1j@gov.uk', 'nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum', 'rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel', 762, 156),
(157, 'No accommodation', '+62 778 380 1913', '246-311-6935', 'pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus', 'eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla', NULL, 'http://dummyimage.com/133x106.jpg/cc0000/ffffff', 'in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu', 'dis parturient', 359, 'massa id', NULL, '+86 537 257 3068', 'erispine1k@scientificamerican.com', 'vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel', 'lobortis ligula sit amet eleifend pede libero quis orci nullam', 730, 157);
INSERT INTO `schooldetails` (`id`, `accommodationType`, `helpline`, `helpline2`, `motto`, `anthem`, `departments`, `website`, `about`, `alias`, `totalStudents`, `studentAlias`, `accommodationTypes`, `helpLines`, `email`, `mission`, `vision`, `alumniCount`, `schoolId`) VALUES
(158, 'Hostel', '+86 554 416 1061', '197-600-5513', 'pede justo eu massa donec dapibus duis at velit eu est congue', 'est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus', NULL, 'http://dummyimage.com/151x229.bmp/5fa2dd/ffffff', 'in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut', 'est', 737, 'potenti in', NULL, '+86 182 434 3083', 'rspata1l@chronoengine.com', 'eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum', 'sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh', 886, 158),
(159, 'Hostel', '+62 322 420 1950', '557-546-7351', 'scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem', 'ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst', NULL, 'http://dummyimage.com/119x211.jpg/5fa2dd/ffffff', 'mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi no', 'lacus at', 658, 'molestie', NULL, '+30 339 275 5999', 'lakrigg1m@ted.com', 'consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget', 'praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante', 592, 159),
(160, 'Day', '+63 800 259 9640', '666-457-3407', 'amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus', 'montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit', NULL, 'http://dummyimage.com/205x130.bmp/ff4444/ffffff', 'posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus mo', 'eu felis', 994, 'cursus vestibulum', NULL, '+93 452 839 5453', 'rkeddie1n@tiny.cc', 'morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros', 'lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna', 932, 160),
(161, 'No accommodation', '+48 663 778 8410', '513-875-7704', 'eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci', 'integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit', NULL, 'http://dummyimage.com/227x115.png/dddddd/000000', 'condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac', 'ridiculus mus', 243, 'pede lobortis', NULL, '+1 287 473 0754', 'cdiprose1o@over-blog.com', 'lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit', 'sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla', 681, 161),
(162, 'No accommodation', '+62 552 793 0231', '888-612-7920', 'quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus', 'nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla', NULL, 'http://dummyimage.com/144x190.jpg/5fa2dd/ffffff', 'libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh', 'et ultrices', 991, 'nibh', NULL, '+62 633 391 5221', 'tkingsly1p@sun.com', 'eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae', 'metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum', 275, 162),
(163, 'Hostel', '+62 948 756 4032', '967-252-3915', 'et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida', 'convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien', NULL, 'http://dummyimage.com/216x171.bmp/ff4444/ffffff', 'nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum', 'diam vitae', 525, 'ut', NULL, '+63 917 429 9823', 'mgerb1q@plala.or.jp', 'venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam', 'blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique', 760, 163),
(164, 'Hall', '+86 942 487 5033', '871-294-8724', 'in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi', 'donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius', NULL, 'http://dummyimage.com/115x190.bmp/5fa2dd/ffffff', 'congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus', 'aliquet ultrices', 611, 'dui', NULL, '+86 822 755 1757', 'htrippick1r@msn.com', 'morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor', 'in felis donec semper sapien a libero nam dui proin leo', 68, 164),
(165, 'Day', '+62 245 130 7728', '284-141-8405', 'vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem', 'nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin', NULL, 'http://dummyimage.com/236x192.png/cc0000/ffffff', 'nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum ', 'lobortis', 607, 'sit', NULL, '+380 971 627 0326', 'mhowerd1s@discovery.com', 'pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet', 'nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum', 858, 165),
(166, 'Day', '+62 918 807 9387', '807-281-5561', 'non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque', 'praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede', NULL, 'http://dummyimage.com/213x221.jpg/cc0000/ffffff', 'cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus', 'eget elit', 831, 'massa quis', NULL, '+7 168 295 8232', 'dcoldman1t@webmd.com', 'imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc', 'et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non', 161, 166),
(167, 'Day', '+55 343 859 8538', '904-311-0095', 'natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque', 'convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim', NULL, 'http://dummyimage.com/235x116.jpg/cc0000/ffffff', 'aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus', 'amet', 591, 'nunc nisl', NULL, '+234 897 288 1660', 'bmusterd1u@scientificamerican.com', 'nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi', 'cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo', 979, 167),
(168, 'Hall', '+33 358 492 2541', '370-182-6242', 'magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia', 'ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt', NULL, 'http://dummyimage.com/243x122.bmp/dddddd/000000', 'consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula', 'sit', 755, 'felis', NULL, '+7 318 955 8588', 'cblackmoor1v@paginegialle.it', 'lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus', 'quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut', 800, 168),
(169, 'No accommodation', '+39 975 688 0234', '592-680-3128', 'tellus nisi eu orci mauris lacinia sapien quis libero nullam sit', 'faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae', NULL, 'http://dummyimage.com/151x165.bmp/dddddd/000000', 'tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse', 'vestibulum', 115, 'sollicitudin', NULL, '+1 788 178 5150', 'ichomicki1w@mtv.com', 'enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis', 'nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean', 354, 169),
(170, 'No accommodation', '+57 733 363 3082', '619-529-6006', 'tortor id nulla ultrices aliquet maecenas leo odio condimentum id', 'ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis', NULL, 'http://dummyimage.com/172x221.jpg/dddddd/000000', 'nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy', 'nulla', 905, 'duis', NULL, '+86 118 341 7457', 'korteu1x@illinois.edu', 'luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi', 'ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum', 60, 170),
(171, 'Day', '+86 150 797 8166', '924-588-9287', 'blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia', 'morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa', NULL, 'http://dummyimage.com/180x129.png/dddddd/000000', 'dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla', 'in', 851, 'orci', NULL, '+62 315 588 9482', 'abrettell1y@yandex.ru', 'mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris', 'sapien non mi integer ac neque duis bibendum morbi non', 91, 171),
(172, 'Hall', '+502 820 964 4852', '505-380-3711', 'tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin', 'ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero', NULL, 'http://dummyimage.com/109x142.jpg/5fa2dd/ffffff', 'felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id', 'velit donec', 564, 'ac', NULL, '+86 533 398 7015', 'rhostan20@mac.com', 'vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt', 'semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat', 563, 173),
(173, 'Day', '+31 658 325 0541', '762-227-9726', 'eu est congue elementum in hac habitasse platea dictumst morbi vestibulum', 'nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis', NULL, 'http://dummyimage.com/110x228.png/dddddd/000000', 'faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ul', 'nullam', 244, 'fermentum justo', NULL, '+7 756 111 6142', 'mferrelli21@cdbaby.com', 'quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem', 'tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu', 651, 174),
(174, 'Hostel', '+62 734 584 4113', '967-596-7328', 'lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc', 'eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros', NULL, 'http://dummyimage.com/210x218.jpg/dddddd/000000', 'volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero', 'massa tempor', 885, 'nisl', NULL, '+30 443 930 4764', 'wgremain22@wikia.com', 'posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut', 'semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla', 58, 175),
(175, 'No accommodation', '+62 459 736 9603', '575-509-0431', 'odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique', 'nunc purus phasellus in felis donec semper sapien a libero nam dui proin', NULL, 'http://dummyimage.com/204x107.bmp/5fa2dd/ffffff', 'scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis', 'ornare consequat', 248, 'lacinia eget', NULL, '+420 540 166 9660', 'cbeiderbecke1z@blogtalkradio.com', 'dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl', 'morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras', 442, 172),
(176, 'No accommodation', '+86 165 870 0282', '147-844-5824', 'posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum', 'nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat', NULL, 'http://dummyimage.com/134x173.jpg/cc0000/ffffff', 'elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros', 'posuere cubilia', 533, 'elementum', NULL, '+30 578 204 5752', 'boriel23@tripadvisor.com', 'sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur', 'dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare', 354, 176),
(177, 'Hostel', '+20 884 863 0503', '682-538-8002', 'sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean', 'sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis', NULL, 'http://dummyimage.com/126x110.jpg/ff4444/ffffff', 'duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices', 'ipsum', 292, 'ante ipsum', NULL, '+84 486 761 2185', 'ocollcott24@rediff.com', 'lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue', 'morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl', 273, 177),
(178, 'Day', '+212 271 604 5738', '561-786-6801', 'nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo', 'ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus', NULL, 'http://dummyimage.com/155x116.png/5fa2dd/ffffff', 'nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices', 'a feugiat', 407, 'eu felis', NULL, '+1 318 429 8227', 'akoschke25@walmart.com', 'egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et', 'in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus', 976, 178),
(179, 'No accommodation', '+7 453 422 8058', '825-157-4184', 'congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a', 'turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque', NULL, 'http://dummyimage.com/152x133.bmp/dddddd/000000', 'fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna', 'porttitor', 387, 'nec', NULL, '+62 680 296 1835', 'mstoter26@washingtonpost.com', 'neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh', 'fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat', 348, 179),
(180, 'Day', '+86 578 216 3666', '530-510-2506', 'malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit', 'scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis', NULL, 'http://dummyimage.com/133x186.png/dddddd/000000', 'aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce', 'mi nulla', 490, 'tristique', NULL, '+46 239 842 2269', 'smation27@gizmodo.com', 'primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et', 'posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna', 571, 180),
(181, 'No accommodation', '+232 898 380 0638', '919-130-2074', 'diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non', 'curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam', NULL, 'http://dummyimage.com/119x193.jpg/ff4444/ffffff', 'ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu', 'ligula', 94, 'venenatis non', NULL, '+242 306 952 6556', 'stures28@wired.com', 'venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed', 'ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat', 564, 181),
(182, 'Rent', '+351 837 229 2252', '373-395-0510', 'in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat', 'lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis', NULL, 'http://dummyimage.com/209x151.jpg/dddddd/000000', 'fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede', 'amet', 845, 'odio odio', NULL, '+33 751 375 3116', 'fwildman29@shop-pro.jp', 'dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis', 'amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet', 345, 182),
(183, 'Rent', '+86 608 732 6604', '941-258-6207', 'iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis', 'massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus', NULL, 'http://dummyimage.com/120x243.jpg/5fa2dd/ffffff', 'luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse', 'sit amet', 811, 'turpis', NULL, '+86 879 719 8504', 'ebrockbank2a@ycombinator.com', 'augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus', 'donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit', 433, 183),
(184, 'Boarding', '+81 188 388 1451', '149-543-4330', 'vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis', 'arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate', NULL, 'http://dummyimage.com/147x115.jpg/ff4444/ffffff', 'morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum', 'ipsum primis', 638, 'interdum mauris', NULL, '+46 868 773 5125', 'rwort2b@joomla.org', 'mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis', 'cras in purus eu magna vulputate luctus cum sociis natoque penatibus et', 214, 184),
(185, 'Boarding', '+33 390 516 1702', '680-505-6003', 'vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor', 'justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam', NULL, 'http://dummyimage.com/102x196.png/cc0000/ffffff', 'hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum', 'primis in', 84, 'mattis', NULL, '+81 583 110 4644', 'asego2c@microsoft.com', 'quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium', 'justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat', 86, 185),
(186, 'Hostel', '+86 174 624 1717', '968-677-7959', 'id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet', 'praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo', NULL, 'http://dummyimage.com/177x204.bmp/5fa2dd/ffffff', 'condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam', 'nullam', 482, 'vestibulum eget', NULL, '+86 197 221 5401', 'rshoosmith2d@ezinearticles.com', 'quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est', 'pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas', 604, 186),
(187, 'Day', '+380 582 275 2994', '279-590-5440', 'congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio', 'quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis', NULL, 'http://dummyimage.com/105x138.bmp/cc0000/ffffff', 'ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque', 'sapien', 830, 'rutrum', NULL, '+84 471 406 8834', 'mqueripel2e@nhs.uk', 'donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id', 'massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer', 339, 187),
(188, 'Boarding', '+93 844 956 7914', '663-541-0517', 'augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo', 'nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim', NULL, 'http://dummyimage.com/100x249.bmp/dddddd/000000', 'aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada', 'massa donec', 692, 'aliquam', NULL, '+351 966 195 3042', 'cmatczak2f@bluehost.com', 'in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin', 'magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris', 997, 188),
(189, 'Rent', '+62 613 543 2231', '274-219-1548', 'amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper', 'id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu', NULL, 'http://dummyimage.com/201x218.bmp/5fa2dd/ffffff', 'amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio', 'lobortis vel', 340, 'turpis enim', NULL, '+62 614 814 6037', 'hmarini2g@nifty.com', 'sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula', 'massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas', 230, 189),
(190, 'Hostel', '+972 366 487 8125', '813-161-0062', 'risus auctor sed tristique in tempus sit amet sem fusce consequat nulla', 'in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut', NULL, 'http://dummyimage.com/133x175.bmp/cc0000/ffffff', 'lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elem', 'ut', 231, 'in imperdiet', NULL, '+420 859 701 7569', 'fnussen2h@omniture.com', 'scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non', 'condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu', 305, 190),
(191, 'Hall', '+86 185 453 9778', '839-145-4443', 'ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna', 'in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt', NULL, 'http://dummyimage.com/176x229.png/ff4444/ffffff', 'pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti', 'quis', 669, 'pede ullamcorper', NULL, '+62 570 172 8527', 'wquinney2i@baidu.com', 'hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis', 'nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in', 323, 191),
(192, 'No accommodation', '+62 378 117 9656', '456-894-1310', 'neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit', 'quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed', NULL, 'http://dummyimage.com/162x234.jpg/5fa2dd/ffffff', 'habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo', 'justo', 821, 'eget', NULL, '+33 296 213 9305', 'pperrington2j@multiply.com', 'viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris', 'tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas', 810, 192),
(193, 'Boarding', '+30 314 852 0318', '542-370-2884', 'leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui', 'amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas', NULL, 'http://dummyimage.com/150x138.bmp/cc0000/ffffff', 'et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed', 'pede', 465, 'tempus', NULL, '+57 162 561 4531', 'pdalmeida2k@skyrock.com', 'potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat', 'curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar', 299, 193),
(194, 'Hall', '+63 135 749 3284', '650-514-7852', 'ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien', 'ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio', NULL, 'http://dummyimage.com/154x220.bmp/cc0000/ffffff', 'viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est', 'proin', 562, 'ac lobortis', NULL, '+48 905 285 0388', 'mgladbeck2l@howstuffworks.com', 'mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo', 'odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit', 701, 194),
(195, 'Rent', '+55 443 714 7494', '198-497-4307', 'suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum', 'suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit', NULL, 'http://dummyimage.com/109x134.png/ff4444/ffffff', 'condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod', 'quis tortor', 906, 'nulla', NULL, '+86 429 248 8552', 'skornyshev2m@blogs.com', 'sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo', 'sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas', 991, 195),
(196, 'Boarding', '+62 676 667 8145', '637-154-9258', 'donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper', 'magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat', NULL, 'http://dummyimage.com/186x242.png/dddddd/000000', 'diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat', 'arcu', 970, 'lobortis convallis', NULL, '+62 961 711 9985', 'bmaccrann2n@twitter.com', 'etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id', 'etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque', 724, 196),
(197, 'Hall', '+351 612 974 0235', '824-350-8795', 'lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare', 'quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in', NULL, 'http://dummyimage.com/249x176.jpg/dddddd/000000', 'lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus', 'volutpat', 234, 'justo etiam', NULL, '+86 207 794 5474', 'kthorlby2o@reuters.com', 'neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus', 'eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci', 863, 197);
INSERT INTO `schooldetails` (`id`, `accommodationType`, `helpline`, `helpline2`, `motto`, `anthem`, `departments`, `website`, `about`, `alias`, `totalStudents`, `studentAlias`, `accommodationTypes`, `helpLines`, `email`, `mission`, `vision`, `alumniCount`, `schoolId`) VALUES
(198, 'Hostel', '+7 250 312 9498', '934-122-4928', 'risus praesent lectus vestibulum quam sapien varius ut blandit non interdum', 'cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis', NULL, 'http://dummyimage.com/188x110.jpg/dddddd/000000', 'id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi', 'interdum', 783, 'justo', NULL, '+62 845 149 0389', 'klhommee2p@tripod.com', 'hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat', 'justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices', 469, 198),
(199, 'Boarding', '+62 194 545 3322', '933-832-6918', 'dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum', 'mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis', NULL, 'http://dummyimage.com/227x129.jpg/ff4444/ffffff', 'duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis', 'phasellus', 373, 'interdum', NULL, '+995 104 469 7810', 'sfriberg2q@intel.com', 'id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin', 'aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam', 563, 199),
(200, 'Hostel', '+7 806 315 2810', '466-444-0062', 'mauris vulputate elementum nullam varius nulla facilisi cras non velit nec', 'ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo', NULL, 'http://dummyimage.com/152x243.bmp/ff4444/ffffff', 'vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer', 'ipsum', 584, 'donec', NULL, '+27 476 702 8174', 'lback2r@cbc.ca', 'in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar', 'amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec', 330, 200),
(201, 'Rent', '+62 430 173 0724', '497-552-2611', 'augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia', 'congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet', NULL, 'http://dummyimage.com/187x145.jpg/ff4444/ffffff', 'luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in', 'non', 552, 'purus', NULL, '+420 492 454 9303', 'ochristley0@mashable.com', 'turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque', 'nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus', 899, 201),
(202, 'Rent', '+355 662 415 9240', '656-834-5325', 'penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel', 'accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra', NULL, 'http://dummyimage.com/176x158.bmp/ff4444/ffffff', 'non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit', 'ultrices', 703, 'orci mauris', NULL, '+57 622 440 0365', 'mwawer1@yellowpages.com', 'sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin', 'venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet', 846, 202),
(203, 'Day', '+1 188 324 1872', '378-546-9913', 'sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis', 'accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer', NULL, 'http://dummyimage.com/107x217.bmp/5fa2dd/ffffff', 'erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec', 'elementum', 736, 'adipiscing molestie', NULL, '+1 313 598 5611', 'khughlock2@typepad.com', 'luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est', 'augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis vel dapibus at diam nam tristique tortor', 386, 203),
(204, 'Rent', '+86 613 997 9353', '559-436-3947', 'donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in', 'fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi', NULL, 'http://dummyimage.com/250x106.png/5fa2dd/ffffff', 'rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit', 'justo nec', 380, 'posuere', NULL, '+996 522 157 2324', 'mchisolm3@amazon.de', 'et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam', 'velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget', 781, 204),
(205, 'Boarding', '+7 421 678 0393', '652-901-3555', 'venenatis lacinia aenean sit amet justo morbi ut odio cras mi', 'eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer', NULL, 'http://dummyimage.com/120x153.jpg/dddddd/000000', 'primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facil', 'amet eleifend', 167, 'et ultrices', NULL, '+98 965 470 1177', 'qstit4@miitbeian.gov.cn', 'nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus', 'at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget', 831, 205),
(206, 'Day', '+33 462 860 5585', '208-106-7013', 'diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere', 'ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper', NULL, 'http://dummyimage.com/247x127.jpg/dddddd/000000', 'orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrice', 'venenatis lacinia', 489, 'mi', NULL, '+55 342 649 9582', 'msaiens5@nhs.uk', 'posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce', 'condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in', 975, 206),
(207, 'Boarding', '+420 640 343 7233', '586-561-7595', 'massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis', 'lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris', NULL, 'http://dummyimage.com/209x210.bmp/ff4444/ffffff', 'pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum', 'ut', 792, 'nulla', NULL, '+27 155 957 4433', 'alage6@networksolutions.com', 'habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed', 'cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec', 428, 207),
(208, 'Hostel', '+30 786 698 1018', '841-290-0955', 'sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris', 'feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae', NULL, 'http://dummyimage.com/157x233.bmp/dddddd/000000', 'enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu ', 'enim leo', 963, 'sit', NULL, '+1 309 543 8785', 'ddaly7@cpanel.net', 'hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla', 'ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in', 125, 208),
(209, 'Day', '+86 245 312 5125', '930-617-0766', 'pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus', 'volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam', NULL, 'http://dummyimage.com/170x227.bmp/5fa2dd/ffffff', 'posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac', 'erat fermentum', 121, 'turpis adipiscing', NULL, '+251 711 418 2962', 'banfonsi8@dot.gov', 'luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae', 'pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea', 702, 209),
(210, 'No accommodation', '+86 558 632 3677', '893-507-5375', 'sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis', 'sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque', NULL, 'http://dummyimage.com/155x159.bmp/cc0000/ffffff', 'pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non', 'justo', 764, 'sem mauris', NULL, '+420 807 612 1099', 'layerst9@angelfire.com', 'augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam', 'potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam', 423, 210),
(211, 'Hostel', '+994 739 655 5047', '579-312-7821', 'in faucibus orci luctus et ultrices posuere cubilia curae nulla', 'eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla', NULL, 'http://dummyimage.com/202x202.bmp/cc0000/ffffff', 'quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue', 'faucibus orci', 148, 'at nibh', NULL, '+351 712 109 6377', 'abeeckera@usda.gov', 'lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus', 'ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero', 641, 211),
(212, 'Boarding', '+48 750 676 5084', '496-177-6484', 'ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero', 'non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend', NULL, 'http://dummyimage.com/202x241.png/ff4444/ffffff', 'felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum', 'ac lobortis', 192, 'nec', NULL, '+7 539 282 6043', 'mhoundesomeb@fastcompany.com', 'a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna', 'sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate', 366, 212),
(213, 'Rent', '+48 549 936 6436', '404-174-2345', 'posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed', 'ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris', NULL, 'http://dummyimage.com/147x144.bmp/ff4444/ffffff', 'erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis o', 'molestie nibh', 748, 'lacinia', NULL, '+86 990 457 5656', 'gmayhouc@deviantart.com', 'odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis', 'posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie', 472, 213),
(214, 'Hostel', '+86 162 667 4086', '623-940-7103', 'non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus', 'id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit', NULL, 'http://dummyimage.com/118x216.bmp/ff4444/ffffff', 'mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat', 'luctus', 351, 'sociis', NULL, '+86 552 636 6307', 'mcoventond@free.fr', 'natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum', 'amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum', 326, 214),
(215, 'Rent', '+1 846 786 7044', '841-200-5260', 'ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc', 'egestas metus aenean fermentum donec ut mauris eget massa tempor', NULL, 'http://dummyimage.com/240x229.jpg/ff4444/ffffff', 'sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean', 'nisl venenatis', 456, 'consequat nulla', NULL, '+63 489 896 5709', 'dbunklee@topsy.com', 'in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a', 'in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis', 516, 215),
(216, 'Rent', '+62 527 421 4669', '402-395-9043', 'ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu', 'congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum', NULL, 'http://dummyimage.com/128x201.jpg/ff4444/ffffff', 'sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum', 'ut', 642, 'augue luctus', NULL, '+86 251 521 4996', 'mwolfendalef@yellowpages.com', 'quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et', 'consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus', 157, 216),
(217, 'No accommodation', '+62 110 369 7709', '907-231-3871', 'nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper', 'sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus', NULL, 'http://dummyimage.com/184x104.png/5fa2dd/ffffff', 'a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices', 'ultrices enim', 267, 'et', NULL, '+46 326 839 0735', 'kchurlyg@npr.org', 'blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec', 'vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis', 728, 217),
(218, 'No accommodation', '+420 288 778 4573', '214-930-2519', 'mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem', 'ac nibh fusce lacus purus aliquet at feugiat non pretium quis', NULL, 'http://dummyimage.com/236x195.jpg/ff4444/ffffff', 'dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi', 'blandit', 76, 'id luctus', NULL, '+86 682 676 7299', 'llangsburyh@timesonline.co.uk', 'vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi', 'mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam', 209, 218),
(219, 'Hostel', '+30 257 742 0313', '716-486-5493', 'consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac', 'odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus', NULL, 'http://dummyimage.com/202x179.png/dddddd/000000', 'lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus', 'sapien a', 649, 'interdum', NULL, '+355 242 763 2221', 'ahubbocki@homestead.com', 'erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea', 'fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa', 165, 219),
(220, 'Day', '+48 271 624 8569', '316-908-9607', 'interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie', 'dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis', NULL, 'http://dummyimage.com/212x220.png/cc0000/ffffff', 'eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper i', 'venenatis', 97, 'elit', NULL, '+255 625 770 6802', 'joferrisj@tripadvisor.com', 'ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci', 'neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo', 319, 220),
(221, 'Hall', '+86 406 687 7504', '318-190-1683', 'at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum', 'libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in', NULL, 'http://dummyimage.com/108x233.jpg/5fa2dd/ffffff', 'posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl', 'vestibulum', 818, 'pretium iaculis', NULL, '+86 144 350 8205', 'mcarlemank@psu.edu', 'nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci', 'tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum', 603, 221),
(222, 'Day', '+351 101 278 7821', '822-501-1544', 'duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam', 'rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh', NULL, 'http://dummyimage.com/182x120.jpg/5fa2dd/ffffff', 'vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus', 'tortor', 179, 'massa volutpat', NULL, '+66 635 228 1243', 'alinnerl@narod.ru', 'nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor', 'aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque', 245, 222),
(223, 'Hall', '+261 927 689 9258', '688-858-5738', 'sed nisl nunc rhoncus dui vel sem sed sagittis nam', 'volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget', NULL, 'http://dummyimage.com/114x181.png/ff4444/ffffff', 'porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacini', 'lectus', 219, 'non', NULL, '+46 922 492 0009', 'tcrickettm@apache.org', 'pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate', 'volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate', 303, 223),
(224, 'Hall', '+81 812 323 5728', '233-182-4642', 'ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit', 'tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus', NULL, 'http://dummyimage.com/124x242.bmp/5fa2dd/ffffff', 'eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices', 'eu pede', 261, 'ornare', NULL, '+7 411 190 1070', 'aneylonp@51.la', 'quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis', 'ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris', 823, 226),
(225, 'Hostel', '+46 726 922 9326', '907-592-9847', 'cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros', 'luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et', NULL, 'http://dummyimage.com/231x227.bmp/5fa2dd/ffffff', 'eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut', 'rhoncus mauris', 713, 'nulla', NULL, '+252 628 532 8155', 'cpasslerq@discuz.net', 'dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit', 'rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida', 748, 227),
(226, 'Day', '+504 663 823 4617', '598-211-2402', 'velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra', 'convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis', NULL, 'http://dummyimage.com/105x234.jpg/ff4444/ffffff', 'venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst', 'donec', 295, 'leo rhoncus', NULL, '+86 356 131 3517', 'mdormern@prlog.org', 'nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper', 'nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede', 111, 224),
(227, 'Hostel', '+86 523 918 7212', '943-733-4343', 'risus auctor sed tristique in tempus sit amet sem fusce', 'tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam', NULL, 'http://dummyimage.com/192x191.jpg/ff4444/ffffff', 'blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis', 'eu', 829, 'mattis', NULL, '+93 136 476 9471', 'lgarrono@dailymail.co.uk', 'amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque', 'donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet', 540, 225),
(228, 'Boarding', '+212 433 450 1749', '771-321-1809', 'felis eu sapien cursus vestibulum proin eu mi nulla ac', 'blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit', NULL, 'http://dummyimage.com/168x106.jpg/ff4444/ffffff', 'ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et', 'faucibus orci', 474, 'aliquet at', NULL, '+84 246 367 1878', 'hpechtr@cam.ac.uk', 'venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam', 'lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus', 465, 228),
(229, 'No accommodation', '+30 653 751 9037', '459-948-0742', 'volutpat dui maecenas tristique est et tempus semper est quam', 'aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula', NULL, 'http://dummyimage.com/239x209.png/5fa2dd/ffffff', 'blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget elei', 'ac enim', 388, 'odio', NULL, '+351 803 174 1304', 'swellers@purevolume.com', 'justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed', 'convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus', 565, 229),
(230, 'Boarding', '+86 567 922 7981', '683-265-2434', 'primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi', 'ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea', NULL, 'http://dummyimage.com/192x206.jpg/5fa2dd/ffffff', 'volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in', 'in', 966, 'cras mi', NULL, '+93 726 541 4034', 'ipenwrightt@cloudflare.com', 'justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget', 'massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum', 543, 230),
(231, 'Day', '+62 729 821 9362', '596-841-0710', 'suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet', 'morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec', NULL, 'http://dummyimage.com/224x117.jpg/ff4444/ffffff', 'donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in', 'nunc', 756, 'pulvinar', NULL, '+358 252 979 1346', 'ugingellv@hao123.com', 'iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit', 'vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum', 330, 232),
(232, 'Boarding', '+33 302 510 2730', '957-959-2836', 'parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum', 'justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus', NULL, 'http://dummyimage.com/148x181.jpg/5fa2dd/ffffff', 'ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit', 'ut dolor', 692, 'vestibulum', NULL, '+86 531 881 6026', 'ymcgavigany@g.co', 'iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit', 'mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris', 974, 235),
(233, 'Hostel', '+48 210 553 4778', '936-133-5455', 'pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper', 'pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa', NULL, 'http://dummyimage.com/240x151.jpg/5fa2dd/ffffff', 'convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet', 'condimentum id', 863, 'in porttitor', NULL, '+1 711 620 0804', 'senneveru@gnu.org', 'ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti', 'felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh', 266, 231),
(234, 'Rent', '+63 794 795 8046', '419-843-5110', 'purus phasellus in felis donec semper sapien a libero nam dui proin leo odio', 'orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut', NULL, 'http://dummyimage.com/170x129.png/cc0000/ffffff', 'lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis', 'ligula', 120, 'purus eu', NULL, '+51 604 781 7442', 'bgeertsenw@amazon.de', 'convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo', 'iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio', 364, 233),
(235, 'Boarding', '+420 858 305 0943', '897-384-4297', 'libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas', 'tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend', NULL, 'http://dummyimage.com/158x106.png/cc0000/ffffff', 'pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo', 'eleifend', 845, 'velit', NULL, '+30 844 242 4749', 'amolohanx@blogger.com', 'proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante', 'justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum', 483, 234),
(236, 'Boarding', '+7 826 211 3205', '939-800-4247', 'vel enim sit amet nunc viverra dapibus nulla suscipit ligula in', 'ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam', NULL, 'http://dummyimage.com/140x127.jpg/dddddd/000000', 'hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis', 'condimentum', 73, 'elit', NULL, '+351 126 913 3382', 'tdomelz@merriam-webster.com', 'lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet', 'a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat', 372, 236);
INSERT INTO `schooldetails` (`id`, `accommodationType`, `helpline`, `helpline2`, `motto`, `anthem`, `departments`, `website`, `about`, `alias`, `totalStudents`, `studentAlias`, `accommodationTypes`, `helpLines`, `email`, `mission`, `vision`, `alumniCount`, `schoolId`) VALUES
(237, 'Day', '+46 346 600 8757', '564-123-1369', 'habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien', 'hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris', NULL, 'http://dummyimage.com/148x167.bmp/5fa2dd/ffffff', 'cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus', 'est', 287, 'condimentum curabitur', NULL, '+36 424 190 6427', 'dmaccurlye12@admin.ch', 'ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum', 'nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis', 378, 239),
(238, 'Day', '+86 515 488 1619', '687-123-0755', 'in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices', 'primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt', NULL, 'http://dummyimage.com/154x132.png/cc0000/ffffff', 'mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus', 'tristique in', 697, 'lacus', NULL, '+54 387 482 1308', 'btapner10@geocities.com', 'amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis', 'non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in', 385, 237),
(239, 'Day', '+7 710 453 4153', '808-251-9114', 'quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus', 'turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante', NULL, 'http://dummyimage.com/186x177.bmp/5fa2dd/ffffff', 'vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut', 'tincidunt eget', 675, 'ullamcorper', NULL, '+1 727 203 5972', 'wkingscote11@bigcartel.com', 'vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh', 'purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque', 535, 238),
(240, 'Hall', '+33 593 225 2628', '723-743-3162', 'venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed', 'ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae', NULL, 'http://dummyimage.com/116x223.png/ff4444/ffffff', 'volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a', 'augue vel', 274, 'faucibus', NULL, '+81 733 147 3485', 'atomasini13@oaic.gov.au', 'posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem', 'orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim', 155, 240),
(241, 'Day', '+48 327 103 6535', '186-272-8001', 'sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet', 'massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam', NULL, 'http://dummyimage.com/202x115.jpg/5fa2dd/ffffff', 'urna ut tellus nulla ut erat id mauris vulputate elementum nullam', 'ac leo', 963, 'in quam', NULL, '+86 860 992 4744', 'dferrari15@surveymonkey.com', 'amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae', 'nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit', 980, 242),
(242, 'No accommodation', '+62 349 408 4130', '978-392-1225', 'luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis', 'sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique', NULL, 'http://dummyimage.com/146x216.jpg/ff4444/ffffff', 'nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla', 'accumsan', 912, 'ultrices posuere', NULL, '+81 890 685 5178', 'cferenczy16@barnesandnoble.com', 'sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed', 'aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est', 853, 243),
(243, 'Day', '+355 282 604 9032', '663-493-7134', 'velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum', 'leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis', NULL, 'http://dummyimage.com/194x140.bmp/5fa2dd/ffffff', 'nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus', 'suscipit', 481, 'faucibus accumsan', NULL, '+53 984 543 8165', 'tboggis17@i2i.jp', 'quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed', 'id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna', 434, 244),
(244, 'Hall', '+7 245 699 9937', '238-560-5701', 'ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel', 'felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue', NULL, 'http://dummyimage.com/245x156.bmp/cc0000/ffffff', 'amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi', 'consectetuer eget', 622, 'eros viverra', NULL, '+86 393 755 8573', 'kbread18@mail.ru', 'morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem', 'neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim', 833, 245),
(245, 'Rent', '+57 217 473 3974', '429-360-6479', 'ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt', 'tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor', NULL, 'http://dummyimage.com/246x110.bmp/cc0000/ffffff', 'posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in', 'euismod', 545, 'ultrices erat', NULL, '+86 956 267 0503', 'jturbayne14@xing.com', 'luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis', 'mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing', 820, 241),
(246, 'Boarding', '+55 782 133 6289', '195-289-6944', 'ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros', 'pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit', NULL, 'http://dummyimage.com/133x177.png/5fa2dd/ffffff', 'quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum', 'a', 887, 'dignissim', NULL, '+62 315 333 1909', 'dgilleson1a@reddit.com', 'bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse', 'ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus', 133, 247),
(247, 'Boarding', '+66 297 201 1345', '857-744-9007', 'metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis', 'consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit', NULL, 'http://dummyimage.com/250x199.png/dddddd/000000', 'non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel', 'ut odio', 847, 'aliquet', NULL, '+51 160 761 4296', 'afiske19@csmonitor.com', 'justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie', 'morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci', 420, 246),
(248, 'Hostel', '+63 363 714 1426', '653-687-7623', 'sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus', 'erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan', NULL, 'http://dummyimage.com/151x150.bmp/cc0000/ffffff', 'venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libe', 'nunc', 588, 'varius', NULL, '+86 140 374 4488', 'rbellingham1b@joomla.org', 'ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi', 'proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar', 101, 248),
(249, 'Boarding', '+86 389 651 0456', '329-557-7275', 'libero convallis eget eleifend luctus ultricies eu nibh quisque id', 'turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis', NULL, 'http://dummyimage.com/137x235.jpg/5fa2dd/ffffff', 'quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi', 'hac', 728, 'neque sapien', NULL, '+52 838 924 5158', 'jdailey1c@nymag.com', 'nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate', 'tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse', 339, 249),
(250, 'No accommodation', '+62 323 454 6176', '139-596-2860', 'montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem', 'eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam', NULL, 'http://dummyimage.com/234x112.png/ff4444/ffffff', 'sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse', 'lobortis vel', 1000, 'eget', NULL, '+81 417 413 6818', 'coaker1d@ox.ac.uk', 'ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend', 'praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit', 939, 250),
(251, 'Hostel', '+380 852 601 2453', '361-500-6507', 'lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio', 'iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit', NULL, 'http://dummyimage.com/103x223.jpg/5fa2dd/ffffff', 'turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien', 'tincidunt lacus', 775, 'adipiscing molestie', NULL, '+7 650 675 3878', 'chuntar1e@nydailynews.com', 'montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis', 'posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin', 697, 251),
(252, 'Day', '+385 254 802 5574', '535-143-6578', 'lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu', 'diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus', NULL, 'http://dummyimage.com/228x160.png/ff4444/ffffff', 'erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis o', 'in leo', 856, 'turpis eget', NULL, '+255 560 268 2089', 'hmarryatt1f@123-reg.co.uk', 'morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl', 'suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in', 142, 252),
(253, 'Boarding', '+33 990 247 9008', '214-866-4936', 'sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede', 'nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc', NULL, 'http://dummyimage.com/123x203.bmp/ff4444/ffffff', 'vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem', 'venenatis turpis', 892, 'gravida', NULL, '+968 982 302 8735', 'gbrizell1g@ca.gov', 'risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu', 'tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst', 137, 253),
(254, 'No accommodation', '+63 591 700 7047', '596-524-4024', 'pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in', 'vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie', NULL, 'http://dummyimage.com/247x207.jpg/5fa2dd/ffffff', 'nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium', 'ligula nec', 339, 'dolor', NULL, '+7 574 189 5101', 'pjudkins1h@networkadvertising.org', 'odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla', 'scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices', 116, 254),
(255, 'Hostel', '+371 284 242 2622', '805-331-7087', 'pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis', 'imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue', NULL, 'http://dummyimage.com/114x210.bmp/cc0000/ffffff', 'eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut', 'nulla suscipit', 291, 'morbi non', NULL, '+86 594 817 3477', 'ebowland1i@patch.com', 'sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium', 'etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla', 648, 255),
(256, 'Day', '+387 687 523 8153', '739-203-5184', 'leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat', 'nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis', NULL, 'http://dummyimage.com/153x127.png/dddddd/000000', 'id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non', 'auctor sed', 266, 'dapibus augue', NULL, '+7 245 933 5472', 'jheffy1j@aboutads.info', 'maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu', 'risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet', 309, 256),
(257, 'Day', '+62 966 580 3146', '500-866-2730', 'posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel', 'id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed', NULL, 'http://dummyimage.com/146x247.png/ff4444/ffffff', 'sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae ma', 'elementum eu', 365, 'non mattis', NULL, '+54 211 945 1770', 'lmallett1k@dedecms.com', 'libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient', 'ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam', 352, 257),
(258, 'Day', '+46 879 995 0454', '516-327-7041', 'dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere', 'molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices', NULL, 'http://dummyimage.com/137x209.jpg/dddddd/000000', 'erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis', 'in', 945, 'volutpat quam', NULL, '+55 407 494 2409', 'oskillitt1l@altervista.org', 'a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin', 'interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula', 711, 258),
(259, 'Boarding', '+86 690 890 7223', '364-496-1903', 'a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at', 'vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget', NULL, 'http://dummyimage.com/145x181.bmp/cc0000/ffffff', 'vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl', 'dictumst aliquam', 755, 'justo', NULL, '+62 819 467 8867', 'spenkman1m@ovh.net', 'in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam', 'sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus', 604, 259),
(260, 'No accommodation', '+7 279 756 9918', '121-814-0735', 'molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci', 'aenean auctor gravida sem praesent id massa id nisl venenatis lacinia', NULL, 'http://dummyimage.com/122x212.jpg/dddddd/000000', 'quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae', 'tortor', 53, 'sapien', NULL, '+51 466 466 3328', 'alutzmann1n@gravatar.com', 'auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices', 'maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae', 331, 260),
(261, 'Hostel', '+86 392 901 4905', '521-649-7340', 'consequat nulla nisl nunc nisl duis bibendum felis sed interdum', 'sed accumsan felis ut at dolor quis odio consequat varius integer ac', NULL, 'http://dummyimage.com/130x152.png/ff4444/ffffff', 'lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit', 'sapien iaculis', 988, 'rutrum', NULL, '+34 118 876 3608', 'sdelamere1o@house.gov', 'blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in', 'mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa', 164, 261),
(262, 'No accommodation', '+359 109 162 8887', '330-683-5289', 'at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum', 'ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi volutpat eleifend donec', NULL, 'http://dummyimage.com/162x116.bmp/ff4444/ffffff', 'ipsum dolor sit amet consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus', 'maecenas tristique', 483, 'consequat', NULL, '+48 294 111 0782', 'sivens1q@examiner.com', 'felis donec semper sapien a libero nam dui proin leo', 'augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla', 819, 263),
(263, 'Hostel', '+1 614 101 2036', '108-627-8143', 'consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien varius', 'est congue elementum in hac habitasse platea dictumst morbi vestibulum velit', NULL, 'http://dummyimage.com/137x117.bmp/dddddd/000000', 'vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere ', 'eu', 969, 'felis', NULL, '+86 680 691 1975', 'jcarrier1p@harvard.edu', 'nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum', 'nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia', 526, 262),
(264, 'Hostel', '+86 186 811 3328', '259-294-8125', 'lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras', 'aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi', NULL, 'http://dummyimage.com/107x138.bmp/dddddd/000000', 'diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor', 'amet', 900, 'velit', NULL, '+7 180 666 6205', 'ndearnly1s@skyrock.com', 'maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus', 'justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum', 802, 265),
(265, 'Rent', '+33 778 999 4843', '186-106-5764', 'eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus', 'diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est', NULL, 'http://dummyimage.com/232x128.jpg/5fa2dd/ffffff', 'ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis', 'nulla', 710, 'eu interdum', NULL, '+86 439 975 7753', 'dpoynor1r@wikimedia.org', 'tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi', 'mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque', 969, 264),
(266, 'Day', '+46 609 204 5123', '458-106-3289', 'sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit', 'blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit', NULL, 'http://dummyimage.com/221x233.jpg/ff4444/ffffff', 'a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero', 'at', 138, 'interdum', NULL, '+81 280 764 2830', 'fchanders1t@blogtalkradio.com', 'quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum', 'orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere', 356, 266),
(267, 'Boarding', '+48 996 903 1312', '628-154-6496', 'justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet', 'dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate', NULL, 'http://dummyimage.com/166x249.jpg/ff4444/ffffff', 'vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac dia', 'diam neque', 887, 'duis aliquam', NULL, '+1 249 493 4028', 'cmetcalfe1u@arizona.edu', 'auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa', 'commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare', 915, 267),
(268, 'Day', '+86 568 309 9155', '151-234-6801', 'nunc nisl duis bibendum felis sed interdum venenatis turpis enim', 'sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis', NULL, 'http://dummyimage.com/234x186.jpg/5fa2dd/ffffff', 'nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum', 'pede ac', 607, 'in', NULL, '+57 805 700 0929', 'kadcocks1v@ihg.com', 'mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis', 'porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis', 863, 268),
(269, 'Day', '+385 860 356 8008', '495-699-2925', 'consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo', 'nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia', NULL, 'http://dummyimage.com/183x240.bmp/ff4444/ffffff', 'et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue', 'rutrum', 894, 'ante', NULL, '+7 321 324 6396', 'isulland1w@free.fr', 'dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac', 'elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula', 898, 269),
(270, 'Boarding', '+86 553 306 4306', '494-622-4416', 'placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan', 'tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit', NULL, 'http://dummyimage.com/123x118.jpg/ff4444/ffffff', 'erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet', 'adipiscing molestie', 484, 'nec', NULL, '+55 300 670 7528', 'anail1x@biglobe.ne.jp', 'vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi', 'at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea', 680, 270),
(271, 'Day', '+1 805 658 1062', '185-895-9540', 'erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris', 'lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat', NULL, 'http://dummyimage.com/215x131.jpg/5fa2dd/ffffff', 'sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a', 'natoque', 493, 'sollicitudin', NULL, '+46 996 527 5577', 'gcalladine1y@homestead.com', 'vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam', 'nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices', 545, 271),
(272, 'Day', '+226 389 300 6975', '980-725-7205', 'at velit vivamus vel nulla eget eros elementum pellentesque quisque', 'tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam', NULL, 'http://dummyimage.com/123x158.jpg/dddddd/000000', 'lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo', 'nibh quisque', 660, 'molestie', NULL, '+351 123 764 8643', 'aklugel1z@shutterfly.com', 'in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam', 'aenean fermentum donec ut mauris eget massa tempor convallis nulla', 63, 272),
(273, 'Hostel', '+374 757 425 6282', '143-163-4117', 'justo eu massa donec dapibus duis at velit eu est', 'et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet', NULL, 'http://dummyimage.com/161x177.jpg/cc0000/ffffff', 'nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo', 'tempus sit', 541, 'pretium', NULL, '+62 366 769 9237', 'okynder20@imdb.com', 'nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat', 'sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque', 828, 273),
(274, 'Hostel', '+48 164 278 4396', '410-386-3744', 'dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in', 'erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus', NULL, 'http://dummyimage.com/195x107.jpg/ff4444/ffffff', 'praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst ', 'ipsum integer', 487, 'morbi vel', NULL, '+63 225 944 9390', 'vhamman21@bravesites.com', 'in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue', 'sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium', 448, 274),
(275, 'Boarding', '+86 932 398 0071', '823-869-1535', 'convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus', 'erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in', NULL, 'http://dummyimage.com/124x192.png/cc0000/ffffff', 'ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum', 'vitae', 609, 'aliquet at', NULL, '+351 350 853 2276', 'dmara22@booking.com', 'hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo', 'dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras', 173, 275),
(276, 'Rent', '+86 844 432 7373', '770-522-4319', 'odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus', 'sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem', NULL, 'http://dummyimage.com/242x188.bmp/5fa2dd/ffffff', 'interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non', 'eros', 374, 'pellentesque', NULL, '+86 835 766 1902', 'mdonaway23@go.com', 'in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti', 'id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla', 325, 276);
INSERT INTO `schooldetails` (`id`, `accommodationType`, `helpline`, `helpline2`, `motto`, `anthem`, `departments`, `website`, `about`, `alias`, `totalStudents`, `studentAlias`, `accommodationTypes`, `helpLines`, `email`, `mission`, `vision`, `alumniCount`, `schoolId`) VALUES
(277, 'Boarding', '+58 708 949 9507', '358-893-5637', 'duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh', 'erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam', NULL, 'http://dummyimage.com/117x242.bmp/5fa2dd/ffffff', 'nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus', 'erat volutpat', 212, 'est', NULL, '+244 447 321 3719', 'sdarwent24@posterous.com', 'metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus', 'ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in', 270, 277),
(278, 'Hostel', '+856 634 673 3701', '248-889-4866', 'donec ut dolor morbi vel lectus in quam fringilla rhoncus', 'vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id', NULL, 'http://dummyimage.com/126x223.jpg/dddddd/000000', 'purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae', 'semper', 805, 'gravida', NULL, '+84 958 562 9567', 'galiman25@utexas.edu', 'accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices', 'ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien', 608, 278),
(279, 'No accommodation', '+84 762 711 8181', '835-193-3639', 'feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl', 'turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel accumsan', NULL, 'http://dummyimage.com/242x225.png/cc0000/ffffff', 'nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer', 'non', 854, 'quam a', NULL, '+95 579 178 8641', 'mswinburne26@comcast.net', 'id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis', 'pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec', 864, 279),
(280, 'Boarding', '+62 129 990 7333', '746-526-2339', 'sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac', 'risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis', NULL, 'http://dummyimage.com/123x216.png/5fa2dd/ffffff', 'neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictums', 'nam tristique', 855, 'porttitor', NULL, '+86 279 465 5120', 'fcolnett27@photobucket.com', 'faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna', 'nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac', 892, 280),
(281, 'Hall', '+33 178 843 1414', '521-581-0948', 'ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies', 'erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit', NULL, 'http://dummyimage.com/248x238.bmp/dddddd/000000', 'ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus', 'sed', 491, 'nulla nisl', NULL, '+86 848 841 6923', 'abroddle28@ebay.com', 'vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices', 'donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien', 236, 281),
(282, 'Boarding', '+54 120 645 2546', '472-383-4806', 'mi sit amet lobortis sapien sapien non mi integer ac neque', 'amet consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec', NULL, 'http://dummyimage.com/194x236.bmp/5fa2dd/ffffff', 'sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque', 'cursus', 185, 'ac neque', NULL, '+55 678 809 3753', 'hclacey29@walmart.com', 'aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac', 'sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque', 191, 282),
(283, 'Rent', '+505 535 922 8244', '593-490-7066', 'nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio', 'elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet', NULL, 'http://dummyimage.com/191x199.bmp/cc0000/ffffff', 'massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor', 'ligula', 386, 'viverra dapibus', NULL, '+92 804 163 9981', 'hlethlay2b@typepad.com', 'nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis vel dapibus at diam nam tristique tortor eu', 'sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat', 117, 284),
(284, 'No accommodation', '+86 922 716 6707', '673-935-2637', 'eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum', 'in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor', NULL, 'http://dummyimage.com/243x140.png/dddddd/000000', 'tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non', 'ultrices', 112, 'in consequat', NULL, '+967 897 735 7773', 'rcurson2a@surveymonkey.com', 'volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor', 'mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo in blandit ultrices', 633, 283),
(285, 'Hostel', '+86 727 958 8672', '419-238-7502', 'duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in', 'massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae', NULL, 'http://dummyimage.com/188x141.jpg/ff4444/ffffff', 'neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam', 'tristique', 706, 'lorem quisque', NULL, '+387 264 289 3925', 'sbrumble2c@godaddy.com', 'viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna', 'ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus', 846, 285),
(286, 'Rent', '+504 219 706 5804', '714-424-6639', 'rutrum neque aenean auctor gravida sem praesent id massa id nisl venenatis lacinia', 'sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed', NULL, 'http://dummyimage.com/148x102.png/ff4444/ffffff', 'felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non', 'est', 702, 'vestibulum ac', NULL, '+86 619 597 6050', 'lgoss2d@sakura.ne.jp', 'lectus aliquam sit amet diam in magna bibendum imperdiet nullam orci pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel', 'faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec', 489, 286),
(287, 'Hostel', '+86 452 384 2377', '811-703-0053', 'elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis', 'non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus', NULL, 'http://dummyimage.com/197x207.bmp/cc0000/ffffff', 'eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce', 'nullam', 80, 'id', NULL, '+86 426 140 6369', 'jjemison2e@naver.com', 'habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at', 'luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in', 174, 287),
(288, 'Hall', '+44 353 705 4259', '212-292-0855', 'cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur', 'pede venenatis non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut', NULL, 'http://dummyimage.com/237x172.bmp/ff4444/ffffff', 'lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis', 'natoque', 174, 'nulla tempus', NULL, '+86 211 619 8477', 'mkeating2f@woothemes.com', 'nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis', 'accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec', 296, 288),
(289, 'Hostel', '+86 187 571 0454', '219-847-0993', 'nunc vestibulum ante ipsum primis in faucibus orci luctus et', 'nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget', NULL, 'http://dummyimage.com/106x163.png/ff4444/ffffff', 'ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis', 'amet justo', 353, 'volutpat erat', NULL, '+63 148 976 2499', 'rterney2g@hud.gov', 'adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus', 'in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat', 244, 289),
(290, 'Rent', '+62 941 653 6881', '283-264-6799', 'at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel', 'laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in lectus pellentesque at nulla suspendisse potenti cras in purus', NULL, 'http://dummyimage.com/164x146.jpg/5fa2dd/ffffff', 'condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue ve', 'sociis', 358, 'phasellus id', NULL, '+48 416 469 5861', 'jwiersma2h@dion.ne.jp', 'varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi', 'in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam', 945, 290),
(291, 'No accommodation', '+86 477 292 1473', '188-811-6949', 'pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac', 'suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla', NULL, 'http://dummyimage.com/218x178.png/cc0000/ffffff', 'risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum ', 'mauris laoreet', 715, 'posuere nonummy', NULL, '+86 707 716 5195', 'mpipet2i@microsoft.com', 'orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu', 'turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum', 364, 291),
(292, 'Hostel', '+380 542 890 1317', '944-720-5940', 'pede justo eu massa donec dapibus duis at velit eu est congue', 'lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia', NULL, 'http://dummyimage.com/175x134.jpg/5fa2dd/ffffff', 'id nisl venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada', 'amet lobortis', 900, 'ut', NULL, '+55 710 375 1426', 'swarr2j@google.co.uk', 'integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque', 'gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede', 952, 292),
(293, 'No accommodation', '+33 964 435 9313', '106-454-9748', 'est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum', 'massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat', NULL, 'http://dummyimage.com/191x223.bmp/cc0000/ffffff', 'leo odio condimentum id luctus nec molestie sed justo pellentesque viverra pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet diam in magna bibendum imperdiet nullam', 'adipiscing elit', 96, 'sit', NULL, '+31 986 708 3882', 'rarnow2k@elegantthemes.com', 'bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse', 'nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula', 144, 293),
(294, 'Rent', '+1 534 416 3714', '488-923-3030', 'curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue', 'odio donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque', NULL, 'http://dummyimage.com/182x246.bmp/5fa2dd/ffffff', 'nibh in lectus pellentesque at nulla suspendisse potenti cras in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis', 'in', 160, 'vitae', NULL, '+86 776 393 9329', 'cbutt2l@intel.com', 'mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero ut massa volutpat', 'magna ac consequat metus sapien ut nunc vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam', 284, 294),
(295, 'No accommodation', '+81 324 802 8401', '559-623-5483', 'tempus vel pede morbi porttitor lorem id ligula suspendisse ornare', 'elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci', NULL, 'http://dummyimage.com/131x153.png/5fa2dd/ffffff', 'in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor', 'lectus aliquam', 393, 'mattis pulvinar', NULL, '+63 354 277 6399', 'rsaban2m@un.org', 'vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis', 'consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla', 58, 295),
(296, 'Day', '+351 615 944 7048', '520-741-1653', 'phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus', 'in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu libero rutrum ac lobortis vel dapibus at diam nam tristique', NULL, 'http://dummyimage.com/194x199.png/cc0000/ffffff', 'eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisq', 'eu magna', 314, 'faucibus orci', NULL, '+86 990 638 7136', 'tenefer2n@ucoz.ru', 'nisi eu orci mauris lacinia sapien quis libero nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus', 'in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum', 483, 296),
(297, 'Boarding', '+297 370 577 1421', '236-100-3620', 'potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris', 'euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue', NULL, 'http://dummyimage.com/153x141.bmp/dddddd/000000', 'volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus or', 'pellentesque', 801, 'eu', NULL, '+385 790 411 5587', 'zmecco2o@github.com', 'viverra dapibus nulla suscipit ligula in lacus curabitur at ipsum ac tellus semper interdum mauris ullamcorper purus sit amet nulla quisque arcu', 'pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus sapien', 408, 297),
(298, 'Rent', '+31 544 242 8079', '811-642-2482', 'erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget', 'consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla', NULL, 'http://dummyimage.com/186x118.jpg/dddddd/000000', 'morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec molestie sed justo', 'fermentum', 705, 'tempus semper', NULL, '+51 124 947 1692', 'pburland2p@infoseek.co.jp', 'vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper', 'imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean', 633, 298),
(299, 'Rent', '+62 296 523 1926', '501-331-7820', 'eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu', 'lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in', NULL, 'http://dummyimage.com/100x214.bmp/dddddd/000000', 'id mauris vulputate elementum nullam varius nulla facilisi cras non velit nec nisi vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat', 'suspendisse', 108, 'pretium quis', NULL, '+7 275 138 9771', 'tempringham2q@senate.gov', 'proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat', 'vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec', 898, 299),
(300, 'Day', '+1 423 628 1292', '997-795-9874', 'dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus', 'nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque', NULL, 'http://dummyimage.com/143x127.png/ff4444/ffffff', 'quis lectus suspendisse potenti in eleifend quam a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue quam sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel ped', 'pellentesque', 577, 'nunc', NULL, '+20 841 192 7488', 'rtimewell2r@shop-pro.jp', 'donec vitae nisi nam ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim', 'accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean fermentum donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante', 898, 300),
(301, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 301);

-- --------------------------------------------------------

--
-- Table structure for table `sermons`
--

CREATE TABLE `sermons` (
  `sermonID` int(10) UNSIGNED NOT NULL,
  `topic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userID` varchar(234) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) DEFAULT NULL,
  `resourceID` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postedBy` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sermons`
--

INSERT INTO `sermons` (`sermonID`, `topic`, `author`, `userID`, `status`, `resourceID`, `postedBy`, `remember_token`, `created_at`, `updated_at`) VALUES
(49, 'believe in God and be free', 'Dr. adeleke keyinde', '30', 0, '79', 'kokori', NULL, '2020-08-27 11:22:22', '2020-08-27 11:22:22'),
(46, 'SPDC Donates Medical Equipment To Bayelsa StateBayelsa State Governor, Senator Douye Diri, has pledged PDC Donates Medical Equipment To Bayelsa StateBayelsa State Governor, Senator Douye Diri', 'Dr. adeleke keyinde', '32', 1, '57', 'lucky adams', NULL, '2020-08-23 08:44:07', '2020-08-23 08:44:07'),
(54, 'SPDC Donates Medical Equipment To Bayelsa StateBayelsa State Governor, Senator Douye Diri, has pledged PDC Donates Medical Equipment To Bayelsa StateBayelsa State Governor, Senator Douye Diri', 'Dr. adeleke keyinde', '30', 1, '93', 'kokori', NULL, '2020-09-11 12:21:05', '2020-09-11 12:21:05'),
(51, 'believe in God and be free', 'Dr. adeleke keyinde', '30', 1, '90', 'kokori', NULL, '2020-09-11 11:46:22', '2020-09-11 11:46:22'),
(52, 'Jesus is lord over all', 'Barr. Richard Kingsley', '30', 1, '91', 'kokori', NULL, '2020-09-11 11:48:03', '2020-09-11 11:48:03'),
(53, 'SPDC Donates Medical Equipment To Bayelsa StateBayelsa State Governor, Senator Douye Diri, has pledged', 'SPDC Donates Medical Equipment To Bayelsa StateBayelsa State Governor, Senator Douye Diri, Has Pledged', '30', 1, '92', 'kokori', NULL, '2020-09-11 12:20:15', '2020-09-11 12:20:15');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(512) NOT NULL,
  `phone` varchar(512) DEFAULT NULL,
  `firstName` varchar(512) NOT NULL,
  `lastName` varchar(512) NOT NULL,
  `otherName` varchar(512) DEFAULT NULL,
  `gender` varchar(512) DEFAULT NULL,
  `dateOfBirth` datetime DEFAULT NULL,
  `nickName` varchar(512) DEFAULT NULL,
  `realm` varchar(512) DEFAULT NULL,
  `emailVerified` tinyint(1) DEFAULT NULL,
  `verificationToken` varchar(512) DEFAULT NULL,
  `remember` tinyint(1) DEFAULT NULL,
  `alumniId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `phone`, `firstName`, `lastName`, `otherName`, `gender`, `dateOfBirth`, `nickName`, `realm`, `emailVerified`, `verificationToken`, `remember`, `alumniId`) VALUES
(13, 'ntiamoah1@yahoo.com', '+233112345678', 'Alfred', 'Ntiamoah', '', 'male', '2008-12-24 07:55:46', NULL, NULL, NULL, NULL, 0, NULL),
(14, 'ama@andy.com', '+233233445678', 'ama', 'andy', '', NULL, '2020-12-31 03:49:08', NULL, NULL, NULL, NULL, 0, NULL),
(15, 'ntiamoah376@yahoo.com', NULL, 'test', 'ntiamoah', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(16, 'jk@me.com', NULL, 'ykay', 'yikess', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userconfig`
--

CREATE TABLE `userconfig` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `action` varchar(512) NOT NULL,
  `response` varchar(512) NOT NULL,
  `reason` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `api_token`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'robinson agaga', 'robinsonagaga@gmail.com', '$2y$10$ybzuWN.z.Ud7Mfp6KZiGOONZ4kLczFnRnbzu3G84whttzRNxu8gjm', '1201789849', 'manage', 'R8S2GooXpxSIrtx8iujOEmqJne8f1uqiGSdaz77sxqa8ioDaAZORfiGAJYHk', '2020-06-27 14:40:54', '2020-06-27 14:40:54'),
(11, 'goodluck super admin', 'goodlucksuperadmin@tdla.com', '$2y$10$MQFhpVm/NC7DpUdZ036BS.TiTx.Ryr6g983n10b3/wQt8zCoivJ4K', NULL, 'manage', 'siSLSkPno8kYGIG91S9tqr4Ml6i6hCTyoF8CWS1FQC5h5T6luMkcmPJjPLfk', '2020-07-18 07:22:43', NULL),
(12, 'mark david', 'markdavid@hotmail.com', '$2y$10$sYiwDBXgdh.eKvZNGkrAy.hv4hQnZxmJCr66kDn3bHgZeBtrupDwC', NULL, 'manage-sub', '5Tg2OFF7UapeFeW3PRmnAnqdnFzb5Cm0WBHRpT5dKNhovvPleAKlj83R3yot', '2020-07-20 08:25:24', NULL),
(10, 'goodluck admin', 'goodluckadmin@tdla.com', '$2y$10$RgQybH9Gtaz6LU7VgtbVeeqw7o7S9ZqgxB0yiRap5FebY.19Tpexy', NULL, 'manage-sub', 'kmB4LvOlo3PDTAlbR4sJuZGflHlDlNq0ekSsdYKEYH2CIpwxiKm9kUrFaafi', '2020-07-18 07:20:57', NULL),
(30, 'kokori', 'kokori@gmail.com', '$2y$10$qauge3YwpgkN2L8QOaO9DOe8Oq1v0GB3vQCIRZHsXLDFODXVKBqoq', '1201739849', 'manage-sub', 'dTpKpEqtLv4zZoj8Ni2gqh9NBygVHZ5YspXcaKciiXMHENHwmHNSkANeksdU', '2020-08-08 04:05:21', '2020-08-08 04:05:21'),
(32, 'lucky adams', 'lucky@gmail.com', '$2y$10$fqwoHeqm83to2Gv07tuS1OdzjKGOnOgIa70jWamcwuUCC42yqnBkS', '1276168488', 'manage', 'mCeS5Mw4SxebG21slTXhNPgNyEjLNPf69Eh6uYNFh7g7vRR8YobJS5lKVYDS', '2020-08-14 07:49:46', '2020-08-14 07:49:46'),
(33, 'lekan', 'lekan@gmail.com', '$2y$10$oRvVRm3krzvjTKOK6sD2oOod5ku6u9rA6BryLx8ECBXWVmxb9Q2k2', '2218962864', 'user', NULL, '2020-08-16 00:38:52', '2020-08-16 00:38:52'),
(34, 'folakemi agbo', 'folakemi@gmail.com', '$2y$10$SsOSLP.v6UBcLDp1ceNXKOJrznzvjo87drgRpq91fncaESj9.p4jy', '5003473065', 'user', NULL, '2020-08-16 08:55:54', '2020-08-16 08:55:54'),
(35, 'amaka godwin', 'amakagodwin@gmail.com', '$2y$10$uTWlIwI8Eu5N2JeTJqtGyOQCYlrnC0yQ4itLJywPPHj2ldL9qK/qK', '2920620825', 'user', 'DGnkc10KNkin8vQ4uEAwZvW6kUZ7rvGv00DP8dG50cYGh0bCnTNyZCHwlhWb', '2020-08-25 06:51:56', '2020-08-25 06:51:56');

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE `video` (
  `id` int(11) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `fileName` varchar(512) NOT NULL,
  `fileUrl` varchar(512) NOT NULL,
  `thumbnailUrl` varchar(512) DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `type` int(11) NOT NULL,
  `schoolId` int(11) DEFAULT NULL,
  `mimeType` varchar(512) DEFAULT NULL,
  `posterUrl` varchar(512) DEFAULT NULL,
  `postId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `length` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `video`
--

INSERT INTO `video` (`id`, `description`, `fileName`, `fileUrl`, `thumbnailUrl`, `dateCreated`, `type`, `schoolId`, `mimeType`, `posterUrl`, `postId`, `userId`, `length`) VALUES
(1, '', 'VID_20201111_060836.mp4', '/VID_20201111_060836.mp4', '/thumb_VID_20201111_060836.mp4', '2020-11-11 06:11:00', 0, NULL, NULL, NULL, NULL, 1, NULL),
(2, '', 'VID_20201111_060836.mp4', '/VID_20201111_060836.mp4', '/thumb_VID_20201111_060836.mp4', '2020-11-11 06:11:00', 0, NULL, NULL, NULL, NULL, 1, NULL),
(3, '', 'VID_20201110_074623.mp4', '/VID_20201110_074623.mp4', '/thumb_VID_20201110_074623.mp4', '2020-11-11 06:21:17', 0, NULL, NULL, NULL, NULL, 1, NULL),
(4, '', 'VID_20201110_074623.mp4', '/VID_20201110_074623.mp4', '/thumb_VID_20201110_074623.jpg', '2020-11-11 06:52:57', 0, NULL, NULL, '/poster_VID_20201110_074623.jpg', 66, 1, NULL),
(5, '', 'VID_20201110_074623.mp4', '/VID_20201110_074623.mp4', '/thumb_VID_20201110_074623.jpg', '2020-11-11 06:54:30', 0, NULL, NULL, '/poster_VID_20201110_074623.jpg', 67, 1, NULL),
(6, '', 'VID_20201110_074623.mp4', '/VID_20201110_074623.mp4', '/thumb_VID_20201110_074623.jpg', '2020-11-11 06:57:08', 0, NULL, NULL, '/poster_VID_20201110_074623.jpg', 68, 1, NULL),
(7, '', 'VID_20201110_023116.mp4', '/VID_20201110_023116.mp4', '/thumb_VID_20201110_023116.jpg', '2020-11-11 06:58:29', 0, NULL, NULL, '/poster_VID_20201110_023116.jpg', 69, 1, NULL),
(8, '', 'VID_20201106_040653.mp4', '/VID_20201106_040653.mp4', '/thumb_VID_20201106_040653.jpg', '2020-11-11 07:01:18', 0, NULL, NULL, '/poster_VID_20201106_040653.jpg', 70, 1, NULL),
(9, '', 'VID_20201111_070322.mp4', '/VID_20201111_070322.mp4', '/thumb_VID_20201111_070322.jpg', '2020-11-11 07:03:51', 0, NULL, NULL, '/poster_VID_20201111_070322.jpg', 71, 1, NULL),
(10, '', '1605080433271.mp4', '/1605080433271.mp4', '/thumb_1605080433271.jpg', '2020-11-11 07:40:43', 0, NULL, NULL, '/poster_1605080433271.jpg', 72, 1, NULL),
(11, '', '1_1606049895599.mp4', '/1_1606049895599.mp4', '/thumb_1_1606049895599.jpg', '2020-11-22 12:58:22', 1, NULL, NULL, '/poster_1_1606049895599.jpg', 88, 1, -1),
(12, '', 'Olakira - In My Maserati (Dance Video) - YouTube459_32_40_3_4_11_2020.mkv', 'http://localhost:3001/media/download/Olakira - In My Maserati (Dance Video) - YouTube459_32_40_3_4_11_2020.mkv', 'http://localhost:3001/media/download/thumb_Olakira - In My Maserati (Dance Video) - YouTube459_32_40_3_4_11_2020.mkv', '2020-12-31 03:40:32', 0, 2, 'video/x-matroska', 'http://localhost:3001/media/download/poster_Olakira - In My Maserati (Dance Video) - YouTube459_32_40_3_4_11_2020.mkv', NULL, NULL, NULL),
(13, '', '14_1610074818901.mp4', '/14_1610074818901.mp4', '/thumb_14_1610074818901.jpg', '2021-01-08 03:00:20', 1, NULL, NULL, '/poster_14_1610074818901.jpg', 131, 14, -1),
(14, '', 'Olakira - In My Maserati (Dance Video) - YouTube247_10_12_11_0_0_2021.mkv', 'http://localhost:3001/media/download/Olakira - In My Maserati (Dance Video) - YouTube247_10_12_11_0_0_2021.mkv', 'http://localhost:3001/media/download/thumb_Olakira - In My Maserati (Dance Video) - YouTube247_10_12_11_0_0_2021.mkv', '2021-01-10 11:12:10', 0, 301, 'video/x-matroska', 'http://localhost:3001/media/download/poster_Olakira - In My Maserati (Dance Video) - YouTube247_10_12_11_0_0_2021.mkv', NULL, NULL, NULL),
(15, '', '14_1611050660609.3gp', '/14_1611050660609.3gp', '/thumb_14_1611050660609.jpg', '2021-01-19 10:05:01', 1, NULL, NULL, '/poster_14_1611050660609.jpg', 158, 4, -1),
(16, '', '14_1611052629538.3gp', '/14_1611052629538.3gp', '/thumb_14_1611052629538.jpg', '2021-01-19 10:37:45', 1, NULL, NULL, '/poster_14_1611052629538.jpg', 163, 14, -1),
(17, '', '14_1611055629538.3gp', '/14_1611055629538.3gp', '/thumb_14_1611055629538.jpg', '2021-01-19 11:27:45', 1, NULL, 'video/mp4', '/poster_14_1611055629538.jpg', 170, 14, -1),
(18, '', '14_1611056651822.3gp', '/14_1611056651822.3gp', '/thumb_14_1611056651822.jpg', '2021-01-19 11:44:34', 1, NULL, 'video/mp4', '/poster_14_1611056651822.jpg', 173, 14, -1),
(19, '', '14_1612580243484.mp4', '/14_1612580243484.mp4', '/thumb_14_1612580243484.jpg', '2021-02-06 02:57:25', 1, NULL, 'video/mp4', '/poster_14_1612580243484.jpg', 189, 14, -1),
(20, '', '14_1612580683490.mp4', '/14_1612580683490.mp4', '/thumb_14_1612580683490.jpg', '2021-02-06 03:04:48', 1, NULL, 'video/mp4', '/poster_14_1612580683490.jpg', 190, 14, -1),
(21, '', '14_1612600520767.mp4', '/14_1612600520767.mp4', '/thumb_14_1612600520767.jpg', '2021-02-06 08:35:21', 1, NULL, 'video/mp4', '/poster_14_1612600520767.jpg', 192, 14, -1),
(22, '', '14_1612600520777.mp4', '/14_1612600520777.mp4', '/thumb_14_1612600520777.jpg', '2021-02-06 08:35:21', 1, NULL, 'video/mp4', '/poster_14_1612600520777.jpg', 192, 14, -1),
(23, '', '14_1612601081295.mp4', '/14_1612601081295.mp4', '/thumb_14_1612601081295.jpg', '2021-02-06 08:44:42', 1, NULL, 'video/mp4', '/poster_14_1612601081295.jpg', 193, 14, -1),
(24, '', '14_1612602912583.mp4', '/14_1612602912583.mp4', '/thumb_14_1612602912583.jpg', '2021-02-06 09:15:14', 1, NULL, 'video/mp4', '/poster_14_1612602912583.jpg', 194, 14, -1),
(25, '', '14_1612605444846.jpg', '/media/download/14_1612605444846.jpg', '/media/download/thumb_14_1612605444846.jpg', '2021-02-06 09:57:24', 0, NULL, NULL, NULL, 194, 14, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `website`
--

CREATE TABLE `website` (
  `id` int(11) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `fileName` varchar(512) NOT NULL,
  `fileUrl` varchar(512) NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `alumni`
--
ALTER TABLE `alumni`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `audio`
--
ALTER TABLE `audio`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `authentication`
--
ALTER TABLE `authentication`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `casbin_rule`
--
ALTER TABLE `casbin_rule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `degree`
--
ALTER TABLE `degree`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `device`
--
ALTER TABLE `device`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `devicetopicthrough`
--
ALTER TABLE `devicetopicthrough`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `documentpost`
--
ALTER TABLE `documentpost`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eventphotos`
--
ALTER TABLE `eventphotos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`eventID`);

--
-- Indexes for table `followthrough`
--
ALTER TABLE `followthrough`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `friendshipthrough`
--
ALTER TABLE `friendshipthrough`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likethrough`
--
ALTER TABLE `likethrough`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mediapost`
--
ALTER TABLE `mediapost`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messagepost`
--
ALTER TABLE `messagepost`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password`
--
ALTER TABLE `password`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`(250));

--
-- Indexes for table `pastors`
--
ALTER TABLE `pastors`
  ADD PRIMARY KEY (`pastorID`);

--
-- Indexes for table `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `photopost`
--
ALTER TABLE `photopost`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`photoID`);

--
-- Indexes for table `phototype`
--
ALTER TABLE `phototype`
  ADD PRIMARY KEY (`typeID`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `postaudiothrough`
--
ALTER TABLE `postaudiothrough`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `postconfig`
--
ALTER TABLE `postconfig`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `postdocumentthrough`
--
ALTER TABLE `postdocumentthrough`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `postphotothrough`
--
ALTER TABLE `postphotothrough`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `postvideothrough`
--
ALTER TABLE `postvideothrough`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`profileID`);

--
-- Indexes for table `pushmessage`
--
ALTER TABLE `pushmessage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pushtopic`
--
ALTER TABLE `pushtopic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resetrequest`
--
ALTER TABLE `resetrequest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`resourceID`);

--
-- Indexes for table `resourcetype`
--
ALTER TABLE `resourcetype`
  ADD PRIMARY KEY (`typeID`);

--
-- Indexes for table `school`
--
ALTER TABLE `school`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schooldetails`
--
ALTER TABLE `schooldetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sermons`
--
ALTER TABLE `sermons`
  ADD PRIMARY KEY (`sermonID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userconfig`
--
ALTER TABLE `userconfig`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_api_token_unique` (`api_token`),
  ADD UNIQUE KEY `users_email_unique` (`email`) USING HASH;

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `website`
--
ALTER TABLE `website`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `alumni`
--
ALTER TABLE `alumni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `audio`
--
ALTER TABLE `audio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `authentication`
--
ALTER TABLE `authentication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `casbin_rule`
--
ALTER TABLE `casbin_rule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT for table `degree`
--
ALTER TABLE `degree`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `device`
--
ALTER TABLE `device`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT for table `devicetopicthrough`
--
ALTER TABLE `devicetopicthrough`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document`
--
ALTER TABLE `document`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `documentpost`
--
ALTER TABLE `documentpost`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `eventphotos`
--
ALTER TABLE `eventphotos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `eventID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `followthrough`
--
ALTER TABLE `followthrough`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `friendshipthrough`
--
ALTER TABLE `friendshipthrough`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `likethrough`
--
ALTER TABLE `likethrough`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mediapost`
--
ALTER TABLE `mediapost`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messagepost`
--
ALTER TABLE `messagepost`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `password`
--
ALTER TABLE `password`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pastors`
--
ALTER TABLE `pastors`
  MODIFY `pastorID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `photo`
--
ALTER TABLE `photo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `photopost`
--
ALTER TABLE `photopost`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `photoID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `phototype`
--
ALTER TABLE `phototype`
  MODIFY `typeID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT for table `postaudiothrough`
--
ALTER TABLE `postaudiothrough`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `postconfig`
--
ALTER TABLE `postconfig`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `postdocumentthrough`
--
ALTER TABLE `postdocumentthrough`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `postphotothrough`
--
ALTER TABLE `postphotothrough`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `postvideothrough`
--
ALTER TABLE `postvideothrough`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `profileID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `pushmessage`
--
ALTER TABLE `pushmessage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pushtopic`
--
ALTER TABLE `pushtopic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resetrequest`
--
ALTER TABLE `resetrequest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `resources`
--
ALTER TABLE `resources`
  MODIFY `resourceID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `resourcetype`
--
ALTER TABLE `resourcetype`
  MODIFY `typeID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `school`
--
ALTER TABLE `school`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=302;

--
-- AUTO_INCREMENT for table `schooldetails`
--
ALTER TABLE `schooldetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=302;

--
-- AUTO_INCREMENT for table `sermons`
--
ALTER TABLE `sermons`
  MODIFY `sermonID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `userconfig`
--
ALTER TABLE `userconfig`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `website`
--
ALTER TABLE `website`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
