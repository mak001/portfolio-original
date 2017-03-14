-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2017 at 12:48 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ss_portfolio`
--
CREATE DATABASE IF NOT EXISTS `ss_portfolio` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ss_portfolio`;

-- --------------------------------------------------------

--
-- Table structure for table `errorpage`
--

DROP TABLE IF EXISTS `errorpage`;
CREATE TABLE `errorpage` (
  `ID` int(11) NOT NULL,
  `ErrorCode` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `errorpage`
--

INSERT INTO `errorpage` (`ID`, `ErrorCode`) VALUES
(4, 404),
(5, 500);

-- --------------------------------------------------------

--
-- Table structure for table `errorpage_live`
--

DROP TABLE IF EXISTS `errorpage_live`;
CREATE TABLE `errorpage_live` (
  `ID` int(11) NOT NULL,
  `ErrorCode` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `errorpage_live`
--

INSERT INTO `errorpage_live` (`ID`, `ErrorCode`) VALUES
(4, 404),
(5, 500);

-- --------------------------------------------------------

--
-- Table structure for table `errorpage_versions`
--

DROP TABLE IF EXISTS `errorpage_versions`;
CREATE TABLE `errorpage_versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ErrorCode` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `errorpage_versions`
--

INSERT INTO `errorpage_versions` (`ID`, `RecordID`, `Version`, `ErrorCode`) VALUES
(1, 4, 1, 404),
(2, 5, 1, 500);

-- --------------------------------------------------------

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('File','Folder','Image','Image_Cached') DEFAULT 'File',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Filename` mediumtext,
  `Content` mediumtext,
  `ShowInSearch` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  `OwnerID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `file`
--

INSERT INTO `file` (`ID`, `ClassName`, `LastEdited`, `Created`, `Name`, `Title`, `Filename`, `Content`, `ShowInSearch`, `ParentID`, `OwnerID`) VALUES
(1, 'Folder', '2017-03-09 10:26:16', '2017-03-09 10:26:16', 'Uploads', 'Uploads', 'assets/Uploads/', NULL, 1, 0, 0),
(2, 'Image', '2017-03-09 10:26:16', '2017-03-09 10:26:16', 'SilverStripeLogo.png', 'SilverStripeLogo.png', 'assets/Uploads/SilverStripeLogo.png', NULL, 1, 1, 0),
(3, 'Folder', '2017-03-11 20:29:21', '2017-03-11 20:29:21', 'project-photos', 'project-photos', 'assets/project-photos/', NULL, 1, 0, 1),
(4, 'Image', '2017-03-11 20:30:00', '2017-03-11 20:29:21', 'InnPizza-Main.jpg', 'Inn Pizza', 'assets/project-photos/InnPizza-Main.jpg', NULL, 1, 3, 1),
(5, 'Image', '2017-03-11 23:45:29', '2017-03-11 23:45:29', 'CoreStrength-Main.png', 'CoreStrength Main', 'assets/project-photos/CoreStrength-Main.png', NULL, 1, 3, 1),
(7, 'Image', '2017-03-11 23:46:24', '2017-03-11 23:46:24', 'Memory-Main.png', 'Memory Main', 'assets/project-photos/Memory-Main.png', NULL, 1, 3, 1),
(8, 'Image', '2017-03-11 23:46:54', '2017-03-11 23:46:54', 'Battleship-Main.png', 'Battleship Main', 'assets/project-photos/Battleship-Main.png', NULL, 1, 3, 1),
(9, 'Image', '2017-03-11 23:47:54', '2017-03-11 23:47:54', 'TicketDominator-Main.png', 'TicketDominator Main', 'assets/project-photos/TicketDominator-Main.png', NULL, 1, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('Group') DEFAULT 'Group',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Description` mediumtext,
  `Code` varchar(255) DEFAULT NULL,
  `Locked` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HtmlEditorConfig` mediumtext,
  `ParentID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `group`
--

INSERT INTO `group` (`ID`, `ClassName`, `LastEdited`, `Created`, `Title`, `Description`, `Code`, `Locked`, `Sort`, `HtmlEditorConfig`, `ParentID`) VALUES
(1, 'Group', '2017-03-09 16:26:14', '2017-03-09 16:26:14', 'Content Authors', NULL, 'content-authors', 0, 1, NULL, 0),
(2, 'Group', '2017-03-09 16:26:14', '2017-03-09 16:26:14', 'Administrators', NULL, 'administrators', 0, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `group_members`
--

DROP TABLE IF EXISTS `group_members`;
CREATE TABLE `group_members` (
  `ID` int(11) NOT NULL,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `MemberID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `group_members`
--

INSERT INTO `group_members` (`ID`, `GroupID`, `MemberID`) VALUES
(1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `group_roles`
--

DROP TABLE IF EXISTS `group_roles`;
CREATE TABLE `group_roles` (
  `ID` int(11) NOT NULL,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `PermissionRoleID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `loginattempt`
--

DROP TABLE IF EXISTS `loginattempt`;
CREATE TABLE `loginattempt` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('LoginAttempt') DEFAULT 'LoginAttempt',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Status` enum('Success','Failure') DEFAULT 'Success',
  `IP` varchar(255) DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('Member') DEFAULT 'Member',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `Surname` varchar(50) DEFAULT NULL,
  `Email` varchar(254) DEFAULT NULL,
  `TempIDHash` varchar(160) DEFAULT NULL,
  `TempIDExpired` datetime DEFAULT NULL,
  `Password` varchar(160) DEFAULT NULL,
  `RememberLoginToken` varchar(160) DEFAULT NULL,
  `NumVisit` int(11) NOT NULL DEFAULT '0',
  `LastVisited` datetime DEFAULT NULL,
  `AutoLoginHash` varchar(160) DEFAULT NULL,
  `AutoLoginExpired` datetime DEFAULT NULL,
  `PasswordEncryption` varchar(50) DEFAULT NULL,
  `Salt` varchar(50) DEFAULT NULL,
  `PasswordExpiry` date DEFAULT NULL,
  `LockedOutUntil` datetime DEFAULT NULL,
  `Locale` varchar(6) DEFAULT NULL,
  `FailedLoginCount` int(11) NOT NULL DEFAULT '0',
  `DateFormat` varchar(30) DEFAULT NULL,
  `TimeFormat` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`ID`, `ClassName`, `LastEdited`, `Created`, `FirstName`, `Surname`, `Email`, `TempIDHash`, `TempIDExpired`, `Password`, `RememberLoginToken`, `NumVisit`, `LastVisited`, `AutoLoginHash`, `AutoLoginExpired`, `PasswordEncryption`, `Salt`, `PasswordExpiry`, `LockedOutUntil`, `Locale`, `FailedLoginCount`, `DateFormat`, `TimeFormat`) VALUES
(1, 'Member', '2017-03-09 16:29:20', '2017-03-09 16:26:16', 'Default Admin', NULL, 'Matthew.Koerber', '11a25d3b91599a7b3fb6ef46cc8465f289a026c3', '2017-03-12 16:29:20', '$2y$10$24ae7b637c8828c857ec0u334BlO1sY6Y/ITBhUfiMWzFdsQs9Wf.', NULL, 1, '2017-03-13 19:47:11', NULL, NULL, 'blowfish', '10$24ae7b637c8828c857ec06', NULL, NULL, 'en_US', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `memberpassword`
--

DROP TABLE IF EXISTS `memberpassword`;
CREATE TABLE `memberpassword` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('MemberPassword') DEFAULT 'MemberPassword',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Password` varchar(160) DEFAULT NULL,
  `Salt` varchar(50) DEFAULT NULL,
  `PasswordEncryption` varchar(50) DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `memberpassword`
--

INSERT INTO `memberpassword` (`ID`, `ClassName`, `LastEdited`, `Created`, `Password`, `Salt`, `PasswordEncryption`, `MemberID`) VALUES
(1, 'MemberPassword', '2017-03-09 16:26:16', '2017-03-09 16:26:16', '$2y$10$24ae7b637c8828c857ec0u334BlO1sY6Y/ITBhUfiMWzFdsQs9Wf.', '10$24ae7b637c8828c857ec06', 'blowfish', 1);

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('Permission') DEFAULT 'Permission',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Arg` int(11) NOT NULL DEFAULT '0',
  `Type` int(11) NOT NULL DEFAULT '1',
  `GroupID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`ID`, `ClassName`, `LastEdited`, `Created`, `Code`, `Arg`, `Type`, `GroupID`) VALUES
(1, 'Permission', '2017-03-09 16:26:14', '2017-03-09 16:26:14', 'CMS_ACCESS_CMSMain', 0, 1, 1),
(2, 'Permission', '2017-03-09 16:26:14', '2017-03-09 16:26:14', 'CMS_ACCESS_AssetAdmin', 0, 1, 1),
(3, 'Permission', '2017-03-09 16:26:14', '2017-03-09 16:26:14', 'CMS_ACCESS_ReportAdmin', 0, 1, 1),
(4, 'Permission', '2017-03-09 16:26:14', '2017-03-09 16:26:14', 'SITETREE_REORGANISE', 0, 1, 1),
(5, 'Permission', '2017-03-09 16:26:14', '2017-03-09 16:26:14', 'ADMIN', 0, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `permissionrole`
--

DROP TABLE IF EXISTS `permissionrole`;
CREATE TABLE `permissionrole` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('PermissionRole') DEFAULT 'PermissionRole',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `OnlyAdminCanApply` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `permissionrolecode`
--

DROP TABLE IF EXISTS `permissionrolecode`;
CREATE TABLE `permissionrolecode` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('PermissionRoleCode') DEFAULT 'PermissionRoleCode',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Code` varchar(50) DEFAULT NULL,
  `RoleID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projectframework`
--

DROP TABLE IF EXISTS `projectframework`;
CREATE TABLE `projectframework` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('ProjectFramework') DEFAULT 'ProjectFramework',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `BGColor` varchar(6) DEFAULT NULL,
  `URLSegment` varchar(50) DEFAULT NULL,
  `ProjectHolderID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projectframework`
--

INSERT INTO `projectframework` (`ID`, `ClassName`, `LastEdited`, `Created`, `Title`, `BGColor`, `URLSegment`, `ProjectHolderID`) VALUES
(1, 'ProjectFramework', '2017-03-13 00:31:30', '2017-03-13 00:31:30', 'Wordpress', '0073aa', 'wordpress', 6),
(2, 'ProjectFramework', '2017-03-13 00:32:54', '2017-03-13 00:32:54', 'SilverStripe', '005a92', 'silverstripe', 6),
(3, 'ProjectFramework', '2017-03-13 01:49:07', '2017-03-13 01:49:07', 'Bootstrap', '563d7c', 'bootstrap', 6);

-- --------------------------------------------------------

--
-- Table structure for table `projectlanguage`
--

DROP TABLE IF EXISTS `projectlanguage`;
CREATE TABLE `projectlanguage` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('ProjectLanguage') DEFAULT 'ProjectLanguage',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `BGColor` varchar(6) DEFAULT NULL,
  `ProjectHolderID` int(11) NOT NULL DEFAULT '0',
  `URLSegment` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projectlanguage`
--

INSERT INTO `projectlanguage` (`ID`, `ClassName`, `LastEdited`, `Created`, `Title`, `BGColor`, `ProjectHolderID`, `URLSegment`) VALUES
(1, 'ProjectLanguage', '2017-03-12 16:46:47', '2017-03-12 15:04:44', 'Java', 'b07219', 6, 'java'),
(2, 'ProjectLanguage', '2017-03-12 16:46:56', '2017-03-12 15:05:05', 'CSS', '563d7c', 6, 'css'),
(3, 'ProjectLanguage', '2017-03-12 16:47:06', '2017-03-12 15:05:26', 'JavaScript', 'f1e05a', 6, 'javascript'),
(4, 'ProjectLanguage', '2017-03-12 16:47:15', '2017-03-12 15:05:46', 'C', '555555', 6, 'c'),
(5, 'ProjectLanguage', '2017-03-12 16:47:25', '2017-03-12 15:06:51', 'HTML', 'e34c26', 6, 'html'),
(6, 'ProjectLanguage', '2017-03-12 16:47:37', '2017-03-12 15:07:09', 'C#', '178600', 6, 'c-sharp'),
(7, 'ProjectLanguage', '2017-03-12 16:47:46', '2017-03-12 15:09:01', 'PHP', '4F5D95', 6, 'php'),
(8, 'ProjectLanguage', '2017-03-12 16:47:57', '2017-03-12 15:09:27', 'Python', '3572A5', 6, 'python'),
(9, 'ProjectLanguage', '2017-03-12 16:48:25', '2017-03-12 15:09:47', 'C++', 'f34b7d', 6, 'c-plus-plus'),
(10, 'ProjectLanguage', '2017-03-12 16:48:35', '2017-03-12 15:10:51', 'Ruby', '701516', 6, 'ruby'),
(11, 'ProjectLanguage', '2017-03-12 16:48:43', '2017-03-12 15:17:54', 'SCSS', 'CF649A', 6, 'scss'),
(12, 'ProjectLanguage', '2017-03-12 16:48:53', '2017-03-12 15:18:14', 'SASS', 'CF649A', 6, 'sass');

-- --------------------------------------------------------

--
-- Table structure for table `projectpage`
--

DROP TABLE IF EXISTS `projectpage`;
CREATE TABLE `projectpage` (
  `ID` int(11) NOT NULL,
  `ProjectHolderID` int(11) NOT NULL DEFAULT '0',
  `MainPhotoID` int(11) NOT NULL DEFAULT '0',
  `MainImageHasLogo` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `Teaser` mediumtext,
  `SourceLink` varchar(50) DEFAULT NULL,
  `ViewLink` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projectpage`
--

INSERT INTO `projectpage` (`ID`, `ProjectHolderID`, `MainPhotoID`, `MainImageHasLogo`, `Teaser`, `SourceLink`, `ViewLink`) VALUES
(7, 0, 4, 0, NULL, NULL, 'http://matthewkoerber.com/InnPizza/'),
(8, 0, 5, 1, NULL, NULL, 'http://matthewkoerber.com/corestrengthrehab'),
(10, 0, 7, 0, NULL, NULL, NULL),
(11, 0, 8, 0, NULL, NULL, NULL),
(12, 0, 9, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `projectpage_frameworks`
--

DROP TABLE IF EXISTS `projectpage_frameworks`;
CREATE TABLE `projectpage_frameworks` (
  `ID` int(11) NOT NULL,
  `ProjectPageID` int(11) NOT NULL DEFAULT '0',
  `ProjectFrameworkID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projectpage_frameworks`
--

INSERT INTO `projectpage_frameworks` (`ID`, `ProjectPageID`, `ProjectFrameworkID`) VALUES
(1, 8, 1),
(2, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `projectpage_languages`
--

DROP TABLE IF EXISTS `projectpage_languages`;
CREATE TABLE `projectpage_languages` (
  `ID` int(11) NOT NULL,
  `ProjectPageID` int(11) NOT NULL DEFAULT '0',
  `ProjectLanguageID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projectpage_languages`
--

INSERT INTO `projectpage_languages` (`ID`, `ProjectPageID`, `ProjectLanguageID`) VALUES
(1, 8, 2),
(2, 8, 3),
(3, 8, 5),
(4, 8, 7),
(5, 7, 2),
(6, 7, 3),
(7, 7, 5),
(8, 7, 7),
(9, 12, 2),
(10, 12, 3),
(11, 12, 5),
(12, 12, 7),
(13, 10, 2),
(14, 10, 3),
(15, 10, 5),
(16, 11, 2),
(17, 11, 3),
(18, 11, 5);

-- --------------------------------------------------------

--
-- Table structure for table `projectpage_live`
--

DROP TABLE IF EXISTS `projectpage_live`;
CREATE TABLE `projectpage_live` (
  `ID` int(11) NOT NULL,
  `ProjectHolderID` int(11) NOT NULL DEFAULT '0',
  `MainPhotoID` int(11) NOT NULL DEFAULT '0',
  `MainImageHasLogo` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `Teaser` mediumtext,
  `SourceLink` varchar(50) DEFAULT NULL,
  `ViewLink` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projectpage_live`
--

INSERT INTO `projectpage_live` (`ID`, `ProjectHolderID`, `MainPhotoID`, `MainImageHasLogo`, `Teaser`, `SourceLink`, `ViewLink`) VALUES
(7, 0, 4, 0, NULL, NULL, 'http://matthewkoerber.com/InnPizza/'),
(8, 0, 5, 1, NULL, NULL, 'http://matthewkoerber.com/corestrengthrehab'),
(10, 0, 7, 0, NULL, NULL, NULL),
(11, 0, 8, 0, NULL, NULL, NULL),
(12, 0, 9, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `projectpage_versions`
--

DROP TABLE IF EXISTS `projectpage_versions`;
CREATE TABLE `projectpage_versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ProjectHolderID` int(11) NOT NULL DEFAULT '0',
  `MainPhotoID` int(11) NOT NULL DEFAULT '0',
  `MainImageHasLogo` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `Teaser` mediumtext,
  `SourceLink` varchar(50) DEFAULT NULL,
  `ViewLink` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projectpage_versions`
--

INSERT INTO `projectpage_versions` (`ID`, `RecordID`, `Version`, `ProjectHolderID`, `MainPhotoID`, `MainImageHasLogo`, `Teaser`, `SourceLink`, `ViewLink`) VALUES
(1, 7, 1, 0, 0, 0, NULL, NULL, NULL),
(2, 7, 2, 0, 0, 0, NULL, NULL, NULL),
(3, 7, 3, 0, 0, 0, NULL, NULL, NULL),
(4, 8, 1, 0, 0, 0, NULL, NULL, NULL),
(5, 8, 2, 0, 0, 0, NULL, NULL, NULL),
(6, 7, 4, 0, 4, 0, NULL, NULL, NULL),
(7, 10, 1, 0, 0, 0, NULL, NULL, NULL),
(8, 10, 2, 0, 0, 0, NULL, NULL, NULL),
(9, 11, 1, 0, 0, 0, NULL, NULL, NULL),
(10, 11, 2, 0, 0, 0, NULL, NULL, NULL),
(11, 12, 1, 0, 0, 0, NULL, NULL, NULL),
(12, 12, 2, 0, 0, 0, NULL, NULL, NULL),
(13, 8, 3, 0, 5, 0, NULL, NULL, NULL),
(14, 10, 3, 0, 6, 0, NULL, NULL, NULL),
(15, 10, 4, 0, 7, 0, NULL, NULL, NULL),
(16, 11, 3, 0, 8, 0, NULL, NULL, NULL),
(17, 12, 3, 0, 9, 0, NULL, NULL, NULL),
(18, 8, 4, 0, 5, 1, NULL, NULL, NULL),
(19, 8, 5, 0, 5, 1, NULL, NULL, NULL),
(20, 12, 4, 0, 9, 0, NULL, NULL, NULL),
(21, 8, 6, 0, 5, 1, 'Teaser test text here\r\n\r\nsecond p?', NULL, NULL),
(22, 8, 7, 0, 5, 1, 'Teaser test text here\r\n\r\nsecond p?', NULL, NULL),
(23, 8, 8, 0, 5, 1, NULL, NULL, 'http://matthewkoerber.com/corestrengthrehab'),
(24, 7, 5, 0, 4, 0, NULL, NULL, 'http://matthewkoerber.com/InnPizza/');

-- --------------------------------------------------------

--
-- Table structure for table `redirectorpage`
--

DROP TABLE IF EXISTS `redirectorpage`;
CREATE TABLE `redirectorpage` (
  `ID` int(11) NOT NULL,
  `RedirectionType` enum('Internal','External') DEFAULT 'Internal',
  `ExternalURL` varchar(2083) DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `redirectorpage_live`
--

DROP TABLE IF EXISTS `redirectorpage_live`;
CREATE TABLE `redirectorpage_live` (
  `ID` int(11) NOT NULL,
  `RedirectionType` enum('Internal','External') DEFAULT 'Internal',
  `ExternalURL` varchar(2083) DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `redirectorpage_versions`
--

DROP TABLE IF EXISTS `redirectorpage_versions`;
CREATE TABLE `redirectorpage_versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `RedirectionType` enum('Internal','External') DEFAULT 'Internal',
  `ExternalURL` varchar(2083) DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `siteconfig`
--

DROP TABLE IF EXISTS `siteconfig`;
CREATE TABLE `siteconfig` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SiteConfig') DEFAULT 'SiteConfig',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Tagline` varchar(255) DEFAULT NULL,
  `Theme` varchar(255) DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers') DEFAULT 'Anyone',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers') DEFAULT 'LoggedInUsers',
  `CanCreateTopLevelType` enum('LoggedInUsers','OnlyTheseUsers') DEFAULT 'LoggedInUsers',
  `LanguageLink` varchar(50) DEFAULT NULL,
  `FrameworkLink` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `siteconfig`
--

INSERT INTO `siteconfig` (`ID`, `ClassName`, `LastEdited`, `Created`, `Title`, `Tagline`, `Theme`, `CanViewType`, `CanEditType`, `CanCreateTopLevelType`, `LanguageLink`, `FrameworkLink`) VALUES
(1, 'SiteConfig', '2017-03-13 19:33:15', '2017-03-09 16:26:15', 'Matthew Koerber', 'Trying to come up with a tagline', 'portfolio', 'Anyone', 'LoggedInUsers', 'LoggedInUsers', 'languages', 'frameworks');

-- --------------------------------------------------------

--
-- Table structure for table `siteconfig_createtoplevelgroups`
--

DROP TABLE IF EXISTS `siteconfig_createtoplevelgroups`;
CREATE TABLE `siteconfig_createtoplevelgroups` (
  `ID` int(11) NOT NULL,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `siteconfig_editorgroups`
--

DROP TABLE IF EXISTS `siteconfig_editorgroups`;
CREATE TABLE `siteconfig_editorgroups` (
  `ID` int(11) NOT NULL,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `siteconfig_viewergroups`
--

DROP TABLE IF EXISTS `siteconfig_viewergroups`;
CREATE TABLE `siteconfig_viewergroups` (
  `ID` int(11) NOT NULL,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitetree`
--

DROP TABLE IF EXISTS `sitetree`;
CREATE TABLE `sitetree` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SiteTree','Page','ErrorPage','RedirectorPage','VirtualPage','ProjectHolder','ProjectPage') DEFAULT 'SiteTree',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `URLSegment` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `MenuTitle` varchar(100) DEFAULT NULL,
  `Content` mediumtext,
  `MetaDescription` mediumtext,
  `ExtraMeta` mediumtext,
  `ShowInMenus` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `ReportClass` varchar(50) DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sitetree`
--

INSERT INTO `sitetree` (`ID`, `ClassName`, `LastEdited`, `Created`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `ReportClass`, `CanViewType`, `CanEditType`, `Version`, `ParentID`) VALUES
(1, 'Page', '2017-03-11 21:40:05', '2017-03-09 16:26:14', 'home', 'Home', NULL, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href="admin/">the CMS</a>.</p><p>You can now access the <a href="http://docs.silverstripe.org">developer documentation</a>, or begin the <a href="http://www.silverstripe.org/learn/lessons">SilverStripe lessons</a>.</p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 1, 0),
(2, 'Page', '2017-03-11 21:40:05', '2017-03-09 16:26:14', 'bio', 'Bio', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.</p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 2, 0),
(4, 'ErrorPage', '2017-03-11 21:40:05', '2017-03-09 16:26:15', 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 'Inherit', 'Inherit', 1, 0),
(5, 'ErrorPage', '2017-03-11 21:40:05', '2017-03-09 16:26:16', 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, 0, 0, 6, 0, 0, NULL, 'Inherit', 'Inherit', 1, 0),
(6, 'ProjectHolder', '2017-03-13 21:47:24', '2017-03-11 17:19:02', 'projects', 'Projects', NULL, '<p>Check out the [languagelink]langauges[/languagelink] I have used!</p><p>Check out the [frameworklink]frameworks[/frameworklink] I have used!</p>', NULL, NULL, 1, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', 6, 0),
(7, 'ProjectPage', '2017-03-14 00:46:47', '2017-03-11 17:20:16', 'village-inn-pizza', 'Village Inn Pizza', NULL, '<p>Made for the Integrated Web Concepts course. The team consisted of two graphics designers, a marketer, and a developer. <span><br></span></p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 5, 6),
(8, 'ProjectPage', '2017-03-13 23:55:50', '2017-03-11 19:56:57', 'core-strength-rehab', 'Core Strength Rehab', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 8, 6),
(9, 'Page', '2017-03-12 00:52:38', '2017-03-11 20:04:25', 'resume', 'Résumé', NULL, '<h3 style="text-align: center;">Education</h3><p><span id="docs-internal-guid-99587225-bfea-2d30-888c-e6de9951714a"><span>Lakeshore Technical College, Cleveland, Wisconsin (Web and Software Development)</span></span></p><ul><li>Currently enrolled in Web and Software Developer program</li>\n<li>Dean’s List Fall 2015, Spring 2016, Fall 2016</li>\n</ul><p> </p><p><span id="docs-internal-guid-99587225-bfea-2d30-888c-e6de9951714a">Lakeshore Technical College, Cleveland, Wisconsin (Mechanical Design)</span></p><ul><li><span id="docs-internal-guid-99587225-bff0-a942-cb22-6ce5fab83ebe"><span>graduated, Spring 2013</span></span></li>\n<li><span id="docs-internal-guid-99587225-bff0-e6a7-ce49-b502fd325c03"><span>Dean’s List, Fall 2011, Spring 2012, Fall 2012</span></span></li>\n</ul><p> </p><p><span><span><span id="docs-internal-guid-99587225-bff4-7525-ea24-bb818188eccf"><span>Graduated from Sheboygan Christian School, 2011</span></span></span></span></p><p> </p><h3 style="text-align: center;"><span><span><span><span>Skills</span></span></span></span></h3><ul><li>Knowledge of CSS, SCSS, Bootstrap, and HTML</li>\n<li>Knowledge of PHP, SQL, Wordpress, SilverStripe</li>\n<li>Knowledge of APS.Net and C#</li>\n<li>Knowledge of Java and Android development</li>\n<li>Knowledge of git</li>\n<li>Basic knowledge of Microsoft Access</li>\n</ul><p> </p>', NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 16, 0),
(10, 'ProjectPage', '2017-03-12 15:26:16', '2017-03-11 23:35:47', 'memory', 'Memory', NULL, NULL, NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 4, 6),
(11, 'ProjectPage', '2017-03-12 17:04:36', '2017-03-11 23:39:27', 'one-person-battleship', 'One Person Battleship', NULL, NULL, NULL, NULL, 1, 1, 5, 0, 0, NULL, 'Inherit', 'Inherit', 3, 6),
(12, 'ProjectPage', '2017-03-12 15:26:07', '2017-03-11 23:40:36', 'ticket-dominator', 'Ticket Dominator', NULL, NULL, NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 4, 6);

-- --------------------------------------------------------

--
-- Table structure for table `sitetree_editorgroups`
--

DROP TABLE IF EXISTS `sitetree_editorgroups`;
CREATE TABLE `sitetree_editorgroups` (
  `ID` int(11) NOT NULL,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitetree_imagetracking`
--

DROP TABLE IF EXISTS `sitetree_imagetracking`;
CREATE TABLE `sitetree_imagetracking` (
  `ID` int(11) NOT NULL,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `FileID` int(11) NOT NULL DEFAULT '0',
  `FieldName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitetree_linktracking`
--

DROP TABLE IF EXISTS `sitetree_linktracking`;
CREATE TABLE `sitetree_linktracking` (
  `ID` int(11) NOT NULL,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `ChildID` int(11) NOT NULL DEFAULT '0',
  `FieldName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sitetree_live`
--

DROP TABLE IF EXISTS `sitetree_live`;
CREATE TABLE `sitetree_live` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SiteTree','Page','ErrorPage','RedirectorPage','VirtualPage','ProjectHolder','ProjectPage') DEFAULT 'SiteTree',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `URLSegment` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `MenuTitle` varchar(100) DEFAULT NULL,
  `Content` mediumtext,
  `MetaDescription` mediumtext,
  `ExtraMeta` mediumtext,
  `ShowInMenus` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `ReportClass` varchar(50) DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sitetree_live`
--

INSERT INTO `sitetree_live` (`ID`, `ClassName`, `LastEdited`, `Created`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `ReportClass`, `CanViewType`, `CanEditType`, `Version`, `ParentID`) VALUES
(1, 'Page', '2017-03-09 16:26:14', '2017-03-09 16:26:14', 'home', 'Home', NULL, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href="admin/">the CMS</a>.</p><p>You can now access the <a href="http://docs.silverstripe.org">developer documentation</a>, or begin the <a href="http://www.silverstripe.org/learn/lessons">SilverStripe lessons</a>.</p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 1, 0),
(2, 'Page', '2017-03-11 20:04:15', '2017-03-09 16:26:14', 'bio', 'Bio', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.</p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 2, 0),
(4, 'ErrorPage', '2017-03-09 16:26:28', '2017-03-09 16:26:15', 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 'Inherit', 'Inherit', 1, 0),
(5, 'ErrorPage', '2017-03-09 16:26:16', '2017-03-09 16:26:16', 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, 0, 0, 6, 0, 0, NULL, 'Inherit', 'Inherit', 1, 0),
(6, 'ProjectHolder', '2017-03-13 21:47:24', '2017-03-11 17:19:02', 'projects', 'Projects', NULL, '<p>Check out the [languagelink]langauges[/languagelink] I have used!</p><p>Check out the [frameworklink]frameworks[/frameworklink] I have used!</p>', NULL, NULL, 1, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', 6, 0),
(7, 'ProjectPage', '2017-03-14 00:46:48', '2017-03-11 17:20:16', 'village-inn-pizza', 'Village Inn Pizza', NULL, '<p>Made for the Integrated Web Concepts course. The team consisted of two graphics designers, a marketer, and a developer. <span><br></span></p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 5, 6),
(8, 'ProjectPage', '2017-03-13 23:55:50', '2017-03-11 19:56:57', 'core-strength-rehab', 'Core Strength Rehab', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 8, 6),
(9, 'Page', '2017-03-12 00:52:38', '2017-03-11 20:04:25', 'resume', 'Résumé', NULL, '<h3 style="text-align: center;">Education</h3><p><span id="docs-internal-guid-99587225-bfea-2d30-888c-e6de9951714a"><span>Lakeshore Technical College, Cleveland, Wisconsin (Web and Software Development)</span></span></p><ul><li>Currently enrolled in Web and Software Developer program</li>\n<li>Dean’s List Fall 2015, Spring 2016, Fall 2016</li>\n</ul><p> </p><p><span id="docs-internal-guid-99587225-bfea-2d30-888c-e6de9951714a">Lakeshore Technical College, Cleveland, Wisconsin (Mechanical Design)</span></p><ul><li><span id="docs-internal-guid-99587225-bff0-a942-cb22-6ce5fab83ebe"><span>graduated, Spring 2013</span></span></li>\n<li><span id="docs-internal-guid-99587225-bff0-e6a7-ce49-b502fd325c03"><span>Dean’s List, Fall 2011, Spring 2012, Fall 2012</span></span></li>\n</ul><p> </p><p><span><span><span id="docs-internal-guid-99587225-bff4-7525-ea24-bb818188eccf"><span>Graduated from Sheboygan Christian School, 2011</span></span></span></span></p><p> </p><h3 style="text-align: center;"><span><span><span><span>Skills</span></span></span></span></h3><ul><li>Knowledge of CSS, SCSS, Bootstrap, and HTML</li>\n<li>Knowledge of PHP, SQL, Wordpress, SilverStripe</li>\n<li>Knowledge of APS.Net and C#</li>\n<li>Knowledge of Java and Android development</li>\n<li>Knowledge of git</li>\n<li>Basic knowledge of Microsoft Access</li>\n</ul><p> </p>', NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 16, 0),
(10, 'ProjectPage', '2017-03-12 15:26:17', '2017-03-11 23:35:47', 'memory', 'Memory', NULL, NULL, NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 4, 6),
(11, 'ProjectPage', '2017-03-12 17:04:36', '2017-03-11 23:39:27', 'one-person-battleship', 'One Person Battleship', NULL, NULL, NULL, NULL, 1, 1, 5, 0, 0, NULL, 'Inherit', 'Inherit', 3, 6),
(12, 'ProjectPage', '2017-03-12 15:26:07', '2017-03-11 23:40:36', 'ticket-dominator', 'Ticket Dominator', NULL, NULL, NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 4, 6);

-- --------------------------------------------------------

--
-- Table structure for table `sitetree_versions`
--

DROP TABLE IF EXISTS `sitetree_versions`;
CREATE TABLE `sitetree_versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `WasPublished` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `AuthorID` int(11) NOT NULL DEFAULT '0',
  `PublisherID` int(11) NOT NULL DEFAULT '0',
  `ClassName` enum('SiteTree','Page','ErrorPage','RedirectorPage','VirtualPage','ProjectHolder','ProjectPage') DEFAULT 'SiteTree',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `URLSegment` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `MenuTitle` varchar(100) DEFAULT NULL,
  `Content` mediumtext,
  `MetaDescription` mediumtext,
  `ExtraMeta` mediumtext,
  `ShowInMenus` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `ReportClass` varchar(50) DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `ParentID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sitetree_versions`
--

INSERT INTO `sitetree_versions` (`ID`, `RecordID`, `Version`, `WasPublished`, `AuthorID`, `PublisherID`, `ClassName`, `LastEdited`, `Created`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `ReportClass`, `CanViewType`, `CanEditType`, `ParentID`) VALUES
(1, 1, 1, 1, 0, 0, 'Page', '2017-03-09 16:26:14', '2017-03-09 16:26:14', 'home', 'Home', NULL, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href="admin/">the CMS</a>.</p><p>You can now access the <a href="http://docs.silverstripe.org">developer documentation</a>, or begin the <a href="http://www.silverstripe.org/learn/lessons">SilverStripe lessons</a>.</p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(2, 2, 1, 1, 0, 0, 'Page', '2017-03-09 16:26:14', '2017-03-09 16:26:14', 'about-us', 'About Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br></p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(3, 3, 1, 1, 0, 0, 'Page', '2017-03-09 16:26:15', '2017-03-09 16:26:15', 'contact-us', 'Contact Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br></p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(4, 4, 1, 1, 0, 0, 'ErrorPage', '2017-03-09 16:26:15', '2017-03-09 16:26:15', 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, 0, 0, 4, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(5, 5, 1, 1, 0, 0, 'ErrorPage', '2017-03-09 16:26:16', '2017-03-09 16:26:16', 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(6, 6, 1, 0, 1, 0, 'ProjectHolder', '2017-03-11 17:19:02', '2017-03-11 17:19:02', 'new-project-holder', 'New Project Holder', NULL, NULL, NULL, NULL, 1, 1, 6, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(7, 6, 2, 1, 1, 1, 'ProjectHolder', '2017-03-11 17:19:14', '2017-03-11 17:19:02', 'projects', 'Projects', NULL, NULL, NULL, NULL, 1, 1, 6, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(8, 7, 1, 0, 1, 0, 'ProjectPage', '2017-03-11 17:20:16', '2017-03-11 17:20:16', 'new-project-page', 'New Project Page', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(9, 7, 2, 1, 1, 1, 'ProjectPage', '2017-03-11 17:33:56', '2017-03-11 17:20:16', 'village-inn-pizza', 'Village Inn Pizza', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(10, 7, 3, 1, 1, 1, 'ProjectPage', '2017-03-11 19:56:52', '2017-03-11 17:20:16', 'village-inn-pizza', 'Village Inn Pizza', NULL, '<p>Made for the Integrated Web Concepts course. The team consisted of two graphics designers, a marketer, and a developer. <span><br></span></p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(11, 8, 1, 0, 1, 0, 'ProjectPage', '2017-03-11 19:56:57', '2017-03-11 19:56:57', 'new-project-page', 'New Project Page', NULL, NULL, NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(12, 8, 2, 1, 1, 1, 'ProjectPage', '2017-03-11 19:57:12', '2017-03-11 19:56:57', 'core-strength-rehab', 'Core Strength Rehab', NULL, NULL, NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(13, 2, 2, 1, 1, 1, 'Page', '2017-03-11 20:04:15', '2017-03-09 16:26:14', 'bio', 'Bio', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.</p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(14, 9, 1, 0, 1, 0, 'Page', '2017-03-11 20:04:25', '2017-03-11 20:04:25', 'new-page', 'New Page', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 2),
(15, 9, 2, 1, 1, 1, 'Page', '2017-03-11 20:05:26', '2017-03-11 20:04:25', 'resume', 'Résumé', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 2),
(16, 9, 3, 1, 1, 1, 'Page', '2017-03-11 20:05:36', '2017-03-11 20:04:25', 'resume', 'Résumé', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(17, 9, 4, 1, 1, 1, 'Page', '2017-03-11 20:05:41', '2017-03-11 20:04:25', 'resume', 'Résumé', NULL, NULL, NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(18, 7, 4, 1, 1, 1, 'ProjectPage', '2017-03-11 20:29:27', '2017-03-11 17:20:16', 'village-inn-pizza', 'Village Inn Pizza', NULL, '<p>Made for the Integrated Web Concepts course. The team consisted of two graphics designers, a marketer, and a developer. <span><br></span></p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(19, 10, 1, 0, 1, 0, 'ProjectPage', '2017-03-11 23:35:47', '2017-03-11 23:35:47', 'new-project-page', 'New Project Page', NULL, NULL, NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(20, 10, 2, 1, 1, 1, 'ProjectPage', '2017-03-11 23:39:15', '2017-03-11 23:35:47', 'memory', 'Memory', NULL, NULL, NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(21, 11, 1, 0, 1, 0, 'ProjectPage', '2017-03-11 23:39:27', '2017-03-11 23:39:27', 'new-project-page', 'New Project Page', NULL, NULL, NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(22, 11, 2, 1, 1, 1, 'ProjectPage', '2017-03-11 23:39:50', '2017-03-11 23:39:27', 'one-person-battleship', 'One Person Battleship', NULL, NULL, NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(23, 12, 1, 0, 1, 0, 'ProjectPage', '2017-03-11 23:40:36', '2017-03-11 23:40:36', 'new-project-page', 'New Project Page', NULL, NULL, NULL, NULL, 1, 1, 5, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(24, 12, 2, 1, 1, 1, 'ProjectPage', '2017-03-11 23:40:48', '2017-03-11 23:40:36', 'ticket-dominator', 'Ticket Dominator', NULL, NULL, NULL, NULL, 1, 1, 5, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(25, 8, 3, 1, 1, 1, 'ProjectPage', '2017-03-11 23:45:32', '2017-03-11 19:56:57', 'core-strength-rehab', 'Core Strength Rehab', NULL, NULL, NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(26, 10, 3, 1, 1, 1, 'ProjectPage', '2017-03-11 23:45:57', '2017-03-11 23:35:47', 'memory', 'Memory', NULL, NULL, NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(27, 10, 4, 1, 1, 1, 'ProjectPage', '2017-03-11 23:46:27', '2017-03-11 23:35:47', 'memory', 'Memory', NULL, NULL, NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(28, 11, 3, 1, 1, 1, 'ProjectPage', '2017-03-11 23:46:57', '2017-03-11 23:39:27', 'one-person-battleship', 'One Person Battleship', NULL, NULL, NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(29, 12, 3, 1, 1, 1, 'ProjectPage', '2017-03-11 23:47:56', '2017-03-11 23:40:36', 'ticket-dominator', 'Ticket Dominator', NULL, NULL, NULL, NULL, 1, 1, 5, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(30, 8, 4, 1, 1, 1, 'ProjectPage', '2017-03-12 00:00:03', '2017-03-11 19:56:57', 'core-strength-rehab', 'Core Strength Rehab', NULL, NULL, NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(31, 9, 5, 1, 1, 1, 'Page', '2017-03-12 00:29:46', '2017-03-11 20:04:25', 'resume', 'Résumé', NULL, '<h3>Education</h3><p><span id="docs-internal-guid-99587225-bfea-2d30-888c-e6de9951714a"><span>Lakeshore Technical College, Cleveland, Wisconsin</span></span></p><ul></ul>', NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(32, 9, 6, 1, 1, 1, 'Page', '2017-03-12 00:31:41', '2017-03-11 20:04:25', 'resume', 'Résumé', NULL, '<h3>Education</h3><p><span id="docs-internal-guid-99587225-bfea-2d30-888c-e6de9951714a"><span>Lakeshore Technical College, Cleveland, Wisconsin</span></span></p><ul><li>Currently enrolled in Web and Software Developer program</li>\n<li>Dean’s List Fall 2015, Spring 2016, Fall 2016</li>\n</ul>', NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(33, 9, 7, 1, 1, 1, 'Page', '2017-03-12 00:35:34', '2017-03-11 20:04:25', 'resume', 'Résumé', NULL, '<h3>Education</h3><p><span id="docs-internal-guid-99587225-bfea-2d30-888c-e6de9951714a"><span>Lakeshore Technical College, Cleveland, Wisconsin (Web and Software Development)</span></span></p><ul><li>Currently enrolled in Web and Software Developer program</li>\n<li>Dean’s List Fall 2015, Spring 2016, Fall 2016</li>\n</ul><p> </p><p><span id="docs-internal-guid-99587225-bfea-2d30-888c-e6de9951714a">Lakeshore Technical College, Cleveland, Wisconsin (Mechanical Design)</span></p><ul><li><span id="docs-internal-guid-99587225-bff0-a942-cb22-6ce5fab83ebe"><span>graduated, Spring 2013</span></span></li>\n<li><span id="docs-internal-guid-99587225-bff0-e6a7-ce49-b502fd325c03"><span>Dean’s List, Fall 2011, Spring 2012, Fall 2012</span></span></li>\n</ul>', NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(34, 9, 8, 1, 1, 1, 'Page', '2017-03-12 00:36:00', '2017-03-11 20:04:25', 'resume', 'Résumé', NULL, '<h3 style="text-align: center;">Education</h3><p><span id="docs-internal-guid-99587225-bfea-2d30-888c-e6de9951714a"><span>Lakeshore Technical College, Cleveland, Wisconsin (Web and Software Development)</span></span></p><ul><li>Currently enrolled in Web and Software Developer program</li>\n<li>Dean’s List Fall 2015, Spring 2016, Fall 2016</li>\n</ul><p> </p><p><span id="docs-internal-guid-99587225-bfea-2d30-888c-e6de9951714a">Lakeshore Technical College, Cleveland, Wisconsin (Mechanical Design)</span></p><ul><li><span id="docs-internal-guid-99587225-bff0-a942-cb22-6ce5fab83ebe"><span>graduated, Spring 2013</span></span></li>\n<li><span id="docs-internal-guid-99587225-bff0-e6a7-ce49-b502fd325c03"><span>Dean’s List, Fall 2011, Spring 2012, Fall 2012</span></span></li>\n</ul>', NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(35, 9, 9, 1, 1, 1, 'Page', '2017-03-12 00:39:40', '2017-03-11 20:04:25', 'resume', 'Résumé', NULL, '<h3 style="text-align: center;">Education</h3><p><span id="docs-internal-guid-99587225-bfea-2d30-888c-e6de9951714a"><span>Lakeshore Technical College, Cleveland, Wisconsin (Web and Software Development)</span></span></p><ul><li>Currently enrolled in Web and Software Developer program</li>\n<li>Dean’s List Fall 2015, Spring 2016, Fall 2016</li>\n</ul><p> </p><p><span id="docs-internal-guid-99587225-bfea-2d30-888c-e6de9951714a">Lakeshore Technical College, Cleveland, Wisconsin (Mechanical Design)</span></p><ul><li><span id="docs-internal-guid-99587225-bff0-a942-cb22-6ce5fab83ebe"><span>graduated, Spring 2013</span></span></li>\n<li><span id="docs-internal-guid-99587225-bff0-e6a7-ce49-b502fd325c03"><span>Dean’s List, Fall 2011, Spring 2012, Fall 2012</span></span></li>\n</ul><p> </p><p><span><span><span id="docs-internal-guid-99587225-bff4-7525-ea24-bb818188eccf"><span>Graduated from Sheboygan Christian School, 2011</span></span></span></span></p><p> </p><h3 style="text-align: center;"><span><span><span><span>Skills</span></span></span></span></h3>', NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(36, 9, 10, 1, 1, 1, 'Page', '2017-03-12 00:39:55', '2017-03-11 20:04:25', 'resume', 'Résumé', NULL, '<h3 style="text-align: center;">Education</h3><p><span id="docs-internal-guid-99587225-bfea-2d30-888c-e6de9951714a"><span>Lakeshore Technical College, Cleveland, Wisconsin (Web and Software Development)</span></span></p><ul><li>Currently enrolled in Web and Software Developer program</li>\n<li>Dean’s List Fall 2015, Spring 2016, Fall 2016</li>\n</ul><p><span id="docs-internal-guid-99587225-bfea-2d30-888c-e6de9951714a">Lakeshore Technical College, Cleveland, Wisconsin (Mechanical Design)</span></p><ul><li><span id="docs-internal-guid-99587225-bff0-a942-cb22-6ce5fab83ebe"><span>graduated, Spring 2013</span></span></li>\n<li><span id="docs-internal-guid-99587225-bff0-e6a7-ce49-b502fd325c03"><span>Dean’s List, Fall 2011, Spring 2012, Fall 2012</span></span></li>\n</ul><p><span><span><span id="docs-internal-guid-99587225-bff4-7525-ea24-bb818188eccf"><span>Graduated from Sheboygan Christian School, 2011</span></span></span></span></p><p> </p><h3 style="text-align: center;"><span><span><span><span>Skills</span></span></span></span></h3>', NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(37, 9, 11, 1, 1, 1, 'Page', '2017-03-12 00:40:07', '2017-03-11 20:04:25', 'resume', 'Résumé', NULL, '<h3 style="text-align: center;">Education</h3><p><span id="docs-internal-guid-99587225-bfea-2d30-888c-e6de9951714a"><span>Lakeshore Technical College, Cleveland, Wisconsin (Web and Software Development)</span></span></p><ul><li>Currently enrolled in Web and Software Developer program</li>\n<li>Dean’s List Fall 2015, Spring 2016, Fall 2016</li>\n</ul><p> </p><p><span id="docs-internal-guid-99587225-bfea-2d30-888c-e6de9951714a">Lakeshore Technical College, Cleveland, Wisconsin (Mechanical Design)</span></p><ul><li><span id="docs-internal-guid-99587225-bff0-a942-cb22-6ce5fab83ebe"><span>graduated, Spring 2013</span></span></li>\n<li><span id="docs-internal-guid-99587225-bff0-e6a7-ce49-b502fd325c03"><span>Dean’s List, Fall 2011, Spring 2012, Fall 2012</span></span></li>\n</ul><p> </p><p><span><span><span id="docs-internal-guid-99587225-bff4-7525-ea24-bb818188eccf"><span>Graduated from Sheboygan Christian School, 2011</span></span></span></span></p><p> </p><h3 style="text-align: center;"><span><span><span><span>Skills</span></span></span></span></h3>', NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(38, 9, 12, 1, 1, 1, 'Page', '2017-03-12 00:42:20', '2017-03-11 20:04:25', 'resume', 'Résumé', NULL, '<h3 style="text-align: center;">Education</h3><p><span id="docs-internal-guid-99587225-bfea-2d30-888c-e6de9951714a"><span>Lakeshore Technical College, Cleveland, Wisconsin (Web and Software Development)</span></span></p><ul><li>Currently enrolled in Web and Software Developer program</li>\n<li>Dean’s List Fall 2015, Spring 2016, Fall 2016</li>\n</ul><p> </p><p><span id="docs-internal-guid-99587225-bfea-2d30-888c-e6de9951714a">Lakeshore Technical College, Cleveland, Wisconsin (Mechanical Design)</span></p><ul><li><span id="docs-internal-guid-99587225-bff0-a942-cb22-6ce5fab83ebe"><span>graduated, Spring 2013</span></span></li>\n<li><span id="docs-internal-guid-99587225-bff0-e6a7-ce49-b502fd325c03"><span>Dean’s List, Fall 2011, Spring 2012, Fall 2012</span></span></li>\n</ul><p> </p><p><span><span><span id="docs-internal-guid-99587225-bff4-7525-ea24-bb818188eccf"><span>Graduated from Sheboygan Christian School, 2011</span></span></span></span></p><p> </p><h3 style="text-align: center;"><span><span><span><span>Skills</span></span></span></span></h3><h4 style="text-align: center;"><span><span><span><span>Web and software development</span></span></span></span></h4><p> </p>', NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(39, 9, 13, 1, 1, 1, 'Page', '2017-03-12 00:49:12', '2017-03-11 20:04:25', 'resume', 'Résumé', NULL, '<h3 style="text-align: center;">Education</h3><p><span id="docs-internal-guid-99587225-bfea-2d30-888c-e6de9951714a"><span>Lakeshore Technical College, Cleveland, Wisconsin (Web and Software Development)</span></span></p><ul><li>Currently enrolled in Web and Software Developer program</li>\n<li>Dean’s List Fall 2015, Spring 2016, Fall 2016</li>\n</ul><p> </p><p><span id="docs-internal-guid-99587225-bfea-2d30-888c-e6de9951714a">Lakeshore Technical College, Cleveland, Wisconsin (Mechanical Design)</span></p><ul><li><span id="docs-internal-guid-99587225-bff0-a942-cb22-6ce5fab83ebe"><span>graduated, Spring 2013</span></span></li>\n<li><span id="docs-internal-guid-99587225-bff0-e6a7-ce49-b502fd325c03"><span>Dean’s List, Fall 2011, Spring 2012, Fall 2012</span></span></li>\n</ul><p> </p><p><span><span><span id="docs-internal-guid-99587225-bff4-7525-ea24-bb818188eccf"><span>Graduated from Sheboygan Christian School, 2011</span></span></span></span></p><p> </p><h3 style="text-align: center;"><span><span><span><span>Skills</span></span></span></span></h3><ul><li>Knowledge of CSS, SCSS, Bootstrap, and HTML</li>\n<li>Knowledge of PHP, SQL, Wordpress, SilverStripe</li>\n</ul><p> </p>', NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(40, 9, 14, 1, 1, 1, 'Page', '2017-03-12 00:49:43', '2017-03-11 20:04:25', 'resume', 'Résumé', NULL, '<h3 style="text-align: center;">Education</h3><p><span id="docs-internal-guid-99587225-bfea-2d30-888c-e6de9951714a"><span>Lakeshore Technical College, Cleveland, Wisconsin (Web and Software Development)</span></span></p><ul><li>Currently enrolled in Web and Software Developer program</li>\n<li>Dean’s List Fall 2015, Spring 2016, Fall 2016</li>\n</ul><p> </p><p><span id="docs-internal-guid-99587225-bfea-2d30-888c-e6de9951714a">Lakeshore Technical College, Cleveland, Wisconsin (Mechanical Design)</span></p><ul><li><span id="docs-internal-guid-99587225-bff0-a942-cb22-6ce5fab83ebe"><span>graduated, Spring 2013</span></span></li>\n<li><span id="docs-internal-guid-99587225-bff0-e6a7-ce49-b502fd325c03"><span>Dean’s List, Fall 2011, Spring 2012, Fall 2012</span></span></li>\n</ul><p> </p><p><span><span><span id="docs-internal-guid-99587225-bff4-7525-ea24-bb818188eccf"><span>Graduated from Sheboygan Christian School, 2011</span></span></span></span></p><p> </p><h3 style="text-align: center;"><span><span><span><span>Skills</span></span></span></span></h3><ul><li>Knowledge of CSS, SCSS, Bootstrap, and HTML</li>\n<li>Knowledge of PHP, SQL, Wordpress, SilverStripe</li>\n<li>Knowledge of Java and Android development</li>\n<li>Knowledge of git</li>\n</ul><p> </p>', NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(41, 9, 15, 1, 1, 1, 'Page', '2017-03-12 00:50:31', '2017-03-11 20:04:25', 'resume', 'Résumé', NULL, '<h3 style="text-align: center;">Education</h3><p><span id="docs-internal-guid-99587225-bfea-2d30-888c-e6de9951714a"><span>Lakeshore Technical College, Cleveland, Wisconsin (Web and Software Development)</span></span></p><ul><li>Currently enrolled in Web and Software Developer program</li>\n<li>Dean’s List Fall 2015, Spring 2016, Fall 2016</li>\n</ul><p> </p><p><span id="docs-internal-guid-99587225-bfea-2d30-888c-e6de9951714a">Lakeshore Technical College, Cleveland, Wisconsin (Mechanical Design)</span></p><ul><li><span id="docs-internal-guid-99587225-bff0-a942-cb22-6ce5fab83ebe"><span>graduated, Spring 2013</span></span></li>\n<li><span id="docs-internal-guid-99587225-bff0-e6a7-ce49-b502fd325c03"><span>Dean’s List, Fall 2011, Spring 2012, Fall 2012</span></span></li>\n</ul><p> </p><p><span><span><span id="docs-internal-guid-99587225-bff4-7525-ea24-bb818188eccf"><span>Graduated from Sheboygan Christian School, 2011</span></span></span></span></p><p> </p><h3 style="text-align: center;"><span><span><span><span>Skills</span></span></span></span></h3><ul><li>Knowledge of CSS, SCSS, Bootstrap, and HTML</li>\n<li>Knowledge of PHP, SQL, Wordpress, SilverStripe</li>\n<li>Knowledge of APS.Net and C#</li>\n<li>Knowledge of Java and Android development</li>\n<li>Knowledge of git</li>\n</ul><p> </p>', NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(42, 9, 16, 1, 1, 1, 'Page', '2017-03-12 00:52:38', '2017-03-11 20:04:25', 'resume', 'Résumé', NULL, '<h3 style="text-align: center;">Education</h3><p><span id="docs-internal-guid-99587225-bfea-2d30-888c-e6de9951714a"><span>Lakeshore Technical College, Cleveland, Wisconsin (Web and Software Development)</span></span></p><ul><li>Currently enrolled in Web and Software Developer program</li>\n<li>Dean’s List Fall 2015, Spring 2016, Fall 2016</li>\n</ul><p> </p><p><span id="docs-internal-guid-99587225-bfea-2d30-888c-e6de9951714a">Lakeshore Technical College, Cleveland, Wisconsin (Mechanical Design)</span></p><ul><li><span id="docs-internal-guid-99587225-bff0-a942-cb22-6ce5fab83ebe"><span>graduated, Spring 2013</span></span></li>\n<li><span id="docs-internal-guid-99587225-bff0-e6a7-ce49-b502fd325c03"><span>Dean’s List, Fall 2011, Spring 2012, Fall 2012</span></span></li>\n</ul><p> </p><p><span><span><span id="docs-internal-guid-99587225-bff4-7525-ea24-bb818188eccf"><span>Graduated from Sheboygan Christian School, 2011</span></span></span></span></p><p> </p><h3 style="text-align: center;"><span><span><span><span>Skills</span></span></span></span></h3><ul><li>Knowledge of CSS, SCSS, Bootstrap, and HTML</li>\n<li>Knowledge of PHP, SQL, Wordpress, SilverStripe</li>\n<li>Knowledge of APS.Net and C#</li>\n<li>Knowledge of Java and Android development</li>\n<li>Knowledge of git</li>\n<li>Basic knowledge of Microsoft Access</li>\n</ul><p> </p>', NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(43, 8, 5, 1, 1, 1, 'ProjectPage', '2017-03-12 01:00:34', '2017-03-11 19:56:57', 'core-strength-rehab', 'Core Strength Rehab', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(44, 12, 4, 1, 1, 1, 'ProjectPage', '2017-03-12 01:00:41', '2017-03-11 23:40:36', 'ticket-dominator', 'Ticket Dominator', NULL, NULL, NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(45, 8, 6, 1, 1, 1, 'ProjectPage', '2017-03-12 01:09:09', '2017-03-11 19:56:57', 'core-strength-rehab', 'Core Strength Rehab', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(46, 8, 7, 1, 1, 1, 'ProjectPage', '2017-03-12 01:10:25', '2017-03-11 19:56:57', 'core-strength-rehab', 'Core Strength Rehab', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(47, 6, 3, 1, 1, 1, 'ProjectHolder', '2017-03-13 21:36:25', '2017-03-11 17:19:02', 'projects', 'Projects', NULL, '<p>[languagelink]Langauges[/languagelink]</p>', NULL, NULL, 1, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(48, 6, 4, 1, 1, 1, 'ProjectHolder', '2017-03-13 21:37:28', '2017-03-11 17:19:02', 'projects', 'Projects', NULL, '<p>Check out the [languagelink]Langauges[/languagelink] I have used!</p>', NULL, NULL, 1, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(49, 6, 5, 1, 1, 1, 'ProjectHolder', '2017-03-13 21:39:33', '2017-03-11 17:19:02', 'projects', 'Projects', NULL, '<p>Check out the [languagelink]Langauges[/languagelink] I have used!</p><p>Check out the [frameworklink]frameworks[/frameworklink] I have used!</p>', NULL, NULL, 1, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(50, 6, 6, 1, 1, 1, 'ProjectHolder', '2017-03-13 21:47:24', '2017-03-11 17:19:02', 'projects', 'Projects', NULL, '<p>Check out the [languagelink]langauges[/languagelink] I have used!</p><p>Check out the [frameworklink]frameworks[/frameworklink] I have used!</p>', NULL, NULL, 1, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(51, 8, 8, 1, 1, 1, 'ProjectPage', '2017-03-13 23:55:50', '2017-03-11 19:56:57', 'core-strength-rehab', 'Core Strength Rehab', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(52, 7, 5, 1, 1, 1, 'ProjectPage', '2017-03-14 00:46:47', '2017-03-11 17:20:16', 'village-inn-pizza', 'Village Inn Pizza', NULL, '<p>Made for the Integrated Web Concepts course. The team consisted of two graphics designers, a marketer, and a developer. <span><br></span></p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 6);

-- --------------------------------------------------------

--
-- Table structure for table `sitetree_viewergroups`
--

DROP TABLE IF EXISTS `sitetree_viewergroups`;
CREATE TABLE `sitetree_viewergroups` (
  `ID` int(11) NOT NULL,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `virtualpage`
--

DROP TABLE IF EXISTS `virtualpage`;
CREATE TABLE `virtualpage` (
  `ID` int(11) NOT NULL,
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `virtualpage_live`
--

DROP TABLE IF EXISTS `virtualpage_live`;
CREATE TABLE `virtualpage_live` (
  `ID` int(11) NOT NULL,
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `virtualpage_versions`
--

DROP TABLE IF EXISTS `virtualpage_versions`;
CREATE TABLE `virtualpage_versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `errorpage`
--
ALTER TABLE `errorpage`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `errorpage_live`
--
ALTER TABLE `errorpage_live`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `errorpage_versions`
--
ALTER TABLE `errorpage_versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`);

--
-- Indexes for table `file`
--
ALTER TABLE `file`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ParentID` (`ParentID`),
  ADD KEY `OwnerID` (`OwnerID`),
  ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ParentID` (`ParentID`),
  ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `group_members`
--
ALTER TABLE `group_members`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `GroupID` (`GroupID`),
  ADD KEY `MemberID` (`MemberID`);

--
-- Indexes for table `group_roles`
--
ALTER TABLE `group_roles`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `GroupID` (`GroupID`),
  ADD KEY `PermissionRoleID` (`PermissionRoleID`);

--
-- Indexes for table `loginattempt`
--
ALTER TABLE `loginattempt`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `MemberID` (`MemberID`),
  ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Email` (`Email`),
  ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `memberpassword`
--
ALTER TABLE `memberpassword`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `MemberID` (`MemberID`),
  ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `GroupID` (`GroupID`),
  ADD KEY `Code` (`Code`),
  ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `permissionrole`
--
ALTER TABLE `permissionrole`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `permissionrolecode`
--
ALTER TABLE `permissionrolecode`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RoleID` (`RoleID`),
  ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `projectframework`
--
ALTER TABLE `projectframework`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ProjectHolderID` (`ProjectHolderID`),
  ADD KEY `URLSegment` (`URLSegment`),
  ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `projectlanguage`
--
ALTER TABLE `projectlanguage`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ProjectHolderID` (`ProjectHolderID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `URLSegment` (`URLSegment`);

--
-- Indexes for table `projectpage`
--
ALTER TABLE `projectpage`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ProjectHolderID` (`ProjectHolderID`),
  ADD KEY `MainPhotoID` (`MainPhotoID`);

--
-- Indexes for table `projectpage_frameworks`
--
ALTER TABLE `projectpage_frameworks`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ProjectPageID` (`ProjectPageID`),
  ADD KEY `ProjectFrameworkID` (`ProjectFrameworkID`);

--
-- Indexes for table `projectpage_languages`
--
ALTER TABLE `projectpage_languages`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ProjectPageID` (`ProjectPageID`),
  ADD KEY `ProjectLanguageID` (`ProjectLanguageID`);

--
-- Indexes for table `projectpage_live`
--
ALTER TABLE `projectpage_live`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ProjectHolderID` (`ProjectHolderID`),
  ADD KEY `MainPhotoID` (`MainPhotoID`);

--
-- Indexes for table `projectpage_versions`
--
ALTER TABLE `projectpage_versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`),
  ADD KEY `ProjectHolderID` (`ProjectHolderID`),
  ADD KEY `MainPhotoID` (`MainPhotoID`);

--
-- Indexes for table `redirectorpage`
--
ALTER TABLE `redirectorpage`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `LinkToID` (`LinkToID`);

--
-- Indexes for table `redirectorpage_live`
--
ALTER TABLE `redirectorpage_live`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `LinkToID` (`LinkToID`);

--
-- Indexes for table `redirectorpage_versions`
--
ALTER TABLE `redirectorpage_versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`),
  ADD KEY `LinkToID` (`LinkToID`);

--
-- Indexes for table `siteconfig`
--
ALTER TABLE `siteconfig`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `siteconfig_createtoplevelgroups`
--
ALTER TABLE `siteconfig_createtoplevelgroups`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SiteConfigID` (`SiteConfigID`),
  ADD KEY `GroupID` (`GroupID`);

--
-- Indexes for table `siteconfig_editorgroups`
--
ALTER TABLE `siteconfig_editorgroups`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SiteConfigID` (`SiteConfigID`),
  ADD KEY `GroupID` (`GroupID`);

--
-- Indexes for table `siteconfig_viewergroups`
--
ALTER TABLE `siteconfig_viewergroups`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SiteConfigID` (`SiteConfigID`),
  ADD KEY `GroupID` (`GroupID`);

--
-- Indexes for table `sitetree`
--
ALTER TABLE `sitetree`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ParentID` (`ParentID`),
  ADD KEY `URLSegment` (`URLSegment`),
  ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `sitetree_editorgroups`
--
ALTER TABLE `sitetree_editorgroups`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SiteTreeID` (`SiteTreeID`),
  ADD KEY `GroupID` (`GroupID`);

--
-- Indexes for table `sitetree_imagetracking`
--
ALTER TABLE `sitetree_imagetracking`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SiteTreeID` (`SiteTreeID`),
  ADD KEY `FileID` (`FileID`);

--
-- Indexes for table `sitetree_linktracking`
--
ALTER TABLE `sitetree_linktracking`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SiteTreeID` (`SiteTreeID`),
  ADD KEY `ChildID` (`ChildID`);

--
-- Indexes for table `sitetree_live`
--
ALTER TABLE `sitetree_live`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ParentID` (`ParentID`),
  ADD KEY `URLSegment` (`URLSegment`),
  ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `sitetree_versions`
--
ALTER TABLE `sitetree_versions`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`),
  ADD KEY `AuthorID` (`AuthorID`),
  ADD KEY `PublisherID` (`PublisherID`),
  ADD KEY `ParentID` (`ParentID`),
  ADD KEY `URLSegment` (`URLSegment`),
  ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `sitetree_viewergroups`
--
ALTER TABLE `sitetree_viewergroups`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SiteTreeID` (`SiteTreeID`),
  ADD KEY `GroupID` (`GroupID`);

--
-- Indexes for table `virtualpage`
--
ALTER TABLE `virtualpage`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CopyContentFromID` (`CopyContentFromID`);

--
-- Indexes for table `virtualpage_live`
--
ALTER TABLE `virtualpage_live`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CopyContentFromID` (`CopyContentFromID`);

--
-- Indexes for table `virtualpage_versions`
--
ALTER TABLE `virtualpage_versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`),
  ADD KEY `CopyContentFromID` (`CopyContentFromID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `errorpage`
--
ALTER TABLE `errorpage`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `errorpage_live`
--
ALTER TABLE `errorpage_live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `errorpage_versions`
--
ALTER TABLE `errorpage_versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `file`
--
ALTER TABLE `file`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `group`
--
ALTER TABLE `group`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `group_members`
--
ALTER TABLE `group_members`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `group_roles`
--
ALTER TABLE `group_roles`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `loginattempt`
--
ALTER TABLE `loginattempt`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `memberpassword`
--
ALTER TABLE `memberpassword`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `permissionrole`
--
ALTER TABLE `permissionrole`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `permissionrolecode`
--
ALTER TABLE `permissionrolecode`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `projectframework`
--
ALTER TABLE `projectframework`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `projectlanguage`
--
ALTER TABLE `projectlanguage`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `projectpage`
--
ALTER TABLE `projectpage`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `projectpage_frameworks`
--
ALTER TABLE `projectpage_frameworks`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `projectpage_languages`
--
ALTER TABLE `projectpage_languages`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `projectpage_live`
--
ALTER TABLE `projectpage_live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `projectpage_versions`
--
ALTER TABLE `projectpage_versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `redirectorpage`
--
ALTER TABLE `redirectorpage`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `redirectorpage_live`
--
ALTER TABLE `redirectorpage_live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `redirectorpage_versions`
--
ALTER TABLE `redirectorpage_versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `siteconfig`
--
ALTER TABLE `siteconfig`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `siteconfig_createtoplevelgroups`
--
ALTER TABLE `siteconfig_createtoplevelgroups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `siteconfig_editorgroups`
--
ALTER TABLE `siteconfig_editorgroups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `siteconfig_viewergroups`
--
ALTER TABLE `siteconfig_viewergroups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitetree`
--
ALTER TABLE `sitetree`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `sitetree_editorgroups`
--
ALTER TABLE `sitetree_editorgroups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitetree_imagetracking`
--
ALTER TABLE `sitetree_imagetracking`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitetree_linktracking`
--
ALTER TABLE `sitetree_linktracking`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sitetree_live`
--
ALTER TABLE `sitetree_live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `sitetree_versions`
--
ALTER TABLE `sitetree_versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `sitetree_viewergroups`
--
ALTER TABLE `sitetree_viewergroups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `virtualpage`
--
ALTER TABLE `virtualpage`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `virtualpage_live`
--
ALTER TABLE `virtualpage_live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `virtualpage_versions`
--
ALTER TABLE `virtualpage_versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
