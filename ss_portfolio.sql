-- phpMyAdmin SQL Dump
-- version 4.0.10.14
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Mar 15, 2017 at 07:45 AM
-- Server version: 5.6.33-cll-lve
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ss_portfolio`
--
CREATE DATABASE IF NOT EXISTS `ss_portfolio` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ss_portfolio`;

-- --------------------------------------------------------

--
-- Table structure for table `ErrorPage`
--

DROP TABLE IF EXISTS `ErrorPage`;
CREATE TABLE IF NOT EXISTS `ErrorPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ErrorCode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ErrorPage`
--

INSERT INTO `ErrorPage` (`ID`, `ErrorCode`) VALUES
(4, 404),
(5, 500);

-- --------------------------------------------------------

--
-- Table structure for table `ErrorPage_Live`
--

DROP TABLE IF EXISTS `ErrorPage_Live`;
CREATE TABLE IF NOT EXISTS `ErrorPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ErrorCode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ErrorPage_Live`
--

INSERT INTO `ErrorPage_Live` (`ID`, `ErrorCode`) VALUES
(4, 404),
(5, 500);

-- --------------------------------------------------------

--
-- Table structure for table `ErrorPage_versions`
--

DROP TABLE IF EXISTS `ErrorPage_versions`;
CREATE TABLE IF NOT EXISTS `ErrorPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ErrorCode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `ErrorPage_versions`
--

INSERT INTO `ErrorPage_versions` (`ID`, `RecordID`, `Version`, `ErrorCode`) VALUES
(1, 4, 1, 404),
(2, 5, 1, 500),
(3, 4, 2, 404),
(4, 4, 3, 404),
(5, 4, 4, 404),
(6, 4, 5, 404),
(7, 4, 6, 404),
(8, 4, 7, 404),
(9, 4, 8, 404),
(10, 4, 9, 404),
(11, 4, 10, 404),
(12, 4, 11, 404),
(13, 4, 12, 404),
(14, 4, 13, 404),
(15, 4, 14, 404),
(16, 4, 15, 404),
(17, 4, 16, 404);

-- --------------------------------------------------------

--
-- Table structure for table `File`
--

DROP TABLE IF EXISTS `File`;
CREATE TABLE IF NOT EXISTS `File` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('File','Folder','Image','Image_Cached') DEFAULT 'File',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Filename` mediumtext,
  `Content` mediumtext,
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  `OwnerID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `OwnerID` (`OwnerID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `File`
--

INSERT INTO `File` (`ID`, `ClassName`, `LastEdited`, `Created`, `Name`, `Title`, `Filename`, `Content`, `ShowInSearch`, `ParentID`, `OwnerID`) VALUES
(1, 'Folder', '2017-03-09 10:26:16', '2017-03-09 10:26:16', 'Uploads', 'Uploads', 'assets/Uploads/', NULL, 1, 0, 0),
(2, 'Image', '2017-03-09 10:26:16', '2017-03-09 10:26:16', 'SilverStripeLogo.png', 'SilverStripeLogo.png', 'assets/Uploads/SilverStripeLogo.png', NULL, 1, 1, 0),
(3, 'Folder', '2017-03-11 20:29:21', '2017-03-11 20:29:21', 'project-photos', 'project-photos', 'assets/project-photos/', NULL, 1, 0, 1),
(4, 'Image', '2017-03-11 20:30:00', '2017-03-11 20:29:21', 'InnPizza-Main.jpg', 'Inn Pizza', 'assets/project-photos/InnPizza-Main.jpg', NULL, 1, 3, 1),
(5, 'Image', '2017-03-11 23:45:29', '2017-03-11 23:45:29', 'CoreStrength-Main.png', 'CoreStrength Main', 'assets/project-photos/CoreStrength-Main.png', NULL, 1, 3, 1),
(7, 'Image', '2017-03-11 23:46:24', '2017-03-11 23:46:24', 'Memory-Main.png', 'Memory Main', 'assets/project-photos/Memory-Main.png', NULL, 1, 3, 1),
(8, 'Image', '2017-03-11 23:46:54', '2017-03-11 23:46:54', 'Battleship-Main.png', 'Battleship Main', 'assets/project-photos/Battleship-Main.png', NULL, 1, 3, 1),
(9, 'Image', '2017-03-11 23:47:54', '2017-03-11 23:47:54', 'TicketDominator-Main.png', 'TicketDominator Main', 'assets/project-photos/TicketDominator-Main.png', NULL, 1, 3, 1),
(10, 'Image', '2017-03-15 01:06:49', '2017-03-15 01:06:49', 'fry-clapping-with-food-futurama.gif', 'fry clapping with food futurama', 'assets/fry-clapping-with-food-futurama.gif', NULL, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Group`
--

DROP TABLE IF EXISTS `Group`;
CREATE TABLE IF NOT EXISTS `Group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Group') DEFAULT 'Group',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Description` mediumtext,
  `Code` varchar(255) DEFAULT NULL,
  `Locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HtmlEditorConfig` mediumtext,
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `Group`
--

INSERT INTO `Group` (`ID`, `ClassName`, `LastEdited`, `Created`, `Title`, `Description`, `Code`, `Locked`, `Sort`, `HtmlEditorConfig`, `ParentID`) VALUES
(1, 'Group', '2017-03-09 16:26:14', '2017-03-09 16:26:14', 'Content Authors', NULL, 'content-authors', 0, 1, NULL, 0),
(2, 'Group', '2017-03-09 16:26:14', '2017-03-09 16:26:14', 'Administrators', NULL, 'administrators', 0, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Group_Members`
--

DROP TABLE IF EXISTS `Group_Members`;
CREATE TABLE IF NOT EXISTS `Group_Members` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `MemberID` (`MemberID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Group_Members`
--

INSERT INTO `Group_Members` (`ID`, `GroupID`, `MemberID`) VALUES
(1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Group_Roles`
--

DROP TABLE IF EXISTS `Group_Roles`;
CREATE TABLE IF NOT EXISTS `Group_Roles` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `PermissionRoleID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `PermissionRoleID` (`PermissionRoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `LoginAttempt`
--

DROP TABLE IF EXISTS `LoginAttempt`;
CREATE TABLE IF NOT EXISTS `LoginAttempt` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('LoginAttempt') DEFAULT 'LoginAttempt',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Status` enum('Success','Failure') DEFAULT 'Success',
  `IP` varchar(255) DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MemberID` (`MemberID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Member`
--

DROP TABLE IF EXISTS `Member`;
CREATE TABLE IF NOT EXISTS `Member` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
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
  `TimeFormat` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Email` (`Email`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Member`
--

INSERT INTO `Member` (`ID`, `ClassName`, `LastEdited`, `Created`, `FirstName`, `Surname`, `Email`, `TempIDHash`, `TempIDExpired`, `Password`, `RememberLoginToken`, `NumVisit`, `LastVisited`, `AutoLoginHash`, `AutoLoginExpired`, `PasswordEncryption`, `Salt`, `PasswordExpiry`, `LockedOutUntil`, `Locale`, `FailedLoginCount`, `DateFormat`, `TimeFormat`) VALUES
(1, 'Member', '2017-03-15 02:08:29', '2017-03-09 16:26:16', 'Matthew', 'Koerber', 'mak001001@gmail.com', '1de21940a6ce3229f7d4422409c4df5cc0d1a95e', '2017-03-18 02:08:29', '$2y$10$24ae7b637c8828c857ec0u334BlO1sY6Y/ITBhUfiMWzFdsQs9Wf.', NULL, 3, '2017-03-15 06:40:14', NULL, NULL, 'blowfish', '10$24ae7b637c8828c857ec06', NULL, NULL, 'en_US', 0, 'MMM d, y', 'h:mm a');

-- --------------------------------------------------------

--
-- Table structure for table `MemberPassword`
--

DROP TABLE IF EXISTS `MemberPassword`;
CREATE TABLE IF NOT EXISTS `MemberPassword` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('MemberPassword') DEFAULT 'MemberPassword',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Password` varchar(160) DEFAULT NULL,
  `Salt` varchar(50) DEFAULT NULL,
  `PasswordEncryption` varchar(50) DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MemberID` (`MemberID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `MemberPassword`
--

INSERT INTO `MemberPassword` (`ID`, `ClassName`, `LastEdited`, `Created`, `Password`, `Salt`, `PasswordEncryption`, `MemberID`) VALUES
(1, 'MemberPassword', '2017-03-09 16:26:16', '2017-03-09 16:26:16', '$2y$10$24ae7b637c8828c857ec0u334BlO1sY6Y/ITBhUfiMWzFdsQs9Wf.', '10$24ae7b637c8828c857ec06', 'blowfish', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Permission`
--

DROP TABLE IF EXISTS `Permission`;
CREATE TABLE IF NOT EXISTS `Permission` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Permission') DEFAULT 'Permission',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Arg` int(11) NOT NULL DEFAULT '0',
  `Type` int(11) NOT NULL DEFAULT '1',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `Code` (`Code`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `Permission`
--

INSERT INTO `Permission` (`ID`, `ClassName`, `LastEdited`, `Created`, `Code`, `Arg`, `Type`, `GroupID`) VALUES
(1, 'Permission', '2017-03-09 16:26:14', '2017-03-09 16:26:14', 'CMS_ACCESS_CMSMain', 0, 1, 1),
(2, 'Permission', '2017-03-09 16:26:14', '2017-03-09 16:26:14', 'CMS_ACCESS_AssetAdmin', 0, 1, 1),
(3, 'Permission', '2017-03-09 16:26:14', '2017-03-09 16:26:14', 'CMS_ACCESS_ReportAdmin', 0, 1, 1),
(4, 'Permission', '2017-03-09 16:26:14', '2017-03-09 16:26:14', 'SiteTree_REORGANISE', 0, 1, 1),
(5, 'Permission', '2017-03-09 16:26:14', '2017-03-09 16:26:14', 'ADMIN', 0, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `PermissionRole`
--

DROP TABLE IF EXISTS `PermissionRole`;
CREATE TABLE IF NOT EXISTS `PermissionRole` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('PermissionRole') DEFAULT 'PermissionRole',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `OnlyAdminCanApply` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `PermissionRoleCode`
--

DROP TABLE IF EXISTS `PermissionRoleCode`;
CREATE TABLE IF NOT EXISTS `PermissionRoleCode` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('PermissionRoleCode') DEFAULT 'PermissionRoleCode',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Code` varchar(50) DEFAULT NULL,
  `RoleID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RoleID` (`RoleID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ProjectFramework`
--

DROP TABLE IF EXISTS `ProjectFramework`;
CREATE TABLE IF NOT EXISTS `ProjectFramework` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('ProjectFramework') DEFAULT 'ProjectFramework',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `BGColor` varchar(6) DEFAULT NULL,
  `URLSegment` varchar(50) DEFAULT NULL,
  `ProjectHolderID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ProjectHolderID` (`ProjectHolderID`),
  KEY `URLSegment` (`URLSegment`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ProjectFramework`
--

INSERT INTO `ProjectFramework` (`ID`, `ClassName`, `LastEdited`, `Created`, `Title`, `BGColor`, `URLSegment`, `ProjectHolderID`) VALUES
(1, 'ProjectFramework', '2017-03-13 00:31:30', '2017-03-13 00:31:30', 'Wordpress', '0073aa', 'wordpress', 6),
(2, 'ProjectFramework', '2017-03-13 00:32:54', '2017-03-13 00:32:54', 'SilverStripe', '005a92', 'silverstripe', 6),
(3, 'ProjectFramework', '2017-03-13 01:49:07', '2017-03-13 01:49:07', 'Bootstrap', '563d7c', 'bootstrap', 6);

-- --------------------------------------------------------

--
-- Table structure for table `ProjectLanguage`
--

DROP TABLE IF EXISTS `ProjectLanguage`;
CREATE TABLE IF NOT EXISTS `ProjectLanguage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('ProjectLanguage') DEFAULT 'ProjectLanguage',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `BGColor` varchar(6) DEFAULT NULL,
  `ProjectHolderID` int(11) NOT NULL DEFAULT '0',
  `URLSegment` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ProjectHolderID` (`ProjectHolderID`),
  KEY `ClassName` (`ClassName`),
  KEY `URLSegment` (`URLSegment`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `ProjectLanguage`
--

INSERT INTO `ProjectLanguage` (`ID`, `ClassName`, `LastEdited`, `Created`, `Title`, `BGColor`, `ProjectHolderID`, `URLSegment`) VALUES
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
-- Table structure for table `ProjectPage`
--

DROP TABLE IF EXISTS `ProjectPage`;
CREATE TABLE IF NOT EXISTS `ProjectPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ProjectHolderID` int(11) NOT NULL DEFAULT '0',
  `MainPhotoID` int(11) NOT NULL DEFAULT '0',
  `MainImageHasLogo` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Teaser` mediumtext,
  `SourceLink` varchar(255) DEFAULT NULL,
  `ViewLink` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ProjectHolderID` (`ProjectHolderID`),
  KEY `MainPhotoID` (`MainPhotoID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `ProjectPage`
--

INSERT INTO `ProjectPage` (`ID`, `ProjectHolderID`, `MainPhotoID`, `MainImageHasLogo`, `Teaser`, `SourceLink`, `ViewLink`) VALUES
(7, 0, 4, 0, NULL, NULL, 'http://matthewkoerber.com/InnPizza/'),
(8, 0, 5, 1, NULL, NULL, 'http://matthewkoerber.com/corestrengthrehab'),
(10, 0, 7, 0, NULL, NULL, 'http://matthewkoerber.com/games/memory/'),
(11, 0, 8, 0, NULL, NULL, 'http://matthewkoerber.com/games/battleship/'),
(12, 0, 9, 0, NULL, NULL, 'http://matthewkoerber.com/TicketDominator/');

-- --------------------------------------------------------

--
-- Table structure for table `ProjectPage_Frameworks`
--

DROP TABLE IF EXISTS `ProjectPage_Frameworks`;
CREATE TABLE IF NOT EXISTS `ProjectPage_Frameworks` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ProjectPageID` int(11) NOT NULL DEFAULT '0',
  `ProjectFrameworkID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ProjectPageID` (`ProjectPageID`),
  KEY `ProjectFrameworkID` (`ProjectFrameworkID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ProjectPage_Frameworks`
--

INSERT INTO `ProjectPage_Frameworks` (`ID`, `ProjectPageID`, `ProjectFrameworkID`) VALUES
(1, 8, 1),
(2, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ProjectPage_Languages`
--

DROP TABLE IF EXISTS `ProjectPage_Languages`;
CREATE TABLE IF NOT EXISTS `ProjectPage_Languages` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ProjectPageID` int(11) NOT NULL DEFAULT '0',
  `ProjectLanguageID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ProjectPageID` (`ProjectPageID`),
  KEY `ProjectLanguageID` (`ProjectLanguageID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `ProjectPage_Languages`
--

INSERT INTO `ProjectPage_Languages` (`ID`, `ProjectPageID`, `ProjectLanguageID`) VALUES
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
-- Table structure for table `ProjectPage_Live`
--

DROP TABLE IF EXISTS `ProjectPage_Live`;
CREATE TABLE IF NOT EXISTS `ProjectPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ProjectHolderID` int(11) NOT NULL DEFAULT '0',
  `MainPhotoID` int(11) NOT NULL DEFAULT '0',
  `MainImageHasLogo` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Teaser` mediumtext,
  `SourceLink` varchar(255) DEFAULT NULL,
  `ViewLink` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ProjectHolderID` (`ProjectHolderID`),
  KEY `MainPhotoID` (`MainPhotoID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `ProjectPage_Live`
--

INSERT INTO `ProjectPage_Live` (`ID`, `ProjectHolderID`, `MainPhotoID`, `MainImageHasLogo`, `Teaser`, `SourceLink`, `ViewLink`) VALUES
(7, 0, 4, 0, NULL, NULL, 'http://matthewkoerber.com/InnPizza/'),
(8, 0, 5, 1, NULL, NULL, 'http://matthewkoerber.com/corestrengthrehab'),
(10, 0, 7, 0, NULL, NULL, 'http://matthewkoerber.com/games/memory/'),
(11, 0, 8, 0, NULL, NULL, 'http://matthewkoerber.com/games/battleship/'),
(12, 0, 9, 0, NULL, NULL, 'http://matthewkoerber.com/TicketDominator/');

-- --------------------------------------------------------

--
-- Table structure for table `ProjectPage_versions`
--

DROP TABLE IF EXISTS `ProjectPage_versions`;
CREATE TABLE IF NOT EXISTS `ProjectPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ProjectHolderID` int(11) NOT NULL DEFAULT '0',
  `MainPhotoID` int(11) NOT NULL DEFAULT '0',
  `MainImageHasLogo` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Teaser` mediumtext,
  `SourceLink` varchar(255) DEFAULT NULL,
  `ViewLink` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `ProjectHolderID` (`ProjectHolderID`),
  KEY `MainPhotoID` (`MainPhotoID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

--
-- Dumping data for table `ProjectPage_versions`
--

INSERT INTO `ProjectPage_versions` (`ID`, `RecordID`, `Version`, `ProjectHolderID`, `MainPhotoID`, `MainImageHasLogo`, `Teaser`, `SourceLink`, `ViewLink`) VALUES
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
(24, 7, 5, 0, 4, 0, NULL, NULL, 'http://matthewkoerber.com/InnPizza/'),
(25, 10, 5, 0, 7, 0, NULL, NULL, 'http://matthewkoerber.com/games/memory/'),
(26, 11, 4, 0, 8, 0, NULL, NULL, 'http://matthewkoerber.com/games/battleship/'),
(27, 12, 5, 0, 9, 0, NULL, NULL, 'http://matthewkoerber.com/TicketDominator/'),
(28, 8, 9, 0, 0, 1, NULL, NULL, 'http://matthewkoerber.com/corestrengthrehab'),
(29, 8, 10, 0, 5, 1, NULL, NULL, 'http://matthewkoerber.com/corestrengthrehab'),
(30, 12, 6, 0, 9, 0, NULL, NULL, 'http://matthewkoerber.com/TicketDominator/index.ph'),
(31, 10, 6, 0, 7, 0, NULL, NULL, 'http://matthewkoerber.com/games/memory/index.html'),
(32, 12, 7, 0, 9, 0, NULL, NULL, 'http://matthewkoerber.com/TicketDominator/index.ph'),
(33, 11, 5, 0, 8, 0, NULL, NULL, 'http://matthewkoerber.com/games/battleship/index.h'),
(34, 11, 6, 0, 8, 0, NULL, NULL, 'http://matthewkoerber.com/games/battleship/index.html'),
(35, 12, 8, 0, 9, 0, NULL, NULL, 'http://matthewkoerber.com/TicketDominator/index.php'),
(36, 12, 9, 0, 9, 0, NULL, NULL, 'http://matthewkoerber.com/TicketDominator/'),
(37, 12, 10, 0, 9, 0, NULL, NULL, 'http://matthewkoerber.com/TicketDominator/index.php'),
(38, 10, 7, 0, 7, 0, NULL, NULL, 'http://matthewkoerber.com/games/memory/'),
(39, 12, 11, 0, 9, 0, NULL, NULL, 'http://matthewkoerber.com/TicketDominator/'),
(40, 11, 7, 0, 8, 0, NULL, NULL, 'http://matthewkoerber.com/games/battleship/');

-- --------------------------------------------------------

--
-- Table structure for table `RedirectorPage`
--

DROP TABLE IF EXISTS `RedirectorPage`;
CREATE TABLE IF NOT EXISTS `RedirectorPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RedirectionType` enum('Internal','External') DEFAULT 'Internal',
  `ExternalURL` varchar(2083) DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `LinkToID` (`LinkToID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `RedirectorPage_Live`
--

DROP TABLE IF EXISTS `RedirectorPage_Live`;
CREATE TABLE IF NOT EXISTS `RedirectorPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RedirectionType` enum('Internal','External') DEFAULT 'Internal',
  `ExternalURL` varchar(2083) DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `LinkToID` (`LinkToID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `RedirectorPage_versions`
--

DROP TABLE IF EXISTS `RedirectorPage_versions`;
CREATE TABLE IF NOT EXISTS `RedirectorPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `RedirectionType` enum('Internal','External') DEFAULT 'Internal',
  `ExternalURL` varchar(2083) DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `LinkToID` (`LinkToID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig`
--

DROP TABLE IF EXISTS `SiteConfig`;
CREATE TABLE IF NOT EXISTS `SiteConfig` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
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
  `FrameworkLink` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `SiteConfig`
--

INSERT INTO `SiteConfig` (`ID`, `ClassName`, `LastEdited`, `Created`, `Title`, `Tagline`, `Theme`, `CanViewType`, `CanEditType`, `CanCreateTopLevelType`, `LanguageLink`, `FrameworkLink`) VALUES
(1, 'SiteConfig', '2017-03-13 19:33:15', '2017-03-09 16:26:15', 'Matthew Koerber', 'Trying to come up with a tagline', 'portfolio', 'Anyone', 'LoggedInUsers', 'LoggedInUsers', 'Languages', 'Frameworks');

-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig_CreateTopLevelGroups`
--

DROP TABLE IF EXISTS `SiteConfig_CreateTopLevelGroups`;
CREATE TABLE IF NOT EXISTS `SiteConfig_CreateTopLevelGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteConfigID` (`SiteConfigID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig_EditorGroups`
--

DROP TABLE IF EXISTS `SiteConfig_EditorGroups`;
CREATE TABLE IF NOT EXISTS `SiteConfig_EditorGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteConfigID` (`SiteConfigID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig_ViewerGroups`
--

DROP TABLE IF EXISTS `SiteConfig_ViewerGroups`;
CREATE TABLE IF NOT EXISTS `SiteConfig_ViewerGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteConfigID` (`SiteConfigID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree`
--

DROP TABLE IF EXISTS `SiteTree`;
CREATE TABLE IF NOT EXISTS `SiteTree` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SiteTree','Page','ErrorPage','RedirectorPage','VirtualPage','ProjectHolder','ProjectPage') DEFAULT 'SiteTree',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `URLSegment` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `MenuTitle` varchar(100) DEFAULT NULL,
  `Content` mediumtext,
  `MetaDescription` mediumtext,
  `ExtraMeta` mediumtext,
  `ShowInMenus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ReportClass` varchar(50) DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `URLSegment` (`URLSegment`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `SiteTree`
--

INSERT INTO `SiteTree` (`ID`, `ClassName`, `LastEdited`, `Created`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `ReportClass`, `CanViewType`, `CanEditType`, `Version`, `ParentID`) VALUES
(1, 'Page', '2017-03-15 00:04:18', '2017-03-09 16:26:14', 'home', 'Home', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 2, 0),
(2, 'Page', '2017-03-14 23:57:31', '2017-03-09 16:26:14', 'bio', 'Bio', NULL, '<p>You can fill this Page out with your own content, or delete it and create your own Pages.</p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 2, 0),
(4, 'ErrorPage', '2017-03-15 01:16:03', '2017-03-09 16:26:15', 'Page-not-found', 'Page not found', NULL, '<h2 style="text-align: center;">Congratulations on finding the 404 page!</h2><p style="text-align: center;"><img class="text-center" style="font-size: 10px;" title="" src="assets/fry-clapping-with-food-futurama.gif" alt="fry clapping with food futurama" width="480" height="360"></p><p>It seems you were trying to access a Page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p><p> <a></a></p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 'Inherit', 'Inherit', 16, 0),
(5, 'ErrorPage', '2017-03-14 23:57:31', '2017-03-09 16:26:16', 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, 0, 0, 6, 0, 0, NULL, 'Inherit', 'Inherit', 1, 0),
(6, 'ProjectHolder', '2017-03-14 23:57:31', '2017-03-11 17:19:02', 'projects', 'Projects', NULL, '<p>Check out the [languagelink]langauges[/languagelink] I have used!</p><p>Check out the [frameworklink]frameworks[/frameworklink] I have used!</p>', NULL, NULL, 1, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', 11, 0),
(7, 'ProjectPage', '2017-03-14 23:57:31', '2017-03-11 17:20:16', 'village-inn-pizza', 'Village Inn Pizza', NULL, '<p>Made for the Integrated Web Concepts course. The team consisted of two graphics designers, a marketer, and a developer. <span><br></span></p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 5, 6),
(8, 'ProjectPage', '2017-03-14 23:57:31', '2017-03-11 19:56:57', 'core-strength-rehab', 'Core Strength Rehab', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 10, 6),
(9, 'Page', '2017-03-14 23:57:31', '2017-03-11 20:04:25', 'resume', 'Résumé', NULL, '<h3 style="text-align: center;">Education</h3><p><span id="docs-internal-guid-99587225-bfea-2d30-888c-e6de9951714a"><span>Lakeshore Technical College, Cleveland, Wisconsin (Web and Software Development)</span></span></p><ul><li>Currently enrolled in Web and Software Developer program</li>\n<li>Dean’s List Fall 2015, Spring 2016, Fall 2016</li>\n</ul><p> </p><p><span id="docs-internal-guid-99587225-bfea-2d30-888c-e6de9951714a">Lakeshore Technical College, Cleveland, Wisconsin (Mechanical Design)</span></p><ul><li><span id="docs-internal-guid-99587225-bff0-a942-cb22-6ce5fab83ebe"><span>graduated, Spring 2013</span></span></li>\n<li><span id="docs-internal-guid-99587225-bff0-e6a7-ce49-b502fd325c03"><span>Dean’s List, Fall 2011, Spring 2012, Fall 2012</span></span></li>\n</ul><p> </p><p><span><span><span id="docs-internal-guid-99587225-bff4-7525-ea24-bb818188eccf"><span>Graduated from Sheboygan Christian School, 2011</span></span></span></span></p><p> </p><h3 style="text-align: center;"><span><span><span><span>Skills</span></span></span></span></h3><ul><li>Knowledge of CSS, SCSS, Bootstrap, and HTML</li>\n<li>Knowledge of PHP, SQL, Wordpress, SilverStripe</li>\n<li>Knowledge of APS.Net and C#</li>\n<li>Knowledge of Java and Android development</li>\n<li>Knowledge of git</li>\n<li>Basic knowledge of Microsoft Access</li>\n</ul><p> </p>', NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 16, 0),
(10, 'ProjectPage', '2017-03-14 23:57:31', '2017-03-11 23:35:47', 'memory', 'Memory', NULL, NULL, NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 7, 6),
(11, 'ProjectPage', '2017-03-14 23:57:31', '2017-03-11 23:39:27', 'one-person-battleship', 'One Person Battleship', NULL, NULL, NULL, NULL, 1, 1, 5, 0, 0, NULL, 'Inherit', 'Inherit', 7, 6),
(12, 'ProjectPage', '2017-03-14 23:57:31', '2017-03-11 23:40:36', 'ticket-dominator', 'Ticket Dominator', NULL, NULL, NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 11, 6);

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_EditorGroups`
--

DROP TABLE IF EXISTS `SiteTree_EditorGroups`;
CREATE TABLE IF NOT EXISTS `SiteTree_EditorGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_ImageTracking`
--

DROP TABLE IF EXISTS `SiteTree_ImageTracking`;
CREATE TABLE IF NOT EXISTS `SiteTree_ImageTracking` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `FileID` int(11) NOT NULL DEFAULT '0',
  `FieldName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `FileID` (`FileID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=56 ;

--
-- Dumping data for table `SiteTree_ImageTracking`
--

INSERT INTO `SiteTree_ImageTracking` (`ID`, `SiteTreeID`, `FileID`, `FieldName`) VALUES
(55, 4, 10, 'Content');

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_LinkTracking`
--

DROP TABLE IF EXISTS `SiteTree_LinkTracking`;
CREATE TABLE IF NOT EXISTS `SiteTree_LinkTracking` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `ChildID` int(11) NOT NULL DEFAULT '0',
  `FieldName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `ChildID` (`ChildID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_Live`
--

DROP TABLE IF EXISTS `SiteTree_Live`;
CREATE TABLE IF NOT EXISTS `SiteTree_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SiteTree','Page','ErrorPage','RedirectorPage','VirtualPage','ProjectHolder','ProjectPage') DEFAULT 'SiteTree',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `URLSegment` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `MenuTitle` varchar(100) DEFAULT NULL,
  `Content` mediumtext,
  `MetaDescription` mediumtext,
  `ExtraMeta` mediumtext,
  `ShowInMenus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ReportClass` varchar(50) DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `URLSegment` (`URLSegment`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `SiteTree_Live`
--

INSERT INTO `SiteTree_Live` (`ID`, `ClassName`, `LastEdited`, `Created`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `ReportClass`, `CanViewType`, `CanEditType`, `Version`, `ParentID`) VALUES
(1, 'Page', '2017-03-15 00:04:18', '2017-03-09 16:26:14', 'home', 'Home', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 2, 0),
(2, 'Page', '2017-03-11 20:04:15', '2017-03-09 16:26:14', 'bio', 'Bio', NULL, '<p>You can fill this Page out with your own content, or delete it and create your own Pages.</p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 2, 0),
(4, 'ErrorPage', '2017-03-15 01:16:03', '2017-03-09 16:26:15', 'Page-not-found', 'Page not found', NULL, '<h2 style="text-align: center;">Congratulations on finding the 404 page!</h2><p style="text-align: center;"><img class="text-center" style="font-size: 10px;" title="" src="assets/fry-clapping-with-food-futurama.gif" alt="fry clapping with food futurama" width="480" height="360"></p><p>It seems you were trying to access a Page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p><p> <a></a></p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 'Inherit', 'Inherit', 16, 0),
(5, 'ErrorPage', '2017-03-09 16:26:16', '2017-03-09 16:26:16', 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, 0, 0, 6, 0, 0, NULL, 'Inherit', 'Inherit', 1, 0),
(6, 'ProjectHolder', '2017-03-14 21:07:39', '2017-03-11 17:19:02', 'projects', 'Projects', NULL, '<p>Check out the [languagelink]langauges[/languagelink] I have used!</p><p>Check out the [frameworklink]frameworks[/frameworklink] I have used!</p>', NULL, NULL, 1, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', 11, 0),
(7, 'ProjectPage', '2017-03-14 00:46:48', '2017-03-11 17:20:16', 'village-inn-pizza', 'Village Inn Pizza', NULL, '<p>Made for the Integrated Web Concepts course. The team consisted of two graphics designers, a marketer, and a developer. <span><br></span></p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 5, 6),
(8, 'ProjectPage', '2017-03-14 19:27:15', '2017-03-11 19:56:57', 'core-strength-rehab', 'Core Strength Rehab', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 10, 6),
(9, 'Page', '2017-03-12 00:52:38', '2017-03-11 20:04:25', 'resume', 'Résumé', NULL, '<h3 style="text-align: center;">Education</h3><p><span id="docs-internal-guid-99587225-bfea-2d30-888c-e6de9951714a"><span>Lakeshore Technical College, Cleveland, Wisconsin (Web and Software Development)</span></span></p><ul><li>Currently enrolled in Web and Software Developer program</li>\n<li>Dean’s List Fall 2015, Spring 2016, Fall 2016</li>\n</ul><p> </p><p><span id="docs-internal-guid-99587225-bfea-2d30-888c-e6de9951714a">Lakeshore Technical College, Cleveland, Wisconsin (Mechanical Design)</span></p><ul><li><span id="docs-internal-guid-99587225-bff0-a942-cb22-6ce5fab83ebe"><span>graduated, Spring 2013</span></span></li>\n<li><span id="docs-internal-guid-99587225-bff0-e6a7-ce49-b502fd325c03"><span>Dean’s List, Fall 2011, Spring 2012, Fall 2012</span></span></li>\n</ul><p> </p><p><span><span><span id="docs-internal-guid-99587225-bff4-7525-ea24-bb818188eccf"><span>Graduated from Sheboygan Christian School, 2011</span></span></span></span></p><p> </p><h3 style="text-align: center;"><span><span><span><span>Skills</span></span></span></span></h3><ul><li>Knowledge of CSS, SCSS, Bootstrap, and HTML</li>\n<li>Knowledge of PHP, SQL, Wordpress, SilverStripe</li>\n<li>Knowledge of APS.Net and C#</li>\n<li>Knowledge of Java and Android development</li>\n<li>Knowledge of git</li>\n<li>Basic knowledge of Microsoft Access</li>\n</ul><p> </p>', NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 16, 0),
(10, 'ProjectPage', '2017-03-14 22:35:04', '2017-03-11 23:35:47', 'memory', 'Memory', NULL, NULL, NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 7, 6),
(11, 'ProjectPage', '2017-03-14 22:35:26', '2017-03-11 23:39:27', 'one-person-battleship', 'One Person Battleship', NULL, NULL, NULL, NULL, 1, 1, 5, 0, 0, NULL, 'Inherit', 'Inherit', 7, 6),
(12, 'ProjectPage', '2017-03-14 22:35:14', '2017-03-11 23:40:36', 'ticket-dominator', 'Ticket Dominator', NULL, NULL, NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 11, 6);

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_versions`
--

DROP TABLE IF EXISTS `SiteTree_versions`;
CREATE TABLE IF NOT EXISTS `SiteTree_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `WasPublished` tinyint(1) unsigned NOT NULL DEFAULT '0',
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
  `ShowInMenus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ReportClass` varchar(50) DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `AuthorID` (`AuthorID`),
  KEY `PublisherID` (`PublisherID`),
  KEY `ParentID` (`ParentID`),
  KEY `URLSegment` (`URLSegment`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=91 ;

--
-- Dumping data for table `SiteTree_versions`
--

INSERT INTO `SiteTree_versions` (`ID`, `RecordID`, `Version`, `WasPublished`, `AuthorID`, `PublisherID`, `ClassName`, `LastEdited`, `Created`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `ReportClass`, `CanViewType`, `CanEditType`, `ParentID`) VALUES
(1, 1, 1, 1, 0, 0, 'Page', '2017-03-09 16:26:14', '2017-03-09 16:26:14', 'home', 'Home', NULL, '<p>Welcome to SilverStripe! This is the default homePage. You can edit this Page by opening <a href="admin/">the CMS</a>.</p><p>You can now access the <a href="http://docs.silverstripe.org">developer documentation</a>, or begin the <a href="http://www.silverstripe.org/learn/lessons">SilverStripe lessons</a>.</p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(2, 2, 1, 1, 0, 0, 'Page', '2017-03-09 16:26:14', '2017-03-09 16:26:14', 'about-us', 'About Us', NULL, '<p>You can fill this Page out with your own content, or delete it and create your own Pages.<br></p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(3, 3, 1, 1, 0, 0, 'Page', '2017-03-09 16:26:15', '2017-03-09 16:26:15', 'contact-us', 'Contact Us', NULL, '<p>You can fill this Page out with your own content, or delete it and create your own Pages.<br></p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(4, 4, 1, 1, 0, 0, 'ErrorPage', '2017-03-09 16:26:15', '2017-03-09 16:26:15', 'Page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a Page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, 0, 0, 4, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(5, 5, 1, 1, 0, 0, 'ErrorPage', '2017-03-09 16:26:16', '2017-03-09 16:26:16', 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(6, 6, 1, 0, 1, 0, 'ProjectHolder', '2017-03-11 17:19:02', '2017-03-11 17:19:02', 'new-Project-holder', 'New Project Holder', NULL, NULL, NULL, NULL, 1, 1, 6, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(7, 6, 2, 1, 1, 1, 'ProjectHolder', '2017-03-11 17:19:14', '2017-03-11 17:19:02', 'Projects', 'Projects', NULL, NULL, NULL, NULL, 1, 1, 6, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(8, 7, 1, 0, 1, 0, 'ProjectPage', '2017-03-11 17:20:16', '2017-03-11 17:20:16', 'new-Project-Page', 'New Project Page', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(9, 7, 2, 1, 1, 1, 'ProjectPage', '2017-03-11 17:33:56', '2017-03-11 17:20:16', 'village-inn-pizza', 'Village Inn Pizza', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(10, 7, 3, 1, 1, 1, 'ProjectPage', '2017-03-11 19:56:52', '2017-03-11 17:20:16', 'village-inn-pizza', 'Village Inn Pizza', NULL, '<p>Made for the Integrated Web Concepts course. The team consisted of two graphics designers, a marketer, and a developer. <span><br></span></p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(11, 8, 1, 0, 1, 0, 'ProjectPage', '2017-03-11 19:56:57', '2017-03-11 19:56:57', 'new-Project-Page', 'New Project Page', NULL, NULL, NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(12, 8, 2, 1, 1, 1, 'ProjectPage', '2017-03-11 19:57:12', '2017-03-11 19:56:57', 'core-strength-rehab', 'Core Strength Rehab', NULL, NULL, NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(13, 2, 2, 1, 1, 1, 'Page', '2017-03-11 20:04:15', '2017-03-09 16:26:14', 'bio', 'Bio', NULL, '<p>You can fill this Page out with your own content, or delete it and create your own Pages.</p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(14, 9, 1, 0, 1, 0, 'Page', '2017-03-11 20:04:25', '2017-03-11 20:04:25', 'new-Page', 'New Page', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 2),
(15, 9, 2, 1, 1, 1, 'Page', '2017-03-11 20:05:26', '2017-03-11 20:04:25', 'resume', 'Résumé', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 2),
(16, 9, 3, 1, 1, 1, 'Page', '2017-03-11 20:05:36', '2017-03-11 20:04:25', 'resume', 'Résumé', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(17, 9, 4, 1, 1, 1, 'Page', '2017-03-11 20:05:41', '2017-03-11 20:04:25', 'resume', 'Résumé', NULL, NULL, NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(18, 7, 4, 1, 1, 1, 'ProjectPage', '2017-03-11 20:29:27', '2017-03-11 17:20:16', 'village-inn-pizza', 'Village Inn Pizza', NULL, '<p>Made for the Integrated Web Concepts course. The team consisted of two graphics designers, a marketer, and a developer. <span><br></span></p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(19, 10, 1, 0, 1, 0, 'ProjectPage', '2017-03-11 23:35:47', '2017-03-11 23:35:47', 'new-Project-Page', 'New Project Page', NULL, NULL, NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(20, 10, 2, 1, 1, 1, 'ProjectPage', '2017-03-11 23:39:15', '2017-03-11 23:35:47', 'memory', 'Memory', NULL, NULL, NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(21, 11, 1, 0, 1, 0, 'ProjectPage', '2017-03-11 23:39:27', '2017-03-11 23:39:27', 'new-Project-Page', 'New Project Page', NULL, NULL, NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(22, 11, 2, 1, 1, 1, 'ProjectPage', '2017-03-11 23:39:50', '2017-03-11 23:39:27', 'one-person-battleship', 'One Person Battleship', NULL, NULL, NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(23, 12, 1, 0, 1, 0, 'ProjectPage', '2017-03-11 23:40:36', '2017-03-11 23:40:36', 'new-Project-Page', 'New Project Page', NULL, NULL, NULL, NULL, 1, 1, 5, 0, 0, NULL, 'Inherit', 'Inherit', 6),
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
(47, 6, 3, 1, 1, 1, 'ProjectHolder', '2017-03-13 21:36:25', '2017-03-11 17:19:02', 'Projects', 'Projects', NULL, '<p>[Languagelink]Langauges[/Languagelink]</p>', NULL, NULL, 1, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(48, 6, 4, 1, 1, 1, 'ProjectHolder', '2017-03-13 21:37:28', '2017-03-11 17:19:02', 'Projects', 'Projects', NULL, '<p>Check out the [Languagelink]Langauges[/Languagelink] I have used!</p>', NULL, NULL, 1, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(49, 6, 5, 1, 1, 1, 'ProjectHolder', '2017-03-13 21:39:33', '2017-03-11 17:19:02', 'Projects', 'Projects', NULL, '<p>Check out the [Languagelink]Langauges[/Languagelink] I have used!</p><p>Check out the [Frameworklink]Frameworks[/Frameworklink] I have used!</p>', NULL, NULL, 1, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(50, 6, 6, 1, 1, 1, 'ProjectHolder', '2017-03-13 21:47:24', '2017-03-11 17:19:02', 'Projects', 'Projects', NULL, '<p>Check out the [Languagelink]langauges[/Languagelink] I have used!</p><p>Check out the [Frameworklink]Frameworks[/Frameworklink] I have used!</p>', NULL, NULL, 1, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(51, 8, 8, 1, 1, 1, 'ProjectPage', '2017-03-13 23:55:50', '2017-03-11 19:56:57', 'core-strength-rehab', 'Core Strength Rehab', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(52, 7, 5, 1, 1, 1, 'ProjectPage', '2017-03-14 00:46:47', '2017-03-11 17:20:16', 'village-inn-pizza', 'Village Inn Pizza', NULL, '<p>Made for the Integrated Web Concepts course. The team consisted of two graphics designers, a marketer, and a developer. <span><br></span></p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(53, 10, 5, 1, 1, 1, 'ProjectPage', '2017-03-14 14:16:36', '2017-03-11 23:35:47', 'memory', 'Memory', NULL, NULL, NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(54, 11, 4, 1, 1, 1, 'ProjectPage', '2017-03-14 14:16:50', '2017-03-11 23:39:27', 'one-person-battleship', 'One Person Battleship', NULL, NULL, NULL, NULL, 1, 1, 5, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(55, 12, 5, 1, 1, 1, 'ProjectPage', '2017-03-14 14:17:13', '2017-03-11 23:40:36', 'ticket-dominator', 'Ticket Dominator', NULL, NULL, NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(56, 6, 7, 1, 1, 1, 'ProjectHolder', '2017-03-14 18:56:50', '2017-03-11 17:19:02', 'projects', 'Projects', NULL, '<p>Check out the [Languagelink]langauges[/Languagelink] I have used!</p><p>Check out the [Frameworklink]Frameworks[/Frameworklink] I have used!</p>', NULL, NULL, 1, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(57, 6, 8, 1, 1, 1, 'ProjectHolder', '2017-03-14 19:13:28', '2017-03-11 17:19:02', 'projects', 'Projects', NULL, '<p>Check out the [Languagelink]langauges[/Languagelink] I have used!</p><p>Check out the [Frameworklink]Frameworks[/Frameworklink] I have used!</p>', NULL, NULL, 1, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(58, 6, 9, 1, 1, 1, 'ProjectHolder', '2017-03-14 19:13:43', '2017-03-11 17:19:02', 'projects', 'Projects', NULL, '<p>Check out the [Languagelink]langauges[/Languagelink] I have used!</p><p>Check out the [Frameworklink]Frameworks[/Frameworklink] I have used!</p>', NULL, NULL, 1, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(59, 6, 10, 1, 1, 1, 'ProjectHolder', '2017-03-14 19:14:34', '2017-03-11 17:19:02', 'projects', 'Projects', NULL, '<p>Check out the [languagelink]langauges[/languagelink] I have used!</p><p>Check out the [frameworklink]Frameworks[/frameworklink] I have used!</p>', NULL, NULL, 1, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(60, 8, 9, 1, 1, 1, 'ProjectPage', '2017-03-14 19:25:42', '2017-03-11 19:56:57', 'core-strength-rehab', 'Core Strength Rehab', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(61, 8, 10, 1, 1, 1, 'ProjectPage', '2017-03-14 19:27:15', '2017-03-11 19:56:57', 'core-strength-rehab', 'Core Strength Rehab', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(62, 12, 6, 1, 1, 1, 'ProjectPage', '2017-03-14 19:38:11', '2017-03-11 23:40:36', 'ticket-dominator', 'Ticket Dominator', NULL, NULL, NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(63, 10, 6, 1, 1, 1, 'ProjectPage', '2017-03-14 19:38:22', '2017-03-11 23:35:47', 'memory', 'Memory', NULL, NULL, NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(64, 12, 7, 1, 1, 1, 'ProjectPage', '2017-03-14 19:38:29', '2017-03-11 23:40:36', 'ticket-dominator', 'Ticket Dominator', NULL, NULL, NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(65, 11, 5, 1, 1, 1, 'ProjectPage', '2017-03-14 19:38:40', '2017-03-11 23:39:27', 'one-person-battleship', 'One Person Battleship', NULL, NULL, NULL, NULL, 1, 1, 5, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(66, 11, 6, 1, 1, 1, 'ProjectPage', '2017-03-14 19:42:20', '2017-03-11 23:39:27', 'one-person-battleship', 'One Person Battleship', NULL, NULL, NULL, NULL, 1, 1, 5, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(67, 12, 8, 1, 1, 1, 'ProjectPage', '2017-03-14 19:43:03', '2017-03-11 23:40:36', 'ticket-dominator', 'Ticket Dominator', NULL, NULL, NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(68, 6, 11, 1, 1, 1, 'ProjectHolder', '2017-03-14 21:07:39', '2017-03-11 17:19:02', 'projects', 'Projects', NULL, '<p>Check out the [languagelink]langauges[/languagelink] I have used!</p><p>Check out the [frameworklink]frameworks[/frameworklink] I have used!</p>', NULL, NULL, 1, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(69, 12, 9, 1, 1, 1, 'ProjectPage', '2017-03-14 21:14:24', '2017-03-11 23:40:36', 'ticket-dominator', 'Ticket Dominator', NULL, NULL, NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(70, 12, 10, 1, 1, 1, 'ProjectPage', '2017-03-14 21:15:06', '2017-03-11 23:40:36', 'ticket-dominator', 'Ticket Dominator', NULL, NULL, NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(71, 13, 1, 0, 1, 0, 'VirtualPage', '2017-03-14 21:28:45', '2017-03-14 21:28:45', 'new-virtual-page', 'New Virtual Page', NULL, NULL, NULL, NULL, 1, 1, 8, 0, 1, NULL, 'Inherit', 'Inherit', 0),
(72, 10, 7, 1, 1, 1, 'ProjectPage', '2017-03-14 22:35:04', '2017-03-11 23:35:47', 'memory', 'Memory', NULL, NULL, NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(73, 12, 11, 1, 1, 1, 'ProjectPage', '2017-03-14 22:35:14', '2017-03-11 23:40:36', 'ticket-dominator', 'Ticket Dominator', NULL, NULL, NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(74, 11, 7, 1, 1, 1, 'ProjectPage', '2017-03-14 22:35:26', '2017-03-11 23:39:27', 'one-person-battleship', 'One Person Battleship', NULL, NULL, NULL, NULL, 1, 1, 5, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(75, 4, 2, 1, 1, 1, 'ErrorPage', '2017-03-14 23:43:40', '2017-03-09 16:26:15', 'Page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a Page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p><p><img class="center" title="" src="assets/Iron-Giant.gif" alt="Iron_Giant.gif" width="587" height="298"></p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(76, 4, 3, 1, 1, 1, 'ErrorPage', '2017-03-14 23:45:19', '2017-03-09 16:26:15', 'Page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a Page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p><p> </p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(77, 4, 4, 1, 1, 1, 'ErrorPage', '2017-03-14 23:58:08', '2017-03-09 16:26:15', 'Page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a Page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p><p> <a></a></p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(78, 4, 5, 1, 1, 1, 'ErrorPage', '2017-03-14 23:58:41', '2017-03-09 16:26:15', 'Page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a Page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p><p> <img class="center" title="" src="assets/_resampled/ResizedImageWzU4NywyOTdd/Iron-Giant.gif" alt="Iron Giant" width="587" height="297"><a></a></p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(79, 4, 6, 1, 1, 1, 'ErrorPage', '2017-03-15 00:00:22', '2017-03-09 16:26:15', 'Page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a Page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p><p> <img class="center" title="" src="assets/_resampled/ResizedImageWzU4NiwyOTZd/Iron-Giant.gif" alt="Iron Giant" width="586" height="296"><a></a></p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(80, 4, 7, 1, 1, 1, 'ErrorPage', '2017-03-15 00:00:48', '2017-03-09 16:26:15', 'Page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a Page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p><p> <img class="center" title="" src="assets/_resampled/ResizedImageWzU4OCwyOTdd/Iron-Giant.gif" alt="Iron Giant" width="588" height="297"><a></a></p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(81, 4, 8, 1, 1, 1, 'ErrorPage', '2017-03-15 00:02:13', '2017-03-09 16:26:15', 'Page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a Page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p><p> <a></a></p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(82, 1, 2, 1, 1, 1, 'Page', '2017-03-15 00:04:18', '2017-03-09 16:26:14', 'home', 'Home', NULL, '<p>Welcome to SilverStripe! This is the default homePage. You can edit this Page by opening <a href="admin/">the CMS</a>.</p><p>You can now access the <a href="http://docs.silverstripe.org">developer documentation</a>, or begin the <a href="http://www.silverstripe.org/learn/lessons">SilverStripe lessons</a>.</p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(83, 4, 9, 1, 1, 1, 'ErrorPage', '2017-03-15 01:08:19', '2017-03-09 16:26:15', 'Page-not-found', 'Page not found', NULL, '<h2 style="text-align: center;">Congratulations on finding the 404 page!</h2><p><a></a><img class="center" title="" src="assets/fry-clapping-with-food-futurama.gif" alt="fry clapping with food futurama" width="480" height="360"></p><p>Sorry, it seems you were trying to access a Page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p><p> <a></a></p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(84, 4, 10, 1, 1, 1, 'ErrorPage', '2017-03-15 01:08:36', '2017-03-09 16:26:15', 'Page-not-found', 'Page not found', NULL, '<h2 style="text-align: center;">Congratulations on finding the 404 page!</h2><p><a></a><img class="center" title="" src="assets/fry-clapping-with-food-futurama.gif" alt="fry clapping with food futurama" width="480" height="360"></p><p>It seems you were trying to access a Page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p><p> <a></a></p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(85, 4, 11, 1, 1, 1, 'ErrorPage', '2017-03-15 01:13:10', '2017-03-09 16:26:15', 'Page-not-found', 'Page not found', NULL, '<h2 style="text-align: center;">Congratulations on finding the 404 page!</h2><p><a></a><img class="text-center" title="" src="assets/fry-clapping-with-food-futurama.gif" alt="fry clapping with food futurama" width="480" height="360"></p><p>It seems you were trying to access a Page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p><p> <a></a></p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(86, 4, 12, 1, 1, 1, 'ErrorPage', '2017-03-15 01:13:33', '2017-03-09 16:26:15', 'Page-not-found', 'Page not found', NULL, '<h2 style="text-align: center;">Congratulations on finding the 404 page!<img class="text-center" style="font-size: 10px;" title="" src="assets/fry-clapping-with-food-futurama.gif" alt="fry clapping with food futurama" width="480" height="360"></h2><p>It seems you were trying to access a Page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p><p> <a></a></p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(87, 4, 13, 1, 1, 1, 'ErrorPage', '2017-03-15 01:13:45', '2017-03-09 16:26:15', 'Page-not-found', 'Page not found', NULL, '<h2 style="text-align: center;">Congratulations on finding the 404 page!</h2><h2 style="text-align: center;"><img class="text-center" style="font-size: 10px;" title="" src="assets/fry-clapping-with-food-futurama.gif" alt="fry clapping with food futurama" width="480" height="360"></h2><p>It seems you were trying to access a Page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p><p> <a></a></p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(88, 4, 14, 1, 1, 1, 'ErrorPage', '2017-03-15 01:14:01', '2017-03-09 16:26:15', 'Page-not-found', 'Page not found', NULL, '<h2 style="text-align: center;">Congratulations on finding the 404 page!</h2><p> </p><h2 style="text-align: center;"><img class="text-center" style="font-size: 10px;" title="" src="assets/fry-clapping-with-food-futurama.gif" alt="fry clapping with food futurama" width="480" height="360"></h2><p>It seems you were trying to access a Page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p><p> <a></a></p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(89, 4, 15, 1, 1, 1, 'ErrorPage', '2017-03-15 01:14:16', '2017-03-09 16:26:15', 'Page-not-found', 'Page not found', NULL, '<h2 style="text-align: center;">Congratulations on finding the 404 page!</h2><h2 style="text-align: center;"><img class="text-center" style="font-size: 10px;" title="" src="assets/fry-clapping-with-food-futurama.gif" alt="fry clapping with food futurama" width="480" height="360"></h2><p>It seems you were trying to access a Page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p><p> <a></a></p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(90, 4, 16, 1, 1, 1, 'ErrorPage', '2017-03-15 01:16:03', '2017-03-09 16:26:15', 'Page-not-found', 'Page not found', NULL, '<h2 style="text-align: center;">Congratulations on finding the 404 page!</h2><p style="text-align: center;"><img class="text-center" style="font-size: 10px;" title="" src="assets/fry-clapping-with-food-futurama.gif" alt="fry clapping with food futurama" width="480" height="360"></p><p>It seems you were trying to access a Page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p><p> <a></a></p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 'Inherit', 'Inherit', 0);

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_ViewerGroups`
--

DROP TABLE IF EXISTS `SiteTree_ViewerGroups`;
CREATE TABLE IF NOT EXISTS `SiteTree_ViewerGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `VirtualPage`
--

DROP TABLE IF EXISTS `VirtualPage`;
CREATE TABLE IF NOT EXISTS `VirtualPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CopyContentFromID` (`CopyContentFromID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Table structure for table `VirtualPage_Live`
--

DROP TABLE IF EXISTS `VirtualPage_Live`;
CREATE TABLE IF NOT EXISTS `VirtualPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CopyContentFromID` (`CopyContentFromID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `VirtualPage_versions`
--

DROP TABLE IF EXISTS `VirtualPage_versions`;
CREATE TABLE IF NOT EXISTS `VirtualPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `CopyContentFromID` (`CopyContentFromID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `VirtualPage_versions`
--

INSERT INTO `VirtualPage_versions` (`ID`, `RecordID`, `Version`, `VersionID`, `CopyContentFromID`) VALUES
(1, 13, 1, 0, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
